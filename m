Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8525AF219
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 19:14:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMX7P2bsFz3bZC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 03:14:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=DTVzmDTL;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=OuDhdhMq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=DTVzmDTL;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=OuDhdhMq;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMX6Y27hXz2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 03:13:54 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286GO3SV004368;
	Tue, 6 Sep 2022 17:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2022-7-12;
 bh=UelA/A0PFMSO7fqB0d1yBlOX2x44YtgFxS3fmqUFivY=;
 b=DTVzmDTLEpSLcyQResurNOdDdjOZsR7Xbx0Ntae/wQt80lOpVLerfzZIfC8tK7SVhVZV
 P9gqsrgrGCKXuAd7v7uoOGbR6VycVEepyTYEnU34g5KMOebTap1YjPgFvl/SXo+t/pvq
 CXe4plakKxOftnYMT1AuuljyXaVHAueE5F4WIjg0uKbyIfxgaWUydvoRVVWkJDISp2la
 TOB5GPmrnj3RjvSYZRsq4TtTdfPtXPs94jIhCijW7ErSn7DaDbrtGJm2b9hLrMB62bgu
 g0iHSs46Hp3XWCK7lEcNk5VQtN5ccGa4rne6I78aF7hCRq1kYIXFTp1R5C+9CSYPPSc3 rQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jbwbc6fcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Sep 2022 17:13:29 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 286H4HER023869;
	Tue, 6 Sep 2022 17:13:28 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jbwc9eg8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Sep 2022 17:13:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LO7Nwv+PbGSkvhapXii/tSwDLWMs16yV32uob25oF/qFVujccyIztf8C3YbBBpKHufvd2MkpRK0pwlTspMhMz94ZF7Iw9BBj9CaOZd1wGGQgsdGBF6Ne73lCiEunFECC5uWKx32ShrjTlfwNiiieX0H30l2IyFQYZ20In0vmLI9r0tbdXCKFy51OaUoQTsw4qWY71tLNqX4V9AZfa972VZoY2+dDRTyub5ss3hPuDMyBGZaugHtJQrKsaUATgM4vSwIErQgu8VOd6cwUwIdbpYVGanfrkx5/sCuyC315eKrEdd1H+vtOPdisBKmeDBsZ4eHYq9+6dy8s7hiTSrAy9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6bD0+bwChXin7IA9xG1wTkqkY21Au9WJuz/xsUNUyw=;
 b=lfyoC3IGUNfN0xuuz39CVzT7Ntz0H7zO0shuJbR1I7y/cTx/pWaxmmdtxdIIYJLToiczb87PedjUMzcCVyrPU9C+AtTyuKSi55gvEe9hcIrJ/L6ujqTfkIOp5Qrusm0FeBXqngJwM66aw2TlrxWi0uk1wsBJ2SJPhSvUtSKk1iP++mnjEnfiMS6cYHDdisLJNQGcwfDufGjSgrksgAGBkpCNSPZNBJ7rNOlf85JbmQcYa0NJY+xeRlnIBg2YuJQO9GH7FsAsWq2RL018bixBtZZEmh4+emQRMp64AqLGseKxnj8KmQSxRRI5yotKqtl9IY7BL5In8zRIzAfPIrCp8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6bD0+bwChXin7IA9xG1wTkqkY21Au9WJuz/xsUNUyw=;
 b=OuDhdhMqveBvkyj5CFen8kpqaAuEqjO/+2+M82I81bYROybdIZn3CDTopcpLxQUnC24TPa1mgKYIeSKhlhhXW0FVkqC1R9ZnkMyKyTOVXDj/6goQ0mad1SHskeG88W8nZcrMgERCgHObZVE/3Xq0wBz8Os7k7kJBXr5FWIEsZ5U=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by MW4PR10MB5773.namprd10.prod.outlook.com (2603:10b6:303:18d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Tue, 6 Sep
 2022 17:13:26 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::e9d2:a804:e53a:779a]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::e9d2:a804:e53a:779a%6]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 17:13:26 +0000
Date: Tue, 6 Sep 2022 10:13:24 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] hugetlb: simplify hugetlb handling in follow_page_mask
Message-ID: <Yxd/tE4EnIqhfd9s@monkey>
References: <20220902190357.469512-1-mike.kravetz@oracle.com>
 <3a65e455-ce68-30e2-6e1b-fb8a1917b40d@csgroup.eu>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a65e455-ce68-30e2-6e1b-fb8a1917b40d@csgroup.eu>
X-ClientProxiedBy: MW4PR04CA0184.namprd04.prod.outlook.com
 (2603:10b6:303:86::9) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f411987c-d537-4a49-e335-08da902b1c9e
X-MS-TrafficTypeDiagnostic: MW4PR10MB5773:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5aJaskHP1E+k3Gp2mzr+d5zmwXY3ybdMRb9Sf4fZsLmRiFW8OuJWnlYklYDwN27dUNB5q9y5JXIDvnx00g3S9J5qLGy//qUAmAFOybIJWDQs/ekwYABLtNz75H4sN3JPSdk0uQ/7ppzXsOctimsl+f1+LaN99ioHNfZLYTGGQ+42W8lTY2RE7ss6P8rKOWSqIhXWnVDoCJZm2qgipfKgip2KgMDqmBTa58tSBOvZTwGB9EoJR4+p7NcPbnPfApGEu9XSw45zXZqcuCEqVbaR642B/6u7pqFjVapbJui5C/VJShlHCvWrI0lOKMHmHL/jGykEnZscy+XixTxpwc+pBhz6225U9fDYMqpxanAGNpF6RAK98/fsI37kEWWv4YxMv4dR82mJjBbtVIVrdujKPSQaFT465/BHwzU3Tc+UT57W8tpjXbbwyRZBU8bfMU6biMoksZsZ0TDkXnPmH6L2SmYXZEZIY2bZeYfyaepX0ugfVfES47N8Qs4+T1UyhP0YtOCTaBclQvk8+xaLvp5rMHb2IhkpdpipdtoJJuK1S8X/HtnRFERAwIqDc0K/hKXTL8gkoBQkzBBFVWfuJ75+BOucTVQe5PS/1M9ldNW8onE1k/or7tMN55G1iItGpUQZL/E74BT5D0X2neNQeBl943GHfxbpqCRY5MYhq5KnKrSW4AzuIqUC7HX9fs1FPMkOPG6/iKLfkM4lnY4gAybpaA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(39860400002)(396003)(366004)(376002)(136003)(2906002)(186003)(44832011)(5660300002)(8936002)(86362001)(53546011)(7416002)(33716001)(8676002)(6506007)(4326008)(41300700001)(38100700002)(66946007)(66476007)(26005)(66556008)(6512007)(478600001)(9686003)(54906003)(316002)(6916009)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?iso-8859-1?Q?l+yiffAkrvOJOI2DHXIEcRNmduMgL5WOF75sad17j764x52Vx9xk7mc7SX?=
 =?iso-8859-1?Q?EGazWTKzcl004IxohmVMvlTquQnLp/Ez+65+CPJSuCdgMC+7NOIuU4S89a?=
 =?iso-8859-1?Q?SEypKE1adJu9yDg326D4RcRB6XVmdq/1qqEILYtH0YkvudoqfjS5gnosm7?=
 =?iso-8859-1?Q?AUjM7OXXpl8tEi0/63W8ek+mHRKvLQmVFt60FsfRwzqi4FCCwXwqWNtF5T?=
 =?iso-8859-1?Q?UiiriuHnrXUI93TuU7gD5EWtolv1TK/rBVi4eehWBWCFenUqU00elJTR/q?=
 =?iso-8859-1?Q?bee3BFEY/pqdLxNmWl0HyjkVWqDQjDtto96FHSSEjhJUjzYY0gIBxZF/7f?=
 =?iso-8859-1?Q?MvgZy8kbLDy8bEGvubFVCIvP0MOyHzxGWIXAVL4g3hrKdTuzkW8zvURbNQ?=
 =?iso-8859-1?Q?uaj80BoZespVu7ttWUqS8pD16b5V6KXImusBWyFxAHHika5DRkuLg6Ymgr?=
 =?iso-8859-1?Q?Qy3Y20UVSsyykO0s8f6uSfwmepReGxKvd2+CCc20jxVa/IgHo5nmPvu0Z5?=
 =?iso-8859-1?Q?5hFNXNNAs9JLzNNKSRpQU96KXNUJrnNIwEwMvfhQC8zm/Fz3ykA94wuWMA?=
 =?iso-8859-1?Q?xAc3Oims+wqO/tHwCN0oOL7OBFgyI5aGHdWgX43CbuwXo9pZJC79UvzoaC?=
 =?iso-8859-1?Q?/cNYIjdL9vBHR78gcDQwDTbkQGe/1gSdxz5PrMxMnWPQn1D1MSoD8uwkf8?=
 =?iso-8859-1?Q?qs8XFVg+EIgFfrqoynsPUjbV7jQUzGvznJpS96f1d5RLmQGZnKa7oorG9l?=
 =?iso-8859-1?Q?3W+uJvA+h/Oc9HrOFY3IChHBIPfM8YjFMqVNbZdiYeYmnkYpVjlhRCDcX6?=
 =?iso-8859-1?Q?JYZeZu9EYBSA2W8d8vBiiHwaqH+0X2o79s3ySkZ07QYpm+iHNgCsPD7co8?=
 =?iso-8859-1?Q?A8a+ESHWVlqoS5JfCsi9Q8eQULxDoKQ1/OLkpk63m2oRPM28hgPMJEYggh?=
 =?iso-8859-1?Q?fdoGRo3RoEQzGD2bNfjxKOs+pW1Mpc8RIlU133i0xkZJKKeRdg/3c7oJNd?=
 =?iso-8859-1?Q?YNheR7JUcUWYitVlNXieWnLI87tgRQTFTowpk0AnafCvQ1XtN3q4g2SF4D?=
 =?iso-8859-1?Q?B3yL93AdvPdD0oK2kiKP5VdK59wtKnxviHTjSuRZDMlIbUyAScEeMtaGXE?=
 =?iso-8859-1?Q?p96paJruePj7ZxaWtohjmgE8Uf6cxuua/smjZr61Y4nieMBOXMmjqYuLSw?=
 =?iso-8859-1?Q?9yrGIknhnGN8D8ZwioFA3NbfeU2/PWuh3lSoeSGmdYEAtco0Vz2GtuEb/v?=
 =?iso-8859-1?Q?w03/va3V801IJTrYOeKRZwP3AeUrfFurY3g3r6p3r/qmAR2/1tgxF5DGud?=
 =?iso-8859-1?Q?lQxKWozuf6wvD36D1V52qMJU7lqOaJsPraH+ykQgFgsZNr39s1LIQzJobG?=
 =?iso-8859-1?Q?NmrhOtsg3C3cM29FghoPl8ymxauZSmkr3iS0GE8r4twUlc5cgTnanVHydT?=
 =?iso-8859-1?Q?mEqk6OEh4HicYQzm3sjU24wHZOqy1MWo0fJh/DKlKLhrGSRzGCw21kJjRg?=
 =?iso-8859-1?Q?gPDO0Yd3Nr++nwnIFyB7QvZJzkYZUU+yPv9XPf3GJTl+UBarTWgqu9rsGx?=
 =?iso-8859-1?Q?sl1a8Z+GxJnmnS9DCl9fHkBnTFw45LAcJtJ1F/UFuhOKAOLnjrxL3LQDQ1?=
 =?iso-8859-1?Q?Cqx/ZczuT+bRCzLz49sHgHR8x4OHj29vsRDy7lGklGfUHpSoEWpUioXg?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f411987c-d537-4a49-e335-08da902b1c9e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 17:13:26.7482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+fam7ZgAyLIri0UBUo7D8yypIgko3Zwtz/F6ToEW1b/n24h2TMpZ73unMWyB0yJr2r61+JXDl66/PSFfcJd5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5773
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_09,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209060079
X-Proofpoint-ORIG-GUID: 8D8V_Z8GXYNRqCkff_EyEPBlYC1R42Uk
X-Proofpoint-GUID: 8D8V_Z8GXYNRqCkff_EyEPBlYC1R42Uk
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
Cc: Naoya Horiguchi <naoya.horiguchi@linux.dev>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, David Hildenbrand <david@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/05/22 06:34, Christophe Leroy wrote:
> 
> 
> Le 02/09/2022 à 21:03, Mike Kravetz a écrit :
> > diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> > index fe4944f89d34..275e554dd365 100644
> > --- a/include/linux/hugetlb.h
> > +++ b/include/linux/hugetlb.h
> > @@ -264,6 +255,13 @@ static inline void adjust_range_if_pmd_sharing_possible(
> >   {
> >   }
> >   
> > +static inline struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
> > +				unsigned long address, unsigned int flags)
> > +{
> > +	WARN_ON_ONCE(1); /* should never be called if !CONFIG_HUGETLB_PAGE*/
> > +	return ERR_PTR(-EINVAL);
> 
> This function is called only when is_vm_hugetlb_page() is true.
> 
> When !CONFIG_HUGETLB_PAGE is_vm_hugetlb_page() always returns false, so 
> the call to hugetlb_follow_page_mask() should never be compiled in.
> 
> Use BUILD_BUG() to catch it at buildtime.
> 

Yes.  My bad as David suggested this previously.
How about we just leave out the function in the !CONFIG_HUGETLB_PAGE case?
We will get build errors without the need for a BUILD_BUG().

> > +}
> > +
> >   static inline long follow_hugetlb_page(struct mm_struct *mm,
> >   			struct vm_area_struct *vma, struct page **pages,
> >   			struct vm_area_struct **vmas, unsigned long *position,

-- 
Mike Kravetz
