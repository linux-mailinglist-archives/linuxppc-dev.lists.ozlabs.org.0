Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDE7264A51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 18:52:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnQ0K0cCZzDqh2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 02:52:01 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnPvh3M0VzDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 02:47:57 +1000 (AEST)
Received: by mail-io1-f68.google.com with SMTP id r9so7858900ioa.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 09:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8fGVKyujTXfspLo9JJxZPzvPko08bc51xw+f5J3oCdk=;
 b=mv10p6Un4d5HghKK0DdOvkrZjIT54p5b0+6DJ+NXBSktCPhbPdZs0bGdbN7vjG7QA0
 ATwQOhGKEiL1GNn1AqAD1panjspoFzaADxLp6PVItFteHrsJdPI+YyYjP0JX0w4i5x0G
 aEwMUyoPYJdlTBHYljAqhTBNYvPpGfFIC8xF4+P5oMJA7/qPGjcknHOHi7WTfMyidKDU
 /Rv5r8mxfu3B84GyxKVd3pUQRombnGCIY7NrKivK7WWmyjbTf7sbsjfeFNxEmKVH+Ufb
 qfTuUodpmEmyEpV/pmu7WLALOR+UMlhw2+OKd5ree7uW57Sztfj4piCm+8UlBUirsMbl
 IA7Q==
X-Gm-Message-State: AOAM530wnvswqWXqIGNviea7vbfz0pO0SompP69vx6zZok2wxCa+PvzB
 zJV+9tdAl75F0JIcWiritg==
X-Google-Smtp-Source: ABdhPJwkuwX0aPaAkSbWdGm7o1Ri1aLdjcJ5kGgtZ1S+LH4iKuSnnyuKFwKcAm7mIz2wxQQQ1TSTTg==
X-Received: by 2002:a5d:8245:: with SMTP id n5mr2399112ioo.149.1599756474870; 
 Thu, 10 Sep 2020 09:47:54 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id d23sm3039062ioh.22.2020.09.10.09.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 09:47:53 -0700 (PDT)
Received: (nullmailer pid 505061 invoked by uid 1000);
 Thu, 10 Sep 2020 16:47:51 -0000
Date: Thu, 10 Sep 2020 10:47:51 -0600
From: Rob Herring <robh@kernel.org>
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Subject: Re: [PATCHv7 10/12] arm64: dts: layerscape: Add PCIe EP node for
 ls1088a
Message-ID: <20200910164751.GA501845@bogus>
References: <20200811095441.7636-1-Zhiqiang.Hou@nxp.com>
 <20200811095441.7636-11-Zhiqiang.Hou@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200811095441.7636-11-Zhiqiang.Hou@nxp.com>
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
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com,
 Xiaowei Bao <xiaowei.bao@nxp.com>, roy.zang@nxp.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, minghuan.Lian@nxp.com,
 jingoohan1@gmail.com, andrew.murray@arm.com, mingkai.hu@nxp.com,
 gustavo.pimentel@synopsys.com, bhelgaas@google.com, shawnguo@kernel.org,
 kishon@ti.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 11, 2020 at 05:54:39PM +0800, Zhiqiang Hou wrote:
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
> 
> Add PCIe EP node for ls1088a to support EP mode.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Reviewed-by: Andrew Murray <andrew.murray@arm.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V7:
>  - Rebase the patch without functionality change.
> 
>  .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index 169f4742ae3b..915592141f1b 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -499,6 +499,17 @@
>  			status = "disabled";
>  		};
>  
> +		pcie_ep@3400000 {

pci-ep@...

> +			compatible = "fsl,ls1088a-pcie-ep","fsl,ls-pcie-ep";
> +			reg = <0x00 0x03400000 0x0 0x00100000
> +			       0x20 0x00000000 0x8 0x00000000>;
> +			reg-names = "regs", "addr_space";
> +			num-ib-windows = <24>;
> +			num-ob-windows = <128>;
> +			max-functions = /bits/ 8 <2>;
> +			status = "disabled";
> +		};
> +
>  		pcie@3500000 {
>  			compatible = "fsl,ls1088a-pcie";
>  			reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
> @@ -525,6 +536,16 @@
>  			status = "disabled";
>  		};
>  
> +		pcie_ep@3500000 {
> +			compatible = "fsl,ls1088a-pcie-ep","fsl,ls-pcie-ep";
> +			reg = <0x00 0x03500000 0x0 0x00100000
> +			       0x28 0x00000000 0x8 0x00000000>;
> +			reg-names = "regs", "addr_space";
> +			num-ib-windows = <6>;
> +			num-ob-windows = <8>;
> +			status = "disabled";
> +		};
> +
>  		pcie@3600000 {
>  			compatible = "fsl,ls1088a-pcie";
>  			reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
> @@ -551,6 +572,16 @@
>  			status = "disabled";
>  		};
>  
> +		pcie_ep@3600000 {
> +			compatible = "fsl,ls1088a-pcie-ep","fsl,ls-pcie-ep";
> +			reg = <0x00 0x03600000 0x0 0x00100000
> +			       0x30 0x00000000 0x8 0x00000000>;
> +			reg-names = "regs", "addr_space";
> +			num-ib-windows = <6>;
> +			num-ob-windows = <8>;
> +			status = "disabled";
> +		};
> +
>  		smmu: iommu@5000000 {
>  			compatible = "arm,mmu-500";
>  			reg = <0 0x5000000 0 0x800000>;
> -- 
> 2.17.1
> 
