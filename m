Return-Path: <linuxppc-dev+bounces-11764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5BCB44E3F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 08:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ6Rx5Q9Qz30gC;
	Fri,  5 Sep 2025 16:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757055037;
	cv=none; b=iU5LSQJ+QBeNWELTer7QgWWsfZjJht6DQ1NxZCqpxyzr4nWbXHYePThhQoLEFqkNuob6UNAeXAo5g0JeB5i4XzQILQfjZ+Sodo7CDDMAvW/Fh7fNTaR3JbGishH0gZpNUr+DXi1DAOb9UqDsVJQ7tVl+Jz3wOPvcNJwLeP8giceq5ELsO52hVyzUWyhS6teClMiPtV/8zN9PG+5yvGbGHQPSqkDvUwRwajU06q1a4Ue6EV4aUoqvQdPPydEKou8k+dTZvMyRZlX8WjXS6fnEtYJU795pK/7hzsEUFgBFFZgg3N/FaMg6UbIvGabxN2TNheXLBdztZh5huddmZ6azHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757055037; c=relaxed/relaxed;
	bh=4G8qe/t2Od2Im8xcs0TdWexbgGBkdzrBoBQ6DoYYDpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtP5R8nkUBdA2ms8OBrvFTMy6z/+mMcoBTcpjA/iQjupQRgZZoVPpPc2n4WTFTKVGypKxVQletztkYDlFX7u4WdQSRnSBafFD3/PH374Hp3oCUgXdculJDniWY/9Tg5Hs+qZdLnpZFW8GXlkL/pHT2O7odIzKupP2o6OzWiIDtZRJrmujmU9hbID2y+KEYu7GNK9nYuGZTzzvfi8wwirTgSuopFddZBXTxtNoBv2OoGfaMafh1ktcJTUdw8rQlGT3SKlOpCyUlaKFa25LOJOBnW4hnApqlbu5V8pqhSqDNVqwaHbMvEQ9CLDRlX1RUEb5ILA3xi9VkHqFL7C9Qwq8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ6Rw1pKqz2yrq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 16:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cJ65k1X18z9sTK;
	Fri,  5 Sep 2025 08:34:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QkaZACxuTBVl; Fri,  5 Sep 2025 08:34:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cJ65k0CPrz9sSn;
	Fri,  5 Sep 2025 08:34:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E49BE8B774;
	Fri,  5 Sep 2025 08:34:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kngpVvztOs83; Fri,  5 Sep 2025 08:34:49 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4FACE8B773;
	Fri,  5 Sep 2025 08:34:49 +0200 (CEST)
Message-ID: <c841e220-9ab4-400f-bb9a-18c6981488d9@csgroup.eu>
Date: Fri, 5 Sep 2025 08:34:49 +0200
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
Subject: Re: [PATCH RFC] powerpc: Panic on jump label code patching failure
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com
Cc: npiggin@gmail.com, rostedt@goodmis.org, ardb@kernel.org,
 Erhard Furtner <erhard_f@mailbox.org>
References: <20250905061135.1451362-1-ajd@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250905061135.1451362-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 05/09/2025 à 08:11, Andrew Donnellan a écrit :
> If patch_branch() or patch_instruction() fails while updating a jump
> label, we presently fail silently, leading to unpredictable behaviour
> later on.
> 
> Change arch_jump_label_transform() to panic on a code patching failure,
> matching the existing behaviour of arch_static_call_transform().
> 
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>

checkpatch.pl is not happy:

WARNING: Use lore.kernel.org archive links when possible - see 
https://lore.kernel.org/lists.html
#131:
   <https://lists.ozlabs.org/pipermail/linuxppc-dev/>

WARNING: Reported-by: should be immediately followed by Closes: with a 
URL to the report
#173:
Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

total: 0 errors, 2 warnings, 0 checks, 16 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

/home/chleroy/Téléchargements/RFC-powerpc-Panic-on-jump-label-code-patching-failure.patch 
has style problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.

> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> 
> ---
> 
> Ran into this while debugging an issue that Erhard reported to me about my
> PAGE_TABLE_CHECK series on a G4, where updating a static key failed
> silently, but only for one call site, leading to an incorrect reference
> count later on. This looks to be due to the issue fixed in [0]. A loud
> failure would have saved us all considerable debugging time.
> 
> Should I change the return type of arch_jump_label_transform() and handle
> this in an arch-independent way? Are there other users of code patching
> in powerpc that ought to be hardened?whon

I think all callers of patch_branch() and patch_instruction() should 
check returned value. Several already do. I think we should fix the ones 
which don't then make patch_branch() and patch_instruction() __must_check

> 
> Or is this excessive?
> 
> [0] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/4b5e6eb281d7b1ea77619bee17095f905a125168.1757003584.git.christophe.leroy@csgroup.eu/
> ---
>   arch/powerpc/kernel/jump_label.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/jump_label.c b/arch/powerpc/kernel/jump_label.c
> index 2659e1ac8604..80d41ed7ac50 100644
> --- a/arch/powerpc/kernel/jump_label.c
> +++ b/arch/powerpc/kernel/jump_label.c
> @@ -12,9 +12,14 @@ void arch_jump_label_transform(struct jump_entry *entry,
>   			       enum jump_label_type type)
>   {
>   	u32 *addr = (u32 *)jump_entry_code(entry);
> +	int err;
>   
>   	if (type == JUMP_LABEL_JMP)
> -		patch_branch(addr, jump_entry_target(entry), 0);
> +		err = patch_branch(addr, jump_entry_target(entry), 0);
>   	else
> -		patch_instruction(addr, ppc_inst(PPC_RAW_NOP()));
> +		err = patch_instruction(addr, ppc_inst(PPC_RAW_NOP()));
> +
> +	if (err)
> +		panic("%s: patching failed, err %d, type %d, addr %pS, target %pS\n",
> +		      __func__, err, type, addr, (void *)jump_entry_target(entry));
>   }


