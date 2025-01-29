Return-Path: <linuxppc-dev+bounces-5693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A75DBA2262B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 23:26:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjxbC1BYbz2yjV;
	Thu, 30 Jan 2025 09:26:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738189607;
	cv=pass; b=J95QS1QHfaLciudiK/jDM1FyE3R1AOsvBoczFn3YVKMcCQYnxBRFH3rzzSPtU2QQqY2lWRMGZV930DsyqPzuCippMqXkYKd5T7ERdaDgFR+hLDok5T8mARQkUshiEpQhK1dmGSA358oLVo1cCwiIyLpHPV9AK6hr8+Ui14hzsJ+PxocPhbad7nK9eAcSDUfVpMmxB64noMqStVmJ9OI+KnKwxOnHpUxU049M74ut/vrPjdErfX1zO+omh+0KZ6aVL9iUSDDej/zpGszHtYGB7ZRMrM8/oFWKj1oXCo0jtcaPux0DSB8+OMMitCXZKQjv27i5MhFG/dF8hCIcgn9Utg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738189607; c=relaxed/relaxed;
	bh=zPVrnfkcjEhVV+97otUliwxAalxKMWd+CT8xMI9hkdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mcONB5IsPfimjuXNWEpIM6o2/1LRi+VcPZFhYvC7BNmoru7Mle1M0eJbNAXLzAjEMYqlP29TX/NPCptKmBv43tJWuBOqeWs75rpjmF4RLueJXrZg3Ns7Pn36T2jlWiMM6RaiYZlQIQa4hqhJILaRgFLL8C6mWc2xAFQ55H6fRPOeA+sR8LSxfiuqvlNSTkIcxmMq3V6Wzpswn6tluTOiCk67NT0Vj1U2FZmXAg7VKV/hB3qVqI71CJPVfFlIdnNEDQHzgb1io4szQUVOgj8NU3hi5sEZvKV0h6/30yqmw5a5NqftG7P26L2acPD7zjMCEJe6WhzEc+hOhAsZBU+LhA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=LrZekweR; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=r9yRflGF; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=LrZekweR;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=r9yRflGF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yjxb94Fm1z2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 09:26:44 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TLvJW3001022;
	Wed, 29 Jan 2025 22:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=zPVrnfkcjEhVV+97otUliwxAalxKMWd+CT8xMI9hkdc=; b=
	LrZekweRHovbrf0ISmvPiadQKjuB6+9XuwTVCC7LPoQmU0n3lyifESPA2qce/iFq
	ynaYh81zhcKTJol3EqIfe4nVVAc6f95me7c/Pgq132BSdhsrFWH4g2phgemWaIqE
	CXtb022OT3Ce/9TPno61wqNbT5+lvUik/ajj6ab2ZGY818vpBHYON38njZ6Jx14j
	apYaEy9jHOoBRe0wsj4U96a5wHlg9DNnZaMiYfTDAIDh7c0Bf8fVnkQtLAme6ufo
	j2KBbEhoNtQJZyk2Rvfl3KwMdZH1EUKQnI8SaMcPsInWrVZwIYDJO/C7kaIFeOT7
	mdHSEx/AYHSXDP2SlmZ2Xg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fvpp01dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 22:26:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50TLYHJ3035914;
	Wed, 29 Jan 2025 22:26:13 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdgdc8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 22:26:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCwIYoPJuBFZ/Gr/dG2jSi116QsVsAck5o9lGmPZAjiz9djgnVmapIR2DA9f/LC/Jzs8q9bc65X1+BUn3xgTsYQwVMgt+bwlMSoKhoTgjIpmUA96sUVjzee94h7va8HIAPxnwJCaOdvQo40vXtVy9mTNpLtqCRS1Ftku4wDXlEhvtCGFM4UmLerMDupC7amL1dLRCUDiwTuBKfwsrMZgryCRpNS/zvP3nzn6wnCWBkgFnoy/62flqCl8apsuAkAdN+sKy3H+pnGbw8MOD9cZ9B3+8oGvnTBTX71WEb2LK38sF2B3wGhOR0n5DEjMRrB+9fWH6gmePrURQCIZDiZTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPVrnfkcjEhVV+97otUliwxAalxKMWd+CT8xMI9hkdc=;
 b=VHuGtIzd2FgCFRPn9Mz1YvUESobf5l37durw7NfCtFO9/jcyfurJWzWEue2bJNB57BSPCLrsbfUC1AKl9wleSXdqiW12XT2seboKkmLYvJ/c0vjLdnUj+LdaYHdg4Lvzzo/J4waczgmCCbINMQnUOHzTvOMEA6bJTeV6FKT5j8SUrN7gT6N+FieDHiN7spxD0Rz/Swq2GaU1X/jVH1UUlo2NvavofnMR8B2hwC0JWfbCOUd5p1kG+MPLQkXZfEyph8b+ccYj+Z9r7sQ5LgvddSF4EvzCQpBsordnmRw7WTxR5UjHzbNvchvLRKTvmSyUexWtt6wnk6SdMC9ur09LBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPVrnfkcjEhVV+97otUliwxAalxKMWd+CT8xMI9hkdc=;
 b=r9yRflGFkxL+4Dk68hj57ThdHC+h/7gq0ycv36ECcOeP+D74tVBRrAVR+eq9mJCpmEJf2q7/oyVAMG3ueF//sAP/nc0+Q3yogzjqJ2J36NinfZZqZgh0zuph6e0XUqrCDF4poxUb85/z+OrnEFOmN69h60SacVzQ0GhjiLPojew=
Received: from MW5PR10MB5764.namprd10.prod.outlook.com (2603:10b6:303:190::15)
 by DS7PR10MB7297.namprd10.prod.outlook.com (2603:10b6:8:d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 22:26:10 +0000
Received: from MW5PR10MB5764.namprd10.prod.outlook.com
 ([fe80::8d9b:9200:a7f5:19a9]) by MW5PR10MB5764.namprd10.prod.outlook.com
 ([fe80::8d9b:9200:a7f5:19a9%4]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 22:26:10 +0000
Date: Wed, 29 Jan 2025 17:26:06 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org,
        christophe.leroy@csgroup.eu, geert@linux-m68k.org,
        justinstitt@google.com, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
        llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com,
        mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org,
        ndesaulniers@google.com, npiggin@gmail.com,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-ID: <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Tamir Duberstein <tamird@gmail.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, geert@linux-m68k.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, ndesaulniers@google.com, 
	npiggin@gmail.com, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
 <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1PR01CA0124.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::33) To MW5PR10MB5764.namprd10.prod.outlook.com
 (2603:10b6:303:190::15)
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
X-MS-TrafficTypeDiagnostic: MW5PR10MB5764:EE_|DS7PR10MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: ea730e38-afd7-4d23-c85d-08dd40b3ee70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWVBNjduM1o2L1l1a2tjUFNtSFVQNDJvUEVXSnBpTmZyNjRzWmRER283dVBu?=
 =?utf-8?B?SDY0VHN1YXlEbE1VNXU4eHRzZnRMK29wVCtKendUVi9Tdm9sUG9NQmNYZzVJ?=
 =?utf-8?B?VEhCWHJOTStlMlk1a2h0N2dSNU9lYzdIZmprT05BVlYvZ1JNUWpWelBaTE51?=
 =?utf-8?B?MlBqeGVUOUR4czhwdldRNHQ2Q1ZrVXowR29paTlhSm4vSmtrelp2SURoTTJr?=
 =?utf-8?B?Sm01VVViTEhvc1FtWHpKU2dRTC9YNlVacVIvejk1Q2d2RmZyYVpQNStzQWI5?=
 =?utf-8?B?cCtKV3M5RXFxRDdhUjR2cG5scEZ0ZFhrejNUdVp4Q0hMb1V4eHgweHpNblVG?=
 =?utf-8?B?U0VQb29EQ3V3WGlCd0RpaTNDMzF0cHgrY3B4RDdzM1Z6WTZVWlc1ZEN2VVFM?=
 =?utf-8?B?UGZ5bjhBa2w0Sll5SG9oMWZIck9UWjg2MVVFcDhyNSs0RlU0VmlQZFYwZUJl?=
 =?utf-8?B?MmZQYXFDRHZod2VFUVFNNmpRSXdreEVYWjdxZTFPMVB0WjFPYjR1TFUxcW4z?=
 =?utf-8?B?a0VSQTNtbElXVjVEN0xvN3d6TFZ5NjFtd1JMQTkrTWVUa2RzeHU1bi9XOXVl?=
 =?utf-8?B?K2NNdzZOZy9rWmV0Y2w3V0xwQkVrcDhNQk1uZ1BDaFBqeVBTUGFFdUd4MVhY?=
 =?utf-8?B?VGVsZ3RiQWc4NU5jcTVkcE1wSVhidkt2cHAvSnJzbGJXMlJvSWZ5UmtVNVho?=
 =?utf-8?B?MG82d1dkMHRTejg4a2VjTFFiNXR5dEdzNWRzdHZHZW1sZ1dnVXZZMVJJOXJj?=
 =?utf-8?B?VTVLVXpCWmZldUtQUm5JUmFzOTAxWEhidVlwQ3AxUERrMUpSek5udlBacGsv?=
 =?utf-8?B?a2c5VnF4NWdUOHU0SURBMzh0TGEyK09GMVhSc0hDUVhMZE8rREZ1RnVHZ2FW?=
 =?utf-8?B?NExheXhnUUc1eUljV0hRaUxUS21oaHl4anozUFRSeXIrZHNqa3RqYnVXeFds?=
 =?utf-8?B?cDhnaDlRblgvSnQ1b2Z1MWdESVNkN3N6RlltcDlwb0o5bkt1aHh4TXd4aHps?=
 =?utf-8?B?RVYzelk5M2pHYUdUbXI1OHlmTm0xMDlTRlc5bmd0RUZmV1Bma3UzRXM3UHlN?=
 =?utf-8?B?SldlUHlucXV2Z1M0eFc2dXJQNnBLd2ZJTDJmUWVlRFJFa1V6WE1yNkJFTllE?=
 =?utf-8?B?WTYrMTVXbUxGcXV2aGtHbmxEa3hva1dhQ1gybDFjbjhXUndieDRIeEVOY3BO?=
 =?utf-8?B?N2tvV0lLTUhhSnIzSWwxVjBZcnQ0THNGekpWaktoSzJTWHNoS0VhSHArN2dI?=
 =?utf-8?B?ZVl3ZnVValg4K1cwem1KWEIvSDlYbDRBZE51NFZVSUFCSFF1SFk4RFE0dlBW?=
 =?utf-8?B?T2h6M2ZBVWhpTXNUS2RMYjlhdnJqWFYveFZDcktieTJvc1M3Zm5rQTBBUVI4?=
 =?utf-8?B?R2RMUDhCSGEraEVYb21xTVJmdnhMNTFxYlVacFJNTzlIMUNUWDRmZDhYeEQ2?=
 =?utf-8?B?bi9HbENZb015VHkzQUNyMHdYTmFTbTh1RXArU242cWU3K3RQYXF1TXZNWDVk?=
 =?utf-8?B?Qnp1OWhLLzV4NGlXRHQydWNsZE5tcEgxQmhUQXA2b3dhT2FMSXd6dldNN09E?=
 =?utf-8?B?UGZad2xZQkFuUm5JNkFpY2lnUjNBNERqQ2xkQUgrbnYya3dDR1F5ODhPWHVB?=
 =?utf-8?B?MHFHK0tPc0RxMjhNMTBBdGg0U2V4eXFucnQ2YlZHUnVBazYxVnBnVndhZC9W?=
 =?utf-8?B?c1JPRDlyK0tSTmdIaTM0Tkk5Uko4Ui9MdWRUcVBIcmNEaE9hRURCV3lZV3NE?=
 =?utf-8?B?US9sSTdQOStsQmwxaVpSU0d5S0M4Vjc3N2FIajR1MVo0cmZVNWUzWkZ5RHFJ?=
 =?utf-8?B?YVZoSnZobmU4MHVIZDlpOFcvWkVpdlF1RHlUQ2FpNUxoVDdJbzl3QzBSd2d6?=
 =?utf-8?Q?gxY02j0ej8g9X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR10MB5764.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHh1ZUFmdWJ0TEpBbUVGUE1LZXNDNDh0WmFvNmVOa3ByOUwvS3A1bzloM3RJ?=
 =?utf-8?B?Wno4ZlNCbU4zRzZ6a04rM0lIYVBPb1JrTjkvTXJUMnNEMFh5eUlsRHNvUjE5?=
 =?utf-8?B?dVNDMCtKUFY4WmlFSDg4K1c2WHlmVXlUWVArM3NpK0FhQXF4Nlh4Zy9oNGZ2?=
 =?utf-8?B?SFFXVklxd2VuVmpvemVmUUZoRWIwZDhYdDM4S0hvYTJINHVMZHRuYTFFazlO?=
 =?utf-8?B?cTlHL1E0dngyQXA1UWhyNTNMQUhhYlRiR0MrWjk3UTUyY1N0M2ppSjFTcFJu?=
 =?utf-8?B?Nkl2TnJuZ1o4WkwvVFcvMWxvaWo4eUNUT1hTbHIxaW0xZUFQdkFsVy9xd3Qw?=
 =?utf-8?B?NjZmNi9hL3RCbVArbFhLUjJTT21odnRiVjFFNjF5TGY4QmVaSnZWODdXNzFM?=
 =?utf-8?B?TE1ZSUtLb2N0ckozdlR2M3IyNDZMcGlaMjAwMTg4cmhSU0ZaeHVGdU53bWZU?=
 =?utf-8?B?aytKeW8razhOZWZwZHBZN2p1QzYzbzJWbWhzTHJTckcrSmRTaXRrUEZ4SGdp?=
 =?utf-8?B?cGN3UEhrUUxsM1FEaEhLR1d5enk1VWExanlUOG9xTzlJSFFyL2VxMTE5NEE4?=
 =?utf-8?B?UmRoaFlCWndOYXZnQ3gySk9zeG92a3diMFQ2REtjNEthc2lTTlZIWi90bGNB?=
 =?utf-8?B?VVNSajJicEhwZVpsMXBaYkMrSEtYbE12amc2SjZKSWFIYjlJdjhjakNwVDR3?=
 =?utf-8?B?NkVrdHp3N3ZQODZjY3A3bHNMQkhrUUQwQUZTaWFEa2QzL01yWGFzUWp3ekVq?=
 =?utf-8?B?cTErR3BHcG9yUkRjQVpyQithTTlodkNIQkhVdFJGVk5KQjVFbXNNWHF4OWFr?=
 =?utf-8?B?VWpXdGNuTTM4ZGVWUlczNFpLOE12QnIralY1eUIzK3JLY2RBMDlhdjRsdUk2?=
 =?utf-8?B?NlduUUVVUnhHMHg4WkRUdGo3NFhpakFYanprY245Qm1rdDkwa0Q1SHdrN3NT?=
 =?utf-8?B?VFpqOEtDbFMrZzM0Z002UGpnZFFJWnRsZHZjZS93dExkRjUvVnFoWU16TTVl?=
 =?utf-8?B?SzhCRnFINitUVzJPSkQ5MnpzUzZxS3BGUjQ1TWpFTjlLeHZ2MGNYbGs2elg2?=
 =?utf-8?B?czVYMkdlTzlDK1M2SzVXRjlBOU54UkpmQktYRlo3L2VsVGg0WXFoTWlqYm42?=
 =?utf-8?B?b2pCY1hXNU5UMytVcWdpR3lJQTUySnZwQXJlUXRuUVhFRy9YUVZmcDJQb01q?=
 =?utf-8?B?bVJidzVTaGU5VDlQcFFvRmVhbjJmaTg0VE0xaUUvbHRmdTd6bmJDcWROUUtp?=
 =?utf-8?B?R3JqR1lrNE9kWVQzU0pveGtCR1lsRjhvTXRpQ1oyc0lmbU5UbGNpZEl6U0hB?=
 =?utf-8?B?NnowcGtRSDIrUGhhRUR3alYvam5SUVozdDQyV2FqdzFwM2d1TjlwaVAyMGI4?=
 =?utf-8?B?dWVCOGg5ZXR5M3BoSUFYNWozZXR3ZFBJMndSY09lZEdOK0plSUtqeUh6dnpw?=
 =?utf-8?B?ZHd2bVhkSTdjU1B5SWptclprS054aWZsZnhXMC9KcU80Tjl2SjRDRHgya0wz?=
 =?utf-8?B?aWJBOXVTUDdZRHlTZTg3dHFmU0dWMmVOZE84Q0NDc0d5U2txYndqdmpuVjFP?=
 =?utf-8?B?aTk1NkFnZWJuSlAzRDdCOTZQQ0hPSEZxK2gya3NnRHBqbW9Ccjl1bVhHTEVN?=
 =?utf-8?B?eUJhRUNmTWtpbCtTeDNDRU45WndPaGczZTNnaWo2ZzlCbmlqM3JiZzRnN1B1?=
 =?utf-8?B?ZS9NMmYyRFZQZlF3dlovNlc1TVNIOTJHK3RlRnBSaWJ1dkQrTEVqcjluVlB3?=
 =?utf-8?B?NC9CbytWR0JnSm03VjBuV2JjaGY0VFhXSXdwOXYzemR6dzVKczRoa2RGM1Y0?=
 =?utf-8?B?NzRpQXpCWDdSampVQ2pTQTVWU1MxVE1GbnhGSjdyMVp5aWg4MXZ3MXV4emw4?=
 =?utf-8?B?MnNGY2FvUUZsMC9QeXRiTGhSZE56QUVOUDJSZFA5YVQ4ZWZERGNqcEtva3lh?=
 =?utf-8?B?c0FoTWtWZ1I4aWtHd0tHQnhUb0g2Tnpibm9LWFRmUHVGVEpROU1Wek40S1pT?=
 =?utf-8?B?blVMYkY2RHl5TGNEMElJSVB0eXFyaDRhMEkybFArNEVQK2xqdmRNQTNGWk50?=
 =?utf-8?B?Nk1Gb3JjQ0JGNUxMMlBac0RNNE50ZnlpVktRWGJRWEtHYlBPeXgwZDg2MTFz?=
 =?utf-8?Q?aUn4jGg5nfx+Z/SQTzo7F9RQq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6ZoZlhioAn21Z551CYT/Ch/DH+CfEYeiMOHFrSdPTglPyJSYdNyFlMGKDxkJIuArStVHCyWJZvsVTJgH34q18LnKrNOSYfu/dQJZ1j2EpMpm05VocXdGwZvou7WKaIv2Uha3nzzplMLuJo2wSKC++6sVYHpX5NR1hzaLF9+x6bNi6ClkKh2TG74zqMnyyL3d1mS4uQnV29pWw0mo5aVd8Fhl2dlTcNpFaKzDxUgAEGqOCNyWuoPvoHJO4tDdOEaWOAg8FhKQnq2oBKMYkI/6EdVVN+NJCcXvCPZ8bKyEk0oDebyJE1NOUJnDVl9EDgAR4ra6rKbPwieq/iDseZfq2sDwyyC0rRPdF5pJTuJzJlhSWXoS0WCJHNMpG9KINEttxKxilcptqA5IB8V8GAZBnIXbaKvBOQGjaKdUBBmcRD763JotQFL91MzxX4xErYzlVm42GQ6IFGZo8ivVIBDfvmuA9R836ctxK8P9e7AiTT929bx2I1rUsPm0BS/V3Gbvp+XkB0V+tLCidRgRyBTCMBQEWhsuis/kbZwRjFRhRrJ4aXoMKmTukX3ykzUUs36oquq0nK/tm/zs9IdmKT73EaSULYGiRs+Ks/n0Lub3kyM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea730e38-afd7-4d23-c85d-08dd40b3ee70
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5764.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 22:26:10.5140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvLtqJguK02xe0r2LOoMDk5+8U0yxJC5sx6hoklaUHf6WO+NT8sIxU2ivtAfwwjGCI14kLbxhuWZtcidayZzrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7297
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_04,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290170
X-Proofpoint-ORIG-GUID: UK7uvJ0XAfWJb6kT6BgjbZi1XUZ9cX1R
X-Proofpoint-GUID: UK7uvJ0XAfWJb6kT6BgjbZi1XUZ9cX1R
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

* Tamir Duberstein <tamird@gmail.com> [250129 16:29]:
> On Wed, Jan 29, 2025 at 4:26=E2=80=AFPM Liam R. Howlett <Liam.Howlett@ora=
cle.com> wrote:
> >
> > * Sidhartha Kumar <sidhartha.kumar@oracle.com> [250129 16:02]:
> > > + Liam, Matthew
> >
> > + linux-mm
> >
> > Thank you Sid.
> >
> > >
> > > Hello,
> > >
> > > I believe this patch needs to be reverted for now as it breaks the
> > > user-space build of /tools/testing/radix-tree with:
> > >
> > > In file included from xarray.c:11:
> > > ../../../lib/test_xarray.c:9:10: fatal error: kunit/test.h: No such f=
ile
> > > or directory
> > >      9 | #include <kunit/test.h>
> > >        |          ^~~~~~~~~~~~~~
> > > compilation terminated.
> > > make: *** [<builtin>: xarray.o] Error 1
> > > make: *** Waiting for unfinished jobs....
> > >
> > > this then prevents the maple tree test suite from building.
> >
> > How are grammar corrections going to the right person (but not the
> > mailing list) while an entire conversion to kunit is not [1]?
>=20
> Very simple: the tests are not properly included in MAINTAINERS. I
> sent https://lore.kernel.org/all/20250129-xarray-test-maintainer-v1-1-482=
e31f30f47@gmail.com/
> a few minutes ago for this reason.

Fair enough, but from the patch:

@@ -6,11 +6,10 @@
  * Author: Matthew Wilcox <willy@infradead.org>
  */
=20
-#include <linux/xarray.h>
-#include <linux/module.h>
+#include <kunit/test.h>

...


-module_init(xarray_checks);
-module_exit(xarray_exit);
 MODULE_AUTHOR("Matthew Wilcox <willy@infradead.org>");
 MODULE_DESCRIPTION("XArray API test module");
 MODULE_LICENSE("GPL");

I don't get why the huge list of Cc's didn't include the author who is
in the git commit signers:
 $ ./scripts/get_maintainer.pl --git lib/xarray.c
Matthew Wilcox <willy@infradead.org> (supporter:XARRAY,commit_signer:1/3=3D=
33%,authored:1/3=3D33%,added_lines:19/52=3D37%,removed_lines:4/23=3D17%)
Andrew Morton <akpm@linux-foundation.org> (supporter:LIBRARY CODE,commit_si=
gner:3/3=3D100%)
...

>=20
> > Does the patch really need to drop the module testing too?
> >
> > What exactly is the point of converting one testing system to another
> > besides disruption of actual work?  Who asked for this?  What is the
> > point?
>=20
> All this is described in the commit message.

The commit message says you like the output more and implies you like
the command better.

I've never used the kunit testing of xarray and have used the userspace
testing instead, so I can't speak to the obscure invocation as both
commands seem insanely long and obscure to me.

>=20
> > Is anyone doing work on the xarray running the kunit tests?
>=20
> I was doing work on xarray and I was running the kunit tests.

...

You should look at the userspace testing (that this broke) as it has
been really useful in certain scenarios.

Thanks,
Liam


