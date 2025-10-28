Return-Path: <linuxppc-dev+bounces-13442-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF48C14FD8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 14:54:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwsLZ6mv8z3dVd;
	Wed, 29 Oct 2025 00:54:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c103::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761659670;
	cv=pass; b=oh6a8G9+VQ2hEwHR2bb1FzkSjEVnzF5KRlt0b8M9m0q8U0kR+/kOlZDtWjK00riPWKGaRk/YCC8H56gnkjND5h8eSegkrZ2DYGevIC91OFWcbxIj5bAd6nNKaIa+k1Qjt5IZLm9uOnn/xYDcguAsmrm8KPiXVLBYbSLyBaGSCzMyVWb3cw7cd887ardJy9iAzgBPnRnUHZ/oKTCtowFgfqxImhrm22cwlRSII8ffuZXX4B2PgZiYGoCuFnRtEP6FO4txP/0nz3S5qJCqFnTa3I5Tx6bRZjMXwKng3nCcPYlx88s+WQEANt/zBvRpmbYwKoO66FWvaskd3USwHYFNsg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761659670; c=relaxed/relaxed;
	bh=i9/UO5Y7GzVMD4CAr2mVFirIStRpUcx/JRfYzyLPCYA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=muxCtOhAub2H+6p9CtViUdhOhnjPKS4tepz2UjOT3AgL7FUVxMH6n3c7fdGThjcUD9+pAs2iDtTlqNsQZvjgvlt4bRahQ3EaitJg/RMQR9g+vU1z6thrHWMaktuLzNuy+nqTL5ZgdmM/biOaP+xlx4W8VDm62rHlW6N6JxucLogQ5H9UxatzuLMF6eNZ+jua2HInq517ULLRY4Mz2TJY1ffkZeGesWWMQ2RxQprhEVhWWXdDSpoyIMxyd5P9CmKe+TXGwUZr8Ai3h0pqixYJ1mE/iUX5vDHP/X7dZWFQ976wNkoFO6gzsUjiqZmDu/M5estrHpuH62KXpkDgRbdOpg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=eTQ9UpMs; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c103::3; helo=yt6pr01cu002.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=eTQ9UpMs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2a01:111:f403:c103::3; helo=yt6pr01cu002.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c103::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwsLY6x8xz3dV6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 00:54:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+WZc+FnMew4kbZkHPt5hBDlHT/4GeFo3hT2ZkpcqCrLZLa9hPeOsb2L5OVwAokF4+G/Ev4k5DmmOGTX9csKESqL8bo0RcMG2Ukzp3bmYHD5EM3tB7r/mIV2ZgvGKGcIfeZPcfZEoTFSb2cwK3Vg+4d3KkAkZRdBuOpxj3UziRNlFXa9axpPXN7sah4/hxf6fDC2pFkjgq6rjKM4TiEcvt7MhD6dE0anfJA7ibhVh00k79SUtFgMedlDvH/1urXd8W1uiXg/J6eqvEgSRnWQlxsTvaoZCkz4ARrm57rH1hKj7YpohTkgV5GYyWeBTOFnDisNj+qKqqrNDt2b4+pPqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9/UO5Y7GzVMD4CAr2mVFirIStRpUcx/JRfYzyLPCYA=;
 b=pGt+8LkdmD83YdHbNOW7y5uKBzhi+UekIvfb77UGqpsG85pk9bBGk1rLkBg/TdIeKNhz9r8JCchPpAl6T+h1whbe73ajjlPHoywV4F916ANvKwd3NwjRL4Wu84snwKvCGtzJmqayQ7juQb5v3gbto2iJpghcHIWVrOZ7z107vu9HDhyNy6u44DIkh/qbfaZJq7moC8c1phfOPaGXGIAzcz0kYRfy8MZij9A3SWn5KujO+obCegl8FIJ1v/zsov+k7nlM7LHrMSpgOGWPG51m5fEYmisoWcb5VRrvLdtpaJ1/PBlZC5kknkqrZdRD1MLrZES3X8POqqY1ftLQ8eELvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9/UO5Y7GzVMD4CAr2mVFirIStRpUcx/JRfYzyLPCYA=;
 b=eTQ9UpMsaKQY7QtVdIIhFiPL7USlzOA0OziFgl2n8zdt4Mqh8RKsNL/ZmhABd99GROwoHHYyW1zUaZFQj2JvjZsMtf1xMP4IWTyUTWZbAknCExPRgrXlYWLr7YQeIoiIJAj/VmxBhdxckBQSOr3pY50ezxvEnre3xosIpPoYFcDrS8HFM7WiGEL6gWTWLmPHMaKgVCbmfvorl8y2mjk+YRwkzcg54YoERNu5R3xAs2wEEcDinN3C2R5nI5rlgCxrAfy8+1gCf+4J1s6tLkjvUFRRWAUswT0cc+bYUoFkImThruFSyiyATVIrk5FooQT+Wapo6kVINYL0w/NxKPerdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQ1PR01MB11638.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 13:54:10 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%2]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 13:54:10 +0000
Message-ID: <439a31b2-af27-4756-a5ae-abbad93b9ebb@efficios.com>
Date: Tue, 28 Oct 2025 09:54:08 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 06/12] s390/uaccess: Use unsafe wrappers for ASM GOTO
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.483079889@linutronix.de>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20251027083745.483079889@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0127.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::27) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
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
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQ1PR01MB11638:EE_
X-MS-Office365-Filtering-Correlation-Id: 677e2425-67a7-44f2-03d9-08de16297826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXZieXRCZFBRVXBubWpDdHNicUZZTXpsNEo3dmJUaGhoV0lSUjVWUnZ2U2ly?=
 =?utf-8?B?UExqd1dLUWRGZEVvSFVSSjE0VDZ0cE5TblZNcWlhd202Q2s3Um9pWXo1VHlG?=
 =?utf-8?B?bmJSVFEvRDBZZi8zc0VLSVVGUXBXQnBEci9rU010YkxleGdvVlNGdnhyaGtD?=
 =?utf-8?B?cnlDZE96MFFyVG5iWjNhbGdJNjJyeHlPWHdZRm1teEJpSGUrekl3QUtsR1Y4?=
 =?utf-8?B?bWM4OWZYK1UvMmZzVU8xWUI4TzNnU2lXNHR1NUpQZFFMZGpsUWVuaDlNK0lw?=
 =?utf-8?B?YUxkWFZvRXBxUkZ5bThjMHBMZnJtK0FLMG9SeHdpRUNZaERIaDVLd1h5Q2Mz?=
 =?utf-8?B?c1ZCVms0aGdsY0hHUUo2M1FCL1NxaytHV0l4T3ZYUS9wTTRxUm9XS2JiUEVG?=
 =?utf-8?B?UVd3dzdDN0NGclhFOC9IN2RmY05BY0JXaElDbEdqQ25FdEc0RSt0RmdzMTFl?=
 =?utf-8?B?U1kwM204ZGt2ZjZlSHcyY1RJY0Y4cTZmODFCR01FMTVFZXNRSnBKcDU3ZFoy?=
 =?utf-8?B?WXhSb1h0K3J2c01NNFY5VXVjd0pQWERJT3FqNlBUWW5hRUJPWjlFK3B5RkRD?=
 =?utf-8?B?Q3EvQlgzYi9neVZqeVViMThTOVN1K1BaY1ppd2hpRjhkcWtSV29FU3lEcllZ?=
 =?utf-8?B?OUdITmVvQVNFNURUbEF0ZjNwbllhYkpzRXFRMTBjeHF4SmxIbTNXS1RWQ1ds?=
 =?utf-8?B?TzFHejdPajU1bzJQN1VrSFE4S3U1Zk5qajlubC9QK2ZnSGZtWXFLdDBTYzJo?=
 =?utf-8?B?eWJhWG9WK0tHbW9OOEl4RnRHNFV0UzlqWkR6SWJ6YjUxTVR4UlJMUE9jTE53?=
 =?utf-8?B?dldMMENFcDNUMysyK3dzWUpBMXhmZUtnK1lZbjV1YXROWmZ1WXgzMTJBa3Zs?=
 =?utf-8?B?Nk9CY0toNnczSHppTjY5UjdkTGNnL1lVZVRyeDJXTEk3S0ZIT2J5MGdoNjhK?=
 =?utf-8?B?NzF2M2pFR2JFM25zdHVrUjFtMUhaUGdMNmtUSU9GSFhVc01QcUNraFZvZldo?=
 =?utf-8?B?RWQ5Wkd5NCszRTFiYUNQY1p3S0ZSaExZU3BiRkdiNU11SHhla2JzRzRtZzRG?=
 =?utf-8?B?YkQyNHRtc3U1VXd3SFJ2Q3dKMFZ6ZWdETWNTekMwVVRHcWV1VlptaURqekxl?=
 =?utf-8?B?QjBtRjR6Ty91c29nVzZMWnNIRElQT1BnZkFIbDVORHBxR3dWUjZaVE50eldT?=
 =?utf-8?B?em5zQWg2UUQ5d0NjRjVneW9XOTIwNzV2Rk9jUW1rT2hsNmVOalJkM3RNRit5?=
 =?utf-8?B?WTVKaEZYd0dsa0ltVnI3T0tFMlFDeUlrUDV2R3QvbngrMEhTcjJFWkdldnlx?=
 =?utf-8?B?L25WRmhMYW5kTVg1a3Blbmh4UnFGVS96dEFTMFNnaXlFSHpFT3N4WWFldlNZ?=
 =?utf-8?B?V3hVVlhoOGFwYlEwNmk1WGNva3J0NWFzd09OMlJwd0tUN04rVGVaeUd6MDl5?=
 =?utf-8?B?VjUzVkRUUFhNWEtNWWlnVXFvclJQSHhtZUl6NE1WYjdtS1QyWXdsVGdLd2x5?=
 =?utf-8?B?c2JRMHlEZjZwWXROWlVEQ3JJNWc4bks4UHFTODRjNWdYV2w0Z0R0cnk3TFNr?=
 =?utf-8?B?Vkl0MU5POUJ4TnA0QklJSUtnNnFESWRybWppMDBCMjJQS3h6WXpNcnN4ZHVN?=
 =?utf-8?B?cmJaaGdERFdXTktER29Hd1pxWXo5RUYvQlI5OEF5dk9BWUFkaUprRjVRUHE0?=
 =?utf-8?B?bEc5VnREZUlqNU8zWUpDVnVER2g0Rk8wMGx0QTA4SHRrRnErZ3lNKzNwMjV4?=
 =?utf-8?B?OUZyb0dhM3Y4VUhZeUt4Z3RFbDRIRWlhYWluV3JOZU85MDVGQXpMdEQ2VjRR?=
 =?utf-8?B?UENDaVBIc1VTUElWa0s2RlF1TExPSUJsZVQrR3pLK2dLdnBvUDlubEtvMG9j?=
 =?utf-8?B?dHF4dThMTG9tR0ZlM3RtT1hUbHJBYkhKVmIxeVJxVldFd2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHlUaHRLUXovb1JuczlsbUlHOFM1b1QyRlowbHE5Y0s5dE56MGIwVHZjYXNn?=
 =?utf-8?B?TTVvcHJGUmFFM0F4cmFTcUU4cVpPbzk4cTVRZkc0cDlzdkNrMEZYTTU1MVRt?=
 =?utf-8?B?QzFLUDl5U3BFQllaeXo5ZHUwQU01WEYyVUVJMlErMkxXS05JazU3MDFKd2x0?=
 =?utf-8?B?Y1BOWU10cUJNQWVVRDlqSFRrODhCam9kdFAyQTVSQjRNbW9odk14M1pmS3Nm?=
 =?utf-8?B?NFQzcm9SNzMwOVFnQW5zdjJvb1o2QjZFVHJYZXhjRWtoOTM4YzViRnVuT1gw?=
 =?utf-8?B?aG1yRHBlNGFsSGNXUUoyL0N2UnZuK2NoQmhrNzk1RHFxWG0wZEg3d2t3ZE16?=
 =?utf-8?B?ZzdmOTFxZ0l6N3lrbElBSHlyWU0rMWJmYzREUS92L2xTVXR1eFFvamNObC9n?=
 =?utf-8?B?ODZJK1BNK2Z3Rk8zMkFtOEVwcnVFRjBIL3Zrck9yS1hEZEliMFIvR04wSEs3?=
 =?utf-8?B?Si85dlJFUXhxRGttWGVNZG1xWll2VnJTR0txc01kMWxtMnNZbmVJUzhJVGpz?=
 =?utf-8?B?Z3ArcU1IWjJTMFFCenlsUjMweEVEUGZwQnYxeTArbWg2V2k4L2ZJVWFwbEc1?=
 =?utf-8?B?NDNXeE94azVXaVNESGtpVjNyWjJNT3R3SXJ3ajdIWFd0MEJGalhZWHhUcll0?=
 =?utf-8?B?bW8zVkZCZzc5THB0MXFwTGhITllscDBVc2gvWk5GbnE2WSsxamlDY1ZSWlBj?=
 =?utf-8?B?d3EyY21wd3hGall4T1Y1M3BNLzMzeVZlL1B0TnhpVVhsZkp2eVd2cnJhc1dG?=
 =?utf-8?B?aUl0bFFtUEI5Ym9ucVp0QzB5aERNVzdabjZKSnNtMGZFS2JIZ3Q3cTNLZWls?=
 =?utf-8?B?bmU4QzQ3MDNYcHJVM2NkZ2crc2hVU3FPd1VjL29MTUFiT09rNWlkb292cFYz?=
 =?utf-8?B?UTlNWXZ2eUIwNjVBaUpBUjA2MnM5bDh0bGwwT2ZMTDNuQ2h0ZThRMjc1Ulpq?=
 =?utf-8?B?NGY3aFdMN1MxOWtiSnlrbHpOU1ZXK1RQS1RrcjRQRkdRV05QRGRRckRvU2pN?=
 =?utf-8?B?NmJxM1VUa3AwemJnbG5sYkZLQVltTkRNc1BUVVJKQWU5VHBGTmlkK1pCYkNS?=
 =?utf-8?B?aGZwQjBUbUZLNDhwUEZUK0pIZms2VnNrN1ZaV3BaMXZUNXFJK0paUEY4c1BK?=
 =?utf-8?B?UXVER3UxbnpFazArMnJGRC9ITXBlNElvTWE2RGZRejkvSTQwREtLM1FqZlVs?=
 =?utf-8?B?KzhZb0hUdituSjE1RytsV2xXRWQwa1d5ZytFTFVvT1dieWdURSt3VkJ6WGty?=
 =?utf-8?B?R0VlNDd5V1U4OHI5WWxpUThmUm9VbUtzaTBNQ0gxZENweHZHRmJJbHBGMVlV?=
 =?utf-8?B?M1NEMTFYd3E0L0dNU3N5VHFSQitUMGYzMzhPbFEvamxkTHJpV1c2a3JIeHIz?=
 =?utf-8?B?KzBkbExGSk05ejA0bTdPVUtwOFpUQmJlS05TK2tBZlI0eWpzZXNjak1RMXFz?=
 =?utf-8?B?enRXTHVLa0JQbis3Z016ZFpGajhPYm0xb0lFQk9OWHpPSVo1d2RlWnA3MnUx?=
 =?utf-8?B?NTd3T3pFUEErRVFlc3VNaFBhSFdhU1dYTHhDWXNxc2dJZ2NwTUFlc2tsUGhL?=
 =?utf-8?B?Vm1tNWpsTEdNMGpaM0YrTG1pOGJnZG5WakNzc0lCaklOZXhMeUFDUXp0cEgx?=
 =?utf-8?B?MGMzTGMyYld1c2UxMTVhaUlNZWx4YWs5RWMraFNGVitsd1JVcVBUQXI3MWVo?=
 =?utf-8?B?Z3FHQkkxYktMR2JtZ0NDK25DVGYxWERxaVhQL1RZS2ptcm1NeXdrVmdBZHFJ?=
 =?utf-8?B?eVg5bmZsditMRWJIMzZPZ2xpZXVPM0huYm0zMU1UN1F5RUpPZXp5cTQ2U2JL?=
 =?utf-8?B?d0ZKQ2h0cStpM2h5SGU5VzAxM3gxNnRUS0JHRFRyMUVSZjFiV3ZZa2hhMkNN?=
 =?utf-8?B?eHIrR2NsN2NwNXBVZ0k2dUlPVHg5UVhoNFZYc0hHWE9FV2Vtbm02cUhYc2M2?=
 =?utf-8?B?RmFBTmZTcmRLR210NGhVRldaQVkvdG9hemRNZEdYVmtiMHhyTmpUUVhmNVdZ?=
 =?utf-8?B?dmoveXZBYmZTd2svRUtZZG1wZ3RKTlI5VVRCRzYwK21kcXVQbHJ4SEFGcEIv?=
 =?utf-8?B?VkZxaTNEQUdXS2FKOW5ydGNhWHNYTWE4WEhGNEYxNnZFRk4waXRaSFpJRnQ1?=
 =?utf-8?B?SnJZTTJPdHFpSmpwdTdBVzNvSG5XNXoxQkdhWDJBOWtuUEVpbVNiYnRSRGVD?=
 =?utf-8?Q?vX+W3B+AhkVdt+xeMz8DqqI=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 677e2425-67a7-44f2-03d9-08de16297826
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 13:54:10.0102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8ZY4rEhd60ZSmam+XFdqnEj5UI2pfZZzVn9edbRw6NL4SSexBLfTT8IRDXqNmIFXWwT1p0/lKK/x+g7HFTgb6w57DrVMWp+OtcElTJ+Nh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQ1PR01MB11638
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-10-27 04:43, Thomas Gleixner wrote:
[...]
> 
> S390 is not affected for unsafe_*_user() as it uses it's own local label

it's -> its

Other than this nit:

Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

