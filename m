Return-Path: <linuxppc-dev+bounces-17167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PUEEiqwnmmeWwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 09:17:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD72194142
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 09:17:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLSBL1n5wz3dXD;
	Wed, 25 Feb 2026 19:17:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772007450;
	cv=none; b=XgZ0FJLKaf+Ln9cxUFugpGLBn0z+sSZ7TLbMQ4pD5BuBgnlsBUymMmBtulPa01l/7zw/WUuEomZYHnNruoOlCu2+XQ7rtPegtCRnaE/rGqyOKwZwMwkgbiZA48Aszjr2nhrv1AHGkWx9Z/dXmuXz/RquKObuYMwLROzhjCMA0bg2SKPTKKEfMqKBYv4U9dWBXwXTR5goZAPpyH0/t6XnQI7I0jv4uEjUNzjoGdFDQXwAsUfui0l1h4hJlbH8g5Dvcag2WYX/xO58rvLLkdy3Y4VKefzQdPNGXJ9p8yeVn0X11de5dyyF/ZN+bXtivpmCeYy8yBBVtuj6bqQv7u5fSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772007450; c=relaxed/relaxed;
	bh=oV6MOc6IZ/eQSfEt7lDYf3QV1I2fYi7uzloZcjfdDk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=ZnRiSg+3MwrKXEq+e2T2Q6uR0safqXPizpEWpTFkWc5pDK/ZUYy7rHSNOSo+GNCSrUC+XfcAcrHT0RACTtTV2X7hhXUK8h5Z8+Qh1uAxNh1DJF4kEbXecSeAumaqMQBK2PmABy74rcnGj3nyW6/Pu2ZoSBdOvwbimWIpgw1Kpi1h+wNK7RWTP8+RjJ50oXMkPqb/GzQ73ZC3d1YEL46wcbgKtYzMB+J0ehXFbZPC8bDdVEOQEjqJEZSmU29zfiubIemxZGQbA/wesFfzv7hewWAWq0tCeatqivQq+t1x560dCjJgKrSelZ/v4yYmQxKvOhI1XETSUuwOj36wkiQXfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sdltovha; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sdltovha; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sdltovha;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Sdltovha;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLSBK1JWDz3dXB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 19:17:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oV6MOc6IZ/eQSfEt7lDYf3QV1I2fYi7uzloZcjfdDk8=;
	b=SdltovhakWpz5RDVNFplcUigc2H5aTC8P8aiIb5ck58po6JFsdSXgejyv+9uFuEMDeX6pU
	9Zcai9YXkloB2JV2WHzLA7ZG0WI4ZMr4A7Vv665v+ZwygV2hPdRMMVQO2FdfxbOJcgYvRJ
	V4nXTSLMDgRlw9y4NW/56D/ZjIkocsE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oV6MOc6IZ/eQSfEt7lDYf3QV1I2fYi7uzloZcjfdDk8=;
	b=SdltovhakWpz5RDVNFplcUigc2H5aTC8P8aiIb5ck58po6JFsdSXgejyv+9uFuEMDeX6pU
	9Zcai9YXkloB2JV2WHzLA7ZG0WI4ZMr4A7Vv665v+ZwygV2hPdRMMVQO2FdfxbOJcgYvRJ
	V4nXTSLMDgRlw9y4NW/56D/ZjIkocsE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-477-d1eK6WOzOV6_MuYcbjoUdg-1; Wed,
 25 Feb 2026 03:17:22 -0500
X-MC-Unique: d1eK6WOzOV6_MuYcbjoUdg-1
X-Mimecast-MFC-AGG-ID: d1eK6WOzOV6_MuYcbjoUdg_1772007439
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 33B381955E8C;
	Wed, 25 Feb 2026 08:17:16 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.55])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 657C01800465;
	Wed, 25 Feb 2026 08:17:04 +0000 (UTC)
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
Subject: [PATCH v5 15/15] mm/kasan: clean up unneeded ARCH_DEFER_KASAN and kasan_arch_is_ready
Date: Wed, 25 Feb 2026 16:14:12 +0800
Message-ID: <20260225081412.76502-16-bhe@redhat.com>
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
X-Mimecast-MFC-PROC-ID: TiSilhpxGwr8MPhv7kMlZCIuo4RIQSrdsyYC52nL0cc_1772007439
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
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
	TAGGED_FROM(0.00)[bounces-17167-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.984];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 9DD72194142
X-Rspamd-Action: no action

Since commit 1e338f4d99e6 ("kasan: introduce ARCH_DEFER_KASAN and unify
static key across modes"), kasan_arch_is_ready() has been dead code.
And up to now, ARCH_DEFER_KASAN is useless too because of code change
for 'kasan=on|off'.

Here clean them up.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/loongarch/Kconfig |  1 -
 arch/powerpc/Kconfig   |  1 -
 arch/um/Kconfig        |  1 -
 lib/Kconfig.kasan      | 12 ------------
 mm/kasan/kasan.h       |  6 ------
 5 files changed, 21 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index d211c6572b0a..4b7802d02911 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -9,7 +9,6 @@ config LOONGARCH
 	select ACPI_PPTT if ACPI
 	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
 	select ARCH_BINFMT_ELF_STATE
-	select ARCH_NEEDS_DEFER_KASAN
 	select ARCH_DISABLE_KASAN_INLINE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ad7a2fe63a2a..b51fbc25bdc9 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -122,7 +122,6 @@ config PPC
 	# Please keep this list sorted alphabetically.
 	#
 	select ARCH_32BIT_OFF_T if PPC32
-	select ARCH_NEEDS_DEFER_KASAN		if PPC_RADIX_MMU
 	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
 	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index 098cda44db22..fd0bedd2c696 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -6,7 +6,6 @@ config UML
 	bool
 	default y
 	select ARCH_DISABLE_KASAN_INLINE if STATIC_LINK
-	select ARCH_NEEDS_DEFER_KASAN if STATIC_LINK
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CPU_FINALIZE_INIT
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index a4bb610a7a6f..f82889a830fa 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -19,18 +19,6 @@ config ARCH_DISABLE_KASAN_INLINE
 	  Disables both inline and stack instrumentation. Selected by
 	  architectures that do not support these instrumentation types.
 
-config ARCH_NEEDS_DEFER_KASAN
-	bool
-
-config ARCH_DEFER_KASAN
-	def_bool y
-	depends on KASAN && ARCH_NEEDS_DEFER_KASAN
-	help
-	  Architectures should select this if they need to defer KASAN
-	  initialization until shadow memory is properly set up. This
-	  enables runtime control via static keys. Otherwise, KASAN uses
-	  compile-time constants for better performance.
-
 config CC_HAS_KASAN_GENERIC
 	def_bool $(cc-option, -fsanitize=kernel-address)
 
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index fc9169a54766..f08f7f75c285 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -552,12 +552,6 @@ static inline void kasan_poison_last_granule(const void *address, size_t size) {
 
 #endif /* CONFIG_KASAN_GENERIC */
 
-#ifndef kasan_arch_is_ready
-static inline bool kasan_arch_is_ready(void)	{ return true; }
-#elif !defined(CONFIG_KASAN_GENERIC) || !defined(CONFIG_KASAN_OUTLINE)
-#error kasan_arch_is_ready only works in KASAN generic outline mode!
-#endif
-
 #if IS_ENABLED(CONFIG_KASAN_KUNIT_TEST)
 
 void kasan_kunit_test_suite_start(void);
-- 
2.52.0


