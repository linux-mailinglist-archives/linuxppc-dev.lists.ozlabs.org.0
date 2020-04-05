Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BE219ED6B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 20:49:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wN536QR2zDqnR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 04:49:43 +1000 (AEST)
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
 header.s=mail header.b=vDT4kbDd; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wN3C2TYFzDqkT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 04:48:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wN326Bkfz9tx5R;
 Sun,  5 Apr 2020 20:47:58 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=vDT4kbDd; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QLy_PZYARygD; Sun,  5 Apr 2020 20:47:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wN3250PRz9tx5Q;
 Sun,  5 Apr 2020 20:47:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586112478; bh=5K5fWcVt/dZhMcfYZl39DOWw/ijhu2ZfXrNWbrQtW5w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=vDT4kbDd2d2luI9YlINWxSulY5GzJlc/jwO7NCfKm9AMRlr2bdQic4qJizaWFEb5/
 qcVnWwGTahszH0Ix4iGZVUn3QMwmYXlQ3jAlShEJm0JRShtjY55DPEHrt9faonT8l/
 CcmWKseqFccIl50tAZWfd0By1014uveiS11CdABY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 312BE8B783;
 Sun,  5 Apr 2020 20:48:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Y8LGSBfSdJTp; Sun,  5 Apr 2020 20:48:02 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A4AC08B774;
 Sun,  5 Apr 2020 20:48:00 +0200 (CEST)
Subject: Re: [PATCH v2 5/5] uaccess: Rename user_access_begin/end() to
 user_full_access_begin/end()
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <36e43241c7f043a24b5069e78c6a7edd11043be5.1585898438.git.christophe.leroy@c-s.fr>
 <42da416106d5c1cf92bda1e058434fe240b35f44.1585898438.git.christophe.leroy@c-s.fr>
 <CAHk-=wh_DY_dysMX0NuvJmMFr3+QDKOZPZqWKwLkkjgZTuyQ+A@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0e5985d7-e73b-455b-6b05-351831f09340@c-s.fr>
Date: Sun, 5 Apr 2020 20:47:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wh_DY_dysMX0NuvJmMFr3+QDKOZPZqWKwLkkjgZTuyQ+A@mail.gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Dave Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Daniel Vetter <daniel@ffwll.ch>,
 Peter Anvin <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/04/2020 à 20:01, Linus Torvalds a écrit :
> On Fri, Apr 3, 2020 at 12:21 AM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>>
>> Now we have user_read_access_begin() and user_write_access_begin()
>> in addition to user_access_begin().
> 
> I realize Al asked for this, but I don't think it really adds anything
> to the series.
> 
> The "full" makes the names longer, but not really any more legible.
> 
> So I like 1-4, but am unconvinced about 5 and would prefer that to be
> dropped. Sorry for the bikeshedding.
> 

Yes I was not sure about it, that's the reason why I added it as the 
last patch of the series.

And in the meantime, we see Robots reporting build failures due to 
additional use of user_access_begin() in parallele to this change, so I 
guess it would anyway be a challenge to perform such a change without 
coordination.

> And I like this series much better without the cookie that was
> discussed, and just making the hard rule be that they can't nest.
> 
> Some architecture may obviously use a cookie internally if they have
> some nesting behavior of their own, but it doesn't look like we have
> any major reason to expose that as the actual interface.
> 
> The only other question is how to synchronize this? I'm ok with it
> going through the ppc tree, for example, and just let others build on
> that.  Maybe using a shared immutable branch with 5.6 as a base?

Michael, can you take patches 1 to 4 ?

Otherwise, can you ack patch 4 to enable merging through another tree ?

Christophe
