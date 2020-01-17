Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AF31402EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 05:18:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zSVP5RfZzDqn5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 15:18:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=landley.net
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=rob@landley.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=landley-net.20150623.gappssmtp.com
 header.i=@landley-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=YpgoWq+f; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zSS73QJSzDqmX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 15:16:34 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id k197so10996917pga.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 20:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mRpBlfriiKBtpHdle3gY+6OvDi0xi+PHO3+1yxBhNW0=;
 b=YpgoWq+f5KBHqJRceCkoXiAZ2cahZQK+2UyaAJe+K9OIe+XXcWUZL8U209yNlM3H75
 KA7pvnOh+24zjdkJ7WMUJ3KA1+3nkIcrRF31rPO++SI7wQlThs4GJGs5B3nYoQLKW5HT
 2eh3iHvTi3Xy88JGMBRbo122EsU8mcdZ/ksMWQv5AaykeNtw4L241TPf0aaaNgQ6oplO
 UcCJxtf9XAGTsWbYYHU+gy2NpZnW2+Cl0nQVAovymBpgWIrdrUczQb4tNfSu/jIOSSvr
 fG9ZirxeCQXz5lZPNcJRcNLxJM6Wbp3fKAwDJBz0ddZdtMZOh9o+PFBxxH/QKym4+LGz
 VCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mRpBlfriiKBtpHdle3gY+6OvDi0xi+PHO3+1yxBhNW0=;
 b=ApBjp6VNYlDznVOW8JYDuJlccnDqfddi3eMbpuk2DnZZZr7e7HFN1zzXbO94TUEeUx
 36z3fofRqA+v/chW52/FEtVR29za6xoFlesDLokp8dYoH3BLtYHF5V+EJw2TAVUUBUIQ
 BsnzgKEZN/xq0PwU9YDLMTIhg7H4LKqgfkLglzsge8KZjma2kQPPPKg33aVtTlCzj2Ps
 YAnDCNuoIkjgFNHEIOFaXkuONLqmRqQAgZb3TbrZ7PJTs0dEcJaYDP15XhmI5ewbDZKu
 DYwwQscFZBqpdoMMEhssag0xyQg4Z5dkUWk0J8BSrg+NstIPg+aiQfjW/3Y30eV4XrRC
 OrBw==
X-Gm-Message-State: APjAAAVxqA4dQy422yrXsJgPhfLhg+38kSyZqx/5X53MFo3hfEYeX0FK
 DAF+zn740aXX2dUuOu8whIiP/g==
X-Google-Smtp-Source: APXvYqxeLUKQP31a9O4MOSQTYDXXhKgO23RrfuN2OHejqkFLLCBgUZ8QQnxFYMZQ3Ktxo8BDhU+O2Q==
X-Received: by 2002:a62:e30d:: with SMTP id g13mr1054005pfh.92.1579234591085; 
 Thu, 16 Jan 2020 20:16:31 -0800 (PST)
Received: from [192.168.11.4] (softbank126112255110.biz.bbtec.net.
 [126.112.255.110])
 by smtp.googlemail.com with ESMTPSA id l66sm26355096pga.30.2020.01.16.20.16.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Jan 2020 20:16:30 -0800 (PST)
Subject: Re: [PATCH RESEND v4] reboot: support offline CPUs before reboot
To: Hsin-Yi Wang <hsinyi@chromium.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20200114110620.164861-1-hsinyi@chromium.org>
From: Rob Landley <rob@landley.net>
Message-ID: <a701522f-73aa-2277-4a25-f84a27f38118@landley.net>
Date: Thu, 16 Jan 2020 22:20:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200114110620.164861-1-hsinyi@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 linux-s390@vger.kernel.org, linux-csky@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@nokia.com>, Fenghua Yu <fenghua.yu@intel.com>,
 linux-pm@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Stephen Boyd <swboyd@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Pavankumar Kondeti <pkondeti@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, Jiri Kosina <jkosina@suse.cz>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/14/20 5:06 AM, Hsin-Yi Wang wrote:
> This patch adds a config ARCH_OFFLINE_CPUS_ON_REBOOT, which would offline cpus in
> migrate_to_reboot_cpu(). If non reboot cpus are all offlined here, the loop for
> checking online cpus would be an empty loop. If architecture don't enable this
> config, or some cpus somehow fails to offline, it would fallback to ipi
> function.

I'm curious:

> +# Select to do a full offline on secondary CPUs before reboot.
> +config ARCH_OFFLINE_CPUS_ON_REBOOT
> +	bool "Support for offline CPUs before reboot"
> +	depends on HOTPLUG_CPU

The new symbol can't be selected without the other symbol.

> +	select ARCH_OFFLINE_CPUS_ON_REBOOT if HOTPLUG_CPU

And the other symbol automatically selects the new one.

Why are you adding a second symbol that means the same thing as the existing symbol?

> +#if defined(CONFIG_PM_SLEEP_SMP) || defined(CONFIG_ARCH_OFFLINE_CPUS_ON_REBOOT)
> +extern int freeze_secondary_cpus(int primary, bool reboot);
> +#endif

Couldn't that just test HOTPLUG_CPU? What's the second symbol for? (You can have
empty stub functions when architectures don't support a thing...)

Rob
