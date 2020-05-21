Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F228F1DD90A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 23:06:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Shx50KhPzDqvv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 07:06:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Shv051PrzDqsb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 07:04:11 +1000 (AEST)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jbrxc-0001IS-IB; Thu, 21 May 2020 22:38:36 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id F2D48100C2D; Thu, 21 May 2020 22:38:35 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: paulmck@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rcu tree with the powerpc tree
In-Reply-To: <20200521133543.GX2869@paulmck-ThinkPad-P72>
References: <20200519172316.3b37cbae@canb.auug.org.au>
 <20200521145124.48ae408b@canb.auug.org.au>
 <20200521133543.GX2869@paulmck-ThinkPad-P72>
Date: Thu, 21 May 2020 22:38:35 +0200
Message-ID: <87h7w9t450.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Paul E. McKenney" <paulmck@kernel.org> writes:
> On Thu, May 21, 2020 at 02:51:24PM +1000, Stephen Rothwell wrote:
>> Hi all,
>> 
>> On Tue, 19 May 2020 17:23:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >
>> > Today's linux-next merge of the rcu tree got a conflict in:
>> > 
>> >   arch/powerpc/kernel/traps.c
>> > 
>> > between commit:
>> > 
>> >   116ac378bb3f ("powerpc/64s: machine check interrupt update NMI accounting")
>> > 
>> > from the powerpc tree and commit:
>> > 
>> >   187416eeb388 ("hardirq/nmi: Allow nested nmi_enter()")
>> > 
>> > from the rcu tree.
>> > 
>> > I fixed it up (I used the powerpc tree version for now) and can carry the
>> > fix as necessary. This is now fixed as far as linux-next is concerned,
>> > but any non trivial conflicts should be mentioned to your upstream
>> > maintainer when your tree is submitted for merging.  You may also want
>> > to consider cooperating with the maintainer of the conflicting tree to
>> > minimise any particularly complex conflicts.
>> 
>> This is now a conflict between the powerpc commit and commit
>> 
>>   69ea03b56ed2 ("hardirq/nmi: Allow nested nmi_enter()")
>> 
>> from the tip tree.  I assume that the rcu and tip trees are sharing
>> some patches (but not commits) :-(
>
> We are sharing commits, and in fact 187416eeb388 in the rcu tree came
> from the tip tree.  My guess is version skew, and that I probably have
> another rebase coming up.
>
> Why is this happening?  There are sets of conflicting commits in different
> efforts, and we are trying to resolve them.  But we are getting feedback
> on some of those commits, which is probably what is causing the skew.

Correct. We had to rebase that. I don't think we do it again. The
changes I just sent out are carefully crafted to avoid that.

Thanks,

        tglx
