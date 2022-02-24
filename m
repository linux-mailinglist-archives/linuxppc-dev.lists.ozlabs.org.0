Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F4C4C3121
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 17:20:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4J5v5nz4z3cBv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 03:20:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=IiOtL9tL;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=xkEXlWnG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=IiOtL9tL; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=xkEXlWnG; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4J5459tJz2yLP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 03:19:14 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OFdutD027379; 
 Thu, 24 Feb 2022 16:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=zr0WlNi9qNdnOP6Z90PTZonM8PHLStvdmbigYILztrg=;
 b=IiOtL9tL7pCuq0X97tZ4D8UCwwHM2gNeS4Q/70hudceMNrtcMQMsf9gTYgGs4M6P1JEM
 mitycnGr4w2I47jgEn8+mDw/nPJo+B8VuLRiiWRArY9PDVWJnSV8JOtDXtqe6P2aoHk7
 3bFlMPg/bcpp3dp3Y+i06jAnUm2d4jiwSBK7oO+BxWz6kVRAmTHYr5Hw+fJBxeLOG9NT
 fPB4fKauzpfQuFzVtGxw5gnPbMyCROx04578/aUbG3pC/3wbx1d7jPC2ig8+gpKo6Q3L
 sk/7RjeyisRjrVQ+wMunvlYHk9N1nWiqdhcWuxcSvDchncemdUHZ+i6l0a4HPTunekti iA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecvar7f1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 16:18:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21OG6urJ153066;
 Thu, 24 Feb 2022 16:18:51 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by userp3020.oracle.com with ESMTP id 3eat0r08r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 16:18:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXt4gPUkTZgD/tX8jtbO2kGJpp4QN/h6qFwQUt7y2BXVo2F4mCRpoq9QZ7wtidXUkzDizqdioM/DDC3Oa0OOJmP53fGT505WotQ7pnYVUmrSCsGt36qdrs7ttqcvEGkXD+yGS/sRB82ClYFJBDlcoOVch6Xztgn8etYRzsZqpu9mnDDrGI4SIh3J2GNiisuflyZ9iaTTvwqqmttzEgp2ctHQOX4XghaS+j/gmr2ZQtdYe7Rkr1mqHKJgStKVXVV8z69zKazCx2KPk/iRy3V5ukvb8g8pHUYqiimSE3KcabOmi9AX9I/dCs3hUcld6ShFrGAgj0jgobnMpwxYiPgXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zr0WlNi9qNdnOP6Z90PTZonM8PHLStvdmbigYILztrg=;
 b=OevHCxib6wNeE6phQUVkD4tBf0gSBmIhuKJUEtzPETJTTcMBv/jQMj4A8BFDxaEfX+TDicI7/W/3l0caZhdq/4gCIGYO7lTZMoFLcBZVymuJs7z66SGuPpEvNhH0KP03lfcMlmzFiohrV8su+81SmC42v83Q+YFMFtAdnnPyUiWudvA1FcXTRjBwO2DqnpV57133SvfhPkGza0Bw5fhrLtx6M+X84elLHY8yMvYftW6NG9udHSGVyDCEknMsgQKNVto5QK4pVWa/ZiGj2bi0TsaDD9hmi+/AnwasYCwCc4209ZCHyMgvqqijiVKb+kAI4YX9Txhge/+MNdut8ya3IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr0WlNi9qNdnOP6Z90PTZonM8PHLStvdmbigYILztrg=;
 b=xkEXlWnGxdIs+nlKnCcdgN4ik1Cfr38HYXvxd8j/zcobYGUywqNr1j5wEPbPj7y5FT2j3cqBPos7WYsxbJrEAdcvVSG4pfASTN3EMMrvyhALOAwu3Fzvk8mh5CfQOHYjqGCIT4odpMsGzbHC/7MRbqEFjlJrkpt6DCBrSQWWHUg=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by SJ0PR10MB5785.namprd10.prod.outlook.com (2603:10b6:a03:3d1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.26; Thu, 24 Feb
 2022 16:18:47 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7%3]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 16:18:47 +0000
Message-ID: <206ba6a3-770a-70ad-96bc-76c6380da988@oracle.com>
Date: Thu, 24 Feb 2022 11:18:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: cleanup swiotlb initialization
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220222153514.593231-1-hch@lst.de>
 <09cb4ad3-88e7-3744-b4b8-a6d745ecea9e@oracle.com>
 <20220224155854.GA30938@lst.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220224155854.GA30938@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0007.namprd11.prod.outlook.com
 (2603:10b6:806:6e::12) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f7a2783-6c19-4d37-42f9-08d9f7b155ec
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5785:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB5785404B16848580DDF957218A3D9@SJ0PR10MB5785.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W/bEZu52wrvxS8Lc3qiHX/+2sgU55XexBsAFECyP9Cg332+w3K3WXm2xsdldFQKqqp/uv990BEgH49NNi1lGpBbWefva8/4yyx3Dwev0M9VNpOdy+drY3k6XR8wZohWcmepxH8bOimgp6cBv4wZtdFQIYydEJJZiqY9ZDqxd4LADpeEQMrXo7UpIjLT89R7HBOfmL8cH51Ftr9/ab3cIJGgxVLqb5WF1Uf95h2O3Hgx/p2+bEQLCugr6xtNGRbMHTgZlxGq0Mf6PLL4nibLBd2tYHz5tVppimWqVwBJyS6AKvktUYMMEDKodynyD4V7/DKs+fJcqkthiwRMs+ImCs8fDvn+NWTmoxmh38SKYRz8BhvWqGtHqoEobz4whThR0n8n0LUusBTaAqPsGwr747I2+we04//PhtmSNwhCC5JTmR607Ix7llgD8BBfILKyv07wmXV4+OdizOjryWZbae+lqG8mGpJ+PcheKMTAeHHYWgyjC1ufIK8gcRQJ1+9/xfH5YankCZBu/KaLab3Rri0wd/4AHwLqBFkdmsCoixOzZzwyxZM6qsQjeNWNnMzhINwiVFAIRbJb6z7DZ0sJDuBF3B/mUwceOJ1//uTv4203n0WtaQQKeU0wVggPufpvMCOfT7ys5GldA0LjhtBkbgzaS5NvmS5sg0A5vpHtXTz7lvVR2P54GWrEh4AWlIBMlDFkkF/cgn2TNLPj4eMqWckRMiS6rbrhp3wNZoDqtAfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(8676002)(66556008)(2616005)(83380400001)(4326008)(44832011)(7416002)(8936002)(5660300002)(54906003)(66476007)(7116003)(186003)(66946007)(26005)(36756003)(6916009)(316002)(6486002)(45080400002)(31686004)(31696002)(53546011)(86362001)(6666004)(38100700002)(2906002)(6512007)(6506007)(3480700007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VktGSWRrUVJEc0NuUHhIOWtMMGlMeXNjL2VZaHJ4K3pFUC9GSzFsM1ZWRHhv?=
 =?utf-8?B?L0h6YzBvZFQ3OWVkNmFTYlFWQzNZVDRPNlJKUjJ4anBLWDBJSVJDTVEwaHpO?=
 =?utf-8?B?cUtWZjBGOVdrN21rSjFTbHBqU2ZsQ2dOOGVEdHkreGtuZitvTUJOdisrN3ZR?=
 =?utf-8?B?Q3lsMlBScXJIN1ZoREgxQWt2VXYzMlNCM3JIMUZQcGprdmtuWERwdFl6T1Nn?=
 =?utf-8?B?VGI4cVE4S294Yk50MDhwL1c1NERERnpVYWN2ci9vbGNDL0tiN1RRUFN2MTFQ?=
 =?utf-8?B?eWozWGNjU2tyaCsvajdONGRHbEdlaUl3ZjRRNXBPYXpiZWYxTkIyYlV3eWkr?=
 =?utf-8?B?U0xnT3FqQW1iejZmUzdXOEo2RlMvNmltU2tVbmlxblZ6RDZ0aDl1NUozVUp2?=
 =?utf-8?B?UzF6eDR2MCtXMDJjbElRTGlZQk54dEVEd21nR2dXZTJZVlMxek5FeWhGbFpn?=
 =?utf-8?B?L3U4OWJaVVNjRnhOOXhKR2hMb2VNdSs1dUpqaDRRNUlFT2xnT0JkRjZockVV?=
 =?utf-8?B?TElLZjdxcVBReUVEcVM2KzFEUGcxbmtrcU1HZzdWaHhqVWFsU3VDUUxIbFBR?=
 =?utf-8?B?WHp2UGJPR0JDV3VwN1JtNlNJSFl0MS81OFQ4N0VjR243c2RxTndOWmhYZWFq?=
 =?utf-8?B?cXpuZmszbkVlWHVVaU5ybG04VTZzNUpNWEdqYi90RE94UlBNait5M09XR3hT?=
 =?utf-8?B?SEV6UXRGZ2E5VTVLd1JMRWs4VDFTc2Z0bDRHQkxMTm8rL0xmYXdPTkRMclJK?=
 =?utf-8?B?NUJRS05EUVJDbFJON1Z5eDRKQTBWajFoRGU1VGlEaENMMU14YlgwZUFYZFRT?=
 =?utf-8?B?ZjJVc1JFL0h1M2Q4SEhKem5iVHg0ZklQYlg0UVBtdEd6dGxZWERCaG8raEYz?=
 =?utf-8?B?MEViaE54eWMzZlpoeW1DeVBiMTkwNmU5RVZxWGl1K252SDdqUHI3eG1MSHE1?=
 =?utf-8?B?bHBCbFg5RU9DTTVPcitXRzNEamErZ0ZsL1JERjNNbFRZdHI1S1FmN0dMdmRV?=
 =?utf-8?B?bisxc3ROWlhsSDE5UnFYLzBJNnpJbmx3am9Tc29FMThsWEpMWGtSeWpDb2FP?=
 =?utf-8?B?VzQwS0ZQajV4eVpBV1BhMEFlaWg3aDRBN2RKOHRZbzJUeWszcSs5WmIxUzM0?=
 =?utf-8?B?eTh2bHBaenNFaVlrME9iaVBpb000UzBmcW1JTzREMGZXYzc2MXNTdDFLUk9O?=
 =?utf-8?B?TnRHaFRkSjBURy9WaThYTHdHWUxVSHREd3ZsMjNadDFaQTRySjFFTWNyaHY2?=
 =?utf-8?B?aFYzZm1MaUZYQTNQNG5ocXU3NDN3S3J4V2hVK0toSDB3bThRYnJzbUNFWWRa?=
 =?utf-8?B?cTVBN255eS9QZ0VDMk1ORFFEQ3JqOWFkT29SMmdFUEFINWxXZmFGYVl0QjFy?=
 =?utf-8?B?RnlLWHN1aUMyZ1QzL1RQZFBaSUd0TzJaVlNkcGlyN2tZU1Z1Rk03R1JPZVR3?=
 =?utf-8?B?V2tSeFFWdXVhcW4yeEtoWnV3M1R4VnBsTm83bW1LOENERER6Z3QwVENEZ0xy?=
 =?utf-8?B?ZE5Sc3JReURNak5kTXFWTmRrM3J1YS9rYU9oajNPUGVteFZiWkNlek1VY0dJ?=
 =?utf-8?B?TUVRa1EvVDAySzlRNHI5Ync5TU8yeG5TWUVZdnZtYTh6UG1MeEgzZDlzRzVq?=
 =?utf-8?B?RVc0NFhhQUpkVkhYWEQ3akhLSE9TVkNnb3BzR0ZzTmtXVzdjU2xGZmdxOTRo?=
 =?utf-8?B?SFFsaURvaG8rOVV3UjZ1RjJxcVdOZU9Uc1A0dWR6b2VIOHduYXdkWGcwQ3c1?=
 =?utf-8?B?Tjk0dUxLS0Vtc2RhY25BVkE4SlNuN250Z0twVEdzTWtEOVl4YklZNEtqSXhH?=
 =?utf-8?B?Tnd0UHEzWU04VlBodC9weDB5RVFBKzF1RXVVaVkyS0V4QzVlaXoyaWs3cEQr?=
 =?utf-8?B?S0dzc3ZOVU9wNkw3ZnIzZFhJeWRhTjR5empPODVVQUhyVVUyUmF3L3Y3amNL?=
 =?utf-8?B?MEFqYzVLMkNIWFBNUFhvc2hWaUNtbSsvSFhNNGtRanUvRDJTeVRMUUlvQkwv?=
 =?utf-8?B?eGRwWHRoMW0yV2F5MDJSbmVGZ3BxWTQ2ZWU5ekZCajhJSWdCamRpanRGTDZ3?=
 =?utf-8?B?aWpjOGJZaWQzMnpjby9VMHd1S0xCSXFYaTlDYThPN1BlSXNiTVJFT2xuYzhR?=
 =?utf-8?B?MGt5ZUdnVjdLekF5bElwUEFWQ3dUb2p1V09YMUlpOXFCc05pM08zbENkME9S?=
 =?utf-8?B?dEd4MGwxRk13b21sZkNqeFhWcFB2aWxHTW1NWlQ2N0RISHZsRlAxaDRtOVd6?=
 =?utf-8?B?ZzArOVZ3RWNZUTA1NU9xK25Kc0RnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7a2783-6c19-4d37-42f9-08d9f7b155ec
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 16:18:47.4329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4wj66LLjTVIqRHUirgnySr+Yi5eVX6oo0+CbRSUavJYoZmsYLDf8zCt1AztG5nOfnW6NRwIfQRkai7q3LFjKdTcCrunBZ/fCaOe7H8QpM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5785
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10268
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=846 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202240095
X-Proofpoint-GUID: 49gfwTdtFA3i5qMnUOXWR97xCIOKkMf0
X-Proofpoint-ORIG-GUID: 49gfwTdtFA3i5qMnUOXWR97xCIOKkMf0
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
Cc: Juergen Gross <jgross@suse.com>, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
 tboot-devel@lists.sourceforge.net, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2/24/22 10:58 AM, Christoph Hellwig wrote:
> Thanks.
>
> This looks really strange as early_amd_iommu_init should not interact much
> with the changes.  I'll see if I can find a AMD system to test on.


Just to be clear: this crashes only as dom0. Boots fine as baremetal.


-boris


>
> On Wed, Feb 23, 2022 at 07:57:49PM -0500, Boris Ostrovsky wrote:
>> [   37.377313] BUG: unable to handle page fault for address: ffffc90042880018
>> [   37.378219] #PF: supervisor read access in kernel mode
>> [   37.378219] #PF: error_code(0x0000) - not-present page
>> [   37.378219] PGD 7c2f2ee067 P4D 7c2f2ee067 PUD 7bf019b067 PMD 105a30067 PTE 0
>> [   37.378219] Oops: 0000 [#1] PREEMPT SMP NOPTI
>> [   37.378219] CPU: 14 PID: 1 Comm: swapper/0 Not tainted 5.17.0-rc5swiotlb #9
>> [   37.378219] Hardware name: Oracle Corporation ORACLE SERVER E1-2c/ASY,Generic,SM,E1-2c, BIOS 49004900 12/23/2020
>> [   37.378219] RIP: e030:init_iommu_one+0x248/0x2f0
>> [   37.378219] Code: 48 89 43 68 48 85 c0 74 c4 be 00 20 00 00 48 89 df e8 ea ee ff ff 48 89 43 78 48 85 c0 74 ae c6 83 98 00 00 00 00 48 8b 43 38 <48> 8b 40 18 a8 01 74 07 83 8b a8 04 00 00 01 f6 83 a8 04 00 00 01
>> [   37.378219] RSP: e02b:ffffc9004044bd18 EFLAGS: 00010286
>> [   37.378219] RAX: ffffc90042880000 RBX: ffff888107260800 RCX: 0000000000000000
>> [   37.378219] RDX: 0000000080000000 RSI: ffffea00041cab80 RDI: 00000000ffffffff
>> [   37.378219] RBP: ffffc9004044bd38 R08: 0000000000000901 R09: ffffea00041cab00
>> [   37.378219] R10: 0000000000000002 R11: 0000000000000000 R12: ffffc90040435008
>> [   37.378219] R13: 0000000000080000 R14: 00000000efa00000 R15: 0000000000000000
>> [   37.378219] FS:  0000000000000000(0000) GS:ffff88fef4180000(0000) knlGS:0000000000000000
>> [   37.378219] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   37.378219] CR2: ffffc90042880018 CR3: 000000000260a000 CR4: 0000000000050660
>> [   37.378219] Call Trace:
>> [   37.378219]  <TASK>
>> [   37.378219]  early_amd_iommu_init+0x3c5/0x72d
>> [   37.378219]  ? iommu_setup+0x284/0x284
>> [   37.378219]  state_next+0x158/0x68f
>> [   37.378219]  ? iommu_setup+0x284/0x284
>> [   37.378219]  iommu_go_to_state+0x28/0x2d
>> [   37.378219]  amd_iommu_init+0x15/0x4b
>> [   37.378219]  ? iommu_setup+0x284/0x284
>> [   37.378219]  pci_iommu_init+0x12/0x37
>> [   37.378219]  do_one_initcall+0x48/0x210
>> [   37.378219]  kernel_init_freeable+0x229/0x28c
>> [   37.378219]  ? rest_init+0xe0/0xe0
>> [   37.963966]  kernel_init+0x1a/0x130
>> [   37.979415]  ret_from_fork+0x22/0x30
>> [   37.991436]  </TASK>
>> [   37.999465] Modules linked in:
>> [   38.007413] CR2: ffffc90042880018
>> [   38.019416] ---[ end trace 0000000000000000 ]---
>> [   38.023418] RIP: e030:init_iommu_one+0x248/0x2f0
>> [   38.023418] Code: 48 89 43 68 48 85 c0 74 c4 be 00 20 00 00 48 89 df e8 ea ee ff ff 48 89 43 78 48 85 c0 74 ae c6 83 98 00 00 00 00 48 8b 43 38 <48> 8b 40 18 a8 01 74 07 83 8b a8 04 00 00 01 f6 83 a8 04 00 00 01
>> [   38.023418] RSP: e02b:ffffc9004044bd18 EFLAGS: 00010286
>> [   38.023418] RAX: ffffc90042880000 RBX: ffff888107260800 RCX: 0000000000000000
>> [   38.155413] RDX: 0000000080000000 RSI: ffffea00041cab80 RDI: 00000000ffffffff
>> [   38.175965] Freeing initrd memory: 62640K
>> [   38.155413] RBP: ffffc9004044bd38 R08: 0000000000000901 R09: ffffea00041cab00
>> [   38.155413] R10: 0000000000000002 R11: 0000000000000000 R12: ffffc90040435008
>> [   38.155413] R13: 0000000000080000 R14: 00000000efa00000 R15: 0000000000000000
>> [   38.155413] FS:  0000000000000000(0000) GS:ffff88fef4180000(0000) knlGS:0000000000000000
>> [   38.287414] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   38.309557] CR2: ffffc90042880018 CR3: 000000000260a000 CR4: 0000000000050660
>> [   38.332403] Kernel panic - not syncing: Fatal exception
>> [   38.351414] Rebooting in 20 seconds..
>>
>>
>>
>> -boris
> ---end quoted text---
>
