Return-Path: <linuxppc-dev+bounces-17685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADwjNw/yp2mGmgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 09:49:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B854D1FCE14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 09:49:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQmYm0gX6z3bp0;
	Wed, 04 Mar 2026 19:49:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772614155;
	cv=none; b=c8x9sq8S4yvuEUvbymhVIAGGPe3jCaAC/EiN6lmS9v0erzwNDVwLDl5t+P3DKl3TUk7W/RaAxlK2v8QGmPTRrUCHe5D4O2IVlvDfjya0PxVUm7qXM18DX6YOdH+nPL5ickWWvYobhPw4fuNpv/XnVo6HOc8+HJmSIotMDRqHegZYLOnv4CVi/SGhGSpAbDveS+/16RwpYJCyvVQQLbHYFsvSZHinJ38R7qvmGlE8GZDf2p8NwXna74B0+9YDZWMlauybUxa0PdiJDdrfJO/S6iEyn9Xpil9CH1aMwxjP8IFgSVOJvwixiIdBIdEmT1JNv91eoUe18wQkXsud7ETwpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772614155; c=relaxed/relaxed;
	bh=Rj7Q/vYtzb0Bgsi7CI/w0kIX0MjY/y2Jj15ilI3hrWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cCW0cmT26ThqvglrRrf1zyZM4UzAiqwD8VxjQ7mHiaOd2jUD4YFjbZ+vBEG7UZP1+PoekcVAqKLyY3I19xVc+R7cSSwUV2b9XT1ycMqRB8ZGrKta2ZxLbglM+LrlkylKsllDj7CwTH8cTo3IAh5Mgd6xIo7KLHvhRM+2RDlLr96mEJXg+7Z4mpSDrhVb7p6iRVyT0GLamEYQZtm19YEhehnPAcRfOCs13htsZXIg2L5NjwmPQ39J0BKkG8mE0WtTr9GKg5mSD4UGmDMlpR1Psxw8E2rm3sBZGnj2DYlHK0bfUbmRJ4u2hfCgHRgXN8qc77Yay+tVHqbwO53IGo6DSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MlL8Gp8h; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MlL8Gp8h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQmYl0qwLz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 19:49:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B28B66132F;
	Wed,  4 Mar 2026 08:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A447EC19423;
	Wed,  4 Mar 2026 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772614152;
	bh=TD8F4xQavyxZ5Y5KpJUoNpSILLZS41Y69rivFsWe7vQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MlL8Gp8hwogxltsa4BXo64o0kOu/E+O7UXlChe6ulR4Cyqo/1XaTYAe5rnx1uzYs+
	 8E7SttY7nPdc6+UGwgtvQV2zMhpCw6zHvfK+O4+RB2eX++KZEJ+wrx5IN1vQP3eVTG
	 Gpxei4kfTLRUtamcIKXbmA7jeaQNKdS2Hf5ZOikYurGMJdjGvfEOAtz6OEGm63aX7r
	 oAoRn9HMKoe0grgeSP0zt8DgIOi72y1zHJ66LLGjOWGEfNZQaKE1xFsWcRxrO4jOLW
	 BnxJw22oYlX3M1v0bwjZdfuMve9KBr6/1t/MEGHZdtVvb/ys9lY+3QBMxBA7YpfXBe
	 nQxaQQ34/1wiA==
Message-ID: <dcef1004-3087-4a3a-942f-3e2bf3084a4c@kernel.org>
Date: Wed, 4 Mar 2026 09:49:03 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/14] vdso/datastore: Allocate data pages dynamically
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King
 <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>,
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
 <20260304-vdso-sparc64-generic-2-v6-3-d8eb3b0e1410@linutronix.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-3-d8eb3b0e1410@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: B854D1FCE14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:arnd@arndb.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:nick.alcock@oracle.com,m:jstultz@google.com,m:sboyd@kernel.org,m:glaubitz@physik.fu-berlin.de,m:shuah@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:tytso@mit.edu,m:Jason@zx2c4.com,m:linux@armlinux.org.uk,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tsbogend@alpha.franken.de,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:sln@onemain.com,m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-s390@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17685-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,arm.com,arndb.de,davemloft.net,gaisler.com,oracle.com,google.com,physik.fu-berlin.de,mit.edu,zx2c4.com,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,onemain.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,linutronix.de:email]
X-Rspamd-Action: no action



Le 04/03/2026 à 08:49, Thomas Weißschuh a écrit :
> Allocating the data pages as part of the kernel image does not work on
> SPARC. The MMU will through a fault when userspace tries to access them.
> 
> Allocate the data pages through the page allocator instead.
> Unused pages in the vDSO VMA are still allocated to keep the virtual
> addresses aligned. Switch the mapping from PFNs to 'struct page' as that
> is required for dynamically allocated pages.
> This also aligns the allocation of the datapages with the code
> pages and is a prerequisite for mlockall() support.
> 
> VM_MIXEDMAP is necessary for the call to vmf_insert_page() in the timens
> prefault path to work.
> 
> The data pages need to be order-0, non-compound pages so that the
> mapping to userspace and the different orderings work.
> 
> These pages are also used by the timekeeping, random pool and
> architecture initialization code. Some of these are running before the
> page allocator is available. To keep these subsytems working without
> changes, introduce early, statically data storage which will then
> replaced by the real one as soon as that is available.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   include/linux/vdso_datastore.h |  6 +++
>   init/main.c                    |  2 +
>   lib/vdso/datastore.c           | 92 +++++++++++++++++++++++++++---------------
>   3 files changed, 68 insertions(+), 32 deletions(-)
> 
> diff --git a/include/linux/vdso_datastore.h b/include/linux/vdso_datastore.h
> index a91fa24b06e0..0b530428db71 100644
> --- a/include/linux/vdso_datastore.h
> +++ b/include/linux/vdso_datastore.h
> @@ -2,9 +2,15 @@
>   #ifndef _LINUX_VDSO_DATASTORE_H
>   #define _LINUX_VDSO_DATASTORE_H
>   
> +#ifdef CONFIG_HAVE_GENERIC_VDSO
>   #include <linux/mm_types.h>
>   
>   extern const struct vm_special_mapping vdso_vvar_mapping;
>   struct vm_area_struct *vdso_install_vvar_mapping(struct mm_struct *mm, unsigned long addr);
>   
> +void __init vdso_setup_data_pages(void);
> +#else /* !CONFIG_HAVE_GENERIC_VDSO */
> +static inline void vdso_setup_data_pages(void) { }
> +#endif /* CONFIG_HAVE_GENERIC_VDSO */
> +
>   #endif /* _LINUX_VDSO_DATASTORE_H */
> diff --git a/init/main.c b/init/main.c
> index 1cb395dd94e4..de867b2693d2 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -105,6 +105,7 @@
>   #include <linux/ptdump.h>
>   #include <linux/time_namespace.h>
>   #include <linux/unaligned.h>
> +#include <linux/vdso_datastore.h>
>   #include <net/net_namespace.h>
>   
>   #include <asm/io.h>
> @@ -1119,6 +1120,7 @@ void start_kernel(void)
>   	srcu_init();
>   	hrtimers_init();
>   	softirq_init();
> +	vdso_setup_data_pages();
>   	timekeeping_init();
>   	time_init();
>   
> diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
> index 7377fcb6e1df..faebf5b7cd6e 100644
> --- a/lib/vdso/datastore.c
> +++ b/lib/vdso/datastore.c
> @@ -1,52 +1,79 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   
> -#include <linux/linkage.h>
> +#include <linux/gfp.h>
> +#include <linux/init.h>
>   #include <linux/mm.h>
>   #include <linux/time_namespace.h>
>   #include <linux/types.h>
>   #include <linux/vdso_datastore.h>
>   #include <vdso/datapage.h>
>   
> -/*
> - * The vDSO data page.
> - */
> +static u8 vdso_initdata[VDSO_NR_PAGES * PAGE_SIZE] __aligned(PAGE_SIZE) __initdata = {};
> +
>   #ifdef CONFIG_GENERIC_GETTIMEOFDAY
> -static union {
> -	struct vdso_time_data	data;
> -	u8			page[PAGE_SIZE];
> -} vdso_time_data_store __page_aligned_data;
> -struct vdso_time_data *vdso_k_time_data = &vdso_time_data_store.data;
> -static_assert(sizeof(vdso_time_data_store) == PAGE_SIZE);
> +struct vdso_time_data *vdso_k_time_data __refdata =
> +	(void *)&vdso_initdata[VDSO_TIME_PAGE_OFFSET * PAGE_SIZE];
> +
> +static_assert(sizeof(struct vdso_time_data) <= PAGE_SIZE);
>   #endif /* CONFIG_GENERIC_GETTIMEOFDAY */
>   
>   #ifdef CONFIG_VDSO_GETRANDOM
> -static union {
> -	struct vdso_rng_data	data;
> -	u8			page[PAGE_SIZE];
> -} vdso_rng_data_store __page_aligned_data;
> -struct vdso_rng_data *vdso_k_rng_data = &vdso_rng_data_store.data;
> -static_assert(sizeof(vdso_rng_data_store) == PAGE_SIZE);
> +struct vdso_rng_data *vdso_k_rng_data __refdata =
> +	(void *)&vdso_initdata[VDSO_RNG_PAGE_OFFSET * PAGE_SIZE];
> +
> +static_assert(sizeof(struct vdso_rng_data) <= PAGE_SIZE);
>   #endif /* CONFIG_VDSO_GETRANDOM */
>   
>   #ifdef CONFIG_ARCH_HAS_VDSO_ARCH_DATA
> -static union {
> -	struct vdso_arch_data	data;
> -	u8			page[VDSO_ARCH_DATA_SIZE];
> -} vdso_arch_data_store __page_aligned_data;
> -struct vdso_arch_data *vdso_k_arch_data = &vdso_arch_data_store.data;
> +struct vdso_arch_data *vdso_k_arch_data __refdata =
> +	(void *)&vdso_initdata[VDSO_ARCH_PAGES_START * PAGE_SIZE];
>   #endif /* CONFIG_ARCH_HAS_VDSO_ARCH_DATA */
>   
> +void __init vdso_setup_data_pages(void)
> +{
> +	unsigned int order = get_order(VDSO_NR_PAGES * PAGE_SIZE);
> +	struct page *pages;
> +
> +	/*
> +	 * Allocate the data pages dynamically. SPARC does not support mapping
> +	 * static pages to be mapped into userspace.
> +	 * It is also a requirement for mlockall() support.
> +	 *
> +	 * Do not use folios. In time namespaces the pages are mapped in a different order
> +	 * to userspace, which is not handled by the folio optimizations in finish_fault().
> +	 */
> +	pages = alloc_pages(GFP_KERNEL, order);
> +	if (!pages)
> +		panic("Unable to allocate VDSO storage pages");
> +
> +	/* The pages are mapped one-by-one into userspace and each one needs to be refcounted. */
> +	split_page(pages, order);
> +
> +	/* Move the data already written by other subsystems to the new pages */
> +	memcpy(page_address(pages), vdso_initdata, VDSO_NR_PAGES * PAGE_SIZE);
> +
> +	if (IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY))
> +		vdso_k_time_data = page_address(pages + VDSO_TIME_PAGE_OFFSET);
> +
> +	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> +		vdso_k_rng_data = page_address(pages + VDSO_RNG_PAGE_OFFSET);
> +
> +	if (IS_ENABLED(CONFIG_ARCH_HAS_VDSO_ARCH_DATA))
> +		vdso_k_arch_data = page_address(pages + VDSO_ARCH_PAGES_START);
> +}
> +
>   static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
>   			     struct vm_area_struct *vma, struct vm_fault *vmf)
>   {
> -	struct page *timens_page = find_timens_vvar_page(vma);
> -	unsigned long pfn;
> +	struct page *page, *timens_page;
> +
> +	timens_page = find_timens_vvar_page(vma);
>   
>   	switch (vmf->pgoff) {
>   	case VDSO_TIME_PAGE_OFFSET:
>   		if (!IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY))
>   			return VM_FAULT_SIGBUS;
> -		pfn = __phys_to_pfn(__pa_symbol(vdso_k_time_data));
> +		page = virt_to_page(vdso_k_time_data);
>   		if (timens_page) {
>   			/*
>   			 * Fault in VVAR page too, since it will be accessed
> @@ -56,10 +83,10 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
>   			vm_fault_t err;
>   
>   			addr = vmf->address + VDSO_TIMENS_PAGE_OFFSET * PAGE_SIZE;
> -			err = vmf_insert_pfn(vma, addr, pfn);
> +			err = vmf_insert_page(vma, addr, page);
>   			if (unlikely(err & VM_FAULT_ERROR))
>   				return err;
> -			pfn = page_to_pfn(timens_page);
> +			page = timens_page;
>   		}
>   		break;
>   	case VDSO_TIMENS_PAGE_OFFSET:
> @@ -72,24 +99,25 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
>   		 */
>   		if (!IS_ENABLED(CONFIG_TIME_NS) || !timens_page)
>   			return VM_FAULT_SIGBUS;
> -		pfn = __phys_to_pfn(__pa_symbol(vdso_k_time_data));
> +		page = virt_to_page(vdso_k_time_data);
>   		break;
>   	case VDSO_RNG_PAGE_OFFSET:
>   		if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
>   			return VM_FAULT_SIGBUS;
> -		pfn = __phys_to_pfn(__pa_symbol(vdso_k_rng_data));
> +		page = virt_to_page(vdso_k_rng_data);
>   		break;
>   	case VDSO_ARCH_PAGES_START ... VDSO_ARCH_PAGES_END:
>   		if (!IS_ENABLED(CONFIG_ARCH_HAS_VDSO_ARCH_DATA))
>   			return VM_FAULT_SIGBUS;
> -		pfn = __phys_to_pfn(__pa_symbol(vdso_k_arch_data)) +
> -			vmf->pgoff - VDSO_ARCH_PAGES_START;
> +		page = virt_to_page(vdso_k_arch_data) + vmf->pgoff - VDSO_ARCH_PAGES_START;
>   		break;
>   	default:
>   		return VM_FAULT_SIGBUS;
>   	}
>   
> -	return vmf_insert_pfn(vma, vmf->address, pfn);
> +	get_page(page);
> +	vmf->page = page;
> +	return 0;
>   }
>   
>   const struct vm_special_mapping vdso_vvar_mapping = {
> @@ -101,7 +129,7 @@ struct vm_area_struct *vdso_install_vvar_mapping(struct mm_struct *mm, unsigned
>   {
>   	return _install_special_mapping(mm, addr, VDSO_NR_PAGES * PAGE_SIZE,
>   					VM_READ | VM_MAYREAD | VM_IO | VM_DONTDUMP |
> -					VM_PFNMAP | VM_SEALED_SYSMAP,
> +					VM_MIXEDMAP | VM_SEALED_SYSMAP,
>   					&vdso_vvar_mapping);
>   }
>   
> 


