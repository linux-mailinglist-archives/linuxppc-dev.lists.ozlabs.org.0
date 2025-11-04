Return-Path: <linuxppc-dev+bounces-13723-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0508C3057D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 10:50:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d13bL3nP9z3bfM;
	Tue,  4 Nov 2025 20:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762249806;
	cv=none; b=QzKoBXS0qy9KUxg/iek8i3Uh/Gd48bdayfjg3D8DulQRnJS17eU8hqPlbnj+mwxckJwVbtKHa084OamI8QAoWsAGJPbBQ6eQ5OO3pVf1NVvC1ou/CrYK23CEpSqyyTK5Zru2zCFSntqDvUwjtdAGQNrbMtSKLU2bVZGG9OCOqwv45FCiCJvt31yEPaFTDFFbvwKkmpD7wTmMfT9AxpSTamr6qXU2alouiZnEDB6sE2RO7DD+8wdA5OV2fVG2O9RQO1iK5Jk2KoPcE5SMpZDXeVw+W3p9PLVURyJ+wLlEv7ndaLGlLqCXjznga+6yAEOZzi3Rm2r2PhKf1Dh327JzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762249806; c=relaxed/relaxed;
	bh=4GtS4x692NPEW9+MDtm2ioXpevFCOQY/0t3+POpp6RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UbWATHPxKEvH+PYDD7Z0OAtXhrLim0S3tREuXMMbQBISpjKDisPm/wohcYY2SsO0yTNHGNdVtQMw0DNnw68deUZgjfPk5omSXFviUwoSZoFgZWCJ3xvel4R7l/UDTfz+2FpZSCfhDRaNlHwxpLv1VH2+XjSp97pGD+SZmcBLn+m+W4Y07HqUhGqfke361TwgUr5P8dDn1w71iQkFd6e/hsBqsARcH7U6hgse1I2VcLQPHYtuxTX24AZHhV/BQC5cTKHuYiNhbvtBZCN+i3hc7ZXU8FB22SCD+4zqCCKlUCR8sLJilKfFKwP8KYISYfGhZfDiazBhQYuaSsL5kpvL2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d13bK4YZqz3bf3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 20:50:04 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d13FH6vZyz9sVR;
	Tue,  4 Nov 2025 10:34:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id laIYIGViDX2r; Tue,  4 Nov 2025 10:34:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d13FH69Hjz9sVP;
	Tue,  4 Nov 2025 10:34:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BFF658B76C;
	Tue,  4 Nov 2025 10:34:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9X6PeMXL02Sz; Tue,  4 Nov 2025 10:34:27 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 13B0A8B763;
	Tue,  4 Nov 2025 10:34:27 +0100 (CET)
Message-ID: <3115e03a-1995-46f4-a902-47ba3cb99901@csgroup.eu>
Date: Tue, 4 Nov 2025 10:34:26 +0100
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
Subject: Re: [PATCH] powerpc/cputable: Use pointer from memcpy() call for
 assignment in set_cur_cpu_spec()
To: Markus Elfring <Markus.Elfring@web.de>, linuxppc-dev@lists.ozlabs.org,
 Dmitry Vyukov <dvyukov@google.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>
References: <6c61cf90-5811-4450-b649-7a2c84584ee9@web.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <6c61cf90-5811-4450-b649-7a2c84584ee9@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 30/10/2025 à 21:15, Markus Elfring a écrit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 30 Oct 2025 21:10:11 +0100
> 
> A pointer was assigned to a variable. The same pointer was used for
> the destination parameter of a memcpy() call.
> This function is documented in the way that the same value is returned.
> Thus convert two separate statements into a direct variable assignment for
> the return value from a memory copy action.

I can't see the added value of this change. For me it degrades 
readability. Many places in cputable.c have that t = PTRRELOC(t) 
pattern, I can't see why that one should be changed while other ones remain.

Can you elaborate why this change is desirable ?

Thanks
Christophe

> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   arch/powerpc/kernel/cputable.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
> index 6f6801da9dc1..a69ea88b780f 100644
> --- a/arch/powerpc/kernel/cputable.c
> +++ b/arch/powerpc/kernel/cputable.c
> @@ -34,12 +34,11 @@ void __init set_cur_cpu_spec(struct cpu_spec *s)
>   {
>   	struct cpu_spec *t = &the_cpu_spec;
>   
> -	t = PTRRELOC(t);
>   	/*
>   	 * use memcpy() instead of *t = *s so that GCC replaces it
>   	 * by __memcpy() when KASAN is active
>   	 */
> -	memcpy(t, s, sizeof(*t));
> +	t = memcpy(PTRRELOC(t), s, sizeof(*t));
>   
>   	*PTRRELOC(&cur_cpu_spec) = &the_cpu_spec;
>   }


