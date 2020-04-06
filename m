Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A20AF19FD81
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 20:51:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x04X1BcKzDqxX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 04:51:24 +1000 (AEST)
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
 header.s=mail header.b=Tnve/r/w; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wzLm5RbBzDqfD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 04:18:39 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wzLg3hsJz9v0BM;
 Mon,  6 Apr 2020 20:18:35 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Tnve/r/w; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sh5LVu4Zz_PJ; Mon,  6 Apr 2020 20:18:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wzLg2H6kz9v0BL;
 Mon,  6 Apr 2020 20:18:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586197115; bh=eo4TdLmuuA8DaXdbgpPkyf6SowdS8w6IgKKi5skgu/8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Tnve/r/wvjFnyXjUemjEM6sCiOY/gChrZ2rnjZnpLKOkXZMHxrUsLj7rBMpK/mZXt
 IN3fDuau70xMtUcXiYqaXpz5BbemKDAfRbLkkIHXZCqEg/mzhtZcIV0XX6MGMlM50D
 EQv4SBw7ESa1RtDn30ilTKkMjnIGRWwD12AoZBMo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 415DA8B784;
 Mon,  6 Apr 2020 20:18:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fDH1qkHOVEY2; Mon,  6 Apr 2020 20:18:35 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF4838B775;
 Mon,  6 Apr 2020 20:18:34 +0200 (CEST)
Subject: Re: [RFC PATCH v2 12/13] powerpc/kernel: Do not inconditionally save
 non volatile registers on system call
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, msuchanek@suse.de,
 Paul Mackerras <paulus@samba.org>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
 <4ef6d617cfd34e09e9bf5a456b2e0b6d2a8a3c96.1586108649.git.christophe.leroy@c-s.fr>
 <1586135554.pnqaj0giue.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <48d3e2e5-318f-011e-a59b-ec89bd7b76d2@c-s.fr>
Date: Mon, 6 Apr 2020 20:18:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1586135554.pnqaj0giue.astroid@bobo.none>
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



Le 06/04/2020 à 03:25, Nicholas Piggin a écrit :
> Christophe Leroy's on April 6, 2020 3:44 am:
>> Before : 347 cycles on null_syscall
>> After  : 327 cycles on null_syscall
> 
> The problem I had doing this is that signal delivery wnats full regs,
> and you don't know if you have a signal pending ahead of time if you
> have interrupts enabled.
> 
> I began to try bailing out back to asm to save nvgprs and call again.
> I think that can be made to work, but it is more complication in asm,
> and I soon found that 64s CPUs don't care about NVGPRs too much so it's
> nice to get rid of the !fullregs state.

I tried a new way in v3, please have a look. I split 
syscall_exit_prepare() in 3 parts and the result is unexpected: it is 
better than before the series (307 cycles now versus 311 cycles with 
full ASM syscall entry/exit).

> 
> Possibly another approach would be to leave interrupts disabled for the
> case where you have no work to do. You could create a small
> syscall_exit_prepare_nowork fastpath for that case for 32-bit, perhaps?
> 
> Thanks,
> Nick
> 

Christophe
