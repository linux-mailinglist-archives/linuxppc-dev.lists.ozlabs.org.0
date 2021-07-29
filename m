Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D663DA2D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 14:05:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gb8Nt5mm3z3cGJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 22:05:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cdjrlc.com (client-ip=203.205.250.33; helo=smtpbg510.qq.com;
 envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
Received: from smtpbg510.qq.com (smtpbg506.qq.com [203.205.250.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gb8NS3x21z30BT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 22:04:34 +1000 (AEST)
X-QQ-mid: bizesmtp52t1627559574tmijf3m2
Received: from ficus.lan (unknown [171.223.99.141])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 29 Jul 2021 19:52:53 +0800 (CST)
X-QQ-SSF: 01000000002000B0C000B00A0000000
X-QQ-FEAT: g9nl15ZGxlhDVMSj6Uem5DcjAIeccceCz6DFsJDcQaz5JJU7e3eMSyK1+61mi
 /Sjas9lCh/ziJHwd3XHvFK5wuv0V73xCjEFL0+lC84UWds6KnsUNc126y1unYxau9WR8h0H
 M0FNzAT3HCpt3xRuLYw1Hr1zV6jIMfA9WsGfwmw0E8D161ROFI4t8HQG+hPZm4JRFJk2zAp
 EUKCTcYxKK9ZrYiR58sLZBVUhtTePK7BpAIo+gol3ZBfliNKO66P1B3GTlpeuANzIRwUPIj
 dEireyFDmqdQMQNWD2ghMGfK2JTdobNETd0f+nN+HrhBLydsmm0z/c4a1CkoB0h0ZcoF/gl
 feVLzkJVNkqWswY0DHLNH+/Gt96XA==
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf/24x7: use 'unsigned int' instead of 'unsigned'
Date: Thu, 29 Jul 2021 19:52:52 +0800
Message-Id: <20210729115252.40895-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam4
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
Cc: linux-kernel@vger.kernel.org, Jason Wang <wangborong@cdjrlc.com>,
 cuibixuan@huawei.com, kjain@linux.ibm.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace the 'unsigned' with 'unsigned int' which is more accurate.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/powerpc/perf/hv-24x7.c | 38 ++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 1816f560a465..d767724a1162 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -33,7 +33,7 @@ static bool aggregate_result_elements;
 
 static cpumask_t hv_24x7_cpumask;
 
-static bool domain_is_valid(unsigned domain)
+static bool domain_is_valid(unsigned int domain)
 {
 	switch (domain) {
 #define DOMAIN(n, v, x, c)		\
@@ -47,7 +47,7 @@ static bool domain_is_valid(unsigned domain)
 	}
 }
 
-static bool is_physical_domain(unsigned domain)
+static bool is_physical_domain(unsigned int domain)
 {
 	switch (domain) {
 #define DOMAIN(n, v, x, c)		\
@@ -128,7 +128,7 @@ static bool domain_needs_aggregation(unsigned int domain)
 			  domain <= HV_PERF_DOMAIN_VCPU_REMOTE_NODE));
 }
 
-static const char *domain_name(unsigned domain)
+static const char *domain_name(unsigned int domain)
 {
 	if (!domain_is_valid(domain))
 		return NULL;
@@ -146,7 +146,7 @@ static const char *domain_name(unsigned domain)
 	return NULL;
 }
 
-static bool catalog_entry_domain_is_valid(unsigned domain)
+static bool catalog_entry_domain_is_valid(unsigned int domain)
 {
 	/* POWER8 doesn't support virtual domains. */
 	if (interface_version == 1)
@@ -258,7 +258,7 @@ static char *event_name(struct hv_24x7_event_data *ev, int *len)
 
 static char *event_desc(struct hv_24x7_event_data *ev, int *len)
 {
-	unsigned nl = be16_to_cpu(ev->event_name_len);
+	unsigned int nl = be16_to_cpu(ev->event_name_len);
 	__be16 *desc_len = (__be16 *)(ev->remainder + nl - 2);
 
 	*len = be16_to_cpu(*desc_len) - 2;
@@ -267,9 +267,9 @@ static char *event_desc(struct hv_24x7_event_data *ev, int *len)
 
 static char *event_long_desc(struct hv_24x7_event_data *ev, int *len)
 {
-	unsigned nl = be16_to_cpu(ev->event_name_len);
+	unsigned int nl = be16_to_cpu(ev->event_name_len);
 	__be16 *desc_len_ = (__be16 *)(ev->remainder + nl - 2);
-	unsigned desc_len = be16_to_cpu(*desc_len_);
+	unsigned int desc_len = be16_to_cpu(*desc_len_);
 	__be16 *long_desc_len = (__be16 *)(ev->remainder + nl + desc_len - 2);
 
 	*len = be16_to_cpu(*long_desc_len) - 2;
@@ -296,8 +296,8 @@ static void *event_end(struct hv_24x7_event_data *ev, void *end)
 {
 	void *start = ev;
 	__be16 *dl_, *ldl_;
-	unsigned dl, ldl;
-	unsigned nl = be16_to_cpu(ev->event_name_len);
+	unsigned int dl, ldl;
+	unsigned int nl = be16_to_cpu(ev->event_name_len);
 
 	if (nl < 2) {
 		pr_debug("%s: name length too short: %d", __func__, nl);
@@ -398,7 +398,7 @@ static long h_get_24x7_catalog_page(char page[], u64 version, u32 index)
  *		- Specifying (i.e overriding) values for other parameters
  *		  is undefined.
  */
-static char *event_fmt(struct hv_24x7_event_data *event, unsigned domain)
+static char *event_fmt(struct hv_24x7_event_data *event, unsigned int domain)
 {
 	const char *sindex;
 	const char *lpar;
@@ -529,9 +529,9 @@ static struct attribute *device_str_attr_create(char *name, int name_max,
 	return NULL;
 }
 
-static struct attribute *event_to_attr(unsigned ix,
+static struct attribute *event_to_attr(unsigned int ix,
 				       struct hv_24x7_event_data *event,
-				       unsigned domain,
+				       unsigned int domain,
 				       int nonce)
 {
 	int event_name_len;
@@ -599,7 +599,7 @@ event_to_long_desc_attr(struct hv_24x7_event_data *event, int nonce)
 	return device_str_attr_create(name, nl, nonce, desc, dl);
 }
 
-static int event_data_to_attrs(unsigned ix, struct attribute **attrs,
+static int event_data_to_attrs(unsigned int ix, struct attribute **attrs,
 				   struct hv_24x7_event_data *event, int nonce)
 {
 	*attrs = event_to_attr(ix, event, event->domain, nonce);
@@ -614,8 +614,8 @@ struct event_uniq {
 	struct rb_node node;
 	const char *name;
 	int nl;
-	unsigned ct;
-	unsigned domain;
+	unsigned int ct;
+	unsigned int domain;
 };
 
 static int memord(const void *d1, size_t s1, const void *d2, size_t s2)
@@ -628,8 +628,8 @@ static int memord(const void *d1, size_t s1, const void *d2, size_t s2)
 	return memcmp(d1, d2, s1);
 }
 
-static int ev_uniq_ord(const void *v1, size_t s1, unsigned d1, const void *v2,
-		       size_t s2, unsigned d2)
+static int ev_uniq_ord(const void *v1, size_t s1, unsigned int d1,
+			const void *v2, size_t s2, unsigned int d2)
 {
 	int r = memord(v1, s1, v2, s2);
 
@@ -643,7 +643,7 @@ static int ev_uniq_ord(const void *v1, size_t s1, unsigned d1, const void *v2,
 }
 
 static int event_uniq_add(struct rb_root *root, const char *name, int nl,
-			  unsigned domain)
+			  unsigned int domain)
 {
 	struct rb_node **new = &(root->rb_node), *parent = NULL;
 	struct event_uniq *data;
@@ -1398,7 +1398,7 @@ static int single_24x7_request(struct perf_event *event, u64 *count)
 static int h_24x7_event_init(struct perf_event *event)
 {
 	struct hv_perf_caps caps;
-	unsigned domain;
+	unsigned int domain;
 	unsigned long hret;
 	u64 ct;
 
-- 
2.32.0

