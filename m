Return-Path: <linuxppc-dev+bounces-11171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5CBB2EB76
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Aug 2025 04:53:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6nvg6JRrz2xQt;
	Thu, 21 Aug 2025 12:53:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755744831;
	cv=fail; b=PG0b+dyhJe0WyTk2iEH3s6v0zFSfwd0ruAsduRfxseRxCkalvgMdkk44xwvKPvUEsU1FhjCCrI/bgo7uiSLEzENPj2H45TUhVNbr5K1RPy2hnuN8lPlTJzPFDsIqsEXyPWXSGtQQMu9AqIpRBfUlUxj9TWYJ1Z5HAmJfD5y2aM0cKCl4wXiysZ1ASjCAJuvqjOn2CeWbbo0YMpTl1fwUiyyQ6HdxgNhD3esrFNOZbsBIrWRz5GqLukwx5QMKRwMiimoDZJnMxRW4gnqp8z4N+vBurQzRWdLck/Bqx6ReowSFjoUOFVC0Ucfk3Dc3O3MIf+N/nDsiiJL+lzb6QF4+Ng==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755744831; c=relaxed/relaxed;
	bh=us5HPxEWak+Z5wIcd9yL1Je4zM6FA2HXHnNZtF6tjio=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WAjGAj2f60JtzL25klTdvOcLCAyhY60V5068U61W+suV+wW+VLwG4wOk4lX9O/DwODlDlkLRCSNr8RGD8r3FPLzzP/pWYRu8atDU4OjmumOjNrHyFUw60sB4iZcRbVoKENWbMxC/D4+T087rriHbDTKgJlrQ6rPG2M3wc0uzVWiFz8qV08UwN0hHT1GqQ4oWIwd5vdDxAW0kDL6MaZJO/UwdLKlac0ZI5C8MEjpTTavLYvAn76Tmy2xmEcnhwpm6PvjFzi4EhKng0ySQI492bpdPGZiIuqYaReDonUXQ1TI1MyAWf2rCyNf+nlY+5+9EbSH/JZORZHsFZK1VAnow/A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cm2TFWPk; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cm2TFWPk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=oliver.sang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6nvd13zbz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Aug 2025 12:53:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755744829; x=1787280829;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=b7VLiopQ1dbd3Y4njnqpMQGBEPS7AkoecSlMrdrOwh0=;
  b=cm2TFWPksP7ABdNT5skHwb6cxQQk9WOlSv6zZHYlfBJGZFkSxQvTL32m
   Q3yDEWA9RFwhYZ/95h7AW8RUSzs5lQGB7aOkLsamZKBR2xlk0QaicsM+F
   z6uRm1XZ5ZWLv6ZCPdJeDvmRMrEDxGY9lyxsfsznyPVINLY5uRfqhcICF
   0ant2PyyDvb1uNAs/XySVilarn5dHZdI4JXvewePo3gZnoqV+qAyEbYbn
   R7GFfpe4j+IIcBIE5LDGHSIF0nsPqp45fiac3+G1imlfEa8LY/SavnrWt
   W/41KigWH4mNYPpMFJvm87jxu5KXJ1gj7ntvn7JYBool4swfDLS5+qi+J
   g==;
X-CSE-ConnectionGUID: 1ypYBFpQTNijpklxYUh6Xw==
X-CSE-MsgGUID: 0tsPxjmWTY6x5B03940rBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75607331"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="75607331"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 19:53:44 -0700
X-CSE-ConnectionGUID: 9/oHiCbGTXyUbvJs8bgumg==
X-CSE-MsgGUID: 6hWzjSJhTtydzjcQLdujwg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 19:53:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 19:53:43 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 19:53:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.63)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 19:53:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9XrXixsqSYwkcuGgttTLcaEyRQ+EZJ3ILk2juqiiHiM4V3j1iC8PuJJcXRvv7gXL0MegDrzitnQRMkrFSWt3VCL0BnEMTQVk10XexV3etk6cWjz9FIHetXwCkFc3+vC92MHVzsfz+UQqjp0yqosoC92VBBNBONP6sT+b1TTyO5lQYhjvz0CZeW4SDaQWCMizE7+5cLAXYfSCR60PDqRrFnjI+thofSL0zTNVP7aW+rogKCUiahRk4ZIMzqd0vGzmEPNjcIyGj+olusUa68Xft3sB+Whuv45r5G98O7azlGQBu2rtM1y1qrGi7+jT2CcRjkPhOS0SDc89FZlpvwjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=us5HPxEWak+Z5wIcd9yL1Je4zM6FA2HXHnNZtF6tjio=;
 b=SpqTTXMz0ChA3MWLc5qNIRfZFOz/d+c99qL8EA4Pg/x0PAiGXZZKyJ75hXqy5BVMLxMKBihvrQMUD9Zi7znEOdOf8dyxbICE+3DsqjtEsk5J6F3Q0TNQdYR5oR+mp57mxQucq+H2TgFXJPeEgz/rcw6RN5osq9pqflHXur/+a3jaqVCTP5VD2BxiLqeoczTOS/Yt8jwYDDU+IiknlIKPEoAEPQyjr+EGbb4IViY4/xzA1hRwdkbWp2UjZELnyTFtPDot0VtMJIrH+FyN/YlLRKpGX0WoZ16JdmTt6xaUrjU2xZa5QmGxsqWs4yrv5MC3DbrlFlCqUtYThTAhpBEb0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA3PR11MB7612.namprd11.prod.outlook.com (2603:10b6:806:31b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 02:53:40 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 02:53:40 +0000
Date: Thu, 21 Aug 2025 10:53:21 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Robin Murphy <robin.murphy@arm.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-s390@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <peterz@infradead.org>,
	<mingo@redhat.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<acme@kernel.org>, <namhyung@kernel.org>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <kan.liang@linux.intel.com>,
	<linux-alpha@vger.kernel.org>, <linux-snps-arc@lists.infradead.org>,
	<imx@lists.linux.dev>, <linux-csky@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-mips@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-sh@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rockchip@lists.infradead.org>, <dmaengine@vger.kernel.org>,
	<linux-fpga@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
	<intel-xe@lists.freedesktop.org>, <coresight@lists.linaro.org>,
	<iommu@lists.linux.dev>, <linux-amlogic@lists.infradead.org>,
	<linux-cxl@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <oliver.sang@intel.com>
Subject: Re: [PATCH 18/19] perf: Introduce positive capability for raw events
Message-ID: <202508211037.3f897218-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <542787fd188ea15ef41c53d557989c962ed44771.1755096883.git.robin.murphy@arm.com>
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To LV3PR11MB8603.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA3PR11MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: a79f70fb-d67f-4713-7430-08dde05def31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pV6vx/h8482Dn1wfx7nKgj3YF6GePZP4stTQELhvnJTZ093VIGEKopRjbbR3?=
 =?us-ascii?Q?wKYx/r0IAB7G/y/lsJ+KThMirkTNq6duoC5Vw7yNdtZK2nkhxz5wwJmkxj18?=
 =?us-ascii?Q?nCLbBwO5JcDJ0md0Q9RwJXUG5iDtGU3fcgoO2BTREpS4j0KxDnRPNA1wUKFI?=
 =?us-ascii?Q?lFbarX2LTwIy9124Fr1HXGAoBiwYvy97QB6GH6yI1NuroOu/W2+UdDdHhK/3?=
 =?us-ascii?Q?AAcalJzXQf/0w+GodUXGl/+o6iaPtzqRVqU2i9twCHo+1ksx3nJAxJUFoHQK?=
 =?us-ascii?Q?VO0JroYI5Pp173IBSzdp8HHjtaCtiVEemx/f+CeioMa74eoBS4KwTRtbyobi?=
 =?us-ascii?Q?vnBaPuDCX1M5PQsOM/eHT9IC/yODtZLgeIz+meYJz7//4BXviw9x+WeRvaN6?=
 =?us-ascii?Q?TQA4BuFpnBYnDX236pyGP6e+rQndUtXcYM4XmYR4BB8GLhISM/oJzrklqcBZ?=
 =?us-ascii?Q?5t2ANTxp/5BxI38qXUqMskggbGRjCY/2zoN6ERej2brNiSwqtwqxNDrP04fj?=
 =?us-ascii?Q?PcZTFwvIZ9eRyyMmBGKG4+rbwH4I2x3Tq8G4Ctb0/fC6BvHn3CSJYbW26BzY?=
 =?us-ascii?Q?zWhh+ELySDTj44nRzIEe6jqGJgPT+dnEFKnmM6FiyZh1fLsYltHVMOSRisqw?=
 =?us-ascii?Q?o6hR96eZx8gx7kkY7VYkv/c9pSgHAhS0I7+qGS7ruiFjPC2LnsadYG29SaPu?=
 =?us-ascii?Q?OAdBG7eRhKSU5yHO7MdOtj2ojXX9Wj7NoJESgugQD0Eug4Q4mRy0pyOTXWn1?=
 =?us-ascii?Q?rPm0LXTCXKxRYqXgCIh3fgoK/XIqjl8Y6u7c1vBx+Mi4F04ftcldU0tMfcl9?=
 =?us-ascii?Q?sxEPQ4ZNs7iwh4ADKMzcxhh62A6V0kF6QoYQIW71SLfQGsz2poBP+SbCU7Id?=
 =?us-ascii?Q?BQLvXzSz3hWoobqR3uEEjX1uRlETMfUa5KLiWgFlsBq5M4MOQuzH00t34sCp?=
 =?us-ascii?Q?V3pR18XY8HPB7HigcxO57VvykM/WfnyVvroy00cnHsRUH5M/mKPQkBsE/ba3?=
 =?us-ascii?Q?I3sCUi3bchoXciD/wA5SExOYzSV/diVYgOZHvKJc3VWwj5Tds8G1N4OcRy4i?=
 =?us-ascii?Q?wjLEtT8IiBoRhCixj/HvEz3/cMKhgbu5W0T0lCEv5czF7heeN7qKkiWVfuiO?=
 =?us-ascii?Q?6ZwmhTnOitA3Zzt5TUbSgTH6yKK58cOBFov90XmeevZ5z60CzpE0qmyTo1U3?=
 =?us-ascii?Q?nv/MPJxk9FiLImgz3INidQ+s/obqLs0J1Qp2h+K/Gn0YBGQYY4TqLTIpBdTg?=
 =?us-ascii?Q?cbN84T4otD/V0oJJN7mz8hWn7ef2ZTGQNfC5dy8fE+u5lRVdJmcRlJkliGCX?=
 =?us-ascii?Q?i7kS6i+5knhpLRJ4Of0bVaF1gUZCn20cM9+7xARoZ3rt/hpcCWC0GUwPudHV?=
 =?us-ascii?Q?aO7kU8mQtV3aW5ZP5gnzaiF6qdnB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HC2UktMXOfxw2RO7xeHgyIqB2IHTOeXPIq2ZKdhAiBzIP0ROwLDmcyWqplqC?=
 =?us-ascii?Q?uOdQ6lh/ItDxGRPBw1hJPcaNcmwQgW/rX2xT25FFMVagSIhTBR7mk7T93LuN?=
 =?us-ascii?Q?ThD1aTnAsr9NBM6/sw/tibLg27VM8RirnQXfFSHPWShI8EYtqfwv9m9cxRsU?=
 =?us-ascii?Q?qh7ATwvmIx4kBC9npk4v5IKynvp1eh6Vbl0LH8T6xMb2pyS/30+1gA6j8UCb?=
 =?us-ascii?Q?9dfwMb33ZHGtj8acuseQ+IUv8O/ZZkFiIUvORzVKklY9Ge/k3DW6vSWAmYYo?=
 =?us-ascii?Q?j4ldkpKLCshK+cFKRjFcAQ0ibn9p1/DqoXF+pyYsiwMu/t0RsiLA12YCLzI2?=
 =?us-ascii?Q?M8sVljDYj/rMpdMnq/D3fFWGIocR5qiXLDCPKAwh2QL/2sDz4wGet3wBGc6e?=
 =?us-ascii?Q?ZjgLcuwhbCFlgjtpZjNQlPav8c2OA2RHXX67+76aqtHAGluul9zPL1mIVXIa?=
 =?us-ascii?Q?UgPvDFYQPIYgoRFalHq6Nhs8oA4ZO6+AjycrdEigHjZPoqliYWZyD/jogbqq?=
 =?us-ascii?Q?OYUT2HrFKp4VT0fX/CVx0jS0EB6DBBOb0XgASKksvYoGznyNJu7BwMhDZU2J?=
 =?us-ascii?Q?83X64RS0q9uEtOrc0dURPinK3EdTor02mED7F2Oq/bJoYhf6Yo5eFHFXx3qj?=
 =?us-ascii?Q?Ciytdw4ptkecG5P+3/7CQbJ9x8ZXEIRxwLbK+JY0U1BYlS1/BpAFOtvpXyH6?=
 =?us-ascii?Q?5+X8VTWK9ZAN64VBshP3PbAIFMg3upmwtoqLNCAovXxQ5bkMpS+XasLJ3n6m?=
 =?us-ascii?Q?E8sd+X1k/0PMn4rEMWBIam0xEQlEGz6sHE7KFU+OovbMFe8EgYq57gk8Zpju?=
 =?us-ascii?Q?EpaRC6gx6AIE4VRBFjRYQPpokigU77IYhCH/Fg6/G6D0DXfT56W9WaL/Uv/4?=
 =?us-ascii?Q?ulEZzzi0G7c9S9UzmAHZYeBR5Qfy4USn1xVAFva45Zb4HCvnQPymQ/FxbwdN?=
 =?us-ascii?Q?CXDlX7/B4WHf7TdwxrIooAufL7byavbUZCwGQCwxIs6FzcOYU3vdAX2OMXeD?=
 =?us-ascii?Q?mHczCWwAhWlyEJByyGDwlQnU+dMmdunVlgq6vEnZbLIllDX6vpf17UyPS/bd?=
 =?us-ascii?Q?ZL9iy4epX5ms7mVSXWn2UKDen41M1HqBBYLWf00JATJYMnk3kGIBiIm0dvO2?=
 =?us-ascii?Q?4m5UWErCsqaUhhGxkZ9W4bCnTerDraHmdN6EFElkjd1phLlMMxozm39R6jUa?=
 =?us-ascii?Q?MTIKn8iinvlG3kFNig6GlF7mxkFHcYQ7fxOefI5VkU0N9vCu053Pr+icKDhl?=
 =?us-ascii?Q?zSGmeAq4h/8CP/1bueQgxMB6rlAfm/sMBfbBHKezfVj8BtgWf4SwtvR/biIZ?=
 =?us-ascii?Q?9TjgqWImKItN56ZhfsuCkexxaxrUNC95prMtq9yVW1Lh7nZzp16YWpQXPYDR?=
 =?us-ascii?Q?AW3Pf5ypyHIny6c/vxYXz2SnNPIhBrpiUOvHta5B02vMJQFuSVzJysFO15s0?=
 =?us-ascii?Q?yu60pktaLF61zilpa0bOs+p/H+RC2+hGxB3mWSMzqkJ2nZIP+fKsuyz+zrgA?=
 =?us-ascii?Q?/XSnXnbCVNqd9iL5cKWMQbPcLGlLImPNs5W5LuvFLb2tAEqT0h98o43GDkcL?=
 =?us-ascii?Q?kD409CleM5U9CqF9wcqPfx6uEq3Kmtgn5ZqSZ2abjJS+W0+mnqGM6gCa5ZpM?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a79f70fb-d67f-4713-7430-08dde05def31
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 02:53:40.7764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Vz8UsI+7Aqf5HI6rtkycfIj/aRohd2CR4G55WpRZtUEvnAjF9uq+brWDTcSXdZf+L4yAVN/gu7i7e1YdDBYTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7612
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Hello,

kernel test robot noticed "perf-sanity-tests.Event_groups.fail" on:

commit: a704f7a13544a408baee6fa78f0f24fa05bfa406 ("[PATCH 18/19] perf: Introduce positive capability for raw events")
url: https://github.com/intel-lab-lkp/linux/commits/Robin-Murphy/perf-arm-cmn-Fix-event-validation/20250814-010626
base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 91325f31afc1026de28665cf1a7b6e157fa4d39d
patch link: https://lore.kernel.org/all/542787fd188ea15ef41c53d557989c962ed44771.1755096883.git.robin.murphy@arm.com/
patch subject: [PATCH 18/19] perf: Introduce positive capability for raw events

in testcase: perf-sanity-tests
version: 
with following parameters:

	perf_compiler: gcc
	group: group-01



config: x86_64-rhel-9.4-bpf
compiler: gcc-12
test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H CPU @ 2.90GHz (Cooper Lake) with 192G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202508211037.3f897218-lkp@intel.com


besides Event_groups, we also noticed perf_stat_JSON_output_linter and
perf_stat_STD_output_linter become failed upon this commit but pass on parent.

0129bbf0ee6f109a a704f7a13544a408baee6fa78f0
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :38          16%           6:6     perf-sanity-tests.Event_groups.fail
           :38          16%           6:6     perf-sanity-tests.perf_stat_JSON_output_linter.fail
           :38          16%           6:6     perf-sanity-tests.perf_stat_STD_output_linter.fail



2025-08-18 13:20:21 sudo /usr/src/linux-perf-x86_64-rhel-9.4-bpf-a704f7a13544a408baee6fa78f0f24fa05bfa406/tools/perf/perf test 66 -v
 66: Event groups                                                    : Running (1 active)
--- start ---
test child forked, pid 9619
Using CPUID GenuineIntel-6-55-B
Using uncore_imc_0 for uncore pmu event
0x0 0x0, 0x0 0x0, 0x0 0x1: Fail
0x0 0x0, 0x0 0x0, 0x1 0x3: Fail
0x0 0x0, 0x0 0x0, 0xf 0x1: Fail
0x0 0x0, 0x1 0x3, 0x0 0x0: Fail
0x0 0x0, 0x1 0x3, 0x1 0x3: Fail
0x0 0x0, 0x1 0x3, 0xf 0x1: Fail
0x0 0x0, 0xf 0x1, 0x0 0x0: Fail
0x0 0x0, 0xf 0x1, 0x1 0x3: Fail
0x0 0x0, 0xf 0x1, 0xf 0x1: Fail
0x1 0x3, 0x0 0x0, 0x0 0x0: Fail
0x1 0x3, 0x0 0x0, 0x1 0x3: Fail
0x1 0x3, 0x0 0x0, 0xf 0x1: Pass
0x1 0x3, 0x1 0x3, 0x0 0x0: Fail
0x1 0x3, 0x1 0x3, 0x1 0x3: Pass
0x1 0x3, 0x1 0x3, 0xf 0x1: Pass
0x1 0x3, 0xf 0x1, 0x0 0x0: Pass
0x1 0x3, 0xf 0x1, 0x1 0x3: Pass
0x1 0x3, 0xf 0x1, 0xf 0x1: Pass
0xf 0x1, 0x0 0x0, 0x0 0x0: Pass
0xf 0x1, 0x0 0x0, 0x1 0x3: Pass
0xf 0x1, 0x0 0x0, 0xf 0x1: Pass
0xf 0x1, 0x1 0x3, 0x0 0x0: Pass
0xf 0x1, 0x1 0x3, 0x1 0x3: Pass
0xf 0x1, 0x1 0x3, 0xf 0x1: Pass
0xf 0x1, 0xf 0x1, 0x0 0x0: Pass
0xf 0x1, 0xf 0x1, 0x1 0x3: Pass
0xf 0x1, 0xf 0x1, 0xf 0x1: Pass
---- end(-1) ----
 66: Event groups                                                    : FAILED!

...

2025-08-18 13:29:36 sudo /usr/src/linux-perf-x86_64-rhel-9.4-bpf-a704f7a13544a408baee6fa78f0f24fa05bfa406/tools/perf/perf test 97 -v
 97: perf stat JSON output linter                                    : Running (1 active)
--- start ---
test child forked, pid 20715
Checking json output: no args [Success]
Checking json output: system wide [Success]
Checking json output: interval [Success]
Checking json output: event [Success]
Checking json output: per thread [Success]
Checking json output: per node [Success]
Checking json output: metric only Test failed for input:
{"metric-value" : "none"}

Traceback (most recent call last):
  File "/usr/src/perf_selftests-x86_64-rhel-9.4-bpf-a704f7a13544a408baee6fa78f0f24fa05bfa406/tools/perf/tests/shell/lib/perf_json_output_lint.py", line 108, in <module>
    check_json_output(expected_items)
  File "/usr/src/perf_selftests-x86_64-rhel-9.4-bpf-a704f7a13544a408baee6fa78f0f24fa05bfa406/tools/perf/tests/shell/lib/perf_json_output_lint.py", line 93, in check_json_output
    raise RuntimeError(f'Check failed for: key={key} value={value}')
RuntimeError: Check failed for: key=metric-value value=none
---- end(-1) ----
 97: perf stat JSON output linter                                    : FAILED!

...

2025-08-18 13:29:46 sudo /usr/src/linux-perf-x86_64-rhel-9.4-bpf-a704f7a13544a408baee6fa78f0f24fa05bfa406/tools/perf/perf test 99 -v
 99: perf stat STD output linter                                     : Running (1 active)
--- start ---
test child forked, pid 20818
Checking STD output: no args [Success]
Checking STD output: system wide [Success]
Checking STD output: interval [Success]
Checking STD output: per thread [Success]
Checking STD output: per node [Success]
Checking STD output: metric only ---- end(-1) ----
 99: perf stat STD output linter                                     : FAILED!



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250821/202508211037.3f897218-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


