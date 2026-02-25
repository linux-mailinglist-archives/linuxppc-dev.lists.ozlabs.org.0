Return-Path: <linuxppc-dev+bounces-17158-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHfIJtevnmmRWwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17158-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 09:16:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F15EF194081
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 09:16:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLS904Fzrz3ddL;
	Wed, 25 Feb 2026 19:16:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772007380;
	cv=none; b=N2mRy2DTIDbwzhFFVcup4I5UIkr0ZegMNiWLNWICiugWVy4CZGeE6Bn3La4nANjTm0T/zo5fmIy06RpnymKoRY+n4KaRhfHA9kKjAXxZFTy88xcC0O4jpUnap9kUvok6e6ZYBRxXINFTzzX/bevWZBA4BmmOMk9CNj6rj3z+n1xXRE6iWpJcJEIEjbM1Pt2GBt+7Z1URmGDztjCL+YDwWA67KAzd9aAaxoFZz4RwQVuH9+R08p7SmN3f4DlFg7IpZrYks+899BINbIfEBMZ29iNK19dynLoxwNiNDAtQR0Jha4dDKXU97vd6IpHmEngEIKWdaDbVqH0zeVngX3E0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772007380; c=relaxed/relaxed;
	bh=3+N2FdzBXq7d0qBg17oIVx0hpSGWg6PAf2XJ4iYnD3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=WzjjSgp/o1GsUaAVSS0PrkTMrK0lWDNXl7t9CUlJK4GLOwR9jlJxCsIcpvypobcemrHU2XNPzEyfCvuNLc5u6qq9ulHPAiGqnDqj0j8B1kGtvMjtrn8lV+M4wZxyVBKSWYa5UKiq+y3y/2nHafH+wCvpiLn7GD/XWK0xM043YAWdOsYogflrRI7EpaMFE/weuOgMkzmnqqfV9Oir6dR0MbFiTMKKCl65St0sV7Aum5ntPBuee1UC5U5ZTeGWRjZ+wEl2n3aqiSiJ6AovBINF8VtmlCCQDHhsx3u1X4L/m2B9uj19cZC4ic6ek8oizZkGx9sFw+r9xfC1ugSTb/jR6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dp7SnWCa; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c79YTB5d; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dp7SnWCa;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c79YTB5d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 80 seconds by postgrey-1.37 at boromir; Wed, 25 Feb 2026 19:16:19 AEDT
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLS8z4TtGz3dWj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 19:16:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+N2FdzBXq7d0qBg17oIVx0hpSGWg6PAf2XJ4iYnD3A=;
	b=Dp7SnWCawm8+4nWspuj5hLUUPXVqBm3HzPbJvsx8pgiErXugpu83I5/fAacQQLUZampiv9
	HFiZAZXox7LSiwJxd9HdhkSFuY9pCCe2Yw06EN0dJSMgdHjdYTSe8lQ01azCl/ZJHYVmm7
	ybbRfybPzV+shcBxMzoxuFscYLauKv8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+N2FdzBXq7d0qBg17oIVx0hpSGWg6PAf2XJ4iYnD3A=;
	b=c79YTB5dADik5Q5ZG4JqorEhC9/JEfKOcUe3+boTm9VzMjkrfWaA+8XWYVRPxq8WmLHy2W
	JNM8tid1psfVpbrtHZVqN1wsUL4TjDcSJsNfXAtR/0IAyStg2BnoxPZvu55T5d/KMVECFA
	vmT8La4yRm3XlOKjmkfibLfFVq+eS+A=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-36-5bDMHpyIN7qY2J9aFw6T_w-1; Wed,
 25 Feb 2026 03:16:11 -0500
X-MC-Unique: 5bDMHpyIN7qY2J9aFw6T_w-1
X-Mimecast-MFC-AGG-ID: 5bDMHpyIN7qY2J9aFw6T_w_1772007369
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C83718003F6;
	Wed, 25 Feb 2026 08:16:09 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.55])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 50E031800465;
	Wed, 25 Feb 2026 08:15:58 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org,
	andreyknvl@gmail.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	linux-s390@vger.kernel.org,
	hca@linux.ibm.com,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v5 09/15] arch/powerpc: don't initialize kasan if it's disabled
Date: Wed, 25 Feb 2026 16:14:06 +0800
Message-ID: <20260225081412.76502-10-bhe@redhat.com>
In-Reply-To: <20260225081412.76502-1-bhe@redhat.com>
References: <20260225081412.76502-1-bhe@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 67U9-tTUVbQVVmJQ7aZcG9k6cRVeB9yZURzspoB_AoE_1772007369
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17158-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kvack.org,gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,kernel.org,zankel.net,linux.ibm.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bhe@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:andreyknvl@gmail.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:dvyukov@google.com,m:linux-kernel@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:chris@zankel.net,m:jcmvbkbc@gmail.com,m:linux-s390@vger.kernel.org,m:hca@linux.ibm.com,m:bhe@redhat.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bhe@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: F15EF194081
X-Rspamd-Action: no action

Here, kasan is disabled if specified 'kasan=off' in kernel cmdline.

This includes 32bit, book3s/64 and book3e/64.

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/mm/kasan/init_32.c        | 6 +++++-
 arch/powerpc/mm/kasan/init_book3e_64.c | 4 ++++
 arch/powerpc/mm/kasan/init_book3s_64.c | 4 ++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/kasan/init_32.c b/arch/powerpc/mm/kasan/init_32.c
index 1d083597464f..0ea2a636c992 100644
--- a/arch/powerpc/mm/kasan/init_32.c
+++ b/arch/powerpc/mm/kasan/init_32.c
@@ -141,6 +141,10 @@ void __init kasan_init(void)
 	u64 i;
 	int ret;
 
+	/* If KASAN is disabled via command line, don't initialize it. */
+	if (kasan_arg_disabled)
+		return;
+
 	for_each_mem_range(i, &base, &end) {
 		phys_addr_t top = min(end, total_lowmem);
 
@@ -170,7 +174,7 @@ void __init kasan_init(void)
 
 void __init kasan_late_init(void)
 {
-	if (IS_ENABLED(CONFIG_KASAN_VMALLOC))
+	if (IS_ENABLED(CONFIG_KASAN_VMALLOC) && kasan_enabled())
 		kasan_unmap_early_shadow_vmalloc();
 }
 
diff --git a/arch/powerpc/mm/kasan/init_book3e_64.c b/arch/powerpc/mm/kasan/init_book3e_64.c
index 0d3a73d6d4b0..fbe4c9a7e460 100644
--- a/arch/powerpc/mm/kasan/init_book3e_64.c
+++ b/arch/powerpc/mm/kasan/init_book3e_64.c
@@ -111,6 +111,10 @@ void __init kasan_init(void)
 	u64 i;
 	pte_t zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL_RO);
 
+	/* If KASAN is disabled via command line, don't initialize it. */
+	if (kasan_arg_disabled)
+		return;
+
 	for_each_mem_range(i, &start, &end)
 		kasan_init_phys_region(phys_to_virt(start), phys_to_virt(end));
 
diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
index dcafa641804c..f7906f9ef9be 100644
--- a/arch/powerpc/mm/kasan/init_book3s_64.c
+++ b/arch/powerpc/mm/kasan/init_book3s_64.c
@@ -54,6 +54,10 @@ void __init kasan_init(void)
 	u64 i;
 	pte_t zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL);
 
+	/* If KASAN is disabled via command line, don't initialize it. */
+	if (kasan_arg_disabled)
+		return;
+
 	if (!early_radix_enabled()) {
 		pr_warn("KASAN not enabled as it requires radix!");
 		return;
-- 
2.52.0


