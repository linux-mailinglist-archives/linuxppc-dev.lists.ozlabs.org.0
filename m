Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E8A756AF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 19:48:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sM7JLsFk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4V1Y4FNmz2ygY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 03:48:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sM7JLsFk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4V0j3WpXz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 03:47:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB5C4611A9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 17:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DB1C43395
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 17:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689616066;
	bh=P0+p9Olt6ycXAEYaEcE6zFrH57LOqtI2MFvhh2oCT1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sM7JLsFkNSnE6Zsb6yzD1Z/ueCAop9xb+IqgJ5FRNkAEuLfRJ81ggm3SYYft/CdC2
	 WX/OP9NpY33FGz9k1fUInEn2EYBYH20HrW9h0tqsqCVpEHiPTPsCIVcfVZVCLM+Ehz
	 DWjEvBYqwv3SCwvCTM6FK7C799uhrVjf8Xklbs6iPzjyx2ptzi7Wc/y+ilGZIeTvOZ
	 9K5GN7k/d8qraoE9heaYmgxtfsAi89O27Y7M4MKsJAC0MyWXLua9ckkLSNjX3J0/JM
	 Nit5SXI3BITnSMjj46w3Tn9FtCmZHJ5RCBo+I3MnVDjmOBArDaNJ2Hm+xSo+efg1at
	 rzbcZOS5T88xw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso7584913e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 10:47:46 -0700 (PDT)
X-Gm-Message-State: ABy/qLaTAXcMlHyo+yWzDN5wetGTgkM7GWotMt6BVNJ9gWeZiRNEh4Cd
	XyJsPVJUuKJksRF7B7TPblMeBqbkkRfb+N1O2w==
X-Google-Smtp-Source: APBJJlHDBBqNEhwdpt/uN8797F2olufKZp3/nJpjbMiW5Ff0J6rgsYNLEqheulUrN8J9VhW4Smgd0dfY+xaxvTzg0RM=
X-Received: by 2002:a2e:8611:0:b0:2b6:e625:ba55 with SMTP id
 a17-20020a2e8611000000b002b6e625ba55mr9811234lji.41.1689616064972; Mon, 17
 Jul 2023 10:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174735.4060016-1-robh@kernel.org>
In-Reply-To: <20230714174735.4060016-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 11:47:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKTqmAVBJmuGUb_oi3X4zvfroEwEtq0Ww=cJPyXtgx5pA@mail.gmail.com>
Message-ID: <CAL_JsqKTqmAVBJmuGUb_oi3X4zvfroEwEtq0Ww=cJPyXtgx5pA@mail.gmail.com>
Subject: Re: [PATCH] misc: Explicitly include correct DT includes
To: Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Amol Maheshwari <amahesh@qti.qualcomm.com>, 
	Eric Piel <eric.piel@tremplin-utc.net>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Michal Simek <michal.simek@amd.com>, 
	Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 14, 2023 at 11:47=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/misc/cxl/base.c            | 1 +
>  drivers/misc/fastrpc.c             | 1 +
>  drivers/misc/lis3lv02d/lis3lv02d.c | 2 +-
>  drivers/misc/qcom-coincell.c       | 1 -
>  drivers/misc/sram.c                | 2 +-
>  drivers/misc/vcpu_stall_detector.c | 1 -
>  drivers/misc/xilinx_sdfec.c        | 4 +++-
>  drivers/misc/xilinx_tmr_inject.c   | 3 ++-
>  drivers/misc/xilinx_tmr_manager.c  | 3 ++-
>  9 files changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/misc/cxl/base.c b/drivers/misc/cxl/base.c
> index cc0caf9192dc..b054562c046e 100644
> --- a/drivers/misc/cxl/base.c
> +++ b/drivers/misc/cxl/base.c
> @@ -7,6 +7,7 @@
>  #include <linux/rcupdate.h>
>  #include <asm/errno.h>
>  #include <misc/cxl-base.h>
> +#include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include "cxl.h"
>
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 9666d28037e1..1c7c0532da6f 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/sort.h>
>  #include <linux/of_platform.h>
>  #include <linux/rpmsg.h>
> diff --git a/drivers/misc/lis3lv02d/lis3lv02d.c b/drivers/misc/lis3lv02d/=
lis3lv02d.c
> index 299d316f1bda..49868a45c0ad 100644
> --- a/drivers/misc/lis3lv02d/lis3lv02d.c
> +++ b/drivers/misc/lis3lv02d/lis3lv02d.c
> @@ -26,7 +26,7 @@
>  #include <linux/miscdevice.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/atomic.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include "lis3lv02d.h"
>
>  #define DRIVER_NAME     "lis3lv02d"
> diff --git a/drivers/misc/qcom-coincell.c b/drivers/misc/qcom-coincell.c
> index 54d4f6ee8888..3c57f7429147 100644
> --- a/drivers/misc/qcom-coincell.c
> +++ b/drivers/misc/qcom-coincell.c
> @@ -8,7 +8,6 @@
>  #include <linux/slab.h>
>  #include <linux/of.h>
>  #include <linux/regmap.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>
>  struct qcom_coincell {
> diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
> index 5757adf418b1..a88f92cf35be 100644
> --- a/drivers/misc/sram.c
> +++ b/drivers/misc/sram.c
> @@ -10,8 +10,8 @@
>  #include <linux/genalloc.h>
>  #include <linux/io.h>
>  #include <linux/list_sort.h>
> +#include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> diff --git a/drivers/misc/vcpu_stall_detector.c b/drivers/misc/vcpu_stall=
_detector.c
> index 53b5506080e1..6479c962da1a 100644
> --- a/drivers/misc/vcpu_stall_detector.c
> +++ b/drivers/misc/vcpu_stall_detector.c
> @@ -13,7 +13,6 @@
>  #include <linux/module.h>
>  #include <linux/nmi.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/param.h>
>  #include <linux/percpu.h>
>  #include <linux/platform_device.h>
> diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
> index 270ff4c5971a..35941c006552 100644
> --- a/drivers/misc/xilinx_sdfec.c
> +++ b/drivers/misc/xilinx_sdfec.c
> @@ -15,12 +15,14 @@
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_platform.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/poll.h>
>  #include <linux/slab.h>
>  #include <linux/clk.h>
>  #include <linux/compat.h>
>  #include <linux/highmem.h>
> +#include <linux/of.h>

Double include of of.h. v2 coming.
