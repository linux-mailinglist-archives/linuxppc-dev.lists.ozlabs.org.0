Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4339E513FA6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 02:42:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqDGy128Wz3brt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 10:42:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=ByPVeKDw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ieee.org (client-ip=2607:f8b0:4864:20::130;
 helo=mail-il1-x130.google.com; envelope-from=elder@ieee.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256
 header.s=google header.b=ByPVeKDw; dkim-atps=neutral
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpyJr2R6Mz2yhD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 00:13:28 +1000 (AEST)
Received: by mail-il1-x130.google.com with SMTP id z12so2057539ilp.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 07:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bCT2JlxzOcDaE6ycYVbjB0p6hzfQxFS5OmPVl0XHT4A=;
 b=ByPVeKDwQRcuSB47O0Zefv/dFt5S0aRWMNs2oJF7maE4wXnsormuysnBE3KE+1D9p9
 PB3FB3BjkOR/97x+74MBqA5RA9WqHK53ukE6KnmiwNvHyxwXKz6iLxoZSM4bciItAhHz
 gddQYhhdQpsolBOdwDYZPGvNMFMyqb4ql/QD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bCT2JlxzOcDaE6ycYVbjB0p6hzfQxFS5OmPVl0XHT4A=;
 b=JZOrkpUC/8a+dtk/zqB1G+PGJkQkl46NYCY9pkf+ksDBNNRJCObSpy9oRLxItD3Jbt
 kJndd1GSDVD8KApwBUqBo6/N6vwMV5sMElY6qAkV0/1dK26ARHhEEOoP2l63EQk10btX
 6v8+Z3W68TuJfRw10IpTR1KPJ2zQOpzh6pJasM1bqoWck/1adZoy/BXSvT1VLDBldKoP
 IYxCGpmmwAw/jjvG0Gt1qBC55VVneIo+iQ82H56HdC+iGuVbeIV/EkS2cY0fBJ9yNwmN
 TGXjVC4OY7qxhwMxwtCxsuSd5V6PPJFIxoiDHw9mtpep+VnxodKSweN/gjyyQypvlt0f
 NdOA==
X-Gm-Message-State: AOAM533cA/jtxZoKzkg2QpBNYlPqsDe8GivBVOyi0a8ZCtocoF4zInl8
 en7s6nEGTB1Hc8Bvx39dNcj9uw==
X-Google-Smtp-Source: ABdhPJw448TngRonNTsTASYhGkruvfda4Cqi/x7py0vOs1UkbxiFSjNKZ9c5oG5pi/4oeINikW5dJA==
X-Received: by 2002:a92:cac3:0:b0:2c9:a265:4cab with SMTP id
 m3-20020a92cac3000000b002c9a2654cabmr13504351ilq.241.1651155203895; 
 Thu, 28 Apr 2022 07:13:23 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58]) by smtp.googlemail.com with ESMTPSA id
 y21-20020a6bc415000000b00648da092c8esm4431ioa.14.2022.04.28.07.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 07:13:23 -0700 (PDT)
Message-ID: <4cae140c-982a-6b9f-661c-4e0fdfa3297b@ieee.org>
Date: Thu, 28 Apr 2022 09:13:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 21/30] panic: Introduce the panic pre-reboot notifier list
Content-Language: en-US
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-22-gpiccoli@igalia.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20220427224924.592546-22-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 29 Apr 2022 10:42:18 +1000
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
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, luto@kernel.org, tglx@linutronix.de,
 Richard Henderson <rth@twiddle.net>, Alex Elder <elder@kernel.org>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sven Schnelle <svens@linux.ibm.com>, linux-hyperv@vger.kernel.org,
 dave.hansen@linux.intel.com,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-s390@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Corey Minyard <minyard@acm.org>,
 Helge Deller <deller@gmx.de>, vgoyal@redhat.com, mhiramat@kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
 john.ogness@linutronix.de, coresight@lists.linaro.org,
 hidehiro.kawai.ez@hitachi.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 James Morse <james.morse@arm.com>, kernel-dev@igalia.com,
 fabiomirmar@gmail.com, halves@canonical.com, alejandro.j.jimenez@oracle.com,
 feng.tang@intel.com, will@kernel.org, corbet@lwn.net,
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
 vkuznets@redhat.com, linux-edac@vger.kernel.org, jgross@suse.com,
 netdev@vger.kernel.org, kernel@gpiccoli.net, linux-mips@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/27/22 5:49 PM, Guilherme G. Piccoli wrote:
> This patch renames the panic_notifier_list to panic_pre_reboot_list;
> the idea is that a subsequent patch will refactor the panic path
> in order to better split the notifiers, running some of them very
> early, some of them not so early [but still before kmsg_dump()] and
> finally, the rest should execute late, after kdump. The latter ones
> are now in the panic pre-reboot list - the name comes from the idea
> that these notifiers execute before panic() attempts rebooting the
> machine (if that option is set).
> 
> We also took the opportunity to clean-up useless header inclusions,
> improve some notifier block declarations (e.g. in ibmasm/heartbeat.c)
> and more important, change some priorities - we hereby set 2 notifiers
> to run late in the list [iss_panic_event() and the IPMI panic_event()]
> due to the risks they offer (may not return, for example).
> Proper documentation is going to be provided in a subsequent patch,
> that effectively refactors the panic path.
> 
> Cc: Alex Elder <elder@kernel.org>

For "drivers/net/ipa/ipa_smp2p.c":

Acked-by: Alex Elder <elder@kernel.org>

> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Corey Minyard <minyard@acm.org>
> Cc: Dexuan Cui <decui@microsoft.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Robert Richter <rric@kernel.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Stephen Hemminger <sthemmin@microsoft.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Wei Liu <wei.liu@kernel.org>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
> 

. . .
