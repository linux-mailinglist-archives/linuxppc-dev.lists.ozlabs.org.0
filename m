Return-Path: <linuxppc-dev+bounces-10448-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F39A6B158DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 08:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsMXP0xfYz2xnM;
	Wed, 30 Jul 2025 16:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753856437;
	cv=none; b=U163LaC97E9BoPCJzNPJIvVBtYSM0zo1PsPgVEFuLiOtFuBvjBOLJePsJzKtH071bnogc+LUvJp8gxLVDjxlg7r5rAdu4uuy8VaX94ome8PXK/lA0JMEf4x11UNvaF1BPgHhiIbF6n5Wm2+W2ZHqcTOUIKy/C+Uje9vupV3SsAgj73/OYAFjl7uyTsl/Pn4Vhbqt3xgqHA3/625KAi/1WcChh3gh0Nq9/n7ywEx16DlwgqOxG1QeuubIa5c0mPbiLKpMyLlhw2TTrMEwGFuN8IJic+hYelN8NQkHNgxztrL0QWVR3p3YYNMeAYg/4PvY5VPZBDZ7ClBHkpSl8ihhaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753856437; c=relaxed/relaxed;
	bh=HzjFcEj11408tBrp57f55Lr96MMAjcc+JloWTuuMHnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJjzmZGs0pWyCvxkKFoGCQYihzZ2PErYdjEF/nqIsDvhXB+/vzEfwaf23GCTMKboiB2BuMp+WyPLEjPnKlEDVc32rolzxSsTNGIzKy5zICRPELXR+MITFwF/IcitAisDhYVL+AD80T9vECUR0fhJXiY0c+LE/VWm7hjMe2+epbzfE1KrbC/njBjM3/PzStOOQhAicNEcWSbWml7QGHJFxUHoPD8Jg5FJxGhnDQ4T73PzphmPsn13W5Sxhrdk/JQdjcXKkl0xquD94EPaNG2I4S6OvOV3kM24pBGEghScMAMgfCXghkZOxmqNse9ipNqGOww63+T/Hvv3j3nDH21juw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsMXN3GhHz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 16:20:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsMNp07k8z9sWd;
	Wed, 30 Jul 2025 08:14:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w5y7WMXPOvjy; Wed, 30 Jul 2025 08:14:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsMNn674Yz9sWb;
	Wed, 30 Jul 2025 08:14:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C64558B76C;
	Wed, 30 Jul 2025 08:14:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 8syPEqNjGyEp; Wed, 30 Jul 2025 08:14:01 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9EAEE8B763;
	Wed, 30 Jul 2025 08:14:01 +0200 (CEST)
Message-ID: <62aa5231-ed31-43e2-84b7-d6b6ec86e78d@csgroup.eu>
Date: Wed, 30 Jul 2025 08:14:01 +0200
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
Subject: Re: [PATCH] powerpc/xmon: replace sizeof calculations with ARRAY_SIZE
 macro
To: Ruben Wauters <rubenru09@aol.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20250719225225.2132-2-rubenru09.ref@aol.com>
 <20250719225225.2132-2-rubenru09@aol.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250719225225.2132-2-rubenru09@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 20/07/2025 à 00:43, Ruben Wauters a écrit :
> [Vous ne recevez pas souvent de courriers de rubenru09@aol.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> The calculations for operand/opcode/macro numbers are done in an
> identical manner to the already existing ARRAY_SIZE macro in
> linux/array_size.h
> 
> This patch replaces the sizeof calculations with the macro to make the
> code cleaner and more immediately obvious what it is doing.
> 
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> ---
>   arch/powerpc/xmon/ppc-opc.c | 16 ++++++----------

This file is mostly taken from binutils, refer commit 08d96e0b127e 
("powerpc/xmon: Apply binutils changes to upgrade disassembly").

I think your change should be done in binutils then backported to the 
kernel. The more we diverge from binutils the worse it is.

Christophe


>   1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/xmon/ppc-opc.c b/arch/powerpc/xmon/ppc-opc.c
> index 0774d711453e..de9b4236728c 100644
> --- a/arch/powerpc/xmon/ppc-opc.c
> +++ b/arch/powerpc/xmon/ppc-opc.c
> @@ -954,8 +954,7 @@ const struct powerpc_operand powerpc_operands[] =
>     { 0xff, 11, NULL, NULL, PPC_OPERAND_SIGNOPT },
>   };
> 
> -const unsigned int num_powerpc_operands = (sizeof (powerpc_operands)
> -                                          / sizeof (powerpc_operands[0]));
> +const unsigned int num_powerpc_operands = ARRAY_SIZE(powerpc_operands);
> 
>   /* The functions used to insert and extract complicated operands.  */
> 
> @@ -6968,9 +6967,8 @@ const struct powerpc_opcode powerpc_opcodes[] = {
>   {"fcfidu.",    XRC(63,974,1),  XRA_MASK, POWER7|PPCA2, PPCVLE,         {FRT, FRB}},
>   };
> 
> -const int powerpc_num_opcodes =
> -  sizeof (powerpc_opcodes) / sizeof (powerpc_opcodes[0]);
> -
> +const int powerpc_num_opcodes = ARRAY_SIZE(powerpc_opcodes);
> +
>   /* The VLE opcode table.
> 
>      The format of this opcode table is the same as the main opcode table.  */
> @@ -7207,9 +7205,8 @@ const struct powerpc_opcode vle_opcodes[] = {
>   {"se_bl",      BD8(58,0,1),    BD8_MASK,       PPCVLE, 0,              {B8}},
>   };
> 
> -const int vle_num_opcodes =
> -  sizeof (vle_opcodes) / sizeof (vle_opcodes[0]);
> -
> +const int vle_num_opcodes = ARRAY_SIZE(vle_opcodes);
> +
>   /* The macro table.  This is only used by the assembler.  */
> 
>   /* The expressions of the form (-x ! 31) & (x | 31) have the value 0
> @@ -7276,5 +7273,4 @@ const struct powerpc_macro powerpc_macros[] = {
>   {"e_clrlslwi",4, PPCVLE, "e_rlwinm %0,%1,%3,(%2)-(%3),31-(%3)"},
>   };
> 
> -const int powerpc_num_macros =
> -  sizeof (powerpc_macros) / sizeof (powerpc_macros[0]);
> +const int powerpc_num_macros = ARRAY_SIZE(powerpc_macros);
> --
> 2.49.1
> 


