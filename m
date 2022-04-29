Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB5D515789
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 23:57:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqmZ62CtDz3bpT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 07:57:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=ECdoj8MP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=ECdoj8MP; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqmYT5Gnyz3bbL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 07:57:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eS25PhwvZQoNO/vrdkaYeu8w1J4I4bLwd4ZTs99JyTA=; b=ECdoj8MPrPw94rqNJkzG67Xg6u
 5w3+r9FZKL3W6Sz5zRa77JB5F86agKTzGYxwlLLEiZXrXTSk2m+k2FuOzlO52C0njkoCAxgy+FOi4
 NbVcSL4Lztxu2l4Ffp2YNwJJ/Y8NKCykCEJYOFD8NTX9U/x1OlE0AF3cSiTkk6ArLGAdmnn9RzvKe
 +YDGf9dxyEhvGPz5vqubLFDl4xc7G7O1n7kxIDUk0ceOUg9ZGVixjcU3/TKND9q/DVjCWl1sG0kaE
 cUjiBbJ/0Gd+0GoqtFAQ2G5bnqvlp008GZC0sOTWOBCZAoUh5dk2HlkdBig7SM6f3egXphVF+FJ+M
 iEBg1fYA==;
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nkYbf-00026w-BA; Fri, 29 Apr 2022 23:56:55 +0200
Message-ID: <32495ca6-d79a-a932-a8e3-19ef54c44c48@igalia.com>
Date: Fri, 29 Apr 2022 18:56:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 02/30] ARM: kexec: Disable IRQs/FIQs also on crash CPUs
 shutdown path
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Marc Zyngier <maz@kernel.org>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-3-gpiccoli@igalia.com> <87mtg392fm.wl-maz@kernel.org>
 <71d829c4-b280-7d6e-647d-79a1baf9408b@igalia.com>
 <Ymxcaqy6DwhoQrZT@shell.armlinux.org.uk>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <Ymxcaqy6DwhoQrZT@shell.armlinux.org.uk>
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
 feng.tang@intel.com, "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 hidehiro.kawai.ez@hitachi.com, sparclinux@vger.kernel.org, will@kernel.org,
 tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 john.ogness@linutronix.de, bhe@redhat.com, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, dyoung@redhat.com, vgoyal@redhat.com,
 pmladek@suse.com, dave.hansen@linux.intel.com, keescook@chromium.org,
 arnd@arndb.de, linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 rostedt@goodmis.org, rcu@vger.kernel.org, gregkh@linuxfoundation.org,
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

On 29/04/2022 18:45, Russell King (Oracle) wrote:
> [...]
>> Marc, I did some investigation in the code (and tried/failed in the ARM
>> documentation as well heh), but this is still not 100% clear for me.
>>
>> You're saying IPI calls disable IRQs/FIQs by default in the the target
>> CPUs? Where does it happen? I'm a bit confused if this a processor
>> mechanism, or it's in code.
> 
> When we taken an IRQ, IRQs will be masked, FIQs will not. IPIs are
> themselves interrupts, so IRQs will be masked while the IPI is being
> processed. Therefore, there should be no need to re-disable the
> already disabled interrupts.
> 
>> But crash_smp_send_stop() is different, it seems to IPI the other CPUs
>> with the flag IPI_CALL_FUNC, which leads to calling
>> generic_smp_call_function_interrupt() - does it disable interrupts/FIQs
>> as well? I couldn't find it.
> 
> It's buried in the architecture behaviour. When the CPU takes an
> interrupt and jumps to the interrupt vector in the vectors page, it is
> architecturally defined that interrupts will be disabled. If they
> weren't architecturally disabled at this point, then as soon as the
> first instruction is processed (at the interrupt vector, likely a
> branch) the CPU would immediately take another jump to the interrupt
> vector, and this process would continue indefinitely, making interrupt
> handling utterly useless.
> 
> So, you won't find an explicit instruction in the code path from the
> vectors to the IPI handler that disables interrupts - because it's
> written into the architecture that this is what must happen.
> 
> IRQs are a lower priority than FIQs, so FIQs remain unmasked.
> 

Thanks a lot for the *great* explanation Russell, much appreciated.
So, this leads to the both following questions:

a) Shall we then change the patch to only disable FIQs, since it's panic
path and we don't want secondary CPUs getting interrupted, but only
spinning quietly "forever"?

b) How about cleaning ipi_cpu_stop() then, by dropping the call to
local_irq_disable() there, to avoid the double IRQ disabling?

Thanks,


Guilherme
