Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B499A489F40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 19:28:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXj564przz3bV9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 05:28:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=gtASKtuH;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=JTc5YFbW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=gtASKtuH; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=JTc5YFbW; dkim-atps=neutral
X-Greylist: delayed 10293 seconds by postgrey-1.36 at boromir;
 Tue, 11 Jan 2022 05:27:55 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXj4C44f8z2yQG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 05:27:49 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AE6eTj015372; 
 Mon, 10 Jan 2022 15:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=g6Er+gI9i/erk3lqnCuNb3gG2mXN1WNzB/Xgz2fumEk=;
 b=gtASKtuH+ZVZBEjz/kSNnfXv+hARVXLucL3c/IT5GVaI0NovHjGWmR6sFWB4cIxchDbV
 c7hkkb1IU87WuxT737TfxoHodtP/Uu/OCadA0zLGmltOYpujhIiP32J5WeStsAFl3sta
 SZGSLJfnyhawByJNtJ4WdIFcgRS+yfWIMla3NUGrfLlHF8rIZUGtQqtNCqPlvqpYEFub
 8hZF+6df7H/5ZYnMBLsdLiwh9LGzjUQfCdhU3eekl2yppGI3SCG3hfQKd1Cemij4pSi4
 l7JnN33h0s0JN+enUZSH019qjY4Ic5eRryUxwJg8BrVsbwKGY+qvfAMcNeG6SOTuIt3C DA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgjtg8r2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 15:35:33 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20AFVY6e162896;
 Mon, 10 Jan 2022 15:35:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by userp3020.oracle.com with ESMTP id 3df42k4pyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 15:35:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fya9TQpRWnW1G2nTVlSOIiZ71YJNwu17d9nWoERTKQI2QY/f8n8aM1BuKknHxrQJzvCBjad8PbUNzKiLGqxVjCZG/Y+io17J6p3lUcXjFQ8nVtKbk6hZHY4t5adPDG+dY6OnHpGmwigPnp8cdnA+0Nx+SHXcoymYGBYiQqC9qK2qoNH1ecw+ZwfdNBqc7MRjgiZN7oim/QN02pbdQtTqZR+5tvvbOMZ9Z6FPLRQGsGIxm3eUUSiBOej1QMHYPneJwsqcA6HGL1YNQIVqC/J2njSzllmTgkhGrhMjugnRMu36zZNYIUqyVA/JblvkUBXtcR07tFWpWfyq3oFlApXN5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6Er+gI9i/erk3lqnCuNb3gG2mXN1WNzB/Xgz2fumEk=;
 b=fYeONjFnZW4uulIaG7deD4ElfWGkiozF1i/Plj7VL3kg1xUziaXP8aWVyV7m3LQpZRGnzMGNc8V9A/RoUVCXl/M1fUz3hqSk6SR3IisfZB7PHwkns5FKYYAS78iA5tu1252buLCgond6SKmPtdoUewE5ykNabReQNlhT8aS/NUCWStvp017C/y3B5689VCDVvomIYeE7BduBCVdqWgpOMwgRfaZ6lxOmuFVz/yHOvJ6SNvIoiHErRM5PFECOgaNLRzobsg44TVrvkK27uZOn3qgfX/hh6yBvjNNjx+/bdsK8s8dda4QQ6Zbs0ADe7cIoYheRf8J8YJinyB9XuptAxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6Er+gI9i/erk3lqnCuNb3gG2mXN1WNzB/Xgz2fumEk=;
 b=JTc5YFbWgZmEkdKtwkTVB5RFh6n2cFyTarFFjx7WTyHWGBw8XcmiuvSKfbulQtmR6M/C2OE/E/i8G7zSfTsqGrt6AQ7BKWJLvNxQcBBceJKT9keb4xTrAfLoTDAMIYQLWahO/YTdwON2caofuOvZgisrkd1Hnr46MbOfNIP9hmU=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5561.namprd10.prod.outlook.com (2603:10b6:510:f0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 15:35:29 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::1053:7ae3:932b:f166]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::1053:7ae3:932b:f166%7]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 15:35:29 +0000
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1ee5ftxic.fsf@ca-mkp.ca.oracle.com>
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
Date: Mon, 10 Jan 2022 10:35:26 -0500
In-Reply-To: <cover.1641500561.git.christophe.jaillet@wanadoo.fr> (Christophe
 JAILLET's message of "Thu, 6 Jan 2022 22:45:13 +0100")
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:208:236::29) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b718c93-bc6e-45bc-239e-08d9d44ed486
X-MS-TrafficTypeDiagnostic: PH0PR10MB5561:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB55613110E10AB4F20D97062F8E509@PH0PR10MB5561.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VhcD1Pl5+m/0sIZnkYYfHvpIVdZruh4aF28n1Si/+jqlxqdVptxD0dvO+gL6yWSr1ndv8Df4xG4Dx1eVUSTjd/CsbRTDmU4cJMmL/QNZ1I5JnlsdQ+Y5ZGcfIlBAw3xuwndjEP0cbOd2f13go+HZj4ptSi1e4PCF4O8Eb9D6UdVMurno6+TNM0xtxz2ZlS8VrcdEOkvoFAyujSnFEeMoMrnYP2ifjoled1RIiUwVOiFqXkD0bVd4aS2OZ3akyhBFKN9YfgY8x1EdvQ9mmoxYO2F6aIax1mRLWO+qWqI/KzO8LxmbuBRRDVprShMco1zslwLwETUN8tR1nO8I/z6jP/hYnOszG7nMBS1EAta1H2lXY/ZMlZSrCgtVZsIB02bD3p7oCmSpgceuguNOJHm0FOOzo6aMqF1IuaAUd8V6m40+BZb3RoOwspagOtkp7B2yEkvTsAmvBnPDzg3uuUtgXG+9uXE8XYUG4FguiUP2S4cM/2o04wTtGEXaGKoZG2gGDadAea8RjwSEW6XH0lREmDcqjTe+6o5jpdkAC2oC/S3Efw1jPn26EAB1NjKyXO+2zKIq0+fgmL6tGUzRty34Z6RVY/luZkGE6GXLZsa1/D3+uUu+P2CY5fydT4jqdbn0sopW9TmOAJQhWdvo0N7FuHM5VsItGf6iSE40Q4rzZcrNOVFRXqUcbX+5PPiX58XoO6zRhzf6HmWFG/+PiL3mow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(8936002)(66476007)(6666004)(6506007)(558084003)(6486002)(86362001)(38350700002)(508600001)(7406005)(316002)(7416002)(52116002)(36916002)(66556008)(66946007)(186003)(4326008)(6512007)(26005)(2906002)(5660300002)(38100700002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p6v03Xbu2mI5YjD1XS5925lImhtdq+l6J3QWJ9Lr9CfPAG3TGju6iQisptPh?=
 =?us-ascii?Q?GrN16naZTBl6PdURPY5fue7zsrTe6sdxIP3kxhtN63D+r/8QZgCA54INRMcF?=
 =?us-ascii?Q?o6hJH/B9kHQILZm3hST0564Hly/Qo6hbT3qsrnuzv5EJOq9WVJeo6tz5v3B4?=
 =?us-ascii?Q?1zRSGtrMVmD7+Kf83vV4/FqTmNhrw53zp4ZuVgTO/dKBBjVvIPSp5TOOK9VU?=
 =?us-ascii?Q?/PSb2dJzjA1N9uCBzZPHNKAh8fsGJu8Voj4CWZ1ybW7Sp9mNkmRUZgwjh2c7?=
 =?us-ascii?Q?zF9bI79IAWBwCEU6TYk4eTKlZEbDQbQfTQzjsNCC/BuxxUo0y93LLWwUUPnR?=
 =?us-ascii?Q?DLBsEA08Sc5HgrugwqryHFk5CYT5JCrSmVcWItll8OTh+lw1VHxK3JdQcBzb?=
 =?us-ascii?Q?jluH63JWrXKDNX8/vEBGd7o1Hjn2LisErTyX2OcLPIywWvl/87YChIOYhn2B?=
 =?us-ascii?Q?urlanpVEa9J3QtaunGAzrVyej/27srfjWElCshQFn6so82DzilmTyRM3vWlA?=
 =?us-ascii?Q?4oMNsg9ZROZSoAKXQKpBfzJC1MBG0JrSOaSPrkEjhdUcozJYrERP9K8qsH6o?=
 =?us-ascii?Q?tTmWucU1ZSiQcfH8DyKoiTScoTheN7aoJkeO0COfDeRHk2JDllARO6whD0/K?=
 =?us-ascii?Q?05jS37TpJRmeu+WFINIfqlOdJoN0RHZs1feHg40SVR1AcP9qeMMAxFK0eU7t?=
 =?us-ascii?Q?l0P6KKY3tQu4hy8dTRt3ueZ2qQmi0cLo7L4GSyOGPCDouwT67mDB6oE9I+jU?=
 =?us-ascii?Q?IQZGfUvLSYA+y8nbBz66ZMw6cs1L71dH3AX3tlEuFMg90FDE5nJGfLkQZC4q?=
 =?us-ascii?Q?xAHS/FsPXAJJ7+zU5INmjKZ5kpks6UkSI8Cpjx2ukXDBBF++2rBRTL4tmGWz?=
 =?us-ascii?Q?Yctn2TTT0VT+gtvKfFmEgQQ9QfTP9NPXT50j4ZbU2UCCf+YIwmW+Lss0dgR+?=
 =?us-ascii?Q?B8QwI2P1mTyMMhskJsZQUK1PNHbxFXbp/7zeD2nywXra5lSdgDn+yusWLiVv?=
 =?us-ascii?Q?P6IyWlHB7Q6V75ZdASdt1aa+BS+nIThdZu+zk0es9u8AWV446UHel0HdUwkR?=
 =?us-ascii?Q?46ZgJuJoi/+T9AxFYfC5+GkrMfiu6YApUwAR8K3aGH1lrjGrmMZD9iXqvaqN?=
 =?us-ascii?Q?PfK7ve4PPEc+5MMH65e6Uyhpogrv/RaGwFOP6wkQMqaTnC7VfDqjAaZrIXJH?=
 =?us-ascii?Q?WN3AEF6aKp77BhqkfbJ4Tx2MzUpQs3pScNKJMNoB47qQ6MQ0lPkYTbAhusSY?=
 =?us-ascii?Q?qecXUV50tbmrTo2WC/MNdnqnV9iu7zJuHOvwbq8ssPeHTzxhXSSzo4S6/ySm?=
 =?us-ascii?Q?PgIuXuIjXf1EnQri5Sg1b47SMV7LmVhpx9+NJBkzv2DyJ5KtXCwV4y7IdG5g?=
 =?us-ascii?Q?Rsf/PNeVYqKILsbuYPSG5Tx7qerDY+jYzLgyBHrvJssMll2nETDEl4PIPzxQ?=
 =?us-ascii?Q?I0XOW7JNsb+tbbFLTURAgwrtx99tkEbCVrUasNm8ew84Uyi4tVz/P5Q/b3CO?=
 =?us-ascii?Q?Lm8GjqO8J8eJzG9evqyQvF+oBTnWRcE8o0wgyRtwtBK9lAORRdjrIuHmI3QB?=
 =?us-ascii?Q?7AUsAAn9ZGNaR7JJ4WlMVmYcwY/UNBfvE4mNOrT0MCP494liWTi+unM5qM1m?=
 =?us-ascii?Q?wu2yR+3fkeKUFn9rsCxuuiD1DuikFsnWbRUZCT1uWvWdvc7yC98Rxgr2bBam?=
 =?us-ascii?Q?pqneYw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b718c93-bc6e-45bc-239e-08d9d44ed486
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 15:35:28.8983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uE/cQ4vyObC3vBuAEKE+iXQMRZqN0F6enY9bxd/m10YlkWXcFmoEKaN5FmWv1oVJLM7bON1/+ZoTguHEWTXWoIBvo4YirMOygaoiToay+wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5561
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100108
X-Proofpoint-GUID: Gg471IfcOv-uoBh7RYjn5ZS-0P248EWs
X-Proofpoint-ORIG-GUID: Gg471IfcOv-uoBh7RYjn5ZS-0P248EWs
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
Cc: airlied@linux.ie, trix@redhat.com, linux-fpga@vger.kernel.org,
 linux-pci@vger.kernel.org, paulus@samba.org, sparclinux@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org,
 sathya.prakash@broadcom.com, hch@infradead.org,
 MPT-FusionLinux.pdl@broadcom.com, hao.wu@intel.com, arnd@arndb.de,
 suganath-prabu.subramani@broadcom.com, sreekanth.reddy@broadcom.com,
 ink@jurassic.park.msu.ru, bhelgaas@google.com, mchehab@kernel.org,
 mattst88@gmail.com, rth@twiddle.net, awalls@md.metrocast.net,
 linux-kernel@vger.kernel.org, davem@davemloft.net, alex.bou9@gmail.com,
 vkoul@kernel.org, linux-alpha@vger.kernel.org, dmaengine@vger.kernel.org,
 mdf@kernel.org, akpm@linux-foundation.org, linux-media@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, yilun.xu@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Christophe,

> This serie axes all the remaining usages of the deprecated
> "pci-dma-compat.h" API.

Applied patches 10-15 to 5.17/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
