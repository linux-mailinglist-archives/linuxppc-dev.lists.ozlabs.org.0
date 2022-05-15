Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE9B527A9C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 00:15:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1cCK5swxz3bf5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 08:15:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=or/Fp90J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=or/Fp90J; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1cBc1zG7z3bWD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 May 2022 08:15:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YHVcpMpwO8nyb8k3/FdyFSCMjS4nrs3MtFW4fah9gBU=; b=or/Fp90JrKe5WlMtL6cMgrtDTd
 KlQ8Vj1tprmMn4SD+c397HC1ukULCsTvCB4iLkFWE/e5eO3HFfAEwKhrKkKAtUd9klk2EZdbn6mIN
 Qd+4SALGR19YAeq7zzTYslQNi14hCF7XYTbP7jST+WF88j+/yFKclHfwZStwWLlezXivWrxaH8IdO
 FFInQai4LoqHg4Is254olZSUcp3WbX0NojyrclkAFtXk81MOkLDyQLJPvTXx/jJ5o9GkRAlJzHqhs
 Xl4VBJVpr4ONcW/qU5LapKJAeqGhxtirFucuu9tYQZm2MIj3QsWcao7mjJyCDthsv8RdX0nMP6hLP
 SN2gr77A==;
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nqMUS-005ij1-QV; Mon, 16 May 2022 00:13:29 +0200
Message-ID: <178a456d-3961-9bc2-83d2-2b9457d45fbd@igalia.com>
Date: Sun, 15 May 2022 19:12:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 11/30] um: Improve panic notifiers consistency and ordering
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, Petr Mladek
 <pmladek@suse.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Richard Weinberger <richard@nod.at>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-12-gpiccoli@igalia.com> <Ynp2hRodh04K3pzK@alley>
 <4b003501-f5c3-cd66-d222-88d98c93e141@igalia.com>
 <1760d499824f9ef053af7a8dac04b48ab7d7fd3d.camel@sipsolutions.net>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <1760d499824f9ef053af7a8dac04b48ab7d7fd3d.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
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
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org, rostedt@goodmis.org,
 rcu@vger.kernel.org, bp@alien8.de, luto@kernel.org,
 linux-tegra@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 andriy.shevchenko@linux.intel.com, vkuznets@redhat.com,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13/05/2022 11:44, Johannes Berg wrote:
> [...]
>> Maybe Anton / Johannes / Richard could give their opinions - appreciate
>> that, I'm not attached to the priority here, it's more about users'
>> common usage of UML I can think of...
> 
> It's hard to say ... In a sense I'm not sure it matters?
> 
> OTOH something like the ftrace dump notifier (kernel/trace/trace.c)
> might still be useful to run before the mconsole and coredump ones, even
> if you could probably use gdb to figure out the information.
> 
> Personally, I don't have a scenario where I'd care about the trace
> buffers though, and most of the others I found would seem irrelevant
> (drivers that aren't even compiled, hung tasks won't really happen since
> we exit immediately, and similar.)
> 
> johannes

Thanks Johannes, I agree with you.

We don't have great ordering now, one thing we need to enforce is the
order between the 2 UML notifiers, and this patch is doing that..trying
to order against other callbacks like the ftrace dumper is messy in the
current code.

OTOH if this patch set is accepted at some point, we'll likely have 3
lists, and with that we can improve ordering a lot - this notifier for
instance would run in the pre-reboot list, *after* the ftrace dumper (if
a kmsg dumper is set).

So, my intention is to keep this patch as is for V2 (with some changes
Johannes suggested before), unless Petr or the other maintainers want
something different.
Cheers,


Guilherme
