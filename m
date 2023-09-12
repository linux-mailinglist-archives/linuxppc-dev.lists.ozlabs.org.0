Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F10B279D2FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 15:56:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=cgEBbutr;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=pqsadKB7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlQB15f8Rz3dVN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 23:56:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=cgEBbutr;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=pqsadKB7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1060 seconds by postgrey-1.37 at boromir; Tue, 12 Sep 2023 23:51:53 AEST
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlQ490Lttz3cTy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 23:51:51 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C9nQjQ025795;
	Tue, 12 Sep 2023 13:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=v6qOmbPLPXg+9gEkWX/ENuDrbyWV8kSk+PoRbjsrk0U=;
 b=cgEBbutrHO1mlOymOwx7lWfgzmbnvO8mibz5/RMqwKB9Bgd1ZUd8UCiRmvNxjnRaeqAM
 5HNKkhOnrNYxrgup59MbcbzZHs52/LyUsxIZ/3i1cCcLBiep4wz7+lFDnApicLwN7vn2
 j5gRWzqCShS7rgLWNadhpuG4KM9CShJEGimeb5WK6BxETKFXYT2pJvQHVsyjOvUwJCm2
 +0lt6F1kNL5+OeP+xnfeQU7nxZopQMM1pQ5zmRtVl394P5sfjST6qAtucdwrp2rdSZZl
 apdfMpuEFxf5PZifZUBeE+yQJbjgkotrc4HAoQbyxCiAxEwSNkXUdINOnoDalyXh/e/y MA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t1jhqc0dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Sep 2023 13:33:54 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 38CCVdpB032949;
	Tue, 12 Sep 2023 13:33:53 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3t0wkf0xbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Sep 2023 13:33:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAJlzrC98NW7Ps1C2NEaWR5UeylcFxoHpeAjmlnb/sJxKGpiu/98L/HYoUhf0gxkrHESzopzL/O/N+9WFvBZRyuySDrpmKNfT/DZYAFSz7jyLJgB4tYmjQg9CHyjMibzgtYSPDNgy5x+TrnZCUrDAGnmVf0YDRs3xSqGIDs995WPNmr3cjmzkvruFfjlvQu5RHWte9yyAsH0FlkNGfARQpXu1nFAlpQdsXgZZA/kXIhlHCCm2k2H3FRkkUcpFMi39k07m4GU3mC0S+N2IQMsYhkgwwSnucyc6jg1JtfUng2gZCBVMRqdXHQxNblyRDFN18SAaW7L3lGxIQs+HEY0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6qOmbPLPXg+9gEkWX/ENuDrbyWV8kSk+PoRbjsrk0U=;
 b=al64elE+P5ZgR14ZqPN70Wbsz7lgdLT0d3dwH5cjZhLdXMJZHfXPhC6xUYuZDvRUnkxZhZN7QO0Yth6o5ABDaC/GmjB8rGjAnu1VFiNPsGUSCAOdWBgcHzqnTRASx4Dlm4aHeOXAMPrRifsukM5NnnKDIg6aeCdBRtUN2rdC2kuBNdiduCXJC+XTMi42CKcjGQbiCenc/6liPGCI8u67sV9TDkKwCcGDmkQHIrVdQeTU79sp6sp8oLrTe9GLISlf2OlZ3t4DU/WpZkVhzLc77xMpde++fM0ZmbKMtZlkKFGvMciXZQusfNY8lk6Nrh6LMiq6iXLzQyFtMnQWfb75Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6qOmbPLPXg+9gEkWX/ENuDrbyWV8kSk+PoRbjsrk0U=;
 b=pqsadKB7kco9hdHlMijzHQ1yCmxqNMo8N5reyGmUimL5EZe0b0dChT16fRNRVABykoaR9P0wneHYxl5jrMl/bhRpFU1FMxXhcaNnTCMDDSWczrsYCFXUMlL90Fnhj/vWOma7nGDAwTJXsW37stRsZQvY9vkSxVInat+k4k1IQY4=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by BN0PR10MB4823.namprd10.prod.outlook.com (2603:10b6:408:12d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Tue, 12 Sep
 2023 13:33:51 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa%4]) with mapi id 15.20.6768.036; Tue, 12 Sep 2023
 13:33:51 +0000
Date: Tue, 12 Sep 2023 09:33:47 -0400
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: WARN: Interrupts were enabled early [bisected cfeb6ae8bcb9
 ("maple_tree: disable mas_wr_append() when other readers are possible")]
Message-ID: <20230912133347.55xf7abb3b7zhwuw@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <a981d84d-e2aa-a4dd-ad11-d7ac1a814e5e@csgroup.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a981d84d-e2aa-a4dd-ad11-d7ac1a814e5e@csgroup.eu>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0125.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::27) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|BN0PR10MB4823:EE_
X-MS-Office365-Filtering-Correlation-Id: bc9668b9-e02e-4cb3-28ab-08dbb394e6f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qjItCsBD92y9LDP6blRMPdosUrh8irc+6DlTl6+ZFeb+aRsox1zWlDwJD9CZfi68mZJHs/thJbg1G+pSjnX4LSGAoqqn+fUKed0QExmdKbd6h477jN9IwEGawCycW1TcrteSq80hU2ZzutilmXOzzKhVLm8aLkH7/G14aF38681ZWofo6hr+6i91EK1wvUDmVpWvPwIcceXGLPxYyOKJY3vZ9yHmQ7bS8/gCGPPZ9Ozg9Y4o+OqRlWjLOU7bWNazB/nSckBH/6dvPXIXur9ult7OkjtskTalELWJWqSQJdfiXNEiRt3+PvFh5KuRU7RfQ7j8I1ueWMQVGTqs7AwTSonpf5wAWGsVBow4ApLXRIXusnOtWOxc+hIe0jqeMEjQe9WeqLDeTHS4py1gclUhc6P7tvGQHgGzEm/Td+nLk1ADQWY6Z271lrAN+Uh1NS5nWuJ4RHiDT+kMeooTAa5eSnf6YefeiDx2F6vyawF6kXK1k72CAcqElzh2019E4q2/XGMAnmWqtVN458rvuKSEyY4EMAUOHwd0kM9FzScz/G0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(136003)(376002)(396003)(346002)(366004)(1800799009)(186009)(451199024)(6506007)(6486002)(6666004)(6512007)(9686003)(966005)(2906002)(83380400001)(45080400002)(478600001)(1076003)(26005)(33716001)(66476007)(54906003)(66946007)(66556008)(6916009)(316002)(5660300002)(4326008)(8936002)(41300700001)(8676002)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?w3iVTXDui1pgKX+mXoU3B90xnorpCAUWJi1pFLncLczgoWP1+A8+2q4VCmnp?=
 =?us-ascii?Q?5dDnxZC5Tbl/vtvE9r+Qu65RuuuNV/Nxkw0/pkJ/uJ2FKtaZaF4OKDhOsQfq?=
 =?us-ascii?Q?cyjJvawG88Jac7yBAA4wEMkE7/BWGLmm5uam9XN1iwG+/SoF3TuJXWzpm7s4?=
 =?us-ascii?Q?Q+BPUXTwQQzflx+IYuQykzjJdIwKQ8zPzVLyrX0e+GMnibdaJAu2Vp60G3FP?=
 =?us-ascii?Q?Kje7URsn4NFd9pG+Kz57pjDbm1qpHAfxcJ937pzak6Cr1yU3t2pNc5HKXMpz?=
 =?us-ascii?Q?BiicIrvCsqT4FLVJhM4fQdFDphf4deh6UDmPPwvvJKffXDK6TNYllJU76Vh6?=
 =?us-ascii?Q?kpdrBmHlY5aF4GuaKWQRvaYRVUoFhEfsJJxve3DLny/laV1Z+0CKSlCN2iBn?=
 =?us-ascii?Q?bG9ArLRUXSBZTOyfXePcorAdqv2cRXEmkN3Z3CdW5EV4em+mvpE5eZY0zTkT?=
 =?us-ascii?Q?O6yPt8Qf8U/yafBGyp4dW65ClMtgBIdMsbEp4yUS1ZOsKguZrLstwuhViSsC?=
 =?us-ascii?Q?Oc8/dz7Sz8kifsI/gf4I29I6UFw0hZPa+yb2jLYwPhxgcr++qmZlOV2x7wKL?=
 =?us-ascii?Q?3JvMPQK6KLVgia7CqD43P6EfvPCEWwfegWgUyqsJ4pAhLkQHZGQJoof+o4js?=
 =?us-ascii?Q?zvg1sp8eNFUw5VAVMXSh/3Cyj8g3/yiR+1QJjRHEzPWgWhFCYyumMn01TBOG?=
 =?us-ascii?Q?ux/iilfXh7XjbR5g6srJosFS7o73fuzyVNSWmd70M2ovPqr7og5h3L24UXh1?=
 =?us-ascii?Q?J7B7ZDYEwlHBdgi3J8Tg9fPJoyihzvWub4pRfJZAjBYJE0XJHerzMC2Rq7oQ?=
 =?us-ascii?Q?KAG6nA/+gUg/cPr+GZn25J+J3oVcx3nyf7GY/GUHbfaAGmdS+lfs8WHrAbYh?=
 =?us-ascii?Q?BnCIPKhb5/C660sUoxrL38RDjxyGSLFXcousyUiy/cFvZ0KykodUW+wfVKfo?=
 =?us-ascii?Q?6ctf6Ef90YZ/t44rcv0HEy1hv+IgRPladjqkupRzpEoXK4tO+Zj4S8A+2V8E?=
 =?us-ascii?Q?e6PaqjBCBdK6VrwZBFaJAVWVeKvYytfNJ9lNLklZm6dmrcPaHkD2Nt7qFGhD?=
 =?us-ascii?Q?aNASPSQ7hId51S1B8PBAPVcfwwAFFBDnK5y5gD5eMY9XShbWq6jc48QQnKf2?=
 =?us-ascii?Q?Qk1g6vI0Cv5VlGookaTFzeVeUAPUER0K3OCpEn1yp17ME2GWL19RJniMMr6r?=
 =?us-ascii?Q?JJcyV7djGdjcIKRum2kGT1KyGQ4/ZN05lwxNhW1RI1JSmkXeFAvgwNM6hJfs?=
 =?us-ascii?Q?+QLWcJV7eTXk9F4/zpXZ9TLR2mp1GxfzdwKKRwTqTX2v/E++YSkzQB2A24pc?=
 =?us-ascii?Q?QvSbjFuSa4RTRizBAHe0qyp1Er9JTPn8KVqRIFevRpOLrU3PYJyHIiOabcPo?=
 =?us-ascii?Q?LaHSyGajYTz1DRTiFSjsJQwMyiMsF+vmnApOKeJjz7rPuW08qV45csNBHpLc?=
 =?us-ascii?Q?HMWG2eHuo9hlTA8/MHagWi8mCWpvXuLyZPn+pN9f1iYYeYPGsWO3zbpE9zK6?=
 =?us-ascii?Q?HvY1dYpL4BtMxQJpRIMisGbxKFTh2KKPAnJvnX2/JYfklt0u61V1zfmapahT?=
 =?us-ascii?Q?oWT8WoycEGmdPvSYXM0ZOValokClRYqoIyfEBWxJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	bjtXwjqtlq0P8e/FcGZLla9Jtq6izFg3LCEKYB3STRb7v3s3reNSx+oaazgjZpyO6xcfPFlZadb7PvUfHN55a2buEjA6tV9eXn/EHftBO1xPx8wKplY+aBxpTffBmNT5+e6iE2MGF9dRulmIqA9vpk6fepqNWtyLAuZk/8CgbdTXO6HMrbjymrx3+JbHzg1nCOoJEx7QesXM2yKDjk/c5er4gtq6Lou+XpsX2GNjQnXnBKfBMuN8OZGjAJit8XrnbeO2KNQwGuYQmfM5Wrfcq8zXG7leJXfTYpbKy1bVLkYVAAd1jw1njR/7zVOX1pZvTgawTrflq/0Jkbc7SmqQuPl3o2yWeDVLsjDGfhejnmzw0lrGzIo+IX4/9UJch1QVPP3SNk5/fvqfZwYRaI33hnxZ5SIgY1aMy7r0TFY6v03MAwhR6LsEJoIowCyb1wLqLNABy4qO3OHPYh9M5TXrxWHoPEAKUYSq1eENy2aQ5SfuZ1OU52yWOsKuaEeKpxQLGKmPUS13GoH+8krZAhvgvmbzW/TYyIOgCuWfv6Zo1mYHShCIF5BfMwBJTqKHERF4cLdqzoOLFcA16rVRRwmKLVqmajeUoy48PhJPGR9WoqmsJvnQFNd6EYqOtr1dy3Jv+dqqTKiBz6G9WGCREB09Rwqlqk0NdHdMPfXEJac4HzCAzo6hg3rTpTlxgCZaJE3q/Ryp+V3vjq5v1IrxNufoSKNvMj283JkCXzzO0x4SPqZcXsYKHkAA3U3QGbTspsiGgSGXsnnHspKemvFolTkZ0kN9Yr3ne02bd0PLOa0946scV7mIv3vYBBkeIJKAemCadMDhw6Y/s7b22sv4l5wNDTT/19OxvM2uZIKfpEwlB52VfSPn4rC+AGg3iDedI2FK
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9668b9-e02e-4cb3-28ab-08dbb394e6f8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 13:33:51.6121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9ItL0dtsjKRbYYWDHd4TblvXmwFEU9OEvTJavkxgvmT90GtYT47pmJ6KXuNMf3N8x6XnAMImLbWPb51sSm72g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4823
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_12,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 phishscore=0
 spamscore=0 mlxlogscore=442 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309120113
X-Proofpoint-ORIG-GUID: 00BDk8Zr0rg8uap2q1oeCMWJBtlPnvdX
X-Proofpoint-GUID: 00BDk8Zr0rg8uap2q1oeCMWJBtlPnvdX
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Christophe Leroy <christophe.leroy@csgroup.eu> [230912 06:56]:
> Hi,
> 
> With pmac32_defconfig on QEMU I get the following WARN with 6.6-rc1
> 
> Bisected to cfeb6ae8bcb9 ("maple_tree: disable mas_wr_append() when 
> other readers are possible")
> 
> I have absolutely no idea what it can be, do you ?

Please see the discussion on the mailing list [1].  We are looking at it
there and would appreciate anything you can add.

[1]. https://lore.kernel.org/linux-mm/3f86d58e-7f36-c6b4-c43a-2a7bcffd3bd@linux-m68k.org/

Thanks,
Liam

> 
> ------------[ cut here ]------------
> Interrupts were enabled early
> WARNING: CPU: 0 PID: 0 at init/main.c:992 start_kernel+0x4d8/0x5c0
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0-rc1 #480
> Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
> NIP:  c0a6052c LR: c0a6052c CTR: 00000000
> REGS: c0c4dee0 TRAP: 0700   Not tainted  (6.6.0-rc1)
> MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 24000282  XER: 20000000
> 
> GPR00: c0a6052c c0c4dfa0 c0b92580 0000001d c0b9d128 00000001 c0b9d148 
> 3ffffdff
> GPR08: c0ba80f0 00000000 00000000 3ffffe00 44000282 00000000 00000000 
> 0199abf8
> GPR16: 0199b0a0 7fde7fa4 7fc5ac0c 000000bb 41000000 01c690c8 c0b92014 
> c09b4bcc
> GPR24: c0c55220 c0ac0000 00000000 efff9109 efff9100 0000000a c0c6d000 
> c0b920a0
> NIP [c0a6052c] start_kernel+0x4d8/0x5c0
> LR [c0a6052c] start_kernel+0x4d8/0x5c0
> Call Trace:
> [c0c4dfa0] [c0a6052c] start_kernel+0x4d8/0x5c0 (unreliable)
> [c0c4dff0] [00003540] 0x3540
> Code: 480037b1 48023c05 4bab88cd 90620260 480139e9 4b657ccd 7d2000a6 
> 71298000 41a20014 3c60c09a 3863b788 4b5e9ccd <0fe00000> 39200000 
> 99380008 7d2000a6
> ---[ end trace 0000000000000000 ]---
> 
> Christophe
