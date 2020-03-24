Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4074219076B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 09:17:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mkdL6hKhzDqtt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 19:17:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=xwfUgmUW; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mkb857DfzDql6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 19:15:48 +1100 (AEDT)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C8562080C;
 Tue, 24 Mar 2020 08:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585037746;
 bh=95HDZEYr73gkVtFgHb5F5HQmWSnntZ5l5/JwKg88mxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xwfUgmUW53dw91LyETvme5Ib+IkARacfJ/JGnvaqYPF7KvGq9wcyRwgOSVkigeg6u
 6gNg54OWfTL/gN8MKPjHsVbYCUIxndvuuLvaC/p9N+EC0u8/B9gnt/rPjt7yX+VOVg
 gYylIFtZ5mAQ2ZpK5nN5CxQyo23RsvgrW3gWI45M=
Date: Tue, 24 Mar 2020 08:15:39 +0000
From: Will Deacon <will@kernel.org>
To: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: [PATCH] Documentation: Clarify better about the rwsem non-owner
 release issue
Message-ID: <20200324081538.GA8696@willie-the-truck>
References: <20200322021938.175736-1-joel@joelfernandes.org>
 <87a748khlo.fsf@kamboji.qca.qualcomm.com>
 <20200323182349.GA203600@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323182349.GA203600@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>,
 "linux-pci@vger.kernel.org Felipe Balbi" <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-wireless@vger.kernel.org,
 Oleg Nesterov <oleg@redhat.com>, netdev@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 02:23:49PM -0400, Joel Fernandes wrote:
> On Sun, Mar 22, 2020 at 08:51:15AM +0200, Kalle Valo wrote:
> > "Joel Fernandes (Google)" <joel@joelfernandes.org> writes:
> > 
> > > Reword and clarify better about the rwsem non-owner release issue.
> > >
> > > Link: https://lore.kernel.org/linux-pci/20200321212144.GA6475@google.com/
> > >
> > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > 
> > There's something wrong with your linux-pci and linux-usb addresses:
> > 
> > 	"linux-pci@vger.kernel.org Felipe Balbi" <balbi@kernel.org>,
> > 
> > 
> > 	"linux-usb@vger.kernel.org Kalle Valo" <kvalo@codeaurora.org>,
> 
> Not sure. It appears fine in the archive.

Hmm, I don't think it does. Here's the copy from LKML:

https://lore.kernel.org/lkml/20200322021938.175736-1-joel@joelfernandes.org/

Which works because it's in the To: correctly. But both linux-pci and
linux-usb were *not* CC'd:

"linux-usb@vger.kernel.org Kalle Valo" <kvalo@codeaurora.org>
"linux-pci@vger.kernel.org Felipe Balbi" <balbi@kernel.org>

and searching for the message in the linux-pci archives doesn't find it:

https://lore.kernel.org/linux-pci/?q=Reword+and+clarify+better+about+the+rwsem+non-owner+release+issue

So it looks like there is an issue with your mail setup.

Will
