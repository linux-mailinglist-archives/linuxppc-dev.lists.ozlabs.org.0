Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B2049C999
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 13:26:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkNHc13t3z3c9h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 23:26:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=PxOnpHEP;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Z9IGO0Cf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=dan.carpenter@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=PxOnpHEP; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=Z9IGO0Cf; dkim-atps=neutral
X-Greylist: delayed 1721 seconds by postgrey-1.36 at boromir;
 Wed, 26 Jan 2022 23:25:38 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkNGp39yDz30Kp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 23:25:33 +1100 (AEDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20Q9kJxP001947; 
 Wed, 26 Jan 2022 11:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=d+WpZb8CwYR8tNNMEU1gCh3S1IJrBoWhWFeyoAdD9Pw=;
 b=PxOnpHEPsH6TXHeYr8tzv/BmvdDJ5nShsfH4lBCKAoI/DLEkLOIM4mKWNxEObLG3Hjv5
 VGkuR/BQigGLgyxtg4z9yZo8W5dKynkrDQyoGHUvxmfKcL9depPBtMX0WtGx+TVNwIQk
 CmoHaCB6Swg3xstfnevm4lghcZWbh1xMDEdAR+rTupGcB9M7TadMN8b3xffuR90xeLPg
 2US4JcRTLeyiViZYhOlrh57pFUGeY4tSCdTDSmhcMY6nuFM0N6MzNfUe30Cw1xNlGEX1
 t08BsZ/g/nmy5Tk4VNIwxpfQY3heXRwpXq7ZBGtVODqvwNpv5CESpdIB6Ua813d2Epy+ Zg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dswh9p7dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 11:56:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QBuTql090791;
 Wed, 26 Jan 2022 11:56:36 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
 by userp3020.oracle.com with ESMTP id 3drbcqx9qh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 11:56:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYgpvwdLIwjyHexV5nWJBPs6Q6QUJ803Xemz7ORIfkxCrKIG6BHmD0ztdKlw8yqYPrzX9ilc5PY9h/+T4IEVMyi63ZLV13y3Tn7pan9Dn/iTZaoTIOtOFq3FN8sjgjBlYYM7x/JeeaqmXve0R/kgu4YfWzlPl5VrV40936Tck5K02CkiH52o9AlRZkoRLvs7iGizQcF9e8oDyqPyp05ojzeYu4+xuW70XrUJ/jmaDXb3BDQGidNThZ9ekgkNAfDZQ28EMAenQwHWr4UBZFYdW4hSYmLdod0ozgCQACJ23QugsWc57992WqbpAW6ROmEU6GtNdhqhQJDGiN7SEbl2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+WpZb8CwYR8tNNMEU1gCh3S1IJrBoWhWFeyoAdD9Pw=;
 b=SE+Qr6Ig4tfxT4BNd0v0u+pEEbECaHZiXSgC4utQyLfRiXImSIvtCTZzD4Z6zhQBcpIiKUwlympT2cZUIwX+J8hR9Y4XDRTDsLf7/nrw1fKgVSGknLnqoq1gbprYUs3RfFjMgorQG6Gt+DMruahuF54w9saVzoarxy3gC49M7ru6wdrXd+8KmyInB4YebCHloQkH+IsaX43o4zbv1q7OwcRsu8qVgcgOXX+9mH06EZCY2MRRdJDdssxwbo3UU8cmCUoSKNlHs4yISgGyOdCb+SRK+Yq124F1plERPzeh/WK4lyC/kLV6vlLp0g3YPakMWoLgetzFDbJFh2pMqb2MMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+WpZb8CwYR8tNNMEU1gCh3S1IJrBoWhWFeyoAdD9Pw=;
 b=Z9IGO0CfdlTjE1ARmZ82Wmw+gAvosHQeDekMa7IFCOAiR09fC7oUoi0DaXHIBqMgg4CfmVOutlvd45yESIJa2L9mLXQCk9OqTX8Eh8jvhNGkPLMGDOPklE2ogk4xKVJah+gEk9YYzq9m1vNx+Ry8ImJM5PgEntFlbtf9MexQjsg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 11:56:34 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 11:56:34 +0000
Date: Wed, 26 Jan 2022 14:56:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: WARN_ON() is buggy for 32 bit systems
Message-ID: <20220126115616.GY1978@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0018.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3d75e57-4c6c-4069-6deb-08d9e0c2e5ed
X-MS-TrafficTypeDiagnostic: CO1PR10MB4468:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB4468D5BEBABF1EAAD045D2248E209@CO1PR10MB4468.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: snBGNKqlVSQnK6HikzZ2ql8HRzT9sCFnWCc62waWFzpAG/yYs4H+UV3WG6YZCFWmbXkrRWsd1KaHnNY4O4brmAMnx1XDEi/LlObxg81d0z1jtNStmKrnQqUZWLOZMgt/QEyte8doAW3W2Ay6kvUQffVL2PEsZfMuarRA4IkN6u2FpuQuyOPbuoAcdOyMUtUpqqQjYkPZWaHw2D6xkPnquskgiOBZyPw865pDucsecvymrztl0EbUBGbO5giQp/x5zgf9fSiAoOt8g2XyMhR4fUgD+0TJ1v1zmw/jVMs+nM3iAgudS4xUP9RlbEZIsHA0bBhVJT/DpeoKfoSegvZvuAKov8mziE68B7f4cDJCOa8/btFYpHNLPc7jFmSAvl4tqVUXJRVCw5YqSFGamQ+J/C45UtG8Ye0XdqXa6p/cSLOV+a0s2UO23pRgGvc4qNv2fJrf6vKFkEKhuWn9+G5wdb99CHNcS+DpXSOjaIG5gEc8Z0KkykESe3brwN6NhLeoO6V6TtpaUdrVdx9i5BsE+mdsegTDfW7dHI5mNsoYQFRo4mhsBTtEYavSPZP+ZwV3qQwpOHsStCWSRKXWYQ+j0zNxbzPrrYe6EmQSuzDGd83/fdq7z86GxGW/JR78ousPYxP550xW9gkI+1wi5wzXRzwA1l2FDv0F/zGLmI2Py0F6Cq8YDgKBd0gxKYpHszb4ZvuGgh3Dgtq6weaSPJ1fLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(316002)(4326008)(66476007)(83380400001)(8676002)(8936002)(26005)(6916009)(33656002)(86362001)(38350700002)(38100700002)(1076003)(186003)(44832011)(66946007)(2906002)(4744005)(6512007)(9686003)(66556008)(33716001)(6486002)(6506007)(52116002)(508600001)(6666004)(5660300002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V+nlOMjlkk1jLZhion/zpxZoYvDBoQCkWoYV6dFMZEoACmTnm6wtYHvvQBCO?=
 =?us-ascii?Q?nkTbUNpGEbKDjhZnBwTRylv35IzM8FTRuEpVofchg4yQpWS166IygY4v2hn8?=
 =?us-ascii?Q?vITn4AprYlRfsqkhj3qS5Yljsn+Gh+sPyxMdImhVNCZWn88KtDWcNopgtmjl?=
 =?us-ascii?Q?farYfb2zygYL3/H3J/nqVCGLnUwTQ9H+3N010XtwIfGNscLpImLkGTrXvgqz?=
 =?us-ascii?Q?xaLp60GcGlYLMBVSGgNkKa5dwjlvyzc7FEXArImZKFzIvXJZxmZBhEibGqan?=
 =?us-ascii?Q?1XlxT5san2BE50Nf7hN4Z2p8EqhmAgK79KcRPQiUXOFEuqTrfTA7SKs4e2is?=
 =?us-ascii?Q?4R81i6IhKq5/BVwAc507CCxE2DbsUjKFimTCuIG7xX0Pla5xal1axbld4rBv?=
 =?us-ascii?Q?9y6sgaemDgZRG7Ikaw5niKWbW6i2+Bk8SToejKoVNeTuA70ZTP/+q6rIrJxO?=
 =?us-ascii?Q?Re555ZH54az155Kv6XHC0bDgbHDxEtDP2xnnLH3KGhbkZHZT/IrbfDAajHil?=
 =?us-ascii?Q?JcfRSwpGbgYFwKM4LLTpsAQDrll9FMdQ0/LBrPJMZftWaesxoSPdYm/AkXI5?=
 =?us-ascii?Q?sRQfleUfgQYGdJBMieX8/Dmy0p92U/I0lfbvDfmRxxRZ+U0bLu1RTf+pi1ZR?=
 =?us-ascii?Q?5+drRGoZmw0aaCq3omC69qUoKLDvnl0xRANn/zj4qvXDrRRHNPqC3KFE53HE?=
 =?us-ascii?Q?bZ/aORzg2jQZAsVCBDeIy9tybugwke+FyxOD3Bj7NLzY7L04X19y/5sQN+ZF?=
 =?us-ascii?Q?2jbhknhI944bwlbyKtFVKTS+f2Jwj9RNyjZa0f+5lOuC6735tCxif7/Ar6AL?=
 =?us-ascii?Q?PmBa3HMkN+4hbhipp5ioV3R6DsYLQhUJhdN4CPhemNp7iUPF9oi6ccfCbnid?=
 =?us-ascii?Q?gjqbUdYeG0jM3YYsvZJxqQI+rhWP23v6dbBOXoBaRhvu1xDBCBIlLK3fsDnX?=
 =?us-ascii?Q?Vtxneyk9f1iRG0Clny1dOgYqjwRqO0KPbM4dWdGDO44zD8Fh5WKvi81Ff5C1?=
 =?us-ascii?Q?1WxAwt/W9aGWegrZmlOoN5JOcUq2gwae7fMQ+Bsm9HsE6PJbtolPSqyXT9lh?=
 =?us-ascii?Q?R49FxxJCnMIidVM6Fp6Yx+zqUL5kXxJOtKFWj3gZAt5meR6FBRRQAxEBOlOC?=
 =?us-ascii?Q?C5dRirAmPysq+7yFgSDA7kBZSIeMAnc06Id6NzlFSFrMdNmJw/RKcJ/W0LlB?=
 =?us-ascii?Q?6Thgzd5/YHSB0ds2dpf8TCCJPPzwAn5LxroH+svmStwqIPRe+ZSAoa8U+DXQ?=
 =?us-ascii?Q?sWRv+rmod7p1XYdZA46gAq1Kz6InK/5txBXsjCJ29bFqv9r2xwGhGbveErHL?=
 =?us-ascii?Q?VopqduPw+x86R5jLC60Z9waRQkL/kd6PmuuOPzyjoz62ubScLK17PJVEWItQ?=
 =?us-ascii?Q?N50RcQQwF41VBvIWd0fSu/KeNRqFIPv12RpKd0qDqUcvMml5SvK/IYSAUWgA?=
 =?us-ascii?Q?vhcGW25qdVxjo701dTktHJAk0NEwSSflMMEf3MovcCYdv/wa7PqTUmWKjp8T?=
 =?us-ascii?Q?dJGCwLhNwVHm1PjaCc/IB+/71Ws1N7Ptxe1neieLl+TlA50lj533GKxs5EPc?=
 =?us-ascii?Q?gncvasgQsAAHILxmFcKmDuBVtMiJwNuI2fpdWBUQqO//PLBri2gk+deICbR5?=
 =?us-ascii?Q?Y5P5WMQJlwoWG9f6W15M3e00BTuMIzNpsfeiSlsEq5OtCuvFV0fAuM1N4XFA?=
 =?us-ascii?Q?AsuFpHXjvjswC/CnY0r7M+XGERA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d75e57-4c6c-4069-6deb-08d9e0c2e5ed
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 11:56:33.9830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbMxT8dLC9jEuINjar44Sp7dvawSTq2vhuZ0cUiyy5R2pAEMUFC1n0T6HEE8KeP/+5htBr08iBNdwyvb3IZwLUqb4lfGSMTW6YY1w++pGA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4468
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=413
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260071
X-Proofpoint-ORIG-GUID: 4lhJw4MUWa_mtWv9O6spq85Te0jQL3Ul
X-Proofpoint-GUID: 4lhJw4MUWa_mtWv9O6spq85Te0jQL3Ul
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Michael,

Commit e432fe97f3e5 ("powerpc/bug: Cast to unsigned long before passing
to inline asm") breaks WARN_ON() for 32 bit systems.

arch/powerpc/include/asm/bug.h
   109  #define WARN_ON(x) ({                                           \
   110          bool __ret_warn_on = false;                             \
   111          do {                                                    \
   112                  if (__builtin_constant_p((x))) {                \
   113                          if (!(x))                               \
   114                                  break;                          \
   115                          __WARN();                               \
   116                          __ret_warn_on = true;                   \
   117                  } else {                                        \
   118                          __label__ __label_warn_on;              \
   119                                                                  \
   120                          WARN_ENTRY(PPC_TLNEI " %4, 0",          \
   121                                     BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN), \
   122                                     __label_warn_on,             \
   123                                     "r" ((__force long)(x)));    \
                                                         ^^^^
If the code is "if (WARN_ON(some_u64)) {" then the cast to long will
truncate away the high bits so it's wrong.  (Or at least that's how it
works on x86, I'm working on a work around for Smatch to be able to
parse this WARN_ON().  I don't know anything about PowerPC.)

   124                          break;                                  \
   125  __label_warn_on:                                                \
   126                          __ret_warn_on = true;                   \
   127                  }                                               \
   128          } while (0);                                            \
   129          unlikely(__ret_warn_on);                                \
   130  })

regards,
dan carpenter

