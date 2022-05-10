Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFFA522547
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 22:13:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyTl56t0Jz3cLp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 06:13:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=g3Nx+lB9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=g3Nx+lB9; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyTkP5ZDgz3bgR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 06:13:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gJbDvxZCHLE9Xc3dgTDCPLuG4mRgGmv6OD8aG7M3JDQ=; b=g3Nx+lB9bAjkoFhfBAw/tKnujE
 HE49wVGnvYPT6LdjDh7XC7p9pg3dQOiKQmVqs5yBTQcMLD/Qb7loz7GoYe9PtUSJMIbL1xCX7WOmP
 Vje/KjqWSNfESrwYFEgzZTAiGGwdZ+mo/M5Y4DNbzDEU8fdx1WAqo3dhuepVJxkwfJ6AyMl1hzYbL
 37Bt4s+cXuNOUF+dflK9we5prMFoOFLTCAg4y4fzR8H75s0j2xAYXr1Tlb+YwkS4w97u5Z+/kankc
 sGAGYvqPkX6LoRGzU4WQr1NirsakQGzt8bG3WfLCBDveLwXiZiOyOvqFNe/oiLGpRxJijV5VJBRHK
 Ucite2AA==;
Received: from [177.183.162.244] (helo=[192.168.0.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1noWDn-0000dk-Tv; Tue, 10 May 2022 22:12:41 +0200
Message-ID: <24a56892-adb3-809c-8c35-b5b5f001c283@igalia.com>
Date: Tue, 10 May 2022 17:11:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 01/30] x86/crash,reboot: Avoid re-disabling VMX in all
 CPUs on crash/restart
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-2-gpiccoli@igalia.com> <Ynk40U/KA+hLBZRC@google.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <Ynk40U/KA+hLBZRC@google.com>
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
 linux-xtensa@linux-xtensa.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com,
 john.ogness@linutronix.de, bhe@redhat.com, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, "David P . Reed" <dpreed@deepplum.com>,
 mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com,
 xen-devel@lists.xenproject.org, dyoung@redhat.com, vgoyal@redhat.com,
 pmladek@suse.com, dave.hansen@linux.intel.com, keescook@chromium.org,
 arnd@arndb.de, linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 rostedt@goodmis.org, rcu@vger.kernel.org, gregkh@linuxfoundation.org,
 bp@alien8.de, luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 vkuznets@redhat.com, linux-edac@vger.kernel.org, jgross@suse.com,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org, kernel@gpiccoli.net,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/05/2022 12:52, Sean Christopherson wrote:
> I find the shortlog to be very confusing, the bug has nothing to do with disabling
> VMX and I distinctly remember wrapping VMXOFF with exception fixup to prevent doom
> if VMX is already disabled :-).  The issue is really that nmi_shootdown_cpus() doesn't
> play nice with being called twice.
> 

Hey Sean, OK - I agree with you, the issue is really about the double
list addition.

> [...]
> 
> Call stacks for the two callers would be very, very helpful.
> [...]

> This feels like were just adding more duct tape to the mess.  nmi_shootdown() is
> still unsafe for more than one caller, and it takes a _lot_ of staring and searching
> to understand that crash_smp_send_stop() is invoked iff CONFIG_KEXEC_CORE=y, i.e.
> that it will call smp_ops.crash_stop_other_cpus() and not just smp_send_stop().
> 
> Rather than shared a flag between two relatively unrelated functions, what if we
> instead disabling virtualization in crash_nmi_callback() and then turn the reboot
> call into a nop if an NMI shootdown has already occurred?  That will also add a
> bit of documentation about multiple shootdowns not working.
> 
> And I believe there's also a lurking bug in native_machine_emergency_restart() that
> can be fixed with cleanup.  SVM can also block INIT and so should be disabled during
> an emergency reboot.
> 
> The attached patches are compile tested only.  If they seem sane, I'll post an
> official mini series.

Thanks Sean, it makes sense - my patch is more a "band-aid" whereas
yours fixes it in a more generic way. Confess I found the logic of your
patch complex, but as you said, it requires a *lot* of code analysis to
understand these multiple shutdown patches, the problem is complicated
by nature heh

I've tested your patch 0001 and it works well for all cases [0], so go
ahead and submit the miniseries, feel free to add:

Reported-and-tested-by: Guilherme G. Piccoli <gpiccoli@igalia.com>


I've read patch 0002 and it makes sense to me as well, a good proactive
bug fix =)

With that said, I'll of course drop this one from V2 of this series.
Cheers,


Guilherme




[0]
A summary of my tests and the code paths that the panic shutdown take
depending on some conditions:

New function that disables VMX/SVM: cpu_crash_disable_virtualization()
[should be executed in every online CPU on shutdown)

The panic path triggers the following call stacks depending on kdump and
post_notifiers:


(1) kexec/kdump + !crash_kexec_post_notifiers
->machine_crash_shutdown()
----.crash_shutdown() <custom handler>
------native_machine_crash_shutdown() [all custom handlers except Xen PV
call the native generic function]
--------crash_smp_send_stop()
----------kdump_nmi_shootdown_cpus()
------------nmi_shootdown_cpus(kdump_nmi_callback)
--------------crash_nmi_callback()
----------------kdump_nmi_callback()
------------------cpu_crash_disable_virtualization()


(2) kexec/kdump + crash_kexec_post_notifiers
->crash_smp_send_stop()
----kdump_nmi_shootdown_cpus()
------nmi_shootdown_cpus(kdump_nmi_callback)
--------crash_nmi_callback()
----------kdump_nmi_callback()
------------cpu_crash_disable_virtualization()

After this path, will execute machine_crash_shutdown() but
crash_smp_send_stop()
is guarded against double execution. Also, emergency restart calls
emergency_vmx_disable_all() .


(3) !kexec/kdump + crash_kexec_post_notifiers

Same as (2)


(4) !kexec/kdump + !crash_kexec_post_notifiers
-> smp_send_stop()
----native_stop_other_cpus()
------apic_send_IPI_allbutself(REBOOT_VECTOR)
--------sysvec_reboot
----------cpu_emergency_vmxoff() <if the IPI approach succeeded, CPU
stopped here>

If not:
------register_stop_handler()
--------apic_send_IPI_allbutself(NMI_VECTOR)
----------smp_stop_nmi_callback()
------------cpu_emergency_vmxoff()

After that, emergency_vmx_disable_all() gets called in the emergency
restart path as well.
