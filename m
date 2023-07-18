Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF44A757CB8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:04:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H0mfzMjy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zgL4HKTz3dGZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:04:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H0mfzMjy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zYx0S81z3bT1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 22:59:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A1206154D;
	Tue, 18 Jul 2023 12:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723EDC433C7;
	Tue, 18 Jul 2023 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685186;
	bh=ZfST7iYgGSVxQXIKFUE8GGgJqk+8wO7TImnKkDtL050=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H0mfzMjyYZlQGPdszuRdu62VILS5CPejfVw/MXytLmRrMQv5PgNzwk2iwZpRZLXlp
	 wru/nad4s0s5Y8Y6J5g6cJUHsSqL6eOQxn8Kaoxv/ZsjZxatbeJZmaHpRwaxh5Ky8v
	 WvEssu2gesmXXPir1KAOU+yWW+ePAmnf2cwYZ+t8IxfxyoiqrQKSfM4b+BBnYOS+xP
	 HOpccRxi/la0CSmPCVhMrJa1wIqMzVXkOL3gW6MLEIky062Mm2tkPFykfcM8ikTbDd
	 wam1APZNK1a/7s0iTqlitrZ17hTIsNi9Ui1wk130bm5DrS6lYJSHS4otRr7YESTOse
	 bOhzzTZjeySKg==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 04/21] net: ipcomp: Migrate to acomp API from deprecated comp API
Date: Tue, 18 Jul 2023 14:58:30 +0200
Message-Id: <20230718125847.3869700-5-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9425; i=ardb@kernel.org; h=from:subject; bh=ZfST7iYgGSVxQXIKFUE8GGgJqk+8wO7TImnKkDtL050=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT+Hf0Dhvlkynp4s3BUtrTrj+KCuVuT/uwxau5T8en DPlvxTdUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACayT4KRYa4fh+nN5tdlZ0uT 4xSs1jittGf/GJ/XZNeW9l7io8xmI0aGH2LSF9fJVrprqObcZz32V2uHbtz644cX9HerciXsnDC HFwA=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>, qat-linux@intel.com, Eric Biggers <ebiggers@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kees Cook <keescook@chromium.org>, linux-block@vger.kernel.org, Nick Terrell <terrelln@fb.com>, Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Migrate the IPcomp network compression code to the acomp API, in order
to drop the dependency on the obsolete 'comp' API which is going away.

For the time being, this is a rather mechanical conversion replacing
each comp TFM object with an acomp TFM/request object pair - this is
necessary because, at this point, there is still a 1:1 relation between
acomp tranforms and requests in the acomp-to-scomp adaptation layer, and
this deviates from the model used by AEADs and skciphers where the TFM
is fully reentrant, and operations using the same encryption keys can be
issued in parallel using individual request objects but the same TFM.

Also, this minimal conversion does not yet take advantage of the fact
that the acomp API takes scatterlists as input and output descriptors,
which in principle removes the need to linearize the SKBs. However,
given that compression code generally requires in- and output buffers to
be non-overlapping, scratch buffers will always be needed, and so
whether this conversion is worth while is TBD.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/crypto/acompress.h |   5 +
 include/net/ipcomp.h       |   4 +-
 net/xfrm/xfrm_algo.c       |   7 +-
 net/xfrm/xfrm_ipcomp.c     | 107 +++++++++++++-------
 4 files changed, 79 insertions(+), 44 deletions(-)

diff --git a/include/crypto/acompress.h b/include/crypto/acompress.h
index ccb6f3279bc8b32e..3f54e3d8815a9d0d 100644
--- a/include/crypto/acompress.h
+++ b/include/crypto/acompress.h
@@ -318,4 +318,9 @@ static inline int crypto_acomp_decompress(struct acomp_req *req)
 	return crypto_comp_errstat(alg, tfm->decompress(req));
 }
 
+static inline const char *crypto_acomp_name(struct crypto_acomp *acomp)
+{
+       return crypto_tfm_alg_name(crypto_acomp_tfm(acomp));
+}
+
 #endif
diff --git a/include/net/ipcomp.h b/include/net/ipcomp.h
index 8660a2a6d1fc76a7..bf27ac7e3ca952e2 100644
--- a/include/net/ipcomp.h
+++ b/include/net/ipcomp.h
@@ -7,12 +7,12 @@
 
 #define IPCOMP_SCRATCH_SIZE     65400
 
-struct crypto_comp;
+struct acomp_req;
 struct ip_comp_hdr;
 
 struct ipcomp_data {
 	u16 threshold;
-	struct crypto_comp * __percpu *tfms;
+	struct acomp_req * __percpu *reqs;
 };
 
 struct ip_comp_hdr;
diff --git a/net/xfrm/xfrm_algo.c b/net/xfrm/xfrm_algo.c
index 094734fbec967505..ca411bcebc53ad4f 100644
--- a/net/xfrm/xfrm_algo.c
+++ b/net/xfrm/xfrm_algo.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
  */
 
+#include <crypto/acompress.h>
 #include <crypto/hash.h>
 #include <crypto/skcipher.h>
 #include <linux/module.h>
@@ -674,7 +675,7 @@ static const struct xfrm_algo_list xfrm_ealg_list = {
 static const struct xfrm_algo_list xfrm_calg_list = {
 	.algs = calg_list,
 	.entries = ARRAY_SIZE(calg_list),
-	.type = CRYPTO_ALG_TYPE_COMPRESS,
+	.type = CRYPTO_ALG_TYPE_ACOMPRESS,
 	.mask = CRYPTO_ALG_TYPE_MASK,
 };
 
@@ -833,8 +834,8 @@ void xfrm_probe_algs(void)
 	}
 
 	for (i = 0; i < calg_entries(); i++) {
-		status = crypto_has_comp(calg_list[i].name, 0,
-					 CRYPTO_ALG_ASYNC);
+		status = crypto_has_acomp(calg_list[i].name, 0,
+					  CRYPTO_ALG_ASYNC);
 		if (calg_list[i].available != status)
 			calg_list[i].available = status;
 	}
diff --git a/net/xfrm/xfrm_ipcomp.c b/net/xfrm/xfrm_ipcomp.c
index 9c0fa0e1786a2d42..e29ef55e0f01d144 100644
--- a/net/xfrm/xfrm_ipcomp.c
+++ b/net/xfrm/xfrm_ipcomp.c
@@ -20,20 +20,21 @@
 #include <linux/slab.h>
 #include <linux/smp.h>
 #include <linux/vmalloc.h>
+#include <crypto/acompress.h>
 #include <net/ip.h>
 #include <net/ipcomp.h>
 #include <net/xfrm.h>
 
-struct ipcomp_tfms {
+struct ipcomp_reqs {
 	struct list_head list;
-	struct crypto_comp * __percpu *tfms;
+	struct acomp_req * __percpu *reqs;
 	int users;
 };
 
 static DEFINE_MUTEX(ipcomp_resource_mutex);
 static void * __percpu *ipcomp_scratches;
 static int ipcomp_scratch_users;
-static LIST_HEAD(ipcomp_tfms_list);
+static LIST_HEAD(ipcomp_reqs_list);
 
 static int ipcomp_decompress(struct xfrm_state *x, struct sk_buff *skb)
 {
@@ -42,13 +43,19 @@ static int ipcomp_decompress(struct xfrm_state *x, struct sk_buff *skb)
 	int dlen = IPCOMP_SCRATCH_SIZE;
 	const u8 *start = skb->data;
 	u8 *scratch = *this_cpu_ptr(ipcomp_scratches);
-	struct crypto_comp *tfm = *this_cpu_ptr(ipcd->tfms);
-	int err = crypto_comp_decompress(tfm, start, plen, scratch, &dlen);
-	int len;
+	struct acomp_req *req = *this_cpu_ptr(ipcd->reqs);
+	struct scatterlist sg_in, sg_out;
+	int err, len;
 
+	sg_init_one(&sg_in, start, plen);
+	sg_init_one(&sg_out, scratch, dlen);
+	acomp_request_set_params(req, &sg_in, &sg_out, plen, dlen);
+
+	err = crypto_acomp_decompress(req);
 	if (err)
 		return err;
 
+	dlen = req->dlen;
 	if (dlen < (plen + sizeof(struct ip_comp_hdr)))
 		return -EINVAL;
 
@@ -125,17 +132,24 @@ static int ipcomp_compress(struct xfrm_state *x, struct sk_buff *skb)
 	const int plen = skb->len;
 	int dlen = IPCOMP_SCRATCH_SIZE;
 	u8 *start = skb->data;
-	struct crypto_comp *tfm;
+	struct acomp_req *req = *this_cpu_ptr(ipcd->reqs);
+	struct scatterlist sg_in, sg_out;
 	u8 *scratch;
 	int err;
 
 	local_bh_disable();
 	scratch = *this_cpu_ptr(ipcomp_scratches);
-	tfm = *this_cpu_ptr(ipcd->tfms);
-	err = crypto_comp_compress(tfm, start, plen, scratch, &dlen);
+	req = *this_cpu_ptr(ipcd->reqs);
+
+	sg_init_one(&sg_in, start, plen);
+	sg_init_one(&sg_out, scratch, dlen);
+	acomp_request_set_params(req, &sg_in, &sg_out, plen, dlen);
+
+	err = crypto_acomp_compress(req);
 	if (err)
 		goto out;
 
+	dlen = req->dlen;
 	if ((dlen + sizeof(struct ip_comp_hdr)) >= plen) {
 		err = -EMSGSIZE;
 		goto out;
@@ -229,17 +243,17 @@ static void * __percpu *ipcomp_alloc_scratches(void)
 	return scratches;
 }
 
-static void ipcomp_free_tfms(struct crypto_comp * __percpu *tfms)
+static void ipcomp_free_reqs(struct acomp_req * __percpu *reqs)
 {
-	struct ipcomp_tfms *pos;
+	struct ipcomp_reqs *pos;
 	int cpu;
 
-	list_for_each_entry(pos, &ipcomp_tfms_list, list) {
-		if (pos->tfms == tfms)
+	list_for_each_entry(pos, &ipcomp_reqs_list, list) {
+		if (pos->reqs == reqs)
 			break;
 	}
 
-	WARN_ON(list_entry_is_head(pos, &ipcomp_tfms_list, list));
+	WARN_ON(list_entry_is_head(pos, &ipcomp_reqs_list, list));
 
 	if (--pos->users)
 		return;
@@ -247,32 +261,39 @@ static void ipcomp_free_tfms(struct crypto_comp * __percpu *tfms)
 	list_del(&pos->list);
 	kfree(pos);
 
-	if (!tfms)
+	if (!reqs)
 		return;
 
 	for_each_possible_cpu(cpu) {
-		struct crypto_comp *tfm = *per_cpu_ptr(tfms, cpu);
-		crypto_free_comp(tfm);
+		struct acomp_req *req = *per_cpu_ptr(reqs, cpu);
+
+		if (req) {
+			struct crypto_acomp *acomp = crypto_acomp_reqtfm(req);
+
+			acomp_request_free(req);
+			crypto_free_acomp(acomp);
+		}
 	}
-	free_percpu(tfms);
+	free_percpu(reqs);
 }
 
-static struct crypto_comp * __percpu *ipcomp_alloc_tfms(const char *alg_name)
+static struct acomp_req * __percpu *ipcomp_alloc_reqs(const char *alg_name)
 {
-	struct ipcomp_tfms *pos;
-	struct crypto_comp * __percpu *tfms;
+	struct ipcomp_reqs *pos;
+	struct crypto_acomp *acomp;
+	struct acomp_req * __percpu *reqs;
 	int cpu;
 
 
-	list_for_each_entry(pos, &ipcomp_tfms_list, list) {
-		struct crypto_comp *tfm;
+	list_for_each_entry(pos, &ipcomp_reqs_list, list) {
+		struct crypto_acomp *tfm;
 
 		/* This can be any valid CPU ID so we don't need locking. */
-		tfm = this_cpu_read(*pos->tfms);
+		tfm = crypto_acomp_reqtfm(this_cpu_read(*pos->reqs));
 
-		if (!strcmp(crypto_comp_name(tfm), alg_name)) {
+		if (!strcmp(crypto_acomp_name(tfm), alg_name)) {
 			pos->users++;
-			return pos->tfms;
+			return pos->reqs;
 		}
 	}
 
@@ -282,31 +303,39 @@ static struct crypto_comp * __percpu *ipcomp_alloc_tfms(const char *alg_name)
 
 	pos->users = 1;
 	INIT_LIST_HEAD(&pos->list);
-	list_add(&pos->list, &ipcomp_tfms_list);
+	list_add(&pos->list, &ipcomp_reqs_list);
 
-	pos->tfms = tfms = alloc_percpu(struct crypto_comp *);
-	if (!tfms)
+	reqs = alloc_percpu_gfp(struct acomp_req *, GFP_KERNEL | __GFP_ZERO);
+	if (!reqs)
 		goto error;
 
 	for_each_possible_cpu(cpu) {
-		struct crypto_comp *tfm = crypto_alloc_comp(alg_name, 0,
-							    CRYPTO_ALG_ASYNC);
-		if (IS_ERR(tfm))
+		struct acomp_req *req;
+
+		acomp = crypto_alloc_acomp(alg_name, 0, CRYPTO_ALG_ASYNC);
+		if (IS_ERR(acomp))
 			goto error;
-		*per_cpu_ptr(tfms, cpu) = tfm;
+
+		req = acomp_request_alloc(acomp);
+		if (!req) {
+			crypto_free_acomp(acomp);
+			goto error;
+		}
+		*per_cpu_ptr(reqs, cpu) = req;
 	}
 
-	return tfms;
+	pos->reqs = reqs;
+	return reqs;
 
 error:
-	ipcomp_free_tfms(tfms);
+	ipcomp_free_reqs(reqs);
 	return NULL;
 }
 
 static void ipcomp_free_data(struct ipcomp_data *ipcd)
 {
-	if (ipcd->tfms)
-		ipcomp_free_tfms(ipcd->tfms);
+	if (ipcd->reqs)
+		ipcomp_free_reqs(ipcd->reqs);
 	ipcomp_free_scratches();
 }
 
@@ -349,8 +378,8 @@ int ipcomp_init_state(struct xfrm_state *x, struct netlink_ext_ack *extack)
 	if (!ipcomp_alloc_scratches())
 		goto error;
 
-	ipcd->tfms = ipcomp_alloc_tfms(x->calg->alg_name);
-	if (!ipcd->tfms)
+	ipcd->reqs = ipcomp_alloc_reqs(x->calg->alg_name);
+	if (!ipcd->reqs)
 		goto error;
 	mutex_unlock(&ipcomp_resource_mutex);
 
-- 
2.39.2

