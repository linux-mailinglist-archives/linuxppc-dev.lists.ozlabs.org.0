Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3045A86957A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 15:02:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=dfR+9qlz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkfLY6tVCz3vgp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 01:02:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=dfR+9qlz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 360 seconds by postgrey-1.37 at boromir; Wed, 28 Feb 2024 01:01:31 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkfKl5r0sz3dRl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 01:01:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1709042477; x=1709647277; i=deller@gmx.de;
	bh=HGGO3MU/eeqHbARDqKo9ThxHWt83jFsN9Hq6Lxh3rOs=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=dfR+9qlzXwKQ1aX3NKJiy8Cy20B37gXTmwkWctI2QR8G7+i5/c7mFTaoqIF7vWoV
	 t+z5ndj7xHHURWQGjVqTBQP+GWVHyKQCzril9J7tRHVtHDlOuuWGQKVt0BUt3hdcu
	 YoUuDlkh2UCdqNb7LXgghaiCzlMNwSAfiAzLwtbaYvRsryWZKIx0Wn76+0qA7Xgkf
	 MYabMyzehj2PxBQmhRr452smlJDOkyPrS2MR9wpdMgUYf/f9KWLR9L5e6HlvYVUbm
	 PfalN3ZBz47RmGH2ISrFwb0AxWuoNns5MsgFulQCml7vWbV60MzAtrVyPAbHnZcfY
	 36poDX9I9qfWj/2uVA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQvD5-1rI5xY47kt-00NvTX; Tue, 27
 Feb 2024 14:54:00 +0100
Message-ID: <951c6d29-ef8c-43ce-b91b-fcb905198f80@gmx.de>
Date: Tue, 27 Feb 2024 14:53:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arch: simplify architecture specific page size
 configuration
To: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Kees Cook <keescook@chromium.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-3-arnd@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240226161414.2316610-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hQzjzd7p5TM5Kw1mzvAh+YheK9ajjziFjVP/rq6z93mOcW5SPOs
 e6zmoNjX63XqeTgBwmmYXz0rXFuKFvd8XC66SD7FfY+WnPNGx2dtMFhb8xJts0RVw6olrzE
 lpJ4rkVeLTnLvlzJf86dorWqoPaHA4gaQfDDMpVHU60xM+wJfVgHYdRp1Vf0oMb26RgCcoV
 x700IvlTmiQiOzHig96HA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qRJrW0sn3NY=;kOiAQvCS6EHCjoCluB8Zd9nXvD/
 H/P87IeVNKYribbmHYbEAPswNfxSvZodLzHDjFTfXnYcqAM5P2lje27ucNUfszDsaj2xerDb5
 ylssHPUwak0A3ZRqfac8FgjGVY8Rjfr0EOl8DbFPnLTvfhStBzQZ9OdQf5PQj7lL0IIadwz/S
 X0K8VOloVlSn9ofXAiKXpgSFsZpfKj6psgozZC7SlQtbzuSM3Fu7Mxh08dHdBpNK3mNyHJa/U
 4A72WGJZ40a6iDbvC2d/hJhtaGlyBhRQACyU8ywdx9sktbCOO9wOH5+nR+6czDVwLtOjsrvOA
 ruX/F0plWgY9mNcMhV5G5JidSbE4Qlxr5hq84X3IernyVlSlxeEzm7N0cTvz1Zwl1CGTug7YG
 3lbU4ft0g3kC+X2rcpBpjoRPftbW/0fN+EXdg0wwBXwYuwfP587d5zDGRgBKVVvhgdl8LnsZf
 Gbp9spRg6vd4cIwQ+Q2lYOI4SnFFeIcMepocv2DgZ4nq3KtnHuyZD4pRx0XSr7YN+gybhbhml
 6XSDDtZpC4Vr2lgAIH44a8jnp4NmtDFU1IAHn4rP1KjX2yvWp6b6x/+qYCOPw/nq/rmhFE8sP
 TX7NVbK8wjQ6QAt2GhNLIHZ4+A0cx0wohr19F2lQqdRZLugc1Z8PYu81o3b6BFaO5vOtPDEMP
 y59TaYzre6GJWbLY6fj+ry/XhTUll/rK1CcRd0iVcUxh1zcJRhfRW6XxVPwBO33Ie0j4+VbUP
 VwfXFdNyazrPv92UNpeAxI7aWV2CQfSy8tPvc8RUmKiiKwmesfstx/zQAELeGPBPjLC+kZQrt
 4xG6l7gUkgGWRCAAkJuBoDkoEqktM/5FKp1HrBHmT2XEM=
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kieran Bingham <kbingham@kernel.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, Brian Cain <bca
 in@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/26/24 17:14, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> arc, arm64, parisc and powerpc all have their own Kconfig symbols
> in place of the common CONFIG_PAGE_SIZE_4KB symbols. Change these
> so the common symbols are the ones that are actually used, while
> leaving the arhcitecture specific ones as the user visible
> place for configuring it, to avoid breaking user configs.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/arc/Kconfig                  |  3 +++
>   arch/arc/include/uapi/asm/page.h  |  6 ++----
>   arch/arm64/Kconfig                | 29 +++++++++++++----------------
>   arch/arm64/include/asm/page-def.h |  2 +-
>   arch/parisc/Kconfig               |  3 +++
>   arch/parisc/include/asm/page.h    | 10 +---------

Acked-by: Helge Deller <deller@gmx.de> # parisc

Thanks for the cleanups!

Helge

