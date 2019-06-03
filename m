Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1228339F9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 23:42:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HpSX2vRYzDqW4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 07:42:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="scIwGBKI"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HpRF38QfzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 07:41:44 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id g13so28887983edu.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2019 14:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yhLYhpx5r94UcNbu2SZQmZBVQeUmPq6PVimIkeEn7pk=;
 b=scIwGBKI357lkVXW52kw03XCI4+Ae6ho42noCT0DWTtPRkLPw37gVYJBmgatjte/fr
 txxL6xswgG2bwv4dcBi9ilccueJ2EbcEKZtiqgVr0w/zR7p00TQxQ68X081DlJksiVJp
 bQq/Q6WuN9RqstqJonmfHCKtiFMA7q9w/UyTa+NDl7ayqnpxpJkR/MsE/cnrEjpN5UnF
 pDmYt0I6nf0M8NtJy0pn3MNogc07CPwCXpJcmFU/YcoTOESdyv+YzC8Zd1MT32D8/vBb
 qcdBZinoMMfM8+8dbAMFVV623Db3nfb+VmQu9rZFXZf1rykogdgYpXDWtPbozhqhF8So
 ROsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=yhLYhpx5r94UcNbu2SZQmZBVQeUmPq6PVimIkeEn7pk=;
 b=YeuZGwpuWbtQaAxDTaEbRFnqcAHgYqWa1fPNPmc3hpVULDhUq9COzfCDeO2QZWU53+
 PRg2REn0ofUFxAgZ+QJjHFCkszvauLrN3i+wKZGQjJTiFcY9JL91etQWlzMNSxHTD4Ir
 5g8mL6rAjKJmBtbJEaWbkW7fPHgBXxEqfJ4G1G2PvVDl55pB9Xgc1omPzQmO/KW8wMpw
 ic/SlvgytqOgczPahhiZnJ3w+PyMLHXhGt3HDABo3GndEIFt+8wynaeYjSZglGQa3G5u
 8fan3m5afqg3tX25yBI/pCurGgNYY1eZTs14opSCZb4VHnu3CWJOME0k+DYDy72c08hr
 nYaw==
X-Gm-Message-State: APjAAAVilJf9VXDxU7tjUQ0hoyb0U7fW6jTkm6cBisgXrQIpC5PawN8F
 rZuMTECZBpdBTNXcaheTxXI=
X-Google-Smtp-Source: APXvYqwCMUWcithGJqx45+EgRmxCCI6sjYqisr91FRxovWqn6/a/0IS0IDUQUvDAHCpQkkCQxu0u/A==
X-Received: by 2002:a17:907:20d0:: with SMTP id
 qq16mr14587748ejb.244.1559598100632; 
 Mon, 03 Jun 2019 14:41:40 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id e45sm4208929edb.12.2019.06.03.14.41.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 14:41:39 -0700 (PDT)
Date: Mon, 3 Jun 2019 21:41:39 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 04/11] arm64/mm: Add temporary arch_remove_memory()
 implementation
Message-ID: <20190603214139.mercn5hol2yyfl2s@master>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-5-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-5-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, Yu Zhao <yuzhao@google.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 Jun Yao <yaojun8558363@gmail.com>, linux-mm@kvack.org,
 Chintan Pandya <cpandya@codeaurora.org>, Igor Mammedov <imammedo@redhat.com>,
 akpm@linux-foundation.org, Mike Rapoport <rppt@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2019 at 01:11:45PM +0200, David Hildenbrand wrote:
>A proper arch_remove_memory() implementation is on its way, which also
>cleanly removes page tables in arch_add_memory() in case something goes
>wrong.

Would this be better to understand?

    removes page tables created in arch_add_memory

>
>As we want to use arch_remove_memory() in case something goes wrong
>during memory hotplug after arch_add_memory() finished, let's add
>a temporary hack that is sufficient enough until we get a proper
>implementation that cleans up page table entries.
>
>We will remove CONFIG_MEMORY_HOTREMOVE around this code in follow up
>patches.
>
>Cc: Catalin Marinas <catalin.marinas@arm.com>
>Cc: Will Deacon <will.deacon@arm.com>
>Cc: Mark Rutland <mark.rutland@arm.com>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>Cc: Chintan Pandya <cpandya@codeaurora.org>
>Cc: Mike Rapoport <rppt@linux.ibm.com>
>Cc: Jun Yao <yaojun8558363@gmail.com>
>Cc: Yu Zhao <yuzhao@google.com>
>Cc: Robin Murphy <robin.murphy@arm.com>
>Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>
>---
> arch/arm64/mm/mmu.c | 19 +++++++++++++++++++
> 1 file changed, 19 insertions(+)
>
>diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>index a1bfc4413982..e569a543c384 100644
>--- a/arch/arm64/mm/mmu.c
>+++ b/arch/arm64/mm/mmu.c
>@@ -1084,4 +1084,23 @@ int arch_add_memory(int nid, u64 start, u64 size,
> 	return __add_pages(nid, start >> PAGE_SHIFT, size >> PAGE_SHIFT,
> 			   restrictions);
> }
>+#ifdef CONFIG_MEMORY_HOTREMOVE
>+void arch_remove_memory(int nid, u64 start, u64 size,
>+			struct vmem_altmap *altmap)
>+{
>+	unsigned long start_pfn = start >> PAGE_SHIFT;
>+	unsigned long nr_pages = size >> PAGE_SHIFT;
>+	struct zone *zone;
>+
>+	/*
>+	 * FIXME: Cleanup page tables (also in arch_add_memory() in case
>+	 * adding fails). Until then, this function should only be used
>+	 * during memory hotplug (adding memory), not for memory
>+	 * unplug. ARCH_ENABLE_MEMORY_HOTREMOVE must not be
>+	 * unlocked yet.
>+	 */
>+	zone = page_zone(pfn_to_page(start_pfn));

Compared with arch_remove_memory in x86. If altmap is not NULL, zone will be
retrieved from page related to altmap. Not sure why this is not the same?

>+	__remove_pages(zone, start_pfn, nr_pages, altmap);
>+}
>+#endif
> #endif
>-- 
>2.20.1

-- 
Wei Yang
Help you, Help me
