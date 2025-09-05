Return-Path: <linuxppc-dev+bounces-11798-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E884B45A82
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 16:30:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJJfM32FRz3d90;
	Sat,  6 Sep 2025 00:30:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757082619;
	cv=none; b=YfDGiomyfNCBQQyMwXbdOnp10OccEhZuJBosabBGiSvPYeiGF7OQ10O7XRTFMD1hSr4T2kNnT+zfdNUFmGkvScMafAf/ezmzP3aag1aDD2FBuUUCx5gwjwmbTBhN+rK1fP+DZef0zXAUOPnOaLEnyU44vcbpif2LLCGzc90QMpwUlo3W5MVT3KemqFW1CKtFcgCYd3XVRYxdxQ7xFC23717UDB7dHUBclV3PpJU1bgE26rT3Ysbh28wOFP3iLIcQD2fFaOyaLBhVq/dqhmMp2c4qCF54SWtmOfalZKOZmkAMUlxq8cheK4TSUtyWsPQ0tK4ZzgxJjFYbypuE6FYnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757082619; c=relaxed/relaxed;
	bh=ev4jgj8g0fTNZJltLUp+cJJPga8rWwR8rDlO94sZYmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LN/PAuzHf04YD8EvVVQRX8lpJU0NYVzN7O3MwFevoTTKyKZUEpH259q12NwsMdu60QDEyIyqtFWdRZwbl2hhjsrAT7zyXL0rDonoXIXVimN0edwMFLbSU8Se4BwUF9DMGMCFoX943MbGJ9Dt/DRXTCMChftHJ6pZ+euo/shA502DE0fPMSOAaE8ZO0Ue6hLYYKhAhC6CnHKf+bDzS57q8g68ViB55H150GErEdIZAUmysVRBjiIYKvg2woDrJ+lvkqxkFlpwVbT2ZKliR5p4OGzoy/3it/G1A8fONR1vf6/F8llMMU6cgsrRLPcA3fw8Elqv43vrMPQpfs///JGQZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=wh9iY/Qv; dkim-atps=neutral; spf=pass (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org) smtp.mailfrom=mailbox.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=wh9iY/Qv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 143136 seconds by postgrey-1.37 at boromir; Sat, 06 Sep 2025 00:30:15 AEST
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJJfH6Gh4z3cfY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 00:30:13 +1000 (AEST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cJJf56Q90z9sTl;
	Fri,  5 Sep 2025 16:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757082605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ev4jgj8g0fTNZJltLUp+cJJPga8rWwR8rDlO94sZYmI=;
	b=wh9iY/QvbGvwg28pN/htEhvEiWKV2zp9ojU3BF39AiKc1X+fq9ANWtEHWntHkW4PY78st2
	vFbr3XsShutGe/ye/N/o0Ml/ynD+GZ53HefAP/7Py6wG/25KSrNK8wno1k3ss8ADPaEQHA
	itTsE27PiSnMDJtkkcqvIHLuLk+JdgJ6Xn2PEiB/Zum+sz2Icx8XZlNdknxu5K7OdFeuJf
	iv/2/U7zg7y7wcKEF2cRkJ4zckjRug7O5ftGKw1Bj1LfXjn2/RbEJDg7SaiUy5UKCGk8OZ
	ifUjqKIetJzWHMIXaCUGT7Q81iUxsqV9rrmbO0BHKMPMPLwtNQZ5vCKQKt9IEA==
Message-ID: <8918c4b9-5156-4b9a-83cb-d1d4856ae48d@mailbox.org>
Date: Fri, 5 Sep 2025 16:30:02 +0200
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
Subject: Re: [PATCH] powerpc/32: Remove PAGE_KERNEL_TEXT to fix startup
 failure
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andrew Donnellan <ajd@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org>
 <4b5e6eb281d7b1ea77619bee17095f905a125168.1757003584.git.christophe.leroy@csgroup.eu>
Content-Language: en-US, de-DE
From: Erhard Furtner <erhard_f@mailbox.org>
In-Reply-To: <4b5e6eb281d7b1ea77619bee17095f905a125168.1757003584.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 1ysqxpzg7idqdqmdink5xg9ag6hqs4sn
X-MBO-RS-ID: c4f9d3b81d940f5d21c
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 9/4/25 18:33, Christophe Leroy wrote:
> PAGE_KERNEL_TEXT is an old macro that is used to tell kernel whether
> kernel text has to be mapped read-only or read-write based on build
> time options.
> 
> But nowadays, with functionnalities like jump_labels, static links,
> etc ... more only less all kernels need to be read-write at some
> point, and some combinations of configs failed to work due to
> innacurate setting of PAGE_KERNEL_TEXT. On the other hand, today
> we have CONFIG_STRICT_KERNEL_RWX which implements a more controlled
> access to kernel modifications.
> 
> Instead of trying to keep PAGE_KERNEL_TEXT accurate with all
> possible options that may imply kernel text modification, always
> set kernel text read-write at startup and rely on
> CONFIG_STRICT_KERNEL_RWX to provide accurate protection.

I can confirm your patch fixes the startup failure for my G4 .config. 
Thanks!

Regards,
Erhard

> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Closes: https://lore.kernel.org/all/342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org/
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>   arch/powerpc/include/asm/pgtable.h | 12 ------------
>   arch/powerpc/mm/book3s32/mmu.c     |  4 ++--
>   arch/powerpc/mm/pgtable_32.c       |  2 +-
>   3 files changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index 93d77ad5a92f..d8f944a5a037 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -20,18 +20,6 @@ struct mm_struct;
>   #include <asm/nohash/pgtable.h>
>   #endif /* !CONFIG_PPC_BOOK3S */
>   
> -/*
> - * Protection used for kernel text. We want the debuggers to be able to
> - * set breakpoints anywhere, so don't write protect the kernel text
> - * on platforms where such control is possible.
> - */
> -#if defined(CONFIG_KGDB) || defined(CONFIG_XMON) || defined(CONFIG_BDI_SWITCH) || \
> -	defined(CONFIG_KPROBES) || defined(CONFIG_DYNAMIC_FTRACE)
> -#define PAGE_KERNEL_TEXT	PAGE_KERNEL_X
> -#else
> -#define PAGE_KERNEL_TEXT	PAGE_KERNEL_ROX
> -#endif
> -
>   /* Make modules code happy. We don't set RO yet */
>   #define PAGE_KERNEL_EXEC	PAGE_KERNEL_X
>   
> diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
> index be9c4106e22f..c42ecdf94e48 100644
> --- a/arch/powerpc/mm/book3s32/mmu.c
> +++ b/arch/powerpc/mm/book3s32/mmu.c
> @@ -204,7 +204,7 @@ int mmu_mark_initmem_nx(void)
>   
>   	for (i = 0; i < nb - 1 && base < top;) {
>   		size = bat_block_size(base, top);
> -		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
> +		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_X);
>   		base += size;
>   	}
>   	if (base < top) {
> @@ -215,7 +215,7 @@ int mmu_mark_initmem_nx(void)
>   				pr_warn("Some RW data is getting mapped X. "
>   					"Adjust CONFIG_DATA_SHIFT to avoid that.\n");
>   		}
> -		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
> +		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_X);
>   		base += size;
>   	}
>   	for (; i < nb; i++)
> diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
> index 15276068f657..0c9ef705803e 100644
> --- a/arch/powerpc/mm/pgtable_32.c
> +++ b/arch/powerpc/mm/pgtable_32.c
> @@ -104,7 +104,7 @@ static void __init __mapin_ram_chunk(unsigned long offset, unsigned long top)
>   	p = memstart_addr + s;
>   	for (; s < top; s += PAGE_SIZE) {
>   		ktext = core_kernel_text(v);
> -		map_kernel_page(v, p, ktext ? PAGE_KERNEL_TEXT : PAGE_KERNEL);
> +		map_kernel_page(v, p, ktext ? PAGE_KERNEL_X : PAGE_KERNEL);
>   		v += PAGE_SIZE;
>   		p += PAGE_SIZE;
>   	}


