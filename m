Return-Path: <linuxppc-dev+bounces-13437-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05450C14E22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 14:35:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwrwk4Gvyz3dX1;
	Wed, 29 Oct 2025 00:35:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c103::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761658534;
	cv=pass; b=CiZvtU8Tgc72lxouF1hg+TY++i4FSGffP5YDetDW32UQGu2NDIRJ6ixNOsJRAb5klBL7Ez9HNxiBwGi5hvYNk9yAqD5VNCk96Xm0Pl4sJ8UOnVDI1kpU4Z1sbzaYS9eboHmjU1ipcYpXm4nnp7fx91dDIFyqOIyMhAboFMhUys4oWrQmNRUCQGH9BuHPKktnjsRifgNpTvJU+X48IZ6k2SJq/skRqawi3gU5lUzR2BVGloACANx9bk7UfmaJ1ww+e77cnF8Dl8ZwtqQ+cUhGyeQE3kuYnP2h7tAz6UFL7EBNu4gcTRkP9h9PFWXOxtZlkiu6o8fyleHyhKKPENgvHA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761658534; c=relaxed/relaxed;
	bh=x8KDwnUXuOzCxlMVVRXvbcEUnahNKJayk2qWL8UaU7U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F4B6AexkV0Gy3UBxjn+BGoDSyxhJWBaHr9vHyxwR3craovxFZmbSwhf41PnsZuucwTR4zuWqS0s41zOJHEuwN3VNrmj0HLkHrhOv+4mCQqjQUv92QRX31cG3VGUimNXKhkEN0edxM+/grYOez/VuxGcijd3RT4jX4KvPGdPU6AaNJ92oVuJ8lRyCnULFeRhvAJmYBxwL88MtBHFiaQOq8R2tE7Sn4gC0IfjgCIJnDwkPuknqlTHOaAX7yw3R5mA/36SJotbs6Oc99qqPRjFdlNCl5K4vCiiIX7gfEat2H/Ai1xblTOzu1oUJZtp/9V+sr+XmyWnw9kIKwpgkFnwWOA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=JhpQ5Ms/; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c103::3; helo=yt6pr01cu002.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=JhpQ5Ms/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2a01:111:f403:c103::3; helo=yt6pr01cu002.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c103::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwrwg4rKFz3dTp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 00:35:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=po4qdZWDd4xouSRppaG4JtS60cSoL9b05ac82E4ZkNY70RDk47bwx/iIMw0075InQEd6tN2sIYlmpl7YSNm28hCntaHo/VUgB1sEU0kyspqdpEcWqCI6ESNyM6wt465M0D4rU0TSgB4hPhreR5tr3sEdlZIN0wOPETq6aLJaXfiRvXyaH5OIsIXZGzqnPqvx1pe34LkXaaFwkCBryKR/EmV1wwpkZhHJ9TvBiYC196MYrC54NnB7d1JyGZO8bgUD/xnsxd76J1AHVEdRknKio2xuh5xIs4H8mLo4Wf3D0VyhNg08RADUjGHopQjEQ6hpUkFb6EQ83B1AFgpJCscPJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8KDwnUXuOzCxlMVVRXvbcEUnahNKJayk2qWL8UaU7U=;
 b=JcUq+AUkSSvZLopjFaLtfuM6vQykcG0Q8h0coN/XusRZaMBCzR4bvVmoaXY9s3mls+B/+dFItySG/4a6iubs9Q7PcmYycZ4Pe798UzKSM8SSxfwkncIb2gqC9NKwhZdOtYvDYhGMeGzQPTpNaavyfN/ZE01snXziREZQOr2N9GTQuam1TdYOx0BCtejOLLRKGHFhmxP9XsT57IZ4QVDe0OitjNQtE4Nfr1QvZQ2tpEubV+mtQzjJKnVw/Bd0Y3EtMCPXf50dI8TTGex4hShZO7nQ5itYJeCeiSe3S1ScO5ZQDXuMI9f0fVq7Id+KS3oMdAmDNpCbvNIqLrirFCjcLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8KDwnUXuOzCxlMVVRXvbcEUnahNKJayk2qWL8UaU7U=;
 b=JhpQ5Ms/jkNiLnDxW3G4B7Ks7H5bXIDOD0EKWUeAhbQTA3d+6OoUxbbsLcvnJASW6kRhl0vUUQllhGFmo0qto4PAIdBdWzFFUXwhk6bTQnAsvnoLVdFPeIG81u9IGHpQo9mveAk2nsMbzuDlXLlAmh/JBMa6PVgxCk+9jPAVcGgZDndhmBsbDBh6/sdu9VApK2GL7DNuBEZBwF05xnI9lpEqQyoz6ykLWrudUDvcdWXDrqwwschgVGacLWUGbkKSm5E2xI3ZX7tunQiC8Bp7BlYUJb5icJnMesBQoFKzXdG96ec3ifrM7HPjuTkXqT92wlR/8xihQQc4lQTyCrJb0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT2PPF4A90670E9.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b08::439) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 13:35:05 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%2]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 13:35:05 +0000
Message-ID: <afc2d92c-bace-4128-b3c8-106e81cfd420@efficios.com>
Date: Tue, 28 Oct 2025 09:35:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 01/12] ARM: uaccess: Implement missing
 __get_user_asm_dword()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.168468637@linutronix.de>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20251027083745.168468637@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::11) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT2PPF4A90670E9:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec36c05-6704-439f-f453-08de1626cd9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkF3S3RZbUdsLy9zc2R3SFZSM0VMQ3R3MHBjckVPRUczNXRFWHlnREVaL1FB?=
 =?utf-8?B?RVRuamR4dWoraFFXOUlybHlKVnE3MzllVkYvaVFqNjI4bTdnOVM1WWdEcEpR?=
 =?utf-8?B?N01zQ2p3QXpFSzJ6SDVnd2piaDZDaGdFekFKMmN6MVNzbEZ5Z0txTk1MdENu?=
 =?utf-8?B?dkRTWlMxUGlxMWJCNkJZclREd3U3RTVpZDkrcHllMWROZEY2LzRPdUw2Q1R4?=
 =?utf-8?B?UCtJMHN5cEV5KzlPSEZTSU5KR1FwT2dQcjl2dVFsUnp0YjJCWG03Ylp0ZFp3?=
 =?utf-8?B?MzRROVQ5NEpVYU56UG1LNmpNZGlKaEc1MlZkbDhPN1hPOEJDeWZDSzR4ak1x?=
 =?utf-8?B?Q0JrN21EblBLUGtnY2dXYTJsRjNPV0g4bS9UK3pXcEJFa3loR0RreEdLWUcr?=
 =?utf-8?B?eElTRC9XQ1piQ0dsSUZJSmZsaEZRcFNiT2JDVk5IM3JOWXdoL3F0VmJCYVdW?=
 =?utf-8?B?eStNWEt3WnBVWXF1bkNjL2wzZis2OFltdEI1RldIZVk1Rk9aUjRGYVpnYjFN?=
 =?utf-8?B?TXgxOHBqdlV0NERJYTBld2llV3NHa295SkVWSkp2U2ZXZ1BWbUFGMGNBdFVz?=
 =?utf-8?B?TWYzNkE4cVdQazkwVG1NcGxsRE1EYkJvTDNUR2hpTVpaWU0rODExZWxUWnh1?=
 =?utf-8?B?akhXWHdJK2RGZGxwMFZVV2ZTK2hjV2tGUEJWNit2aTNJYjlmZWdLTXh4ZUU1?=
 =?utf-8?B?UHJNcEFwK2pqV25lQ1pVV3dOVlJ4cEVhQ3J5K3ovMVZ3QmxxZEFNTW1qdWQw?=
 =?utf-8?B?ODNNSm9UTm1NTEhZaUF3QUdTZnFRWFpQam16RUM2N3pVcWZHOXhmeC9WSEdl?=
 =?utf-8?B?Q01GdVlrVFlMVGtoaWdHQUFwajRxWFpCSTNuNGtUQzZpVDZuOWcweHY1V2tq?=
 =?utf-8?B?S3ZYUDlBdE5aRTcvcEJxZmIzc0tFcERKZjdHNm9yOGdTM0JFL0xScE9PUzVv?=
 =?utf-8?B?UWtHSnJnK0wzTG5KN2tRL21rQWZVNTByWnVDeDB1L2c1SHRhRnRna3ZWNGJ5?=
 =?utf-8?B?enpla1BjU0hheFZIdmU1MmNjKy8waERoVU5VbjVXZlFMTVZaL0htblg3ZEFn?=
 =?utf-8?B?ajBHS3VVRTg5RGdQWjNWdFZIRk12Zld4VzVhNVdNK1MvYUduelBOS3VnY2xv?=
 =?utf-8?B?TFdIdzV6SjBleVBkb1IyY1ZZVHpHR2VIZk0xS0lsdGNlekFiSGxhOFdyWjhk?=
 =?utf-8?B?UmlZRlpYOFRlK0NuK2lqVVRXZWVkc1liNEVSQ2Vic1BvT2lzakZ6c2dvcEM5?=
 =?utf-8?B?Y1VoTFB3MmhvVy9iMUR2eWZacUtmdWZZSGRPYTU4eVQybmhhOXdKTDJnTmZY?=
 =?utf-8?B?UERPNUl0RzFwZGJkU0lOZ3VrMUNiUVdESmhkbnhhVGZCcTkrRmRtYWM5Tkp5?=
 =?utf-8?B?RTc5TFI4VndaMml6KzdzOWdTZkpWKzFnenRGdGFNNnd6OUlndmF0UURkcVZw?=
 =?utf-8?B?dmFiSlZjVGlYMTNMT3N2azlVU20wRFp0SmhMTnNOa1FSa0VITlljZS9KVmI1?=
 =?utf-8?B?Q3FFcVhFTmFzZTlPRkJ3c2Fkc25LU1g4UTRzdGVMOHJaZE9mSnBibHNqZUdm?=
 =?utf-8?B?N3M1K1RZc1EzdFpteXpSeTdNS1Q3UU5qTmJPL1g5VEROQU54bXFzc3N0V2tn?=
 =?utf-8?B?MjM1VEVZZGU1ZE1Wcjh2SEx0QWltY3NlZWZOdU9UcTB3U0RLbTZmV3g4RHpR?=
 =?utf-8?B?cEdUS0o2NnA1clBTVkRmaGNNdFdKbU41TlV5cUx5QUExSmkySHlwNzlaZjMz?=
 =?utf-8?B?Z2t3cTd6dk1TL1VJZkEzSEt0S3VteTlncWlPUXFSNCt0NHFrWDBGZFpOcGxI?=
 =?utf-8?B?bHJHaVZaYkJuTWFDRVVhVmVSRGtzOC94cVZxNG5oQnlsRmE3Wk43NndaMzVt?=
 =?utf-8?B?a1ZaNmRVcEI2Q21sOE5odDA4MXpSa25IcDlzWVppbjZuUEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2hsb20wekdFWDZNK1JmK0JDcjBKMEN1ZmptbTNqZCtEVDZ6enNyQTNYVkl5?=
 =?utf-8?B?Y040VTZUQXdwU0RIazJIclBxUXRRWC9YaEdQUzRUKzYwWXExalB4am9JOEF3?=
 =?utf-8?B?R0pEeE85TTkyZnc0Nnd6NVRiYTg4SDV6ZHB6WEU1RDM2cjdZY2dGbjVabk5v?=
 =?utf-8?B?aCtOSEhNeE9ka3NFQzYyWHAyUXZuUWRGM0FXSnlmbjZHYUVXRDdEaTh0ZDg0?=
 =?utf-8?B?bG5NNWJaOHVnR3R3SXpsb3g2eTBnbGpqVi9WMXBtT3ZvWit5Q3UvM3RJTk0x?=
 =?utf-8?B?SnRYcWtWWnFLbkxIVjc5TS9PWFY1OTVVWjZ2MUJzeDlTeUVwYnZzaXd3aURP?=
 =?utf-8?B?RFdsMlc2VEZNR3gxSWxmb1VMUnVIU3pQUzNUMnRHSlZ4NWpJT2pjdjdNT2Qz?=
 =?utf-8?B?ZHpZOGE2eWNPUjV3d0l5KzBwdXpJNVdmc2h5VGVQRDBaN2trdnlERzB4S3Z3?=
 =?utf-8?B?U0lVNkVYbTducysycUpFNDJBc3orcHVPNGk0dlhnR1NmWG1XVzJWOUNZdkJS?=
 =?utf-8?B?NUJSMFpBMWpRcjhQa2phSjhHRHdmamwzZk1TU082SDA4aDE3K09mTlRqWElY?=
 =?utf-8?B?SUpYQVV4UkRRT0FxcWpURzEwWjQ4WE5zQjVBVDNCR0ZPNmpCUG43R2JBN2dP?=
 =?utf-8?B?Q055SVlWY0ZYZ25LeTlZRVgvUDhUNVh4VmthZ1BsUTE0TGRQWXdqYWxOSHJY?=
 =?utf-8?B?TUNtMTF6bFdyMmRPSUFVTWpRZXdxRmFuRjBZSWhFNXBpV1VMRG1SQ0hrcDV4?=
 =?utf-8?B?dzdJK05zK1lYdUI0bEMrVzYwbFlXUE1VMUJ0d1NWc215TmZpUGMxRWxMcDZE?=
 =?utf-8?B?eXRLUXRoWVhXOEc0TFlhRWFRaTczUXhyTzhmMXBuUTVKem5ManozNjF1MUtx?=
 =?utf-8?B?MjBCcWNzdUUrZDNSZU5INGk2Z2lJWm9Xc08vS3ZKbE1ZY1dNcDJYUlcvMzlS?=
 =?utf-8?B?N2ZpczAyMGI5MGdxZWErNGxoY1FSeEp1a3RtNkZiTkVjNzNPOXlJNnVGcGVO?=
 =?utf-8?B?OFA4SVZPNk5vK213bzdSL0kyVDdSSHd6ZGEvTFVwclE5V2JVRXhFYlFnbmZi?=
 =?utf-8?B?bHZqdlFjRTZaRWNxaU1ndmsvMXUxZUVLR0ZrZkUvc3hYeStUVitaTGxOQ3h6?=
 =?utf-8?B?Tk40OEFWZWtsbnlVWThuYllIM3dwVFJXenlIR2ppZDZzaFQ0OVdtalZzWVhi?=
 =?utf-8?B?clIvbEhIYkNCZFVReGp2dFdON3h1cnU1ZXlreEFacTlHT1QvYjhlMTczY2JC?=
 =?utf-8?B?M0ZGZ3FZdUJQM2Jlc2pCdzZYQ3MzM1Q5YXd1SVJlSVZaVm9UbUZnUlN2UmQx?=
 =?utf-8?B?Wmp5RGlSWjIvdEpxd2pmazRyaGs5NzM3Wk9yemo1RXplbzgxamlXa21CQ21Q?=
 =?utf-8?B?UWlmRGdScnp2M3lHZ0xPNGZES0QwMjRsS3YrZkxSMUlHWWlpSWprRXlIS1VW?=
 =?utf-8?B?cXNxYmh6VFZkZDE5T2dxa0M4ejJzL0dUQkVTNmo1MWhBMmt1VEcxdFYzbWxp?=
 =?utf-8?B?b3hTbGdaaUFvek1ZZFpHRC95aHpmdlR2ZzF3ZHo1TlArZGo1YkpPdWNOa29r?=
 =?utf-8?B?YkRSMHdyUHJkT2R1YVF6emROdTJZdUxRQi9IQWJ6dWtnY2NkV3VCWTlFa0d4?=
 =?utf-8?B?azVHeklvNUl1ZS9yaUVuTit0OFppS1lVclZLVlE0by9FTTQzbDZhSkRoVHEy?=
 =?utf-8?B?Y1hraFFydU9ESkxlejlkM1h2VTFzc1dkTEZrUUJtblNnSkFoLzVtS2VoOG15?=
 =?utf-8?B?UHBGcE1CL05JMWZiaWJWZWFmNlpGTXhibWFZR0Y5RHpHWDhIUDA5dUZZUTVy?=
 =?utf-8?B?bHpqSVYyNDh1Z051Y0RKQVFpTTlGR3JrQ2NyLzhDaXZzMlJhQ2RBU1BaYjJS?=
 =?utf-8?B?akFKaDk5VzI3U0UyWnF6MUlQb2NoQ3hZcThENnJicS9GbFBCTnlvdXlRZlZ2?=
 =?utf-8?B?K1Z4dGppbWF4bHdTeGZQVDl4YURQc2JRbkJXNEptcFZjYVJXWUxqTms3WW5R?=
 =?utf-8?B?RlVkQm1WZTZlVDFFOVVMMHpQK1pPcWhoNEM4RDV6RXBnZ2h4K1UweE1UVDly?=
 =?utf-8?B?MkNVNTZxNTFhZTBGWE9ZVCttd1Bna0JycHNFc0lueWJ6YytDY2VZTll2bWtY?=
 =?utf-8?B?RVZVeWFiN01LeFhlMWtUbTlGL0pnWDQ4cHVyWEVFbjZ6ZGNqYXFmaEZYM1Qv?=
 =?utf-8?Q?rAVBe4jYTzTnYNb3xpF64+Q=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec36c05-6704-439f-f453-08de1626cd9f
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 13:35:05.0773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wP09yp6S+orkLte9S9UPeLZTzV5lqKu/M4OvcaenOaYvP92IZ3cIVNxSzNzBizHwF0txA3V1dK//CaXkUOpcjdzQKELtMpkc24gTvjziHYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PPF4A90670E9
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-10-27 04:43, Thomas Gleixner wrote:
> When CONFIG_CPU_SPECTRE=n then get_user() is missing the 8 byte ASM variant
> for no real good reason. This prevents using get_user(u64) in generic code.
> 
> Implement it as a sequence of two 4-byte reads with LE/BE awareness and
> make the unsigned long (or long long) type for the intermediate variable to
> read into dependend on the the target type.
> 
> The __long_type() macro and idea was lifted from PowerPC. Thanks to
> Christophe for pointing it out.

[...]

Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

