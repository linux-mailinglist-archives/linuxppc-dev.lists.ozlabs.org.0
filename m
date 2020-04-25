Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5C51B8442
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 09:49:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498NTW2m55zDqGh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 17:49:03 +1000 (AEST)
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
 header.s=mail header.b=THusQfcD; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498NRW3DlkzDqGF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 17:47:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 498NRM5wK1z9txjP;
 Sat, 25 Apr 2020 09:47:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=THusQfcD; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uLdYTulUUgBJ; Sat, 25 Apr 2020 09:47:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 498NRM2vjLz9txjN;
 Sat, 25 Apr 2020 09:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587800831; bh=PqeD2DO3sbweUF9JsA7ETZbDEPz8S5WdPQqjMK+1FlY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=THusQfcDtHDAzJtFQp0biVe0+gqPX/L+K0WHt03JUZC26XXb60XIltzaDPK76G0Cv
 SZ6/nEhdpg8frAH1xO3egSiK2aVzHfMQRO9Oiw/HozBFpgsqb0sburLMBVpgVo+7JB
 XKox5i1T8BIabeHLSeXdBfSvq44aQv2vy4X/UJRI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E4408B768;
 Sat, 25 Apr 2020 09:47:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id x2EsSawdq0Fg; Sat, 25 Apr 2020 09:47:12 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C70BC8B752;
 Sat, 25 Apr 2020 09:47:11 +0200 (CEST)
Subject: Re: New powerpc vdso calling convention
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 binutils@sourceware.org
References: <1587790194.w180xsw5be.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <9371cac5-20bb-0552-2609-0d537f41fecd@c-s.fr>
Date: Sat, 25 Apr 2020 09:47:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587790194.w180xsw5be.astroid@bobo.none>
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
Cc: Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org,
 Andy Lutomirski <luto@kernel.org>, musl@lists.openwall.com,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, libc-dev@lists.llvm.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/04/2020 à 07:22, Nicholas Piggin a écrit :
> As noted in the 'scv' thread, powerpc's vdso calling convention does not
> match the C ELF ABI calling convention (or the proposed scv convention).
> I think we could implement a new ABI by basically duplicating function
> entry points with different names.

I think doing this is a real good idea.

I've been working at porting powerpc VDSO to the GENERIC C VDSO, and the 
main pitfall has been that our vdso calling convention is not compatible 
with C calling convention, so we have go through an ASM entry/exit.

See https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=171469

We should kill this error flag return through CR[SO] and get it the 
"modern" way like other architectectures implementing the C VDSO: return 
0 when successfull, return -err when failed.

> 
> The ELF v2 ABI convention would suit it well, because the caller already
> requires the function address for ctr, so having it in r12 will
> eliminate the need for address calculation, which suits the vdso data
> page access.
> 
> Is there a need for ELF v1 specific calls as well, or could those just be
> deprecated and remain on existing functions or required to use the ELF
> v2 calls using asm wrappers?

What's ELF v1 and ELF v2 ? Is ELF v1 what PPC32 uses ? If so, I'd say 
yes, it would be good to have it to avoid going through ASM in the middle.

> 
> Is there a good reason for the system call fallback to go in the vdso
> function rather than have the caller handle it?

I've seen at least one while porting powerpc to the C VDSO: arguments 
toward VDSO functions are in volatile registers. If the caller has to 
call the fallback by itself, it has to save them before calling the 
VDSO, allthought in 99% of cases it won't use them again. With the 
fallback called by the VDSO itself, the arguments are still hot in 
volatile registers and ready for calling the fallback. That make it very 
easy to call them, see patch 5 in the series 
(https://patchwork.ozlabs.org/project/linuxppc-dev/patch/59bea35725ab4cefc67a678577da8b3ab7771af5.1587401492.git.christophe.leroy@c-s.fr/)

> 
> Thanks,
> Nick
> 

Christophe
