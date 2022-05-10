Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E427521BB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 16:16:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyKq32kFMz3cMb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 00:16:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=BeTzacf3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=BeTzacf3; dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyKpR47h7z3bmV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 00:16:14 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 932901F896;
 Tue, 10 May 2022 14:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652192171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A8/NZJeBAhTKLHLb3PoAvlXD/AvbEgaBaR5HXaRNdkM=;
 b=BeTzacf3mS4VoGHK6i1jVn2p93FIleajbiX/lqLZYQzEPT5BuEThdtby46ST2AJUboj/I/
 VqEG9r83Q4xijGW9lCE2hweKm6E7raa+vKstZ+w2OtTvG5P31Un3HT5rf7nvpJdK7CHBFy
 VZPQPYk1mnBdJ3vUcDiFbXkwBcjlkRU=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 01C5F2C141;
 Tue, 10 May 2022 14:16:09 +0000 (UTC)
Date: Tue, 10 May 2022 16:16:06 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 10/30] alpha: Clean-up the panic notifier code
Message-ID: <YnpzpkfuwzJYbPYj@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-11-gpiccoli@igalia.com>
 <f6def662-5742-b3a8-544f-bf15c636d83d@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6def662-5742-b3a8-544f-bf15c636d83d@igalia.com>
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
 sparclinux@vger.kernel.org, will@kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, mikelley@microsoft.com, john.ogness@linutronix.de,
 bhe@redhat.com, corbet@lwn.net, paulmck@kernel.org, fabiomirmar@gmail.com,
 x86@kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com,
 xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>,
 dyoung@redhat.com, vgoyal@redhat.com, linux-xtensa@linux-xtensa.org,
 dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org, rostedt@goodmis.org,
 rcu@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 luto@kernel.org, linux-tegra@vger.kernel.org, rth@gcc.gnu.org,
 andriy.shevchenko@linux.intel.com, vkuznets@redhat.com,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, tglx@linutronix.de,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 bp@alien8.de, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 2022-05-09 11:13:17, Guilherme G. Piccoli wrote:
> On 27/04/2022 19:49, Guilherme G. Piccoli wrote:
> > The alpha panic notifier has some code issues, not following
> > the conventions of other notifiers. Also, it might halt the
> > machine but still it is set to run as early as possible, which
> > doesn't seem to be a good idea.

Yeah, it is pretty strange behavior.

I looked into the history. This notifier was added into the alpha code
in 2.4.0-test2pre2. In this historic code, the default panic() code
either rebooted after a timeout or ended in a infinite loop. There
was not crasdump at that times.

The notifier allowed to change the behavior. There were 3 notifiers:

   + mips and mips64 ended with blinking in panic()
   + alpha did __halt() in this srm case

They both still do this. I guess that it is some historic behavior
that people using these architectures are used to.

Anyway, it makes sense to do this as the last notifier after
dumping other information.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
