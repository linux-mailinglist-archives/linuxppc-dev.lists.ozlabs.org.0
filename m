Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C50698C6E8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 00:20:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=aSRhpE3X;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=C1SzOQRo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfnjM1x16z3dX3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 08:20:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=aSRhpE3X;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=C1SzOQRo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=stephen.s.brennan@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vfnhb5G19z30V5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 08:19:41 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44FL19pT003823;
	Wed, 15 May 2024 22:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=1vrh5wI1wNw6ugWZ/VwTP/wK4l8RZpuJUAeO3eNGC8M=;
 b=aSRhpE3X/D6Yh8w8G3wdDNKQAN62Kqk4muyj+zSPCsXSPCwVk3C2CbdjIgJfi5h1mnRo
 nyLrvcMkeRE1XOb5W/qli6IsB9oucw1pscNMHTZI36BY3YfeouN2ndJE77eOvm/TW8rY
 u+w5HCIKPn/ywdMoiwuz8jpUtGqB7b7FKgKw6j6thDIhN/65uRGqiarLa5h6itCoBGwR
 MtOvbItBEQ5GxYGcB2+oDFvXM44zmPJLDTpAGxfJm/cAba7YlzUUZtKZTHu88neXTsyG
 nNhtAV/EHJ8DEfH1/jC8cL9xFh9hP+8a62rRM4Rc15Zrbk/k+HMLQc3d70XJIK4P1qZd 2A== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y3tx8m4ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 22:18:23 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44FKT6AR000580;
	Wed, 15 May 2024 22:18:22 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y4fssrg0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 22:18:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4Xqdngtmf8HTOZIeK8Ss+lU3QOj0Q4hYSakMfD7voc0mv3cFvJfrIGmCSjwX04qIzxvF5H+xnrqHG98Iu4kSyhy/rmfZK3+ceo0zVe7bFbw9atk3CbFLyEJL3CPuA8aib6Dod+9LgvvhgdaTJH4lhklnuwXUizNNdjYdEF0ENIZjEagTH/kw0cUxE27oWfhfcVABd3sHdC+YNQ7vzzsv2PXbWR3ImxcUrA8maW7rzTatfeHwURxbsc22cRSQ+F7jJqcrZb+8EHiALnKK/12KOHr60r2rGC4vw3Y20gG/qv5fo/mgUZoTaF1jPwzJMz4ZTZ3GYkjmmx6q1Jmw+pMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vrh5wI1wNw6ugWZ/VwTP/wK4l8RZpuJUAeO3eNGC8M=;
 b=HXvLOjqPqvKjR28/FzWT74svyRXnuoDZwiwpPkdTd2tnYddndZUZwi0frYwQAhcIaeqxXscvJCgK2ueRQRPYbQs37kunGGJgf6ZzP3h+sU/zNtCsNSEHo6s63O9NUJYJ4n9YUBxrYnQOEyIkBKLdv9+fJtBtBFCdBz8TAcnSRSwWZLdtw/HwO1QyCZxTi6R4xzKdzdIWhwVqc41FGiFsShTsozLt1aNi+u4IG05F2J3PIaz18TLdWO1q0WToy9VcEhGD3dFh3OXL8DV0CMPlpUK7oV6Z+lhGHwItgM/hvh/Aa8MklPiL0R8xCkiabdp1rtwU9KninHO7TciJtCJbKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vrh5wI1wNw6ugWZ/VwTP/wK4l8RZpuJUAeO3eNGC8M=;
 b=C1SzOQRonr8RnKTehW3B8IYxr7uzAGmWwtijqsQkrOms7ew1i1CTZZzlQMoBw9slIiPxQ90rivkXGmLmL0fof3/CaIic3tjdmRfgH/ojxM6NiU38sANkRkKBqoPa672XsllnVo8u0o0Sqvzq8JFQgKONOnm76eHwjEFvpSwuvUI=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by CH0PR10MB7498.namprd10.prod.outlook.com (2603:10b6:610:18e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 22:18:10 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%3]) with mapi id 15.20.7587.028; Wed, 15 May 2024
 22:18:10 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Masami Hiramatsu <mhiramat@kernel.org>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3] kprobe/ftrace: bail out if ftrace was killed
In-Reply-To: <20240502110348.016f190e0b0565b7e9ecdb48@kernel.org>
References: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
 <CAJF2gTT8a4PBU3ekZFNTi6EuETT9hhKfhXrPgGGpn92rQMNSvg@mail.gmail.com>
 <20240502110348.016f190e0b0565b7e9ecdb48@kernel.org>
Date: Wed, 15 May 2024 15:18:08 -0700
Message-ID: <87r0e2pvmn.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0177.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::32) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|CH0PR10MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f3971a1-2707-4295-a665-08dc752ce75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|7416005|376005;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?eUIyVmNmYWtHWDlKOHg4djRjZWczMGx3TGlHS241OFZRejVSS0s0dUIyZUpG?=
 =?utf-8?B?ZU0zUWxaS1R3YWF4WEhVcHllbzQ1VG9VZkNxTUtVWlJLK3lFUWxoNkE3YkJm?=
 =?utf-8?B?U01FRjA4RnVoQURlZ0x2ZGtnc1NwWnB4RWFFV0IxaE50SG1waXVyTjdMYVll?=
 =?utf-8?B?d3dHd2NFaXJkcm1wcDB0OTRNQUZYRDMxbkNQbzRlRSt3NlpPR3hOWkVMemFR?=
 =?utf-8?B?T2FINE4rcjNlNVRVMnN3V0ZoTnVqWGZFb1VLN0pDSVBNaFBsTU5KNGt0UlFH?=
 =?utf-8?B?VCtDTDlkRnVnZ0R2NDUyVzltRGZGZHVmdWpYRmdWUm1pZFFydFE2QkZqUEs3?=
 =?utf-8?B?UHJKT1FuelFMU1kvNk51OTNuaWZyR05SeE5sd0JEaFJEaC9PNnRMblFKTWVG?=
 =?utf-8?B?azBvM0Zqa3JSanhKM1B2TmZWMFJBblhKWnlMOW5Jb2RoUUVaeWJhNlB5TmFp?=
 =?utf-8?B?VkVLSERkZUNTU3NUcmdVNWhyNXRVV3hBWHovZ05xSjZndXZWamNmZndRWTFQ?=
 =?utf-8?B?ekptdGJTeGF0UXpRMmFsRVNlRVFEek1jRWl6OXJQVXhTczU0RWI5cmVVdzhZ?=
 =?utf-8?B?Mmh3dDFTQzkzVEowU3Q1azBMMmJ6T1N0OUd1L3RXR3lIMTBzc3RJcy90cElU?=
 =?utf-8?B?N3l0RGwyb1JVOEZwTkc4TWpKOW5aVkdyWXA2SmV3WUxUeDVRdzQ3ZDBiMUIv?=
 =?utf-8?B?RUhUTGJwRTBnN3ZiR2dLS3B2dUdBaHNCRGpaUHZnTHhhNGdqRFJQRkoyZjdj?=
 =?utf-8?B?TG9teTFEZllrU0dGMVZlWnJzMXYzSWRjNXNNQ2l6RXFHYTJySHQ4cmNIcUpM?=
 =?utf-8?B?OWs4ZEFqWEl0ZENHRWtkUHdzdGNOdno5V3B1SmhnWXg2NW9NZFJYSVNWWnYv?=
 =?utf-8?B?Q0pLaTBmWnJORU1nWW1QYzVpMWtBVUMyMHpham82VHU0WGd6NjYrbk1jOGln?=
 =?utf-8?B?RGxpdTRuT1lheXNxZnV1Mm1YZVRxWUw0RGFpVzdBVFRSdlAxWSt6SmZ1TlN6?=
 =?utf-8?B?U3BrT1o2b1ZRU2JJcVA4QXlsN3pkZEx3YXQ3MlMxanRBWXdTdkJBMlF1ZjFl?=
 =?utf-8?B?eUtWTjMwWlgvUWpCd0hoY0JRQzUrUFpZL1dTTkVCbGQ4U2o3c1IxaFA5NlNB?=
 =?utf-8?B?dGhFQlJFRytiem5OMFBsdXJrSUNnVzRUY3pkL1dBanhNOEtrV1NJeS81dmZm?=
 =?utf-8?B?d29MK0IwUWZZYkwwN08wSGN2Z1lYV2tNNFJxSTFzbFk0aDgzSGlOQ1pQcmRi?=
 =?utf-8?B?TWc3bndPY3hIL01YL0hPQ2tiNHQwS2NtbXhQclVycC9uNnN0SEVVYnNWV0w4?=
 =?utf-8?B?T3QyTHU4K0lqMHJibFRydHVNdFJ2SThHSVJKWFk1MkJWSm9uWGJJZnBNZ2RQ?=
 =?utf-8?B?SkoyY2ZhOXJIckcxU2lYanpHVDV6UkhkQU0ySExuamVNNEw1Y1lmd1JDaHdN?=
 =?utf-8?B?SFpBSmxYVnU2dS9qVXZKd2RmcjEyanpaSmZLV1ZENm9raDFlUE5tZ0YzYmdO?=
 =?utf-8?B?ZW9NMitaUEkrdzZPSjdXeTYycVRQbnVPZDQxQ2I5ZzZJbjd0c2t1SEVMSVBM?=
 =?utf-8?B?SmI3UEd3M2ZnaWp5MXVSVG9pdVpWcTZNUjlyS0xJMTF6SVBaRm1MVlRDY04w?=
 =?utf-8?Q?yQ/RQT9QxXgG+zDaaIY0DXjqnvd9ClBEg1O0owCWXq8w=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(7416005)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?N3hvclREdVFDWmh2WXVhNXcxOVRRZTBhWkJkL0RNdVFYSWNKT2dMNHlwNlcr?=
 =?utf-8?B?MG9ScEJRWEpUZDdXMmQzUFJXbWxSdDVLaENFYkNJMms1WDUwYVB2Zlp0ei83?=
 =?utf-8?B?QSs1bEppRGowemxRVDl3c1k4cHBia2NHQXNzL2xWckpsY3JhQVN2d295Rkp3?=
 =?utf-8?B?R1hJQ0Y0dVhpZi9UU0J3STJIeGZKUVpQUmVjdTFPVUdsdWdZZXl0dURwMVhY?=
 =?utf-8?B?TGxMQWVCOExaUnFtZTZ2eFdPNzdtMEs2ak5tMXF3SEpNK3R6dHI0RDBUL1px?=
 =?utf-8?B?TkxLS1F5aWVmelZ3VTZrMGVQRGNlTHFxcmxPejRJNythTFM2bjJ1ckpMNk5q?=
 =?utf-8?B?UVVNUTh0SlFRUjVKMGE4aWRnOGpnVUtCTUoyU0xpd3UwbTQ2YUx0QnptTDVz?=
 =?utf-8?B?eWVYWDBXV3BXTllsZnhJTi8veHBDVDI2YnBHaS9sbnQ1czltMDdsdkpWamdu?=
 =?utf-8?B?eUVxU2R5bEJLeGpPYlVGSlRZellEWUpydEZFMUxJWmEwOTRJTUNkUUNJWEQy?=
 =?utf-8?B?WWVmbitrMWxYYldSTkZIeHpqTnN5WHNJcUxOOG5NaHNEaHRwV0I0M0RzdlJs?=
 =?utf-8?B?YW9PQnJsbWJDVHFvQ1FwYW5oQVZKR3hrZ2cxdk9DUm5RVWpiRkt2Mno5YVV6?=
 =?utf-8?B?L3NuMmlpTnlZOGRyb0VhYjhNNG1tdDZyQmhVYUdPdDVabWNhMDZtTFA4eThT?=
 =?utf-8?B?dTlnbmw1TVY1QTN3VnBFNFFROWtDY2FKZzJPRTJoWkhLS2dZTUlSWWZ1b3E4?=
 =?utf-8?B?aFVQbzk3YnpxaldtWDZTcGZZOVlSbDBVeHcwRWRaZnl3T0k1STJuTzNpS3lo?=
 =?utf-8?B?Wm1Xd2J4ZS8zSytvQWNjNDRTNjZFR3Blay9WczNxckt0ZkNKamozTDdLUGhw?=
 =?utf-8?B?dVZzYWtBamxXVHkwdlpacHBMb0hFVlR1N1BJMjJMcmNtQklNMlJrVllRUmpo?=
 =?utf-8?B?YkNRb3dRTnFBeE16cVJmalNnTllvY0FlaXluUnVMU0ZkWkZ6eEw5cTN5SDRh?=
 =?utf-8?B?UnhEeG5Xb0Z0ZldMd3VjejVvVnUxcTMwUmRkc09hUlN0cTlneXE3SU1rVmtp?=
 =?utf-8?B?MFdUd25qbHIwUVAvUHhUaU5wRW9TNmcycUtnWkhQWkprL0VnaXU2Sm95SmFM?=
 =?utf-8?B?NFFZaFA3aGJQMVpjNUl1elVlbklKejdjblRRazg1UzdrWDgrOFQ2NTNuUkZW?=
 =?utf-8?B?VXE5TkxiYUR2R25mWUhLUnEvRU9uVUY4RE1NS2pERmJ5VytTbTA4SmVobmZ1?=
 =?utf-8?B?azRUYm13TFZYVDluMVJtelU2M2IrZFhXb0NFT09wK054b0NtMmJyOEpVR0tX?=
 =?utf-8?B?MDJsN1ZzcGYwL0VDWHhObENsdlhmMThFeEpXN01PTVFnMGI3TWw1QkRmbzNB?=
 =?utf-8?B?cHZhYnkwU0pReGJxOWN5ZzVWbjBDZnVoSkp3V0pTSkpoS1g5NldGUTlBVDRx?=
 =?utf-8?B?S2MyMDlSUXptRmhWZWF5QTIzZ3hCbkZSZTVuNUdtbUxWZ21TTXgxU3VSL0d4?=
 =?utf-8?B?SDFVWmFaL2M5dTg0bk9DZG90ZHdvY25ncm1DNDFGakFWV0RCRURRYnQyU2c2?=
 =?utf-8?B?cGlLYnJhU21FVkZKTnBKeUdlVnlVU2xXQ0xhNUVBY0FGTnhkcFpoRjhwZmQz?=
 =?utf-8?B?Rzk5M3dZYkhmVnJUMDEyNDdtZnFxYXVKa2J5RHd1RlRISkpxK080RnNtd0o2?=
 =?utf-8?B?YmMwL28rakMvOFBNeVpDOW15ME9SRjB5MUVaM1dBZDdCU055NjF5aXVYYnRC?=
 =?utf-8?B?Z04zY2w1T2NlaVNqRnArd1owSzI5Mm9yVWg5ZXpkRDZDVWhJMjZ5OFBLRW5V?=
 =?utf-8?B?Smdwbm9XZE5kMzlRYVZ1WFhSYThwaVhtdmFwd01ycm1vUVlZTmdCVVMwZ1Vk?=
 =?utf-8?B?Y1M0NFRsM0VxYUtHKytiajdMTzhkYkwvb0tWeG40YnJFNjhDUGNNNjk1OHA4?=
 =?utf-8?B?R1ppdCt1Q1ZTOTVxSjRpdlM2ZW1zTE43MW1sY2RzUFFmM2ZkKzZoQlB1K3Rx?=
 =?utf-8?B?Z0FFWUlpTDNtbElPeTZsTkQ3RlpSZTh6SGZBTjBxRmg5T3U4d05mR2lDNXFJ?=
 =?utf-8?B?V3hxOWdBMFJ2Z05EQXN4Uk1JbkVzYkNtMlhWWkYwWHNyTFVMQ1RqbUprVTRR?=
 =?utf-8?B?VHZFTHZweC9ER1dzbjVBVHJydXNaK1FrN3FROWxZREY5RkpLKzlMNjlpLy8z?=
 =?utf-8?B?blhiQmplbkN1V29kVS9IOG1ockk2RkpYekdHODBPTXVCQVppUWVKSmgvNllw?=
 =?utf-8?B?Ri83azNmUFJHNm4yQklGVEhGSXlBPT0=?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	dvbrj2qtt6f5n4HPZChCVSm+u7QScH9CGVQD+SyhGB3FYfI4QmcFnRWnsPm7n6RG7fypEPvCVO3Efv79wxFa3khTE4wAx6ZOUVhvI3Z70nHrCo0iO0bui90xglm/WqpdC45WoWp1mBkueFcKvjCUDJOf3V++RuGg+1AvJ2q43URyniRcK+n3TdPXeZTguaBZuMRkRzsToKN0vBv13dpSTGehS7uQASKhlnQ1Y8lflgnB6m2mgFUESEcJpybHwepRIA/BWVSTVSgnKXuBOuprWw5qoaDM/wQXxv8zErMN6viNpTgJLN/6F2Iu8SITMa7KsYnOjQNmJyCpJD+C2g6TdNcP1zZAVUrgjhgDeSeNl5xUe5hgssDh2ErINjDCqW4u/1bBS6TtFkFE7fzFFhzCi435sdRDTA+swSAp0ghAbJ19TkZ6PoGtRC0MrN2YoJ+3nzUeHLvXWjZMXLwwtJgw73/urDkXrvdm3x4qSy6veB1Mx8KCR3wVHXGW5IMGyFXmCwDs8m0ZXp8e32TaUF1gP/XbU5LKPiKh7vLKbhKcCI1BzwNiZALW0Kc998eeFYTfEaIJuNsjnw5Khs6JdTHAsRSE0r4/EfsBmBpxvO5m5qg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3971a1-2707-4295-a665-08dc752ce75a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 22:18:10.1818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40ZCihD6ecQRTyxoUHJGbUfnu3E6FJ4Qyirca6PPxzkoIkqg5YYdTS+SRaPWblNGNzaeCXSLiVRUc4gZzXUknMZjoc04az/k9/oaFfTy2Zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7498
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_14,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405150160
X-Proofpoint-GUID: 4o82Ffv-manoniq9ypVXdaF6r7cgJ7C9
X-Proofpoint-ORIG-GUID: 4o82Ffv-manoniq9ypVXdaF6r7cgJ7C9
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-tra
 ce-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masami Hiramatsu (Google) <mhiramat@kernel.org> writes:
> On Thu, 2 May 2024 01:35:16 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
>> On Thu, May 2, 2024 at 12:30=E2=80=AFAM Stephen Brennan
>> <stephen.s.brennan@oracle.com> wrote:
>> >
>> > If an error happens in ftrace, ftrace_kill() will prevent disarming
>> > kprobes. Eventually, the ftrace_ops associated with the kprobes will b=
e
>> > freed, yet the kprobes will still be active, and when triggered, they
>> > will use the freed memory, likely resulting in a page fault and panic.
>> >
>> > This behavior can be reproduced quite easily, by creating a kprobe and
>> > then triggering a ftrace_kill(). For simplicity, we can simulate an
>> > ftrace error with a kernel module like [1]:
>> >
>> > [1]: https://github.com/brenns10/kernel_stuff/tree/master/ftrace_kille=
r
>> >
>> >   sudo perf probe --add commit_creds
>> >   sudo perf trace -e probe:commit_creds
>> >   # In another terminal
>> >   make
>> >   sudo insmod ftrace_killer.ko  # calls ftrace_kill(), simulating bug
>> >   # Back to perf terminal
>> >   # ctrl-c
>> >   sudo perf probe --del commit_creds
>> >
>> > After a short period, a page fault and panic would occur as the kprobe
>> > continues to execute and uses the freed ftrace_ops. While ftrace_kill(=
)
>> > is supposed to be used only in extreme circumstances, it is invoked in
>> > FTRACE_WARN_ON() and so there are many places where an unexpected bug
>> > could be triggered, yet the system may continue operating, possibly
>> > without the administrator noticing. If ftrace_kill() does not panic th=
e
>> > system, then we should do everything we can to continue operating,
>> > rather than leave a ticking time bomb.
>> >
>> > Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
>> > ---
>> > Changes in v3:
>> >   Don't expose ftrace_is_dead(). Create a "kprobe_ftrace_disabled"
>> >   variable and check it directly in the kprobe handlers.
>> > Link to v1/v2 discussion:
>> >   https://lore.kernel.org/all/20240426225834.993353-1-stephen.s.brenna=
n@oracle.com/
>> >
>> >  arch/csky/kernel/probes/ftrace.c     | 3 +++
>> >  arch/loongarch/kernel/ftrace_dyn.c   | 3 +++
>> >  arch/parisc/kernel/ftrace.c          | 3 +++
>> >  arch/powerpc/kernel/kprobes-ftrace.c | 3 +++
>> >  arch/riscv/kernel/probes/ftrace.c    | 3 +++
>> >  arch/s390/kernel/ftrace.c            | 3 +++
>> >  arch/x86/kernel/kprobes/ftrace.c     | 3 +++
>> >  include/linux/kprobes.h              | 7 +++++++
>> >  kernel/kprobes.c                     | 6 ++++++
>> >  kernel/trace/ftrace.c                | 1 +
>> >  10 files changed, 35 insertions(+)
>> >
>> > diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probe=
s/ftrace.c
>> > index 834cffcfbce3..7ba4b98076de 100644
>> > --- a/arch/csky/kernel/probes/ftrace.c
>> > +++ b/arch/csky/kernel/probes/ftrace.c
>> > @@ -12,6 +12,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigne=
d long parent_ip,
>> >         struct kprobe_ctlblk *kcb;
>> >         struct pt_regs *regs;
>> >
>> > +       if (unlikely(kprobe_ftrace_disabled))
>> > +               return;
>> > +
>> For csky part.
>> Acked-by: Guo Ren <guoren@kernel.org>
>
> Thanks Stephen, Guo and Steve!
>
> Let me pick this to probes/for-next!

Thank you Masami!

I did want to check, is this the correct git tree to be watching?

https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/log/?=
h=3Dprobes/for-next

( I'm not trying to pressure on timing, as I know the merge window is
  hectic. Just making sure I'm watching the correct place! )

Thanks,
Stephen
