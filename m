Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F13811425B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 09:37:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481Q5d0Zx7zDqWw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 19:37:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=pi9f6TM/; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481Q350jNQzDqWt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 19:35:10 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 481Q2s1fGhz9v116;
 Mon, 20 Jan 2020 09:35:01 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=pi9f6TM/; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id giQLqLLTcw8K; Mon, 20 Jan 2020 09:35:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 481Q2s0ZHTz9vBmq;
 Mon, 20 Jan 2020 09:35:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579509301; bh=byyZcxzdL9PR+hJEiI7kNW/TwgItiNGIa6x9MA2z3EQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pi9f6TM/+rrGO39HuJdx14sJBDKQAJSMaiYHf7ubahWYdAGN7sJ3a3J/kqqQI3oIY
 OAUMmk0upmj9M4yO+CfZatU0+Rdp6kWjg1YO0vysCy85NW/XoPTqi6EWJf1RkTKCXg
 EFsZ6BnAjjku3PRAAwP9AopWKQ5Z653E3/j72H+Q=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9586C8B782;
 Mon, 20 Jan 2020 09:35:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id j-6E-PTjA8J5; Mon, 20 Jan 2020 09:35:05 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A21C8B752;
 Mon, 20 Jan 2020 09:35:05 +0100 (CET)
Subject: Re: [PATCH v6 1/5] powerpc/mm: Implement set_memory() routines
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20191224055545.178462-1-ruscur@russell.cc>
 <20191224055545.178462-2-ruscur@russell.cc>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b72d7a3b-5ef1-9628-5091-9c3e390c2c28@c-s.fr>
Date: Mon, 20 Jan 2020 09:35:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191224055545.178462-2-ruscur@russell.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/12/2019 à 06:55, Russell Currey a écrit :
> The set_memory_{ro/rw/nx/x}() functions are required for STRICT_MODULE_RWX,
> and are generally useful primitives to have.  This implementation is
> designed to be completely generic across powerpc's many MMUs.
> 
> It's possible that this could be optimised to be faster for specific
> MMUs, but the focus is on having a generic and safe implementation for
> now.
> 
> This implementation does not handle cases where the caller is attempting
> to change the mapping of the page it is executing from, or if another
> CPU is concurrently using the page being altered.  These cases likely
> shouldn't happen, but a more complex implementation with MMU-specific code
> could safely handle them, so that is left as a TODO for now.
> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
>   arch/powerpc/Kconfig                  |  1 +
>   arch/powerpc/include/asm/set_memory.h | 32 +++++++++++
>   arch/powerpc/mm/Makefile              |  1 +
>   arch/powerpc/mm/pageattr.c            | 83 +++++++++++++++++++++++++++
>   4 files changed, 117 insertions(+)
>   create mode 100644 arch/powerpc/include/asm/set_memory.h
>   create mode 100644 arch/powerpc/mm/pageattr.c
> 
> +static int __change_page_attr(pte_t *ptep, unsigned long addr, void *data)
> +{
> +	int action = *((int *)data);
> +	pte_t pte_val;

pte_val is really not a good naming, because pte_val() is already a 
function which returns the value of a pte_t var.

Here you should name it 'pte' as usual.

Christophe

> +
> +	// invalidate the PTE so it's safe to modify
> +	pte_val = ptep_get_and_clear(&init_mm, addr, ptep);
> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +
> +	// modify the PTE bits as desired, then apply
> +	switch (action) {
> +	case SET_MEMORY_RO:
> +		pte_val = pte_wrprotect(pte_val);
> +		break;
> +	case SET_MEMORY_RW:
> +		pte_val = pte_mkwrite(pte_val);
> +		break;
> +	case SET_MEMORY_NX:
> +		pte_val = pte_exprotect(pte_val);
> +		break;
> +	case SET_MEMORY_X:
> +		pte_val = pte_mkexec(pte_val);
> +		break;
> +	default:
> +		WARN_ON(true);
> +		return -EINVAL;
> +	}
> +
> +	set_pte_at(&init_mm, addr, ptep, pte_val);
> +
> +	return 0;
> +}
> +
