Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7BB94C4D7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 20:47:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=V/J438wl;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=AySJ9ZI+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfwy93pJ5z2y92
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 04:47:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=V/J438wl;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=AySJ9ZI+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfwxT1rR7z2xft
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 04:46:36 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478HfVkB018724;
	Thu, 8 Aug 2024 18:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=VCerViLdVXoSnyZPJbZ3dYEh7kDdywdswQCjqt1EDG8=; b=
	V/J438wl0PifNuU6p9MR54/fKb32wzJiVWKwJuQptTjGCV4zqd7bH/6QVFPNnk6H
	6auIpCROS+7GnxV0FTBeo8dDZ1ro5oAmhS3J7nzRv2Y7syget/cDxQw3nKCjumuR
	ziO6FvbiLNBP2UJlDH/24ouM6NvA0lsBXgeHxP7iVJG/Qr46X4XyHrtLbC2f42KF
	WFSgUihEXkjep3Ql9L9QtaCKGXPpaOKhQpxHEyYFbT52cmC5iBWQxKPHl+zos0Vp
	U1IIV2sTA+TxeCVGuFP2mfXFmGLCQOwYZI8ulKMMRmS0dUqNtfwQ5Mq6Coxw/yJx
	fktZyy12xr5Erir9Q5y72Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40sayeadss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Aug 2024 18:46:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 478HO6fQ040803;
	Thu, 8 Aug 2024 18:46:16 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40sb0c3k7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Aug 2024 18:46:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNf3A7+yPMNR9RS2zBVLSx8+p0fEl6spjfzohFh0583T48Vn1xixrzcnSNvwNDXzkHDb/eljkrOcoW4mVAvdpLU4EBA79M87XoKtDGWH+89byviSWc9cRyRBhb6KjDtHKpVVtkWb0hWb40E3gbt1rWXxgsfKUh0FX/ppNhXH3g2+VCBXQTlJsKh1U19ZWS9UTrAkh8wCctR6kvbKDPG1j6Ia8hwWN4QO2fSsF/awG4X47oSI2MuputPgfF+LjXcxL8EFEiTEMkZ0Iz+V76k3vKJhFAKDx5e3iRWJ8mxp38SirTitd4cexKv+d5vAHIK9TGUVHopZpHTo74tnTmMuYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCerViLdVXoSnyZPJbZ3dYEh7kDdywdswQCjqt1EDG8=;
 b=mQ3aDdJkk7w2qFILx4pyokSwrz3kT6P/GDJI8Bbvy0T27Q/mNmCPbtyoA/YX5Dh1nQAoLCl9CT5tUE4sPHtahujHiv03fCZj9KEI25AhPEfa6I61SNUNpVSMMyP0y9Uigs9dXDhD6uvPTafrEQCwgV2ogBmimfrp1v1KTAn5Bdg1wgdXgQuByvWD4MWyzvphwEnQRs4oACGnVsoZ65SCBL74ZZdgbMYpTKUntMbn2j0m31Ri3V5gexl/KvKy5trSL66F/m3/V+I13SS/l7ZgHvdh+dqYz17R8ZyTpFkgT+zfqqgpkSl84qV1sa+XWz76TY2N6bVnz5Cm40eYwG6yBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCerViLdVXoSnyZPJbZ3dYEh7kDdywdswQCjqt1EDG8=;
 b=AySJ9ZI+6WWqDQRwTJDQsSkokZWfo9Mm5ShzkDr1dA+5wn0VAcdHzxZDe/uvx+VEVM9QKSZVIdcJiFcXFwShGaNrbUbpl9X5OnwOAyWj15lwshzK5hZqDN6NGPYcEYAlN3bQ86vl5Z5S9lB4tzdLUj8wLe26doiqxgHKsuDwQlE=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by PH7PR10MB7838.namprd10.prod.outlook.com (2603:10b6:510:30a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.8; Thu, 8 Aug
 2024 18:46:13 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7849.008; Thu, 8 Aug 2024
 18:46:13 +0000
Date: Thu, 8 Aug 2024 14:46:10 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Jeff Xu <jeffxu@google.com>
Subject: Re: [PATCH 2/4] powerpc/mm: Handle VDSO unmapping via close() rather
 than arch_unmap()
Message-ID: <mayqavxl6vpod2tcgb6f727dqcbifaubfgeiiy2sdfsqhwrgej@tbm72lvz2lof>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Jeff Xu <jeffxu@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, jeffxu@chromium.org, 
	linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com, 
	pedro.falcato@gmail.com, Kees Cook <keescook@chromium.org>
References: <CALmYWFsCrMxkA1v58fJxtyGR15ZGxmSP8x7QC=oeKwzcwGL76A@mail.gmail.com>
 <gtz7s4eyzydaomh2msvfhpemhiruexy53nutd3fwumqfpos7v5@4fnqun2olore>
 <CALmYWFvqoxyBf4iP7WPTU_Oxq_zpRzvaBOWoHc4n4EwQTYhyBA@mail.gmail.com>
 <babup6k7qh5ii5avcvtz2rqo4n2mzh2wjbbgk5xeuivfypqnuc@2gydsfao3w7b>
 <CALmYWFsAT+Cb37-cSTykc_P7bJDHmFa7mWD5+B1pEz73thchcQ@mail.gmail.com>
 <lhe2mky6ahlk2jzvvfjyongqiseelyx2uy7sbyuso6jcy3b2dq@7ju6cea62jgk>
 <CAHk-=wgTXVMBRuya5J0peujSrtunehRtzk=WVrm6njPhHrpTJw@mail.gmail.com>
 <CALmYWFtAenAQmUCSrW8Pu6eNYMcfDe9R4f87XgUxaO4gsfzVQg@mail.gmail.com>
 <6i3f5bvcppm4bkpphcb7sxsopmeani5mg5irytc3nr464p24ka@jpno77j7cgyd>
 <CALmYWFvXKdfyvZTfu9D4GdBgeVHzLR2rXshqZMFPjU+FuAHJkQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CALmYWFvXKdfyvZTfu9D4GdBgeVHzLR2rXshqZMFPjU+FuAHJkQ@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0430.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::13) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|PH7PR10MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: b6566a37-058f-4d0c-2f00-08dcb7da607c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?ZTh5Nk9GU0xMdFNhS2J6OVNzNUVubXMyK2oxb1Z5NDk4andqczJRY1Z1Vm51?=
 =?utf-8?B?QVNOQWFvUkN4ck9LSDdSVDFrRzc5Nk1pS2VwVitGaEk3Y0xKcktmNVg1Qkd0?=
 =?utf-8?B?cEQwa0NyK1FzOXNrMWI2RlNuTElwWUd2QzJxdFVQTW5IcFpuVEQxVXlGdXh4?=
 =?utf-8?B?Z1p4Z2lDWEdzbmNwZjI0YWNDMXVDU3A4SHVOemZkd0hOd0k5WVU4S0U4dWk3?=
 =?utf-8?B?RkloVGlyRWtwdHhLNWE5UG9HaHdQdzQ5eGVCa3d4dDc2WDZZdFdrYTNLN2N0?=
 =?utf-8?B?Q2hrc1pWUHZ5aDN6TCtMSDdFN21jbzd0c0Z0ZGc0OW5vaXlVRkQzWTlQWjRi?=
 =?utf-8?B?d2JmNExBTE5xeEo1b0tkb0xrN2VUVlNNOU5WTk1aZ3MxeXkwY3U5WmRjejk1?=
 =?utf-8?B?MEwzRDFHdzZVOWlzMUhTVitHTVNvR0JtdWNjNlJiM3pNRnl6UXRINXM5SkRR?=
 =?utf-8?B?WVdXUW80TlFKcUR5OERybDlmZnhJQ1F2NDk2dUVjS1Nkb2lZWnY2TTdObEZh?=
 =?utf-8?B?WHpUb2h6bXFPVVpnaHFQYzFOZ0lJUkJOZndDRXFhN3V6SDMwaVIwKzAvclJl?=
 =?utf-8?B?eS9VUDVZMWJRWU5mQ21NNkNqdDI3THdvcWJWMDBrVDc2Q0xETzBEYkVxQzU1?=
 =?utf-8?B?amllMGFRbkNjZkF2c0ZTMVJxdWd2d0xtNUgzelN6dmxISWk4Tjl3aDVjY0h0?=
 =?utf-8?B?UHovb0JvS2RjMUxGbEdXMkV4c0RlSFE4UVVLWmdOU2ZPcDRScU1lRFZaSkZ3?=
 =?utf-8?B?UWRBMks3V0ZaR0VwMW1xSUZ0MHhodnIyOXJ1Q0JUTmFDci9KK3YyaFhEWkJH?=
 =?utf-8?B?RmFYelRRTkhYb1F5TWtDOEVPZlo2a2src3p3djM0TlpWN0NBSkhJSHdtam83?=
 =?utf-8?B?b1ZPdks0RmN6aXBqb1gwUTcyL2d5VFBSTXdQMXdGdjZ4ZytWdGNqK1B2azNP?=
 =?utf-8?B?alhralVFQklORENUd2hheEM0Z2VoSmJhejJGRk5OS0pYRkxuVHFCaE9MdENB?=
 =?utf-8?B?MVVBaHZNZUxKRGZtamNTU0xoNE9Gei9KSU1aS2dtcVkrSGJ6b3QvQytVanNN?=
 =?utf-8?B?ZW9MeXRCN0RkMGZ0Nis1ZGh3ejlTeUdaSS9NY1hIdmFlSzNNVlhoV1ljTFA1?=
 =?utf-8?B?L2VMN1E5MXYzdjI5d0VYaUxNRUJ4Y3dqTUtZSFN3SGUzVlhkaW9EbVJPV0ww?=
 =?utf-8?B?R0k5T3pXSkdQeS9SY3krYjFnREhwSk9wYXVVbEdrdERLZXpvWDRUbXRhZlpB?=
 =?utf-8?B?TUd5TlV4WGFkQ05QMjBDZzVyNFhqd1R0cENnOGFmRlJxT1BoV3kzOUdiSTFP?=
 =?utf-8?B?ZkFETFM1NjErck55eUVFVmUyMGNpaXVabkhmbFVsbTVlcTVnN29FMTdIUE4y?=
 =?utf-8?B?WDU4N1hZNDI2RlA4RzRpTDBKOVljLzE3RWdLSWV3OStKd0MzQXNsa2xMb1I0?=
 =?utf-8?B?NlFQWStOU2pLa3dtNlRKbmQvM2hIMnFWbGlTdjh6TVdHQzh5ckJXSHMvRVJ0?=
 =?utf-8?B?aENObUtSdTgwcGwzSFhHaWRkbm13MjFOWVpCTWp1NkU4cjN3MlRPVWJYZ0ha?=
 =?utf-8?B?V0ZnNHAreGhlMnRBNWN2SERQbXJaYWE4c3AvRkVsTWJnTzBiZVhEL3BtK1lt?=
 =?utf-8?B?QWtUZUI0enlGNkl0eDBZNWpHeWZDSG9WQVdzZU9uTXptTTZzb2wwUTBjRVI1?=
 =?utf-8?B?MHRRSWVzM2JPcjN0azRkM0dQWmtGT2tDd1RXT3RncWFwaWFIRDkwY2ZqcmFo?=
 =?utf-8?B?cm5ZY0ZyOExhSHZlRldTb2lDVlAvMk16VHBJSlA3dEY2d21ZNS9PWStHQThw?=
 =?utf-8?B?c3B6a2UxV1VmUHI4aHNLZz09?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SXV0a3JZb0g5YW1vZW5SMGJYSlR1NkhtMnkxcWpvQklCQjcybVBYYTRUdGhw?=
 =?utf-8?B?a1VMT2luVE92bjhhY3R3aVFlL0VGZDU4UmVFMVJRbXY5QUE0bDdNYUxtbzd1?=
 =?utf-8?B?QURmbk8wb0ZiOVJMbFFaTS9ndExKb1k5T0FoWmxjZDR1VTgrUWpwUHZuak1R?=
 =?utf-8?B?c1lCMnMrWUY3QSt1MHBFSDRRNnBCZVYzbHczaElXN1A0MHdQbE5IbXdWK1Yr?=
 =?utf-8?B?T3hNdDg3clRFRDZjZXNLM1VtamsvS3pNcjA3dTZpeE5oVVUwWi9KTmNIVHMz?=
 =?utf-8?B?aVZvQWwrc2hyTGlVMWZIY0dkVHdXUTB0RUdDUFVBcm1IdVF2NGU0eHczVng3?=
 =?utf-8?B?Y0NHS3RnbGo1aXZHWlRQTERIb0NWZGl1dVkwYm5Lb0EwYy9vdGxUbVliRUs2?=
 =?utf-8?B?dFJrQVpFK3d4ZWRaa2VDb045V0hjcWFyYktvOHhRSXczMWJobUNlNDZHQWFD?=
 =?utf-8?B?anhNTGtUNTdmeFl1d2lXU1RJZWs1UkY1S01RcmtBZW03am9zVGRNL3dpbnR0?=
 =?utf-8?B?NjN3cUNNYlA4YVhtYStkZ0RTYWRyMzlWVDJiVnJQNEUyalFhdmRzZmhrU0ln?=
 =?utf-8?B?Z1A0R0FJTVQvd2RvN1hyY3IwZHFnUElRR2NtdElWNVVNTHVGTTUydzMzQU5Z?=
 =?utf-8?B?YU9oVkFPT2FKeWFrQUFGWjQ2UmZjYzJINzAycEtEL0FJb3Awc2NDZ2RwdjFh?=
 =?utf-8?B?d3dJY1U0Q2pTNjJwTlVDb3ROeWVqL0xRTkZZZ0t5eVNRSFJNeTYveXVXWUwx?=
 =?utf-8?B?VDZQYlhqV2RyMzA1Y2hmR1NDS0p1N3lMck1Oa2VIT3JlZEd4dTRVRUdFVFdi?=
 =?utf-8?B?aG9MVkYrS3kvTmlEckl2MDBSRFgxb2dmdGNpT3hQRDBUODVSTlJWeUhFM3ly?=
 =?utf-8?B?OEYvWUpWMVd6OTBCU0xmTzg3cThVOFdSZDFXNTFTd1RJN2didGlSZXYvbzJm?=
 =?utf-8?B?WlQ1QzJpVEVyTXdUWW9IVXpKRWpmVy9kV0Z6alN4RkFDaFR1T2ZYZmptMzJK?=
 =?utf-8?B?VVp2TjVzVEp2TFljM2JRM1dWSEpwVjMxTjIyUk5QM2hQd3dBWk16cDl5T2Y1?=
 =?utf-8?B?TXNZYVNKcnZ4Yi9wNmt5TFlYVjV2R1gvd0JGQzFObGtJUGtDUWdhRVh5WVF0?=
 =?utf-8?B?Yk1vR0dPejJaSGpMbStDMUJNeVJhem40Q1ZUS3NTaTRvRnNVb1BPelZ0N2VY?=
 =?utf-8?B?S3U1MkphU3ZxK1hWMGc5MHJnMFoxOEsrZ3RRZ2oyYVN4Rm9GN1plaUFMdUQx?=
 =?utf-8?B?aUJzTFY3UkxORm5tdlltUkZVbWIrZE50S1NLakg4Z2V3ajZqM1FPb3VOeDRz?=
 =?utf-8?B?MUMrRm4xUDZ3UkdKdkZ2dUhzajZmaDBNbFpOOHZJMWlKV3p4S3FHWWVoTCtC?=
 =?utf-8?B?WTRaOWJlN0RjeUxTamlmYlZPcmhpN3ZhMkR1a1VITEs5dGthbWl6NDVFdjM3?=
 =?utf-8?B?M0wwSytiaTh5aXgrcEJCRjlEZnpRQkhsOEppUEtFdGtJczJoVFFGWVNEaWVw?=
 =?utf-8?B?S0lqTSt0WVdQSHlzN0ZrUHN2WGVWT1d0MFZJUXVxTXJJaXducDN0UmdVWS9U?=
 =?utf-8?B?YUt3aWFaV3B6TWJHZFhveEFJbUhFbmxxeWM0Wnk2YWlHdm9Cd1FRNWhaZDdE?=
 =?utf-8?B?Vm5heHlyQW5ZcjhHWTczYXZOOUhObDVUOEROdHkzZ2tnVFhzTnR4M3l2NFpn?=
 =?utf-8?B?WGxobUNYN0NzYVQrd0NlS21RVnNoRkZBa3Fmd0NXUU1UdmpjcXhlWGYyRlVN?=
 =?utf-8?B?RFZNdGp6bzZYTmFVdXRlQzZoU1lWMnQ4YmpWdWozMkx5UUdKZHlueWc4VHZP?=
 =?utf-8?B?Z3VDUm9SbWZMMittOUdLOUxGL3RoRFRkbmJtam9KQTR4ZDdFeUg2dFFYcmFX?=
 =?utf-8?B?RmEwaHR6Rm1UcjZVRXZpQ29rQkF0MklnbXBuekJSYzhVZUhaSG1jMklRR1RK?=
 =?utf-8?B?c3UyQW9FTnpEYTZLNGg2cjR6ajFDWVlTYnZkNHF2NmVwRmJ0aFNtdUVUeEM2?=
 =?utf-8?B?UmZUWU54dDc0TzJjZkFOWUNnWklCRzl5d2p2c01aMlFLMzZaMjZMKzcvRVdO?=
 =?utf-8?B?Z0hSM0V1ZmREVzB0N3ptQWw3OFpKTzBLQUxZTHdXVnpBa2k1SlN1Zk5HZEpy?=
 =?utf-8?Q?7/d5TU7Cr8xNEwFSlQ+szVrKs?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	nFY0LZg8J9lrnD/KUJdycZBT+TDivdKtVNElk1UBnGtKPEfEnL/5xqp0Cc+jEW2z3tGSmudDNZEvQfr/SFjAo1zmYLRbwFqBtK5NjEYevxeQBEf2yJo/eUVwfcUTTpWDFITmgEMQHDFGBHiOv5vgDseIUjJryXneoXTDpZQKuoiyAD/P84gnldo8cJQR5kLZotoDZ0YTmNy+pzosHbypg9IdOxkmTPgJUfoQ3nctHanlcP4kwcxWXoGczTmreQZJrdP9Hv0vgVTWc8GR5CVICTrq2WsEoa0AhgScU+whVMFkJSG6MhPU/NuF/705ylxrh47ZqmCwYWdII/Xfxn20/D1Ox90XV98m8v+bqJeKrCcjRfJYpykThE8CY1z/kX/NIh/7qemI6bwsm2rn9ritPA5OHCLeCKIYAR+UZ5yyAEpXP4EV98Hot/L2biiXbYhgfMZQK28INOaW/tfvqA8zTaBFUTmxjWld/7G7DOSoQZTET49zgn+IQF7ZNLcxpF++odwIDaShnPUXuS0hJR6qmwSJ3Zud9N4kwguyi+7pzB8a9db1zxaor1cDezTIKELgRouhPyB74xzJD/WZdPDVD+UyS3lgUfrccW18Av2KWRA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6566a37-058f-4d0c-2f00-08dcb7da607c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 18:46:13.0362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jP1tbDHnZhqVpfKUVH1rm0ZS5niv/oSePiLWRbUpDT3kCeToAQqxJNqH5pCyH4RByF4HzHuvfosNmkSJO1pWvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7838
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_19,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408080134
X-Proofpoint-ORIG-GUID: 4McvWtytN5umsKgA7ESG_M1H-eq8J-8t
X-Proofpoint-GUID: 4McvWtytN5umsKgA7ESG_M1H-eq8J-8t
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
Cc: Kees Cook <keescook@chromium.org>, jeffxu@chromium.org, linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linux-mm@kvack.org, oliver.sang@intel.com, npiggin@gmail.com, akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>, pedro.falcato@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Jeff Xu <jeffxu@google.com> [240808 14:37]:
> On Thu, Aug 8, 2024 at 11:08=E2=80=AFAM Liam R. Howlett <Liam.Howlett@ora=
cle.com> wrote:
> >
> > * Jeff Xu <jeffxu@google.com> [240807 23:37]:
> > > On Wed, Aug 7, 2024 at 8:21=E2=80=AFPM Linus Torvalds
> > > <torvalds@linux-foundation.org> wrote:
> > > >
> > > > On Wed, 7 Aug 2024 at 16:20, Liam R. Howlett <Liam.Howlett@oracle.c=
om> wrote:
> > > > >
> > > > > Okay, I'm going to try one more time here.  You are suggesting to=
 have a
> > > > > conf flag to leave the vdso pointer unchanged when it is unmapped=
.
> > > > > Having the close behind the conf option will not prevent it from =
being
> > > > > unmapped or mapped over, so what you are suggesting is have a
> > > > > configuration option that leaves a pointer, mm->context.vdso, to =
be
> > > > > unsafe if it is unmapped if you disable checkpoint restore.
> > > >
> > > This is a new point that I didn't realize before, if we are going to =
handle
> > > unmap vdso safely, yes, this is a bugfix that should be applied every=
where
> > > for all arch, without CHECKPOINT_RESTORE config.
> > >
> > > Do we need to worry about mmap(fixed) ? which can have the same effec=
t
> > > as mremap.
> >
> > Yes, but it should be handled by vm_ops->close() when MAP_FIXED unmaps
> > the vdso.  Note that you cannot MAP_FIXED over half of the vma as the
> > vm_ops->may_split() is special_mapping_split(), which just returns
> > -EINVAL.
> >
> The may_split() failure logic is specific to vm_special_mapping, right ?

Not really, it's just what exists for these vmas vm_ops struct.  It's
called on every vma for every split in __split_vma().

>=20
> Do we still need to keep vm_special_mapping struct , if we are going to
> treat  special vma as normal vma ?

No, just set the vm_ops may_split to something that returns -EINVAL.

