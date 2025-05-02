Return-Path: <linuxppc-dev+bounces-8257-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F30AA70E1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 13:50:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zpq4Q1QlGz30Tf;
	Fri,  2 May 2025 21:50:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746186646;
	cv=none; b=lBbg2X+IiNSzjV77SMcI8r1SRm+Y3dekQUvLYjXvHL6Nl4eFq07kEevjuZHrJcexBCdOPmCCi9kQNg+aOARPN3GvgwZOjB6lcStm0B5dr4kHkFkmTtr3L9YvhnfZK/hQc3NeRbhL+y8BfLX1o96H1c8tcCht9UyfzxuuF2Tz2sNISLgKRwWqBtY0MTJHZ0J7yrgBXCfcxew6TdbcdgPiaEnb5tu+ldMEbt8D9QgJIgpSEhmbg6ml10wqoNFFIImWkrQOeSilfkbaXWSfjaziQ6F6KbnXqTGqkwLYYy05e76APpx+C5Qsftj6X+1go7TvGCWkIS0bAAXVGpsYkWM0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746186646; c=relaxed/relaxed;
	bh=RnvHg4Gbp7SSMGBbXzlh1n5Vkm0MIF4s6ehhoaluIfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WoOfAWzVBvFsZxS0J9swgqY7pmhpSrbNPP9EZMVYgUjIzm8dM5fUAAOR+w+6wYqTj7dB16mmO4i77ijpNaNibZDVYpTXDgsHzHp3m37JeUT103IUqvM8Y847kSfiHIRbnWqt5cthcAGzoLYG6K+kHhVY07lIMGpim7NToaMDXfnvM8vUO6UjckD7dFr9GlICeUjaR4MyUc/+3ZYTPn03MCmefSQ+9xYmUGOpI4jwL2XbyIfe43ehuskbJpexpxtujnI+0s+KiUj3yyR8zxwiYt+G2nvv0A/B/20p3nn2nNJFW4Q+jc5Qb3jY13VtKttik8di2YffECTXcj58/HmLtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zpq4P3xTQz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 21:50:45 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Zpmpc6ghbz9sYQ;
	Fri,  2 May 2025 12:08:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a1XLOGcz6JIo; Fri,  2 May 2025 12:08:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Zpmpb63Bmz9sXD;
	Fri,  2 May 2025 12:08:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C9B038B765;
	Fri,  2 May 2025 12:08:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nj_9Cp3iwI3i; Fri,  2 May 2025 12:08:39 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5C2ED8B763;
	Fri,  2 May 2025 12:08:39 +0200 (CEST)
Message-ID: <ff07d507-faaf-4565-9343-bb4a18a8410a@csgroup.eu>
Date: Fri, 2 May 2025 12:08:39 +0200
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
Subject: Re: [PATCH 2/6] powerpc/xmon: fix sparse warning "Using plain integer
 as NULL pointer"
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
Cc: npiggin@gmail.com, naveen@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20250422131040.374427-1-maddy@linux.ibm.com>
 <20250422131040.374427-3-maddy@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250422131040.374427-3-maddy@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/04/2025 à 15:10, Madhavan Srinivasan a écrit :
> Fix passing of argument 0 to NULL to avoid sparse warning

I thought we wanted to keep this file in sync with opcodes/ppc-opc.c in 
the binutils repository.

Are you sure you want to do such manual change ? Shouldn't the change 
first be done in binutils then backported in linux kernel ?

Christophe

> 
> Cleans up sparse warning:
> arch/powerpc/xmon/ppc-opc.c:797:15: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:797:18: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:801:15: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:801:18: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:805:14: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:805:17: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:809:16: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:809:19: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:863:15: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:863:18: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:868:15: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:868:18: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:872:15: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:872:18: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:875:15: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:875:18: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:878:15: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:878:18: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:881:14: warning: Using plain integer as NULL pointer
> arch/powerpc/xmon/ppc-opc.c:881:17: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>   arch/powerpc/xmon/ppc-opc.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/xmon/ppc-opc.c b/arch/powerpc/xmon/ppc-opc.c
> index 0774d711453e..b4ca7eb8d765 100644
> --- a/arch/powerpc/xmon/ppc-opc.c
> +++ b/arch/powerpc/xmon/ppc-opc.c
> @@ -794,19 +794,19 @@ const struct powerpc_operand powerpc_operands[] =
>   #define PSWM WS + 1
>     /* The BO16 field in a BD8 form instruction.  */
>   #define BO16 PSWM
> -  {  0x1, 10, 0, 0, 0 },
> +  {  0x1, 10, NULL, NULL, 0 },
>   
>     /* IDX bits for quantization in the pair singles instructions.  */
>   #define PSQ PSWM + 1
> -  {  0x7, 12, 0, 0, 0 },
> +  {  0x7, 12, NULL, NULL, 0 },
>   
>     /* IDX bits for quantization in the pair singles x-type instructions.  */
>   #define PSQM PSQ + 1
> -  {  0x7, 7, 0, 0, 0 },
> +  {  0x7, 7, NULL, NULL, 0 },
>   
>     /* Smaller D field for quantization in the pair singles instructions.  */
>   #define PSD PSQM + 1
> -  {  0xfff, 0, 0, 0,  PPC_OPERAND_PARENS | PPC_OPERAND_SIGNED },
> +  {  0xfff, 0, NULL, NULL,  PPC_OPERAND_PARENS | PPC_OPERAND_SIGNED },
>   
>     /* The L field in an mtmsrd or A form instruction or R or W in an X form.  */
>   #define A_L PSD + 1
> @@ -860,25 +860,25 @@ const struct powerpc_operand powerpc_operands[] =
>     /* Xilinx APU related masks and macros */
>   #define FCRT XFL_L + 1
>   #define FCRT_MASK (0x1f << 21)
> -  { 0x1f, 21, 0, 0, PPC_OPERAND_FCR },
> +  { 0x1f, 21, NULL, NULL, PPC_OPERAND_FCR },
>   
>     /* Xilinx FSL related masks and macros */
>   #define FSL FCRT + 1
>   #define FSL_MASK (0x1f << 11)
> -  { 0x1f, 11, 0, 0, PPC_OPERAND_FSL },
> +  { 0x1f, 11, NULL, NULL, PPC_OPERAND_FSL },
>   
>     /* Xilinx UDI related masks and macros */
>   #define URT FSL + 1
> -  { 0x1f, 21, 0, 0, PPC_OPERAND_UDI },
> +  { 0x1f, 21, NULL, NULL, PPC_OPERAND_UDI },
>   
>   #define URA URT + 1
> -  { 0x1f, 16, 0, 0, PPC_OPERAND_UDI },
> +  { 0x1f, 16, NULL, NULL, PPC_OPERAND_UDI },
>   
>   #define URB URA + 1
> -  { 0x1f, 11, 0, 0, PPC_OPERAND_UDI },
> +  { 0x1f, 11, NULL, NULL, PPC_OPERAND_UDI },
>   
>   #define URC URB + 1
> -  { 0x1f, 6, 0, 0, PPC_OPERAND_UDI },
> +  { 0x1f, 6, NULL, NULL, PPC_OPERAND_UDI },
>   
>     /* The VLESIMM field in a D form instruction.  */
>   #define VLESIMM URC + 1


