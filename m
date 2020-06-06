Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6291F040D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 02:47:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49f1756ZVVzDqnx
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 10:46:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49f15D56MhzDqyb
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 10:45:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PpRZ5bzY; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49f1566Qpzz9sSc;
 Sat,  6 Jun 2020 10:45:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591404320;
 bh=IaU5svNPQHhne20TEVlRZ0Kl72R9wx14Smw0PSgLfqw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PpRZ5bzYtwIKvGBjTsE7uAgTTrKf58mi2pjY4JzXmNwpk062tb0AdkqDy4/SvuLyM
 7pUvSDSiEw0bJQwnSXcKitUASlKYBKt9o0WseERFR8HMlCPyASqDOEzCvzczeqyjWw
 JpGj8nEf+7EG02SGd8auYupz7qxKQMGdhOgkSIRNsp7KGg2NpWN36py1I1geCAuxce
 ee3s3G5NfaHuMBqbrn48ApQism1lFWVgryRfFyOUSN2n4NYysIxZ/8QVKVwJaYe44S
 nj3oN2p7KiG9iJhxMW7zR2/LOvR3hu+Ywcfn8kzsHyfZdxrfArZH0EI0Gqcj/BAFyw
 QIHwQdTvjAkWw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.8-1 tag
In-Reply-To: <CAHk-=wh5vSwYqF=YiKOOGBHE=hCwnes_ndbP4QOyjPK_Xocz7w@mail.gmail.com>
References: <87eeqth3hi.fsf@mpe.ellerman.id.au>
 <CAHk-=wh5vSwYqF=YiKOOGBHE=hCwnes_ndbP4QOyjPK_Xocz7w@mail.gmail.com>
Date: Sat, 06 Jun 2020 10:45:37 +1000
Message-ID: <87a71hggy6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ego@linux.vnet.ibm.com, emmanuel.nicolet@gmail.com, chenzhou10@huawei.com,
 jniethe5@gmail.com, linuxram@us.ibm.com, kernelfans@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, st5pub@yandex.ru,
 Oliver O'Halloran <oohall@gmail.com>, huhai@tj.kylinos.cn,
 Markus Elfring <elfring@users.sourceforge.net>, rzinsly@linux.ibm.com,
 leobras.c@gmail.com, mikey@neuling.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, haren@linux.ibm.com,
 michal.simek@xilinx.com, mahesh@linux.ibm.com, Takashi Iwai <tiwai@suse.de>,
 kjain@linux.ibm.com, leonardo@linux.ibm.com,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, ajd@linux.ibm.com,
 Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 alistair@popple.id.au, Nick Piggin <npiggin@gmail.com>,
 wangxiongfeng2@huawei.com, Qian Cai <cai@lca.pw>, clg@kaod.org,
 Nathan Chancellor <natechancellor@gmail.com>, hbathini@linux.ibm.com,
 Christophe Leroy <christophe.leroy@c-s.fr>, geoff@infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, wsa@kernel.org,
 sbobroff@linux.ibm.com, fbarrat@linux.ibm.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Fri, Jun 5, 2020 at 9:38 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> I've pushed the result of my resolution of the conflicts to the powerpc/merge
>> branch, if you want to look at that, though I've also tried to describe it in
>> full below.
>
> I ended up doing the machine_check_exception() differently, because I
> felt the code itself was done wrong and I wanted to add a note about
> that.
>
> Having the same function have completely different semantics depending
> on a platform issue is just fundamentally wrong, and makes not just
> for fragile code, but also means that you can't do single image
> kernels.

Yeah I agree it's not that nicely structured.

In this case CONFIG_PPC_BOOK3S_64 is one of our top-level compile time
switches anyway, so the single image thing at least isn't a concern.

> It should be two different functions, possibly just
>
>    non_nmi_fn() { ... }
>
>    nmi_fn() { nmi_enter(); non_nmi_fn(); nmi_exit(); }
>
> and now you don't have odd rules for the same function that depends on
> how the platform happens to call it.

Agreed.

> I didn't do the above. I did something that looked like the old code,
> but had a comment. Oh well.

Thanks, we can restructure it later.

> But thanks for describing the merge, I'd have missed the place where
> there was a new use of pgd_oiffset().

Yeah I missed it to begin with :}

> ..and then when I actually compared whether I otherwise got the same
> result as you, I realized that this all depends on the module tree.
>
> I'll go merge that first, and then re-do this all. Oh well.

Darn it. I figured you'd have merged that by the time you saw my pull,
will mention anything similar in future.

cheers
