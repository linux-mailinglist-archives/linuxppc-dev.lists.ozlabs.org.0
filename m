Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6929C9B19E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 16:08:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FNXj6c91zDrfJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 00:08:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=lorenzo.pieralisi@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46FNSp1x5rzDrtm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 00:04:56 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9429128;
 Fri, 23 Aug 2019 07:04:54 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (unknown [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A388D3F718;
 Fri, 23 Aug 2019 07:04:52 -0700 (PDT)
Date: Fri, 23 Aug 2019 15:04:47 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pci: layerscape-pci: add compatible
 strings "fsl,ls1028a-pcie"
Message-ID: <20190823140447.GA19283@e121166-lin.cambridge.arm.com>
References: <20190823082643.10903-1-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190823082643.10903-1-xiaowei.bao@nxp.com>
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
Cc: mark.rutland@arm.com, roy.zang@nxp.com, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, zhiqiang.hou@nxp.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, minghuan.Lian@nxp.com,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, bhelgaas@google.com,
 shawnguo@kernel.org, mingkai.hu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 23, 2019 at 04:26:41PM +0800, Xiaowei Bao wrote:
> Add the PCIe compatible string for LS1028A
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - No change.
> v3:
>  - No change.
> v4:
>  - No change.
> 
>  Documentation/devicetree/bindings/pci/layerscape-pci.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> index e20ceaa..99a386e 100644
> --- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> @@ -21,6 +21,7 @@ Required properties:
>          "fsl,ls1046a-pcie"
>          "fsl,ls1043a-pcie"
>          "fsl,ls1012a-pcie"
> +        "fsl,ls1028a-pcie"
>    EP mode:
>  	"fsl,ls1046a-pcie-ep", "fsl,ls-pcie-ep"
>  - reg: base addresses and lengths of the PCIe controller register blocks.

This series does not apply to v5.3-rc1, what is it based on ?

Lorenzo
