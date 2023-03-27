Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B3E6CAF4C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 21:58:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlkBb3mRsz3fV0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 06:57:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=umu3x1D/;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=umu3x1D/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0e::310; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=umu3x1D/;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=umu3x1D/;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04hn0310.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::310])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Plk9Z5sLlz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 06:57:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuAJCNux07RHgBnJpGno2yMpVhKiZSt8TefWL+PbKRU=;
 b=umu3x1D/qbEcL/ZciHrF9WyntOisu8TpsQKKwt05gBZ5cflZmhWARbxAIXAHgIQ5S1esHUefT76dtLOZdDKQZ7yFmXWmegtCyKbIGiQ6DyQIwV3oGVwzWBKeBrk8nwCK1rOMy2VQ2VNrByzd8vWJZi9qMyzagGcQsQx9gC8p8Gpz4cxXHw4N/9DaBFYaNmp2bBlUwPjMlirDtLnsaBMlJO/xIVZQKQ3sHOmUv+Or9cfDTzt/5CFWLwJOksNsEgoI1nhxUEiPpql4k1PUTqLv44E2W+xtl6SV8eCvs9ri7giB4DJvFP5dfzHjJwPYnvicsZtDXJXqjqevEpb+0ouNtg==
Received: from FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a1::13)
 by PAWPR03MB9738.eurprd03.prod.outlook.com (2603:10a6:102:2ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 19:56:44 +0000
Received: from VI1EUR05FT065.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:a1:cafe::a4) by FR3P281CA0093.outlook.office365.com
 (2603:10a6:d10:a1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.16 via Frontend
 Transport; Mon, 27 Mar 2023 19:56:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.83) by
 VI1EUR05FT065.mail.protection.outlook.com (10.233.243.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.32 via Frontend Transport; Mon, 27 Mar 2023 19:56:44 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id A034A2008026E;
	Mon, 27 Mar 2023 19:56:43 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.171])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id CD4072008006C;
	Mon, 27 Mar 2023 19:56:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biIvwNk5ueke9NB15QTqJclaw4N+qyXB75mVJakI8n8+V4ICbuX4hOd6ZBfDIalVcOjA4QpXekjTekpevJQZ0qHUFEY8qLE+ZLnh6a5iQrcioNiqE6P1yRbmK1mHAcE18U2URONSRFWgT1z6FJIUliaFCzMv1qHj7OsfT6T7qJXorxqw04/HLsDonmqqTd14WC8bbbkXVCP9NjwhqXka5dIID/BtkhnXy27Ba2ycAmFYPNLoXfY6YDZoLBZWQ+r3dgb16ZxcZwnTpfhJrRKUtsA1v++MZLj9U3+wE7yWa+LWPK8s5in5Z3A5jNFNzp3Bpad0t9aEb9GsW5xIi0cQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuAJCNux07RHgBnJpGno2yMpVhKiZSt8TefWL+PbKRU=;
 b=VspCPf7fr1HVjQaFzvLj+52ZYXFyV5lXAqKhEZQbv+rgrG4hxCjxzBu7s4cQ32mutPot2LWD/qO9713GEP6fxerl/E3hoP6GUlNGuKyfjOwSgbKgDXqSkEREhOm7PAMOv8jZtVdWhM7xqugUaXtO0OsCGzLguB5DdpsExWF0nH7tVvRaf3yqXJFiagV6XNf6kJEnTIsJSOMczmpL/KxjKiSvlg6WlZsKelFn7DtEj/3Nb1qAFZUf4yZVdEdCZ/bLlFY8bdW0XLALOdNh26RtlfgoxW6zPKAzIwMEX7n3M535H88aBJWuL4zMXgXeBH76B3x5JycneqIx/G552WWJlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuAJCNux07RHgBnJpGno2yMpVhKiZSt8TefWL+PbKRU=;
 b=umu3x1D/qbEcL/ZciHrF9WyntOisu8TpsQKKwt05gBZ5cflZmhWARbxAIXAHgIQ5S1esHUefT76dtLOZdDKQZ7yFmXWmegtCyKbIGiQ6DyQIwV3oGVwzWBKeBrk8nwCK1rOMy2VQ2VNrByzd8vWJZi9qMyzagGcQsQx9gC8p8Gpz4cxXHw4N/9DaBFYaNmp2bBlUwPjMlirDtLnsaBMlJO/xIVZQKQ3sHOmUv+Or9cfDTzt/5CFWLwJOksNsEgoI1nhxUEiPpql4k1PUTqLv44E2W+xtl6SV8eCvs9ri7giB4DJvFP5dfzHjJwPYnvicsZtDXJXqjqevEpb+0ouNtg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from AS8PR03MB8832.eurprd03.prod.outlook.com (2603:10a6:20b:56e::11)
 by AM9PR03MB6993.eurprd03.prod.outlook.com (2603:10a6:20b:2db::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Mon, 27 Mar
 2023 19:56:36 +0000
Received: from AS8PR03MB8832.eurprd03.prod.outlook.com
 ([fe80::6c3f:aabb:5e8f:6126]) by AS8PR03MB8832.eurprd03.prod.outlook.com
 ([fe80::6c3f:aabb:5e8f:6126%4]) with mapi id 15.20.6222.028; Mon, 27 Mar 2023
 19:56:36 +0000
Message-ID: <aa37e04b-95bc-c7f6-bda7-be83e97f5db1@seco.com>
Date: Mon, 27 Mar 2023 15:56:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v12 13/13] arm64: dts: ls1088ardb: Add serdes descriptions
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
 <20230321201313.2507539-14-sean.anderson@seco.com>
 <20230324131701.4ucxf65sxfdtqcai@LXL00007.wbi.nxp.com>
 <5ca4aeba-db2c-4c0c-c620-d380b4b839bb@seco.com>
In-Reply-To: <5ca4aeba-db2c-4c0c-c620-d380b4b839bb@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR16CA0050.namprd16.prod.outlook.com
 (2603:10b6:208:234::19) To AS8PR03MB8832.eurprd03.prod.outlook.com
 (2603:10a6:20b:56e::11)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	AS8PR03MB8832:EE_|AM9PR03MB6993:EE_|VI1EUR05FT065:EE_|PAWPR03MB9738:EE_
X-MS-Office365-Filtering-Correlation-Id: 828ebec0-9eb9-46be-6706-08db2efd63f4
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  GBq86owKPnBM+sQt+IWzQw8iqw34zpraDXTGAyobzMyJA++KfnlpPEt4FlDOCEWwDJ8Z+1+BmJCO1U/HkEp/fXu/eU4BF/vlNfKQezhjKhIZItIwFa80zNxSuCN8dzg5NqrgTkfZwek1lDRON41JYY6lL8uaFFV/rWB0INP1pFHNvTPs1Kvu9hFkhO7vh2FRL/h1WnRM40sI/HanGIw+MwjD1wq3lr6+Py8E70UPm01CH1KJxLch4t9egEA5AejVQ8T1kl3jdLRRfBoHVTFt2H2k8mCP6IHcwCiOA5AhxuY0I1Ne7ZgJIfpajuDBcTBLpZFNF6GM0LedGFCGqv8UbBFhIaPnYjkE1AapJGcXEicKEAQb/0sW8GNuzfWd3nU+J1zOrjP0ic1DJ9wxTRMU7a+LdjLBQAX/8I9fPgoDPXGTDkaxLjpgH4C+39OC0VEX3pmPpyHyoI/6tr7mLPiPoHKLtz5eTDLLXi7HOWXqqXpEKnSEhtOzq45k29PNe5fc0atepAKHeZbdD0rcvqC+LQ9aEwdzmhxeNCkLek+dmHc4w+Ad05//m4APdI3CaBTuO/2gBqXA8E5zkwlppBfY8SfGBK+7C5w3HvdxG9F9vcuLHalh2JUfOwRJdrR9uOdts9ODEY1ovAKpfOPWBwjzhPUsUnCIy008LjbmGvKlvNNavHLKFUHGWh/f4ciOTFmf
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8832.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(376002)(39850400004)(346002)(451199021)(2906002)(38350700002)(38100700002)(44832011)(52116002)(6486002)(8676002)(66476007)(316002)(66556008)(66946007)(6916009)(4326008)(41300700001)(36756003)(54906003)(5660300002)(7416002)(478600001)(8936002)(83380400001)(6666004)(186003)(31696002)(6512007)(6506007)(26005)(53546011)(2616005)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6993
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT065.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	92f3b425-7306-4d36-07a9-08db2efd5f2e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ljJuNnRgf7hjJEDJkUa0n980F+8OgMeZIZnp5el5N7wvy01vCdBdZY76FXC81IK/mFcoGLkRZ3oOxDMpCw+p3AqtagSI2k4pqD4uzXTg2tEaujqwtdCyTNV+OAp73S1wytgyVIQd3gHdaP3kp9Xua0LuzfFWxSqF9MJoAaxXuQujfpT3rxeqoRe4chFoqBJUxHxfZfb3RjoKp4bo0tubA+oK0oms+PMr4cbCv2BklUZdKbFV7J0AKOYhVYzdgqgR6tV0IzI5qtgPLlGy4IZg3RXmld+VhnJRO1kCRZPtk2/oFfYaExROWUOrAnQpKQSx8P1yZSabZtqEjlCnSyfIKack3ZAUaCroBaEBol8baEZjcoSO6PmVjSPiD5U+mAHJrM2UPmn9XVODvEGpWZVmhLtQtoC90Dgg8p4+sKzn7KzkLeiXEuQOh3CxvbnH52fsb824ZmBsTmw89iAUQGBfnSTGG5DMGL/VLLpv/uRHWaW5ZsWB2gexKM+IViq+rDof6X6CFqNfcQnQz6S29jrlD21q2fE6xIqcVnGNjBG355CjEIYFS3lsRI6raIaLitvliCls7GxWyHzbUViNnJJWvfbs5nOqYuxinf/MPeKx1JMVLrDfCUU7rBrvKnLK2GeQsdp1RNR80bt82eqSyTn2H7J1Y+B5sNM8tFvBXkjnxgFfQ+baZ9w3DoCGeqx4t7QIY1Wg03BnFIdEeV6nCsPj2FrFqy9lik8usu1/bfj2URdaIa7uvWehep11Wd/x+/mU43qQoJfSVePEB2UoBveUXZUruoClqUUMb0MEf4KXnSY=
X-Forefront-Antispam-Report: 	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(39850400004)(346002)(451199021)(5400799015)(40470700004)(36840700001)(46966006)(40460700003)(31686004)(6486002)(4326008)(54906003)(316002)(70586007)(70206006)(8676002)(6916009)(41300700001)(36756003)(356005)(31696002)(86362001)(478600001)(6666004)(2616005)(6512007)(6506007)(26005)(47076005)(2906002)(8936002)(7416002)(336012)(34020700004)(44832011)(5660300002)(82310400005)(40480700001)(7596003)(186003)(82740400003)(53546011)(36860700001)(83380400001)(7636003)(43740500002)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 19:56:44.0841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 828ebec0-9eb9-46be-6706-08db2efd63f4
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT065.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9738
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

On 3/27/23 14:15, Sean Anderson wrote:
> On 3/24/23 09:17, Ioana Ciornei wrote:
>> On Tue, Mar 21, 2023 at 04:13:12PM -0400, Sean Anderson wrote:
>>> This adds serdes support to the LS1088ARDB. I have tested the QSGMII
>>> ports as well as the two 10G ports. The SFP slot is now fully supported,
>>> instead of being modeled as a fixed-link.
>>> 
>>> Linux hangs around when the serdes is initialized if the si5341 is
>>> enabled with the in-tree driver, so I have modeled it as a two fixed
>>> clocks instead. There are a few registers in the QIXIS FPGA which
>>> control the SFP GPIOs; I have modeled them as discrete GPIO controllers
>>> for now. I never saw the AQR105 interrupt fire; not sure what was going
>>> on, but I have removed it to force polling.
>> 
>> So you didn't see the interrupt fire even without these patches?
> 
> Not sure. I went to check this, and discovered I could no longer get the
> link to come up in Linux, even on v6.0 (before the rate adaptation
> tuff). I see the LEDs blinking in U-Boot, so presumably it's some
> configuration problem. I'm going to look into this further when I have
> more time.

I figured it out. I forgot the dpmac2 was 10G only (no rate adaptation
for the AQR105).

And the interrupt does not fire on net/main:

# cat /proc/interrupts | grep extirq
 22:          0          0          0          0          0          0          0          0  ls-extirq   2 Level     0x0000000008b97000:00

Inspecting the phy manually shows the link coming up. By removing the
interrupt, the link comes up as usual. I wanted to look into this
further, but the IRQ goes through the QIXIS and the firmware source
isn't available so I wasn't able to do so.

If you'd like, I can try probing the signal (to see where the problem
is), but I won't have time for a bit.

>> I just tested this on a LS1088ARDB and it works.
>> 
>> 	root@localhost:~# cat /proc/interrupts | grep extirq
>> 	 99:          5  ls-extirq   2 Level     0x0000000008b97000:00
>> 	root@localhost:~# ip link set dev endpmac2 up
>> 	root@localhost:~# cat /proc/interrupts | grep extirq
>> 	 99:          6  ls-extirq   2 Level     0x0000000008b97000:00
>> 	root@localhost:~# ip link set dev endpmac2 down
>> 	root@localhost:~# cat /proc/interrupts | grep extirq
>> 	 99:          7  ls-extirq   2 Level     0x0000000008b97000:00
>> 
>> Please don't just remove things.
> 
> Well, polling isn't the worst thing for a single interface... I do
> remember having a problem with the interrupt. If this series works
> with interrupts enabled, I can leave it in.

Anyway, given that interrupts seem to be broken for some boards? some
configurations? I would like to keep polling.

> Did you have a chance to look at the core (patches 7 and 8) of this
> series? Does it make sense to you? Am I missing something which would
> allow switching from 1G->10G?

--Sean
