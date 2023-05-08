Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B316FB3DF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 17:33:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFQKf0D6Dz3fLx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 01:33:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=a1nw+oC9;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=a1nw+oC9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1f::310; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=a1nw+oC9;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=a1nw+oC9;
	dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01hn0310.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::310])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFQJm48tFz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 01:32:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91ofPA+To9TwJdwCzDAN8rRPEcYgptZVS0M5w/S5/fI=;
 b=a1nw+oC9ZhxVpaOQ0GnJsNe9GLHDqrb6yJ0VOIof98faKT9nlzOycZhm7m4mP97dCa/uRCLpCV14c5eaJDe2TAdTLvjckmh7bmMByK14yeqOZZvTZHQqZH3nBk1OLo9dL25hly2B/Gmu2fdySZ3g/Twa2mdx6m7STBoj0Yt1oRQVnYT6y+VyIShHNoJxEvTMPLFXp05zcGF+iKcLvXzB/I5WmnBzsd8s578C0QCa8rO2NeMB+5Ng+sx08ijJNxhvu2F6T1Hv1toO6WXlt0cwVxkNzFr0I5LUH3O01chzXSIKtrFJskLSbanIF8TyZa+f/OOCkC8ZN1lC1lf2sjBocg==
Received: from FR3P281CA0181.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a4::14)
 by DU0PR03MB8936.eurprd03.prod.outlook.com (2603:10a6:10:477::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 15:32:03 +0000
Received: from VI1EUR05FT005.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:a4:cafe::88) by FR3P281CA0181.outlook.office365.com
 (2603:10a6:d10:a4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.17 via Frontend
 Transport; Mon, 8 May 2023 15:32:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.85)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.85 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.85; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.85) by
 VI1EUR05FT005.mail.protection.outlook.com (10.233.242.124) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.17 via Frontend Transport; Mon, 8 May 2023 15:32:03 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id EFC3E2008008D;
	Mon,  8 May 2023 15:32:02 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (unknown [104.47.11.234])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 39BC220080073;
	Mon,  8 May 2023 15:33:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aw6cVnt+K+Nn0o/r21GobE3lUsDsN7sfLilYiDPznSB0NMaMEe2i8lN96PXo/yHvFffvG+LLxSUq6ZVQkwco/iYBm4tWeRteG4OkA2Pg9Z5xeFYeQwNlJcnZSZbALVbbYZ9AnJOr1Shr8KKu+8PmLPnATfH9fBW8XlUEOZu+Hqv/rOHkdUeuz2wGFP5f4fCPgRmkDGpE7gRNH4u2dYdlnzEpxYyrdhuZmTcxuVw48qPTDNMO1uC0Zp3kqOQHiBE9eAl/t3q85gKCGNg5qtIZETTN3oPU+JlaC3cpG3a/yZvkqeu1edvNvFHQBbiIc55D2FoNf+kfxZtJUcD15L/WLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91ofPA+To9TwJdwCzDAN8rRPEcYgptZVS0M5w/S5/fI=;
 b=cdL6z3Ln4/sOjM9jC2OD9iy6JIuMy+2q3c20Fi5R8aH5V4b8+wnEKY9v/wh2W4WQUq1lsIbNOhRB/0YYwHTKLWxURTp0lk2WEH//f01TnzGoL7TwqabZEQMKlDVeQsTFyrgH5z3Ibad/3bFZ0nmWnRmiIBnsdo5FQgX84/aqvDdvyGRRuU2CHl2Xrd2/fPae3cVzBPWa9kzqu9hfYVhlz0PqUNWQ1PAQqcaCC03xUlR+tkKbTAZmdGEiqV6RgUnj+CzrvHGMTefX5qnBJbMVWQBgN9320HZ0VgHrcajshf9xV//Ex1+ugvXY7BNsdT42g8LttE1cn1zZNpJVp6TZ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91ofPA+To9TwJdwCzDAN8rRPEcYgptZVS0M5w/S5/fI=;
 b=a1nw+oC9ZhxVpaOQ0GnJsNe9GLHDqrb6yJ0VOIof98faKT9nlzOycZhm7m4mP97dCa/uRCLpCV14c5eaJDe2TAdTLvjckmh7bmMByK14yeqOZZvTZHQqZH3nBk1OLo9dL25hly2B/Gmu2fdySZ3g/Twa2mdx6m7STBoj0Yt1oRQVnYT6y+VyIShHNoJxEvTMPLFXp05zcGF+iKcLvXzB/I5WmnBzsd8s578C0QCa8rO2NeMB+5Ng+sx08ijJNxhvu2F6T1Hv1toO6WXlt0cwVxkNzFr0I5LUH3O01chzXSIKtrFJskLSbanIF8TyZa+f/OOCkC8ZN1lC1lf2sjBocg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB7045.eurprd03.prod.outlook.com (2603:10a6:20b:292::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 15:32:00 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e%3]) with mapi id 15.20.6363.026; Mon, 8 May 2023
 15:32:00 +0000
Message-ID: <1012f955-180e-0013-cc13-1da10991b5f5@seco.com>
Date: Mon, 8 May 2023 11:31:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v14 06/15] clk: Add Lynx 10G SerDes PLL driver
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
 <20230413160607.4128315-7-sean.anderson@seco.com> <ZFi9t84UoIfUyHhi@matsya>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <ZFi9t84UoIfUyHhi@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR1501CA0031.namprd15.prod.outlook.com
 (2603:10b6:207:17::44) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB7045:EE_|VI1EUR05FT005:EE_|DU0PR03MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: ccddd88a-eb8a-499e-2baf-08db4fd95fa3
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  hrKB7WnizpUJIC+I0jcksdGMGCyTk9VSumu7+lxDaDyWpfIBHbHIcOWnsm7me665gkyLgivHpmMqhZwA+ay+HqMscUVrZW0XIiEb+PI39W86aXiZOV998MfFknOjfEVMobBwwThXPruVqPQ5K5N2xJFQsYBDFR/cFAQQVfCAkf1eQ1iCOzDXbvThsKb8OS+uwzlst1r0QMRLN1v5uFqcI3IyldEGcEYMWMACIW+QnvU3TO0wl76BJVfmhJnVIYJk3i4gnpX65l8xwZAcjokgZilAAe2jXw57CColDoUjsFkmiQyi+h41i8itYvgxjs575nuRekcSe2Ak8+qaC5TSxYmAuGW4Jol6xKZV6mcHH6mXArcFY7eMN+SC/1sBTyk9KQUkNxRPjWvK3TEG4JCp86gnxToWK8yn9tSvVcm2Jq3UQn1VMSXWBQN8edzQd+NAswLuRtqaT0q/QIe/vAfqk+kD63AEwTe/ITcTuKXNaaZOwYix7EFJBWEOqIDIg7OVwqwlj30BpmcaJauW3UnrIiYdt54ODv96gZdvUyBDBlw29GbmzR/W0mjUtsTPCghTpdxqW9YETiT9fT5mw5Uss4k5/ypHi5aikkFlVSVQcS4M9MF9SXJPvn6A89Ad5xYiuEd7B2D7bEVoblzTvtJxcK4Xr1iuX82OfMxjDUsQhhhxyCnCkTpMH8vdfjw8rMTJ
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39850400004)(396003)(366004)(346002)(451199021)(31686004)(44832011)(7416002)(6916009)(5660300002)(4326008)(66476007)(478600001)(66556008)(8676002)(8936002)(54906003)(66946007)(30864003)(2906002)(66899021)(6666004)(316002)(41300700001)(52116002)(6486002)(966005)(53546011)(6506007)(26005)(6512007)(186003)(36756003)(2616005)(83380400001)(38100700002)(86362001)(31696002)(38350700002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7045
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT005.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	6a43b3c8-983d-4d43-487c-08db4fd95da1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QqzMKKTDk2vU7A2PtjQt7gZHEACbj188Y0z0qBmlR+z5nI+AX3Z99BNaXF1tUG9O/bPM2kxxgLLDF+1p7ftpkXdNSqqtc1Z+hHGqKGqOBzRFPj02LoqJk2Y1WjY9JOrcKY8BtkCRim8ALBmXcPPVqBFrviq257waSNLYHgygfbD4YYWjN1CubDo/JKr+gk3YrTDnrYpRbc9LASJTQ9BGE8N2f6Y3AujYW+/v/esqPPXZS3iKz4OdPJydPhyUvtScDY79HW5p2/ZXmHpVfriM8VvUeYmvThWKXOKMs2BBPC1K8Wk7dS1zNSPzGqq6kZG+oACrzT4f1vUOvQfTxsG05fFAydYrGhDlMTD7N/plN2QnUn3a2siJLYEM4vrXngYfHfVzAN0g6Ck8WjNnEoKeQOM7Mn+eFglvDye2pMpFcrOHbdtymyNIpGSqKCwGX3db1fp58B/sktJNV2iyGYdwAr7DgVHEJZ4A25BEEBGVQymORlY2/rBSWA3ZEV///b7c634YuhPxH9HZroG8sfznuB4pGry6jAvTHDJ/pffAAlYFVrNdSg9VxtsAWE2IGXLZnB6vbSY0/3XeTKeyb3TnU4f8kSsy27xcBOH40mYAfkzsOS0h5filyOleXNsW6sjlk4LBRRvMgHbkRBZElAXWqEumo6E0PRF8OzOvP9Kylagw6B4KQ5D7mhcokVJPBGbNw66VP2tS4HDxKPC4Tr1i6uT+Mqq4Mu2JgvW7HMt+RFxNiH+5TsISZ7vPiHIFNIgZjoq3aY6I75lIXcFMbbj/3CVwy2Ykc0XwkEwy79z/eJ/OpNGM2SI6alLKMjgRXAr3
X-Forefront-Antispam-Report: 	CIP:20.160.56.85;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(39850400004)(136003)(451199021)(5400799015)(46966006)(36840700001)(40470700004)(31686004)(66899021)(36860700001)(36756003)(40460700003)(2906002)(7416002)(44832011)(30864003)(31696002)(316002)(5660300002)(8676002)(86362001)(40480700001)(6916009)(70206006)(82310400005)(356005)(70586007)(7596003)(7636003)(8936002)(4326008)(82740400003)(41300700001)(47076005)(83380400001)(966005)(336012)(186003)(6506007)(26005)(53546011)(6512007)(6486002)(478600001)(6666004)(2616005)(34020700004)(54906003)(21314003)(43740500002)(12100799030);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 15:32:03.2990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccddd88a-eb8a-499e-2baf-08db4fd95fa3
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.85];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT005.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8936
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/8/23 05:15, Vinod Koul wrote:
> On 13-04-23, 12:05, Sean Anderson wrote:
>> This adds support for the PLLs found in Lynx 10G "SerDes" devices found on
>> various NXP QorIQ SoCs. There are two PLLs in each SerDes. This driver has
>> been split from the main PHY driver to allow for better review, even though
>> these PLLs are not present anywhere else besides the SerDes. An auxiliary
>> device is not used as it offers no benefits over a function call (and there
>> is no need to have a separate device).
>> 
>> The PLLs are modeled as clocks proper to let us take advantage of the
>> existing clock infrastructure. I have not given the same treatment to the
>> per-lane clocks because they need to be programmed in-concert with the rest
>> of the lane settings. One tricky thing is that the VCO (PLL) rate exceeds
>> 2^32 (maxing out at around 5GHz). This will be a problem on 32-bit
>> platforms, since clock rates are stored as unsigned longs. To work around
>> this, the pll clock rate is generally treated in units of kHz.
>> 
>> The PLLs are configured rather interestingly. Instead of the usual direct
>> programming of the appropriate divisors, the input and output clock rates
>> are selected directly. Generally, the only restriction is that the input
>> and output must be integer multiples of each other. This suggests some kind
>> of internal look-up table. The datasheets generally list out the supported
>> combinations explicitly, and not all input/output combinations are
>> documented. I'm not sure if this is due to lack of support, or due to an
>> oversight. If this becomes an issue, then some combinations can be
>> blacklisted (or whitelisted). This may also be necessary for other SoCs
>> which have more stringent clock requirements.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> 
>> ---
>> 
>> (no changes since v10)
>> 
>> Changes in v10:
>> - Remove unnecessary inclusion of clk.h
>> - Don't gate clocks in compatibility mode
>> 
>> Changes in v9:
>> - Convert some u32s to unsigned long to match arguments
>> - Switch from round_rate to determine_rate
>> - Drop explicit reference to reference clock
>> - Use .parent_names when requesting parents
>> - Use devm_clk_hw_get_clk to pass clocks back to serdes
>> - Fix indentation
>> - Split off from following patch to allow for better review
>> 
>>  MAINTAINERS                    |   7 +
>>  drivers/clk/Makefile           |   1 +
>>  drivers/clk/clk-fsl-lynx-10g.c | 510 +++++++++++++++++++++++++++++++++
>>  drivers/phy/freescale/Kconfig  |   6 +
>>  include/linux/phy/lynx-10g.h   |  16 ++
>>  5 files changed, 540 insertions(+)
>>  create mode 100644 drivers/clk/clk-fsl-lynx-10g.c
>>  create mode 100644 include/linux/phy/lynx-10g.h
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fce67b74e4a2..8da893681de6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -12195,6 +12195,13 @@ S:	Maintained
>>  W:	https://cas5-0-urlprotect.trendmicro.com:443/wis/clicktime/v1/query?url=http%3a%2f%2flinux%2dtest%2dproject.github.io&umid=eea5aa47-e59c-4621-9990-899dbf66d77b&auth=d807158c60b7d2502abde8a2fc01f40662980862-79710d1cff1d8502466ef54536bf4f8832e88cfd
>>  T:	git https://cas5-0-urlprotect.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fgithub.com%2flinux%2dtest%2dproject%2fltp.git&umid=eea5aa47-e59c-4621-9990-899dbf66d77b&auth=d807158c60b7d2502abde8a2fc01f40662980862-3742f3f51fa3244f5c96d5ba988f63d472b08938
>>  
>> +LYNX 10G SERDES DRIVER
>> +M:	Sean Anderson <sean.anderson@seco.com>
>> +S:	Maintained
>> +F:	drivers/clk/clk-fsl-lynx-10g.c
>> +F:	include/dt-bindings/clock/fsl,lynx-10g.h
>> +F:	include/linux/phy/lynx-10g.h
>> +
>>  LYNX 28G SERDES PHY DRIVER
>>  M:	Ioana Ciornei <ioana.ciornei@nxp.com>
>>  L:	netdev@vger.kernel.org
>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>> index e3ca0d058a25..eebed69f6c58 100644
>> --- a/drivers/clk/Makefile
>> +++ b/drivers/clk/Makefile
>> @@ -33,6 +33,7 @@ obj-$(CONFIG_ARCH_SPARX5)		+= clk-sparx5.o
>>  obj-$(CONFIG_COMMON_CLK_EN7523)		+= clk-en7523.o
>>  obj-$(CONFIG_COMMON_CLK_FIXED_MMIO)	+= clk-fixed-mmio.o
>>  obj-$(CONFIG_COMMON_CLK_FSL_FLEXSPI)	+= clk-fsl-flexspi.o
>> +obj-$(CONFIG_PHY_FSL_LYNX_10G)		+= clk-fsl-lynx-10g.o
>>  obj-$(CONFIG_COMMON_CLK_FSL_SAI)	+= clk-fsl-sai.o
>>  obj-$(CONFIG_COMMON_CLK_GEMINI)		+= clk-gemini.o
>>  obj-$(CONFIG_COMMON_CLK_ASPEED)		+= clk-aspeed.o
>> diff --git a/drivers/clk/clk-fsl-lynx-10g.c b/drivers/clk/clk-fsl-lynx-10g.c
>> new file mode 100644
>> index 000000000000..78357303b578
>> --- /dev/null
>> +++ b/drivers/clk/clk-fsl-lynx-10g.c
>> @@ -0,0 +1,510 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
>> + *
>> + * This file contains the implementation for the PLLs found on Lynx 10G phys.
>> + *
>> + * XXX: The VCO rate of the PLLs can exceed ~4GHz, which is the maximum rate
>> + * expressable in an unsigned long. To work around this, rates are specified in
>> + * kHz. This is as if there was a division by 1000 in the PLL.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/device.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/math64.h>
>> +#include <linux/phy/lynx-10g.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slab.h>
>> +#include <linux/units.h>
>> +#include <dt-bindings/clock/fsl,lynx-10g.h>
>> +
>> +#define PLL_STRIDE	0x20
>> +#define PLLa(a, off)	((a) * PLL_STRIDE + (off))
>> +#define PLLaRSTCTL(a)	PLLa(a, 0x00)
>> +#define PLLaCR0(a)	PLLa(a, 0x04)
>> +
>> +#define PLLaRSTCTL_RSTREQ	BIT(31)
>> +#define PLLaRSTCTL_RST_DONE	BIT(30)
>> +#define PLLaRSTCTL_RST_ERR	BIT(29)
>> +#define PLLaRSTCTL_PLLRST_B	BIT(7)
>> +#define PLLaRSTCTL_SDRST_B	BIT(6)
>> +#define PLLaRSTCTL_SDEN		BIT(5)
>> +
>> +#define PLLaRSTCTL_ENABLE_SET	(PLLaRSTCTL_RST_DONE | PLLaRSTCTL_PLLRST_B | \
>> +				 PLLaRSTCTL_SDRST_B | PLLaRSTCTL_SDEN)
>> +#define PLLaRSTCTL_ENABLE_MASK	(PLLaRSTCTL_ENABLE_SET | PLLaRSTCTL_RST_ERR)
>> +
>> +#define PLLaCR0_POFF		BIT(31)
>> +#define PLLaCR0_RFCLK_SEL	GENMASK(30, 28)
>> +#define PLLaCR0_PLL_LCK		BIT(23)
>> +#define PLLaCR0_FRATE_SEL	GENMASK(19, 16)
>> +#define PLLaCR0_DLYDIV_SEL	GENMASK(1, 0)
>> +
>> +#define PLLaCR0_DLYDIV_SEL_16		0b01
>> +
>> +/**
>> + * struct lynx_clk - Driver data for the PLLs
>> + * @pll: The PLL clock
>> + * @ex_dly: The "PLLa_ex_dly_clk" clock
>> + * @dev: The serdes device
>> + * @regmap: Our registers
>> + * @idx: Which PLL this clock is for
>> + */
>> +struct lynx_clk {
>> +	struct clk_hw pll, ex_dly;
>> +	struct device *dev;
>> +	struct regmap *regmap;
>> +	unsigned int idx;
>> +};
>> +
>> +static u32 lynx_read(struct lynx_clk *clk, u32 reg)
>> +{
>> +	unsigned int ret = 0;
>> +
>> +	WARN_ON_ONCE(regmap_read(clk->regmap, reg, &ret));
>> +	return ret;
>> +}
>> +
>> +static void lynx_write(struct lynx_clk *clk, u32 val, u32 reg)
>> +{
>> +	WARN_ON_ONCE(regmap_write(clk->regmap, reg, val));
>> +}
>> +
>> +static struct lynx_clk *lynx_pll_to_clk(struct clk_hw *hw)
>> +{
>> +	return container_of(hw, struct lynx_clk, pll);
>> +}
>> +
>> +static struct lynx_clk *lynx_ex_dly_to_clk(struct clk_hw *hw)
>> +{
>> +	return container_of(hw, struct lynx_clk, ex_dly);
>> +}
>> +
>> +static void lynx_pll_stop(struct lynx_clk *clk)
>> +{
>> +	u32 rstctl;
>> +
>> +	rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
>> +	rstctl &= ~PLLaRSTCTL_SDRST_B;
>> +	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
>> +
>> +	ndelay(50);
>> +
>> +	rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
>> +	rstctl &= ~(PLLaRSTCTL_SDEN | PLLaRSTCTL_PLLRST_B);
>> +	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
>> +
>> +	ndelay(100);
>> +}
>> +
>> +static void lynx_pll_disable(struct clk_hw *hw)
>> +{
>> +	struct lynx_clk *clk = lynx_pll_to_clk(hw);
>> +	u32 cr0;
>> +
>> +	dev_dbg(clk->dev, "disable pll%d\n", clk->idx);
>> +
>> +	lynx_pll_stop(clk);
>> +
>> +	cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>> +	cr0 |= PLLaCR0_POFF;
>> +	lynx_write(clk, cr0, PLLaCR0(clk->idx));
>> +}
>> +
>> +static int lynx_pll_reset(struct lynx_clk *clk)
>> +{
>> +	int ret;
>> +	u32 rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
>> +
>> +	rstctl |= PLLaRSTCTL_RSTREQ;
>> +	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
>> +	ret = read_poll_timeout(lynx_read, rstctl,
>> +				rstctl & (PLLaRSTCTL_RST_DONE | PLLaRSTCTL_RST_ERR),
>> +				100, 5000, true, clk, PLLaRSTCTL(clk->idx));
>> +	if (rstctl & PLLaRSTCTL_RST_ERR)
>> +		ret = -EIO;
>> +	if (ret) {
>> +		dev_err(clk->dev, "pll%d reset failed\n", clk->idx);
>> +		return ret;
>> +	}
>> +
>> +	rstctl |= PLLaRSTCTL_SDEN | PLLaRSTCTL_PLLRST_B | PLLaRSTCTL_SDRST_B;
>> +	lynx_write(clk, rstctl, PLLaRSTCTL(clk->idx));
>> +	return 0;
>> +}
>> +
>> +static int lynx_pll_prepare(struct clk_hw *hw)
>> +{
>> +	struct lynx_clk *clk = lynx_pll_to_clk(hw);
>> +	u32 rstctl = lynx_read(clk, PLLaRSTCTL(clk->idx));
>> +	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>> +
>> +	/*
>> +	 * "Enabling" the PLL involves resetting it (and all attached lanes).
>> +	 * Avoid doing this if we are already enabled.
>> +	 */
>> +	if (!(cr0 & PLLaCR0_POFF) &&
>> +	    (rstctl & PLLaRSTCTL_ENABLE_MASK) == PLLaRSTCTL_ENABLE_SET) {
>> +		dev_dbg(clk->dev, "pll%d already prepared\n", clk->idx);
>> +		return 0;
>> +	}
>> +
>> +	dev_dbg(clk->dev, "prepare pll%d\n", clk->idx);
>> +
>> +	cr0 &= ~PLLaCR0_POFF;
>> +	lynx_write(clk, cr0, PLLaCR0(clk->idx));
>> +
>> +	return lynx_pll_reset(clk);
>> +}
>> +
>> +static int lynx_pll_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct lynx_clk *clk = lynx_pll_to_clk(hw);
>> +	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>> +	bool enabled = !(cr0 & PLLaCR0_POFF);
>> +
>> +	dev_dbg(clk->dev, "pll%d %s enabled\n", clk->idx,
>> +		enabled ? "is" : "is not");
>> +
>> +	return enabled;
>> +}
>> +
>> +static const unsigned long rfclk_sel_map[8] = {
>> +	[0b000] = 100000000,
>> +	[0b001] = 125000000,
>> +	[0b010] = 156250000,
>> +	[0b011] = 150000000,
>> +};
>> +
>> +/**
>> + * lynx_rfclk_to_sel() - Convert a reference clock rate to a selector
>> + * @rate: The reference clock rate
>> + *
>> + * To allow for some variation in the reference clock rate, up to 100ppm of
>> + * error is allowed.
>> + *
>> + * Return: An appropriate selector for @rate, or -%EINVAL.
>> + */
>> +static int lynx_rfclk_to_sel(unsigned long rate)
>> +{
>> +	int ret;
>> +
>> +	for (ret = 0; ret < ARRAY_SIZE(rfclk_sel_map); ret++) {
>> +		unsigned long rfclk_rate = rfclk_sel_map[ret];
>> +		/* Allow an error of 100ppm */
>> +		unsigned long error = rfclk_rate / 10000;
>> +
>> +		if (abs(rate - rfclk_rate) < error)
>> +			return ret;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static const unsigned long frate_sel_map[16] = {
>> +	[0b0000] = 5000000,
>> +	[0b0101] = 3750000,
>> +	[0b0110] = 5156250,
>> +	[0b0111] = 4000000,
>> +	[0b1001] = 3125000,
>> +	[0b1010] = 3000000,
>> +};
>> +
>> +/**
>> + * lynx_frate_to_sel() - Convert a VCO clock rate to a selector
>> + * @rate_khz: The VCO frequency, in kHz
>> + *
>> + * Return: An appropriate selector for @rate_khz, or -%EINVAL.
>> + */
>> +static int lynx_frate_to_sel(unsigned long rate_khz)
>> +{
>> +	int ret;
>> +
>> +	for (ret = 0; ret < ARRAY_SIZE(frate_sel_map); ret++)
>> +		if (frate_sel_map[ret] == rate_khz)
>> +			return ret;
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static u32 lynx_pll_ratio(u32 frate_sel, u32 rfclk_sel)
>> +{
>> +	u64 frate;
>> +	u32 rfclk, error, ratio;
>> +
>> +	frate = frate_sel_map[frate_sel] * (u64)HZ_PER_KHZ;
>> +	rfclk = rfclk_sel_map[rfclk_sel];
>> +
>> +	if (!frate || !rfclk)
>> +		return 0;
>> +
>> +	ratio = div_u64_rem(frate, rfclk, &error);
>> +	if (!error)
>> +		return ratio;
>> +	return 0;
>> +}
>> +
>> +static unsigned long lynx_pll_recalc_rate(struct clk_hw *hw,
>> +					  unsigned long parent_rate)
>> +{
>> +	struct lynx_clk *clk = lynx_pll_to_clk(hw);
>> +	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>> +	u32 frate_sel = FIELD_GET(PLLaCR0_FRATE_SEL, cr0);
>> +	u32 rfclk_sel = FIELD_GET(PLLaCR0_RFCLK_SEL, cr0);
>> +	u32 ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
>> +	unsigned long ret;
>> +
>> +	/* Ensure that the parent matches our rfclk selector */
>> +	if (rfclk_sel == lynx_rfclk_to_sel(parent_rate))
>> +		ret = mult_frac(parent_rate, ratio, HZ_PER_KHZ);
>> +	else
>> +		ret = 0;
>> +
>> +	dev_dbg(clk->dev, "recalc pll%d new=%llu parent=%lu\n", clk->idx,
>> +		(u64)ret * HZ_PER_KHZ, parent_rate);
>> +	return ret;
>> +}
>> +
>> +static int lynx_pll_determine_rate(struct clk_hw *hw,
>> +				   struct clk_rate_request *req)
>> +{
>> +	int frate_sel, rfclk_sel;
>> +	struct lynx_clk *clk = lynx_pll_to_clk(hw);
>> +	u32 ratio;
>> +
>> +	dev_dbg(clk->dev, "round pll%d new=%llu parent=%lu\n", clk->idx,
>> +		(u64)req->rate * HZ_PER_KHZ, req->best_parent_rate);
>> +
>> +	frate_sel = lynx_frate_to_sel(req->rate);
>> +	if (frate_sel < 0)
>> +		return frate_sel;
>> +
>> +	/* Try the current parent rate */
>> +	rfclk_sel = lynx_rfclk_to_sel(req->best_parent_rate);
>> +	if (rfclk_sel >= 0) {
>> +		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
>> +		if (ratio) {
>> +			req->rate = mult_frac(req->best_parent_rate, ratio,
>> +					      HZ_PER_KHZ);
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	/* Try all possible parent rates */
>> +	for (rfclk_sel = 0;
>> +	     rfclk_sel < ARRAY_SIZE(rfclk_sel_map);
>> +	     rfclk_sel++) {
>> +		unsigned long new_parent_rate;
>> +
>> +		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
>> +		if (!ratio)
>> +			continue;
>> +
>> +		/* Ensure the reference clock can produce this rate */
>> +		new_parent_rate = rfclk_sel_map[rfclk_sel];
>> +		new_parent_rate = clk_hw_round_rate(req->best_parent_hw,
>> +						    new_parent_rate);
>> +		if (rfclk_sel != lynx_rfclk_to_sel(new_parent_rate))
>> +			continue;
>> +
>> +		req->rate = mult_frac(new_parent_rate, ratio, HZ_PER_KHZ);
>> +		req->best_parent_rate = new_parent_rate;
>> +		return 0;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int lynx_pll_set_rate(struct clk_hw *hw, unsigned long rate_khz,
>> +			     unsigned long parent_rate)
>> +{
>> +	int frate_sel, rfclk_sel;
>> +	struct lynx_clk *clk = lynx_pll_to_clk(hw);
>> +	u32 ratio, cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>> +
>> +	dev_dbg(clk->dev, "set rate pll%d new=%llu parent=%lu\n", clk->idx,
>> +		(u64)rate_khz * HZ_PER_KHZ, parent_rate);
>> +
>> +	frate_sel = lynx_frate_to_sel(rate_khz);
>> +	if (frate_sel < 0)
>> +		return frate_sel;
>> +
>> +	rfclk_sel = lynx_rfclk_to_sel(parent_rate);
>> +	if (rfclk_sel < 0)
>> +		return rfclk_sel;
>> +
>> +	ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
>> +	if (!ratio)
>> +		return -EINVAL;
>> +
>> +	lynx_pll_stop(clk);
>> +	cr0 &= ~(PLLaCR0_RFCLK_SEL | PLLaCR0_FRATE_SEL);
>> +	cr0 |= FIELD_PREP(PLLaCR0_RFCLK_SEL, rfclk_sel);
>> +	cr0 |= FIELD_PREP(PLLaCR0_FRATE_SEL, frate_sel);
>> +	lynx_write(clk, cr0, PLLaCR0(clk->idx));
>> +	/* Don't bother resetting if it's off */
>> +	if (cr0 & PLLaCR0_POFF)
>> +		return 0;
>> +	return lynx_pll_reset(clk);
>> +}
>> +
>> +static const struct clk_ops lynx_pll_clk_ops = {
>> +	.prepare = lynx_pll_prepare,
>> +	.disable = lynx_pll_disable,
>> +	.is_enabled = lynx_pll_is_enabled,
>> +	.recalc_rate = lynx_pll_recalc_rate,
>> +	.determine_rate = lynx_pll_determine_rate,
>> +	.set_rate = lynx_pll_set_rate,
>> +};
>> +
>> +static void lynx_ex_dly_disable(struct clk_hw *hw)
>> +{
>> +	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
>> +	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>> +
>> +	cr0 &= ~PLLaCR0_DLYDIV_SEL;
>> +	lynx_write(clk, PLLaCR0(clk->idx), cr0);
>> +}
>> +
>> +static int lynx_ex_dly_enable(struct clk_hw *hw)
>> +{
>> +	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
>> +	u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
>> +
>> +	cr0 &= ~PLLaCR0_DLYDIV_SEL;
>> +	cr0 |= FIELD_PREP(PLLaCR0_DLYDIV_SEL, PLLaCR0_DLYDIV_SEL_16);
>> +	lynx_write(clk, PLLaCR0(clk->idx), cr0);
>> +	return 0;
>> +}
>> +
>> +static int lynx_ex_dly_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct lynx_clk *clk = lynx_ex_dly_to_clk(hw);
>> +
>> +	return lynx_read(clk, PLLaCR0(clk->idx)) & PLLaCR0_DLYDIV_SEL;
>> +}
>> +
>> +static unsigned long lynx_ex_dly_recalc_rate(struct clk_hw *hw,
>> +					     unsigned long parent_rate)
>> +{
>> +	return parent_rate / 16;
>> +}
>> +
>> +static const struct clk_ops lynx_ex_dly_clk_ops = {
>> +	.enable = lynx_ex_dly_enable,
>> +	.disable = lynx_ex_dly_disable,
>> +	.is_enabled = lynx_ex_dly_is_enabled,
>> +	.recalc_rate = lynx_ex_dly_recalc_rate,
>> +};
>> +
>> +static int lynx_clk_init(struct clk_hw_onecell_data *hw_data,
>> +			 struct device *dev, struct regmap *regmap,
>> +			 unsigned int index, bool compat)
>> +{
>> +	const struct clk_hw *ex_dly_parents;
>> +	struct clk_parent_data pll_parents[1] = { };
>> +	struct clk_init_data pll_init = {
>> +		.ops = &lynx_pll_clk_ops,
>> +		.parent_data = pll_parents,
>> +		.num_parents = 1,
>> +		.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT |
>> +			 CLK_OPS_PARENT_ENABLE,
>> +	};
>> +	struct clk_init_data ex_dly_init = {
>> +		.ops = &lynx_ex_dly_clk_ops,
>> +		.parent_hws = &ex_dly_parents,
>> +		.num_parents = 1,
>> +	};
>> +	struct lynx_clk *clk;
>> +	int ret;
>> +
>> +	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
>> +	if (!clk)
>> +		return -ENOMEM;
>> +
>> +	clk->dev = dev;
>> +	clk->regmap = regmap;
>> +	clk->idx = index;
>> +
>> +	pll_parents[0].fw_name = kasprintf(GFP_KERNEL, "ref%d", index);
>> +	pll_init.name = kasprintf(GFP_KERNEL, "%s.pll%d_khz", dev_name(dev),
>> +				  index);
>> +	ex_dly_init.name = kasprintf(GFP_KERNEL, "%s.pll%d_ex_dly_khz",
>> +				     dev_name(dev), index);
>> +	if (!pll_parents[0].fw_name || !pll_init.name || !ex_dly_init.name) {
>> +		ret = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	if (compat)
>> +		pll_init.flags |= CLK_IGNORE_UNUSED;
>> +	clk->pll.init = &pll_init;
>> +	ret = devm_clk_hw_register(dev, &clk->pll);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "could not register %s\n",
>> +			      pll_init.name);
>> +		goto out;
>> +	}
>> +
>> +	ex_dly_parents = &clk->pll;
>> +	clk->ex_dly.init = &ex_dly_init;
>> +	ret = devm_clk_hw_register(dev, &clk->ex_dly);
>> +	if (ret)
>> +		dev_err_probe(dev, ret, "could not register %s\n",
>> +			      ex_dly_init.name);
>> +
>> +	hw_data->hws[LYNX10G_PLLa(index)] = &clk->pll;
>> +	hw_data->hws[LYNX10G_PLLa_EX_DLY(index)] = &clk->ex_dly;
>> +
>> +out:
>> +	kfree(pll_parents[0].fw_name);
>> +	kfree(pll_init.name);
>> +	kfree(ex_dly_init.name);
>> +	return ret;
>> +}
>> +
>> +#define NUM_PLLS 2
>> +#define NUM_CLKS (NUM_PLLS * LYNX10G_CLKS_PER_PLL)
>> +
>> +int lynx_clks_init(struct device *dev, struct regmap *regmap,
>> +		   struct clk *plls[2], struct clk *ex_dlys[2], bool compat)
>> +{
>> +	int ret, i;
>> +	struct clk_hw_onecell_data *hw_data;
>> +
>> +	hw_data = devm_kzalloc(dev, struct_size(hw_data, hws, NUM_CLKS),
>> +			       GFP_KERNEL);
>> +	if (!hw_data)
>> +		return -ENOMEM;
>> +	hw_data->num = NUM_CLKS;
>> +
>> +	for (i = 0; i < NUM_PLLS; i++) {
>> +		ret = lynx_clk_init(hw_data, dev, regmap, i, compat);
>> +		if (ret)
>> +			return ret;
>> +
>> +		plls[i] = devm_clk_hw_get_clk(dev,
>> +					      hw_data->hws[LYNX10G_PLLa(i)],
>> +					      NULL);
>> +		if (IS_ERR(plls[i]))
>> +			return PTR_ERR(plls[i]);
>> +
>> +		ex_dlys[i] = devm_clk_hw_get_clk(dev,
>> +						 hw_data->hws[LYNX10G_PLLa_EX_DLY(i)],
>> +						 NULL);
>> +		if (IS_ERR(ex_dlys[i]))
>> +			return PTR_ERR(plls[i]);
>> +	}
>> +
>> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, hw_data);
>> +	if (ret)
>> +		dev_err_probe(dev, ret, "could not register clock provider\n");
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(lynx_clks_init);
>> +
>> +MODULE_AUTHOR("Sean Anderson <sean.anderson@seco.com>");
>> +MODULE_DESCRIPTION("Lynx 10G PLL driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
>> index 853958fb2c06..5d461232276f 100644
>> --- a/drivers/phy/freescale/Kconfig
>> +++ b/drivers/phy/freescale/Kconfig
>> @@ -47,3 +47,9 @@ config PHY_FSL_LYNX_28G
>>  	  found on NXP's Layerscape platforms such as LX2160A.
>>  	  Used to change the protocol running on SerDes lanes at runtime.
>>  	  Only useful for a restricted set of Ethernet protocols.
>> +
>> +config PHY_FSL_LYNX_10G
>> +	tristate
>> +	depends on COMMON_CLK
>> +	depends on ARCH_LAYERSCAPE || PPC || COMPILE_TEST
>> +	select REGMAP_MMIO
> 
> Why is this change in clk driver part?

So the condition in the Makefile has an associated Kconfig.

>> diff --git a/include/linux/phy/lynx-10g.h b/include/linux/phy/lynx-10g.h
>> new file mode 100644
>> index 000000000000..b7b80b3ee988
>> --- /dev/null
>> +++ b/include/linux/phy/lynx-10g.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
>> + */
>> +
>> +#ifndef LYNX_10G
>> +#define LYNX_10G
>> +
>> +struct clk;
>> +struct device;
>> +struct regmap;
>> +
>> +int lynx_clks_init(struct device *dev, struct regmap *regmap,
>> +		   struct clk *plls[2], struct clk *ex_dlys[2], bool compat);
> 
> so you have an exported symbol for clk driver init in phy driver header?
> can you please explain why..?

So that it can be called at the appropriate time during the phy's probe function.

This is really an integral part of the phy driver, but I was directed to split it
off and put it in another subsystem's directory.

--Sean

>> +
>> +#endif /* LYNX 10G */
>> -- 
>> 2.35.1.1320.gc452695387.dirty
> 

