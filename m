Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EE452AE7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 01:23:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2scy6mjwz2xnC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 09:23:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=A62HHwy9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=A62HHwy9; dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2Y4t225Qz3bq3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 20:58:21 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 97ABB21CB1;
 Tue, 17 May 2022 10:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652785097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UpU3PwW0+vEopHT6mwlEtKZnt5vjcj6K5z6p2RvwFDI=;
 b=A62HHwy96rt3Peh/2oQoJb/W5OQ8Z85j1RGtcSopCMAn7XlytDk/24zuEW9Tpga7/Yq/ue
 yQKQnkJYG61eGpGqLTfCCGX/srVGllxHF23XScgduJU8Byym34HyS4Bk1MWh3Z8Rwo0Y9Q
 s5hDkQjh35sYKTX8Zcjp7xwrzg3RpvU=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5CD572C141;
 Tue, 17 May 2022 10:58:15 +0000 (UTC)
Date: Tue, 17 May 2022 12:58:15 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 05/30] misc/pvpanic: Convert regular spinlock into
 trylock on panic path
Message-ID: <YoN/x2fpdDU4+nSB@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-6-gpiccoli@igalia.com>
 <YnpXGOXicwdy1E6n@alley>
 <0a20dd06-f459-638e-cb4d-8255ab1a1f23@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a20dd06-f459-638e-cb4d-8255ab1a1f23@igalia.com>
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

On Tue 2022-05-10 10:00:58, Guilherme G. Piccoli wrote:
> On 10/05/2022 09:14, Petr Mladek wrote:
> > [...]
> >> With that said, it's dangerous to use regular spinlocks in such path,
> >> as introduced by commit b3c0f8774668 ("misc/pvpanic: probe multiple instances").
> >> This patch fixes that by replacing regular spinlocks with the trylock
> >> safer approach.
> > 
> > It seems that the lock is used just to manipulating a list. A super
> > safe solution would be to use the rcu API: rcu_add_rcu() and
> > list_del_rcu() under rcu_read_lock(). The spin lock will not be
> > needed and the list will always be valid.
> > 
> > The advantage would be that it will always call members that
> > were successfully added earlier. That said, I am not familiar
> > with pvpanic and am not sure if it is worth it.
> > 
> >> It also fixes an old comment (about a long gone framebuffer code) and
> >> the notifier priority - we should execute hypervisor notifiers early,
> >> deferring this way the panic action to the hypervisor, as expected by
> >> the users that are setting up pvpanic.
> > 
> > This should be done in a separate patch. It changes the behavior.
> > Also there might be a discussion whether it really should be
> > the maximal priority.
> > 
> > Best Regards,
> > Petr
> 
> Thanks for the review Petr. Patch was already merged - my goal was to be
> concise, i.e., a patch per driver / module, so the patch kinda fixes
> whatever I think is wrong with the driver with regards panic handling.
> 
> Do you think it worth to remove this patch from Greg's branch just to
> split it in 2? Personally I think it's not worth, but opinions are welcome.

No problem. It is not worth the effort.


> About the RCU part, this one really could be a new patch, a good
> improvement patch - it makes sense to me, we can think about that after
> the fixes I guess.

Yup.

Best Regards,
Petr
