Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 609EE8FC2C9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 06:43:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0G0o//Gd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvFG23FN3z3d2N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 14:43:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0G0o//Gd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2417::601; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=gautham.shenoy@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvDyN1Jg9z30W9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 14:29:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUSesPNpWuyLTwtXZCqzkSjqzDRZ/SVR/0V/C31z01relle05+Vb+08NPPgXADBmMKz3KHKisVrcwHjAYK/uZ9mCuN5GNeRxNRR29c4PGPl19H6TrtJ/db4MQBibvL1xFzSAiLlKuakTeocIQXlbgODyy9CpGhfz58sIGaoEqEbkOOiS7ONwcpMSIDvSd4Qk18xMUmNRVne1HwGZJKPSreY8t4w5L3HfDDxYuY05hnOCHjxbIdCd3FUuCZHT+l4tRzoYazbppvTW/jDOi+dhU9itiJyHp1QYQjApZpRxNog0D5O2Dz7lY4dhxDFGW1SoOg9Npgra/ZarQqWa/AYk1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxgcLqg7K6tYbiI1YLFLI8WZj2voyoRV28JFaVuKhvc=;
 b=VpV4m2TPfXtsaRmotkM+ZMvc5b/65DhwWPpE/azv2ccweNK3ZV1TuXyUCncbyGcwJ5wdnQqgDOrc8by0lVAdD2+7bTTr1mhCid66rW5y1K6VGzXGvRirMFLlkvTOd+lhltAdgk/ijQNLQsJtu6Xbi5+JyKIWtafIkNBz+9Q1ipAJwR6KMvXXYPhavjmDMSlVds6BC7z50j1nhRm4UZOo2gxv7vZ+3ooQz9ImxFopPgxhmm4+Av+JeveJK2QjnFlE3jodEjRo4rm/UaUIyhAkLsoF9tVEB/EGzLEUbhGHLrQKUrcMj4rzRd18jN9p4d3clrW3ekEsSEh7XReCt9AubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxgcLqg7K6tYbiI1YLFLI8WZj2voyoRV28JFaVuKhvc=;
 b=0G0o//Gdp9QnQxsEoSJzHZdh7c6wgKJvjqNALcHtN41Ybz0y84N95k85SzbmhhHd2HEI/waBbMs0MFbkmWKT1MLNfD4dYxdsHBAuCUV16+blX8MPmO9F/gSS0EIGfPZodyR4H4aifGrGJ/FW71cUoA9LGo74dXqBuFuP6DUYLLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB8252.namprd12.prod.outlook.com (2603:10b6:8:ee::7) by
 CH3PR12MB9430.namprd12.prod.outlook.com (2603:10b6:610:1cd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 04:29:23 +0000
Received: from DS7PR12MB8252.namprd12.prod.outlook.com
 ([fe80::2d0c:4206:cb3c:96b7]) by DS7PR12MB8252.namprd12.prod.outlook.com
 ([fe80::2d0c:4206:cb3c:96b7%5]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 04:29:23 +0000
Date: Wed, 5 Jun 2024 09:58:21 +0530
From: "Gautham R. Shenoy" <gautham.shenoy@amd.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
Message-ID: <Zl/pZXNss8vQfEh+@BLR-5CG11610CF.amd.com>
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
X-ClientProxiedBy: PN2PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::9) To DS7PR12MB8252.namprd12.prod.outlook.com
 (2603:10b6:8:ee::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB8252:EE_|CH3PR12MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d71100c-5903-4196-bc10-08dc85181329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|7416005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?TR0jt3DjeeeFlYLQoRK2wd4FGN/qTr3M/0NhgRSmV5FTXAZ/ChFE6dOz2WlR?=
 =?us-ascii?Q?RMMO0TSe0y8fX1FvMswwuB+Cw60xsR/r2B6JGTzFTYMaOAlt5qr0Kw4dqx18?=
 =?us-ascii?Q?B3M3dPGzwmuEkZ2i/PORnH1Cjs2NmVTdzgoFgVFqKQflM1JAQCxAA9I/qzC0?=
 =?us-ascii?Q?VI8dDTCeGJmS+hax3H3F4akhZOMB0f+5BkkSgjxqXHBMWkPR9eri5q9IBOvx?=
 =?us-ascii?Q?Z3M1sWhtFry/KKRr0Pvjhskfk+NoT0YCbToQSLouR0cdVTAH5r3/GKup/o2u?=
 =?us-ascii?Q?cwJFq49a0/YJPWMoEAUI/L2xszblWBYyt0K5elmhE+lH1jLNEw6hIzcLmv3A?=
 =?us-ascii?Q?DztytQo5qICQJZGeuA233IM9ydL4Qpvs80AIrFwCzqNewrZhIYgkkJ3GnsOl?=
 =?us-ascii?Q?Zc0AJmn8U8Aw33tTmX5arFSnJN9oQp490Uf3s9anqeuoghN6buuBp/5xvQMN?=
 =?us-ascii?Q?/RzcO35GTG7kUsBIGFh2Ex1O19OaMEXr1O6mJO0lmc8b+tXLRsF5zW8Q/gqQ?=
 =?us-ascii?Q?akFY40YyeLmyAwo+bkXA6sPanw8a9PvWG/zFDP38yiQeOdRebEkB+jBZce/j?=
 =?us-ascii?Q?BfX5CIn90PerZLVEFS4yIbqmUY+/js7wShwpwgfcIkEzmTZF0bAzefevYNoi?=
 =?us-ascii?Q?8y+KJtQf6D7CC+pX10F6SFuYecSVWcScT7hX0fbfJJ6wVFcrRmz0i5jhq5GB?=
 =?us-ascii?Q?2X/FNw6jSOk8mwF3KPNnIgYOoTkwEEdQRJ11/hDkLnC1JJ8OLTtamMVGb0EE?=
 =?us-ascii?Q?cbfYvjgvKdh3w0m5poiM8jzzPgwfE0M1+/gdkppes1u3JSSODPXT0+AhKrD3?=
 =?us-ascii?Q?EEdzHGvifIuMCazilW7+/+/7EdmfCTxuhalrwTTbBsDhtcR1jowTiVnAqvfY?=
 =?us-ascii?Q?LzuZG5kqPuKS73GxjsdktcxxEVZQKsyKHLJQpSmQm3w7SXVRb/ZBgkVVz66s?=
 =?us-ascii?Q?OgdHAIdmWaQx5Q63Zed5XcNHLbs3mrE5jKn4/fmEV9zKgn8/bZ++UYVPCJNG?=
 =?us-ascii?Q?zmmd/DPwjRPYCMvLEbRnIOXmN8z78SRpaLmGzgrjIiMZkQ3IP8UO+8amN6qH?=
 =?us-ascii?Q?eF/55RKpY92DJATflwhDgATB1W+WKQKBuwf/blgiDMBzigIhxVRyE1+s3L+A?=
 =?us-ascii?Q?wdRvspgSjX4RAgj12RcvlubO+A70SF9bl2NGtpiNgMs/9Oq/UYXheWS1lSoi?=
 =?us-ascii?Q?atWMI67YH/k29faGl1/3Knvf6FotIQV2H2s8rg8h0XcxexD+ijz3AEurgXfB?=
 =?us-ascii?Q?epr1lSlgUoFVFZIVqym7GXtC4IPyfz9pV/R7KriAUwk6wNLM8vEsCYV/5zlm?=
 =?us-ascii?Q?dIFCftoggNuzpEQyyuv66T8Y?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GoEdR4M+NZV+gKBBU5jniAj8lrECAZQQk3XbFhYOIwRnrIO+C48lXqYmxP9C?=
 =?us-ascii?Q?ABtJTJKrksvKKp6yNN7qFBOUY/JMS0LE04sI6aPhOWnCHQZlnXHGzwxOyT0P?=
 =?us-ascii?Q?CPbdaa01A8jfqaijmYok1y+TqtaczhSq6kN54tvmHkaS/J106nTP1hDsGzjC?=
 =?us-ascii?Q?/HKFK4vtvNvM55/0uBFf8C64xGRLLTgHHSxpCRUi2l8V4/x5yA2m+oR7fg9g?=
 =?us-ascii?Q?vk8i6cHhYIZl/r8BmLiaWsv1/Xlk4K3eXtg+qbqohsgxnqxsI7FD3DBsABW3?=
 =?us-ascii?Q?yWtS9XOWnFjb6U8VGOTMPoWIhkPnbS5BWx4Dmygal+rw0vdKBeIU9xp4HFTE?=
 =?us-ascii?Q?M1xNNMx3YSvTEGB/PlMmBtQHw6ohmjrfiQC6+hfbw49ny4ND+lCfDG+S6PFg?=
 =?us-ascii?Q?VkFlkvwMTpUc6LIcFCndyw8b2LVdtval2XZ9M6JAn/eH4nHQ0vfXkbGt5ZAX?=
 =?us-ascii?Q?LXo+J/wdsAZ93jy12SZ48fv9gIAcjnu5a7HNskesrUFCX7dYxtZ/ZiPIjsoT?=
 =?us-ascii?Q?1UBuk6emMfPDh6N99+IKpPeTUNOplNtO/0ua78EyuQefuDRwKwvc5R6hItzz?=
 =?us-ascii?Q?bDpthfat7YjslVru9QKw+T8AcFibvwQDF2n8r10KADE6xuGFWgJozb5/Brsq?=
 =?us-ascii?Q?yfDUNaJg9puRhk3USkMXA97/MmsQJbUMuX2kyihsEenzWI9RKzH8glPGu8Q9?=
 =?us-ascii?Q?Z6BJt7+CqZ88qxLx/w21QrHyergJGC49N/+gt0ggTcQBg+0HESWBdXK0N4om?=
 =?us-ascii?Q?kJ5qP2+iCsDkYVPOuLPRs/wXEy+5POFQs/wNn7Z4M8TIcvlHM+KDalPM8z+J?=
 =?us-ascii?Q?hf1STfPPbV5GUTOo8wm7TjUdUfEM8k1CQ66ueIFNW0X73NG0AjvMAPe8AF9Z?=
 =?us-ascii?Q?BD6EroIlOma+zBp741WtpUnw14lf8Sg63mfwIG8mBabAW4PGRLHSB/Gy2xkp?=
 =?us-ascii?Q?CMmXirRjt3g0Qz0XVwj6pvVjn3I/Nzq3MaCaRmrAZ6noneNXMMXjtGug08de?=
 =?us-ascii?Q?lT2XHdgyD7ZSuby/Taie6RLRQP1oWErvwxZIftsLrejZuc28mVBijETAhxXW?=
 =?us-ascii?Q?MDX3EPL3wVbEgGeeCjuenD1eUlqSnvpKTdaQaRT3xtUpJuiZ5BEGw96toTPT?=
 =?us-ascii?Q?XPNue4VPzxqTxOfQSgVKCgE/OasJblcEgfZJqGBaPMYqZbGaK+0C20EEl4FM?=
 =?us-ascii?Q?L3OLf951ueg1DSuh0oSvpYIy3GQk7cB74NZoR5D/UzoETTeu/H5TxVlzLGSe?=
 =?us-ascii?Q?JAFs8QJIJIZIPhvJPxyrcUiiyhqkBgl4Jd1KExuYHG+hXbV71/Ed3qeISyyw?=
 =?us-ascii?Q?WphVOY8CNz/ZJOr3teXBeN2vF3j/e8PoRLwJPeZAYUDsi0fnk2jzW5CFRJDa?=
 =?us-ascii?Q?MpYvvJGgly7jDmrlewBYgikmX/1NJYPs1dwit9yYP0qPdOkyRtssX6fV1DDQ?=
 =?us-ascii?Q?pfZEH9Z5qZuaYTuEjkReM+t8okSJ4JPh7iLiMQ/dMA+nMTjHJAaKv7bQQCZp?=
 =?us-ascii?Q?4xwIyBNdZrVLoXWlY4/mISFkNd64rTH0NN2fIZ6ZlTsMzZEjGaqjdvbjd6ms?=
 =?us-ascii?Q?jT8Q5Nfg/U2HzGQfaZnH6/JVvNz+UdEnsDcQx4YI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d71100c-5903-4196-bc10-08dc85181329
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 04:29:22.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1dxbax+ztSvrRDMCEYhc4X8/u/IH6yJ+Lu/KrmdUjAtcefr09pt0ngCNQOZd3mreFJef3FdCvf/gZpFaihJhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9430
X-Mailman-Approved-At: Wed, 05 Jun 2024 14:42:46 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Andrew Lunn <andrew@lunn.ch>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>, Ben Segall <bsegall@google.com>, Perry Yuan <perry.yuan@amd.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Pavel Machek <pavel@ucw.cz>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Abel Wu <wuyun.abel@bytedance.com>, linux-omap@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, Tvrtko Ursulin <tursulin@ursulin.net>, linux-acpi@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>, Mel Gorman <mgorman@suse.de>, linux-sunxi@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org, Potnuri Bharat Teja <bharat@chelsio.com>, James Morris <jmorris@namei.org>, linux-sound@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, platform-driver-x86@vger.kernel.org, Zhihao Cheng <chengzhihao1@huawei.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Niklas Cassel <cassel@kernel.org>, Scott Branden <sbranden@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Elad Nachman <enachman@marvell.com>, Linus Torvalds <torvalds@linux-foundation.org>, Lukasz Luba <lukasz.luba@arm.com>, linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org, Zefan Li <lizefan.x@bytedance.com>, nouveau@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, Mimi Zohar <zohar@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Hu Ziji <huziji@marvell.com>, Eric Dumazet <edumazet@google.com>, keyrings@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, linux-i2c@vger.kernel.org, Gregory Greenman <gregory.greenman@intel.com>, Ingo Molnar <mingo@kernel.org>, linux-security-module@vger.kernel.org, Valentin Schneider <vschneid@redhat.com>, Corey Minyard <minyard@acm.org>, Gregory Clement <gregory.clement@bootlin.com>, Lee Jones <lee@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rrichter@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Brian Foster <bfoster@redhat.com>, Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, Jason Baron <jbaron@akamai.com>, linux-rpi-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, cgroups@vger.kernel.org, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Roberto Sassu <roberto.sassu@huawei.com>, linux-integrity@vger.kernel.org, Daniel Bristot de Oliveira <bristot@redhat.com>, Len Brown <lenb@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Miri Korenblit <miriam.rachel.korenblit@intel.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Ulf Hansson <ulf.hansson@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-pci@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, alsa-devel@alsa-project.org, Nuno Sa <nuno.sa@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, linux-phy@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-staging@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, Nikita Kravets <teackot@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Chen-Yu Tsai <wens@csie.org>, Abdel Alkuor <abdelalkuor@geotab.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>, Lyude Paul <lyude@redhat.com>, Kees Cook <keescook@chromium.org>, Ray Jui <rjui@broadcom.com>, intel-gfx@lists.freedesktop.org, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, Johannes Berg <johannes.berg@intel.com>, Paul Moore <paul@paul-moore.com>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Stanley Chang <stanley_chang@realtek.com>, Daniel Vetter <daniel@ffwll.ch>, openipmi-developer@lists.sourceforge.net, linux-hwmon@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>, linux-mm@kvack.org, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-mmc@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Daniel Scally <djrscally@gmail.com>, JC Kuo <jckuo@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, Mario Limonciello <mario.limonciello@amd.com>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Vignesh Raghavendra <vigneshr@ti.com>, Eric Biggers <ebiggers@google.com>, Tony Lindgren <tony@atomide.com>, Takashi Iwai <tiwai@suse.com>, David Howells <dhowells@redhat.com>, linux-ide@vger.kernel.org, Huang Rui <ray.huang@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, David Airlie <airlied@gmail.com>, Jim Cromie <jim.cromie@gmail.com>, linux-leds@vger.kernel.org, Eric Snowberg <eric.snowberg@oracle.com>, Herbert Xu <herbert@gondor.apana.org.au>, Florian Fainelli <florian.fainelli@broadcom.com>, Richard Weinberger <richard@nod.at>, x86@kernel.org, qat-linux@intel.com, linux-bcachefs@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Kalle Valo <kvalo@kernel.org>, apparmor@lists.ubuntu.com, Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Benjamin Berg <benjamin.berg@intel.com>, linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, John Johansen <john.johansen@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, netdev@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, Kent Overstreet <kent.overstreet@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>, Vinod Koul <vkoul@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Daniel Bristot de Oliveira <bristot@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 02, 2024 at 06:57:12PM +0300, Andy Shevchenko wrote:
> Make two APIs look similar. Hence convert match_string() to be
> a 2-argument macro. In order to avoid unneeded churn, convert
> all users as well. There is no functional change intended.


> diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
> index 1b7e82a0ad2e..b6f52f44625f 100644
> --- a/drivers/cpufreq/amd-pstate.c
> +++ b/drivers/cpufreq/amd-pstate.c
> @@ -1117,9 +1117,9 @@ static ssize_t store_energy_performance_preference(
>  	if (ret != 1)
>  		return -EINVAL;
>  
> -	ret = match_string(energy_perf_strings, -1, str_preference);
> +	ret = __match_string(energy_perf_strings, -1, str_preference);
>  	if (ret < 0)
> -		return -EINVAL;
> +		return ret;
>  
>  	mutex_lock(&amd_pstate_limits_lock);
>  	ret = amd_pstate_set_energy_pref_index(cpudata, ret);


For drivers/cpufreq/amd-pstate.c

Acked-by: Gautham R. Shenoy <gautham.shenoy@amd.com>

--
Thanks and Regards
gautham.
