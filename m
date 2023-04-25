Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C486EE8FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 22:24:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5YPD42MDz3ccg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 06:24:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kmJj7wkk;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kmJj7wkk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe12::32e; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kmJj7wkk;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kmJj7wkk;
	dkim-atps=neutral
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02hn2032e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe12::32e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5YNH5QLYz3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 06:23:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A35MjgsPAR019rLosEKIlnYK8D1ulr8c9+RAkS+2t3Y=;
 b=kmJj7wkkDPNlUFZV7AZQDjUBTU1uKIiOjF0mDAYhtSitZnbtLn4kjiAo5vT9blucnlIKRprKUYCs7UU8o4/Y0DMWbtx0HE2HwReMXpLoiN5tZ81RUtw+wEzzH0KispkIy9r1sNg0xx0uY0DzWT92Jh7QUx4qNdW72phpa8mEYLGKDbJZfZAbYIKgArPm4iCfZCv+sp6spUgLi2HvfuiIk30YyBjID4lbMW7Q5I7GJdEKsEt0fg8p1MelknQ9bQbNSozqE5tcv854DqfPvg3ENrHQUTAoFCLQq+I/axoWHo+gXLnoQuvcGR0+EL7AVELi73nMJ6aANv7icBnauEPekg==
Received: from FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::11)
 by GV2PR03MB8777.eurprd03.prod.outlook.com (2603:10a6:150:c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.49; Tue, 25 Apr
 2023 20:22:47 +0000
Received: from VI1EUR05FT026.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:49:cafe::74) by FR0P281CA0063.outlook.office365.com
 (2603:10a6:d10:49::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20 via Frontend
 Transport; Tue, 25 Apr 2023 20:22:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 VI1EUR05FT026.mail.protection.outlook.com (10.233.242.175) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.21 via Frontend Transport; Tue, 25 Apr 2023 20:22:46 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 5D52420080086;
	Tue, 25 Apr 2023 20:22:46 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown [104.47.13.52])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id CA5572008006C;
	Tue, 25 Apr 2023 20:22:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ukp6s2IO4MbJ8xz7ome9ua4kNpjHvYFqj7tXImcpqQZ+0syw2vLBA8J4A1UYBDoLdC4MadpVYXYZ8SigFCAWH/+2AkKzHjp+oqIYLvoVcQFHoB0bzpAGnOBkP2NnjGOqz35Vrrw6TaYADDYExPc8Vz2u9yjNE6+l1Pn1uMt6nwNvDN+VNAYblY8fxQVH2V1wlfRSVkYV7762eNAAtbnlcgqZ0xIE0OxWgHcDZ/vrmYAtom6QgQu3p3WkAsXY160B4WOXMpcFur8sX/vRb+dhQQpiLIwVXm2L7qoZ3coHARXjvR5rd5lmXohr9OJ3M5UT+GTv/sMXd6VxSjfrsWsZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A35MjgsPAR019rLosEKIlnYK8D1ulr8c9+RAkS+2t3Y=;
 b=BQ98W3Uyx0iPfEmTqetk2BIkczn1ipFQeFggMTxQTOAMLz14KU4cglQxkdzERNFrulQVFqr0ltXfDclmYejhfan5io2r408d+d+lnIxa10DtNQEj7JhNx0FWEIEM0+ysSSqn/zYyxi7qKmzWiruR3tmssi7vGaY9NE1yB2hzApMb4AakbyK9rZhJPBDNegM1C/IfmnR4soDdmeEUpESclye9yoDD78d8wGCtZOMnjkgExRas01NB0MQiq5CVmv66gLL7S1hTREeKziJOZcHpcWQ2J9Khm0G7j42LvXTRzsqwFVbFrXM+wdBtM2aIAoYRoCHS13N18lTRSucBsefFZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A35MjgsPAR019rLosEKIlnYK8D1ulr8c9+RAkS+2t3Y=;
 b=kmJj7wkkDPNlUFZV7AZQDjUBTU1uKIiOjF0mDAYhtSitZnbtLn4kjiAo5vT9blucnlIKRprKUYCs7UU8o4/Y0DMWbtx0HE2HwReMXpLoiN5tZ81RUtw+wEzzH0KispkIy9r1sNg0xx0uY0DzWT92Jh7QUx4qNdW72phpa8mEYLGKDbJZfZAbYIKgArPm4iCfZCv+sp6spUgLi2HvfuiIk30YyBjID4lbMW7Q5I7GJdEKsEt0fg8p1MelknQ9bQbNSozqE5tcv854DqfPvg3ENrHQUTAoFCLQq+I/axoWHo+gXLnoQuvcGR0+EL7AVELi73nMJ6aANv7icBnauEPekg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PA4PR03MB6750.eurprd03.prod.outlook.com (2603:10a6:102:ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Tue, 25 Apr
 2023 20:22:39 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.054; Tue, 25 Apr 2023
 20:22:39 +0000
Message-ID: <b7779674-c3ac-e0ab-3ca8-db1ec5953a97@seco.com>
Date: Tue, 25 Apr 2023 16:22:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20230425195002.fls5cmwolyrslpad@skbuf>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230425195002.fls5cmwolyrslpad@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR1501CA0028.namprd15.prod.outlook.com
 (2603:10b6:207:17::41) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|PA4PR03MB6750:EE_|VI1EUR05FT026:EE_|GV2PR03MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: 995e07b0-2d74-485f-4953-08db45cad56a
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  +svtPfkN2XXYlJReU7gCXmA83F/KAX2qtgwa7z6GnkLJQ8SsQU0m3WWh33RyiYUSNOXK5INztB4fjy11Een3/BIKYU21SmRwVTx/7J8IpESga5hq4J2+a/eyYPPw1a1Y1Fgj48ICvK94MHw767n0YJ61aX/w3Oj9dZK+LAnyoUN/2cyGWNoXa/qzmKh6iCDI4sgL83xKJ/OY/x1td9EeDXl93Ys3wtJ3ha0NSE+9cVGb5NSpKufExXr1O6ZCrEbORhhSFraW7xHSG1VqOpR17V8DcCj2Z/zkm733fsOIsiemsDLywZIVClm8ddvnYCdysK4WTTTMtvCi5ASJMjxz4Q10qU0fhSvlOr9b/UZXNuddXhegG6prOKKVBt9aCpBX5UF5XhcOPMcmk1gcSUMvfLOw72CxZsox/fnmQyOcz9fHraM6dF6bRhYilNrvxpcyTsRmUq7Gjz2qb82h4H0alLDmyWB/Zaw6fu2prMk1eZWqLSkhN5NDUE+dKDdUu19znVPhCNvVrgDzxnTqkgnN0DcXSI7iYp/7sRG2lxVhSnxZzPqTdmaYbgEiC0gzDWIiQmgbVvH04+OZUdx3/0YxwWqenC3o2j4r0uhkhvqo9v9kvfLKt/sVw8nZrFFhk0QvRDickIctW96tcZR1cmHHXNktRvFJeIYZ49sGenuYX8DQFdOc28n0Oym+S87o2mvr
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(346002)(376002)(39850400004)(451199021)(83380400001)(52116002)(6666004)(2906002)(478600001)(54906003)(44832011)(5660300002)(41300700001)(316002)(8936002)(8676002)(66556008)(66946007)(6916009)(4326008)(66476007)(7416002)(31696002)(86362001)(38100700002)(38350700002)(6486002)(36756003)(186003)(6506007)(6512007)(26005)(53546011)(31686004)(2616005)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6750
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT026.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	f4cdf33a-9348-4d92-db32-08db45cad09d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7yRa+hc2luBLA3LZdw2Gk2LEuOsulK2q3eJsaGjN6AmnsYgLabVwbS27YZI2Sfq6b3Z88YyXCIJUIFXyYoAA5Vd4aoAWWNWNxymJJ4CWKPujURQ1/TgL2t3TZfVL2XR6C8mEbPDQOxlJE3pHGZDdtD6DyHSv+4muPNVCuckMOstME8I+vib++6ui0MTCxK5AZIxwP+jr24BnZglxSZO8JiQf/TqLzglAfSXGM9fcSAGNSJBhedYAIQhDxK2HadnmLN+ZLXFIRd7n89ciDldbFMz3Kz8m5WWxrSMPvDJHZtkzucA2bO7gGcyymDjL2DQ/a1fJZL4GWHQRFhRhkC5TKBmgCEyETpw4Kp7eOH8kGFBmoXlg4Zpfj0BkStbxNn7kdrg5tsveEauk0DNPtHD1+fhqitd8WHbRadszjIj1hux2NGYDqQaSHpstfOhDJZWc1tkAzLghJWGW42INOs8q+DSxQ/dxo1Tcvamo5kPegowpAWhiZ4w7Ba3f92ph/fW0raTvhkgyMvAx3KFAnwPGhZEJt2fCfbJnpvtaRTsZhbKmA04jcd774KFm9B7hswEnt3zF+lsK1BD3HZEg//PZVodu7TxwtrSdOUXw3RIxEF4wlzVkUwdQS8JjiMem56fRZtGeGXM0VaE4dmbZTgowTQKByd0uOqoZnB0VgdLTOv3a4GyrZ9gh3RLT2B1aVZZ0eHldmpjOIxaDUew4dJsMgaESIQd1VXPcH/24RWT+0sUzaku+RKhhav7ha7J+oPqYq1/py8fFrlVT05RJeDr+Q+cMJ5M+/9UhKFOisAQK6PA=
X-Forefront-Antispam-Report: 	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(39850400004)(376002)(396003)(136003)(346002)(451199021)(5400799015)(40470700004)(46966006)(36840700001)(31686004)(83380400001)(47076005)(2616005)(36860700001)(6506007)(53546011)(82310400005)(6512007)(336012)(26005)(36756003)(478600001)(6666004)(34070700002)(86362001)(54906003)(31696002)(6486002)(41300700001)(316002)(7636003)(70206006)(356005)(70586007)(4326008)(7596003)(40460700003)(66899021)(8936002)(82740400003)(6916009)(40480700001)(8676002)(186003)(44832011)(7416002)(2906002)(5660300002)(43740500002)(12100799030);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 20:22:46.8342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 995e07b0-2d74-485f-4953-08db45cad56a
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT026.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8777
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
Cc: =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org, Camelia Alexandra Groza <camelia.groza@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/25/23 15:50, Vladimir Oltean wrote:
> Hello,
> 
> On Thu, 13 Apr 2023 12:05:52 -0400, Sean Anderson wrote:
>> This series is ready for review by the phy maintainers. I have addressed
>> all known feedback and there are no outstanding issues.
>> 
>> Major reconfiguration of baud rate (e.g. 1G->10G) does not work.
>> 
>> There are several stand-alone commits in this series. Please feel free
>> to pick them as appropriate. In particular, commits 1, 3, 4, 12, 13, and
>> 14 are all good candidates for picking.
>> 
>> - Although this is untested, it should support 2.5G SGMII as well as
>>   1000BASE-KX. The latter needs MAC and PCS support, but the former
>>   should work out of the box.
>> - It allows for clock configurations not supported by the RCW. This is
>>   very useful if you want to use e.g. SRDS_PRTCL_S1=0x3333 and =0x1133
>>   on the same board. This is because the former setting will use PLL1
>>   as the 1G reference, but the latter will use PLL1 as the 10G
>>   reference. Because we can reconfigure the PLLs, it is possible to
>>   always use PLL1 as the 1G reference.
> 
> I am an engineer working for NXP and I have access to the majority of
> hardware that includes the Lynx 10G SERDES, as well as to block guides
> that are not visible to customers, and to people from the hardware
> design and validation teams.
> 
> I have an interest in adding a driver for this SERDES to support dynamic
> Ethernet protocol reconfiguration, and perhaps the internal PHY for
> copper backplane modes (1000Base-KX, 10GBase-KR) and its link training
> procedure - although the latter will need more work.
> 
> I would like to thank you for starting the effort, but please, stop
> submitting code for modes that are untested, and do not submit features
> that do not work. 

The features which do not work (major protocol changes) are disabled :)

If it would cause this series to be immediately merged, I would remove
KX/KR and 2.5G which are the only untested link modes.

That said, PCS support is necessary for these modes, so it is not even
possible to select them.

> If you do not have the time to fix up the loose ends
> for this patch submission now

I have time to fix up any loose ends preventing this series from being
applied. However, I am not very sympathetic to larger requests, since
there has been extensive time to supply feedback already.

> , you won't have the time to debug
> regressions on boards you might not even have access to, which worked
> fine previously due to the static RCW/PBL configuration.

I have gotten no substantive feedback on this driver. I have been
working on this series since June last year, and no one has commented on
the core algotithms thus far. My capacity for making large changes has
decreased because the project funding the development has ended. I
appreciate that you are taking interest now, but frankly I think it is
rather past time...

> I have downloaded your patches, and although I have objections to some
> of them already, I will be in the process of evaluating, testing,
> changing them, for the coming weeks, perhaps even more. Please consider
> this a NACK for the current patch set due to the SERDES related material,
> although the unrelated patches (like "dt-bindings: Convert gpio-mmio to
> yaml") can and should have been submitted separately, so they can be
> analyzed by their respective maintainers based on their own merit and
> not as part of an overall problematic set.

This patchset has been ready to merge for several revisions now. I do
not consider it problematic. However, I do consider the (nonexistant)
review process for this subsystem extremely problematic.

--Sean
