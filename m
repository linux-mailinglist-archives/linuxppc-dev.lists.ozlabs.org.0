Return-Path: <linuxppc-dev+bounces-6311-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E2EA397C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 10:57:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yxw1S3wzBz2yyx;
	Tue, 18 Feb 2025 20:57:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::60a" arc.chain="microsoft.com:microsoft.com"
ARC-Seal: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739872652;
	cv=pass; b=Yc0ynVZf/wB2T9woEBJC6aOa6mjLd8P3irBX/QPbxmp6VYyyfNMKkNc3kFejAmEhYo1rMJmNhh2V3pft1IogIKG7pEOPaRninDB05X2eSB7DK2oLF9ifBHo2zhKN4yW/P1EKncWKqIZV68onV83wbManZCj+1E+uGAjGbndIcgHZA3cqDce9rICTHpyrD94veRrWjQxv6GXYti08fp1N9eHs9oEbYGjItBgkstne4mmeL6wNdYl+1z8RrCWpDQf0guJ+p3TjVAvJyMRLtxSk4usaacgWjujgL+eMkp4yCoLpbjGYhpCKJedrxQTKeCc8cIjMZRjFteNoWbgM4YStpg==
ARC-Message-Signature: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739872652; c=relaxed/relaxed;
	bh=g66rGXUQGYyuS2Eo+qkj4zV3LVGZaz+edNogDzi9nzo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTs4ANCyA6mg9v2qamzge8wpS/QR3Sl9a03TmNpbQ9LqLRpfjaRHlfeqXk1C7cZuPOST6nbzAwoyMg91kW7AWOD8C7mfY9aEBKz4zRa/fUOHTS1PfdUMfu2/yua4lu/BkQ/KPEGLbqKbfWu+OmVsO2oae9BDAHDUXjZ7fPb9WL/2LbqQEaRia7JE1TjOU3Usj0+6fAx5T56kRLIsuOxyN1UA2LpJAz04nlnPowl+rtOWMgr5GI8gPsLeYQKj2T512RyLyYwB5OX/maBm12T1zJUe00EZeaHfYfuI11PKs6jt+IqlrkI9uuOrXyeY34hNt27wVRX0L1DwZKYXxL82wQ==
ARC-Authentication-Results: i=3; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=c/qx+bLN; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=c/qx+bLN; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2614::60a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=c/qx+bLN;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=c/qx+bLN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f403:2614::60a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=yury.khrustalev@arm.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::60a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yxw1Q0hzJz2yyJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 20:57:28 +1100 (AEDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=C8Ytv4EN3/QEGsqbItqJtgDXSeivX1eJERBQ4zjlloGDwPnHe7vPuzy6lM6ak8b7C/4DgaRHl0NuH/okXEd+R6QnLbviz4vR61kaeRDyPy40l9oi150jWBE7qbZnEN8ef4JilqSDbaXifLfWxaY9DW4f37CNDutxYT7khKi2VgbUE6KjYSZyoVpL8PgMQRgkvlTtrVd9M49+wu2bEeLHJPq9T0DGJllsCL1HQChG09M6XpUmyANvtZyNveiARchCNswMUjmls3mp1GgP5rggVM/e/PZNqkEgAuXYk66xmbQaV6xu6oOVTpR+zZq2Bi2O2/OgXJm70ZAftk9c13HP7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g66rGXUQGYyuS2Eo+qkj4zV3LVGZaz+edNogDzi9nzo=;
 b=GGTVyoSbqq0dicR0R97KIDw/2IlJnEgT+df9SMI3ecnpAC8SkPTsDLa/0leD0lFdHEKnI3Q63kiPXMc7oR0UIaUfQ9loU4dmLhjRqau0CzBKtde1SVYO2jZ2X81bTGrzlacOZyp4NNrQVwmn9js9fem8SBgKnvA5G4eWPDiHoLPcLXDpV99zkcqcx7lT9fmz9YNXGvWKZoUfzsYSHFuYaNnbbtReokNYGCMYJ7+1IqytEn/OdH167XUQ+7duuVWEBVqp35s5AgkI3dvm2n2ughWz8EL4Wx2QonDsQyU/MxbppKB906q0nHeny83B0Nbe25wDcL5Bh1sgYWMVVTYGYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=0
 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g66rGXUQGYyuS2Eo+qkj4zV3LVGZaz+edNogDzi9nzo=;
 b=c/qx+bLNr4jrVxLOMBnVPTpugQ4xn9bvJq/xwJf63SzEAlCj0AfbRqLA5xf8Emdo5+1SecA8MUkX8qcdnohbeIW4CVTPKLhq+m23M5B91pk5XHB/nYg+mw4/NPwb2iMXVmY9ZzYCNKiaI9MmGxIcouHRA5YsVcNQLPB29kMGnYo=
Received: from AS9PR06CA0483.eurprd06.prod.outlook.com (2603:10a6:20b:49b::8)
 by PAWPR08MB8960.eurprd08.prod.outlook.com (2603:10a6:102:340::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Tue, 18 Feb
 2025 09:57:08 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:49b:cafe::5f) by AS9PR06CA0483.outlook.office365.com
 (2603:10a6:20b:49b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.17 via Frontend Transport; Tue,
 18 Feb 2025 09:57:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Tue, 18 Feb 2025 09:57:07 +0000
Received: ("Tessian outbound 4fd325905615:v567"); Tue, 18 Feb 2025 09:57:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7c466d3c344f8571
X-TessianGatewayMetadata: ZVu9O+5+SCETLaQVGQnm9J/e8lYP1K1MHeX18ZDZphmXlFU4/rC1A/hcGyDlEvaVW2z0fm26Kh4uerMtlPzm6j0pbcMiJ5cqtpe616vrhPEktC+X2uACQNCCSqxSm4U7LQGchsGvQAQXPdlns5p0DA==
X-CR-MTA-TID: 64aa7808
Received: from L783cfa010d18.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0F570B93-EAF7-4E84-86BD-D35F3CFBCEC4.1;
	Tue, 18 Feb 2025 09:56:59 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L783cfa010d18.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 18 Feb 2025 09:56:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azfghCHKiirEDsUYuV1OD/xdaPIc4QUlYnWw/LYwvOjMKQc3mqqf5QiK594+P0DRIZESaLK4NN+Ee4sjbGogNT3yyz4GbH+KLLpxiJuSXsKZuOUCRi78jAAr1Hp6J27nt6z0XT+j0cA/+4j1rgEv+ZhqOXsQEtG7+EWXAm2JNAoPGoBGGxJVUScU5WpiLdyvEpxEHa/NeV+BXG2nTWa13vsS2y3vTYlBYkXfITi70YvLsDhiJufw+YRdYNGnGX1YTgjAhVYU0A2LJjwDeY9w2Tug9p8OqNAjrfYwZkMTRrhfURRkD/5OaTBXh9bB06ZM1P8lo0nn3hSgcmtnsy54lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g66rGXUQGYyuS2Eo+qkj4zV3LVGZaz+edNogDzi9nzo=;
 b=bWZXju5genozlyQo6ySmUpEsoid/rEMopSYJEb6QUssagzHZ+5qHa7rLQIsVaGlyHyi6OCS89iCoHIpvk5Qnqw/zG2TnmrFO6XDc6dxnA7MczHkIYYIzQk5Kvs+wd0RIq45qXwY8dx1cNcDhcoSLGGwMM8QZI2/XP4p2yLi+sMKLwvXQZM9+f+ELaEXfgLSEQE/r0yj+cL7xeAw8jOlGDgjLkDgiUKONVo9qoawOvI/Se6TOzHlmnqI5ZkyyDAnR9pSAe1HSVGcpPtoR1GnCFsjF4g3lhf3xOuBOuw4jple542UaIwheIhHXGxT+HSjTvQNoKM71+irsURpgZWGZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g66rGXUQGYyuS2Eo+qkj4zV3LVGZaz+edNogDzi9nzo=;
 b=c/qx+bLNr4jrVxLOMBnVPTpugQ4xn9bvJq/xwJf63SzEAlCj0AfbRqLA5xf8Emdo5+1SecA8MUkX8qcdnohbeIW4CVTPKLhq+m23M5B91pk5XHB/nYg+mw4/NPwb2iMXVmY9ZzYCNKiaI9MmGxIcouHRA5YsVcNQLPB29kMGnYo=
Received: from PA7P264CA0362.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:37c::28)
 by DB9PR08MB7422.eurprd08.prod.outlook.com (2603:10a6:10:371::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 09:56:49 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:102:37c:cafe::1a) by PA7P264CA0362.outlook.office365.com
 (2603:10a6:102:37c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Tue,
 18 Feb 2025 09:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 09:56:48 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX06.Arm.com
 (10.240.25.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 09:56:48 +0000
Received: from AZ-NEU-EX05.Arm.com (10.240.25.133) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 09:56:47 +0000
Received: from arm.com (10.1.32.37) by mail.arm.com (10.240.25.133) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 18 Feb 2025 09:56:46 +0000
Date: Tue, 18 Feb 2025 09:56:45 +0000
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
CC: <linux-arch@vger.kernel.org>, Will Deacon <will@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Kevin Brodsky <kevin.brodsky@arm.com>, Joey Gouly
	<joey.gouly@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Sandipan Das
	<sandipan@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<x86@kernel.org>, <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, <nd@arm.com>
Subject: Re: [RESEND v4 0/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Message-ID: <Z7RZXef1LqE0_lMf@arm.com>
References: <20250113170619.484698-1-yury.khrustalev@arm.com>
 <173982794521.4020985.15838989967891150260.b4-ty@arm.com>
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
In-Reply-To: <173982794521.4020985.15838989967891150260.b4-ty@arm.com>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AMS1EPF0000004B:EE_|DB9PR08MB7422:EE_|AMS1EPF0000004A:EE_|PAWPR08MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: d189dbbe-071b-44af-7acf-08dd50029ae8
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?AIlgGOO3RTw7jxHPhdW3RqRyZCNSlgMrzpBV7Hshcz6wpHqOvGtR927zJ9Sf?=
 =?us-ascii?Q?D52zi1U/B5aJdQpxLdty2XZ3kSaVDoXncqTd/nw3baxDwfxsnQfpt5pnBBOB?=
 =?us-ascii?Q?uGFo3QsYUwO2EvkJ9FQ7jT24YwvzjkHNX7DZXvNwCPE4mLEa68P5KSu9m06+?=
 =?us-ascii?Q?MMOOjgxT9AxhCGyavBWYr7Tpk9ay0YXIE4akSmy/5XPm2EjGdVIe7MukY+s5?=
 =?us-ascii?Q?CSpUvW8wnKbnV/+oRlDof0yaHu7ZhkYYcTLcYObeJXSo1pGULK2h2d9gtKwx?=
 =?us-ascii?Q?3DyPJku96R2ivQ5v+R1NAYNg+pCGbi9ktlRagsLvtxVsgxCwaa173WQ8Htam?=
 =?us-ascii?Q?PykaLHOjy3tZua1eI0HjtyBjrmJkYjkTE/f5Ehe60GcC77FhQQnYyStsjLEG?=
 =?us-ascii?Q?3oKSuBYByPGqKB4+3QLRvvs5Jqv3Gkqc9+lh3+PawWyJBoQuLJf4YoReG2mH?=
 =?us-ascii?Q?hr823vRy99rLFkcPQQScd1RgXiStBbtsKfVFF+CYXRXlxRnRseG7lZNPcAJe?=
 =?us-ascii?Q?MlWNqIUnbXJTL/20H4jcTHtouoaeOsH1qCUhdnHwd3Akrgz8yn+pL4nClwHe?=
 =?us-ascii?Q?DCOakFGEu2DD25cDclWTpxK2GzatWP7ltiPfcIV294f6MfoMI87l8Auw13g0?=
 =?us-ascii?Q?hchdqTyaT4K4xiviRdria4447DaEHvMqm/idnM+JI5N/hahpCxQB15Wp7rO3?=
 =?us-ascii?Q?/2v8F0pSEfUd7h/kvFtohivrpfvm15dlCzar9WIwqaUcOESl9emUN4jw3P9Y?=
 =?us-ascii?Q?4kBV5SeGVZQHJtMMhLSYsW+KkXwzh+nO39pAPls8oLw53dTkBNsALvJ3LZ1p?=
 =?us-ascii?Q?qTq1wPuJkd2ecc27cHkIjqDVoulzkcYOYXJZ7FhYhmaU7ja0o5avI0z1x+kG?=
 =?us-ascii?Q?LU/PAlNnQxuhbiEAbQjXO6P2Ur1mnKx+4DZtaY5WwuggrEMC24a0qRkDBZfl?=
 =?us-ascii?Q?fbWjNJxoqX4+0lBFNl9LB5NHRmU6Q6I/R6BGRJeOCdUygiAfGZD8zogyLnsZ?=
 =?us-ascii?Q?dv3fn+gdiB3vxEoKDBgFIDSbWqp5GwrxsyuzyndTv4N1oPsH4qxylztcOvTu?=
 =?us-ascii?Q?0diE1W1CN6mhkc14c8jugM5BVbBMSlLW7VUOdWIPVcRS+y4dSs9im5Mbp95l?=
 =?us-ascii?Q?I1rO0525HxrEaSLSdmeAQ+GyIwSnuVz4CpaLSUg/BogWlqxG+zclei9hZxUI?=
 =?us-ascii?Q?5VX5yPiGLVup24ouKahnH5jWy6Q+Ef2pp0AoWU5nV3wac6f+VkO/9yEnFKUw?=
 =?us-ascii?Q?BszRQBOhf+XKupUR5uEwxr/sXbKULzK3lr0L4YiK2qLFhDhWUieT2HfwBw7k?=
 =?us-ascii?Q?f91XX78A4E51A4oOkwNjQ+fZUf/gjBayBK5iNO8wygAPoRQQ/CqNqUbxfs9q?=
 =?us-ascii?Q?vw5SBT5IHlc+Y6BeXSsiXbt6cTVRradGNBkIDBtvdsYdcfNXrCJIWASrzMVx?=
 =?us-ascii?Q?paWzU+CWloelRS+WU4l5XffStoNQYbQt?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7422
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:102:37c::28];domain=PA7P264CA0362.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a0b6e54f-f525-48fd-e885-08dd50028fd2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|35042699022|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FLzzL8RoE6B/2bTKErbY7YPzuXfnXVW3cgA4BWWNQafKhKOQa+rig42UCumI?=
 =?us-ascii?Q?BUw6YOlhBg2laypAjCvvvaL7+TIXPg13ycmen7AvFLtLUZ0bVN6QEIrRb458?=
 =?us-ascii?Q?lU/iqP4lcSz/8y7FjgEYNX6qsmZ4tpo1VcS34DHEsPIXZG3BAqm5/BiWpSLf?=
 =?us-ascii?Q?XvGUyCeu3SlJiby4t3zg1sBcn4WpbhpDVem8Pevvs0YHmvgzxYF+pe3QU/04?=
 =?us-ascii?Q?7sTvpB5eYLExhl1a+PIFhHwEXsEtJdnkUGV0+Uh+CpWXevYWEkARMrwUZI42?=
 =?us-ascii?Q?tmASYGwcYeKqnyf9PkIJWc8WZqbo6vvqRbkCaEJYflsKv8OOySpjMgVvF7ea?=
 =?us-ascii?Q?Ee7fQXi+PnHyFm05YREUP0KdB32g65/DASzmGlBNdv2gWpbYlDC1IVHu54zb?=
 =?us-ascii?Q?tI54VkF6QYtqtVdnctPdBDcb5urNejfW7betec4yxUtEmWXUISAHqXnBiOfl?=
 =?us-ascii?Q?Qd8sKMRy0/qDrfn+FprjvrcvYgd4zTMW+ODeQrlRmpH7T0s71ZxXTm6/6FYP?=
 =?us-ascii?Q?O+B9DhIR1DyPuA98LWI11ZODJ8d+9Z9oalJJ5maXNNR6qdZND0jw3555UNSi?=
 =?us-ascii?Q?noQardAY2JtIw5T6z5hF/5Af38ty1cBo854JOr50LBPrbNhCruhPsDWccapC?=
 =?us-ascii?Q?M7ItrZpoulTm6SUtaf6f3ymKjykZz4Gufa/Qqq723h3HTrYArZWmqXto/YEU?=
 =?us-ascii?Q?BRjYA9vHWCxnY9yGJgXl3HnQwdxmBfMtCQQv405GleRvAwdP62jee7UY8h26?=
 =?us-ascii?Q?NYqGWkSRKBZwh+3iQddERnT5WPOQwuZlXovfOAT7Oj5KdpDoJ/d2r+OzKmYY?=
 =?us-ascii?Q?BB5Ci2s1odFEAXin8BX8maEbJk4S/f4ATihRiZEgGUYXO95kjHtjXBoBYmqE?=
 =?us-ascii?Q?cQNjkv+ySNdfB6Uoo+1RwD7z7HOTFVz6/Mx4O/CNoX3TTcRu8dtNL1kjqEsx?=
 =?us-ascii?Q?JKJU45VQvm0U35xUpBEJgWW64F1qBGnUlWC3hNHNc6ALvo5q3A6VX7v9ISl4?=
 =?us-ascii?Q?I3byILJp7iGXT/0X/TBWKSYDeh4NgHKal4/uG0P1N/Qb6BqzIaaBmXfkmfEm?=
 =?us-ascii?Q?DisDbmaOr8jd9nMi3I1BuTjgdOKDFhUdbQNfEHp1O0RWd5bV6/ffOHpb9i6c?=
 =?us-ascii?Q?yoq+QzuUHHr9GoEGkrfOxFvxVLbZVMr1W6dQ8yWGhS4Uq611xOns0IG5wUoS?=
 =?us-ascii?Q?9ua2pApiP+E4zi9YZooyziAYvmIGh4wY0mOK5ihvJEIHcn4OSDwhy2xJV0Pf?=
 =?us-ascii?Q?rdpRYFCtKb44qq1KnxCXo00etfBrIqpYHIA6JteOWc3kOkqWLQMFmgYKq3Yb?=
 =?us-ascii?Q?1CA6vugb6fUqmoFowsWDuXW2ZpK+49AoMo8OBdicmL1qce6x8SKCSAHzfYxl?=
 =?us-ascii?Q?Z383RPIzP7KHb3TNgY1pl6TzRnGpXK9iFwNZThaFcJPfym1ch2SH13fpo5h1?=
 =?us-ascii?Q?+7bc5HGfsKc0Wt882XGDaYKBHQKrT/p+?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(35042699022)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 09:57:07.5093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d189dbbe-071b-44af-7acf-08dd50029ae8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8960
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 17, 2025 at 09:33:10PM +0000, Catalin Marinas wrote:
> On Mon, 13 Jan 2025 17:06:16 +0000, Yury Khrustalev wrote:
> > Add PKEY_UNRESTRICTED macro to mman.h and use it in selftests.
> > 
> > For context, this change will also allow for more consistent update of the
> > Glibc manual which in turn will help with introducing memory protection
> > keys on AArch64 targets.
> > 
> > Applies to 5bc55a333a2f (tag: v6.13-rc7).
> > 
> > [...]
> 
> Applied to arm64 (for-next/pkey_unrestricted), thanks!

Thank you!

Kind regards,
Yury

> 
> [1/3] mm/pkey: Add PKEY_UNRESTRICTED macro
>       https://git.kernel.org/arm64/c/6d61527d931b
> [2/3] selftests/mm: Use PKEY_UNRESTRICTED macro
>       https://git.kernel.org/arm64/c/3809cefe93f6
> [3/3] selftests/powerpc: Use PKEY_UNRESTRICTED macro
>       https://git.kernel.org/arm64/c/00894c3fc917
> 
> -- 
> Catalin
> 

