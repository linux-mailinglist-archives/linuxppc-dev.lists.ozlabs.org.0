Return-Path: <linuxppc-dev+bounces-4064-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F949EFE86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 22:41:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8Qrt2yY3z2yQJ;
	Fri, 13 Dec 2024 08:41:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734039678;
	cv=pass; b=e4JGAfuwzO8TOMVAGjoS8OS2j4P2PI1CBraKdehuNkndiz4qruv2kxQQoSqDCHii5mGXm1KEDhfOWkNl7E+Vot3oK7OZ+a+1ieu4/58Ckk1jn0RSa5MJ8seQ19ZWVJA/ulSzyESVCyd2fMSBPBCYQQDeKaCK0vVhHp8o1p/ZbNJYXKL5/UelX/HDeklQV4Y8f2VBxHO5MnoQ9xt3GphzJzbiOFGOwUfrYB/u6fwCLxUw9HT0J2wD+8GFmI8Aw12+1KFV06rBP581knzA442kbKVndeVGlljSFdidRW3MijKCjGTo93KCoqO2d4GwVMG+j5z/ryKeysfq9R+i0byzow==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734039678; c=relaxed/relaxed;
	bh=I8pZ1JaBWIgkIwHS2ZRzp2tUGPhkxNsRanqSM8h64iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Awa9GCGz/HDIaaAHDlT82PjXxt51krxGy/lyUyb68/wqgJi7mf3jVJxuxfyDSUXbQ8CXL3lfkgwlV5U+JKr8rp6+s40xIDiP1RiEH7PG5loAGJHH2WvRJlqHBSUmW+14nw7n0UetTwrcZ3wD2JkNT9WAPKyC6t7ADfLDmudlCVUc8LyNWrnAmu+RxGJcUz8OPZiF2GIjdlwKE2TGNZJOzxGBfow7zIPFi3DXarcs0IjC/Z32qNHe8b/XjvoB5zuCleCWSG6UBOOSVOXw9ZB6jky2HrnqbysQrXVb34BLI7E5gb2v+0t/V1eNH10fGtdi32LwkFtu1u+bCoBskGaAXg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=WoDI+U/s; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HGiLD/Es; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=WoDI+U/s;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=HGiLD/Es;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2216 seconds by postgrey-1.37 at boromir; Fri, 13 Dec 2024 08:41:15 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8Qrq68rjz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 08:41:14 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCJfqPn029722;
	Thu, 12 Dec 2024 21:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=I8pZ1JaBWIgkIwHS2Z
	Rzp2tUGPhkxNsRanqSM8h64iQ=; b=WoDI+U/skcbP4qpzU4/ao13RrCIm7gVMQr
	7JUjuiTMq+RJs8uV1BK0xaTYAElTJ33DqK4yjV1r+eYagr3+hDltz468JEYRNcZv
	AFGZCu5RK78LJZeZJo/+nFQqF5EuAjpVcvfvZKcqCpKoQounuQHr1pFAJmye6q65
	Yahxl4mIlBOgz6/rBOrUCctWavxR5TxiTNGs5as2ifQKkSwDwzGNvOHs2Cvbcn6R
	WZnvFwZ/J3EYjvdGjLOaX+APWMbjkKbFF1iMv13PuAyDDXx6v/OnrmzuFwe7KQvY
	hDWcFOJSKYqWHdFpBLjJljwwLxFqHjOSCS8PozpNooHdHuA0AiNQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43cdyt43yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 21:40:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCLWAdP008669;
	Thu, 12 Dec 2024 21:40:27 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43cctbr061-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 21:40:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rky68pa4PTGXTAkP5KpuOpdZutf3I+ZTpPGatlTW9cjCaCM8Ini25VzX9ZwUKHwoyWTz9BX3R0ZkmAehCobkMkzxNR2UbHxWfbc49wDNsOpavLoay06ot/M++sbyABOOsbD7+hP/lsKyT/A+OHTT/Y3647abI3VGF+6YGv3aFWjliGCePBPdxo8ifOmYJtKTwh0l97MeucczkiuImWRHbOhET2V5Lv9SLtfjqaqC0U2YhXdMDaqwIlC/alOPRDxZZthcUtT+xwWBAbklvIzY7ZQKamiHya61uVkRtCjPs71FyS32xr6oUr68wd+BEyrya/NFnL+8DBqI3Ydj67xZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8pZ1JaBWIgkIwHS2ZRzp2tUGPhkxNsRanqSM8h64iQ=;
 b=JpnZmQLk/V+X1VLO/+qXXwX2sA6dfY4Lb8VF98Jo4nV5eHEgXscS1rDVbPMAZz0vC3PdQpBdeGdIn9OnDQe2avPd2ev8UM92G+6KBjJ8LDcKFrauAUB96FYf8VyZMiqN3Nzbla1AQJtJ9Y6Ga4uVAbK8kZgXmLJ4+aOy7Vw2sJZHdiPcV7MiiB4KOna3WX5WIfusBFZbNDHVSdSSrpDNHbYyAtdvsX+YUrc4eh81Cl6iOk/dXv55F2Wc9Xr3GwPJLEtaQgECPdkfSifwLuLYvxwxK6wP1NitYi2ty4vAeJqn/f5pv05FEAA3NfjgtNgvwkINGm52ylJ0sMIX0c3uOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8pZ1JaBWIgkIwHS2ZRzp2tUGPhkxNsRanqSM8h64iQ=;
 b=HGiLD/EscBeXPdSIXDJqx1LZkNKJSF2G3Js+e0Qco2WBPiEVtZGJbpfe6tzuqugU6FjVv2eezNEtENWxMs4jYbQyggYqJgjoehNRhaOqZRy/cpPCnL8/N96LtrPD31qweLOMNoJODtJCB/pLLqc/FhuPVPG//uHKWHwYl+lAE6c=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CH2PR10MB4168.namprd10.prod.outlook.com (2603:10b6:610:79::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Thu, 12 Dec
 2024 21:40:24 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%5]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 21:40:23 +0000
Date: Thu, 12 Dec 2024 16:40:10 -0500
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
Subject: Re: [PATCH mm-unstable v2 06/16] mm: csky: Introduce arch_mmap_hint()
Message-ID: <vc2uhcysgosapznbuookcj5677w43a4kzxbotwqub237ccawww@i3pbqiacdwsx>
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
 <20241211232754.1583023-7-kaleshsingh@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211232754.1583023-7-kaleshsingh@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT2PR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::19) To PH0PR10MB5777.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CH2PR10MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: e766e213-f8b6-498a-2185-08dd1af595ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TjWMB7AaAjJFk/oNWOkGOmmvhIoahVRcvFrC74+wZ24li7Dlcg/VBNXKaPBL?=
 =?us-ascii?Q?nuXLBwYM8W4JXsTCklspUH5g5z4WpcCJpXERYrFeN1YnMLkhZ3lSJfLWqZ5e?=
 =?us-ascii?Q?WycXYKSk9sNSxNHGxqLcBDnCljjbQxebaurKg0JnusB5qihXHOCPVsmnNgZ8?=
 =?us-ascii?Q?5HuZSea4Diam4Dtu2ov8tkX1wOzrzWz6pO0sKfJ6qFnJ5AWa2M+wi5G6IOb9?=
 =?us-ascii?Q?q0ve/+0zhD0+7ZTCq7+eUszKCPNHIQ7xLA18KwkBzZUP1p+0ZUU3ThhS0rKR?=
 =?us-ascii?Q?y1j3N9AtcKN08YA9DsMq7GqL4w7HWMFy+yStLwVJY54p/HFnCsQonY5gGjbg?=
 =?us-ascii?Q?o/BEf2/Q4RKcj2n+fpAQ48gJZ511U1Xwadj4DUwhtUyFumoHlX5FZEDzcr6y?=
 =?us-ascii?Q?ZlYcb9HFWrxVZrJk/RnfqN1S0Co3Dfzf17E2mf+0TD2f3K9x9IVHqSjkTesP?=
 =?us-ascii?Q?yCY+j00AgCX3R+01axT2+fTkg8U+sxCaKZ0tgQTpIzZwU5n3r+yl+JRP8bfh?=
 =?us-ascii?Q?NdMxMexKz4t8z7mfwypGQRX+kNkkQ2zP9vHifwIUVDHRVh+fPrdXIi+GxRsQ?=
 =?us-ascii?Q?8ov8CDSrTW4zGReD/xkrci/HfOSZFmoIS9JBDgxI0/1NdSodFCdBKSfjnWVF?=
 =?us-ascii?Q?jKcluWCBqaDvXucPh4Ex5wjI4SYVPZdtpLaJUYxJfOJfyi33lycmhf4px7Ej?=
 =?us-ascii?Q?YWrgpL11tkxFM/i2oUlIeVXCdsvwmrC5GnPrq3xDggSyUheSW9Qf/F8porAP?=
 =?us-ascii?Q?DPgoGZzB2Dw5Gt5Fzv+jbaL3GfY2ivRzhiFOe7x5YB+lNv44IVxtxZOdQ0bc?=
 =?us-ascii?Q?wkCp0tooGj1OA2XCulV+8zyW2dVwEOV3WdZqwCoSLCqBN2Men3ImQWBrHonU?=
 =?us-ascii?Q?cRTERP2BdxSAABDzhTzHp7oIcXA2a1iTzl5tLmR2chVG0Vyp3HINQ6Bj4EEf?=
 =?us-ascii?Q?o/wVxJr25E7mJVpuP0CoZCWnKaAq71yhIL/NEFfznXBSHMUnQqyUhgm4JmJm?=
 =?us-ascii?Q?QOxKQ7B3s+hMLkG6pi/Y5OinaRfuQObMPlouV4Xrj3xC/VCliYW3bd65p+Z+?=
 =?us-ascii?Q?eNmryluIRSYWV/YLrL4pMTkvFxEXuIhsgy+Fr7FTYH5ft2GwHiiQA6jiifnQ?=
 =?us-ascii?Q?Tww7cl+WxZo4WbwUAHscXXMOXQGnTT+933JsGT9F42zo0a/N8Loifoh4QF52?=
 =?us-ascii?Q?f2By4oKnLXeKlAHBAfaKQzkSaniJN+Yyn61gAP8F9rKrcJORMtDGKZrsUELO?=
 =?us-ascii?Q?RYONHalz11C33K0pDAfUpCXWdW5UASDhVX/SPbqjPAQpQ+uqMQlRXfaGpASx?=
 =?us-ascii?Q?P/ANpw4OdWUkADFJ1t6vqRH8pEPalGi/fHHIjKrYFhqYvg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y2nTBwL0StnUr0Q1ndUPnN7GO1Qf0t7eNaLb5HBNF+oC8GFY8x8X7LqdKJsw?=
 =?us-ascii?Q?AD1VScRAns7zJVpqEWT277MhMgv31iGaCxgg/q/6c8jO0ERxOs3mOwjjT1Hq?=
 =?us-ascii?Q?vgR85OZlAtrK3EGVEuXGcd21fYqKA+6BKWgPZOgbPiJwddqzkcswOR62ahmP?=
 =?us-ascii?Q?hnCMHWYpfz3MzAtN04fCUpCnj6Jbh85KCPDnshaB2AiV0FdEzsgP8txxf5Rd?=
 =?us-ascii?Q?TLQt5qlNR3c6ARafer96UcS4pVlzErTGafWg4/tN5724DhGlBVhCo3LXbN34?=
 =?us-ascii?Q?aWHXjZTkArGYRFtNSTLdIme0vcWJjK/ff9eJul6V3K0at7JoUKCo8Y5gbvoJ?=
 =?us-ascii?Q?bGn70S2+fW6bF7x54p5RPxO0jno3XD37ZGEnHS7NGKtw9+NqRFnafyGK2EDy?=
 =?us-ascii?Q?/CJ3Kemh8PhL9kkGQV9TL7H7UoLD0QoyJM7CYUbipDwDTMn+UcuWyF+w70OL?=
 =?us-ascii?Q?Q65rLGgq5WbLdBoVgc0VN8sbKTKYJgdNgQ6vIrK3nWmHkEClhevcE2pZlBUL?=
 =?us-ascii?Q?Pkf/s1XjURFcWGNbA3Em1YH1/IzAbRnaNwI0OIBro+iKlMiok70RT2i1WRWI?=
 =?us-ascii?Q?jbhH+GSalIog3KwhxrtjZCfMKk+3yGBmxRDuMHVNzMszL00mH13Gq+o5/mPO?=
 =?us-ascii?Q?lhH57wkymlwU7vxK14tN/a9vvVlF8cOUM8f+ryR5kF9n9iZcqX6fagSWn4tS?=
 =?us-ascii?Q?4KVv9ARmQnqFgpXkZxguFWAjwUZ95gi2KdBiHfv0zpPrx0omacAugtcM+iMG?=
 =?us-ascii?Q?EAI82ofjhxh4ZlW0+aG5PU5ulWuX/Oo3oVS1Y2U9rYkjXbkhgcFFOTUvEhm6?=
 =?us-ascii?Q?+C4RFmTnN+PxOxlTdR9pfYfvJCb9PuZmsb1Qo/NubLWLFIAuNuwOIlYiWQV3?=
 =?us-ascii?Q?F8VUN6VnaM6VA0hcQqZ7q0Pb+B0GMP172reAVc8LycbGzRr51QfyzODiaQnk?=
 =?us-ascii?Q?cHtM8zGisiUOJ9wLAXfiVNrH5IjMcdI+iCjz6Aw2ZvRxfzO/aNd1cSGPdEIf?=
 =?us-ascii?Q?wnaxuEYLU0WtR5snCU1f3k2nC5vhzoa4tWg3Mz0ZeU9p2vkoMcI77tfx6eFS?=
 =?us-ascii?Q?9SaAhhG41PbOGgA2GFxQe+fJtYDSunGBRiuFsLzvlsaMx6WdfPiuVaVQdP+Z?=
 =?us-ascii?Q?ZEEQJochk2WI66WgfHaQRsVg904Kh/nbBLKdRmH0hpwdvol2/MMbfkSY1QFo?=
 =?us-ascii?Q?pkCsB8AvSpWmIx7g8MHSJeckSyj31ygWQD7aQKeVXVBtOLx5M+YdS2Mc6Idd?=
 =?us-ascii?Q?yaPyi9gpJ3kFf4kwJHl1Kz81BzHPEipwKyQLCetERMOQjEbrD4OrgqTjrGNo?=
 =?us-ascii?Q?jpFNKwfT1KYl6vyQhn+nog++GB+vrQSjrFLJ4hW5+mXZ9jgC+qZ0uFOi0RvM?=
 =?us-ascii?Q?ZIz+ULzvPBPGiMYZJaKoruNvsyFaYhxwthIlivg8leFrjRm8IR8weHJJ7Cyz?=
 =?us-ascii?Q?GULNMm2doeBiBGrfrECSU1gVnta2ddgeQ6p8mVIzgdyqP1P+0wLym/euRC2u?=
 =?us-ascii?Q?5+MOV+qHKLLaGg4T1OW1agPUCPiswtYWX0Gx68SCVvdkfTw0yVgUg/yOqtpx?=
 =?us-ascii?Q?ATc1hn59+3ccKlxR7pANDC3JYaJhduQoGVmDbdk6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zXsCv3TsIrXbziiD3tYTndz6wo3/8sVP44qAGXAHr4oUHFWgB65u7Z/scaqgyYNIv1k62NpwnEi5cHovSh3Z9HIguSsYrtsqhUzjL6DqaNAUlRwiMy8ZLnYnGIO1sUbhqes6zRz2sVwCF6ws6BN5ZXO6RiQha8u/ii6Ic0s9PMQDmcXH0x2bL82QIMHzaa30SnO1gBAzC+X2XBODvfYd0pDo/lGeFaI87zYyabVamQn3/snkm9e2S2z2lyINt15Uf/7zJuZ9obHmf5nO3OgF8Hgbg3f3+Jv4Fx7w32WkV1tNkHPqByBjRGNqyluJ1YDLMAJnsUV8jrHxMJZ4SF+U0+mG6e3X2PDy4UqJyyEQQQ8lB2tIheGyLmj4rjwNh4Ll/fuWrO2mOjiHCRtMc7lAan/ts4O+Wcew9HsYILs1g+ySEO4yqxoJgjP4ywuAXGAxPOiyNE9ohbFWLKs+hGrWTpyLY0pGyIQWgeMXza9kv38oq2yRzbZUbjNRLsFKSpOSNSVsXHIZsW4iMjqtXDhpQZwKxNQWQEI5O/vTPBdm1Ohqzkr7FQdQQsmsNwW9ERqi9G5/txEdDj2EeccAxS4wuHZrXeJWeKdK5IvEboM7wbE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e766e213-f8b6-498a-2185-08dd1af595ac
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 21:40:23.8856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msNw+Swrwmbh2rWu/IeNZU3yrl29zQra8dcVUOCOiy6cw5MIuIR+MmP4glq7mk7g/ITf7fsMJZL/j8+fxRsKtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4168
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_10,2024-12-12_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=831 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412120157
X-Proofpoint-ORIG-GUID: elm3NSbw4-dIh57rJ-CGaPvV2A6zQ1Nj
X-Proofpoint-GUID: elm3NSbw4-dIh57rJ-CGaPvV2A6zQ1Nj
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

* Kalesh Singh <kaleshsingh@google.com> [241211 18:28]:
> Introduce csky arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
> This is a preparatory patch, no functional change is introduced.

This also looks like it has changed the validation order and potentially
introduced functional changes?

All these stem from the same cloned code (sparc32 iirc), but were not
updated when the cloned code was updated.  This is why I am against
arch_* code.  We should find a better way to unify the code so that
there is nothing different.  You seem to have gotten some of the shared
code together, but some still exists.

In the addresses, there are upper and lower limits, and sometimes
"colours".  Could we not just define the upper/lower limits in each arch
and if colour is used?  Maybe this is complicated with 32/64 handled
both in the 64 bit code.

Is there any plan to unite this code further?

We have had errors for many years in cloned but not updated code.  I
really wish there was more information in the cover letter on what is
going on here.  I'd like to try and reduce the arch_ code to, basically
nothing.

I was also disappointed that I wasn't Cc'ed because I've spent a lot of
time in this code and this area.  I am probably the last one to crawl
through and change any of this.


> 
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
> 
> Changes in v2:
>   - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
>     special case of the hint addr being "enforced", per Yang Shi.
>   - Consolidate error handling in arch_mmap_hint().
> 
>  arch/csky/abiv1/inc/abi/pgtable-bits.h |  1 +
>  arch/csky/abiv1/mmap.c                 | 68 ++++++++++++++------------
>  2 files changed, 38 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/csky/abiv1/inc/abi/pgtable-bits.h b/arch/csky/abiv1/inc/abi/pgtable-bits.h
> index ae7a2f76dd42..c346a9fcb522 100644
> --- a/arch/csky/abiv1/inc/abi/pgtable-bits.h
> +++ b/arch/csky/abiv1/inc/abi/pgtable-bits.h
> @@ -51,5 +51,6 @@
>  					((offset) << 10)})
>  
>  #define HAVE_ARCH_UNMAPPED_AREA
> +#define HAVE_ARCH_MMAP_HINT
>  
>  #endif /* __ASM_CSKY_PGTABLE_BITS_H */
> diff --git a/arch/csky/abiv1/mmap.c b/arch/csky/abiv1/mmap.c
> index 1047865e82a9..0c5c51a081e4 100644
> --- a/arch/csky/abiv1/mmap.c
> +++ b/arch/csky/abiv1/mmap.c
> @@ -13,6 +13,39 @@
>  	((((addr)+SHMLBA-1)&~(SHMLBA-1)) +	\
>  	 (((pgoff)<<PAGE_SHIFT) & (SHMLBA-1)))
>  
> +unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
> +			     unsigned long len, unsigned long pgoff,
> +			     unsigned long flags)
> +{
> +	bool do_align;
> +
> +	if (len > TASK_SIZE)
> +		return -ENOMEM;
> +
> +	/*
> +	 * We only need to do colour alignment if either the I or D
> +	 * caches alias.
> +	 */
> +	do_align = filp || (flags & MAP_SHARED);
> +
> +	/*
> +	 * We enforce the MAP_FIXED case.
> +	 */
> +	if (flags & MAP_FIXED) {
> +		if (flags & MAP_SHARED &&
> +		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
> +			return -EINVAL;
> +		return addr;
> +	}
> +
> +	if (do_align)
> +		addr = COLOUR_ALIGN(addr, pgoff);
> +	else
> +		addr = PAGE_ALIGN(addr);
> +
> +	return generic_mmap_hint(filp, addr, len, pgoff, flags);
> +}
> +
>  /*
>   * We need to ensure that shared mappings are correctly aligned to
>   * avoid aliasing issues with VIPT caches.  We need to ensure that
> @@ -27,8 +60,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  		unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
> -	struct vm_area_struct *vma;
> -	int do_align = 0;
> +	bool do_align;
>  	struct vm_unmapped_area_info info = {
>  		.length = len,
>  		.low_limit = mm->mmap_base,
> @@ -36,37 +68,11 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  		.align_offset = pgoff << PAGE_SHIFT
>  	};
>  
> -	/*
> -	 * We only need to do colour alignment if either the I or D
> -	 * caches alias.
> -	 */

This seems like useful information to keep around?

> -	do_align = filp || (flags & MAP_SHARED);
> -
> -	/*
> -	 * We enforce the MAP_FIXED case.
> -	 */
> -	if (flags & MAP_FIXED) {
> -		if (flags & MAP_SHARED &&
> -		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
> -			return -EINVAL;
> +	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
> +	if (addr)
>  		return addr;
> -	}
> -
> -	if (len > TASK_SIZE)
> -		return -ENOMEM;
> -
> -	if (addr) {
> -		if (do_align)
> -			addr = COLOUR_ALIGN(addr, pgoff);
> -		else
> -			addr = PAGE_ALIGN(addr);
> -
> -		vma = find_vma(mm, addr);
> -		if (TASK_SIZE - len >= addr &&
> -		    (!vma || addr + len <= vm_start_gap(vma)))
> -			return addr;
> -	}
>  
> +	do_align = filp || (flags & MAP_SHARED);
>  	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
>  	return vm_unmapped_area(&info);
>  }
> -- 
> 2.47.0.338.g60cca15819-goog
> 
> 

