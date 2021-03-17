Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366A33E6AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 03:17:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0YhV2PrSz30L9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 13:17:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=EpvOgOYO;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=hRz2Xbka;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=konrad.wilk@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=EpvOgOYO; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=hRz2Xbka; dkim-atps=neutral
X-Greylist: delayed 6359 seconds by postgrey-1.36 at boromir;
 Wed, 17 Mar 2021 13:17:02 AEDT
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0Ygy4TF4z2yRH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 13:17:01 +1100 (AEDT)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12H0TvvK055859;
 Wed, 17 Mar 2021 00:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=MqhKdxUI8LwYf06J6INY/KXNITf0zAV9/TtiHVgje8I=;
 b=EpvOgOYOq9MDCVf+4duRwpNXV5kdn92V4+d5wAll9Bi0p50dpeKumykYvYXssXF6qZrW
 g6PQAECkGZ8cywTD/aUTYpLMYvITJjdCDfEjjqWPlutXt94yTX/vSCfkKLsrXbxPiLIJ
 0Prd3cKPKe1vamvGlDxfIxFWWxtXEd/1jtnBtoZRqoc1lhnVizip8VvUEiGpK1yc3RB7
 yCo7k6ijGgf9K5pKffAA0QRI7ewbw9zkS5MiIP8uj2+ltmV8dqwOJzTx+SJz+r1rv+1A
 V2JLoeEoZm8x8Jcayu3gLONFqSo6M2JJufce2AG1LjPnxLFeIsP1BbM24SHDy5kXAeob oA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 378jwbjfus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 00:30:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12H0Tl9J141958;
 Wed, 17 Mar 2021 00:30:52 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by aserp3020.oracle.com with ESMTP id 3797a1wnmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Mar 2021 00:30:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWdgJ6YZgOYDCU16tiroiMBD+6aPoZz+0IeAQf+ob4Efi6/ro6aBcPlJuPzL5loBJLeVgTd4hSpZ/2C2thkseDNYbc1BPFx/5y3yG7b9FMaGqx+Rvg2iGi8oC2tOEB5CfJ1L1wKTHggO8+eft/SyxtodljI8SplPwugUyw5n7unpdTgZFCwDjHdkX/csOkdunVtGc2IjWDeLUWjmPecZrJucqfnKQaei6cA5/jBzj2mOJLiBlRSB11qKWTkw1HTV5ZOWbMrDl09np4UE5Qyj3ppyDQHVfyIxl/ixNukwyuFd50TJ+6oOofQngi6iChHSSiQb0SIY69+UMwGa7zeDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqhKdxUI8LwYf06J6INY/KXNITf0zAV9/TtiHVgje8I=;
 b=XixOG/Fxi+d6hoPrC3H2ST6CXpYNLSr49AbTOh6yoL2CB8dsBD4hS/inn8/LAu5eJtb2r5tXCAKr3fyut1oXgDWxBvtz3s0tugmcGFReCh5Rp3NbqNIh+GkG0sZlJmbV6gFcvHMRQ/txLULxig94dMI4+Cea6vKlJqoRcysZzsNS0LVDBNkIrK2c/D8ld2WfFIBSn19RTeoVzmUut38/ci8hzu1jtDXwfJT6pTU/PJffwhSfbnEutyjZU1mEjnpQG/OiTgsz7zcsbws8mPpN69m5Hal/a3PCT2Dmd3ywzGOfoNv68obMi7JOfj5Dq+FzNswtGvzdARqRGhg81kBJhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqhKdxUI8LwYf06J6INY/KXNITf0zAV9/TtiHVgje8I=;
 b=hRz2XbkaNc4S5gMGVSoehCpK4sBLeXkKmlEm8AT6gozqwOZNPPxQEKvcqHmCCl90eZxAA6v8kUYioixGOeCKseGop9uSNVntfew4X9er41TldPoXOz9e5Nlz2eQB7Ph4C16ysYeOqsu4RfLHSisDo11AKg7wE7RVpm7FQSAdEAM=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by SJ0PR10MB4445.namprd10.prod.outlook.com (2603:10b6:a03:2ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 00:30:50 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::50f2:e203:1cc5:d4f7]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::50f2:e203:1cc5:d4f7%6]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 00:30:50 +0000
Date: Wed, 17 Mar 2021 00:30:47 +0000
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/14] swiotlb: move orig addr and size validation into
 swiotlb_bounce
Message-ID: <20210317003037.GB80752@konrad-char-us-oracle-com.allregionaliads.osdevelopmeniad.oraclevcn.com>
References: <20210301074436.919889-1-hch@lst.de>
 <20210301074436.919889-4-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301074436.919889-4-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Originating-IP: [209.17.40.37]
X-ClientProxiedBy: BL0PR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:207:3c::48) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from
 konrad-char-us-oracle-com.allregionaliads.osdevelopmeniad.oraclevcn.com
 (209.17.40.37) by BL0PR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:207:3c::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 00:30:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 968f3c57-0a09-4974-a33c-08d8e8dbea78
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4445:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4445A058551AE675C4DF1D93896A9@SJ0PR10MB4445.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vKQuzYNrl6utvhHUKHrC6FC8ZfOirMpmDQ9KoeH+NFxcVThGkvBqdOvAc3RGjqUfm6ubhWasXw+7G/TQKnqE6dZz1yd++ryEeF6G9wtacYWRf5gRGu6G4NDYREGutAiVgo0s+eal/PnSLeoNozpta15kkb1C2ibu+8S4vxMYoOc8dtu4Gvhnao3vYWkJgj22vbmTxNNdCF6d5QIuR2ArdOSE3dOUPmvd5kxZf+BpDMwjMfAvlEcLO1zJzpPTqeRg9ZuUK4MxCeo5huufzX8aMp8s3K11KQtaSo2IbTOfbJt6uwJK/giIaXjOuWBEgiz0RoIYB0U0Vx4eWxcTja3Awy8Jx9U6OBJQb6ns7eik5JVwQAwFgxY1X75O2yRVpn2rmAGGkMkI/NtEOS0b4o1wV1lxpP2CItVrcxJjIzA5Fkyuqc9gSY7c1OJDLOBvY7yx+MKfdLEtABWBO7TTuZUZ90xez2kOUZOK74fsgs3lAm2EL3+YHF6m26uGjKLGBAcwDbbLUZJT/EqmPGh2J2ooB8JaLm9rs7WIbPO4t4NksE5Yft24Uw+otcwSpiYBwTze
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(136003)(376002)(346002)(1076003)(9686003)(2906002)(316002)(26005)(54906003)(16526019)(186003)(8676002)(86362001)(55016002)(5660300002)(6506007)(107886003)(6916009)(33656002)(8936002)(52116002)(478600001)(4744005)(956004)(66476007)(83380400001)(66556008)(66946007)(7696005)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4IiTvCGZ+9dN/yDNl9WPIUdKPgvJuGaeQe/6PexKQpozRbyuTzDFg6S4vOwk?=
 =?us-ascii?Q?mLGBwX8gpoIKda9Axb2RpnO3eEmq5JAjHduCwW1RkspO3pwHUUy/01Oybjza?=
 =?us-ascii?Q?Q+PDF25eXQCmzV7UxZOx9Wl1Gd8/A0vIVRKeHmZd4864WN4ol3K5k9gPt3ZD?=
 =?us-ascii?Q?dpreqmAikiDMGJwYVIHRfMPZpnz4372+93ApksBWzmaEGqodBiTRRiFZMlKt?=
 =?us-ascii?Q?jjMiFhSi1FbAcyTKLfsDB0NrotJxn6gYT0KIQBuDci+LfxfEtJkd0OC/sbGn?=
 =?us-ascii?Q?yEkJWQ2lFg4SWbJsATIGlZ8bjuJz4cz8WH9h8FaHgRVLEHz/darcezw4a19S?=
 =?us-ascii?Q?zOfZS6HBGXv0vnlPpv8Lrpx1Cwc75qVZPm5cMemI395uUVBijZrFWq6qYWpv?=
 =?us-ascii?Q?fPcNZ3Jtg1r6kRgGxrljVzxxeRShBmNlM3LMrkw0opnGcTyQ4PRRqMeBoDbj?=
 =?us-ascii?Q?AGY0Vjqk346nsoiEO9A0bjcTfr/DEKEUN88BDMUBfOIOS2VkLQXku5WPZAf2?=
 =?us-ascii?Q?PvTfgZNSyoOEoNcrgjceTiig6awswrJM9iLRrhcYQUPcoQVcIJ1bLbGD1Pts?=
 =?us-ascii?Q?5LdXHX07lWb2TFyvwGe41TtvLdNuIPmBDfLv46+ewfHxkhub59vJub7BY0OR?=
 =?us-ascii?Q?Zh+/ca1bxNZVlLIIsmL2qDxg+hT7ufzmrXJSNI+qNbTENxNt7GgUv3DPTcb2?=
 =?us-ascii?Q?CQrKYbP70H7xY63/XHXdVYs2HVt3V1haZTPez0iKlCAGQ5Ln+h5PtBsL31ic?=
 =?us-ascii?Q?NkzTwcVoKyPrbf2jFSbQZ8mveeM2vYNvzSTfDx9gOc6hl0f5Z0i1Zi8V652M?=
 =?us-ascii?Q?XQl9p2Occ+ikCbkzIULwxpHbijiFdDU1jdSKHsu+DEVKD+gtro1XpvSxksyk?=
 =?us-ascii?Q?4TX7kQ7dWUwHgsJ2u7dKbjDGkVLZwqpQf/lMKC/z/Mt+JXAFnh5uY/yzHaV5?=
 =?us-ascii?Q?FSN7q2FhhrvITSJkSa1E1/9PWnyheaNtQi/fqm7LcbflhAwwI200U2e6oXT4?=
 =?us-ascii?Q?k+Hsc50HrF3FCkH5PZQEecMPUYtahiznLYc9dCNfXmZiWbtEG/F38cBgCwaA?=
 =?us-ascii?Q?k8VFp/FXkng2DA4EdfqPnjCMIqnkZkuKTaitTR8LUBIu4oU21svjKD7nMo9Z?=
 =?us-ascii?Q?/H8htBkvneCdcMT1wuAzuZitdmPDKJ/TdtODbPWOSlsYzEH9jKylNypqommy?=
 =?us-ascii?Q?jU6l07Yax7WD9LTaxfUfdL4pu+MAovXI324Qm7WtGxNF90vPRerqx9zedLVw?=
 =?us-ascii?Q?tWoMi9XWJ3b8EYDU2iV5VsTy51KvaSNab+MxV9iujUoE+IONl4wtMJv+tG+v?=
 =?us-ascii?Q?7BYp9GBnYEK9Brp8Mft9GwMD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968f3c57-0a09-4974-a33c-08d8e8dbea78
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 00:30:50.5030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: go2eOFypX5B9nVPRMIQmYMGrOdhGuNBT2DeGDJYygZrdUN2XAp7Y02uj3YLn5X34YB/p+UL9m75QO6kGfuQk1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4445
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9925
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170001
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9925
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103170001
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 Dongli Zhang <dongli.zhang@oracle.com>, Claire Chang <tientzu@chromium.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 01, 2021 at 08:44:25AM +0100, Christoph Hellwig wrote:
> Move the code to find and validate the original buffer address and size
> from the callers into swiotlb_bounce.  This means a tiny bit of extra
> work in the swiotlb_map path, but avoids code duplication and a leads to
> a better code structure.


Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
