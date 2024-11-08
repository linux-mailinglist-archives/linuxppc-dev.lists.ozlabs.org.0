Return-Path: <linuxppc-dev+bounces-3038-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7A99C189E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 10:00:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlCZH1D8Jz2yVt;
	Fri,  8 Nov 2024 20:00:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::61e" arc.chain="microsoft.com:microsoft.com"
ARC-Seal: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731056407;
	cv=pass; b=jU00s5IBbglNco94sAR9utstzDFU6L65PVljSdHdDj+1FuIrBaHVdj75K1TKxkRkFUT69DZpg7MV1ZCUfJxQpOJdn9CZtt1H+EynozaOoQ5mnMBcDDJNsyuKjqq8LrXBhtwRXRVj+uGt2zNP7xuNWqzf03CvBJ9R95YSsp3XKVeSDfo2pmB2j1QOGuzzc1jtBz6tMcuXkc+hStUyfB0phZuN6sH35hgEyzpnuyyhsMG9lHqJNKtSZLRU6u7rZqmXh2dhowLYzv2SERftq04djKLGCMID4N+L1Z7vNXMsPmiMFujV+p6aukEDz46D5Dg6irMivMK/Gy2//LT5i0WJeQ==
ARC-Message-Signature: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731056407; c=relaxed/relaxed;
	bh=6hq7rVZO8bSx8LDmG9+MMJ1cDMrKHlYeH1u0x93MUPc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu4Ksi0WAcyW0OeW9c2DxjEPvqmlX+/87vlbN9Olx2suXGiMelWCZuV6rQOl5tTV2UedXjOOpKAOvqBjqLJXSd3r+Tn7OjNBAjosjvnokZd047fSI1qcWHrjSyk/s0oh+5AqSES/quJXduAXivltSm1TKVo2HzOuvB4w4B6vbUXWT4IMTVAiql3wysQHn9IPB2fv0lId+PzmevlgY85c8HzOE47F7uRHNVlQ7fPFHTNfWI7IxeJvnFUrlGwuM+K454ku2ZPxB5uUGHsVtbaWUjvWprso853+f6wENrgflGvLTVm9eil3czsYr36pvmRzWBvIyuSUGBkc8irdQCUENg==
ARC-Authentication-Results: i=3; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=PgOiS7vK; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=PgOiS7vK; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2608::61e; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=PgOiS7vK;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=PgOiS7vK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f403:2608::61e; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::61e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlCZD0kw6z3btZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 20:00:01 +1100 (AEDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sd9Tc1OtXt/VbPW+ecp0HlzXNe8I0r2HwJyUZon2zVoeL3apt4bIQxNgc4yJTJv12Vg7ZJxO1R9iVg+7iieeRQyWMRewl9soRqN3Ya00zRiUsGftfOVgEqQu99b9jtAOMb4Pu2OtWyWornfTUANl13e/j/LaUnHR2vxVRW2N27GirLjmIxRpvJZB43nYn3x3h8Nb7P/boidhVFMf4YKtbQsCrlNprwoOPkK65GqJD4mI3IMMwRm+VHtfidnH7+zkRjQ0k96Bwk5FtXo7X0Lx72GPzwlNyoTWPoDGDmV7Czih/BtJjDkJ0v7I7HJZthLZ1ecUdlaIryJhGJpfvZH2eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hq7rVZO8bSx8LDmG9+MMJ1cDMrKHlYeH1u0x93MUPc=;
 b=jQ/m2U1IngtDVbuxerHKGmCcOGGc9s5IFSNcSOjb//dRUwbaH1czb9uHFYsObRz6Y1xfgq6skNZZZ7eyIevu2+lS/yvWDN47FhfnPiFxIZi3DpCGW/ykOq8loGjMM15b4Vo4zmIKeCCJ5kZFG3j1+7pQ2aiVpV66jC7TnLpsyNbJuxc15DUOzz7fbE1SyjUH+5z5NeynYfY+3C7mwlCmPjOV4u26Z1JUEt8GIE5WT8MdV3hz0CUsCGls/k0wP8PbWtrcNW/7+adCmUZXTVCH9N6fIK/JefUmi46KlKuUrXNrt5JOvwWKF0XjeKRKyajjJIBVKN2xsPDVOdDwqvBWZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hq7rVZO8bSx8LDmG9+MMJ1cDMrKHlYeH1u0x93MUPc=;
 b=PgOiS7vKDJj+ijCgWrWphzOvreypPKaiuDXev/P3ZC0ptQjYStvUsOKuCG63wacB2DbEWlFbNUTQhQ3wVo0aG7oEQvd29Q6lb5xo5N1Tcw4dNrPDWr2qI8JNvzqQ4maU+QXLqzX2u7MStqUAjHhWFpFy32mmQWpMJ6C6qseCvIY=
Received: from DU2PR04CA0315.eurprd04.prod.outlook.com (2603:10a6:10:2b5::20)
 by DB9PR08MB8386.eurprd08.prod.outlook.com (2603:10a6:10:3d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Fri, 8 Nov
 2024 08:59:35 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::14) by DU2PR04CA0315.outlook.office365.com
 (2603:10a6:10:2b5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21 via Frontend
 Transport; Fri, 8 Nov 2024 08:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Fri, 8 Nov 2024 08:59:33 +0000
Received: ("Tessian outbound c4cd8408e1a6:v490"); Fri, 08 Nov 2024 08:59:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 94ccb1e9a7f555e9
X-TessianGatewayMetadata: A6NFjioXAZq4Z27n2f10k6gmy3q90P7MM0LDl4veVCwdpdofjwXCkD0e0tQDLDrTI9zq7W1coVYJs7cnDk64CTskz+o+Wuw112mdTYMlM3SZ1f/Zvut4T78Ysyw4xY0ENdt7Zg8WcZclAykus7K6FQ==
X-CR-MTA-TID: 64aa7808
Received: from L0fd2f3d014cb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 99F5888B-2A6F-4C47-AA64-222BCDB99259.1;
	Fri, 08 Nov 2024 08:59:26 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L0fd2f3d014cb.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 08 Nov 2024 08:59:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7w06qjB46SvmkZDAqzFopL9uYYd5yIUP0+LEuZygbEmo0iLoKLARh/eDHVz6RnUn/KmvWz9i2T0xNrZbag6CS2bTIfHo3XgDj/Lhu4efRknaX2JnH0zza0NOvz/unAMBEQrzGUb37SU6t1on27Gl/44tIJh9T9p8wp46KWJHk/HX3g7rZqPz5JZbQGvCkr5txDsNj9HrwGHbwujUzdog77nK8U/ybml4e4S4mOkR4WLyVCQZPwPlCHOwJls8JaDxi2IKJ/IBJrO1IJIPx/R2hD2nWk8Ia3YOZC+rtE9qjv8bhqoA+5S/41k+aHnjOfwxpcBOn+VIKS55i5T484rBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hq7rVZO8bSx8LDmG9+MMJ1cDMrKHlYeH1u0x93MUPc=;
 b=NsfHbuWaA+tENbBdyo4OE2nVFljOo4GNyFtVYNCmAOy1sD88STGI9m8B6GZOj/8eMQjl/0y5TE5EZTMwZsl4TLzC8nFkrgXPmHurLHasKtZCHuNdDRsU72fDypxXObhGCYePdWfdKctR5g+qA9eO7NZfmC+iHNpB2zMrrv5Ol1QaEDzNWyWDm3id2AmrUofTDxZIIUcPIrseGGEsvrYr5l97TZQYXygc3sCM4CUUp+HeNAo8ksT5vGqXN2BYZI4eosfhZBtqNXDEybtDmEewXX01rZNBlbWIT0N6kQw1ZUmx7mkuKQNAkP8cQQiN/Q1PMA5D9uEqvpzcTj52UDrrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=ellerman.id.au smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hq7rVZO8bSx8LDmG9+MMJ1cDMrKHlYeH1u0x93MUPc=;
 b=PgOiS7vKDJj+ijCgWrWphzOvreypPKaiuDXev/P3ZC0ptQjYStvUsOKuCG63wacB2DbEWlFbNUTQhQ3wVo0aG7oEQvd29Q6lb5xo5N1Tcw4dNrPDWr2qI8JNvzqQ4maU+QXLqzX2u7MStqUAjHhWFpFy32mmQWpMJ6C6qseCvIY=
Received: from AS9PR05CA0111.eurprd05.prod.outlook.com (2603:10a6:20b:498::32)
 by PAXPR08MB6621.eurprd08.prod.outlook.com (2603:10a6:102:dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 08:59:22 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:498:cafe::51) by AS9PR05CA0111.outlook.office365.com
 (2603:10a6:20b:498::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21 via Frontend
 Transport; Fri, 8 Nov 2024 08:59:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 08:59:21 +0000
Received: from AZ-NEU-EXJ01.Arm.com (10.240.25.132) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 08:59:20 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EXJ01.Arm.com
 (10.240.25.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 08:59:19 +0000
Received: from arm.com (10.57.26.225) by mail.arm.com (10.251.24.31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 8 Nov 2024 08:59:18 +0000
Date: Fri, 8 Nov 2024 08:59:17 +0000
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
CC: <linux-arch@vger.kernel.org>, <acme@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Kevin Brodsky <kevin.brodsky@arm.com>, Joey Gouly
	<joey.gouly@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Sandipan Das
	<sandipan@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>, <nd@arm.com>
Subject: Re: [PATCH v3 1/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Message-ID: <Zy3S5YhlgduqCMRD@arm.com>
References: <20241028090715.509527-1-yury.khrustalev@arm.com>
 <20241028090715.509527-2-yury.khrustalev@arm.com>
 <87ttcl89c5.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87ttcl89c5.fsf@mpe.ellerman.id.au>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AMS1EPF00000041:EE_|PAXPR08MB6621:EE_|DB5PEPF00014B94:EE_|DB9PR08MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: 403f27fe-9bd4-491d-59b2-08dcffd3a9e4
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?JSb2SHQ4NAoCkNdg5nc4iT1xePZNn9csgr6q4/z0bjdZUeLnBzlwzizQbvS+?=
 =?us-ascii?Q?BaATd3XIzkuXa1zLOIZ/fTqubb/7Td0ZmOkh33316I9pkqg7mp/wHwEihwwY?=
 =?us-ascii?Q?5+MRbBu5xLPAuIBsF9uJ4J6vRODelRqpFtxdZ55GUBIqKmhcKRc5uWpo6ceX?=
 =?us-ascii?Q?jHH3sQkQkuJ252GErjZuJkJOuxK8jpomoOenGG7RuFkwQO0OndQO+iOSp5zl?=
 =?us-ascii?Q?PJJ/MvfRuss73q1dji9o7QjIiGy+VoiGi5wzu876eQYhozqeAt15mMZ1WUeW?=
 =?us-ascii?Q?DdAVqIUQZ71Fv0Odza9o5cEdFZxn3XQOyez8rQZpCS0wWAL7/JjNS0lipGs0?=
 =?us-ascii?Q?f9/JRUpi6MMmYmCCvrQyElkPygEGmBUGlGcfHMm0nTyE9pj7Qa53dqyC7rAy?=
 =?us-ascii?Q?PNGtanN/b38SpZMmZjlBUrpsvX3HKwFXacOCpJlq1TJl76nW/Zsmw9NJ8pGy?=
 =?us-ascii?Q?98S25g0TXLFFB5Z3hKkT53KXf/t9NxszJSBZst22clVHyyuNJ0+qNRG+E1Jc?=
 =?us-ascii?Q?zXYkMdpiTk+msnepg9AqFtjlViK5JFUWxsxEBJGeiXdyeNBEB1P3vWNJS88t?=
 =?us-ascii?Q?F6NjWnSPrWbtVUVEgvgxc52TqZp041EWV+GaswlQAr9W4D0YCMa+95bNDZcA?=
 =?us-ascii?Q?56aAWzKELtL0L65FcufizA2yP2qWseia8WoXnpDktQVnr81ri6Fpocx+Itd9?=
 =?us-ascii?Q?Y8x0NMs7jON4drAuM32zCC2YMw6Rdf4Ibn/8Ba8B5EDCzJi4X0XsfB2nPap9?=
 =?us-ascii?Q?l3Q2owzzwG/HNTGgqYnqXxqG+ys0srQR+KNMHqm8Nt6QNXCCr6fM+vNwTbZV?=
 =?us-ascii?Q?QCa3AAcet/B5adxMRGgJnnY5b8YExF8pxEXiQl8Brrah9tBy8U6jMhyV/cn5?=
 =?us-ascii?Q?3Ik4YwZvTDooA6MN6CORaNObfQGqboObQWPvajP5hyz2raIwrnbgngE/836N?=
 =?us-ascii?Q?f5Q+1uzRU3ywLZ124p2kuMGqyxthS4UvPJ6aIj/RUxY0EZ6dAQwqF1RJSAUR?=
 =?us-ascii?Q?MBjnxpzjfmzat/v8gl/C8lsV81WSr4Q3rV/atWShc7MSpJYfrImnUN3Eh1Xt?=
 =?us-ascii?Q?B4C0t+Zmsd6qgyXsDUaaRGBluvs3tLy2tZ/v8fBYpZJIUcnVYv5yK8PKP1M5?=
 =?us-ascii?Q?uI0CwCKiblNM1CfIdzayVO9Uxvc5q3a7zA1nG7syTyamlujBV7OULF3cAlWc?=
 =?us-ascii?Q?Ba94BJ1H55Bx6Fa0NsZaFNyQlcBVHaPITPi0NV1VOTGzDQMkldY31CSTG8GM?=
 =?us-ascii?Q?yX1w9baXaB2YoYSGS69jvPDLodv03ik6iM86cKHPrkstRpyHPLDowHPXaX2+?=
 =?us-ascii?Q?12r1qCvFlK7g5L3MArmnVWj2NAoFcc4KA58/YyKwXH82OEMgMxx4eJNTYEDN?=
 =?us-ascii?Q?psqUy4EhK62Daj21H1pTTq31ho8CI1efr13WVEC+bp89wDbA/oyISxCS6T4m?=
 =?us-ascii?Q?OJVL2xEiLJo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6621
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:20b:498::32];domain=AS9PR05CA0111.eurprd05.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d84be0eb-ef06-4387-c1ce-08dcffd3a2a0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|35042699022|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yRqs0euxgNmg5AeOIJNBr0JPEWR3qMW+sAeZDEWUgbulvhECQcKpfdCOBmyR?=
 =?us-ascii?Q?WHJNs1neip4Te02At2nW4HK8ufBzNs8fhT+JA7xv3b2HCkvVQztpl9PVU+K8?=
 =?us-ascii?Q?1n44WBYrUy6tl5A9EOqip2hgh4PugI+pfBmgmPlaL5/CqjTzH0bZ2BbPi/BZ?=
 =?us-ascii?Q?hScTLtSpOM18rQPT8hr+QXLGvRqfKvKn2xtY84qB2F/bY48usYcLbXk3b0Ma?=
 =?us-ascii?Q?uN/82g3RXBPDd42hAqWL9nueEnHJ379i90ue44mmf9BuCQFqrlLMWYTQPyyC?=
 =?us-ascii?Q?1969etfx4baj4uq3Ig2TUnwBwj6WEV8+o0jqNmtZxqGGcvEvifgiLGEqxvgf?=
 =?us-ascii?Q?cs7PvAIF+YLECZUf+WJGws4IY5gk38QVwDN/9gvH/OXQGWJtSyvj2HsXDrNx?=
 =?us-ascii?Q?SDr40XWDC5EDRYR33449FpmGYTSHhyy2iO6iWfw4/I5tpbVfsBtXAYt5VpdV?=
 =?us-ascii?Q?Or6mf7BYh4995ziFZJJRHt+VLj3r5ImpZEGK2IV3igciVZeZ0XmBa/0dAxQb?=
 =?us-ascii?Q?OqnAg4nPWOruiae6WaE99wWIRWKxEWLQFvPSVGRBs1OQNyxMWdubIzAYSl90?=
 =?us-ascii?Q?Io2GxZH2XLeB1AcddxHZ+akwcGuLBHkBElARO8EaF8iP1a0dl8qtcf4AJ/F0?=
 =?us-ascii?Q?hVTUlegpJBV/W/xJIp3kMh5bPMj9pDjvHD6Ic18UYFf29fM3DVLHS2IWYZGO?=
 =?us-ascii?Q?jjY8VuApb8JBh6F8n/cuXA8WEhMqyvB1XuGUMAVXQcRjuOmIxtlEhzJoydtb?=
 =?us-ascii?Q?r2EhS2LDRuwILFzWSMou2hSy8fgw84hKA2T982o0VnlwhjARK5fZw49Wlray?=
 =?us-ascii?Q?3gZBipsxny1YzsHjHe2yzyA5Qu+Jv6w3+cs+1/shcuu7MNe4ynsM/S56g8bX?=
 =?us-ascii?Q?fdadmrgD2ZjJjboCI2zWLTtqFOBDi3DRyKwYMOX1FTUZ7DZ/e+BXh5dO11Fa?=
 =?us-ascii?Q?zdKrOHm37ggrte0bTqOiNXFqmiN+QBqy8ZwgSu1qnP8CeVAwHH4Vy8l5eIMA?=
 =?us-ascii?Q?xncE1cxughrA+PSFB1wvbGNrF+Uv14U4SVGHmtvfcOgS1O2wyieXtOPiQ29n?=
 =?us-ascii?Q?s0nxCXuII10CMw2Fl3hLWAFpEr+bJdulxvlv6uFt9fjix//0sgqr7xze0/Xi?=
 =?us-ascii?Q?3VL2nOj3xCBrgl+C03cfAOQAieBtvazx78A2SV2fCqmJtZLZ9FEoXoNsq0iV?=
 =?us-ascii?Q?aAgygURIhKEOGMLpMJPN0OkUaFgPw2fJjvCvFpVBqXPZJGJQjlmArpNbxN4g?=
 =?us-ascii?Q?azfoJmZYo9wB1IRWNtNZoWJBfMPQCi0Gm/iTCkw3G3+k+cVCw/DTpBOPsEdN?=
 =?us-ascii?Q?uKb3rbAnIHNnPL61JIqtrSwrpT6/sKKvQ3RGDzhxdExLALlL60xl4IbMbgen?=
 =?us-ascii?Q?al1tbXcCaZ03w9MPhw5pNEEevG0oMm63c1kzDOAg8G6fwm/SzYn2lOByt4U3?=
 =?us-ascii?Q?+KYyCid8Xfg=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(35042699022)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 08:59:33.3264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 403f27fe-9bd4-491d-59b2-08dcffd3a9e4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8386
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Michael,

On Wed, Nov 06, 2024 at 12:00:42PM +1100, Michael Ellerman wrote:
> Yury Khrustalev <yury.khrustalev@arm.com> writes:
> > Memory protection keys (pkeys) uapi has two macros for pkeys restrictions:
> >
> >  - PKEY_DISABLE_ACCESS 0x1
> >  - PKEY_DISABLE_WRITE  0x2
> >
> > ...
> >
> > This patch adds PKEY_UNRESTRICTED macro defined as 0x0.
> >
> > ...
>   
> Apparently you're not meant to modify the copy in tools/, there's a
> script that does that, which is run by acme, see:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/include/uapi/README
> 
> cheers

Thank you for clarification. I've fixed the patch in v4 [1]

[1] https://lore.kernel.org/all/20241108085358.777687-1-yury.khrustalev@arm.com/

Kind regards,
Yury


