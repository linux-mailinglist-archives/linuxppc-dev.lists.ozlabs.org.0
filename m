Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA9A6EF6C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 16:51:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q61zS5Rw2z3f5j
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 00:51:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=dLaQixmj;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=dLaQixmj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0c::304; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=dLaQixmj;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=dLaQixmj;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04hn0304.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::304])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q61yX21WNz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Apr 2023 00:50:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RCvvvqGWAHX2xgldv1tqHtCETLtDEx4JsqyLWY0dGU=;
 b=dLaQixmjgq2SEG0ZRZv2JEX8mwR5zVnKi9yye08jYHBtQKLclV7PJfPnlpA9sktOO506gedFeCvq8P8T4vrDCkoptb3e1w+PeatRIcPgq5WttU48c7VgKYATFaC2aQdmSu4eRxsmplh+nVIm8Uny2CSu4m4GvipxoHDeoZl+Jzgb2FKc/7RZOHb2tDk7ZH9QYQzi7xkYdj9MnfmHGSFRsbjK/LwrsigU/mfTkp+BJWWo0JIobNmOIDpyKTnfqeTatj0PNeOIXSiYFqvvSvj/Dn5iyrJmzgxBW8XF5FgC7f3nAA+U69KipVthnKoYHqQmtl58xgO2kPdAoFz1qOjIBw==
Received: from AS9PR07CA0018.eurprd07.prod.outlook.com (2603:10a6:20b:46c::24)
 by PAVPR03MB9575.eurprd03.prod.outlook.com (2603:10a6:102:300::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 26 Apr
 2023 14:50:32 +0000
Received: from AM6EUR05FT013.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:46c:cafe::e1) by AS9PR07CA0018.outlook.office365.com
 (2603:10a6:20b:46c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21 via Frontend
 Transport; Wed, 26 Apr 2023 14:50:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.85)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.85 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.85; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.85) by
 AM6EUR05FT013.mail.protection.outlook.com (10.233.240.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.21 via Frontend Transport; Wed, 26 Apr 2023 14:50:31 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 1F2D120080089;
	Wed, 26 Apr 2023 14:50:31 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [104.47.13.55])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id ABE3C2008006C;
	Wed, 26 Apr 2023 14:50:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hycdqb643pEyDc7VmagSfoGmgD14YK98acuasCcNzyKsnSfWGQaIDBTtni8Z1MlNhAMVmArfWLeyMqWbUvshqVbs5wJk6L3XvcX09nN1x8j+YU3NpZcZLUhkhcy00R2Bwoj8+77+1twXZENgNG37fnAq0IsIX7DnFD7JH97jav/pbLhZ/GwiUl1NwEmDYP989JQG+FHHsJ5nhJuNe67BUhXjkli0oMngpo//6bLwxkPgsirtBsLzIyF2dvSIZvBibiBqgC/JBQtin561kiJ/5ShLX76XUbMWmOkJh6k2DHHlKYbfI/snLrvCaxfKO19zdtRGrMtnWoSRh9ycoJOLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RCvvvqGWAHX2xgldv1tqHtCETLtDEx4JsqyLWY0dGU=;
 b=Cb++wd0hrLukUzxDk382jMGpOKdgI85eDLulWLjTSTUlC8MfDyACV3iA5vmE5951H4L5j/eYFFcVTi5WK/dhmeYVqtQew28dTF57nSTs4BTqp1LYs2Qn+5aiIQIkayidiy22aYboEPszDcGah8oqb+wLJdMzYEAlrRPeyORWLn6d1KnPX/xTNkKftew5UHOpK8rfJkNzSGyswX9XlDO+IcaxyhPIAUSZGlBgqdOvvEATQifgk0s7ClMSBcnghQ+h20R8XNaiaJMyvV/d8v5JnbKL+0T+x480Oij2f8fFVl08hd4LeYorroDofaFCCtUfsjSu44jbyAm8wcLzsLIAfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RCvvvqGWAHX2xgldv1tqHtCETLtDEx4JsqyLWY0dGU=;
 b=dLaQixmjgq2SEG0ZRZv2JEX8mwR5zVnKi9yye08jYHBtQKLclV7PJfPnlpA9sktOO506gedFeCvq8P8T4vrDCkoptb3e1w+PeatRIcPgq5WttU48c7VgKYATFaC2aQdmSu4eRxsmplh+nVIm8Uny2CSu4m4GvipxoHDeoZl+Jzgb2FKc/7RZOHb2tDk7ZH9QYQzi7xkYdj9MnfmHGSFRsbjK/LwrsigU/mfTkp+BJWWo0JIobNmOIDpyKTnfqeTatj0PNeOIXSiYFqvvSvj/Dn5iyrJmzgxBW8XF5FgC7f3nAA+U69KipVthnKoYHqQmtl58xgO2kPdAoFz1qOjIBw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PA4PR03MB6784.eurprd03.prod.outlook.com (2603:10a6:102:f0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 14:50:24 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::d632:8122:75f7:7b0e%3]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 14:50:24 +0000
Message-ID: <7c7ab84b-3c4a-4e44-b5b5-4acf733a0246@seco.com>
Date: Wed, 26 Apr 2023 10:50:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20230425195002.fls5cmwolyrslpad@skbuf>
 <b7779674-c3ac-e0ab-3ca8-db1ec5953a97@seco.com>
 <20230426105140.t4yqv6irtjcwptm5@skbuf>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230426105140.t4yqv6irtjcwptm5@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0005.namprd22.prod.outlook.com
 (2603:10b6:208:238::10) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|PA4PR03MB6784:EE_|AM6EUR05FT013:EE_|PAVPR03MB9575:EE_
X-MS-Office365-Filtering-Correlation-Id: 227930df-01b8-41c7-cebf-08db46659585
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  tc+7L1MqjoXvGFmcrgE0+cI1WLFrnSzzt0GqS4C9NT82RXT/fOjXAK1T5/Ma/aBbR3OlcFF6q3S+wLi8zw2JlW/ocATAuth9WZ9MQIHQx7/yTHyEtgY/3mtXdTDsdUQNpMFPM0N1Gy2gIYjwDuGo3IT2P3eNHF5TOzD0GX6lptEeuDPBBu2xTNsJcS7oz1ocR8LR67uq4fnx/p7kfLhXJ/YaujR12+btnwymRV88KOEmewDLEvwTfDeHUaXgivpYUZxRaYLmdWbamj1VVBj2xq61R/lY5hSc0PJuiQtg3pi15G4YwnEhpLhw127X0s9saQE0l2X+z67OC+M8h/6J9Fm5vkLwf/+y57vyMnnUcPz8PkII49mIHcGtmt4g8NuTNjLGi98qbOIw6Rjv+0Nvzusjr7UzOwq+l5Ga7z0pEeUYiLRCNA/p3AlFNdB44Dytt5euDFFxOvmT0QUS/DNdccBinSKSbBuEi16pjjm9ZzxHNRc+EnhUkqGYk4SJN1hpvsDRFoSw0BhDqIPyFvFuw9ou4PZR36R9HCAFcnot+mNTRUbVL4t+ERzrbHUPMCF2RTxIiXEs1VFWeBvHNSvsvVFmpAfJZmrxZqdLz0crlE+jaefyd/iOl1pyu3t6IjDoNbAaCM3EsnHaJsjw+HpemW442VlPy7G88a36YGprimo=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39850400004)(396003)(366004)(136003)(376002)(451199021)(41300700001)(478600001)(4326008)(5660300002)(6916009)(316002)(83380400001)(53546011)(26005)(6506007)(6512007)(31686004)(186003)(36756003)(54906003)(2906002)(966005)(6486002)(6666004)(52116002)(8676002)(2616005)(8936002)(38100700002)(7416002)(66899021)(38350700002)(31696002)(86362001)(44832011)(66556008)(66946007)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6784
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT013.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	96d2e04c-8e02-41a1-31b0-08db46659126
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Maq+Kfs9RCGubErjZdcAUzp39ht1TegZoSB2vbbjRtzFfZBC8iMbfq7MOV0483xTky9xCrtLaYYgexJmu2K3ho4E6VV9HD3QDWXB2xupBE6ugjuvC/P31zMV/GNh4HOH0N1nGR8oCGRkqcxappv9yWCW7vj2BMOkXesYfnBAR8p+C5sT1oHIC5zKc15eYAEAC4NWEd+L9n6E3ZD9kYK1tMgVbK24JJTdsLRVg7t6VezUlBb/4T6OGePQS3UkCv1sZptU7VYPzln8gjvdAPiNWNk517UpzBblem8eKEUYAxvTuOWPw7dtdFkBNl3ZWFTphKIPAPST39TcVQBm0xo1UyBx+8pO66eoB+cq7KjMr1Q7v/d3UhCJ3ygSYjPjCpu8HhGTCrbmX6J5VXF7hejTKxBHyWyY02Zl+XUj30y/4AFGbCMw+P+7Kp7RODZStLxsWoDiNcasKgiBDw7GOCz/YfsNQ/emQs0DqH+NI453/J6Xzj/C3AbW5TSfrzG/yd6dHf2Qa8RqCrMFV4FBxoBkFPPpi+aA9DdbL7mIn6/Zxcu+YvNrDYhdgn2CuELDpjoRXMqIv56gdGYZ9F0nxBb4xo+Tr/6JQYhdHnCli0JuG7H0k0PTqNI3axMn6238Pk3lG+m3lhpu/tEZfPw7Olm+T3jyiWj+2p4cE7+8cZV8R0Yndu0Nlr0EaZwR5xcQjtNsmpcl813iUWPqh2UWfkDcmKCpZ4da1Wi1gsSwpXyUZyFfM/UHNi73SJxy2TymOwN+tiYb2ncng+XewstbhWKANQ==
X-Forefront-Antispam-Report: 	CIP:20.160.56.85;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(396003)(376002)(39850400004)(346002)(136003)(451199021)(5400799015)(40470700004)(36840700001)(46966006)(966005)(53546011)(6506007)(6512007)(26005)(356005)(40480700001)(336012)(2616005)(83380400001)(36756003)(34020700004)(36860700001)(47076005)(82740400003)(186003)(40460700003)(7596003)(7636003)(70206006)(31696002)(54906003)(86362001)(70586007)(6916009)(478600001)(31686004)(8676002)(8936002)(7416002)(44832011)(6486002)(5660300002)(66899021)(41300700001)(2906002)(82310400005)(4326008)(6666004)(316002)(43740500002)(12100799030);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 14:50:31.6804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 227930df-01b8-41c7-cebf-08db46659585
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.85];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT013.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9575
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

On 4/26/23 06:51, Vladimir Oltean wrote:
> On Tue, Apr 25, 2023 at 04:22:32PM -0400, Sean Anderson wrote:
>> The features which do not work (major protocol changes) are disabled :)
>>
>> If it would cause this series to be immediately merged, I would remove
>> KX/KR and 2.5G which are the only untested link modes.
>>
>> That said, PCS support is necessary for these modes, so it is not even
>> possible to select them.
>>
>>> If you do not have the time to fix up the loose ends
>>> for this patch submission now
>>
>> I have time to fix up any loose ends preventing this series from being
>> applied. However, I am not very sympathetic to larger requests, since
>> there has been extensive time to supply feedback already.
>>
>>> , you won't have the time to debug
>>> regressions on boards you might not even have access to, which worked
>>> fine previously due to the static RCW/PBL configuration.
>>
>> I have gotten no substantive feedback on this driver. I have been
>> working on this series since June last year, and no one has commented on
>> the core algotithms thus far. My capacity for making large changes has
>> decreased because the project funding the development has ended. I
>> appreciate that you are taking interest now, but frankly I think it is
>> rather past time...
>>
>>> I have downloaded your patches, and although I have objections to some
>>> of them already, I will be in the process of evaluating, testing,
>>> changing them, for the coming weeks, perhaps even more. Please consider
>>> this a NACK for the current patch set due to the SERDES related material,
>>> although the unrelated patches (like "dt-bindings: Convert gpio-mmio to
>>> yaml") can and should have been submitted separately, so they can be
>>> analyzed by their respective maintainers based on their own merit and
>>> not as part of an overall problematic set.
>>
>> This patchset has been ready to merge for several revisions now. I do
>> not consider it problematic. However, I do consider the (nonexistant)
>> review process for this subsystem extremely problematic.
> 
> To be very clear, the "larger request" which you are unsympathetic to is
> to wait. I didn't ask you to change anything.

The maintainers in this subsystem refuse to review any patches which have
any kind of feedback. I have been trying to get them to look at this series
for literal months. So saying things like "I don't like this series, have
a NACK" seriously delays the process of getting feedback...

> I need to catch up with 14 rounds of patches from you and with the
> discussions that took place on each version, and understand how you
> responded to feedback like "don't remove PHY interrupts without finding
> out why they don't work" 

All I can say is that

- It doesn't work on my board
- The traces are on the bottom of the PCB
- The signal goes through an FPGA which (unlike the LS1046ARDB) is closed-source
- The alternative is polling once a second (not terribly intensive)

I think it's very reasonable to make this change. Anyway, it's in a separate
patch so that it can be applied independently.

and "doesn't changing PLL frequencies on the
> fly affect other lanes that use those PLLs, like PCIe?".

This driver is not enable on any boards with PCIe on the same serdes. Therefore,
this is irrelevant for the initial submission.

> The cognitive
> dissonance between this and you saying that the review process for this
> subsystem is absent is mind boggling. You are sufficiently averse to
> feedback that's not the feedback you want to hear, that it's hard to
> find a common ground.

I'm opposed to nebulous 11th hour objections.

> It's naive to expect that the silicon vendor will respond positively to
> a change of such magnitude as this one, which was written using the
> "works for me" work ethics, but which the silicon vendor will have to
> work with, afterwards. The only reason I sent my previous email was to
> announce you in advance that I have managed to carve out a sufficient
> amount of time to explore the topic in detail, and to stop you from
> pushing this forward in this state. I thought you would understand the
> concept of engineers being unable to easily reserve large chunks of time
> for a given project, after all, you brought this argument with your own
> company...
> 
> Even if the SERDES and PLL drivers "work for you" in the current form,
> I doubt the usefulness of a PLL driver if you have to disconnect the
> SoC's reset request signal on the board to not be stuck in a reboot loop.

I would like to emphasize that this has *nothing to do with this driver*.
This behavior is part of the boot ROM (or something like it) and occurs before
any user code has ever executed. The problem of course is that certain RCWs
expect the reference clocks to be in certain (incompatible) configurations,
and will fail the boot without a lock. I think this is rather silly (since
you only need PLL lock when you actually want to use the serdes), but that's
how it is. And of course, this is only necessary because I was unable to get
major reconfiguration to work. In an ideal world, you could always boot with
the same RCW (with PLL config matching the board) and choose the major protocol
at runtime.

> https://cas5-0-urlprotect.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2flore.kernel.org%2flinux%2darm%2dkernel%2fd3163201%2d2012%2d6cf9%2dc798%2d916bab9c7f72%40seco.com%2f&umid=b7a538d4-355b-4a0a-bac8-26f0fa0a74c0&auth=d807158c60b7d2502abde8a2fc01f40662980862-e02727a0e4438c72b5e854cb20b9de5379470fd9
> Even so, I have not said anything definitive, I have just requested time
> to take your proposal at face value, and understand whether there is any
> other alternative.
> 
> I would advise you to consider whether your follow-up emails on this
> topic encourage a collaborative atmosphere.

Sorry, I was a bit standoffish, but frankly I don't think leading off with
"NACK, no feedback for you today" is particularly collaborative either.

--Sean
