Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1D63F5825
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 08:25:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gtzd34Tvtz2yPZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 16:25:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=G3m9qBKS;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=DBMOtrkE;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=JYKWDUZS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=G3m9qBKS; 
 dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=DBMOtrkE; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=JYKWDUZS; dkim-atps=neutral
X-Greylist: delayed 8462 seconds by postgrey-1.36 at boromir;
 Tue, 24 Aug 2021 16:24:53 AEST
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gtzc52lPyz2xsB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 16:24:52 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17O0x9eT013533;
 Tue, 24 Aug 2021 04:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=hcXmk2HQZrm7Sfr2Y4yVVZpIttyDcTFzIeDUSIkG/ow=;
 b=G3m9qBKSl77DR2ZhLHyHLPI5nX2YUG+cocWBDCVYne1VoLL404yyB/Va6q4lyQmhDITq
 UTc8SvW+MbtRl+59k4uO38PX15mBOUQAYNVgbGIfdX7zGVElfT3ANlQk9P00eBqDLD/C
 gWYAPjqLlbQT1Fhs+rZUEQtCubxsJVUp0kmfx9IAr/2v0I4Px0cIj4AUggurFNs1g2aF
 aLAKCiw/yqX33GWwl4dDwgEC29VTRZmJ3nqF9gUjSP1ZQVP7i9M7WecPHpA6BlwDDpb0
 DWAWIyzB9ksUnI1eQDpLADqx1jduTVi+r4sFb8d3cr7zbXNJiheG4bBPFVuKEjgAYcG6 WQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=hcXmk2HQZrm7Sfr2Y4yVVZpIttyDcTFzIeDUSIkG/ow=;
 b=DBMOtrkESJrRXm+KTBaWnar5jLRI+nB5l1DEIRmdpUA76gbOZS4EKG+fkT9NNzkIPz5L
 D+HUkZSs1BBKgtahb5MXmNWMOEj+Mrk25vUSSkAl6Cb170WKym5qAkP39/mD47wcgFQ2
 hjIbv0a2cVF2eQ1Gdld5E4WCfafp674kr3/st6trzCRDLYj6ctRjVqmYQm/lylYbuqi/
 QZ7vs4V4HdPrpVuQmzFelwFK/Lm75zAoY5URzEDGKCojMv3MNaMhy3WDs9xkCJ5gkFqx
 gjfcGtBZ3XC9uCYBHdQG1i0sLeUdigJoyNdp6cFUnY+O9j8pEe4kF9dt3M8Qoh7CkG8r pg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3akxreb328-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Aug 2021 04:03:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17O41X5U070148;
 Tue, 24 Aug 2021 04:03:16 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3030.oracle.com with ESMTP id 3ajpkwge4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Aug 2021 04:03:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPMI36yYmsw2re6iB0saryNA3QbudwholhUD4uTjSNGZYPFvZdPWzRZWJApNDs4rK86d5Nz2oDk2r8ZCeCrN7sA9ClkzLvto5r5fEF2n4A5S59Vs51OByE3Fa2nQz3O1TJYPYitmFSCOeDLUM/NaSM//UI2dgKApvAIJYCPxKhojQjZdlWwD/2c5+BOE7nwUuQ4xRg+L5xwDPHv2w5bioflSTWS/QMOJaT/SmVMYyVxlViFye4JnRxtaaG2TadZ0eWvfDnbyAdsDsWwu4bEVNKWZj1uBElaNgj5HxTuseucYErV0Tpohy3JAjZcrOK0lgIPe7o8NXFiyf9dc/rnfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcXmk2HQZrm7Sfr2Y4yVVZpIttyDcTFzIeDUSIkG/ow=;
 b=jPueW0pBSjuL/CL9+u3yTu/+JXsz/Jd59ZmL7ToPyeyibDxsk9MI6sl+I/wYFPHmEfllHlJdQUYSpydszZUe/GfK5byce7qwWMNguBbaj7SiMjchXfdo/QGRlmKS7m0ZUMHdNfNV5fbsU06ypzoQKY6oUCcCDhI1POjBCVRjtekppfzSkgTIC55EYNWteLvRpHh6oJKXdWzmIQ78NT4i2Otct0VTUfvpMx+nl0rRRBGhv82Q6ShfrVvZ3jd0tZxZBOnf+ptdSI3Y2nh8N7Uu4fFzB9Fj1hIhMpbrxkzGSKzs8+3PBfJ0Yd67ETceB6u3u8JnX3eArteQesAqiUV6eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcXmk2HQZrm7Sfr2Y4yVVZpIttyDcTFzIeDUSIkG/ow=;
 b=JYKWDUZSrhXRzFLOg+5/AZGD78zXfNEyKC5x9ry1TtTnEuSVWQqSLANwXPn3Z+Zx9qJ+T53Q5KdGjoFHYTvoCGZ1N9hvZcyiw2MFFzS1is6Uy4VVsRrWJzh9J1+kWbX9R/Z1/vsSWvzd3E3yvXdAbpZEoeguPfHOGjH48lRmHN8=
Authentication-Results: kernel.crashing.org; dkim=none (message not signed)
 header.d=none;kernel.crashing.org; dmarc=none action=none
 header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5529.namprd10.prod.outlook.com (2603:10b6:510:106::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 04:03:14 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c0ed:36a0:7bc8:f2dc]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c0ed:36a0:7bc8:f2dc%7]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 04:03:14 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: benh@kernel.crashing.org, paulus@samba.org, tyreld@linux.ibm.com,
 jejb@linux.ibm.com, mpe@ellerman.id.au, John Garry <john.garry@huawei.com>
Subject: Re: [PATCH] scsi: ibmvfc: Stop using scsi_cmnd.tag
Date: Tue, 24 Aug 2021 00:03:01 -0400
Message-Id: <162977310551.31461.11465606941000915884.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1629207817-211936-1-git-send-email-john.garry@huawei.com>
References: <1629207817-211936-1-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::30) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.201.9) by
 SJ0PR03CA0295.namprd03.prod.outlook.com (2603:10b6:a03:39e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 04:03:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c98ec5c9-8257-4b34-9427-08d966b41867
X-MS-TrafficTypeDiagnostic: PH0PR10MB5529:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB5529C2721B191A9AAA8AC6388EC59@PH0PR10MB5529.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: frZ7FkNgw1/6wWKzgxbYXtnnHF7iZmYuU/mwe+2jkRoqwz9hb6sizCqXBlVLCMwA7IxdanJ4W6Boy96SDzJh0RGE+u/XolbwiU5+scy34l1cwE2NZVHQFI9ctv/244sELvueIpcZSgZreNcj1gbLXalVAvX3MNGYUE0bhkIvmkCGf6f3DVMDukOuzz52MO/4fP2J/YPkC/6YBgxe5XoMZTVcU6VBlRaIy3JFI3SPa0sXa/dggGEX7yuQgq1OZ7n3970IfMLEwe42z/EYDEZxdHkq+qCvSBGeQgY10aC206V5XTdnflFLTztpuDiKAOtCqrx4FQRQfSgF5pPqcrqIiE8vcrMGw55S3eb8byz5pBCZBtxUDE5Jpwy167lsQK/bbepB9en4keP6ZrdXI/TWgly/J8fJcw2XrjWXRkSWBIYxfaPOr8mhNhIAf/NtkzMaOqBtgOWnGtKWbDBFFQQOKnIyQNQEu6IL4dQms/164YHmeBKsnO/QzYhC23gGkGRan0G5ajxBQzPQKEGbxRKkGCCeKRAdGueu6QaiHnhFQojo+sQWGw7x297usohOrVBCISbEaVhfATpdVtg+IlERWjs0nXqG9B+eavKrjX5N/FhkLla44mTff0Pp8nP0RGCNw1RfFuNT9AcZs/MhQSOfwXZywsNtSkw8pQa/VCdQFVy426KEFQg2uDLtp0kUSXjhCy48psC4wj80pknfMy+SJAujqE7KCVw8m02wja//AfFjJhQT0Vphz+0Q1jom8405/JarT8CluM6lZaTf+Mt1Xw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(39860400002)(376002)(136003)(366004)(26005)(5660300002)(4744005)(186003)(8936002)(966005)(38100700002)(6666004)(6486002)(7696005)(478600001)(4326008)(2616005)(956004)(66476007)(66946007)(52116002)(2906002)(66556008)(38350700002)(7416002)(36756003)(86362001)(8676002)(6916009)(316002)(103116003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K05BOEVkNlhVNmtZdW5JQjMxYy9renYxL08wUWpmRzFYSElUTyszN25kYW1Q?=
 =?utf-8?B?NnQ3WmlrUkJUSDdPS3h5b0tUbGUyZUhteGRScmc5aE1RdEhYL3lVVExGaFFs?=
 =?utf-8?B?U0N1ZzRxWDFzeE5tL243Mjd5M3Ztd1N6VHFobW10bmJ0bEVYUlQ0U2tXbWFM?=
 =?utf-8?B?bzk1dDMvZWNsSFNnYXNGVFd4R3lhclVScEtNNEJLSWFaZ1RGKzdFU3ovWFRJ?=
 =?utf-8?B?T2ZlT0dVVmpSanhvRUVnTlJqR21vb2lSeEtCMXM2V0RFMVZENnRaeGQyVnlD?=
 =?utf-8?B?WWh1QTk1RkZrRWVWYndMTHZmUGF3OTkvaDd1TGg2dGpYS1l6djErNVJkeEJh?=
 =?utf-8?B?aDRWSUxYeVNEVGJxS3J0ZjROQzRLSzZrU3NpditxTmROVlhSS2NPVkJtOUZi?=
 =?utf-8?B?VmNqc0p0RnYvTithbUUvSy9QUTNrQjNOVTVEYlZNQ2hSNTcwaURuazNXeUxN?=
 =?utf-8?B?OUxHTnNlOUM2MkdLQllwVWVwVk05QWtOdXRDWTlEQVQ0aDI3WmdoTW85RXdT?=
 =?utf-8?B?TmY4VWpQTUIxNzRpaTNZSWZ4bW9ubmRwOXROQmtYSWxQTTB5UDdxK2hwSWJQ?=
 =?utf-8?B?N2tUR2RrNTNOc0hiWG9MSjFkR2h5QlJ6bzRybVJocmVUQTJhbjY2TUdGYmtt?=
 =?utf-8?B?eXltdHZ3RUZtc0djMlJiSm50K0RGaDc0aXduZDA0NDFjWXlUamJPVzV1U0Rp?=
 =?utf-8?B?RlZHUllnVDgvK2V0R2g4WjFBWTBrK1p2a2lKUkNZZVZDcDExa0lMaGhVVkV1?=
 =?utf-8?B?TVhuUTBYL0l0YUNMYTVYQTdhdkhOUml5R0FaSm9BcEYvQ01xTzk1VnYwVFVq?=
 =?utf-8?B?bDR1YnJmMVJpaE9BMVdvNG42VVcwZGJ3dVVETjU5Ukh6dXprM05iMWNtaDJ6?=
 =?utf-8?B?aktzd21Xd2NXYzRpaHY5WG5NSzJuamJWK3YrYzRmRm82T0gybEFtci9ZcENy?=
 =?utf-8?B?SUkrY0k1d2psMmhYRFIyODVkdGhrQ0s5R3JzbGdUaXdQeGtZUlV4RUIxd2t0?=
 =?utf-8?B?RDRxMHdkOWFkRlFFWXRna1FKNjBYckJ6dFBZQWtlN3VYVDhqUFRNMUVEcjd4?=
 =?utf-8?B?dkM2VGpXaU8wT0dZVk1VQUdRSnJRSkRFQmI4YkxVeHZWRU1GNkZqN2orelN6?=
 =?utf-8?B?azBJalFBQ1B2eXRKVVdhRXdPVU1qNHRnQTN0R2dZQnhIdXQ1a2VrUzNRc2lq?=
 =?utf-8?B?ZnNFMG50S1hvWnlFejRFa0dLWWFsNGF6L3FRZEdHTUgrV1pGR0tXOEFYYnlk?=
 =?utf-8?B?NkkvQ0dxK0k0aWxyVURxUWVuYXJrMFJyYmd4bDFyZWM4Szl6ZmdkV3poTkVq?=
 =?utf-8?B?L2p4OFpYZnRsVzlFaER1STRCZDZmNCtzQVgwK2hOcVZxaXRMZ2RXeEdsSDlp?=
 =?utf-8?B?d3Q5RWpsSVBEUVpUQVBqdGtKbk9aRTdHcTJXanUzNUZJUkg5SUtFSjJmOTd4?=
 =?utf-8?B?cE5sZVZOdXk2a2JZY3o3REVzZE1yTjRDWEJNbVdXdUVsT0dTRCtuK0pHWEQy?=
 =?utf-8?B?Mkp1YWZWMzg1ODE2SnplOTZKUmluQTRQYmxVdkdZN0cxdUxMRW5IL1lISmpY?=
 =?utf-8?B?QmJtVERuSjA2Y2thZVlKUy9hTDJQUDloS1ZvVGsvUVFrbFRpMHFkS1Q1dWNL?=
 =?utf-8?B?cnRsNE03aXJ4aEplcG5RNk1jVkFLNUJ2U09JYklXa3Y5STk3K3Z5VlRHWXp4?=
 =?utf-8?B?MGpEUjRLTExWU2ZzbjFWRm01SE9zZ2EzTzA5Y3lOTHNNY3FrK1planhqQjMy?=
 =?utf-8?Q?MbUIiJRnyCqz9JauWy0/PN/jTr9Yae/WwJKBQrd?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98ec5c9-8257-4b34-9427-08d966b41867
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 04:03:14.1792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+GSwAyWT6Cda4NC3RH6Jg34f9O5IMZ9uG9cGRMrbFoF8oQ+AL66lht5l4FRmcag5UQLIVr9GgzUQDtmcfZ2VSPNTkMuM0ivM6MDTaEPpCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5529
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108240024
X-Proofpoint-ORIG-GUID: bo3UmSnnt-vrlzw3zqLAG4Zg_0XC-uPG
X-Proofpoint-GUID: bo3UmSnnt-vrlzw3zqLAG4Zg_0XC-uPG
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
Cc: sfr@canb.auug.org.au, "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, hare@suse.de, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de, bvanassche@acm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 17 Aug 2021 21:43:37 +0800, John Garry wrote:

> Use scsi_cmd_to_rq(scsi_cmnd)->tag in preference to scsi_cmnd.tag.
> 
> 
> 
> 

Applied to 5.15/scsi-queue, thanks!

[1/1] scsi: ibmvfc: Stop using scsi_cmnd.tag
      https://git.kernel.org/mkp/scsi/c/6a036ce0e25c

-- 
Martin K. Petersen	Oracle Linux Engineering
