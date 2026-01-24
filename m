Return-Path: <linuxppc-dev+bounces-16284-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oyYbBVE2dWn4CAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16284-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 22:14:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADF17F043
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 22:14:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dz6xz498Hz2xKx;
	Sun, 25 Jan 2026 08:14:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:d40d::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769268405;
	cv=pass; b=E9XnWqjszxTVjpLm/QXxmVhlib9JP3pnBPIRHAaTSrNPwMFBEeTxePuH51XJO07YxapEtCar4yfWNok0iXcofLV6KBzInr7YUiyMW6uaCswb7ohXICT6E3KZJvqpeHgmyAAm/+I5wBk5qDNhzi/PSjrNT4eL/k9Ta65hc+tQy+53DMRVxvt5Og+YOIL6iqrFyoKSStwOiCJoSEPwtedzrF2NRxE02YIbvq2E5AOhCymEC/tqbla4p9qRcZ18n94IV19YLtxcJ/6iiGCrW6LxK8Oop6lLcGiEiH98EPtG7/fMqYUtyBS6D+DRwc58muLoQYEyPsL7Ge9NMrtD6jz4cA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769268405; c=relaxed/relaxed;
	bh=1TJrska4/qS9msIrOix+a7XFoR7rWAO2K8nJvYxJbJk=;
	h=From:Date:Subject:Content-Type:Message-ID:To:Cc:MIME-Version; b=iQtV+18b0iBS8anmoBy3yu72vnup1Gbe+nPPqgRECkRe0EPq0yAbJImL5RYrs1xwWtMn9CpwOkTzCpqdXaeaVVWa2SELVdO9oZVO7wa4UROiyCaslWrl4wFgEQ37fp3cqdXykIz/zD5CrKrzHVqi/nUpPkcTSgV6rHsIFgsVmwrpkn9JBKTA3m2bb/Xk7Yq2MUBJ0zZzBUT/8JlK1NpPaGb4efUgfrK47hrx4LXZisB9ZImJrMcTncwuNHTNRO7jNvVpqH76/DzVlYhrVvi3AbD6J2uZ5c0hZ6uY3d6W6NrYSkR+xbN4aGteTbXwasr/Ij7JP60TnbR6rqWDtsvZEA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com; dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=crbQvI0A; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:d40d::2; helo=sy5pr01cu010.outbound.protection.outlook.com; envelope-from=moonafterrain@outlook.com; receiver=lists.ozlabs.org) smtp.mailfrom=outlook.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=crbQvI0A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:d40d::2; helo=sy5pr01cu010.outbound.protection.outlook.com; envelope-from=moonafterrain@outlook.com; receiver=lists.ozlabs.org)
Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn190120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:d40d::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyzDM5fT7z2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jan 2026 02:26:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zqxp6UZCuSqt+z73dfpICYn0M2XFSpfY3xVydAeG1RaNWf70passslUJm0mHbd+PaD8AE9DjY94tdV7ilfZX+hAvfUhAwa/7n7kdpcoH6ZB3x5FuH8U3FVmkvIrgYJv9FsDZuP1Oq3HiHoLf/AfFmLts6TZ37d/7Wl9xmL0lS0IQWe5qpRBUL0OmXfpenspHGEixi+Qvi7qWHslS3eeITj2PGoUfKfWm+5bJJuqmQYTHsR2jBTAfExy3DE91/DGPWC47hgA5eu8nUl1B0lbD49FxPLrIHi8h7s7pkF+9QoCw3Ws+xVjJ9hwjmzs9TS4O/fhaqIvLp+WQjo5JnuTRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TJrska4/qS9msIrOix+a7XFoR7rWAO2K8nJvYxJbJk=;
 b=HsKHYAWVr+9Jx3GS9PiHxiGQO525tnd0voYxpb5XU6Xqq04+qElvTyybSvPG5Y06N/2g79KwhGfvc45x15hPdn4sFaLkP0ZW/TTFGx1h6Za8GI9DnLdkz156Lv3AYr8c+zkQO+D0GuFApCnxSJ2L/NCeVvOwX4D9ryhS3aSUFyYoxL28Rp/oVSlKnP0A5yOSbQEnZHDJBpIAbU6gFfgfQ1m2kMwj5RrXoPKqYqOgqf80bfbpYdnA4Tjx9pP68ZnT3asLlVW+A4YI2MYGsm0RaYBJNq9EKBdsG2pXZlKUI5+1EGO1sJLn87ZL/gESwDkAAv5JMtQfyXuno1iqVlAcaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TJrska4/qS9msIrOix+a7XFoR7rWAO2K8nJvYxJbJk=;
 b=crbQvI0AGq0Pwuj1codbqCmqhXVtO941hRF1d+CzsnKAapxPLBoYkPG8GQXYMzF70rHn/EYXCVL6gDLn8u1+C1wlxZyoi7x0wM+DkrUgLGb+2Op/GZ4QAq+e8in83JY5R9I7KvIhBR36FBxz7MToMWXBnsACC8YgyD3pytlVHsW6EJx+5839xCdWoGOl0/c+0xgBOxUpgCUQ855sFhYCKQPjaP3PbqqLFUDdqmmJsrPQndidpn6yYE8ekk33CnFqoMjuCaQQJiLR+Y+k4b4Lxt18LqiOY0D/uh5jAFEUuKVRbHF0m8W7sAOl0o125uabkBcPWXpndLYUf+SeH7Ebsg==
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com (2603:10c6:10:1b0::5)
 by MEYPR01MB6661.ausprd01.prod.outlook.com (2603:10c6:220:12c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Sat, 24 Jan
 2026 15:26:14 +0000
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c]) by SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 15:26:12 +0000
From: Junrui Luo <moonafterrain@outlook.com>
Date: Sat, 24 Jan 2026 23:23:10 +0800
Subject: [PATCH] scsi: ibmvfc: fix out-of-bounds read in discover_targets
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID:
 <SYBPR01MB7881AC42D03DB777C4784520AF95A@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-B4-Tracking: v=1; b=H4sIAN3jdGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMT3bTMitRi3WRjw5Rkw1STVJPkJCWg2oKiVLAEUGl0bG0tAIJfPWl
 XAAAA
X-Change-ID: 20260124-fixes-c31dc1e4e4cb
To: Tyrel Datwyler <tyreld@linux.ibm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Brian King <brking@linux.vnet.ibm.com>
Cc: linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>, 
 Junrui Luo <moonafterrain@outlook.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=f7g1FhpB+GrwNVbibH3QaBMbgZBW3Evry53mbp9RM7I=;
 b=owGbwMvMwCVW+MIioLvvgwPjabUkhsySJ51H1iZXzs5yqtApP5yw8XbD2nUKRcG1ufwSC5Y78
 c0LE3jaUcrCIMbFICumyHK84NI3C98tult8tiTDzGFlAhnCwMUpABO54MLwP2tvpVzr/dQnItdC
 zzo6/xDROPR6Q5eey4f3Ry4WTHAtKmFk+Ov8ze76N/b1DmekW9tknN/rMv6rLNrQf3VHl+ykXUd
 F2QE=
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-ClientProxiedBy: AM0P309CA0001.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::35) To SYBPR01MB7881.ausprd01.prod.outlook.com
 (2603:10c6:10:1b0::5)
X-Microsoft-Original-Message-ID:
 <20260124-fixes-v1-1-302a1cc57d1e@outlook.com>
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
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBPR01MB7881:EE_|MEYPR01MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f32a98d-bc4f-4d0f-7629-08de5b5ce7d6
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|461199028|6090799003|5062599005|5072599009|19110799012|15080799012|23021999003|8060799015|3412199025|440099028|52005399003|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0FmQ0tMc012QnZId05YTnYvU3VreXhxWmpXTGI0VFl4S1JlZVdleFdNa1JC?=
 =?utf-8?B?QjQyb3RkdFdxcHJkR1JqaTZmb1dITkZIRTZYWlRWME42OXV0eGdpQS9MNXFC?=
 =?utf-8?B?bzZUb3U0UGF0SzNnN1ppajByTGlUR1NBZWJMdGc1YThXV1I4SWFTOStBem13?=
 =?utf-8?B?K1QxR1BhUmlNd0V4VmJWNGEvM0IzYzVhL0hJd3hHU3pvNHAzbGJnZTZhaGZk?=
 =?utf-8?B?QktJYlRrdVcxRVYyNzI5bWhDUE51Mmt3aktIc2tqNzc1aUFHWi9nMG9sT2hV?=
 =?utf-8?B?eDhnQ2Z5MXRObytNWXpQVGwxZmxmM2w2dEl3YWNiNmFRTFBzbERqRStIUVVZ?=
 =?utf-8?B?VjFha3dHZE1GMUptOFdhNUdpbGNDZWdYV1oxbXhNUVQxcUphSnJKdEg4eVdI?=
 =?utf-8?B?NXV5Y0FEY216bGFZbkFQRDduTThYZGVFaUp4dFBTNS9wcWFlSFUxdXZJV1NK?=
 =?utf-8?B?eC9aVU1oNzVGZTZjVFduclkxakVuN2h4R09PdlQwNEI4RTdiazh0d2xtcXZr?=
 =?utf-8?B?MnpmRW9mS2x6Z2lVTzVaSXRjN1FBWldLNXVjNVlWUE8yK3YzUjhtbjFnMGhC?=
 =?utf-8?B?SUVnL2lSVk9YS3ZGMlM4REtjRmVadGlPVC9UVDU0SU01SmhZb1piTG5ncytQ?=
 =?utf-8?B?QTRHeFJUUUR2UDNwVmphbklKUVErNU1wMHdLc3FXeGlpRDQ3bWlIdkRIUFg3?=
 =?utf-8?B?cTRVOUZUUUJMNlB6UkxjUFE4aXc4RElXbWFsM1V5cm5DUW10cWs0SHVZR29z?=
 =?utf-8?B?ZmcrN3RrcTlCOC91eXNJN0Zxd2JZVW5PYUpRbEMvamdMNjd4aHpVbTZBUjdu?=
 =?utf-8?B?V2krV2tXT2lyTFFRR21zWmtHZ21NTEk0K29hSmFpY1lJY1NNZC9JYlh0VWh1?=
 =?utf-8?B?dUdPNG1FWnBWOFRTYnFldXJid2Y5NVVxM0ZTYXBuMEFWUFI4aGNPdlJrcndJ?=
 =?utf-8?B?WkNwWElRa00rS21DYUFDS2VpOENodFh1NmpSRGlXT3BZa0tsdDZJZHJoV2xq?=
 =?utf-8?B?OHFEdFZjSHZZZmkwekwxdTVxdm9LNzVuRDNRNkFlQytvVDBFaXhIN1poSk4w?=
 =?utf-8?B?eFkyT2RQWmR0UWo5bFlNcGdjam0zUmFaU3VCL21CalRoMktaeEx1UHZDdTVw?=
 =?utf-8?B?b0tla1VYemFiOUxIMHJlVHdBb09NUk5qaVg2S2p2VWdiYkZKMUNsRk1YRXNC?=
 =?utf-8?B?MTJNK1VRVStMMWFIL28rNGFVcmcyYzdMeFlTeDR2dk85WXM1L2FSdzQraUlX?=
 =?utf-8?B?Q2ovcjhDbzJEc2pYS3lCMzd0d1VCa1pyNncrMklmU1l3K2ZTNmQvZFZBakcr?=
 =?utf-8?B?SEMyZktqQ1lzQTEvRmVVOFRCanlBaTJQeTdlaGJ1Z1B3Wk9jb1hQanhsMndK?=
 =?utf-8?B?RzN1bmhwaUZ4Q1BSMXVFYUpiK0E2YWFJbXdqMmNrVllackFhODFNK25qbENj?=
 =?utf-8?B?ZzJPQ081algrTStGekpYVG1BdE9Zcm1GdDFsRE9tMm1XeUludTB4eGdaMHdm?=
 =?utf-8?B?Z1d3UXc1S0M5bTdYWmkxeUxLR1RscHpSUGJkcmJ3VXpMZE1kT01ndW82OEF3?=
 =?utf-8?B?YWE5RmlLbUlOZTRsUVByRnVnZkI3SVcrT2JOMnRrb2VLdTZXZDA5NWZEODZt?=
 =?utf-8?B?SjBhWjhiaU55RGVVUEFuc3FkWHdveWoxOVhweVBRUHowaUFnbEJNdUNhMTRW?=
 =?utf-8?B?UHFJdWdtc0tGcXJ2dCtUODR3WnNrcjFhdVZlQ2xtVWpXL2dNSHZ6eFRubTBx?=
 =?utf-8?Q?HMwxVPQ0Xa7rhMVVP8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0lhTTU0eWh3QjU1RVk0a2FGRm5TN0dGNDEreGd0Y0RvNENQYnFGbThuajVQ?=
 =?utf-8?B?UjVLQlF1ZVVsRGRMZzlGdzgwcDI4RDZJUXZrS3RIQWIwc3RkcU5xMS9XYk9H?=
 =?utf-8?B?MjFsU09wd08xZEp1TmkxQzFpdUlvWVY3aG8xWUQ2KzB6QlhQQitOdUhFSzlE?=
 =?utf-8?B?dzA5UDNDRVV2akJPbzRRbTFIMmk0WUx5SGUvUmpuZ2gwRXo5Q1hrM1NiajE5?=
 =?utf-8?B?blpSWVA5czcyalZKaXVwb0lQdzNiWFo1QXY1Q3lxb0p0aG9jaERQQ0k1MzRx?=
 =?utf-8?B?Unp1KzNqRDdkR2RCTjBKcXFxQ0M5SFJTeThQejFkVk1aUGhjeEVjb2VFdmlk?=
 =?utf-8?B?a3doYXFySk11bkUwOXE4MDU3ek1BeTVwNGVRL3V6OGRaTjJrNXVoZW5jMllm?=
 =?utf-8?B?MzBBUVpBSFV4Mkw0M1d6QzJkOVJjNE5NY01MdHRiMmRoQWxUcDdHYk9kK2I0?=
 =?utf-8?B?cmdhVjBlME1zUCtTTGFSUVJvdWpEaFhlQi9lb0dFQzlTa0NBZ0hJWFB1anZG?=
 =?utf-8?B?NE52dzFRbGxleG5TTm9kSFQrdHZua2VUcGEwOXpIZytNQU83d052WEpGN2x1?=
 =?utf-8?B?QzBIVnNzNW9BUXphVHN6VDVLdi9rc2hpc2VoUWFvcmprNG5hMXd2ZFYyNS9K?=
 =?utf-8?B?RVNjWG9pQnI2U2lvdFVhYTFYb0Qvd0dWSWZwUmJvdzZCMUxQNjRHZjVGVEg0?=
 =?utf-8?B?TXVzY2Y3ZFZzWlJLOUI0eDEzQ0F1TG1mekI2aDQwNUhiMWZYM3NZdDdXODVE?=
 =?utf-8?B?dFB1NlNSOCswa0MvcWdDYUJtZnVmL3B4TFUvMmIvOHBPbVZqT2VEUW82MUw2?=
 =?utf-8?B?WnNrcnQ4NlczZEhNeXhkNStSTWYwd25RMHVKNTdvbUU3ajRvUDhUMUZMbkd5?=
 =?utf-8?B?N0ErMFdlUFJqVnA3ODRJYmQra2JQNS8xS2lhQkJRdUNUN1diZ2d6V1oxU0Qr?=
 =?utf-8?B?RStJaDVoTmFlTlRzZVprclJnRnI5QzljQnhrVUFLTEpqSGE5cHBJUkd4UzF3?=
 =?utf-8?B?MEJyZFBSa0djazdkRnc4VTBqMzM1MHFxMHlSNlVrTFhERVhSempIemFPMXJn?=
 =?utf-8?B?TGxZeENlcEVnT3lOZ0tGN1ZFVzRPSEMxWitzVkF2NXV4YlJpY1k4ZjhhQkFr?=
 =?utf-8?B?NzcxWFZlUXBEaG1FYVUxNTl0VmVUVnZpempyaHRHSGJvY1ByZVIvMXpKYmxH?=
 =?utf-8?B?SnpwWW85SmNZejlzVUFVZHdLRm5zWks2NVc3NjhNOGU5U3dpMTAwQTVQNThI?=
 =?utf-8?B?NEhvNWszd0pQQXNDUjhSNjZ1eDN5TDhSbDV4eWRJbVJxZC9ienRlSGsxb2dU?=
 =?utf-8?B?UXVtT3VyNUM0eldFdVBBTDRKb3gvbGs5T2dvZ2gvbkxvYzFoRGV4dHlKMjFX?=
 =?utf-8?B?bDliT29Cd0pqanRnNnU3TTZldWgvU29xZVQxYnRoajBFTGoyTWkvQitaN25r?=
 =?utf-8?B?d1UvSXlORDc3SDZrM09SRC96cVd0TVRmRm9jOHo2cWEyZVhzbElGSERxMThX?=
 =?utf-8?B?SGJoNXlCV1ltZlFPeGVpaEN0V2tud1BpTzJJY0NQa2dTN0RZL0txVmRmODFn?=
 =?utf-8?B?TlJjcW9CcVF6d0VVNGlFMFhwUVQzbWZET2NRdU5JaDM2RVc2Q0VValYrQU9I?=
 =?utf-8?B?ditLaExTbXpKdWtwSmRxYThUckRONTVWdDJsL0UyYzVlc3JBQ3dWUEhkRmlN?=
 =?utf-8?B?VHU1amNsWE1xU1NxZ0Iwcms3TTZuNkdja2hYODlLQm5iS2IxTlVKTlRES2pR?=
 =?utf-8?B?d0VCclBzWFdCT3JvOEFvdEs2S1FiWC81OHVPaHV2WkwzTWd2NXpNRVptZ1U5?=
 =?utf-8?B?bEN0aE5TZHhiUHJ0NXRua0NWWS93bWtuYjBOWTMzcSt4Y3NLQUF6TllHdDB2?=
 =?utf-8?B?b3dvN2Fza2hVelZtZlVXaDJlRGNnUGRydFdkNkg5dVN2T2c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f32a98d-bc4f-4d0f-7629-08de5b5ce7d6
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB7881.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 15:26:12.2937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYPR01MB6661
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tyreld@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:brking@linux.vnet.ibm.com,m:linux-scsi@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:danisjiang@gmail.com,m:moonafterrain@outlook.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,HansenPartnership.com,oracle.com,linux.vnet.ibm.com];
	FORGED_SENDER(0.00)[moonafterrain@outlook.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16284-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[outlook.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[moonafterrain@outlook.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,gmail.com,outlook.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,outlook.com:dkim]
X-Rspamd-Queue-Id: 2ADF17F043
X-Rspamd-Action: no action

The discover_targets_done() function processes a response from the
virtual FC adapter containing a num_written field that indicates how
many targets were written to the discovery buffer. This value is
assigned to vhost->num_targets without validation.

The discovery buffer is pre-allocated with a fixed size based on
max_targets, but the virtual adapter could return
num_written > max_targets. This causes an out-of-bounds read in
ibmvfc_alloc_targets() which iterates vhost->num_targets times over
the disc_buf array.

Fix by clamping the value to the maximum buffer size.

Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Reported-by: Junrui Luo <moonafterrain@outlook.com>
Fixes: 072b91f9c651 ("[SCSI] ibmvfc: IBM Power Virtual Fibre Channel Adapter Client Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
 drivers/scsi/ibmvscsi/ibmvfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 228daffb286d..f346dee4a0ac 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -4965,7 +4965,7 @@ static void ibmvfc_discover_targets_done(struct ibmvfc_event *evt)
 	switch (mad_status) {
 	case IBMVFC_MAD_SUCCESS:
 		ibmvfc_dbg(vhost, "Discover Targets succeeded\n");
-		vhost->num_targets = be32_to_cpu(rsp->num_written);
+		vhost->num_targets = min_t(u32, be32_to_cpu(rsp->num_written), max_targets);
 		ibmvfc_set_host_action(vhost, IBMVFC_HOST_ACTION_ALLOC_TGTS);
 		break;
 	case IBMVFC_MAD_FAILED:

---
base-commit: 62085877ae6592be830c2267e35dc469cb706308
change-id: 20260124-fixes-c31dc1e4e4cb

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>


