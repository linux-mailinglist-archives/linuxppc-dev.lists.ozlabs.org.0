Return-Path: <linuxppc-dev+bounces-11710-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11B5B43792
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 11:50:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHZV42rdtz2yrZ;
	Thu,  4 Sep 2025 19:50:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756979436;
	cv=none; b=GGbotY8ZlSJuMMZiLhdMB9HuMoyrp7ApWSzNxUfw753rfLOXHtWuE7ydPIfCSkcXpDRnQnI5gpbHWmzN5lEiwi2e59lNJLoX6xZvpdJZ8OD0oRcOwmYHCm/L4MCvdOh0hyUXBOgjt6BVedxDjIs+o7VaZZa2IWlFhL8Cwnd/OWbnv/V/+h+8Cz6qqCDo209mBwAW5tJQTg47TgSrC8oIh/cwHphFBYyXraHTHYfYrCzXs7JeDr50bvMTLjj8hcK5GXeElmuPOEyebTY+aB1ea9DSEaVOVycNC85fu5sdDJIZjA4w7v+ZLkYTh6pm0AivD36qz3cM+36P6W1XWaFtSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756979436; c=relaxed/relaxed;
	bh=i4u6Mu381p5jH8eD4ZzHyiz1fIrkqSakQkKnaMeMuZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndiG1pQwUwV5ZC91tKBUOVJEt1dMwDL/9IcstRaM9w5GPwZrajr6pnq0qH0x8pRw2GV0OxCXoqnfrGzVCC23bF50QYP2HoU4vhOqJSPKOL4qSmhUkRwxjuqE77t7bbP9+h58yTeHEUtYWNkM/np231z19PtlgmMhI+02+IXnGfpFfnR02qGJ4vJVOKFjQtetam0SMJ+CCGthJJnQH9cogMQQWdLcf9hAJqeANp0DmyBf3A40HTJchemtTd0sCL2KXiUlg9pXFEnfg6Kreo/t3WWly+KBxfdVz0HEBU5twXt3LOZsz1aRhT+PNPRZRNye6o7AAtp7cLFXyoSFasiuRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHZV32fZ0z2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 19:50:34 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cHXPv6szdz9sSb;
	Thu,  4 Sep 2025 10:16:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0bCBb93aCZt; Thu,  4 Sep 2025 10:16:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cHXPZ2N6dz9sSK;
	Thu,  4 Sep 2025 10:16:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C32C8B764;
	Thu,  4 Sep 2025 10:16:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id zHQ165OB1h7X; Thu,  4 Sep 2025 10:16:34 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 03CAE8B763;
	Thu,  4 Sep 2025 10:16:33 +0200 (CEST)
Message-ID: <97fc7eed-c67e-4b5e-90bb-93eb8dd058d7@csgroup.eu>
Date: Thu, 4 Sep 2025 10:16:33 +0200
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
Subject: Re: [PATCH 5.4 only v2] powerpc: boot: Remove leading zero in label
 in udelay()
To: Nathan Chancellor <nathan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20250903211158.2844032-1-nathan@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250903211158.2844032-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 03/09/2025 à 23:11, Nathan Chancellor a écrit :
> When building powerpc configurations in linux-5.4.y with binutils 2.43
> or newer, there is an assembler error in arch/powerpc/boot/util.S:
> 
>    arch/powerpc/boot/util.S: Assembler messages:
>    arch/powerpc/boot/util.S:44: Error: junk at end of line, first unrecognized character is `0'
>    arch/powerpc/boot/util.S:49: Error: syntax error; found `b', expected `,'
>    arch/powerpc/boot/util.S:49: Error: junk at end of line: `b'
> 
> binutils 2.43 contains stricter parsing of certain labels [1], namely
> that leading zeros are no longer allowed. The GNU assembler
> documentation already somewhat forbade this construct:
> 
>    To define a local label, write a label of the form 'N:' (where N
>    represents any non-negative integer).
> 
> Eliminate the leading zero in the label to fix the syntax error. This is
> only needed in linux-5.4.y because commit 8b14e1dff067 ("powerpc: Remove
> support for PowerPC 601") removed this code altogether in 5.10.
> 
> Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=226749d5a6ff0d5c607d6428d6c81e1e7e7a994b [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> v1 -> v2:
> - Adjust commit message to make it clearer this construct was already
>    incorrect under the existing GNU assembler documentation (Segher)
> 
> v1: https://lore.kernel.org/20250902235234.2046667-1-nathan@kernel.org/
> ---
>   arch/powerpc/boot/util.S | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/boot/util.S b/arch/powerpc/boot/util.S
> index f11f0589a669..5ab2bc864e66 100644
> --- a/arch/powerpc/boot/util.S
> +++ b/arch/powerpc/boot/util.S
> @@ -41,12 +41,12 @@ udelay:
>   	srwi	r4,r4,16
>   	cmpwi	0,r4,1		/* 601 ? */
>   	bne	.Ludelay_not_601
> -00:	li	r0,86	/* Instructions / microsecond? */
> +0:	li	r0,86	/* Instructions / microsecond? */
>   	mtctr	r0
>   10:	addi	r0,r0,0 /* NOP */
>   	bdnz	10b
>   	subic.	r3,r3,1
> -	bne	00b
> +	bne	0b
>   	blr
>   
>   .Ludelay_not_601:
> 
> base-commit: c25f780e491e4734eb27d65aa58e0909fd78ad9f


