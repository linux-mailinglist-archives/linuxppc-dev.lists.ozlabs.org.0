Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 266BC72C8B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 16:36:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Zuihk2O5;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Zuihk2O5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QfvQN6LrNz30fP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 00:36:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Zuihk2O5;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Zuihk2O5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1a::300; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03hn20300.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1a::300])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QfvPQ2JPpz304k
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 00:35:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaJWH/OuZgFe57gG+gllEceWdteSVqu7/EZZlytr+dM=;
 b=Zuihk2O5kK9sJAvA4ztNdJkjyiIOj4KSszfrgSDz8xUnOTv/HG3r8Vavk8RnPFRHHfK68uWTKcCLrs9mKcG7SCmqn5MDBkAG1BXpHB9VuIETnjKSVHbVB5dTEJyR/W4xr+PbQBM2QIaAKfatUl+ME81x52I1PxfNX57IbvfKXINgDrRhlBu5HMirfkIfzmT9qXgJp761E1aKkcpds1CLBWJ77eE5SE1y1RVKtCQ0ufwSziJZZyX3vJc0OqQgeCxrn49ASK60ZgnJt2yvGzHQSeVB990S6BQhkNOzEEe7s5M1tBVB1zuZVSU4fX/dUuJ8qXX++gF4AYuqFGRCCo0NcQ==
Received: from AS8P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::12)
 by AS8PR03MB8859.eurprd03.prod.outlook.com (2603:10a6:20b:56f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Mon, 12 Jun
 2023 14:35:33 +0000
Received: from AM6EUR05FT030.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::65) by AS8P251CA0023.outlook.office365.com
 (2603:10a6:20b:2f2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.33 via Frontend
 Transport; Mon, 12 Jun 2023 14:35:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.81) by
 AM6EUR05FT030.mail.protection.outlook.com (10.233.240.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.34 via Frontend Transport; Mon, 12 Jun 2023 14:35:32 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 7D7B820080092;
	Mon, 12 Jun 2023 14:35:32 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown [104.47.1.53])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 4049720080073;
	Mon, 12 Jun 2023 14:39:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SY+dA12UjoV7FhimJCktji9WRYXv076MSltAmCwerb5UFrwUfpfzRpbm/Yq5XOCcnW4DyxBRX+3hPZoQFTsJVmqhU3GELYCS1c181A+WgHnSavoWkoLiWLw1gn4hJNDl+T4BSl+H9bwim/9VnPexduLxPvu4q00RzfkmFsejDzASoaG2jzc4WQ8mG94wLowmovsfVU4PByoBGWDKh8bRfs+31H8uk/pxW04w53BnCKRegeTbqzkARj+7huUFs3l5QaHQVAhpHgOF6cnd+MwDlqAksEg82HtfHM5c/acdr2lIML5R0ZTB+FzhJ6utFWtv2DeP70csbrt3vwR+kQZQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaJWH/OuZgFe57gG+gllEceWdteSVqu7/EZZlytr+dM=;
 b=V58og4uqJuAl4XqGBfX3+vFZik/sPqF8xnzfRbNJ1N8lrUklNV3rWzV4eM9Fm/RiDSm4caBcvNHTEiSVLXMf7iFsYM+cdqcgxQxUAtZC4AiHBkbKEQaALCyicUAK87d80k+T7lvyNziHRVofoe+oFxdMBpdY5w6NdNVy8bREK2mIJg8IE/apV9+GyVVByEAZp/RAKvT+4cY1fR7jnyCDPfybczM3ZXJCwAeK3kn6T4VMMPD27oeIX4tbfnMRtGelfDufiQpDqkWyfQz2rID9t81wBYEiA+o8rJx6CsL3yrFVX0/01Q2sYrqa8O9eIL6vr+n0Zi8MEGZZMiEYHbyFNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaJWH/OuZgFe57gG+gllEceWdteSVqu7/EZZlytr+dM=;
 b=Zuihk2O5kK9sJAvA4ztNdJkjyiIOj4KSszfrgSDz8xUnOTv/HG3r8Vavk8RnPFRHHfK68uWTKcCLrs9mKcG7SCmqn5MDBkAG1BXpHB9VuIETnjKSVHbVB5dTEJyR/W4xr+PbQBM2QIaAKfatUl+ME81x52I1PxfNX57IbvfKXINgDrRhlBu5HMirfkIfzmT9qXgJp761E1aKkcpds1CLBWJ77eE5SE1y1RVKtCQ0ufwSziJZZyX3vJc0OqQgeCxrn49ASK60ZgnJt2yvGzHQSeVB990S6BQhkNOzEEe7s5M1tBVB1zuZVSU4fX/dUuJ8qXX++gF4AYuqFGRCCo0NcQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB7860.eurprd03.prod.outlook.com (2603:10a6:20b:343::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Mon, 12 Jun
 2023 14:35:28 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e%3]) with mapi id 15.20.6455.045; Mon, 12 Jun 2023
 14:35:28 +0000
Message-ID: <c702e2b6-cb0f-4ac9-86fe-a220284d45aa@seco.com>
Date: Mon, 12 Jun 2023 10:35:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20230425195002.fls5cmwolyrslpad@skbuf>
 <b7779674-c3ac-e0ab-3ca8-db1ec5953a97@seco.com>
 <20230426105140.t4yqv6irtjcwptm5@skbuf>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
 <20230429172422.vc35tnwkekfieoru@skbuf>
 <c81d23b6-ed22-0b37-d71b-ddce9d5d58eb@seco.com>
 <c2f928d2-25f6-0e31-9ab3-9d585968df1b@seco.com>
 <20230522150010.q5zndfwcuvrb6pg2@skbuf>
 <22a28a6f-2c84-a6b1-bb57-a269af34c993@seco.com>
 <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230610222123.mzmfjx7zfw4nh2lo@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0104.namprd02.prod.outlook.com
 (2603:10b6:208:51::45) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB7860:EE_|AM6EUR05FT030:EE_|AS8PR03MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 56fe191f-3c22-4406-034c-08db6b524710
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  6v7q6MU1Si8e20a55HhlWWCNbyg8aD1ZP7QrRzJ4wcyumEXKhlW/AH6HYWSPQPwc7hiTEopZF7zA8R1hPfGmC6pHyY56BEfWsRuJGLiMBpOe1XefzJHf2FA+x37p3hL2cn4YZupnO7agC38eCKA5ckOsmNtNlkUCQa6VSIc5NhZVUkGALclJRo6KlIQmw1H31ilZdyN1meo7sZXbfq1lYziQ26O6PmmR0iS9CxfZtVymPj8gx4BUtC+nyrSw4FAYFQ9m4UZMKMIEhDFioct4FZMvZrLZoZFFSmyohXZOgkvWRkfZK6fJi3HjnMOPvWvhpedUd71lsf/zx+804KrFjxPz/iiiw+ncbV8hbypo/PK3aCdPVFYda18cA7Ztq4U3xzE43CaxYi36m5ZY8e0O/Ny/k5vtURBfh1zlYRffUSyJ+/Vuk2zJLeSAv00lNc6ExGcJ6q3o12kMEiYSrP58MeFJJikZD1dOJFmOEe9wbkTWbKPzENFVGctZHN6Cv8195f2+8CBFk6aqGi5e82rOdAqqx0ixJ8Fd+JzLOIEAYpcXOiIbrGz+vjVQnkd5xX4xifWChOGiHOpr8Xn1L08sW07piD1RZddhTZ4Ts72nXn0iLZcHWtTsCPOIGMRlAu3fVTnrQE/6R7DEtpHwFWM42tZlZi8AAHbENSOAaUu+fcJkhGjXnT/yqZg1iRWj4Bjy
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39850400004)(396003)(136003)(376002)(451199021)(6916009)(4326008)(44832011)(66476007)(66556008)(66946007)(316002)(7416002)(31686004)(41300700001)(186003)(4744005)(2906002)(54906003)(478600001)(8676002)(8936002)(5660300002)(6666004)(52116002)(6486002)(53546011)(6512007)(6506007)(26005)(83380400001)(36756003)(86362001)(2616005)(31696002)(38100700002)(38350700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7860
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT030.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	e8ef41fb-616e-421e-3dda-08db6b524421
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4MOQWZ11aCucXZQWKW+6ks4cD8yJv7re6XBboRTMnCN8H5AgLtMX5zWN51uzGHR7BMWdNq7ZpnkbaypH/eLXnExDW1jpm84xCVcutBYw/F7FrEKy7KB8Hr4Uzp8o30QynFHg5LmTvcnuIKMpxk+OfpVnxFscIm9by+6RUek5VCRfu3BWEqrefzzyDVI5DLq0OPZVJttY6caQFm+TDtnpWa1HV4tj86zJ792akUH+X+bnbHadaNANslChH/A+ZBcYWzG6Uu4uZBRg/Z/yGUkhDx/g7IDyQr/bGLbs3AcThm8CrsddbdAq10vAGLWIvzl/54OvdR099w4BWcdiW9GA7/KFbtxexpLaKPtiRLvWiH925jN+DxWWNYukeKQt1Q2R9CPIp2zbj3UBz7Jem+BAygQguuRq8B01uB4e1BVFQevGALYrIAasCs32iNnUmkV0GaD5I1fpC37PlgrO5JiC08ycH69PvX/TOJFxOCEfACCuL1YP4xwwP9ZcB3f4Nm7ZkX8ddW+s9iuuD1f8g/bCnYq0apNQyxMNb/hELv2SKzvMSpg6LU3A9xksJ5hUsBABKkeD0UI9cZ7fB9VSWb5KwpJ0nbj7Wr8HGtY3+vV1ESQOaYBkG/aUU2dBKZMYdnIZZr2en6pK3sYrFnn7jSW2UDdlddM8AFvLN5g87nwjHED3SqzHJtAS0wel+yG5tkonm2sWHZAVbbfH8KgYdsijEj8vpioGf0bykzKgWDFOT667w+5PsOIFhwbHwqWPaEHc+ANsOiyJJ1yLWIQQ3OYysnkMYljEKsVvU2Cv6O+56E5bK7odqKve+e3b37J4JqGBB9G4hQi0m+SSYudVOZG/OA==
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(39850400004)(376002)(396003)(136003)(346002)(451199021)(5400799015)(36840700001)(40470700004)(46966006)(2906002)(478600001)(4744005)(5660300002)(41300700001)(44832011)(54906003)(316002)(8676002)(8936002)(70586007)(70206006)(4326008)(6486002)(7416002)(6916009)(31686004)(6666004)(2616005)(6506007)(26005)(6512007)(40460700003)(53546011)(36860700001)(40480700001)(82740400003)(186003)(356005)(47076005)(7596003)(83380400001)(34070700002)(36756003)(7636003)(82310400005)(86362001)(31696002)(336012)(43740500002)(12100799033);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 14:35:32.6310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fe191f-3c22-4406-034c-08db6b524710
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT030.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8859
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

On 6/10/23 18:21, Vladimir Oltean wrote:
> Hello Sean,
> 
> On Fri, Jun 09, 2023 at 03:19:22PM -0400, Sean Anderson wrote:
>> On 5/22/23 11:00, Vladimir Oltean wrote:
>> > On Mon, May 22, 2023 at 10:42:04AM -0400, Sean Anderson wrote:
>> >> Have you had a chance to review this driver?
>> > 
>> > Partially / too little (and no, I don't have an answer yet). I am
>> > debugging a SERDES protocol change procedure from XFI to SGMII.
>> 
>> I'd just like to reiterate that, like I said in the cover letter, I
>> believe this driver still has value even if it cannot yet perform
>> protocol switching.
>> 
>> Please send me your feedback, and I will try and incorporate it into the
>> next revision. Previously, you said you had major objections to the
>> contents of this series, but you still have not listed them.
> 
> And if SERDES protocol switching was not physically possible, would this
> patch set still have value?

Yes. To e.g. set up SGMII25 or to fix the clocking situation.

--Sean
