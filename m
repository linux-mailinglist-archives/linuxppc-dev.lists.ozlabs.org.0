Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 206E0195E74
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 20:16:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ps6Q0CJXzDrJs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 06:16:46 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=ARU9xHbF; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ps4d3cgszDr72
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 06:15:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=wi9sMkFTjgwfQzFt05plG4rnAYvM3lDU42pKvwyq4Dk=; b=ARU9xHbF+qAAz2eVBrwRTExEhX
 jwbbaXg4N6bxYjwT1WFJStJwWCN9ZHaVD3NmDI1LZV1T0tf4AIdqj5K2taxObMmf+eMC0i5CbjuQu
 cvF7lxBZu5bLZ+0AdIzFsdJG1EATpc/ptIx2pCL2bB+g/yJEKAss2RthpcAMSl290YviOrnbOvJlX
 ikCrnWobf8fDzpkViu46vqNLHYHj5LdPU4VdWSuQTRIwjeJYR5Vvgah5hoQLR7Vo5XfSfN1jnONov
 0vwoM1oP/OGhYcNpgo1xpE+4HqhYQCyvKV32Q/9MINxoqL2BVCx+yMkvLrwb/lioD1mQXbZAvA7f/
 wH3hOZwQ==;
Received: from [2602:306:37b0:7840:b51a:dd8c:5d76:65e]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHuRN-0006Pi-D5; Fri, 27 Mar 2020 19:14:49 +0000
Subject: Re: [patch V3 12/20] powerpc/ps3: Convert half completion to rcuwait
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20200321112544.878032781@linutronix.de>
 <20200321113241.930037873@linutronix.de>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <f3210d53-dfb1-6bbc-cc82-832105fcfaa2@infradead.org>
Date: Fri, 27 Mar 2020 12:14:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200321113241.930037873@linutronix.de>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-ia64@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Sebastian Siewior <bigeasy@linutronix.de>, platform-driver-x86@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 linux-hexagon@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Davidlohr Bueso <dave@stgolabs.net>, kbuild test robot <lkp@intel.com>,
 Brian Cain <bcain@codeaurora.org>, linux-acpi@vger.kernel.org,
 "Paul E . McKenney" <paulmck@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-csky@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Greentime Hu <green.hu@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 Davidlohr Bueso <dbueso@suse.de>, Logan Gunthorpe <logang@deltatee.com>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 3/21/20 4:25 AM, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> The PS3 notification interrupt and kthread use a hacked up completion to
> communicate. Since we're wanting to change the completion implementation and
> this is abuse anyway, replace it with a simple rcuwait since there is only ever
> the one waiter.
> 
> AFAICT the kthread uses TASK_INTERRUPTIBLE to not increase loadavg, kthreads
> cannot receive signals by default and this one doesn't look different. Use
> TASK_IDLE instead.

I tested the patch set applied against v5.6-rc7 on the PS3 and it worked
as expected.

Tested by: Geoff Levand <geoff@infradead.org>

