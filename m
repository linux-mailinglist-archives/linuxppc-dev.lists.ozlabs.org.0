Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC825158FF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 01:30:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kqpcl6nrNz3cCx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 09:30:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=UOUUrMsz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=UOUUrMsz; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqjTh2Xq5z2xrc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 05:38:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+2llGFga5QkASn4XVi2aetavO7ILP6dASiYzMijceyQ=; b=UOUUrMszI73hVVDlQl0qMGKpgi
 SURYnynivwToxWlxRFNHZuJUlYACg3pOlToF9uePQZKQj9Jh28x9HqFS+8ma2UKNqqfTZIoq5qPoX
 ZjKu0SXAHcAaL5fBZDxiontPvDun5f7GYgdbt4dCuiMpqF5UK3BAq1NYYAup9oZJISpA3f/6msVNv
 KxEGWm1/bKbhG1suPPcwhVBlVUZnIQWEhpqD+ct/zjPgjlzryTF/5q8gZE+Q8KVJ4Te371qBOe3Ly
 SxwsyKvT3lKFnIB4YpgxZ/QTp4/T994RncLE2AybyAnDHh154KcaeR4cHIlVzuqXykPOlGP9iLWEL
 6VZKIX4Q==;
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nkWRh-000ALj-Dz; Fri, 29 Apr 2022 21:38:29 +0200
Message-ID: <88b19a1c-7cea-9a28-3770-e235c286efed@igalia.com>
Date: Fri, 29 Apr 2022 16:38:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 18/30] notifier: Show function names on notifier routines
 if DEBUG_NOTIFIERS is set
Content-Language: en-US
To: Xiaoming Ni <nixiaoming@huawei.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-19-gpiccoli@igalia.com>
 <9f44aae6-ec00-7ede-ec19-6e67ceb74510@huawei.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <9f44aae6-ec00-7ede-ec19-6e67ceb74510@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 30 Apr 2022 09:26:41 +1000
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
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 sparclinux@vger.kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org, mikelley@microsoft.com,
 john.ogness@linutronix.de, corbet@lwn.net, paulmck@kernel.org,
 fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, Valentin Schneider <valentin.schneider@arm.com>,
 vgoyal@redhat.com, linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com,
 keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org,
 bp@alien8.de, luto@kernel.org, linux-tegra@vger.kernel.org,
 Cong Wang <xiyou.wangcong@gmail.com>, openipmi-developer@lists.sourceforge.net,
 andriy.shevchenko@linux.intel.com, Arjan van de Ven <arjan@linux.intel.com>,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 vkuznets@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/04/2022 22:01, Xiaoming Ni wrote:
> [...]
> Duplicate Code.
> 
> Is it better to use __func__ and %pS?
> 
> pr_info("%s: %pS\n", __func__, n->notifier_call);
> 
> 

This is a great suggestion Xiaoming, much appreciated!
I feel like reinventing the wheel here - with your idea, code was super
clear and concise, very nice suggestion!!

The only 2 things that diverge from your idea: I'm using '%ps' (not
showing offsets) and also, kept the wording "(un)registered/calling",
not using __func__ - I feel it's a bit odd in the output.
OK for you?

I'm definitely using your idea in V2 heh
Cheers,


Guilherme
