Return-Path: <linuxppc-dev+bounces-4066-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 588D99EFEDA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 22:54:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8R8L6d3Jz2ypD;
	Fri, 13 Dec 2024 08:54:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734040482;
	cv=pass; b=WaXoA6HGK1ejwkzd0Uhx0mSV/LCmv7RpwRx6pjl11M8avk7FeIQYyZEozZgGNY+wQfkq5sLR+JXWyVJ4EgZcw4Dxjg1yFGp1Oh2+ZQP7wQzKl+A/u+mV0Fc+eVdQzWZWWLXDofRB/a7fn5Fh7JYRb8e/Y8EqlHmp0jj+d0GwTojHZp+zugd4r7hRzRKwkW4IlWjwDmJNIhvwKE0RDAEZzSgb3h/z4AsJTwqH9cAFKhXuGq0n0ZzoT18zwGtToAEUzrO9AZErxRAwrvG0Fnl1JPDTTX9g9+71YeT9yT+Ljb/LmzZ8drpKt1aReNuH9WOkssZ3ayuL2rdeskQGSrS4oA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734040482; c=relaxed/relaxed;
	bh=m6MKqs5rrzJWgKSrA2DeR26tpmlUEe25t/WAjMJSAFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WP6UbOwulAo1Lmn5Ya5+hEdlPALvc8J3vzPLhgWi6ZpElPYhZ9AWpX5vb62N/QGwUcJ1AeRT5PcODQIOeVBfGuJFW+r0avHuOUbG3iyLKeEG18z1Xvvwo7Z7F/oWvpKQEh/cc2O9yr8Ki3TNxbH5Rn3d7Irc2LNAgm2/lMqLRAyHs6xnFDFwsvuZovl45gCx0Sh/Q/HBaaraaHK7ll34nOVlRH9C9ZMCVBTCcCd5gIocnltJvxOsw6A7D4s1g713LAMNu1UmIflxNbMvzsRhwoFMpGJDPgKu1/i4RGZBvapDUZakKPwFZTSREF6haDwFr9cOOemXXI2PyK9FiPn94w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=oWNLKK6P; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=DObPxQoG; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=oWNLKK6P;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=DObPxQoG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8R8K5rM5z2yn2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 08:54:40 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCJfrAb007100;
	Thu, 12 Dec 2024 21:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=m6MKqs5rrzJWgKSrA2
	DeR26tpmlUEe25t/WAjMJSAFs=; b=oWNLKK6PyyNI6+np84Xj83CGg8PNCv4RGS
	u4XdavDA2jvR0V5zEIzZfX0xK6ysj9kRLmc36xpZccD//j1Tn23FFax6Tq/WO4BP
	jXvoJ4TuBwGM2amj/+l4MkbBcat4/rnqLdUOAAJyHiMExqgkV/jzPSd+awxMNxZu
	du6pnXcOc4NGf8bjuJJht2nyny8h4F2etFVkJhezo+MclojAzaGCgtFTfjrKQO0m
	4BUlqTbInhvWI3DNCLxVUd9hb0cCzAyR5V54Rz/hGbBw/BqWPJ5YA1BE2fGZW6Um
	JsRYjlzrpwNxfuxcfckXDL2lM1JA6UXjGB85wZrlQJ3dJtEJJh4Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43dx5s990n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 21:02:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCJc4BO035550;
	Thu, 12 Dec 2024 21:02:42 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43cctbya01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 21:02:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPQdmtfAxkGM3GM9NhnuDTV/I8Lb9FvKRynSJnTnVKrTASVenUWV1e49QJBJmXvP8/RxEDJqf6CUafikK6ltq1ccuy85drPwPjxqxRVaGidkZuX2FGTQqOPN9kETVsD1if11FhuVL8Bp5FUjwGLGTCioJlZ4j4lzLePN+XKuu9d1B16tkY2LIkYxU6GXngTSsLuQu3h6PaP63hJCs/+Vt3TfUJ+PTTR/DCEyXv3yti/YwuAr/89MrJaaVELrmHIWCR/qbfl0l2IE3wvwKS2oy8fZk5TtziC4tJwqpx/vz5Tfx+HMffPf5pTW3Xwcrn5TdiKRAl8/h5x7MR1vPEwkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6MKqs5rrzJWgKSrA2DeR26tpmlUEe25t/WAjMJSAFs=;
 b=h5//NNyr53GWaV46ejlgd2xWoiy0VNtMkgvHG7XGnqcO2TgDzh9kI1YD8k2u+3fweDTr348dJMnmOrz/5jMSjLybsc5Ox1w0L8wQTehct8v/89jjh0DoAYYRUTFvcYoIx+EpsaSfms8igZQjncROPx9Z+OEIYIOvhmi146X2Uks8Fi7r0HGBzgc8OKYIZSSCgcnaWHh1tyHGSnxgvl42GvlK2MB7doBSdadowC94C2Rc+/I3yVIuiEwrTM75/bOrQZsZhl9FVVonWHS1vb7JzxAQcv+g5yqF9nzYwiNwe6OmBXQHpTRoN8T2+v4QKPYnY/UbQsHX1hEBPkBc41MbSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6MKqs5rrzJWgKSrA2DeR26tpmlUEe25t/WAjMJSAFs=;
 b=DObPxQoGj7SPnQJYiCRjbesvfMiLBh7gOsC5g/QQolW5kLrsCvzwS0lA18z7NlMBmQIzwVi7dfFeAJFVKyp14jXADuT5LGS5/xtaIPLgMx5+OOIYw/Pwu04hf6hW6G3PclWGoEQSHxhsu5NTrLbjE7m7HciSSoxgYLDKws2/W00=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by BLAPR10MB5106.namprd10.prod.outlook.com (2603:10b6:208:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 21:02:37 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%5]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 21:02:37 +0000
Date: Thu, 12 Dec 2024 16:02:31 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
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
        kernel-team@android.com, android-mm@google.com
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
Message-ID: <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Kalesh Singh <kaleshsingh@google.com>, akpm@linux-foundation.org, lorenzo.stoakes@oracle.com, 
	vbabka@suse.cz, yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com, 
	minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com, 
	bhelgaas@google.com, jason.andryuk@amd.com, leitao@debian.org, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-mm@kvack.org, kernel-team@android.com, android-mm@google.com
References: <20241211232754.1583023-1-kaleshsingh@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0294.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::18) To PH0PR10MB5777.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|BLAPR10MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: cb00aea4-60b8-46a7-792c-08dd1af04e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?56t+Xp+A/iomCGa/QLPNHu0DxRYs8qruRy01pVOt8tYHXIb7kLBr5tbsG3Z3?=
 =?us-ascii?Q?u/E8N2AMtdLwnDbMrWo3hK7cqSIcBipP3I1ok3LK9NsheGOg9Xh5NpHHVfQ3?=
 =?us-ascii?Q?knTPwx+DOjg0nW0Bm2T0mF5vpuKtZuwbpTOCnjVZT39DFJ9r/YMBzNn7/Bpr?=
 =?us-ascii?Q?s5CGo5w/P4jH+rsKSLQKDkPVsNgsKiZ0+CfOZt3txDtEakPf71BtsFF+1rbv?=
 =?us-ascii?Q?X6MgCm1U2EvIWQ3K0ejvJe0Mf+rciTk0pT6B2xuRy+c7SS6wUZfVd5+go0T9?=
 =?us-ascii?Q?oGWyL4qQqrmaxPqWwy2sdEacJMSOoJ6FqH/nr5kBpHGTyChCW0NehTKmpDfH?=
 =?us-ascii?Q?RJBxq0EIBRzCE6WGS87JBkjs6Yak3VJ+a4ohNsMKi4hLdHwvBcsGscgT5GSV?=
 =?us-ascii?Q?vvCBRt1tVyWGrEOERJv/+wjGyX8UIMG+REl764sstIbpKYGeskMu0ldxINMT?=
 =?us-ascii?Q?jBXoyly7yNMx9PgeJWAzt6tZQGH13IA6+gzW5JDSijdckHoX9URaJTfM3qmA?=
 =?us-ascii?Q?yMUPMdY6U0jNfTOOg/sw4sn0eEf9HgDsoXVkww2xF39OFxL8BC1uCWRYQAPL?=
 =?us-ascii?Q?4XwuzFKnYKkK91KuTMV4/gViroEjvoClhtGdSwuuIwy6bo4Nw6Mhx2IjS+fq?=
 =?us-ascii?Q?BQXSMtbPITcnMtNRUQjMHaNJGrIGDUwmeSZ3stlh/pwLkiZptpWgFpoZrurp?=
 =?us-ascii?Q?wxQ0/m5kTRdeZy1NxYTb2xGkXDNnwDED2rjq52gw6TMLdls/yl2iSfIM9r/4?=
 =?us-ascii?Q?qpgmjJx7+g6A4LG7jkx0pjeZGYARMn2ps33ACqVH413t81w+trYH6fzPkEsS?=
 =?us-ascii?Q?AqkMhx7efFhyYqDGnaOsFzRC8rlNFtkCrcF9bv5t+GdsezWEjo55UctXRzD1?=
 =?us-ascii?Q?HUZPOulWRCazSIinbn8VVQkz9LOXEvMWz+cbvqcnMUP/bLq9ILh9wHC02mkV?=
 =?us-ascii?Q?RqVPhbN4kJwFhS3SYSRs4NPCqRvFzG0Tbv1cNcxWQxTcGW/dt9X8MBZmHvsa?=
 =?us-ascii?Q?2ZqUKgTqmvhoiUaYwVlmfaEVG6iLSAOadZw//J7WsSqEHWxKKfdnGNvV5jl3?=
 =?us-ascii?Q?w0VNQyagP5l9hzT/WdXIwRmA5tS94A5j9o3ZInmz76S0y9H3VFepiiGP+K4B?=
 =?us-ascii?Q?7H4Bmc75Z8OiRCcXWh5ABhYFyB5FYPMHjOKYFp1V9bBWLNiajTB3s+aPgMqm?=
 =?us-ascii?Q?ycDRn9OZjTMnRrJLB0nkx6EHYUdki/SDc7picYNGXIeshtgIfkpeiTjsAnTz?=
 =?us-ascii?Q?O1GKiwTgfoGURbRRHNFYSYI/7kXYxmzEAEeXzfg+JaDAsa1t8xuLkBKs8myi?=
 =?us-ascii?Q?iKBcUBQRIagdUE9c5o1/Cufq0s+AtPjK2BcyOJWC3DRsSK3X4pkIAS8K1Rln?=
 =?us-ascii?Q?JkyLqvA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XKcnLYewjVrMOx0TeBkBvEcoVyAxpjHggFE15M1yQR/CCOLGxXYpPS4UAqqu?=
 =?us-ascii?Q?2nU2/E8m6hsavOmA80lS5nr/Xbz1JXRMuC1urwYjDvAE9GFKeYuIcgwERh9a?=
 =?us-ascii?Q?yxEkwf6CZWvTj+tqKfI1rFzjq6F+RIbyyxRbs8uciGnEZpgOf1hqziCh9hmo?=
 =?us-ascii?Q?RMfCEh3tNavxQAilcDuaGmhcEZcgP3PzuaomSWcW3qLBJ77cwteZ/lZAFATI?=
 =?us-ascii?Q?WFW9EC7TR1red14DBMGDlQK6RTyM4WO7EHsQ826aOyNJSgHov2r/LbNA+bC3?=
 =?us-ascii?Q?a4y7Alt/sRDSvaeb3E27vNNyxilCONG97oljU83ZOrny1WVrN/7pxsnrDrsN?=
 =?us-ascii?Q?0LZ7+M7bR+SabxrisXyLHCvLZYfHIDF7OCpPkB36O3XK2TFrw01zc1w8xS42?=
 =?us-ascii?Q?/BPdAlsci5emx0lVDkMO88/uEj65YiQshDYYfvwk9Fag+8oNlGLq0Csej2Fn?=
 =?us-ascii?Q?tGEhG9S05o+gT/MIt4TU465HTvwwKzTPiwmSZUdVTbgWg6dFGofXEJqaKrFE?=
 =?us-ascii?Q?TEnTKO4tTPAAZTnmJz5iS3am9Rd37lpS8g2PSpYZqwyPGRcP00KIbyfUQ8/1?=
 =?us-ascii?Q?+p1fJBTWLJS4qEORxZ7OtVJEoY0u+QZRjLpL7YAo7qIU27xb1FiW6YVvHTGu?=
 =?us-ascii?Q?+uLO3Qq6AHyNUMrzZbAyzODUXTkgczDuY0O4eGcO4fJHGxBtoYy+GORSsr7b?=
 =?us-ascii?Q?28gE7ry1cFgT9MqFoI3aZrMRK6owFNOuXlglodydItc093UNFrtasixYX4FG?=
 =?us-ascii?Q?iqpFT2XN7hjo+AYw3p7GI7kwPcU7oGTTB3ELFiIG/nOiweN0EhcYB85ivVEC?=
 =?us-ascii?Q?Xbbl7BJ0DEE4XZgYQkcsUE7ZJXjXihZQ4nj9s050Q9cW/1tNYxLtOXSTgv9P?=
 =?us-ascii?Q?KBZAm58drzjPKwF+/0OqjZIWJBpx/dAFcW4Bqc7i8+p46R0v/rR0ZdDKF58d?=
 =?us-ascii?Q?4omex2jqYe4cQTdz4CcH3mpgc+x0mcgLR18VcNvshnl/5FcupTco0fc70v/L?=
 =?us-ascii?Q?6UD0hYrbExz8N9s+1nNBcaig+IXF4/Q3dL87ALR+eojKM8oLUo62wuuSJ4Jn?=
 =?us-ascii?Q?tfcIHmMDO2PuXuDvfNU6AZqlxCRjmMlE3qdMzy3IeT9VDLzX+T04QlS7q1zz?=
 =?us-ascii?Q?qZMWQAB2QbYEmrx0SQVlHfH9Bfpp/LmAqYv5VU0+EfVC/rvRlpCOFXSzesNK?=
 =?us-ascii?Q?owRo7VEVKNAzV8g7RCroJlAUI18oK+vW/19BGwA2QTOoHLvH5biaJL6hLHBs?=
 =?us-ascii?Q?leW9fx6u42FnDVrlF565cjzghQ3nTmzsjkFdZiwSc+izOYS4Vsv6fjhogBgY?=
 =?us-ascii?Q?XeT+BD+YxbKhf3utvxiXxSGnhRUdkj3eluTN6wi5yCfZPLhk2iavOurC5fzk?=
 =?us-ascii?Q?Udm7S5hyRTSFryO1qTb0yaqYEr4YdtzUIgxQ0w0JiDKX0W0h5dl25rQ3ZQ26?=
 =?us-ascii?Q?JNFYswq2jNMe2O2vKo3ngxH16MAaKgioN7OmyB6pBDseMiuREUuWXm/IOK9U?=
 =?us-ascii?Q?7CeSRIr/Aa6SENnqpNZHBJ0AVM+qN6k3/5ono7l3GkJFrlqUaqJOwprPtkvF?=
 =?us-ascii?Q?EIrH6CT2JyvXOWh9/Zk7iPIKgmyZHZccGSG5upfP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3uWLkehoOZnMWSM5ao73pj7Ham1diIfS4HmfeUUVoLVwcEAKoWqqD1tdTyFrOIbdcwhI5XwYIW/KLnG/PjLF/WtTiIZpooUXX3/rEWKdIhlR/A1XEDgFLvm2Kmgh8dHNhA9QDLFGPP3zY4OpEWX17pIxQKf5Tvca4HwTkMlaUK77la3Y//+eJMkiXijhhvUhsnx2GenaGN8usUqsmMKQx6gpOISZ5SrxAJfH4VitTFOIkrOdDHdhYprZoUSiFxi7zxEc+UwvshtfYjSRhAm2TBZeUAhJ2pA1pZ3+KRPmnCU1sCTfEeqtJKN/9CE8Ah88Pjy7mD+8UkG7e1o9AhWCy4CR69lW687vl2Bg/ys+qbM0JWIO4MgGuvAZVOJ+RPP5Vxa8mpuAlXU5dBHXRGf5lpC7pNhfrMOXJCsEFmW2q9O3NsagUtn5/8mzWK2DXXl21wAUKm7f7YqY9Hf0KzSMgrbymHXo+lF9DuipFcqFA0wvO/wBlcs1w1NaRB78p1awyOcmBnxDP+R29hYHNjjsnVTjjm6tJh/L5MdSKdI84ypiTZDMcCx1hPM4SyGte55uQBFao0tk7l2ZDGMhQndKh3TAICuJgNnWimrpFL4ufG4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb00aea4-60b8-46a7-792c-08dd1af04e78
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 21:02:36.9589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZB1jB/PIIC7F2bwxwV5ZcjX4abd5y/eefhO8XAxlSKDk1Oj/7P+cTCN0hnEXm8cl1f9ZQYTtZ9eKa6+sRfQgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5106
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_10,2024-12-12_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=907 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412120152
X-Proofpoint-ORIG-GUID: gtGAtCCYBbX0NRhOKROQCKP-GJpecH8h
X-Proofpoint-GUID: gtGAtCCYBbX0NRhOKROQCKP-GJpecH8h
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


+ Lorenzo

Can you please Cc the people listed in the maintainers on the files you
are submitting against?  You seemed to Cc everyone but the mmap.c file
maintainers?


* Kalesh Singh <kaleshsingh@google.com> [241211 18:28]:
> Hi all,
> 
> This is v2 othe the arch_mmap_hint() series.
> 
> Changes in v2:
>   - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
>     special case of the hint addr being "enforced", per Yang Shi.
>   - Consolidate most of the error handling in arch_mmap_hint().
>   - Patch 16 ("mm: Fallback to generic_mmap_hint()") was folded into
>     Patch 2 ("mm: x86: Introduce arch_mmap_hint()")
> 
> v1: https://lore.kernel.org/r/20241210024119.2488608-1-kaleshsingh@google.com/
> 
> =======
> 
> This series introduces arch_mmap_hint() to handle allocating VA space
> for the hint address.

Why?  Could we get more details in your cover letter please?  This
entire email has as much detail as the subject line.

I don't want more arch_ anything.  If we can do this in a more generic
way, then we should.

> 
> Patches 1-16 introduce this new helper and Patch 17 uses it to fix the
> issue of mmap hint being ignored in some cases due to THP alignment [1]
> 
> [1] https://lore.kernel.org/r/20241118214650.3667577-1-kaleshsingh@google.com/
> 
> Thanks,
> Kalesh
> 
> 
> Kalesh Singh (16):
>   mm: Introduce generic_mmap_hint()
>   mm: x86: Introduce arch_mmap_hint()
>   mm: arm: Introduce arch_mmap_hint()
>   mm: alpha: Introduce arch_mmap_hint()
>   mm: arc: Use generic_mmap_hint()
>   mm: csky: Introduce arch_mmap_hint()
>   mm: loongarch: Introduce arch_mmap_hint()
>   mm: mips: Introduce arch_align_mmap_hint()
>   mm: parisc: Introduce arch_align_mmap_hint()
>   mm: s390: Use generic_mmap_hint()
>   mm: sh: Introduce arch_mmap_hint()
>   mm: sparc32: Introduce arch_mmap_hint()
>   mm: sparc64: Introduce arch_mmap_hint()
>   mm: xtensa: Introduce arch_mmap_hint()
>   mm: powerpc: Introduce arch_mmap_hint()
>   mm: Respect mmap hint before THP alignment if allocation is possible
> 
>  arch/alpha/include/asm/pgtable.h           |   1 +
>  arch/alpha/kernel/osf_sys.c                |  31 +++---
>  arch/arc/include/asm/pgtable.h             |   1 +
>  arch/arc/mm/mmap.c                         |  43 +++++----
>  arch/arm/include/asm/pgtable.h             |   1 +
>  arch/arm/mm/mmap.c                         | 107 +++++++++------------
>  arch/csky/abiv1/inc/abi/pgtable-bits.h     |   1 +
>  arch/csky/abiv1/mmap.c                     |  68 +++++++------
>  arch/loongarch/include/asm/pgtable.h       |   1 +
>  arch/loongarch/mm/mmap.c                   |  49 +++++-----
>  arch/mips/include/asm/pgtable.h            |   1 +
>  arch/mips/mm/mmap.c                        |  50 +++++-----
>  arch/parisc/include/asm/pgtable.h          |   1 +
>  arch/parisc/kernel/sys_parisc.c            |  53 +++++-----
>  arch/powerpc/include/asm/book3s/64/slice.h |   1 +
>  arch/powerpc/mm/book3s64/slice.c           |  31 ++++++
>  arch/s390/include/asm/pgtable.h            |   1 +
>  arch/s390/mm/mmap.c                        |  51 +++++-----
>  arch/sh/include/asm/pgtable.h              |   1 +
>  arch/sh/mm/mmap.c                          |  83 ++++++----------
>  arch/sparc/include/asm/pgtable_32.h        |   1 +
>  arch/sparc/include/asm/pgtable_64.h        |   1 +
>  arch/sparc/kernel/sys_sparc_32.c           |  33 ++++---
>  arch/sparc/kernel/sys_sparc_64.c           |  96 +++++++-----------
>  arch/x86/include/asm/pgtable_64.h          |   1 +
>  arch/x86/kernel/sys_x86_64.c               |  64 ++++++------
>  arch/xtensa/kernel/syscall.c               |  31 ++++--
>  include/linux/sched/mm.h                   |   9 ++
>  mm/huge_memory.c                           |  17 ++--
>  mm/mmap.c                                  |  86 +++++++++++------
>  30 files changed, 491 insertions(+), 424 deletions(-)
> 
> -- 
> 2.47.0.338.g60cca15819-goog
> 
> 

