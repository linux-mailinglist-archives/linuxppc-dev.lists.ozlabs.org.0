Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FE992DAE1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 23:29:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=llVTBGc3;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wK3aPB/J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WK9wh1hvDz3bnL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 07:29:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=llVTBGc3;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wK3aPB/J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1835 seconds by postgrey-1.37 at boromir; Wed, 10 Jul 2024 23:16:59 AEST
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJz0W0grSz3fRx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 23:16:57 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A7fWlU012116;
	Wed, 10 Jul 2024 12:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=vA66+ckHMjBdEdD
	ByRgDni752yCfAm3bPMpTFrtj2Rc=; b=llVTBGc3IURb1/LUtn/qgRu3a6r7oEC
	yqQKsy94JGNHMzaHqrl6W3WpTKiXRsEZm3/d32Ws0NW0MtkpUo+U3obT2B51aBi9
	5YDnXmHKMxW9KhruTFK1N9KB5xVaD3MTfmb2s8y/+NRBtCz6eSsMEP7CVJBFpKZv
	iimHdGXvU0xtbAWmNpzM5zmnvJYt09hlt8MU9ocOYOqrpY7FronIa/bUgd5r+Goo
	O7REyr3SfAO/l+jIQgm3GnywaUN3ipJLqZP/LSPjHAqsf5wbjuYqc4HFWBqYKo2u
	JTABSXbMX4h00a6JAwdtfwgxkcohDNeDn5zATv7++xOJC6sNE3COK2w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 407emsxhmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2024 12:45:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46AB5ttm014442;
	Wed, 10 Jul 2024 12:45:58 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 407txjffms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2024 12:45:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9bF0QYUS2CtsQUu6/nDGpuFrtXNga6GEF2NqBTjtmotl2cOXctCMZ6Fkr14Zz73zitO90uat/ouAfbmiUopIgS+/wTAyE+qB7A3ubwhbq7SBIYqNoXOLnX45JN5W+jZRlxC7rHD06UJCCroOen4ogjXSeFtu+pmUoIVs1sC/yaT16QDe5GPTNRsZIkfQOjiFBl3ALe1wCdMVCw9WYQ1RdTC4N9Qm5MbZCNUck9t/idOHQO9TZfUduOlvLQ7W225PC8+RXMJyZFuUfKxLj/h3SVHOYqj5h6cJ4AF5HbmfVheqzllI/+QqhGPN4M3Aw4cjZTN11MipBKL2AwUXtm6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vA66+ckHMjBdEdDByRgDni752yCfAm3bPMpTFrtj2Rc=;
 b=oH69oXe8q7WNAYKRqLcqX7WD9pGqWP9XYlpIUX0y58OduY6luN6pnAfIvmDImWnB6lL8cMGraTN5QJwCDcD/3zdDa8KzZiWtBmGc0h2cy1946SjZcFzJy23sjrN7hZkwVAS1EidMd0EevkB6TLKsNTQdjozIOLi/37ITao6ciICHAul1IKEw0rqq2UxP3KEVEOktNx6j/IAwrZsQo9iGIRlYw5oAIurdqwJjBUQrE7FAqMGBbwygiMzJl+fyI3sBXoaOZJe2LCVSnG2Y17WnTnkGEVZnddcnzi2WF9+d6QN16bNrDdZsLGox/MHShc5f47D7nWXvAW3vUkkj9Jswgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vA66+ckHMjBdEdDByRgDni752yCfAm3bPMpTFrtj2Rc=;
 b=wK3aPB/Jw7DWqBiUiMAEsSUYWBTUHrOHTjF+hnRFzC1k0Wpg6G3nK2Z5bdxMKpwAYlQMKSj/n8DDMkeC3+q/cK3cbzm6q7y99zh7l3Z1Q7q5Lqf1fRqWPbEkmbqfOAQoKhp3oESatlkpCHZ3N4IDGXYhMngk80diM0tbbI9zjZQ=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by CH3PR10MB6690.namprd10.prod.outlook.com (2603:10b6:610:143::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.40; Wed, 10 Jul
 2024 12:45:56 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%6]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 12:45:56 +0000
Date: Wed, 10 Jul 2024 13:45:52 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 16/16] mm/mmap: Move may_expand_vm() check in
 mmap_region()
Message-ID: <92ce2025-51c3-423a-902e-dbd19d5d7850@lucifer.local>
References: <20240704182718.2653918-1-Liam.Howlett@oracle.com>
 <20240704182718.2653918-17-Liam.Howlett@oracle.com>
 <8fbb424d-a781-4e61-af7a-904e281eba8c@lucifer.local>
 <e5ldsusdn3som7wn2rw76wtrhnlrxk3vkyk3iyimh6qv3ptvwu@24zfmamllev6>
 <0998f05b-9d5f-4b24-9030-22421e1dd859@lucifer.local>
 <874j8x5t4e.fsf@mail.lhotse>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874j8x5t4e.fsf@mail.lhotse>
X-ClientProxiedBy: LO2P265CA0317.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::17) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|CH3PR10MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: e460bf98-4c43-4863-6697-08dca0de3e16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?OonKtTegZcJjQFqjTuGSseVvUDhjk4LELunWKZFADtIt/x4P+R9RdFqcKYru?=
 =?us-ascii?Q?iAjWKEtz4fEHoLPvYNfo8tPABYCtb3qcL8iVKYNtLIiz4MbL7CoeXzQnPy9b?=
 =?us-ascii?Q?FKmO7YCJk0HuOslbkI3ywy8UlKh2O55I+twXd4xWJV9bnZwt5TEtCsWLoqlp?=
 =?us-ascii?Q?W3XZNgW7IAdeTqXmAY7YqU2JBXPnlE50jpwvq4Msz/2u9r7QBbzY+49K9nnJ?=
 =?us-ascii?Q?nRiO5fwyrozo6x8PxPTexge0xqeGbO0e/hWhXWX6XiemKztEnUlfqo7dD+vj?=
 =?us-ascii?Q?of25MQb1waRxP0GVth1vbb5h8MTvH8Xk1urwspp0v/DlYp0fr4JtNvZEwEgU?=
 =?us-ascii?Q?mgG5OEShyEQl4aebWUvpyU2E6NzFAHoSgaBBd6jedA+v7AqazrkIpNvkqwPz?=
 =?us-ascii?Q?EkA9eGl0+df45ZIwoTKM7+oLYwNLRc3KgfxMp+/34FNO2VxNP6tEc2vvk/Ey?=
 =?us-ascii?Q?nYT1f48p1ljxOfr8cBTM808TwJCW/rVzmR9zuZ3JP2xGzymi/7goafn8aL23?=
 =?us-ascii?Q?l7SIBDu65fZMHdx5yn0z9/pmWqbEGMUkh1t6TYX2gGOiO9nybpcGwDuzoLlb?=
 =?us-ascii?Q?sonF375dwkHtBBrGAFo9vYUY5luKnHG6CFFEi2UhvH0Tj6a7Op6lr5J/5ASR?=
 =?us-ascii?Q?/z87HwhJZHVWpkYNmUpxtnzLOl594P40Oi30F7ChxYn2UJmAM0pyqrAyVBcm?=
 =?us-ascii?Q?ayw4zhYF/E5ZkxNgjJYrUe6WnupY7APtdzBRTV0tgGM4aQVDn4cGl5K+2Mzq?=
 =?us-ascii?Q?XpM9X29IAgLHrSdFuWSHLL5KKoyixWfdMstBOg7tS8dcWJIFtkvC5a2KgVNa?=
 =?us-ascii?Q?OIbrsPJ30UfOf8gTIpV5xPrUkGzLM4aiGBgGAcnTt+kNYMgj8PkleZYmFM7b?=
 =?us-ascii?Q?otSrmaGX/osUw/rVHelZ0fDGDUE007/26126hCsWNHCpUyEXa1cRMKGgFn0e?=
 =?us-ascii?Q?Mp65GXf3Duk/2VHg4DfO/heZnHfAbMdOSb7biz7c1USe0/SG2kcTY/yKOZFE?=
 =?us-ascii?Q?TCdA22/Ugg7UP6BCmlKJiUr7wvQsiODjZdi+AGJdAL7wLScDFPGSo/3Mckwm?=
 =?us-ascii?Q?B+EmA1brxNQK9MzvULOVusrhG4JGFMSlXkyscAdC5cJLGxcsPp2Rm+0JBO+N?=
 =?us-ascii?Q?LQ20u1OICzSCTxanEVv8wRV/DzjENis3uKpFeYXwJs9DLrFpfFRAuukDv/Qc?=
 =?us-ascii?Q?0qpzY1039rjKNr0d+FaOKNe9wz8AP6fM/3Ce6eZ1DU3wvcSmTjxd2m5EUE+3?=
 =?us-ascii?Q?E7g2j8+vYJh/mB3s7uIq8IfAjwNJdk3ep3kE+sYTEXwu2wL812Q8a82ZlQHT?=
 =?us-ascii?Q?9iFSh/782oC9j0KTeTadwlVtd74baU7qMgO1X0R0f1jr0w=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?KYBDG3exk9PXJrpbaDVyutcBa/kPaOAaJzfYhpQED91w/5C7xiIeJHxS+VWv?=
 =?us-ascii?Q?i4A+FmXBC7b6xChEKIdjUmqG8hUOD3vvHSeHey8xKr5T0/cYnwM8Ma0et56Y?=
 =?us-ascii?Q?YrJP6vbfAYkqWUDr5qFude/V55lya4U1CiRg+ybkr32/ZD01iD1NNp/mGAzI?=
 =?us-ascii?Q?VTK8haFWRNq5pA03wDplYNRCetLKTNPhKH135gOmrodJVwlxVx5Gje6ktMiI?=
 =?us-ascii?Q?gOOW023psqfZqE047tutHR2Okm8b1VvShoB03pyldh64jDcAGaz+WlssWfjk?=
 =?us-ascii?Q?Dae7YkDeyhTzeuJmnncvK+Q96TMXDJ/tJNHh4Y/e94YRop2geKDKNSWgO6zr?=
 =?us-ascii?Q?lf4Yeow8K9iI0I4ODnJCADC+C/zINm++mm6C6x8p3xZW/+CUSDnI9Qi0KDp/?=
 =?us-ascii?Q?YZYiWH0s4wuk3iR9EL6gcYeOZ9LFb09KFFhzCNS9GAOmJvA3Sb24HRIdl+cT?=
 =?us-ascii?Q?gB0z2gDlgnhxG/pboxiRlZb505pEDXi8k0REZrVYd5wGcDUSSIJOH8SK84Os?=
 =?us-ascii?Q?9n73z8ptX4jPLgqZ9YgwRVFkJ3hzcBnPSMg/kMPjV+xeq7jw42dX0fzmUCxj?=
 =?us-ascii?Q?HdXcTlAHJGDBDWDxJWBI/rfAo5x6R7EJokthRVRsaUMlCqVXG1kkSQnYjghp?=
 =?us-ascii?Q?jwbFtqHL9hYslNz3+LLfc9tsdPMGOZZTc3IkHzmqb7dDGc+NYTCasJ/NsYjm?=
 =?us-ascii?Q?4x4F5s90po/UKsiQV/TMho9+D81bjWXqtPdva90FHdH2BZBykyXGFKdiNKTz?=
 =?us-ascii?Q?QHAFcTlV9GC5UOR0hU2VrQsTs8+9w0jeT1TAmZKIbPjDoVSeRLfCxdcaHKj5?=
 =?us-ascii?Q?9pEkFKiwLaeC93EoEUClTb1TJlgDRkeN6+fyeh4HetWQ41eHTQFlU8EjqMcp?=
 =?us-ascii?Q?sK1teTRmRwgppO2hFdIs+PLvyeX+xEAK685mltDW1Q5M6J0pBOyu2IHhMxrT?=
 =?us-ascii?Q?f7oP+td0V53qu99LUNPduqvsmEL1BUlQz9VxGXnnxMxUD6ecQjQgwP0yAM2f?=
 =?us-ascii?Q?zfsUVZSKpekMdbDR7BcFUAbPB7D3Z6PfI3iz/NkJFrJSSewRt4MVXjijB5Eh?=
 =?us-ascii?Q?4/9AtM+a/OZmheMnYthi5Mh0+i0v3b+inAqyPFKzQjxtZ2KjI7jJlrR0gKFu?=
 =?us-ascii?Q?3puTXJ0r4bxsfgPTsUvGXjyKaVt0XAQ7wuopMzDaIi0rAtbvp1VWwU6WV//V?=
 =?us-ascii?Q?dtfzbnjzkqaAaM8zrpJEvYAjYQQjJKf7eMxCuFpK81eFhuk/NkrHCauCtXt3?=
 =?us-ascii?Q?EzmHyFrc1p9SH5RnI9zrzCKqYRSvcjvOpmWj8KL77YuiYqTPK7v8+5hQqoBd?=
 =?us-ascii?Q?w4kmOaO/pT6IK5eoBfB/rkwfxVbAGC5+u16ncbvjT9Z6aXSMoG6Nbaif7nr2?=
 =?us-ascii?Q?I2dua3ogfN9ReadoxCZzgu67+3qaLxAw8B0nh7SeJAjT1fQZt9FTpiVUHubY?=
 =?us-ascii?Q?gXKdc5ik+5aAUAtJVOvIHqYHuSG5bqkwkTo70P8Zj7ilNSHF9UoGHwdzTkau?=
 =?us-ascii?Q?kNOwSniG//0SfZnbcSPkKzsxqw4DAEi6/a9l6SDCrZBT+ZNnGFhPc8YWQfUz?=
 =?us-ascii?Q?/SSe9B1Qq66O0bwYjJNfxT1PnhVyY/DReSo2OvF4cOv1fNcNhcU3IC0yXSDA?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	ncSXEvDm4lHCyhvpwODKYFVeYEXSb7xS0mr3/dmdZjztEmH6FmxpDnrAbMs8/2l8tvUSyeTnsu6mlIyN9STnpYIM2D13dc7LAtGd3uXb+dEBCuOnoy+zvUw2FV0QqS1QgV2qbG7e0uxIYdqNsU/UfdWZiSg21YMAZirOtyaZ5N98+L2vrZ40rGcoM7j5KyHkuARgx2GZGTK23CmIbVxOKcENEAgfceHvghz4t9u0JOGkbhctLRezMib9/+88QFbBS9srwSse/o3oVSH1icWXQhDWeA/oEhdBihERSEJ2Q9ODttxQQAGTAytuuVo7yrgED3bIzz8QlEntph05ovPQH3dsaYaA8dEpUAPOGfTR1BPvgDrMdqSQEAekpAur3hLqE4lQBngg/lkZ3BvuvLDGHfwt9ILAlfmACpbP9+LbR7njfmxUHvZHCBAv81XX1UWcXkDAZgB28kZNTcb31w1GgX3U41WDpXpAFkv+VhoTbUdp1JXTUhvWFEGt++/nlODqlULa61bkWfIp6hNRBu4oLZDZJ8Bk5sjzBplEjMCcl2iJh1O5qdeWeafohftDJ83QOj6BndozE4nKsOwQAfqT3gwPQMBm1QeDyb6Z06f7C8M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e460bf98-4c43-4863-6697-08dca0de3e16
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 12:45:56.5648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEeHzwsDLXbzIDAkuSvyMTkD1GX6XM8AwzBxXg3bNmWaaxSQup3A7tSC8r8WEBjbSYJUgVaExsFG8FK246SIJbpCVkQD+t77B0wRN1LIZCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6690
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_08,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407100088
X-Proofpoint-GUID: iG2wfhw4HyU7U2oB48ePgeVJZ711xrwg
X-Proofpoint-ORIG-GUID: iG2wfhw4HyU7U2oB48ePgeVJZ711xrwg
X-Mailman-Approved-At: Thu, 11 Jul 2024 07:28:49 +1000
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
Cc: "Paul E . McKenney" <paulmck@kernel.org>, Kees Cook <kees@kernel.org>, Jiri Olsa <olsajiri@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, sidhartha.kumar@oracle.com, Vlastimil Babka <vbabka@suse.cz>, Bert Karwatzki <spasswolf@web.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 10, 2024 at 10:28:01PM GMT, Michael Ellerman wrote:
> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
> > On Mon, Jul 08, 2024 at 04:43:15PM GMT, Liam R. Howlett wrote:
> >>
> ...
> >> The functionality here has changed
> >> --- from ---
> >> may_expand_vm() check
> >> can_modify_mm() check
> >> arch_unmap()
> >> vms_gather_munmap_vmas()
> >> ...
> >>
> >> --- to ---
> >> can_modify_mm() check
> >> arch_unmap()
> >> vms_gather_munmap_vmas()
> >> may_expand_vm() check
> >> ...
> >>
> >> vms_gather_munmap_vmas() does nothing but figures out what to do later,
> >> but could use memory and can fail.
> >>
> >> The user implications are:
> >>
> >> 1. The return type on the error may change to -EPERM from -ENOMEM, if
> >> you are not allowed to expand and are trying to overwrite mseal()'ed
> >> VMAs. That seems so very rare that I'm not sure it's worth mentioning.
> >>
> >>
> >> 2. arch_unmap() called prior to may_expand_vm().
> >> powerpc uses this to set mm->context.vdso = NULL if mm->context.vdso is
> >> within the unmap range.  User implication of this means that an
> >> application my set the vdso to NULL prior to hitting the -ENOMEM case in
> >> may_expand_vm() due to the address space limit.
> >>
> >> Assuming the removal of the vdso does not cause the application to seg
> >> fault, then the user visible change is that any vdso call after a failed
> >> mmap(MAP_FIXED) call would result in a seg fault.  The only reason it
> >> would fail is if the mapping process was attempting to map a large
> >> enough area over the vdso (which is accounted and in the vma tree,
> >> afaict) and ran out of memory. Note that this situation could arise
> >> already since we could run out of memory (not accounting) after the
> >> arch_unmap() call within the kernel.
> >>
> >> The code today can suffer the same fate, but not by the accounting
> >> failure.  It can happen due to failure to allocate a new vma,
> >> do_vmi_munmap() failure after the arch_unmap() call, or any of the other
> >> failure scenarios later in the mmap_region() function.
> >>
> >> At the very least, this requires an expanded change log.
> >
> > Indeed, also (as mentioned on IRC) I feel like we need to look at whether
> > we _truly_ need this arch_unmap() call for a single, rather antiquated,
> > architecture.
>
> You can call it "niche" or "irrelevant" or "fringe", but "antiquated" is
> factually wrong :) Power10 came out of the fab just a few years ago at
> 7nm.

Fair point ;) perhaps we could go with "rarified"? :>)

>
> > I mean why are they unmapping the VDSO, why is that valid, why does it need
> > that field to be set to NULL, is it possible to signify that in some other
> > way etc.?
>
> It was originally for CRIU. So a niche workload on a niche architecture.
>
> But from the commit that added it, it sounds like CRIU was using mremap,
> which should be handled these days by vdso_mremap(). So it could be that
> arch_unmap() is not actually needed for CRIU anymore.

Oh that's interesting!

>
> Then I guess we have to decide if removing our arch_unmap() would be an
> ABI break, regardless of whether CRIU needs it or not.

Seems to me like an internal implementation detail that should hopefully
not result in anything that should have visible ABI impact?

I guess this is something we ought to assess. It would be useful to
eliminate hooks where we can so we can better control VMA behaviour without
having to worry about an arch being able to do arbitrary things at
unexpected times, especially pertinent where we change the order of things.

>
> cheers

Thanks for taking a look!
