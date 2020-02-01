Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE9814F8EA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Feb 2020 17:29:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48901G55m3zDqHF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2020 03:29:54 +1100 (AEDT)
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
 header.s=mail header.b=OND2aOfE; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488zyj5H0CzDqHd
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Feb 2020 03:27:39 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 488zyY576yz9vBmZ;
 Sat,  1 Feb 2020 17:27:33 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=OND2aOfE; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cOc3nVoSmWt8; Sat,  1 Feb 2020 17:27:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 488zyY3LN2z9vBmY;
 Sat,  1 Feb 2020 17:27:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580574453; bh=ZjmS/adFTgLgsg7zeCN7l9gy5WSfkM50nGalFqI61jU=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=OND2aOfEStqUhg9CLiDtWmwPWq3FmlU74CaysGCTUMcz0p1a48c2qlAmwAxt7MAQQ
 E265BrP4WfszNHtCemUVGjvXf5G2t1LHZmExnGWA733/QVFOZ423m52qO9DBQnzs0e
 YdVUZmhsiDqgEteMFdpWWdCCqfYLJk8o0SjKAFp4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 054808B78B;
 Sat,  1 Feb 2020 17:27:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id artbkuQxn9DU; Sat,  1 Feb 2020 17:27:34 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A0A648B752;
 Sat,  1 Feb 2020 17:27:34 +0100 (CET)
Subject: Re: [PATCH v2] powerpc/32s: Don't flush all TLBs when flushing one
 page
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <b30b2eae6960502eaf0d9e36c60820b839693c33.1580542939.git.christophe.leroy@c-s.fr>
Message-ID: <601bc775-6b51-c6c3-128e-ccd36d54f933@c-s.fr>
Date: Sat, 1 Feb 2020 17:27:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b30b2eae6960502eaf0d9e36c60820b839693c33.1580542939.git.christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/02/2020 à 09:04, Christophe Leroy a écrit :
> When flushing any memory range, the flushing function
> flushes all TLBs.
> 
> When (start) and (end - 1) are in the same memory page,
> flush that page instead.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>

> ---
> v2: Reworked the test as the previous one was always false (end - start was PAGE_SIZE - 1 for a single page)
> ---
>   arch/powerpc/mm/book3s32/tlb.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
> index 2fcd321040ff..724c0490fb17 100644
> --- a/arch/powerpc/mm/book3s32/tlb.c
> +++ b/arch/powerpc/mm/book3s32/tlb.c
> @@ -79,11 +79,14 @@ static void flush_range(struct mm_struct *mm, unsigned long start,
>   	int count;
>   	unsigned int ctx = mm->context.id;
>   
> +	start &= PAGE_MASK;
>   	if (!Hash) {
> -		_tlbia();
> +		if (end - start <= PAGE_SIZE)
> +			_tlbie(start);
> +		else
> +			_tlbia();
>   		return;
>   	}
> -	start &= PAGE_MASK;
>   	if (start >= end)
>   		return;
>   	end = (end - 1) | ~PAGE_MASK;
> 
