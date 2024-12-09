Return-Path: <linuxppc-dev+bounces-3861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA7B9E8CD2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 09:00:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6Dmv5RY2z2yVD;
	Mon,  9 Dec 2024 19:00:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733731215;
	cv=none; b=Zmo3CK7m8395YEanVUIuMBGihvlb9yb2Khb5gXaM1R9yo4JAYl4A8Sc9TieH5OxTelm765nOEFk/xMcIK5cAsUPR8zrBsfPU9wWfw6u9tYZcdvn5yauilNISYOgpJsnGhyxziFCRX8Tq3x8rHrSEmvwQ1oXUhMS+p4EnScAcbxMur5rlcWtQ8C1RqBLq7h4Ea9eXCcNFEKuCkgy8cy37F8mXCeVi/UBjW+odCu3Ahl+Rm0DugS0j911iVh517Upp/d4Z507XbJOsahRo8EDGm4es46wsHAkCtQ403S7k3TkYeQ39TZuL6ZKeW8WOyxg2HrUibd+pv0DLRZmHd25goQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733731215; c=relaxed/relaxed;
	bh=DqEFd09srrvuE3qdY9kypQyvcGnzPZK3YiIRGM+1Vfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuMfFFyRqIlfLOCjnnR7rfMLS23QhcM0ohLlrXQFPzNtwZKlwAHkzcy4p/oiXJiKfCEDR6RofQtZ85a4uoMQR8YbyspB8ZqrGbmoUHz4mzYDU52+42S1gAhlGCoUoW6aSFpRcZIlhDwB+UiSheHxTXNG+sTq6xHzG2prSSdJk8QIa6E4lW0pjFQNfOmucp5QBYpSsy2oiOXZrx+Ck3HQC84dMlHufgWgQ9dp2r8H8QIlMRNtnGPt72rMSfbzmZENtYkm+wTQgcnnZrY9l7VIcElkUew7O59P6a/ZAuy20KXovsjbhinTaP2y8meNRKrXcqx98V0V95N3eJWa1y01zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6Dmt3rMbz2yRM
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2024 19:00:13 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y6Dmm0yg1z9tMd;
	Mon,  9 Dec 2024 09:00:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z9xJj8PxyCvC; Mon,  9 Dec 2024 09:00:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y6Dmm02jxz9tC2;
	Mon,  9 Dec 2024 09:00:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E05668B764;
	Mon,  9 Dec 2024 09:00:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id LepFlSOSUUj8; Mon,  9 Dec 2024 09:00:07 +0100 (CET)
Received: from [10.25.209.139] (unknown [10.25.209.139])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BA31B8B763;
	Mon,  9 Dec 2024 09:00:07 +0100 (CET)
Message-ID: <ca5559b9-16fe-4808-a28b-b87129b0e6b8@csgroup.eu>
Date: Mon, 9 Dec 2024 09:00:07 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] futex: improve user space accesses
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Andreas Schwab <schwab@linux-m68k.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20241122193305.7316-1-torvalds@linux-foundation.org>
 <87bjxl6b0i.fsf@igel.home>
 <CAHk-=wjnvFU3sMjjKyqtgvPe6EMu3M4f1qyZncJR5=QDQsV=ng@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAHk-=wjnvFU3sMjjKyqtgvPe6EMu3M4f1qyZncJR5=QDQsV=ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 09/12/2024 à 01:32, Linus Torvalds a écrit :
> On Sun, 8 Dec 2024 at 14:54, Andreas Schwab <schwab@linux-m68k.org> wrote:
>>
>> This breaks userspace on ppc32.  As soon as /init in the initrd is
>> started the kernel hangs (without any messages).
> 
> Funky, funky. Most of the diff is the code movement (and some small
> x86-specific stuff), so for ppc, the only part that should be relevant
> is the futex_get_value_locked().
> 
> And since ppc doesn't do the masked user access thing, so it
> *literally* boils down to just that
> 
>          if (!user_read_access_begin(from, sizeof(*from)))
>                  return -EFAULT;
>          unsafe_get_user(val, from, Efault);
>          user_access_end();
> 
> path.
> 
> Ahh... And now that I write that out, the bug is obvious: it should be using
> 
>          user_read_access_end();
> 
> to match up with the user_read_access_begin().

Yes indeed, especially on book3s/32, which is only able to write-protect 
user accesses. On that platform user_read_access_...() are no-ops.

user_access_end() and user_write_access_end() are similar, and rely on a 
thread var stored by user_access_begin(). When calling that 
user_access_end() without prior call to user_access_begin(), that var 
has value ~0 instead of the address of the user segment being accessed, 
and ~0 is a kernel address so user_access_end() applies some user 
segment flags to a kernel segment which most likely leads to a complete 
mess allthough I'm not able to trigger the hang with QEMU.

> 
> And yeah, ppc is the only platform that has that
> "read-vs-write-vs-both" thing, so this bug is not visible anywhere
> else.
> 
> IOW, does this one-liner fix it for you?
> 
>    --- a/kernel/futex/futex.h
>    +++ b/kernel/futex/futex.h
>    @@ -265,7 +265,7 @@
>          else if (!user_read_access_begin(from, sizeof(*from)))
>                  return -EFAULT;
>          unsafe_get_user(val, from, Efault);
>    -     user_access_end();
>    +     user_read_access_end();
>          *dest = val;
>          return 0;
>     Efault:
> 
> I bet it does, but I'll wait for confirmation before actually
> committing that fix.
> 

You'll need the same change in the Efault leg.

Christophe

