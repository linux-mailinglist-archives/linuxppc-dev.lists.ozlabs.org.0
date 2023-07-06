Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0607074A75F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:03:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=NfkG4ib+;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=sOmVQTXZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxsXD6S9lz3d8Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:03:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=NfkG4ib+;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=sOmVQTXZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxrbC1YQdz30XV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:21:10 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366Lrv2u001539;
	Thu, 6 Jul 2023 22:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=qysBbjkRFpiv0g2nt974fH1e1g2Uj3S9X6d8rMzs4p0=;
 b=NfkG4ib+wAM7NHK5rXmKHgzPmEiCoAV2bIC9csSweG126DYMK9fk6tnxBNl7MhJl5Rqo
 sUmyY3TN1l8diERf8IWxnCET6E48mjV9wAmxETYPZLsPJlJVf100Hh+xfdCTeNxcczNr
 C8byayeJDS3AvzZL7ACr4CwCpks6Ulu/5A2hoDECmAwTHJPsChrWUVGNRcgPYePfxs0W
 sT6CsQdVKYkY7I7AAnUvvze5buulG6O2rjvMI85wtTBEli1u8RyR/wAFkI0CjEq9QnxP
 qR3lvRK8V1GgslwrMou/Tc4+NtHF1Suumt1oqtInE3ASjQiNPe1YC5e31jRYKRf/edwY sA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp4md85rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:20:51 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366KYvIA013438;
	Thu, 6 Jul 2023 22:20:50 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak7ph6h-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:20:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZPhj+bdEs+d/xB6ADmP8osTaHvwjbqNzz1ANSQXHW6//0aq/GeHc+2QFBjdS36UyFba143DJdNh4YiqaeCgOz3JffhAp8SmScsrxY7M4OLS1/UtBUQRWN2s4ZaINfAwoctUj+FtHaFgDj6F51OlgJpkbyuCxDl9+yB5MAeqgNvGq8+h9kpn7yP4uCnmqXHD3AM7L5MR0ez57z3uXvCQxhPIabapv+rjFice5cK7cxmTRPvOYvcLi7QiioFgtXehT2+gA7/wp3xZZ1ypbPf32BdfOBGudEHC9ImWcda7e19jxSXGP9L7JzHRG2sN0R1ZFVWvGK5JSUNnHGBkcxVH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qysBbjkRFpiv0g2nt974fH1e1g2Uj3S9X6d8rMzs4p0=;
 b=msbHPOKF8W0H8ZqNQMWptUlgnCwRE7G+RGJWbn7b9tLuNhONUD26WhDenSQyImtPWyU0AEKOE4ma7IwAFl0/ssAeiPspJQ4lA4R+0pLegRW6kQf/5IgqpotzOr6DsILsWz+HTfgquEItp4iItuMYtytPUnb8oupjQ7EsXoZXYwFHNzBmRldb1y0wPQT3dB6mpo/J2yGXqU/JqSMidFIKMS3BOtvD3ocLEROZrz4roKK6RWwoaxXLCfRbtfN7FFYU3m4vhOoHw7AxmfZhN42i/fBSfFQqnszDketx+hclcwf0aQYM2NlAFPx2H++PM+OZfDEG+mzu64w/qIRpJiV78w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qysBbjkRFpiv0g2nt974fH1e1g2Uj3S9X6d8rMzs4p0=;
 b=sOmVQTXZB052q7Fi75kUlh9otb/VmIWf6isF1+p9fMf4Mi6LTW+qE04Bj8GWhDU7UvxOtJrBOH4t4ljYRhGzpcaWr8l50i4zD7oRSpLiVMtoyb5ICdQ0n+DaCNAT2Mx0crGkTW6NnnwI/9T++uPKmgm76z+UTI4kua37TP6BSaw=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:20:47 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 22:20:47 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v5 02/13] x86/kexec: refactor for kernel/Kconfig.kexec
Date: Thu,  6 Jul 2023 18:20:16 -0400
Message-Id: <20230706222027.189117-3-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230706222027.189117-1-eric.devolder@oracle.com>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR18CA0015.namprd18.prod.outlook.com
 (2603:10b6:610:4f::25) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a3a426-f530-438c-4afa-08db7e6f3f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	c5WHtUr72tA4M8Qc+1J+PJi29yZaZA84iHRCgM0v21SD2YGcibQH757E3dK0CmsFDk/QkaWpX44zggjB9XD9/yfFo5J9fB4ez7wpXUVmgEjxO+ZmSAGkKLLl7BFoVy2Oyd4BEuK4Hsd2j+PylV3rSJX5HAVkV20wGu4iw/It5MxKtXvp8XocYmsHUJc3SEwPPbwRJSqQCuW5eLF4wS0MwnsM8zJPIn5bZuaxJvHlLCKJTSc2tosVOWCGmiXodYJ/NRbpBOvQ87mVsMAD/Cny44orevCqVLBVgatMBrrKKK1cp9ov13pDShpTbhlYHncg9GYWgUxVX+uR7jHWK6Stmx8tlP6tC9/JAwaOU/BJRAfsjnj/xAxVf0klojRi9LPzcIeN/GPPvXU8Rtc2TMESNoNPtzYucGnaJXWIhXvMAfQqFp5rHJaaIghCD3n6QlNjitFd+doTTBZqlU0ikOT3yxoznxbZE0yfWp1mK5CtS/TZt1mItbbnRwQwJGgffKOBSrxHY9cV8i6fqFHUe/bxDDUxOMt3Iu4z5yPnDPg48+EuNOHsIcu6lOfFYdiwpW79yM9coF4M7jhDKSnC0PEbpr6wana5D7HiN9cp3AFAOpA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(2906002)(2616005)(5660300002)(26005)(7416002)(6506007)(1076003)(7406005)(7366002)(186003)(107886003)(66556008)(41300700001)(921005)(66476007)(6486002)(4326008)(6666004)(316002)(66946007)(83380400001)(6512007)(478600001)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?qcDF4dRLTTsN9dGRmrU5KMLv5vwWdAlSwWjsxHZ2vn1S4CHepsY3OJiS4dCQ?=
 =?us-ascii?Q?svjq4hD1J2BcSFyKicV1nSCASiLj0uYSjz7lTsBtmuzzibUo0EhU83/Kpm7q?=
 =?us-ascii?Q?wCRsNiZBi8ALmn9XQPS3KZX4bpFiJSynKwB1c4BFQ5pGHNPZweEzhjp/xrLU?=
 =?us-ascii?Q?+6RdqTuCgJXQtCAFoYmgq4uYFBhETS087b+GAnYYgIhypjkGSMkqQVgTDWX1?=
 =?us-ascii?Q?CD/37XtslA6mXBlbjTWhs0HTirjcEHDh5HXFOw3LzWyVaOzXSVIXkoD14jhf?=
 =?us-ascii?Q?A7LvMXmvL51S+7/phPrijnzbdpA6EiOCbpNdijN49hKaRnsUuAEAG+tDbLRG?=
 =?us-ascii?Q?wUbg07JIsO4CzmxYWT8m10v2CpsxiTb1KNZJ3qeuslaOoDkQgeNo2oeCbpbi?=
 =?us-ascii?Q?OpjTx7n9acS0DghXCkvbQmicD8szQoYhukm+e1VmpRom198jpuT4bOWxkdk0?=
 =?us-ascii?Q?3Jq0L6p0q65sp6AmSWce2GvwODUzKo0gdGErXuA6a9chrbgV/787Wp2YfKbb?=
 =?us-ascii?Q?WF5xByWXQ9jmi3wEsREgdRFoHxCoUeiMPR/v9T/DVkWMyyLHWfHEDfs68AC5?=
 =?us-ascii?Q?FsowquZLJ3X2uhVVhDg6MSi1qODsKz8Nets1zfkSJvtM/wXBsaguOaQl0xd2?=
 =?us-ascii?Q?u3tGqBHt1fIjK4IdFXVLusL3FenT1wsmewIUB/p11am59s9VM6zPMHXD8yKi?=
 =?us-ascii?Q?8erGJflFROVHJ5u7wUzqv+HhOnJBoFq6VMkDeOGVaq48CSPK+mGTOEydOYDI?=
 =?us-ascii?Q?wymHCAB5VtXodFn0oBSzbH7y7kt9PCy5JB2CpirXTfHCkNmeX5I1TZnVwFkc?=
 =?us-ascii?Q?J/5Ktrtoytv9kCOtVmb0aWzQHhR1BWfTpefD5A4ZU3W5Dzp4R5QvrlIGS61/?=
 =?us-ascii?Q?Wg/Mo8BA2CBArH+tvob5tSSOvHAhC2I/r5xHG2h0WNyxnfHniuJL1uaKas9H?=
 =?us-ascii?Q?E3F1FWlB4uy8P5ndUI6tJDTs93a4RZphEUHexsdEFUyeyOnvp7Vv4EPfLVS7?=
 =?us-ascii?Q?vrqVcG8wUZMrJcEF29uFukrY6NgHS/qfHpFJkYEUkv36Ps/KYgX15qxr16/B?=
 =?us-ascii?Q?gnt1lhZvZNUvLsd7HQRBSmsP33J5TVERU075FYY4DnQPPCRWWSo1Knvu8E4U?=
 =?us-ascii?Q?FZZ/XEjA+IdT/YvLF+h0oFuz+DSm+tEz/0rLM7lD/nWuo23psqvO0ShCQ2Bo?=
 =?us-ascii?Q?6SRbAadfKtZA3VniB18zNDf9Isos0pLSaDVJsISxADkp3SyrfA6CbNBD1fuj?=
 =?us-ascii?Q?C7ZtsPan6+hnVJhbptVGyGZNmM/nAf2qwP5i5Y0cQm8U8XFgLQbEe37HDw1j?=
 =?us-ascii?Q?kBLTD3um2XAdxH9dQcPTg1Z3ec2LHou7C9AwOIT5Ul1q9yJJlTardfwU7KPb?=
 =?us-ascii?Q?0pHFvzq/UamH5R1NOEyzWTF3IlhaE3K3wXLipJiba6rObSrCAgXwv8+I2lVU?=
 =?us-ascii?Q?9Kx1LF4AH9aoaPfw2Uu4SE6jZRCt+BO6H/oV/E98MA8Pm9pMjaj0RY1vMyw2?=
 =?us-ascii?Q?v//0sONXzBiCktlKus4gtEJ6OvsnyYbcF06HFyYIzVbFaua6IXOnYO5H03Jk?=
 =?us-ascii?Q?qNFygv5l7qNck07KF+zd7vDvPSPtZsnttrr61QfzNcoGJ5TD7WLbFbsSIol9?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?t+jSAX5KMnf0qx/w6LYbV8ZrVec9LlJPV8zyj011Glw95b6Ke7S4rgN9K2yQ?=
 =?us-ascii?Q?FS2A2R/Qc9tCCx6/UainT7rtIJ/ZwF8iQDEYYG983pNdNkCNf3sztoxR70x/?=
 =?us-ascii?Q?BEhWMxWzKXU2LxfGL7LiVe381BVFQDI6fVQlJExb6AMyfhoBmI/lcqkmawHS?=
 =?us-ascii?Q?Slc/cOmdQ3QlVKQDBDlljDXSNNBXGG85XmbVcWd3v4FoKRMJkaqTImyuLiTQ?=
 =?us-ascii?Q?mS0+fgOdflDJv62YPVkEbJy4tGWoYDXj8DHZnicYl+OEHdzTA7SGCJiwOrp7?=
 =?us-ascii?Q?Ubd/XREkBwPEVXkovus2KIC/LJ1Wpgc0lYkC2HITus3lwVQoBKcYLjugi1yg?=
 =?us-ascii?Q?6EyqTvOdeD5LMwiE3nkBQlrn1+nYN/tveSMXERLNlfH53KFCczNsZnfjx0nJ?=
 =?us-ascii?Q?dC/hY65hCBXPJHCuqwtRixzNHnKunb6IavALk6zg+MreqDsJfeYUJl55ykVM?=
 =?us-ascii?Q?rpOU7ChO06tpKxA9OXx2JfVhxN+65ckPoRKP35/VixWPHhS+wGIr/p6hpqVG?=
 =?us-ascii?Q?RmB4pAv+Ljx4jTwNxCt45um/SH2uKI+suDV7MrWuDOQmTlK+FVbOUcjjxDPW?=
 =?us-ascii?Q?ELKUNqt9hvhVuA2vvOmljIGedjTDwTAtHlyuobHqN0o3vIYXVOcn3y7ZteNQ?=
 =?us-ascii?Q?tHFJcAr1Fi5OnclzUGDiKdbWA2ocRYoQHt9ST3O6AgHMzBhhVes5HpyHX9bv?=
 =?us-ascii?Q?nZFrZVKRdp65/I7RLYVcZ6tBEHX5DHPkXsBfPifUyBNaU1NIhDyJYoDcvClU?=
 =?us-ascii?Q?cu3VmKxyz3AcnRuA7cYJ11hLXnvD2oeK8qrfb9o3zrPtBbK8BJNA1de2tGlt?=
 =?us-ascii?Q?goDdyyOLyIaUU1S6pkDOqavGJGHfKv6dIXhDJE8ubboJ3hrfhLeQBSRP7gI9?=
 =?us-ascii?Q?Nmg0vTsf628c6BIjYHagmxYo8JhzkdiU4D5081KPuUMTvGrig6aUIN7rQ02Z?=
 =?us-ascii?Q?XOvHP/Nmzf/XARH/ILSwf+DQu7+n7oyng7+Pm47ekopa+kRGok62+/4YkEu1?=
 =?us-ascii?Q?7pYEJAm4sm2+AzLi30NE17tIvkX8cwimzu/jlpPK/iFl5haV0blKP3IsESJF?=
 =?us-ascii?Q?X/cFJ4ARMRodSGJo7sCdtgFu1Tx1Dj8U4PbNn1muzkQgfdaEN9PMuugD1tQ9?=
 =?us-ascii?Q?EXq7PYIE1qruQUS40uq87Cnf9+o81rruXRoOyTuY+8qIh3O8QjoUVzj3T/wR?=
 =?us-ascii?Q?9c4U2RA6C6IgtEfKldb82NxToGM1B9hb2P7FxEfGXcPou/RKAsms0FK2ddkO?=
 =?us-ascii?Q?49tKGD1gqB8rMoUoWea+8U94S6jLJcxt270g+HaYVSXcdAfRqlemGHA8WG7i?=
 =?us-ascii?Q?o2HJqfXH9F3iik5+22a8pcuv7TX0PNQSkZ/GNZrn2PHFc8C7oomOoguM0xPu?=
 =?us-ascii?Q?q6vRg/DMV1tMw/A6YVEgEvbkynIZGJiUAaTk139zJ5e28YPGLeosWVsHRf5F?=
 =?us-ascii?Q?0/n+lLyqMMggUa3iUXq2/hle/DYgY5rvbJP4sPOh81zXwPfHzSY193LPZI54?=
 =?us-ascii?Q?SVsfFFeXn7M/raptnTUZkct/8guXKYtZ2KpZm59GmK9DA5WlV2cuEfTh8rRd?=
 =?us-ascii?Q?V17mMrmxtosYzpri6UBjeMkQF5N2TVVXQQ5BPaQLktf/Lm7BZri+5xJ/B9zK?=
 =?us-ascii?Q?yylR6TVrgotGqdOX48NRnOfQYSDzUUJ4acXMmx2Xqs6kLTHPqrj3gAqcj/7U?=
 =?us-ascii?Q?rYrvTe29trGt8M04W7aVjCBgPbdB2jS/pSMu+KJ31LhF/Lc8ajc2ubVSbuZF?=
 =?us-ascii?Q?s+YX9i9nMESX2UINz4ipwqJO9inw50wouTWsBSK6dTvc/70G9JxBgCgAhYz4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	aAqYiznHySf3/XLliHidHFhLqCfzr4+uX0T+FPxfj7Rj2n485UY2BGW3wfQHDVM90tR+rcCMLGTy2UGroUBO9HL+2idstxywYhIMXdYBWFnq0N7ghjLOUmRf2f9mkiEn8O7JmUROyPYNRMsK//gtRCvoUrwQZLvhjGFclSQBEkvHkFIJx6VdtUmTYjJRUad5hCv89IxWuESJeihQeV8Vv98y/1NtbxnPcLb3NXOUta8MjGn7xcGKU0U7kLsBCm7iBeebwQAjyHVABtdEbaM72B5X/udHQWXBbx5dmiLjEtWM5QIziDXFBIJmr/wddny0AfFG4mtRPMmrMLD/oJWLIZo8j/gcv7O1BX5oJmaJogja8lQ0gUi0VlD+bxWaOYKtUpsyz3hUqwbF2NisSbWffInZIqqRW6Kql0tmTIHYdxUIuigWOLGQqE9zRqxjVr8S2+dsigfNCyXP9Q==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a3a426-f530-438c-4afa-08db7e6f3f2d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:20:47.0799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KD7dhlvhm6EdDXhRTCf9/IJ5gbZV7Mam4UHUuIP7lLanWR2Qr94EY77EWRRPOwjmECmgUOi7R7v+uOpGaB4qAPU82OjlPMxgev9cNP3WqtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307060195
X-Proofpoint-GUID: 2x5vox6m0L-ETbBsaKMN8gRz3wovscCK
X-Proofpoint-ORIG-GUID: 2x5vox6m0L-ETbBsaKMN8gRz3wovscCK
X-Mailman-Approved-At: Fri, 07 Jul 2023 08:57:20 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com, kernel@xen0n.name, eric.devolder@oracle.com, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kexec and crash kernel options are provided in the common
kernel/Kconfig.kexec. Utilize the common options and provide
the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/x86/Kconfig | 92 ++++++++++--------------------------------------
 1 file changed, 19 insertions(+), 73 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7422db409770..9767a343f7c2 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2040,88 +2040,34 @@ config EFI_RUNTIME_MAP
 
 source "kernel/Kconfig.hz"
 
-config KEXEC
-	bool "kexec system call"
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  The name comes from the similarity to the exec system call.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  is properly shutdown, so do not be surprised if this code does not
-	  initially work for you.  As of this writing the exact hardware
-	  interface is strongly in flux, so no good recommendation can be
-	  made.
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	select HAVE_IMA_KEXEC if IMA
-	depends on X86_64
-	depends on CRYPTO=y
-	depends on CRYPTO_SHA256=y
-	help
-	  This is new version of kexec system call. This system call is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
 
-config ARCH_HAS_KEXEC_PURGATORY
-	def_bool KEXEC_FILE
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool X86_64 && CRYPTO && CRYPTO_SHA256
 
-config KEXEC_SIG
-	bool "Verify kernel signature during kexec_file_load() syscall"
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
 	depends on KEXEC_FILE
-	help
+	select HAVE_IMA_KEXEC if IMA
 
-	  This option makes the kexec_file_load() syscall check for a valid
-	  signature of the kernel image.  The image can still be loaded without
-	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
-	  there's a signature that we can check, then it must be valid.
+config ARCH_HAS_KEXEC_PURGATORY
+	def_bool KEXEC_FILE
 
-	  In addition to this option, you need to enable signature
-	  verification for the corresponding kernel image type being
-	  loaded in order for this to work.
+config ARCH_SUPPORTS_KEXEC_SIG
+	def_bool y
 
-config KEXEC_SIG_FORCE
-	bool "Require a valid signature in kexec_file_load() syscall"
-	depends on KEXEC_SIG
-	help
-	  This option makes kernel signature verification mandatory for
-	  the kexec_file_load() syscall.
+config ARCH_SUPPORTS_KEXEC_SIG_FORCE
+	def_bool y
 
-config KEXEC_BZIMAGE_VERIFY_SIG
-	bool "Enable bzImage signature verification support"
-	depends on KEXEC_SIG
-	depends on SIGNED_PE_FILE_VERIFICATION
-	select SYSTEM_TRUSTED_KEYRING
-	help
-	  Enable bzImage signature verification support.
+config ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG
+	def_bool y
 
-config CRASH_DUMP
-	bool "kernel crash dumps"
-	depends on X86_64 || (X86_32 && HIGHMEM)
-	help
-	  Generate crash dump after being started by kexec.
-	  This should be normally only set in special crash dump kernels
-	  which are loaded in the main kernel with kexec-tools into
-	  a specially reserved region and then later executed after
-	  a crash by kdump/kexec. The crash dump kernel must be compiled
-	  to a memory address not used by the main kernel or BIOS using
-	  PHYSICAL_START, or it must be built as a relocatable image
-	  (CONFIG_RELOCATABLE=y).
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_KEXEC_JUMP
+	def_bool y
 
-config KEXEC_JUMP
-	bool "kexec jump"
-	depends on KEXEC && HIBERNATION
-	help
-	  Jump between original kernel and kexeced kernel and invoke
-	  code in physical address mode via KEXEC
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool X86_64 || (X86_32 && HIGHMEM)
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
-- 
2.31.1

