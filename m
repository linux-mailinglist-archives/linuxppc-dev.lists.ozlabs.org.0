Return-Path: <linuxppc-dev+bounces-9672-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAC1AE5D8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 09:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRGZG3xDTz2xk5;
	Tue, 24 Jun 2025 17:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750749638;
	cv=none; b=Oeh/bnJy40ZBa2h92jKod05yvaxx1iSp0aZlVgzimwdGW3W/aLd6ZFeFbTnSdibLNpIKU7kl4ZVsEjWm89vHZCYmaQlgAeEx6Wc4ifs6DWaw3C4RJMaVqh91YxHZVm/hwLxg2EEvoACH3dRMNFLWoRsZVN0w0RxG53yhC0J+853ix79+tyF8GcRF0vHGN5oMPZRUID+UTQXQ1QKvR43hkgGAhKihRsvap7dz75GvTxP4KiWylFiR3L11Yr8tY22POaVY0MDsoutm/T1Ja29raWrd4CBhobj7e/nCtBNF8ATWyHNO6OCMymtIrUFDdwyGOVySJAMQrTH6hzJ4TCcRmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750749638; c=relaxed/relaxed;
	bh=2Vxy75RJgMKu3B8tS63p7PxkIPm8NMgd8FlTRr9EKfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TCbFzhOIC7xBIviN5cOl5Dw9D+jWA7eR5OQsqlFbo2c+fQueH+Z7Ltsgog0UBGlJa+eLSkcXWfWMyTUI1kTJHyzdFRK1TiFGRNET9yIVzF265flHWMQMOM2sllZOq8z4U4rKbSGKtb/1VTLR67hHx/kDbWdIxIj18UVEsjtp31FfHzQ7jMkwWCcmd8HuAmwD7DAHFP9yOR1ASR8PPE9QI0Kpvsv/SZKw3SgHbYeOzrVhzVPsAKqAB7pDqAxcOcp58N872Muyl4wn6Qyp3JEpaFBLcIsehiyqTH9d72VbQ9Q+SpTllHdur2Ez6YJ2iaGygsBezZmWQwBx0+Vi2iiK/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRGZF4BFJz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 17:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bRDXc6lZ6z9sSD;
	Tue, 24 Jun 2025 07:49:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6SIPJQNC9zCD; Tue, 24 Jun 2025 07:49:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bRDXc5TpXz9sYQ;
	Tue, 24 Jun 2025 07:49:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5C7138B768;
	Tue, 24 Jun 2025 07:49:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7ZgexA602m3K; Tue, 24 Jun 2025 07:49:04 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 79C188B767;
	Tue, 24 Jun 2025 07:49:03 +0200 (CEST)
Message-ID: <2f569008-dd66-4bb6-bf5e-f2317bb95e10@csgroup.eu>
Date: Tue, 24 Jun 2025 07:49:03 +0200
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
Subject: Re: [PATCH 2/5] uaccess: Add speculation barrier to
 copy_from_user_iter()
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Laight <david.laight.linux@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
 <f4b2a32853b5daba7aeac9e9b96ec1ab88981589.1750585239.git.christophe.leroy@csgroup.eu>
 <CAHk-=wj4P6p1kBVW7aJbWAOGJZkB7fXFmwaXLieBRhjmvnWgvQ@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAHk-=wj4P6p1kBVW7aJbWAOGJZkB7fXFmwaXLieBRhjmvnWgvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/06/2025 à 18:57, Linus Torvalds a écrit :
> On Sun, 22 Jun 2025 at 02:52, Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> The results of "access_ok()" can be mis-speculated.
> 
> Hmm. This code is critical. I think it should be converted to use that
> masked address thing if we have to add it here.

Ok, I'll add it.

> 
> And at some point this access_ok() didn't even exist, because we check
> the addresses at iter creation time. So this one might be a "belt and
> suspenders" check, rather than something critical.
> 
> (Although I also suspect that when we added ITER_UBUF we might have
> created cases where those user addresses aren't checked at iter
> creation time any more).
> 

Let's take the follow path as an exemple:

snd_pcm_ioctl(SNDRV_PCM_IOCTL_WRITEI_FRAMES)
   snd_pcm_common_ioctl()
     snd_pcm_xferi_frames_ioctl()
       snd_pcm_lib_write()
         __snd_pcm_lib_xfer()
           default_write_copy()
             copy_from_iter()
               _copy_from_iter()
                 __copy_from_iter()
                   iterate_and_advance()
                     iterate_and_advance2()
                       iterate_iovec()
                         copy_from_user_iter()

As far as I can see, none of those functions check the accessibility of 
the iovec. Am I missing something ?

Christophe

