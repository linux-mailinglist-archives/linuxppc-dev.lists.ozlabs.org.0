Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C88985287B1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 16:57:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L22R95rV8z3cBh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 00:57:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=qMST7ia3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=qMST7ia3; dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L22QY3h6qz3bsF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 00:56:52 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8A94B21FE9;
 Mon, 16 May 2022 14:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1652713009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oTDrZeo/UdLI29Tuaw8mlcdG/RkPgJLQM7cePAnlqRg=;
 b=qMST7ia3BcKl3UtC1W2uQ0qkLBJP5Q7YC0oT0Qsb2KbEzU3Or4Q8r5PYsshuphM/GEHsx/
 3TbgfR0/0E5XpsXnd9OyJN2pbUs6sglf0Hs/rZTi2wLDZTO2OOnHvkd7qA4fAmNZA1vdry
 3XHA87WfjJ2L5kh4VZznBS1IZ/1m/S0=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 028062C141;
 Mon, 16 May 2022 14:56:49 +0000 (UTC)
Date: Mon, 16 May 2022 16:56:41 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 25/30] panic, printk: Add console flush parameter and
 convert panic_print to a notifier
Message-ID: <YoJmKYLzPZqCDDim@alley>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-26-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427224924.592546-26-gpiccoli@igalia.com>
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
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, vgoyal@redhat.com, linux-xtensa@linux-xtensa.org,
 dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, coresight@lists.linaro.org,
 linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org,
 bp@alien8.de, luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 vkuznets@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 2022-04-27 19:49:19, Guilherme G. Piccoli wrote:
> Currently the parameter "panic_print" relies in a function called
> directly on panic path; one of the flags the users can set for
> panic_print triggers a console replay mechanism, to show the
> entire kernel log buffer (from the beginning) in a panic event.
> 
> Two problems with that: the dual nature of the panic_print
> isn't really appropriate, the function was originally meant
> to allow users dumping system information on panic events,
> and was "overridden" to also force a console flush of the full
> kernel log buffer. It also turns the code a bit more complex
> and duplicate than it needs to be.
> 
> This patch proposes 2 changes: first, we decouple panic_print
> from the console flushing mechanism, in the form of a new kernel
> core parameter (panic_console_replay); we kept the functionality
> on panic_print to avoid userspace breakage, although we comment
> in both code and documentation that this panic_print usage is
> deprecated.
> 
> We converted panic_print function to a panic notifier too, adding
> it on the panic informational notifier list, executed as the final
> callback. This allows a more clear code and makes sense, as
> panic_print_sys_info() is really a panic-time only function.
> We also moved its code to kernel/printk.c, it seems to make more
> sense given it's related to printing stuff.

I really like both changes. Just please split it them into two
patchset. I mean one patch for the new "panic_console_replay"
parameter and 2nd that moves "printk_info" into the notifier.

Best Regards,
Petr
