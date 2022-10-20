Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B786064A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 17:33:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtWpj2Gxcz3ds2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 02:33:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=DxIC4V1z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.22.58; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=DxIC4V1z;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtWnk5w5Kz3c5v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 02:32:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfv6eGFVaJ1py2DbHZKt5L97xTqPsZWp2ZpuUhVUNdpYGGFHZgcfu5xQdxN6nabu/Azzr8Sj63FVe9RcZXA7Lm0r6HOo6c7M59s8U4LWW9RoA144siyTrNdMqPQCpBjyI57rJHgm03JCLB9Old46nKETJlPN1suJ7VTTuXdKdLFfUfDY569CX9IcY6xf/plh5vCE6V2aA6E4ZTzACLET4FY1T3XY3KFdksLnynh7khMcLE5ors908Xv2EWLbL8xasxmyyeX/8OBB+X7rmf9SCSwftNUbGiXL0kBhnU91DJZvNEz4DxukUXrEk1a2Mq+UiLyl6hM1AWcOB7joIKKYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+BTwRJWckk7ikaIiXlUZkorDkr06XrlGz+AFCZLdIs=;
 b=P1n3sziy0b3eS2Vq46JX0NuaUg8Wwfb6UkecdhNZFIQKD1Be2sweM8Nq0oULg55x0JdSVudYe9cbBPXhmtCA3xISfskKm7Hs6qTP+Lj3jijezUlMi1gdqpd/o5iqsjqIfKJz3/OTiykajBvvNdaRUcWtBRM7J4zPgVRZBho9AgoB185tuPvi6lWpdM5/2bshDl1h7eCn+48lSWvPgXRHUGF+8fSJAp1mE7BzCHNQjLx63a7D+G/ek7YNU0eJ1Jo5U3wDOcX+IhCwSlFkRQMm1cp4Xtf9EDt3hCitsBujD/8aC/jed36GUelNCTwTc0CPx2ZD9hTQ6zX4EWdS0Pj74A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+BTwRJWckk7ikaIiXlUZkorDkr06XrlGz+AFCZLdIs=;
 b=DxIC4V1z0GsYZxan290sgx74wjLBSihd6Oy8kssRKyaqcQg9hMneQRNCfOqhpRz5OBwYrGLvk2H50SHpLw+jBLiZA/9S5GwY+UW05Yuaiejf6l0qHf18EYmSri9dpkEUhRTz4uTli5x5uNyZk3XoFNg4XdRMkygeWnlAyLdEYjORiwLrvjnZp1In5bfaOAEmQLyreBt6+MP6VLJUsannXBRc5/+Je+zJ6j01pEBXg8LFCl87klEOjtMukIrhgjwCrAtcxj3sEya+ioGeXVROe9bEXzQNRYEc6Pod9Jalg+06NxhoxhVVeWKUxunB/R0hGT7Dgm4oghITz89ofK73BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DB4PR03MB9601.eurprd03.prod.outlook.com (2603:10a6:10:3f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 20 Oct
 2022 15:32:36 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 15:32:36 +0000
Subject: Re: [PATCH v7 0/8] phy: Add support for Lynx 10G SerDes
To: Bagas Sanjaya <bagasdotme@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-phy@lists.infradead.org
References: <20221018231112.2142074-1-sean.anderson@seco.com>
 <12c8c3c1-eb17-8e44-8906-05e2e3e92acc@gmail.com>
From: Sean Anderson <sean.anderson@seco.com>
Message-ID: <f6d42cd0-1a2a-16c3-ba08-d2258b225b29@seco.com>
Date: Thu, 20 Oct 2022 11:32:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <12c8c3c1-eb17-8e44-8906-05e2e3e92acc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:208:32d::17) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DB4PR03MB9601:EE_
X-MS-Office365-Filtering-Correlation-Id: 36803702-6bfc-4281-5803-08dab2b05035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IV482d5M4Waio6+8utUjLXHRT1gkTt+cCQIjVTmiDSuGWYJ2V524icNjxwnb6rIlpO9DBfCXztvdjfh7vUWAJfVblGBYfz8HEoRTRrrCNztWObHK4yWcKPqjEj/xvpcgl/6foXI7i4FOZuWh0g6qe3g74IQPM6jSX9roZoZtzhDea+IXwQ5U8EADGTIqrBwPnpdFFljOaxn6s+Y6ejJfvI0JjAni2kTy+iOXP5IrzBlyrI07vspkMGjGocFzwJ3Fpz9t5NbAPCStrHVt1vcV9aA+RqnbQhr4TO1V+iHxLu90TULGcoBSYBLNSchjaHOfF9UJxw51EYGKAH4DsO3bHPa0n/2sl3/xqhK29BldMlqscXDnlRPce1lH3dc7AFziu8twTSdxpG5LlfRWJAV2HxV7q30ak5p632iGUa0So13mf+PA3xZ/t7VaUzVxbDZbEMXkSW0eNF19yJB6Dd/42XPy6/ETyw9AW5k0I94GK6jS7Inbzu3pZtgXViQ/yQXMgt0FFs0XeSeXSYDRI7LBCh/yMf3E453ta8V2irhW0Ruq3PhWO++fmqIXzCh47u50yGcCgYus7rZTobfTD8hwZz5p10fWdDM6nNLxQXji0SROkoI5rQtvtcwDeDq9PaB/pbuROmNz04Tpy7UEIOFHeVFND/B6Z2C4rz7BkLLFVMdBUSLga/gwkBlHbRnn39guTO/QVXMebExX4i8XmNbHWT9bbMckNFj7U4Dhta+yxwYVI0Ks58T53nq9/02POa6/qsyFyNFkCygdpoX7Lxlg3ucVIeF+wKE2eazNt2XtDt7emq0jMc7LVspHx6L04pJyPluQstxJLr5nfgBkWl8qpGC+qwd1wFETjgeztObsgE0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39840400004)(396003)(376002)(136003)(346002)(366004)(451199015)(66946007)(66556008)(66476007)(5660300002)(54906003)(110136005)(4326008)(316002)(2906002)(7416002)(6506007)(8676002)(6666004)(38350700002)(38100700002)(8936002)(53546011)(186003)(2616005)(26005)(41300700001)(6486002)(52116002)(6512007)(966005)(86362001)(83380400001)(31696002)(478600001)(44832011)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SjJ2dHhZdDVWbm1wUFJaMUh0V0JOUkpnblN4MmlGR240TDEyNldkNHFDaC9N?=
 =?utf-8?B?bVFOQ3RkWC91ODdFSU5kVVp6bktrck5qTStTaDRRWkhIRHFZOVF6amFjdlU3?=
 =?utf-8?B?QmVLUUxEQ2FMWGlXYVROajUwRmRoZDFzRXBlV2xKL1pvOEl1QUxmdy9QUXZQ?=
 =?utf-8?B?VmhlRGsrOENLL3RlaHhVdFVvaXpqbVQ1N2UwRWM1QXFwTnlCdm9Mb3BkZnlU?=
 =?utf-8?B?ZktrODRrUndmTVRHVk1DTkRqa1ZleUNJSVRRYTZ1eEZ6Q3NUNGRNN3ZVVVkr?=
 =?utf-8?B?ZzZHRjZ4MlBvNFVYbTF1MDZIWUorQlVubkx6QmFNa3RjazhhMzVCNUs0aENL?=
 =?utf-8?B?SDJrZEdNWXRnTWt0TUJ4Q3d1TkxYNkt2eWxDOE9iSWtqZEo1ellWYWV6QjVa?=
 =?utf-8?B?V1pDK0N0VVlXbWMvTTg3Yk5nb0RibFJFZDlWWG1uK2d4WVo2ZWRTbXBhbDh6?=
 =?utf-8?B?cjhxNjVabHhDZ0xwVStXQ1pQMVlSWFFGUVZuTWNVWWpnVGw0WGM1ZnBUaHdD?=
 =?utf-8?B?cjR1NE4reFhGU1NwR3o3MC91QUVVeWo1RUNYelhoU1Njc1Z4WEoxQWZnUm1G?=
 =?utf-8?B?NmVTOEVad3VrcVk1ZjF6N3NhV0tLb1N2dDVCSnZ6cjI2S2RsNnJlV1BSbjRw?=
 =?utf-8?B?cjRIc2I2ME9jTzFqelhnVlBGUjB0UTd3UG95Y0o5QnVCQ0hIcnpRLzdwNDJz?=
 =?utf-8?B?bm9BeWlNc2dYZWdOelBlN1RvczZKMXNuc3pmancvaEw3TEFNN2YyUXBHT2dF?=
 =?utf-8?B?ZTlWQlRob2o5Z3UzSWJiQlpuN3hBb01teXBUaDhpaE5CSzR4QWl5ejdHY2ZG?=
 =?utf-8?B?UG1CUDdIMlZsRmhCczBzTkszLzZpdUpZUmpIRzB4UEE2bmdwV0FLa1VmSHow?=
 =?utf-8?B?dytHMGVDUjZJenMwUlUrUkxEb3A3N1VqZVNET0NBMlNoUktkY1VDR0tsL2xK?=
 =?utf-8?B?ZFpIb1NsTDNIci9ENE1BdC91eDlEK0lsUHhqSGJDanptamc1dWJiYjVhbE5m?=
 =?utf-8?B?cGFXZjhXV0tLMFNPRStTK25GMFd1UVZ6NVRrczRacUlhNUtjeStZc0F1S1Ft?=
 =?utf-8?B?ZXhpZTJ2R2FJdVZZNHo2QWhULzhhZ2QrUENzcGRxbjlzYzFZSHFwdGxsNTUx?=
 =?utf-8?B?ZmlqUGdIZ1BWMjZlVVZDYzFIMWlqQUFCYXpRbHQ1T2FmWHJydFB4SW9rbVM5?=
 =?utf-8?B?NUZIQ1gxQjJ5cmN1NkhiVjlleEZoZFdsR21ER2FvZE1SVGU0cDdFMHEyZ1du?=
 =?utf-8?B?MFVacHVkK2JGYThTZ2lCelhYN2NKek5BV3FrME13QyswMnlsSlE5bWkzcCtD?=
 =?utf-8?B?ZU5TKzlhSUZqcG5kK25CUlRwdzdXNjVlM0RjUFlaeEtuV0NUOGEzZ053Y3Ez?=
 =?utf-8?B?dTFmZUNicVMvZFFuWEl4K3BrODQrcXdxclJ3cWs2S1hCNTlWTWtOc1ZDUlVr?=
 =?utf-8?B?REJicUs0eGhCOGVyd3cyV25LMGNkWUpwcXQvUWtXUGJXYnFsUHMxVzBvY2dO?=
 =?utf-8?B?OTNuU0hvcGZYNkMxZXpteXlFRzBwSHFtbnRQanNGSi93cVo5TUFibGtCKzhX?=
 =?utf-8?B?R3ZkOU1oTWVORWRxWUZUeEg0UVBldElUczhTelZ2SmVXbVRCUzE2U243eTdj?=
 =?utf-8?B?M0JpenFwQ2V0allOQlhBUk1rYnJBTjNIakNqS1hJVFZoanllQmxDS0ZYY094?=
 =?utf-8?B?ZThYNjVDcXdmZjN5WkVHYVkzMDlON2JxN0hPMUpHVjdzRFpJL2VuSWhlUi80?=
 =?utf-8?B?NDBWM1FnTFpNbFRBa3RIOUdaTlhrcmk1M2pzbkNXcysyRjJUeUQreDFSSVFX?=
 =?utf-8?B?eGFGSjNNUzcyZUl4MWxveE1hcXpIZWNlTlROc1BNY2s2cU5BRk5EK250a2ZY?=
 =?utf-8?B?VXErclhqWWpPTGFTdnVmVXlVVkxZRXdDenBiKzc0NklnTlg2TGNjZ2paUEtX?=
 =?utf-8?B?YU15TjFsbWl1eURqYkJrL3JrSGgwRU1Cb0NSSHFOOUlsZkVZMlVlY0VBa1R6?=
 =?utf-8?B?SmNvY1dFS1F3b014dHVUdDVFNHhybEVDM2kvYzZBRjNQTTJMNDdLZU1xYm43?=
 =?utf-8?B?SmplSXlWcVp6SDVsRmhJOFpzYm9JZkhtWHhKVDlVQVFCUXFEamZub3R3TTZT?=
 =?utf-8?B?RGVYRGl6bWczVjc5TXBYOG1VYmFQWXlNVHZUT3pnblMwc3h5VC9QaUhQYWFR?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36803702-6bfc-4281-5803-08dab2b05035
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 15:32:35.8195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cVNUG/uMXjwMmzRVC9C8XB8/0fYbv56CXmsccmB+aPMJv6F+gE1yKwntdgUbjq7uvZgapU6KDlbkmgslp5gNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9601
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



On 10/19/22 10:44 PM, Bagas Sanjaya wrote:
> On 10/19/22 06:11, Sean Anderson wrote:
>> This adds support for the Lynx 10G SerDes found on the QorIQ T-series
>> and Layerscape series. Due to limited time and hardware, only support
>> for the LS1046ARDB is added in this initial series. There is a sketch
>> for LS1088ARDB support, but it is incomplete.
>> 
>> Dynamic reconfiguration does not work. That is, the configuration must
>> match what is set in the RCW. From my testing, SerDes register settings
>> appear identical. The issue appears to be between the PCS and the MAC.
>> The link itself comes up at both ends, and a mac loopback succeeds.
>> However, a PCS loopback results in dropped packets. Perhaps there is
>> some undocumented register in the PCS?
>> 
>> I suspect this driver is around 95% complete, but, unfortunately, I no
>> longer have time to investigate this further. At the very least it is
>> useful for two cases:
>> - Although this is untested, it should support 2.5G SGMII as well as
>>   1000BASE-KX. The latter needs MAC and PCS support, but the former
>>   should work out of the box.
>> - It allows for clock configurations not supported by the RCW. This is
>>   very useful if you want to use e.g. SRDS_PRTCL_S1=0x3333 and =0x1133
>>   on the same board. This is because the former setting will use PLL1
>>   as the 1G reference, but the latter will use PLL1 as the 10G
>>   reference. Because we can reconfigure the PLLs, it is possible to
>>   always use PLL1 as the 1G reference.
>> 
>> Changes in v7:
>> - Use double quotes everywhere in yaml
>> - Break out call order into generic documentation
>> - Refuse to switch "major" protocols
>> - Update Kconfig to reflect restrictions
>> - Remove set/clear of "pcs reset" bit, since it doesn't seem to fix
>>   anything.
>> 
>> Changes in v6:
>> - Bump PHY_TYPE_2500BASEX to 13, since PHY_TYPE_USXGMII was added in the
>>   meantime
>> - fsl,type -> phy-type
>> - frequence -> frequency
>> - Update MAINTAINERS to include new files
>> - Include bitfield.h and slab.h to allow compilation on non-arm64
>>   arches.
>> - Depend on COMMON_CLK and either layerscape/ppc
>> - XGI.9 -> XFI.9
>> 
>> Changes in v5:
>> - Update commit description
>> - Dual id header
>> - Remove references to PHY_INTERFACE_MODE_1000BASEKX to allow this
>>   series to be applied directly to linux/master.
>> - Add fsl,lynx-10g.h to MAINTAINERS
>> 
>> Changes in v4:
>> - Add 2500BASE-X and 10GBASE-R phy types
>> - Use subnodes to describe lane configuration, instead of describing
>>   PCCRs. This is the same style used by phy-cadence-sierra et al.
>> - Add ids for Lynx 10g PLLs
>> - Rework all debug statements to remove use of __func__. Additional
>>   information has been provided as necessary.
>> - Consider alternative parent rates in round_rate and not in set_rate.
>>   Trying to modify out parent's rate in set_rate will deadlock.
>> - Explicitly perform a stop/reset sequence in set_rate. This way we
>>   always ensure that the PLL is properly stopped.
>> - Set the power-down bit when disabling the PLL. We can do this now that
>>   enable/disable aren't abused during the set rate sequence.
>> - Fix typos in QSGMII_OFFSET and XFI_OFFSET
>> - Rename LNmTECR0_TEQ_TYPE_PRE to LNmTECR0_TEQ_TYPE_POST to better
>>   reflect its function (adding post-cursor equalization).
>> - Use of_clk_hw_onecell_get instead of a custom function.
>> - Return struct clks from lynx_clks_init instead of embedding lynx_clk
>>   in lynx_priv.
>> - Rework PCCR helper functions; T-series SoCs differ from Layerscape SoCs
>>   primarily in the layout and offset of the PCCRs. This will help bring a
>>   cleaner abstraction layer. The caps have been removed, since this handles the
>>   only current usage.
>> - Convert to use new binding format. As a result of this, we no longer need to
>>   have protocols for PCIe or SATA. Additionally, modes now live in lynx_group
>>   instead of lynx_priv.
>> - Remove teq from lynx_proto_params, since it can be determined from
>>   preq_ratio/postq_ratio.
>> - Fix an early return from lynx_set_mode not releasing serdes->lock.
>> - Rename lynx_priv.conf to .cfg, since I kept mistyping it.
>> 
>> Changes in v3:
>> - Manually expand yaml references
>> - Add mode configuration to device tree
>> - Rename remaining references to QorIQ SerDes to Lynx 10G
>> - Fix PLL enable sequence by waiting for our reset request to be cleared
>>   before continuing. Do the same for the lock, even though it isn't as
>>   critical. Because we will delay for 1.5ms on average, use prepare
>>   instead of enable so we can sleep.
>> - Document the status of each protocol
>> - Fix offset of several bitfields in RECR0
>> - Take into account PLLRST_B, SDRST_B, and SDEN when considering whether
>>   a PLL is "enabled."
>> - Only power off unused lanes.
>> - Split mode lane mask into first/last lane (like group)
>> - Read modes from device tree
>> - Use caps to determine whether KX/KR are supported
>> - Move modes to lynx_priv
>> - Ensure that the protocol controller is not already in-use when we try
>>   to configure a new mode. This should only occur if the device tree is
>>   misconfigured (e.g. when QSGMII is selected on two lanes but there is
>>   only one QSGMII controller).
>> - Split PLL drivers off into their own file
>> - Add clock for "ext_dly" instead of writing the bit directly (and
>>   racing with any clock code).
>> - Use kasprintf instead of open-coding the snprintf dance
>> - Support 1000BASE-KX in lynx_lookup_proto. This still requires PCS
>>   support, so nothing is truly "enabled" yet.
>> - Describe modes in device tree
>> - ls1088a: Add serdes bindings
>> 
>> Changes in v2:
>> - Rename to fsl,lynx-10g.yaml
>> - Refer to the device in the documentation, rather than the binding
>> - Move compatible first
>> - Document phy cells in the description
>> - Allow a value of 1 for phy-cells. This allows for compatibility with
>>   the similar (but according to Ioana Ciornei different enough) lynx-28g
>>   binding.
>> - Remove minItems
>> - Use list for clock-names
>> - Fix example binding having too many cells in regs
>> - Add #clock-cells. This will allow using assigned-clocks* to configure
>>   the PLLs.
>> - Document the structure of the compatible strings
>> - Rename driver to Lynx 10G (etc.)
>> - Fix not clearing group->pll after disabling it
>> - Support 1 and 2 phy-cells
>> - Power off lanes during probe
>> - Clear SGMIIaCR1_PCS_EN during probe
>> - Rename LYNX_PROTO_UNKNOWN to LYNX_PROTO_NONE
>> - Handle 1000BASE-KX in lynx_proto_mode_prep
>> - Use one phy cell for SerDes1, since no lanes can be grouped
>> - Disable SerDes by default to prevent breaking boards inadvertently.
>> 
>> Sean Anderson (8):
>>   dt-bindings: phy: Add 2500BASE-X and 10GBASE-R
>>   dt-bindings: phy: Add Lynx 10G phy binding
>>   dt-bindings: clock: Add ids for Lynx 10g PLLs
>>   phy: fsl: Add Lynx 10G SerDes driver
>>   arm64: dts: ls1046a: Add serdes bindings
>>   arm64: dts: ls1088a: Add serdes bindings
>>   arm64: dts: ls1046ardb: Add serdes bindings
>>   [WIP] arm64: dts: ls1088ardb: Add serdes bindings
>> 
>>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml |  236 ++++
>>  Documentation/driver-api/phy/index.rst        |    1 +
>>  Documentation/driver-api/phy/lynx_10g.rst     |   58 +
>>  MAINTAINERS                                   |    7 +
>>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |  112 ++
>>  .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   18 +
>>  .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  161 +++
>>  .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   18 +
>>  drivers/phy/freescale/Kconfig                 |   23 +
>>  drivers/phy/freescale/Makefile                |    3 +
>>  drivers/phy/freescale/lynx-10g.h              |   16 +
>>  drivers/phy/freescale/phy-fsl-lynx-10g-clk.c  |  503 +++++++
>>  drivers/phy/freescale/phy-fsl-lynx-10g.c      | 1167 +++++++++++++++++
>>  include/dt-bindings/clock/fsl,lynx-10g.h      |   14 +
>>  include/dt-bindings/phy/phy.h                 |    2 +
>>  15 files changed, 2339 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
>>  create mode 100644 Documentation/driver-api/phy/lynx_10g.rst
>>  create mode 100644 drivers/phy/freescale/lynx-10g.h
>>  create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c
>>  create mode 100644 drivers/phy/freescale/phy-fsl-lynx-10g.c
>>  create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
>> 
> 
> I can't cleanly apply this series either on arm64 tree or linux-next.
> On what tree and commit the series is based on?
> 

It's based on net-next/master, since I was testing it with [1]. Last
time I rebased onto phy/next, but I forgot to do so this time. I can
resend based on that tree or on linux-next/master, whatever is suitable.

--Sean

[1] https://lore.kernel.org/netdev/20221017202241.1741671-1-sean.anderson@seco.com/
