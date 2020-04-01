Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC3119B6F2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 22:28:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48syTM1XGNzDr8H
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 07:28:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Y3vyS0+7; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48syRQ2h1GzDqQP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 07:27:09 +1100 (AEDT)
Received: by mail-ed1-x542.google.com with SMTP id u59so1427325edc.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 13:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v6qcM856obImsvuT5rUIEhvwVnK1DhMJt2Id7uvyK5Q=;
 b=Y3vyS0+7xmMlD2o1DE1joAP9And7I2d2qjY0yOuvGnXvyW98YWzWm7aa6SSnMW9fGv
 xmbCsUf8tHEs1igbgJL3MR2/QQ9CQsbFnA6iygRiBg0Wr89wbN2oYs93y2m0+MLBc9j0
 XZRVztiCpXL+RZE2oEq1MFt12hQvmpIntSCzUl1th3RBpoByO2/Fu41HxaGtFIdOelv6
 Z8TUAwfBiHAzT9ov8b0OI473ujkzD9NlE3o2pCzmz/Z3D+q+HTGIcrnaSwtBrsELjwyT
 RifPDZRqTf60vamEdkpnnVKHQZJPAHKj5NeFxs8bRaNtVcgXRIYIiN2JEGUUS+w9tUY6
 z8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v6qcM856obImsvuT5rUIEhvwVnK1DhMJt2Id7uvyK5Q=;
 b=MP7iDr33r4FyDZ7e2XCiaWu3K64DkFK6y/0TmwQIgVjn2yrXDgOVNvRvNBsuN7aC9h
 VYcgm/qwQJT6y5yg2BifZy2Z8GsDxBC8co6fy9HwdEBl67k0OQ8iSnuDW1oDBoYuD365
 Y8qRSqCURtSSXjgfyakwaBVXbYS4krnSkZW95yYWyOl29QDE+lqyj6uPBAe0/A/ypLMo
 +XJX9iOtUFoA818991UqdgsYAJOgS69Wc3mtt45sFvZ6qbotF5lzeSR9WKyzRCfXpxln
 AP6pBkEAg/TG5yT485K5+/Hvuw8UTD4p3Db3eMs33vflT5yftcIoAO5+QwZIM/EMMCO2
 2Apg==
X-Gm-Message-State: ANhLgQ2Rs4clAfWhiqBUDb5INgF2836THplY5AaeKTQJjTJJ+ybRtDrt
 j5mKwwV9X19D3cduR26XL4LtoWF/fPA7AgDjwgMjpQ==
X-Google-Smtp-Source: ADFU+vutl2hEQYOr7JEC/ZbBRPxrkS/63YVcKf/26iigKS0Nr226Yo7GAz0hCmuAa+otNRau6Kiz522Hbv7xnLvn8gw=
X-Received: by 2002:a50:d847:: with SMTP id v7mr22275521edj.154.1585772826833; 
 Wed, 01 Apr 2020 13:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-12-alastair@d-silva.org>
In-Reply-To: <20200327071202.2159885-12-alastair@d-silva.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Apr 2020 13:26:55 -0700
Message-ID: <CAPcyv4gnU8t12V-mYXyxjb2+siej10xY-UVbxHxtCd8=28Yc6g@mail.gmail.com>
Subject: Re: [PATCH v4 11/25] powerpc: Enable the OpenCAPI Persistent Memory
 driver for powernv_defconfig
To: "Alastair D'Silva" <alastair@d-silva.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva <alastair@d-silva.org> wrote:
>
> This patch enables the OpenCAPI Persistent Memory driver, as well
> as DAX support, for the 'powernv' defconfig.
>
> DAX is not a strict requirement for the functioning of the driver, but it
> is likely that a user will want to create a DAX device on top of their
> persistent memory device.
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  arch/powerpc/configs/powernv_defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
> index 71749377d164..921d77bbd3d2 100644
> --- a/arch/powerpc/configs/powernv_defconfig
> +++ b/arch/powerpc/configs/powernv_defconfig
> @@ -348,3 +348,8 @@ CONFIG_KVM_BOOK3S_64=m
>  CONFIG_KVM_BOOK3S_64_HV=m
>  CONFIG_VHOST_NET=m
>  CONFIG_PRINTK_TIME=y
> +CONFIG_ZONE_DEVICE=y
> +CONFIG_OCXL_PMEM=m
> +CONFIG_DEV_DAX=m
> +CONFIG_DEV_DAX_PMEM=m
> +CONFIG_FS_DAX=y

These options have dependencies. I think it would better to implement
a top-level configuration question called something like
PERSISTENT_MEMORY_ALL that goes and selects all the bus providers and
infrastructure and lets other defaults follow along. For example,
CONFIG_DEV_DAX could grow a "default LIBNVDIMM" and then
CONFIG_DEV_DAX_PMEM would default on as well. If
CONFIG_PERSISTENT_MEMORY_ALL selected all the bus providers and
ZONE_DEVICE then the Kconfig system could prompt you to where the
dependencies are not satisfied.
