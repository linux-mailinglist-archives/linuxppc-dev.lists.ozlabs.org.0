Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBE818C45A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 01:47:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k4q65cs7zDrTf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 11:46:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k4nG33jmzDrPW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 11:45:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iC9emPAu; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48k4n82YYsz9sPF;
 Fri, 20 Mar 2020 11:45:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584665121;
 bh=W+Z34vvZKks0HjWcw4Ddw/+LfmZqr1ApEjeY4QXdx4k=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iC9emPAuS206WtkabWO9eiUH5LztrJbBox0vIOO3kG0SPAnzRJgryz3vVCJbwNVHg
 ChJHL3XBrOvTGVMVOfltoDKGUtZFjkxVnXFTzQ1TYd6mypfOAF2KMXB3DUTC7uSKTh
 oF4RTptfsRx2oy1FfM0kULYxXYx8zNnnnAUk08dO+rJphnaXy06EWZx71jVHnDP127
 l5uCxuHEqQ850rzJ6nQGBNnVW7w5K2Yf8/sIlxW2i0QNGxfOMb5MTgdjv4/CTROVBe
 Iwn7NXnhB6fPJK4bYVeFjWm2DLK9TZs1BTFTRTJ2s4T76HvHWDDPHqlOiIIkN1syjf
 /ka3XQZiH7IEA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: [patch V2 07/15] powerpc/ps3: Convert half completion to rcuwait
In-Reply-To: <20200319102613.hbwax7zrrvgcde4x@linutronix.de>
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.102694393@linutronix.de>
 <20200319100459.GA18506@infradead.org>
 <20200319102613.hbwax7zrrvgcde4x@linutronix.de>
Date: Fri, 20 Mar 2020 11:45:16 +1100
Message-ID: <87lfnvdfc3.fsf@mpe.ellerman.id.au>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Davidlohr Bueso <dave@stgolabs.net>, "Paul E . McKenney" <paulmck@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Geoff Levand <geoff@infradead.org>, Logan Gunthorpe <logang@deltatee.com>,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 Oleg Nesterov <oleg@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sebastian Andrzej Siewior <bigeasy@linutronix.de> writes:
> On 2020-03-19 03:04:59 [-0700], Christoph Hellwig wrote:
>> But I wonder how alive the whole PS3 support is to start with..
>
> OtherOS can only be used on "old" PS3 which do not have have their
> firmware upgraded past version 3.21, released April 1, 2010 [0].
> It was not possible to install OtherOS on PS3-slim and I don't remember
> if it was a successor or a budget version (but it had lower power
> consumption as per my memory).
> *I* remember from back then that a few universities bought quite a few
> of them and used them as a computation cluster. However, whatever broke
> over the last 10 years is broken.
>
> [0] https://en.wikipedia.org/wiki/OtherOS

Last time I asked on the list there were still a handful of users.

And I had a patch submitted from a user as recently as last October, so
it still has some life.

cheers
