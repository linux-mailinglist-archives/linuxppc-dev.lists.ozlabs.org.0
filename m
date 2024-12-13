Return-Path: <linuxppc-dev+bounces-4115-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7399F128D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 17:46:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8wGM6pz4z3bSc;
	Sat, 14 Dec 2024 03:46:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734108395;
	cv=pass; b=NyAVRNmCyeZ20zHPWWFnMdfnqNySMstBgjSNo65o8kFaxTA9yE7GKYyDpL3XtwlOsoPEGD8vUlwTF+2NRh9i9lkFu5Ol2M5QxGGgOjUh5aMKdMwH8V5u0L5jPUy6Ntp1psOA2Sow71okaV7yoeRhvLElBp0bnxAIf3KsuM4BJ/+HZ59eFXwc7JTxyk7ku3sIAgqYFuvROL++DTIvYnneoGHQMMw0IWT5uS1NxJpZS9sJQSWi/NOK5MXCBEmpM/L9NcVZYdP138AcGRTkIPB6LPCmba3EkPhooMc3d4BsRyo3mafHKDFnwa8sOgnGXjiBzicafuKPpKaRJlas/rCSVw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734108395; c=relaxed/relaxed;
	bh=RJ1VqmlJLO3RNdivupzUXoSe73ZDIuhpVXIsQlyHYpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J7V/Z7x6/adaJA21n6ITcsQTJp9OCY6UrRDJ7xiigAterognBj8ggo/Xmw/HXxxoqSj/Pn627SojrOyXA103fP9DzgD53RrI1QcoZC8IGT4LICicpuSUMGa9ltJ18u10RgGTfx049ysJCXZwOjYJcwKSnIoqi/fDRXy09Yqyqim1g7m4XwvfaYdWmhBIqzrTzQLqxl7E48f/NYlVH+JQ5WDb1IlEpTjcuyb+E1tGToqC5iEfsti/Cubvw3+kkSnGsE310l/Z5Ne1jI3lRQqSuoyp9ge53rwDXactAe6VSnS1r0EkQg0mrhE4mwWEC4hCEdtjRnw86AKHk0qVc10O/w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=fS+TdS6n; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NkMYw/27; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=fS+TdS6n;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NkMYw/27;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8wGK6ZQcz2yVT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 03:46:32 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDDk8Ts005941;
	Fri, 13 Dec 2024 16:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=RJ1VqmlJLO3RNdivupzUXoSe73ZDIuhpVXIsQlyHYpg=; b=
	fS+TdS6n9tk/Rpe20RugOeluIcG5L1nPzsp9IJi0ZlpYALr5jky+Tl2s10jWLCoy
	pEjrGfrbhCM/pIfIboAPTIQoRwutIai1bM5lbNid9fQX0ZnwJc9MGPLrkJFSGlPg
	U8B/8MeKAX8kbSH5KMTapmw9NNwpDpQtGHevcHpxx/AZEuRBolnY6V//EmFS/J7G
	DgIyhxZqHxkpT1h+p51XD4zkYCxiCd6xH4dg/T1rqpaVRrOzhLf85az9szbwv65H
	nx5zAhw62uq40Wqg3Lw2kCdHVZiXuRKIKYIrWdZQCfrHhmpK4LfQ0tK1i+0lq+uC
	TuZdQgB8DlbRiHPBgQSh7g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ddr6bvd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 16:45:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDEtmMM035026;
	Fri, 13 Dec 2024 16:45:41 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cctm730r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 16:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWYdS/Rsyi8GKcI/hQyj7pLpZNC879tcTgCTW/S/2NR+TOjUpuKWmLNOZipaQamJOg0SNmZXp3wE5PDe0H3Amx/vqCDiRFbEaDSh3oxKMnis39oECl24s0ZhAvagv73R9eFRH7X5/DeInSLKBjP+vZT9FsvhX6pUMpPd8FWpMEU6783mCL0+uKHmjAfKAqMcRIOwPcsskxrIF4LVYqnpsYBmS7Udzy37GMTOvvF870nY3W14wJqKk9Cc4kmFo+yhsK3GU7E96AogdkpAIVsCmaMAGWCj+LG7i8F9gsxggBApEaJh+NZamwpJ8X6y5chDTxveskI4AjL2ak9MvVUkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ1VqmlJLO3RNdivupzUXoSe73ZDIuhpVXIsQlyHYpg=;
 b=fzy++VbgyBmq6BKUepVNm1iAzI6Xrb+zV9GTAE34SrZILd8VMW6obx/IlVvqDu56t7huET3RYBkKVfMyEBAcWaJe7OYFKRmc1gsLDM394cPqg1SfDBBETmMoVDDPb8WzX6IMZnpcT+tlLwg1SANGMFO/rtdW2iAhpi+GEc9GkhnYTfZ/a1hp/befYSgd3Hz79SNETVVPJmcWjz+2queOjQ4R0MfvDZa9HbrRSh8mpeqdd3zbJk4W4jGFKHiZNVZPAaANTGlr8lGF/dtRqWXapCFR1cjEMV9NVs0mhYmNpafEebdeASTucaO9nS5izYVMcGSPZz2tviIkY0bmvQ4Kgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ1VqmlJLO3RNdivupzUXoSe73ZDIuhpVXIsQlyHYpg=;
 b=NkMYw/27R2yAkm0+s5nT+JAnlBuIJx7fNuV9luxRXEEJfrdtYglDzayTyeWGS0PvQhpbD3QXxCy2RTxh5m2tVMXpWNefmjWjtxQZOT0AZpPCblxTl4OeZqIcqzCQa6+yR+R5zKnRn6hRRX9gjGGtuqlJGL5uo1V8K3QNes4NbJ8=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CH3PR10MB7117.namprd10.prod.outlook.com (2603:10b6:610:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 16:45:39 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 16:45:39 +0000
Date: Fri, 13 Dec 2024 11:45:32 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Kalesh Singh <kaleshsingh@google.com>,
        Andrew Morton <akpm@linux-foundation.org>, vbabka@suse.cz,
        yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com,
        minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk,
        tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, davem@davemloft.net, andreas@gaisler.com,
        tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
        bhelgaas@google.com, jason.andryuk@amd.com, leitao@debian.org,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        kernel-team@android.com, android-mm@google.com,
        Jann Horn <jannh@google.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
Message-ID: <x2y7rewvmri25wj72qaeuunqqsqj7pqcliahoxkprcbfxg5owv@icvnojkhrdch>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Kalesh Singh <kaleshsingh@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, vbabka@suse.cz, yang@os.amperecomputing.com, riel@surriel.com, 
	david@redhat.com, minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com, 
	bhelgaas@google.com, jason.andryuk@amd.com, leitao@debian.org, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-mm@kvack.org, kernel-team@android.com, android-mm@google.com, 
	Jann Horn <jannh@google.com>
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
 <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local>
 <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
 <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
 <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
 <9675c409-b495-46a5-a90c-c952892b4121@lucifer.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9675c409-b495-46a5-a90c-c952892b4121@lucifer.local>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0248.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::27) To PH0PR10MB5777.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CH3PR10MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc9aa13-1573-4c81-d927-08dd1b959325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|27256017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTgrQlRrQk1iZDVzTGFXQ1c0c3BFOVlDYnp3ZEVRU090dVo5bE9XbDFESE1V?=
 =?utf-8?B?V2ZDQ3hGYkNRT3lxMDQycHkzZ3ljRDZEWTkzbzR2OE1aTC9OWXRINTAvRWRW?=
 =?utf-8?B?OXdQWThJYm9tZFNEc0lXaEQ2ZEpnaGtPOVlmeW1wTi8vTkVyQjlPMk5Ra3dj?=
 =?utf-8?B?NzVQdlAwUmRvOGFLb0FVWjJBLzlxMXM1STQxeFcrQUl6bkkzNE1EejBYbE5Z?=
 =?utf-8?B?ZlJaVGs5SlM4QnVqZFNzUHZKbUNnQUsxaThadXpOSFRsa3BxMXlZcHVLV1ND?=
 =?utf-8?B?eFdUS0tzTFZBSXNtZmZkdHpuTys5UHlBWDFydE9KOHg2Z0dNTHd4d0dhOUph?=
 =?utf-8?B?TVJMaElTTmtOdEVQZS82Z2FmUVZxenpLbCtmaEJtR3dCNTlybk53WGRkQllU?=
 =?utf-8?B?NXJEWVBBb2k5T1ZwOExrZGluSjdpK1AySmdhZFVTaEw0VFowMmJWZXQ3YVND?=
 =?utf-8?B?aDMyd3FueHNjb1c2SS9FblVFK3M1OFk2OEQ0aEFOQVlOK0Y3ZTJtMWl3L2N0?=
 =?utf-8?B?eFlQam1XeHkzRUR5T2oyMVF4ZnE1RWVPb1lPSG4yRUorMlJSTENtN0VNemkx?=
 =?utf-8?B?bzVHdjBPYmh5QVlGaVJqbnlPK0VEbGUvUVlzMUgwd1NNSTRwTnROTDZTR1pK?=
 =?utf-8?B?U0xrWC93KzZGZUY5d1c1c2t0V3V6a0VHbWNEMWxIVHE2emJGcHQwOUtHeElH?=
 =?utf-8?B?NVIzNWRhRDBDcTYrT2xRMS9tL0FIYzBNamhkZ1Bpc1N2M2JYYVdPZUpoZ2I1?=
 =?utf-8?B?cGdORmtDc002Tzh0VVk1NVNtVi9GNTZ1SWFITENGc2hVOXFLdk0rbThXYTV1?=
 =?utf-8?B?TTNvN2ZvQ0xjUWRuT3pTdStJaWtYYWRuakNFZVhJcC9FT1hHSkJGTXZQVkR0?=
 =?utf-8?B?Q0NuMElVRGROdjZTSUQvUlBXOEZWSytHZzFNSi9UU3oxdWZUZ1pxZmxCTElq?=
 =?utf-8?B?bndyWGs3UDBXcHV4MzB0dEdGcEpKQ29SNWNtaHR0ZVE4YmVVTTZpaXNja1Y2?=
 =?utf-8?B?Mm52L1oxWmpYVE1LdDhJM0VXYm1aY3B6cXl6ZlpERXFQcTAzb3RVZmEwd1Zq?=
 =?utf-8?B?TDUxMWV2d2loeHIwakxFTmV1eVJ4Q3N0YkN1eWpxVVdHcmVXYU9pZ2d2WVNv?=
 =?utf-8?B?RjNtTGV3QWVCSUlGelU5U0tpOXV4TDRJYTBhWnVkYlBLMTZteVNCalRTQkJG?=
 =?utf-8?B?Mlp3V25BaWxLNi81Q3M4M1AxbHU5TE9iSk54eU9xL2tZZ25HTVUrNUxzSDQz?=
 =?utf-8?B?aTJzbEhpcGFMQWU2R2E0QVFYYzlYVTJwNUdRazYwLzJPK04xOHBGTVlVNmZ5?=
 =?utf-8?B?SjBDSTVXMjhUbUZJcXY4L0dMOG9IZklJOGUxUFZkQ09IWFYvYVlHbFhxanlw?=
 =?utf-8?B?VldBTGFyTE1BZ3I3ekR0Y3pLeS9UWVVyUGUzays5TGhsM2swRHEyMWtHcjdK?=
 =?utf-8?B?M2dSTmVHd0VscXdNbWxGOWZWcS95dTV0bzlydytDM1R0NFJLRUZFMWQvUkQ3?=
 =?utf-8?B?blBJNHZNeFNOQ21sV24zSDZnYnZSMzBnZHFheThEY2U5NXFURzRjTllPT2xU?=
 =?utf-8?B?WnlpNGNhNlh6ZGF0cmVRbWNTdWMwQU9hMVV2UWFPbndTOVorY2VNbk0wL1VS?=
 =?utf-8?B?U2dZRHhEUzJsZXRxUXNkbHhRQ21odFo3WE45ak1GWkhVWk51ZEpnRTU3Z1NK?=
 =?utf-8?B?b3MxMGxnUkRwZmlhZ0drZmlNNkQ3QWdHUFBjdHZaNXRidlVSS1hka0E1eXhj?=
 =?utf-8?B?cENoYjUrWmd4bVhHQlNxZktsbTdGdVJQSTBaTVJ5a2VYdllDMy9MVU42ajZO?=
 =?utf-8?B?ZGdHaXhPb2MySVJ6MDA2NlVRYXJZcXJwOXlBZG1JL0NkSFk0L256Q3l0ZkRT?=
 =?utf-8?B?WUkxbVQ4VitidUxxWmpwQTVVTCt6QjFuK1NicHFaS0lUanc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVZIZVNXZ09MV3d1NEkvaW5ZUEt3S1pKWUlDaTJXZm1IK1Znd1hRYzE0YURk?=
 =?utf-8?B?RmRHMTJsTDBoWlFKQklpT08vVldldFNGNW52UUMzbk80bHBycU5DT01kditl?=
 =?utf-8?B?ZXBIWlA4RGUwYzhGb3dDRmpSTkJ5SDkrMSt6Mkl5ajNkeXVvdTBFNG8rbVdx?=
 =?utf-8?B?bGkvdUk2M3lWOEE4bGF2M2h5Z1hSaVV1SmZncUszb29FOFI3N2pjR1AyWlRw?=
 =?utf-8?B?ZkpNbDN6VXJVaWhPLzdLNUhIbjJsQUZpOEZXc2ZPMkNjUC9CTit1U0RBZWVV?=
 =?utf-8?B?bVVZOERWVnBYVFI3VEtuR2FVVWlUdS8vNCt1VVNWNFlKNnRIRElTY1lDd1Zo?=
 =?utf-8?B?dmhpS2JuRnFkTU9aMHVJSDV3aGtrNkdHSDVxaHBOajk2NVhLMktnQy9WOHN3?=
 =?utf-8?B?Y3pIdDlFUGE2blYzcDNqZUVKbUZHdFVDa1l1SW5Ca0hJZXN6RXIvT3hNY3FY?=
 =?utf-8?B?VjlKem5iTlJKK3lLc1lSTy81YWdyVk44R2FGc3kvMExjRklPblF6eW1nZzNM?=
 =?utf-8?B?NFdVTnRhaXZSMzNKUnF3V2hzMG04NnNPZ0kzQWdVZlpiUnNlV1RQUVNjcUxi?=
 =?utf-8?B?ZUJzQ3B6dTZCNm9lNFM3WDVJdFBkZ1grMEJ3NFZhTXlBQm9kbEhuVlpjalJ2?=
 =?utf-8?B?RFdmbTB0R21BQUtiUkt3VXVYOVU0ckJMYU5NK3lCOHlVZktFakRJY2FsUzZ5?=
 =?utf-8?B?RzI2czJ5bG5DaTltZyt4cE56eGZSZ2hCTHhCVlZWMmpGd1hESVcyZ2VVc2gz?=
 =?utf-8?B?OEpoOStEUVJ0MHd3cTZNa2Y2bWkxWXB0bU5GNU5Wa3VKTHBpQmtBT2c5Ymh3?=
 =?utf-8?B?MUNldDNod3o0cXM0T1Bic2lOcWM5NTFTZ3BEeGJ4WDZ3YVRhakJMZ2pRNlU0?=
 =?utf-8?B?VEFwUTdCUWF5c053bWErdkY0YXBZN2E1SW1JUjU5Ymo0ZmlhWkxDL216N1F2?=
 =?utf-8?B?Mzdma2JZYjZ4MFA5R2JqZE9yTFNyRDhrWEpWQnFYdHFmYnNHYVFZdE5qRmxw?=
 =?utf-8?B?cUw5ODFLQjlWVk10M3FxbkE1Q0tzcEwwOWdGVGtrempKNGwxbTUyZnFjbXNy?=
 =?utf-8?B?TkdjUm5RdC9nSkhDT3gxeW5FOFhtVEczNDIvYVdQbXRrUStKaFAyWlR4U0lX?=
 =?utf-8?B?QVRBL1BtNHdUaFNRWldLMWdtRWdVbjQwSVM3dUlxc3VJTlhqYjQ3VTlYR01F?=
 =?utf-8?B?dis5OXRQSkhCajhyc29XTDZ2OEpPQkwvQS81TDJJanV2VHlYWmlWbVFld3VX?=
 =?utf-8?B?bFR0SnFWczRwYldoTjZjcmJPcExQRnVVS25VY1FSQ3hHT2NxeG0za1grN1h0?=
 =?utf-8?B?cmFpTzMya1VuRUE3LzY1TDJoZDI1cVdZQkROUHFJVFZLZkp4MzIzV25mcW1o?=
 =?utf-8?B?NTc0SWhucHBtZE9KaVZZTG9wTzhiVmowbmx4dVhWQjFZd1ZrWVozNXJ2SDJB?=
 =?utf-8?B?V3BJbDQ4c3JaNmlpMGFBamJvY1lOVzgyVkJEYVNDRmpWRHhVcmRYS3Z1RUJq?=
 =?utf-8?B?YnhjQ0VwVC9ueDVnSzRRQ1dNWFFub3dCUDhWbXExZm1QYzB2dmJJeFZQTlEr?=
 =?utf-8?B?ekpnamhoUE51dEgxN2JoSEh1YitEaXczU01vU2NPaXVDdmhhK0Evd2ZDdXpr?=
 =?utf-8?B?bjJNRVd2VU5Pck1UcUFjT2VjZEw4NnZHNGNXVHg0RTFMdGdxUlZaK3FKTFBa?=
 =?utf-8?B?R25TQk0xaTlVNnlwY3NGeVM0M1cvMTc0QUgybVQ4RE1SVjBEVXVhR0lRYkxR?=
 =?utf-8?B?T2ZmcG9OSFBVQWR6aldlbldUYlE0THVQWjloOTBpMngwSktsejBWR0lzR3lo?=
 =?utf-8?B?aUd6Qm0ycjAyTmJWdmF4NEY3a3A3RWtvYms4cFAwN0JnVXBWaEdDbURyUjVq?=
 =?utf-8?B?b05qeWxTNkIzNFRhSkJEazFSVlA2RnlXTTVyd21ycG1xVU1IMTFTZ1lJTGM2?=
 =?utf-8?B?YUlBSDVhMWVyQTFoNE8rbmFEbVQ3NVBSSWd0VmxhZWN3eFA3MUQrRnVBZzE0?=
 =?utf-8?B?WXB1VTVUNGxkOGtXTWY5a1I5Tm84QklwMVc5ZWZJeVNrRm5FWWE0Qy8zNEc4?=
 =?utf-8?B?WjRZWmVvSHEyYkh6UCtjTVBtMEI4eWlxMmU3Q1JzaVkxUW1xaEV6NEdUVnhq?=
 =?utf-8?Q?1h5Wpg0Xkrkng5igjcVH0j8uH?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NOkAW11RVqofdvo5pcRJd6vjHIkMblu6oBElcG7v5qdoFHKL+tIH8dN6U8Eh2t6OduiA3yNlv6xEpvLEHhUbusXMur7rEfXX6EU1l+1kVMYWyk/US2UkJXq+Kv0C8JBE32Gx5T+b7XZjJEsoa/rvQsMQUea8scgj1xTxDwAOsaexED0854yDpNFpq+RuCmlSqYMRPxb62wnpABk9ApKYl4Wu1Xp/5kZR/duYK9aRLV+UHSfi4pRVhxyYi5z0a5fDdaFIIHAARKY1G6FD+a9NqVUBSkBDR1Ks+w7TpTJcVWo5QnGsWmo8v/831jpQKGT6hzJ8VVhxj0u9/vAv6u98h967SrRT7myf2I9ZFEhyJb5HDXd9TZJN4VeZ3nB2MgEnxGyobaQvcXCyZsSwJ+f2GKBSbrKayvzwJywtP1SJ4E0KaKGpGXfZB4mnQertLwT0Z1AXROy0ZV9d+DAYfhQef1QuhOUumLCxvzL9RJZ+o0kjAvxC9ekm3EhVkS5nWTQwxFFLxvt5B3fEbYawKB8Z7QeEYP1lv/igMD/qziFGQ0HmWg5KrBWRdR/pAJwL8FaPWaR8HWD3cXGb/hrL3p3WJp7FkrSZLz/62tK/HI++a6A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc9aa13-1573-4c81-d927-08dd1b959325
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 16:45:39.1041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZIcKlMYi35BZBTjVwDmW94HIqQeAoFHOc/iDIljAG8EuZ+/ytrghhhnYubbwbn8M2cF1WZpBSR4G4DdHxPgIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7117
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-13_06,2024-12-12_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412130118
X-Proofpoint-GUID: eGMPyJjqZHKEG29OLhqhBCAffvdbh-Wz
X-Proofpoint-ORIG-GUID: eGMPyJjqZHKEG29OLhqhBCAffvdbh-Wz
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [241213 10:16]:
> On Fri, Dec 13, 2024 at 10:06:55AM -0500, Kalesh Singh wrote:
> > On Fri, Dec 13, 2024 at 4:00=E2=80=AFAM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:

...

> >
> > On the technical side, Liam is right that the copy-pasted arch code
> > has inconsistencies (missing checks, order of checks, ...). I agree
> > there=E2=80=99s room for further consolidation. I=E2=80=99ll take anoth=
er stab at it
> > and resend it as an RFC with an updated cover letter, as Lorenzo and
> > others suggested.

Thanks.  Can you please include what platforms you have tested in your
cover letter (and level of testing - booting, running something, etc).

If you have not tested them, then it might be worth it to have it as an
RFC to point this out - at least initially.  Some of these are very
difficult to set up for testing, but it is also possible that you did
that and the maintainers/people who usually test these things will
assume it's fine if you don't spell out what's going on.

>=20
> The most useful thing here as well to help us understand would be to writ=
e
> more in the cover letter to expand on what it is you ultimately what to
> achieve here - it seems like an extension on the existing THP work on a
> per-arch basis (I may be wrong)? So adding more detail would be super
> useful here! :)
>=20
> We do hope to avoid arch hooks if at all possible explicitly for the reas=
on
> that they can be applied at unfortunate times in terms of locking/whether
> the objects in question are fully/partially instantiated, VMA visibility
> etc. etc. based on having had issues in these areas before.
>=20
> Also if a hook means 'anything' can happen at a certain point, it means w=
e
> can't make any assumptions about what has/hasn't and have to account for
> anything which seriously complicates things.
>=20
> Ideally we'd find a means to achieve the same thing while also exposing u=
s
> as little as possible to what may be mutated.


Yes, I'm not sure of what your plans are, but I would like to see all of
these custom functions removed, if at all possible.

Thanks,
Liam

