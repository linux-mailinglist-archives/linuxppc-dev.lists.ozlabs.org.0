Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FF5532A55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 14:27:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6tkq6qFvz2ypf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 22:27:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=cmANZ9ka;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=cmANZ9ka; dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6mvW2kXlz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 18:04:55 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id C6A001F8B8;
 Tue, 24 May 2022 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1653379492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+HrTVIvXJDgrzNQFl8Mhx0wGW/HWHO1IHY/NT0Ch0wc=;
 b=cmANZ9kaIvAGzRMHaeCxB0LLBkrlXozlKGlr2MQNHSGuBkVg9GZ4ULppK80AYEMbn3sHQ3
 SRCkpAxtJlotC4dIBTUf4LWabWRfn+CV2iXTLVzyyBDKp8B9onijAa8QBBUxy4R2DAxIkT
 C3aqZP5pWFL7HdTOLlEm50sKDepVyxc=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A47272C141;
 Tue, 24 May 2022 08:04:51 +0000 (UTC)
Date: Tue, 24 May 2022 10:04:51 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Message-ID: <YoyRo6gJrr4lsFpD@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com>
 <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
 <YoOpyW1+q+Z5as78@alley>
 <d72b9aab-675c-ac89-b73a-b1de4a0b722d@igalia.com>
 <81878a67-21f1-fee8-1add-f381bc8b05df@broadcom.com>
 <edbaa4fa-561c-6f5e-f2ab-43ae68acaede@igalia.com>
 <d1cc0bee-2a98-0c2e-8796-6fb7fae6b803@broadcom.com>
 <0fac8c71-6f18-d15c-23f5-075dbc45f3f9@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fac8c71-6f18-d15c-23f5-075dbc45f3f9@igalia.com>
X-Mailman-Approved-At: Tue, 24 May 2022 22:27:19 +1000
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
Cc: Paul Mackerras <paulus@samba.org>, Justin Chen <justinpopo6@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 stern@rowland.harvard.edu, xen-devel@lists.xenproject.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>,
 luto@kernel.org, Mihai Carabas <mihai.carabas@oracle.com>, tglx@linutronix.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 akpm@linux-foundation.org, linux-hyperv@vger.kernel.org,
 dave.hansen@linux.intel.com, linux-s390@vger.kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>, Vasily Gorbik <gor@linux.ibm.com>,
 vgoyal@redhat.com, Sven Schnelle <svens@linux.ibm.com>,
 Andrea Parri <parri.andrea@gmail.com>, linux-xtensa@linux-xtensa.org,
 john.ogness@linutronix.de, Scott Branden <scott.branden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Markus Mayer <mmayer@broadcom.com>,
 hidehiro.kawai.ez@hitachi.com, linux-arm-kernel@lists.infradead.org,
 kernel-dev@igalia.com, fabiomirmar@gmail.com, halves@canonical.com,
 alejandro.j.jimenez@oracle.com, feng.tang@intel.com,
 zhenwei pi <pizhenwei@bytedance.com>, will@kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, bhe@redhat.com, corbet@lwn.net,
 Dexuan Cui <decui@microsoft.com>, Evan Green <evgreen@chromium.org>,
 bcm-kernel-feedback-list@broadcom.com, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 keescook@chromium.org, arnd@arndb.de, Haiyang Zhang <haiyangz@microsoft.com>,
 rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de,
 openipmi-developer@lists.sourceforge.net,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, linux-alpha@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, peterz@infradead.org,
 linux-remoteproc@vger.kernel.org, mikelley@microsoft.com,
 sparclinux@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-leds@vger.kernel.org, x86@kernel.org,
 mingo@redhat.com, Desmond yan <desmond.yan@broadcom.com>, dyoung@redhat.com,
 paulmck@kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Shile Zhang <shile.zhang@linux.alibaba.com>,
 Wang ShaoBo <bobo.shaobowang@huawei.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 David Gow <davidgow@google.com>, linux-tegra@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, Hari Bathini <hbathini@linux.ibm.com>,
 linux-edac@vger.kernel.org, jgross@suse.com, netdev@vger.kernel.org,
 kernel@gpiccoli.net, kexec@lists.infradead.org, linux-mips@vger.kernel.org,
 Julius Werner <jwerner@chromium.org>, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 2022-05-23 11:56:12, Guilherme G. Piccoli wrote:
> On 19/05/2022 16:20, Scott Branden wrote:
> > [...] 
> >> Hi Scott / Desmond, thanks for the detailed answer! Is this adapter
> >> designed to run in x86 only or you have other architectures' use cases?
> > The adapter may be used in any PCIe design that supports DMA.
> > So it may be possible to run in arm64 servers.
> >>
> >> [...]
> >> With that said, and given this is a lightweight notifier that ideally
> >> should run ASAP, I'd keep this one in the hypervisor list. We can
> >> "adjust" the semantic of this list to include lightweight notifiers that
> >> reset adapters.
> > Sounds the best to keep system operating as tested today.
> >>
> >> With that said, Petr has a point - not always such list is going to be
> >> called before kdump. So, that makes me think in another idea: what if we
> >> have another list, but not on panic path, but instead in the custom
> >> crash_shutdown()? Drivers could add callbacks there that must execute
> >> before kexec/kdump, no matter what.
> > It may be beneficial for some other drivers but for our use we would 
> > then need to register for the panic path and the crash_shutdown path. 
> > We notify the VK card for 2 purposes: one to stop DMA so memory stop 
> > changing during a kdump.  And also to get the card into a good state so 
> > resets happen cleanly.
> 
> Thanks Scott! With that, I guess it's really better to keep this
> notifier in this hypervisor/early list - I'm planning to do that for V2.
> Unless Petr or somebody has strong feelings against that, of course.

I am fine with it because we do not have a better solution at the
moment.

It might be a good candidate for the 5th notifier list mentioned
in the thread https://lore.kernel.org/r/YoyQyHHfhIIXSX0U@alley .
But I am not sure if the 5th list is worth the complexity.

Best Regards,
Petr
