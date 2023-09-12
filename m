Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E53BF79D98B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 21:28:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=JkG+sg7n;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=BYVGZReF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlYXQ5yJLz3dM6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 05:28:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=JkG+sg7n;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=BYVGZReF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1055 seconds by postgrey-1.37 at boromir; Wed, 13 Sep 2023 05:27:34 AEST
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlYWV4cxDz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 05:27:33 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38CHJVi1028541;
	Tue, 12 Sep 2023 19:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=e2dLYtEbcCLnKgbkkyS9VKH/E/VEOIj3lp1+qn/wgdU=;
 b=JkG+sg7nLY5cuqxZ41teMVvMsOuTX7xZOWdf5WMH8fnEpKCqEQ1d5wrtb4Sl05RZ16kC
 3mE3nCcKEsO+TT31Gc7VYpTGZfT1qFycwwclQnjTgMLufGM4ixNJs8PJC6G8jf3jjnfm
 0RSRolNIT1P50NZQSNuyC3JB02H37w0mnsat+OY3D68DG0UEbmTouMrSAwHEKhezSUmG
 hFPEQ06IdgX4wEpB6lW6TWGXXkVxH1IrYxuR6Vy4OkmRA0NqPjmDGwgF/rQcZkui8GAW
 vH5178ROMnCTnV0CjXUuSvg0tbRogPQk1+GGZM5tkhuFa21iYt4Bn0A2uk19TMi7psOr gw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t1jp7crq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Sep 2023 19:09:37 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 38CIFUE0007794;
	Tue, 12 Sep 2023 19:09:36 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3t0f567k4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Sep 2023 19:09:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvejvL+GdTwp4iFEszpjnQnecokjtlARq5+LmDRkcdU74FO7P4qvQxNC/UQlMufqzrLVY1SKd7BiITZlJHCmLC0DQK6/cMWyvlfBAavAeF0ODURFB8gd2Z4+gfLr9/pCiHO2w8AlGnrvyDGFNqZNlN02G9Rmp0R9ahAsmLCwAvy8WRJe0I+4lLsyk8O/ufkgGjFmQUtupqLKQjVWLeAcjMqXY6zoWmF3/inQrEREg9lgsHVZ9OEVpP/jNEEXNlN6BftoLzY6PuqDqxbKV8YdzU+tM0w7DTH2E2zXZxibBQsgF8zkA/uIGt8/xcMY7MRtmaCnpMnjOXmDVl//diIAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2dLYtEbcCLnKgbkkyS9VKH/E/VEOIj3lp1+qn/wgdU=;
 b=MEODOB+hwpecah9S4dkCQfbQltlHfV3jZIM4jsVWh9PJ/mrB1kooxqk+5jba3xjX0CVN1jVO2PIWi2yeUozmD5hzp7zdIGW+p/LJMp9W/uJle9a7uNZ2TE0/oz8nxC0a1M0PjYGpvX8ZifViWuFx7jKXR6kQpv3VF/Z7eNaCYym4nDwKc9I+18Mzxbc1WPwfejLLNr1EZfha0vbalHgm2XdWMBuBuvkL4RCxEtG6Q+L6VE1wxQXRsLdwuZ7lBbI6JL360007oGi8RtfaJSBJUxq4J8ksPnL9+5FS9EqlW+piKV8bUY5kUVM5buQ7NrKgDGGIZOv8kfsp++NdCFhgaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2dLYtEbcCLnKgbkkyS9VKH/E/VEOIj3lp1+qn/wgdU=;
 b=BYVGZReFUNUGSVsId9llD7QRu1VjFHa97VoXq/m1KFsupB4k5Bhe0IISW4mPmt0Z1ANnUul8xVWcObSXjYI1t/TSmOHd+/GPWBkz6LejPEIXHBdTuJHeLBvhPW81i2bCerUjB1NQrGkGl06Q60X0j4Mvv8Cvaz/IU4NBXAxSUEo=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by CH0PR10MB5017.namprd10.prod.outlook.com (2603:10b6:610:c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Tue, 12 Sep
 2023 19:09:34 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa%4]) with mapi id 15.20.6768.036; Tue, 12 Sep 2023
 19:09:34 +0000
Date: Tue, 12 Sep 2023 15:09:29 -0400
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v2 1/2] maple_tree: Disable mas_wr_append() when other
 readers are possible
Message-ID: <20230912190929.54kxm7wyws7pgcsv@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Andreas Schwab <schwab@linux-m68k.org>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	maple-tree@lists.infradead.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230819004356.1454718-1-Liam.Howlett@oracle.com>
 <20230819004356.1454718-2-Liam.Howlett@oracle.com>
 <87bkeotin8.fsf@igel.home>
 <87edj3b6me.fsf@igel.home>
Content-Type: multipart/mixed; boundary="5aqidbzt6oq7a3jx"
Content-Disposition: inline
In-Reply-To: <87edj3b6me.fsf@igel.home>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::11) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|CH0PR10MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: 681bd913-e2a0-4893-f66f-08dbb3c3cc60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cbzOenbfYH6hVQ3UT4tpMdPTBeIuba2HvQvGq1LiOtTooj0i3dQjVvP4Hdntyy9YZQ9z3efppJcQPTQdQP3Xt7n/JFyQ2gjxiZAhtLm5ih45iQaNqP65r4+UDwmccGgivJdcEdWKJ7GF+iRvf03mZ6AaOiooV2fM1u/5RmTWjwu/2DJl/DDvufs5Ri0kAZrX7Yo3FePjgnk1QAvYgRsxY7i7QzuYezYoOBynLuwMBMAuRNIBbEv2qo/xJrdtfuxqjIhz9AgdQ0qX+Zoci4A1pdJNTytbeOzSWTFnWdzFFeTaHCRExb/enG+rWGl/Z7bWmyzJvtDVo4YLh9xvk08SZToaMXIkCTYmrm9aEKdft6UF4ut7J/pRMnNJZxN6lJelYu5sVlWsIznJrT2Cwcd5h/joFmU4RvuuRjAqVHF8f5aTB4qjcr8Pm3d5WCoh7MS9Xuf1x1z4zrwT+Xn7SaN7dUv/cYGCW/AbVLYoX8n6BBZ+fhLs9Lz00+V36e6hr2GAqrq8vj6+/onLTVAUJqCZkjNnTttTpznTm5d4AIqOktIUV76/oBwF7R/9E52mDmNiSpx6Hhzmlqwm3lRHftYqFAVwC/b05q/yJPDcyzqpTrFKXomaW80Bo7L7onUd+l4C
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(136003)(376002)(346002)(396003)(366004)(186009)(451199024)(1800799009)(66556008)(33716001)(8936002)(41300700001)(4326008)(8676002)(54906003)(478600001)(1076003)(66946007)(6666004)(26005)(316002)(6506007)(44144004)(6916009)(6512007)(9686003)(6486002)(2906002)(66476007)(86362001)(5660300002)(564344004)(38100700002)(235185007)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?qcv6js39xjeElLqeoMlh78DxN6JolTTxXpuINTxhXC+ee6vbMFJeqewg+/jW?=
 =?us-ascii?Q?Yf+s1ZOSHgQQESACqi/d+31ZPDVFGNuhL/ggK6aXitFcbJ7qvXozRRk/iIkR?=
 =?us-ascii?Q?sZgaF45c0TeI1ICtCZMabDjQ5pa32k0uoAhVNh0oVoabeSKV18PBynv1PQvn?=
 =?us-ascii?Q?b6wPtDjou02UT9mb4DPbN4DmSdiV5+4opbDvDc2B58GaZmecfu+oZ5INPP68?=
 =?us-ascii?Q?CBgzFB2HnOmXc1+PsL+rHfs4BDKz425YUUiJnXcfUcmpdNZCgb1/aIfHPH/Q?=
 =?us-ascii?Q?fEPn9AzGUAfEw84x/1/4Jl2U6P6iG/o9vHuDq69XHKKwTn+Wy1RdYfTxlJ+B?=
 =?us-ascii?Q?a/njPRRNQxV+xiKb4mCqqsSEG3qFuH8DxJf34FpXsuM73SeJdxZLdOwE/+FK?=
 =?us-ascii?Q?8WbHLxB1JoO5IcElWVzFe7Taw0XQf6yZb7HI0EAGT9XEJm40Mk33mWmZ637y?=
 =?us-ascii?Q?n/nkulQwTMbDuTHJNCxYhGWndd3PveXIUB72TKYRuyAGdJTqM/iHJGAnyEwN?=
 =?us-ascii?Q?/CDSBhWODV1JWCMuPkprTJNaAPi+mMWaHMfdNzr+U72ElV6SsY13O1j9VTye?=
 =?us-ascii?Q?jCPX+joR+JwF7t2gJ32hPeFR846yiQrwhO68WK6VpsbgRv2GALXDatMUBjGA?=
 =?us-ascii?Q?xHeB1N7faZUxwMH5u4X14w2tuZiM2U26xuvkKlgZumRyku+aNIi5T39aYPg/?=
 =?us-ascii?Q?ujwg1cBRMRYovKtLLYdcgWcQew3xhvVr8EzlSJ4ETKmghF3+CUGpf8UKjzw/?=
 =?us-ascii?Q?iYRBP//WNBPe1gmsqbOhUPPNeRMCyXaFGDpxbsNEk4yKtdYPKv2AAbnruX/r?=
 =?us-ascii?Q?TqW96uGWurHyuSPqM6MosSC0EpNNc4brIyYtFOxQoUHM0eX307FDo7sWsnoq?=
 =?us-ascii?Q?URMZLplaSIXswyaxMyzkUGLoxfcD7S0XsrxIXUJ+vhwM1mCDFk/gGCtgT/YU?=
 =?us-ascii?Q?lL7CysxahPEucOsrYJv6zYEDHlOlXo3S+viF1Fis5e60xmuSyToXaDL/LhYW?=
 =?us-ascii?Q?/w3uPbG2hE2b5ntTbanYtEwcCSTMkBYZJ0JKa/WBnIbZnVQMG+5d0QChh/zu?=
 =?us-ascii?Q?x8ErDpuKYFAfLfpRs1wvZorjMvAAtr6mcYgLs4eo1FW4b5hwRJ3G09jHlOG6?=
 =?us-ascii?Q?nOAMSVaHy3n+haXiFMGsv0H//RvirADxWjMhckponaZGoG89lY4TawLHk/8q?=
 =?us-ascii?Q?GjuRvDKBNROSaB5if5LHof8zjXKnlVkgF26AdcUrHlwVlKWIdK/ach7fSOcc?=
 =?us-ascii?Q?ECpniR7gRwsYtobJu5alhI+iJLuLSi6cLpWIB0kkqi0v8EcsRUoGPsuuc8gH?=
 =?us-ascii?Q?RFQBzM1wFkUp/lZw3LaLgb5Vhg1vKxNWeZllVUfHCpuSHinkVij0Oi8rkvXY?=
 =?us-ascii?Q?in4n2lxT5iqoO6ECbZe3qbg343+NOCHFMQcMzsujNvs401oheVvbm+5FEk0W?=
 =?us-ascii?Q?qd8su1LnB/aQE0O4oxyM5NsEeDWkxxuPoRnA/Q6oMjnikHO48OaFr13XhFGQ?=
 =?us-ascii?Q?QHz5V9KDJIq84X9VLK/xfMPWjPyckFZUTxloLpMF+p9vAGUajcE0BhpI0bq8?=
 =?us-ascii?Q?l4eByN10r9cjG/+/yzACWpqQ/8eW+N+RE0azlj9UY+tm99DQxHgjmJLjkU6f?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?gaTReFN/E82Ur53B4dwFe88ITxZ1k/ugdHR8GXSQZA7QkQz9N+LM7pymqvki?=
 =?us-ascii?Q?ANpyJHemPQqPkE4xynWa26AT1XOUPec7EBllhKSH8wz1WJtMa3UfbvwCHtwL?=
 =?us-ascii?Q?kZW8wla/cRXDnb1WYJ2U86m/hmPjJExyj5MhiCBJQ5hf4RomFK00mbKPhMVG?=
 =?us-ascii?Q?dlRMfMAnvDhuHSWjBbzundSU6mtzKQvUTAHEZ9JX9WNLLHhNaZNkH1pfnvz5?=
 =?us-ascii?Q?QGQJYPUu4C5Bka/XN+oMinGN+tPX+Cegk0d6MOPj3NkcDmO7Wf8Fes4dtcjD?=
 =?us-ascii?Q?h3kFAkKzkBXWk/2UdRseImBw6yuhv0ZaoH9zN0jB7/cQxDk5oU8SMUwJuljB?=
 =?us-ascii?Q?KydhagksfGbjl/PlPTojiQW2yyczw6IUKZ65DlwMT+VsCUKc7eOa1rGHq9hE?=
 =?us-ascii?Q?apR99K4fy9FudfSF18D283JLII4CCMNpuZXVEtylI/aC8g15b2JFjdtqHdb3?=
 =?us-ascii?Q?h0dmzH3i2G3Lay8FzFKUU1DPzZHxG4mDUzR4Weyijx1LYxX3PiuGOVa4oIxq?=
 =?us-ascii?Q?jkr+h4ouMeNFr9grBnZmNBuvmdPw5N3yesx2alVmp3Uz2qxK58HTAwkuBnaJ?=
 =?us-ascii?Q?cMflq4peBS62yAC7IJ73EcqNtv+wRR5IIfYksZkLT+bL7SgDJf2v+5iw0Zui?=
 =?us-ascii?Q?SVy3OudXko8MAgiy1EyzjjmtkE2YcyvWrenO88qAtkyODfLo6nvKIN2RXzzt?=
 =?us-ascii?Q?RPYVR6cKmRFFEZOWwXwL4tRKjcqOVP0Zx9xXgHeW1kSUInBAwTCApswkMSO5?=
 =?us-ascii?Q?h0Ip6zm2/n/q4A4RpJsivARhF1AZoEIIlHuqBlOkGnZBA3I2kNXNOmSiWrHt?=
 =?us-ascii?Q?4C52RYes08REZuVo/e3mV5v90JJW8tcCbmsCLWn6JgDj6dgHo3kmJnv5nuf4?=
 =?us-ascii?Q?r4CQ5WXF65GJZWtY0eqdHK37bJ3DiUJjFAbPAm9n7Bt4ZS0XKIosTJ3LFXIH?=
 =?us-ascii?Q?dpYsPte0LajxV06NZXsl6HFiD2j6aZl1FPuHbn7QahPNFSuMjqMC1mlsySR6?=
 =?us-ascii?Q?TqTRFWzvwdB9uLOIFVv1U+4TfQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 681bd913-e2a0-4893-f66f-08dbb3c3cc60
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 19:09:33.9479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9zp4vF/JZBWfdhwM3Osc7fSaYK+h3S1otTmv4V/YWR/GPvp2uLnk0H0LEqKFrWMp16hhVA6xQRqH2XkN2em8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5017
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_18,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 mlxlogscore=865 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120161
X-Proofpoint-GUID: KljUFc6WHBeEOWtaJL298SuwaSd8xot3
X-Proofpoint-ORIG-GUID: KljUFc6WHBeEOWtaJL298SuwaSd8xot3
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, maple-tree@lists.infradead.org, linux-mm@kvack.org, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--5aqidbzt6oq7a3jx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Andreas Schwab <schwab@linux-m68k.org> [230912 14:15]:
> Any news?  This is still broken.

I have a proposed fix.  I seem to have caused a pre-existing problem to
show up.  Please see if the attached works for you, and I'll send it
to a lot of people.

Thanks,
Liam

--5aqidbzt6oq7a3jx
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-init-main-Clear-boot-task-idle-flag.patch"
Content-Transfer-Encoding: quoted-printable

From 9ef8f834bb0342dc26464b9dd0165929d3e6a7e5 Mon Sep 17 00:00:00 2001
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Date: Tue, 12 Sep 2023 13:45:29 -0400
Subject: [PATCH] init/main: Clear boot task idle flag

Initial booting was setting the task flag to idle (PF_IDLE) by the call
path sched_init() -> init_idle().  Having the task idle and calling
call_rcu() in kernel/rcu/tiny.c means that TIF_NEED_RESCHED will be
enabled.  Subsequent calls to any cond_resched() will enable IRQs,
potentially earlier than the enabling of IRQs.

This causes a warning later in start_kernel() as interrupts are enabled
before the are fully set up.

Fix this issue by clearing the PF_IDLE flag on return from sched_init()
and restore the flag in rest_init().

Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
---
 init/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/init/main.c b/init/main.c
index ad920fac325c..46b35be8f00a 100644
--- a/init/main.c
+++ b/init/main.c
@@ -696,7 +696,7 @@ noinline void __ref __noreturn rest_init(void)
 	 */
 	rcu_read_lock();
 	tsk =3D find_task_by_pid_ns(pid, &init_pid_ns);
-	tsk->flags |=3D PF_NO_SETAFFINITY;
+	tsk->flags |=3D PF_NO_SETAFFINITY | PF_IDLE;
 	set_cpus_allowed_ptr(tsk, cpumask_of(smp_processor_id()));
 	rcu_read_unlock();
=20
@@ -938,6 +938,7 @@ void start_kernel(void)
 	 * time - but meanwhile we still have a functioning scheduler.
 	 */
 	sched_init();
+	current->flags &=3D ~PF_IDLE;
=20
 	if (WARN(!irqs_disabled(),
 		 "Interrupts were enabled *very* early, fixing it\n"))
--=20
2.39.2


--5aqidbzt6oq7a3jx--
