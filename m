Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AD292BB72
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 15:36:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=WjFRQ3+f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJMTk5j8cz3cXd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 23:36:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=WjFRQ3+f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=wahrenst@gmx.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 379 seconds by postgrey-1.37 at boromir; Tue, 09 Jul 2024 22:34:31 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJL5z38Grz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 22:34:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1720528457; x=1721133257; i=wahrenst@gmx.net;
	bh=cCtoGEQ65O0NQHMFrW3/EWkn5s4oTQM/d6IPIcz9pxI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WjFRQ3+fBr6G6+sZRSi+EsnNjB5fkUJTSjziHlICWpYYkb4dEr0jxth6LPsayKv1
	 TG8wL/ohWYPtRaDBJ/Etjvno9y5xp2z57xbBHYRRn302fxkUmRWFhF7vGzCV+3qoF
	 JnTpYKShnkG788hjeeOtzy2qp5EGZVfCI+Eaimq5IARwgHLcVz3jL+67uHbKTr1KC
	 1NBu1gY3xABkxz1BkqAFczx00dBGqR53dnrgBPd3gblSvF1f513nNOxfyGQHsAQBy
	 nKrrKe6R/p1aMSgT0nMEDmKFh9A0oCdtsLdFw9VN2SBW9+VfJW5PyY7bMuGQOZFXV
	 /1lB8NBdwWtwkeBW2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVN6t-1sqlVn12E3-00Oj39; Tue, 09
 Jul 2024 14:26:16 +0200
Message-ID: <6b7cfe69-4f72-490f-8e86-5343bd244a2d@gmx.net>
Date: Tue, 9 Jul 2024 14:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2855/tegra/omap2plus
To: Kevin Hilman <khilman@kernel.org>, Celeste Liu
 <coelacanthushex@gmail.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
 <20240530111947.549474-14-CoelacanthusHex@gmail.com>
 <7hv81f78cy.fsf@baylibre.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <7hv81f78cy.fsf@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Ej+PAwp/ZJkhkceEoIwv6AInmRQiACjrvJFoir5Nuj9E1MJRvQA
 hCU1+y5KPH/WQUoUAj38tdnqg1TsI3WE3557l+L+5Zlw+pyx5u7oihbFKJ0II0kgo4eAkC9
 Qtrhsw6GW7j6n1LaLGg2lE46GZtD/AMneN85Q7N1yqHtfnzmF3zlp8522hgdV6zM7JOCk4j
 tUDmMBQyL0KKRh3tZUkgw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:smlyma9wAu8=;7rlEUr3/uzNjD+PEf4GAgx6bVX6
 7D+KovUWZNaXojo5BEO1nKfJB5mY1KCPFp0p9S06Ap1FT+bpyOTXGEAzUTC9JPOHMGezoWMPH
 u7VikdIHD+lXW7jnwTFMIpMklpufhvkMyHfsP3Ed4/bVHe02j8o7oIWfYZjW6F17QL+peeJkd
 pU8m7SpUPLSkd8ibiy4unR6eLNbf1sqEWnrlhHsXybyUXatNCFSwOei1f+iRjbFg6AOjGrbm0
 7VmMG5bITj44kgxiiXD/06kRQ0EBB+b4DvB/7CywOh/c8qL5f51PPOCAoeQl8RDBrpvGsSpc1
 hdgcoDNP5vxNp9xn1yr1KM/crCu2M29CkZaN9/7TG5cvhjNLKNkazNiMZiMvGm+49XyiiiQio
 x2Q/P9FY7W5h0HsuqTDQ/j1cb3dhelb/J+mpWw4Y8bbH3JenaD/C8lcnQvJY0sw0YzxTo9Z4s
 XUiEkZnDyf96hjqfGTTWVsGxZOP7IOS7D+fMP5Zr8k5f/VDaXiZ3jnKvEaUvM9TRFlHi2FdoD
 l7pquU4msqD2cFWtroXHFf39TlPljStxQzpOzDBdT2WxDBdV9TaIIOyrcm/VN4a52EioqIZpH
 dMUfsQSqCXXyC1/uF0URoRKfuDMOPOTyAcUf18O1OpqWujiVnLu8Fkp4zyJhu/0lVUyfG8Ey1
 K8owjZUmqCisO16h7K8x5uzfumO3nCS37S1EvaCA7gqyVf4F7reUG/XhRDcMMRcf1m3YR61IN
 P+oIL/cBGYL28tj0hxTOhSKzuF+UAJiYehCaKofHzifrm8VmKIUUg2o0tZi3a2jH5ANbXpfrS
 k4M3opPi2o8VvcUA6AzuOEe6VATI/5f6Ep3e8zt7jzUbs=
X-Mailman-Approved-At: Tue, 09 Jul 2024 23:36:08 +1000
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
Cc: Rich Felker <dalias@libc.org>, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Tony Lindgren <tony@atomide.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Palmer Dabbelt <palmer@rivosinc.com>, linux-mips@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Guo Ren <guoren@kernel.org>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, Sven Joachim <svenjoac@gmx.de>, Mykola Lysenko <mykolal@fb.com>, =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory CLEMENT <gregory.clement@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, linux-rpi-kernel@lists.infradead.org, Lennart Poettering <lennart@poettering.net>, Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Celeste,

there is a typo in the subject line

s/bcm2855/bcm2835

Am 09.07.24 um 01:49 schrieb Kevin Hilman:
> Celeste Liu <coelacanthushex@gmail.com> writes:
>
>> Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
>> with systemd") said it's because of recommendation from systemd. But
>> systemd changed their recommendation later.[1]
>>
>> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
>> needs an RT budget assigned, otherwise the processes in it will not be able to
>> get RT at all. The problem with RT group scheduling is that it requires the
>> budget assigned but there's no way we could assign a default budget, since the
>> values to assign are both upper and lower time limits, are absolute, and need to
>> be sum up to < 1 for each individal cgroup. That means we cannot really come up
>> with values that would work by default in the general case.[2]
>>
>> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
>> can only be enabled when all RT processes are in the root cgroup. But it will
>> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
>>
>> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
>> support it.
>>
>> [1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be321c31d5299f69f
>> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
>>
>> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
>> ---
>>   arch/arm/configs/bcm2835_defconfig   | 1 -
>>   arch/arm/configs/omap2plus_defconfig | 1 -
>>   arch/arm/configs/tegra_defconfig     | 1 -
> For omap2plus_defconfig:
>
> Acked-by: Kevin Hilman <khilman@baylibre.com>
>
>
For bcm2835_defconfig:

Tested-by: Stefan Wahren <wahrenst@gmx.net>
