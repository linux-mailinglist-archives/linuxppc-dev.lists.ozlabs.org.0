Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A45AF076
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 18:34:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMWDj75P7z3blf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 02:34:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xh7furVw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.6.66; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=xh7furVw;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60066.outbound.protection.outlook.com [40.107.6.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMWCv6HTNz2xrH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 02:33:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUb8JmpiuxwWAVZGbfE/Mqc/xQuNCvxS3GO6WBzRGq27AS+FBhxVs+u6ge+JkEF11x7l68Z8KrOWiNAMeqVb8REZZ9FPWfN4xQFQR4D1aVgCDDZlyFqH7absrs0y6hg2Av4qVjjgD3wMuU/O1zLrzaE3j6R7Udnz3rs+38HjhomQpn6EaFSWDN86EW4BdXolqxnov+PsKT+0eFUi0UZaZcayVCnDBv9gZrjzfJ20+UrxGS2kUQmKM13IyVPM5ilMbpw3P0PKsHEzBpSadQ5bDJsW/9e1uM7iLU8zTANDE4fluLpTPmLKPLJu7Ym1e0ylpIPhG+QrsiiyaC6Aymey+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+1LO3SsvLV3dl+8y0DscovSx1BrFvLkdH8sfZGVOhs=;
 b=coPZ9iA/wIsxzR2JXbuBw1vew+KSu17CvHrZNMk5SFkxHEWp2JZHg1Ui7oeBZG4GV9Wg7he1nCOyvB25ESffuVn/C6efrpuDnrPA9eXxzkFO9n9qbrBYekLwTkPMukkElIQOfg+Onim/NdPghJ+HF938HxmAi+xFd1ktmXb/7AVEiEs9svMT350Vu9OM1EaRoLOJqHGGyFU+ZduMA/WRcQwAGCpSMInq9ZwNZPE20OSGkUKx32Rl84BUN2Pl0OJ5RzFDeWELm8j6Dlqk7E1e0AaBeU3YbxxoHek7He2I9pszpJ3/C/gRhB93dt0VFOWxv/Ne6tfpubQbIeNWTH8aiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+1LO3SsvLV3dl+8y0DscovSx1BrFvLkdH8sfZGVOhs=;
 b=xh7furVwdMBcktP6Eih2gwPIO4h7wKfAqiM8J2DA6uO37PeW4B28gu0PI2Sgb0hYzTbe1rtcWmfMNM6xFdxO0EKcM7kRj0sG24u2KAMnpRBla1RKmOTqBsBFNi81oKhu298OLJUyYygJN7WDtGrYwX+loLuaWsfhkA2kDWNXrjnAI9DDResAbXWS7dGugsALvWLWazMjgE51klgJI/SwsSg99/ABIspi77/c0Ob4FdVIt4h8USzJyblP63YiXvaV9CcG3RH63bqF6mLqnUXqD4jwyQJX99moB0FuD/PxJQHtci5sgIvAQqSj6TkcovFcgvWe03xHcMdT12G6J4RANQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by GV2PR03MB8560.eurprd03.prod.outlook.com (2603:10a6:150:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Tue, 6 Sep
 2022 16:33:08 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 16:33:07 +0000
Subject: Re: [PATCH v5 4/8] phy: fsl: Add Lynx 10G SerDes driver
To: kernel test robot <lkp@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-phy@lists.infradead.org
References: <20220902213721.946138-5-sean.anderson@seco.com>
 <202209032301.fWPibuKq-lkp@intel.com>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <826afda9-9ad4-ccf1-1568-d3a43948a7be@seco.com>
Date: Tue, 6 Sep 2022 12:33:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <202209032301.fWPibuKq-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:91::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db802a2a-bd1b-4334-0955-08da90257adf
X-MS-TrafficTypeDiagnostic: GV2PR03MB8560:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uhvBvo7614Ckv0b3H0XxHVoRAZafnZ9CWVhOVr69xmD+S9y6WKGMKb9CfqbPLezWh8k956qQOPx5XhjAx6+Fn64IVjTMdGmGPQie0TCt3NHcMoK7VGgWKJfkxe8fK47BMc0yQsaC0+g3knHCNyaoK9I9djcBb+F//TPyfDTvVlJ8RqNAGN0A4wcIxaM1nxTCe6fHnUotYaK6Ch6ocjz6Tj0Nt4q6s2+aIvQj46vYZIgWcB14Hpb4ONGrRWIOzM5Dj53iMnMS4m9u5o94ZqeZpnf7bzabSWwWBI1ypBdKKTtgL+lTICsp+vfnPkS1Odqc4jhScvfh980110KgA4FZcX2JAW+jUrZiJ7cZlDHTERcDL8AHeqTcfm1wDKoaE8B/obC3hPDGX+7PSZVW1LkyPQuiSKjobgnr3PlmUa0zfpHkHKaRzObFO56cisu9ppYSh8omN+UPKyflj9v7T4kynzvcYfoIUkmEzR0BUb2Z7DLmd1bFP2dXEtokR082ZKqFPLaFNxycRSvnmBcHBBJQJcM7p2OPJmRCxHm1GjPnO4B5oCJvoXKM/TQgoTywAmjibYCozFoMVyWyVWhWTzuSoWP1SzkNfygEudb6nmimPQFTogL6BQSMgz8PjFPJQkJW3RhRMfierkUfYuNF48AlVnJvPusdvBUTEnSMo/yTU/6uDyi+yUJlVnVLEpMJ9XC2HKV4XNaMghSrrZAU62Ktveucf9p20D2dUhqWihr8VYDtoh8F1KQLqk/gHFj4D6xzEbCjlZeWkUZiH4i+uOngnb82iZtP5e7KZvvZquTulfZF5k0nOBWn2a2TXDdzXmcDb1qhi9PBa+fuSvgf8ANeIjTrraV1i6/iAmNlFYtvXdY1Pkgmm+FzUEWZyBvSfIbKnzaClyiZTUtAiaoXbzs8Mg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39850400004)(376002)(136003)(346002)(83380400001)(36756003)(38100700002)(38350700002)(66476007)(8676002)(4326008)(66946007)(66556008)(110136005)(2906002)(86362001)(54906003)(8936002)(316002)(31696002)(7416002)(6666004)(5660300002)(52116002)(26005)(53546011)(6512007)(6506007)(186003)(478600001)(41300700001)(6486002)(966005)(44832011)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZitvMnJkeXkrK1hDeGpPYWE3ODhMOUJtZ3ZQN1lQT2hQaUgrY2R2dTNyemRu?=
 =?utf-8?B?ZS9NcjNMcTNuMnh6b2RnZXl4TkFFcXR1Y2FNVU9OWjlwOEpSZ3dDcFpDcDJi?=
 =?utf-8?B?L2JSN2I5cFFlNEhnUjZGaHpOU1lvQzBGbzhwY3A1bUVQU0xuQ3pVb2Zyd3pP?=
 =?utf-8?B?UjE3RlczWjBkakJqL3oyb1VDakZrWnFtNHgwaGlVZFFrKzVDVThaeTgrV1VK?=
 =?utf-8?B?eFZZc2pweThQZzkyV3J2emJXNUtLZVByamZIZHZoVGxwTTRtSFNDaTJSOEVS?=
 =?utf-8?B?YWpORmFBalBoZk5TeDMrMDgvVDc2Z3VyQVZqanB0Ym9XaHgrV3RQNlFaWUpu?=
 =?utf-8?B?WlNlemFLTFluc0x0YnhRWVFSWWlPaDlHUEwvZWN2cTNQSi9Ud0RXUkFsUmtj?=
 =?utf-8?B?K0o4ZEN0V1F6a0xLYTBuVkp2ejUrK1dDbmZEbG9zN2FsdTc0ZlR1eVNLblNq?=
 =?utf-8?B?ODl5YS9GTk01bFFackR2M0VZN0RLSFU5KzM1OENXS0ExVDl2Mytnc2lnNlVq?=
 =?utf-8?B?TTVUc3l1TitOYkwwc1N6TStCak1zYkRnZGQvYzNmaTJUQkpQbmZTejltYk5Q?=
 =?utf-8?B?d2c0ZDN0L2NGSlQyeTB4OFhGZUppRmJUeWRRK2ZJME5OVmJ0ZHR1VERhZVkz?=
 =?utf-8?B?TGxPcE4xWURtMk9yb0NKejc5VjVqRjlpZHRPZzcyVnBWRllyMnRMSUpHVWp4?=
 =?utf-8?B?UCswU0h5Z3lJUm5uUzIzZjNMdXFGbDZ1VTJZekJiVGNIUm05WG0wOWlCMllT?=
 =?utf-8?B?ZUZ2V0VDTGtvZTZ3Q3hCSU9MNFRzRm96MmFFUTFuaW8vT2IwMHRLOVlaNGcy?=
 =?utf-8?B?NmF5SnQ2WTZYdW90cGE1RmloMW82SlNzZEcyVSt6RVFQWmVyZFVyajdQUTNq?=
 =?utf-8?B?TEgrdGZ0RjFtWllXMUFvY3RVRjN0VjFFcnA5S3pRcmMxZDdRV2VwYVpWM0pt?=
 =?utf-8?B?UTdBZDNoZlh3TDk5VFBwYmhGdk1tQ21RMC9UaGJDOE9TZzJaNHdidlJFaGxP?=
 =?utf-8?B?VUliT21pSzl5OXo1ekxjaHMyN2l6Z1BlZzF3eWw4dUIxbGRVWGpybUYrZlFW?=
 =?utf-8?B?d0Y0YUNnLzh6aGg5akIyTC9xd0tBbmlNWGs2RjMwR0ltRUJKYzV2Z09LYWpD?=
 =?utf-8?B?VkZ1VkVGVFZvQjNaSVNKcFA4QWhmYlFuMTNsK1BzQU8vZGVOaVI0a1htcmlU?=
 =?utf-8?B?U2tEWUdzaXFpcVZHbDBwQU5VdVJMeXpEclhzSzQzUWhWNlhKNnRsUHFNZTl2?=
 =?utf-8?B?cGJNb1FCUWwzdEZkWXBXdHFLTXVEdGgwb0RzTFpqbmNNTUdkQzhubDEvbzRL?=
 =?utf-8?B?di9TWSs5eUpnalRtOVptWVZDMWZuS2VlZmFjUUZ1V1ZpUmJMbnhXYkozUkl4?=
 =?utf-8?B?eVFkaDJrUFNzWlNoc0UzVTBYZHAxSnNHei9TVks5YktNY0Rsb3pFV3UwVGtP?=
 =?utf-8?B?Ri9ERk4wVEZTckRvdnF0QlJQOXBoUXVjbGxFbTNsQy9oU09rVDBTZ3ZJWDBw?=
 =?utf-8?B?YUVnbEYya2xwWmJwbnZyTTNNUlI2TUh6ZnE1emtqRm1pajNKMXdJeW5HMXky?=
 =?utf-8?B?Z0gzSEMycHlQRTV1TDZIMGFQV1pvRTY1Y1o1RWl1SkQvblo3WGNVdFAxeGJy?=
 =?utf-8?B?WlVqaFIvQTRiMTJ1THFQTTVCQjFVZzBFWFE5VC9GanZnZUJZWCtkV0FoRW1w?=
 =?utf-8?B?YzRNVTBqcjFHZ0lCTFdHUkxDTlFWL3pVcDNqRkFlMkxUT25zK001UkZ6aUtK?=
 =?utf-8?B?L0pQa3pZTUlHQmR0T2hjZHNmVjArN0JncmhRVUdxZW9aVTRxMlZUd3JYaUZQ?=
 =?utf-8?B?Rnc1MnIvTHVSZzdUMkZFdWx1UmJ2MjA4QmpyYVhkUzRqTVNmZEsyTzdmRnlv?=
 =?utf-8?B?ZHJNSE9KT2d1VDlVLzAvVkc1clZoMkk4alJ6NWpGSHA1L3NLQUc5Qm81enJm?=
 =?utf-8?B?ak81ck1BMVRLNk9xRy85bGtvSkZsQWJHS2UveUYycm9lZUQzMWNJRGJVTHd1?=
 =?utf-8?B?VDM4elV3Y3haUDRiWmovbHVWTm9LWkg0cHdJNzVpRzk5djRjZEd4QnZHc1JM?=
 =?utf-8?B?U1RCSmZ0a1g1MTBkYUtRaHp4UGh1NVlGOXhGbGJJS2NEemRZMXdXa3dXMXFw?=
 =?utf-8?B?RldVTkNmQ1dKeDBiRGFua1RpZU9qQ29uME5mVG15UU9abzVYR2V2VW5xcGdN?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db802a2a-bd1b-4334-0955-08da90257adf
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 16:33:07.7535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xz3FG07/zRfnMpUVlW+Ib99WDzAhnwPy1oLeQiYfAfxou+mO7WsuC/3o7LifMi6bAIZPXSK6jDalPaPRxJ1Byw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8560
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/3/22 11:23 AM, kernel test robot wrote:
> Hi Sean,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on shawnguo/for-next]
> [also build test ERROR on robh/for-next clk/clk-next arm/for-next arm64/for-next/core rockchip/for-next soc/for-next linus/master v6.0-rc3]
> [cannot apply to xilinx-xlnx/master next-20220901]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/phy-Add-support-for-Lynx-10G-SerDes/20220903-053840
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
> config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220903/202209032301.fWPibuKq-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/cbfe9294ef583cc8dffd9cebf9ff325bbcdb4cef
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Sean-Anderson/phy-Add-support-for-Lynx-10G-SerDes/20220903-053840
>         git checkout cbfe9294ef583cc8dffd9cebf9ff325bbcdb4cef
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/phy/freescale/phy-fsl-lynx-10g-clk.c: In function 'lynx_pll_recalc_rate':
>>> drivers/phy/freescale/phy-fsl-lynx-10g-clk.c:255:25: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
>      255 |         u32 frate_sel = FIELD_GET(PLLaCR0_FRATE_SEL, cr0);
>          |                         ^~~~~~~~~
>    drivers/phy/freescale/phy-fsl-lynx-10g-clk.c: In function 'lynx_pll_set_rate':
>>> drivers/phy/freescale/phy-fsl-lynx-10g-clk.c:340:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
>      340 |         cr0 |= FIELD_PREP(PLLaCR0_RFCLK_SEL, rfclk_sel);
>          |                ^~~~~~~~~~
>    drivers/phy/freescale/phy-fsl-lynx-10g-clk.c: In function 'lynx_clk_init':
>>> drivers/phy/freescale/phy-fsl-lynx-10g-clk.c:466:9: error: implicit declaration of function 'kfree'; did you mean 'vfree'? [-Werror=implicit-function-declaration]
>      466 |         kfree(ref_name);
>          |         ^~~~~
>          |         vfree
>    cc1: some warnings being treated as errors

It looks like bitfield.h and slab.h are included transitively on
arm64 but not on other arches. I will update this file to include
these headers.

--Sean
