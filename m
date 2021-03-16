Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E933CE8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 08:23:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F04Wg02Wmz30Lk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 18:23:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=Orox3l7p;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=UZH0NdCE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=Orox3l7p; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=UZH0NdCE; dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F04W44b7Mz2yZ0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 18:22:38 +1100 (AEDT)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12G39Y1b057859;
 Tue, 16 Mar 2021 03:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=qcR7eJ7cxtsWJ97NEmcytwCm5djdPMHEtB7+xCdftuY=;
 b=Orox3l7pd661AJHOatLoKEF2Bspv19/3VG1nUEd7aQLAsao1bu6XV8FqtZ/OBkjzsEA7
 gd63pW87k1XFWRwvKdXCUmqemu/C/PoQIPQOyk39Vvu5UtuKk29y003rbDDu6N+Qwyo/
 QcH+eBNOHZzV8IRj3dTBehU+qpUlezDPIzT2URql2YAYD0nHGdKHYVMb7woLLMfWP6YO
 1vPVdwPEZSZSJ3ODmQUHpmkLFk/fslURi3IbVPY/SQ9mZ92ZkF9TP2d2uHwx9b3tWHWK
 MUlYZFYy3g/IhpYegmlZWgL3OMqvHsOJ4gwuBYLa/49f+b5wBVdsK7pTLtSox+QqgBPY +w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 378p1np3vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 03:15:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12G3AZMZ193642;
 Tue, 16 Mar 2021 03:15:23 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by aserp3030.oracle.com with ESMTP id 3796yswbhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 03:15:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnXZ6AF62DSdgoSv9/Gnn9DkL26dvOaIb8qDFuejSUIJk2nnm0Aor5W9Ym+czB4AhPukQzNy2SJ5mtzg7pwJTqe1QE4kEePpBAK9fj4QcZpdqvKd1TWdufxoWoYh/2TbOFInqky1MbIgnRffwgD0RoDIyeO5jTVcr0NNct0yXx49EL20vOd+rVA1q+FwzOPX4FmDL4D5C3iOlIR5Mey1BY+bbtINWo7hgVNaT8t3pouFpulWPyo0glZmm7+DlR+6ausg3xadGCwewi5oZfzMoVzk57co3YiiasddZMbJQ3CCiaMtHLAmaaVHWpzE3biwL6w3IlgaMxbzYManw2C5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcR7eJ7cxtsWJ97NEmcytwCm5djdPMHEtB7+xCdftuY=;
 b=AL4SyEICGbsOgEI3mXsmZQp2MN40WCJMSj5Dt2w3h/Sf590c+whwZnpZ45EgZnjySgOfol3Hg8r4wFewt7CWyhp3ZPtMRMgI3hRMTbTyjk2RQcRTVXvHRooeXFOnGbsG/pf9a4TFNjEQ3P1pi5RWnbm9SxSoBmW+oQ54wpQXSEVAECjlEOG4Mi3B9SdkwWV9HkgAsVMSaP3mrXFqu+7kb0Ulk3cxqU3Hh/jSARd4/CkLypLaec008xkssnxgp15hbAHcatsidT8jAHSB56ktuQBunRYYI5VAJG2iFdwCtJ+Xe6pHMzriAlSx2CQm3mNXjXk2Vy+AS727psbYgyoZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcR7eJ7cxtsWJ97NEmcytwCm5djdPMHEtB7+xCdftuY=;
 b=UZH0NdCEnWZyi+mdd2lilYDqdyUreMEWTvFSM+vuaQljZJatj9Y/WaW0ILi7oe7qvTRPkGPsnjxTEnVXA8mgsrBoKg6noIsju0KK4KULI6lZ6EOW/kWD3/BhFROo9B68mJOtcpFU0uG5vVI6qEEeC414wZi85w/nRFO7AAU+oc4=
Authentication-Results: linux.alibaba.com; dkim=none (message not signed)
 header.d=none;linux.alibaba.com; dmarc=none action=none
 header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4805.namprd10.prod.outlook.com (2603:10b6:510:3b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 03:15:20 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e%5]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 03:15:20 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH] scsi: ibmvfc: Switch to using the new API kobj_to_dev()
Date: Mon, 15 Mar 2021 23:15:00 -0400
Message-Id: <161586054343.25014.6589316165995710954.b4-ty@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1613976429-89853-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1613976429-89853-1-git-send-email-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [138.3.200.9]
X-ClientProxiedBy: CY4PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:903:18::22) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.200.9) by
 CY4PR02CA0012.namprd02.prod.outlook.com (2603:10b6:903:18::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Tue, 16 Mar 2021 03:15:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5c349b9-88d5-4cf7-02ee-08d8e829bb37
X-MS-TrafficTypeDiagnostic: PH0PR10MB4805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB48054671EEC75E4050140E3A8E6B9@PH0PR10MB4805.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TW+GxZwaVhlyrrXmNJi3b/9h1v+VJKhw1R0wv7QOjXR7eCmWa57QctwkgoBOQzWkNi4dl1Xx7UUAPktyZHqog6yrUr3DU3xMHO1VlsZI5kybEx7zu9S2JHDtyqDVx3qVZ0SG5E1GYRwTd3D9Hn4rcgFqfgu8yL3fzim4mswB4ky54xQMI9oHzx6GSZeKq8HOmY8+QuTFmKa8KYLaK7W9oevhSpWYnXVF26mpnZp6hrGyIbk14ZeLrgelK5veiKY4nW2oU0Cuf877emsJ+nFDf+l9vzqppQySVr7jNmGhqoEUa3Bc3Z6+D4DhihOkjN22T5Ii5+g6AZEmFeqUOEchQhQtkdyoE6FDzYtzDt5EniLTmEYPSYYeyvAakSESqgT7Wc7RIhhsAwL+xXqwly+qF2oMnvz9AoFFcFAH7pQsgUYviZsBlfFH18FuGi+kxTLQjbX7W/+cN/nZ/p37aNxwkMNPhvFjAhdLOIfET7ZnNmjnKWij0TBrroMswOCHuhlvI66dJ1iokYOoxqmOyAou2jAhHupv7p1hfNDvAAkZ0N/gpbcjNmgrhkkRhNjuuOPTpYccJq0F4jQVI9QIb+hYOvG4QlSrf+zN2zSXZWmIlOYcfV6i/T67XN20lWQFFFuJjgCv7Tj2wkmDSq7b9JpKBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39860400002)(346002)(136003)(396003)(2906002)(103116003)(4326008)(86362001)(5660300002)(36756003)(6666004)(4744005)(6486002)(83380400001)(66476007)(2616005)(26005)(316002)(956004)(478600001)(66946007)(66556008)(186003)(966005)(7696005)(52116002)(8676002)(8936002)(16526019)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bUhQQllPMHlPbkk2UGFjUkx2UDgvQ2RDMEU2UEdmVzVPQThXd1RWZUhya0Fx?=
 =?utf-8?B?NmJrL1dlV1ZmOEtrVXN3R2lEK2FrZ002RmVHaElodjZGcUlrSElBUkphbW1w?=
 =?utf-8?B?emRKVXFqTk45UWxLbitBQ3VITXBVYnFzRzlJNDZmbnlrM1dNVWlrSm9xeSsx?=
 =?utf-8?B?bGdFS3FrWFNxY1l3TkhQZXo3OERGeXRwd1pGaXBTZ3NZNTQyQVQ5ZHlxYWtq?=
 =?utf-8?B?WGI5Q3Q1b3dpV1E1SzlJd05UczkvTFhWU1laY29zZERrMldaWDJVd3pZRG5X?=
 =?utf-8?B?My83WnNGendIeDNzUnlDZFhERWxQNjVsQXQzSXREQmxnUS9mNmIrMndRcHVr?=
 =?utf-8?B?VWlNbWVWMWlla0VvS2J2UzhBbFgxOGtuZTBaeWN5dC9DaGM1YTJLWVVpTGJB?=
 =?utf-8?B?RzdOTXhRejNNdFN4bWhVSHl4aktTN2F3SG0yYnIxYUdBTjJiUUJTdndNZXQz?=
 =?utf-8?B?QXhVKy96RzlSV0NQZFFheC9LWlRpVlJ4UGFjYlEwcWU2NkpyelkrbEJjN1FO?=
 =?utf-8?B?TlJvQ21sZ0FNWWwvZDVEV1FkQjkxUUpxN0V3SEVSb3c0OWI2VVpRNTdqVmFa?=
 =?utf-8?B?bkJkZk5ISE8wNndZTzVmY1NrUkozV2NBaEJXOU1mcUdpblRsMlBwRTNVZ2Rw?=
 =?utf-8?B?WjZ5TUliaW1jYXVZRUdSN1VhWlNjUTViVUFDbEkrTDIvT1YyRXVxY2Iwb3g3?=
 =?utf-8?B?a01Zc2loV1MrVlZiL3F0TXVITW5sd1NLQnpIVmIzQ3dEOVhBTGFJYlkxeFVr?=
 =?utf-8?B?dnl6SjlMNHVYVnJJOXFxaW1xaGdQcFF0cy9Dbk9ack1tR05LUVF3VjQ5b05i?=
 =?utf-8?B?cWoyL1pTU2MrYXpYNFBOOEcxZ1p4SXV3YWRNRUpnUjhqT0NHQUV2Z3lsbFdr?=
 =?utf-8?B?WXRYRVlTQjY1Rnl2MXR1MFNhTUIrNnZwNzZaZGNHVzZ1TmtXSWJmZDd6TlR1?=
 =?utf-8?B?MUFGRnowWnFYeUUrYVdzSWdtbU94eU5TSjdLbGFXd3REWlJxWGdyc2pyK24z?=
 =?utf-8?B?cHRqOHlXeDFJblJpbmlPTUl0Wk0ybGpXNzlsVnd3VHhFMU9iaHJLZ2tKV2ww?=
 =?utf-8?B?NWZhdWtLZ0tHaDMzVFNKWjlpVHlucWNrRXVvRGNvWForbUU4WVhuVUN1S1V2?=
 =?utf-8?B?ai8xZHR0Rm9CdXlFcC9RNEg1dFF0Ylh4OWFxUnd4RnNIQzJOVzZlNkpwM2Zj?=
 =?utf-8?B?dmVSMy82V0RuMzk5RldrR09zRms0SFMvY2o0K0hiR1FBNTFCMFEwWXB6ZDc2?=
 =?utf-8?B?UnRDM1pVTHhIWDlMVWQxc2VnV1l6S3p6NWZtNytKWFJFanJyMlFaeDI1SC9O?=
 =?utf-8?B?eGRpL2NLbDdmYUo3U0ZmZmh1bVN0U3cxR0JpNWl3UnFwVTlBc3dmSTJHcFh1?=
 =?utf-8?B?SEk5Q0RJSkVsQUJka3hEdEdibnJ3TTdSQ1RJNVE1RFZ3cTNiRUpuODlEZUYr?=
 =?utf-8?B?RVFaS1ZGS1h3UGc1cldaaW9ia2EvZmVmSFczTlRCRWJjT0JBOFUzdUsyRzd2?=
 =?utf-8?B?WUNSTkYyMDhKb0NoTFVuNUkwMXVmajVvd3F4ZGVHbUkwZThBUURLdjhGRGZs?=
 =?utf-8?B?TUxNRTNjQ3pLWmprbUk0bHR5T0JOUGNTT3N0UEowTmtyQ1JHWS91QjRSWFpG?=
 =?utf-8?B?NEZqMm0zYWRSUEtlbTFiUHNmY3ZNUlZReXY0bERyUVdXWWI5aDQrY0ZLZWpK?=
 =?utf-8?B?am15SGk2NEpqZmpyS2ZIUU85cTl2MDVOK0RQVHRJNGd2VCtKTVl3U25PWFNv?=
 =?utf-8?Q?qmlRkLCG3uLJ8kmSJPCsTbY27CSwQywITa9JYaO?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c349b9-88d5-4cf7-02ee-08d8e829bb37
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 03:15:20.7462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIojpjBOdX5wlAE4qahkT5rKeTFcD1aQ2trPHLoIN/CuCCfDs9ZO6VUgjbafzDFMIEJt4u+bnRI8OFKfjNUSC4J/JXWkgx/f1o/J3dPN9Nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4805
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9924
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103160021
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9924
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103160021
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
Cc: tyreld@linux.ibm.com, "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, jejb@linux.ibm.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 22 Feb 2021 14:47:09 +0800, Yang Li wrote:

> fixed the following coccicheck:
> ./drivers/scsi/ibmvscsi/ibmvfc.c:3161:60-61: WARNING opportunity for
> kobj_to_dev()

Applied to 5.13/scsi-queue, thanks!

[1/1] scsi: ibmvfc: Switch to using the new API kobj_to_dev()
      https://git.kernel.org/mkp/scsi/c/18c2a59a4190

-- 
Martin K. Petersen	Oracle Linux Engineering
