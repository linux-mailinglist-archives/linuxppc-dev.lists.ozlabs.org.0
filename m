Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4510D18E339
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 18:22:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48l6s52sMszDrqd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 04:22:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=stgolabs.net (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stgolabs.net
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48l6pv559hzDrnP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 04:20:21 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C70F9ABD7;
 Sat, 21 Mar 2020 17:20:14 +0000 (UTC)
Date: Sat, 21 Mar 2020 10:19:02 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 00/20] Lock ordering documentation and annotation for
 lockdep
Message-ID: <20200321171902.xxlnpikc65wd3b4m@linux-p48b>
References: <20200321112544.878032781@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200321112544.878032781@linutronix.de>
User-Agent: NeoMutt/20180716
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-ia64@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Sebastian Siewior <bigeasy@linutronix.de>, Oleg Nesterov <oleg@redhat.com>,
 Guo Ren <guoren@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, kbuild test robot <lkp@intel.com>,
 Brian Cain <bcain@codeaurora.org>, linux-acpi@vger.kernel.org,
 "Paul E . McKenney" <paulmck@kernel.org>, linux-hexagon@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-csky@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Greentime Hu <green.hu@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 platform-driver-x86@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
 Felipe Balbi <balbi@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Nick Hu <nickhu@andestech.com>,
 Geoff Levand <geoff@infradead.org>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dbueso@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 21 Mar 2020, Thomas Gleixner wrote:

>This is the third and hopefully final version of this work. The second one
>can be found here:

Would you rather I send in a separate series with the kvm changes, or
should I just send a v2 with the fixes here again?

Thanks,
Davidlohr
