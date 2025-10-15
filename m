Return-Path: <linuxppc-dev+bounces-12912-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C55EBDDF23
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 12:20:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmnCB0Jb5z3d3Z;
	Wed, 15 Oct 2025 21:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760523605;
	cv=none; b=SaeC8dBN+6dM7/nPFT+ootIds6soJAJPIUkE3UarpNVXBjtrUWsYojlLyi8mdOqmlm0yI2gzsIMf1wCa+JHFIF62Nc+aUmpcxLVXzXEaou3HT7GG3kLK2zsn+SB3BtFve4nqYjtvmG5edlWGgtKDbQZyZzvepUHLY/Y0EpaqvEIU2GoYyfpknXcwuyE7lfGpdFnofrKZ5sjO0QyNxw9v4P942/F2hG1FnCYPXjYvEr29xe5hPNli9AgkqGWdOUDCgVKw6Z7Jw0lch/GpyTfDXgcj96TUaVFYMBUG1A8UshBKzUNOTUkRs3cFiqMkP8HobRQ5z1R68MSx/XllCbW0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760523605; c=relaxed/relaxed;
	bh=HQxjRN8XshWIAZdodI03Uo9H7aqnjsZvMomhRRxw7RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fve7gKtD/I+3g8lRlg9et+YlYNB3j3lOFgrcTGysrnxUUt1bdAp/iYBqjdRFrMeSqTunE+8pVx4RqW9DyyFYkkIluPvs55h6LL4xPLK7xOo0QVEdfW1Ll79cYM0AtS/xXxQkKAMKwz6pQ4aESTDQM1tYrdajIivM3c/MqY6/lrt7DVbXzDlUMyqzNbslPKxzW8J2DJ4nOt1Ng+yK/t29XYmOZjGjPn3iUFiVea2eU+Kx8Rq0hEwatqilC8XsyX9l7Q9S+iIUIkFUfQr5qOUgE12qvg9yO+4Zj3JFL1ZD6ugItN/rRwkf3K1Q1EEGEwKZ42dB9vF5JA9xqOTIZA0dww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmnC91N7sz3cnk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 21:20:04 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cmmbB2SqLz9sRy;
	Wed, 15 Oct 2025 11:52:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHclDKs4a-fH; Wed, 15 Oct 2025 11:52:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cmmbB1cLxz9sRk;
	Wed, 15 Oct 2025 11:52:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 11C7C8B768;
	Wed, 15 Oct 2025 11:52:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id IgMRS4_jinip; Wed, 15 Oct 2025 11:52:22 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 863738B763;
	Wed, 15 Oct 2025 11:52:21 +0200 (CEST)
Message-ID: <963c1cbf-0d81-487a-8c79-15de46c2865d@csgroup.eu>
Date: Wed, 15 Oct 2025 11:52:21 +0200
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
Subject: Re: [PATCH] powerpc: kgdb: Remove OUTBUFMAX constant
To: =?UTF-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com
References: <20250915141808.146695-1-mikisabate@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250915141808.146695-1-mikisabate@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 15/09/2025 à 16:18, Miquel Sabaté Solà a écrit :
> [Vous ne recevez pas souvent de courriers de mikisabate@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> This constant was introduced in commit 17ce452f7ea3 ("kgdb, powerpc:
> arch specific powerpc kgdb support"), but it is no longer used anywhere
> in the source tree.
> 
> Signed-off-by: Miquel Sabaté Solà <mikisabate@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/include/asm/kgdb.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/kgdb.h b/arch/powerpc/include/asm/kgdb.h
> index 715c18b75334..4c0afde87e97 100644
> --- a/arch/powerpc/include/asm/kgdb.h
> +++ b/arch/powerpc/include/asm/kgdb.h
> @@ -25,7 +25,6 @@
> 
>   #define BREAK_INSTR_SIZE       4
>   #define BUFMAX                 ((NUMREGBYTES * 2) + 512)
> -#define OUTBUFMAX              ((NUMREGBYTES * 2) + 512)
> 
>   #define BREAK_INSTR            0x7d821008      /* twge r2, r2 */
> 
> --
> 2.51.0
> 


