Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 615B435B5B9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 16:42:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJF2f2Sv7z30Bc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 00:42:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=g6dRc/QR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g6dRc/QR; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJF2C2lMWz2yQr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 00:42:10 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so10364271otr.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 07:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mMbRmy66XZv98soa3gTHMjIRwtAIWj+svRvbFTfuv0M=;
 b=g6dRc/QRAnLjtd5UJ1rOrFrAGDtGaOojxkIJO+SS3GYGOCk0nFni+DSKI2ShQFwkuP
 4mIqJz9ctpVZ85p6Wc8k47gb4Bu5kVh9RhLYFDhRE16iCBhAAtaokSx5Oi0QPytImm6u
 UwJnAm7udf9ad5ykFOBQO++sCX8BSGNGEO7V0Del5GXOPYnMcN3tvHNITQzXwt4f3OPy
 6OaPuoQ9aSV2IcWAPwWpubSNUYUFuF/0MaOJgypS3QR32ibkV/jZwBnNTA+TOlEqo8vR
 54vmeVVDQJoCs8jzc/kpdHhbzToyjXN7iqGhvhUQLhk9DU0OCTnENnuN/JskeQtXl/1k
 9zsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=mMbRmy66XZv98soa3gTHMjIRwtAIWj+svRvbFTfuv0M=;
 b=lxnayZzGXqDk7RKiHLt+YKZJnR7oTI3GMp5YI0vA/ooEU4O8rpYWqQkCtyBZ4Gxhc/
 kQZwpQMjr66ZG1mqsIIQC0mWOBiNhshMorw0GIM7xJ5xidUBaMfwp6HW0knBxTRKdOfQ
 8zcaEN/WhAgLl0H6PoMdL6Ejz+Tl4C6UBGB8xvTxUUAnHH/UtbCAVKhM6vOTS4kmfeK6
 IUZLo3uhO3OEHEx1NZCYgmcKSTtrosJVtfJIzn8aj7/CoVd2SLihhZYZQBE1KcKeRVW+
 feU+Rxr4et4SSIfJE+bjzFy8Hmd2MYryVCECEWqGagnOtNK80mCzM3A+sM9P5sSNz2xI
 ZsPA==
X-Gm-Message-State: AOAM5319WwGxwgaFBNT0wiVbgik+ueKL/OKyR6nvc5ZTWVl7QzPJkb8v
 ggq1kXkhb2hyWUOxN0HsMAo=
X-Google-Smtp-Source: ABdhPJz3kbei9OSdxChqza8r8ahSspL/uLcAMGHGcYvyk33y6CIE7w9c7128qgbhjAdmjtnfIhOaGA==
X-Received: by 2002:a9d:1d26:: with SMTP id m35mr20446531otm.266.1618152119424; 
 Sun, 11 Apr 2021 07:41:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id i4sm1984129otj.56.2021.04.11.07.41.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 11 Apr 2021 07:41:58 -0700 (PDT)
Date: Sun, 11 Apr 2021 07:41:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk
Message-ID: <20210411144157.GA80935@roeck-us.net>
References: <1616141203-13344-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616141203-13344-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 19, 2021 at 04:06:43PM +0800, Shengjiu Wang wrote:
> When there is power domain bind with bus clock,
> 
> The call flow:
> devm_regmap_init_mmio_clk
>    - clk_prepare()
>       - clk_pm_runtime_get()
> 
> cause the power domain of clock always be enabled after
> regmap_init(). which impact the power consumption.
> 
> So use devm_regmap_init_mmio instead of
> devm_regmap_init_mmio_clk, then explicitly enable clock when
> using by pm_runtime_get(), if CONFIG_PM=n, then
> fsl_sai_runtime_resume will be explicitly called.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>

This patch results in a crash when running mcimx6ul-evk in qemu.
Reverting it fixes the problem.

Crash and bisect logs attached.

Guenter

---
[   19.196778] 8<--- cut here ---
[   19.197011] Unhandled fault: external abort on non-linefetch (0x808) at 0xd1588000
[   19.197135] pgd = (ptrval)
[   19.197203] [d1588000] *pgd=824da811, *pte=0202c653, *ppte=0202c453
[   19.197764] Internal error: : 808 [#1] SMP ARM
[   19.197953] Modules linked in:
[   19.198108] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc6-next-20210409 #1
[   19.198234] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[   19.198354] PC is at regmap_mmio_write32le+0x24/0x2c
[   19.198482] LR is at regmap_mmio_write32le+0x1c/0x2c
[   19.198544] pc : [<c0965d6c>]    lr : [<c0965d64>]    psr: 60000093
[   19.198611] sp : c20b5cf0  ip : 00000000  fp : c017a344
[   19.198669] r10: c217c1b0  r9 : c20b4000  r8 : c26fcc00
[   19.198729] r7 : 01000000  r6 : c26ff580  r5 : 00000000  r4 : 01000000
[   19.198801] r3 : d1588000  r2 : 01000000  r1 : d1588000  r0 : c26ff580
[   19.198896] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
[   19.198982] Control: 10c5387d  Table: 826bc06a  DAC: 00000051
[   19.199060] Register r0 information: slab kmalloc-64 start c26ff580 pointer offset 0 size 64
[   19.199421] Register r1 information: 0-page vmalloc region starting at 0xd1588000 allocated at __devm_ioremap+0x90/0xa4
[   19.199587] Register r2 information: non-paged memory
[   19.199667] Register r3 information: 0-page vmalloc region starting at 0xd1588000 allocated at __devm_ioremap+0x90/0xa4
[   19.199774] Register r4 information: non-paged memory
[   19.199832] Register r5 information: NULL pointer
[   19.199888] Register r6 information: slab kmalloc-64 start c26ff580 pointer offset 0 size 64
[   19.199998] Register r7 information: non-paged memory
[   19.200056] Register r8 information: slab kmalloc-1k start c26fcc00 pointer offset 0 size 1024
[   19.200167] Register r9 information: non-slab/vmalloc memory
[   19.200252] Register r10 information: slab kmalloc-1k start c217c000 pointer offset 432 size 1024
[   19.200367] Register r11 information: non-slab/vmalloc memory
[   19.200431] Register r12 information: NULL pointer
[   19.200495] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
[   19.200596] Stack: (0xc20b5cf0 to 0xc20b6000)
[   19.200755] 5ce0:                                     c26ff580 00000000 01000000 c0965f40
[   19.200932] 5d00: c26fcc00 00000000 00000000 c095f3cc c20c0000 c26fcc00 00000000 01000000
[   19.201096] 5d20: c269b840 00000000 c20b4000 c217c1b0 c017a344 c0961130 00000080 c217c010
[   19.201259] 5d40: c26ff5c0 c0d21354 c217c010 c0946e24 00000000 c0946e24 c217c114 c094a894
[   19.201420] 5d60: c217c010 c0946e24 c2173810 c217c114 c2173914 c20b4000 c217c1b0 c094a930
[   19.201582] 5d80: c217c010 c0946e24 c2173810 c094a468 c20c0000 c20b4000 c094a6a0 60000013
[   19.201744] 5da0: 00000002 cbdc8024 c217c114 5bdc6b72 60000013 60000013 c217c114 00000004
[   19.201906] 5dc0: 00000002 cbdc8024 c20b4000 c269b880 00000000 c094a6b4 c269b840 c217c010
[   19.202067] 5de0: c217c000 c0d2176c 00000000 00000000 00000000 00000000 c2176340 c21d5c00
[   19.202228] 5e00: 00000000 6b6c636d 00000033 5bdc6b72 00000000 00000000 c217c010 c18d47fc
[   19.202389] 5e20: c1f70c20 00000000 c18d47fc 00000000 00000000 c093f540 c217c010 c1f70c1c
[   19.202551] 5e40: 00000000 c1f70c20 00000000 c093cdec c217c010 c18d47fc c18d47fc c20b4000
[   19.202712] 5e60: 00000000 c166e854 c20af880 c093d0fc c217c010 00000000 c18d47fc c093d418
[   19.202873] 5e80: 00000000 c18d47fc c217c010 c093d484 00000000 c18d47fc c093d420 c093aefc
[   19.203035] 5ea0: c26fe980 c20ae2b0 c214be94 5bdc6b72 c20ae2e4 c18d47fc c26fe980 00000000
[   19.203196] 5ec0: c187bcf8 c093c0b8 c14db3fc c1661678 c18f4c20 c18d47fc c1661678 c18f4c20
[   19.203357] 5ee0: c17093d0 c093e1e4 c20b4000 c1661678 c18f4c20 c01022b0 00000000 00000000
[   19.203533] 5f00: c20af8ec 00000000 c17e0b10 c0f39294 c17093d0 ffffffff c14a1cb8 c20b4000
[   19.203696] 5f20: c18f4c20 c17093d0 c15644e0 c18ff000 c166e854 000001c6 00000000 c01af994
[   19.203858] 5f40: 00000000 5bdc6b72 c168dca8 00000007 c166e874 c15644e0 c18ff000 c166e854
[   19.204019] 5f60: c20af880 c16010a0 00000006 00000006 00000000 c16003e8 c0f46080 000001c6
[   19.204180] 5f80: c17097d0 00000000 c0f3a784 00000000 00000000 00000000 00000000 00000000
[   19.204342] 5fa0: 00000000 c0f3a78c 00000000 c010013c 00000000 00000000 00000000 00000000
[   19.204503] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   19.204663] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[   19.204828] [<c0965d6c>] (regmap_mmio_write32le) from [<c0965f40>] (regmap_mmio_write+0x3c/0x54)
[   19.204947] [<c0965f40>] (regmap_mmio_write) from [<c095f3cc>] (_regmap_write+0x4c/0x1f4)
[   19.205034] [<c095f3cc>] (_regmap_write) from [<c0961130>] (regmap_write+0x3c/0x60)
[   19.205114] [<c0961130>] (regmap_write) from [<c0d21354>] (fsl_sai_runtime_resume+0x9c/0x1ec)
[   19.205206] [<c0d21354>] (fsl_sai_runtime_resume) from [<c094a894>] (__rpm_callback+0xb4/0x130)
[   19.205297] [<c094a894>] (__rpm_callback) from [<c094a930>] (rpm_callback+0x20/0x80)
[   19.205379] [<c094a930>] (rpm_callback) from [<c094a468>] (rpm_resume+0x604/0x7ec)
[   19.205459] [<c094a468>] (rpm_resume) from [<c094a6b4>] (__pm_runtime_resume+0x64/0xa4)
[   19.205543] [<c094a6b4>] (__pm_runtime_resume) from [<c0d2176c>] (fsl_sai_probe+0x2c8/0x674)
[   19.205630] [<c0d2176c>] (fsl_sai_probe) from [<c093f540>] (platform_probe+0x58/0xb8)
[   19.205694] [<c093f540>] (platform_probe) from [<c093cdec>] (really_probe+0xec/0x398)
[   19.205765] [<c093cdec>] (really_probe) from [<c093d0fc>] (driver_probe_device+0x64/0xc0)
[   19.205854] [<c093d0fc>] (driver_probe_device) from [<c093d418>] (device_driver_attach+0x58/0x60)
[   19.205944] [<c093d418>] (device_driver_attach) from [<c093d484>] (__driver_attach+0x64/0xdc)
[   19.206028] [<c093d484>] (__driver_attach) from [<c093aefc>] (bus_for_each_dev+0x78/0xb8)
[   19.206113] [<c093aefc>] (bus_for_each_dev) from [<c093c0b8>] (bus_add_driver+0x150/0x1dc)
[   19.206200] [<c093c0b8>] (bus_add_driver) from [<c093e1e4>] (driver_register+0x74/0x108)
[   19.206285] [<c093e1e4>] (driver_register) from [<c01022b0>] (do_one_initcall+0x80/0x3a8)
[   19.206374] [<c01022b0>] (do_one_initcall) from [<c16010a0>] (kernel_init_freeable+0x158/0x1f4)
[   19.206466] [<c16010a0>] (kernel_init_freeable) from [<c0f3a78c>] (kernel_init+0x8/0x11c)
[   19.206556] [<c0f3a78c>] (kernel_init) from [<c010013c>] (ret_from_fork+0x14/0x38)
[   19.206653] Exception stack(0xc20b5fb0 to 0xc20b5ff8)
[   19.206749] 5fa0:                                     00000000 00000000 00000000 00000000
[   19.206916] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   19.207063] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   19.207290] Code: ee073f9a ebdeca40 e5963000 e0831005 (e5814000)
[   19.207813] ---[ end trace 4c72393d5e30d6c1 ]---

---
# bad: [e99d8a8495175df8cb8b739f8cf9b0fc9d0cd3b5] Add linux-next specific files for 20210409
# good: [e49d033bddf5b565044e2abe4241353959bc9120] Linux 5.12-rc6
git bisect start 'HEAD' 'v5.12-rc6'
# good: [24c5f79572740c1744a7ec2e9e21b541acab6de3] Merge remote-tracking branch 'crypto/master'
git bisect good 24c5f79572740c1744a7ec2e9e21b541acab6de3
# bad: [4b90473874c7b6af320b9815f82ac305fd8807f7] Merge remote-tracking branch 'ftrace/for-next'
git bisect bad 4b90473874c7b6af320b9815f82ac305fd8807f7
# good: [9cf3382276b26848891c7e072db0a774fadd10e4] Merge remote-tracking branch 'sound/for-next'
git bisect good 9cf3382276b26848891c7e072db0a774fadd10e4
# bad: [f8d16164c586548d7ccedc058ca9ae547e0cebbe] Merge remote-tracking branch 'mmc/next'
git bisect bad f8d16164c586548d7ccedc058ca9ae547e0cebbe
# bad: [c7c19ec098b862a688291f5a1101f7de6e4b0a6c] ASoC: Intel: kbl: Add MST route change to kbl machine drivers
git bisect bad c7c19ec098b862a688291f5a1101f7de6e4b0a6c
# good: [1db19c151819dea7a0dc4d888250d25abaf229ca] ASoC: soc-pcm: fixup dpcm_be_dai_startup() user count
git bisect good 1db19c151819dea7a0dc4d888250d25abaf229ca
# bad: [f89c0a87b4066fbb0dc6f8039b211bd79a9ab663] Merge tag 'ib-mfd-extcon-v5.13' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into asoc-5.13
git bisect bad f89c0a87b4066fbb0dc6f8039b211bd79a9ab663
# good: [a2cc1568dc50020a807c94bd14a053dd54e9c35e] ASoC: tscs454: remove useless test on PLL disable
git bisect good a2cc1568dc50020a807c94bd14a053dd54e9c35e
# good: [cb11f79b4af65005584880eb408f9748c32661d0] ASoC: soc-pcm: indicate error message at soc_pcm_hw_params()
git bisect good cb11f79b4af65005584880eb408f9748c32661d0
# good: [60adbd8fbf486214f4ae1946e61df69c3867e20b] ASoC: don't indicate error message for snd_soc_[pcm_]component_xxx()
git bisect good 60adbd8fbf486214f4ae1946e61df69c3867e20b
# bad: [dfb81e3b5f47aa0ea5e4832eeb720bc22f07d0c1] ASoC: SOF: Intel: hda: drop display power on/off in D0i3 flows
git bisect bad dfb81e3b5f47aa0ea5e4832eeb720bc22f07d0c1
# good: [7e71b48f9e27e437ca523432ea285c2585a539dc] ASoC: amd: Add support for RT5682 codec in machine driver
git bisect good 7e71b48f9e27e437ca523432ea285c2585a539dc
# bad: [b951b51e2ca4d37dc9781e14d8a49d2f2b7e715b] ASoC: SOF: add a helper to get topology configured mclk
git bisect bad b951b51e2ca4d37dc9781e14d8a49d2f2b7e715b
# bad: [2277e7e36b4b8c27eb8d2fb33a20440bc800c2d7] ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk
git bisect bad 2277e7e36b4b8c27eb8d2fb33a20440bc800c2d7
# first bad commit: [2277e7e36b4b8c27eb8d2fb33a20440bc800c2d7] ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk
