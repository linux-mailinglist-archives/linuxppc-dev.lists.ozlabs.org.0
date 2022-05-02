Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2049D517A3D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 00:55:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsdjF6YyMz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 08:55:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n+sdzeWg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=n+sdzeWg; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsS1K4zN9z3064
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 01:38:45 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id k14so11998703pga.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 May 2022 08:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xdAYU3mu3q5iKW/q53x7SG0PmMFu/IJ99F9X+I1LBFA=;
 b=n+sdzeWg2S/gnK+vDOIvL6IUbN3m/ZsZjzFb11eZoR9Ocah7YJVO2WiV41qchObcfb
 DQoBAV7ZWycdznoAT+bkWgo/wu+1wDV1bIUkSxqup4K24uuli3THOxTxyw5X5d53wgme
 WcsN0rdXUDiQCbaE2BiYM+YRj9TzgmIUMpvqiw3DgUAYB77r1iQIEojYxiA62BjPH8RM
 iKwEObMzsKXIe5T1OWURADziMPdtdHkUN1OxLhRHsrdiQj28siLmQYHweNGUt6WE2RWU
 4RoD4QWsGkku1xASAbiwviIYb1qjscuQqHCmPnV7Xwb2MQ5+T3WoFFqH/wvbUUW3/9i6
 dZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xdAYU3mu3q5iKW/q53x7SG0PmMFu/IJ99F9X+I1LBFA=;
 b=YCe81kORVICj0MZFs2YJB/sRw0Y2VFkl/qnGhJvPdJCuf6MInsaXIKOOpa748pE9Nr
 YwGQ8cJnRtOYLf9fnWCiwx1WWf6s85RsvVZfbuV89nWckmWNJtt/Ia8s/Y5CmVIt8Eh7
 4GmCoFPgTeug/kkCAq2VNne6qk7Q4iEieol0Sxr2kyKisbVkNguaw7KLj7tWPQg0Awa1
 rmeDqe7L60xo/G4hugOHoMf9LWfHc1bzwD8xcylnmdAk34Obi28Vkh0v5A1jcQHpyGGy
 6UCvRCFoz50I93O1+zwoUesG9t3MJA/AuFYFkhaxB5iBMGar77aC386Io4DG973Obnt4
 B4CQ==
X-Gm-Message-State: AOAM530Irh4CQc/eA7w8aO9PqSt/4NYY58oMK0ct4LQI+WTQHmaPxcMG
 6lQWZbw9CtnBNlIcQrgFs0A=
X-Google-Smtp-Source: ABdhPJyFyZFQ5alP4D0nGrJsTy5roBCXXaX5AecPC5DucA/TU9ZDaKugYKQuLpePce1AAM16r6umMQ==
X-Received: by 2002:a05:6a00:846:b0:50d:f02f:bb46 with SMTP id
 q6-20020a056a00084600b0050df02fbb46mr4382838pfk.74.1651505921477; 
 Mon, 02 May 2022 08:38:41 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7800b000000b0050dc76281basm5027174pfi.148.2022.05.02.08.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 08:38:40 -0700 (PDT)
Message-ID: <a02821ab-db4f-5bff-2a98-7d74032a0652@gmail.com>
Date: Mon, 2 May 2022 08:38:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 06/30] soc: bcm: brcmstb: Document panic notifier action
 and remove useless header
Content-Language: en-US
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, akpm@linux-foundation.org,
 bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
References: <20220427224924.592546-1-gpiccoli@igalia.com>
 <20220427224924.592546-7-gpiccoli@igalia.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220427224924.592546-7-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 03 May 2022 08:54:19 +1000
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
 Markus Mayer <mmayer@broadcom.com>, gregkh@linuxfoundation.org,
 peterz@infradead.org, alejandro.j.jimenez@oracle.com,
 linux-remoteproc@vger.kernel.org, feng.tang@intel.com,
 linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 Justin Chen <justinpopo6@gmail.com>, sparclinux@vger.kernel.org,
 will@kernel.org, tglx@linutronix.de, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Doug Berger <opendmb@gmail.com>,
 mikelley@microsoft.com, john.ogness@linutronix.de, corbet@lwn.net,
 paulmck@kernel.org, fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 dyoung@redhat.com, vgoyal@redhat.com, linux-xtensa@linux-xtensa.org,
 dave.hansen@linux.intel.com, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, coresight@lists.linaro.org,
 linux-um@lists.infradead.org, rostedt@goodmis.org, rcu@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, bp@alien8.de, luto@kernel.org,
 linux-tegra@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, jgross@suse.com, Lee Jones <lee.jones@linaro.org>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org, kernel@gpiccoli.net,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 senozhatsky@chromium.org, d.hatayama@jp.fujitsu.com, mhiramat@kernel.org,
 kernel-dev@igalia.com, linux-alpha@vger.kernel.org, vkuznets@redhat.com,
 Brian Norris <computersforpeace@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/27/2022 3:49 PM, Guilherme G. Piccoli wrote:
> The panic notifier of this driver is very simple code-wise, just a memory
> write to a special position with some numeric code. But this is not clear
> from the semantic point-of-view, and there is no public documentation
> about that either.
> 
> After discussing this in the mailing-lists [0] and having Florian explained
> it very well, this patch just document that in the code for the future
> generations asking the same questions. Also, it removes a useless header.
> 
> [0] https://lore.kernel.org/lkml/781cafb0-8d06-8b56-907a-5175c2da196a@gmail.com
> 
> Fixes: 0b741b8234c8 ("soc: bcm: brcmstb: Add support for S2/S3/S5 suspend states (ARM)")
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Doug Berger <opendmb@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Justin Chen <justinpopo6@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Markus Mayer <mmayer@broadcom.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Likewise, I am not sure if the Fixes tag is necessary here.
-- 
Florian
