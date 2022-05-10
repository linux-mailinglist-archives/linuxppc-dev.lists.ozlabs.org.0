Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 793935226F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 00:38:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyXyL2vxVz3cLh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 08:38:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=sx6DF8Po;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=sx6DF8Po; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyJ922W8bz2ybB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 23:02:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JWyep5EFfEPXN0/UUFSWkvsTwBT4W/fOxchQHhKa4RM=; b=sx6DF8PoUIO1mHu5cZY1RxwoA9
 niB1KysO8rrmF0zp8Z8GTN/NtCj2d4QR4yv3E2E5W17RExRi8A0KAmcw+03c1G1ooU/Pm21U+zIEh
 0zp/hEbV2HUhNtVPnHFdp5DB6IlN6W8R3VOm7oythqBX2GRaLpOj+rJPIjIYg4FRTMuO76QGoLFC6
 YTJOWt6WzTDBhnK8IJgaIHAnWrK2atb9lCglavMKbFL3MElzKi625NHcWNdIldxGBU96c/pM4S0g8
 wJXsSSNXtcQC2Akbyu07xQvQmC9j0tVwKiovTIAilxmwfqg23OLqdBOLywiRmkuVFih5uNhaytVXp
 cz9YcgaQ==;
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1noPUd-0004lT-6O; Tue, 10 May 2022 15:01:35 +0200
Message-ID: <0a20dd06-f459-638e-cb4d-8255ab1a1f23@igalia.com>
Date: Tue, 10 May 2022 10:00:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 05/30] misc/pvpanic: Convert regular spinlock into trylock
 on panic path
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-6-gpiccoli@igalia.com> <YnpXGOXicwdy1E6n@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YnpXGOXicwdy1E6n@alley>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 11 May 2022 08:37:45 +1000
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 gregkh@linuxfoundation.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com,
 john.ogness@linutronix.de, bhe@redhat.com, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, zhenwei pi <pizhenwei@bytedance.com>,
 mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com,
 xen-devel@lists.xenproject.org, dyoung@redhat.com, vgoyal@redhat.com,
 linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com,
 keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org,
 Mihai Carabas <mihai.carabas@oracle.com>, coresight@lists.linaro.org,
 Shile Zhang <shile.zhang@linux.alibaba.com>, linux-um@lists.infradead.org,
 rostedt@goodmis.org, rcu@vger.kernel.org,
 Wang ShaoBo <bobo.shaobowang@huawei.com>, bp@alien8.de, luto@kernel.org,
 linux-tegra@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 andriy.shevchenko@linux.intel.com, vkuznets@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 jgross@suse.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 kernel@gpiccoli.net, kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/05/2022 09:14, Petr Mladek wrote:
> [...]
>> With that said, it's dangerous to use regular spinlocks in such path,
>> as introduced by commit b3c0f8774668 ("misc/pvpanic: probe multiple instances").
>> This patch fixes that by replacing regular spinlocks with the trylock
>> safer approach.
> 
> It seems that the lock is used just to manipulating a list. A super
> safe solution would be to use the rcu API: rcu_add_rcu() and
> list_del_rcu() under rcu_read_lock(). The spin lock will not be
> needed and the list will always be valid.
> 
> The advantage would be that it will always call members that
> were successfully added earlier. That said, I am not familiar
> with pvpanic and am not sure if it is worth it.
> 
>> It also fixes an old comment (about a long gone framebuffer code) and
>> the notifier priority - we should execute hypervisor notifiers early,
>> deferring this way the panic action to the hypervisor, as expected by
>> the users that are setting up pvpanic.
> 
> This should be done in a separate patch. It changes the behavior.
> Also there might be a discussion whether it really should be
> the maximal priority.
> 
> Best Regards,
> Petr

Thanks for the review Petr. Patch was already merged - my goal was to be
concise, i.e., a patch per driver / module, so the patch kinda fixes
whatever I think is wrong with the driver with regards panic handling.

Do you think it worth to remove this patch from Greg's branch just to
split it in 2? Personally I think it's not worth, but opinions are welcome.

About the RCU part, this one really could be a new patch, a good
improvement patch - it makes sense to me, we can think about that after
the fixes I guess.

Cheers,


Guilherme
