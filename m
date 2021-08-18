Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5884C3EF81B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 04:33:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqBlp1kNdz3cHn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 12:33:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=gVyj3b2a;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=bZqJOSwF;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ghet0LDw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=gVyj3b2a; 
 dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=bZqJOSwF; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=ghet0LDw; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqBkn25J5z2yyb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 12:32:31 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17I2Vo4r005162; Wed, 18 Aug 2021 02:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=B1q8jixHFBJpEtIJF7D6bif2jYVZfYwDWV+g898eaoY=;
 b=gVyj3b2aDQCjuqN3m1RgRseG+JQnkI8TxZ/rihyWCrzmDScbZYIShUsHBsqUnfx4a/4v
 Kw+oZ0FP8qDxgf4D13vdT4JJpNSDnpQIAoxRyOOs/9ltNRmdxLCPamt8Fq3CJMBMICjf
 9zvFK2mZ/SmOCX/YyrTr+1A19/8IdqRDt+LuBhjqEoxUyzHMib+60ogFU+9i8oQ7qGRT
 OMYQNhPN7evkbrJIO84LMdoUHNJYmNv0Zzh8AZbaFGJfAxof7VSj1ea17A2ZqPHk5vvR
 36w2qy96OlE/cQ+fuLKyQCurl4u2BNlIvGN7gOLph3W2GrD18Ekx53r/58JS7oIo68yH zA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=B1q8jixHFBJpEtIJF7D6bif2jYVZfYwDWV+g898eaoY=;
 b=bZqJOSwFcY67iKaDT9My3UMzQ4+kczphFmFBHWmr+w2GKMcI9gnEjZoamqIVypF26Ask
 7jENRuhiJWr1C6kDtEg7rxW8ORlhVkMqGUQgmIUqLvWVlejPhE5B0XE2VJmABye7MFKB
 e5BajRXq8RLHCDt0dAh+TzOVnMWclPl4odFR0niuLiJ2LBnoM4Okq1OduWmaFD7h2TAV
 u8q31lUrPRh+XU50LpcBvASUISorsKkNVMuEgzBD5Qe7JbeFqDyrzZWbd0zbBZYICgSv
 zE1GVOy2JA/gCS7aT2/6nLX1+pE4/7Hzho1FVNbmPowwmtP+v8TBgF/aAd9dApAKTCUJ ww== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3afgmbdfjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Aug 2021 02:32:02 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17I2V4fT071422;
 Wed, 18 Aug 2021 02:32:01 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
 by userp3030.oracle.com with ESMTP id 3ae2y19676-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Aug 2021 02:32:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQzRJJbHfnBw7CuAIRPEJZU3PJhYoIeE5G6Sf9DmhSU2lTKnC77VrAj6kA1eNjkErHG5WZbCAeNDgg/vIfxhzOhWVqUK+ZWWPImdx0v3nQcAGUTf2Z1LqmJcPcP3DCLFsLd3rNzisayISp4j/uocnV7OZXSE/E4PXdTs0HMfrO5+V0lw+uyFCRFzH2w0t3OhOIK5iewPxvehbyXQCSKgmq2qdre08cCdyx9SzT5LmZ86SgTV4terAoh594fKe5wup5n064k5O8LqL+wL75XHmvrcZeZDyBqNHtoOzsgrbwEEHX9i4I1ZQhhbV5gtTjPwO/SOMNfDdgLuRZP8+sOA0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1q8jixHFBJpEtIJF7D6bif2jYVZfYwDWV+g898eaoY=;
 b=BOXpcVr2b12ca8cxUUhRyPXFIJriTnaj/ljaEJKH4OpctuQq4KsBV6yRhQR/PupUg9bM4o8aFpxMRXZGbWyzBfYyXn6QSYGAJ6R9e5Tn/eth/5kWRf3WEKdR+nzcTRHg5RfZwoeb1uD1/fF7iLJMq/iibWjx2TdphLayg9B+EIgeFenqytTRMhm1+y1h+iw9j7Qbs2wLsvNIPNRkKefZjVQENOVMyO5j4Pb81PHy9g8Ucg1Xh4gWKWVNVHcORZTg/GC2x3lROB3Z4SEoU8am+P/+uiUz9K4a8QW5+aRFsgFpYi7gsNaRI5lZYbpj5OhDigQIs1dUIuTYxOZLgq4Y6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1q8jixHFBJpEtIJF7D6bif2jYVZfYwDWV+g898eaoY=;
 b=ghet0LDwkc4XqgxX7kgs6vPv7Tz609l/8shqUhU39zFapot8bzyN6VLDmJ22I8DS7620y8441/rQdD94X4e5ioy2vpGFfZyO8kjdi/GfHCiv6WCwPm7LVEaplWOkLCJWA6Kf0NKgfQ3W/ubHxSsypPoAT9jjPbDzYFeN7Jcq1zw=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4520.namprd10.prod.outlook.com (2603:10b6:510:43::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Wed, 18 Aug
 2021 02:31:59 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c0ed:36a0:7bc8:f2dc]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c0ed:36a0:7bc8:f2dc%6]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 02:31:59 +0000
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH] scsi: ibmvfc: Stop using scsi_cmnd.tag
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq14kbnmqoh.fsf@ca-mkp.ca.oracle.com>
References: <1629207817-211936-1-git-send-email-john.garry@huawei.com>
Date: Tue, 17 Aug 2021 22:31:56 -0400
In-Reply-To: <1629207817-211936-1-git-send-email-john.garry@huawei.com> (John
 Garry's message of "Tue, 17 Aug 2021 21:43:37 +0800")
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0601CA0018.namprd06.prod.outlook.com
 (2603:10b6:803:2f::28) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by
 SN4PR0601CA0018.namprd06.prod.outlook.com (2603:10b6:803:2f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 02:31:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3261900-6e8c-4443-4251-08d961f05b0d
X-MS-TrafficTypeDiagnostic: PH0PR10MB4520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4520664FD7BB77230322DD5F8EFF9@PH0PR10MB4520.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uCKCzRnVSFxC+b6FHJziP8ASvZdYslZKU5kwzDYOdSuUsiJ8EjP6riG7bSzt4/gKw8oLHcIyoFWiJzqR6+tdZ3YMN9lqIHRPyo0518bePOhX5hEUVWUOAlrzYAIpZHYPiSlzGJGv5hu9GC7cdWc04BXlH//NgXM9rDnG39jJRrVv5sfoVLSW3gDJhaTM8hEU0ZlHDleavPT8FHrKTIbfZxey4oddfJYjpSF2zq7C7n5fWoPOY5RvZ2EwfxyDfWO0Ul3BWJ4Dg6wY/mJn/ebbOUw0O/Mjhkw32Tb3XViFEhdFKfvmXUhDJ9nwUebCuREFXArPXaDfaX7ZoV43w1ki+lTxLyGdrVG3qv7i440qpjVHU6Er4VuYGLdEra6tdb6L+3Pg5e5XkAqRB2MXnr0eFJJkOIUEiugyhP8d+L/dneToVVUkvD757QN5ARlIvdrLMjhp+/YE7d0A3AdPFJ+HuAfOs4dCFxyE7NflhMpJSjPSH+ZW7eYiBDQKa5i+RKYA4l8wGp0+adLIEWcijW6+AdrUi+83Btu3nSPZeMQkyiCF4zOmg69z6RbQJF61HuqpoGU6d7q7gwp8RKNwq9kmQYKH+mKVrfJyTLnoNAXXxMDBvLJ0vTeW7KtjQRlI3jeiyo0ogxTQTGUsIqUMYle5/2o5Up2MDwguPzWDHKc9sqDvT73dOBRLD0KKW3ij/jv2LG3nkrThKDpb1dXY/SY3Tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(366004)(376002)(346002)(8676002)(956004)(316002)(7696005)(86362001)(36916002)(5660300002)(52116002)(478600001)(8936002)(38100700002)(4744005)(26005)(6916009)(6666004)(38350700002)(186003)(7416002)(66946007)(66556008)(66476007)(2906002)(55016002)(4326008)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gYSu+i8miOqfvi1Rrm1wLuokQl9rnmSSjgYgFsb8MXV3hCCms5zWn8SbLH4g?=
 =?us-ascii?Q?+4RKm3PHfCJEwrDcMg9va9AR+v3CnZQonyrXNTKZ5fdAo3CZxnhNuEheAcoU?=
 =?us-ascii?Q?ojKNvySoVcgDaPgYs7jRajgBH1WiMHNwxGAYgbLfUf0D0OjGKF3U2P8Juh+y?=
 =?us-ascii?Q?Jd2a1Lb2pzcZ6mTMhPUlzCptDsqB4EOeKCyyw0IkaTha8/eYxKKUe0EiQT/v?=
 =?us-ascii?Q?m2RZHSPRgFs0Ly/7nyw90b9KSa6aDkHlr+DDbCJBDbHZXEOUvKzlV2AWwm8w?=
 =?us-ascii?Q?F8VndHlKBqM9Hh5wy/BogX2W+tndweFI8dEO9EihvAD6P5800DOK5iJuDj4b?=
 =?us-ascii?Q?NfAUwWXVDqbNoNAFxLz2NStuG12cBEEJYQYF2D/C5DgfGdyO1SCpOjPaFkfl?=
 =?us-ascii?Q?G5Z2wbHlOOYvGdX+7GcrSrI8ZvPNC0Hz3q7ZQDTgF9xji6W3+gNclTJIu95I?=
 =?us-ascii?Q?tqxvk/A5AlenJ8pvexLzRdX3a6oFSIbScDjJXEsaw4SD5xpwO1rypz1Rz45+?=
 =?us-ascii?Q?fYu7Wyeprzp0QfOc0MI+CLEZLiGfK65XfSalytxwVO3Wwr2YYNSGDI8KtWWX?=
 =?us-ascii?Q?I7zZcfwo62xlzbkdu4TvD/RRIfnXvfTDdhMGuR72br1C3tzMJhwi4G6rdmWF?=
 =?us-ascii?Q?J/spbaF3Sg1JAeSrLzL0AZh9xOKGTmC7SgLJmwHPKnWAts+nQQM4VM1TwGoo?=
 =?us-ascii?Q?vbduFs4lna8JdeccaTZ76NJdPkrxxy1XfH/P0wNJA847iyHYsACg1Qnwm+Ow?=
 =?us-ascii?Q?6NgPt75uOe1HseTmoej7uvyRTCC1Gxdp4T+32OFDo/AUlunx5VecjixNjodI?=
 =?us-ascii?Q?6H57/XVyxBYSqg2TSQL5XK/jxTn2V/shqLiu1Ee0Nb5Lr324XzdzAc3vBh8E?=
 =?us-ascii?Q?+Fg3hTuKHR2NNYAh2EuJYor4UwQk7I2lxjT+iyB7TBjIDtakadncC1QB/pLF?=
 =?us-ascii?Q?WsbHFBgvOEgC4EUf9QdHnSt7j6vxCdnzGfXLBdrgzYiMiK1Kw8qWqU54TUzF?=
 =?us-ascii?Q?vFb67zRP/MwsdDI4EScCuQfTMw/8nF9jh2OGVm2Uu+FTciZUQNLf2Q3v5aLO?=
 =?us-ascii?Q?nyDoX+ecWU/xEct+sV3VA1fSCDPDvTSskgC3lzyiIl9TqlXxl7KX78lB6DVE?=
 =?us-ascii?Q?HYjF2dp0VaM9wQstqPZvmGDAd2T4whrQuxs2XRc9m+OuqwSt9bw2XjQHrf2Q?=
 =?us-ascii?Q?kSVpnxVi5hw3H/LGW4/gdfm/BAB1XA8quaSMV8ow6kXMOHbGarJKFHTn6ZEW?=
 =?us-ascii?Q?oFGB96/yKtWaKoMhmtYD4F4ig9EvfjuhWVWUWbzEI8MNBIavYKkS/IfDjNp+?=
 =?us-ascii?Q?A6mrbtP/UxONRG/rjCwooRqI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3261900-6e8c-4443-4251-08d961f05b0d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 02:31:59.8202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKYzuj9gfaIoBob/ASAoE2wuC8zoMjpz/hoD5gWkeug5/mIYQHghLYBdGTQWUAwCu5/XKfm/GHGi6SrCcqCW7KaosLYOK0CoUncH7JxPO+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4520
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10079
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108180014
X-Proofpoint-ORIG-GUID: OeuKCWqurXnDwlI977Y9Q6hGjBLHmtXl
X-Proofpoint-GUID: OeuKCWqurXnDwlI977Y9Q6hGjBLHmtXl
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
Cc: tyreld@linux.ibm.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, sfr@canb.auug.org.au, jejb@linux.ibm.com,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, paulus@samba.org,
 hare@suse.de, linuxppc-dev@lists.ozlabs.org, hch@lst.de, bvanassche@acm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


John,

> Use scsi_cmd_to_rq(scsi_cmnd)->tag in preference to scsi_cmnd.tag.

Applied to 5.15/scsi-staging and rebased for bisectability.

Just to be picky it looks like there's another scsi_cmmd tag lurking in
qla1280.c but it's sitting behind an #ifdef DEBUG_QLA1280.

-- 
Martin K. Petersen	Oracle Linux Engineering
