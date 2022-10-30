Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98148612DF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 00:01:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0sGR4cvMz3cMN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 10:01:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=KY1eJ8c9;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=SuG+hwTQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=KY1eJ8c9;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=SuG+hwTQ;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0sFV6LjBz2yyZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 10:00:29 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29UKl1tj030886;
	Sun, 30 Oct 2022 23:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=dXLIf/taVyg7PloliALSqDqS2P1kGAPwWAtsA/CYDoA=;
 b=KY1eJ8c9cvlQldz/DcBMKRPcgOaVMSM0eMzs//2/xJg4a1+lYZmZI5FTxe4FSc0Ucml4
 9ywSpTBeYD1W69L7qFaZQu0xXdRQsEWZkOE6RSa+2hU+KXm87ETCsGMC6lpIIapwGBcA
 M+1E8dNFD2XubC+JCzRchSA4+kSSAvvx4MAklzcguLuB7MBnz4MabyhczHsWfz+DLJ8I
 l7hpueNqbSuJI8TZbMrsId1T66Jf4Y5DP90BityedIx2R1kdAi6Dw8yHlTNO9wtI1Pdz
 8nCEH5OpPkh64NLpWZidzKiDzTyG1ncNU0zLiueGW1QLVfuy0+dnnRw4DlIJi1EaqR7Z dQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kgussj1k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 30 Oct 2022 23:00:14 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29UE0UnX019665;
	Sun, 30 Oct 2022 23:00:13 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3kgtm8mmj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 30 Oct 2022 23:00:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agyNU3pVMqf4XEEhHPgiuMTxFGmLI3/RHIiAAnPoQxBUa4Agj4VYBEIxTGKVinN22Cac1pue4147d81RHNhvTMlXI9OzKYUYqQxnLwqdWC6041Z62u+iBX4aJiHxa8rA+ijRnewi4QfU87dJ4rBZNzqGFh+Y7B40FCombRn4CxtkNzUJxNNKfCrE8D1xOfRp60W56CRtHJP8SP9SqGV+gLCt4nS+4bLomvmdsa8Um//b2AVVNhPxf+155/2yaIcPG7kgLUbKp/tR2Q3fXDGoSBkGj+bTmUtoK8NGkqq/ObRdTOsMi6l0sb3V4t6FyySZ+oNrlUN/h88b6ImOcUwkpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXLIf/taVyg7PloliALSqDqS2P1kGAPwWAtsA/CYDoA=;
 b=oClYXYHm5ywrO0miPDbihSEWs6Jnxpwf5QqqAMeRbvtxEWbRHtI3yYClM8BtW9DQBjCL2o3y4/fDj2lNV/rMqEXkCg24FefA40DMaf9Tmj/8NDcf+byqeLgznu+1f6u4ob676qZ+WsCEdOxCbOg5G2ARKVSDimaq0q8XS3zDIsNZ4Se8/4IHtluliyPLTyEeEOywptW8IvHRTMj4a8I8K9b5A0+/w/Mgb3WuYyDVtsYLNXFyT+wNVVfzO9o++liQDpDBAFunX04c51IXV5afbU7roIz01NRdVItAud6t3Em8DC7hSiL/j00yBwDqqkiMR1RnZDGXmAGkrrgsQNPNTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXLIf/taVyg7PloliALSqDqS2P1kGAPwWAtsA/CYDoA=;
 b=SuG+hwTQz0iAqTSD9oJuJTuaI0Q2uYw0kJvEMJyT3ZQk5V2OjkdcfDY5vWkdhMbGgwiFAVGRoS9HKEW32Muc2T8kOKIV52wUKOxsGeFw9+NCMJex5LQ4fy4luXjLm5Vn6FxroLjY0sSKruQ3XIzJ7toHlH1+ZL+7q8k3wEO+jdA=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by MN0PR10MB6008.namprd10.prod.outlook.com (2603:10b6:208:3c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Sun, 30 Oct
 2022 23:00:11 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::58e9:95ba:d31e:ddd3]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::58e9:95ba:d31e:ddd3%6]) with mapi id 15.20.5769.018; Sun, 30 Oct 2022
 23:00:11 +0000
Date: Sun, 30 Oct 2022 16:00:07 -0700
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4] hugetlb: simplify hugetlb handling in follow_page_mask
Message-ID: <Y18B9yYTAqrQ9Zvu@monkey>
References: <20221028181108.119432-1-mike.kravetz@oracle.com>
 <Y17UPk9CBjPumcz6@x1n>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y17UPk9CBjPumcz6@x1n>
X-ClientProxiedBy: CH0PR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:610:33::35) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|MN0PR10MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b9a174-f326-4651-faad-08dabaca7f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	eziJm4f96KRujnphlm48DpeK3808VxiOhbI076fvYdb/GhVSsTM+5cB/XZJzAys1jA09z/DTend+aP7vo6tg88CRFe5/kgtnmk8eT5V7Ng9t8F63yyBqynsqw8bZ1IWAPovZ/dkX7qqACpcwu7rW1C5VWvYNSaAQFKhnaoIDpBFrE27UR3u5UeG3munkcOBNoqFw7gYz5CYiGJtbsgRFAwvxxgZ5MNr8ishnc/REdEN5aJoKJhiOW+vVVgB5VMrzlmCSDzksFb0PUsl9oUqgKp8Wo6VTssjzg8FtPykTAyC0jC+Y5WDSWBd7um1L7hZDUKPKpHf9JG+ieyFkfzolbw03KopXjDn5zu8iTzenYfpTDIkByKDz419Vjpv9P4WdV75/TLxqObIHtdnG9CjJZaZPXZjBfowNdRqGo2uT9w0EsaArluRIICS4hlD0wAKMG0QY4w74jhEodHoHqNkNnG3Ijigi+5UY/oSWoABfZY1OySQuqCa1gmwu9PWXTtk3oSl9bGpvIpAjvwRPUde4Z0VZNOZAv3DsjnAFoKqTWiBvFk+EE8HUzsbrduzdHOxz5HGG177S07dneygIQZyJ/yHQQAgJAXK2iNbvBjip8CxaK9lroZ0RSeOvf4k0Hr4peG/23mJm32qLMQ54VQFRMqlsZnkC5IeOwHRi1FvpMnizXujoUPNhFyhlz76cKxQpX0QOynhDMqLsTveceutCiA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199015)(478600001)(83380400001)(86362001)(4744005)(38100700002)(2906002)(5660300002)(44832011)(7416002)(6506007)(66556008)(66946007)(4326008)(66476007)(8676002)(186003)(41300700001)(53546011)(6512007)(33716001)(8936002)(9686003)(6666004)(26005)(6486002)(316002)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?bwEtU5N6xz1kGr5e3kpvrpkugEzHp+7NZu39UwdvMMmvxG76cai8PGinY84n?=
 =?us-ascii?Q?CPErZk8l3Hv40aT0FbbjXPSH5wZKilgeEtl9nwFJ4IMgcdPnr6O4dJdu/45+?=
 =?us-ascii?Q?TrdAKOz5QwSdgnkjyNvKtbfskqC5O8m91l8eG/Tfy/Go+SF/ObNlfwuxvgBb?=
 =?us-ascii?Q?CZ8EZCEcvUg2Z8r26m9kMKuEUX14dT3xoqhmeBHyV8SCnoXKV7idnnvAoWil?=
 =?us-ascii?Q?XiJG2hTg5eY2kS8KT4E34Z1rGHFMdPW6SclFkzb7s5AjoINBJWTpbmRo6Deu?=
 =?us-ascii?Q?fDpfV0Mu5GgIwR5wCYGaMVDkFv2199gwEBBdZQUz5aL98Mm4sbipvzlszCrn?=
 =?us-ascii?Q?VBGaz75WqQGlNo4ihG79Yv0n8lw+iirxTFXIEsCfYOwjH9cavvkoRrxefouf?=
 =?us-ascii?Q?cmF5eyxkhijRGrZ4MCPojLcIXO/CMrPsDrIfEOcgtZ0rbqYfu5WugVr2JJSJ?=
 =?us-ascii?Q?rxxOIAPrV8fmFumQSbm9rfw+5byxqJFJ1V9aeQBAYHsYawoMQfImWcvbPnRS?=
 =?us-ascii?Q?yQFZdbWCHrWMgJqJTnccjCJJN9UTmvIpJ8x54nng2l07j7tRG2OPW0a2Cpu1?=
 =?us-ascii?Q?Z4Ih7YUDRvSmlxU+QVxyY/DlQ6QBiZiug6ZTK2G2o/lLTrCPNMddPDYHccNc?=
 =?us-ascii?Q?qSLZGbuM7KhPD7ZimqsT1j+9O5el4neJESOBTl5PdgqlrzgfOAjnqWsy8oMu?=
 =?us-ascii?Q?v6tc3wBeeKzb4ohUatdN2XLepnRvmUxupO+zzz6CHVCyJA4atzh7Sb9jk7+1?=
 =?us-ascii?Q?lEeHtszDQ5sa+ybnIjMcTXhNlC1zbVo1Ic6DbcIg9Sb3NSo7elbGwmhHl2sh?=
 =?us-ascii?Q?j19pQ4+U6cqySxjWiRxCqjSKapzMbmaonHQI/nht3Ewyly45oXvTaAADDz71?=
 =?us-ascii?Q?zyyFaVoj/Ul1Ev8BucpzYq5svml87J/UhyJIRq6pNhp/4fWhPZ4zN+xTkrDQ?=
 =?us-ascii?Q?vmLZTHSGmX6zeAMv4tcWn0sj9f15l2YgCyCaoJbBi7YdIyfbDrzrK4H3Hw3x?=
 =?us-ascii?Q?KpAR5ZaMkrDP4ZDu5bHjbSyZszVfuPgwywx/YW9YuD1Mwx6NhXVF9LR/x5Us?=
 =?us-ascii?Q?RgFT0H4CNjJl0gDkSIyv853KvCsBRyDeYhN8DNV75gPdD7U4K67JR+7wEtk3?=
 =?us-ascii?Q?n+/ogaAUrH1OYvplPPhiJ6g10QHZSf6RZZPCYFISocJAlr/44ern/+QkVjL3?=
 =?us-ascii?Q?UxbhH0QfCCyoeokoNDbaRKGW+KwGzd00qbGMZwGMGk5Hs2gncRjEPhnwzWB9?=
 =?us-ascii?Q?x9ed31GLKnEPwCrdbsc3st4qbdrWdcih2aUApHV/aucrtYQnPbrMvOV+vNo+?=
 =?us-ascii?Q?q/8AXGhqIbGbEgLu00mqqupfLTXFlYwGU5gp0MoZoDpBt8rIOryeU7rZ4Tlp?=
 =?us-ascii?Q?5v7sbXskr9oJhAuWyK/Zj07E+5l1BrbIsWnxEhpIyKxkJ4gL5egg4b+ZgTyO?=
 =?us-ascii?Q?p4bFq3/OITANVSZRCL2qxEoS77wjq4YnqFFUpBsymjCDayhAZJ0gMTXze2HO?=
 =?us-ascii?Q?XxSyLlV53X4gogQiOd7UEtdfZZMuGDneLcvaXUmlv/jB7155EyTrTcIzDsGT?=
 =?us-ascii?Q?Nu8l1dx9MKXlphQcMldhCTG/X17FdBaRR6eFTRYKRv8EwKOAKlnKOI9/msuS?=
 =?us-ascii?Q?zA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b9a174-f326-4651-faad-08dabaca7f60
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2022 23:00:11.0662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6uNHIUYPHrFJ1eIPpRagTOV0dwXRUYAKKT0Xsh3u9maAb0+BPhq00Z14OvtNIpd8/YaQUoP/sDp4TiCtxFNvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-30_16,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210300156
X-Proofpoint-ORIG-GUID: WaPlXv2FINOUKjsswUdO2UtED5eiQyYc
X-Proofpoint-GUID: WaPlXv2FINOUKjsswUdO2UtED5eiQyYc
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
Cc: Naoya Horiguchi <naoya.horiguchi@linux.dev>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/30/22 15:45, Peter Xu wrote:
> On Fri, Oct 28, 2022 at 11:11:08AM -0700, Mike Kravetz wrote:
> > +	} else {
> > +		if (is_hugetlb_entry_migration(entry)) {
> > +			spin_unlock(ptl);
> > +			hugetlb_vma_unlock_read(vma);
> 
> Just noticed it when pulled the last mm-unstable: this line seems to be a
> left-over of v3, while not needed now?
> 
> > +			__migration_entry_wait_huge(pte, ptl);
> > +			goto retry;
> > +		}

Thanks Peter!

Sent v5 with the that line removed.

-- 
Mike Kravetz
