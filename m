Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4D58274EF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jan 2024 17:20:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YADa23ru;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YADa23ru;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T7znS6THDz3cTL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 03:20:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YADa23ru;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YADa23ru;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0e::601; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0601.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T7zmY5Wnkz2yts
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jan 2024 03:19:55 +1100 (AEDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jPrbxWBMn2XZF9rcOISR2x62yae90lSWXZo5cZvGgJC+JaWBM5aT9yPGhA0v/gPaPzvDtKjkOOyf/y+1xrp3DMW4huJ+0SpMTDEgOnwz5BzjS+qO81nXunxiEPM6IptXVb1c6Hc5iY3KJ+4gIBItyN+KBuUftiTstVNsnNebjbgV7kkjM8cO1uqhHsL2Ea8DMEO5ULWOdJ5Yk6HDdZPin4poZ+EPKPntl9CUjA6meuauouwMdEWgi0zeLN0fcadz/xsbTwOmWBjBDym0bcAd8T/pwFINJMNRK2xmUqnbzurLqXpBHozRQjpwLwXBIP3rFap7N8hb7Cm6DF72XuxdxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pixmnLbXNbip/EXeeU9LFdbGucmjLJZZ99g/BvzipEc=;
 b=MElIpvU7J+7+tKsxINiWdjhv148V/NMWbxHevj1ob0Q+V3tgInY+j4sK+zMAsG6flSMskw/crzXdsYJyCYpvvnpg6RZMFF52flFA8wveKyNzx9WfGHSXCryFDzxFvrAdB+T8NF1wkmxEqc5BKjEOLsSZtPHTPIDJ0nnqNG6E9qK37lZ25LARWjqYOTS/8c6dM6+2l2gL3zjugIwKKjibDdak8hS8mnX1XI9dQNDqeI7vycrSJkWdBeeUixWJljZPNYw//3/JdmdgCF5l/K4CEzCGLpjicfBuLPB79dhe5Cr+NwM7m80zgAYX9GIYvnJSv3MdAxmoHolpxsNGWYu16Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.81) smtp.rcpttodomain=buserror.net smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pixmnLbXNbip/EXeeU9LFdbGucmjLJZZ99g/BvzipEc=;
 b=YADa23rurcan3RJ/VGSL+zSXRbwY/WqzYQ6BHuwdq2pKd2mjeQoliFrzdJfSeGJ5DmaYK7lg0aA29bOUcJ4PUFaG/jzWXiZkAXDO1/bnjlL/dgyNfqkaTUxdxdVKm0VhIp+jWvAwcLqeMxFd9/SeS39JmqaC30NFLOv7kooCxZRh/iJS2WHTv5RuFauIjR14LVGipmUa2Jo3qIrsCfs1BPQCFBaLSAio416gVWsLlx8rohRi4qvtGhRVIb5a+Z5gihtE3vgBpgX1fWuFohlRw4m2Ik3T9FLsQqRSTwUy3nCoXNfVoCrynAZMY43dCcHzUMzIST7/7QAmtgobLeHw8w==
Received: from FR0P281CA0110.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a8::6) by
 GV2PR03MB8679.eurprd03.prod.outlook.com (2603:10a6:150:7a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.21; Mon, 8 Jan 2024 16:19:30 +0000
Received: from VI1EUR05FT049.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:a8:cafe::d8) by FR0P281CA0110.outlook.office365.com
 (2603:10a6:d10:a8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.14 via Frontend
 Transport; Mon, 8 Jan 2024 16:19:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.81) by
 VI1EUR05FT049.mail.protection.outlook.com (10.233.242.225) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.32 via Frontend Transport; Mon, 8 Jan 2024 16:19:30 +0000
Received: from outmta (unknown [192.168.82.135])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id F14792008009D;
	Mon,  8 Jan 2024 16:19:29 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown [104.47.17.104])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id ABC0A20080073;
	Mon,  8 Jan 2024 16:19:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtsT80xnI5ZKXUSIilSzJUynNOwldaP/oW3B2YxdZ0Gc8KcmPUGbOm2zF8Io/K8BAYVMZaNYpVJB3XZICqqHKbmnkMd6h5v9EbWiMEp2175wwdhmh062HL8BcOqMmmpyXNND8X0J9CbNrzF0BMKhanBtvW53wKQKJkTQy4TvNSUhrKRkHmLCU0NrSYWPfycBr0HZzgvqzmTskKJTES0nsr0BNh63kI6IvWsBd+fmsi7zh+EdrFVisn2zAD8UkpJWqsEu+y9clllHd1Dgo9xIAOR302JCpTSupOOsZjV/ULOQPfIoFZKouh1KNnhUxqt6PT2ivZKCAa9F4MszyfiMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pixmnLbXNbip/EXeeU9LFdbGucmjLJZZ99g/BvzipEc=;
 b=jTyy3gwjvWvbE1hOuP8+B5ssEcU+9PGlZD25Z5+FxvLkER+X6KiFABuOQLBsMTw2DiQBh3gt7jImcXM8CykDduMxiCiLuUOIYsyAm7OMRT2wCipQOzYps3be1WNhqVTdrp13/If734KWDdeA93oUemV76ya/th7KN6X/MtEYLtxFHWe2TeTp4tFWSS4mit5dULpyxsoy1IW2RqaAli+SCic4k3tzfeMM7hWipELo7aPazsDMESAC6jDEDN0EFXLY/b9eV8EYTOYIkpIFkCxoSmAqDatIW8i8y5SJKHFNByjfFxcyWrU1DCBhLfFzMoiI3kAbXojeFr9aGGEFWserOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pixmnLbXNbip/EXeeU9LFdbGucmjLJZZ99g/BvzipEc=;
 b=YADa23rurcan3RJ/VGSL+zSXRbwY/WqzYQ6BHuwdq2pKd2mjeQoliFrzdJfSeGJ5DmaYK7lg0aA29bOUcJ4PUFaG/jzWXiZkAXDO1/bnjlL/dgyNfqkaTUxdxdVKm0VhIp+jWvAwcLqeMxFd9/SeS39JmqaC30NFLOv7kooCxZRh/iJS2WHTv5RuFauIjR14LVGipmUa2Jo3qIrsCfs1BPQCFBaLSAio416gVWsLlx8rohRi4qvtGhRVIb5a+Z5gihtE3vgBpgX1fWuFohlRw4m2Ik3T9FLsQqRSTwUy3nCoXNfVoCrynAZMY43dCcHzUMzIST7/7QAmtgobLeHw8w==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9858.eurprd03.prod.outlook.com (2603:10a6:102:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 16:19:25 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::5cfa:9e05:d8dc:ba0f]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::5cfa:9e05:d8dc:ba0f%7]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 16:19:25 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Li Yang <leoyang.li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/2] soc: fsl: qbman: Always disable interrupts when taking cgr_lock
Date: Mon,  8 Jan 2024 11:19:03 -0500
Message-Id: <20240108161904.2865093-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::27) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|PAWPR03MB9858:EE_|VI1EUR05FT049:EE_|GV2PR03MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e9c52f-f69f-4de3-1d03-08dc106597bb
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  HrGX7/LAASLMhDD55CMV/MRC1j+/NKDYjOaQqswu7CwePZhvnFzgVFCzhXCewEuoWlSF1G9eZB/f2Y0OF9a5r1em9qa5yu2D9vgnYpOYulwY808AvJ5Q36fi8U9fJidr6MPAJbHrjRF8Yg7L5X+zreUYMFo3v5lKvY5+aK63fvBLa7zJNTvsOGd7f8Yr5DU4CPYqhX3Px2Nc+ca40ijvfe5KyLrpuPjt6FSafKuRsnOFQZ2uUwk032iZ/T/Yd1/znOBfovoFFcKiloJnR6+HQxu08vSg01pvLfWo2NQ45Ss94zC6vGmKsAKqXAoNS0VPT+H7b5o1yKl0Y5Dy0In+2pkgmNeAYtbabiFJLfm7jCUS2El3hIPvv+VY1/2YiY2nL75xvPfDENvWuz1hASG1c1UoX1lrKQhGZ9e5L5MbiYqtGmcoKyieh7zKhXLrwr4YSLIRjYGYmAProuKDZTGwhwAwCWIiceVTIcyGxplKqHKelKOtpFHjHEQ6a1VXqgIXLHT4rmoVz8oiO7b17wDIMk5uEANC4Azq5OW/I3ShOMz+rc+D2V8w/xXWqKIGBj1sKtFi+ivp0NKO0PgKl2ChQlsgQLx30mVHdDvGXb1oZWv2FO2lEupEEsKS0wpjgl6d
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(396003)(366004)(346002)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6666004)(2616005)(26005)(1076003)(52116002)(478600001)(6486002)(6506007)(6512007)(83380400001)(66476007)(107886003)(5660300002)(2906002)(41300700001)(7416002)(316002)(66556008)(54906003)(8676002)(4326008)(44832011)(8936002)(66946007)(38350700005)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9858
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT049.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	8602ca66-4b72-4fb2-b014-08dc10659487
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	lSVlmRzTL8OoTo6yVVodfNjK2rQfvx8e0KfAXbqc4E6RvyQ5+ydD+nQjyQ5sOLM/89hDhoYN96JgfuK328KpXFbOvwjGiB9ZKbYN1wmv9q7xPuKGW5GBZ0tpvCWMfFd+QykVB3ZpEJ2ycsc84egS5Sy3nEBqAs3AHMRBTfV1aV9ff05z1q3iAx5mgLllbDiSlbz/8Q946zz6w41cGvzAe7OhjT/hEqoxZ3wGQC2SKX3+SrAOK2zohw7V4yLeH6Po4hZ/cCO5tRtOWFJkxXrC8aBn2VAJfaktUYgCnfBBg16oOvHsFCYvMwafvuHyLVCv6MLcZumyJUabAGqnEQ8/3pfrAOAbW2tIWndWF/pVjRQlnCALZ0EKwmHEqTEsyr3tkUvelsMvYn8TN1Padq6P3a8u/pAVRGW7JmQBIJaccLxav5QCPChf2MQB0sy7kGVVIoMExl2LJyuYcFyvT7eLbccd5Qp/rYasAdrlR0Ym7iRyjKi6vcRjC4RgAQBudljYXsaIqZ/2UHIVjmqEc3ckNfuU29pf13B5Q1o4a7GMMtd78md3qWThnv51q2bIaSj6KHinys8xswZrteVhomJNk0trZCp+itvpzw44123e4uipuiBjv/VQl8paDYSG55BbUMWYodQ86b9B7BSkQspxMjHX569NadV8QNCivDTBWQnQOT1H2viZ+j4r6/X3U2xVS+Gpv83I2kp73AGPORtMynFW1NnwyV3WzfbAxGQjOjNMmi3B1e5r52BHCjUg2/UNdK0Ombp0FCoTkUU67wg7ZA==
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(136003)(39850400004)(376002)(346002)(396003)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(6506007)(1076003)(2616005)(336012)(47076005)(6666004)(6512007)(478600001)(26005)(6486002)(34070700002)(86362001)(82740400003)(356005)(36756003)(7596003)(7636003)(7416002)(41300700001)(5660300002)(36860700001)(107886003)(83380400001)(2906002)(70586007)(54906003)(316002)(4326008)(70206006)(8676002)(44832011)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 16:19:30.2350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e9c52f-f69f-4de3-1d03-08dc106597bb
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT049.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8679
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
Cc: Sean Anderson <sean.anderson@seco.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Camelia Groza <camelia.groza@nxp.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

smp_call_function_single disables IRQs when executing the callback. To
prevent deadlocks, we must disable IRQs when taking cgr_lock elsewhere.
This is already done by qman_update_cgr and qman_delete_cgr; fix the
other lockers.

Fixes: 96f413f47677 ("soc/fsl/qbman: fix issue in qman_delete_cgr_safe()")
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Camelia Groza <camelia.groza@nxp.com>
Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---

(no changes since v3)

Changes in v3:
- Change blamed commit to something more appropriate

Changes in v2:
- Fix one additional call to spin_unlock

 drivers/soc/fsl/qbman/qman.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 739e4eee6b75..1bf1f1ea67f0 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -1456,11 +1456,11 @@ static void qm_congestion_task(struct work_struct *work)
 	union qm_mc_result *mcr;
 	struct qman_cgr *cgr;
 
-	spin_lock(&p->cgr_lock);
+	spin_lock_irq(&p->cgr_lock);
 	qm_mc_start(&p->p);
 	qm_mc_commit(&p->p, QM_MCC_VERB_QUERYCONGESTION);
 	if (!qm_mc_result_timeout(&p->p, &mcr)) {
-		spin_unlock(&p->cgr_lock);
+		spin_unlock_irq(&p->cgr_lock);
 		dev_crit(p->config->dev, "QUERYCONGESTION timeout\n");
 		qman_p_irqsource_add(p, QM_PIRQ_CSCI);
 		return;
@@ -1476,7 +1476,7 @@ static void qm_congestion_task(struct work_struct *work)
 	list_for_each_entry(cgr, &p->cgr_cbs, node)
 		if (cgr->cb && qman_cgrs_get(&c, cgr->cgrid))
 			cgr->cb(p, cgr, qman_cgrs_get(&rr, cgr->cgrid));
-	spin_unlock(&p->cgr_lock);
+	spin_unlock_irq(&p->cgr_lock);
 	qman_p_irqsource_add(p, QM_PIRQ_CSCI);
 }
 
@@ -2440,7 +2440,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32 flags,
 	preempt_enable();
 
 	cgr->chan = p->config->channel;
-	spin_lock(&p->cgr_lock);
+	spin_lock_irq(&p->cgr_lock);
 
 	if (opts) {
 		struct qm_mcc_initcgr local_opts = *opts;
@@ -2477,7 +2477,7 @@ int qman_create_cgr(struct qman_cgr *cgr, u32 flags,
 	    qman_cgrs_get(&p->cgrs[1], cgr->cgrid))
 		cgr->cb(p, cgr, 1);
 out:
-	spin_unlock(&p->cgr_lock);
+	spin_unlock_irq(&p->cgr_lock);
 	put_affine_portal();
 	return ret;
 }
-- 
2.35.1.1320.gc452695387.dirty

