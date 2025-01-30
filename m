Return-Path: <linuxppc-dev+bounces-5718-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5B4A230E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 16:17:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkN182Wy3z2xy0;
	Fri, 31 Jan 2025 02:17:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738250236;
	cv=pass; b=QT6lZhmSW6JG0WgCUr0S3FBb4WVCJOGrdsDWXYrdwbRmMOht3KBrJurc4Q/wB9TFnOA0GyPjgN2UL6HScCvqT43Irr3PJ0JuwZChPlXgozQo6UdgntClXX1Nh+K5feJyXxoE3ZArcFswh+Vi7dKfcWPz4QnDO7a1GHIC2zQ98GV0L3AxqbMQ3+uAR5qaUyLIvf4w1m8tSnT85PMp4nLj8lpLo8LdA0qhmJBOEBBf1344TEjRJxlDyJBoMPFEpkTuPALz54EeeNb5SiFNxqJ7dDHz+WJihl5SwX2EVvW92W6UloA9CI92c7kxpUOLcZmhFEj9frmPgNXKCzsIzAqjsA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738250236; c=relaxed/relaxed;
	bh=eeE6RRX/yh3JBAduczfxh3a+VqxNbKPb14L+p6Q9zTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DyGQMY2XrYyNv/BXohkivbiD7FWB1OTdE3Pq2085Mn5Map2nzzIJlMCSrkSa8K93DGO1gWx731I245IqcJ1A0LvHyTHdKzI1wehJhWFeZEYda4pDciwgHMlHzJzxNmo62h87l4lbDT+CoHvhj3foHbrrytNgnSygEv1v406FdzmWA9eHSfahg4QklMzoYtDObkKLfY5qWKYQqaastYtYA/aNxgvQhjA4gosMTf2QGZ3CVz2UxOUebzPVkko2nut59U0vhDzYrMzh1BWXAwuP3wGQClc0JhH3aPHBlAGwnMZOmKxw3pNk6RJ061vzAyCmnR7dc5J/HQ1DyO2CaLeTKg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=UrooE4tY; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Xn5iGn2O; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=UrooE4tY;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Xn5iGn2O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkN1704Pyz2xxx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 02:17:14 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UEj0b7011792;
	Thu, 30 Jan 2025 15:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=eeE6RRX/yh3JBAduczfxh3a+VqxNbKPb14L+p6Q9zTw=; b=
	UrooE4tYL7CF4ix5xL6/UnOb9TU0HqAwJSxlDnSOLR0ny8w9k4a/ffFx0toY7iMS
	O8UFRdoLefGlUxyd+MIAHY5jbnPPqcAtD2XzeOXnttpWXr2wdzPCMrvanHzObLhM
	9G69sUldErMXTE5/0ikDYDDUCeXiPm9TlesZkJFksXL6qPnquyOBvf2i/jNWNMqW
	QjwzgXehQzO4WY+NYiSLoF2YuldBzbjCGqv5sTpm//B0vcM2nHwO7Ee+rZiQdO4m
	E5lR3p8OjTXxLfAn4YZySgqTi7WhU1xEqky1n3qYTs64luEiC9b+f/piP/oJsJw7
	AmFowcGCtfgQbiHClRateg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gbf6r2t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 15:16:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UEqQ6c036447;
	Thu, 30 Jan 2025 15:16:40 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdb6e73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 15:16:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqdVUvUFjS73eKXeOCjb515yhjI1O4oVWCiz9TYQ8OK1BWIj5itJnEN9o7g7hWGM3dFeSw5ydUxBl8TLUEa+xEro4IlCjcndPYTnSZT0uE3+C1vpYGR2SYujuBwVdhRvh/5OPdpVWvvhGZHsrEb7aGccUpASP4Hmc1UxL9hU1haYN/hUeiZZQHtelZmEPtlKwkM1H9RQbUSoxoIiT/gV/Ntip6NQtUtccS1sW98oGpyvsrJSlf5hh1w2P8I0wENHBKlbgMIhagGH/sIEP90eOE+yDDJzUHpRn1JKIlCoqjDV+xzAFbvQhO1ysVmsuMF8yH+TWm2w+SWcZaxp+7O2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeE6RRX/yh3JBAduczfxh3a+VqxNbKPb14L+p6Q9zTw=;
 b=mwCX6lNLzTs6DzgPYYyOFsjFp/Bw/VYM+rsDG1RSGUk/q533/u9ECYlQXS/nK8iN0kkCT8Hx6SIwBejwl0f8U1xnGlD1gH/PhaBD1+LZITPPGZCv3ErB8iL83yUuycKzkyM8W+QDrCXbYJXwbdwQOtWsd8LnUXCZaQzCJLF3jg+Lss79Com7vJZgFiU+Wtiwu9sD8pPZW7IH4705sOKb9G1CBUIh6Hrs6Jt8hLFJ0o7JO/HJ7i5M7MvfWH9WdLSTjsuo9+8nCAgNHC8Xv+f/k42vOGSiUPkzkhSok5xnvx21v9pxQqC21FjPW2EaPjb01h4SobK58xuLcb+2f2WJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeE6RRX/yh3JBAduczfxh3a+VqxNbKPb14L+p6Q9zTw=;
 b=Xn5iGn2OiHObDB20PH2QlMrbSzAdMUrRIPAHMj7HZnjQpPi19EVuUJWFZxg0LZJzQkMMHYwFJFBEYWc5R0DNsXHSxV2jlDcK4PEMSE93SKr/BFV1aEaYyam5zxUPhY/qTdfxHGS2Z5pbNr8THhmwQnUc8f95+JbZ2sR3wbyHWs0=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SJ2PR10MB7057.namprd10.prod.outlook.com (2603:10b6:a03:4c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Thu, 30 Jan
 2025 15:16:37 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 15:16:37 +0000
Date: Thu, 30 Jan 2025 10:16:18 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org,
        christophe.leroy@csgroup.eu, justinstitt@google.com,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
        maddy@linux.ibm.com, morbo@google.com, mpe@ellerman.id.au,
        nathan@kernel.org, naveen@kernel.org, ndesaulniers@google.com,
        npiggin@gmail.com, Matthew Wilcox <willy@infradead.org>,
        linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-ID: <ihl4bxs65uphmepoyw4xoa26mr4f3gci2mgtoq4osrzeyh3mup@hww2utbkxkfn>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, mpe@ellerman.id.au, 
	nathan@kernel.org, naveen@kernel.org, ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
 <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
 <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
 <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
 <zlcagbwyskb4nkl4usbq4foc4vjcau3exp42zpfsl5b4tabr7u@o42mpfcsfygr>
 <CAMuHMdVUZQTgLpa9L9R117s39nEqxdGy=CJLyLQaTv_16EDhZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdVUZQTgLpa9L9R117s39nEqxdGy=CJLyLQaTv_16EDhZg@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::26) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SJ2PR10MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce557e2-e7a3-4ded-cf63-08dd4141171d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TG1ZbVpsc3M1RkkxOTUzOGNybjJ1emNZR1J1WUlEaWpDbTU1SFRKRUFxUS9S?=
 =?utf-8?B?YnJRclBOdDFDS29ZM1ljTm50TFQvVWVibWFUd0JpL3N4MmhFSVU0K1R5T3hn?=
 =?utf-8?B?dEVtT2V5RGNUSFErdTczRTZiTFVIcjNpNnI5SWE3S3lwdFd3NnowQ2ZZSG1t?=
 =?utf-8?B?Y0h3RHFvOVh1Q1gxd3luQUNKcERiZDQ3Szd4OHJQRVlQUUlVWTlseFEvWWRt?=
 =?utf-8?B?WFBxbHl0ZmNyU3JTMWZXOFVBRWE1RGQrK1JLWkczWVg0clM4emdOcUZOT2xH?=
 =?utf-8?B?SGh6Rlc5dGhLSTN0VWsvY2VrRWV2YU5rNmdVSHN0SmtLNGRqdGRyKzJIUDNi?=
 =?utf-8?B?Q0UvVmc0V2lYNGUrTEFlN2tLZ0JzUFE1WVMvaVFVbldZa3B3MFcwbXpKYXcz?=
 =?utf-8?B?dStid0YzcngxS202THdkTU9HdjFoRytybHFFZXVtbFNiMUFQSTF1VDU3bzVr?=
 =?utf-8?B?b2RiSHJGTzhhNmJxa1JZcWNuT2FSWnlDYnJDRHltWC80LzAzdERwNFB1Umds?=
 =?utf-8?B?bHN2Yzg3bFBWcnkwZzhzMTM2UVNYV2VQVGM5UXZOZzNvS0R5TTZWazNVNWth?=
 =?utf-8?B?RjROaFFaZytwb09QRnpVZEdoL3pFYzdFTjRVcmpKSTdFTXVZZXg0RjEwVHN3?=
 =?utf-8?B?SE0vVHFBNUwyVnJvckZJdnRhWkFSM29XNko0anR1RVBZYU92TWlRQ1k0Z0hX?=
 =?utf-8?B?N3hndU5pL3Y1MFhxT1NYdGVZeDZKZ1VSVGdhdDdtaHM1ZFZoRWxnVFUxZlBN?=
 =?utf-8?B?Y0dqMU8zL2NuNFBqeFBTdlVUVVlqSjNWbnRpYXdMREEyRi9IL3FMbjN4dCs5?=
 =?utf-8?B?MTQzMnByQU9oRjl2cEc1Z09VYlFYVGNPMk1CU3V4RklaNFgwbHIxcmZaM3pF?=
 =?utf-8?B?THZ2a0dBU1lnc254QU5FZWJsdXo3OGpYeVZFSllZZEIyMUFIYy9NRkhpTnVM?=
 =?utf-8?B?RlByREhDeWkrNVU4WEw0VlphOVNsc3pPUFkzY3JpV1dhTStnblVHczBvblBR?=
 =?utf-8?B?VC9KUndBZ01wMnM5QmF4ZG0rMUU2dDhTNWl6TWhNdFRsV0dQMVkyUmxGeEhu?=
 =?utf-8?B?UFhUT2cvMGZFNG8zeWtzSXNtbGozWGJ2ZEJwMzhiNjhhRGd5bWExelEwUUUz?=
 =?utf-8?B?NGNOcVRwK2N6Q0toRTJBZkZmeXdGWjJrMFJuNzNRQmhwdzVlU3VVVTFBYmZU?=
 =?utf-8?B?MERESWMrS2srcEd0RW1WbDZjVlUxNk0xRi9aYVVZcFFSc3VMNXovUU1TTVp4?=
 =?utf-8?B?dHlPUDBQWXc5RFhuUGVyUVV0dDRqZjRhMzlHMWt1a1YxaFlxMklhL2dKVmUx?=
 =?utf-8?B?VFMweU1zSktoUVJJbjJ5aEh2aUxwSDRFNS93U3FXMko1Q0FnV29MSWdQR3kx?=
 =?utf-8?B?Ulhvd01BMXI5Z29tbmFpWUxkYkI0ZTFhUlNFa1FLUmxkMFlEWGM2cCszbTdk?=
 =?utf-8?B?SkhodlROTFE1NDJkK0lvN0N6djZBVXM0Q0d1MEJ6ZWVDNjhYYitLYjl3QUcy?=
 =?utf-8?B?QkNJb0xnTGdYWmVleEViNlpGOFNQS3BFMFUreVNtRjU4SElwb1lweEJ4VFdk?=
 =?utf-8?B?M0ExRmJ5SXRRWnhiTlBEV3NKNGc1dXdidFRvd3Z3SU9ZTTJ1ZEdvb0ZhbmQv?=
 =?utf-8?B?ZFdzbUFubldkaVhMQlBTZ01QcjVtWEZjOTE0Q0FhcmpjTFVxVnZQOGtlR2xC?=
 =?utf-8?B?M3JFcE9kOVRvQjNrV1I0VnhRZWt0YVpjWG9VR3VWV1ovSlk2c2pqa1JVTGow?=
 =?utf-8?B?bm9OU0dSeGZtOTBCelFKWVY5encrK2tldUtFdU82MktSLzVIWjM0NHcwYWtQ?=
 =?utf-8?B?eHNvZnhoQ1hrS3JDWEsxUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE1MQWhydGFkSWFnOFVMMmQ5SHppZ3Y2dnhVS1RFcUpVU2xwNWo4KzZxdjhJ?=
 =?utf-8?B?UC9EV2lnRGx1M3JVandXNFBqMDhkak56MnBNZ3c2NWVXM1VUcFBBR3pNajBa?=
 =?utf-8?B?Qk94RFhSaFFwL1B3cXF2d1h6VUEwNjd6TDRyKzVmeUdPTXpDZnFDNHQvTlJD?=
 =?utf-8?B?aG1HcVRmVmgzWDZUNjcrem4yRmVjKytIOC95NlE5MXY4OElvbmJMcE1GOExh?=
 =?utf-8?B?TmorVndKVkY3UDVGY2phWEdOcGRtTnNHVG9ibEpubkN0OUl0Ynp2VDZzU3hE?=
 =?utf-8?B?QmphSVFxNENsNTJ0MCtwT3VDNUo1Rk5EQnAwNjlid1VKQzBzYk5YOXVQRDRr?=
 =?utf-8?B?N2RnMjV6b2haeWE3NHlxQkhiWjlTOGpRSmRiZG43QTRraDdVNGVQQ0dTajRn?=
 =?utf-8?B?NHdlZWo3QWNDQ1V0SXk4MGRoODU1YTFyVy9tdzNvN2VxNFIvVS9pV3ZLNytJ?=
 =?utf-8?B?N2V6L0hFa3c5ZWFPYnRDcGVZM3NrdFBDMStZR3pId21tRVZ6cjNnRlZtQWg4?=
 =?utf-8?B?eFdhRnE3QUdiSVVzS29MVjFtTkw3R1NaQ0EydFVnb1dsVHg3TXZrcDNqRmRT?=
 =?utf-8?B?WnhhdWg0a3FYMVJTK1l1eUEzeXp1bk1QUGk0Zmh0dGVQeTZLQnd0OWdtZkxF?=
 =?utf-8?B?QmwrWkJKLzdCMXl6K2NSS2ZwdEIrejlnMkJOV0EzOXdFVGFKcWpDL2E5bmZh?=
 =?utf-8?B?cW5UdTZ1UFgzaGs2TzdVcnlzSE1YaFIzMDd0Z1RLS05RUGpJYjVoOVJDQlFs?=
 =?utf-8?B?MlZWTnpLVlZyQUFtT1RvZnpQRnRReFIyc3VLSlRTYlJNY1Z2OG90VUx2L0JL?=
 =?utf-8?B?SDV5RVUvaWtiZEZvVjlDbUxjRVd6bWEwbkYybXY3Ny9yZnZnTUlsTUM0SVlU?=
 =?utf-8?B?a0F3OFJkTDZLSDV2LzM1clltMytXckhCcUhJeXlhbU1tZVVLYXRXOW1WODY1?=
 =?utf-8?B?ejhuYThEa2phOTBQd0pqb3dpZFZCQjRLaHJtcEorcDhsZ0lBbVZabmt5TzhD?=
 =?utf-8?B?YUllK1NtVlNMRExucG93UzdPcEdxUlpyL3lUSmhjMmJQU2Iyc0NRYmVxQWF3?=
 =?utf-8?B?ckdpY051cXN2aGVuVWN6SWFxOGRhalFyZjhXRk1Ib2ZDN3JDM2hvbGxaMjhB?=
 =?utf-8?B?bmRybHBleXlZTFFOSzllbHMraDcrVUQxdEpBUFlZWUxFMUg4YlVxQlpFNkhO?=
 =?utf-8?B?d0Y1VHJINURPcVNESTVGQzYyeXBLZEhlU0VLN3VGSnEzakR6NExXZDhGcUhl?=
 =?utf-8?B?L3lwRi96SmR1ZkszcGtuVHdJVExRWXJjbTV6MU9rVk8yRGUwS0VnUTBjb3hh?=
 =?utf-8?B?QVV1RllBVkZ2Y3JFakZNNGY5clU1alh0WldBRTFmeDFDV0JUWlBHWDBmS1hj?=
 =?utf-8?B?djhmZ3ArSjk1WHRCYjNsMkVGU2g5UVRkMjU4anQrZG8vLzIyL01FSzg4U3RF?=
 =?utf-8?B?SnNsMzc1VzJwQkpvM1Q1RS9NN1M2N0ZiVW42cTNGaWczYVMzdVhlMXQvN0FI?=
 =?utf-8?B?eUlkOXp1VHYvWWNVdW9ROTFhT2piS1dPU2xlUTZiSHR5REZ2L3ozejJVeGpQ?=
 =?utf-8?B?eVlkSURLVmNiNjlGTGlPVmt6NW0rUnNaYTJWSzdXNjBFM2FaSlRjNjVYa1VP?=
 =?utf-8?B?NkhkZmJlenFYQ2hPWUhJd2ZuaHdGczUyUjFwM0VFbngzSGNpVmpWWFVNWTlw?=
 =?utf-8?B?NmVJU3lWZ0xNbnBqRFRZRjY3UHkxS3dNekhoTk1jR2FZMDlZTmtuS09nMlQx?=
 =?utf-8?B?UjJVdEMrczdFd2pFVXdia3lQeFlmbWxzMlpGVTAxYmpRUE5nZDhteGF4aXV3?=
 =?utf-8?B?dXY0eGgraWZ1MDhBUEN5R0pKSVkrUHptdGk3dlBqMnJvenVEVkRsZDJTdU1V?=
 =?utf-8?B?RGFYVXdrbDREYUxiSVJPYmVXNG90R3h2M3ZDNVNhenZTWTVtZ1c3SElZdk9i?=
 =?utf-8?B?eXdPSC8yMEZrOWxOaVBHYi9oSWk3OXRIa3dvak9RUEtEK2ZYRTgyc0xKclk3?=
 =?utf-8?B?bzF3SmVIWmIrTVBidHdHc1IxZS9lMENDT1hLMU9vb0laZXhodTBqQU1wQUNN?=
 =?utf-8?B?VkFlOTJlZ0gvNXlad3RDelZUUVpnQkhudHorT1NuQlpsWE9IYU82elhHVkd0?=
 =?utf-8?Q?H10YuxsEokss1MtSKTSSBeKdb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d0wf99TdyoPd99ltSbowltGXnjlCCFOD4yRjgdA/pCYpLCu9OBcXj8KPdOBkBRv3yK0sF2ArG+gPs0fSpNEN72F83h9h1tqH3gwb345OlJrC6FFYf4sLJkHCkgjcFyvveZkcu3W1aysplJl7XB7u9zDFF4p/tNY6eox8CAb13Q2/U0Y8JGH5h0VvlXTPMtNGRUfTZR1sZiX+Y+s6U+Wbwt59PHeInVNEURMb96osRgUXw22y1LwWtV8MeEIej1nB1/orRRk7YpCFNhLDozHNjD+nJVai9Je6pAlKD8iFOwLjMRvaVkapGrsRlP1JEAO1hYK/rxtGqHvQzrar+9x8lmgEkiE1DzlPeZguXaLWzmhjPjThlRKR9PH6rjvxIY+VMcmju5qZ+IXiCjx9M3HA4WzWRTXLDowc3h4yhRzXmloAQYedjm1eC3iFnS/uzKvZKjs1hfm4FTX58mi0/nlqHe/B8j8PaYfx0OjxFiTLHVZWFRmrqMeOzTlplhqccjJq7tQ9pO02PZixpy01Fg7G8JJbApzkFwSvwhv9AXi919sCibKvOqw82D2ac3eS8/TNqpNy+9+E1r++CbP4GaW6qKQ2JArAQOaX6DYljDGFhis=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce557e2-e7a3-4ded-cf63-08dd4141171d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 15:16:37.4955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwnYZloBuKs0jAMFzRxqCxfy5zLvpqhEt4Bgdd1hGeeSMSmfcHhrHws3dnTrAei5+6c2nMOqzhkZ1+yowvxh/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7057
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300115
X-Proofpoint-GUID: l6ftgpnz9PumzRzqUoa5dadiST4EcI2R
X-Proofpoint-ORIG-GUID: l6ftgpnz9PumzRzqUoa5dadiST4EcI2R
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

* Geert Uytterhoeven <geert@linux-m68k.org> [250130 09:25]:
> Hi Liam,

Hi Geert,

I'd like to say sorry for getting upset about this.

>=20
> On Thu, 30 Jan 2025 at 15:06, Liam R. Howlett <Liam.Howlett@oracle.com> w=
rote:
> >
> > I'll await your patch to link all this together.  Please Cc the authors=
.
>=20
> I gave it a try for kselftests a few years ago.
> https://lore.kernel.org/all/20190114135144.26096-1-geert+renesas@glider.b=
e
> Unfortunately only one patch was applied...

It is difficult to integrate the test framework due to the nature of it
stubbing out a lot of the kernel code it uses.

This is also a strength as it can be used to test unlikely failure
scenarios that are difficult or impossible to recreate in kunit or a
running kernel - even with injections of failures.

It can also be used to isolate issues for recreating, which is very
valuable in larger, longer running issues.

I also use the userspace testing to test rcu using threads and I think
that would be even more challenging on a booted system.

>=20
> > > > it is to get m68k to build, you should probably know how to read a
> > > > makefile.
> > >
> > > Like all other kernel cross-compilation? Usually you don't even have
> > > to know where your cross-compiler is living:
> > >
> > >     make ARCH=3Dm68k
> >
> > Ignoring that I had to make a config - which asked challenging
> > questions...
>=20
> make ARCH=3Dm68k defconfig

That also prompts, defoldconfig did not.

>=20
> > And ignoring the steps to get m68k compiler...
>=20
> apt install gcc-m68k-linux-gnu?

There are a few compilers, multilib or such?  I've had issues with
getting all the archs working for cross compile on the same machine
(arm, arm64, riscv, m68k, ppc, ppc64, parisc).

>=20
> > > > > When trying the above, and ignoring failures due to missing packa=
ges
> > > > > on my host:
> > > > >   - there are several weird build errors,
> > > > >   - this doesn't play well with O=3D,
> > > > >   - lots of scary warnings when building for 32-bit,
> > > > >   - ...
> > > > >
> >
> > In file included from ./include/linux/sched.h:12,
> >                  from arch/m68k/kernel/asm-offsets.c:15:
> > ./arch/m68k/include/asm/current.h:7:30: error: invalid register name fo=
r =E2=80=98current=E2=80=99
> >     7 | register struct task_struct *current __asm__("%a2");
>=20
> Which compiler are you using?

I've had a hard time getting m68k to boot in qemu because of the lack of
userspace.  I use m68k for nommu testing, but have a hard time getting
the buildroot to work correctly to build what I need.

This was a grumpy, pre-coffee way of saying that some tasks are not
straight forward and are extremely difficult to make straight forward.

Sorry, I should not have made such rash comments.  I respect you and
your work and appreciate the help you have given me in the past.

I would also like to thank you for your earlier statements.  After
rereading them, I believe I misunderstood what you were saying.  I've
been trying to make these tests a part of automatic testing somehow,
even getting them to run in userspace.

>=20
> > > > > At least the kunit tests build (and run[1] ;-) most of the time..=
.
> > > >
> > > > Do they?  How about you break something in xarray and then try to b=
oot
> > > > the kunit, or try to boot to load that module.
> > >
> > > If you break the kernel beyond the point of booting, you can indeed
> > > not run any test modules...
> >
> > Which is extremely easy when you are changing code that runs so early i=
n
> > the boot.
> >
> > My code found a compiler issue because it's the first function that
> > returns a boolean.  This is stupid.
>=20
> Sorry. I don't understand this comment.

I had a bug a few years ago that turned out to be a clang compiler issue
with booleans.  It turns out my code was the first function to return
a boolean and that wasn't being properly handled by the compiler (thanks
to mitigation of clearing registers with certain .config/compiler
flags).. it's not important.

More importantly, I think I get your point, you think that the testing
should be integrated and complain if it's broken - at least by bots.  I
don't think this is practical in all cases, unfortunately.

Although I would like to strive for this - and I do by keeping any tests
I can as a kernel module while keeping the harder to recreate issues as
user space.  I think we do a good job keeping testing up to date and
adding testcases as new issues are discovered.

Thanks,
Liam


