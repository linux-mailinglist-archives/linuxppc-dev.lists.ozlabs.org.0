Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A0452B849
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 13:06:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L39DC02LWz3cCm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 21:06:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=apiSUoAw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=apiSUoAw; dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L34Vn1S8Zz3bZP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 17:34:07 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8990E1F9A4;
 Wed, 18 May 2022 07:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652859243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YR5rOhmSURb4d/IKXy5VZg8z1ImD01Us4xBpVFtyoqU=;
 b=apiSUoAwUbqeAccPNQ19K+RPeAfjpiC+Kw09kP9gYD08Bjqn9sy6l8W4iwyq6IQeI6Aplp
 +YIfJeRJqbcdQptzveOcUb8Q0R7nuJcbMiyUrGxQWxZdDf/W1Ubmr612J8Zmj7lPwrkx5l
 wG1cTFsW35nAwzkY9hs+1GgrMVmINpw=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id AA6042C142;
 Wed, 18 May 2022 07:33:59 +0000 (UTC)
Date: Wed, 18 May 2022 09:33:57 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Message-ID: <YoShZVYNAdvvjb7z@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com>
 <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
 <CAE=gft7ds+dHfEkRz8rnSH1EbTpGTpKbi5Wxj9DW0Jr5mX_j4w@mail.gmail.com>
 <YoOi9PFK/JnNwH+D@alley>
 <b9ec2fc8-216f-f261-8417-77b6dd95e25c@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9ec2fc8-216f-f261-8417-77b6dd95e25c@igalia.com>
X-Mailman-Approved-At: Wed, 18 May 2022 21:06:24 +1000
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
 Alan Stern <stern@rowland.harvard.edu>, xen-devel@lists.xenproject.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Linux PM <linux-pm@vger.kernel.org>, linux-um@lists.infradead.org,
 Nicholas Piggin <npiggin@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 luto@kernel.org, Mihai Carabas <mihai.carabas@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, senozhatsky@chromium.org,
 d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-hyperv@vger.kernel.org,
 dave.hansen@linux.intel.com, linux-s390@vger.kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>, Vasily Gorbik <gor@linux.ibm.com>,
 vgoyal@redhat.com, Sven Schnelle <svens@linux.ibm.com>,
 Andrea Parri <parri.andrea@gmail.com>, linux-xtensa@linux-xtensa.org,
 john.ogness@linutronix.de, Scott Branden <scott.branden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Markus Mayer <mmayer@broadcom.com>,
 hidehiro.kawai.ez@hitachi.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 kernel-dev@igalia.com, fabiomirmar@gmail.com, halves@canonical.com,
 alejandro.j.jimenez@oracle.com, feng.tang@intel.com,
 zhenwei pi <pizhenwei@bytedance.com>, Will Deacon <will@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, bhe@redhat.com,
 Jonathan Corbet <corbet@lwn.net>, Dexuan Cui <decui@microsoft.com>,
 Evan Green <evgreen@chromium.org>, bcm-kernel-feedback-list@broadcom.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>,
 rostedt@goodmis.org, rcu@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 openipmi-developer@lists.sourceforge.net,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, linux-alpha@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, peterz@infradead.org,
 linux-remoteproc@vger.kernel.org, mikelley@microsoft.com,
 sparclinux@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-leds@vger.kernel.org, x86@kernel.org,
 mingo@redhat.com, dyoung@redhat.com, paulmck@kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Shile Zhang <shile.zhang@linux.alibaba.com>,
 Wang ShaoBo <bobo.shaobowang@huawei.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 David Gow <davidgow@google.com>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>, linux-edac@vger.kernel.org,
 jgross@suse.com, netdev@vger.kernel.org, kernel@gpiccoli.net,
 kexec@lists.infradead.org, linux-mips@vger.kernel.org,
 Julius Werner <jwerner@chromium.org>, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 2022-05-17 13:37:58, Guilherme G. Piccoli wrote:
> On 17/05/2022 10:28, Petr Mladek wrote:
> > [...]
> >>> Disagree here. I'm looping Google maintainers, so they can comment.
> >>> (CCed Evan, David, Julius)
> >>>
> >>> This notifier is clearly a hypervisor notification mechanism. I've fixed
> >>> a locking stuff there (in previous patch), I feel it's low-risk but even
> >>> if it's mid-risk, the class of such callback remains a perfect fit with
> >>> the hypervisor list IMHO.
> >>
> >> This logs a panic to our "eventlog", a tiny logging area in SPI flash
> >> for critical and power-related events. In some cases this ends up
 > >> being the only clue we get in a Chromebook feedback report that a
> >> panic occurred, so from my perspective moving it to the front of the
> >> line seems like a good idea.
> > 
> > IMHO, this would really better fit into the pre-reboot notifier list:
> > 
> >    + the callback stores the log so it is similar to kmsg_dump()
> >      or console_flush_on_panic()
> > 
> >    + the callback should be proceed after "info" notifiers
> >      that might add some other useful information.
> > 
> > Honestly, I am not sure what exactly hypervisor callbacks do. But I
> > think that they do not try to extract the kernel log because they
> > would need to handle the internal format.
> > 
> 
> I guess the main point in your response is : "I am not sure what exactly
> hypervisor callbacks do". We need to be sure about the semantics of such
> list, and agree on that.
> 
> So, my opinion about this first list, that we call "hypervisor list",
> is: it contains callbacks that
> 
> (1) should run early, preferably before kdump (or even if kdump isn't
> set, should run ASAP);
> 
> (2) these callbacks perform some communication with an abstraction that
> runs "below" the kernel, like a firmware or hypervisor. Classic example:
> pvpanic, that communicates with VMM (usually qemu) and allow such VMM to
> snapshot the full guest memory, for example.
> 
> (3) Should be low-risk. What defines risk is the level of reliability of
> subsequent operations - if the callback have 50% of chance of "bricking"
> the system totally and prevent kdump / kmsg_dump() / reboot , this is
> high risk one for example.
> 
> Some good fits IMO: pvpanic, sstate_panic_event() [sparc], fadump in
> powerpc, etc.
> 
> So, this is a good case for the Google notifier as well - it's not
> collecting data like the dmesg (hence your second bullet seems to not
> apply here, info notifiers won't add info to be collected by gsmi). It
> is a firmware/hypervisor/whatever-gsmi-is notification mechanism, that
> tells such "lower" abstraction a panic occurred. It seems low risk and
> we want it to run ASAP, if possible.

" 
> >> This logs a panic to our "eventlog", a tiny logging area in SPI flash
> >> for critical and power-related events. In some cases this ends up

I see. I somehow assumed that it was about the kernel log because
Evans wrote:

  "This logs a panic to our "eventlog", a tiny logging area in SPI flash
   for critical and power-related events. In some cases this ends up"


Anyway, I would distinguish it the following way.

  + If the notifier is preserving kernel log then it should be ideally
    treated as kmsg_dump().

  + It the notifier is saving another debugging data then it better
    fits into the "hypervisor" notifier list.


Regarding the reliability. From my POV, any panic notifier enabled
in a generic kernel should be reliable with more than 99,9%.
Otherwise, they should not be in the notifier list at all.

An exception would be a platform-specific notifier that is
called only on some specific platform and developers maintaining
this platform agree on this.

The value "99,9%" is arbitrary. I am not sure if it is realistic
even in the other code, for example, console_flush_on_panic()
or emergency_restart(). I just want to point out that the border
should be rather high. Otherwise we would back in the situation
where people would want to disable particular notifiers.

Best Regards,
Petr
