Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B871B532552
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 10:32:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6nWp4XGyz3brt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 18:32:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cZmHilPa;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cZmHilPa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=cZmHilPa; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=cZmHilPa; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6nW84gNkz2yMK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 18:32:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653381133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e85r4r+pHFKTSezhh+x5QBd1PQ0NIYybBUBi1C3eVdc=;
 b=cZmHilPa2kbOELYmoGtcqZNJVXlRK6+olA3pPYQBnreha6u82wujsso8LR6Sq0VO2/FlcI
 hwdNPzfrXor6YbPgrQ0tlDKVEvy5Q9xqlNXw/OWbsGg31EumM1dIWYGN9T4LTqZJofFB99
 wltawbWZorc7y8PrG8vHS/FqLCieAK0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653381133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e85r4r+pHFKTSezhh+x5QBd1PQ0NIYybBUBi1C3eVdc=;
 b=cZmHilPa2kbOELYmoGtcqZNJVXlRK6+olA3pPYQBnreha6u82wujsso8LR6Sq0VO2/FlcI
 hwdNPzfrXor6YbPgrQ0tlDKVEvy5Q9xqlNXw/OWbsGg31EumM1dIWYGN9T4LTqZJofFB99
 wltawbWZorc7y8PrG8vHS/FqLCieAK0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-GCnb1baRM8qQLgvBsjrHmA-1; Tue, 24 May 2022 04:32:11 -0400
X-MC-Unique: GCnb1baRM8qQLgvBsjrHmA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE3C73C01D91;
 Tue, 24 May 2022 08:32:09 +0000 (UTC)
Received: from localhost (ovpn-13-156.pek2.redhat.com [10.72.13.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7602F2026D6A;
 Tue, 24 May 2022 08:32:08 +0000 (UTC)
Date: Tue, 24 May 2022 16:32:03 +0800
From: Baoquan He <bhe@redhat.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Message-ID: <YoyYAz6jOShsfzbM@MiWiFi-R3L-srv>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com>
 <Yn0TnsWVxCcdB2yO@alley>
 <d313eec2-96b6-04e3-35cd-981f103d010e@igalia.com>
 <20220519234502.GA194232@MiWiFi-R3L-srv>
 <ded31ec0-076b-2c5b-0fe6-0c274954821f@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ded31ec0-076b-2c5b-0fe6-0c274954821f@igalia.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
 linux-xtensa@linux-xtensa.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, "michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 hidehiro.kawai.ez@hitachi.com, sparclinux@vger.kernel.org, will@kernel.org,
 tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 john.ogness@linutronix.de, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Dave Young <dyoung@redhat.com>, vgoyal@redhat.com,
 Petr Mladek <pmladek@suse.com>, dave.hansen@linux.intel.com,
 keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org,
 gregkh@linuxfoundation.org, bp@alien8.de, luto@kernel.org,
 linux-tegra@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 andriy.shevchenko@linux.intel.com, vkuznets@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 jgross@suse.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 kernel@gpiccoli.net, kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/20/22 at 08:23am, Guilherme G. Piccoli wrote:
> On 19/05/2022 20:45, Baoquan He wrote:
> > [...]
> >> I really appreciate the summary skill you have, to convert complex
> >> problems in very clear and concise ideas. Thanks for that, very useful!
> >> I agree with what was summarized above.
> > 
> > I want to say the similar words to Petr's reviewing comment when I went
> > through the patches and traced each reviewing sub-thread to try to
> > catch up. Petr has reivewed this series so carefully and given many
> > comments I want to ack immediately.
> > 
> > I agree with most of the suggestions from Petr to this patch, except of
> > one tiny concern, please see below inline comment.
> 
> Hi Baoquan, thanks! I'm glad you're also reviewing that =)
> 
> 
> > [...]
> > 
> > I like the proposed skeleton of panic() and code style suggested by
> > Petr very much. About panic_prefer_crash_dump which might need be added,
> > I hope it has a default value true. This makes crash_dump execute at
> > first by default just as before, unless people specify
> > panic_prefer_crash_dump=0|n|off to disable it. Otherwise we need add
> > panic_prefer_crash_dump=1 in kernel and in our distros to enable kdump,
> > this is inconsistent with the old behaviour.
> 
> I'd like to understand better why the crash_kexec() must always be the
> first thing in your use case. If we keep that behavior, we'll see all
> sorts of workarounds - see the last patches of this series, Hyper-V and
> PowerPC folks hardcoded "crash_kexec_post_notifiers" in order to force
> execution of their relevant notifiers (like the vmbus disconnect,
> specially in arm64 that has no custom machine_crash_shutdown, or the
> fadump case in ppc). This led to more risk in kdump.

Firstly, kdump is not always the first thing. In any use case, if kdump
kernel is not loaded, it's not the first thing at all. Not to mention
if crash_kexec_post_notifiers is specified.

if kdump kernel is loaded, kdump has been executing firslty, since it
was added into kenrel/panic(); Until 2014, Masa added crash_kexec_post_notifiers
kernel parameter to make panic notifiers be able to execute before kdump
if specified.

	commit dc009d92435f99498cbc579ce76bf28e837e2c14
	Author: Eric W. Biederman <ebiederm@xmission.com>
	Date:   Sat Jun 25 14:57:52 2005 -0700
	
	    [PATCH] kexec: add kexec syscalls
 
	commit f06e5153f4ae2e2f3b0300f0e260e40cb7fefd45
	Author: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
	Date:   Fri Jun 6 14:37:07 2014 -0700
	
	    kernel/panic.c: add "crash_kexec_post_notifiers" option for kdump after panic_notifers

Changing this will cause regression. During these years, nobody ever doubt
kdump should execute firstly if crashkernel is reserved and kdump kernel is
loaded. That's not saying we can't change
this, but need a convincing justification.

Secondly, even with the notifiers' split, we can't guarantee people will
absolutely add notifiers into right list in the future. Letting kdump
execute behind lists by default will put kdump into risk.

For example, you replied to Hatamata saying you have been working with
kdump in the last 3, 4 years, and you have have been working on these
panic notifiers refactoring issue in the recent months. However, in your
refactoring patches of introducing hypervisor/info/pre-reboot, I noticed
you acked the suggestion from Petr that several notifiers need be moved to
correct position. So even you can't make sure these, how can other people
be able to recognize which list should be 100% appropriate when they try
to register one notifier for their sub-component?

At last, I am wondering why fadump matters. I don't know in which case
people wants to load kdump kernel, but expect to trigger crash fadump.
Power people need consider this carefully and makes some change. Fadump
just borrows the crashkernel reservation mechanism. If fadump would rather
take risk to run all panic notifiers, whether fadump really needs them
or not, then execute crash_fadump(), that's powerpc's business.

As for Hyper-V, if it enforces to terminate VMbus connection, no matter
it's kdump or not, why not taking it out of panic notifiers list and
execute it before kdump unconditionally. Below is abstracted from
Michael's words.

https://lore.kernel.org/all/MWHPR21MB15933573F5C81C5250BF6A1CD75E9@MWHPR21MB1593.namprd21.prod.outlook.com/T/#u
=======
I looked at the code again, and should revise my previous comments
somewhat.   The Hyper-V resets that I described indeed must be done
prior to kexec'ing the kdump kernel.   Most such resets are actually
done via __crash_kexec() -> machine_crash_shutdown(), not via the
panic notifier. However, the Hyper-V panic notifier must terminate the
VMbus connection, because that must be done even if kdump is not
being invoked.  See commit 74347a99e73.
=======

> 
> The thing is: with the notifiers' split, we tried to keep only the most
> relevant/necessary stuff in this first list, things that ultimately
> should improve kdump reliability or if not, at least not break it. My
> feeling is that, with this series, we should change the idea/concept
> that kdump must run first nevertheless, not matter what. We're here
> trying to accommodate the antagonistic goals of hypervisors that need
> some clean-up (even for kdump to work) VS. kdump users, that wish a
> "pristine" system reboot ASAP after the crash.
> 
> Cheers,
> 
> 
> Guilherme
> 

