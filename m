Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 688A152EABC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 13:25:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4PXW1zJXz3ccy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 21:25:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=eqnE/suL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=eqnE/suL; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4PWr6xYwz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 21:24:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DGPrrkXTp6oI8cbbgByz5QLKv15GNHxUgmjuIwTAy/E=; b=eqnE/suLTpG3xbkMCBtDpxLY3n
 NIRgLQiaBi0sCvdNCD4AFRLhJwRt1fDLW5HSSGFY7WXFEGFCYXn6Q0dC8gIFph3vTjXA6DvyBiQwz
 I5PwxVn4HFAkq1g0udGCDh7f8awWYDjllyLtGAcRh6eSoRE6OIuNpAwHVy7SfEQenDYcne2doKiCl
 jXXzZQlRm486qDYGQtQ0jW8Ms6RtpLdk65Qcz7YJ7/YEdFvKdb+dzF1Re9Q6nwXZnFrLVKgAD5Mwb
 LfHsy0RngN1antwERG5D/EtoEWfAXqtoLg2k7TzZKasJtkGm7zpf+kH+Fd2GGS1HnQh8pXfJiIePS
 VAbFF/9w==;
Received: from 200-161-159-120.dsl.telesp.net.br ([200.161.159.120]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ns0jj-00Cb4k-Od; Fri, 20 May 2022 13:24:04 +0200
Message-ID: <ded31ec0-076b-2c5b-0fe6-0c274954821f@igalia.com>
Date: Fri, 20 May 2022 08:23:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 24/30] panic: Refactor the panic path
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>, Petr Mladek <pmladek@suse.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-25-gpiccoli@igalia.com> <Yn0TnsWVxCcdB2yO@alley>
 <d313eec2-96b6-04e3-35cd-981f103d010e@igalia.com>
 <20220519234502.GA194232@MiWiFi-R3L-srv>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20220519234502.GA194232@MiWiFi-R3L-srv>
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
 feng.tang@intel.com, "michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 hidehiro.kawai.ez@hitachi.com, sparclinux@vger.kernel.org, will@kernel.org,
 tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 john.ogness@linutronix.de, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Dave Young <dyoung@redhat.com>, vgoyal@redhat.com,
 linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com,
 keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org,
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

On 19/05/2022 20:45, Baoquan He wrote:
> [...]
>> I really appreciate the summary skill you have, to convert complex
>> problems in very clear and concise ideas. Thanks for that, very useful!
>> I agree with what was summarized above.
> 
> I want to say the similar words to Petr's reviewing comment when I went
> through the patches and traced each reviewing sub-thread to try to
> catch up. Petr has reivewed this series so carefully and given many
> comments I want to ack immediately.
> 
> I agree with most of the suggestions from Petr to this patch, except of
> one tiny concern, please see below inline comment.

Hi Baoquan, thanks! I'm glad you're also reviewing that =)


> [...]
> 
> I like the proposed skeleton of panic() and code style suggested by
> Petr very much. About panic_prefer_crash_dump which might need be added,
> I hope it has a default value true. This makes crash_dump execute at
> first by default just as before, unless people specify
> panic_prefer_crash_dump=0|n|off to disable it. Otherwise we need add
> panic_prefer_crash_dump=1 in kernel and in our distros to enable kdump,
> this is inconsistent with the old behaviour.

I'd like to understand better why the crash_kexec() must always be the
first thing in your use case. If we keep that behavior, we'll see all
sorts of workarounds - see the last patches of this series, Hyper-V and
PowerPC folks hardcoded "crash_kexec_post_notifiers" in order to force
execution of their relevant notifiers (like the vmbus disconnect,
specially in arm64 that has no custom machine_crash_shutdown, or the
fadump case in ppc). This led to more risk in kdump.

The thing is: with the notifiers' split, we tried to keep only the most
relevant/necessary stuff in this first list, things that ultimately
should improve kdump reliability or if not, at least not break it. My
feeling is that, with this series, we should change the idea/concept
that kdump must run first nevertheless, not matter what. We're here
trying to accommodate the antagonistic goals of hypervisors that need
some clean-up (even for kdump to work) VS. kdump users, that wish a
"pristine" system reboot ASAP after the crash.

Cheers,


Guilherme
