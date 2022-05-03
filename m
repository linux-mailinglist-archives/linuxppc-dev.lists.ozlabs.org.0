Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 733AD519134
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 00:20:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtDsw287fz3by9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 08:20:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=gjAznZuo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=gjAznZuo; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kt73k4ylFz2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 03:58:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V5OlIrQZACaQuAvW/eyS6B/1Zwik+ew1I16AuySJnIg=; b=gjAznZuoR4/m9kKzzhqzuGrpkT
 xtMc6cJN1cBQNuGvg6XyrPFTI1ixzsXC2Qdeh+HpywC/rv8GnlBjcukr7ohfRrQ9c8Vv3g1C+degf
 BKLK1MQn4ihq1pQ2tLJ4K6bqakBNB70xc08nkdXZEPCNZh6tlfswNgMdLLmr3btmvO+ASGsTB1McO
 bjtFx1IEqa+FJgHwAOYextuGE9H3QAozC9Ow4n5OqOMhRYX1e/PE6FhaxFfCh6NihoHwyZzrtpHli
 GlpKhk1VLnB8Ef855kd7QLHnrR7/smJu3dr6Yo1GdqpDjEKpnWDlt7/NfiaCRZ690xo8EgxQrZVRx
 GY9vS48w==;
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nlwlp-0009Ge-E7; Tue, 03 May 2022 19:57:09 +0200
Message-ID: <dccb35f9-8fff-8b53-3b31-fbe55b2781c0@igalia.com>
Date: Tue, 3 May 2022 14:56:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 19/30] panic: Add the panic hypervisor notifier list
Content-Language: en-US
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "bhe@redhat.com" <bhe@redhat.com>, "pmladek@suse.com" <pmladek@suse.com>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-20-gpiccoli@igalia.com>
 <PH0PR21MB30256260CCF4CAB713BBB11ED7FC9@PH0PR21MB3025.namprd21.prod.outlook.com>
 <0147d038-571b-0802-c210-ccd4d52cd5dd@igalia.com>
 <PH0PR21MB30257E4E6E16BB8FFDE8F312D7C09@PH0PR21MB3025.namprd21.prod.outlook.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <PH0PR21MB30257E4E6E16BB8FFDE8F312D7C09@PH0PR21MB3025.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 04 May 2022 08:18:47 +1000
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
 KY Srinivasan <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>, "luto@kernel.org" <luto@kernel.org>,
 Mihai Carabas <mihai.carabas@oracle.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "d.hatayama@jp.fujitsu.com" <d.hatayama@jp.fujitsu.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "john.ogness@linutronix.de" <john.ogness@linutronix.de>,
 "vgoyal@redhat.com" <vgoyal@redhat.com>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 Andrea Parri <parri.andrea@gmail.com>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Scott Branden <scott.branden@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Markus Mayer <mmayer@broadcom.com>,
 "hidehiro.kawai.ez@hitachi.com" <hidehiro.kawai.ez@hitachi.com>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 "fabiomirmar@gmail.com" <fabiomirmar@gmail.com>,
 "halves@canonical.com" <halves@canonical.com>,
 "alejandro.j.jimenez@oracle.com" <alejandro.j.jimenez@oracle.com>,
 "feng.tang@intel.com" <feng.tang@intel.com>,
 zhenwei pi <pizhenwei@bytedance.com>, "will@kernel.org" <will@kernel.org>,
 Doug Berger <opendmb@gmail.com>, "corbet@lwn.net" <corbet@lwn.net>,
 Dexuan Cui <decui@microsoft.com>, Evan Green <evgreen@chromium.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "arnd@arndb.de" <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "rcu@vger.kernel.org" <rcu@vger.kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Ard Biesheuvel <ardb@kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "dyoung@redhat.com" <dyoung@redhat.com>,
 "paulmck@kernel.org" <paulmck@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Shile Zhang <shile.zhang@linux.alibaba.com>,
 Wang ShaoBo <bobo.shaobowang@huawei.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 David Gow <davidgow@google.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "jgross@suse.com" <jgross@suse.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Julius Werner <jwerner@chromium.org>, vkuznets <vkuznets@redhat.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/05/2022 14:44, Michael Kelley (LINUX) wrote:
> [...]
>>
>> Hi Michael, thanks for your feedback! I agree that your idea could work,
>> but...there is one downside: imagine the kmsg_dump() approach is not set
>> in some Hyper-V guest, then we would rely in the regular notification
>> mechanism [hv_die_panic_notify_crash()], right?
>> But...you want then to run this notifier in the informational list,
>> which...won't execute *by default* before kdump if no kmsg_dump() is
>> set. So, this logic is convoluted when you mix it with the default level
>> concept + kdump.
> 
> Yes, you are right.  But to me that speaks as much to the linkage
> between the informational list and kmsg_dump() being the core
> problem.  But as I described in my reply to Patch 24, I can live with
> the linkage as-is.

Thanks for the feedback Michael!

> [...] 
>> I feel the panic notification mechanism does really fit with a
>> hypervisor list, it's a good match with the nature of the list, which
>> aims at informing the panic notification to the hypervisor/FW.
>> Of course we can modify it if you prefer...but please take into account
>> the kdump case and how it complicates the logic.
> 
> I agree that the runtime effect of one list vs. the other is nil.  The
> code works and can stay as you written it.
> 
> I was trying to align from a conceptual standpoint.  It was a bit
> unexpected that one path would be on the hypervisor list, and the
> other path effectively on the informational list.  When I see
> conceptual mismatches like that, I tend to want to understand why,
> and if there is something more fundamental that is out-of-whack.
> 

Totally agree with you here, I am like that as well - try to really
understand the details, this is very important specially in this patch
set, since it's a refactor and affects every user of the notifiers
infrastructure.

Again, just to double-say it: feel free to suggest any change for the
Hyper-V portion (might as well for any patch in the series, indeed) -
you and the other Hyper-V maintainers own this code and I'd be glad to
align with your needs, you are honor citizens in the panic notifiers
area, being one the most heavy users for that =)

Cheers,


Guilherme
