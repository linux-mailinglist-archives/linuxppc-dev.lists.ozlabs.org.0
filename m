Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCECA78366D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 01:40:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=muak5aDn;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=muak5aDn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV89v4DRQz3byP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 09:40:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=muak5aDn;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=muak5aDn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=52.100.201.219; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02hn2219.outbound.protection.outlook.com [52.100.201.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV88v4Fq4z30MY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 09:39:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oahO7ANpxwFA56gPpKLgLJH4mf3XafYuf97UNcUVCk=;
 b=muak5aDnc2Z8a7EnHbCdNSRaxSL5lKNlLu23QylZl0oUajfKFeFKJPD64RO4qsKo8F8gQEJ8j/Q5UsRId4kkZP/hVnQnyNVvuECew+FFl5wP5hwTzp83Ci3/gkDWax/+UoxrXpUvg9nNFmJU9juYutJ9ULWC+zLZNWk8PeB1iq22T97GLl8uapQ7v4uAyLIAJKeLs6sDtiH9m00s1DTv7fZuz17QDtEAeDfSj6qAeFu4QCAgGhYTeAd62Sk8R1Lf7Y1x2BDph9ME/XamxYw/xq9Zg4+GNzRpFTCeWxaYVL2A9yF69cjXvGPbjuV5apf7To19211+qtHf9nknUYhRDA==
Received: from FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a5::17)
 by AM7PR03MB6279.eurprd03.prod.outlook.com (2603:10a6:20b:133::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 23:39:36 +0000
Received: from VI1EUR05FT006.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:a5:cafe::1) by FR3P281CA0205.outlook.office365.com
 (2603:10a6:d10:a5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Mon, 21 Aug 2023 23:39:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 VI1EUR05FT006.mail.protection.outlook.com (10.233.242.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.14 via Frontend Transport; Mon, 21 Aug 2023 23:39:35 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 406A120080096;
	Mon, 21 Aug 2023 23:39:35 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (unknown [104.47.11.105])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 1DCEE2008006E;
	Mon, 21 Aug 2023 23:39:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWw22jehE0dUCoxr8DHk1hSpFNSzWdmVpherPTCzNh7lWI3bbXKU0fBtDv+NN61Ld6wytzVDhodgx6F9VgTpvRLRSuvEsBukt2sREXCBEMkkxfgJiYpkknXGPIFgB/LKxCVDlOWIYkf+fYf5WHEi5rIuWqmX7L574f2Hukx8XNmfg9WKIu4TUKINO5qIgztr+ylgUGjomiloRR2G2odCZ6eNPcTKcz0fZkarXfzMmz2TBYG8JY+XW+M6EeUMZHpLO3ZOCJnjihyKhVAsMgG4pdiiu1MLwJb89blgyXxUpdc9gYZtbnhmcAoobvuZ1W3exOWdqRC7UE/ktzeolYdfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oahO7ANpxwFA56gPpKLgLJH4mf3XafYuf97UNcUVCk=;
 b=aDAhLZHotZRvVE43VSx6igYVoin3TsnRj+grWcAWz490ZdI1aqalkSVu56vc/quPT+PFNc72QJizDorQpbGtMwxC8jOdiCZ4KucnhKqDX3A82elY2K0NsMWPB9nGE8RkqRy7srkga1jvo7Vt9Pgh/bSo/wjphrQTlNwXDgyVfe9WpaiZ0oziTaUp4/F4uYm0hPS2eWSdCb9p+qhX5oX19BCvR3nVpyFIhHqc3p9XFYtLYv2HIndeGaKOBFWcza+57u3Amav6DPzGEWvLHb514JvkJDeRtQ9IWucjyhNEWiVzynezR9g+gffX4+zaB2ZKdM4fF8lwta8ame4Mas1aoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oahO7ANpxwFA56gPpKLgLJH4mf3XafYuf97UNcUVCk=;
 b=muak5aDnc2Z8a7EnHbCdNSRaxSL5lKNlLu23QylZl0oUajfKFeFKJPD64RO4qsKo8F8gQEJ8j/Q5UsRId4kkZP/hVnQnyNVvuECew+FFl5wP5hwTzp83Ci3/gkDWax/+UoxrXpUvg9nNFmJU9juYutJ9ULWC+zLZNWk8PeB1iq22T97GLl8uapQ7v4uAyLIAJKeLs6sDtiH9m00s1DTv7fZuz17QDtEAeDfSj6qAeFu4QCAgGhYTeAd62Sk8R1Lf7Y1x2BDph9ME/XamxYw/xq9Zg4+GNzRpFTCeWxaYVL2A9yF69cjXvGPbjuV5apf7To19211+qtHf9nknUYhRDA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by GV1PR03MB9871.eurprd03.prod.outlook.com (2603:10a6:150:3d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 23:39:22 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::21bd:6579:b3d1:e5f7%5]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 23:39:21 +0000
Message-ID: <a4828cf7-9cac-286f-0aba-fcd1688c8422@seco.com>
Date: Mon, 21 Aug 2023 19:39:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v14 00/15] phy: Add support for Lynx 10G SerDes
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20230613142754.wr5njtjo4tbloqwu@skbuf>
 <20230811150826.urp2hzl3tahesrjx@skbuf>
 <26623d0c-8a5a-614b-7df7-69214aaec524@seco.com>
 <20230811163637.bs7a46juasjgnmf4@skbuf>
 <20230821124952.mraqqp7pxlo56gkh@skbuf>
 <a2e3fcad-9857-f1b3-8ada-efb2013a4bf5@seco.com>
 <20230821181349.hls6pukp5d6rc5av@LXL00007.wbi.nxp.com>
 <73d59dd2-88f0-3c1a-0de2-de2e050cba5a@seco.com>
 <20230821195823.ns55h3livxgol7fp@skbuf>
 <a66c9abf-5351-62b6-5573-cae38e6768e2@seco.com>
 <20230821224834.ppk4hmjyajupy7va@skbuf>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230821224834.ppk4hmjyajupy7va@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR0102CA0021.prod.exchangelabs.com
 (2603:10b6:207:18::34) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|GV1PR03MB9871:EE_|VI1EUR05FT006:EE_|AM7PR03MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dcfe7d5-adf0-4891-ee4f-08dba29fe0b7
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  fG/9175gcY/MKkB+Y+6isR1ZP2zHSGPiMPru5wff2iMzYGuAmFv4SjfyfRwiD+LxFRMBroHRzlGn0QHNrLs6aI0Btgi3BnkcAEGJTw8T9/IgUzHXY5unUfKH/k9x56ZcQUomDIjbo3DIAfWpRuWggkT6Bpi/sUpHwdEbBhOvEvwP/Dle9yEFXkqeprpS83WWXSHFIi+6XN2I5DYyHSeySRrHIe+duBi2AyP5aoM87a0LyOD2Gax+gXr7BWwWTYi3d9Z+9HFDfv3d8L6+7m/MqTJ6s9gZIejHcndbll4xAtjbn67ENlIb44DSufX/K9Vc16TNU0Xi9TuFYjyA0r31LVyLiMfL+hklfiHLml3EWg2/rS1+2sRWK5V+SMpbF1UY1BNEgzbOTAkPfM+9gidx0qDsoSTKQDYY30nyymG4Kt9opyCG9hVxnFHZKQrDWo+GU0ys2PsExgn8hGniUaVFTRuvtBD+CHNhltfliGAyR6B/tkYQI4C5ObKzm5eGynutnezR4ms0gKz59gwIqBFa/04Cg4p4mEk3U3wlJXQWe9SFPPyyv9PFec0x4D8XeoJ1LpMIKyEnXn8kUx2VdEFet341UGzl/9EJEQXOf8TAv/i6RAROXdN3ISce22XRJNETpO5lYHMaS1R7gJ+nrsgKi5XLsFa40Vgl5FHtpZEELvs=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(366004)(39850400004)(346002)(1800799009)(451199024)(186009)(66899024)(6916009)(66556008)(66946007)(41300700001)(54906003)(53546011)(6666004)(316002)(6486002)(6506007)(52116002)(66476007)(38350700002)(26005)(8676002)(4326008)(8936002)(2616005)(5660300002)(7416002)(6512007)(30864003)(83380400001)(2906002)(44832011)(38100700002)(31696002)(86362001)(36756003)(966005)(478600001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB9871
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT006.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	f8191b27-35cf-4ef2-3216-08dba29fd848
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	x3DbNHfdHViWeiSgylxD3N/Zmxh2C10hqrzsp4nQ+uFTgB4f44+QchluRuOc71p8qxpRRL3vv3/Y/ujVzWR0CcFT2NSlievvUQFraOCjTCXrG556tJ7Paqlpb8pHY3omaYeYlUfu45Sm1cNy3i1qj8KU1xzBBR6X9znttFMxoAUBuB/QzhjMsJtYKGqNWynNICHOvCDeHiKJPLrckcGwfbLMAnATq5Ep1T5AQy7LgotbJCT9YCvu6saLSA8tHT5u1YDPWNzImhZxAizAIGo4vY9mZaHC8QAfBoW3UQXOtNx4mZTs+ppHEKhLvmg3qhqxNy3zgVGDJqFI3CBSG012UJP19dsSFZIzznZxocPz0CRd7syiSIL1S3YbiRAGgElMZ3aUpGPby8FAvR7jYKJEGTgNfVD/BdpCXEDgHKSRoGtwI8mhE/oTcwJJtfzi2cRSwhD3rnUy2mNXU7+H2ZNRXcJ37tRikWsemFqp3n0kklwCzSas+vMQlzg8Ta9+QANu/DgreBResqTPlAT73HPL5GHmXC36HttmarIHWJEj50qrVYg4rll19wdF82PPhNecBJpACjm1praCgTXhHUWKFaANhrbv5yxr0xKOp1htOSB4Pwz8GQoY5jvvANi/KXUr6LRCM51tpU1Vg+V8s6+XVPPt9tTwLAeMhiu7mlOLcCPFwBT7N8nV5pegXGMpYuUNqngE+8kSs2CnifpNxI3ftC6Xo4KMKdgXvgOLaymp/fu5cYJhKgizd+id4BIg4sIWqIN7zrLCWD0TlMqJFVMWwOpew+q/WZOj7tYWBhS167E=
X-Forefront-Antispam-Report: 	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(136003)(346002)(186009)(1800799009)(82310400011)(451199024)(5400799018)(36840700001)(46966006)(54906003)(6916009)(70586007)(70206006)(316002)(6512007)(66899024)(8676002)(8936002)(2616005)(4326008)(7636003)(36756003)(41300700001)(7596003)(356005)(82740400003)(966005)(478600001)(6666004)(53546011)(6506007)(40480700001)(6486002)(83380400001)(30864003)(2906002)(7416002)(86362001)(31686004)(34020700004)(47076005)(36860700001)(31696002)(336012)(44832011)(5660300002)(26005)(43740500002)(12100799039);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 23:39:35.5769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcfe7d5-adf0-4891-ee4f-08dba29fe0b7
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT006.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6279
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

On 8/21/23 18:48, Vladimir Oltean wrote:
> On Mon, Aug 21, 2023 at 05:06:46PM -0400, Sean Anderson wrote:
>> On 8/21/23 15:58, Vladimir Oltean wrote:
>> > On Mon, Aug 21, 2023 at 02:46:53PM -0400, Sean Anderson wrote:
>> >> After further review, it seems the reason 28g can get away without this
>> >> is because there's a one-to-one mapping between protocol controllers and
>> >> lanes. Unfortunately, that regularity is not present for 10g.
>> >> 
>> >> --Sean
>> > 
>> > There are some things I saw in your phy-fsl-lynx-10g.c driver and device
>> > tree bindings that I don't understand (the concept of lane groups)
>> 
>> Each lane group corresponds to a phy device (struct phy). For protocols
>> like PCIe or XAUI which can use multiple lanes, this lets the driver
>> coordinate configuring all lanes at once in the correct order.
> 
> For PCIe I admit that I don't know. I don't even know if there's any
> valid (current or future) use case for having the PCIe controller have a
> phandle to the SerDes. Everything else below in my reply assumes Ethernet.

One use case could be selecting PCIe/SATA as appropriate for an M.2
card. Another use case could be allocating lanes to different slots
based on card presence (e.g. 1 card use x4, 2+ cards use x1). I recently
bought a motherboard whose manual says

| PCI_E4 [normally x4] will run x1 speed when installing devices in PCI_E2/
| PCI_E3/ PCI_E5 slot [all x1].
which implies exactly this sort of design.

>> > and
>> > I'm not sure if they're related with what you're saying here, so if you
>> > could elaborate a bit more (ideally with an example) on the one-to-one
>> > mapping and the specific problems it causes, it would be great.
>> 
>> For e.g. the LS2088A, SerDes1 lanes H-A use SG1-8 and XFI1-8. SerDes2
>> lanes A-H use SG9-16 and XFI9-16. Each lane has its own controller, and
>> the mapping is 1-to-1. In the PCCRs, each controller uses the same
>> value, and is mapped in a regular way. So you can go directly from the
>> lane number to the right value to mask in the PCCR, with a very simple
>> translation scheme.
>> 
>> For e.g. the LS1046A, SerDes1 lane D uses XFI.9 (aka XFIA) and lane C
>> uses XFI.10 (aka XFIB). This is the opposite of how SerDes1 lanes A-D
>> use SGMII.9, .10, .5, and .6 (aka SGMIIA-D).
>> 
>> For e.g. the T4240, SerDes1 lanes A-H use sg1.5, .6, .10, .9, .1, .2,
>> .3, .4 (aka SGMII E, F, H, G, A, B, C, D).
>> 
>> For e.g. the B4860, SerDes lanes A uses sgmii1 or sgmii5 and B uses
>> sgmii2 or sgmii6. The MAC selected is determined based on the value
>> programmed into PCCR2.
> 
> It's so exceedingly unlikely that B4860 will gain support for anything
> new, that it's not even worth talking about it, or even considering it
> in the design of a new driver. Just forget about it.
> 
> Let's concentrate on the Layerscapes, and on the T series to the extent
> that we're not going out of our way to support them with a fairly simple
> design.

Well, these are just easy ways to show the oddities in the PCCRs. I
could have made the same points with the various Layerscapes.

> In the Lynx 10G block guide that I have, PCCR2 is a register that does
> something completely different from Ethernet. I'm not sure if B4860 has
> a Lynx 10G block and not something else.

T-series SoCs use a different PCCR layout than Layerscape, despite using
the same registers in the rest of the SerDes. The LS1021 also uses this
scheme, so it's not just T-series (but it's close enough). This is why I
had an option for different PCCR configuration functions in earlier
versions of this series, so if someone wanted they could easily add
T-series support.

>> While I appreciate that your hardware engineers did a better job for
>> 28g, many 10g serdes arbitrarily map lanes to protocol controllers.
>> I think the mapping is too irregular to tame, and it is better to say
>> "if you want this configuration, program this value".
> 
> Ok, but that's a lateral argument (or I'm not understanding the connection).

To restate, there's no systemic organization to the PCCRs. The driver
configuration should reflect this and allow arbitrary mappings.

> Some maintainers (Mark Brown for sure, from my personal experience) prefer
> that expert-level knowledge of hardware should be hardcoded into the kernel
> driver based on known stuff such as the SoC-specific compatible string.
> I certainly share the same view.
> 
> With your case, I think that argument is even more pertinent, because
> IIUC, the lane group protocols won't be put in the SoC .dtsi (so as to
> be written only once), but in the board device trees (since the
> available protocols invariably depend upon the board provisioning).
> So, non-expert board device tree writers will have to know what's with
> the PCCR stuff. Pretty brain-intensive.

The idea is to stick all the PCCR stuff in the SoC devicetree, and the
board-level devicetrees just set up the clocks and pick which MACs use
which phys. Have a look at patches 10 and 15 of this series for some
typical board configurations. I think it's pretty simple, since all the
complexity is in the SoC dt.

That said, I originally had the driver set up so that everything was
based on the compatible, but I had to change that because it was nacked
by the devicetree people.

>> > I may be off with my understanding of the regularity you are talking about,
>> > but the LX2160 (and Lynx 28G block) also has multi-lane protocols like 40G,
>> > 100G, assuming that's what you are talking about. I haven't started yet
>> > working on those for the mtip_backplane driver, but I'm not currently
>> > seeing a problem with the architecture where a phy_device represents a
>> > single lane that's part of a multi-lane port, and not an entire group.
>> 
>> Resetting one lane in a group will reset the rest, which could confuse
>> the driver. Additionally, treating the lanes as one phy lets us set the
>> reset direction and first lane bits correctly.
> 
> Yeah, in theory that is probably correct, but in practice can't we hide
> our head in the sand and say that the "phys" phandles have to have the
> lanes in the same order as LNmGCR0[1STLANE] expects them (which is also
> the "natural" order as the SoC RM describes it)? With a "for" loop
> implementation in the MAC, that would work just fine 100% of the time.
> Doing more intricate massaging of the "phys" in the consumer, and you're
> just asking for trouble. My 2 cents.

Yeah, but from the perspective of the driver, if we have one phy per
lane we don't get any indication from the subsystem that we are doing a
multi-lane configuration. So we need to stick this sort of thing into
the phy handle. But IMO we can do all this in the driver and the board
integrator never has to worry about it. 

> Sure, it's the same kind of ask of a board device tree writer as "hey,
> please give me a good PCCR value", but I honestly think that the head
> scratching will be much less severe.
> 
>> > In my imagination, there are 2 cases:
>> > - all 4 lanes are managed by the single dpaa2-mac consumer (which has 4
>> >   phandles, and iterates over them with a "for" loop)
>> > - each of the 4 lanes is managed by the respective backplane AN/LT core,
>> >   and thus, there's one phandle to each lane
>> 
>> By doing the grouping in the driver, we also simplify the consumer
>> implementation. The MAC can always use a single phy, without worrying
>> about the actual number of lanes. This matches the hardware, since the
>> MAC is going to talk XGMII (or whatever) to the protocol controller
>> anyway.
> 
> XGMII is the link between the MAC and the PCS, but the "phys" phandle to
> the SerDes gives insight to the MAC driver way beyond the PCS layer.
> That kinda invalidates the idea that "you don't need to worry about the
> actual number of lanes". When you're a MAC driver with an XLAUI link and
> you need insight into the PMA/PMD layer, you'd better not be surprised
> about the fact that there are 4 lanes, at the very least?

Well, this is why they are condensed into a "lane group". From the MAC's
perspective the whole thing is opaque, and gets handled by the phy
subsystem.

>> I think it will be a lot easier to add multi-lane support with this
>> method because it gives the driver more information about what's going
>> on. The driver can control the whole configuration/reset process and the
>> timing.
> 
> Also, I'm thinking that if you support multi-lane (which dpaa2-mac currently
> doesn't, even in LSDK), you can't avoid multiple "phys" phandles in dpaa2-mac,
> and a "for" loop, eventually, anyway. That's because if your lanes have protocol
> retimers on them, those are going to be modeled as generic PHYs too. And those
> will not be bundled in these "groups", because they might be one chip per lane.
> 
> The retimer thing isn't theoretical, but, due to reasons independent of NXP,
> we lack the ability to provide an upstream user of the "lane retimer as
> generic PHY" functionality in dpaa2-mac. So it stays downstream for now.
> https://cas5-0-urlprotect.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fgithub.com%2fnxp%2dqoriq%2flinux%2fcommit%2f627c5f626a13657f46f68b90882f329310e0e22f&umid=54bd2b00-07e7-4f55-8e2a-ed7b7cf7d142&auth=d807158c60b7d2502abde8a2fc01f40662980862-a6780f8e227e850b7785d5afbae1abed18ded9d9
> 
> So, if you're thinking of easing the work of the consumer side, I'm not
> sure that the gains will be that high.

Well, FWIW those serdes don't need good coordination. That said, I
think it might be interesting to have some subsystem-level support for
this, much like clock groups.

> Otherwise, I will repeat the idea that lynx-10g and lynx-28g should be
> treated in unison, because some drivers (dpaa2-mac, mtip_backplane) will
> have to interface with both, and I don't really believe that major deviations
> in software architecture between the 2 SerDes drivers are justifiable in
> any way (multi-protocol handled differently, for example).

Well, I think we should take the opportunity to think about the hardware
which exists and how we plan to model it. IMO grouping lanes into a
single phy simplifies both the phy driver and the mac driver.

--Sean
