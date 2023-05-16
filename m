Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD71B7051BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 17:13:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLKW35FNbz3fDS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 01:13:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=LV3COoRS;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=LV3COoRS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1a::328; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=LV3COoRS;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=LV3COoRS;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05hn20328.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::328])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLKV81kYnz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 01:12:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4C57uS6igxBPemybcqYu1s1Oip14dQJY29vJh5Uzbp4=;
 b=LV3COoRSf77l3SYjQQtJF/yCTUgDuvCrPSOGSTBAkj5KCSFgMjsz4U9bUz6v6MCUALg866yA+eI8HKrLQ/fMNemdD2uRHTx19kzX6vIauowxZyv0FxO+PM7rqqic8kZEwue7RmUdAG62pc0qlIGdNlOIl33QPSe1Sa0T4yybqBsxZm6sR5fC3FUE6EDieVkgJCx+RcYtBL+E8atAZpkcXJvyW6SmNbGBCH+Pg/Sqa0YsnXw6w7G2RG9BztqRGBRlCsevDcpMwFXcj/hKghT+CcEXSJhdVjcHN0TzYci7Gk51eAoh0u/NBUYpI/+f9a6KDn0gD2Po8dt3VsIIFEDXHg==
Received: from DB7PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:10:36::32)
 by DB4PR03MB8657.eurprd03.prod.outlook.com (2603:10a6:10:387::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 15:12:09 +0000
Received: from DB8EUR05FT059.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::f9) by DB7PR05CA0019.outlook.office365.com
 (2603:10a6:10:36::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 15:12:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.81) by
 DB8EUR05FT059.mail.protection.outlook.com (10.233.239.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 15:12:09 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 441A620081128;
	Tue, 16 May 2023 15:12:09 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (unknown [104.47.11.108])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id C920320080073;
	Tue, 16 May 2023 15:12:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gB9C3OuA7IGQToNz5LEfwsTJrRJATtEEpzqaugi1kj2JJx0P6dc6K7eMj6Ps+YTryyPkwnS/eTaESUHJpv8Z3xrftCLx5onYEGRM1lkTcAXnX9cXoc15A7o0nYE5QqOuf39brFVbDsUHfiqTqMY0E2cmErgqWiQ7mLSIRJyBIMH9sI2YeX9TiaHcG+KCaKsudpDUMGUXGDvNfS6i1Lf3y312ilJdGf90qRRBG5ocQ2VljRciXExmqaFvYC/wINE6VJA/x95Strglnimqjh2Zdoqu8aHKL0vo5x9t1iKYWz8t5KPxywD32xLo+edccIQ1ge+YJU4i4nAy5XqOzmr0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4C57uS6igxBPemybcqYu1s1Oip14dQJY29vJh5Uzbp4=;
 b=Dc3rqGM5diM8YhVOCuo+74y9Yx/Pz1IyFMRVGc+DYOhakDPAthTDboJAecfRs6DWj8MoYBb7JA/tBbu5agVJxbM8oTiJs2+ABgDlCT7cGoiVu+UphJ+8tSnCmMgdl+dcXWPtYRiktUKviz0npJKKCD3MRDCX1MztZ7CujDcCpTG+sKhh8UCvuhjtQcWh0GGWdEjeIFmkvXkT9H5VXSufRIvMh2jw28ud8q36rCkNdvLhEmUooNDvn3LlpTGnBv1D2EmRnMbwE7aWdTTqE9y3whotsZohrnF2fPGShYDVO4Qv2DrVdIXXyNT343Q2icPfa5eMT7o+JCsK2d5d1tVRsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4C57uS6igxBPemybcqYu1s1Oip14dQJY29vJh5Uzbp4=;
 b=LV3COoRSf77l3SYjQQtJF/yCTUgDuvCrPSOGSTBAkj5KCSFgMjsz4U9bUz6v6MCUALg866yA+eI8HKrLQ/fMNemdD2uRHTx19kzX6vIauowxZyv0FxO+PM7rqqic8kZEwue7RmUdAG62pc0qlIGdNlOIl33QPSe1Sa0T4yybqBsxZm6sR5fC3FUE6EDieVkgJCx+RcYtBL+E8atAZpkcXJvyW6SmNbGBCH+Pg/Sqa0YsnXw6w7G2RG9BztqRGBRlCsevDcpMwFXcj/hKghT+CcEXSJhdVjcHN0TzYci7Gk51eAoh0u/NBUYpI/+f9a6KDn0gD2Po8dt3VsIIFEDXHg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7396.eurprd03.prod.outlook.com (2603:10a6:20b:26c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 15:12:01 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 15:12:01 +0000
Message-ID: <7ad1089f-106d-e355-5558-f06f8b428f34@seco.com>
Date: Tue, 16 May 2023 11:11:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v14 06/15] clk: Add Lynx 10G SerDes PLL driver
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
 <20230413160607.4128315-7-sean.anderson@seco.com> <ZFi9t84UoIfUyHhi@matsya>
 <1012f955-180e-0013-cc13-1da10991b5f5@seco.com> <ZFpD4I2LK9YIQQat@matsya>
 <d230c641-7270-c768-fd48-9012c01621b2@seco.com> <ZGODpt7MARD47us7@matsya>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <ZGODpt7MARD47us7@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::7) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB7396:EE_|DB8EUR05FT059:EE_|DB4PR03MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: b5996450-0cca-4460-7379-08db561feb62
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  RHnaZEFmETnnbfcpluhQotDD3hf7ROT5S+8vcLhrJppGP+2yTMeaDcTO/pcwn+3G3OwYv6yzc4KyXXaZt+/hYt268Yuq2egGmmBbsmgLwmHfhmUO2fOwzE193TIBg05PEvCngN8Q3+Yu/RKUdHf4XA47/AORGcBcTH3pKT/hanE5FJUzaio65Z+ZU0giq56mqpspMCWU9HfJuc+H+VrTqsb0PwC875g4xvsQsrcpMahxuafck/pcpXV++nM+rVFE+/FA427F/ifKlbKLw9pFh01VrbSTcU8JiA5N4PDZuOFe5o1Tp7iBxBh5hvdV4KyJPgXp92+oPvY7eVbiwV44kc/n2475w+/4Y0wRisHPzkNr3WStaKo47OSkpallPgKCYU4F8lKFJxXoDSYJ1Szs+clkEMsGsSYalCTcdFw8pnydBLcuAoVQClVDcaPT3/bLMeAuDJ7jPKUFQVNBsnrhABvPFqq8fPEnvkLlaZ34TQljpp3HuuEltWxsXaFrMp5yQ4T3vthLofjDnUCZoFGjiISpvVXrgGuHsWh8MBNzsosKtYLrccTFjEXEXz4sJQXNH8VqTYJ7OS0TT2OYLEsxKyR8vs2q1qtgp7NiiD3mTVkCQaGbfNyHu0neEbPH3PaTG55O5okwPTPfdw/myPsKjtLHVjAx6CuRR+TiqxFoNqI=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(39850400004)(376002)(451199021)(2906002)(478600001)(41300700001)(316002)(54906003)(44832011)(7416002)(6666004)(6486002)(8676002)(66476007)(66556008)(4326008)(6916009)(66946007)(5660300002)(31686004)(8936002)(966005)(6512007)(6506007)(26005)(52116002)(53546011)(186003)(83380400001)(2616005)(36756003)(86362001)(31696002)(38350700002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7396
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT059.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	ec6c67cb-c25d-4f8b-33d3-08db561fe686
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4IxorGfVblbVSjJ6FHa+xc66Y+5tRvMbrEBh0oFQIDUH6M3FRjLQgA5TQoM45dSJdContnvppxM7lurlpCExzSxz2jkwykr9In5oxCa5PJfc3XzRBW6XkC5wxavYf69ZcyLLU2wDaiQe+mPyGZbYG4VfPRW0/j2H/mLDwMS6G5U/J+A+OnievSW261eHhNDxW52yF1P/qO1/5hZbL19khbChFwMS3dIWCPYZOYcvQ1wK4EMLcGmYdSq6Z5+QEzWX1xME8+HAgb/ZYLJ/jWuuVNGdVdIaDu/xFZwA7AqbgqlZa++a5PDfsKyToN4cHuVJQy7srsGK8WF8zXVll6jeYJFRRMljl+kcIW//FgX4qkG4dvW/RNWTDsZGPsRM70CVz9IwZ3cqcSYhV4LibmjfGTPj23C8skMgykG8nj7lZcLFAqUR3bD41d3alnPRNzEk+HEdBUEDPD1PaADk/IyYjYF9Ptzk4ett+2ndBmdq9dJToHWruZDKdT9GNouxATScZtjE/xdVVodmiGY+b6pNF8CZg95YTF2Nuj92FEDhzKk/J9nO8hTZraKK/qXhfbQH4rnIMCBquyjYPzU/EjHPKkiJm1xVlkYWcLO4pImt5GVCxGCNGHXhfpLt5urSEpE+TDTivV4MJRhhjxHqsW6ffq5/KSFENEd/D3AdPW5prqW1sFfm0zAD957PD5dcyn/k2QlnXRdAmU5rMaD//f1iY2b+Qmy5jO1mSFhwJrPI4Qp3JPJ0gZOvMGr/aaABfCKEOkSYxW8uZGqe4M0p/9gTSw/0rwcvLpuXt1ZuQcfGoG0=
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(39850400004)(396003)(136003)(346002)(376002)(5400799015)(451199021)(36840700001)(46966006)(36756003)(54906003)(966005)(478600001)(6916009)(70206006)(4326008)(70586007)(316002)(86362001)(6486002)(83380400001)(82740400003)(82310400005)(40480700001)(2616005)(5660300002)(8676002)(7416002)(8936002)(6666004)(2906002)(44832011)(34070700002)(7636003)(31696002)(356005)(7596003)(41300700001)(36860700001)(6512007)(186003)(53546011)(6506007)(26005)(47076005)(336012)(31686004)(43740500002)(12100799033);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 15:12:09.5348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5996450-0cca-4460-7379-08db561feb62
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT059.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8657
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

On 5/16/23 09:22, Vinod Koul wrote:
> On 09-05-23, 11:26, Sean Anderson wrote:
>> On 5/9/23 09:00, Vinod Koul wrote:
>> > On 08-05-23, 11:31, Sean Anderson wrote:
>> >> On 5/8/23 05:15, Vinod Koul wrote:
>> > 
>> >> >> +int lynx_clks_init(struct device *dev, struct regmap *regmap,
>> >> >> +		   struct clk *plls[2], struct clk *ex_dlys[2], bool compat);
>> >> > 
>> >> > so you have an exported symbol for clk driver init in phy driver header?
>> >> > can you please explain why..?
>> >> 
>> >> So that it can be called at the appropriate time during the phy's probe function.
>> >> 
>> >> This is really an integral part of the phy driver, but I was directed to split it
>> >> off and put it in another subsystem's directory.
>> > 
>> > That is right clock should be belong to clk driver. IIUC the hardware is
>> > phy along with clocks and you are doing the clk init. I think that may
>> > not be correct model, you should really have a device tree node to
>> > represent the clock and the phy node
>> > 
>> > 
>> > What stops this from being modelled as it is in the hardware?
>> 
>> It *is* modeled as it is in hardware. With just the serdes compatible,
>> we have all the information we need to create the clocks. So we do so.
>> There's no need for a separate device just to create four clocks.
>> 
>> These clocks cannot be used by any other device (except possibly by
>> putting a lane into test mode). So there is no benefit from making them
>> a separate device, except an increase in complexity due to ordering and
>> dynamic lookup. By doing things this way we know that either there was
>> an error or the clocks all exist, and the lifetime of the clocks matches
>> the serdes.
> 
> Okay that does makes sense.
> 
> In that case why should this not be in the phy driver itself. There are
> already few examples og phy drivers having inbuild clk where is makes
> sense. You register the clk_ops as part of phy driver

You told me to do it this way

https://lore.kernel.org/linux-phy/YsW+4fm%2F613ByK09@matsya/

--Sean

