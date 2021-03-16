Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7BD33CCFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 06:12:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F01d65b5Qz30GT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 16:12:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=wqLvFGjW;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=fc95iJkR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=wqLvFGjW; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=fc95iJkR; dkim-atps=neutral
X-Greylist: delayed 6997 seconds by postgrey-1.36 at boromir;
 Tue, 16 Mar 2021 16:12:13 AEDT
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F01cZ02jTz2ysr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 16:12:12 +1100 (AEDT)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12G3Aixv059068;
 Tue, 16 Mar 2021 03:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=P5ogeSRGKLRASjGZArXHB4hTtEIEH6YqYKdIldB/kzQ=;
 b=wqLvFGjW0Jhqk2JwEt666WRzPUb8+ISlbJeBz/gxCiJbXpoqerREvm3caWF9rCaGzaB9
 WMVLigK39zzM9Q9cpgGHV/6m8Xso/25Rqb1nYoh6h3F/2WY7FXDh72KT0pjiKrOfDZEq
 gj5uyLIabcFKSOKZpQD/ltnDQ+Q+ZRvyCxtLED+rpfNSRlOtAus9Po2OlQk+yyZKYdOC
 zwYfclBUkw5UZR/f9zQh3iORR9NoX58sM9dV2hTSd0Dyudvghz5mxWRJQZ7Xjve79DZv
 aW1G2iZrW036f0a4DMVT99n0czihAntieMUnNaeyWHmb1+vC4LbDTnW44CG8+fh89rUu OQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 378p1np3vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 03:15:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12G39dhs138144;
 Tue, 16 Mar 2021 03:15:16 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by aserp3020.oracle.com with ESMTP id 3797a0nb8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 03:15:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiGKdXEISSPbTwOlv8vVJS82FQIBymzbJkKKeLItLzDtByzj71AHzjjdVP66iy6v/0ZyxR1NUA4/oCk6tUdYTKRowRmQ4X+QfPTezZWZa4utDXH1d3184Kz7Xz8odPePVptxY8LUjEWCaqCTtG3Cbbo6odQ4Lf2FGkXgeIsZfSUPmkZLLXaX1/DEBDqas/AAdIG2Pz9QJhuoCy8KlPrKDTmpF8I7Vnz3UQHUaaYrizPt61Yuwz3FfIXon2s0pHRTOLGqa7Gsl7dyJdoKuYvYeidKn6biJ4nWMWiIF5qRkz0VuJLCXJQf+x4Hn2o+RA+yw/UHLOSqS+d9g3wlNh6oew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5ogeSRGKLRASjGZArXHB4hTtEIEH6YqYKdIldB/kzQ=;
 b=NgeHHUWztT/CtvEGV7B7+NQ4unwfgEs17w5XedXUlxwgJG3Q7OTb1p9kTPk7gahiH6PIOfDpJYpJzS8PEmkmdSkG1tmatWS46i0fZcDtN9QWWGMZe2A37W4T0r6IRcdjSnspyKVgPb/eNa9RVeASnSGXIiiebIuolNkQ3iw9iMAM4YijxRetCsj7cooIQx2NpE1h2/OxNCxhXSfVufwR7dlJfT2SEKTnmpmcoWmATk3tajnbc3j4OUS9OIJJ9oWwtEXKbMVpbqR0XQgr18UD/H2suQJ/WgBz4mNlKPS8kOprWhuOyhywDsXhBU5UfCR/lTpKVeT3gs+WJyuwoZqWMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5ogeSRGKLRASjGZArXHB4hTtEIEH6YqYKdIldB/kzQ=;
 b=fc95iJkRllgI+1pjCiApaWF0/XXYQHaQYy8qJr4SXpu3iZIbD/gvWsTiWgE/fghA//7BIMHu+DH5ctayWv9HGO8sUDjSxoy+UIiSvoFHhNATmJTWegRzYmA3c2en0WGKbhi5j+X+l7XHBEwz7WqInaaN+wN0CdXTPE7v7dNqReE=
Authentication-Results: linux.alibaba.com; dkim=none (message not signed)
 header.d=none;linux.alibaba.com; dmarc=none action=none
 header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4709.namprd10.prod.outlook.com (2603:10b6:510:3d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 03:15:14 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e%5]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 03:15:14 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, tyreld@linux.ibm.com
Subject: Re: [PATCH] scsi: ibmvfc: Switch to using the new API kobj_to_dev()
Date: Mon, 15 Mar 2021 23:14:57 -0400
Message-Id: <161586054343.25014.8033110781907283288.b4-ty@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1614850124-54111-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1614850124-54111-1-git-send-email-jiapeng.chong@linux.alibaba.com>
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
 15.20.3933.32 via Frontend Transport; Tue, 16 Mar 2021 03:15:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b7bab7b-b2a5-4237-e28f-08d8e829b782
X-MS-TrafficTypeDiagnostic: PH0PR10MB4709:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4709480648BDEC915F69366E8E6B9@PH0PR10MB4709.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HYVL0wEZ/Mf81A+MNpda4oDf/P52NMYDI/M8fdDUAmgPrXNdip0P89W7C7vWqLubAj7po4YrXmjL5uYMhxZ/kJ5le3a2AxZrqQwTueXHOTmfV6qmKSVnLomVz9Jixg3oldtRiYdK19+2GJ+zc7U60vbAiHwJgKeoyCpi09WObAEBdybjL8w/d10aCl8r7tCJ6FLIOsRU77GV8C2vveorfZq1w6lV2u59O09F3j4sFMqhd7Naw+GH/ged9m9ZKxlXJIHaV8EJezkMTkp36X6dEylR0ozaZeKhB3LQNmGVNQTd17EQKGEGqiSAHHTtAjO9yFyOZUs8ZC8HJK3HlEpblbHMEjh2ogyWJJD1RBQ69gPR6IucDyXAlqfgBQhEpB7QM70ou2IhKDwnj1RvdFIIGqyT//YU93qjQhfDI8Ysga4j1IRDWU6oSi1+hdhRXoSRcDtk9P/WRqjdFTt9Rf8SM7zAFRhwEJvz0UOvILqNXfxpma6l8ge+BPgPkUbe+v79YEPBW+GoHLd9CN2kP2sp8Ij8QcHc0Uho56wYHL0t3klRzZc5kkdhZdPh1dqajxqFpPYvvSBP6wyey3bNiENP4YWsmGADgK5YhWOLvlxDZRnaNGNs/h7id5DBMiWh5OCM4vQQOsEPJ5lNsJ4KZi+EuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(39860400002)(366004)(136003)(396003)(2616005)(26005)(478600001)(956004)(4326008)(83380400001)(6486002)(186003)(66946007)(103116003)(4744005)(316002)(5660300002)(966005)(8936002)(86362001)(8676002)(16526019)(6666004)(2906002)(36756003)(7696005)(52116002)(66556008)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SG5TLzNxcTFjWDhGWWZzTk9mWlo5aFo3RU9YOUR4ekhQN1ZmRUp0NEt6Ym1w?=
 =?utf-8?B?TmxiN1UxY0thUkQzVjdlZ21QdzBEYS9Qd3RWZWxOejVzQTRvSm1UeUx0ZHRQ?=
 =?utf-8?B?NTdGd0hlS05odHI5S1Rnelc3ejhLVmpEMzVnUERKbzZUVm1IYWNPSytpUis4?=
 =?utf-8?B?eWMyamt5VW5ZN0k1TTk3dXhMVW5lSVpab3V2M21RakRLNDFRZndyZDN2bWZ4?=
 =?utf-8?B?Y3QySFZMS1BYS09TZ3IxWjJYOVBMM2hYK2I0bUJFV2RKUllTODBpT3BpRTM2?=
 =?utf-8?B?KzhUL0FRYWVzZ2Y5WXBxb3E1ZmVWVngzOCtYOVM1OElQNWxZWlhMZDZWL0tx?=
 =?utf-8?B?MmVnVkQzQWFrK2ZCYlpNWjR5T3ZGSndYV2s2WGQ1RUxGdG1QNjZxUWwyS0Rp?=
 =?utf-8?B?QlY1ZC92ZW9UeGYya2JHcVcxaG4vODdLOWxGT2VtVEYvRWxQb1lYeDMyVnlU?=
 =?utf-8?B?bUpTcWkvNERRSHNFSWpTV3JxRlNIbzBhejFuNTYwREVWbTJqQUs0NXNrSVpy?=
 =?utf-8?B?V2JUQkMrbTJBQnp5ZjZFdG9ScnFSUkViVGxOdTJzR0V4eVdBY1RmVXFIc0o2?=
 =?utf-8?B?SnZ5RElNYTdMWEIzS1ZOYUl4SmpCQ1dXbU1CeXkybEhYcTg4VTZzMmZkT3hx?=
 =?utf-8?B?Y2I3WHIrZjFvaDJDSEoxdjhGdTg4STJsenpFUEVDL2dYQ2lETVNRYVAxYjVp?=
 =?utf-8?B?clZsQm91SjU3T2RrOEFhWVlvQ0l1LzQ0Z2V6aFkrSm53Q0Vta0NzeU9qWFFE?=
 =?utf-8?B?V2NGQVlqNHVWL1ZONUt1OGlKMm8vSGhNdndaYU1lS01qdGVLOUkrc3FDNEZj?=
 =?utf-8?B?Mm9PczVYSUY1UzNaVTBWNkErN2VFMjREd1NrVWRDSVdJS1BRZVRLSEcrZFhM?=
 =?utf-8?B?RVN2eGswK3IvR1hVblZQMERFdXBuN2dsVTc5eEFTaUIxcEpBeENZRGV5WnZr?=
 =?utf-8?B?cHI4SXA4Nm12eDRTM3R4Z0U1TFdFUHByRk5OVVVmTm85OFpYeHJnSG9aMVpv?=
 =?utf-8?B?M0JhZmxwU2ZKeVo0QTZNZjM0a0Q1YU4yNGZCYVE4dTZZc3VPR3VEMllSdTFJ?=
 =?utf-8?B?bGlVc3pFTHFLUlpZb0JjQjY3cG0zSVFUWmNCVFRYcSsvNUlJUFk4OVRDOEhh?=
 =?utf-8?B?UnRRcjYxV2tnU1U5amZJN09scnZpVDVYbnpKRndGUjc5ZG5NdGg1Ly93cW1n?=
 =?utf-8?B?UUtETEtRaytYSVhrQWdrYlpGSGhTMzZZUlF1TDU0MEZzVFhFM3pVaVgxdjhH?=
 =?utf-8?B?aXN2MitDR282eU1sTWh4UWE1NjdLb3JtNy8vci9aMGlyM0l4dlRuYW5Cdmth?=
 =?utf-8?B?c3hhVGJtWFJzQXZCakV1QzlYejIrWEFRWG5lbHJKbVAwZ25vYUxEWTl0NS85?=
 =?utf-8?B?WElmMVJ0MzVsQTBTeVRsWmFDUnQ1bzRvczlhVXlpKzcyWG9rUkY1V2pxRm9Q?=
 =?utf-8?B?QXN1MG1uN29tQzVMMjhPWFBjNEczT0U3K292cDBkN0hyZWdEekd1YTdPTGdi?=
 =?utf-8?B?NmJrVHl4cnpXSDZsVzRMK2pyamQ3SzNRL2FrMFlGSCtiV3FmczlXNitMYS9O?=
 =?utf-8?B?aTFWMndZc1Y0WEhBM0pOZXRiZG83ZGN3VHZBcEttczdIWk9DemFkbU9GSSta?=
 =?utf-8?B?TkU0UkFHS21UU3NxaHMwSnNHeGgya0FaNzlUM1ZoYXowTzNhMmJxT1VDaTM3?=
 =?utf-8?B?elhhK21xM0RaWmRSZC92T05JUHUwcnBxS1lyemNTSWU3cWd3dncrRi82NHpY?=
 =?utf-8?Q?8zxJtbFncsKJEfjgI4uUN0mmWEJNAZ9A7COtkVo?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7bab7b-b2a5-4237-e28f-08d8e829b782
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 03:15:14.5127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0BnTXqvSARyrF4W9Hu4cI3Kp00rXks79+9nrtcFwiM8JKiKHsKFjinAYKs7xTxiTpVrackcGuNyQnqNmbUYuBGNT22Vd7d4BwjUM8aFPvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4709
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9924
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103160021
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9924
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 adultscore=0
 spamscore=0 clxscore=1011 phishscore=0 malwarescore=0 priorityscore=1501
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
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, jejb@linux.ibm.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 Mar 2021 17:28:44 +0800, Jiapeng Chong wrote:

> Fix the following coccicheck warnings:
> 
> ./drivers/scsi/ibmvscsi/ibmvfc.c:3483:60-61: WARNING opportunity for
> kobj_to_dev().

Applied to 5.13/scsi-queue, thanks!

[1/1] scsi: ibmvfc: Switch to using the new API kobj_to_dev()
      https://git.kernel.org/mkp/scsi/c/18c2a59a4190

-- 
Martin K. Petersen	Oracle Linux Engineering
