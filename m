Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4E2291152
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 12:14:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCzQ80ZVXzDqw6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 21:14:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCzNR2flPzDqlK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 21:12:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=r85jUpGp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CCzND41jbz9sTc;
 Sat, 17 Oct 2020 21:12:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1602929558;
 bh=jx4jSwXojnGEjdS06THopQmjsKwy9vnpGRU1Yg/+LR0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=r85jUpGpfzFa3HUnz79ZDtfjkwJ+DwrPKFjCJGv9/w2mu4qGoFqeRNc2QGTYltSaG
 E4jx2/IodEThTcc4AvWpxhLTRA51ehQgsZuAveOK2ebZ3fUJH7Tn2zj+BqK+o63K1R
 QjHAECCtGh1c2uQhTeCNJN69rZQ4lzphWdJMggnIOLI7cNjPSzGPVTKXnFBz/RW7Se
 R7BJTPTIWKlkGMDRB1poeBZpYlpxlaZLVIGnC1gGPorAtKTEizH4easat4dMS/jDou
 Yd+QQ1yJEzVtDhqbRqyz8/Xp0xoJ+vnvgZhp5HvuATyo9FSMWBQCYakWW0ApeEiLYf
 FIqZSFFueYFIw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.10-1 tag
In-Reply-To: <CAHk-=wjTwLKR1YhVHv5UzvCag5jxBeKVxLLxN9-CoxQYhi_=Kw@mail.gmail.com>
References: <87a6wmzwco.fsf@mpe.ellerman.id.au>
 <CAHk-=wjTwLKR1YhVHv5UzvCag5jxBeKVxLLxN9-CoxQYhi_=Kw@mail.gmail.com>
Date: Sat, 17 Oct 2020 21:12:27 +1100
Message-ID: <874kmtyxdg.fsf@mpe.ellerman.id.au>
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
Cc: ego@linux.vnet.ibm.com, Stephen Kitt <steve@sk2.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, jniethe5@gmail.com,
 mahesh@linux.ibm.com, liushixin2@huawei.com,
 Oliver O'Halloran <oohall@gmail.com>, fthain@telegraphics.com.au,
 hofrat@osadl.org, Christoph Hellwig <hch@lst.de>, leobras.c@gmail.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, wangwensheng4@huawei.com,
 Joel Stanley <joel@jms.id.au>, yangyingliang@huawei.com,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, mrochs@linux.ibm.com,
 zhengbin <zhengbin13@huawei.com>, nathanl@linux.ibm.com, biwen.li@nxp.com,
 ajd@linux.ibm.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 kjain@linux.ibm.com, Nick Piggin <npiggin@gmail.com>, Qian Cai <cai@lca.pw>,
 clg@kaod.org, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>, atrajeev@linux.vnet.ibm.com,
 gromero@linux.ibm.com, cheloha@linux.ibm.com, yanaijie@huawei.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Wolfram Sang <wsa@kernel.org>,
 miaoqinglang@huawei.com, fbarrat@linux.ibm.com,
 Colin King <colin.king@canonical.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Thu, Oct 15, 2020 at 8:24 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Just two minor conflicts I'm aware of. The only slight subtlety is the conflict
>> in kasan_init() where "int ret" needs to move out of the for_each_mem_range()
>> and up to the function scope.
>
> Well, there was also a conflict for the dependencies of OCXL.

Yep, it was so trivial I didn't think it was worth calling out.

> I resolved that by ruthlessly simplifying the dependency:
>
> -       depends on PPC_POWERNV && PCI && EEH && HOTPLUG_PCI_POWERNV
>  -      depends on PPC_POWERNV && PCI && EEH && PPC_XIVE_NATIVE
> ++      depends on HOTPLUG_PCI_POWERNV
>
> because all the other dependencies seem to be pointless.
>
> HOTPLUG_PCI_POWERNV already has a
>
>         depends on PPC_POWERNV && EEH
>
> so there's no point in repeating those.

And PPC_POWERNV selects FORCE_PCI, which takes care of the dependency on
PCI.

> And PPC_XIVE_NATIVE is selected by PPC_POWERNV, so if PPC_POWERNV, we
> know PPC_XIVE_NATIVE is set.
>
> Maybe I missed something strange, so I'm just letting you know so you
> can blame me if I broke something.

No, that looks good to me. Thanks.

cheers
