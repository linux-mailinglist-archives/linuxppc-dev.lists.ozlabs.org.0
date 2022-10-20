Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 491F060559F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 04:45:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtBmh0QJTz3c69
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 13:45:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G4le0DMd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G4le0DMd;
	dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtBlh6l4kz3042
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 13:45:03 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id e129so17980595pgc.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 19:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DxTNTmWj9D1rQHXlzMQFMBO3C27RqK0bb2TQ7qskUT0=;
        b=G4le0DMd/DCIBNZdMwQxOY5flpwO+b5D4PD+gYTXLe9eI3p1nEiOx5K17nYeGlknvs
         vY8FQLreZ/eNKktPjfFBDq0k9nEl72SFC8kza4Laokp93rVLrBXMRuij8bn84mtslSG/
         E5M/6M+A66K8rS58H3pfJI7s4GMh3CSf48c7VuyjgeKICQm2pd75joYaQgxEWYg8UsIv
         7NEqg5YFLXsfM4bhWbwf/pdHkITTEdWQZP8qUKhlbwPgBdTqjlJ6O3fFIL6Yl5sLMZqj
         HOyevS2TFJDyOyIzvHnsfP3mCXkC/qPs7kt9E3yHLERtw0asJH0PtT0HheYS1wdENg7W
         M8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DxTNTmWj9D1rQHXlzMQFMBO3C27RqK0bb2TQ7qskUT0=;
        b=lfxWij1k6hcOBZaOBtMQFSlV+qTe+DiUO+YzgomyJMAsL5yGNLPyUeMiBeRz++n+Zb
         BE3xFHOkXkhUuU3efUEN8Fr1G+yzOW3ZgArd719kJDfbCibo3H2IXuTWgIceWiB4Ya+h
         VFAmbp38FhfbKY0kAaDNBdTDLcf7Nnp1XngE/XHAsGvbdRFSROUqIoHRUz5FHMKF6JHF
         xrMDTlPkhyMZ4uH69hFiBmTZB1hZvCdfzaTgAwqiXg+pPpVNdny1qk5ZDdNfNjNPTL6a
         +bweMsoOsjkpvsYopcp4/nHskncNyzB54HpTd59Ve29wgCJJbBaMUsVCLuXqQXpXd+3C
         WfvQ==
X-Gm-Message-State: ACrzQf1OKYW1chN+YvTMLfgYds5HqbTcbbR51xNVIFMZ6MPUq+LTPyi7
	Wu/xgjg8LR5wJg5c95g5iMc=
X-Google-Smtp-Source: AMsMyM6UwkpmEE5y/h4FfAmmhnXDZIA3TlSD3kflBN72OO+k4Ln1lu0vuv0jLb4abMwtYBD443hHwg==
X-Received: by 2002:a05:6a00:a28:b0:567:7014:490f with SMTP id p40-20020a056a000a2800b005677014490fmr7653793pfh.10.1666233899965;
        Wed, 19 Oct 2022 19:44:59 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-92.three.co.id. [180.214.233.92])
        by smtp.gmail.com with ESMTPSA id a4-20020a170902ecc400b0017f92d7fe2csm11581423plh.288.2022.10.19.19.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 19:44:59 -0700 (PDT)
Message-ID: <12c8c3c1-eb17-8e44-8906-05e2e3e92acc@gmail.com>
Date: Thu, 20 Oct 2022 09:44:52 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v7 0/8] phy: Add support for Lynx 10G SerDes
To: Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-phy@lists.infradead.org
References: <20221018231112.2142074-1-sean.anderson@seco.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20221018231112.2142074-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/19/22 06:11, Sean Anderson wrote:
> This adds support for the Lynx 10G SerDes found on the QorIQ T-series
> and Layerscape series. Due to limited time and hardware, only support
> for the LS1046ARDB is added in this initial series. There is a sketch
> for LS1088ARDB support, but it is incomplete.
> 
> Dynamic reconfiguration does not work. That is, the configuration must
> match what is set in the RCW. From my testing, SerDes register settings
> appear identical. The issue appears to be between the PCS and the MAC.
> The link itself comes up at both ends, and a mac loopback succeeds.
> However, a PCS loopback results in dropped packets. Perhaps there is
> some undocumented register in the PCS?
> 
> I suspect this driver is around 95% complete, but, unfortunately, I no
> longer have time to investigate this further. At the very least it is
> useful for two cases:
> - Although this is untested, it should support 2.5G SGMII as well as
>   1000BASE-KX. The latter needs MAC and PCS support, but the former
>   should work out of the box.
> - It allows for clock configurations not supported by the RCW. This is
>   very useful if you want to use e.g. SRDS_PRTCL_S1=0x3333 and =0x1133
>   on the same board. This is because the former setting will use PLL1
>   as the 1G reference, but the latter will use PLL1 as the 10G
>   reference. Because we can reconfigure the PLLs, it is possible to
>   always use PLL1 as the 1G reference.
> 
> Changes in v7:
> - Use double quotes everywhere in yaml
> - Break out call order into generic documentation
> - Refuse to switch "major" protocols
> - Update Kconfig to reflect restrictions
> - Remove set/clear of "pcs reset" bit, since it doesn't seem to fix
>   anything.
> 
> Changes in v6:
> - Bump PHY_TYPE_2500BASEX to 13, since PHY_TYPE_USXGMII was added in the
>   meantime
> - fsl,type -> phy-type
> - frequence -> frequency
> - Update MAINTAINERS to include new files
> - Include bitfield.h and slab.h to allow compilation on non-arm64
>   arches.
> - Depend on COMMON_CLK and either layerscape/ppc
> - XGI.9 -> XFI.9
> 
> Changes in v5:
> - Update commit description
> - Dual id header
> - Remove references to PHY_INTERFACE_MODE_1000BASEKX to allow this
>   series to be applied directly to linux/master.
> - Add fsl,lynx-10g.h to MAINTAINERS
> 
> Changes in v4:
> - Add 2500BASE-X and 10GBASE-R phy types
> - Use subnodes to describe lane configuration, instead of describing
>   PCCRs. This is the same style used by phy-cadence-sierra et al.
> - Add ids for Lynx 10g PLLs
> - Rework all debug statements to remove use of __func__. Additional
>   information has been provided as necessary.
> - Consider alternative parent rates in round_rate and not in set_rate.
>   Trying to modify out parent's rate in set_rate will deadlock.
> - Explicitly perform a stop/reset sequence in set_rate. This way we
>   always ensure that the PLL is properly stopped.
> - Set the power-down bit when disabling the PLL. We can do this now that
>   enable/disable aren't abused during the set rate sequence.
> - Fix typos in QSGMII_OFFSET and XFI_OFFSET
> - Rename LNmTECR0_TEQ_TYPE_PRE to LNmTECR0_TEQ_TYPE_POST to better
>   reflect its function (adding post-cursor equalization).
> - Use of_clk_hw_onecell_get instead of a custom function.
> - Return struct clks from lynx_clks_init instead of embedding lynx_clk
>   in lynx_priv.
> - Rework PCCR helper functions; T-series SoCs differ from Layerscape SoCs
>   primarily in the layout and offset of the PCCRs. This will help bring a
>   cleaner abstraction layer. The caps have been removed, since this handles the
>   only current usage.
> - Convert to use new binding format. As a result of this, we no longer need to
>   have protocols for PCIe or SATA. Additionally, modes now live in lynx_group
>   instead of lynx_priv.
> - Remove teq from lynx_proto_params, since it can be determined from
>   preq_ratio/postq_ratio.
> - Fix an early return from lynx_set_mode not releasing serdes->lock.
> - Rename lynx_priv.conf to .cfg, since I kept mistyping it.
> 
> Changes in v3:
> - Manually expand yaml references
> - Add mode configuration to device tree
> - Rename remaining references to QorIQ SerDes to Lynx 10G
> - Fix PLL enable sequence by waiting for our reset request to be cleared
>   before continuing. Do the same for the lock, even though it isn't as
>   critical. Because we will delay for 1.5ms on average, use prepare
>   instead of enable so we can sleep.
> - Document the status of each protocol
> - Fix offset of several bitfields in RECR0
> - Take into account PLLRST_B, SDRST_B, and SDEN when considering whether
>   a PLL is "enabled."
> - Only power off unused lanes.
> - Split mode lane mask into first/last lane (like group)
> - Read modes from device tree
> - Use caps to determine whether KX/KR are supported
> - Move modes to lynx_priv
> - Ensure that the protocol controller is not already in-use when we try
>   to configure a new mode. This should only occur if the device tree is
>   misconfigured (e.g. when QSGMII is selected on two lanes but there is
>   only one QSGMII controller).
> - Split PLL drivers off into their own file
> - Add clock for "ext_dly" instead of writing the bit directly (and
>   racing with any clock code).
> - Use kasprintf instead of open-coding the snprintf dance
> - Support 1000BASE-KX in lynx_lookup_proto. This still requires PCS
>   support, so nothing is truly "enabled" yet.
> - Describe modes in device tree
> - ls1088a: Add serdes bindings
> 
> Changes in v2:
> - Rename to fsl,lynx-10g.yaml
> - Refer to the device in the documentation, rather than the binding
> - Move compatible first
> - Document phy cells in the description
> - Allow a value of 1 for phy-cells. This allows for compatibility with
>   the similar (but according to Ioana Ciornei different enough) lynx-28g
>   binding.
> - Remove minItems
> - Use list for clock-names
> - Fix example binding having too many cells in regs
> - Add #clock-cells. This will allow using assigned-clocks* to configure
>   the PLLs.
> - Document the structure of the compatible strings
> - Rename driver to Lynx 10G (etc.)
> - Fix not clearing group->pll after disabling it
> - Support 1 and 2 phy-cells
> - Power off lanes during probe
> - Clear SGMIIaCR1_PCS_EN during probe
> - Rename LYNX_PROTO_UNKNOWN to LYNX_PROTO_NONE
> - Handle 1000BASE-KX in lynx_proto_mode_prep
> - Use one phy cell for SerDes1, since no lanes can be grouped
> - Disable SerDes by default to prevent breaking boards inadvertently.
> 
> Sean Anderson (8):
>   dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
>   dt-bindings: phy: Add Lynx 10G phy binding
>   dt-bindings: clock: Add ids for Lynx 10g PLLs
>   phy: fsl: Add Lynx 10G SerDes driver
>   arm64: dts: ls1046a: Add serdes bindings
>   arm64: dts: ls1088a: Add serdes bindings
>   arm64: dts: ls1046ardb: Add serdes bindings
>   [WIP] arm64: dts: ls1088ardb: Add serdes bindings
> 
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml |  236 ++++
>  Documentation/driver-api/phy/index.rst        |    1 +
>  Documentation/driver-api/phy/lynx_10g.rst     |   58 +
>  MAINTAINERS                                   |    7 +
>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |  112 ++
>  .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   18 +
>  .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  161 +++
>  .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   18 +
>  drivers/phy/freescale/Kconfig                 |   23 +
>  drivers/phy/freescale/Makefile                |    3 +
>  drivers/phy/freescale/lynx-10g.h              |   16 +
>  drivers/phy/freescale/phy-fsl-lynx-10g-clk.c  |  503 +++++++
>  drivers/phy/freescale/phy-fsl-lynx-10g.c      | 1167 +++++++++++++++++
>  include/dt-bindings/clock/fsl,lynx-10g.h      |   14 +
>  include/dt-bindings/phy/phy.h                 |    2 +
>  15 files changed, 2339 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
>  create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
>  create mode 100644 drivers/phy/freescale/lynx-10g.h
>  create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
>  create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c
>  create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
> 

I can't cleanly apply this series either on arm64 tree or linux-next.
On what tree and commit the series is based on?

-- 
An old man doll... just what I always wanted! - Clara

