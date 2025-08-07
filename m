Return-Path: <linuxppc-dev+bounces-10705-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB21B1D1C5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 06:58:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byFLS31Rhz30RJ;
	Thu,  7 Aug 2025 14:58:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c202::7" arc.chain="microsoft.com:microsoft.com"
ARC-Seal: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754541051;
	cv=pass; b=SQaBt2VMB72uKsacQ7HK8jI6AuNSiI0aU9pWAh7wD9Op+a3PYXF2zKjxRAJt6gZV3x1DC9mOd/hjHrZwIXlfVKVz2ZSBCaxF2Qy7F0mqFjueA7b1TZI9/l3hvmhTe36/pav+K/Xtx7wrUkzLgUMbSfLnXNJ6ffBg8xxmCegUu3gZeC+ylNslb3TWEXca54Ho7QhkEo42bX6GrLIoIdT7dPwvbgx4UOwkk8NN4t6eoJj68eQEhX0IkBUMBGChIENtwbKh/UpAKMjZlXKT0raIpV8YveSgTlHc3o6GvMx05InfcSAsG1OJ7Mt2g4wkVVQsLTYWq2UGlXsyMu4wXOaP5A==
ARC-Message-Signature: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754541051; c=relaxed/relaxed;
	bh=zSHa0SRznIuWrNmd0ErUKTUg8seh2jid2ZPMg3WVmZ4=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=EHTaar+ozkIcQG7kwdDoKluHExT9HFqt4q5rcuDoGLve7d81Bwaqs2ZeKjl/eMDyitYuk5OQ4cRQlADuM/3P8SCor/G0SNpWjoHCQkcdfP4yidrgmA8oXAhsRQLd50YngNXFcHAGewTchOrkV0o9/zu01gAJXazfqBen96xGYJOjLCcG52sbPIkXR4RdZ/vGU65L6jEXPZ9y1Xv+u2q8iLgQGn4afZblP14DJ+ZigeIe3dDFNGXWHImD9jBFsR8VO6uQIU+V0uvcyF70gz5shPQKR1VJe+QpQQO17QfooKLYNr9LUxBVP4usuh3X8dpyG5xdGVZHpVfrOcMuxg9bkw==
ARC-Authentication-Results: i=3; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=ZCaDz5NK; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=ZCaDz5NK; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=dev.jain@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=ZCaDz5NK;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=ZCaDz5NK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=dev.jain@arm.com; receiver=lists.ozlabs.org)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c202::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byDk13GV0z2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 14:30:47 +1000 (AEST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=G/tfydhbDuaig/NVV90I4dJ4QBVyn0A37lHXE4FAm6HdI/ApweeMwYSso44nSAhjaYPtaAyLmRHPsgu5xFb2MCDIX59zKR1YPE4V3cqVUYS6O66vwd2kpw6W99MaOjynq4sf8TPufvxS+6JK7LK4xOp4+Xnn55PHhYdaeRUarCSw3zjgtsQaCVOT6c7nD5NK7xrgCEDF/r+CcdjppDXPBwXeBA8XUgTH9ZySh284r4fzrumjQZq0edcJaBQUt39XbVyt5IXfTs4bBRqQUpqbuhdwUvC1TfZHD1U1CUad2tnocigU1YpwGlqpKsGCOGMLCWgMOIb9aaB5YI13dNUyIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSHa0SRznIuWrNmd0ErUKTUg8seh2jid2ZPMg3WVmZ4=;
 b=NW86vmoT1ynpGGPQkZMhNFARsULSx513u853B9QoMpaVKwVqUtUkdVmfjWSeuHLrGd3Q/HdKYo6YyPiUIYVvX3z+btdLg2DLkK/kp+GlU2y9EMVzLWAoa7CwkGLNKK/msI4xhOB4CNQsxUTwr5MU7CLPmAB4sIn4p6eJEefe5i/bJJefCFUJ12f98QftF13xfNGpI2EEFJFtDc+0CNlbu3r/7SYPGaI7fOj7XRfJqLx2ouMQUrFK3AoMt0/pHPv5HhQAsXdM2bm5KjsZhynVA1ZcS+2PpYvA++Jnqw64SeUHFLzuRZE+azP2gxHJ2BUP96TM1b1HLW6X9DbQMl/zGQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSHa0SRznIuWrNmd0ErUKTUg8seh2jid2ZPMg3WVmZ4=;
 b=ZCaDz5NKV0CJSQjtp+QES6+Ku8ohJaPwRs0zUahj+qDTOk5P5bFz6XZS8TpE/EAsZjfQrdof+/ikN5G2D1hxjOh1zrfEqnWeQgWh79kheZLt/TJmOAHWsUKVUiKRst0Cb0Kh692VPTGngPvzpW97B3dGpDujNBTQ3G6OpVv4HpY=
Received: from DUZPR01CA0304.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::6) by GV2PR08MB8678.eurprd08.prod.outlook.com
 (2603:10a6:150:b6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Thu, 7 Aug
 2025 04:30:20 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::1e) by DUZPR01CA0304.outlook.office365.com
 (2603:10a6:10:4b7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.15 via Frontend Transport; Thu,
 7 Aug 2025 04:30:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Thu, 7 Aug 2025 04:30:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwT3G+bpBEA+b4Td4E4VONriNxG27wgbAWdF2OG822qujyoC418K4B7Bjeqgh61UXaYaWsAbZr3ojgHOFmjummCLCsHIogS02oAT+7BV5WQvA0ocyQMDobjBpcB5YeQwoeuwgO0uuUDFkEvTtaSK0VxpCKyI1ux9HlWVrcYXK4Q25/sP+IZXFS462MLz6SFxEBKiZrSVA5ySOGLIQADuRNsBHpXpWiJyMPiVQ4l7xJ1kd2v9ZmBTKXqMbfABHQfs6tt1zzFOvXuV21kZFB0TgYbyQqxC8x0qbplcrU2ecf8TPr+J2K98PxgKk2a8vqPWuA3PVb7lolcxI1jZOzuc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSHa0SRznIuWrNmd0ErUKTUg8seh2jid2ZPMg3WVmZ4=;
 b=UrCZpzObgBBgWuhXr5b9UCqjpVgzxH0N+eJ8oHVChGpTr0xhyO7LlBAnxJmCDa5tzEYaJa+eao/VokPp6oq1cZ5hEpXqpZM46tQ9kPZuT0SeZi159dPK21/S3cPq3V63eWDAF0rMIAKp/4XCGZt/qtPfJPYGmFOYxVvWtUGuauKgUNOkUK6phuHlyO2r7ArlxyrmE4hxfSpq64XgP2TZDbA1nXWuie29Dorfw9YHVplLjeMOk2q3T9zgtUvS6hEF6u+Y9QplAxAPxQprGcSMBI06Zim7iXX2jdRwBbUhbuG+QXFVKFxIxZePxy8DfuBudfikPYY+lZj7HkGPHb5Kfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSHa0SRznIuWrNmd0ErUKTUg8seh2jid2ZPMg3WVmZ4=;
 b=ZCaDz5NKV0CJSQjtp+QES6+Ku8ohJaPwRs0zUahj+qDTOk5P5bFz6XZS8TpE/EAsZjfQrdof+/ikN5G2D1hxjOh1zrfEqnWeQgWh79kheZLt/TJmOAHWsUKVUiKRst0Cb0Kh692VPTGngPvzpW97B3dGpDujNBTQ3G6OpVv4HpY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PA4PR08MB6048.eurprd08.prod.outlook.com (2603:10a6:102:e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Thu, 7 Aug
 2025 04:29:47 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%5]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 04:29:46 +0000
Message-ID: <13ff700d-1dfc-4758-8621-8efa84481c73@arm.com>
Date: Thu, 7 Aug 2025 09:59:42 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: npiggin@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>
From: Dev Jain <dev.jain@arm.com>
Subject: vmalloc huge mappings
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0048.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::14) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
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
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PA4PR08MB6048:EE_|DB5PEPF00014B99:EE_|GV2PR08MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: e0e0f5de-3974-4601-6ad9-08ddd56b1e41
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?eWRLQzk4VFJXV09WRFcxc2NaYml6L1dXRHJQUml0NFNZYzhubmR1WlV5bnFM?=
 =?utf-8?B?bmMzWEpDeWY0Z2E0R21uZnVpVWRJZG5BUHZHdlhMNGtDY2xrdDQ1SnVCQjJx?=
 =?utf-8?B?dGhGbGpnQkN2Sm9QOUY4ekRHN1BQQ1VyMlhFalU5eFM0VVJMUEV4MHFRNUlo?=
 =?utf-8?B?ZkllNWtNaXZ2MmlWeGlsYlZrRjg3SEdqcHVjeWlJWDNiYXRMM0JLaGM3dnBV?=
 =?utf-8?B?TUU4SFVwaTk5MzVVUDhsdTBUWUFiQVo2UDFJcUhFMVRLc1FYZG96OEw0R3hF?=
 =?utf-8?B?aW1TMmYwdlErKzZYR0xsbDFKbzNjTjNMMjZIdEhkYnR2MDJIWFA4OWJmc0x5?=
 =?utf-8?B?NU5WOVB2eHNRb05DV2lHLzltR3MvcjNlS2VkUER2NnBvQ0RZWVRaeGltWlNU?=
 =?utf-8?B?TlIrYk5LUkFPc1hRVkdBM2R1L09nOEwzY2tJdW5PV0E4SnFzeXVGWUdZYWFX?=
 =?utf-8?B?SW9TeWVEcjZkWVEyUDJ5SE0rZVdSZ0pLTUIvMTBOWmFZb2pnSDFJSGFDdU8z?=
 =?utf-8?B?UEQvbzROWHU5bW94SEtEckRSM1RIVVhIRU5OcjVjRE1FUCtTK0tpc3dyMVVP?=
 =?utf-8?B?cGNIQVE5V2xJMDlPdnk0V0dLRUd0Q0NacWp5djlSaXlFaFZXZkxRMGVzRnpX?=
 =?utf-8?B?TFJLZHVOdTYyTlZhN28zNEM3R1lpMm5XNnlrODFnUU9sNllTaElHdFVlZU9D?=
 =?utf-8?B?azRoS2huVnhnZU5PR3JjSFJ3NS80ODdCMllBc2E4MUd4VTluaEcyR2pwSTl1?=
 =?utf-8?B?eTQ3UHdwazQ2SXFraTdGRmFZS1M3VG8yUlZRRGNqVzA5eDgzQlcwQk1FV3cy?=
 =?utf-8?B?SVVxM2EzTzFtV0NiMEhNUXFBZ0Z4Nng1WGphdno5Y3ltclorK3J6NDZxcHZp?=
 =?utf-8?B?ak9BOGFWUHNOd0tnckp4VEhjdFp4Z3kxYXdWOXJ0RWMwcVBGKytNbURGRm51?=
 =?utf-8?B?ZUNUbVdqR2tBbEtUekZpei9udVpIYm1YdndmejdZcXU0dWhIVFJKRW05ci91?=
 =?utf-8?B?eE9CZThUM1RGSDZmc2xKMDVYN3FSR01ndzlHWDl1ekl1d3llM3VxQnVyazll?=
 =?utf-8?B?UzNPMkxZSkZGeEM1YVZDTU5xWVd4NEtRZkFLcFpOTDQ5VGNqNzhnSkt6RDlI?=
 =?utf-8?B?ZksrSm80c1Bub3pOamhtdG9RWkdhZm5xUkUvZHQza2plL2xIRytGRVZNYXVL?=
 =?utf-8?B?dG96MTZRcWlOOG5EazNZbGZtbzhCbkVjQnNPVTdWd2RDYXQyNVhVYVZTVExp?=
 =?utf-8?B?ZDcxZHpxMjc0Tnl5Y1VXdk1EN3lqOTBxS3h2aEhoSUlvZXhlRXUrRnB4dVhG?=
 =?utf-8?B?NExZZTJZQ3doTE0xUlZXVCtMSlU4K0x4ZUplaFR3VDdYcEVXcDEyMFF6a2o1?=
 =?utf-8?B?elo2cXB2dGdhcVYrS0c5TG5kVGdVMDFLOWRTWjNpaUxEV0Vva3N2VnVxa08v?=
 =?utf-8?B?RXdyTFptMzNJZzdwN0EzQjVtVWw0WHpPWDVHZjNBVXBpc1NGditQUjhiM3o2?=
 =?utf-8?B?N05OU3VYdityUFJtQk9URUQ0QTMvYWN5OW1KNWlvM0RZQ29iQXJ5dVdSWXNl?=
 =?utf-8?B?eHhkd3Bna2ZOeDhFK05VYjQ2dU9melRFbGo3MmJYaVRweHduaVdUbFpFUHFB?=
 =?utf-8?B?QStuOUhBY2Npb09jM1lWRzRsZmNacjJRUFF6VFNSSnR1TmYvZVBlUmsyYTV3?=
 =?utf-8?B?YnZhc0xnbmI3QXN1R0hpd21oa1dKdWxPczJJeVJPNlN6cHJWdmdmSmlrZUFr?=
 =?utf-8?B?TzV6eVNEMy9waFZqVTlvT0lpZTRENVpTWTZwdk1xYTlUaFNlNVNaN0dHTjRt?=
 =?utf-8?B?enpiUFhISk9hMlRDUk5lRElFWUpDekZ0R1V0c3ptejQxamxRc1puRGx1dHY5?=
 =?utf-8?B?QWU2WGlNMGlVQnVjZ213SjgralRQNndTalEvcXF4SnlrT096TjRqeG5uVTBh?=
 =?utf-8?Q?TZWziVTqRfs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6048
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	947a119d-fcc7-4c70-49af-08ddd56b0a1b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|14060799003|82310400026|1800799024|35042699022|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVpTenZ2aSt3V2o0Q1ViZnlqTnYyM3RwTjdpZk1oeFljS0grNnFBeW5EYjk0?=
 =?utf-8?B?eWI1NWQxdDRoZExSZDNXRkdEYnRsV1NyZGJ0RkVPVzM4M2ZxKzYweWwwbGZu?=
 =?utf-8?B?RUlvOXVaUjdlS2k4d0pZNzdoa0J4MHpxbmk4cnkwU0ZCMkNSM2YwWXBlRXFu?=
 =?utf-8?B?R2kwd2tzL2pPUTNlSmRMRUUrMHVpRzUrVTR3VEt3dkVIeWJmc0hxZzBWaEdi?=
 =?utf-8?B?ejZyYmJtZzM3VWFBMWtmcDVBS0tGZW5qdFMxUnF4S2ZQUDNXVGYzRGtuZW1w?=
 =?utf-8?B?M1h5UGJ1NStoUFdGR2xvNElISllKYS9HK0o3VzI2L2didHlMbk9kcFRKM0Ew?=
 =?utf-8?B?UklLNk5OZ011U01yelNwS3Z0aVpWTDZlKzlhb2cwbTlSSjhSU25xYTRuK2xR?=
 =?utf-8?B?NVBPVkZmeVU4Um1UQ3BsOVFPMlRRYXppWTJKY0haY0dUU0U2RFhxazBwaW5x?=
 =?utf-8?B?eCtnTjc5eWxqZkRocXF1a2JFZExveVUzK3lxaDY0Qks4cTAyc0xtSFppOHRP?=
 =?utf-8?B?TUJFd3N5TjZwQlRBTTVUcldNTUlyczk2QUh4WmE3QlVvcG5oTDdVWnUvNlRJ?=
 =?utf-8?B?UVZhSlJud0labFU4Nmk3Z3lnYS9VNWxUU3BBTmRKRm1FVGZiYTQxSDZUZHd2?=
 =?utf-8?B?cmFqUkJXdG5mRVExSFdaZ1RsTE5mblVMZFFTRnd4d3cwVkcvRjRjTXRLUlE2?=
 =?utf-8?B?S2E2anloZXk2RUQybmk1bXozSjMwMytJb3dGQlF2L0FuQUR2eGtmWVdzOG1Y?=
 =?utf-8?B?UU5oZ2hVWTdvZm41R2lPdEtoUzBKRmZFNXFrS0dLbGRvRUZ3WFJmUEFScHNy?=
 =?utf-8?B?Z3BnSzVtOEJoL2pXd3o5a216ZnllYStpVGZlTzh3amZnOGd0M0V2eEdVNHho?=
 =?utf-8?B?Z2FSS1RPQVRSMG5WcXJoSndRR0c5V1ljclFnRlFySEFjYjFWSmI2dHpMdC84?=
 =?utf-8?B?bVRudE1COFlnK2lFV24zVE9jUG1TSThKTXg3bjkySk1lKzVQRVk0S3ptc2tu?=
 =?utf-8?B?Zko2bWFlYUVYY1RzUzV2NXdxeHk2TjZ0L3g3cnF6VEVtTUpUT1FKbnpYdjZC?=
 =?utf-8?B?MGtDNW1WbFFrMzFudkpIZmJzQnNrSDBndXZyczBqLzIvYTNia2Ixa3JQQzl5?=
 =?utf-8?B?MEVvdEVGNnJHS0ovZ01ZRnQ5QWZHWS91YVZkb1JoMVdNZm8vNTRwYXRYcjBq?=
 =?utf-8?B?U3kvcUcrT2pjYmhqb1RLeFczNHNRYWl3S082VGwrL3pobDhWcytIRGVoVVZw?=
 =?utf-8?B?cU9RREFZbzRpVVdQYU9xTEFNUGlEenhzbEpmNnR4aDZyb21LNVF4bGcxQ3pI?=
 =?utf-8?B?TEw0SVlIcGRxNUo2Umg3ZitrMGExZS9VVUI4YkVmZktvTWdKekdhVVRtMkp2?=
 =?utf-8?B?UjZWazdtOGFXLzhkQnlISFF4N1hjWlVGOCtxSTFuellmK3RpU0E5dlVsLzJ0?=
 =?utf-8?B?dGkrWGdZL3hwZjhVL0lEekE2NkpIWE1aTDZEUzhnU0RmSXFEMWRZVjZpblQ5?=
 =?utf-8?B?TXNzcElNR3BNMWtVaVEyMHpRZnkrZGI0dm5WN0Q5a0VFS0V4NncvYmtiZTFS?=
 =?utf-8?B?elAwZENxbWplYWNBZ25lMHg1cldYY0pPdkVZU1VTMzJ0Tkd6ejFCU1dLTmxh?=
 =?utf-8?B?ZHBncExoeEJvTStrTDUydG5vdVJKQktHakxsdlJreUN3dzcwSE1HK3dSWmdt?=
 =?utf-8?B?SWNHa095c0EwTmJOVTBFTmJtcjVmQUtwb2xnV1p1Q1ZqcmpBR2NPTmpQM3lP?=
 =?utf-8?B?N3NpUUZiUm1oQjNjVXh3a200NVIwdmpzS3h5UkFLYkVZUDh3VlNPbUp0WHNM?=
 =?utf-8?B?bC9EWEpMVkZJdElDVzNNcXM3K0VRR3B5eFE1aDdBdEt3U0p0RnhkTUcwT1R2?=
 =?utf-8?B?SWtQNGtManpHY25NR1AzVklyU2d6RHFtMlpFdSszNnNhRkdmSjJ0QTlnaDI4?=
 =?utf-8?B?QlZiNFBOQ29PSk1hMzFFMTROR1Z3ZUVrRm9oTndqNExJNTdlZzJUcnRLUVJY?=
 =?utf-8?B?MFAyVDFmUGFZZlhvRlB6NDZxTDk0YjBMaDY3WG9NbWtRTG1ub0UzNlBNbVF0?=
 =?utf-8?B?TythZ3JNd1lYb0NhWk5IaDhEYVMzSzhmOFA0UT09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(14060799003)(82310400026)(1800799024)(35042699022)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 04:30:20.1273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e0f5de-3974-4601-6ad9-08ddd56b1e41
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8678
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Nicholas,


I was looking at all the previous discussions at [1] and [2], wherein 
vmalloc-huge was

switched on by default, and then had to be switched off on all arches 
after an year...


a) I am wondering whether ppc supports vmalloc-huge by default right now?

It doesn't look like it since the VM_ALLOW_HUGE_VMAP flag is still there.

b) From reading all the discussions, I could only figure two problems 
with vmalloc-huge - one

being the drivers operating on tail pages of a large page, thus needing 
us to split the compound page,

which has been solved. The other being partial permission change. Is 
there any other case I am missing,

or any other problems you speculate?


[1] https://lore.kernel.org/all/20220422060107.781512-2-npiggin@gmail.com/

[2] https://lore.kernel.org/all/20220415164413.2727220-1-song@kernel.org/



