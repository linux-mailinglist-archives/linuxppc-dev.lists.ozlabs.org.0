Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B60269ADB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 03:07:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Br4ny2m2czDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 11:07:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.68; helo=mail-io1-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Br4mD1mRqzDqBt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 11:05:48 +1000 (AEST)
Received: by mail-io1-f68.google.com with SMTP id j2so2233032ioj.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 18:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4K8hgYOIozb4eV4tE27z5U4/TuKGwafzOOZVveRuAWg=;
 b=s5YbpHTk0mZOxylymfg9IcuFkCRSv+rE/XXa4uNnSUKD9YjBkLLJQnF+Gw+NzPTpvu
 msqOOQ6StVZNcz5ibuk2sAH9I6PRZfSlFS0fN23IoUtn8GaGwSI0WChUot55IFfbYfab
 r231vZ2ujnSZUortuV5/6UX7cadVM36D7I8dcmqiQiaUwFYbYgrHS8DP+sfu0ykS3uqd
 aFQ6NI95GX74RXriEJI5acvWXA1JotqOAcktBbhIynSUjiRkcqBrvUx1FX0bUh2wVjv9
 kQrX51KvyEam2wQBWndE2wBj5/w2zwH1AiCTVzx5U8GRFpLsoylAmCrKIiTrhVKz6f/+
 QCVA==
X-Gm-Message-State: AOAM531TFH0NVCJtw+dzQO5+3i9OTMPvVZ/Z82HhMCdaj8J0ZvpfIJKo
 vlVaxx1mdVIH2sf1Pis2+Q==
X-Google-Smtp-Source: ABdhPJyeOrm0wS6VfzxyWw018C3Pfbn90WCq5qB1yjbl7A1oksWUyEkQHM+2EgWsvF1hagglRRZ/7w==
X-Received: by 2002:a6b:6e0b:: with SMTP id d11mr13258988ioh.155.1600131945835; 
 Mon, 14 Sep 2020 18:05:45 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id c6sm4023381ils.86.2020.09.14.18.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 18:05:45 -0700 (PDT)
Received: (nullmailer pid 628112 invoked by uid 1000);
 Tue, 15 Sep 2020 01:05:43 -0000
Date: Mon, 14 Sep 2020 19:05:43 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v3 2/5] powerpc: apm82181: create shared dtsi for APM
 bluestone
Message-ID: <20200915010543.GB612463@bogus>
References: <cover.1599343429.git.chunkeey@gmail.com>
 <47109d80c7bd481c7747c949e8a3ecd498d9c039.1599343429.git.chunkeey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47109d80c7bd481c7747c949e8a3ecd498d9c039.1599343429.git.chunkeey@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Blake <chrisrblake93@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 06, 2020 at 12:06:12AM +0200, Christian Lamparter wrote:
> This patch adds an DTSI-File that can be used by various device-tree
> files for APM82181-based devices.
> 
> Some of the nodes (like UART, PCIE, SATA) are used by the uboot and
> need to stick with the naming-conventions of the old times'.
> I've added comments whenever this was the case.
> 
> Signed-off-by: Chris Blake <chrisrblake93@gmail.com>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---
> rfc v1 -> v2:
> 	- removed PKA (this CryptoPU will need driver)
> 	- stick with compatibles, nodes, ... from either
> 	  Bluestone (APM82181) or Canyonlands (PPC460EX).
> 	- add labels for NAND and NOR to help with access.
> v2 -> v3:
> 	- nodename of pciex@d.... was changed to pcie@d..
> 	  due to upstream patch.
> 	- use simple-bus on the ebc, opb and plb nodes
> ---
>  arch/powerpc/boot/dts/apm82181.dtsi | 466 ++++++++++++++++++++++++++++
>  1 file changed, 466 insertions(+)
>  create mode 100644 arch/powerpc/boot/dts/apm82181.dtsi
> 
> diff --git a/arch/powerpc/boot/dts/apm82181.dtsi b/arch/powerpc/boot/dts/apm82181.dtsi
> new file mode 100644
> index 000000000000..60283430978d
> --- /dev/null
> +++ b/arch/powerpc/boot/dts/apm82181.dtsi
> @@ -0,0 +1,466 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Device Tree template include for various APM82181 boards.
> + *
> + * The SoC is an evolution of the PPC460EX predecessor.
> + * This is why dt-nodes from the canyonlands EBC, OPB, USB,
> + * DMA, SATA, EMAC, ... ended up in here.
> + *
> + * Copyright (c) 2010, Applied Micro Circuits Corporation
> + * Author: Tirumala R Marri <tmarri@apm.com>,
> + *	   Christian Lamparter <chunkeey@gmail.com>,
> + *	   Chris Blake <chrisrblake93@gmail.com>
> + */
> +
> +#include <dt-bindings/dma/dw-dmac.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <1>;
> +	dcr-parent = <&{/cpus/cpu@0}>;
> +
> +	aliases {
> +		ethernet0 = &EMAC0; /* needed for BSP u-boot */
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@0 {
> +			device_type = "cpu";
> +			model = "PowerPC,apm82181";

This doesn't match the existing bluestone dts file.

Please separate any restructuring from changes.
