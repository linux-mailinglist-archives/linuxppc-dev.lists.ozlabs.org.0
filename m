Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EFA52A60B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 17:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2fvX2BCmz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 01:20:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=giQ6MXmB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=giQ6MXmB; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2fts2v6zz3cDm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 01:20:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wF3LghB7qFMkIN+RAhS0nW2784Fxel03VlqG6SoZfk8=; b=giQ6MXmBG17+JbZaHvCpLgBjCU
 FwsDXgX/b02O0QP8I+vkUwgy5+Lo+D5E+EJOGL5/JJvM2lmeYDRT6QF5s/JgDpbjXa08hzTZAOCcp
 H5UDG57PmVcXgDQ83UJ5J0cHOAPIvQgCaZLx9/QPzE06aTWYPlZURlCiNkAkSPoI1FmBlizReQXpJ
 dIElRXTKibRc33b/9HZXXl+Wf0mzN1goXhA+a9ZGenrB/fdH27xO8ledb2joDR0cLh2vGAmqvotM+
 JR0bWUJ+tmRYLx16LGJtXMspUiQTF3daEYzd/24Q2VypEyjqgtCV1aoMRt2LQ9YZpXkratOMOe37t
 53QKNYiQ==;
Received: from 200-161-159-120.dsl.telesp.net.br ([200.161.159.120]
 helo=[192.168.1.60]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nqyyz-008b70-84; Tue, 17 May 2022 17:19:33 +0200
Message-ID: <bc485d09-0958-0ddc-7b2d-cbc806cf6a01@igalia.com>
Date: Tue, 17 May 2022 12:19:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 14/30] panic: Properly identify the panic event to the
 notifiers' callbacks
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-15-gpiccoli@igalia.com> <YnqBsXBImU64PAOL@alley>
 <244a412c-4589-28d1-bb77-d3648d4f0b12@igalia.com> <YoOe7ifxfW8CEHdt@alley>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <YoOe7ifxfW8CEHdt@alley>
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

On 17/05/2022 10:11, Petr Mladek wrote:
> [...]
>> You mentioned 2 cases:
>>
>> (a) Same notifier_list used in different situations;
>>
>> (b) Same *notifier callback* used in different lists;
>>
>> Mine is case (b), right? Can you show me an example of case (a)?
> 
> There are many examples of case (a):
> 
> [... snip ...] 
> These all call the same list/chain in different situations.
> The situation is distinguished by @val.
> 
> 
>> You can see in the following patches (or grep the kernel) that people are using
>> this identification parameter to determine which kind of OOPS trigger
>> the callback to condition the execution of the function to specific
>> cases.
> 
> Could you please show me some existing code for case (b)?
> I am not able to find any except in your patches.
> 

Hi Petr, thanks for the examples - I agree with you. In the end, seems
I'm kind of abusing the API. This id is used to distinguish different
situations in which the callback is called, but in the same
"realm"/notifier list.

In my case I have different list calling the same callback and
(ab-)using the id to make distinction. I can rework the patches using
pointer comparison, it's fine =)

So, I'll drop this patch in V2.

> Anyway, the solution in 16th patch is bad, definitely.
> hv_die_panic_notify_crash() uses "val" to disinguish
> both:
> 
>      + "panic_notifier_list" vs "die_chain"
>      + die_val when callen via "die_chain"
> 
> The API around "die_chain" API is not aware of enum panic_notifier_val
> and the API using "panic_notifier_list" is not aware of enum die_val.
> As I said, it is mixing apples and oranges and it is error prone.
> 

OK, I'll re-work that patch - there's more there to be changed, that one
is complex heheh

Cheers!
