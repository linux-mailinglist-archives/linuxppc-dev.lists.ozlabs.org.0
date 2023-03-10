Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2566B52AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 22:21:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYJrR51sWz3fDt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 08:21:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=jaX0Yc5h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=jaX0Yc5h;
	dkim-atps=neutral
X-Greylist: delayed 329 seconds by postgrey-1.36 at boromir; Sat, 11 Mar 2023 08:20:21 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYJqT300Cz3bgW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 08:20:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1678483217; i=deller@gmx.de;
	bh=We4tVJ9aX8WWemGD0IA7ECCoCjcoMbMpuqwmPkvAqqQ=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jaX0Yc5hrHaB+mOBAJPXZIYasdwazQOzGWEQ13C1By1x6ZppIlXDHzTVwcrTE5vHh
	 ce8s1FZJrLXf/YoIp31jXP0XR0bNUALQ1HiKs/U2xVx2BhHMq73qlQnCKe8ixdjxp2
	 QY+cX7MPpMaWlwirM1Z6tY1v9TSoBhgFKHxs/TvrwEgLA23XD+xCBYRLPvZNyc7yVW
	 ZwEnBJQpfSWAKfv+AWvSwIQg8SnnXDkhhRThBrp9kLmdvPT9B08OMn8RFp8YNM6pW+
	 j5yrjQTlLfZp9MjsdOOrgsod3kLHEADH1SqNQcdZ7i0w5l9cZiaf5u3tMmOgWEp4oa
	 /uKSFD6oF2xFQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.152.7]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLi8g-1psPTK0gdc-00HffQ; Fri, 10
 Mar 2023 22:14:06 +0100
Message-ID: <5f807b94-9169-3120-9329-611e4031c665@gmx.de>
Date: Fri, 10 Mar 2023 22:14:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/4] arch/*/io.h: remove ioremap_uc in some
 architectures
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20230308130710.368085-1-bhe@redhat.com>
 <20230308130710.368085-4-bhe@redhat.com>
 <20230309143621.GA12350@alpha.franken.de> <ZAqLuNrPng9i0rZV@MiWiFi-R3L-srv>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <ZAqLuNrPng9i0rZV@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:prdbfw0jkbpA2cD4PS8A/Q/bnmnu3OYgfeuy9CIfivml0OBah6B
 MGo7+iBseCwD1PVcU+5RG0jP1OD3CZxHtN3uIEBZi1dA22tJEq0pWnkq3La76NAmGwRayBS
 XciNoSO+Vo1DYUji/arGP4M8bHAlcRtDybpPn25b5aXw0gCZzJphAKo80pokJRNsnu3Acov
 Kgc55jhLjK07WSzPwizYQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oP0agGihXZs=;tvhbI2ydHp4GE1+s6Ql925MXS5s
 e0oO+kgGqx7H5WzKPiCOmS59XEI1qqcLT3hObk+IRjNqYmzbzT5IM5fNHzRE1aDhiEW0zgLz6
 WhDTBUdQ4a8Co6AwX4sL3sEsuvGIMwptxON6h3KZNIzpM9vYdTwHcX8iVuzrYLmX2DeGzeO1t
 UZqIoJL7CdupkXHXjyZ7fvKIpJ6KDnqo9oul2xSQ3MjqUak3S92q2tiIRsdLHzlAaylwAwp+R
 a4Kg5Xy7iIe+qMEjaqi+7XFgKGab69fsmKcZmeyvO5PG4oQ4R/Qg77i+IVTUTTafPOGAk/OBg
 4iJWYvFpbJZDrBXTHnse4MFyLOHcTQfDAu05eCkbVF+1J+8QIDn8OheHH84HaOP/R1f6LrkRS
 BiBEuzHmmgg9o6K8fHdbxMWDshoVEhfvV1VLGmbI9i8af+dXXAXtDyKeSSGi1GsKkJi28WEOB
 wp/ECLFNBJB2inC3lnT4pgnuSWzQQ3zHUUnp133mwIMondwFluJN8FuYNOUM2oDorWXphFVjA
 hRhPg+FXS4Wpy0Li5dZPrfWNr5liveVmfYHe4uLX25n+aX4Q0JX4Xc0Rp0nqX1/iCrKKV2sK0
 x6TpCMbB4ZrB2bclgX8yz59Alb2aJblo6s7sOV+mHMRRFPvHztEczM5FzL3B3Supz8VtzXrEP
 81sOBhpwGjizX4YJE5BueO6Nq44tiVsbr4Z37t+Zt3yEtz98HuOYVvEMug7IKWaF68gPFiMcV
 WtIXrWLfRBosxvMaATukf7BrxFNQZ1ZnRT011wOLm7bHjur56poE7jQ75bj82IzNun31y5zAK
 8QJrT9Z7qpGm5BsTVOSIN3Mt/G+25skxnr0UehuWS4KW2/1N2woe0w10SmNiZsSxptvhi8pwE
 6qvITQP6Y5H8wxyWPIPkSkjj43PMqvwgsScO87N2YY/DP63ipysnhQsTUv5jtdDoKi4LM9ttK
 H+N7kcrUr1lIaP3sHbAj116/Q1g=
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
Cc: linux-arch@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de, linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org, mcgrof@kernel.org, geert@linux-m68k.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/10/23 02:45, Baoquan He wrote:
> On 03/09/23 at 03:36pm, Thomas Bogendoerfer wrote:
>> On Wed, Mar 08, 2023 at 09:07:09PM +0800, Baoquan He wrote:
>>> ioremap_uc() is only meaningful on old x86-32 systems with the PAT
>>> extension, and on ia64 with its slightly unconventional ioremap()
>>> behavior. So remove the ioremap_uc() definition in architecutures
>>> other than x86 and ia64. These architectures all have asm-generic/io.h
>>> included and will have the default ioremap_uc() definition which
>>> returns NULL.
>>>
>>> This changes the existing behaviour, while no need to worry about
>>> any breakage because in the only callsite of ioremap_uc(), code
>>> has been adjusted to eliminate the impact. Please see
>>> atyfb_setup_generic() of drivers/video/fbdev/aty/atyfb_base.c.
>>>
>>> If any new invocation of ioremap_uc() need be added, please consider
>>> using ioremap() intead or adding a ARCH specific version if necessary.
>>>
>>> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> Signed-off-by: Baoquan He <bhe@redhat.com>
>>> Cc: linux-alpha@vger.kernel.org
>>> Cc: linux-hexagon@vger.kernel.org
>>> Cc: linux-m68k@lists.linux-m68k.org
>>> Cc: linux-mips@vger.kernel.org
>>> Cc: linux-parisc@vger.kernel.org
>>> Cc: linuxppc-dev@lists.ozlabs.org
>>> Cc: linux-sh@vger.kernel.org
>>> Cc: sparclinux@vger.kernel.org
>>> ---
>>>   Documentation/driver-api/device-io.rst | 9 +++++----
>>>   arch/alpha/include/asm/io.h            | 1 -
>>>   arch/hexagon/include/asm/io.h          | 3 ---
>>>   arch/m68k/include/asm/kmap.h           | 1 -
>>>   arch/mips/include/asm/io.h             | 1 -
>>>   arch/parisc/include/asm/io.h           | 2 --
>>>   arch/powerpc/include/asm/io.h          | 1 -
>>>   arch/sh/include/asm/io.h               | 2 --
>>>   arch/sparc/include/asm/io_64.h         | 1 -
>>>   9 files changed, 5 insertions(+), 16 deletions(-)
>>
>> this doesn't apply to v6.3-rc1... what tree is this based on ?
>
> Sorry, I forgot mentioning this in cover letter. This series is
> followup of below patchset, so it's on top of below patchset and based
> on v6.3-rc1.
>
> https://lore.kernel.org/all/20230301034247.136007-1-bhe@redhat.com/T/#u
> [PATCH v5 00/17] mm: ioremap:  Convert architectures to take GENERIC_IOR=
EMAP way

I've applied both patch series on top of v6.3-rc1 and
tested it with success on the parisc platform (32- and 64-bit kernel).

You may add to both patch series:

Acked-by: Helge Deller <deller@gmx.de>  # parisc

Thank you!
Helge
