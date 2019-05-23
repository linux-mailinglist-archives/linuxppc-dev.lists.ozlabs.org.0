Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1D5276E8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 09:28:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458h1W2jy0zDqXC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 17:28:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="dDhplhtn"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458h04332qzDqWm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 17:27:00 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 458gzy1zmFz9v23W;
 Thu, 23 May 2019 09:26:54 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=dDhplhtn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id r_mYKpjo8VNy; Thu, 23 May 2019 09:26:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 458gzy033Rz9v23V;
 Thu, 23 May 2019 09:26:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558596414; bh=y0ndvATBuFeBuD1aCpeFBhYVI+2u7k6MGm7Va98zHq8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dDhplhtnXkzFY/ATEefKFa2nsAnGJkFilJI74ov27kmHlMUaYVqU2Yxn1PJggw1Vj
 FkFqdInH5+TEbZ+tQDPPc0vCpF9mximrMFysWuEUbDnaXQ7f06B4xd7JakVWPonEGa
 wdcYmuMjpWQyeXrTcfQbk+m6N0tQz5rFZ/nS/qV4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 032218B77D;
 Thu, 23 May 2019 09:26:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mYH4J9Ejz9ZD; Thu, 23 May 2019 09:26:54 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0E6578B75A;
 Thu, 23 May 2019 09:26:54 +0200 (CEST)
Subject: Re: [PATCH] powerpc/powernv: fix variable "c" set but not used
To: Qian Cai <cai@lca.pw>, benh@kernel.crashing.org, paulus@samba.org,
 mpe@ellerman.id.au
References: <20190523023141.2973-1-cai@lca.pw>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <d0512822-ca22-75ec-3dd9-1024001632f5@c-s.fr>
Date: Thu, 23 May 2019 09:26:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523023141.2973-1-cai@lca.pw>
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/05/2019 à 04:31, Qian Cai a écrit :
> The commit 58629c0dc349 ("powerpc/powernv/npu: Fault user page into the
> hypervisor's pagetable") introduced a variable "c" to be used in
> __get_user() and __get_user_nocheck() which need to stay as macros for
> performance reasons, and "c" is not actually used in
> pnv_npu2_handle_fault(),
> 
> arch/powerpc/platforms/powernv/npu-dma.c: In function 'pnv_npu2_handle_fault':
> arch/powerpc/platforms/powernv/npu-dma.c:1122:7: warning: variable 'c'
> set but not used [-Wunused-but-set-variable]
> 
> Fixed it by appending the __maybe_unused attribute, so compilers would
> ignore it.

You are not fixing the problem, you are just hiding it.

If the result of __get_user() is unneeded, it means __get_user() is not 
the good function to use.

Should use fault_in_pages_readable() instead.

A similar warning was fixed in commit 9f9eae5ce717 ("powerpc/kvm: Prefer 
fault_in_pages_readable function")

See 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/powerpc?id=9f9eae5ce

> 
> Signed-off-by: Qian Cai <cai@lca.pw>

You should add a Fixes: tag

58629c0dc349 ("powerpc/powernv/npu: Fault user page into the 
hypervisor's pagetable")

Christophe

> ---
>   arch/powerpc/platforms/powernv/npu-dma.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
> index 495550432f3d..5bbe59573ee6 100644
> --- a/arch/powerpc/platforms/powernv/npu-dma.c
> +++ b/arch/powerpc/platforms/powernv/npu-dma.c
> @@ -1119,7 +1119,8 @@ int pnv_npu2_handle_fault(struct npu_context *context, uintptr_t *ea,
>   	int i, is_write;
>   	struct page *page[1];
>   	const char __user *u;
> -	char c;
> +	/* To silence a -Wunused-but-set-variable warning. */
> +	char c __maybe_unused;
>   
>   	/* mmap_sem should be held so the struct_mm must be present */
>   	struct mm_struct *mm = context->mm;
> 
