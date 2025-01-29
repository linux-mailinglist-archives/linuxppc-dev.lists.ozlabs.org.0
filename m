Return-Path: <linuxppc-dev+bounces-5691-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A62ADA225FC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 22:57:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yjwx21ghJz2yDT;
	Thu, 30 Jan 2025 08:57:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738184576;
	cv=pass; b=jFFAy7M1QRXHY8rvl/aC9KUSrPsXRKc/hIjadREvjTb9/VkF/kPIco7qEK8eKIUfIrblgP5QB9OtbDEU4fYTEOfoUzrNx29TjPCZCyFOKTQIF02f8H0iFS01WVffgxWjUrxW7SwFb5js0jDfDLBgaps73MYB+NyBDrlEoraeSYpxgRwmf8MyZDe3m7NQGLHJEIPRahKDZKQxk+1vrNTGZvKSmyp72kOTspI4duM4Vv6VuTXCSkhOfMcAk/GC3InVzM6m732L5JYl4zL6becH7HDxVpZ6IMWtwahMaSt4nmQkjmRHKGNVqGaQ+/mx8b2emEQbiG6tU5pEnos2ZvJ3CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738184576; c=relaxed/relaxed;
	bh=Wwk1QjUXTIb1F3EFAtLCGDKlwOb7AjmhElP7ECs8Wro=;
	h=Message-ID:Date:To:Cc:References:Subject:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FwOnDKRUmLDf4anM/z0T0pOUhzlOCl/WmYiRJX+zj4rxg4QuRAOunTXM8q2heXUhlRnTvFLc4NXq/mQMXCnWfhSlk1OHqDR6eR25WryHjwbjH7BnOQ6GwklJ65sZaVtsnV3o9OANnpkuykTDruiSWw5Jv7Y6xjUVfbRsI98Y09nnSVdldOn2H7Ix0Z3WVtPFBXXRSWHHr0E7/po6+RKh3XDEhuu03erWmz+fwHOKYWuILYBmM7+IViBzEk1frEC1YGWcRa6d4YtfZy34/YYcuPwnJS5ZZ3qGKXRHsc+YCGlDPyQqCR7xMCaXDQyzhehJVdHFb7xMMK7E73HIv+Jklg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=fXalxs9Y; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wEcZL7z3; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=sidhartha.kumar@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=fXalxs9Y;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wEcZL7z3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=sidhartha.kumar@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjvkR4H0Fz2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 08:02:54 +1100 (AEDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TKttLT011994;
	Wed, 29 Jan 2025 21:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Wwk1QjUXTIb1F3EFAtLCGDKlwOb7AjmhElP7ECs8Wro=; b=
	fXalxs9YxEKXYd8iqgChkDEKSuR8+A5mLxgrrwEpAHMnqsWP1girijWxLqpztRZt
	rsubzHH0hw2eH3ka4vO92Qlc0dP+8wk5+3xMUqUq7dXFosyJNPpbuarAf8XFhHH0
	lc5Htltccz3QN7MlOesBrrBq8rmUNwmqrJAm1pEGoNzt0ylRJCaNDCh8T4xvQyox
	9urJS+Rvj8bEcYskpqxwZiqWZRYKTKMgi5IZahI3ig1NGu21NEKu8FZWg+VdguCg
	WO9HaDCWFxo1OEuzQ2x/GmzzKHT49KldbK7/3VkltvyNmpGvVPfzLM/ZnJEFg6xh
	iT5GTRiTQ1JqY+DWVdjKtQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fsfh8jq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 21:02:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50TKQhX4023978;
	Wed, 29 Jan 2025 21:02:21 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdaaqrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 21:02:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+qeIepkbe5WX7E9DExp7Sn8y4crQDVf8O8uexxavXkD9Cq65IO9jJyJhPiDE1Fu9zYxDLghqsdrsefXtrHn7xMcZmrlnQVQAn64pg3Tg8A3NPNgtB5T44YT0irYb1HZP1qOzRk7LFXSUIUACBiQ6vwBY4fgKBjbyaecqQQ9uCl+52FDrv4YtNJB6TR2H2sE6/SifE+gpsfgYw7N6XYnrrcWreRJbxtM9VWljqQxnFNteJaWw4Ym0DjgwfdVzAQhvr7FCnt69BkYczVWIYKO7+DZ61Oiq+k1crNnk/bHvRmSZ6mTEEfsTDOKT9bgB/V0pFKlCBDOm602Iw4xRZ5xVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wwk1QjUXTIb1F3EFAtLCGDKlwOb7AjmhElP7ECs8Wro=;
 b=k90fRZnbs9cwT0+L7jxDgLyyOjn2GALr+vYRDyoy6+l4XBjAV2Kwd2f4Nm6xO6IdCxIT9LhUJLcUNdu9kEKgqYZiWaGU49+vbyquUD8hZMF5Yw6SQat0gRFklJQ2DHZ/QhIra8uHSPBYnUNE3XJf6Gq3ztaTYJzJnJlNlsDLmeDilzIhY6h2YgEijHAcfvn0Zfp8rKceg1AcBCKTSh19DEWALHWxWWXVYFYyYoxX+X4IsXMXY4jB/JdCJ1yGF2ICo+1KQGSyqoZl9Ck/8RXuVLwGSQArPbFRcLoH3S/amiD5uosViCE+N2VCJZMimRK2/gV2AFoZgNsJq5bTn9hMKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wwk1QjUXTIb1F3EFAtLCGDKlwOb7AjmhElP7ECs8Wro=;
 b=wEcZL7z3KAfHmtXMpxCKtAitKuZljrUcTCy5qze/433MwXJTXLZTqGcHjQDrfMFqpvxRvFFMRtDQKy6AoxkllL2i2H/K5bcS+XJeMJmCUPTAjC6sLilYR3oitx5LPB4Sg+svogDYYlDtV5Q9KJtW7Kbha0YXiYfE6hweyCWX4O0=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by MN6PR10MB8144.namprd10.prod.outlook.com (2603:10b6:208:4fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 21:02:18 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::eab6:6dcc:f05f:5cb2%3]) with mapi id 15.20.8398.017; Wed, 29 Jan 2025
 21:02:18 +0000
Message-ID: <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
Date: Wed, 29 Jan 2025 16:02:16 -0500
User-Agent: Mozilla Thunderbird
To: tamird@gmail.com
Cc: akpm@linux-foundation.org, christophe.leroy@csgroup.eu,
        geert@linux-m68k.org, justinstitt@google.com,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
        maddy@linux.ibm.com, morbo@google.com, mpe@ellerman.id.au,
        nathan@kernel.org, naveen@kernel.org, ndesaulniers@google.com,
        npiggin@gmail.com, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Matthew Wilcox <willy@infradead.org>
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
Content-Language: en-US
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0319.namprd03.prod.outlook.com
 (2603:10b6:408:112::24) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|MN6PR10MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc1e7f3-bde0-4f68-8491-08dd40a8374c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0Jud1RGSmhyeWhtblBRc0RLcDNza3I1RzhiWVNSeTZZWnkxRFBIbjZmbXdp?=
 =?utf-8?B?MUc0VmIzRDlqa1kzTkM0ZWRFRk9CWGN1dTJxQkllQTlXMzV2Mmw5SHY1cWox?=
 =?utf-8?B?NGlrL0J3T3pHRWowUHJKK1lFYm9PZWp2dFVRUjlNdUhwRXZHYVN3Ylk1M1Vu?=
 =?utf-8?B?MXYxOCtvbmpPdlFTaVdYa3gxM05wQWV6Ny9GRVdXVksvZ1c3ajlremR4bzdJ?=
 =?utf-8?B?U2NWZHN3TjNKY2FoakRRdmZOSjBMNEsyZVIzQ0tjb0hyNHBUMmU4UE9aRXQ3?=
 =?utf-8?B?V2t0bEJHcG9Pc3NYaE5scm44d2VTbGlkUFFkREh6V3RTeGZRNHYyM2Z3cEQ1?=
 =?utf-8?B?VjF1TVhiRU0xbmxrOVV0M0FKRzNkbGZlYUpKV21KcFZHdmJYOEZVcWI1bWZ0?=
 =?utf-8?B?aTFJSGs3MzE1TGxwT1BRY2tYa1puU2lPVkdwY0ppN2dJR2QxaW10eU02Q3JE?=
 =?utf-8?B?Wlg1MzRQQ0dGM1E5MEl2dDl1TWdLVmN0YW8yUnZRU2h3a0cxTXRIbDNPcjc1?=
 =?utf-8?B?MUVVN0dzbzFZR1Q5UEJ2c2Z1bHY4S1ZmdXBwTVArZnNnU25hblNxakswUHMy?=
 =?utf-8?B?T1ZlVjBsQkFxS2hmU3oyRDloaTlxM1pINnVObEdLcFJiMUIrMW5xVHNZWG1O?=
 =?utf-8?B?NjFzMEJIMXRZcXRNRjdmWmUyVCt1K0w5RGNJbHpBYXNMTDZLd3VPSFVKdFky?=
 =?utf-8?B?TTVDSkZCWjhpeXIrVlZ2eGVyUjNIM3ovdzRwT1JkK2F4eVgzZ3hQL1VHNGtp?=
 =?utf-8?B?SllOaDhBYWRuY3VoMzlXaVhpdkZEaVMzS2J2OU1kZDloQ0drdzR5a1pMelVD?=
 =?utf-8?B?V21qc2NDcC9HVlJEUUdOQXh3N2JxYVlBOWsvUnpFTzBqRFY5V0RnYTZxRFhu?=
 =?utf-8?B?Q2NLNUNBWElpN25jOHVJK0NKR3UxcEdBUVc4c21PZURtUWFVclh3cXAvNTQy?=
 =?utf-8?B?WFNnR1hhdVo5TVRCalFYU1N6aUI3Q2dCWmtYR3d4alloa1FUUS82ZkFXNGxx?=
 =?utf-8?B?NEV0SXB6SGF6dm9BcXJacHFROGF1dGxxZnpHVmFDUTJnaGVheHF3Z3pmZVlH?=
 =?utf-8?B?MU9yZGppOTRHeDlUejZDcUttRkdLUkdGcDh3VVdWM3hGZCtiN3k0SWpYSGkz?=
 =?utf-8?B?V1F6NGtrZm1jajJjaVIwUmNuS0pxYkdORE1JcFVvaTVkMUdUeHhzK21qKzl1?=
 =?utf-8?B?QXZBSEpsUzJ1VW9GeXZRYmhPcVpianFxZzRKUDRuKzhBOWpodmkwdFJzQ2Y3?=
 =?utf-8?B?WjZ2dXA0SW1FN2YyYjNzSHd4QzVMZU9yeU5uYmw2Y0V5WlVsVU9ZVzRaZStN?=
 =?utf-8?B?MEhDRmszaHpPOWswNEJKUEdXVVBhaDhkOHJuTmtENHNWZVd4Qy9WOEl4bnJK?=
 =?utf-8?B?amRCeWIwV2pSUFJaRTNZRVRzQ2JkVDZudzlqYS9ZWkZwMmdwZ1dZc2tMZTB6?=
 =?utf-8?B?a0pzMGQ4ZVVDeVY0Mm91Rkhvak10aFlFZ3dIUUg5TnJHbXFMUy9yUWZ6MWFL?=
 =?utf-8?B?V24xWTczbzVWa0orWHArTEV1bmxZd2NqZUhoZXYvTkVqUDZRMnc5T21qUkxq?=
 =?utf-8?B?U1VZenlWWkdLOWFDN3FoWTdyTHI5K0VnSE9SaGNkWUpzNDEzTHFhMjFFaUlh?=
 =?utf-8?B?SFM4dmVMWlVuUlJxRWExWkZBWEgyZS9Cbk9paVJpektleUMwUHZsRVhyRWhF?=
 =?utf-8?B?N0l3cmJlK3lQSWJKZlN3ODM5emRvY28yN2FPT04rSlVFemk1SDVCSTZxZGtN?=
 =?utf-8?B?MlVuMFNNODloaVA5ak1kb0g2eHdqTVJOMk9FSFBMRWVPNXU2VitqaG4vRWMv?=
 =?utf-8?Q?EvH9ZQrj2PKIOIql7AoQUchT/hlv2MUHnhINw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5113.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0hGaURlS2NVSDJ2Z1ZIZ2pTcVN1WXA2Mk4xVDVGQW41bytpVXc5OFBXQmRp?=
 =?utf-8?B?VGxiV3M4cXFRaHgweGR4b2xWVm8yU1dZTTdCRC9hVlp1TzhEWmRTalNPbVdU?=
 =?utf-8?B?OEtJTDlHL3YwWXdwTE5MeWRsUWZQWklmcDc4Q1Ria2ZLeUhUZEowR0hBdWt1?=
 =?utf-8?B?OVBFZzNvVHYrR2xIeUg3bVhWZDRGN2R0U1lvcEFuL2dBRlkzWHZqM2RCUFBU?=
 =?utf-8?B?SjBiMGVzU2tvOTRQelBSaXl0WGN4eFhTVU12K0tIekFCQ3ROVWpCaXRkejcv?=
 =?utf-8?B?c0R5NU5ObTQ3eEphV1YzdHpFYXphUlFZamRtWU5TejA2a0RvL2RXaUxvNEZh?=
 =?utf-8?B?dmc2WDJGK1ZGWHRqTXFxM1V6a1NnRlluZkJ2THFycEMzdTd1S2NnM2RIZjRi?=
 =?utf-8?B?eTZGUTVuY2hEaGkvNUdlVElGczNKditKeGNGRHNJOWI3OWRobnJ3TW51aS92?=
 =?utf-8?B?SldOSHY0QUlLNnNOR0hTSHozUUtMWW5DcC9HUEFCM2ozNEVWQ0dnTW1oRktU?=
 =?utf-8?B?VklvNXhKc2l6M2JTNDl4TzdsMTllMTU1U3VjU3FBK3FwS09aMkQzNjUyV21a?=
 =?utf-8?B?OUtkMndJSlVDS1M0NFdNY1ZweHV0eGNNODRzNVp5cElYTFVEVmc2SGxtdFg4?=
 =?utf-8?B?Z2RlMHcvS3UwamdXbTZSK3h0ejFmS0RrNURhRkh5K205bmxUWGxBcjZaejN5?=
 =?utf-8?B?TGFuVFp2aVIvaDlLSlNnVDBYWndKV1ZTTmpaRWhLcmpHVkJBU25SZzBsOVFH?=
 =?utf-8?B?T2NieVEvTFZnMno0UG9CdXpNMi9VYktidmFIcDNuUDhoOW1hdDFoZlJVZ1U0?=
 =?utf-8?B?d2wxcDl5MWlUOGRmY2VOdDVDMllOcGx3SE1GUDE2Y2RlNmlmbW1UbWZaOXE0?=
 =?utf-8?B?bC91YWFEbTdwUGFEU1k1RTk1VGZTeGYxTjJ6Vmc3K3VSVXQxVS8zaW9kNFp4?=
 =?utf-8?B?N3RnR1N2VTlMYXZQYnVPSzd6aVVESmN6eUpzN012UDVpTFBOaHVmUFhGUFdJ?=
 =?utf-8?B?eVdGcEVER0plNUlUcDlxcFlGZVE1NUdpQnVVQlRnc01nMVBtR3NidXhpblhn?=
 =?utf-8?B?cGJPZDIyQUE5b2JBSUszMGlqVFdzY2NrMExkTmFyZVloaU1FOUFRMllKSHZm?=
 =?utf-8?B?M3FadjFWS3dtdWI1UlV6REIzM2t5c2ExMlpveEVVaEl2M2xZdW1SMkZRRTZv?=
 =?utf-8?B?K0Y5cFpjb0Foc21iMmRjbDBjZS93ekVGRGJiS3RBNG5XYXdYd09iMTVQRjEx?=
 =?utf-8?B?Yy9ydWp1TUZOZGoraTYwSXRPYUYvUFhsVjZmZnYxdE9zU2FIU1JsTW16REVF?=
 =?utf-8?B?UVRERVN0U2FSeVlGQ2c3ZXdpdHJmYmNZU09HWk1neVFQN3NSMktmT1dnckxo?=
 =?utf-8?B?bnVxcm80cDlxeElEWEM2K3VxeU5IR3l2OXdZMUtQcUVKQ29QUHVHS1ZtMXJo?=
 =?utf-8?B?NWxCU0hHZHVUT1BEWFpnUmhuWHROQytyV1BCYVJEUkZ5QVl2WHB1VllwQlhQ?=
 =?utf-8?B?MVZsbGg2c3lCMll0NTdHTTJtWmNLNWtZT0xBYUpFWXh1eTEwWFhtY0JQUmNH?=
 =?utf-8?B?Lzh3YmNXdDVrTmR3cVBnOEg1ZWkrWXJla2gwVXM5Um9kZ2daMjBTd25xeVhN?=
 =?utf-8?B?cWpJY1pZazZxWURWanZXMkg1NVNTRnFBbkY5MTJWWkNjVTlQZ2t5RXlqRFNo?=
 =?utf-8?B?UWlqMXlBUWh1OU85VnFQanFwTWJxaFNTb2pUZURkb1czT2xqcUhXdFFGV3g1?=
 =?utf-8?B?STlaNWVURHl2RWx1SEEyTXNvNFRGek50ejJJR0hHSnZSWVBCdmFobjErSUgx?=
 =?utf-8?B?TSs3YzdjR0xWRnFpLzNZOWJ6Q1pMeVR2T2pYaHVJYXZxNXAyazJWODRHSjFw?=
 =?utf-8?B?cFYwN3p2RzVMWk1NZUNJc284LzZxZ092dWhwWkg1V3Bzckg1NndPUDhQMXN6?=
 =?utf-8?B?WVVQUUUwNGZ4WkdOUkNnZk4wNTRXSkRwaUlCa0VDamJva0xoaUdQOXBuYUNq?=
 =?utf-8?B?MFhrQjVLa3dkTytpM2g1ZmxubmJlU1ZDZmdORnZUQmVNbWRGYjFWUjVhMTl5?=
 =?utf-8?B?aDVnNjlrdlhvK1M1YWN2YmxmVXZETlB4M21tZWVCeUJNRXN6OWt6KzZ5ZnRi?=
 =?utf-8?B?SldwU2hHa1NpR2VJTEFNRGU5QW5EVWVBaTc0NmdEazRoOVU3UVRPT2R1NUJv?=
 =?utf-8?Q?3EMvZaPAR8uo6cygeGh3KyQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QqTNsoP2idFxRI+LFLU0eCxYaBC6QR8w7oQaukG4wSeyBhuQQNSp8XzLg9GWlVQO993XOI1aziaCLVuXwLrSYK2xUnvDoys6S/wDO899ZWWsoDwuJIoq/S2AMRgg1JUbKF6g8h1Lq9VEOG81cV1rDBg/TyFBQcpoOwVr2Tjb1X9OnPPUfiO+ra0NMmqQYAHOucKiJdffCNze2hOn4RHbAY9VLFvOI6PpTa/QDRpeY7IsnkZMd4bsyNzOJsXkkJFw8Rn308MKyM3lC90fMFAnrii0JR4M41RyO5Na+QdwI0mAi9uQ1jGPuy48vFGS7YqHA83EmE90qIPsZlzfEZ0jPHUP0wkqPtNTJCERMN30SJ8ta2i0IyMxiDHCvVtqGlF+gxb2SE4SQYZ1UkXRbFc2zLwAis2FvCqMneTarcGR46YDmk0Uob9qzxbYNVtsp3f1TU06dcn1kPsb6ZMitYU7aEMZF9nzQOu1hchhS8xhjT6+WjUt5OIHTdrYrt5l6WlTmzoiwzCoQwULcPyYXcdefy1QlEPyT3CIdXf6//vYitI6cIA7LZHevScsrQk1S0AhTFmDgM1+OJsFZaRV8XDmz2UKKPPBXBG0poO303zt1KI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc1e7f3-bde0-4f68-8491-08dd40a8374c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 21:02:18.4504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5zLCXgPjAM13XuUL+lETYFWBHG+0y4M2Mmu9IqvCQ4LIcisio1i+XfaMXrjKT+ndVq11GkXY9EDlJLe0m+Bnot2Sw5lcJgUsMQa2gAZNmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8144
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_04,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=942 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501290160
X-Proofpoint-ORIG-GUID: k-XGJ0CyNFA6_MNot6W7Q4wBu6yQ_ufp
X-Proofpoint-GUID: k-XGJ0CyNFA6_MNot6W7Q4wBu6yQ_ufp
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

+ Liam, Matthew

Hello,

I believe this patch needs to be reverted for now as it breaks the 
user-space build of /tools/testing/radix-tree with:

In file included from xarray.c:11:
../../../lib/test_xarray.c:9:10: fatal error: kunit/test.h: No such file
or directory
      9 | #include <kunit/test.h>
        |          ^~~~~~~~~~~~~~
compilation terminated.
make: *** [<builtin>: xarray.o] Error 1
make: *** Waiting for unfinished jobs....

this then prevents the maple tree test suite from building.

Thanks,
Sid

