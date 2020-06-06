Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E35C41F0412
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 02:51:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49f1Dg1LgQzDqpB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 10:51:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49f1BZ4522zDqHX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 10:49:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=lfkkMYR9; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49f1BX1WpMz9sPF;
 Sat,  6 Jun 2020 10:49:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591404598;
 bh=bpz89eaW2nodXZsziinGBtDvy2HqL3ahKn1/V/FFoQg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lfkkMYR9ta/gv5TFJjtrQEC8a8XmvWYaxu1udQreNWFEiovWa5hqfxX1/GkNas9Jb
 353UR7g42BQnlkRNxq+dLf+Krax6hZenJ/w8DCede5c5a6ueCGAu+BIeeun3UgCuTh
 THB64aOM7w/RyfJlxpp5cVVImWQ274o/DDXqPglIJaBOoVMR8AA3eQwpAfjFhtmoCz
 YPNHWcS0xAySPVmHcT5FgsM+qenQfehzI4Z7VU/aNTMyu9LlFtM5yA/wtM5Ol/irC8
 8w51uT9sez3I0LiF+T68/LXhAdE8CZyJsNbEP3FOwTROQVu95OpZK/zz0brfVC98kH
 rbamWSCf12F+g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.8-1 tag
In-Reply-To: <CAHk-=wg33hLZHjqcMhvWzmgNrE6Gv+xpEcFXUx7iUHS2t5QtdQ@mail.gmail.com>
References: <87eeqth3hi.fsf@mpe.ellerman.id.au>
 <CAHk-=wh5vSwYqF=YiKOOGBHE=hCwnes_ndbP4QOyjPK_Xocz7w@mail.gmail.com>
 <CAHk-=wg33hLZHjqcMhvWzmgNrE6Gv+xpEcFXUx7iUHS2t5QtdQ@mail.gmail.com>
Date: Sat, 06 Jun 2020 10:50:22 +1000
Message-ID: <877dwlggq9.fsf@mpe.ellerman.id.au>
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
> On Fri, Jun 5, 2020 at 12:01 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> ..and then when I actually compared whether I otherwise got the same
>> result as you, I realized that this all depends on the module tree.
>>
>> I'll go merge that first, and then re-do this all. Oh well.
>
> Ok, redone and pushed out. Can you check that the end result makes sense?

Yep, looks good to me. Has passed all my basic build & boot tests.

cheers
