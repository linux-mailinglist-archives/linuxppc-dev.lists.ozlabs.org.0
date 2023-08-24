Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5FE787B3E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 00:11:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TBwNzf3X;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TBwNzf3X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWy3M3Fmqz3cHd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 08:11:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TBwNzf3X;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TBwNzf3X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=52.100.20.247; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05hn2247.outbound.protection.outlook.com [52.100.20.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWy2P0kwYz2yDd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 08:10:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79WQMo1An+kEjfD00O/FIsavhTriaIzAE1XWuOS+3hA=;
 b=TBwNzf3XKNPB7c8XLAMgR6IWsB7cuX7kJSU1iDUUJZfmsl4Gz/Tu4eSZU0xDha4VivD5Mn1fxvGD1aZopyL679vvtQyqk0f7mXf7Q1YT+8wHqv4+L7bn+p+IhOFoQ3oUPz6nY2vLe7OWsW2SGDUfs/ymPR/2vB9s3P27ZXotvH0Atcl3qQZ5GXGBirhMubpjeqHZ8H8GDmJs6qpELJTxiiLumnXTSCDOQxzKA+QkpQCWSmfwlm/Hqm06KK9oVhzVR6mdmv/MMPFmNPuKQbqsi3uX18XdzP7a5qj0n57WJLneVJj633Toc/LGAs9YV/cjWm5AYnFM3eP8efH9GsC/+A==
Received: from DB3PR08CA0010.eurprd08.prod.outlook.com (2603:10a6:8::23) by
 AM7PR03MB6264.eurprd03.prod.outlook.com (2603:10a6:20b:13d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.27; Thu, 24 Aug 2023 22:10:14 +0000
Received: from DB8EUR05FT015.eop-eur05.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::e2) by DB3PR08CA0010.outlook.office365.com
 (2603:10a6:8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Thu, 24 Aug 2023 22:10:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.85)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.85 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.85; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.85) by
 DB8EUR05FT015.mail.protection.outlook.com (10.233.238.127) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.16 via Frontend Transport; Thu, 24 Aug 2023 22:10:14 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id DE6A0200813A8;
	Thu, 24 Aug 2023 22:10:13 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.175])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 66CCA2008006E;
	Thu, 24 Aug 2023 22:10:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aim7+34kmdpnPLquMdpMRc6Nsn2oyUjqA8iEUgrxtZ+pJCplXJw4CvoAGHv2L4HA1mNEUw3heDouacQ0q2ztldFJvCp2kVRGK7GYsGaD4BA99ZMksNM1OxNW7+TvDUp2Eh83A11WBHXCns4LSY3q8fboaHoG3yU1S6mJXVlEeW2swa+a7kYXE/WzyGJCMsbGxzf7rpY6bCpnHjbI9EvzxUOX/DOx9V4EyUWJnr/yeubBL4vX7YyvDwA+fSJjLWTlRl8QjH7DtP/ss7IigV0i3b5CNcHKlVSzYf9wT83eE7O6DXVdHb94ngTLXc4S1RCcU85HTBhmOVxR1yxYQmNcAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79WQMo1An+kEjfD00O/FIsavhTriaIzAE1XWuOS+3hA=;
 b=TOBsdNoED18bv+w/PUjLXmP1XEz13SIGIpYPuR95Jitc/AuWvA0X469zRrr0nGZMgPB4dLg/AgsxkdhZNkbLZxV6eIyHFMvYPVNA+SAD0SEnG5z77ke3GUnK6v8DpMSSvULGbHdL6ans3Nsje0J7FGryGmlbcasYlYJyvEmo1zNmp8YbWvpmqgyq8m0n90ESznegISB+RdFnVp4czxHu6mnUQOGyhVuDAeo3QZNQeUcQFxJK9a6YYYm9H3daMs05CbS2+cSnmq3zyeO/hZpTa88smvIcg+LzB6V6HaBZJxDkjxsghoyV6WaZ3Ephm+jsNhFundDK1F1VOodWoy8gmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79WQMo1An+kEjfD00O/FIsavhTriaIzAE1XWuOS+3hA=;
 b=TBwNzf3XKNPB7c8XLAMgR6IWsB7cuX7kJSU1iDUUJZfmsl4Gz/Tu4eSZU0xDha4VivD5Mn1fxvGD1aZopyL679vvtQyqk0f7mXf7Q1YT+8wHqv4+L7bn+p+IhOFoQ3oUPz6nY2vLe7OWsW2SGDUfs/ymPR/2vB9s3P27ZXotvH0Atcl3qQZ5GXGBirhMubpjeqHZ8H8GDmJs6qpELJTxiiLumnXTSCDOQxzKA+QkpQCWSmfwlm/Hqm06KK9oVhzVR6mdmv/MMPFmNPuKQbqsi3uX18XdzP7a5qj0n57WJLneVJj633Toc/LGAs9YV/cjWm5AYnFM3eP8efH9GsC/+A==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM7PR03MB6673.eurprd03.prod.outlook.com (2603:10a6:20b:1b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 22:10:06 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 22:10:00 +0000
Message-ID: <54621dd6-275b-fd9d-a158-6871f1a04fd1@seco.com>
Date: Thu, 24 Aug 2023 18:09:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
 <20230811163637.bs7a46juasjgnmf4@skbuf>
 <20230821124952.mraqqp7pxlo56gkh@skbuf>
 <a2e3fcad-9857-f1b3-8ada-efb2013a4bf5@seco.com>
 <20230821181349.hls6pukp5d6rc5av@LXL00007.wbi.nxp.com>
 <73d59dd2-88f0-3c1a-0de2-de2e050cba5a@seco.com>
 <20230821195823.ns55h3livxgol7fp@skbuf>
 <a66c9abf-5351-62b6-5573-cae38e6768e2@seco.com>
 <20230821224834.ppk4hmjyajupy7va@skbuf>
 <a4828cf7-9cac-286f-0aba-fcd1688c8422@seco.com>
 <20230821235917.mzawnkoi7oj4zgm6@skbuf>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230821235917.mzawnkoi7oj4zgm6@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:207:3d::30) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM7PR03MB6673:EE_|DB8EUR05FT015:EE_|AM7PR03MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: 810daba8-3d73-42e2-bed7-08dba4eee451
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  Xi8IaRb8efHNhChiX9wqVwb3hgrjvYpcIGB2Egp8N0XhCeqwAFxHdjm2C0w+nZgscwQfv0JxiJ2JcPxHRogAixlfyp1H7rvqHFm4z7qA5jWM5HZcmh1D1Y56qth0XnTRPvjtbCNDNSpZptJog0n4XeSAXsopBGH8SQUiFH+ECQbeUZu/qfoc9PEwOiaRtuh3JakXfClT8vjo03DgR555YXByDf7xNYBK56h9iidOna22Kg+EF1UMfmmkgtqKp42jp43/LiZUD1pmQgtmD5WrqhVWk5SQ+jy8DZbT31FSEO51WfT/0ytsSEqFfwlKnBsiptMv0IMPRh5BBR67FGuFmVJXzVVXG2CV1NPjJdSwljhW5az1Hp8HkhAje4VbFj/VGqP/fBUybHWv4EVha2hHQlsF5w9iUl2G80JO4U174muQF0O3e3ivq5i9T7JKbPXCxXBbvrF0N6k3dVqtQpPKUdIh4cLRTtPz8oEuil4mmCZrQgVTX3VEO7fR3KnCiPliZY2oD3TlqlHU9jAE/rZPZXx5CYagiTSXyJJsxjYfujAtiyZuMP9n/aTQthyMLFrJtiix7LbFRWphaMzwj19WZ7vW5Dwii0wXeJSDJP9u9TCdiTn9g16OlCUf12m8ERHlUOR/OLTMaL6jzQE+yhR5b/dBzmkI9nUJ/YuWwz5jRWIlSLHMlHXrAU/21PQiolKl
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(396003)(136003)(39850400004)(186009)(1800799009)(451199024)(66476007)(54906003)(66946007)(66556008)(316002)(6916009)(478600001)(26005)(6666004)(38350700002)(38100700002)(41300700001)(31696002)(6506007)(53546011)(6486002)(86362001)(52116002)(2906002)(6512007)(31686004)(4326008)(8676002)(8936002)(2616005)(5660300002)(7416002)(44832011)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6673
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT015.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	280fc6de-da17-4c96-83d6-08dba4eedb8d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Cr10FIPobyKAN3bFuwPu+idIZMqCR+e3lgWu1b24poVeBvyrfl/sm3qVKuM49452UH+NAHZMBZWdPypLyxttv7PsyQmsSUtpQrJxCkLNxGkSkeeCYChRskeyZYGxHC7y0UGgAVsq9u6MaLo1DcONIAtZLurxv6KrJ8ItdnyemA8N2dKhbM0LlfBqmpVY3Y/9F6HTdoBVy2NHt7sBqmlCRnyrHvADP1jt3EMq1KFCoGAAxCmhZVGXcsf5YqJBhHp/BPO1tUmCEVHer+LmqgBlDPRuKOz78BR/iPJc4xymCcPrwncH3HPdTK7e9XIV0nRFyWZN7Gh9bg2I8vtqojxMVPMhDQ3zqpK9ykAVqOW56fDO6y9tBhfGTw+Y3HGnL80PK+nSC7hK2sFjsrrpCG+s7RSJevhQNK9eIwD0xgxgNgenT0rmMuEYVswpY5gPDec8MgWVKAw0OzdZXbMhWsgx9kmocf2WWpgPFo2fExirkAlUIm805abtArpYpw5dKCl+LARp6jxb2uQymMRSm2ktm7mp4go69id1yx74c4I1HA9G9hFosGVkfxc5Io/6YoNYcLA8hMG1D2yyPYWZF2sfNdtn+2klkfK7wLStegT7qgKrCcH5ZlK6BQg/vGdsn030ltkqRVOAi9fI8Y8/p+rAQWilQHNO9BEyH7wNtUhNMlx0i7lh/aQUIhu4GNLZ082RBLYCtO2s/vc/+gOpTp8IG02Plux1qQca4F4qnqNAJQf4Kg4ZWZmvKJGEKH2qHCf4V/Yt4UFAnOJk4vZbAYftE1phoQcfrzVQbd8fwwBKvSC5j91OspwVY+709R0RbgZ/
X-Forefront-Antispam-Report: 	CIP:20.160.56.85;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(376002)(39850400004)(396003)(136003)(346002)(82310400011)(186009)(1800799009)(451199024)(5400799018)(36840700001)(46966006)(2616005)(5660300002)(34070700002)(4326008)(8676002)(8936002)(336012)(47076005)(36756003)(7416002)(44832011)(36860700001)(26005)(40480700001)(82740400003)(7596003)(356005)(7636003)(6666004)(70586007)(70206006)(54906003)(6916009)(316002)(478600001)(31686004)(53546011)(41300700001)(6512007)(6506007)(2906002)(86362001)(6486002)(31696002)(43740500002)(12100799039);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 22:10:14.2166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 810daba8-3d73-42e2-bed7-08dba4eee451
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.85];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT015.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6264
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
Cc: =?UTF-8?B?RmVybuKUnMOtbmRleiBSb2phcw==?= <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org, Camelia Alexandra Groza <camelia.groza@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/21/23 19:59, Vladimir Oltean wrote:
> On Mon, Aug 21, 2023 at 07:39:15PM -0400, Sean Anderson wrote:
>> Well, I think we should take the opportunity to think about the hardware
>> which exists and how we plan to model it. IMO grouping lanes into a
>> single phy simplifies both the phy driver and the mac driver.
> 
> Ok, but ungrouped for backplane and grouped for !backplane? For the KR
> link modes, parallel link training, with separate consumers per lanes in
> a group, will be needed per lane.

Hm, this is the sort of thing I hadn't considered since separate link
training isn't necessary for lynx 10g. But couldn't this be done by
adding a "lane" parameter to phy_configure_opts_xgkr?

Although, I am not sure how the driver is supposed to figure out what
coefficients to use. c73 implies that the training frame should be sent
on each lane. So I expected that there would be four copies of the
link coefficient registers. However, when reading the LX2160ARM, I only
saw one set of registers (e.g. 26.6.3.3). So is link training done
serially? I didn't see anything like a "lane select" field.

--Sean
