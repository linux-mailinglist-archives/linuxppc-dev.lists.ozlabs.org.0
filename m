Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20911612DAD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 00:00:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0sDs0Sn4z2y35
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 09:59:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=BOl26ELK;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=FXIH/qHq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=BOl26ELK;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=FXIH/qHq;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0sCn4lxqz2y84
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 09:58:58 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29UKkJ0p032245;
	Sun, 30 Oct 2022 22:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=mQo8rOBDj7aG2zD36VxPtkka+w2aAvo1G40CgE3MFYU=;
 b=BOl26ELKtFA0GiJZCftNrsPUif0uW1gRdHnn0YW/wyZRf2YJz5VjfbVFm4so6daLzpDX
 s/9NFYgn97Kj+v3q93Vm0cT00lMBF1uWgGOADJHQ3Ws+NTp2cBmNKcBxyKGl8JV5z+gm
 MgUWSxokgiD8rIjL7vUF+c2fnd+sj0QRuAFX9z1HH7K15A0EL+wE2lR1M2ArAjQboCgi
 naVCpM4ttqYPNioQW/A97aPhyV3F6IDWZYzOKjlDMpLzU+Q642fDzHKaicc7j1NwFN2I
 2jxKiskp/A8XRrQIDOt83GkZTHTQJduqmWvDpnCDpAvAhih9TFoYHHLV0oaSvyBTjtaK /w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kgtkd22pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 30 Oct 2022 22:58:33 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29UEVUKX019375;
	Sun, 30 Oct 2022 22:58:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3kgtm8mku9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 30 Oct 2022 22:58:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHgS1/u4HzHDrMtBx0u1X5QSShog7+60e82nkklCqLka6m/SvCNlWdqYvtbJYCRzdojgzXczMvSqITj/M3P1N3R2ni/3YAQhLV7HAs99v95PZa6dSei++SM47XVuxahsx3IsrBx/hjcUrT85hHQu0oMwKpOo14mUrfObHpouaWH6+pKYemh85Nzab3ih70QLi1Mro1Wqg/vCDNgR+GzKaLRtv80O6tLZBHQ6Yx53HgWpwA/Ujcdpu+GCByZAvfJtwWvPAz0KU+hza61R8cMvEK3Ebs6LCdzmU1rKAgirZK5eu6RJLrQDUa1QiWTr9JH2M8sHNMgqOPXAqllkaKCOeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQo8rOBDj7aG2zD36VxPtkka+w2aAvo1G40CgE3MFYU=;
 b=nk4E4xYiAPqt9fnt0QDgRmi1ird33IDFxoUSEqDgiA6L8XmtWLdEMdrDUQUl1lFOoVpY5txkgBJ76o1PCVVqO5NdrFpRsBJAbvNIQAKPOPbI7En/C9bCMwKczhFhpoL8tienNNO8EwCAatU+XF/1Kz0lXn1NDC3d2wctVyUXx/jbI+l5/y6bWQdTpPbeBEqMTrntiby/UqeK5gy/Ng23wKecMZoSkq/XNSZ0/E9X0ZH9FoRyZm2nRtL1UvpUzLkHsyYRMo4wQ/4GAJUa0156Q58YW4gKvmKshYWDjPWy1RLVfUnTMtB2dvW9NegU/WXxUTPUjyhryKpu4ZcYpJKBaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQo8rOBDj7aG2zD36VxPtkka+w2aAvo1G40CgE3MFYU=;
 b=FXIH/qHqOhx+PA9bIozlhKLflfsNZeTypoCFNbDWN3fYvVNQdLE8gOxB9JebPXr4vGbPY3nJOSQUohyB207bxDFYAMDtnj32wWbFL6H+BuUieEaB9XTsm6R3hXbdhfq30nYLA0OM17MknqjlYCZV0ivAmWbfqEAikfjLJJ9qlR8=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by MN0PR10MB6008.namprd10.prod.outlook.com (2603:10b6:208:3c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Sun, 30 Oct
 2022 22:58:31 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::58e9:95ba:d31e:ddd3]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::58e9:95ba:d31e:ddd3%6]) with mapi id 15.20.5769.018; Sun, 30 Oct 2022
 22:58:30 +0000
From: Mike Kravetz <mike.kravetz@oracle.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-ia64@vger.kernel.org
Subject: [PATCH v5] hugetlb: simplify hugetlb handling in follow_page_mask
Date: Sun, 30 Oct 2022 15:58:25 -0700
Message-Id: <20221030225825.40872-1-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR12CA0010.namprd12.prod.outlook.com
 (2603:10b6:610:57::20) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|MN0PR10MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc4b636-d122-4dba-36e8-08dabaca438b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1UK9gH1lShjEKHIoz42oYBr8TWzwjalEZAjIzc71Qvug/4neYP45ksrzWm0KKGr8116VOkjCWXYYLARgs0QE0UdMX5KqwDP9IhE6a9sSHEXgHBbla2Kc918aDvcH51YGzWiR/W1kOlfBJtWqzETGbVJePv3w0alWTKAOGgcR+GRex9fH9b5b/PCr4/Qn0vyziatlnsiKtCZAOi+rNYjMw2xdow4Qqk7JabDx2iGazwLpo2QXyhk4vGJEp6EvZuKNqgM3Pd4aa7h03SczJB65Din8MIy3CKSB2OOe1PkHkq0GasyeG8OaCj5UhGzBIcs5jPzdb/Rc2wikCJxmcZi36ZG1rzWb4aWhTT/NSjgUtPlVNZgTUnKTZ+oB7jc8yl0iqu01N2dYoHKfy78EI6Xawu5H2J/GJFrTLgLLA5a9eL+ppMT4CDc72j4lii72fFLjd3iS/dc2I/yVdJH/QTZhjN2MbzaMVyhKhG1hjQ1pKEvqPXo1ELpdODZOGGn7tgWlWiDvYHsM49wBm3wQf6375PHMq9QWMvqQV4Zt7fJBBXcZwXjsPU4H+uC8rKw+1WeD3GXB3xXy2F1Rw6xc/xynjvbTFRcvEQgye3AJEbN6sH7/rI5vkGYxb0T7Rxbkud7qronQlyvrvREJ5jnR57UfsYnoH7icbL93CJ8sJneH2RA9+3x6+z4eNkieulw12Mj+LRNVFsu+W7OBLTPRkYnBcsYbxCPihv4kaSaqsAM+jF0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199015)(478600001)(83380400001)(86362001)(38100700002)(2906002)(5660300002)(30864003)(44832011)(7416002)(6506007)(66556008)(966005)(66946007)(4326008)(66476007)(8676002)(186003)(41300700001)(6512007)(8936002)(6666004)(107886003)(6486002)(1076003)(2616005)(316002)(54906003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4x1vAFfG4up2X8pKizobXK9rfoGLPRgLhUiLPMZ8bjWcRY3tjJyJKVI389fH?=
 =?us-ascii?Q?pY3Xx5FtQ2vvhu3wOLJGJ2PVW6Qd89WMwGh+gEODNG3cYWyU0/N7caxaxT82?=
 =?us-ascii?Q?c3o46ZPVVNmrlZZ7zzHorxEA63ioj80KHQ/3LON7ZFBcR/HAtusgAJ7q4mMr?=
 =?us-ascii?Q?FaOxAXjY4v2/rmqufBrzPYClNK4Q9EH7vB0eHIsVeNDS6UbBmRD6bkPcxThW?=
 =?us-ascii?Q?CGJNKxCjCDQCB1ThMGjHKFVAbxrkc5ABuya8Ylz7TKRLoM7YsekdkxQifntf?=
 =?us-ascii?Q?iLntlH4TDsFOITyGgImcTBCfGDBYBAZyCcqS2SrAagnjGX6RhZO2YJDUf0PO?=
 =?us-ascii?Q?AHg16+IiVFUiiYLqI5lxdFwuSW6Bi64eqgxPnqsmZHn6KNZxMnpve5UhF0ka?=
 =?us-ascii?Q?jBaVnU9aRIGHBjDQpUB8vEuresY0hs23/i+nW9SIQOoknMwBa1Tc2L6FWJ+X?=
 =?us-ascii?Q?G9hRIrAjM+C3COA2pReMh6s0fnLF/vOqCJBEvJgeytJsr5+gQmvyKRaDqvt3?=
 =?us-ascii?Q?CGpyvJ8gtt0P6x7lmnWeAPdS/He8tU97reJvhI/M+KkN/8gLhQ64SrA0gEJ1?=
 =?us-ascii?Q?SPji4jaBHdKb38s4wrsUi46Oy2Ex7NQ+JeqqgbJlQDD9KBJmFgsjEYMBO5/G?=
 =?us-ascii?Q?gJ9UMz7s9xZtmSBM89db60+N5pOa7uZaar4k14eOu2Dac9iR92EG9HZ/42DD?=
 =?us-ascii?Q?VUhS7cw3MKME25smsSAOWMaaLHiaL2/R6G+FJWOG7Q6Bx4VGNnlJJDl+o3Kc?=
 =?us-ascii?Q?fWhdonCeC/TsoGwUH296fGLl2j4agh+SGmFOVnAbX5h0v5h7vFNkg3u6TOk2?=
 =?us-ascii?Q?ub53+LJwotNuZtvXacebi7AnIAAgFAWjNH8/4F919g0nIeMRtrHbWhCNBO9m?=
 =?us-ascii?Q?cvhpKGiDB/fXXz9fbER12Zg85AMewDksnrINotH46Ugn0u4WSM4TDww3GeLf?=
 =?us-ascii?Q?d0eqTpCrMyaAEA6vyue4zYNBwrw0Mq+7q4+KDSLKZUZTP+TQ+JsP7YwcsEGp?=
 =?us-ascii?Q?AjB+qhGuZiMWLFfrxsEaAwE4g8+GRtBg5VCBI1+bxKbgVrUiraZYKIk036JH?=
 =?us-ascii?Q?+jGxV0dxv1MIct4w2vWEe6dXgI7Mx1iCEn3pWZvhesoI1hUfa/R+o1cq+482?=
 =?us-ascii?Q?0odjz7rVS9wnKQqDo5Y8yPh8G8aeDJ/BhcLKvn8lhCQIhQlvMX1MEG+7nyNO?=
 =?us-ascii?Q?zjX2adL1BOgAUUN6Kq+aeJayC6BAnini4L/SOfDPp7Tk4XkngvMiq6voSj1o?=
 =?us-ascii?Q?TMQStUtpiUut/exGa2vdjIb4Qqix4NUneDFQCBWmNkjH2ScEOjvhRROnGiqH?=
 =?us-ascii?Q?dTRExTA+LY2USdy0Nwa/TW7c/dahkR+KJZRbW1Tbx5lSlHcm5uiGthH6oYJZ?=
 =?us-ascii?Q?h/8W7aXxG3ij3uJQ/2zwSHcW90gCmx+vqbacbcUkMCehE7EiYDOEp1njaFT/?=
 =?us-ascii?Q?XFCk9uRk+v+J9BClg8sML+MIU7WOLozmLGxHUcFjvuEVkf9AW6nFW1m44jyr?=
 =?us-ascii?Q?LfirOHA8cPjElu+bOIds7v4zxSgZiQ6qahitkN+TJwDux8sObz6DStgCU0Wr?=
 =?us-ascii?Q?2TiMPbkvp5dmC/IYjAkGl+vGg91ImB5Drs3nlt9KWSbkWs+lSoABpZWHVOV4?=
 =?us-ascii?Q?voeNJsvoD7amCzjLF861SQE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc4b636-d122-4dba-36e8-08dabaca438b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2022 22:58:30.7578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hYTwKh0w5cAqPljTw69Zkcr6ORaJU4kC8zhSdO99BPkaCa/Flq1ihiFKwvLqrCmUG14iQ9j+sHLuu/I7adjMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-30_16,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210300156
X-Proofpoint-ORIG-GUID: mqsPieJfrxjOInPb6si3skp1aLI0ovbo
X-Proofpoint-GUID: mqsPieJfrxjOInPb6si3skp1aLI0ovbo
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
Cc: David Hildenbrand <david@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, Peter Xu <peterx@redhat.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During discussions of this series [1], it was suggested that hugetlb
handling code in follow_page_mask could be simplified.  At the beginning
of follow_page_mask, there currently is a call to follow_huge_addr which
'may' handle hugetlb pages.  ia64 is the only architecture which provides
a follow_huge_addr routine that does not return error.  Instead, at each
level of the page table a check is made for a hugetlb entry.  If a hugetlb
entry is found, a call to a routine associated with that entry is made.

Currently, there are two checks for hugetlb entries at each page table
level.  The first check is of the form:
        if (p?d_huge())
                page = follow_huge_p?d();
the second check is of the form:
        if (is_hugepd())
                page = follow_huge_pd().

We can replace these checks, as well as the special handling routines
such as follow_huge_p?d() and follow_huge_pd() with a single routine to
handle hugetlb vmas.

A new routine hugetlb_follow_page_mask is called for hugetlb vmas at the
beginning of follow_page_mask.  hugetlb_follow_page_mask will use the
existing routine huge_pte_offset to walk page tables looking for hugetlb
entries.  huge_pte_offset can be overwritten by architectures, and already
handles special cases such as hugepd entries.

[1] https://lore.kernel.org/linux-mm/cover.1661240170.git.baolin.wang@linux.alibaba.com/

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
---
v5 -	Remove left over hugetlb_vma_unlock_read
v4 -    Remove vma (pmd sharing) locking as this can be called with
        FOLL_NOWAIT. Peter
v3 -    Change WARN_ON_ONCE() to BUILD_BUG() as reminded by Christophe Leroy
v2 -    Added WARN_ON_ONCE() and updated comment as suggested by David
        Fixed build issue found by kernel test robot
        Added vma (pmd sharing) locking to hugetlb_follow_page_mask
        ReBased on Baolin's patch to fix issues with CONT_* entries

 arch/ia64/mm/hugetlbpage.c    |  15 ---
 arch/powerpc/mm/hugetlbpage.c |  37 --------
 include/linux/hugetlb.h       |  50 ++--------
 mm/gup.c                      |  80 +++-------------
 mm/hugetlb.c                  | 172 +++++++++++-----------------------
 5 files changed, 76 insertions(+), 278 deletions(-)

diff --git a/arch/ia64/mm/hugetlbpage.c b/arch/ia64/mm/hugetlbpage.c
index f993cb36c062..380d2f3966c9 100644
--- a/arch/ia64/mm/hugetlbpage.c
+++ b/arch/ia64/mm/hugetlbpage.c
@@ -91,21 +91,6 @@ int prepare_hugepage_range(struct file *file,
 	return 0;
 }
 
-struct page *follow_huge_addr(struct mm_struct *mm, unsigned long addr, int write)
-{
-	struct page *page;
-	pte_t *ptep;
-
-	if (REGION_NUMBER(addr) != RGN_HPAGE)
-		return ERR_PTR(-EINVAL);
-
-	ptep = huge_pte_offset(mm, addr, HPAGE_SIZE);
-	if (!ptep || pte_none(*ptep))
-		return NULL;
-	page = pte_page(*ptep);
-	page += ((addr & ~HPAGE_MASK) >> PAGE_SHIFT);
-	return page;
-}
 int pmd_huge(pmd_t pmd)
 {
 	return 0;
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 5852a86d990d..f1ba8d1e8c1a 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -506,43 +506,6 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb,
 	} while (addr = next, addr != end);
 }
 
-struct page *follow_huge_pd(struct vm_area_struct *vma,
-			    unsigned long address, hugepd_t hpd,
-			    int flags, int pdshift)
-{
-	pte_t *ptep;
-	spinlock_t *ptl;
-	struct page *page = NULL;
-	unsigned long mask;
-	int shift = hugepd_shift(hpd);
-	struct mm_struct *mm = vma->vm_mm;
-
-retry:
-	/*
-	 * hugepage directory entries are protected by mm->page_table_lock
-	 * Use this instead of huge_pte_lockptr
-	 */
-	ptl = &mm->page_table_lock;
-	spin_lock(ptl);
-
-	ptep = hugepte_offset(hpd, address, pdshift);
-	if (pte_present(*ptep)) {
-		mask = (1UL << shift) - 1;
-		page = pte_page(*ptep);
-		page += ((address & mask) >> PAGE_SHIFT);
-		if (flags & FOLL_GET)
-			get_page(page);
-	} else {
-		if (is_hugetlb_entry_migration(*ptep)) {
-			spin_unlock(ptl);
-			__migration_entry_wait(mm, ptep, ptl);
-			goto retry;
-		}
-	}
-	spin_unlock(ptl);
-	return page;
-}
-
 bool __init arch_hugetlb_valid_size(unsigned long size)
 {
 	int shift = __ffs(size);
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 8b4f93e84868..4a76c0fc6bbf 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -149,6 +149,8 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 			     unsigned long len);
 int copy_hugetlb_page_range(struct mm_struct *, struct mm_struct *,
 			    struct vm_area_struct *, struct vm_area_struct *);
+struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
+				unsigned long address, unsigned int flags);
 long follow_hugetlb_page(struct mm_struct *, struct vm_area_struct *,
 			 struct page **, struct vm_area_struct **,
 			 unsigned long *, unsigned long *, long, unsigned int,
@@ -209,17 +211,6 @@ int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
 				unsigned long addr, pte_t *ptep);
 void adjust_range_if_pmd_sharing_possible(struct vm_area_struct *vma,
 				unsigned long *start, unsigned long *end);
-struct page *follow_huge_addr(struct mm_struct *mm, unsigned long address,
-			      int write);
-struct page *follow_huge_pd(struct vm_area_struct *vma,
-			    unsigned long address, hugepd_t hpd,
-			    int flags, int pdshift);
-struct page *follow_huge_pmd_pte(struct vm_area_struct *vma, unsigned long address,
-				 int flags);
-struct page *follow_huge_pud(struct mm_struct *mm, unsigned long address,
-				pud_t *pud, int flags);
-struct page *follow_huge_pgd(struct mm_struct *mm, unsigned long address,
-			     pgd_t *pgd, int flags);
 
 void hugetlb_vma_lock_read(struct vm_area_struct *vma);
 void hugetlb_vma_unlock_read(struct vm_area_struct *vma);
@@ -272,6 +263,12 @@ static inline void adjust_range_if_pmd_sharing_possible(
 {
 }
 
+static inline struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
+				unsigned long address, unsigned int flags)
+{
+	BUILD_BUG(); /* should never be compiled in if !CONFIG_HUGETLB_PAGE*/
+}
+
 static inline long follow_hugetlb_page(struct mm_struct *mm,
 			struct vm_area_struct *vma, struct page **pages,
 			struct vm_area_struct **vmas, unsigned long *position,
@@ -282,12 +279,6 @@ static inline long follow_hugetlb_page(struct mm_struct *mm,
 	return 0;
 }
 
-static inline struct page *follow_huge_addr(struct mm_struct *mm,
-					unsigned long address, int write)
-{
-	return ERR_PTR(-EINVAL);
-}
-
 static inline int copy_hugetlb_page_range(struct mm_struct *dst,
 					  struct mm_struct *src,
 					  struct vm_area_struct *dst_vma,
@@ -320,31 +311,6 @@ static inline void hugetlb_show_meminfo_node(int nid)
 {
 }
 
-static inline struct page *follow_huge_pd(struct vm_area_struct *vma,
-				unsigned long address, hugepd_t hpd, int flags,
-				int pdshift)
-{
-	return NULL;
-}
-
-static inline struct page *follow_huge_pmd_pte(struct vm_area_struct *vma,
-				unsigned long address, int flags)
-{
-	return NULL;
-}
-
-static inline struct page *follow_huge_pud(struct mm_struct *mm,
-				unsigned long address, pud_t *pud, int flags)
-{
-	return NULL;
-}
-
-static inline struct page *follow_huge_pgd(struct mm_struct *mm,
-				unsigned long address, pgd_t *pgd, int flags)
-{
-	return NULL;
-}
-
 static inline int prepare_hugepage_range(struct file *file,
 				unsigned long addr, unsigned long len)
 {
diff --git a/mm/gup.c b/mm/gup.c
index fe195d47de74..6b16aecf5d2c 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -537,18 +537,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
 			 (FOLL_PIN | FOLL_GET)))
 		return ERR_PTR(-EINVAL);
-
-	/*
-	 * Considering PTE level hugetlb, like continuous-PTE hugetlb on
-	 * ARM64 architecture.
-	 */
-	if (is_vm_hugetlb_page(vma)) {
-		page = follow_huge_pmd_pte(vma, address, flags);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
-
 retry:
 	if (unlikely(pmd_bad(*pmd)))
 		return no_page_table(vma, flags);
@@ -680,20 +668,6 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 	pmdval = READ_ONCE(*pmd);
 	if (pmd_none(pmdval))
 		return no_page_table(vma, flags);
-	if (pmd_huge(pmdval) && is_vm_hugetlb_page(vma)) {
-		page = follow_huge_pmd_pte(vma, address, flags);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
-	if (is_hugepd(__hugepd(pmd_val(pmdval)))) {
-		page = follow_huge_pd(vma, address,
-				      __hugepd(pmd_val(pmdval)), flags,
-				      PMD_SHIFT);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
 retry:
 	if (!pmd_present(pmdval)) {
 		/*
@@ -783,20 +757,6 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 	pud = pud_offset(p4dp, address);
 	if (pud_none(*pud))
 		return no_page_table(vma, flags);
-	if (pud_huge(*pud) && is_vm_hugetlb_page(vma)) {
-		page = follow_huge_pud(mm, address, pud, flags);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
-	if (is_hugepd(__hugepd(pud_val(*pud)))) {
-		page = follow_huge_pd(vma, address,
-				      __hugepd(pud_val(*pud)), flags,
-				      PUD_SHIFT);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
 	if (pud_devmap(*pud)) {
 		ptl = pud_lock(mm, pud);
 		page = follow_devmap_pud(vma, address, pud, flags, &ctx->pgmap);
@@ -816,7 +776,6 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 				    struct follow_page_context *ctx)
 {
 	p4d_t *p4d;
-	struct page *page;
 
 	p4d = p4d_offset(pgdp, address);
 	if (p4d_none(*p4d))
@@ -825,14 +784,6 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 	if (unlikely(p4d_bad(*p4d)))
 		return no_page_table(vma, flags);
 
-	if (is_hugepd(__hugepd(p4d_val(*p4d)))) {
-		page = follow_huge_pd(vma, address,
-				      __hugepd(p4d_val(*p4d)), flags,
-				      P4D_SHIFT);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
 	return follow_pud_mask(vma, address, p4d, flags, ctx);
 }
 
@@ -870,10 +821,18 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 
 	ctx->page_mask = 0;
 
-	/* make this handle hugepd */
-	page = follow_huge_addr(mm, address, flags & FOLL_WRITE);
-	if (!IS_ERR(page)) {
-		WARN_ON_ONCE(flags & (FOLL_GET | FOLL_PIN));
+	/*
+	 * Call hugetlb_follow_page_mask for hugetlb vmas as it will use
+	 * special hugetlb page table walking code.  This eliminates the
+	 * need to check for hugetlb entries in the general walking code.
+	 *
+	 * hugetlb_follow_page_mask is only for follow_page() handling here.
+	 * Ordinary GUP uses follow_hugetlb_page for hugetlb processing.
+	 */
+	if (is_vm_hugetlb_page(vma)) {
+		page = hugetlb_follow_page_mask(vma, address, flags);
+		if (!page)
+			page = no_page_table(vma, flags);
 		return page;
 	}
 
@@ -882,21 +841,6 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 	if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
 		return no_page_table(vma, flags);
 
-	if (pgd_huge(*pgd)) {
-		page = follow_huge_pgd(mm, address, pgd, flags);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
-	if (is_hugepd(__hugepd(pgd_val(*pgd)))) {
-		page = follow_huge_pd(vma, address,
-				      __hugepd(pgd_val(*pgd)), flags,
-				      PGDIR_SHIFT);
-		if (page)
-			return page;
-		return no_page_table(vma, flags);
-	}
-
 	return follow_p4d_mask(vma, address, pgd, flags, ctx);
 }
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 546df97c31e4..0af18c1e4b31 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6209,6 +6209,62 @@ static inline bool __follow_hugetlb_must_fault(unsigned int flags, pte_t *pte,
 	return false;
 }
 
+struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
+				unsigned long address, unsigned int flags)
+{
+	struct hstate *h = hstate_vma(vma);
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long haddr = address & huge_page_mask(h);
+	struct page *page = NULL;
+	spinlock_t *ptl;
+	pte_t *pte, entry;
+
+	/*
+	 * FOLL_PIN is not supported for follow_page(). Ordinary GUP goes via
+	 * follow_hugetlb_page().
+	 */
+	if (WARN_ON_ONCE(flags & FOLL_PIN))
+		return NULL;
+
+retry:
+	pte = huge_pte_offset(mm, haddr, huge_page_size(h));
+	if (!pte)
+		return NULL;
+
+	ptl = huge_pte_lock(h, mm, pte);
+	entry = huge_ptep_get(pte);
+	if (pte_present(entry)) {
+		page = pte_page(entry) +
+				((address & ~huge_page_mask(h)) >> PAGE_SHIFT);
+		/*
+		 * Note that page may be a sub-page, and with vmemmap
+		 * optimizations the page struct may be read only.
+		 * try_grab_page() will increase the ref count on the
+		 * head page, so this will be OK.
+		 *
+		 * try_grab_page() should always succeed here, because we hold
+		 * the ptl lock and have verified pte_present().
+		 */
+		if (WARN_ON_ONCE(!try_grab_page(page, flags))) {
+			page = NULL;
+			goto out;
+		}
+	} else {
+		if (is_hugetlb_entry_migration(entry)) {
+			spin_unlock(ptl);
+			__migration_entry_wait_huge(pte, ptl);
+			goto retry;
+		}
+		/*
+		 * hwpoisoned entry is treated as no_page_table in
+		 * follow_page_mask().
+		 */
+	}
+out:
+	spin_unlock(ptl);
+	return page;
+}
+
 long follow_hugetlb_page(struct mm_struct *mm, struct vm_area_struct *vma,
 			 struct page **pages, struct vm_area_struct **vmas,
 			 unsigned long *position, unsigned long *nr_pages,
@@ -7201,122 +7257,6 @@ __weak unsigned long hugetlb_mask_last_page(struct hstate *h)
  * These functions are overwritable if your architecture needs its own
  * behavior.
  */
-struct page * __weak
-follow_huge_addr(struct mm_struct *mm, unsigned long address,
-			      int write)
-{
-	return ERR_PTR(-EINVAL);
-}
-
-struct page * __weak
-follow_huge_pd(struct vm_area_struct *vma,
-	       unsigned long address, hugepd_t hpd, int flags, int pdshift)
-{
-	WARN(1, "hugepd follow called with no support for hugepage directory format\n");
-	return NULL;
-}
-
-struct page * __weak
-follow_huge_pmd_pte(struct vm_area_struct *vma, unsigned long address, int flags)
-{
-	struct hstate *h = hstate_vma(vma);
-	struct mm_struct *mm = vma->vm_mm;
-	struct page *page = NULL;
-	spinlock_t *ptl;
-	pte_t *ptep, pte;
-
-	/*
-	 * FOLL_PIN is not supported for follow_page(). Ordinary GUP goes via
-	 * follow_hugetlb_page().
-	 */
-	if (WARN_ON_ONCE(flags & FOLL_PIN))
-		return NULL;
-
-retry:
-	ptep = huge_pte_offset(mm, address, huge_page_size(h));
-	if (!ptep)
-		return NULL;
-
-	ptl = huge_pte_lock(h, mm, ptep);
-	pte = huge_ptep_get(ptep);
-	if (pte_present(pte)) {
-		page = pte_page(pte) +
-			((address & ~huge_page_mask(h)) >> PAGE_SHIFT);
-		/*
-		 * try_grab_page() should always succeed here, because: a) we
-		 * hold the pmd (ptl) lock, and b) we've just checked that the
-		 * huge pmd (head) page is present in the page tables. The ptl
-		 * prevents the head page and tail pages from being rearranged
-		 * in any way. So this page must be available at this point,
-		 * unless the page refcount overflowed:
-		 */
-		if (WARN_ON_ONCE(!try_grab_page(page, flags))) {
-			page = NULL;
-			goto out;
-		}
-	} else {
-		if (is_hugetlb_entry_migration(pte)) {
-			spin_unlock(ptl);
-			__migration_entry_wait_huge(ptep, ptl);
-			goto retry;
-		}
-		/*
-		 * hwpoisoned entry is treated as no_page_table in
-		 * follow_page_mask().
-		 */
-	}
-out:
-	spin_unlock(ptl);
-	return page;
-}
-
-struct page * __weak
-follow_huge_pud(struct mm_struct *mm, unsigned long address,
-		pud_t *pud, int flags)
-{
-	struct page *page = NULL;
-	spinlock_t *ptl;
-	pte_t pte;
-
-	if (WARN_ON_ONCE(flags & FOLL_PIN))
-		return NULL;
-
-retry:
-	ptl = huge_pte_lock(hstate_sizelog(PUD_SHIFT), mm, (pte_t *)pud);
-	if (!pud_huge(*pud))
-		goto out;
-	pte = huge_ptep_get((pte_t *)pud);
-	if (pte_present(pte)) {
-		page = pud_page(*pud) + ((address & ~PUD_MASK) >> PAGE_SHIFT);
-		if (WARN_ON_ONCE(!try_grab_page(page, flags))) {
-			page = NULL;
-			goto out;
-		}
-	} else {
-		if (is_hugetlb_entry_migration(pte)) {
-			spin_unlock(ptl);
-			__migration_entry_wait(mm, (pte_t *)pud, ptl);
-			goto retry;
-		}
-		/*
-		 * hwpoisoned entry is treated as no_page_table in
-		 * follow_page_mask().
-		 */
-	}
-out:
-	spin_unlock(ptl);
-	return page;
-}
-
-struct page * __weak
-follow_huge_pgd(struct mm_struct *mm, unsigned long address, pgd_t *pgd, int flags)
-{
-	if (flags & (FOLL_GET | FOLL_PIN))
-		return NULL;
-
-	return pte_page(*(pte_t *)pgd) + ((address & ~PGDIR_MASK) >> PAGE_SHIFT);
-}
-
 int isolate_hugetlb(struct page *page, struct list_head *list)
 {
 	int ret = 0;
-- 
2.37.3

