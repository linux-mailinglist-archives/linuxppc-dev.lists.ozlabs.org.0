Return-Path: <linuxppc-dev+bounces-17432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IF7MI9JVomng1wQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 03:41:22 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F7D1C0011
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 03:41:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fN8b011bbz30T8;
	Sat, 28 Feb 2026 13:41:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772246476;
	cv=none; b=bu/gUdIfru8zPhqQ2Jstt2tDcvV1iVUyiXycvyPHKCzwOLcYXZ8qrU2Z7VjjTn2+ttR8/fLZ8aqKLhETSYKubmxPKYeI63cxEEBT7yHAwOZCr1NpFPMXcREKlbKLn6RMByUGlL161XjFC+OQojL8wemm8y4/S8Dw1JftJpRxexg8v6UZpgxI/t5zDBdR5s3ZK+lENKX+od9VmQuoZ2umXAd1Ds4uLQtLUkEx2x2MikJqa1EoJnA0ePV8R/76avElrtgwwtKRLLl05BAWaWE72tLaxozn3Ho/vxDGBTJ81MZ8ZDMDMUfwKvPOfZoV9PAH0T5u1oNS8WyKvBqEpJg1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772246476; c=relaxed/relaxed;
	bh=+42melSSCeyVi5c0QcjrNxM/6c8TQZ/GmkZEvra0bKY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=GihhlRj/F5lnj+A6Y3Ia711eMbKWAaUuDYU/451qDkyXea06YnvpNhHSq5PVU+tTFLkm39fN3+N01NprIbmzhpa5H+pMUKBCCPKXH5XTYrx5stu6D7Xf3G9gO90/SJIWxOi5L2Bpj8wEiCscmw8GZyJnBoGM+383BFcx7OUWQ5HMlhT4JZYR/uRJ689za+cbT//Fk6EHZU/eIg2suYK82fpJd/uWnUc3HavAZXw4xudbn+I/mhFePYnklGId5EGRM3/6sZCwbxCN3DTJBU8wwPHS4dJWuQIefp+4kJn78A2iq0KBV6JiOfh5jFTU9sRQorGdsEihBrU/4nBqvKRFyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NvEGlIa8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NvEGlIa8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fN8Zy4JCjz2xlj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 13:41:13 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2adbfab4501so12416155ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 18:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772246470; x=1772851270; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+42melSSCeyVi5c0QcjrNxM/6c8TQZ/GmkZEvra0bKY=;
        b=NvEGlIa8BkkdJ9PUDRmodZpihx/Byf0236XBrKia7M6rEf3d9EsXVr093AzKBILWX7
         6NNN4biw6UL3eeDkHGThPbmj+rTPoRx7A4yajb4PzcUK64uQfUFDh+kPyeF3DO3ceN9e
         9GRmKBrABr4sL5GgXjWKtQGQL1suhzxqjvO68jeKZ3gRkmSBxma/s8diI3QfKPiFTYEI
         /qHrTQYOPo9/h+ko2sfYi7s85SxTXpbetH/WlgNbmpKOSqHolvRBHomA//yz8EGAaMBU
         WT6fFPHOUQTCD1BI8wT1HAsF4nbtWTYeuerbQf7dfQUWuX8FxidQPNCyvfJIOf89WJ5d
         8bEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772246470; x=1772851270;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+42melSSCeyVi5c0QcjrNxM/6c8TQZ/GmkZEvra0bKY=;
        b=RSVK5PVXj87Q/EKplaoELWKgwvuPV4Z913EfM0JwYzHb+uE2Ilz44shNWakcqOYgZY
         zZJ2ay2TT+kv6cg7pu1Ry6nHLcpejRHUJSRSXOE1Wgxvk5VXlGkYc0QYQf31/y6doJse
         nIOiBhiMbQynLlqqMJmTQsrAnmCWbdkZk6N5XR59YUya9rWfRMXkIfqSY6ZhS3YGo5NH
         yuXo/AJBaFQU3/mLc0fsPiGV8ughc69gjx24AvyWSUEON4PJKBSSrnN0s9lzdTZSNx4v
         Omy2+4v0Kk97nQGZxRsW1dEnXAcZL5NixxQuYxLE3UAE4gJBR6yrJKysrFh56Jguht0L
         W7sg==
X-Forwarded-Encrypted: i=1; AJvYcCX7f4ghX4Iy/IYZIBkhNmQc4kRraVHIO0WaVKKIdZhG3MC84w2S9TvyvawvfZFFx7jFZhNwMZFW2M+4/YI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwPsF18H5idf6VaJrl9uyb+InhX57WajnYRlOwJO0ApbyVfGzvr
	xGmo7KsJ3nuifrd/eZBavR0PBQtnMNFZl6D0bE+mjG4+EGCgs4f0T1xL
X-Gm-Gg: ATEYQzxKtShwuSd+a9s+Ngw1qrv5MHKYrsklixWv1XWSmc/VXWniDvZxqH8Yd1ZZdE5
	AqYlCvpy1+quQyFMIeRleIRlTZlgZndKdARjPKu65JmXQDQjVYv4sQ28xKd7MZvAggv1vCWfd8H
	ENhW/7rAuLf85bLLBWIFJdCjLf9sZWeQFnMt1w3tfkxLDkg0A/E/d+a/cyf9hHVkgI+yHAx+ZF3
	ycz+9d9ktF85Y3uoy7mCcUVUw4z5KHTgtMtooMt8NVSTV7xXqv0ohTZIxqyXrQ645rE0QtN2HfB
	yA2ASXKDNaHGbj6ck/Nc2WmPVUxGl47d3NSgMpqDFl2wCfEaK+22HBDH3reNqN8ARxfPSIvqeQq
	DUkdvc+GWmK4E/+1wQyaCAItEYes4xV+pbqP6O8GK1SbqYeGlsaLuobuSOB7lXfxlaKPkoYipxX
	oVFNsYNWy9nBkJ6+iUSg==
X-Received: by 2002:a17:903:1212:b0:2ab:3ac6:8d01 with SMTP id d9443c01a7336-2ae2e496d6amr62031895ad.29.1772246470373;
        Fri, 27 Feb 2026 18:41:10 -0800 (PST)
Received: from dw-tp ([203.81.240.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5dbad2sm69336145ad.34.2026.02.27.18.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 18:41:09 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Donet Tom <donettom@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-mm@kvack.org
Subject: Re: powerpc/fadump: CMA init is failing
In-Reply-To: <aaIDkB2xLABDyV1y@kernel.org>
Date: Sat, 28 Feb 2026 08:05:26 +0530
Message-ID: <87ms0th9xt.ritesh.list@gmail.com>
References: <4c338a29-d190-44f3-8874-6cfa0a031f0b@linux.ibm.com> <87o6lagljy.ritesh.list@gmail.com> <aaIDkB2xLABDyV1y@kernel.org>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17432-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:sourabhjain@linux.ibm.com,m:maddy@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:mpe@ellerman.id.au,m:donettom@linux.ibm.com,m:hbathini@linux.ibm.com,m:mahesh@linux.ibm.com,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_PROHIBIT(0.00)[54.174.64.0:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,1.201.195.198:email]
X-Rspamd-Queue-Id: E6F7D1C0011
X-Rspamd-Action: no action

Mike Rapoport <rppt@kernel.org> writes:

> Hi Ritesh,
>
> On Fri, Feb 27, 2026 at 10:39:53PM +0530, Ritesh Harjani wrote:
>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>> 
>> > I noticed CMA init for fadump crashkernel memory is failing.
>> >
>> > [    0.000000] cma: pageblock_order not yet initialized. Called during 
>> > early boot?
>> > [    0.000000] fadump: Failed to init cma area for firmware-assisted 
>> > dump,-22
>> >
>> >
>> > kernel command-line:
>> > BOOT_IMAGE=(ieee1275//vdevice/v-scsi@30000070/disk@8100000000000000,msdos2)/vmlinuz-7.0.0-rc1+ 
>> > root=/dev/mapper/rhel_ltcden3--lp12-root ro 
>> > rd.lvm.lv=rhel_ltcden3-lp12/root rd.lvm.lv=rhel_ltcden3-lp12/swap 
>> > fadump=on crashkernel=3G
>> >
>> >
>> > Same issue with kdump CMA reservation:
>> >
>> > [    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
>> > during early boot?
>> 
>> Good that we added those debug prints ;)
>> 
>> I think I know what went wrong, as part of this arch,mm consolidation
>> patch series [1], I think the order of initialization is changed.
>> 
>> With this patch the new order is ... 
>> start_kernel()
>>     - setup_arch()
>>        - xxx_cma_reserve();
>>     - mm_core_init_early()
>>        - free_area_init()
>>           - sparse_init()
>>              - set_pageblock_order() // this sets the pageblock_order.
>> 
>> Whereas earlier set_pageblock_order() was called from initmem_init(),
>> just before cma reservations were being made. 
>> 
>> start_kernel()
>>     - setup_arch()
>>        - initmem_init()
>>          - sparse_init()
>>            - set_pageblock_order();  // this sets the pageblock_order
>>        - xxx_cma_reserve();
>> 
>> So that means, pageblock_order is not initialized before these cma
>> reservation function calls, hence we are seeing these failures.
>> 
>> setup_arch() {
>>     ...
>> 
>> 	/*
>> 	 * Reserve large chunks of memory for use by CMA for kdump, fadump, KVM and
>> 	 * hugetlb. These must be called after initmem_init(), so that
>> 	 * pageblock_order is initialised.
>> 	 */
>> 	fadump_cma_init();
>> 	kdump_cma_reserve();
>> 	kvm_cma_reserve();
>> 
>>     ...
>> }
>> 
>> 
>> So what if we do.. 
>> 
>> start_kernel() {
>>   ...
>> 	setup_arch(&command_line);
>> 	mm_core_init_early();
>>     setup_arch_post_mm_core_init(); // and here we call CMA reservation functions ?
>  
> Unless I'm missing something these cma reservations can be moved to
> arch_mm_preinit().
> It runs after mm_core_init_early() and before memblock moves the free
> memory to the buddy.
>

Right. I think, we should be able to use that...

@Sourabh, 

I don't have access to the systems (travelling back...). Could you
please give this a try?


diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index cb5b73adc250..b1761909c23f 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -35,7 +35,6 @@
 #include <linux/of_irq.h>
 #include <linux/hugetlb.h>
 #include <linux/pgtable.h>
-#include <asm/kexec.h>
 #include <asm/io.h>
 #include <asm/paca.h>
 #include <asm/processor.h>
@@ -995,15 +994,6 @@ void __init setup_arch(char **cmdline_p)
 
 	initmem_init();
 
-	/*
-	 * Reserve large chunks of memory for use by CMA for kdump, fadump, KVM and
-	 * hugetlb. These must be called after initmem_init(), so that
-	 * pageblock_order is initialised.
-	 */
-	fadump_cma_init();
-	kdump_cma_reserve();
-	kvm_cma_reserve();
-
 	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
 
 	if (ppc_md.setup_arch)
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 29bf347f6012..5ba947e4fe37 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -30,6 +30,10 @@
 #include <asm/setup.h>
 #include <asm/fixmap.h>
 
+#include <asm/fadump.h>
+#include <asm/kexec.h>
+#include <asm/kvm_ppc.h>
+
 #include <mm/mmu_decl.h>
 
 unsigned long long memory_limit __initdata;
@@ -268,6 +272,16 @@ void __init paging_init(void)
 
 void __init arch_mm_preinit(void)
 {
+
+	/*
+	 * Reserve large chunks of memory for use by CMA for kdump, fadump, KVM
+	 * and hugetlb. These must be called after pageblock_order is
+	 * initialised.
+	 */
+	fadump_cma_init();
+	kdump_cma_reserve();
+	kvm_cma_reserve();
+
 	/*
 	 * book3s is limited to 16 page sizes due to encoding this in
 	 * a 4-bit field for slices.


-ritesh

>> References:
>> [1]: https://lore.kernel.org/linuxppc-dev/20260111082105.290734-1-rppt@kernel.org/T/#m5adf1a845e0a0867066c4f7055f28e6304b73fa5
>> [2]: https://lore.kernel.org/all/3ae208e48c0d9cefe53d2dc4f593388067405b7d.1729146153.git.ritesh.list@gmail.com/
>> 
>> 
>> -ritesh
>
> -- 
> Sincerely yours,
> Mike.

