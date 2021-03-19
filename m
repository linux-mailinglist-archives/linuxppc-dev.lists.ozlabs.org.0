Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9D93413E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 04:59:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1qs44QwMz3c2j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 14:59:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=hT1Vm2aE;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=yr3pYOeC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=hT1Vm2aE; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=yr3pYOeC; dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1qWf24PMz3bqZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 14:44:13 +1100 (AEDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12J3TUJ2075072;
 Fri, 19 Mar 2021 03:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=0rRn5e8lHNixXYc5TrSqGE43c9r8vTNGImdlPZ5d1Pw=;
 b=hT1Vm2aE3UCR5niHruuZqzaFFQoJmvlrzQGs6UUOZUM1jFmiMEauczt0bD8a7RDCf1CN
 jMX4ZoxTOkSjtfiNnA1ssDak6L8hmvl9jvFA/BP6l6GkFi+RTvQNLkeLDirTriAnKOiA
 ikPN6E3YJcRlB64sbdQcwvd3kRnT/wpLwAB7wYCV+TsI4X8iNa539zoOIml1m8Z31dw2
 TONpZ0ZP3+tcS5Ki8ToaesTk9RBkeHMLdYHNjpwu22pVnz6j7rjH8ZyLPqOUp9r+mXp9
 zF8K+Ja6K6GGoBeMUe/LYKzYV8Lzdk2Sxqnd68PupkmB/NWYbY0lTRLce6t4ifakAcHS fg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 378nbmhh6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 03:41:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12J3UAFI175341;
 Fri, 19 Mar 2021 03:41:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by aserp3020.oracle.com with ESMTP id 37cf2v0aem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Mar 2021 03:41:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXWJ7JcEzj22Qu2mkhYQfl+tyw5S0tIuaWZJPJunNS9Bo5yQeNCk4ef5Kz10Sziw44He4yduyJb3K/gk6A5us0g+g2HrD+LKzMSVsmoT/8VTS/g75ruGBP3ODk3wFb5X9dh+xy3QRGZc374M7+c74cEMHoXycIu5aWqVLNfE8pTcuFJcc6gPSHceez7BhutwCPmkCW8/3nhJ+WaRRM5871c7iUaGaC5rO3P4zhCUX7U6Ss8WphGzOTowkqzNMMW6dV4PuCK9iGsyRQjy+86+WR4/kGAUmNvb3Y1JcqfIbnBLp8+vs7yhDKCBt5GhJp4HCuN1oNUqPOkF4vAYC2cKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rRn5e8lHNixXYc5TrSqGE43c9r8vTNGImdlPZ5d1Pw=;
 b=at+KXBAVtuABvWr1zLy3meVFbTx9FyAVf1zNvPPyWJ3Skh8ox5moW3fLWNH88tTkgUK7MzdOLJvJCtE8H+Rj4wJyiCVqm/2Re5IyEPdRZfWfW89lOSwQkvsh0xGcwLx4PPcSsxV+chfyunIFx+aNJuU6QcnBm6gaCMVuB93ZT421w5D8XUXmaeb70frUPDh3A2OHRYKcNOIPepOcI1VIy53g7DezKxnE5FflV41HM8muP0wyhbgOrBPmjTbUqVad/miE/TJVpN8Dl1h5z/gNlikcQV3QVseB/T/pQ8K2UBvNUpz60sRp/g7hI5LT2wI0msIO+kGEoMzeGnBf4wMvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rRn5e8lHNixXYc5TrSqGE43c9r8vTNGImdlPZ5d1Pw=;
 b=yr3pYOeCgUzSBWckEDBJly7IwL2ba9dcWlL5GJ+TWerp+X1/06URCnWQRFZr9UACTOXRe8Z07Kzm79XoKum2KVeDyR0CwtCDm8Rwldd21v864s20eBxm8vkd8uesj7V7Q9XzjYACT0ErhOQCFsvIy5/AcW9j8mfzYg774NGmu+o=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4440.namprd10.prod.outlook.com (2603:10b6:510:35::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 03:41:24 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e%5]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 03:41:24 +0000
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/36] [Set 4] Rid W=1 warnings in SCSI
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1zgyzolqx.fsf@ca-mkp.ca.oracle.com>
References: <20210317091230.2912389-1-lee.jones@linaro.org>
Date: Thu, 18 Mar 2021 23:41:21 -0400
In-Reply-To: <20210317091230.2912389-1-lee.jones@linaro.org> (Lee Jones's
 message of "Wed, 17 Mar 2021 09:11:54 +0000")
Content-Type: text/plain
X-Originating-IP: [138.3.200.58]
X-ClientProxiedBy: SJ0PR05CA0126.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::11) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by
 SJ0PR05CA0126.namprd05.prod.outlook.com (2603:10b6:a03:33d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.14 via Frontend
 Transport; Fri, 19 Mar 2021 03:41:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 410861e8-ede3-4f8b-0f0b-08d8ea88de1f
X-MS-TrafficTypeDiagnostic: PH0PR10MB4440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4440925CFBB9DFD3BB1C3B538E689@PH0PR10MB4440.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qej/FHkqsmqHDBLJWiQjU0CbZYyUibbDKTJ09REJPR1Dq7lAp9xUEPd8w/ri8plHU47ioxjdMfDzHlocBYZYZGkY6eEqVJI62NSv1UTQUQ2yrORjusIwPtO6efTBi5AvOA3rvDLJu7qBgTPtNxhP3TPyLtG9DnNDfJ3DcNfh68X5LWgubAnJbWGlG7W20IHZJ8ncHf3UglzoI3vytVXTdgehaKPQp2oG4oDWHTaQtaOQtOCX0KayshPz1b0AQ9foIg62FR1vP5kJld1/xf95zY4UxmPg1B9NM4S5wxDetgPCkqgGIxgvTFa2sWewP78FQgffvGXJvf8XR1er/HO/uMiX0MJ8dPvOodaPntBULmhjl4KhZDLF5m33ylYNvf9RP44aHwPSPHbAX/2PzFoeJc43agBi2pPqj/w33VrniMYzX5MYW4qfzlbJoVJp7kZws9mcENy3R7ctQr0pl5mAZNzOoU0h/wwBeiONp45MRjBNuBslpsYGRpCpRAKQ2UpWZRVuPJI+DwPSzprT01vBsBVjj3rHiptzRvhnGaljYXLtZMNCloxDnlxhYNICCrIVshVKWe6TDL4qz/FdwlBLC10JhMT9EIDrDOiyRx/ytyeSXFI615ukIV9kiQe5tCXK+0LGqmTWBZQkETheaa9d3pPyzcIxpP11AXhBtGhXEgI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(346002)(376002)(396003)(39860400002)(86362001)(83380400001)(4326008)(66556008)(66476007)(558084003)(26005)(316002)(186003)(66946007)(54906003)(478600001)(16526019)(956004)(7406005)(7696005)(7416002)(7366002)(38100700001)(55016002)(2906002)(36916002)(52116002)(8676002)(5660300002)(6916009)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EmfP/xincbrprcUqo6KJiy6E+GYnbET/++4dWNtZW3ngcS4m5LEKqnkIFf2n?=
 =?us-ascii?Q?qmTYmgBp2q3YZbIzsNub4WzKzcGtqKWvbDAe3AeTlFLvSJTosmCod8cr5kX+?=
 =?us-ascii?Q?WmtQxiHZy2UtnzYJafZTDJKS1dQJ4L/Pxl75Nd/bFzUiCXRw2EBCy7vPCFxC?=
 =?us-ascii?Q?l6fC54M37Nh8N9010qZjnJd1JzVNnUEUeenQOimeHW/jw5zoAKX7Jc95oMzT?=
 =?us-ascii?Q?JpsRCphxjeVKCBrMc/bGMEkb3R1tPmespN6XGeJjQ0W1IS+Mb9VO4wdmm65v?=
 =?us-ascii?Q?BZwTg0Eaug1VbL8BbLPtp+l0Z+WFa1r3kDUtILn0t1Rwv36HUyZtjhHrg7vn?=
 =?us-ascii?Q?vfZUOMIDzR+N2hfOVszQ/XWsGfA3AdiGZDHJ0ZuT+ZXvrjukHNQNKMU58O2z?=
 =?us-ascii?Q?YrRjeDYhu0kHaIrWaOooBKq81EPNFnrJPF5NETjen9w0Q1KpU94s9e5ne7CT?=
 =?us-ascii?Q?Tkfh9k+aF/qZfiqS+MrqX9ojnMRB182k+6xQkmeXAqU9mpSp5lVSQmTfiznA?=
 =?us-ascii?Q?tsiUiwN0gj0gC9hr6R3/XBXk/Z7bTuAi8Ys9ByL4S32bGVENhs3+t8aaOyfW?=
 =?us-ascii?Q?XYh4vXMyTZeL8u6//nmKKyTYBJxddzbGLqRLBytuVTOfhjDPrdcrCVc3Fgqq?=
 =?us-ascii?Q?Y7V6Pv5ZH6ZjuQq9+vsQo7Ry8pa1EcrY/p92nTdvXyVOEEKzrXO8gqY7NT3I?=
 =?us-ascii?Q?paar4YWXplyHUX7fUkUKTWlvnoNf3mB7W/CfhW66LGXN4LhhPbxB519jFHni?=
 =?us-ascii?Q?7t74UblcQXHmrVtEi5iEXV4d+6fKFEwNpjTfifyG+QLwb09yVySViqVcLDb3?=
 =?us-ascii?Q?HMjrck+WWECAtQjuQLTmwdZXiWg7Mk9AY4X98Ci4zP42JrQE5i4QTdb5nDz+?=
 =?us-ascii?Q?BMkUzP/O51F70nqeUuE3N2/k/aBrcz4Uryk3johx3w3hkmS9b2F3xH8neuXy?=
 =?us-ascii?Q?mu3XS276nBE5xjngoeBWMPqAYKgOb3vXuelCuAj0oQgADiNNSEdSDN0BPO2/?=
 =?us-ascii?Q?uXT6Xb0ofVwa4mqw6z1ly0vezE3KTxVjgoaV9vceRLW754XUuPEFS6DOMljy?=
 =?us-ascii?Q?eWXONZIGC+ntz3juHv7wnQaUbcobiNk9Jj9CNckiBrnZ92anIa7D87RWmIUs?=
 =?us-ascii?Q?5wS9dAcBFs8gKA/LKu6/dSBFxTX5TvleIJAMRgra4VLNViYSiyJ0DWE9Ib6a?=
 =?us-ascii?Q?iD+5V5COad4vKpJh6Nq2eTVcjSc0bLFVGqGP3LOTdmusYIUCeK+CRctQao2P?=
 =?us-ascii?Q?r2QANFGUYutyDntLb9wXaU0cBOS4zmJNxu0VJzkI+E8yeeIs6PYklEwHbkdF?=
 =?us-ascii?Q?9FxjFZ2l0L1hzZrZjTmkGjg5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410861e8-ede3-4f8b-0f0b-08d8ea88de1f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 03:41:23.7836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMgYy3qxy7kn95NmNnfwNVOu1MXg8JVMkQ46ZUP+kp68QV4PYyEiuoWsjYVHPnYOfzyCDGNIw+HF7JgVtKdxdqVanZtuiyr+8aWybgbzsSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4440
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103190023
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9927
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103190023
X-Mailman-Approved-At: Fri, 19 Mar 2021 14:58:50 +1100
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
Cc: Uma Krishnan <ukrishn@linux.ibm.com>,
 Brian Macy <bmacy@sunshinecomputing.com>, Hannes Reinecke <hare@kernel.org>,
 Anil Ravindranath <anil_ravindranath@pmc-sierra.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>, willy@debian.org,
 Le Moal <damien.lemoal@hgst.com>, Dave Boutcher <sleddog@us.ibm.com>,
 Marvell <jyli@marvell.com>, Jirka Hanika <geo@ff.cuni.cz>,
 Linda Xie <lxie@us.ibm.com>, "C.L.
 Huang" <ching@tekram.com.tw>, target-devel@vger.kernel.org,
 Drew Eckhardt <drew@colorado.edu>, Brian King <brking@linux.vnet.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Alan Cox <alan@lxorguk.ukuu.org.uk>,
 linux-drivers@broadcom.com, "Nicholas A. Bellinger" <nab@kernel.org>,
 Linux GmbH <hare@suse.com>, linux-scsi@vger.kernel.org,
 Shaun Tancheff <shaun.tancheff@seagate.com>,
 Subbu Seetharaman <subbu.seetharaman@broadcom.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Doug Ledford <dledford@redhat.com>, "Leonard N.
 Zubkoff" <lnz@dandelion.com>, Ketan Mukadam <ketan.mukadam@broadcom.com>,
 Dave Boutcher <boutcher@us.ibm.com>, Colin DeVilbiss <devilbis@us.ibm.com>,
 Karan Tilak Kumar <kartilak@cisco.com>, Badari Pulavarty <pbadari@us.ibm.com>,
 "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>,
 Douglas Gilbert <dgilbert@interlog.com>, Jamie Lenehan <lenehan@twibble.org>,
 MPT-FusionLinux.pdl@avagotech.com, Richard Gooch <rgooch@atnf.csiro.au>,
 MPT-FusionLinux.pdl@broadcom.com, Bas Vermeulen <bvermeul@blackstar.xs4all.nl>,
 Artur Paszkiewicz <artur.paszkiewicz@intel.com>,
 Michael Cyr <mikecyr@linux.ibm.com>, dc395x@twibble.org,
 Satish Kharat <satishkh@cisco.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Luben Tuikov <luben_tuikov@adaptec.com>, Ali Akcaagac <aliakc@web.de>,
 Kurt Garloff <garloff@suse.de>,
 Jitendra Bhivare <jitendra.bhivare@broadcom.com>,
 Brian King <brking@us.ibm.com>, Hannes Reinecke <hare@suse.de>,
 Erich Chen <erich@tekram.com.tw>, David Chaw <david_chaw@adaptec.com>,
 Santiago Leon <santil@us.ibm.com>, "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Eric Youngdale <eric@andante.org>, Oliver Neukum <oliver@neukum.org>,
 linux-kernel@vger.kernel.org, Sesidhar Baddela <sebaddel@cisco.com>,
 Alex Davis <letmein@erols.com>, Torben Mathiasen <tmm@image.dk>,
 Paul Mackerras <paulus@samba.org>, FUJITA Tomonori <tomof@acm.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Lee,

> This set is part of a larger effort attempting to clean-up W=1 kernel
> builds, which are currently overwhelmingly riddled with niggly little
> warnings.

Applied to 5.13/scsi-staging, thanks! I fixed a few little things.

-- 
Martin K. Petersen	Oracle Linux Engineering
