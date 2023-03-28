Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5616CC24D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 16:42:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmC7p3hKNz3fRc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 01:42:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=IP4kYvl/;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=IP4kYvl/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1b::317; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=IP4kYvl/;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=IP4kYvl/;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05hn20317.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::317])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmC6m276gz3cFP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 01:41:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCVHh+vK6Shuw49FLJm7zlymeJC3niUaq1vB88vKNAE=;
 b=IP4kYvl/2tXQUb+5KFhZNSUsa3C1U7qudpyFQYLhnTHHmST8a33oZRFwovfWOm0s3QtydkXHCE/DIO1GUaCONO5gutVb5mw4Fzxgw8J3lDmHUIwpFgJmyo/hOrL5eOqFeBToMOp7zAV0K2QutSPL2yLQPHVRFOKVdfd3EEjFIIfrTTIGhWslSMuN521RnahfqcOehna6ES/feGAYts+6DEBuYV9XSW8eMbuDTtDjf/TP2YE5zioUDlcUh3HBtLuQMAkaeFBMeQa1QKtkU8nJP/BA43jqsh52KzjUKwXd7Npn73Bt/hNHz9leQ5QU/Vy+rLOvBa+3e3VDavfMFCHtvg==
Received: from AM6PR04CA0056.eurprd04.prod.outlook.com (2603:10a6:20b:f0::33)
 by AM9PR03MB6994.eurprd03.prod.outlook.com (2603:10a6:20b:2d6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 14:40:55 +0000
Received: from VI1EUR05FT020.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::1d) by AM6PR04CA0056.outlook.office365.com
 (2603:10a6:20b:f0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Tue, 28 Mar 2023 14:40:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.86) by
 VI1EUR05FT020.mail.protection.outlook.com (10.233.242.192) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.22 via Frontend Transport; Tue, 28 Mar 2023 14:40:54 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 5F4AC2008088D;
	Tue, 28 Mar 2023 14:40:54 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.176])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 79B492008006D;
	Tue, 28 Mar 2023 14:41:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ng0bQBkg5on6jn0+8Aur1ZIqWJP7wyQCW+73od6Wl+yTtieVHViJRw5028HDIdJ/D51q9H84pkw70vBUAGVkjIQvbM5Vadc3r3EUawTfuwdUQv6Vd5MRrHIbBKwP5mZE7njSXVdx4PHKFt8XEoilkKf70mbiHUfNOmt8eLgGD3FFPEyZtZgweAHU7JpxC1Vmp7FWqszZ/67a3eSWnA0P+9gNjwa1oyLqnZL6F+oFVr6kH7wE8x1YiL8mbEjzhZNyL+qZSLskCyPMZTqqonbdJha1Y0xJzoOJbJrGgr5cKcMIU+yDpcIRxhO4CdP3gj/xfTyY21v7KfZDg/5+XoDRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCVHh+vK6Shuw49FLJm7zlymeJC3niUaq1vB88vKNAE=;
 b=cmQGPaiHXYbrb1QsA0hLr5cftNhtUsa5lwlHFWmrGo7ENOaS5i/+wtr3YKyOYnfuMvrnOWQAL5SnsRgyPYgtNZw4wO1FRuD0l+aHvQ02mMDik0s7+vE7FTaNcG6Tw+xsqF+lFTELBqRXgr+j5GitumvKJn5y+0QymGZhenCv+d2T0a7nERyADIAqxy1FB8DQ4XJav4mRLM7ggI02GRTEhD8NyMp77IE2VorsXxqjC31BFFt0jS7DJQa3IdhLIiPZL8rjxbpCiSLz6OuS3vP398d0iTCUEY7iKGlsP1HcVox9oXHvpbsxJmqUhyAvplH05gReyV2ac0fV78ZbW+h9FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCVHh+vK6Shuw49FLJm7zlymeJC3niUaq1vB88vKNAE=;
 b=IP4kYvl/2tXQUb+5KFhZNSUsa3C1U7qudpyFQYLhnTHHmST8a33oZRFwovfWOm0s3QtydkXHCE/DIO1GUaCONO5gutVb5mw4Fzxgw8J3lDmHUIwpFgJmyo/hOrL5eOqFeBToMOp7zAV0K2QutSPL2yLQPHVRFOKVdfd3EEjFIIfrTTIGhWslSMuN521RnahfqcOehna6ES/feGAYts+6DEBuYV9XSW8eMbuDTtDjf/TP2YE5zioUDlcUh3HBtLuQMAkaeFBMeQa1QKtkU8nJP/BA43jqsh52KzjUKwXd7Npn73Bt/hNHz9leQ5QU/Vy+rLOvBa+3e3VDavfMFCHtvg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM7PR03MB6262.eurprd03.prod.outlook.com (2603:10a6:20b:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Tue, 28 Mar
 2023 14:40:48 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 14:40:48 +0000
Message-ID: <d3163201-2012-6cf9-c798-916bab9c7f72@seco.com>
Date: Tue, 28 Mar 2023 10:40:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v12 13/13] arm64: dts: ls1088ardb: Add serdes descriptions
Content-Language: en-US
To: Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
 <20230321201313.2507539-14-sean.anderson@seco.com>
 <20230324131701.4ucxf65sxfdtqcai@LXL00007.wbi.nxp.com>
 <5ca4aeba-db2c-4c0c-c620-d380b4b839bb@seco.com>
 <20230328092541.og7mexyh4espbh6t@LXL00007.wbi.nxp.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230328092541.og7mexyh4espbh6t@LXL00007.wbi.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:208:32d::15) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM7PR03MB6262:EE_|VI1EUR05FT020:EE_|AM9PR03MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: b76c5453-0ac7-4ff0-9954-08db2f9a6fba
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  55775eD4OhfLunRGQEgiAwZkhulJGYy5Kyaq3Dzv82v4J2NcLS8cTJPP3s5e/hGdsqA5wdKly78Nf949npXU5/SXbfn9lgmSRk/lAS0LEjwd6RIbdxrfFwHJTawzL6vUXQxxEq2FC2L8cDnAaTkFgGOu4Avu7QT9DXKdee+MdgMLxOjrXh8AKUfWMckqsmoww0LquEQNbRSjY4FOcgLj1W5eVDEF0hasTu2xYg19r27c5CzSc7e0xSDkbMUFsnptnEMXfGjleY5lsDtp+EqczYKyGfuIKHMW61Avh3oKTtyftkKjNJOL1ASFj94AIxTGyuOxfjWoxEemZJPwNXZM9p8sNN6ewG8+Z/ZHMGReZ0lQWdiKprQOMgxKFeqxtO07Csd7DDNYjUpeXLeWNypapddYQYAV7j9Ke2dWx4xfqEe9DVXUIyaLvQklMq6EH3oyv8MkV7nHeXLlOEOHcvIoGJ/mXnqEYfzwDLI1cyGu6NZWN5K3sn+ZZ9T3JGOK5WDhupgZPLOFYXETehI4qktqVxsOhnQo2ts9Das/8Lx1nojS+jyadb9hZiT82Gbb5n/stGIwoJlDV+fMCELcdm9+DexraWium6cMQZGGjH0nM9VEmg2qbF1PE5mWY5sGe0o/J9KDLBVSsIa97vjW+DtRkvcj9/xL7LgmAH6xuQJVuFJy9Ky6k24HxD/WBf63z4sZ
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(396003)(39850400004)(366004)(451199021)(2906002)(86362001)(54906003)(31696002)(38100700002)(6916009)(38350700002)(2616005)(53546011)(41300700001)(6512007)(6506007)(7416002)(8936002)(8676002)(66556008)(4326008)(66476007)(66946007)(5660300002)(36756003)(6666004)(6486002)(44832011)(52116002)(26005)(186003)(316002)(478600001)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6262
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT020.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	09502c04-5299-4139-18df-08db2f9a6b93
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cVYrQ8mgdTTGwYt39CraCW2rarlrSM9J32z9hNtWWJaMCn2WaKYjPGB11f4pUwZS31fatPOgt6HLm0Kq2H3+EibEsxOhktw7+wgUnaaMGSbK0fCAU3rcu6SrYG1d3vN2KoS69TtxITOlV5S3TiVellVy2vce5VA0ZJuQK2nFJfXQmjXB+MTHiZy6upvxjnF+nWEfMCw06Q6vlY2hHd7Ksv0+fWDjvOdsH7eRTrdUzNjQUEcJeuIFCuQaH5K5n/UWZwyYfIcF/c/H4QQodqCpOmzJwF8reZSX3MMrlPblAL73/Hkt339tcggCQYttCFhPNaVs2P/g7MYRiO947AY3dlEi9rMNZYnnRpuJUChe3TxBqEW6IpSgDLTwlIAzvRPFba13uAjaP+KAeixwutHPlma0rrBsGawswWEdavqRXj0KaaOLzTbV0rttCAkHuI1FoFWAt8qrAoEYwqK6xCkUUrbPkijLKdudHRLeWoG1qbfCOR69M1xY4nXMhc+lywG8CWwzeln9akvZvx0E9xNW+qW2SAYWSQ9wVgITD0Yzl0+2tNUodKsugK7zP7gKMCPxluAATXVhy137gJjN600byUR7LDwikVQffDfZkHxn0gbCTuLmFI/tJptpL+elvjl9ArZ+WQkVnDCgMZyHCBcftG/kdl4a8gvBkP6g1ahH6mJcA/0xJ+OPKBD32LNNPhHJiqsEEPl1RTKi/XRhgjYH721IzOXqLbLj0U7Uac/CfYFWymsFODHfO1/6slXDtw/qb6wEGjMei8Gq36QVvXk2GIh2SaksNnCcB82vKyiH4fQ=
X-Forefront-Antispam-Report: 	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(39850400004)(136003)(376002)(396003)(346002)(451199021)(5400799015)(46966006)(40470700004)(36840700001)(336012)(31686004)(36756003)(186003)(6512007)(53546011)(41300700001)(6506007)(26005)(82310400005)(83380400001)(2616005)(40460700003)(8676002)(4326008)(70206006)(5660300002)(70586007)(6916009)(316002)(7596003)(54906003)(356005)(7636003)(82740400003)(8936002)(40480700001)(47076005)(44832011)(7416002)(478600001)(2906002)(36860700001)(6486002)(34070700002)(86362001)(31696002)(6666004)(43740500002)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 14:40:54.7932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b76c5453-0ac7-4ff0-9954-08db2f9a6fba
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT020.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6994
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

On 3/28/23 05:25, Ioana Ciornei wrote:
> On Mon, Mar 27, 2023 at 02:15:47PM -0400, Sean Anderson wrote:
>> On 3/24/23 09:17, Ioana Ciornei wrote:
>> > On Tue, Mar 21, 2023 at 04:13:12PM -0400, Sean Anderson wrote:
>> >> This adds serdes support to the LS1088ARDB. I have tested the QSGMII
>> >> ports as well as the two 10G ports. The SFP slot is now fully supported,
>> >> instead of being modeled as a fixed-link.
>> >> 
>> >> Linux hangs around when the serdes is initialized if the si5341 is
>> >> enabled with the in-tree driver, so I have modeled it as a two fixed
>> >> clocks instead. There are a few registers in the QIXIS FPGA which
>> >> control the SFP GPIOs; I have modeled them as discrete GPIO controllers
>> >> for now. I never saw the AQR105 interrupt fire; not sure what was going
>> >> on, but I have removed it to force polling.
>> > 
>> > So you didn't see the interrupt fire even without these patches?
>> 
>> Not sure. I went to check this, and discovered I could no longer get the
>> link to come up in Linux, even on v6.0 (before the rate adaptation
>> tuff). I see the LEDs blinking in U-Boot, so presumably it's some
>> configuration problem. I'm going to look into this further when I have
>> more time.
>> 
>> > I just tested this on a LS1088ARDB and it works.
>> > 
>> > 	root@localhost:~# cat /proc/interrupts | grep extirq
>> > 	 99:          5  ls-extirq   2 Level     0x0000000008b97000:00
>> > 	root@localhost:~# ip link set dev endpmac2 up
>> > 	root@localhost:~# cat /proc/interrupts | grep extirq
>> > 	 99:          6  ls-extirq   2 Level     0x0000000008b97000:00
>> > 	root@localhost:~# ip link set dev endpmac2 down
>> > 	root@localhost:~# cat /proc/interrupts | grep extirq
>> > 	 99:          7  ls-extirq   2 Level     0x0000000008b97000:00
>> > 
>> > Please don't just remove things.
>> 
>> Well, polling isn't the worst thing for a single interface... I do
>> remember having a problem with the interrupt. If this series works
>> with interrupts enabled, I can leave it in.
>> 
>> Did you have a chance to look at the core (patches 7 and 8) of this
>> series? Does it make sense to you? Am I missing something which would
>> allow switching from 1G->10G?
>> 
> 
> For a bit of context, I also attempted dynamic switching from 1G to 10G
> on my own even before this patch set but I did not get a link up on the
> PCS (CDR lock was there through). Pretty much the same state as you.
> 
> What I propose is to take this whole endeavor step by step.
> I am also interrested in getting this feature to actually work but I
> just didn't have the time to investigate in depth was is missing.
> And without the dynamic switching I cannot say that I find the addition
> of the SerDes PHY driver useful.

Well, it's still useful for supporting 1G and 10G. I touched on this in
the cover letter, but there are conflicting PLL defaults on the LS1046A.
If you use SRDS_PRCTL 1133, the PLL mapping is 2211. But for 3333 it's
2222. This means PLL2 is used for both 1G and 10G, but no reference
frequency can work for both. This will cause the PBL to enter a reset
loop, since it wants the PLLs to lock before booting, and this happens
before any user configuration. To get around this, we disconnected
RESET_REQ_B on our board, and we use this driver to configure the PLLs
correctly for whatever SRDS_PRCTL we boot up with.  This way we can have
two RCWs for 1G and 10G configuration.

> I have the Lynx 10G on my TODO list but I still have some other tasks
> on the Lynx 28G for the next 2-3 weeks. Once I get those done, I will
> look closer at the patches.

OK, thanks.

> In the meantime, some small thigs from this patch set can be submitted
> separately. For example, describing the SFP cage on the LS1088ARDB.

I'll have a look at this. I suppose I will also split off the IRQ thing.

> I still have some small questions on the DTS implementation for the gpio
> controllers but I would be able to submit this myself if you do not find
> the time (with your authorship of course).

I am going to do another revision to address the GPIO binding problem,
so please ask away.

--Sean
