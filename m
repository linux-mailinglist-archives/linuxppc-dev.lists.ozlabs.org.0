Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC29C628116
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 14:17:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9qcL4qHFz3cK9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 00:17:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9qbp4GlVz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 00:17:23 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4N9qbf2gHzz9spk;
	Mon, 14 Nov 2022 14:17:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2O5T-nK_uqQ0; Mon, 14 Nov 2022 14:17:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4N9qbf1sh1z9spf;
	Mon, 14 Nov 2022 14:17:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F63D8B76C;
	Mon, 14 Nov 2022 14:17:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 1d5Xc0h4vh-T; Mon, 14 Nov 2022 14:17:18 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0D5C38B763;
	Mon, 14 Nov 2022 14:17:18 +0100 (CET)
Message-ID: <4ed43222-17b0-8355-f836-adabb453e432@csgroup.eu>
Date: Mon, 14 Nov 2022 14:17:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] powerpc/xmon: Fix array_size.cocci warning
Content-Language: fr-FR
To: wangkailong@jari.cn, mpe@ellerman.id.au, npiggin@gmail.com,
 Julia.Lawall@inria.fr, joel@jms.id.au
References: <6432107b.12b.1847043884e.Coremail.wangkailong@jari.cn>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <6432107b.12b.1847043884e.Coremail.wangkailong@jari.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/11/2022 à 10:13, wangkailong@jari.cn a écrit :
> Fix the following coccicheck warning:
> 
> arch/powerpc/xmon/ppc-opc.c:957:67-68: WARNING: Use ARRAY_SIZE
> arch/powerpc/xmon/ppc-opc.c:7280:24-25: WARNING: Use ARRAY_SIZE
> arch/powerpc/xmon/ppc-opc.c:6972:25-26: WARNING: Use ARRAY_SIZE
> arch/powerpc/xmon/ppc-opc.c:7211:21-22: WARNING: Use ARRAY_SIZE
> 
> Signed-off-by: KaiLong Wang <wangkailong@jari.cn>

This code is copied from Binutils.

This change has been rejected several times already.

See 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20181004171036.GA1907@embeddedor.com/#2006148

Christophe


> ---
>   arch/powerpc/xmon/ppc-opc.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/xmon/ppc-opc.c b/arch/powerpc/xmon/ppc-opc.c
> index 0774d711453e..ad64c2709757 100644
> --- a/arch/powerpc/xmon/ppc-opc.c
> +++ b/arch/powerpc/xmon/ppc-opc.c
> @@ -954,9 +954,7 @@ const struct powerpc_operand powerpc_operands[] =
>     { 0xff, 11, NULL, NULL, PPC_OPERAND_SIGNOPT },
>   };
>   
> -const unsigned int num_powerpc_operands = (sizeof (powerpc_operands)
> -					   / sizeof (powerpc_operands[0]));
> -
> +const unsigned int num_powerpc_operands = ARRAY_SIZE(powerpc_operands);
>   /* The functions used to insert and extract complicated operands.  */
>   
>   /* The ARX, ARY, RX and RY operands are alternate encodings of GPRs.  */
> @@ -6968,8 +6966,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
>   {"fcfidu.",	XRC(63,974,1),	XRA_MASK, POWER7|PPCA2,	PPCVLE,		{FRT, FRB}},
>   };
>   
> -const int powerpc_num_opcodes =
> -  sizeof (powerpc_opcodes) / sizeof (powerpc_opcodes[0]);
> +const int powerpc_num_opcodes = ARRAY_SIZE(powerpc_opcodes);
>   
>   /* The VLE opcode table.
>   
> @@ -7207,8 +7204,7 @@ const struct powerpc_opcode vle_opcodes[] = {
>   {"se_bl",	BD8(58,0,1),	BD8_MASK,	PPCVLE,	0,		{B8}},
>   };
>   
> -const int vle_num_opcodes =
> -  sizeof (vle_opcodes) / sizeof (vle_opcodes[0]);
> +const int vle_num_opcodes = ARRAY_SIZE(vle_opcodes);
>   
>   /* The macro table.  This is only used by the assembler.  */
>   
> @@ -7276,5 +7272,4 @@ const struct powerpc_macro powerpc_macros[] = {
>   {"e_clrlslwi",4, PPCVLE, "e_rlwinm %0,%1,%3,(%2)-(%3),31-(%3)"},
>   };
>   
> -const int powerpc_num_macros =
> -  sizeof (powerpc_macros) / sizeof (powerpc_macros[0]);
> +const int powerpc_num_macros = ARRAY_SIZE(powerpc_macros);
