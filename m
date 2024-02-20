Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E80485C0AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 17:05:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=mhAjC9T2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=caRtvgnE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfPQG0HYbz3cTT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 03:05:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=mhAjC9T2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=caRtvgnE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f403:2611::700; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2611::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfPPR2lxhz2yth
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 03:04:57 +1100 (AEDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Xyh6PeoDGN+9yv63+7eSgIrj3dPk86qlNtHeYfT7O/1fJ47ibcR3SBqg9tiOKks8K1+Ros9qILO+Mi85KErwtZMyuocOX+Xbw6u3/EIB87MUYnYKDqcAEm51ahGgqAJ4XAKRKtsNyiu/RKoHvv+pTrIKJrQhLND/NICcktSr+FdTbGVoUgfvUKPf03DGbEgN0Hkz9/1kOtVQRK0rtqefzfHHPaFPHf/BhZf8fFVp1f2QfVLRNnp0GrdjDktwtNMJDamSwJbV5TwV4YBEHqJF7pCtLSocMPI6HsS1DwUijYPo/7vjI35l5k+TETTxWXIKLUatw0dA4IcvOzysm3hXXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CM7KTd8Ukj8Dyqy1Y6yhx+3G+H+N0EkTQKNiy8CSjJU=;
 b=NIz4lhe6P7hQYsLJ/nZo/vY3EwpmY/oyef8/wVd2rQ+ac76ZqhYjXgVM9FsjotoMfm/5vbBliiAcHzbQSc7kXXwtai3CXwvNqK4CE82hlBK9Pnbejz4m5wEZ4usBLKzJeRp62B+rA3T+/yxIy4b4hBN/Mv1822/ZQ4WkrcGsLRboqbWsMCuq7Z1v4xjSrl0rr3KnBlDY6H6RnBPZv9Pse05oKqZhgLoRpOzrIS9teBjURwZFMstaBWVqcgQxMiw84XPdLh7ey4RufFwr5qaRpRFAID+bH+eHEyvBowEGXU/9vHmyHvc1LaUHwCZD5IHCRoMDQf+LtH1EbNHmzPJpfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.87) smtp.rcpttodomain=arndb.de smtp.mailfrom=seco.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=seco.com; dkim=pass
 (signature was verified) header.d=seco.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CM7KTd8Ukj8Dyqy1Y6yhx+3G+H+N0EkTQKNiy8CSjJU=;
 b=mhAjC9T2Ec2x/4LXFZg2l7zqWcBMdURve3HfJHDFTLsxqD5GP2oolebZYEXBl+wa/nasipC2+MbUkVLwOWopfFOwCEjvcEymdHH5s+LP6w0ZPupJw++QVY4CPXkmL6it+60AUWgIn5Nmiag4G5mgiemKASo3AjDXjWfG6m6B/A7d5aau3AuzAu4oCEXNnpFKkpojbjWCPRKi+xfVVd8PThOQNsjBfUPnvwBLKVzY9qHpIVwJaIdv6bblnXXjRBeKIa4iUiPU1KD6smcS2cgQtwK4bE/WU8WWl/1ymQQXMa1u6xFRYipJlJ6K0Ol1CiNXTNXq+MtGD78eXviGYyAoRA==
Received: from DB9PR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::8) by AS4PR03MB8280.eurprd03.prod.outlook.com
 (2603:10a6:20b:4ce::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Tue, 20 Feb
 2024 16:04:33 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::a1) by DB9PR01CA0003.outlook.office365.com
 (2603:10a6:10:1d8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39 via Frontend
 Transport; Tue, 20 Feb 2024 16:04:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.87) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 16:04:32 +0000
Received: from outmta (unknown [192.168.82.132])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 9717220080092;
	Tue, 20 Feb 2024 16:04:32 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (unknown [104.47.30.105])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 23D942008006E;
	Tue, 20 Feb 2024 16:04:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsBW7ovs7Xe7FfDnZ66nF3QhLB6SXhnbkqW7/ybC7TAhsyJDAYqAjn8PgL/kHa7RkK2FW8LCROyireMeuEj1c6c+TCOwOnAipJrol6X7+J+WGLzxq1qVvnbZobo8eVsmeDEVOfTFoh4OX5uQoasQfvoWMXZ8l/g9LkxfyLKpfTPTnzLEVssHUvY/un+uDUfxgsHZ5n77a8pG5gOI9hvZxJQZ/yfiiYCTG5FSxzXv+t6wjaAomhgZiH9CAxdImZ/rM2JTtrCdjQb6J4ayJK0UOrdzKbz6m+dr6RSOum/nK6sxsEwDn9zVyT6gM8ujEGbGU+Isw7zkypsdUZoRU2fQEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1X4q+usKTYI+ic55BclcLU0SZuGORAgBFqWirRgUrDM=;
 b=THxZbyGSfhbI9z2zwefVt7euQB7bEJ91QKVnKgtB/h6QQ6qlPdn01FYawitYWAmUoTXBP+Alw6zRZ1o0wT25Pr5IJf6avHFXhWHAcvJx6A3CR4aG1BiIFy8bDYtKfXwXHkIf9XHWHMj6XR7ZMXqYXEg4k+xbwkSKsZkzxqM6bFh6S/EjWAePPCyz2Zw9FuX0VFYaN6ux1M1O7qoQIBSOB6bwhibQnwKULigci2x1VbY7K5BK+N2ErHPxE22Y7UDg4JVe8nPKBUUhC0iY/J+Rbb4rlMIdv4EAO25MErKXmV0ylkVX/bG9nR3mLtzaGXGe1JaBJC8ZfCyDYoDWC/nnpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1X4q+usKTYI+ic55BclcLU0SZuGORAgBFqWirRgUrDM=;
 b=caRtvgnE7OwFf4I3yCDs50mtKzkR6/RyWKvY8sMTyMwUtd7aC+Pp/qPBXt2cQAAE/1Vd63TSH1UJqglKGa/hBod8P3uICY2Tsm1x38QvAyTWIUV6O3oZR8GUNW+9JaSV9fes7k1pkXbHiQ7coiHk9uxb8/k+SLtssVcWCqbl3deTdTaULefnQT8ZGGI+MHGG3HH8Q4JuMQvxNwXOgiRcuZi1sC1Din5PwXd5jGDm1IOHTckxDhpauIlDTKtPM4hk5ZPh8VBMJVpCVCOD6SIRqpqo9EPKbYNxzTcmo4eMdXpxja8uX8NpngF/CV5YyMUIwjM+iZvaeQXD9gNyabjB0Q==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PA4PR03MB7133.eurprd03.prod.outlook.com (2603:10a6:102:f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 16:04:29 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::9529:5f9c:1795:a94c]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::9529:5f9c:1795:a94c%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 16:04:29 +0000
Message-ID: <cc5794cd-8f75-4694-bec6-1c8d7860f877@seco.com>
Date: Tue, 20 Feb 2024 11:04:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH net v4 1/2] soc: fsl: qbman: Always disable
 interrupts when taking cgr_lock
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>
References: <20240215162327.3663092-1-sean.anderson@seco.com>
 <20240219153016.ntltc76bphwrv6hn@skbuf>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20240219153016.ntltc76bphwrv6hn@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0068.namprd03.prod.outlook.com
 (2603:10b6:a03:331::13) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|PA4PR03MB7133:EE_|DB5PEPF00014B99:EE_|AS4PR03MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: 4af1241e-3998-47e2-016d-08dc322da0a7
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  IkX2YVrg9GsrOHVumir2MtxH7AooZnq1OtB2XNHhTP22WSC1Ux42XeDzHMPS8Q0fR4d7z/jKHX/EeSMaySsg8nDptKvLcPZ0rTicRLMwZqnq5BGNEBT8vWsnZY+8tCTVZI7TOrbN/KOrEUp8t/kxeFZajOjabVPs+M4UjMVcqIUGeG9arsasL6ABrrhbPb+a22ZaQjgj7fHHxgAsBxGnrFgACAtnA4O2lRx6NzpzUIF4CgXBL1EiihBuaMBGrvBbCXWFiQ6ao3gL3gPqgNjRNeggt8CUYVHyxWmmpOD8Y1tZukRttODtAQtkxtsHIrSGciV/ifG7DmgyLAbbU5OUnPmXMTqHrBSjAFfHunM0BZpl85b8mcGLb2+K9DVedKQiV0WIPciCFKvz21kHriJEUaNGSvQhT2rs2puRi5RtocTGzh1qXzcKF/RhaomVPzWI4FLqExfiFuy2jzMGschKGllJp5NOc2+BmXd9REtwkJn8+ZmZrIRN7Ti+gqv+oqESx26Bzczt6N16yhzulML5DQTpRA0adQd8pKJdWMQ2xGDyhQsU3ppsIR+ZySl4jL6IwSSu088JWVMc/8VDhIxIOgY3hNz/DdpPL5GpRGFeYVA=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7133
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	caaf93d8-9ec0-4aea-d828-08dc322d9e13
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VVP6h/Rf5ijhRdCNvbQr4EyNSIJ/KbvnZg8J4qCP1/X1PXLSgI/qRgOsZ23Gjjk4u9+YD6FWf1wts47fmeScEhX54DvEZr9fPJeZIS8h9ksV0A1bXnDUhYhQfDPTIdFTKKXqM9x1x8MTIZaAgNukrJSCnSOx7x+uxr1nptrs/RknQivFWqTLJxcVNT29ie2qXsd1O18q3qiTdhMd3iFGxto2JsEwGzW/VnokEmfjEPPQlEdzId3W9VUnNPn8N+/GUAo3YgRZKJCqQ2GmfXd399rlfGe8Y99zOR95U4BiROQ3nu5Ogb8yeqmmDMZD8jDNGphnhGyxZEGeUB8KlWqS2U2IQJ28Ytq27b9ZclYPbaBB5IH5SduWEHzs3UTxqRv8Hsc3WhJzdCfZ97k781rvfqAvzuEQf8QEJ2mAHpu/ceYlRJBMiw7VX8Sg4BEixPKabh5i7aWrAtUjSrxsNVob69rMLWlQS4nA+t0x9aT/+pVrCI1DWTcuiqaKuK3Wof5/CMBGvjfKO+iawOwQ3WZ96hNCqPX/3PI/MXIz5OuGPAT1pEljwMEm9IZoTLR8/uNQAojOewmGJx4RCcpTDWkDH8QoLvdupOoEGWB+6NVWjLCIawaaQwYFveSO5CSb49B7+IfJpkLyP3KFBiTOnhNEJg==
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 16:04:32.9203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af1241e-3998-47e2-016d-08dc322da0a7
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8280
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
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, netdev@vger.kernel.org, Roy Pledge <roy.pledge@nxp.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Scott Wood <oss@buserror.net>, Eric Dumazet <edumazet@google.com>, Camelia Groza <camelia.groza@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/19/24 10:30, Vladimir Oltean wrote:
> Hi Sean,
>
> On Thu, Feb 15, 2024 at 11:23:26AM -0500, Sean Anderson wrote:
>> smp_call_function_single disables IRQs when executing the callback. To
>> prevent deadlocks, we must disable IRQs when taking cgr_lock elsewhere.
>> This is already done by qman_update_cgr and qman_delete_cgr; fix the
>> other lockers.
>>
>> Fixes: 96f413f47677 ("soc/fsl/qbman: fix issue in qman_delete_cgr_safe()=
")
>> CC: stable@vger.kernel.org
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>> Reviewed-by: Camelia Groza <camelia.groza@nxp.com>
>> Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
>> ---
>> I got no response the first time I sent this, so I am resending to net.
>> This issue was introduced in a series which went through net, so I hope
>> it makes sense to take it via net.
>>
>> [1] https://cas5-0-urlprotect.trendmicro.com:443/wis/clicktime/v1/query?=
url=3Dhttps%3a%2f%2flore.kernel.org%2flinux%2darm%2dkernel%2f20240108161904=
.2865093%2d1%2dsean.anderson%40seco.com%2f&umid=3D75622bdd-3d90-45a2-89a9-6=
0921f1f3189&auth=3Dd807158c60b7d2502abde8a2fc01f40662980862-0625a208f4f6c24=
1a307b4380763ba50532758bf
>>
>> (no changes since v3)
>>
>> Changes in v3:
>> - Change blamed commit to something more appropriate
>>
>> Changes in v2:
>> - Fix one additional call to spin_unlock
>
> Leo Li (Li Yang) is no longer with NXP. Until we figure out within NXP
> how to continue with the maintainership of drivers/soc/fsl/, yes, please
> continue to submit this series to 'net'. I would also like to point
> out to Arnd that this is the case.
>
> Arnd, a large portion of drivers/soc/fsl/ is networking-related
> (dpio, qbman). Would it make sense to transfer the maintainership
> of these under the respective networking drivers, to simplify the
> procedures?
>
> Also, your patches are whitespace-damaged. They do not apply to the
> kernel, and patchwork shows this as well.
> https://cas5-0-urlprotect.trendmicro.com:443/wis/clicktime/v1/query?url=
=3Dhttps%3a%2f%2fpatchwork.kernel.org%2fproject%2fnetdevbpf%2fpatch%2f20240=
215162327.3663092%2d1%2dsean.anderson%40seco.com%2f&umid=3D75622bdd-3d90-45=
a2-89a9-60921f1f3189&auth=3Dd807158c60b7d2502abde8a2fc01f40662980862-ec9df0=
3b11ef3e6b48a457ca5469e0b20c4b0439
>
> Please repost with this fixed.

Hm, I used the same method I have in the past (git send-email). But I
guess something is converting my tabs to spaces? Maybe it is related to
the embedded world advertisement...

Maybe the solution is to get a kernel.org email...

--Sean

[Embedded World 2024, SECO SpA]<https://www.messe-ticket.de/Nuernberg/embed=
dedworld2024/Register/ew24517689>
