Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6364243F439
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 03:04:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgPMZ1r0Mz3cYF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 12:04:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fN/sghTD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fN/sghTD; dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgKFY65pNz2xr5;
 Fri, 29 Oct 2021 08:58:39 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id e2so13100020ljg.13;
 Thu, 28 Oct 2021 14:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c23uil5g78FyKWMRLgZ6hSpJ/5dZjfgZdNOr6DwhpW8=;
 b=fN/sghTD1TZsVWGg7UdNVpmnpsJmxwTIReywOn3iS879FfwyrwTro/6JMf4MaGrEqh
 0NHbUx8tMPVCykH7rLffN6x80gPATjYeRH0X7Rke1JX3QXf40ikAhOl25K5S1BWImyNK
 Ws74ZKNhvY45yMsuq3FCKQn2UeHbmrvMca8cD6CCJ0R2lYcZYJkrBjgifHSN/5oWm7n1
 lFtQ6NQQUb7L/5VMhM9mJogVid13IyjOv29tIrHnCgMGRUpYmk/I5bl/5lJ21eD61OSt
 uVSSMkzEczkDy+3W/RlWkglTIAMMvdWcaEVw6izXBz+EOktxUqL8EL8FpyIQN0i0+0ax
 cKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c23uil5g78FyKWMRLgZ6hSpJ/5dZjfgZdNOr6DwhpW8=;
 b=bCNhG3T9/2OyDfeCbCXT43EuzWZhaESnOOSh3vZNo+4U9mSX8Bzn//UwATnJkVNUMi
 +3t8qSSJBzbcShlnTixogAT3jd6Lo4IH2qALZ/DS7h20v4PFfdOK8KSLvaeq0BaaPtwa
 hr346eyU2EVWmO3rhROrHVCF6qD2krqtTse6kLqzyCYRuwBR4mVUwWEeSRiL/gW0uDZb
 9VWDwmCWncW4TLxw3KHlatZ2LN9mZizAb06ntGLNPXVVkUOMcLLBoJn8VOsxqiv0CLb6
 UcQkbSvWfqQHU42LNWZO9uq1r9/vzUSoDst1MdrKAf/UuIRLl1dsx2cyM/ebwG2ye33N
 luuA==
X-Gm-Message-State: AOAM532betUl6ySuTO25Jo2UGze52idwQ6qDwcEIly9GtznpuQDprS7a
 fFSpo80dpxuYY9Xgq+sdPXs=
X-Google-Smtp-Source: ABdhPJwU+yd9K4RKqPYJGKdWrmOtthi6PCwOlEc1MXGCnrTPBunu0coGknm3bBb5A7s1sx8AG2GBkw==
X-Received: by 2002:a2e:b88f:: with SMTP id r15mr7402126ljp.157.1635458314886; 
 Thu, 28 Oct 2021 14:58:34 -0700 (PDT)
Received: from [192.168.2.145] (46-138-44-18.dynamic.spd-mgts.ru.
 [46.138.44.18])
 by smtp.googlemail.com with ESMTPSA id t17sm248350ljc.136.2021.10.28.14.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 14:58:34 -0700 (PDT)
Subject: Re: [PATCH v2 08/45] kernel: Add combined power-off+restart handler
 call chain API
To: "Rafael J. Wysocki" <rafael@kernel.org>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-9-digetx@gmail.com>
 <CAJZ5v0gpu2ezMhWr=grg6M8aWAx58DQozbXHoZaiPqUaZxJi4Q@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <28560da7-8ab6-3bd5-b4d6-e34b21a9bbb0@gmail.com>
Date: Fri, 29 Oct 2021 00:58:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gpu2ezMhWr=grg6M8aWAx58DQozbXHoZaiPqUaZxJi4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Oct 2021 12:02:21 +1100
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
 Thomas Gleixner <tglx@linutronix.de>, Tomer Maimon <tmaimon77@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 the arch/x86 maintainers <x86@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-ia64@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra <linux-tegra@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Nancy Yuen <yuenn@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linux PM <linux-pm@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, openbmc@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

28.10.2021 12:59, Rafael J. Wysocki пишет:
>> +#define RESTART_PRIO_RESERVED          0
>> +#define RESTART_PRIO_DEFAULT           128
>> +#define RESTART_PRIO_HIGH              192
>>
>>  enum reboot_mode {
>>         REBOOT_UNDEFINED = -1,
>> @@ -49,6 +55,167 @@ int register_restart_handler(struct notifier_block *);
>>  int unregister_restart_handler(struct notifier_block *);
>>  void do_kernel_restart(char *cmd);
>>
>> +/*
>> + * Unified poweroff + restart API.
>> + */
>> +
>> +#define POWEROFF_PRIO_RESERVED         0
>> +#define POWEROFF_PRIO_PLATFORM         1
>> +#define POWEROFF_PRIO_DEFAULT          128
>> +#define POWEROFF_PRIO_HIGH             192
>> +#define POWEROFF_PRIO_FIRMWARE         224
> Also I'm wondering why these particular numbers were chosen, here and above?

These values are chosen based on priorities that drivers already use. I looked thorough them all and ended with this scheme that fulfills the needs of the current API users.

I'll add these comments in v3:

/*
 * Standard restart priority levels. Intended to be set in the
 * sys_off_handler.restart_priority field.
 *
 * Use `RESTART_PRIO_XXX +- prio` style for additional levels.
 *
 * RESTART_PRIO_RESERVED:	Falls back to RESTART_PRIO_DEFAULT.
 *				Drivers may leave priority initialized
 *				to zero, to auto-set it to the default level.
 *
 * RESTART_PRIO_DEFAULT:	Use this for generic handler.
 *
 * RESTART_PRIO_HIGH:		Use this if you have multiple handlers and
 *				this handler has higher priority than the
 *				default handler.
 */

/*
 * Standard power-off priority levels. Intended to be set in the
 * sys_off_handler.power_off_priority field.
 *
 * Use `POWEROFF_PRIO_XXX +- prio` style for additional levels.
 *
 * POWEROFF_PRIO_RESERVED:	Falls back to POWEROFF_PRIO_DEFAULT.
 *				Drivers may leave priority initialized
 *				to zero, to auto-set it to the default level.
 *
 * POWEROFF_PRIO_PLATFORM:	Intended to be used by platform-level handler.
 *				Has lowest priority since device drivers are
 *				expected to take over platform handler which
 *				doesn't allow further callback chaining.
 *
 * POWEROFF_PRIO_DEFAULT:	Use this for generic handler.
 *
 * POWEROFF_PRIO_HIGH:		Use this if you have multiple handlers and
 *				this handler has higher priority than the
 *				default handler.
 *
 * POWEROFF_PRIO_FIRMWARE:	Use this if handler uses firmware call.
 *				Has highest priority since firmware is expected
 *				to know best how to power-off hardware properly.
 */
