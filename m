Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 148FA52AE86
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 01:26:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2shK2WRGz3cdM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 09:26:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=GXitEwhC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=GXitEwhC; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2hfm3kvpz3brF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 02:39:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nkckcEBnQlRsFTpASqSz6WprnZRaV0YhYSvPtBA0AVg=; b=GXitEwhCwUT4w9+D5pmH2zeSKa
 60OoBts2cxKaTjkNlztKOiPg7JmJSxA8Nf6Mc3GM9eoyPx0kgrCnR1AZ6EjsP0NE4+IxyqcasC5FH
 Bzs6mPDD2Ojz26SlVHGGSFKa4MS4PaKNy9b4ykBdp04iHw75Gq64zjSE08zAzR/RUXjez/E1PIcPr
 w9iTODel9NpjUtjDaWlc8Esr0zkZKONhALq9dFCmuDS5Nj18Wn3hMj4H1VTlzFy6uMc+YdCA3ReKq
 k/CxfFfQpOp3w1u8K+s1/QjiYVlCZZRZYeOFoWStjActxBApHl98rSBUYLtUajOsHPvmBlqZChf2A
 VEU39bjw==;
Received: from 200-161-159-120.dsl.telesp.net.br ([200.161.159.120]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nr0Da-008gju-GJ; Tue, 17 May 2022 18:38:42 +0200
Message-ID: <b9ec2fc8-216f-f261-8417-77b6dd95e25c@igalia.com>
Date: Tue, 17 May 2022 13:37:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>, Evan Green <evgreen@chromium.org>,
 David Gow <davidgow@google.com>, Julius Werner <jwerner@chromium.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com> <YoJZVZl/MH0KiE/J@alley>
 <ad082ce7-db50-13bb-3dbb-9b595dfa78be@igalia.com>
 <CAE=gft7ds+dHfEkRz8rnSH1EbTpGTpKbi5Wxj9DW0Jr5mX_j4w@mail.gmail.com>
 <YoOi9PFK/JnNwH+D@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YoOi9PFK/JnNwH+D@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 18 May 2022 09:23:23 +1000
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
 d.hatayama@jp.fujitsu.com, Sven Schnelle <svens@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-hyperv@vger.kernel.org,
 dave.hansen@linux.intel.com, linux-s390@vger.kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>, Vasily Gorbik <gor@linux.ibm.com>,
 vgoyal@redhat.com, mhiramat@kernel.org, Andrea Parri <parri.andrea@gmail.com>,
 linux-xtensa@linux-xtensa.org, john.ogness@linutronix.de,
 Scott Branden <scott.branden@broadcom.com>, Doug Berger <opendmb@gmail.com>,
 Markus Mayer <mmayer@broadcom.com>, hidehiro.kawai.ez@hitachi.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 kernel-dev@igalia.com, fabiomirmar@gmail.com, halves@canonical.com,
 alejandro.j.jimenez@oracle.com, feng.tang@intel.com,
 Will Deacon <will@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 bhe@redhat.com, Jonathan Corbet <corbet@lwn.net>,
 Dexuan Cui <decui@microsoft.com>, zhenwei pi <pizhenwei@bytedance.com>,
 bcm-kernel-feedback-list@broadcom.com, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, rostedt@goodmis.org,
 rcu@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
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
 linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>, linux-edac@vger.kernel.org,
 jgross@suse.com, netdev@vger.kernel.org, kernel@gpiccoli.net,
 kexec@lists.infradead.org, linux-mips@vger.kernel.org, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17/05/2022 10:28, Petr Mladek wrote:
> [...]
>>> Disagree here. I'm looping Google maintainers, so they can comment.
>>> (CCed Evan, David, Julius)
>>>
>>> This notifier is clearly a hypervisor notification mechanism. I've fixed
>>> a locking stuff there (in previous patch), I feel it's low-risk but even
>>> if it's mid-risk, the class of such callback remains a perfect fit with
>>> the hypervisor list IMHO.
>>
>> This logs a panic to our "eventlog", a tiny logging area in SPI flash
>> for critical and power-related events. In some cases this ends up
>> being the only clue we get in a Chromebook feedback report that a
>> panic occurred, so from my perspective moving it to the front of the
>> line seems like a good idea.
> 
> IMHO, this would really better fit into the pre-reboot notifier list:
> 
>    + the callback stores the log so it is similar to kmsg_dump()
>      or console_flush_on_panic()
> 
>    + the callback should be proceed after "info" notifiers
>      that might add some other useful information.
> 
> Honestly, I am not sure what exactly hypervisor callbacks do. But I
> think that they do not try to extract the kernel log because they
> would need to handle the internal format.
> 

I guess the main point in your response is : "I am not sure what exactly
hypervisor callbacks do". We need to be sure about the semantics of such
list, and agree on that.

So, my opinion about this first list, that we call "hypervisor list",
is: it contains callbacks that

(1) should run early, preferably before kdump (or even if kdump isn't
set, should run ASAP);

(2) these callbacks perform some communication with an abstraction that
runs "below" the kernel, like a firmware or hypervisor. Classic example:
pvpanic, that communicates with VMM (usually qemu) and allow such VMM to
snapshot the full guest memory, for example.

(3) Should be low-risk. What defines risk is the level of reliability of
subsequent operations - if the callback have 50% of chance of "bricking"
the system totally and prevent kdump / kmsg_dump() / reboot , this is
high risk one for example.

Some good fits IMO: pvpanic, sstate_panic_event() [sparc], fadump in
powerpc, etc.

So, this is a good case for the Google notifier as well - it's not
collecting data like the dmesg (hence your second bullet seems to not
apply here, info notifiers won't add info to be collected by gsmi). It
is a firmware/hypervisor/whatever-gsmi-is notification mechanism, that
tells such "lower" abstraction a panic occurred. It seems low risk and
we want it to run ASAP, if possible.

So, I'd like to keep it here, unless gsmi maintainers disagree or I'm
perhaps misunderstanding the meaning of this first list.
Cheers,


Guilherme
