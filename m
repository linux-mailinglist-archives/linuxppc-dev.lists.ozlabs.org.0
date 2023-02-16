Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E37699903
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:36:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHfDl3TG8z3f3c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 02:36:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=mXnmNGJt;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=QntxeEP+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=mXnmNGJt;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=QntxeEP+;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHfCk15krz3bgj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 02:35:28 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31GFOBA8007984;
	Thu, 16 Feb 2023 15:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=XctDfsisTZ5Z2OssVOs3LZFxL8tCRhMJ8eiopfmZ+XQ=;
 b=mXnmNGJtof1Wyaon843a87drhjB1ibXogY/pP8yqY1DWXMTD1TtOAdTzDwTrtICP8REs
 xrngAn7daxShLMwIBm17/2hcnSEQgqEq7MWcq6XqI9PxaX1Dm515NriOTkiAwWyjvn6l
 7zknjLEmL6u4Vyz33KlwTpBUcwq+FLpZkqB3i0j2kumAIQbHJk4KBYTpS+hwTcaCsFVM
 8IG8cvm1BrkrDtjQlzdr9cdQEoTTFs+jnf4+vb/bWQ749bhCVCmw+vp+NTNTnrUDnunz
 p4qCD5AcdwZyp3wxKi6TLylvLMgXiywdXW+0HPIZ857KfdZAIIZOPmcQKNKfEa0KTiTc ZA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np2mtkf97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Feb 2023 15:34:15 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31GEIeE2016819;
	Thu, 16 Feb 2023 15:34:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3np1f8u88r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Feb 2023 15:34:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMN1IU7BD0aspJNEtGIPf+a+3vpRpYeFDdfGrIkMQUc0zXG9AV1L+4lvsVwUnvGDYSKayDauKeY7Ve0ysTJCLg/P3zc99xuQfNju1mhVw3VLZnJwBkRRwFHf7jbzj43wxtpeU/AF6PhJdiRvrj18atFhqizkRZ2u0+tLrcGBKrLIj5uvd4hu8k/GJNcJHDwPi7y5+rYZUtRcphATijyg1E8EdNV92GZOUEWHzq+FOU3KSIkfolowVBr/Lrfx7qMIGrrN9e+aq45d2QrImSC+zgLmTC1s3tuBCAy0LF1200ZOcE3Z6LsAUqoZLrVT5zBUY3i2+u7NRTogT9ZC5B2o5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XctDfsisTZ5Z2OssVOs3LZFxL8tCRhMJ8eiopfmZ+XQ=;
 b=QpJDRyHATL4n6HgidttBlcSjhbQojGFfmTZ2EwxpPwTIPYHkI6Rp22MZIsKyCeJkI30PExnE9Q1dO9igLBIIGGfhsDLAUPmeGqjjbryBk/8MzZgntCLSsE6LVWPOam0ClJecY2gAwNc6AEJyJENVO/t8khpMHEP8KW4YeZrw6b10NBk+LCeUg9vXb4u6TxjLn/zpDCviAkIRaMn/JXtFNMf/NxYD3iS/4oNqtF2sAmT2vpx5SWypPrl3KisFF0AtVeGC+qTLgN1VnFcEesWz9wMNaqmsxxSWPB9l40dMBVwDTCfRbxpTmfLgKE2JOwWZcLiWNzFcp71weT67eMW/wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XctDfsisTZ5Z2OssVOs3LZFxL8tCRhMJ8eiopfmZ+XQ=;
 b=QntxeEP+f//WgdfQpbzo67VbtO69H34VmP8JkTHWjy3boPVyoyicPMV18GqZAOM2ilEFDaZqVw2Ay6BDqz0E0KYXU3RfTlaleY0die+clPRdR0IaW3lXILA6K/EVNxdgdRrHxtUcyvuVX/Acw2sVaozhO1O8b9D9y2kQ345zi3w=
Received: from BL0PR10MB3011.namprd10.prod.outlook.com (2603:10b6:208:7e::29)
 by SA1PR10MB5865.namprd10.prod.outlook.com (2603:10b6:806:22b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 15:34:10 +0000
Received: from BL0PR10MB3011.namprd10.prod.outlook.com
 ([fe80::e5b3:149d:afe2:2d47]) by BL0PR10MB3011.namprd10.prod.outlook.com
 ([fe80::e5b3:149d:afe2:2d47%5]) with mapi id 15.20.6134.006; Thu, 16 Feb 2023
 15:34:10 +0000
Date: Thu, 16 Feb 2023 10:34:05 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 21/35] mm/mmap: write-lock adjacent VMAs if they can
 grow into unmapped area
Message-ID: <20230216153405.zo4l2lqpnc2agdzg@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	michel@lespinasse.org, jglisse@google.com, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, mgorman@techsingularity.net,
	dave@stgolabs.net, willy@infradead.org, peterz@infradead.org,
	ldufour@linux.ibm.com, paulmck@kernel.org, mingo@redhat.com,
	will@kernel.org, luto@kernel.org, songliubraving@fb.com,
	peterx@redhat.com, david@redhat.com, dhowells@redhat.com,
	hughd@google.com, bigeasy@linutronix.de, kent.overstreet@linux.dev,
	punit.agrawal@bytedance.com, lstoakes@gmail.com,
	peterjung1337@gmail.com, rientjes@google.com, chriscli@google.com,
	axelrasmussen@google.com, joelaf@google.com, minchan@google.com,
	rppt@kernel.org, jannh@google.com, shakeelb@google.com,
	tatashin@google.com, edumazet@google.com, gthelen@google.com,
	gurua@google.com, arjunroy@google.com, soheil@google.com,
	leewalsh@google.com, posk@google.com, michalechner92@googlemail.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20230216051750.3125598-1-surenb@google.com>
 <20230216051750.3125598-22-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216051750.3125598-22-surenb@google.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0197.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::7) To BL0PR10MB3011.namprd10.prod.outlook.com
 (2603:10b6:208:7e::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR10MB3011:EE_|SA1PR10MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 06481105-5d3c-4145-3dfd-08db10333f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Y1Pt6J1aTWmlZywVwhSZUA459mNFKPyrSeKvCyZeiyCNvaj+41AO4N/+Gx2npnmy/6so1hyaw/6FdUYy/qOXsIw0mOX/C5XXFYtur4YSxKssWcEnIZU7u662Wd99BF9fLXCo5xbosdoUy0AQGuMWBy+YA90thOvZPfwnppCw1NV/CZXURz5GjrqlcOGF+3rHDXUpOs2cJIYJZY68joEaQN42gPMhiRvTnIso50r389HUGrDzFKuGsud02AG99y/f3hdhYCnRxlrk0RfmL+R8FUseUlrcXJMvPN3gzTjRQBc9sPOslD3FYF26YxmA8Mj3fWE3kE5SSHp7c8xoqg2xEXyNXwzSIuxp6isPCfO1gwDiFXyGxnOXXix964B+Xaz+EhpbmoeuH1rHqqtNVaSEiXfmfGqhEwNYoSheU5aBCy/IxiMMoVzeK8NNjCwyeQ3zKne5bHp98tfNYtXSU8gYmLim7+CK/nJC1NaEljs/bs3GOsgl703+Cwi1A6tC2je564c2clwMB4O+0yAHfuxVFYST0ab7pmpRGYBtPA5aFQririJvjTqxgrMEWcGo9ye/UgpXkLNNrgCrQg7F6gLpvGRzUPUsJg5NDdsVb375Xum/DTRUGOB19OPl3QM50NJEx3DvD4sBHEDWicx0zmDb/Q==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR10MB3011.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199018)(38100700002)(86362001)(9686003)(316002)(66946007)(66556008)(8676002)(6916009)(4326008)(66476007)(2906002)(7406005)(7416002)(5660300002)(33716001)(8936002)(6486002)(6666004)(83380400001)(6506007)(478600001)(1076003)(6512007)(186003)(26005)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?yby38xH7OkZ25/tXxbCIxpzMRxu+MDbWCaUU+4EUygoxzJs7Y2NZk6ClW16D?=
 =?us-ascii?Q?m2mAE3cSIr4VSK5W8AvHzOKrnOzN6afn49UgCdl6bMSf0z3ZHEgqcJ1zvMs9?=
 =?us-ascii?Q?EdcyQCmoQSRprQDhHGGTAclW8xhnwyFGzhr+sxXsT6+YM4vLyPU0JYXkDkI6?=
 =?us-ascii?Q?vKgmCwTZdhIJmR3h7Z3AAe4UBpIPIsTGcM5mah7ocHCYqs5ZyFe/ikaMzi7o?=
 =?us-ascii?Q?FAEfjjgRRh64clZ53CxKWnMkOwGyJjQWb8//oSa6XMg995u/ZogzV3D1ci1o?=
 =?us-ascii?Q?3bhHl48x13V5F2O9LH5sDVfGK0jR+SPS768TBay5Ay06vZhWKjqRqC3sUgoH?=
 =?us-ascii?Q?FeoG6x5Q+qzJHEYE5HwKL8lC04Lr/xDLgYzyzp/wWh6afo6b5QJ5zV9AqCDf?=
 =?us-ascii?Q?Zj13+HkGP5Vfdamd48te3WFqCtph66qDx8Al4xHN9+UCxTLlwH8YIVzFLVnW?=
 =?us-ascii?Q?kH65n/17tp9+dHkMEhJrwRNobdxyhdI75aVu+PJWvSe6hJgzNPoObelQgp/X?=
 =?us-ascii?Q?mPYSLw9EpOI66GkAMN+PhfGvqY0YlY7uScBrdu1T+MI1xSWwO54egMAaYwT0?=
 =?us-ascii?Q?P551xZkFFVxgurvf6/dx/+zImpq27INOFV6GljfanonGHeofjiyinjinbVzs?=
 =?us-ascii?Q?+ieYk1TN+3ak8THUWHO0+eFvwVzVfIhQSa9GwMH0f4OEAJR3Rn8vsT6szkTu?=
 =?us-ascii?Q?0sWFB2BKJND0NwRwjQFWR3efFxN4BNSShue+vfdT+TJY4NTmX9Bu56hXB0v0?=
 =?us-ascii?Q?kgDOJ6V+9yu8edpcQovHGZQangnMwZoQd0Veu8qlu5ivJFlXqQg+dpiVcgP8?=
 =?us-ascii?Q?PR/bEv2DytIvpDxZkItSjCpp3rB/xnf/d5ZxpXU5y+QYWShQW6Mrc4cZWMIT?=
 =?us-ascii?Q?dy72+GLkEI8Kt9+RyofFReHAt6KIo+2zJKyBM3ATkvsjYOBoVmlVLIsHJihh?=
 =?us-ascii?Q?oB6HZUHHwH6r0aOB5EUn4RizWS6x52/WCsdSVPdK3icLJbFdScJClFcNBWEs?=
 =?us-ascii?Q?Fdbis4SHIKdP+E4Qnv1pBD2StNMTuQPW2g2Gdjh8/PY5Z0BIXo/8N9UObM/p?=
 =?us-ascii?Q?faYlG5TT/p/Xjf5JVTudPNc/dg+UEM/Xsc/JsunSUIaeXG35HJ4GSRynP7dm?=
 =?us-ascii?Q?TPmQwevXDQ3QH7BquKClL5IJd4AeiPPDFLj1o6trewavHTnkKnwOXcyJpf3L?=
 =?us-ascii?Q?EQEs0VgCuQ8BddNpvdv15PJbAWvxPFzvIM3672Lx7yiRHEpBnl7/vE8CA6hr?=
 =?us-ascii?Q?wZbzrq2N4bKgPyE09+ghRJcg1XWXBYiVGVBusV0FhGwpG8xzFbRCu1VL590J?=
 =?us-ascii?Q?zTPSAU+Pgw360B3hdDbUcZseoxqXe0ZwIfo1TW83vdZ980gyGYdy3C9JLSwI?=
 =?us-ascii?Q?ZluDl90JHSyjAK3pNh/mB0AZILhVsE3cqczehdg3Pt/i5042i/FsOZhLM/6q?=
 =?us-ascii?Q?4fqIBCZzPbuoUApsbTq9q4j6vF2DahKiRGykYYDv1bYXcpB9lNztQrrq71fp?=
 =?us-ascii?Q?BkYiBrr0/UFY+Yu4DT4MGUaUrbBr3hCI8ajTlhUOqLYLGMFJzsKWGAdxHrRs?=
 =?us-ascii?Q?5w5H0Ka88Pi98NaCOQb5SIpBmfr9wDo1z5bYrERPV6B9tC4D5f/QwO2ZRqRQ?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?Tq+lCUe0FtqX0FZhpzxJJOoQlF/M1IDbPa6R8UrYqB57Mv9QMSFa8dY0fBOR?=
 =?us-ascii?Q?Nxe04eQC6H+pIuyWHuO68efq1o56K408PIxnGgqBuU1QrdakGr6rMUR7htkF?=
 =?us-ascii?Q?+V8VKsWY0ssFdQafeg/8ow7w7zsd1/D4IzkZWxEfiEq1RxXbql4KwY2yAkEz?=
 =?us-ascii?Q?bd1XuYRX0ZPWhNutn3NBXBxRG7KzDv50FfKKE4W7s+cgXsGajmThb3opZKSB?=
 =?us-ascii?Q?gvRPDKpImr0VW0yumV338jyEID3IFPStbhn98KDNHVOoojETlZMOOy5R3lv6?=
 =?us-ascii?Q?NYNwZIiHs6Klbpb1pdX6hL4l5AysXlIvTKsgS2zjOvBzeLvd9F0yCgYFd6dB?=
 =?us-ascii?Q?uuPohu/FYSjpHZdr4N5WSp1BIehtKxSzT+hW9NnAiJK3Bn1i1LbdBJqVx/mp?=
 =?us-ascii?Q?8fgfaPgmUK4lA91uVH+VCAMVe5VgnkYWPiIzvY+Hg4RT49QhP/l8fwWYdKPe?=
 =?us-ascii?Q?i1/ng9dF/JbSOBZ5ChWhmwbN65P29o6KOumrHZeGG8wyaLPf7omD0htUPIKq?=
 =?us-ascii?Q?hTmORV6u60ObOwuXIf7GYsmMRJ5HoJpiCHKLshcuXDiY3thCZ4tZqhH/vjqb?=
 =?us-ascii?Q?JDnAr0a8mHvzXbIwHqbQUDXcc+zT4FjkZW20TQ7FJV59LA6poJblXT2nVk0A?=
 =?us-ascii?Q?8JtnLPS4oByk3Ii0TbRcGScRmYIeMyJkJ1gOjymWtE6EyFI4hNtmtORXg7C+?=
 =?us-ascii?Q?XWK4U6E+ienbdp9SjwmyEDS7mEU2dJV+3U8ytH6wEsQ7xVX7zyQbcwhtLtSC?=
 =?us-ascii?Q?Znv21Cqx7eO9wY0vQeRd/oShrsq6CRTM2eAWdvYp/jpf2RkMIkB053Utfz8A?=
 =?us-ascii?Q?k+9pYuOvsoBa5/dAZGgK1Fqx7C7WCxESZLArSPo4UVCYmFgnOhCzMpNANs8L?=
 =?us-ascii?Q?o9aE8iLoE1sW7GbvE6Fk3eLoAZnbcaALdWTSHuyvSLsnWVKsVdM6P2C+89la?=
 =?us-ascii?Q?Q43l2nQuPCjnmdzRnJIhinNoIX87rO/ULXxZnPv39HVqUQBioeD627Dv9fNg?=
 =?us-ascii?Q?i49x6xf+4XbGKVmurVAmCKjWPQhZMNFXRWOwGtKe91lOXq6DHSg4r1wLIrNA?=
 =?us-ascii?Q?IglmC7i77E25OEXIJpIorDlrBsTsDjrkC5jIUkEoM0MJbxlkVHsJ68tSa1qW?=
 =?us-ascii?Q?vv7g812NPmxotma6tJY0ojLP0mwm+kf1NTV6NydhLmtUKLG9kNFl8bLSsUwW?=
 =?us-ascii?Q?la1ac0iLIXoNTdbDt3RMyK5cPRmnXqEH0mKE6e8eRQFckxjqhonog4WwiAtb?=
 =?us-ascii?Q?4rOduRDDAInFu0rS8Q/ioxJ8Tjrzci0Do4cq9qd7Iqi/50NoLFgeByfi7Xbb?=
 =?us-ascii?Q?rs43muWhEnvSL2Xe66IL/7EN2IBfTT5xZ/z56MrBinZF3uh3tfHZh32fdD0x?=
 =?us-ascii?Q?YxHo2dJLPvGWS5av638tjiHcnvKklJ6fnh4xFH28NzRog4tVwYEtFcmH4lc/?=
 =?us-ascii?Q?y3qco21aEsyGyF50gNP6OOZxWNcOf4JPfRNYF0XVUSNX2mokFzhR6ZVedeTF?=
 =?us-ascii?Q?wIL2ZzSVrVI6ktb6Xr9GhmDhOOMaVCDRtc9rvw4+aTx1JwFiGHCqAYHKKw?=
 =?us-ascii?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06481105-5d3c-4145-3dfd-08db10333f33
X-MS-Exchange-CrossTenant-AuthSource: BL0PR10MB3011.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 15:34:09.6193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ogf+yc4IBa6GsnpyM9WBcH4Dll/dZKl/O1GJYO8ohIgJInvpr+xQgEuO1w0JZzSGT+TiJ7qUbmgcfUQKe3Ah8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5865
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_11,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=478 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302160134
X-Proofpoint-GUID: bBH9bPc4RPmB5WazVNqrdw5ikD12RdKj
X-Proofpoint-ORIG-GUID: bBH9bPc4RPmB5WazVNqrdw5ikD12RdKj
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.c
 om, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


First, sorry I didn't see this before v3..

* Suren Baghdasaryan <surenb@google.com> [230216 00:18]:
> While unmapping VMAs, adjacent VMAs might be able to grow into the area
> being unmapped. In such cases write-lock adjacent VMAs to prevent this
> growth.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/mmap.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 118b2246bba9..00f8c5798936 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -2399,11 +2399,13 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	 * down_read(mmap_lock) and collide with the VMA we are about to unmap.
>  	 */
>  	if (downgrade) {
> -		if (next && (next->vm_flags & VM_GROWSDOWN))
> +		if (next && (next->vm_flags & VM_GROWSDOWN)) {
> +			vma_start_write(next);
>  			downgrade = false;

If the mmap write lock is insufficient to protect us from next/prev
modifications then we need to move *most* of this block above the maple
tree write operation, otherwise we have a race here.  When I say most, I
mean everything besides the call to mmap_write_downgrade() needs to be
moved.

If the mmap write lock is sufficient to protect us from next/prev
modifications then we don't need to write lock the vmas themselves.

I believe this is for expand_stack() protection, so I believe it's okay
to not vma write lock these vmas.. I don't think there are other areas
where we can modify the vmas without holding the mmap lock, but others
on the CC list please chime in if I've forgotten something.

So, if I am correct, then you shouldn't lock next/prev and allow the
vma locking fault method on these vmas.  This will work because
lock_vma_under_rcu() uses mas_walk() on the faulting address.  That is,
your lock_vma_under_rcu() will fail to find anything that needs to be
grown and go back to mmap lock protection.  As it is written today, the
vma locking fault handler will fail and we will wait for the mmap lock
to be released even when the vma isn't going to expand.


> -		else if (prev && (prev->vm_flags & VM_GROWSUP))
> +		} else if (prev && (prev->vm_flags & VM_GROWSUP)) {
> +			vma_start_write(prev);
>  			downgrade = false;
> -		else
> +		} else
>  			mmap_write_downgrade(mm);
>  	}
>  
> -- 
> 2.39.1
