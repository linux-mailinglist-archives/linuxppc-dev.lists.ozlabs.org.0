Return-Path: <linuxppc-dev+bounces-11886-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F302AB4964A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 18:57:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLCmJ5BnYz2ykc;
	Tue,  9 Sep 2025 02:57:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757350624;
	cv=pass; b=TCJntsglotlr7gkj6pjaUy7jhKTPHzm2hU8RwpRnQBN0bD3auYjNgUxi8FCZamYC3IVpjWuR0+yMuGpCU9tpNssgJGTKGQh+y3gNjm934D//q8ZQ1F6omwVHz/0O/KI/NoTx8zUUxDfwq6zfaRYaVm1xAsOotM2DQTpa0zvc8FNYNQkM5Sxqrwb1XZ+sqb4PKEgLChhfblN0hI1xWcOouCOkHhSMghFrGRnv6hAQZxAYyc92yj6Yw/E1vbnvXD1NkQoJ1ONwmElDS+rcAVPNcg8ArepQREzhz67bsCVNapB0769q5nZWiozhNL1Rl6a4HTs33p4uqOEhchCCtNbb8g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757350624; c=relaxed/relaxed;
	bh=hddoNg68YCWE3kyPD3LjrA/JuV3JBC1RzVFPhW5prWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZyXlXZxUYrnqhcpEoVsFKyZMi9xUvwKLkzKSVTd8DKcw95Y8WTD0iSTWh5Y8C+QD7qk2RknJlLEW02CdV00o96bcDGzn5fQ3nXzgJQKI0m9HOCYhDq9cpammDER1vGPqk7exdWb4PCVEx+/LP7fGNwqX2IVdPtS3f1vVGHuNFplCJBWGs7tqBzQOQqo3B6uVL26/o7hTbHXMGjtVMBfpQIgvufLdp24AC2hsO9KuS4SSnMTF9s7nF28L0jmz4tcv2WJ/fPtIfxcXchpdYsJPunRj8FXlsuQJhgz4t5FuD5w3f+9KpIslOxFLU8FOYZbNn93wtXhWXzqipFenzHxA2Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=E4O1Tzx2; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NNMvgjq0; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=E4O1Tzx2;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NNMvgjq0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLCmH0lnqz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 02:57:01 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GtrmC030795;
	Mon, 8 Sep 2025 16:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=hddoNg68YCWE3kyPD3
	LjrA/JuV3JBC1RzVFPhW5prWE=; b=E4O1Tzx2zQMeJB36a6RdC1LcTQuqqJ9rIg
	vlhB4yD5SzHx0dqVgvB/BVJ9hU2FFXp2eRvyhX8xJahRkAI9Exk1lPD7TUkL0087
	B8eKqYFA3Y4tWvuMGjJI9K4INHrgCcuVBceHNi6tMSst9QsUEP8TVVnIRg+ZsGvD
	kdKmnp64MW9uyI024pxz8ZRka1Dp4mfAIdtYHod3S1g79r9P+cv2ZOPNrgdkbg71
	jlDJtNwxYRWulC52yuiIScWOhYODOB8BFCXc7dKNybPvsGFCmE8nvr8DG6m8obtX
	4VOMEZ/WQHMUYyUGkVTuQ68kD8I8RVHPx+rIWQpAZd4Y61P0WHQg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4922x900t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Sep 2025 16:56:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 588GEuwU038737;
	Mon, 8 Sep 2025 16:56:11 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 490bd8fn0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Sep 2025 16:56:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XlOiHnG53DYXYPjs4XZFIlBaJNrxCIoo2KpgP85/oGZ6wC9+q2gxovJTXS3PZeH/UIwkd5SDyoff0KaagX0qQNkEcSeG4h3Md7UAqFxFoaGAK4WINx9MoTQWoMmBb7nH5KU3uZ78OfJNlSyJF09sRl+XDZ9G/4etvto2jk6jvRZ3JnTggjn7HL6nO6onMGpPuhWk4i6CT9KDQHkLhAmTZXhuG++C3jPZ0ALiduj7Ktwcnxf2iMww/Lkujla8qaFE9yCzhZESs+Gk5hiyJIrGr53CZdt57eWipC6UQVlnjMoPiuaakTL5JXU9pBy86PO25ZJzWLqZk/g/vk8tttrpBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hddoNg68YCWE3kyPD3LjrA/JuV3JBC1RzVFPhW5prWE=;
 b=LJEPZEX1XC/m7jncDboCIyHVwoNTEdD7/6ZossyXLKZo2NqNoT1wllB/qGpLqW2j3q/r83Eg9Dr24ljooTWGHMIrwGLS0uwiCY1Tzzk+nyk2y1In1XbZK0Lb9s+NcmpoZV/zlC3mm9UFXhYJdsafHzrfI/EHIDm06itazyy+17WJHKt/EbJplsnSZ1YfHxX41nZXAzILYvT3fuoV/yCPTdqaot/CLikAd0o4SSMWNhjBC4UKR3IrJzfX0oDnwpVkB1xQwl+aPnLNHf8/IGRNvKj32x7EIRdU28jAibb1ebxuiUCmwRl58jebt/cZPyXCQgDx4fF4KRbn57KCjt9dLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hddoNg68YCWE3kyPD3LjrA/JuV3JBC1RzVFPhW5prWE=;
 b=NNMvgjq0Rk3fyx1FVku0zkiPAhALGXQhYOEDt42jTqKKsxflmPSy9eS0SI0i3JRQs5NHWRVDroWstswbc13rem3kHfeoSJp+j9wA09ISc6PVZYMYsBUfneSpLLWpkIRuNShdieMJPnhDu+fJIzrWFxiCD0qCLOVzY41ryioOS2U=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM6PR10MB4298.namprd10.prod.outlook.com (2603:10b6:5:21f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 16:56:08 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 16:56:08 +0000
Date: Mon, 8 Sep 2025 17:56:05 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/7] Nesting support for lazy MMU mode
Message-ID: <c07b8a65-7cef-4ddd-bd94-d2e275edc2a8@lucifer.local>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908073931.4159362-1-kevin.brodsky@arm.com>
X-ClientProxiedBy: LO2P123CA0047.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::35)
 To DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
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
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM6PR10MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: c91ef47f-a0b1-4b9b-260d-08ddeef89b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uw5gE/UWfacTBzmIU3Kab+tYqNRz/UMcDB4h1gJDKyQmw0AB0TdT71XInStR?=
 =?us-ascii?Q?qCQ5wfETPal0qkecWZHkqjI/5SZT0hcLbGwsar1PLJrHo1WdyLa/SX08MKRz?=
 =?us-ascii?Q?YSMIa+Ou0bH82CdpQj4QUG35EOWTpsk0c+jlMEDVGpjdlV4P2Zkd+tFK6wwj?=
 =?us-ascii?Q?x4ZJp7epLw+UHpTE5Ts+iafHnd/ngjf90ZeTpx2788B7a63h7vqdYH3bvYZr?=
 =?us-ascii?Q?C2OzT113M3YjxIrQRCLINs97BjyYc5KlDXTrr+uY0U/DZ4LA16sdBOYHK2yq?=
 =?us-ascii?Q?iVnCHY4fj26fzUGldqTy6ie3aBDo7wjyvx/VWmtGPcWbQVsj+x4W6p/0kIUm?=
 =?us-ascii?Q?n5T7LKZ4Hj+/PH2t7q0sPcIug75XUI5iOqTzOf21i9CGikLCZG/z1SzM3psP?=
 =?us-ascii?Q?hu4cAJuhowAtNVAYaIHuZH4GBPgxABuUS9p+nwODJld5BXCuF7Weyor9ccv2?=
 =?us-ascii?Q?hbQXcjoFaRICOJASfmHrlkqHbNm4AwUx/KUu6JgCg50Pw7MDU0eu/7DlsqNe?=
 =?us-ascii?Q?bS0cUIV4VgR0dnAN7PMuNOTPcB5DDuVTxW4Ed0+tBJlcjNle+X44e2m1ubxe?=
 =?us-ascii?Q?9hA40YQH3sTXC4NczvhxSnrbKzZKNa4m1NLR8tGDmjCGouazj4OgdJAt85ou?=
 =?us-ascii?Q?5WWuryIuA+ir1N7iPWGt0Z5INSumZUkNP7TjWn311UcW4hOln2hvZo4f8bfC?=
 =?us-ascii?Q?g3rBaUY4hnuXG3rCf54AeqKegIGs4lpd3Sj0aMML2qrncLpxgtH1rV1XnwaG?=
 =?us-ascii?Q?l5ig+Kntm2zc8GsDs/rmCGobWkkvYsqNN1iRwg01DtJzMUZLvaBTb872Q2Ps?=
 =?us-ascii?Q?BQRAPX3Yd3fWiKiab83loXdKxQXTh4p9f3JMbLVaZogJJ26N5sZg4t2ZRGpL?=
 =?us-ascii?Q?5ytLSez7wpRQKqQsSAoEtNEpVlzlDGAoHfuEointddwtbTIrz1WTDIZOGJL9?=
 =?us-ascii?Q?OURY/+h5IexQSkKIs4j6pZZDdTJ3nL6lNHBC0za75UEZvwjM3uSUJPzHJsI5?=
 =?us-ascii?Q?4pjdCdibH+hdu+2Lg90N6hmxbS/Pm1+CKKOdrrQEipDHYZQRQX+m3bGhykaD?=
 =?us-ascii?Q?YMQzCM7uhS1Y/9pbUJ/oE098R76Hd34Yjv1QIcnQbJD+lDirhQ3j1shXRoMP?=
 =?us-ascii?Q?21z3vVGnGs75NrAlONrJnCSXwVh3e5t6I2b+AmDSbw+6mE4ulNcTNKyDZdSd?=
 =?us-ascii?Q?4HIIJGZaKOLMnhwLg4rqwZpOx0FTYPZTbAfUraDVVuyQWF4F0YE/YNWXkoUC?=
 =?us-ascii?Q?7a8UCCGeo+FrqTZuCnWRVC6z9iZQwLdcqDlKAY5yludMWW4/Zb3VkFQLVASb?=
 =?us-ascii?Q?m/fg2I7DS1nNVfO8u0Cd+Dfc7iMlMpQMvAiQs8ZvUJx0toaY0wNdZ6BcrODL?=
 =?us-ascii?Q?fv5O4GLHu88GQ4uuoWO3923jGfIjqyUYhGG4FiGWgYaD9EwtaX02LUlieNOu?=
 =?us-ascii?Q?YXQw4F4HtIA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b+0XZJpy/tRTqr/EckM/RsWTmBZHEynf2LnspsiqMlPSlVkSNYXEMY2eMt5x?=
 =?us-ascii?Q?Wb3Lic9dxnQGzcgtZ57is/wp4mLIJdwOdWNOWvyQ9eSdInMN+50UkLW1+LA5?=
 =?us-ascii?Q?knllEjAidx2lekUAZHocNrn51qRHqQd2fipCOZuUtUcu9dCm1y6YUb692Elt?=
 =?us-ascii?Q?9yb6F3JOp3CC4mWLPEYxC1xlh13H45X4dIZX7Gil3kuhHVYC0Lugl4I6poLu?=
 =?us-ascii?Q?zReVFSLe/FLvPhDIfJI2J8K+oNL+sLwS23hyrds431V7Cs1i5CwgwlQzIgc1?=
 =?us-ascii?Q?1WqEEpFVoT/kSl0DN0jWK26/bt6IWYE9oP4Ihm8bjOxRZl/exKxOBKeq2VML?=
 =?us-ascii?Q?hIWPdlKaqfOd/ItmFFrnpulmxb0jgIiys0vKlYeebdT6p03EuI8d9ftl8fh4?=
 =?us-ascii?Q?NPEzCdJoLxC2r6DvIuZLoQAtg+MhDt5uaGqrbNqIaV1M/Sgr8ssb6nVGby0D?=
 =?us-ascii?Q?Gd+5TS4NITomZlvjILOhGLGRZsZKgXRzHSzk+ltBMoBynydAWdi1Yh7iMiRA?=
 =?us-ascii?Q?qoFw4DKw3hB2GWeTbbCE6n1+XauyKI/fm6jhm100dZI7ETajLakjTIUwdXXi?=
 =?us-ascii?Q?NB/X86W05UaEP11+AXH7vp7+Ry3cxhMrbgCNK9/gkKni35MbZJq2xQbo+e1u?=
 =?us-ascii?Q?sU6lR1rJ0k7yyTwY7ELgxDwkEBdEpX17mE//y8Fa4y36XGepzlup3UTEBjW6?=
 =?us-ascii?Q?qqo6qXw5FJO+3+LgzMHo6rZE1h922YCy3aXi2R9nV/Y+midNC8tV6fMP3b4q?=
 =?us-ascii?Q?GDN4XvURmqZLvGqzz7o04x6LTqcdpKDlMc5KexKVRxmA03jRpv7oq4KsTxHR?=
 =?us-ascii?Q?GMrle6H8fcSYOCpCJAh1NDvjaL8hKPg+fpzFTGHb2IYiPPgtDJg3IAIqDJds?=
 =?us-ascii?Q?2K8E5sjmCRjiWWqbxZxLcZw9JKNM76AmziCqpjyMnqIIwQqv4Z6uIOb6u0rT?=
 =?us-ascii?Q?KIt4uYzwIEYYuHsOIOO8QYFhKlcI3GfJ8y+vqxVhdLrxx7zHBef8/ZcjRAoR?=
 =?us-ascii?Q?nenuqhyQ9W3Yrf5Q9FTMfZ0dP1qmq9mZRaLiNQUyHs0/SGCQ75G3Pz80UNbl?=
 =?us-ascii?Q?3AwOFDAOtFugKUYOQUuEGoGWVXmX0sLOQ4ZmBDfOhYGJSotWguZU2tkXnYWm?=
 =?us-ascii?Q?5v9l3qjRf6w3Ue6cHY64VH2jYZR1i89Q/YvtPPLKnGmVudRhXmRBY1vF9s+p?=
 =?us-ascii?Q?uresRVlJ963SXRFWBUpi5e5y6POFByPsHpGvl3LwwK9liLK4eAWtt+Dxm07F?=
 =?us-ascii?Q?//aypZBiwABymweqdKRrDfXKFTbosQCoe13nZ7nfstbKRmYWHxQsqXCnDz+R?=
 =?us-ascii?Q?kp6Gk4RgQ2I5KTUO5gi9MSn7Sk9fDMwOnDxlg+0IPjGwc/Ttyh8Nsbu1piVD?=
 =?us-ascii?Q?TAlcBnOe3xjw/ot8GE2uKFklVguJ3zJczoGh/caGiDKEYxuFBFJeTwzu/9/K?=
 =?us-ascii?Q?Zd4TYBKy0I6YCL79cexP4CIWuaBvp7QuTs2h4kjwXjUEEA+rhOVbVhoxFo/M?=
 =?us-ascii?Q?v2JIVfG3UKhZIulSrIX9uqXRResrq+gkLMSBS57h4CY5zmWltj+s3y+0qmuS?=
 =?us-ascii?Q?SOnspik3wNvsrQZuNIhxbbL/B35qGKewdXsHOW5ijZeC1pz0iu+Txfv1o4ma?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UR4mv6xbIgnXDbxUKR1cqkGCF9s05k+wwmTHIrIFO5CKUFcv77M94vqYbNzlgAzhNKKxN7fIuxyW8blF2IwtWOp7+OiWcsvcVR4Jjsi5Urx3Egf4CSOLZGsm94SPJ3OqkxHnbL97cccyRWbKM+VitYIit+R0XD8E4c/w1EYMkfWiR6oq40fX7BOAImwwoRf0STGe64txPPo/sjnbN/9DS0vF0ZNTciJYT/KtqZQWNBYl26Kb5qj7C5lVwjLC1aWv9miyzwDSPZWYnKsO1UfEq/V5bnkRN8eBdnw9gVIeweRHQFpoVAlPjwNVbII1YfT6DHXifh9mCEpYaT8qNZyPcZla5MuNdMpQssD1Kq4+nA9HCP9uONXLtHjGDJR+UE/8kxc8c3hU5AKoXN3pm3atEy98RotwePffbLFVhd1BVKehQQjfbs0CdFcHfAx4C94lmnCLZTccY7uM0F47FCY8gKY2uoEPhkx0cTFr6m6GfzncnOXIUAMInvxeZj53IuG1lrvY3f8mPxhD0iIPiRq42xm9q3aaN63LFKZH9Iqjsxy+T04+V25sqD/1eJv8uP7mQ+LPk88/iTBiU+EWlhMHqVFsaeRqk37UK4h7hbbIoiY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91ef47f-a0b1-4b9b-260d-08ddeef89b59
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 16:56:08.2835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QqS1aWvcaNPuIzqj1Yo/pzXTYiiEiVwAawKlvv3/bbWiK+1Ki/2zFIy89Yuxtcuy/Rzw+iQOTC0rn+K38XYja991P0ETzdn/i89m1Y59/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4298
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=591 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509080168
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE2NiBTYWx0ZWRfXyaW/OwKuwQSl
 9BDOTG9eq7bCeECLT5T94THvm3HZRn0vc3/GM+elgpQU5gwb/T5q/DxC8EXbqB6v5xeDMRZRVof
 ZsvJqwfftNUQ5wDVlTGF/O5Qg65Cd3CmetGzHut65epSpMwT0cD/Bfrz1T9SnvUepy4sQfkG8Us
 iMKHRC6f+eUg55QXRBzpjGOAPZyMQGwqvQ1yezohayyCqzWyq8sQH9j9nVh+2SxnQZvHiJB9WD1
 GAnq8Qryj9kL2sZv2mYc+qDCNVvk/uT1gXnfW4Sf5MzxAelWOqjM3iUw/IyebuXkACLrtgpPRQS
 ERA+tTeGJ+CdDIP5wlIsx9lqS5FOkc/9ZH9x/qKGV1G2aZpATR0eUNytAL8tMBQYqabuhKuKhOF
 ApKFIIFBF9tBBqmfH0Z8L/ck3egP5w==
X-Proofpoint-GUID: mOOjE0NbEMAQs1zzcMm6ACvYQS3XCFFR
X-Proofpoint-ORIG-GUID: mOOjE0NbEMAQs1zzcMm6ACvYQS3XCFFR
X-Authority-Analysis: v=2.4 cv=LYY86ifi c=1 sm=1 tr=0 ts=68bf0aad b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=XiB1ofsnmaN9j6wyxJcA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12068
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Mon, Sep 08, 2025 at 08:39:24AM +0100, Kevin Brodsky wrote:
> When the lazy MMU mode was introduced eons ago, it wasn't made clear
> whether such a sequence was legal:
>
> 	arch_enter_lazy_mmu_mode()
> 	...
> 		arch_enter_lazy_mmu_mode()
> 		...
> 		arch_leave_lazy_mmu_mode()
> 	...
> 	arch_leave_lazy_mmu_mode()
>
> It seems fair to say that nested calls to
> arch_{enter,leave}_lazy_mmu_mode() were not expected, and most
> architectures never explicitly supported it.


This is compiling with CONFIG_USERFAULTFD at all commits and series is
compiling with allmodconfig plus all mm selftests are passing so from my
side this looks good, thanks for addressing issues and rebasing! :)

Cheers, Lorenzo

