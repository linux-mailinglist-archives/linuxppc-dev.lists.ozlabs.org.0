Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BCA515293
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 19:46:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kqfzs1L2tz3cFS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 03:46:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=McsgIEmW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=McsgIEmW; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kqbl06cpVz2xBk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 01:19:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PkGMRtr7ZOpuAUYdkK5YcnBWQgNByIkM+TF/PhPSt00=; b=McsgIEmWszU/NtZ864aphbd05/
 AA+Hs7uyIJtJtMr4867fKRnrcDZ/B0ve7meILjRDqPYrpj2SCcZq87R4becMzN/EmmpSkGxa2bXfq
 pUhMsFJRA7hiMl/hulL8uwaQ3NgTviAzyrP9F3cuPytnlSXUcQgJY1SVDx/EfT4PyEI3blubrtgBl
 Y/qFy6eJFuUH765RC4uiwWYgWdDuIIe2xttNarhTtSLeO0f5vFGPmxPe8sb1rSPH9MLQ8MhCgLKVk
 8Yh9XWbluokYf/vW7/yQXLp3HdC2BoK3CBL6+DlGPNeddie6sMCK3FiVbeA/PpCZCA2PeX8k9qatt
 P0Tqe4Tg==;
Received: from [179.113.53.197] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1nkSOj-000BaQ-FP; Fri, 29 Apr 2022 17:19:09 +0200
Message-ID: <31248811-d3ed-63dd-e255-c3be07fb1434@igalia.com>
Date: Fri, 29 Apr 2022 12:18:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Content-Language: en-US
To: minyard@acm.org, elder@ieee.org, Alex Elder <elder@kernel.org>,
 cminyard@mvista.com
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com>
 <20220428162616.GE442787@minyard.net>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20220428162616.GE442787@minyard.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 30 Apr 2022 03:44:36 +1000
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
Cc: Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 stern@rowland.harvard.edu, xen-devel@lists.xenproject.org,
 Matt Turner <mattst88@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, pmladek@suse.com,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org, luto@kernel.org,
 tglx@linutronix.de, Richard Henderson <rth@twiddle.net>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sven Schnelle <svens@linux.ibm.com>, akpm@linux-foundation.org,
 linux-hyperv@vger.kernel.org, dave.hansen@linux.intel.com,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-s390@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Helge Deller <deller@gmx.de>, vgoyal@redhat.com, mhiramat@kernel.org,
 linux-xtensa@linux-xtensa.org, john.ogness@linutronix.de,
 hidehiro.kawai.ez@hitachi.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 James Morse <james.morse@arm.com>, kernel-dev@igalia.com,
 fabiomirmar@gmail.com, halves@canonical.com, alejandro.j.jimenez@oracle.com,
 feng.tang@intel.com, will@kernel.org, bhe@redhat.com, corbet@lwn.net,
 Dexuan Cui <decui@microsoft.com>, bcm-kernel-feedback-list@broadcom.com,
 Robert Richter <rric@kernel.org>, keescook@chromium.org, arnd@arndb.de,
 Haiyang Zhang <haiyangz@microsoft.com>, rostedt@goodmis.org,
 rcu@vger.kernel.org, bp@alien8.de, openipmi-developer@lists.sourceforge.net,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-parisc@vger.kernel.org,
 linux-alpha@vger.kernel.org, peterz@infradead.org,
 linux-remoteproc@vger.kernel.org, mikelley@microsoft.com,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-leds@vger.kernel.org, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org, mingo@redhat.com,
 dyoung@redhat.com, paulmck@kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-tegra@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 Johannes Berg <johannes@sipsolutions.net>, linux-edac@vger.kernel.org,
 jgross@suse.com, netdev@vger.kernel.org, kernel@gpiccoli.net,
 kexec@lists.infradead.org, linux-mips@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28/04/2022 13:26, Corey Minyard wrote:
> [...]
> 
> For the IPMI portion:
> 
> Acked-by: Corey Minyard <cminyard@mvista.com>

Thanks Alex and Corey for the ACKs!

> 
> Note that the IPMI panic_event() should always return, but it may take
> some time, especially if the IPMI controller is no longer functional.
> So the risk of a long delay is there and it makes sense to move it very
> late.
> 

Thanks, I agree - the patch moves it to the (latest - 1) position, since
some arch code might run as the latest and effectively stops the machine.
Cheers,


Guilherme
