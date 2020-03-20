Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C8B18C40C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 01:02:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k3r06KVkzDrRt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 11:02:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=kiLnA4+H; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k3pK2cLpzDrN7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 11:01:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=vHZuTkIraH0j18C0yesq0h37iJWXExpW0+pRP9wHAFQ=; b=kiLnA4+HBazSxcmaF2vYSeDjTi
 GZySNj/qYjY7qWPGZkmvHOClubyAs6vb7qNyQfZbboMzJvAC4SHO+rElmWzJ0jHKOLMyU89vHKXK/
 n1M8PZ7nzbZS/ryrjge0YuJsfT2QgYPpt2RAbDeongoVB9W/tMUNAm/+H2dBMRuDAuWrU0PwbnQ75
 54EFHJNVY0SnoWPPNthdT3GTBbdGU8DxgXaRaLjrQZFGUO+ooZjTCdCB5e4iC3O2gyhwvHlCijgXg
 qdZtqnhJd8ufbtliHGhktsMMJQdKUHbLmcPLdZ0UbErD8gWdNNPnllI27n2u1y0WLcmNSdyDJUoWb
 Kec+VEjg==;
Received: from 99-123-7-132.lightspeed.sntcca.sbcglobal.net ([99.123.7.132]
 helo=[192.168.1.71])
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF562-0000eU-0Q; Fri, 20 Mar 2020 00:01:06 +0000
Subject: Re: [patch V2 07/15] powerpc/ps3: Convert half completion to rcuwait
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Christoph Hellwig <hch@infradead.org>, Peter Zijlstra
 <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20200318204302.693307984@linutronix.de>
 <20200318204408.102694393@linutronix.de>
 <20200319100459.GA18506@infradead.org>
 <20200319102613.hbwax7zrrvgcde4x@linutronix.de>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <efc2378e-cf8e-8bf9-d009-34c6bcf43c8e@infradead.org>
Date: Thu, 19 Mar 2020 17:01:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319102613.hbwax7zrrvgcde4x@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pci@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, "Paul E . McKenney" <paulmck@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>, Arnd Bergmann <arnd@arndb.de>,
 Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 3/19/20 3:26 AM, Sebastian Andrzej Siewior wrote:
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
There are still PS3-Linux users out there.  They generally use firmware
and other tools available through the 'hacker' communities that allow
Linux to be run on more than just the 'officially supported' platforms.

Anyway, the change to use rcuwait seems fine if that's needed for the
completion re-work.  I'll try to do some testing with the patch set
next week.

-Geoff
