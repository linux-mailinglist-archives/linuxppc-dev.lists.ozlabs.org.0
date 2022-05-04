Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A98D251AEE2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 22:18:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktp7C485Kz3byH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 06:18:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=KDrxDW8M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=KDrxDW8M; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ktc5q3rMlz3bWM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 22:46:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UDxTzr/LbFPHIhZF1U36kLmGFtpbBGYhm6tD7CfQBjM=; b=KDrxDW8Mnr1qToRh0yGaDv25Fu
 TWpgQRScRF3dRjjU3pakegMZLqUHmycIdjATA6DbY60uPfya2zQOAwJ0e5erFJc5BJn7o3eV3sQ41
 Tox4yunn4/jA8a3IjyUJT/sI3KcoYtb2p2FNUwcMM3f1g/ex9W0DrY0odKixjZjudGtrtbA3G1JPw
 m7Nny7DVsQFLh+HpvU/q7Yc8/k1hRGwJeSWIAUBYmqnc5ZdThCMVxiKgVNOsyAMWZdrNHmIgXn40c
 w6AF2HzVr+D+OvvIusg4XzuOUWHoF2AYp44ZOOo2CAb1BDljEp1qf8qc23J8WoJ9sqhtbxFJxmFVB
 8aeUFBag==;
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nmEOH-0003Ke-Oi; Wed, 04 May 2022 14:46:02 +0200
Message-ID: <9581851d-6c61-a2ef-a3c4-6e2ce05eab12@igalia.com>
Date: Wed, 4 May 2022 09:45:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 04/30] firmware: google: Convert regular spinlock into
 trylock on panic path
Content-Language: en-US
To: Evan Green <evgreen@chromium.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-5-gpiccoli@igalia.com>
 <CAE=gft5Pq25L4KFoPWbftkPF-JN1ex2yws77mMJ4GQnn9W0L2g@mail.gmail.com>
 <adcf6d0e-c37c-6ede-479e-29959d03d8c0@igalia.com>
 <CAE=gft623NxqetRssrZnaRmJLSP4BT5=-sVVwtYoHuspO_gULQ@mail.gmail.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <CAE=gft623NxqetRssrZnaRmJLSP4BT5=-sVVwtYoHuspO_gULQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 05 May 2022 06:17:57 +1000
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
 David Gow <davidgow@google.com>, linux-xtensa@linux-xtensa.org,
 peterz@infradead.org, alejandro.j.jimenez@oracle.com,
 linux-remoteproc@vger.kernel.org, feng.tang@intel.com,
 linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, mikelley@microsoft.com, john.ogness@linutronix.de,
 bhe@redhat.com, Jonathan Corbet <corbet@lwn.net>, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com,
 xen-devel@lists.xenproject.org, dyoung@redhat.com, vgoyal@redhat.com,
 pmladek@suse.com, dave.hansen@linux.intel.com,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>, linux-um@lists.infradead.org,
 rostedt@goodmis.org, rcu@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, vkuznets@redhat.com,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, kexec@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 Julius Werner <jwerner@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/05/2022 18:56, Evan Green wrote:
> Hi Guilherme,
> [...] 
>> Do you agree with that, or prefer really a parameter in
>> gsmi_shutdown_reason() ? I'll follow your choice =)
> 
> I'm fine with either, thanks for the link. Mostly I want to make sure
> other paths to gsmi_shutdown_reason() aren't also converted to a try.

Hi Evan, thanks for the prompt response! So, I'll proceed like I did in
s390, for consistency.

> [...]
>> Reasoning: the problem with your example is that, by default, secondary
>> CPUs are disabled in the panic path, through an IPI mechanism. IPIs take
>> precedence and interrupt the work in these CPUs, effectively
>> interrupting the "polite work" with the lock held heh
> 
> The IPI can only interrupt a CPU with irqs disabled if the IPI is an
> NMI. I haven't looked before to see if we use NMI IPIs to corral the
> other CPUs on panic. On x86, I grepped my way down to
> native_stop_other_cpus(), which looks like it does a normal IPI, waits
> 1 second, then does an NMI IPI. So, if a secondary CPU has the lock
> held, on x86 it has roughly 1s to finish what it's doing and re-enable
> interrupts before smp_send_stop() brings the NMI hammer down. I think
> this should be more than enough time for the secondary CPU to get out
> and release the lock.
> 
> So then it makes sense to me that you're fixing cases where we
> panicked with the lock held, or hung with the lock held. Given the 1
> second grace period x86 gives us, I'm on board, as that helps mitigate
> the risk that we bailed out early with the try and should have spun a
> bit longer instead. Thanks.
> 
> -Evan

Well, in the old path without "crash_kexec_post_notifiers", we indeed
end-up relying on native_stop_other_cpus() for x86 as you said, and the
"1s rule" makes sense. But after this series (or even before, if the
kernel parameter "crash_kexec_post_notifiers" was used) the function
used to stop CPUs in the panic path is crash_smp_send_stop(), and the
call chain is like:

Main CPU:
crash_smp_send_stop()
--kdump_nmi_shootdown_cpus()
----nmi_shootdown_cpus()

Then, in each CPU (except the main one, running panic() path),
we execute kdump_nmi_callback() in NMI context.

So, we seem to indeed interrupt any context (even with IRQs disabled),
increasing the likelihood of the potential lockups due to stopped CPUs
holding the locks heheh

Thanks again for the good discussion, let me know if anything I'm saying
doesn't make sense - this crash path is a bit convoluted, specially in
x86, I might have understood something wrongly =)
Cheers,


Guilherme
