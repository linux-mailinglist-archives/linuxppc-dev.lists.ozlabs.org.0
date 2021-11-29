Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16500461514
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 13:30:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2l7Z6vqqz3c6D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 23:30:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U2tIEVQP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=U2tIEVQP; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2kHY737Rz2ymc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 22:52:39 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id t26so43816651lfk.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 03:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iWUEeMgXKbO77AD47foBEfa7mbQmssJKLzk8yjSOYSY=;
 b=U2tIEVQPLPCeMdCu1GCSmBGmgd4b3cE0YUaVA7Ptat003bULsFRIKB0ShMWsNVLpnC
 gIiNSuaR89vPD5NvBHVAJptiz6fEnTOzANkyKGw87fayadLAwoS9823DcSjh7ICj4+z3
 8BMKd+pKMrfT65KNK+2vA4wn0Ab/36kY6JZj8X/gHMh+mTKic7nzZ9Q5pTe+scSSAMrR
 oGXpQFc+Y/9JY1X3lRTxbgKArCnrSUBW7q8iJYRRAFJ8bg8FkN1DAbSGthXoerdFc3rX
 j1XUuuRyr6MK1Wp6xTbZoTqp3eksfHnUZLI3T8PZzPTIBG4u+ANjjJp1zdOJ3alnPslD
 h0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iWUEeMgXKbO77AD47foBEfa7mbQmssJKLzk8yjSOYSY=;
 b=DPd8pBK3MHFzBjVwzBrUDH9mJ82Jsqmwf0Lu45XHgB3XStXh+q7Dx39X8gORQ617lm
 vhY8jS/42vzlzfUGri94oHHzA2OBGn5szxdjaWTtwz9QRlr8Nzlt7FB+DCkC+QTgIU/d
 fJxKp2zpNCpA7ts1ROAl1xxXi4gOuMlxEBzvk+T6R5QSC4ee/UtZe1TmitcmZI9p5qEf
 zawXm27zoZTy65ZwRYOkC4n6UAoY4bnzHBLI+RX0I+4G3crmRW156MfM6MLYxEN/PqXG
 w5Tr130E0KiB3iFWiIws2TNDuYY9nGitrVW9drKwLSf3DSiKfHgdR9HrN9VfDT1HgtRc
 +Plg==
X-Gm-Message-State: AOAM531lIVcHKHku0mV12oqxlG5Il4Ta0MpfyWroYYyYsB71ANPARPGS
 nKjnXCahuR8Q9Bn4jyOoFV8=
X-Google-Smtp-Source: ABdhPJyV4a2kK7Hf+W0BvWJCYp3tm9l5nhuE3mizXVMpliBSqh/r6CyMfNuIh0FZ0TT44eUwwVCrkw==
X-Received: by 2002:a05:6512:3a91:: with SMTP id
 q17mr46080008lfu.425.1638186755724; 
 Mon, 29 Nov 2021 03:52:35 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id o15sm1323059lfd.164.2021.11.29.03.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 03:52:35 -0800 (PST)
Subject: Re: [PATCH v4 08/25] kernel: Add combined power-off+restart handler
 call chain API
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <20211126180101.27818-1-digetx@gmail.com>
 <20211126180101.27818-9-digetx@gmail.com> <YaLQqks8cB0vWp6Q@qmqm.qmqm.pl>
 <9213569e-0f40-0df1-4710-8dab564e12d6@gmail.com>
 <YaPx0kY7poGpwCL9@qmqm.qmqm.pl>
 <1fa2d9d5-f5f6-77f5-adf6-827921acce49@gmail.com>
 <YaQgiLw03lPyvuhr@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <33d1dfa7-e90e-d174-7375-836c15e7f818@gmail.com>
Date: Mon, 29 Nov 2021 14:52:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaQgiLw03lPyvuhr@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 29 Nov 2021 23:30:17 +1100
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>, alankao@andestech.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Lee Jones <lee.jones@linaro.org>, linux-m68k@lists.linux-m68k.org,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org,
 linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

29.11.2021 03:36, Michał Mirosław пишет:
> On Mon, Nov 29, 2021 at 12:53:51AM +0300, Dmitry Osipenko wrote:
>> 29.11.2021 00:17, Michał Mirosław пишет:
>>>> I'm having trouble with parsing this comment. Could you please try to
>>>> rephrase it? I don't see how you could check whether power-off handler
>>>> is available if you'll mix all handlers together.
>>> If notify_call_chain() would be fixed to return NOTIFY_OK if any call
>>> returned NOTIFY_OK, then this would be a clear way to gather the
>>> answer if any of the handlers will attempt the final action (reboot or
>>> power off).
>> Could you please show a code snippet that implements your suggestion?
> 
> A rough idea is this:
> 
>  static int notifier_call_chain(struct notifier_block **nl,
>  			       unsigned long val, void *v,
>  			       int nr_to_call, int *nr_calls)
>  {
> -	int ret = NOTIFY_DONE;
> +	int ret, result = NOTIFY_DONE;
>  	struct notifier_block *nb, *next_nb;
>  
>  	nb = rcu_dereference_raw(*nl);
>  
>  	while (nb && nr_to_call) {
> ...
>  		ret = nb->notifier_call(nb, val, v);
> +
> +		/* Assuming NOTIFY_STOP-carrying return is always greater than non-stopping one. */
> +		if (result < ret)
> +			result = ret;
> ... 
>  	}
> -	return ret;
> +	return result;
>  }
> 
> Then:
> 
> bool prepare_reboot()
> {
> 	int ret = xx_notifier_call_chain(&shutdown_notifier, PREPARE_REBOOT, ...);
> 	return ret == NOTIFY_OK;
> }
> 
> And the return value would signify whether the reboot will be attempted
> when calling the chain for the REBOOT action. (Analogously for powering off.)

If you started to execute call chain, then you began the power-off /
restart sequence, this is a point of no return. Sorry, I still don't
understand what you're trying to achieve.

The approach of having separate call chains is simple and intuitive, I
don't see reasons to change it.
