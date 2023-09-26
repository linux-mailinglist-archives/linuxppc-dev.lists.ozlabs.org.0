Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 372507AEF7C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 17:18:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=1uaUEW6+;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WsZBecpu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rw3K66wdDz3cP3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 01:18:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=1uaUEW6+;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WsZBecpu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rw3J73BZSz3cGC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 01:17:10 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38QEhiog024937;
	Tue, 26 Sep 2023 15:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=1rNGkJ3noGcC7S69NLaWaZgLZcs//1awToXO+JuS/wA=;
 b=1uaUEW6+ShcUt/B+SAFPHV7E49jiQFW6jGtLUXchY7i4CRV1e9Lbd96/TzigYWBBDaaQ
 8OO7w5JiNlmyBCkqnGhUUAwCpUsQoIvJBSg30qnZRhstt/CaQPdJO6vBMCv5oOHbsyjI
 6JjlvAztkc4LAANCvj2YNyEhjVw/rvbhz69zjLcQlIR6pUeFjON0HLga3msWJns6nZw1
 y8CKxm/JGkFKJ9kC1CliWUvZhCy1L9EpyNm+twgCCFq6E9vjoecGKYEGMNqRdPzOMkd4
 P4LGFVOMEadSEanCNFz/WKIrSk3X8uFPVFPywu3hpUzmQ7L/ZJh3ltx5nJk5n1srZQAp Ag== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t9r2dexqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Sep 2023 15:16:50 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 38QE4465039482;
	Tue, 26 Sep 2023 15:16:50 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3t9pfcb60e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Sep 2023 15:16:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMrMWoAjH/XTIZJIecsFb2dTzV3xDsjD6EuKIVRFJyggntxLXpHdBCTFXqjn3pX0HgSvrwwVS3aPcdmCcMSr/2DuGuxPKNJBrgYfcKG7Kn0avjYPD4z0b6cQUsY8suiUd2XpmxwBW4QjVoWwOb/0iectnWugnddTg2S2w5h74mwCFOB3tSrx+huXh3Mkq51M+OnHrH0tNsLkDQICbXs6CO0T5VnE8AV9tb4knmF6hPkoY+kHsS+9C1ESHMC/m2h/mfAsnRAPgpDmDy49Xd2maKhi8Lz9ssRR+pEI+4SpTdkLEdOjQDho7M5J+AxXerBco7eyYv87KXVS5IegmKkhLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rNGkJ3noGcC7S69NLaWaZgLZcs//1awToXO+JuS/wA=;
 b=T+CODVpjfgOQHEZDYlaSlRGjr4ebFDLovC82VvPPy+uMtPWrLR+B4IJGqHZznDfJPDpUANk0PZ9xsMr1yR1Sf1rDMcRwsVcmB657D+cAJmqC+qvw3RNzFT4wXY5AWvyxekWoTRLn/nPZvhId9rkaLlYvnRjs5+XqqbYdIf11j1kn+sVaEW8svzPshvhEIUPbAZEKsgwAKdWMIqaBPj1g6O3xMVSJnxb+xry5e4LQ1m8wdJEoXgtbov8S5Re2RyiNluwEcKZt9SeYZxBImN5jcoWwJXR1VwXkKic66lVlj4JeLtrL/Qj3DpKA2pmNtp9IfwuE4g/d/tV39u2Ag7Fr7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rNGkJ3noGcC7S69NLaWaZgLZcs//1awToXO+JuS/wA=;
 b=WsZBecpuOnzOFHSLmTyG5eC6tI4bj3CSQxHvpsWg+J8sC+Fv4vklEv0XSa9vtiBVArtV4KeivMDklMzR4YPW3dGmv5YzbwLIvnwVc1UQCFi9TuTs1HsNyDBo+YSm+WHZhkxx3tO3hWrf1llwlkbTEyjYJFwKCx3am9pKCeie/sY=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by CY8PR10MB6539.namprd10.prod.outlook.com (2603:10b6:930:59::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 15:16:47 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 15:16:47 +0000
Date: Tue, 26 Sep 2023 11:16:44 -0400
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [Bisected] PowerMac G4 getting "BUG: Unable to handle kernel
 data access on write at 0x00001ff0" at boot with CONFIG_VMAP_STACK=y on
 kernels 6.5.x (regression over 6.4.x)
Message-ID: <20230926151644.ogvk4n2hnfgffszv@revolver>
References: <20230926010159.0f25161c@yea>
 <ZRIfyp5YKH36_9df@debian.me>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRIfyp5YKH36_9df@debian.me>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0337.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::12) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|CY8PR10MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: d64d173a-ac09-40ef-a9b8-08dbbea399bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8qxEac0PhwMAu3wDuwuAAjPQ0eZjwkTp5nC50an5EPjFnF+ZCd+yj8PZ+Uj+3V9x+V0tviS5pR+FKTQcGP4iBBq7ESF4HPR50kGYDm3eBoObD9PH2xUiqEB35iIZh8aUYRzFdbvpIFfNkRT5DG1HBHxPdEmETPnzJVVyx8VMPUHU//N5YA4KGsLsAoD1jcGLIOTzBc/6s5B++v9Lm2BqfeYQDMWGlafqaDyzEIqEtckKS9VlclGZ0YA+jRQl7236FLvAlu/6745VFvseiNYyORwkM3MhNNr6OGnpoc3ycTiphTkDAcwVgPaQ5HDisg0IMjerhRADpylVSsvtUmtNYRvOrDNg6AjgLCmxsznEc4fYFft0D45CggBkub7SQPkyqsWzbOwt9PBCbwURXciIX2jD0ZqibNkwx9WXPSoRhEC7AmBSWg8QQ3kNmIoYriphQPBjYj0gvuLaj+39GIYpAW/9ixQaEVmg/05SDWHHnfEMjRpEE+wuR5mytuoAs0vnteH6b29EhgYdqaW8Y6+q3NvW+7PXUQgkD1o9vFm0wSrod6mBrsGvcA45EiSqBwxBV3DrVKYaPsTHY11KM3V9Zg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6666004)(9686003)(6512007)(6486002)(26005)(66946007)(1076003)(45080400002)(966005)(33716001)(478600001)(38100700002)(83380400001)(54906003)(2906002)(8676002)(4326008)(8936002)(86362001)(66476007)(66556008)(41300700001)(5660300002)(6916009)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?q8j+q1xp2CeNhaCDh42PaLEWOK8JWehcpnRlqTKymJsFDWnybatSV5aU8Eb0?=
 =?us-ascii?Q?3UadBhhMA9Qyn0PBYzOLmcHvbA/QcqegyDXXUsdHyBfAdMv/zYsCT5fKIxaF?=
 =?us-ascii?Q?lnNZFdNw9VyVaeAZ1eNvrGusi9vzB1zGdCDKROHohol8BnGnVTP4xl3OJ8fe?=
 =?us-ascii?Q?BlzJh/tg37HtDRfAMlH9JdxRf92cdeHt29i81XDQnezi4jGRq0ufMZXl49Am?=
 =?us-ascii?Q?BUCPSI6vCEzoeQE8DDCl6FNISE0MBhwQ8X+YnTg64cZ8/HJ4ZxUAR31rHi3H?=
 =?us-ascii?Q?fOIyqlCP9FO24nOmA5suZvV4Fzysqr15e2OLVaB4VqaX+BHFk6hrN8yRwFyT?=
 =?us-ascii?Q?66DpT8e5SdnFNR6OV9AXbYBibHRpfShBI9T13oQl2x0YV2VnKxFEgdN2chgI?=
 =?us-ascii?Q?n++dbo1wqcWYg/DeDvlrN0z+GJxESoEvT65QGLwf78XTzLMhtwO+wSgA3sIe?=
 =?us-ascii?Q?KaPtq6PVfke8TukyFbj0SmmoyZio2WcAJI0+zcvptM5iVxtRfqU6C5sPZ3Xs?=
 =?us-ascii?Q?cjNC8tLNQRXoHvcS5rYTiqZY8Kx+7hz09UYTYO2cCogiTT2HDcLklI6d7sQc?=
 =?us-ascii?Q?xxgy+w4cNI+3kpl9oIcgjnwaeomyDWIaoD93YiVYwKiV0QYG1TuB4Z2mD0qd?=
 =?us-ascii?Q?56Po1AZwOL0uGZcXe+SZ6PTygw3M4Ec/+XzGDvfDrvmbqrcROjUuHMQFoS5n?=
 =?us-ascii?Q?syTIqjzBwL/n6Urm5es1WSatoralTmY8pT6Z2zSM6ZTtsRBn5QbOfZfDbTfb?=
 =?us-ascii?Q?iQIFJF0cgSknVX8meJTLYZ46esTfN/lwiCK4QhyxnPAPoYTa1MXjzOmeh1Ba?=
 =?us-ascii?Q?4svnjxGP+0MAfwEoY54J3HAU+Pc80dyH1bmnwGkLmfty877KGi8Xzgxh7+DV?=
 =?us-ascii?Q?/lModBPj+XZhzc6DU6l+CoElzZ3af5xZEWOEbWASHP/3W58u/4YFMdOZu0ai?=
 =?us-ascii?Q?xjrITM1RSex2e3d3SnkQ4cCzmqZqqG2KyRXD+M+itIiJRfBDIIR66Jqxs/zs?=
 =?us-ascii?Q?YR4/zuZCR2HcYeHKhQ7+kJTLQ1+Nk+L2RpF0aXiMDH732dgUN+qnGL0kNnI0?=
 =?us-ascii?Q?nyiIAQSFDzjj7cfX7rR/6Vt7mFUpsEn4WJcIsGWKLPF6eGGsb7xQX2iWZK2v?=
 =?us-ascii?Q?dFF5eVdHgGEl81fK577hrTWVvqoZaOyTBhmu7U9KpOeBBqWrVzEn2D2D9+9s?=
 =?us-ascii?Q?CNJz6GoqvOy1wXyb2tHH44IDBDwBP22W1yDD1D0XepMIDzeExkfDBxMmV3wJ?=
 =?us-ascii?Q?D3gFEb9LiFxA1sLmbt3E8fVqhzRl9Nqp/EtRJ9GSe6tBYk8GqdFzeK7vkeCt?=
 =?us-ascii?Q?BshA7t8aEzBVrF0kUBM5XhxMSNKmmoYRz/ZXw5XZKwFqXMzBIbyW/0LQYFpG?=
 =?us-ascii?Q?UzbkSBjlIrw3QFHsL0bmUMlAQzs6d69e8M13tglKWJRfqmJ1jwE40AfLIIQh?=
 =?us-ascii?Q?sYzDyHBkoGaYf2aau6KelnRlm0PBSOw8E2DItSnq2xfI/XJqNyvNxUpFxXXj?=
 =?us-ascii?Q?R3g5a1IJcd0itWm7fiJjhILSMwx32TT0+TzrGOdNoSTnjDm8IntU7o5S1aQ7?=
 =?us-ascii?Q?MyEhIkT+zqvFKvuhmdR/G8iRyt3kaS4O05p8QsDd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?ZmbHYxk/bestXfCq9HskXG+anJMW3AZv0ZL+a6nnwl77mgrm2LPlw/xU0NkN?=
 =?us-ascii?Q?Vej8u8tVTxjsmgbiWxB9kuw79km6mtIKFlVNIWYeD6PBkg/tUJ2mQkx3DfO3?=
 =?us-ascii?Q?DqBRzlUvYwfX1UWwqY3aa2s9iCHxKhuHyl/6/e+aEN6TIDjhxAa5rkPMoyuu?=
 =?us-ascii?Q?qyl34eTAvxEKFoiMXD1yl61Z0X+7MljCoKXHF42nxOc4PiY6HrxzEd/9oHYs?=
 =?us-ascii?Q?BIoDpTkt0UUV7AEcRvK36PKURiVRgJo7jueFcsemzNTabmImU6WVsxWDilNP?=
 =?us-ascii?Q?D6B5eI1C496vfTnY8y7TJKAqN88tnYWz29XAwU38B3YZQzBfyBYZ7/WvinQ3?=
 =?us-ascii?Q?HUOuuS3k0g5Hb2rzSlthdPR3q1ovJXKhhQjNUZd0O8mmdwRSHi0PEt+uuJLr?=
 =?us-ascii?Q?do5z5mi45nIdLuBXAgrqi7VGcJhu2O6LsmUMsqoEhfB/XZ4btc8pK9lBQO6q?=
 =?us-ascii?Q?+YcWHySOBHaBMZwS6O8u0ztbWSuzBBpPECZhKfVlB2t/XeUfpTdmqpeDTMY9?=
 =?us-ascii?Q?9ZZ1/lC0Pyq7eelEV/kTRpLaJMC3XWaOh1oadt8txHMktgT3HCtKJZWah/xC?=
 =?us-ascii?Q?fnK/rs93/rfD93SRztcRtH/Ha+fx0QUDzxTc5HntuMZpPl/YNE52b7Bu9SQh?=
 =?us-ascii?Q?0uF/PU+VOmPAIglCb3ip4E9RPi9mFnbwlKmiKXCWqT4sjL60o8/XOHlxWjc4?=
 =?us-ascii?Q?8Rv0PMZZqfyKnhyQeKXyysI4tbE45+7l/+fk25MS1zp6ZhZfcHEOEV32A6P3?=
 =?us-ascii?Q?+Jrseae3PeVUnD2X++IdnM0k+jlbo7fbk2CvlzNDP/z7KwEyUbV+iHBi6IzW?=
 =?us-ascii?Q?KVn5tBVS0tVc4w5WmqXue2rJndsg8LRTmRpnYG4xlMMwpfJMAagIWLqOUYuw?=
 =?us-ascii?Q?iq7rN/3S47ErQ2gfasuZ2Jb1SmfEOOQFE2kMWuJzUVjMdsWCbPat9B/5Ute2?=
 =?us-ascii?Q?RUK6XEohyTwveDCVydaHJtD6DlhDTf4uyQLjNyzFSWpw1cPSVlnGpgwl5bjE?=
 =?us-ascii?Q?LRYXcndt3VetYZhmBhwg5XiIuHI1M/1AXJwjz++7iEwEcMs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64d173a-ac09-40ef-a9b8-08dbbea399bf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 15:16:47.3491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9TXd6AskRr54GcUVP2Du4ZF7G6vkeOT0wAb1MHi3vgmU3CttczTA2DtDE3DjVmYl6SoucIyNEu40nN79I3bdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6539
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_12,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=816 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309260133
X-Proofpoint-GUID: f0_u3gXCFNCOc25f2gmE012JJoT4VXT-
X-Proofpoint-ORIG-GUID: f0_u3gXCFNCOc25f2gmE012JJoT4VXT-
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Linux Regressions <regressions@lists.linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Maple Tree <maple-tree@lists.infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Bagas Sanjaya <bagasdotme@gmail.com> [230925 20:03]:
> On Tue, Sep 26, 2023 at 01:01:59AM +0200, Erhard Furtner wrote:
> > Greetings!
> > 
> > Had a chat on #gentoo-powerpc with another user whose G4 Mini fails booting kernel 6.5.0 when CONFIG_VMAP_STACK=y is enabled. I was able to replicate the issue on my PowerMac G4. Also I was able to bisect the issue.
> > 
> > Kernels 6.4.x boot ok with CONFIG_VMAP_STACK=y but on 6.5.5 I get:
> > 
> > [...]
> > Kernel attempted to write user page (1ff0) - exploit attempt? (uid: 0)
> > BUG: Unable to handle kernel data access on write at 0x00001ff0
> > Faulting instruction address: 0xc0008750
> > Oops: Kernel access of bad area, sig: 11 [#1]
> > BE PAGE_SIZE=4K MMU=Hash PowerMac
> > Modules linked in:
> > CPU: 0 PID: 0 Comm: swapper Not tainted 6.5.5-PMacG4 #5
> > Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> > NIP:  c0008750 LR: c0041848 CTR: c0070988
> > REGS: c0d3dcd0 TRAP: 0300   Not tainted (6.5.5-PMacG4)
> > MSR:  00001032 <ME,IR,DR,RI>  CR: 22d3ddc0 XER: 20000000
> > DAR: 00001ff0 DSISR: 42000000
> > GPR00: c0041848 c0d3dd90 c0d06360 c0d3ddd0 c0d06360 c0d3dea8 c0d3adc0 00000000
> > GPR08: 00000000 c0d40000 00000000 c0d3ddc0 00000000 00000000 00000000 00000004
> > GPR16: 00000002 00000000 00000002 00402dc2 00402dc2 00002000 f1004000 00000000
> > GPR24: c0d45220 c0d06644 c0843c34 00000002 c0d06360 c0d0ce00 c0d06360 00000000
> > NIP [c0008750] do_softirq_own_stack+0x18/0x3c
> > LR [c0041848] irq_exit+0x98/0xc4
> > Call Trace:
> > [c0d3dd90] [c0d69564] 0xc0d69564 (unreliable)
> > [c0d3ddb0] [c0041848] irq_exit+0x98/0xc4
> > [c0d3ddc0] [c0004a98] Decrementer_virt+0x108/0x10c
> > --- interrupt: 900 at __schedule+0x43c/0x4e0
> > NIP:  c0843940 LR: c084398c CTR: c0070988
> > REGS: c0d3ddd0 TRAP: 0900   Not tainted  (6.5.5-PMacG4)
> > MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 22024484  XER: 00000000
> > 
> > GPR00: c0843574 c0d3de90 c0d06360 c0d06360 c0d06360 c0d3dea8 00000001 00000000
> > GPR08: 00000000 00009032 c099ce2c 0007ffbf 22024484 00000000 00000000 00000004
> > GPR16: 00000002 00000000 00000002 00402dc2 00402dc2 00002000 f1004000 00000000
> > GPR24: c0d45220 c0d06644 c0843c34 00000002 c0d06360 c0d0ce00 c0d06360 c0d063ac
> > NIP [c0843940] __schedule+0x43c/0x4e0
> > LR [c084390c] __schedule+0x408/0x4e0
> > --- interrupt: 900
> > [c0d3de90] [c0843574] __schedule+0x70/0x4e0 (unreliable)
> > [c0d3ded0] [c0843c34] __cond_resched+0x34/0x54
> > [c0d3dee0] [c0141068] __vmalloc_node_range+0x27c/0x64c
> > [c0d3de60] [c0141794] __vmalloc_node+0x44/0x54
> > [c8d3df80] [c0c06510] init_IRQ+0x34/0xd4
> > [c8d3dfa0] [c0c03440] start_kernel+0x424/0x558
> > [c8d3dff0] [00003540] 0x3540
> > Code: 39490999 7d4901a4 39290aaa 7d2a01a4 4c00012c 4bffff20 9421ffe0 7c08002a6 3d20c0d4 93e1001c 90010024 83e95278 <943f1ff0> 7fe1fb78 48840c6d 80210000
> > ---[ end trace 0000000000000000 ]---
> > 
> > Kernel panic - not syncing: Attempted to kill the idle task!
> > Rebooting in 48 seconds..
> > 
> > 
> > The bisect revealed this commit:
> >  # git bisect good
> > cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b is the first bad commit
> > commit cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b
> > Author: Liam R. Howlett <Liam.Howlett@oracle.com>
> > Date:   Fri Aug 18 20:43:55 2023 -0400
> > 
> >     maple_tree: disable mas_wr_append() when other readers are possible
> >     
> >     The current implementation of append may cause duplicate data and/or
> >     incorrect ranges to be returned to a reader during an update.  Although
> >     this has not been reported or seen, disable the append write operation
> >     while the tree is in rcu mode out of an abundance of caution.
> >     
> >     During the analysis of the mas_next_slot() the following was
> >     artificially created by separating the writer and reader code:
> >     
> >     Writer:                                 reader:
> >     mas_wr_append
> >         set end pivot
> >         updates end metata
> >         Detects write to last slot
> >         last slot write is to start of slot
> >         store current contents in slot
> >         overwrite old end pivot
> >                                             mas_next_slot():
> >                                                     read end metadata
> >                                                     read old end pivot
> >                                                     return with incorrect range
> >         store new value
> >     
> >     Alternatively:
> >     
> >     Writer:                                 reader:
> >     mas_wr_append
> >         set end pivot
> >         updates end metata
> >         Detects write to last slot
> >         last lost write to end of slot
> >         store value
> >                                             mas_next_slot():
> >                                                     read end metadata
> >                                                     read old end pivot
> >                                                     read new end pivot
> >                                                     return with incorrect range
> >         set old end pivot
> >     
> >     There may be other accesses that are not safe since we are now updating
> >     both metadata and pointers, so disabling append if there could be rcu
> >     readers is the safest action.
> >     
> >     Link: https://lkml.kernel.org/r/20230819004356.1454718-2-Liam.Howlett@oracle.com
> >     Fixes: 54a611b60590 ("Maple Tree: add new data structure")
> >     Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> >     Cc: <stable@vger.kernel.org>
> >     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> > 
> >  lib/maple_tree.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > 
> > And indeed when I revert commit cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b kernel 6.5.5 succeeds booting with CONFIG_VMAP_STACK=y enabled. dmesg of the successful boot with the reverted commit attached, also kernel .config and the bisect.log.
> > 
> > Regards,
> > Erhard F.
> 
> 
> 
> > git bisect start
> > # Status: warte auf guten und schlechten Commit
> > # bad: [2309983b0ac063045af3b01b0251dfd118d45449] Linux 6.5.5
> > git bisect bad 2309983b0ac063045af3b01b0251dfd118d45449
> > # good: [6995e2de6891c724bfeb2db33d7b87775f913ad1] Linux 6.4
> > git bisect good 6995e2de6891c724bfeb2db33d7b87775f913ad1
> > # good: [6c1561fb900524c5bceb924071b3e9b8a67ff3da] Merge tag 'soc-dt-6.5' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> > git bisect good 6c1561fb900524c5bceb924071b3e9b8a67ff3da
> > # good: [9f57c13f7ed70a94ecc135645bc764efdd378acd] Merge tag 'soc-fixes-6.5-1' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> > git bisect good 9f57c13f7ed70a94ecc135645bc764efdd378acd
> > # good: [b9f052dc68f69dac89fe1e24693354c033daa091] netfilter: nf_tables: fix false-positive lockdep splat
> > git bisect good b9f052dc68f69dac89fe1e24693354c033daa091
> > # bad: [7e2229d14234bbea8fbb5e426d5f3533b0f1b262] arm64: dts: qcom: sc8180x-pmics: add missing qcom,spmi-gpio fallbacks
> > git bisect bad 7e2229d14234bbea8fbb5e426d5f3533b0f1b262
> > # good: [93f5de5f648d2b1ce3540a4ac71756d4a852dc23] Merge tag 'acpi-6.5-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
> > git bisect good 93f5de5f648d2b1ce3540a4ac71756d4a852dc23
> > # bad: [25130b27e0352acb83e91c467853eb9afad3b644] OPP: Fix potential null ptr dereference in dev_pm_opp_get_required_pstate()
> > git bisect bad 25130b27e0352acb83e91c467853eb9afad3b644
> > # good: [4942fed84b98cfb71d3cdff1a3df0072a57bbdfa] Merge tag 'riscv-for-linus-6.5-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
> > git bisect good 4942fed84b98cfb71d3cdff1a3df0072a57bbdfa
> > # bad: [ecd7e1c562cb08e41957fcd4b0e404de5ab38e20] ksmbd: fix slub overflow in ksmbd_decode_ntlmssp_auth_blob()
> > git bisect bad ecd7e1c562cb08e41957fcd4b0e404de5ab38e20
> > # bad: [7d2f353b2682dcfe5f9bc71e5b61d5b61770d98e] Merge tag 'clk-fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
> > git bisect bad 7d2f353b2682dcfe5f9bc71e5b61d5b61770d98e
> > # good: [2f406263e3e954aa24c1248edcfa9be0c1bb30fa] madvise:madvise_cold_or_pageout_pte_range(): don't use mapcount() against large folio for sharing check
> > git bisect good 2f406263e3e954aa24c1248edcfa9be0c1bb30fa
> > # bad: [e5548f85b4527c4c803b7eae7887c10bf8f90c97] shmem: fix smaps BUG sleeping while atomic
> > git bisect bad e5548f85b4527c4c803b7eae7887c10bf8f90c97
> > # bad: [cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b] maple_tree: disable mas_wr_append() when other readers are possible
> > git bisect bad cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b
> > # good: [0e0e9bd5f7b9d40fd03b70092367247d52da1db0] madvise:madvise_free_pte_range(): don't use mapcount() against large folio for sharing check
> > git bisect good 0e0e9bd5f7b9d40fd03b70092367247d52da1db0
> > # first bad commit: [cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b] maple_tree: disable mas_wr_append() when other readers are possible
> 
> Thanks for the regression report. I'm adding it to regzbot:
> 
> #regzbot ^introduced: cfeb6ae8bcb96c
> #regzbot title: CONFIG_VMAP_STACK kernel data write access bug due to disabling mas_wr_append()

Let's see if I get this right..

#regzbot title: PF_IDLE issue in rcu_tiny
#regzbot fix: cff9b2332ab762b7e0586c793c431a8f2ea4db04
#regzbot dup-of: https://lore.kernel.org/linux-mm/3f86d58e-7f36-c6b4-c43a-2a7bcffd3bd@linux-m68k.org/


> 
> -- 
> An old man doll... just what I always wanted! - Clara


