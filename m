Return-Path: <linuxppc-dev+bounces-13009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEE3BE8D1D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 15:24:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp5Bh0tV5z3cYx;
	Sat, 18 Oct 2025 00:24:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c103::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760707452;
	cv=pass; b=gkWprXB33tMvN37E23ncvyu14F/XxiAbXUmKfQtI1mz5dhnsyY8FziCCF/x8g3c7iXudmdplHrJj+jVNJtBnym3sgS6EDKh6xULptljjKDusvkndmkbtMNEWxikV+AzvXDVYxMJSgTxA9GwZOS+L8VmGu7vn7RFcKaZJpt/qNN5U5moHlBfyf0nr5ULAwuDO1L1zkgdDKY6BMpF0iIlsIDIXi9IlNZYLViJv/HdQs5v/QMzF+enlQXSDdJHojLFUTFb2ZJZoJDpKk+9lkGSzPIv6LAHFEOpjy0vH/kSIJJ6SqUhlNhQB4xaltwIkAXJxv54tmbLjXY9r+dzUqXV7Aw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760707452; c=relaxed/relaxed;
	bh=1l5u9m0gMnketiQy4yuQIB38B9yVqG0AwU7cVzRYJck=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iDgu0JGK0vshbd2Vz47cv9mJvhvRxjPU+YvC+OPyQbXTgdDEE3Ta+nWIloIwXYnXclSaRa8dqQayIxab1dMlCtJPZnD8urWiKJppAiToXYGzYZFdIUCGI/Do26mcUoJ3BGuwZQpXhiYhI6mfMbVgCqGGDV/bEl2uuUH7wnwdPEi2OMzprVuk25kQ+lLvR1mfNtleZwP+qqVETwet5ouJNr2AnUszGFVNPxdbZGqCQVeQ/CmJb4jrBYyyIXAhYo0n0n9bKLqpjEw2YU9cmGi9riT4YalW/Y3GQ18Z0j/hQUI8uziqmSK8vqzFr2FFPae04bxRNDNlCRSMTczCq0UtpA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=S0cH+rSm; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c103::1; helo=yt3pr01cu008.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=S0cH+rSm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2a01:111:f403:c103::1; helo=yt3pr01cu008.outbound.protection.outlook.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c103::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp5Bg32jjz3cYN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 00:24:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbYjAUnGRWL7MBXf8e14CMLN8PAp+X3MWDUQJ42hhPcONLLdC5W3KpxwvkyAbCBhNHSrCC4J+7QuNqQQ3SDSEcFfbzB0FtyM6RQhP7Nf3HIPHB1BbjtXKmJWtVHXzlC0Ds5AOOXZmx4Gh2J3qYyaTQCKWY00meqfo6PVxNgGiJT19+tW5kKMSoJ79scQRRGjWwTbxtKbcVfCY0DwLmXvja51HRm2PlnvhtI4lfAbeRzcugQI+aKPJTrM+gnaYDVKPbjxJOaSZU96wyNcgkVyyYAkB8T6ewVfztrxX55QXoXuAzeJihKoM+2kVBlBHXx2UxpeEqVJtmM5emJ1AyfZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1l5u9m0gMnketiQy4yuQIB38B9yVqG0AwU7cVzRYJck=;
 b=jGdtI3Rq80bk/7KWpCLFwCuI8w2CunszV0i+sfW413aaFRjGwvJ/gG8289bfLaIcaj/Y+ryke7Z7ujqCo9kxpNFaq5aY+mZuflbFzM2P2YfC6vfQN45sxQ22j2H10sr7/Tv59En13uwuNbFSn0bq8Dle4x1cVEIILRLMORRlOURYiMYp6t2dzmv9JHe62QbeMExSub77F2EAEziyb1UGFe9NDsQrZrZhGepp8lPukpYIJb876yrtaYJlo4HA9zLK4aU4YTBAkVPDhtQI5dIeX5QRm0P+Ec6FSDOriMZ3G9uxBDed09KojWOt8HZoD9FOlLoJOHsp0t8kTA1knkEPMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1l5u9m0gMnketiQy4yuQIB38B9yVqG0AwU7cVzRYJck=;
 b=S0cH+rSmkUTHMiZt8OgVmb0V0XKCQvU8g5AsadouTkCjs3zDtZUHcRoSsItzd1DRVV+wE+L0fS1+HCBFPUf6eGg16t06wrDjO/22L7hRn4vpXZuo7rSIxPEvhsjwnPU3qRT7EOV51BDf734J5c14gSRgtAXcYFZxE2GXiezC/w7TSCG58DlS7wg2H0Tp3NVkUHS7/Z38ZggUH6dhgKWGB8ZLCZV5XiUMwRPRkRw6D4/t2ln47MgI9Xm092rlHcZcq0rWGx6XktvAeTmzA1VSoBSPnM2hxeZjiqa/iIdyjhi16sBChQ6VBrjTGrl7obOJ24o1d4mML2gnmOH/eQyzRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT3PR01MB10250.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:8e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 13:23:46 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%2]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 13:23:45 +0000
Message-ID: <8ff80802-33af-4432-a783-50c4ad7fe984@efficios.com>
Date: Fri, 17 Oct 2025 09:23:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.253004391@linutronix.de>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20251017093030.253004391@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0355.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::25) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT3PR01MB10250:EE_
X-MS-Office365-Filtering-Correlation-Id: c987c63e-82c0-47df-206d-08de0d806649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGR4OTVQc3BKdUlUam9uUUVLVFJTZjlQbkpBaDJOV3laRlIxZEV1eDd6aUV6?=
 =?utf-8?B?dExIbGZaQUtKWGJSVkxkRUtTMGN2TlFpZXFDQUNlbGkrMytVWUNUL1NibHM4?=
 =?utf-8?B?Z1lVQjBJc21qaTk3VzVSVm1sd0xDV3dvUFVHdnNPdXd0UGM1L2cva0Nkbmo4?=
 =?utf-8?B?SUZFY2VBOXNvN2xyR1BtdTMvSDFPTy9pK3dqa2w5azc1V2R1emovMVVmOHJS?=
 =?utf-8?B?VmZXNUJtQVlnODBLMlFoZHppbXI2aUxjN1QvOVdKTGtvR0I1UCs1TGtFRktk?=
 =?utf-8?B?MHhlbDdKaWd2KzZRUENZNEhuYUlGUUlaTG1hS3BnV1NENVpOVGx2MytGWTBm?=
 =?utf-8?B?ckt2UCs4N2NxUWpseDFGRjY5Tml2d0NTZ284bm1BaUVVei90ZHN6M0ZyVHNt?=
 =?utf-8?B?TzVMSnVNZDZlRXQwcWJ5cEVpeGZ2SmErcHJOc3AxYlVPTXMwZmlVYW4zdlhR?=
 =?utf-8?B?SzBsWmdRTHVWcTk2QmVITzI2MzVHTkJpN1N2ajVCK29ITk1QZXNROHZEdEhD?=
 =?utf-8?B?djBUeFk3TVpISXlzRDBtbXQ2eTZVQUpxaXlqdys3UzdzQ3B6blJTcG1sZ29z?=
 =?utf-8?B?NVJtdHdMSTJPWkVlMk4wLzEzOVpVU3JTbXA5Wk5TN283NGpkbDQwNFU1SEJH?=
 =?utf-8?B?cTgxY0hyNTJiWHhiMDBjNW0vbWFHaWxrVFUydlVGVkRTekNmS1ZHM3ZYQ0pQ?=
 =?utf-8?B?VDB6azFSRk1vNzkwampPWDljNmhvZzVvNTZoM04xaUJJQ1B6Nm8wUzN3eCtn?=
 =?utf-8?B?MkNtaU1zMnFwdk85YTY1WVl0V2VEbGJaSitaaVlFUWRXa3ViaUE4enZBZWdy?=
 =?utf-8?B?REF4Qm52YzBXa2pFY25CRmFubVgrZlQrRUlncjBPL2draXhQMnBQdlNFK1B5?=
 =?utf-8?B?MDdqS0dueHhDSkRrdVVWZzZidDJ0MWExYVl2bUUrZ0hESUxkOFR0aG40T0tp?=
 =?utf-8?B?QWlYU0lRSTFON3o5dEhiRzlkK2pWaDdJaU5maDhjb0tEM1M4VmdjendJRXJT?=
 =?utf-8?B?eURQVUpheFFDNllCUlJEWDlIa0VwTG5sd214cERUWkJDc0RTTjlVd2tOeEdz?=
 =?utf-8?B?Nno1Q3NMQXBxUlRjclNRZWRzWE5McmRYVi9yTGdvQnVTWGpheWk4ZVQ1OXRm?=
 =?utf-8?B?Y0Q1YmZCZTc2TjY5OGtFeTZyRUtNV1NtYnNhOEhoYnZNeU93YnUwb05nT3VE?=
 =?utf-8?B?cnZVa3V6UEJYNVpWaDNTekI5aU4zb0RtUGtGR3lqSXdQU0JiZFpiSFNvZjY4?=
 =?utf-8?B?c0lxMkVlTDVpMU85d2tyU1psZ1YzdTZRRlNRWE1uS3RpYjJUekFRODk4L2dJ?=
 =?utf-8?B?V3VRZTF4NFh0bDVVeXlVNzVycUk4UlRQdlZaMXdkM3JRR0hkYnZwNDM1WE00?=
 =?utf-8?B?QVpRU1NsOVM3UXdvN0k1QjFsS3loTUZFT3RqZ21aeFJqTjUzU3JsQVlKcjlh?=
 =?utf-8?B?OEZXQ1c5S3JGSWkveW51L1pKZ25scExFTlRMM1VDQTI2N0Zaa1pOMGlZTVZ3?=
 =?utf-8?B?cmZXZkNiV0I0Q2c2UTRKMEx1d29mdjMvcGxNYjZ2WVF2ZXltcXVLaTVDbzQw?=
 =?utf-8?B?MEkzSFliaU8wYTRXbHJURnRXL3g1Z3V5em8wSCt2UVQ3bCtnQjhCRm9HNG42?=
 =?utf-8?B?dHZkcFdYKzNJK05kdmFLQjdNdHdMSUVQVTZyZlNTSUFZTDVxZVptSlRHQ3l6?=
 =?utf-8?B?a3Y5NTUxSWV0NEhhU2JUaWU3cWhPdVcwMTVUZkNSandnaXY2UHRLUmdjekVo?=
 =?utf-8?B?Zjk3R09yMUI2UVlGZHZBUzN6NFFaT245d280S0FCc2cydCtHempWWG00a28x?=
 =?utf-8?B?b0p2N2dGYkE3aVdKY1dHOUpsL0JWbjc3TVk1TmtCV1BNQ0ZmTThJZTducVc3?=
 =?utf-8?B?ekJjWlUzaTIxSkJNUUJVZHk3RG0wUndSR0lGOGZsK0lsbVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTVmQk1yamxsbUYyT3ZON29XRFVMcDA1N3c4SUY3MXdKOWZXc1d2YWd3cnQ1?=
 =?utf-8?B?eHNMeG53WXZ5L3EzaERmSTlBeVltcjVQakVmQWc4ay9RWTRMRnpOS1VYTXJz?=
 =?utf-8?B?VDR3bVU5bTZoaENnZ3ZlNk51b3lMQnBxTkc1Zm03QXQ0NjU0SkZhcTNUaUdZ?=
 =?utf-8?B?bjh5b2twMjlhTTUrNUlLakN4MGFGdjlWZ2JmZG40TUNVWEM3TXZTbC9aU1Y2?=
 =?utf-8?B?cENVbE5yRUluL3crV2pjSEk5TUhSM1lSd0lNUklzKy9FK3IySXVLekEzYXFP?=
 =?utf-8?B?RTF1Zm05TjFkYjBvd3F4K29rV1oxOTRwWkpyK3VjMmsxNFNNejZiRDFZK3dP?=
 =?utf-8?B?Y01IaWl3NGl4SXpEcmhHRk5jNExlZy9aaExNUHF2RGJFVkhJSmJickh2cndh?=
 =?utf-8?B?UDA1cGIzeVNsM1Q4NlpETE1HT0JJQmlWVHB0NlE1T29ZcEtyVUdKTnNUSmQ1?=
 =?utf-8?B?QnBMNGEwWm9nalNFK3BtWU1sVkZhY3l2Rms5YmgxN2ZTQjkwTjdFWFVPQkI0?=
 =?utf-8?B?VGRzdEpXbVZZM0VraGtibW9FbjE2czgxM2QvTUJDYjhRZG0xYzRuSUZhTE5S?=
 =?utf-8?B?R2hNVHdxUWQ5Ry8vVzNERW5tMGZrUklsUC9vVUpuUFNkVmh6dVBYN1czbHdK?=
 =?utf-8?B?UWNxNUtIajBkV3VyVzRJdXhwMDY2YmhnSWtkTElJM0IrdGR0S1NEZENjZ0Ns?=
 =?utf-8?B?cFU1V1FUV2FqVk5aT041Lzl3WFlpOWRpZzYwZkxadG5odDJEeThkcUtKZUxR?=
 =?utf-8?B?RS8wMHE1OE1yZHpiNE1peHFPUURRZ1NTR2pnY1J6eDFnWk5rYUVmdWFnQ3Nv?=
 =?utf-8?B?NmJXRkNiUXcrZ095MzY0cUNOWU8vUnpIckhsTlFxMXBRWFFaNWhRZ1UxeXpq?=
 =?utf-8?B?bTVwQ1FHS0VlRTVEV04rUVhHYXpsaFJRVk5FSm84akhySHVacXY3L3RpRWxo?=
 =?utf-8?B?Y1c5NXozVTFNZWhzNmRXeGFvWGNYdmoyNEp1aDI3cWpxMWQ2MWlDMXZId3BP?=
 =?utf-8?B?aWJBNWxEZUlHT3d4bjh0aXNRcTVMS0Qvc2hkS2pXZENQQ2xtQUNQOFBMT1d0?=
 =?utf-8?B?enNKbEhuY2lpY3pOT0hrbDVrUStwcXNoWG9MOXAyeGlEdHg0S0NaZ1JPUEdG?=
 =?utf-8?B?MVhRWlViSVg4VVRWdXloQkU3eEFvTVNrZDB6bEUxbkhpYWlzRUFRZUFRRHJT?=
 =?utf-8?B?VVVWSDhWZlhydXVWLzM0VHVRb1ovREpVNTZzR21Icml6MjlTeGk1MHdKeThz?=
 =?utf-8?B?b0p6Q2lzUDlDZmNjWWJWSVpibkpnQ0srQTdCeHZ2aVQyWWZ4Zk5Jc3pqdjdG?=
 =?utf-8?B?SWNtUFlmM0hYUWJyUzBhLzVUMm9aOFZTMVJoeGtpRHd0UHV4TXJrN1pTS2J4?=
 =?utf-8?B?ak1ZN0NzTUtvZXBoeFlrTnpkUVRVaHdEcEd6K2lnWWNNUUZreVJHRjFwR1VV?=
 =?utf-8?B?dCtrYjNzRk5MdFd3VU56dUpHYmkxY3RkV1UzaE5yTGdzSHBMUkNXN2s4VEZT?=
 =?utf-8?B?QkZ3R3MyUUc2ckVCRm4xekl6Mjhra0s5SnhodXFVWVd6dFZXckczcHQwV0VJ?=
 =?utf-8?B?eDBPMDBucklGL3JWeFJpN3RjYUVDY0tvQXo0aVhHWnNRVWU3WlJJaUNORnRM?=
 =?utf-8?B?bDBqYTZmSEh5ZjJSVmIrOVZvSVdzK29GUE41MC90WC80YklWZWxvSUxkZkN4?=
 =?utf-8?B?Qk41eFNuUEFCd0d4Ly9KaFJhYytIMFJXb0hzSEtWekEvcEJXZFQvOFlzNWlz?=
 =?utf-8?B?N2k0RkF5anRBWVE0MDFWYnYxREZ1eFl1bi9iQ0U1cUErSjFBRWtuNWZHWkZh?=
 =?utf-8?B?Q2Z3MHRMM1lsbEJuR3dPcEgwVGpWRWFoRlZjMmRMa2dtQ2puSVNEN1hqNFRD?=
 =?utf-8?B?T1BRVUpaL0ViUUI3OUJBUmQrekg1bUw0dlR5SzRYTkttK0dVSWdxZDVCbGwv?=
 =?utf-8?B?OFptUTBBS0RoeVJtaTkxVlpzRFNRN2x0dDNiZVZORnVkTHg2MHl4WEVuaU5F?=
 =?utf-8?B?WlZWbTFjWnd6a3NEWnk0VjViZkkxRDZZOEx5RzVZMUZqZXczMDlDWG1BN3Yr?=
 =?utf-8?B?QlJTUkVvbzJxNkhQbnVyZE9vbXhuR0E1YXFzM21qeHlvTHptSEpPeEhUL0RQ?=
 =?utf-8?B?cU0wUFNUbzl0WkxsKzVSYk50VGRId0pXdUd1MWNTQ01iZ1lkcVFkQmlGMjRG?=
 =?utf-8?Q?m62vxtMnlghUd9D08rOK9MA=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c987c63e-82c0-47df-206d-08de0d806649
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 13:23:45.8373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGoI3zW49wrrbBP11S5gWyfvw8IU2exZBt88MR6E607WVOg2Gwq/ROgxbpjXQNFyBH5T1DJTc3dobBWvNGLHQh+/3zmJB1CirCNw7Ng7dnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB10250
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-10-17 06:09, Thomas Gleixner wrote:

> +/**
> + * __scoped_user_access_begin - Start the masked user access
> + * @_mode:	The mode of the access class (read, write, rw)
> + * @_uptr:	The pointer to access user space memory
> + * @_size:	Size of the access
> + * @_elbl:	Error label to goto when the access region is rejected.
> + *
> + * Internal helper for __scoped_masked_user_access(). Don't use directly
> + */

^ general comment about ending sentences with '.' across this patch
(nit).


> +#define __scoped_user_access_begin(_mode, _uptr, _size, _elbl)		\
> +({									\
> +	typeof((_uptr)) ____ret;					\
> +									\
> +	if (can_do_masked_user_access()) {				\
> +		____ret = masked_user_##_mode##_access_begin((_uptr));	\

I don't think the extra () are needed here, or is there something
special happening within this macro that requires it ?

> +	} else {							\
> +		____ret = _uptr;					\
> +		if (!user_##_mode##_access_begin(_uptr, (_size)))	\

likewise around _size.

> +*/
> +#define __scoped_masked_user_access(_mode, _uptr, _size, _elbl)					\
> +for (bool ____stop = false; !____stop; ____stop = true)						\
> +	for (typeof((_uptr)) _tmpptr = __scoped_user_access_begin(_mode, _uptr, _size, _elbl);	\

The extra () around _uptr seems useless.

> +	     !____stop; ____stop = true)							\
> +		for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;		\

Removing the space before (_tmpptr) would make it clearer that it
behaves as arguments to CLASS(masked_user_##_mode##_access, scope),
similarly to what is done in cleanup.h:scoped_class().

Nesting those constructs will cause variables to be hidden by inner
definitions. I recommend using __UNIQUE_ID() to make sure the "stop" and
"tmpptr" variables don't clash with external ones rather than trying to
solve the issue with a random amount of leading underscores.

> +		     ____stop = true)					\
> +			/* Force modified pointer usage within the scope */			\
> +			for (const typeof((_uptr)) _uptr = _tmpptr; !____stop; ____stop = true)	\

I'm puzzled that it does not trigger compiler warnings as it shadows
_uptr if _uptr is a variable defined outside of this scope.

> +				if (1)
> +

^ can be removed (as pointed out by someone else already).

[...]
> +#define scoped_masked_user_read_access_size(_usrc, _size, _elbl)		\
> +	__scoped_masked_user_access(read, (_usrc), (_size), _elbl)

Useless () around _usrc and _size.


> +#define scoped_masked_user_read_access(_usrc, _elbl)				\
> +	scoped_masked_user_read_access_size((_usrc), sizeof(*(_usrc)), _elbl)

() around the first argument are useless.


> +#define scoped_masked_user_write_access_size(_udst, _size, _elbl)		\
> +	__scoped_masked_user_access(write, (_udst),  (_size), _elbl)

Useless () around _udst and _size.

> + */
> +#define scoped_masked_user_write_access(_udst, _elbl)				\
> +	scoped_masked_user_write_access_size((_udst), sizeof(*(_udst)), _elbl)

() around the first argument are useless.

> +#define scoped_masked_user_rw_access_size(_uptr, _size, _elbl)			\
> +	__scoped_masked_user_access(rw, (_uptr), (_size), _elbl)

Useless () around _uptr and _size.

> +#define scoped_masked_user_rw_access(_uptr, _elbl)				\
> +	scoped_masked_user_rw_access_size((_uptr), sizeof(*(_uptr)), _elbl)

() around the first argument are useless.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

