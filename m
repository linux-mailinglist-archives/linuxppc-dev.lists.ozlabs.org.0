Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 794DD872645
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 19:08:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=BrGEGz8A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=ZRW5Z7pv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq3TG2082z3vm3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 05:08:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=BrGEGz8A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=ZRW5Z7pv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f403:2611::701; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2611::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq3SX4dZ5z3bs2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 05:07:38 +1100 (AEDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=b5pWmOJNpgq/5c+nZVZLZQw2TiH6lPAk6hF7BK3cGqHBIw9vyAmyYwKR6rl8cMNKwexpYD2ZT95L/2L1K0+Os4raO3w2RdbqvVwEqSLRWYiGPWMxb7stCQ6ulg3263tD9zSFzZ3+EzChTmkrScfaNhhciF3MUvApo1ZxQ4b2GE+MGWi2Ju1/EL1RtWIdytO/LYXirASs1nkQsv9YJPtwMNJ2qT3ATofmZKdEqj/NacOM7IEcF5uqkU3O98qh6XhApGeqN7z7GkvFNphIB8m9sS1Kge0NOwUW0xmj71dayib6edgRkH3GhiXFhJuCbZPcRYzdlKbYiBVi3nOSJ/l0rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwmWQkBwm8Faqexfy4TQCQlMKRnuqrdOWHDrP6lkGZU=;
 b=T1X2KNx6J6wzuqA6gRsJpG0vUrmepphiGUCMpZtkFRwwHg1OZun/7aVVGb3z9wD16t++QxY0MJltaSHX34W43Kix1pBDOgKXniqyMqXYQzAlhKAUaqPEMzU+yn8AMcjXz1DMA9+Udm/4Mj6mpgRmtz6s4ovy1hQCwLN5ZHPxWZDiMieh7Bj6jd5TBe37QGmdu+1sWFZV4BT0HAsUycOQDvZF514OBrhwAt1o+HORrJ1Q6OLwPHczL5ie3i8IiIVY6byoCZRju3rQbHRzcOO2ouPAcR3w9HaBdGD0wnzELgy2Um11P64iWWq5QZtIS2zYLV9BjmcgWWmIAngkO14Q6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.82) smtp.rcpttodomain=arndb.de smtp.mailfrom=seco.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=seco.com; dkim=pass
 (signature was verified) header.d=seco.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwmWQkBwm8Faqexfy4TQCQlMKRnuqrdOWHDrP6lkGZU=;
 b=BrGEGz8AUZCvZh7B18S7uh8Z2qt1MyGrb8g3UXb9WvwzbGsoL1SHN1FpOvmpMdZTw/SWAQ0psdGYZi/AUOgsSnEPegs97OxQrlReDxLoPDMq7SE/84p+4wrvv+RrzoCNHwYsuQ5I8kqKqTZdonGuSOClbYLve0yueyhC9nVjFU7d4hNQCtEliEVOWzapqpSsZXFhisl6aZF/NnfKii9UdxTg5M6NXXpVuc2jVHXObLGxbevhvMdpQBRzsyizDtvNxjRU/8tydR54bUAs01BYulfHej5M+T7DM4q+3NP9OnzYfghPAzw8CDNo1CW44zrHzSvmZYWfYnZX+W+FZ13Xxw==
Received: from DUZPR01CA0297.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::8) by PA4PR03MB7037.eurprd03.prod.outlook.com
 (2603:10a6:102:ed::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 18:07:18 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::e6) by DUZPR01CA0297.outlook.office365.com
 (2603:10a6:10:4b7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Tue, 5 Mar 2024 18:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.82)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.82 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.82; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.82) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Tue, 5 Mar 2024 18:07:18 +0000
Received: from outmta (unknown [192.168.82.132])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 53E1720095389;
	Tue,  5 Mar 2024 18:07:17 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.168])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 188B92008006E;
	Tue,  5 Mar 2024 18:07:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=De+u39RNxRXEsyNXoEWR3w3EGfJRcMDrV2QKX7TquBbR2uNbvWWgSujCZfHdgsNMXMtbguI1mLyIvlgv/OkRqn9o9DizwrOIMcXmijpVQQ54VtCEOidF1mfx7iCmajWsY7CIIh5d0HW2ocez2ths1l5PKm/NoiIIETOfLyokhdBjlFtgVhjMxHTVshYqFs/gaMPHxcs8tsvvIW8d3+i2o4DFSzNcxJwBSL7Q2+ANwA0P9nOGO6vajBE8+mlNEs1OAwioP6GBGDB1gC2YcIeW8pUY8kCE6q+dspSxflLRf/koznDpfDPqMDuAHqtzhb1w6KrB6ZLVTjCArVcJ0Qp5MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VHIPydt4V8aCBg80ICmfh3tTvDHC86EjbBvT6yLT0U=;
 b=ZUjfQGdGC7W1QJzQ7MU+k9jdu+QJybh9e4JvB43qqb4MatVzuEaTkTfDQwtZ0+JpaRJKmyEXihBs7GvGuY8vkP8izPuU/fka3zQN2jzfS9aCCYPyAcjlxyIffSRJVGXUy0j5SAWpU8OXs4ppcYCBBwWEKlHzzGEA6619BqZtANZG1iX6qa9aLOBatEzgOPwC7PU0vHlQ30j5cGNechgtLl5kybgLF0WNKMWbTkoyVZCl7MKKVtPiY5IELd8DA/6JZX2w9XM0Vq9K1VBg3VplMjOwYMCDhY7tXtRw84hy0p19ILl919uyAzBIHUEk3OZL0PeJf+iXdbps7JdHmQ2v+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VHIPydt4V8aCBg80ICmfh3tTvDHC86EjbBvT6yLT0U=;
 b=ZRW5Z7pvL7+Vh5aOBRppVHxEmdAHuFUT+/YdrGbT10z2c1AZPtL1zsTdyUiDg0apdXqla7+cy7KFWK/QXtM5veipyQjqR2K+YKZjVo8yJcCzI/Qeih0PLSCJT+SooNN+egePlDk0i6XBw/7WnnBOoh9yXN29j9kdleqayq0v4B90PK8pmXIsCMjl3zC5ytKdv8wXB7dJNan8jYmqXjfTOvmqowxaMxBeXL3vvW07Eu0DUyiKGcMm6xOLVAsIycDyJqcIhJdtejEzzCUhpWJZOhVDCJBGaiaY5L6H6XBF8qNQJGyF81PJzIvWXxArclWvivsS8TsvudAqidVpfeNlQQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB9512.eurprd03.prod.outlook.com (2603:10a6:20b:5a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 18:07:14 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::84d0:c817:1e20:5554]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::84d0:c817:1e20:5554%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 18:07:14 +0000
Message-ID: <3beff31a-78a4-471f-a0cd-22379414a298@seco.com>
Date: Tue, 5 Mar 2024 13:07:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qbman: Remove RESERVEDMEM_OF_DECLARE usage
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20240201192931.1324130-1-robh@kernel.org>
 <170966167830.3808046.18290518120456288771.robh@kernel.org>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <170966167830.3808046.18290518120456288771.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:40::28) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB9512:EE_|DB5PEPF00014B8A:EE_|PA4PR03MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aad3f8a-5ef3-49f4-193f-08dc3d3f189c
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  5WjVDb0IjCaKfUuui93IMkRu5eAK95+stpMwtC8LgakynrLg4vgiIEK/yjz971JlG+/wAwlEZ4ISgAkI73AN2ZWGOKo/J4+VMDTCyYujBdcC6ycuio0SvIjX19Fh9GWQowdGZl1X1C/eqBZ1usGatRoyoOVE/hLwVex+cSYpAcCTBbq4ZeLk37pQE5gqTobmb1chBJOJEdqiSjCBN4vR1UyjiU8WISVCfV8LmLE4bH2lKMDjddkHieECVSz7cHDopIo17UWcVg1X4RreV/erkbeYUGcRY8GHV5ErazpT+eTXdmo9C3xarJ1siQqfw1kLPvTPBHT4vQdvdp5OuTZ8ug00Sy5/ri9BQrgrJEI/P9Kg+YjrkFjo3necdUKS5ginBresyjEpeFDV68YOxi9Vid2en5ZlAWzkDFtGofDJpcdYsP9xJCjaxYoGpHQ6H/bTbpipYjRVab4EUMZG9JtZOxtGHsI438XpYLFk+H81UeYqDZjCIJ0gnIj6ZerfZJ8wI5bwcTXj+p9wsRI4F1ozXNtNrx2oCYYriYZSY6nCBizQM7h67hQB/JMgo2Y3Fe1vjxofmGaIUryIad4SgcjF0Hd0Yg0fxWp1eiraQ6ZYmIXnOalVv4WyUCqz6vYz/VyaQJlkLXwpAu9I45PI3bbORJKDxnVMwQXaD1optBMQ1qw=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9512
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	59b5571c-268f-4c67-c857-08dc3d3f15d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	62MYyL8/vZMAzdEZs5jwvGeSW/pxX8kvTMoMbiA02trYIwXkjwj8n+mst7IGsN9CYcmmiPiguatG3htbcTMnoq9w4hLb7IUO6Cfx35it2RzaR9KBGtENvXzzWO8UE52+F362Vi9j0hmU+Tw9QBMMKZVKIgTbd/1OfMvOonePmIy0oq1EJGj2kPKf8i7JM2punir+EKCdz4eoYKTFcVHoEHgvP34X0IBs2ChEd4jeck3dEQvT2qsSw+t7FoCUdcuERp+d+KnMn6t8mX3btEPirTYLrKr2DcvTNG7DZls7jAmFx6dNQtgbG9mx38Y5Q+m6HYQr046Sq5N4iRNnTzGS6vRhOFuckMuTc5IqY3xboRCGvQxY1oxaWeLgv+0s2L31LVcvzvzr7gjg90NFX34St+XrfIvy2T8QHCI0ohvMQw2STco/EDJWOinKBzczMSRQkrJKyoF0AfHJSp8APsFsDAkZPuZ4m93/5CaLfXIzKvryncDVFS88rmKxfyp8DuTG7Xqjiry7GWtnZBS064zFnV+rnpDLzpL59amhJP+cyFBV5oGfRBtJzGZIwgxuW+qQ1MOQOkZdJrSJxwFK7JdjoKy7Fft8e04ogGDxgprj1gCo9eJ4cqyH410fwKjt+EHGu6RXQGvp7Qd0sO7XngYC2dj8+OFXtKmHDNZGwxOjhSqn9ZrAbICEU7cjOFtkS6Y2n4VD0mCYOypT32lpnGcq6Q==
X-Forefront-Antispam-Report: 	CIP:20.160.56.82;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 18:07:18.4260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aad3f8a-5ef3-49f4-193f-08dc3d3f189c
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.82];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7037
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/5/24 13:02, Rob Herring wrote:
>
> On Thu, 01 Feb 2024 13:29:30 -0600, Rob Herring wrote:
>> There is no reason to use RESERVEDMEM_OF_DECLARE() as the initialization
>> hook just saves off the base address and size. Use of
>> RESERVEDMEM_OF_DECLARE() is reserved for non-driver code and
>> initialization which must be done early. For qbman, retrieving the
>> address and size can be done in probe just as easily.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>>  drivers/soc/fsl/qbman/bman_ccsr.c | 27 +++---------
>>  drivers/soc/fsl/qbman/dpaa_sys.c  | 12 +++--
>>  drivers/soc/fsl/qbman/dpaa_sys.h  |  4 +-
>>  drivers/soc/fsl/qbman/qman_ccsr.c | 73 ++++++++++---------------------
>>  4 files changed, 38 insertions(+), 78 deletions(-)
>>
>
> No one is going to pick this up? I applied to the DT tree.

As discussed in [1], this driver is currently orphaned.

--Sean

[1] https://lore.kernel.org/all/20240219153016.ntltc76bphwrv6hn@skbuf/


[Embedded World 2024, SECO SpA]<https://www.messe-ticket.de/Nuernberg/embed=
dedworld2024/Register/ew24517689>
