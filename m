Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7575529314
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 23:44:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2CT24Z2Dz3ch3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 07:44:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=QJKb57mF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=QJKb57mF; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L23zZ5sMyz3bs3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 02:07:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hkxxY/QtEmLaEz91h3ZbibgaO5mIVJpTDxNjCMnCCRs=; b=QJKb57mFKwMFscTO5WFY4RSj23
 KQ6n8H9l2g2SttLbeQWPGo2evZPJbMnkbERgI1GrlJbCyaovBQ7YNgsYgYWZV4AUB43bBYpAdAI4t
 tSUTgJhvOvNj6CgwWpUnZT0VvP1nPFnrhSTYeteC8TI+m63sh71ROWTeeLMsXDtJw57P/+L4voDEA
 fAA2sLoZLSjWU8escrCVSpKI49cJB+42jd6GXOMXbMkFbQNvfMy7UNTlghfu62nr5uAdPO/Hn/wFd
 nMAbmXIqsuv6JnFGW2A+NmrSU+Aj1YnRvsm6Le3RHEDyDM6bMieEJqNdqhsYzjUU2qgiLiCJOh07u
 ze5flEbQ==;
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nqdEm-006s2D-Fy; Mon, 16 May 2022 18:06:24 +0200
Message-ID: <63a74b56-89ef-8d1f-d487-cdb986aab798@igalia.com>
Date: Mon, 16 May 2022 13:05:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com> <YoJgcC8c6LaKADZV@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YoJgcC8c6LaKADZV@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 17 May 2022 07:40:39 +1000
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
Cc: Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 stern@rowland.harvard.edu, xen-devel@lists.xenproject.org,
 Matt Turner <mattst88@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, luto@kernel.org, tglx@linutronix.de,
 Alex Elder <elder@kernel.org>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
 d.hatayama@jp.fujitsu.com, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sven Schnelle <svens@linux.ibm.com>, akpm@linux-foundation.org,
 linux-hyperv@vger.kernel.org, dave.hansen@linux.intel.com,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-s390@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Corey Minyard <minyard@acm.org>,
 Helge Deller <deller@gmx.de>, vgoyal@redhat.com, mhiramat@kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
 john.ogness@linutronix.de, hidehiro.kawai.ez@hitachi.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Chris Zankel <chris@zankel.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 James Morse <james.morse@arm.com>, kernel-dev@igalia.com,
 fabiomirmar@gmail.com, halves@canonical.com, alejandro.j.jimenez@oracle.com,
 feng.tang@intel.com, will@kernel.org, bhe@redhat.com, corbet@lwn.net,
 Dexuan Cui <decui@microsoft.com>, bcm-kernel-feedback-list@broadcom.com,
 Robert Richter <rric@kernel.org>, keescook@chromium.org, arnd@arndb.de,
 Haiyang Zhang <haiyangz@microsoft.com>, rostedt@goodmis.org,
 rcu@vger.kernel.org, bp@alien8.de, openipmi-developer@lists.sourceforge.net,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-parisc@vger.kernel.org,
 linux-alpha@vger.kernel.org, peterz@infradead.org,
 linux-remoteproc@vger.kernel.org, mikelley@microsoft.com,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-leds@vger.kernel.org, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org, mingo@redhat.com,
 dyoung@redhat.com, paulmck@kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-tegra@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 Johannes Berg <johannes@sipsolutions.net>, linux-edac@vger.kernel.org,
 jgross@suse.com, netdev@vger.kernel.org, kernel@gpiccoli.net,
 kexec@lists.infradead.org, linux-mips@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks again for the review! Comments inline below:


On 16/05/2022 11:33, Petr Mladek wrote:
> [...]
>> --- a/drivers/edac/altera_edac.c
>> +++ b/drivers/edac/altera_edac.c
>> @@ -2163,7 +2162,7 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
>>  		int dberror, err_addr;
>>  
>>  		edac->panic_notifier.notifier_call = s10_edac_dberr_handler;
>> -		atomic_notifier_chain_register(&panic_notifier_list,
>> +		atomic_notifier_chain_register(&panic_pre_reboot_list,
> 
> My understanding is that this notifier first prints info about ECC
> errors and then triggers reboot. It might make sense to split it
> into two notifiers.

I disagree here - looping the maintainers for comments (CCing Dinh /
Tony). BTW, sorry for not having you on CC already Dinh, it was my mistake.

So, my reasoning here is: this notifier should fit the info list,
definitely! But...it's very high risk for kdump. It deep dives into the
regmap API (there are locks in such code) plus there is an (MM)IO write
to the device and an ARM firmware call. So, despite the nature of this
notifier _fits the informational list_, the _code is risky_ so we should
avoid running it before a kdump.

Now, we indeed have a chicken/egg problem: want to avoid it before
kdump, BUT in case kdump is not set, kmsg_dump() (and console flushing,
after your suggestion Petr) will run before it and not save collected
information from EDAC PoV.

My idea: I could call a second kmsg_dump() or at least a panic console
flush for within such notifier. Let me know what you think Petr (also
Dinh / Tony and all interested parties).


> [...] 
>> --- a/drivers/leds/trigger/ledtrig-panic.c
>> +++ b/drivers/leds/trigger/ledtrig-panic.c
>> @@ -64,7 +63,7 @@ static long led_panic_blink(int state)
>>  
>>  static int __init ledtrig_panic_init(void)
>>  {
>> -	atomic_notifier_chain_register(&panic_notifier_list,
>> +	atomic_notifier_chain_register(&panic_pre_reboot_list,
>>  				       &led_trigger_panic_nb);
> 
> Blinking => should go to the last "post_reboot/loop" list.
> [...] 
>> --- a/drivers/misc/ibmasm/heartbeat.c
>> +++ b/drivers/misc/ibmasm/heartbeat.c
>> @@ -32,20 +31,23 @@ static int suspend_heartbeats = 0;
>>  static int panic_happened(struct notifier_block *n, unsigned long val, void *v)
>>  {
>>  	suspend_heartbeats = 1;
>> -	return 0;
>> +	return NOTIFY_DONE;
>>  }
>>  
>> -static struct notifier_block panic_notifier = { panic_happened, NULL, 1 };
>> +static struct notifier_block panic_notifier = {
>> +	.notifier_call = panic_happened,
>> +};
>>  
>>  void ibmasm_register_panic_notifier(void)
>>  {
>> -	atomic_notifier_chain_register(&panic_notifier_list, &panic_notifier);
>> +	atomic_notifier_chain_register(&panic_pre_reboot_list,
>> +					&panic_notifier);
> 
> Same here. Blinking => should go to the last "post_reboot/loop" list.

Ack on both.

IBMasm is not blinking IIUC, but still fits properly the loop list. This
notifier would make a heartbeat mechanism stop, and once it's stopped,
service processor is allowed to reboot - that's my understanding.


Cheers,


Guilherme
