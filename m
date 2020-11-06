Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C752A9288
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 10:27:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSFR460rNzDrHP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 20:27:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=samsung.com (client-ip=210.118.77.11;
 helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=Y6h+CXqa; 
 dkim-atps=neutral
X-Greylist: delayed 486 seconds by postgrey-1.36 at bilbo;
 Fri, 06 Nov 2020 20:25:48 AEDT
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSFP84MxZzDrGq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 20:25:42 +1100 (AEDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20201106091710euoutp01a3fb7590aca570993f4a71758223f76f~E4IVSALMF2336123361euoutp01e;
 Fri,  6 Nov 2020 09:17:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20201106091710euoutp01a3fb7590aca570993f4a71758223f76f~E4IVSALMF2336123361euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604654230;
 bh=21wqxFY+rhYS7yfUh8u/AU7V25NfuFEGtP4GBPEKnXw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Y6h+CXqae5RH+BSOW3H1AtuM3Ioge/g5HLaAYmrFFhr5fSyXaZXINpWxkg8uJu/0c
 ayH/ceU5wtWhh0HDBnCPv22xucBr3oWyd19XF28WZWA5Lwsg2bRH0BieE6r/D97TdV
 KYCwGfsWoQoDQxliuzFQl4sJk11mQt0OVJmIpNlA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201106091710eucas1p2392018640bed2c247a4025f5a6516892~E4IVIS7PL0939709397eucas1p2S;
 Fri,  6 Nov 2020 09:17:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id DE.08.06456.69415AF5; Fri,  6
 Nov 2020 09:17:10 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201106091709eucas1p10f775cacfc6a9cb543ddd3b2cb942ea3~E4IUrokrW1109811098eucas1p1p;
 Fri,  6 Nov 2020 09:17:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201106091709eusmtrp291c39170ab698e044b401f3d1e32edba~E4IUqMtjb1088010880eusmtrp29;
 Fri,  6 Nov 2020 09:17:09 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-07-5fa5149652aa
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 74.EF.06017.59415AF5; Fri,  6
 Nov 2020 09:17:09 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201106091707eusmtip2901eab6f443cb51ab65bf86ae986876a~E4ISgzA1o0792207922eusmtip24;
 Fri,  6 Nov 2020 09:17:07 +0000 (GMT)
Subject: Re: [PATCH v2 00/16] PCI: dwc: Another round of clean-ups
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <7eb813b3-41cc-a88c-0261-ba31995aaeb4@samsung.com>
Date: Fri, 6 Nov 2020 10:17:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105211159.1814485-1-robh@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTZxTO23t776Vadq24vqvGLZ1ZsmUKDJKd6OKU7MdNjI7MuewjyCpe
 PjKo2oobujhW6ia1KGimcGtr6WpABswVBMG6skJaGYE6UeyW4oRCBhPR8DECTB3lQsa/53nO
 c95znpO8DKG4QKuYLO1BXqfVZKspGdngm+5afzbmYmrcUM0y6ArPkuA0ZEKHZ5SEvjvvQnPv
 cRpagwYEQoMVwUh/GwF/eQUCKifKaDAKDhLu/TOGoOq7JhJOhR8QMP1tvQRuDpopCAQu03Df
 +rsE7JZl4PFfkoAr3COFEk8nDaaZSwRYnKdI6LT5KSgN/CyBwgmBgtmpp1IYmR2i4WRRCwU+
 RzsJJ1pT4cqJuxLwnvwEbCW3KXjmvjo3fsCB4Emji4SheiWMzAQJuO78AKabbSQUjozS0NMo
 h8Cx0jn53jiCX64lbInlKm+apFxb9Q+Iq7ZVI+5ubTL3KHiM5mzVR7gmoZfm7K5cbrD4DM2F
 rT/RnKuqkOJCPW6Kq3N+xQVKyxHn8pwluKKCUSr5+Y9lb+3ls7MO8brYzZ/KMg2OuP3+l74w
 9LVK8lGVyoSiGMwm4sFuI2VCMkbBViJsra1ZIBMItza0kyIZR7guVI4WW4LFtyVioQLhi0U+
 WiSPEC6abJeaEMOsZJNw6NzrkYYY9j3cfKOCiHgI9jyDA+Hr88++wP4mxQ+sdknERbHx2PTQ
 REWwnN2MT98Ym9dJdh0u77YQEbyK3YOfjP9LiJ4VuL1sgIzgKPZNXDPZM68T7Iu44IplASvx
 HwMX5lfFbJkMG7+eJMUM72Bj/2VCxCvx3/56WsRr8LOmxYYChPu6amiRmBHuNpQuXGATDnXN
 UJGcBPsq/rE5VpS3Ys9j87yM2WgcfLhCXCIan244R4iyHB//RiG6X8GCv5YuRi8LS+IISyII
 SyII/8+yI7IKKflcfU4Gr4/X8p9v0Gty9LnajA1p+3JcaO7bdDz1j11Fk7f2eBHLIPVyectH
 zlSFVHNIn5fjRZgh1DHypM6O3Qr5Xk3eYV63L1WXm83rvWg1Q6qV8gTHcIqCzdAc5D/j+f28
 brEqYaJU+QhZps5vS87aHppV3V/jW9t77UDa0R2Jq/I6hpcfUX6f3r/zy5SRyjNtLRkGqfHA
 xpIdH65NcfmNCdFmefr2po7hX3fvzLszpUlrWWcu121cv8ubXKESDtftUm96Wzq1LZwpe//W
 c0rfFkV67VH7G2OjUrevrNGdiB//qXXH5Rd3a5LUpD5TE/8aodNr/gNXvT04MgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTVxiAd+69vffWreNaYJyxZTONicumLQWxL0YJMdm8+7FMZ7Ko4Loq
 N5SMtqYfZm4/RnBOKCjgBoM2VCyVSEXnKkr5cNXiQMawJGqtTEiRGnGrbHNupjJlLXUJ/56c
 8zznIzmHJaXn6Uy2VG8WjHpNmYxeQo08HZpc1ZB2TJ117+eVcGV6jgJXhRZGfLMUTF1/H3on
 KhkYCFUgsJ1rQRC9fYmEu34bCccfNjPwpc1JweQ/DxC4G3ooqJ3+jYTYgS4Cxu7U0BAInGYg
 3HKTgFb78+Ab6iDAMx0UQb1vlAHr4w4S7K5aCkYdQzQ0BX4goOqhjYa5R09FEJ2bYeDQwQs0
 DDqHKageUMPZ6hsE+A8VgqP+Gg3z/d749hEngifdHgpmujIg+jhEwnnXhxDrdVBQFZ1lINgt
 gcD+pvjw5F8ILvblFCj442NWEX+p8wTiOx2diL9xahP/e2g/wzs6P+d7bBMM3+qx8Hfqvmb4
 6ZbvGd7jrqL5W8F+mj/j+oIPNB1FvMfXSPIH983Sm17aLl9nNFjMwjKtwWReLytUQrZcmQfy
 7NV5cmWOasfa7FyZIn9dsVBWukcwKvI/lmsrnFm7h5Z9WjE1QJQjd6YViVnMrcahumuEFS1h
 pdwxhJ94I2Ry4lU83FguSnIq/jdopZPSfYTH++YZK2LZVG4DvvXtyoSTxn2A+640ihIOyTlZ
 3F4bXghe5q6KcLutjUzWVoQHOr9BiYTmlNh6P7GsmJVw+fjw5QdEgiluOT561b5wjHRuJ743
 1kAknaV4uDlCJVjMqfDJv4MLDsmtwY4zU8/4dbzvrP0ZZ+DxyBGiDqXaFuW2RYltUWJblLQi
 yo3SBItJV6IzZctNGp3Joi+R7zLoPCj+dM8Nxrq8yDq7xY84FslekFzY5lJLRZo9pr06P8Is
 KUuTbBgd+UgqKdbs/UwwGtRGS5lg8qPc+OXqycz0XYb4R9Cb1cpcpQrylKocVc4akGVIKrmL
 RVKuRGMWPhGE3YLx/45gxZnl6J2frq+Y7257e25HQeVzRT2PlntvC1ulO7eIs74qMihr7O7v
 Ii+e3FZTvDHAehW9f2b9OjWoDKWM+WKqvjAV21zySrTUlbI0ZXPKa1oy4/CJFev54a3pf0wq
 3girCl2rDsy89WM1FrV13A2PNm9ce+Td05d/kd7sL4D292SFxvGJRr2MMmk1yjdJo0nzH0ER
 /SvQAwAA
X-CMS-MailID: 20201106091709eucas1p10f775cacfc6a9cb543ddd3b2cb942ea3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201105211208eucas1p29087cdd73805e670aff9f3a43f644e05
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201105211208eucas1p29087cdd73805e670aff9f3a43f644e05
References: <CGME20201105211208eucas1p29087cdd73805e670aff9f3a43f644e05@eucas1p2.samsung.com>
 <20201105211159.1814485-1-robh@kernel.org>
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Minghuan Lian <minghuan.Lian@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, NXP Linux Team <linux-imx@nxp.com>,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roy Zang <roy.zang@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Vidya Sagar <vidyas@nvidia.com>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob,

On 05.11.2020 22:11, Rob Herring wrote:
> Here's another batch of DWC PCI host refactoring. This series primarily
> moves more of the MSI, link up, and resource handling to the core
> code. Beyond a couple of minor fixes, new in this version is runtime
> detection of iATU regions instead of using DT properties.

iATU detection seems to work fine with 
https://lore.kernel.org/linux-samsung-soc/20201029134017.27400-1-m.szyprowski@samsung.com/ 
on top of your patchset on Samsung Exynos5433 SoC:

exynos-pcie 15700000.pcie: host bridge /soc@0/pcie@15700000 ranges:
exynos-pcie 15700000.pcie:       IO 0x000c001000..0x000c010fff -> 
0x0000000000
exynos-pcie 15700000.pcie:      MEM 0x000c011000..0x000ffffffe -> 
0x000c011000
exynos-pcie 15700000.pcie: iATU unroll: disabled
exynos-pcie 15700000.pcie: Detected iATU regions: 3 outbound, 5 inbound
exynos-pcie 15700000.pcie: Link up
exynos-pcie 15700000.pcie: PCI host bridge to bus 0000:00

Fell free to add my:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> No doubt I've probably broken something. Please test. I've run this thru
> kernelci and checked boards with DWC PCI which currently is just
> Layerscape boards (hint: add boards and/or enable PCI). A git branch is
> here[1].
>
> This is dependent on "PCI: dwc: Restore ATU memory resource setup to use
> last entry" which will be in v5.10-rc3.
>
> Rob
>
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git pci-more-dwc-cleanup
>
> Rob Herring (16):
>    PCI: dwc: Support multiple ATU memory regions
>    PCI: dwc/intel-gw: Move ATU offset out of driver match data
>    PCI: dwc: Move "dbi", "dbi2", and "addr_space" resource setup into
>      common code
>    PCI: dwc/intel-gw: Remove some unneeded function wrappers
>    PCI: dwc: Ensure all outbound ATU windows are reset
>    PCI: dwc/dra7xx: Use the common MSI irq_chip
>    PCI: dwc: Drop the .set_num_vectors() host op
>    PCI: dwc: Move MSI interrupt setup into DWC common code
>    PCI: dwc: Rework MSI initialization
>    PCI: dwc: Move link handling into common code
>    PCI: dwc: Move dw_pcie_msi_init() into core
>    PCI: dwc: Move dw_pcie_setup_rc() to DWC common code
>    PCI: dwc: Remove unnecessary wrappers around dw_pcie_host_init()
>    Revert "PCI: dwc/keystone: Drop duplicated 'num-viewport'"
>    PCI: dwc: Move inbound and outbound windows to common struct
>    PCI: dwc: Detect number of iATU windows
>
>   drivers/pci/controller/dwc/pci-dra7xx.c       | 141 +-----------------
>   drivers/pci/controller/dwc/pci-exynos.c       |  50 ++-----
>   drivers/pci/controller/dwc/pci-imx6.c         |  39 +----
>   drivers/pci/controller/dwc/pci-keystone.c     |  79 ++--------
>   .../pci/controller/dwc/pci-layerscape-ep.c    |  37 +----
>   drivers/pci/controller/dwc/pci-layerscape.c   |  67 +--------
>   drivers/pci/controller/dwc/pci-meson.c        |  53 ++-----
>   drivers/pci/controller/dwc/pcie-al.c          |  29 +---
>   drivers/pci/controller/dwc/pcie-armada8k.c    |  37 ++---
>   drivers/pci/controller/dwc/pcie-artpec6.c     |  76 +---------
>   .../pci/controller/dwc/pcie-designware-ep.c   |  58 +++----
>   .../pci/controller/dwc/pcie-designware-host.c | 139 ++++++++++-------
>   .../pci/controller/dwc/pcie-designware-plat.c |  70 +--------
>   drivers/pci/controller/dwc/pcie-designware.c  |  93 +++++++++++-
>   drivers/pci/controller/dwc/pcie-designware.h  |  24 +--
>   drivers/pci/controller/dwc/pcie-histb.c       |  37 ++---
>   drivers/pci/controller/dwc/pcie-intel-gw.c    |  67 ++-------
>   drivers/pci/controller/dwc/pcie-kirin.c       |  62 +-------
>   drivers/pci/controller/dwc/pcie-qcom.c        |  38 +----
>   drivers/pci/controller/dwc/pcie-spear13xx.c   |  62 +++-----
>   drivers/pci/controller/dwc/pcie-tegra194.c    |  41 +----
>   drivers/pci/controller/dwc/pcie-uniphier-ep.c |  38 +----
>   drivers/pci/controller/dwc/pcie-uniphier.c    |  51 +------
>   23 files changed, 356 insertions(+), 1032 deletions(-)
>
> --
> 2.25.1
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

