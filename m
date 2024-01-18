Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FD6831C6D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 16:27:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pwDvU6AG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TG67C191Dz3c4t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 02:27:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pwDvU6AG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TG65Q1NHmz3bnx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 02:25:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1F0E6CE1FE8;
	Thu, 18 Jan 2024 15:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FBECC43399;
	Thu, 18 Jan 2024 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705591542;
	bh=KMC85DRJZdm++lhsdhn7YzII9zgUNTcuLEE91FWfuxY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pwDvU6AGkVF9wFYcfG21kt7NpsY/SxrK2Iy/JqQlL9ljLEqUd1S4U+pj+6uCewKGu
	 GysB9boz39chxyFuf3lfTPbHXDEcEtGqqXRR2O+K5kr0C63gYHV6mh8nnahiFw9J+N
	 xTQ4FkQL/UwZe3IwYQQprGYkozRRC7X/1KkR9Rm0l/YAQ+hIr32sUOwJsh61Zi3mla
	 XYDb7NKgjiUK9MsjVhRU8Z5ED403xSDQYMzLNGZnbRjc+ChN1KJveP8+NV3wzsExZ9
	 24UWI+W0vQ7B9ZJ0y1wVuIpMujImCVfAa2+x/abl+LCtmKhX4lZ0mPh3QvdCjWM1+/
	 iE9PFqen9jTmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABABC47DD7;
	Thu, 18 Jan 2024 15:25:42 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 18 Jan 2024 09:25:15 -0600
Subject: [PATCH RFC 4/5] powerpc/pseries: Prepare
 pseries_add_hw_description() for runtime use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20240118-update-dump-stack-arch-str-v1-4-5c0f98d017b5@linux.ibm.com>
References:  <20240118-update-dump-stack-arch-str-v1-0-5c0f98d017b5@linux.ibm.com>
In-Reply-To:  <20240118-update-dump-stack-arch-str-v1-0-5c0f98d017b5@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Brian King <brking@linux.ibm.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 John Ogness <john.ogness@linutronix.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Petr Mladek <pmladek@suse.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Steven Rostedt <rostedt@goodmis.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705591541; l=2099;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=CZv2kpuUutCPmlUb5oeOcKP+Rm48SwsyFZd4IK8M0MI=;
 b=VVNznsHiVwe7zaiA0/fbe8MyMpQpbpoQiulJKy7zUG3wlvgn6w2XdK5QLCzzLofZfATALOCz8
 dlidtlO/FPgAkWxOCQuJcyLT2ARRHAF958I6ehHVXDfd352+MaTHxLt
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

pseries_add_hw_description() will be used after boot to update the
hardware description string emitted in stack dumps. Remove the __init
and make it take a seq_buf * parameter instead of referencing
ppc_hw_desc directly.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/setup.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index ecea85c74c43..9ae1951f8312 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -1007,7 +1007,7 @@ static void __init pSeries_cmo_feature_init(void)
 	pr_debug(" <- fw_cmo_feature_init()\n");
 }
 
-static void __init pseries_add_hw_description(void)
+static void pseries_add_hw_description(struct seq_buf *sb)
 {
 	struct device_node *dn;
 	const char *s;
@@ -1015,7 +1015,7 @@ static void __init pseries_add_hw_description(void)
 	dn = of_find_node_by_path("/openprom");
 	if (dn) {
 		if (of_property_read_string(dn, "model", &s) == 0)
-			seq_buf_printf(&ppc_hw_desc, "of:%s ", s);
+			seq_buf_printf(sb, "of:%s ", s);
 
 		of_node_put(dn);
 	}
@@ -1023,7 +1023,7 @@ static void __init pseries_add_hw_description(void)
 	dn = of_find_node_by_path("/hypervisor");
 	if (dn) {
 		if (of_property_read_string(dn, "compatible", &s) == 0)
-			seq_buf_printf(&ppc_hw_desc, "hv:%s ", s);
+			seq_buf_printf(sb, "hv:%s ", s);
 
 		of_node_put(dn);
 		return;
@@ -1031,7 +1031,7 @@ static void __init pseries_add_hw_description(void)
 
 	if (of_property_read_bool(of_root, "ibm,powervm-partition") ||
 	    of_property_read_bool(of_root, "ibm,fw-net-version"))
-		seq_buf_printf(&ppc_hw_desc, "hv:phyp ");
+		seq_buf_printf(sb, "hv:phyp ");
 }
 
 /*
@@ -1041,7 +1041,7 @@ static void __init pseries_init(void)
 {
 	pr_debug(" -> pseries_init()\n");
 
-	pseries_add_hw_description();
+	pseries_add_hw_description(&ppc_hw_desc);
 
 #ifdef CONFIG_HVC_CONSOLE
 	if (firmware_has_feature(FW_FEATURE_LPAR))

-- 
2.43.0

