Return-Path: <linuxppc-dev+bounces-14532-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37043C90FA8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Nov 2025 07:37:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHk9P0ZG5z2yrg;
	Fri, 28 Nov 2025 17:36:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764311816;
	cv=fail; b=I2aPmH9nXlLlVLFYVDZui3XBUwvPMxGDAL49bPvbChOrYq5XhW9YangBNJDzHDHzSvxIZGwTts8pOue2YmB/veK+7OnjNApX2QYY6u2svnJYYiyZYQGenCkkp/6c581M00C6uh5RsjO6w+UqINRtC8DWzt+o29irhUfr5M8XMG1TiJ1leO0KWKa363HyfOPDB6Fd9p8CFjlGNcvaA2MAVSHTv9JvVXDCcaeXCWLltCbGC6ecTM+obg2i6gCwWQpDSNZd6NgAuzFXXxZRQhMzxK4QpUg7oRBp6vsMeofh74XDqrg3He1l/v8spVCd3yRDMJikBTfa7yRDwoDxK35K2g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764311816; c=relaxed/relaxed;
	bh=8ategXCkbUrxgbwC9zjZYReP3TV/rgSzFeOrlVYC6/I=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=h/BMVESqWAVXsLBxzOOvim6IMXez/39vaU5aTo7immILGO2CkiyEMB4rRiUuV3KIoM0DF0S10yr+5jZH3vYs1i/W8x3agXFFr8FElYTGXEE2F27QeyrKfFneRfTW4Yt+x2y24EKg/zcxYiEGvJo6xhJBNqq677gHr2qGMqON3TXnwgJkj8GLySz4QaSC/wgP+8k7WM6+gYZSBqRlv64Rxy3md88kf728rCjYS8CxN56Cv3PgeXtilgXT2VwTtZtWdyuV2U4n/NL92QVpx0Gyd++aUgRH7l2XBBSZhjXnxKDaxzw3/Dfv54hiR385Eb9b9fi+OspwAThsJogIv5FCKg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aL3K1A26; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aL3K1A26;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 28 Nov 2025 17:36:54 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHk9L1qyTz2yFy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 17:36:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764311814; x=1795847814;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=8qZyt3CZWAQ5qPWBbL8LYbkrqhpxtmWCnfjm+sNMoFc=;
  b=aL3K1A26vsSZsgU1x0xg32ce7hXDkc+DevcHHU3VlCoc1sDivkZGveYI
   HbRT15UmQwyTaRwlGAmsVlROcVXOaUiB614QQ5O5BeI0XQbf9TC2pQokU
   0OP/waAZNG4n4K7smIYmes34r+cZXji+M8JTc9zPONks+KD5zM8WzWYkY
   vZ6acUEbxJZm2lZ5MfW8nECo7EwcPXNul5MEqqlUmIJ8cNC/77XsWAnj3
   XY2MuAEgaQUvfwsTr+/dYxEqp8OJzo/A+uYxG/Em+GYfPnIyjowr3P52L
   Brw140waqxXhRL+KZFFOXgg4Rx8ZwG3+UQWx2dciqU7OH7NMEBp1zWh4B
   w==;
X-CSE-ConnectionGUID: LvCSP6rzQdSC2Rn4cx5niA==
X-CSE-MsgGUID: tMG3dnmIQaGSy1E/74D+Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77032242"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="77032242"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:35:44 -0800
X-CSE-ConnectionGUID: 55w924TbSi2xKTiwRcLXHg==
X-CSE-MsgGUID: Y3lcWMV3Q/ifXM4paXEpOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193397012"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:35:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 22:35:43 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 22:35:43 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 22:35:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ga7o5DEn7QkN1FJBdtpwk+5B1YI1EAHnKaq3yyXCc+135eKU+QDNqGUA4qCDs6VRj60QJGJJFv22/Dp19eiaQlUovIYW6KAk4U7ud7lXmkChnIauzklNK8a4eoWLI6Fg4IkZsaph8Mv6ZPbwXlwWzejryrgVPkdAvFtMNGPnOhijRPIHxGD+3ODp14cYwNIDRaHIF9C8kMBzFIRw8xiR6TQbbAtdWcR8IrFZ6+OgfMrXrEEuHeNOSVnbTTO+woD/7v0q0M7Dv+IpHXuDFr0QG3z9Sy/6g35Hn88KvefSKB2LcSZ8iEKOO4rW5X2vOB2n7E+u2R+WP7e7v5M875gZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1nsgm9Ip4cLSKTsrSxPlDpzB1LY49FqNU6arBPnfMc=;
 b=Pen/bIjPA0Bm5HWoG4aCQmKW6CtuDUxs0eDAzGh3fStFS1aDLZUzXQc6foOgABzLrWqfnvNo/KVwezUzOSTsHInfvHrDg6flQzs2f/ZfOA5gCsZYclOEH9ol332fS6EUpZM8vkSbMOKD5yJab6jzKwVrTDicbl5Oj75ibsgt4kSPUYRuaI1kpd1gsT56uI/ISOclzAIPAvVUPIgjkmjInccoLi5h4jx4ItKeNjU6pBJOQ+PkCchy3DG+tOaRDazAV6vmxiQq1Wxetvk228v6a4RXXUcd/M2jU7tb9Ig5HVz4cDKbGNHJ7JhXssTkoueCFy8OK0rtY9cF0dYtbK890A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CO1PR11MB4915.namprd11.prod.outlook.com (2603:10b6:303:93::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 06:35:40 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 06:35:40 +0000
Date: Fri, 28 Nov 2025 14:35:25 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thierry Reding <treding@nvidia.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, "Rafael J. Wysocki"
	<rafael@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-sh@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-hyperv@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, <kvm@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-rockchip@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-mediatek@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-leds@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, <oliver.sang@intel.com>
Subject: [linux-next:master] [syscore]  a97fbc3ee3:
 will-it-scale.per_process_ops 3.2% regression
Message-ID: <202511281432.47ac7e38-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:194::21) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CO1PR11MB4915:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eaf8dfa-bf1b-4ec4-fcee-08de2e48594d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?EFp53KH0HxNC2xm3JlGjU28j6rFzy4Ry+EC6UFfrhsBDDeVgTLBjZv3B9/?=
 =?iso-8859-1?Q?RYDolJOFxq7oQB+gE5KrQrwHhyp35gocjEUeVFQ+ZIIRh4ye4+QTZzCo22?=
 =?iso-8859-1?Q?wQNF3diApWO3r/NDLspxg7CKp+9eGVkTNsYHRAzkIB8gH7B5uVX1yN5YWW?=
 =?iso-8859-1?Q?YAQIQeCgW4ASS0nF2hXiOsJxATWZFNWlzMpQf/sIdRbQKDKl3P6aYIJEVZ?=
 =?iso-8859-1?Q?WCZa1Mzfzub58IKEqETQevjBRWE6pjuyI2UorpsqhPW/erMtJuvmYCpxkX?=
 =?iso-8859-1?Q?D5dIuVTB0O10l6eJXWT/IzhDSofBjUTQ8UwaLRhQGzUtFdxLO9WY2tj+pr?=
 =?iso-8859-1?Q?NFASEPudecC3Sh0+gBwlnUxwagxdG9EuuwuYvV38jaTw1l/CrXt51qD+zZ?=
 =?iso-8859-1?Q?9oQVlUcWVFOTcJSVmIfDnOVeCGdEq+lKZj3FP0J8434EiQK8OY4Um8H/fs?=
 =?iso-8859-1?Q?WTfU+8XLi07Bh6Z6wClmihd02fZUc+fGK75l2Z5HDGYlLW66Scbm9ATOpN?=
 =?iso-8859-1?Q?Qr37ZcbVflNN1KgIjy/4qsjX8eEfHdtj7fXB7XAHc+4KRl6x6MWYV8u02F?=
 =?iso-8859-1?Q?neMYZfXo4PPC5oJS7R2sKMMaP2gccgIwp/2qUxc/K3cjKK/Ziu08KyBJ/x?=
 =?iso-8859-1?Q?dXkzWO1RFoZQ+kf7r9k+2IZTHBUjQEl5tNvFgcLZrqk1RGe7BANWLLmxXH?=
 =?iso-8859-1?Q?OF/sHBMUx68cTVHEA7g21Sa5pwbIdLSXLXKZF0fs6buZmj/heHDSOCcQgv?=
 =?iso-8859-1?Q?VbHW7Tg/lAiWe5f/Jx9YMXZhBiLdvgVY0YKscf0mRjX5kgjQlEOoPM7dtH?=
 =?iso-8859-1?Q?GQiXWXAQ5bGrQRoslBs8jeBJGBe/aBkwVqslvY3cy4EHEOx+E8EjShMBkz?=
 =?iso-8859-1?Q?+BcVJNQ+cp++wIFr3ywYemqh9RIVOUNBKWBJf6bh2XQ51u1eS2yOtxTsQb?=
 =?iso-8859-1?Q?SZbYRMIO9nqmrlSAi486s5X5z+AvOwYsRG7OdkkPagqfh0Q80FU+HAoC4t?=
 =?iso-8859-1?Q?d81gH5mNjX9gi8rwG/2XUpLTxw9GeY1FGAxtU0v6IKdpzPJ9zeQ9qVvvsJ?=
 =?iso-8859-1?Q?GXvEKHhJgVdIq0HGMddNgVj28sLW7aSHZ8Q2Geu8spPAJg17oV2cvc6MFZ?=
 =?iso-8859-1?Q?Y4wPWkXGoC6fyvGXsH4ZFP24bBtRNUa8WgOao2RJbBtBKMzUFwPHdwpxP8?=
 =?iso-8859-1?Q?K9zbvhKKT6vdoh4uUomuu81LBQ6L5eSp+cqApWFPo+6TCFseaI2wRnuTk9?=
 =?iso-8859-1?Q?9GaDRV9IU4OA7GwgMjdAA+s1o/j9aa8zZZS1XgIS0NEcBrMYY2uKRpCwnX?=
 =?iso-8859-1?Q?j5sGbhfe9ZRkjNthSd7jDq19D20/5cxZa7xNtqDXCsEMlsvppS2zI5bzZ/?=
 =?iso-8859-1?Q?PjeiEubQl1K6/PoGCyGZ5ZKCFky+0pX4vaK4yEgw3bDgRj60aLJ5aRUdej?=
 =?iso-8859-1?Q?fQgYdTgzBciaoGu5901GUfIL7MHf5q5eVQAtctZQZ//oX3FSvk4OpaTzvP?=
 =?iso-8859-1?Q?Dkdl1oEdRrVhL92FGucaTaLuYaTLJuR7gAZx4zZ5iOvw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?t6zuwfsmHUleIb4YtmoF7hxy3UNa5AB7p7MfI8FI/hyHjnVrrSZiQrgsQL?=
 =?iso-8859-1?Q?ZvN16y1qoJ1omfgQsPFUti+PzfrXGKX1NZBt0w/D/E9EGuJRRKP//mgr/A?=
 =?iso-8859-1?Q?YlQf6NbZKbpxwN14iEclA2HDi28ZJMQ39EaMNVBFIBya1tUfSwo0K6SBE3?=
 =?iso-8859-1?Q?x9jSkMdCz/u3C+jeRjcQ7PmvtihympDBB1ESg1qzYbeXoXnAsM2qB04+yB?=
 =?iso-8859-1?Q?K0XrmShmaIZvZflu201E16UzyjNcuXtdtF/pxJJ1dvKKV8vwTlSQKr9/u8?=
 =?iso-8859-1?Q?su5AeHDAt3cifUDc9Z0rr7roS/h4MgIhurP3BJvM/ZoLwS73h+L6015Y6Y?=
 =?iso-8859-1?Q?h+MOXwF+YB++ET25tKiFuRD7R0+tCMHgBIy+AogFZ4Xll1RqlO2DpKjKUT?=
 =?iso-8859-1?Q?3afSXNFxsbWSKboPSF77/Wr59onGY1VIyuAe2DuPWCaZkaHjVuP3MooftE?=
 =?iso-8859-1?Q?WSDNtt04Slw3QOF+YWfCEXR2q7ltjZnIEOtOGfbcIW22BARTxvJAOaOeRK?=
 =?iso-8859-1?Q?IBgTf/gbIEWDjyazrKR9TXnJCwkHuh0z9HTmUvzduxEksNM/kx9Ovb8/7E?=
 =?iso-8859-1?Q?GZAicig+JCvamUdNBWIQHPf9BZAQ5XFKvH8zlpj3pw6HYlLn7IrTV+i8X1?=
 =?iso-8859-1?Q?5Miw6NaapD8D8LlOvVrjTbRMAPZcsEJDMq6SaxTsTCJgHT6w+r2G4BvaJ+?=
 =?iso-8859-1?Q?ePgEVoAq2dOT5uYM2lgOE9qkkazAQYtgrcB/UGOQzrLl003XYHwybxZb3c?=
 =?iso-8859-1?Q?Z8Z5OhguV6TUoX2XzXQYz90suQkyALFBDvyBQlmlWWm5ZABUidvrOFU+Y7?=
 =?iso-8859-1?Q?3C+uz9KwJCJhvUt/CSag2o8G1fM/uLTCtAVpwaIMC5Is+icShWhOOmmQn0?=
 =?iso-8859-1?Q?2LUXJ9VQPfcq7xV6ZF/H4t1lqfRozlD+QyX9f3vO0pLDofW5AHUXg1wlWE?=
 =?iso-8859-1?Q?nSvKBzMzVj346se/68FIF1N5WR0cxrlOzoZZRASvzP0RiehxzFVon1aaj4?=
 =?iso-8859-1?Q?EXIke5mbC06Ls+nHsL2ftJ1azsHEvw3Y3IhkGDOR/O4ZNy+UKlpJaMV/JX?=
 =?iso-8859-1?Q?8mG3Kdq7RHURfKfEWvRczllSwj8EiuRGPah0EWk9TsrlUlZABKYU68ZIDa?=
 =?iso-8859-1?Q?SHDfN3LEF0lInz/ldbyCvuytGFk3YuGWCUou/f0wpWY9mBcN1KcTSGFbJk?=
 =?iso-8859-1?Q?O72Q4oOSRPzu4HGAJMhn3r8mUf0b7GsD7xM+7Ocqvsx6j6wK6ip2zdWBcB?=
 =?iso-8859-1?Q?H8GoJvlDDJxqEuorVS1E6QzI8T8rdjWXLOMzzSOlF2T1kJ/jz4f+PDhgrg?=
 =?iso-8859-1?Q?d17NieR+U8kb76X2Hy/ECsY/cl0CcX1rzS4DmPfjpEvI2UjRtoTXseSZt3?=
 =?iso-8859-1?Q?EHgQBh2fGSj7U+0thLy15pr9a8aS4a4PrfdDdwGoZWKgMtkr71HJEVP1Yk?=
 =?iso-8859-1?Q?BG0Aw8IqOjnes3JxFTDwnkAKyqkDUqReeuVUs+cbxCKaNJff/D262A0att?=
 =?iso-8859-1?Q?y9wxR/Mc3lcupg71Vlgu//UdePGJbMeg2SccXffSyr46MRiJ1wa8gRWna5?=
 =?iso-8859-1?Q?06Ps2FFYXsYUTZkFeMGyqbDhpPv8+aLkOIwzaePsLeNFUkHUlXpg92ntiR?=
 =?iso-8859-1?Q?QUR4IpVjc2gHF8cz2iyJMRuwqDI4adLEuykQnb+s1OwwSEAr1qhlPW1g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eaf8dfa-bf1b-4ec4-fcee-08de2e48594d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 06:35:40.5327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmfS8NaE17GcvD65qsG/EMO5v0RPd+8DXn5Q8d8/qNCwZQg4j/mUxxx28bAjHkgpTLtwYChWWgPsGf5p0HRk9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4915
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Hello,

kernel test robot noticed a 3.2% regression of will-it-scale.per_process_ops on:


commit: a97fbc3ee3e2a536fafaff04f21f45472db71769 ("syscore: Pass context data to callbacks")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[still regression on linux-next/master ef68bf704646690aba5e81c2f7be8d6ef13d7ad8]

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-14
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_task: 100%
	mode: process
	test: signal1
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202511281432.47ac7e38-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20251128/202511281432.47ac7e38-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-14/performance/x86_64-rhel-9.4/process/100%/debian-13-x86_64-20250902.cgz/lkp-icl-2sp7/signal1/will-it-scale

commit: 
  v6.18-rc1
  a97fbc3ee3 ("syscore: Pass context data to callbacks")

       v6.18-rc1 a97fbc3ee3e2a536fafaff04f21 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     71066 ±105%    +119.1%     155709 ± 64%  numa-meminfo.node1.AnonHugePages
     34.80 ±105%    +118.6%      76.08 ± 64%  numa-vmstat.node1.nr_anon_transparent_hugepages
      0.34            +0.2        0.52 ± 25%  mpstat.cpu.all.idle%
      0.01            +0.0        0.01 ±  3%  mpstat.cpu.all.soft%
    142.02 ±  5%     +20.2%     170.65 ±  9%  sched_debug.cfs_rq:/.runnable_avg.stddev
      7.16 ±  5%     +52.9%      10.94 ±  8%  sched_debug.cpu.clock.stddev
      1233 ±  4%     -22.2%     960.17 ±  8%  perf-c2c.DRAM.remote
      2429 ±  3%     -18.0%       1993        perf-c2c.HITM.local
      1010 ±  5%     -29.8%     709.00 ±  2%  perf-c2c.HITM.remote
   8382642            -3.2%    8118230        will-it-scale.64.processes
    130978            -3.2%     126846        will-it-scale.per_process_ops
   8382642            -3.2%    8118230        will-it-scale.workload
    285565            -1.6%     280908        proc-vmstat.nr_active_anon
     28063            +4.4%      29306        proc-vmstat.nr_mapped
    117169            -3.9%     112656        proc-vmstat.nr_shmem
    285565            -1.6%     280908        proc-vmstat.nr_zone_active_anon
     38231 ± 33%     -48.6%      19647 ± 35%  proc-vmstat.numa_hint_faults
     19706 ± 75%     -65.5%       6790 ± 15%  proc-vmstat.numa_hint_faults_local
 9.391e+09            -3.1%  9.102e+09        perf-stat.i.branch-instructions
      0.48            -0.0        0.45        perf-stat.i.branch-miss-rate%
  45545162           -10.7%   40674481        perf-stat.i.branch-misses
     11.08 ±  8%      -2.3        8.81 ± 12%  perf-stat.i.cache-miss-rate%
      1811            +6.2%       1922        perf-stat.i.context-switches
      5.09            +3.2%       5.26        perf-stat.i.cpi
    117.53            -2.1%     115.06        perf-stat.i.cpu-migrations
    216404 ±  2%     +86.7%     404107 ±  4%  perf-stat.i.cycles-between-cache-misses
  3.87e+10            -3.1%  3.752e+10        perf-stat.i.instructions
      0.20            -3.1%       0.19        perf-stat.i.ipc
      0.49            -0.0        0.45        perf-stat.overall.branch-miss-rate%
      5.10            +3.2%       5.26        perf-stat.overall.cpi
      0.20            -3.1%       0.19        perf-stat.overall.ipc
 9.361e+09            -3.1%  9.068e+09        perf-stat.ps.branch-instructions
  45428240           -10.7%   40562730        perf-stat.ps.branch-misses
      1806            +6.2%       1917        perf-stat.ps.context-switches
    117.13            -2.1%     114.62        perf-stat.ps.cpu-migrations
 3.858e+10            -3.1%  3.738e+10        perf-stat.ps.instructions
 1.166e+13            -3.0%  1.131e+13        perf-stat.total.instructions
     32.30            -6.5       25.85        perf-profile.calltrace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
     31.42            -6.4       25.04        perf-profile.calltrace.cycles-pp.dequeue_signal.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
     30.28            -6.3       23.98        perf-profile.calltrace.cycles-pp.dec_rlimit_put_ucounts.__sigqueue_free.dequeue_signal.get_signal.arch_do_signal_or_restart
     30.32            -6.3       24.02        perf-profile.calltrace.cycles-pp.__sigqueue_free.dequeue_signal.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop
     37.60            -6.0       31.57        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
     37.68            -6.0       31.66        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
     90.92            -0.5       90.43        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     90.63            -0.5       90.14        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.62            +0.0        0.65        perf-profile.calltrace.cycles-pp.check_xstate_in_sigframe.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn
      0.72 ±  2%      +0.0        0.75        perf-profile.calltrace.cycles-pp.kmem_cache_alloc_noprof.__send_signal_locked.do_send_sig_info.do_send_specific.__x64_sys_tgkill
      0.67            +0.0        0.70        perf-profile.calltrace.cycles-pp.__fpu_restore_sig.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64
      2.54            +0.0        2.58        perf-profile.calltrace.cycles-pp.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.15            +0.0        1.19        perf-profile.calltrace.cycles-pp.fpu__clear_user_states.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.78            +0.0        1.83        perf-profile.calltrace.cycles-pp.clear_bhb_loop
      0.56            +0.1        0.61        perf-profile.calltrace.cycles-pp.rseq_ip_fixup.__rseq_handle_notify_resume.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
      1.46            +0.1        1.51        perf-profile.calltrace.cycles-pp.__restore_fpregs_from_user.restore_fpregs_from_user.fpu__restore_sig.restore_sigcontext.__x64_sys_rt_sigreturn
      1.62            +0.1        1.68        perf-profile.calltrace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.handler
      3.06            +0.1        3.11        perf-profile.calltrace.cycles-pp.restore_sigcontext.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.69            +0.1        1.75        perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe.handler
      1.91            +0.1        1.98        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.handler
      1.88            +0.1        1.96        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.handler
      0.96            +0.1        1.04        perf-profile.calltrace.cycles-pp.save_xstate_epilog.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop
      0.93            +0.1        1.02        perf-profile.calltrace.cycles-pp.__rseq_handle_notify_resume.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      4.46            +0.1        4.57        perf-profile.calltrace.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.18            +0.2        2.35        perf-profile.calltrace.cycles-pp.copy_fpstate_to_sigframe.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop
      4.88            +0.3        5.14        perf-profile.calltrace.cycles-pp.handler
      3.66            +0.3        3.95        perf-profile.calltrace.cycles-pp.get_sigframe.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64
      4.16            +0.3        4.50        perf-profile.calltrace.cycles-pp.x64_setup_rt_frame.arch_do_signal_or_restart.exit_to_user_mode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.5        0.51        perf-profile.calltrace.cycles-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.__get_user_nocheck_8.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwframe
     45.91            +5.3       51.19        perf-profile.calltrace.cycles-pp.do_send_sig_info.do_send_specific.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_after_hwframe
     46.73            +5.3       52.02        perf-profile.calltrace.cycles-pp.do_send_specific.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_after_hwframe
     47.27            +5.3       52.57        perf-profile.calltrace.cycles-pp.__x64_sys_tgkill.do_syscall_64.entry_SYSCALL_64_after_hwframe
     45.10            +5.3       50.43        perf-profile.calltrace.cycles-pp.__send_signal_locked.do_send_sig_info.do_send_specific.__x64_sys_tgkill.do_syscall_64
     43.31            +5.3       48.65        perf-profile.calltrace.cycles-pp.inc_rlimit_get_ucounts.sig_get_ucounts.__send_signal_locked.do_send_sig_info.do_send_specific
     43.39            +5.3       48.73        perf-profile.calltrace.cycles-pp.sig_get_ucounts.__send_signal_locked.do_send_sig_info.do_send_specific.__x64_sys_tgkill
     32.36            -6.5       25.90        perf-profile.children.cycles-pp.get_signal
     31.44            -6.4       25.06        perf-profile.children.cycles-pp.dequeue_signal
     30.29            -6.3       23.99        perf-profile.children.cycles-pp.dec_rlimit_put_ucounts
     30.33            -6.3       24.03        perf-profile.children.cycles-pp.__sigqueue_free
     39.26            -6.0       33.30        perf-profile.children.cycles-pp.arch_do_signal_or_restart
     39.38            -5.9       33.43        perf-profile.children.cycles-pp.exit_to_user_mode_loop
     93.64            -0.3       93.30        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     93.28            -0.3       92.95        perf-profile.children.cycles-pp.do_syscall_64
      0.36 ± 11%      -0.1        0.25        perf-profile.children.cycles-pp.recalc_sigpending
      0.61 ± 11%      -0.1        0.50 ±  6%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.43            -0.1        0.38        perf-profile.children.cycles-pp.fpregs_mark_activate
      0.44            -0.0        0.40        perf-profile.children.cycles-pp.complete_signal
      0.27 ±  5%      -0.0        0.23 ±  3%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.25 ±  6%      -0.0        0.22 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.25 ±  6%      -0.0        0.22 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.25            -0.0        0.22 ±  5%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.29 ±  5%      -0.0        0.26 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.31 ±  2%      -0.0        0.28        perf-profile.children.cycles-pp.set_current_blocked
      0.05            +0.0        0.06        perf-profile.children.cycles-pp.fpu__alloc_mathframe
      0.06            +0.0        0.07        perf-profile.children.cycles-pp.__cond_resched
      0.20            +0.0        0.21        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.24            +0.0        0.25        perf-profile.children.cycles-pp.__get_user_nocheck_4
      0.39            +0.0        0.40        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.72            +0.0        0.74        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.20            +0.0        0.22        perf-profile.children.cycles-pp.__get_user_8
      0.22 ±  2%      +0.0        0.24        perf-profile.children.cycles-pp.__put_user_8
      0.46 ±  3%      +0.0        0.48        perf-profile.children.cycles-pp.__memcg_slab_post_alloc_hook
      0.69            +0.0        0.71        perf-profile.children.cycles-pp.__fpu_restore_sig
      0.27            +0.0        0.30        perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.63            +0.0        0.66        perf-profile.children.cycles-pp.check_xstate_in_sigframe
      0.74            +0.0        0.77        perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.50            +0.0        0.53        perf-profile.children.cycles-pp.restore_altstack
      0.32            +0.0        0.35        perf-profile.children.cycles-pp.rseq_update_cpu_node_id
      0.36            +0.0        0.39        perf-profile.children.cycles-pp.__put_user_nocheck_4
      0.69            +0.0        0.73        perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.37            +0.0        0.40        perf-profile.children.cycles-pp.__put_user_nocheck_8
      2.06            +0.0        2.10        perf-profile.children.cycles-pp.__getpid
      0.66            +0.0        0.70        perf-profile.children.cycles-pp._copy_from_user
      2.55            +0.0        2.59        perf-profile.children.cycles-pp.fpu__restore_sig
      0.87            +0.0        0.91        perf-profile.children.cycles-pp.its_return_thunk
      1.21            +0.0        1.25        perf-profile.children.cycles-pp.fpu__clear_user_states
      1.48            +0.0        1.52        perf-profile.children.cycles-pp.__restore_fpregs_from_user
      2.39            +0.1        2.44        perf-profile.children.cycles-pp.clear_bhb_loop
      0.09 ±  4%      +0.1        0.14 ±  4%  perf-profile.children.cycles-pp.shmem_file_write_iter
      0.08            +0.1        0.14 ±  5%  perf-profile.children.cycles-pp.generic_perform_write
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.shmem_get_folio_gfp
      0.10 ±  3%      +0.1        0.16 ±  3%  perf-profile.children.cycles-pp.perf_mmap__push
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.shmem_write_begin
      0.58            +0.1        0.64        perf-profile.children.cycles-pp.rseq_ip_fixup
      3.08            +0.1        3.13        perf-profile.children.cycles-pp.restore_sigcontext
      0.10 ±  3%      +0.1        0.16 ±  4%  perf-profile.children.cycles-pp.record__mmap_read_evlist
      0.09 ±  5%      +0.1        0.15 ±  4%  perf-profile.children.cycles-pp.record__pushfn
      0.12 ±  4%      +0.1        0.18 ±  4%  perf-profile.children.cycles-pp.handle_internal_command
      0.12 ±  4%      +0.1        0.18 ±  4%  perf-profile.children.cycles-pp.main
      0.12 ±  4%      +0.1        0.18 ±  4%  perf-profile.children.cycles-pp.run_builtin
      0.11 ±  6%      +0.1        0.17 ±  5%  perf-profile.children.cycles-pp.cmd_record
      0.98            +0.1        1.06        perf-profile.children.cycles-pp.__get_user_nocheck_8
      1.36            +0.1        1.45        perf-profile.children.cycles-pp.native_irq_return_iret
      1.00            +0.1        1.09        perf-profile.children.cycles-pp.save_xstate_epilog
      0.95            +0.1        1.04        perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      4.52            +0.1        4.64        perf-profile.children.cycles-pp.__x64_sys_rt_sigreturn
      2.27            +0.2        2.45        perf-profile.children.cycles-pp.copy_fpstate_to_sigframe
      3.68            +0.2        3.86        perf-profile.children.cycles-pp.handler
      3.68            +0.3        3.98        perf-profile.children.cycles-pp.get_sigframe
      4.21            +0.3        4.55        perf-profile.children.cycles-pp.x64_setup_rt_frame
     45.96            +5.3       51.25        perf-profile.children.cycles-pp.do_send_sig_info
     46.77            +5.3       52.07        perf-profile.children.cycles-pp.do_send_specific
     47.30            +5.3       52.60        perf-profile.children.cycles-pp.__x64_sys_tgkill
     45.18            +5.3       50.51        perf-profile.children.cycles-pp.__send_signal_locked
     43.40            +5.3       48.74        perf-profile.children.cycles-pp.sig_get_ucounts
     43.32            +5.3       48.66        perf-profile.children.cycles-pp.inc_rlimit_get_ucounts
     30.28            -6.3       23.98        perf-profile.self.cycles-pp.dec_rlimit_put_ucounts
      0.34 ± 12%      -0.1        0.23 ±  2%  perf-profile.self.cycles-pp.recalc_sigpending
      0.58 ± 12%      -0.1        0.48 ±  6%  perf-profile.self.cycles-pp._raw_spin_lock_irq
      0.31            -0.1        0.25 ±  2%  perf-profile.self.cycles-pp.complete_signal
      0.36            -0.1        0.31        perf-profile.self.cycles-pp.fpregs_mark_activate
      0.23 ±  2%      -0.0        0.20 ±  3%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.20            +0.0        0.21        perf-profile.self.cycles-pp.arch_do_signal_or_restart
      0.07            +0.0        0.08        perf-profile.self.cycles-pp.collect_signal
      0.40            +0.0        0.41        perf-profile.self.cycles-pp.__getpid
      0.20            +0.0        0.21        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.23            +0.0        0.24 ±  2%  perf-profile.self.cycles-pp.__get_user_nocheck_4
      0.15 ±  2%      +0.0        0.16 ±  2%  perf-profile.self.cycles-pp.__x64_sys_rt_sigreturn
      0.26            +0.0        0.28        perf-profile.self.cycles-pp.kmem_cache_free
      0.10            +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.signal_setup_done
      0.70            +0.0        0.72        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.18 ±  2%      +0.0        0.20        perf-profile.self.cycles-pp.__get_user_8
      0.21 ±  3%      +0.0        0.23        perf-profile.self.cycles-pp.__put_user_8
      0.25 ±  3%      +0.0        0.27 ±  2%  perf-profile.self.cycles-pp.__memcg_slab_post_alloc_hook
      0.47            +0.0        0.49        perf-profile.self.cycles-pp.get_signal
      0.52            +0.0        0.55        perf-profile.self.cycles-pp.its_return_thunk
      0.37            +0.0        0.40        perf-profile.self.cycles-pp.get_sigframe
      0.34            +0.0        0.37        perf-profile.self.cycles-pp.__put_user_nocheck_4
      0.31            +0.0        0.34        perf-profile.self.cycles-pp.rseq_update_cpu_node_id
      0.34            +0.0        0.38        perf-profile.self.cycles-pp.__put_user_nocheck_8
      0.37 ±  2%      +0.0        0.41        perf-profile.self.cycles-pp.save_xstate_epilog
      0.64            +0.0        0.68        perf-profile.self.cycles-pp.arch_exit_to_user_mode_prepare
      0.64            +0.0        0.68        perf-profile.self.cycles-pp._copy_from_user
      0.53            +0.0        0.57        perf-profile.self.cycles-pp.x64_setup_rt_frame
      1.46            +0.0        1.51        perf-profile.self.cycles-pp.__restore_fpregs_from_user
      2.36            +0.1        2.41        perf-profile.self.cycles-pp.clear_bhb_loop
      1.00            +0.1        1.06        perf-profile.self.cycles-pp.fpu__clear_user_states
      0.94            +0.1        1.01        perf-profile.self.cycles-pp.__get_user_nocheck_8
      1.36            +0.1        1.45        perf-profile.self.cycles-pp.native_irq_return_iret
      1.45            +0.1        1.55        perf-profile.self.cycles-pp.copy_fpstate_to_sigframe
     43.32            +5.3       48.66        perf-profile.self.cycles-pp.inc_rlimit_get_ucounts




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


