Return-Path: <linuxppc-dev+bounces-4098-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E089F0714
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 10:01:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8jxW2hqyz3bNm;
	Fri, 13 Dec 2024 20:01:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734080479;
	cv=pass; b=UVkFrEV0c7mEhh5wLD45LEBwKYbptZDzBJjbX2wPtVsm56MnxwLtDS8uoyA5GQUeNk7kTALzjp//3mgGd0QJrkp0sVzUhfrww3PkFfk+gxZivzq1AFtNzFF/ILlfeC7WBud26yVY+Da4qf77heiMfoXCIjNyrBzIamM3mLlPV9MF7J4FVEMFmCOW3WlReqbAJQ7y3W4kUoxtCuMHoMtrMWf1fIq+yK8GRF1RALE4B6He7ztZgEIkdqqZWf4Z58ybN+JdvjZzZQou+Q9nDrdC7LlIgjsdLO6pGcurNYZtjoCaVByS1WBfQjx4b2O6KWLES5aFdDbbyNQyzWanmiI3tA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734080479; c=relaxed/relaxed;
	bh=NMmWjr7UBg4pQA5c8Uk82OwgnFISVWuyqQJH3/esbh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=abyoFeaMlZRACu2OmHlK8kIdG3kVUJ1Tum6wg+kgA8CQNK1NpuikOMAFuzdt0lnr45lG0Ny+g3mhWQfrZZWPn9NTSufdAqXGHgmzqiPzqq3Si2m7MnarKQKbWIlrzhlBxop919/x8fFHwMTybkuXYPv9KjJpn0dcgxsgK1SJ2Y9dtyeluJ5+BRsvWtuYPpzzsy/rzjAC2o7scBVTjKcb45dhAmHWuj0YG17Tua+V74I2fyfeIWskBNIeqwtIeKrtV8GnCKBVW9sHytRizNhji5+eWU7FpAV7tqu21118Abtr2vwqmOEPfgiQWdcbI6DPNBXdhQGorKRz8d4LZli9GQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=SZbpE1pJ; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=eCMxQ/ht; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=SZbpE1pJ;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=eCMxQ/ht;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8jxT5Dz8z3bNh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 20:01:15 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD1fp7q025939;
	Fri, 13 Dec 2024 09:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=NMmWjr7UBg4pQA5c8U
	k82OwgnFISVWuyqQJH3/esbh4=; b=SZbpE1pJbSTPGfPJHr34Ogzf9SZUK28YIW
	CL3qxnPI5j11dS8K/eDFi9t4S6xbWngNwsjB7YlLVnJpboC+8lBPDRmy/gHxMUsX
	s4GF6AsY6g69+B6EGD2/EYg63ezL38HSHS5qtj3J0Q3pojTTUwcan/BJJESbHPPH
	jSS/h+o+Gq3l+wjqB3eBWljCndx+EX7BWwzflWqvppsvxdHY1Dvuhu16wxN3g1Of
	3hDj7/k2OtHZtFzdXKG33Mv8S68Eg9hjVExSabBKi4RCQM7ABoCBQsq6KPUNIHuF
	tdYROL+5Af5vNwKgyWWfQFqF0VytKnYg/D9cylffu2HxFifhKMug==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ce89ctw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 09:00:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD6dA4K019284;
	Fri, 13 Dec 2024 09:00:10 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43cctcftvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 09:00:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDtz8ZMihpawcShNkHiveVd9a+F438SUUUNOh/kngQbn4Agcwl/EyjzVp9GGanLlZ4YmwJnfi1BUOdnw/O82kpjyxfP7rFIaNwTJ4WBHM+9sG4Pu4C5WnZbb5gnNXSsj+fpJ2vjQ29Df4DXZnJi5QmOMMv2k8YiF7y8WJ7DRyvgEtJM0HQIIIdJa/Chhz2VUp073uLLe+OwEm2pHavBpec/mh+jHhl5DngioXxE6J/730qPxoLqnW+s+xg7QnhMyP6WosnREERGw+mpzqvz0JkjwkU7mzY2UejN5g5I+nkr2iReKQrXjJhwQr8vief7XGv80iF2rolPZydfhmF4lag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMmWjr7UBg4pQA5c8Uk82OwgnFISVWuyqQJH3/esbh4=;
 b=hKQx4JGwWMeczGUrw+jORUk/bbz2n9krNtugS2GSEO0xMOhQudAxrV0i8F38rhVBzQz/up3XUDxHWBquPyswwCMtiqdl3zRTQnJHGC3LwdVYG8e9Bn2K/viXLSmiqQcN0SEA5a/7Xww7uyguVsM6XgMTfiI7uhk4gP4f92pVhwLclnxObqm1wUJRXUvaGtuVAr5pESXa/+a3vMtthOZYNZFnSldeKi+xGR4PUCJqVlGSasiiGBEzTvwGC2rCUq0r+cbM++Kypj/nB+7AYg9Xub8w1lxB6RV6iySNPo28U3W4TheS57wsDtKzdB9owoFa5cA/4wy4ix1/iAF0CU4fCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMmWjr7UBg4pQA5c8Uk82OwgnFISVWuyqQJH3/esbh4=;
 b=eCMxQ/htOyjMmG7D83qCx8JPgFvHT/+QB0IamZpa5Nu8622ZACs5Ike3rPKgnXkJ8KzFDDbMwd+XkKH1fTgsYPRWuLFBtsgU2ninUuEmAf9u1cwFxAqjIyJ+3XBvNonmpahmLiPFE54lSFNTpE8UsvDcFvfm/B6r9jpierYAp2o=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by MW4PR10MB6559.namprd10.prod.outlook.com (2603:10b6:303:228::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Fri, 13 Dec
 2024 09:00:01 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 09:00:01 +0000
Date: Fri, 13 Dec 2024 08:59:53 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Kalesh Singh <kaleshsingh@google.com>, vbabka@suse.cz,
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
Message-ID: <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
 <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local>
 <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
X-ClientProxiedBy: LO4P265CA0156.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::18) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
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
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|MW4PR10MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e224750-0921-4799-7b0d-08dd1b5486c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GAo00ggUoH68zGe1aXtgKBE5HpwmH9El8YtOGNOqQPpwe4dPDXWRVhtg1l9+?=
 =?us-ascii?Q?AyiG53b80R0BJu+7pTelqRZqg6+bBCf2QOafMPRPRiCtT1Ro9QosalvbD8Ri?=
 =?us-ascii?Q?vxbzZ7HODq+gn+j1TfY3BD5sIuZid4vj1+7UNQ3zeixL9sEiXFqjRpUqHLm7?=
 =?us-ascii?Q?WP3WkqpQZyj7HsjVXZQKeFWlq+1vnjFWDCRKjW+qWBaBKI1LbJ32TIOcZBtm?=
 =?us-ascii?Q?+je//1xtJTuFYWjfRoU+XCibSGanWepUP3AGspSA922aYaJVFelWej+QlUW7?=
 =?us-ascii?Q?YE+4Iri3jhQas9J8RHf+gLk533HVt+3Ebb78xYk+lZoqlRWUaSYLPuCcQ/uW?=
 =?us-ascii?Q?1SfG5BEu3oglmn/l0wVY9W/zZkefy8dRe6Tj/+hlKUU/auEolFc9mxOVpi4g?=
 =?us-ascii?Q?qhDYF3OAh9nEOZQ9UTdYCeotIRTFjlFhjwNk9VgGUWXrx/QIWHp5ljfCEckt?=
 =?us-ascii?Q?Wuj/rQXPan7qTavr57ctIylpCD4eIWTW3c4OCnDNvEr/H823kF21xKLM7vut?=
 =?us-ascii?Q?GeXAwSqXTmlX83uFr/+YS1XuYxWajWbw4YCfSnISAsFxmNOXMNkKD771QnGC?=
 =?us-ascii?Q?0qethwTAcLX8m/LrNCdBh36lvPq9bwobEnWWQSwWWFcEUFslQBTr3dTEA1tK?=
 =?us-ascii?Q?LI6VpKZUqLBkGJz9y05U+Vh6Nzf1dUujdN799aZ1hecDLDyuqhxmSpswNABp?=
 =?us-ascii?Q?Pv7gqBVF1EQF+JPCH4xK0qjk+s/kFLTd1dY0L++aOfQu7EgIV4HFNhQiYNpH?=
 =?us-ascii?Q?f9bN/zWgsSNJ2ZH5f07BYyPQjErNXXqF+TN6tk48vj042PM1AkK/SFcPjNmY?=
 =?us-ascii?Q?IxFMFpYVIkQj89mGXeyEkG7rwaPB5OykNQriqS2w2qRzVSD2ONwYlGyhq/6C?=
 =?us-ascii?Q?hk332UZA+ZH8cgNvEu5blxgEelmerFNQHEe0lErNZbWPewHMr2KsXIRwcy1o?=
 =?us-ascii?Q?anjGSyEgGeIW2Tm1dMvV7t/yk8DdxTAOa7bOUOOXiHSSCEYIv6aIs+cHJCJN?=
 =?us-ascii?Q?F3nNHUjH6xdjniGc7DXrawgi0VKEbLr1tZtWi7PSDtr91Z6qreshmrwMlkah?=
 =?us-ascii?Q?WkNP9oUOi263Hxu0ROVXWfzV144PEgLXrlbM5r/mTZUm0XXtWlbXryWpz78Y?=
 =?us-ascii?Q?kqSpsYZVo843iiP2y0WsVpJDD5FulU2Kiu6aiaay8mmV/QJXge9JBcJD5eGw?=
 =?us-ascii?Q?hFM5cebj5nfdgxseGxrXKWXOkzZk28d3RZ5Qj/dggZc7HKc0+A/krGCwaWq4?=
 =?us-ascii?Q?UArXn/Z1zRAM/R/NQlWYJ8HdEr5BDjvrHwBWpVi0/fpQz3Vzl0mOC2Io1H83?=
 =?us-ascii?Q?osUr+iNy3q8ZfOGFnvp8RJGfNIZOwkjy971AlYC+V6wP+g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7dYh9cMLE9TAe8UuOXWzGMSy8ZyWJ6kPsYtkGo11DKGA6igHVy9ea2ud1Oef?=
 =?us-ascii?Q?llUdu+XeHMhHHshbrB3PMFHMaSTvvT4udIAiGRkNxEra5enuSBxpavVQ31zf?=
 =?us-ascii?Q?M78XRxlr3RPZyupbIHrRg9m0uiTSdaZYOxg4aXVvOYebeZJzONSOq0XmG46j?=
 =?us-ascii?Q?QG66cBIzHC54TG3Tewmol3m0InFEIOxG4qVFa8EU9Z5b6t5+tHKxK4fbPtpp?=
 =?us-ascii?Q?bDEFvQoQodLHhXf+4wjtBry2e7RBXxYqTAlyj1cezbMnapumzaJXjyi1TS0s?=
 =?us-ascii?Q?/QkxU13qUGY0dnrSF4mFhPyXPNJ88cbGrlJ/pQ4Yi2h8xHznGm4uHphhHFwt?=
 =?us-ascii?Q?EKXQqClEQ4qE30D5DEBGYeZ794eiVRIeyrnxYVkWKAfrrZxYIn4t5T7B3vP6?=
 =?us-ascii?Q?jMEiNjWTDcnM87iizY8vVTbTHc0WcTKGC+e1Ek9nsMpVSmu6IA99JtPi53lb?=
 =?us-ascii?Q?3H+QYcz3Sxluozjjty5bG9A51O+0JPHLAlHi+sdPcGUUHOzuA8fA6mCE2aPO?=
 =?us-ascii?Q?hJjjcq2I5ZhfJe0wCQr18gYqHXrEBriB1knJU1QUa22t9U/THF2V4VcvnwN0?=
 =?us-ascii?Q?sgMTFDA0mLotG2JPj8iv/2vpr+DlQoFyDEx+Bju2MDitFjTlIUlgK4ewVpJZ?=
 =?us-ascii?Q?6qwP0TWbIn1kj5ij0vYjR0gONWoysQsih6bNaHgwPWUuh8tnV7efbG9RRmF/?=
 =?us-ascii?Q?4rXYVWAXmf8I2Rrzc76YR0doPMHH1+Uu3eyxmxLXUGxZ/lRERNS5Q1yESB5o?=
 =?us-ascii?Q?NhdEPxM36LpqCWHrKapA6YLvMUFeO805scNbvgYArv9718LpaUWodpGz5ke7?=
 =?us-ascii?Q?SXKlv2peY8/WEpNqXP35n/3NvrmmccJ3fxnAW9S9VNxF3PVNYdjD5TdbezqZ?=
 =?us-ascii?Q?xkg79IIQ8kisVErRGf12I1KHU0vT4OFBkjhmEwa0RjAG+4C51FNzKJOfJ+dh?=
 =?us-ascii?Q?kQTa1R5nLJMGo9dIEj9PQtvRkitoOWZeBuXRO+MO56U2lYCOjQu4wn93bI/4?=
 =?us-ascii?Q?NKIyDyd8VaJP2MZaucqXDqKcxq/3PlLfU6zu5Kw0jseVI1pDCDHm22jJZmY2?=
 =?us-ascii?Q?ylcKeLhJHuXjnaoGy3035XVrX3tgBmMez54lnGS1MHru0tT4YaOFW7N5yOXe?=
 =?us-ascii?Q?tjbleSy8JHHV2yDIC43pHgSOQTn/s4hUNtVVFENmKA+wX3gaG664QxIASDvM?=
 =?us-ascii?Q?jI26lMbDEvdGI9Ui8F1hUG5r2vWiHkEgsW4bpnD6UmDLFpmoFFntHuIqZnm6?=
 =?us-ascii?Q?Zoqq0ikt38onH2Hgk7OI3TNuQcfp/zUS1uJraDSXkxl1GK5Fw9vChA+K1iOH?=
 =?us-ascii?Q?afErV767C6fVBOYJwqTh+tDVLbArf4339cD++TLNeqdnhtMSW7a1Y569pHIF?=
 =?us-ascii?Q?qz5iNok0o7Z44ygQ7XaWsC+bNKGWh7CM+Cics00mxmJJQZtLR5YgRWZJc1b2?=
 =?us-ascii?Q?O9r/2o8TyCo5yQAOjulh8+bIZ4sDAEazyk2v7FR9TSz9NYrsS/46a+hFS2px?=
 =?us-ascii?Q?w8JDCAadQmBB23h7VS7TSvcVWP4idGpDIVCh/Ez517y0lg6Rc0OEQCZnyPCQ?=
 =?us-ascii?Q?f6Dtriti4N0eeh9KIwcONS0HUR6p/O1O2pJYkQyvlMCqVHyfNLIbJ37gU2qj?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MZuYPRS7qOuJ4H8xxVPsZVfJdculA4RY908QLDhoKJWORjHZTICv2u/r4cLLq06T3BN1T8FU/O7AsldCWiLSB54LUYASXAlint3U1s9yy6SpB4pvh3xH3sdjxrMbRiWJ+3fgUZnFkMkBgmTbsQqI53b9RSCO/YKbk2Q8hUzqkzZvXedj6dR2mE7dMwmvT8vQmbm6vZPozJggqro+cNGOvMinyrSO+7pHnjTIZEn5hxg4HOGkQdppoYfDa6hNfN0ozd4+AK1Y383JEFAYbRFvOmE3flz/RwsJjyxOb7kpfEQdD2rWuPw37ayqQHfH3Rp7Ns9C795n4a9dtgGoguHGVRFmN0ng/YVLHleRzwLgA+WbtOB8Q0akdHbbOQXw+F+0ha4lQyP7kRnxG3QslINNKOW1d112q4pXHANGoUXautwFuRyM/PIO1PP6hWgSJsaNi8ZadZ7t8bC1BpEj9cwyECOFVmN+MCrzt9zw8MvPkfqjGvRQKVzs1iZc3bDp7AJ+z0AgfAD6nbmwtmHBmRxfRuQ89XHtC/1neRPS30Uk7td+QaR3C6bEd9Y3Ofroc6EGXwWmjV2KTFKZCIFHy3y4qlpAvd0QrRdKDaNh3OBUj6w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e224750-0921-4799-7b0d-08dd1b5486c3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 09:00:01.1056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uszMKqVbgv6DsRdltl1BjI+K70mr/iXFpHj4WIwyan6bs4bR9ZRM+/DE0w0qN71+czaZLIM/yBgyFoHQEjcKHgl05GEV5jdHrepOXBGco4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6559
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-13_03,2024-12-12_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412130061
X-Proofpoint-GUID: -iyWgZSl288tpoKPOvJ26Tno9KRxujzM
X-Proofpoint-ORIG-GUID: -iyWgZSl288tpoKPOvJ26Tno9KRxujzM
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Dec 12, 2024 at 05:36:09PM -0800, Andrew Morton wrote:
> On Thu, 12 Dec 2024 22:51:34 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> > You've fundamentally violated kernel process and etiquette. I'd be more
> > forgiving, but this is at v2 and you've not cc'd KEY people. Twice. This is
> > totally unacceptable. See [0] if you are unsure of how to do so.
>
> This feels excessive to me.  linux-mm averages a mere 140 mesages/day
> and it seems reasonable to assume that key people are spending their 5
> minutes to scroll through the email subjects.

In practice we did all miss it, and I don't think it's unreasonable to ask
people to run get_maintainers.pl to avoid this.

In any case, I truly do think this series works better as RFC, I mean Liam
has already voiced the kind of disagreements I share with it, and we need
to rethink how to approach it in general.

So if this is simply sent as RFC with the correct cc's (and ideally with
some review feedback applied - a better cover letter, etc.) then it makes
everything easier.

As mentioned the timing is unfortunate here, this is a series we really
want to make sure is properly reviewed before any chance of merge so again
this points to RFC being the way forward.

