Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CD86CACDC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 20:18:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlgzB6CwJz3fXR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 05:17:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=JuD/er19;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=JuD/er19;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1b::315; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=JuD/er19;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=JuD/er19;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05hn20315.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::315])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlgxS4Qwlz3f6r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 05:16:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5mCIf4UrsGSlS80h/axn673IYQFpt/GkKUqplnMUHY=;
 b=JuD/er1926LU5hty17z8aPAaNkmOAnEh9gqHm3JDB3OcdwJ101TRoX1J9N53nYf0zaCoEXkhAPBsOIlZmzfazrcSOI6C62bHLXQv/DJqDy8w7bOEG+qEXQ0vY03LEcibIR4O11ZMqmIZzvDfJq/TabaCn9VPwcop1Ths/yKcX/sUH2jY8KvpkqlVWJRd8K1Ez99XYNvInjlTUWYCrnQipXlnvZTNyzNGcyERILdKVOU45zXBiKxaNLB4oUdrLMJr8GWxNXVSA8p7oas15WZhCHvEDrorCdvTIuPXhCDsJYgIilMvsK6HoRQSw2ZaHhAOUHNhnyeJaML66MW9vwshjQ==
Received: from FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a0::15)
 by AM9PR03MB7330.eurprd03.prod.outlook.com (2603:10a6:20b:267::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Mon, 27 Mar
 2023 18:16:07 +0000
Received: from VI1EUR05FT016.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:a0:cafe::1d) by FR3P281CA0173.outlook.office365.com
 (2603:10a6:d10:a0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.16 via Frontend
 Transport; Mon, 27 Mar 2023 18:16:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.80)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.80 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.80; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.80) by
 VI1EUR05FT016.mail.protection.outlook.com (10.233.242.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.23 via Frontend Transport; Mon, 27 Mar 2023 18:16:07 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id B58F22008088D;
	Mon, 27 Mar 2023 18:16:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.174])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 3267A2008006C;
	Mon, 27 Mar 2023 18:16:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWppf1xEuQWjocYDW4w6Mumd5Es506nrCRuLubBHcSc1aCUcwrFsiOeMhzWi+Lv6JnRPdr8yX30RqqPq8bOtVu5tl/lANxSMi5zXCzAlrmghMn4NeXnXG6+G3Eo2Db6Op6KVYrqppWKR2IH1wUJsDoUN4gIkv9i+gu/g5BgS97V8Ib3kJCwJEBziW1OJZtjLJu2AOOp+fkzA2pSZHWLZfBfoUn8zaOySKD9khSGPjS4GeKvrOfvUCAycsh/4hu+t65FjpWwm7Hlhf0T4bAxfl3Gy4mI2VWpyozxMVwhk/zwgJ4jBnbsUNDq0ppNwvGXNCMX6xRo89tXLgHFxclQVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5mCIf4UrsGSlS80h/axn673IYQFpt/GkKUqplnMUHY=;
 b=NqZbgMzoyH9abVwDuvc6bd5dSqcrYkw/3L2iFxzDbrwht3e0eg2XY894Ee0L6y91lgkaEGBVMBt86054KhrT2AUsCjVzuN4Qn7jTtHHdWDh/CNdgwY2rgnt8RyuozHT1z8Gl7hEjgA08Sf2WdNQaHKKtESFiH8rjdZXlqay9G4vWClecxtwkOPIn7HpIjNbH2paVKRDo/uMSvSAq6HuFrT8SESGYxYsioz+AFRdaNxbjtGRgigEf/bPuD/3kKb1Ir5+pnCdtQ534x/kOWuZKBTj/7xcWK7tVz0+noSgPQ32Q/jgTaSt/ErPSp+pdyYKGiSmU/5Pp29NHX1yWzazySw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5mCIf4UrsGSlS80h/axn673IYQFpt/GkKUqplnMUHY=;
 b=JuD/er1926LU5hty17z8aPAaNkmOAnEh9gqHm3JDB3OcdwJ101TRoX1J9N53nYf0zaCoEXkhAPBsOIlZmzfazrcSOI6C62bHLXQv/DJqDy8w7bOEG+qEXQ0vY03LEcibIR4O11ZMqmIZzvDfJq/TabaCn9VPwcop1Ths/yKcX/sUH2jY8KvpkqlVWJRd8K1Ez99XYNvInjlTUWYCrnQipXlnvZTNyzNGcyERILdKVOU45zXBiKxaNLB4oUdrLMJr8GWxNXVSA8p7oas15WZhCHvEDrorCdvTIuPXhCDsJYgIilMvsK6HoRQSw2ZaHhAOUHNhnyeJaML66MW9vwshjQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB9PR03MB7753.eurprd03.prod.outlook.com (2603:10a6:10:2ca::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 18:15:57 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 18:15:57 +0000
Message-ID: <5ca4aeba-db2c-4c0c-c620-d380b4b839bb@seco.com>
Date: Mon, 27 Mar 2023 14:15:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v12 13/13] arm64: dts: ls1088ardb: Add serdes descriptions
Content-Language: en-US
To: Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
 <20230321201313.2507539-14-sean.anderson@seco.com>
 <20230324131701.4ucxf65sxfdtqcai@LXL00007.wbi.nxp.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230324131701.4ucxf65sxfdtqcai@LXL00007.wbi.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0009.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::22) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB9PR03MB7753:EE_|VI1EUR05FT016:EE_|AM9PR03MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: fe82b9a1-abf2-4618-33b5-08db2eef55a6
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  eL8sA9D0GSJuj/xEltleaqd+CRRebl4FiwKLzQ33I48MEfiaVm+AYE9EMQBA6LDe2ranIj/jVDHaUNinPdyklvZxVk8u5l+PYQIeOZEgwQuiYn06IUjj+R4prq0/h7tFUjxT9Io6188rFcDBp0iaDB0Su0bULkcWJ5MfQK0UhS/pvVQPgYqOyndHBxAKmQ4T26GAeJxakYRaJy1UoPP265OSMdBNtQzerUHPqBN96OQCmjQFDL2jV/BnvBgB1XRiWqI66/zDpU0sSSptRyiKNeNXxKhKsdnUrfGWRA+rhvrUm8zMcNTQVLCtBiHNN4vHJnR7duMgzFiYtEvqono86FaXiv6ZnVfR1DCkmGg/UFiyYbB8zun169+FpEIdCRi54SFEIqQqKH2XqOupVXPp2/5mLL5hc3K0OzRFM3CzkRFZye+nbetw3odm2cS8eKycXIhdauh5WGqpFysLBR17rgevX2o5F43SFdyRPIgcr97Q1uaD34NboElW0IvOFJGv88423go7konjkDTAwqlPXRjghD91nijruXSkEofCXcbIIZsnm+SEakMHgMro37lTY1QeC6QHVNg1h/OSg7X2ZRybSY0ZwlH+DtNLEMS9K4+7mvS+rsKixSkXVTEedNZVqj9w2OYCtw6xtwJXJs5lDfU5i5YlPS3n15TWIRROdprqjHhyRXVI/UMDb2eNDF6l
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(376002)(39850400004)(366004)(451199021)(36756003)(31686004)(31696002)(86362001)(26005)(6506007)(53546011)(186003)(2616005)(83380400001)(7416002)(6512007)(44832011)(8936002)(5660300002)(6666004)(6486002)(41300700001)(6916009)(52116002)(4326008)(54906003)(38350700002)(2906002)(38100700002)(316002)(66556008)(66946007)(8676002)(66476007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7753
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT016.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	d2e2bb75-833f-46a6-a002-08db2eef4fc4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uvehHsiOehrApysy2z/Krtj9ApL2goKHKoUNaLSk7H9rGtTQmE7hdCYQiVGwgUZKTSZ8r1Ud7QXcRFtrLfKqksH5xfqMsWcV4SpDcus1lEVPs/n5khk4hEMUEqVyc+WLsaEMi5kNgQLDU0+pCSf7sQUOcVpDYiV6NsOL7g2/iDXUi57fxzt6MolBGM5HY7DwZINGLzNGr3fVNe/HbB1PDe+PSwEHt/cUuSLW71T075OYKy/jC2Hu3BaPIffqFs1MFNdtK/8H2PZIecAgPUfgO5tF2FRQbNLWeWYaJO2P7ToVqhEMyX/P9DY+pJtDHNp+yq3BXQYfkEtoAkY2Uzcnk3FJFgS32rLWY0wf671Hc+L6BNDX+iPbqBv4c2CW6pjw1OOy85dSnVO278022zcQxeVE3cLBMY213t4Kv3Y2H3Uk2GPBMrrgeWF2qPUa6LH7aE5B/oJtqD3pSaLvcK5xdpxLN40kN3PZ+vrzzajpqPHoCzhbSwT4hVWFcYSceMeepMhJbX6+1UESCWCJmf/7R0kIAcFjxI3ZWC53DRuNKoozZtpaunFHy5xXNkUcYXghPfzsfW6gitJzngqZ8W2rD/hSKCIu/WsNl4YGlp1k+iIUWL+MCYs2UEr2nlwEsXyHZ+6o1PwdYYtRP7IZOb5mjYRFDYvhD4RNYxg8/X6ib7oHfSSD/xuhDmaTdmLHVj19W9mAXcck4fzWf9FXk/YHFkaiVDDXeZlR1uc1NOTnjOdkhyw6CR4lWkF6TUklwmhlDeAA3jjX7pKmh8hEp+urjnkC370sEsbKiwjAUpx2Vfo=
X-Forefront-Antispam-Report: 	CIP:20.160.56.80;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(396003)(39850400004)(376002)(346002)(136003)(451199021)(5400799015)(36840700001)(46966006)(40470700004)(336012)(31686004)(186003)(36756003)(6506007)(6512007)(82310400005)(26005)(53546011)(83380400001)(2616005)(40460700003)(8936002)(8676002)(5660300002)(41300700001)(6916009)(70586007)(4326008)(70206006)(316002)(478600001)(356005)(7596003)(7636003)(82740400003)(54906003)(47076005)(40480700001)(44832011)(7416002)(2906002)(36860700001)(6486002)(34020700004)(6666004)(31696002)(86362001)(43740500002)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:16:07.0980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe82b9a1-abf2-4618-33b5-08db2eef55a6
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.80];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT016.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7330
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/24/23 09:17, Ioana Ciornei wrote:
> On Tue, Mar 21, 2023 at 04:13:12PM -0400, Sean Anderson wrote:
>> This adds serdes support to the LS1088ARDB. I have tested the QSGMII
>> ports as well as the two 10G ports. The SFP slot is now fully supported,
>> instead of being modeled as a fixed-link.
>> 
>> Linux hangs around when the serdes is initialized if the si5341 is
>> enabled with the in-tree driver, so I have modeled it as a two fixed
>> clocks instead. There are a few registers in the QIXIS FPGA which
>> control the SFP GPIOs; I have modeled them as discrete GPIO controllers
>> for now. I never saw the AQR105 interrupt fire; not sure what was going
>> on, but I have removed it to force polling.
> 
> So you didn't see the interrupt fire even without these patches?

Not sure. I went to check this, and discovered I could no longer get the
link to come up in Linux, even on v6.0 (before the rate adaptation
tuff). I see the LEDs blinking in U-Boot, so presumably it's some
configuration problem. I'm going to look into this further when I have
more time.

> I just tested this on a LS1088ARDB and it works.
> 
> 	root@localhost:~# cat /proc/interrupts | grep extirq
> 	 99:          5  ls-extirq   2 Level     0x0000000008b97000:00
> 	root@localhost:~# ip link set dev endpmac2 up
> 	root@localhost:~# cat /proc/interrupts | grep extirq
> 	 99:          6  ls-extirq   2 Level     0x0000000008b97000:00
> 	root@localhost:~# ip link set dev endpmac2 down
> 	root@localhost:~# cat /proc/interrupts | grep extirq
> 	 99:          7  ls-extirq   2 Level     0x0000000008b97000:00
> 
> Please don't just remove things.

Well, polling isn't the worst thing for a single interface... I do
remember having a problem with the interrupt. If this series works
with interrupts enabled, I can leave it in.

Did you have a chance to look at the core (patches 7 and 8) of this
series? Does it make sense to you? Am I missing something which would
allow switching from 1G->10G?

--Sean
