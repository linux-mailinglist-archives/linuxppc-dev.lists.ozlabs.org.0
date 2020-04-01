Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6C119A9AF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 12:37:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sjMQ2ql1zDqRh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 21:37:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sjJX3bPyzDqND
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 21:35:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=P1whhju4; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48sjJG1fdNz9sPF;
 Wed,  1 Apr 2020 21:35:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585737317;
 bh=tOrgJGXP/njUrIMXidGuSCKwc178zrgu0S+NEYMqYHU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=P1whhju4jgzAL2Psm98KymlrEICEGralDcTIlW8g8UT+lDTgyzSEDjQDCMbUi0ETr
 W/3VEd+68JgnO+DNBCqAYlV5cH3PYejroV6p2lHqqOZ0X419cHoD4W1CiN8Ev8VwyZ
 2niHYiMRiRvaBHYGCpYZjhsjmp4tai+OS1JV4zx3t8XRpwh/g4JkErdA29Yb8oTnHD
 EV/I/xOiV2bqVYwF2R5KuZdGh9DmEvJKN/hE+H1MXlstH3qVixSixsFD6cihk2nhn0
 QMEZEVCWkC2UxlvVulmpNX2bi9UCBTZzAsIBX2wyCv7n64ESMbPOOStDI55bkW/qnh
 drc4RnG8+sF4A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal Simek <michal.simek@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, git@xilinx.com, sfr@canb.auug.org.au, maz@kernel.org
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
In-Reply-To: <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <87imikufes.fsf@mpe.ellerman.id.au>
 <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
Date: Wed, 01 Apr 2020 21:35:16 +1100
Message-ID: <87y2rftrx7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Wei Hu <weh@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Simek <michal.simek@xilinx.com> writes:
> On 01. 04. 20 4:07, Michael Ellerman wrote:
>> Michal Simek <michal.simek@xilinx.com> writes:
>>> Hi,
>>>
>>> recently we wanted to update xilinx intc driver and we found that function
>>> which we wanted to remove is still wired by ancient Xilinx PowerPC
>>> platforms. Here is the thread about it.
>>> https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
>>>
>>> I have been talking about it internally and there is no interest in these
>>> platforms and it is also orphan for quite a long time. None is really
>>> running/testing these platforms regularly that's why I think it makes sense
>>> to remove them also with drivers which are specific to this platform.
>>>
>>> U-Boot support was removed in 2017 without anybody complain about it
>>> https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
>>>
>>> Based on current ppc/next.
>>>
>>> If anyone has any objection about it, please let me know.
>> 
>> Thanks for taking the time to find all this code and remove it.
>> 
>> I'm not going to take this series for v5.7, it was posted too close to
>> the merge window, and doing so wouldn't give people much time to object,
>> especially given people are distracted at the moment.
>> 
>> I'm happy to take it for v5.8, assuming there's no major objections.
>
> Sure. Just to let you know Christophe Leroy included this patch in his
> series about ppc405 removal. It should be the same.
>
> If you don't want to take that alsa patch I can send it separately and
> this patch can be taken from his series. I don't really mind but please
> let me know what way you prefer.

It's better to keep it all together, so I'm happy take the alsa patch as
well, it's already been acked.

cheers
