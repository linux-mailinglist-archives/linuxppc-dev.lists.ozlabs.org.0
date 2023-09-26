Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D9A7AE376
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 03:50:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=D0Tds35R;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=z9wgvwFr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvjPQ58CQz3c7q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 11:50:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=D0Tds35R;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=z9wgvwFr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvjNS2422z3bw3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 11:49:42 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38PNDqOG030148;
	Tue, 26 Sep 2023 01:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=ThJzabKryzoB/It/+Ihg2dbDxBNjjNBZ8VVzy2Fbevw=;
 b=D0Tds35RX87MWQvkCwaOPQqhefPXmLfoMvvbsVhmCD1LoWsw7FBJ5nYy53x4gOhi9dx9
 8sN+Cy6KKTTVmsM7NuLbObEQ7VKcZK6SD1qRL0C2+cVEO2XHTox+ZblDeGpuIqeBMGNg
 MycN+jRQLg6KxV75RDOnTPMyoAuZwZ3WJh3o3jTNyM4o6ZzcdVrYkhIt3kuTduB7IlCC
 zex7YVEcXjb6ixyeXPL3WkCq5o4x1gNGFKuUGgOC0Am3Wu6hJl5++rqgRJ9WNNrdmZnY
 HdxE1SlbFHExuRbp1ATXqNaNsLbaWd0SP4u9xXOpl1opkbnZew2c3FUy8smWfmGB0Lbi xQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t9pt3n9s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Sep 2023 01:49:37 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 38Q15w2r034959;
	Tue, 26 Sep 2023 01:49:36 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3t9pf5kkv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Sep 2023 01:49:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxm9BY7JRQKZw67KQGQziy1SbPKbe+ioJxS8lh7sxS2xXya6yPWqlUoVhiarYjbmMPOrE5u8qJVt0KcT30vPtXWzC1QyMs/4UHEZMst6ENLv9aDwJokSAy+16bqV0c/rfAZL/YPlGFlxUB3ldcYEBpEsx9A5IlR3BNhwQKtpLt2Q0f/Ywkrtk6lUeWlagzvDv2Zx8O/HMXtxR5Hf6LwmvBZrE3n+th2FY6LNV4g5cCaf/MEB0Ycv0BeNRcQJ0Y8+WmUjOTdZz2HvZ0N5kFoOnFPoKJbpO4trX2SC7710Le8bfEYhNhmWKZFOPy3KbLl4NYncwvRK4fbAMD37CnJWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThJzabKryzoB/It/+Ihg2dbDxBNjjNBZ8VVzy2Fbevw=;
 b=XT4IiX4p0vnxS4gA8HEQ3oendiCqjLk5sRl8aLYkb6FsHV4PmFGiwg4m4nrL7X/s0MNAE6JNiBc+YVg25MTfsdkr1sL+JlGmqdxAmHtht6s2sysoSWsVR4ugi+oQRQ0vhoHv/yP7cZ+IU7CHFH7YQsVgAsE15H8X4FeKHA85LxmHxpyozzhjjcqQgb63m//6hZiSI2xBZvFxEMrJPxbR0ZLbUpaJokxD+Qx0Gu/JFawu0mDb2ou/Jr65hhlDCl3FNDm+PnE3tofs5d6pOlKb83QPgE6ofbg0oAqX6PN5LGOz0UwR4NWCT4hQGwMRIodV7x9R3vYimWVgjoNFSW+tVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThJzabKryzoB/It/+Ihg2dbDxBNjjNBZ8VVzy2Fbevw=;
 b=z9wgvwFrgIXRYkjXKw0XTUH+7YOBoRYK8Hpe+TZyRa+NtLh2SR8LIlXEtmDiAe0iZ0vboVOAn1TS8q1gBWmZiU6KJOYr3t1C5Y5ItGKr5AH5B8lbV+0Tg8kNSe+2u1+/SPDXunp3wE/OnSoWuNaCYxnFGFOxSelviWUy5IiergE=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by SA1PR10MB6294.namprd10.prod.outlook.com (2603:10b6:806:251::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 26 Sep
 2023 01:49:33 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::8979:3e3f:c3e0:8dfa%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 01:49:33 +0000
Date: Mon, 25 Sep 2023 21:49:30 -0400
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [Bisected] PowerMac G4 getting "BUG: Unable to handle kernel
 data access on write at 0x00001ff0" at boot with CONFIG_VMAP_STACK=y on
 kernels 6.5.x (regression over 6.4.x)
Message-ID: <20230926014930.yi5v35llxyc5fvwi@revolver>
References: <20230926010159.0f25161c@yea>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926010159.0f25161c@yea>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0287.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::9) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|SA1PR10MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: 24070e90-6389-4230-7ce5-08dbbe32d4da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	OfcXNgGZg44VLFAg4g95cQhnrJmqpy2lVcKOvkowscg8jCyakIqZXVQ89Q1iz46YDxb3ocY1r600O/B/MUGz978hRSV45whInuiJ9+gdBXKInqVMchX961xYbBYI6Amfx+o/+YQlgMfcJZuGPrakKYIo2W++5vR8OY6pNDsLBMvAkmtq9WrIL6iJRR2+PekTmvZnegw8ziNS8V3ZDkWjEMc+5rIVlsgd4u0mXDxYNRplj/iu98PlJyWdnAsVyqQrYyn37sonWzB+qocoHJXA7bs1BscaxvikDCwStduQF6FsI2F1HUgyDj1RPHABDy6vACWZewzp9w9sGCNywPQ01huqqitAb/QUJM/KYO40WfpHgN7xWc/YkHctblggfWnHqytD3Js0Fw4pjhoV+d7ZdNBQ+mEBYctEcnkz9QBaEajDFuRFa88UJzxBXKLUpsZejt50BcljUH6fh6F/IYDEbudwFas9PbHNaoHXaXoS50bgSJHULEoxWHmsXhXeraGZfZRFmRQadiwczjXvo7Pi9uOtHXOrdUWhFhi6j3JjJuXE2P3Ys2XywuzI/nITazYaDc0xXTy3EqdSoPkD+0fUOQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(39860400002)(136003)(396003)(376002)(230922051799003)(186009)(451199024)(1800799009)(4326008)(478600001)(8676002)(8936002)(66556008)(83380400001)(6512007)(966005)(9686003)(6916009)(41300700001)(316002)(66946007)(66476007)(45080400002)(38100700002)(26005)(5660300002)(1076003)(6486002)(6506007)(2906002)(33716001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?t+qSN4I7Yy2bFISWHEQp3LEzbvoxPRbFyNEnK0aZNPsiF5UO/KFuvimM+PjX?=
 =?us-ascii?Q?AlShR9HeUAdXNiJDSSzCmwuQT690KQArYxjGdou16s47yjUhXuu2vfgLpc3Q?=
 =?us-ascii?Q?pULeKjPYIPgySwOYRYb9yA5W16Rsu01DVthxROr2TnMqWJuPIOUz4rAHGU1l?=
 =?us-ascii?Q?UZbtKHiK23H5idTxHdZIWdEfTbwD29MhWcXGZ4VIAM0ZmiF1wahQthjxhM54?=
 =?us-ascii?Q?sraewd4+RBRoi8aj3lMStLVaHAFG0MahdBt6MsB7PNZbF44IQz8i6zFIcI64?=
 =?us-ascii?Q?YgO0ZgnCPupN7PHkLYBzDHCGvGhdnQKvyJ/BlNWD3mvr0GlX9Q0R5yr0vCau?=
 =?us-ascii?Q?quO9QPOzls31KcNyEQw83ED0X2WgPxLSyrlyYuvdjGclMt7bVUcJl5Sa8Ae3?=
 =?us-ascii?Q?m0wdT3BOr8mWl3dn41fXAVSOqEM9SbP4b8kBeGq2vmiLTnSqImvFxf4jzZ0a?=
 =?us-ascii?Q?V6LmRQi/DrgGsF8nM4do+zK+kmUg+Hi+Q6un0t2/PERvUpV8dgrODvVlCs0B?=
 =?us-ascii?Q?aJDQ1d1IPmDNLP8+D49TKCEfU1vRMJm2VXsdUXLSdLgdxUhd0JUUH+IGYuIB?=
 =?us-ascii?Q?KSg2f9t/tMuXt5Hidefd++fc+eRvmZeRP+Iw04VUF5keeBWEH+DndB5ie7E/?=
 =?us-ascii?Q?QnpLw2a3kpwDag1PCXIWcDJkEAds4JoOq2/8O77BflUNBOu9RBrnfUdFH+0V?=
 =?us-ascii?Q?Az5pKoOk71QaJZMKWo72wCNI24YLU0wwPe7vyt+UUsa0a7QCqt5Z7FNC01ow?=
 =?us-ascii?Q?uWGHdZGNONnjYY398VLnCotgdXGFFyjPiNXW+Y0MfKrJu4T02GGxEnczL7ui?=
 =?us-ascii?Q?yZ9jXR5C3B+4JDPcdOqEv8DNS5BAujpwvx1oB3nBq4DnxxoLHNk6nOz2k5W9?=
 =?us-ascii?Q?JWnMybo/523kTG+/AMENB+vDvLFPU1EhjqjHqZIjw8snXRa29zx2OIKoWf4B?=
 =?us-ascii?Q?af0NQUm7MTIH1gLKzKh+loLbMO0YRatRzazV9er6Fwaq94CG+RQDEcSTM9Vl?=
 =?us-ascii?Q?wPmiKWJ6eTpy/85EKGcu+LMZt5OJA++MebvOrP77AeJ5rkRpaz4LC5+Mn1pv?=
 =?us-ascii?Q?oUumDOiPJy1HTTKSvF+WFb956Qy4b0sJz8gtf7Yb9zU/gPtJM9KrNCzobhfq?=
 =?us-ascii?Q?UT/Fa64jp6Ooo55oOQBOp0znAVGG+bi1akI6t740SmQ2xvJ5a0Y3+Z0rzVrv?=
 =?us-ascii?Q?Y4yK8brsmJK6N/fguNC6mZftQBcjKFMiklmtv0FI1nDVwmblBFXy04ygR2oG?=
 =?us-ascii?Q?GnP97qCku+VX0zFkL8apfvNH7+7TQFhQ296B5cKEp8BPT1d22Qi3C+aEnXJF?=
 =?us-ascii?Q?1FBwD2Ui/FFOsLu2pAp1VmflYnXziy6ARSniTwaR6iVRtyDrmvVU6pvyv5IF?=
 =?us-ascii?Q?YciMMPVLnk4q485iCExVkuT37JDEfPzcvAsQFlOkDTtUK4AuKjtMQfV1744B?=
 =?us-ascii?Q?TRiL9EDkeOKsh6DgDfBGaxy5Z3mPCNAZDz6m6JAJCx6EOeBaW4PdmcirI76C?=
 =?us-ascii?Q?LlRYRF0w/y21AF0dQ4RZ1XpTqttECqlhERY1Y4Bwo4PAAoPJc3kxVwC8Pg3v?=
 =?us-ascii?Q?xNVp9ZPjIt3gt+8gIVmjKwvDocEKDjpxe7pAV5Ak?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	8zZLi0caBR3U12p8m5y3zaPJyyk9zN2shx8PsbQnOSSmYFR5zdnyBKCCyOHNNORW50UHSFmn/sB5LoTIXtL/ZV7Fb6y7DvnXUro/X8da1kpnqLVetj/7fJ+UmXT5Mk0ud3v5n3DDLygxJGu5hleASJZSgtHrEzlo8zk3DaO+CrLXBXy8vJFKG5yhi1lb0z7UKGv5uYrSXo1aJmM6Ser0CXgbHXIlB0hJu7ZV3A5p22eGqxemWGyZ6fb0bTAC7gIp7WHGuRhDeZ0sMd1Kl4JLr7WLlvFHUhDjYxuTkN9dYs6q91AAtkmmW1Z2Vwc1MfkQk2fC+YQTVha9Mh5Fbujg7DHjHaluxc6hNhEh4XpC31qx9sIveIttvhCGW6OosHaLM0Hl2AaqjbU5Am4ysYXYoTuJ/kXpBkczEifgtliuMtGkdqpyazJp00HMwCET6p1q4sFHETxkcmdzIQoXKiaKoy0s56pC3h25nz1AYlI+1MMOX2OMynOjozYTDr+2RcQptcYsmUesf18weAWQhS0N9g7Fa5NLSgLe8b/oHLOoxiFlGtOV3iPqkrTOR0SF24JIHOIlrXACIkAIl7GEDUk4Kv2V6XCT/u2SlrGKE47fsdzunWZq77QyJpWXLVNKhHpWthCcAxXt9HHYwa43PL+B5BdwVejp4k3SJp4XtASs+s2F7A2vrOjHTfne2aoB0XjG1L95J1ZT/BfKQ6baVsop4qerkhQcZbibGgOuS9HOAZCdUiVOBxMpyqRbBCvKblgv8pfembT6g32vo6vy0V0U9JChXW2CYEEJTLu78JsljZ/BErYxhNhuZHfLLTh4AeYstz1PV7oSJTxfyr6wVJhgJg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24070e90-6389-4230-7ce5-08dbbe32d4da
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 01:49:33.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBJW5llFI4nB2IvncFfx9cPjOLBk2wYeJc9rNHhAkd3iWueiz1yuoh7DsOX6ei565iIPzGKaquWTYK9vYgfdbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6294
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_01,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=906 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309260014
X-Proofpoint-ORIG-GUID: isaRzw2blWx1G6zcEiRfVZiDZ8QavLpX
X-Proofpoint-GUID: isaRzw2blWx1G6zcEiRfVZiDZ8QavLpX
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Erhard Furtner <erhard_f@mailbox.org> [230925 19:02]:
> Greetings!
> 
> Had a chat on #gentoo-powerpc with another user whose G4 Mini fails booting kernel 6.5.0 when CONFIG_VMAP_STACK=y is enabled. I was able to replicate the issue on my PowerMac G4. Also I was able to bisect the issue.
> 
> Kernels 6.4.x boot ok with CONFIG_VMAP_STACK=y but on 6.5.5 I get:
> 
> [...]
> Kernel attempted to write user page (1ff0) - exploit attempt? (uid: 0)
> BUG: Unable to handle kernel data access on write at 0x00001ff0
> Faulting instruction address: 0xc0008750
> Oops: Kernel access of bad area, sig: 11 [#1]
> BE PAGE_SIZE=4K MMU=Hash PowerMac
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Not tainted 6.5.5-PMacG4 #5
> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> NIP:  c0008750 LR: c0041848 CTR: c0070988
> REGS: c0d3dcd0 TRAP: 0300   Not tainted (6.5.5-PMacG4)
> MSR:  00001032 <ME,IR,DR,RI>  CR: 22d3ddc0 XER: 20000000
> DAR: 00001ff0 DSISR: 42000000
> GPR00: c0041848 c0d3dd90 c0d06360 c0d3ddd0 c0d06360 c0d3dea8 c0d3adc0 00000000
> GPR08: 00000000 c0d40000 00000000 c0d3ddc0 00000000 00000000 00000000 00000004
> GPR16: 00000002 00000000 00000002 00402dc2 00402dc2 00002000 f1004000 00000000
> GPR24: c0d45220 c0d06644 c0843c34 00000002 c0d06360 c0d0ce00 c0d06360 00000000
> NIP [c0008750] do_softirq_own_stack+0x18/0x3c
> LR [c0041848] irq_exit+0x98/0xc4
> Call Trace:
> [c0d3dd90] [c0d69564] 0xc0d69564 (unreliable)
> [c0d3ddb0] [c0041848] irq_exit+0x98/0xc4
> [c0d3ddc0] [c0004a98] Decrementer_virt+0x108/0x10c
> --- interrupt: 900 at __schedule+0x43c/0x4e0
> NIP:  c0843940 LR: c084398c CTR: c0070988
> REGS: c0d3ddd0 TRAP: 0900   Not tainted  (6.5.5-PMacG4)
> MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 22024484  XER: 00000000
> 
> GPR00: c0843574 c0d3de90 c0d06360 c0d06360 c0d06360 c0d3dea8 00000001 00000000
> GPR08: 00000000 00009032 c099ce2c 0007ffbf 22024484 00000000 00000000 00000004
> GPR16: 00000002 00000000 00000002 00402dc2 00402dc2 00002000 f1004000 00000000
> GPR24: c0d45220 c0d06644 c0843c34 00000002 c0d06360 c0d0ce00 c0d06360 c0d063ac
> NIP [c0843940] __schedule+0x43c/0x4e0
> LR [c084390c] __schedule+0x408/0x4e0
> --- interrupt: 900
> [c0d3de90] [c0843574] __schedule+0x70/0x4e0 (unreliable)
> [c0d3ded0] [c0843c34] __cond_resched+0x34/0x54
> [c0d3dee0] [c0141068] __vmalloc_node_range+0x27c/0x64c
> [c0d3de60] [c0141794] __vmalloc_node+0x44/0x54
> [c8d3df80] [c0c06510] init_IRQ+0x34/0xd4
> [c8d3dfa0] [c0c03440] start_kernel+0x424/0x558
> [c8d3dff0] [00003540] 0x3540
> Code: 39490999 7d4901a4 39290aaa 7d2a01a4 4c00012c 4bffff20 9421ffe0 7c08002a6 3d20c0d4 93e1001c 90010024 83e95278 <943f1ff0> 7fe1fb78 48840c6d 80210000
> ---[ end trace 0000000000000000 ]---
> 
> Kernel panic - not syncing: Attempted to kill the idle task!
> Rebooting in 48 seconds..

This looks very close to the crash a few weeks ago which bisected to the
same commit [1].

Can you try applying this fix [2] which is on its way upstream?

[1] https://lore.kernel.org/linux-mm/3f86d58e-7f36-c6b4-c43a-2a7bcffd3bd@linux-m68k.org/
[2] https://lore.kernel.org/lkml/20230915174444.2835306-1-Liam.Howlett@oracle.com/

> 
> 
> The bisect revealed this commit:
>  # git bisect good
> cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b is the first bad commit
> commit cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b
> Author: Liam R. Howlett <Liam.Howlett@oracle.com>
> Date:   Fri Aug 18 20:43:55 2023 -0400
> 
>     maple_tree: disable mas_wr_append() when other readers are possible
>     
>     The current implementation of append may cause duplicate data and/or
>     incorrect ranges to be returned to a reader during an update.  Although
>     this has not been reported or seen, disable the append write operation
>     while the tree is in rcu mode out of an abundance of caution.
>     
>     During the analysis of the mas_next_slot() the following was
>     artificially created by separating the writer and reader code:
>     
>     Writer:                                 reader:
>     mas_wr_append
>         set end pivot
>         updates end metata
>         Detects write to last slot
>         last slot write is to start of slot
>         store current contents in slot
>         overwrite old end pivot
>                                             mas_next_slot():
>                                                     read end metadata
>                                                     read old end pivot
>                                                     return with incorrect range
>         store new value
>     
>     Alternatively:
>     
>     Writer:                                 reader:
>     mas_wr_append
>         set end pivot
>         updates end metata
>         Detects write to last slot
>         last lost write to end of slot
>         store value
>                                             mas_next_slot():
>                                                     read end metadata
>                                                     read old end pivot
>                                                     read new end pivot
>                                                     return with incorrect range
>         set old end pivot
>     
>     There may be other accesses that are not safe since we are now updating
>     both metadata and pointers, so disabling append if there could be rcu
>     readers is the safest action.
>     
>     Link: https://lkml.kernel.org/r/20230819004356.1454718-2-Liam.Howlett@oracle.com
>     Fixes: 54a611b60590 ("Maple Tree: add new data structure")
>     Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
>     Cc: <stable@vger.kernel.org>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> 
>  lib/maple_tree.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> 
> And indeed when I revert commit cfeb6ae8bcb96ccf674724f223661bbcef7b0d0b kernel 6.5.5 succeeds booting with CONFIG_VMAP_STACK=y enabled. dmesg of the successful boot with the reverted commit attached, also kernel .config and the bisect.log.
> 
> Regards,
> Erhard F.




