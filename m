Return-Path: <linuxppc-dev+bounces-16409-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WE9/Grfse2n+JQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16409-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 00:26:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E26FB5AB3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 00:26:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2Fdt3dqDz2yFk;
	Fri, 30 Jan 2026 10:26:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769729202;
	cv=pass; b=IobehGBmDS6h6JnqcHeZ98ZGXQw3cVIPjvajjD/0hsQAVFXTeUaJoYel+PpRh7YoLKsWNDAkHyDwBSIJ3DfsscotY0IbSbCK3926hSHO08m2UH7u7HlF5iTPce6GT3xX7aEV9VlIbQwJ/HUFmddKltFj3gWmqyvvkGM9B4adhA3pFPNKamPOwdiPObJgVzZtnZApHAWU5wzEIq5Z/TgJjhb8vNxc0lwd8RqYhoYwxKb051CZRPob2TT/IyZCInv3mNhn34kxamGvLTs/wEiOL8BEDJrGsdn/sMIU08jdZxNzzxJu1g2vGbJbfcSidQIEqdzBRXTAFJaw2O8I9wg/MQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769729202; c=relaxed/relaxed;
	bh=VB+cpJwzr64rdHFnRDYWbawdDIFzQ2wHQokcOr5R9p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ljwQ6jaPCNF+Upi/R0RlxZvMD1reMcFY2R5YkjiCknCT0jAkXtlQts6nZVj4XMJdlbT/d21PH901nkkQbfn6G4TnO0oqTcZ8Jddey/nw25qgG8oSz5nUJh9rviTmflqm9iSKcUbMU/fU8WN9bwDrq+0qntkZ4UBCQJu0TyYAuyj7dbWFHj/gvgq93up90OXo1ylKMXKkzwLf4S52A19LR8eM47iJmICxqxnBMB3+8MftL+5/QB4bjNHfHfD2ett7945yf4aJgBVh1z0BgjNmOMF8K7THKL46tifM8PAb+Ao0eVe1dh/5ryEmuheFViUMfdZJCxloqbxM4C2PkR8C5g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DEhI4V+L; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DEhI4V+L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2Fdq73VYz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 10:26:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqsqJJ8GNIxSr/M7yOmpUjEfFhhJUSG3/L7pQkrwvPrNQtErZxhBJvJwA4ieeAm7X/ZvyPZ3SOsSNeuP0i1jf+KW/y+/CAeyBadtHSPhPdWrN4bOK9T22dn9/+48gb5Likz7ZHsH95x3dgVj1q5JODQYujyLjQNMZMWLaQIwsZ+uEryOpbQY/GF9auMuMQHeVlF8Bxm+u/QvdbJt8LHdzfXGpui+EO0d5mc68zbiWfWpOSA/TepBbudRUWmlo47LlkAN8J9Pex5kQTPpRx+NT1QB0xLXQytV5jqUEUoFF+rmzIUGTaCAhmYa25O+tOkNtlvDQ3LDGTQ6yqL5nG3VWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VB+cpJwzr64rdHFnRDYWbawdDIFzQ2wHQokcOr5R9p4=;
 b=jDZKiyBJwZMN3PqglrcRdSFCbbfeQYGbKxHhpzvhd4ndDCfia7EHG4C9p/aHkCye65OYWYgYHNewWpRcU8F8u+EY52C1lLBbWo4yr6NYm/k1DFOm72j3o50HmFTRGAcaf76anFg2ML2WfWxKJV99m+2HWImfZtPXWKpgcFUftdsTFWHeD4FfdiyA23UuwURHPhzQUqUzB4asMx1/YD9rUAbLIUToj+zFp50oqlNSGU2MNiR1HeuSPpD5NLv6nVMTlq8qtmpEv+c5NJigNamFlMvF+ffRT7chMY4QP3oKJ44yqAVuQ6LinU3gW/dy8YBikXooz0QyOLwi/iCBFPphjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VB+cpJwzr64rdHFnRDYWbawdDIFzQ2wHQokcOr5R9p4=;
 b=DEhI4V+LIN4X1PCrJ1rSda1zaCBpXYdA90S1doqnjqJfu+Wz8u842zES3bQGff9gFQyBWwPVSjw46QwqDst4XROXtRN8tDHFBtQfAi6gE6pA8vyPD1+HJFcWUIluRWPqaNvXbdD/cjBTRlQFRbnvCVDE9dAnfU8ZdKGXJJ4TO1RIPn2gjyxyJGPznORUvyDfaeyAksTcwzPX3rkj1DcYkKudZy3c5pCPWu5h7UCYvqmuzPSCBGdTC6LRpS3SwS8bb0I1WR+xBTI19tvpPYucrLpVMDOnXzFTTwvwGqsv0ek+EdMspTPK56/59i8i/4kNvjVXuUHr+jovQ55WGQyQEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by LV9PR12MB9831.namprd12.prod.outlook.com (2603:10b6:408:2e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 23:26:14 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4457:c7f7:6ed2:3dcf]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4457:c7f7:6ed2:3dcf%6]) with mapi id 15.20.9564.007; Thu, 29 Jan 2026
 23:26:14 +0000
Date: Fri, 30 Jan 2026 10:26:08 +1100
From: Alistair Popple <apopple@nvidia.com>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org, 
	balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, david@redhat.com, 
	ziy@nvidia.com, lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com, mpenttil@redhat.com, 
	jgg@nvidia.com, willy@infradead.org, linuxppc-dev@lists.ozlabs.org, 
	intel-xe@lists.freedesktop.org, jgg@ziepe.ca, Felix.Kuehling@amd.com, jhubbard@nvidia.com
Subject: Re: [PATCH v3 00/13] Remove device private pages from physical
 address space
Message-ID: <7thz2ezooku5obrfzdqlatm2xzelb7dd2ulvbuzodpxyim3lqp@xzmdhxzc7ir5>
References: <20260123062309.23090-1-jniethe@nvidia.com>
 <875x8kbkaz.fsf@DESKTOP-5N7EMDA>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875x8kbkaz.fsf@DESKTOP-5N7EMDA>
X-ClientProxiedBy: SY5P300CA0079.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:247::23) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|LV9PR12MB9831:EE_
X-MS-Office365-Filtering-Correlation-Id: 528ef009-a6bf-490c-bbb0-08de5f8dcaab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GcPo7KKEwlBdgfHFWcveNouBDO1oJt5H8qPA37MeSbDKS5YSODrzlcbmfyZg?=
 =?us-ascii?Q?wSZmfOZ1GBYishc1WaON4KlGW1aPACEg3RVSfDLVjFzp+TVgXgoy7vgfdyHp?=
 =?us-ascii?Q?/aBrJZSWEO50+AbupyOAF819yB5OrqlkcfJMWyhTfgdDIpB0Dttgwt4pj1/V?=
 =?us-ascii?Q?1MHEcTLfg73bb5Kv2rg5d4x+uK11UV+Ot/0K0+ESm9AiVC+VXMAY+9amtXG2?=
 =?us-ascii?Q?094KsSCkAUf3yEaDFpEw8pvlw3zH3CNc7go2BGw5KM4I7HfcPcFPRBS45+BE?=
 =?us-ascii?Q?Hy/vQd/3nazSBtK9tY+BSl92WiKcyMs+ovCGbevJJb++/O23/EuFmRYmJort?=
 =?us-ascii?Q?/fOgh4+B4bf0LTpf8EYQJiicELWIjqp8p25JTBbMzRUDR8BhemeDLoiaftaK?=
 =?us-ascii?Q?PunOh3qrQKbc16ry+H07Pa0ADTAHtNlFc8SpL5tYwEvZ5xgRETp6bSvvUiRs?=
 =?us-ascii?Q?8XTb9hz+kROF856KSdcxulDLwFdTPRrhsnLDoX7FeA6E45LhbFYkdw91B1/r?=
 =?us-ascii?Q?gt8a977kBOZIDqBUOhBqMpIF0aSfULf3rxMclCNBlfzYvB2fcwVfsqcdfYhP?=
 =?us-ascii?Q?dPEephUJ63hRmUOO8z1IbzsDCBpgRHIq/aKJWooFaXPQyYvVlu4qjxJ36wba?=
 =?us-ascii?Q?YwfJ9TD5RrpwAqVg2ET6WudCucHGLCkUsCg2Gy9j9B0Lze6R9RD244EpF0JO?=
 =?us-ascii?Q?e0Fvwjta86/aIbA8nnIygCH8fU14s5Dh4VqaYItIQVEfHLozOSB4S0qDjmWi?=
 =?us-ascii?Q?gaJd4zn6GciNNTBb6qY35LgC5y7APRDlbnzB5lsT95Ktrt2E8RZDQG4MM3YG?=
 =?us-ascii?Q?ReVqf/WYALCugoME6Ue5foS2mp+prvpohBHqNc/JH50isk0SMb+TU8HU18NS?=
 =?us-ascii?Q?zcjKRa2zCpCO4/fXD91VNB+DKcD24rP/nS6RXFeB9URnDGDxR1wbRkCokHAH?=
 =?us-ascii?Q?ZYXP8Cn6Aw4uKniHY/dsroXuJxhuDU731EE9JFmiADAKfldL2/he+Df2udZU?=
 =?us-ascii?Q?7g6PnqfOlTjCfVO45rrYFkmXcW7bp2nLDWu3AkLdKWzJG1SFSqVGhqU4cVDj?=
 =?us-ascii?Q?iuinqtxbhei/fDe7iiTjehS8TFYYLASJPLzJ5k5QXWyBB/VGKaap2Tpp8hpJ?=
 =?us-ascii?Q?gh3gnT5PeVWZoro7YmJ9WJbleIEqymkZL1hi1PvfAzGT12xkBVK0/3uB+Nns?=
 =?us-ascii?Q?k3POHUbZxKSYKqyRElzkqKsZvWbt7+g88BourOENBSx+vX2i6xuDZ3qrcsxI?=
 =?us-ascii?Q?ep3MbdVeMMS3z++pBUFAuswbsGPcKra6LNaFjB+Lpn+H4EjF9SlQNmFXPaO+?=
 =?us-ascii?Q?XIL5MZzL9/QkC1BBgGl6M4DdqDdygCYwHgoGRue1BYzdOzhP9xEAKt/R2+i9?=
 =?us-ascii?Q?lRNGrBLG3NDlf3L4LzYN5NlCum+RgDAdKKg0hvwmJA18SIpPD8MMjEZbV1lp?=
 =?us-ascii?Q?jF2iH2DYX5K02KHk/VEXvYMx4A2SsiQVEEX+L920kDyECS+rsh2gX9Wwe2ki?=
 =?us-ascii?Q?zHf78OYpT26mRb9ctDzGndEM52I3GqhrU4yE+ixR54YGn80aW9d0M4tYWu+c?=
 =?us-ascii?Q?5JSVPDutn4//0p5iMHE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7705.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N9RLaqu7nGQGGQste0sDhyZFm1As0MaPMhNRIb6DuCo8jREErsrh8rvxshHC?=
 =?us-ascii?Q?HgNGZ0NJ0HDZsRq04Pj3SEwc7SFFVff3jmWSNxPrLH0F5SCVWM3QbYNs6vom?=
 =?us-ascii?Q?Vms7h0CtSBjWyLax1NAO054bsEKglj19CET/SAeHNrD2LjgwJ1JP0JKR9JEg?=
 =?us-ascii?Q?bqKmXMWOF1aKBNDkgk6c6CracRjQ5A9k3gk2ZwMLLm4LWE6kjU/DpIR33+vY?=
 =?us-ascii?Q?IKD6DKOGVt54k+YlIUDnOB4YUsoNJsis6W9S1LLMOiuv21muR6wnq2eb7S5i?=
 =?us-ascii?Q?4lHlNEN02OvW3Vl4RlnMctAEKBXaERyjOjVRIqB6MFsPG83cKIJwsxgtSkXI?=
 =?us-ascii?Q?vAWocgzJvagAvTUQNYsTIZqIpRUgw0h0vpCmxdxzlCGTAK0fIXg97UbT8C7o?=
 =?us-ascii?Q?trwlJc70VCUgGTfV7vWnYMKpU/0YSnKBVvztiQa6zke7KD7uWdbE6iHA8WlH?=
 =?us-ascii?Q?yY69oGp7Qu3zKotsJ3fRZvg4cTPBmQTN7F05dgqyaZ0spwi4963sFj/FoiOn?=
 =?us-ascii?Q?JJuf25jA9NC2X1YVZdWFenB630aQ0Lh68ljm7t7ShDm4xukJbwWYkf2BSTT0?=
 =?us-ascii?Q?wU6+nrZXJT4bHUPJedZV0gtJZPrQwmwjn+NW3PqBa8cUOXD9xZRmFQly8l24?=
 =?us-ascii?Q?PmzkFen1tWtWSe4ei+Y6qbeg4Zv1f5W47bMNiHgjSc7uqPE+OmXnglWYKTqT?=
 =?us-ascii?Q?sh3m0jhz/cxUqUnTutB0X7Gs0qBilCBYqXzYiQ/OtbcKxQDLA/x5QUSm9VxU?=
 =?us-ascii?Q?D+IaG+4dY8AxXhlbARL+p6uLgmX6hwE0xxZ0e6gJa51szQ5xKZIYJ1saEYJD?=
 =?us-ascii?Q?i5GTuGpf9VlqvY7AVETF5XKZ6YatxWPxoGWbNyifxZdWVs2S7Do2rETxLAu9?=
 =?us-ascii?Q?Wht0CATEWYeeDJwP6BE6vgTgyr2vMUXbe83Qs9xenVAuEL7w2ymkqU6Gceky?=
 =?us-ascii?Q?Q/k0wuyT99LxvixoSuabYA1NjIVC0HhtM9Z3c0DXE8FjCWIWXRdsYcXIgc1r?=
 =?us-ascii?Q?1lvUxdjnbnAGtYp3lNc/gp+BC8SQeUL07Kc4EMWATpDxYjBdoNGouQ+tBeER?=
 =?us-ascii?Q?5yrnZDbT6ZyhTsLHQbY3RntzRVWKS5UWEdON8uxO9DMvPvWntGYWs4vrBia5?=
 =?us-ascii?Q?bSZfsTpn1tYxuCbv1Q/okvOf2+pWfKpYarSIyd8U4XlcVTgF17jz1OfxqLLJ?=
 =?us-ascii?Q?As2/RxMhqJz0X2wAu6UVQe+AXQ9s+0Jc7QyGpiUZXIvyEJSY6NqsMQu0z2mF?=
 =?us-ascii?Q?ulswUZQqGyvQoR797sW+4iJM51iJ4FY80RaAJw37QVb80jBxSNwBv5XZSM4/?=
 =?us-ascii?Q?2M1k64a1QtYJXPsktfv8TK9yUPRJHXNVS7SsmKNMyek3TB1HSP+Kp3+ZoCYG?=
 =?us-ascii?Q?t7xPpZ/EfuJZEJa+IA0kzUAQVAxU09g6bWU7LHufhW7aHhEkCNUYdCTrxq3h?=
 =?us-ascii?Q?EJO7raIGU0amqTFBf/4yWMJlQtfiKNgGZ7cgRzwWD9/OOSUZhD2Ju5/UWPMR?=
 =?us-ascii?Q?hMC4rxQeL45ul8xP4mG0vlNJwr48dAMqy9QJsXvL8vseWgZvAbzkHz1grvn+?=
 =?us-ascii?Q?aPgSU/cmGLaHbxW1mzBYk4iOxEFFyigy04nNEATiNfMSL+m/7BbDU7OPRjNm?=
 =?us-ascii?Q?Ln5l2+HNw7Zqxc4aYRDKRTto5ZFNWKqdTJA4gornNiZYWObIkz5auaPaLYSF?=
 =?us-ascii?Q?z6aVolWxf3z8ncpboCK38Qp1MZ4Q5efrS2EcQbMDV0FhWBdiIGOBt+4MtNbO?=
 =?us-ascii?Q?SDC/3NrQIw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528ef009-a6bf-490c-bbb0-08de5f8dcaab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 23:26:14.3457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rCC1gE2a4jOGcPqAThg2mcSARIbrfG8izXdxK5V75GpL4isKcPPWdVtHcb6OPOsUTvtvixM96rxQZueawIQSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9831
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[apopple@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:ying.huang@linux.alibaba.com,m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16409-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apopple@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,kvack.org,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alibaba.com:email,Nvidia.com:dkim,nvidia.com:email]
X-Rspamd-Queue-Id: 3E26FB5AB3
X-Rspamd-Action: no action

On 2026-01-30 at 00:49 +1100, "Huang, Ying" <ying.huang@linux.alibaba.com> wrote...
> Hi, Jordan,
> 
> Jordan Niethe <jniethe@nvidia.com> writes:
> 
> > Introduction
> > ------------
> >
> > The existing design of device private memory imposes limitations which
> > render it non functional for certain systems and configurations - this
> > series removes those limitations. These issues are:
> >
> >   1) Limited available physical address space 
> >   2) Conflicts with arch64 mm implementation
> >
> > Limited available address space
> > -------------------------------
> >
> > Device private memory is implemented by first reserving a region of the
> > physical address space. This is a problem. The physical address space is
> > not a resource that is directly under the kernel's control. Availability
> > of suitable physical address space is constrained by the underlying
> > hardware and firmware and may not always be available. 
> >
> > Device private memory assumes that it will be able to reserve a device
> > memory sized chunk of physical address space. However, there is nothing
> > guaranteeing that this will succeed, and there a number of factors that
> > increase the likelihood of failure. We need to consider what else may
> > exist in the physical address space. It is observed that certain VM
> > configurations place very large PCI windows immediately after RAM. Large
> > enough that there is no physical address space available at all for
> > device private memory. This is more likely to occur on 43 bit physical
> > width systems which have less physical address space.
> >
> > The fundamental issue is the physical address space is not a resource
> > the kernel can rely on being to allocate from at will.  
> >
> > aarch64 issues
> > --------------
> >
> > The current device private memory implementation has further issues on
> > aarch64. On aarch64, vmemmap is sized to cover the ram only. Adding
> > device private pages to the linear map then means that for device
> > private page, pfn_to_page() will read beyond the end of vmemmap region
> > leading to potential memory corruption. This means that device private
> > memory does not work reliably on aarch64 [0].  
> >
> > New implementation
> > ------------------
> >
> > This series changes device private memory so that it does not require
> > allocation of physical address space and these problems are avoided.
> > Instead of using the physical address space, we introduce a "device
> > private address space" and allocate from there.
> >
> > A consequence of placing the device private pages outside of the
> > physical address space is that they no longer have a PFN. However, it is
> > still necessary to be able to look up a corresponding device private
> > page from a device private PTE entry, which means that we still require
> > some way to index into this device private address space. Instead of a
> > PFN, device private pages use an offset into this device private address
> > space to look up device private struct pages.
> >
> > The problem that then needs to be addressed is how to avoid confusing
> > these device private offsets with PFNs. It is the limited usage
> > of the device private pages themselves which make this possible. A
> > device private page is only used for userspace mappings, we do not need
> > to be concerned with them being used within the mm more broadly. This
> > means that the only way that the core kernel looks up these pages is via
> > the page table, where their PTE already indicates if they refer to a
> > device private page via their swap type, e.g.  SWP_DEVICE_WRITE. We can
> > use this information to determine if the PTE contains a PFN which should
> > be looked up in the page map, or a device private offset which should be
> > looked up elsewhere.
> >
> > This applies when we are creating PTE entries for device private pages -
> > because they have their own type there are already must be handled
> > separately, so it is a small step to convert them to a device private
> > PFN now too.
> >
> > The first part of the series updates callers where device private
> > offsets might now be encountered to track this extra state.
> >
> > The last patch contains the bulk of the work where we change how we
> > convert between device private pages to device private offsets and then
> > use a new interface for allocating device private pages without the need
> > for reserving physical address space.
> >
> > By removing the device private pages from the physical address space,
> > this series also opens up the possibility to moving away from tracking
> > device private memory using struct pages in the future. This is
> > desirable as on systems with large amounts of memory these device
> > private struct pages use a signifiant amount of memory and take a
> > significant amount of time to initialize.
> 
> Now device private pages are quite different from other pages, even in a
> separate address pace.  IMHO, it may be better to make that as explicit
> as possible.  For example, is it a good idea to put them in its own
> zone, like ZONE_DEVICE_PRIVATE?  It appears not natural to put pages
> from different address spaces into one zone.  And, this may make them
> easier to be distinguished from other pages.

All pages in ZONE_DEVICE are quite different from each other in their various
different and type specifc ways and often need to be treated as such. The
purpose of ZONE_DEVICE (at least as I understand it) is primarily to isolate
these pages from any generic kernel allocators. So it's unclear to me what
advantage a new zone would provide - we already have pgmap->type and functions
to distinguish different types of zone device page and the existing ZONE_DEVICE
assignment already provides the isolation from generic kernel code that we need.

 - Alistair

> ---
> Best Regards,
> Huang, Ying

