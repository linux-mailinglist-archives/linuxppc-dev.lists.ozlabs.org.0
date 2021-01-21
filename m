Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B822FDFFE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 04:38:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLp5T2XDjzDqnT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 14:38:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=NThxOd5O; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=AsVUhS9B; dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLp3g4bJzzDqnF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 14:37:02 +1100 (AEDT)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10L3Sl9H004415;
 Thu, 21 Jan 2021 03:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=xR7MvHNcXW5l6ceIa4Xs9AcVelEF5UJpjjNDQiEV96c=;
 b=NThxOd5OHF3R8CunWVgz4R/aJOVCN/qAnrHbjFV/bmpn1443qZyh1yuH4SWLZwusULk9
 n4FjA9FntkCAflO0PNm23dSVisI2Oh5l92Gn1nGo5o8MVVd9bv5a5vD4HWJReNqrhNx9
 zoawcFgJWRKUgXKmXiC8/z727SJVXcdT3Sef8Mtr+vMf75ZWvrTYlJbxokDVYsm/7HMC
 U2GyGzSuVAYPmhww0Ju3OPjhLxgkMEK9/BR7bn8ooF6qE2WOaXr/VYBiRCCa8Tfzszlu
 eIBwmSKVA2i4ACCbacooPl1vvzx2hCNaMkk2AXKSIvLZMg78hCp6mNrn8tSwVCnjPWrz mw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 3668qrdd49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 03:36:55 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10L3Uks1159249;
 Thu, 21 Jan 2021 03:34:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by userp3020.oracle.com with ESMTP id 3668qxcgbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 03:34:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJERTjlGW448E8rWzjAaHWPicFZxhS6Z4aCLZG4DWZW2zulk1wzivGtYtnFvaXdWHvmvnLnDiAw5UfrDEPJ3dmSKMblaOCgunVygadhLu2bVrkGMCrNwUNk4vcIMSLG9aR6yYt06OEvv2Kj01s3C7nRfgRxPeJ0cq5yJOVLrX9SSFNzUkNd0GD741uH0/aJ+E2t0hhv5j9FKcNzXO4qGU+6QHR7QQ/R1l5nw1RMwUNqQP6HW4m9/1Qr15NHvSU3B/g5dwbp+UAC+2MGEkM5478mzUAjyKiUlCiAbDZODPKZJpkarWHv7mMKffaRFzNXNP+bZl2LWWQGAD8qEcXgu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xR7MvHNcXW5l6ceIa4Xs9AcVelEF5UJpjjNDQiEV96c=;
 b=b2MLCcfBoALnncb83/MAg/jk8yBW7Mt3Uofg+POwyI/DwMlBv3roe6hmab0851XovIoUAkvoFvg4os53mtPt8dCfQOY60DfiIVRgYQYmlNsrZcgNrECXctOZ69kuWHh2xYrb3uCTvj2vwDg31dW4/FWZGETqOOdg8ot7nhcBVWquZm2/Fvb2RZbCG7AE9eyP+SKkv/g4fdfM+SpnRddj79Zldzfd9BZRxe8XzKHFffujLxetuVkVZwYG8blknxa3DcTaLYKh2hAGyYNLlE5Hi31Xb5bWy03tlTXGpobI3JgGNNOaShDDY7uG95xaUkATpBKFoGN3yD+YLhuBUUl6/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xR7MvHNcXW5l6ceIa4Xs9AcVelEF5UJpjjNDQiEV96c=;
 b=AsVUhS9BSQOXHMq9TXkp/j9fUPdMPRnoE7IPaN/sNwWlHkmBI8x4JhC+zQMX/AzJVyov74nYxJqxhMMdGUwrH4GYU7l+WxAL9f44+KYEl8o4JytyJxQP1VBdGcJz2rAMF7uF/99IJ0QgCJQ4IVtRIF8LhTPYqPWFS8wcUDDHrxw=
Authentication-Results: hansenpartnership.com; dkim=none (message not signed)
 header.d=none; hansenpartnership.com;
 dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 21 Jan
 2021 03:34:52 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::54f3:a8aa:a2cd:a3a4]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::54f3:a8aa:a2cd:a3a4%5]) with mapi id 15.20.3784.013; Thu, 21 Jan 2021
 03:34:52 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: james.bottomley@hansenpartnership.com,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH v5 00/21] ibmvfc: initial MQ development/enablement
Date: Wed, 20 Jan 2021 22:34:40 -0500
Message-Id: <161119996965.1307.5957801663937555787.b4-ty@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114203148.246656-1-tyreld@linux.ibm.com>
References: <20210114203148.246656-1-tyreld@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [138.3.200.9]
X-ClientProxiedBy: CH2PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:610:58::40) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.200.9) by
 CH2PR20CA0030.namprd20.prod.outlook.com (2603:10b6:610:58::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 03:34:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07e0e58a-8150-43d1-4c9a-08d8bdbd8304
X-MS-TrafficTypeDiagnostic: PH0PR10MB4679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB46797CB090405477627B45018EA19@PH0PR10MB4679.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ue+aeJmVBpxnBPaZ1JHaNVl0SHp5TPH/tMGqhEmXhuag0KT7yP4aieaRDofIxvN+0bWbYzJIn973wPrLUwPKKYSIxpxwCTSuN4Gn67pe4495uzOx8DhNCTQvAAfxNy/WCIbw38h6GFFhUjhGWBJNM/loyS+eDN5+lT58ytGSNei8XvucJ2F+bV3BNPC3jLRbnkFN/jrNWaYqf1bfJGPiFK6GfXyjqKqD8LQUuVMyIRMt2EXB5dF0x1EcTVBu6+QKHk7YmdbiExz/Y7PLGFzznQ0bDwQMCJZKbFRYm5Y4IyDQfjhSJC6h9IxbLRE68guIr7R35+tyTQ5Vg/cpKA6n/ljkbobDoSShZXm61fChnsf0Hp7Sv7v5GceCR//2hmVpBgcrwqLkzjJyufygiTjNUQU3esW55C+O61sCWSob2HMu5Ju32CBVgUpMw9/vpd4CwlfsXFJTtyY6PFJNyMno8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(396003)(136003)(39860400002)(86362001)(966005)(2616005)(186003)(83380400001)(16526019)(6916009)(956004)(36756003)(8936002)(2906002)(7696005)(52116002)(5660300002)(6486002)(6666004)(66476007)(66556008)(316002)(66946007)(103116003)(26005)(4326008)(508600001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UGR6cDdMbVBmZTNaNlhoS1ROUkNDQlRGMHA5V3VWbkZ2Rm9rRWxCVGhjMzRD?=
 =?utf-8?B?OExBWjVPRmxYbXM3MGx0TmdJbXNVYWF2N2pXcUl3dEN6dXFxd3pZYXA5bElk?=
 =?utf-8?B?NTl0VWdYMHJjQm5ZbXFTR2dIUEY1aUU3OWVhK3VWWUU2N0tHb1ZzZnhZSTAx?=
 =?utf-8?B?djMzSXBlOHpmN24wd0g5QlYvbXc5dlp5c3NPR2lNNmNEV2l6dUpqS3QwYVNT?=
 =?utf-8?B?OUdlNGtsQkFJU1RtN1hRclRaR2VwWWRkRCswdTcxcUNEOHFSTXRac2U2WU83?=
 =?utf-8?B?MlUrOWhoL1Z1OThkYThGU3pZc1k5R29ubDBFNzNYVm00cGJ1REV0UWVDaEJn?=
 =?utf-8?B?WCszbVJUV25mUk0zUW94eWVzVmh6aitTRktERGRLeTNjMzJobFYvWCtmTFd5?=
 =?utf-8?B?cDNKVWp1cmlKWWd4S2gwZERLc3VpSmI1SUZGTUlWQysyQzhPQytvRHpBdjlr?=
 =?utf-8?B?SnhRK2RhUzN2V1pzY1VHNTRMdDNoamsyc0JCekdDdlBVVWdPZEEyWU9kRUdw?=
 =?utf-8?B?WFlVeHBXRVJiQm1DQ0doZGtyNGpOVUFHT082dloxdDJoSVZtUFRRL1BWSnc5?=
 =?utf-8?B?UjJoL0EvTHdnM0puUjVXUHFST3UwY0U5blJmczlUcWFMdTNYMnBIV2x1TTND?=
 =?utf-8?B?L04vazJKZFR5bkdEUUhnN3VYZnlQVkdMVEhyMXVhanNEUk9Fd3ZVMGdMcWVk?=
 =?utf-8?B?Y0JORDFQb3Jpako5UmowTUg0ZXR3NndKa3ZsVDRyandyUXQ5bjV1cXdZK2o0?=
 =?utf-8?B?b2JlNy95U0J2dmh5NkZSVHJVcklxalBYeDB4eGhBZ1dKMlRsSS9HMlY4UjY1?=
 =?utf-8?B?NDlIQUpFMllzUUs2RzlEZHk1K0NPd29LYTNsTEFWUGRLZ003RjArVVAyK0c1?=
 =?utf-8?B?YmxMR3ZxeVlTUXNSU2svOHM0LzVkUExNMmlsYXJPWW1UMWNzNlRGNng4STFO?=
 =?utf-8?B?bWM0ZEpJMi8wVldkSko3QS9OWVNBN01NZG15UVpSUCtCZmhHRDFpWUV5OFN1?=
 =?utf-8?B?clRNbzhNSnhDM21WYVdOUEFDWWlpajJKV284Snd6L2dKa2N3NGhiV2g2ZkMx?=
 =?utf-8?B?WjVGNlQxU1BITTlCZzZsNkVmSEFaUE55bXZSdm00RlpkcUpXalpnamVENUxX?=
 =?utf-8?B?NW5tVlZKdG8rWkJzWlNydU0zSGQySTIwZFBNd2F6dmhBTE93R25EQVB0eFMz?=
 =?utf-8?B?eDY2Y1MrQzF3Nm8xUDRoLzFwZTZMa2R4QnJRRWV4eTg5NHg4V3JyUDQ3RlNL?=
 =?utf-8?B?V3h5MHVNN1o0R2k2SzdlbXlOak8wWEEzVEJwQm1wYllvalJKcUkvS1pnUS9Y?=
 =?utf-8?Q?D7Sv6uz9eccn4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e0e58a-8150-43d1-4c9a-08d8bdbd8304
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 03:34:51.9661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZu3e6La/gdnZXNnfxCC9cv/QQxHDQd/NVkEt7R8Z8EF+/XOacGtf7f4tQ0XfJjyvL8eje3gf7njm4YE0Jyf1DG8tEzAHJhczxRoi2AjwCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4679
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210015
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210015
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Jan 2021 14:31:27 -0600, Tyrel Datwyler wrote:

> Recent updates in pHyp Firmware and VIOS releases provide new infrastructure
> towards enabling Subordinate Command Response Queues (Sub-CRQs) such that each
> Sub-CRQ is a channel backed by an actual hardware queue in the FC stack on the
> partner VIOS. Sub-CRQs are registered with the firmware via hypercalls and then
> negotiated with the VIOS via new Management Datagrams (MADs) for channel setup.
> 
> This initial implementation adds the necessary Sub-CRQ framework and implements
> the new MADs for negotiating and assigning a set of Sub-CRQs to associated VIOS
> HW backed channels.
> 
> [...]

Applied to 5.12/scsi-queue, thanks!

[01/21] ibmvfc: add vhost fields and defaults for MQ enablement
        https://git.kernel.org/mkp/scsi/c/6ae208e5d2db
[02/21] ibmvfc: move event pool init/free routines
        https://git.kernel.org/mkp/scsi/c/225acf5f1aba
[03/21] ibmvfc: init/free event pool during queue allocation/free
        https://git.kernel.org/mkp/scsi/c/003d91a1393d
[04/21] ibmvfc: add size parameter to ibmvfc_init_event_pool
        https://git.kernel.org/mkp/scsi/c/bb35ecb2a949
[05/21] ibmvfc: define hcall wrapper for registering a Sub-CRQ
        https://git.kernel.org/mkp/scsi/c/9e6b6b81aafa
[06/21] ibmvfc: add Subordinate CRQ definitions
        https://git.kernel.org/mkp/scsi/c/6d07f129dce2
[07/21] ibmvfc: add alloc/dealloc routines for SCSI Sub-CRQ Channels
        https://git.kernel.org/mkp/scsi/c/3034ebe26389
[08/21] ibmvfc: add Sub-CRQ IRQ enable/disable routine
        https://git.kernel.org/mkp/scsi/c/d20046e64c09
[09/21] ibmvfc: add handlers to drain and complete Sub-CRQ responses
        https://git.kernel.org/mkp/scsi/c/1d956ad853fc
[10/21] ibmvfc: define Sub-CRQ interrupt handler routine
        https://git.kernel.org/mkp/scsi/c/80a9e8eaed63
[11/21] ibmvfc: map/request irq and register Sub-CRQ interrupt handler
        https://git.kernel.org/mkp/scsi/c/39e461fddff0
[12/21] ibmvfc: implement channel enquiry and setup commands
        https://git.kernel.org/mkp/scsi/c/e95eef3fc0bc
[13/21] ibmvfc: advertise client support for using hardware channels
        https://git.kernel.org/mkp/scsi/c/c53408baa502
[14/21] ibmvfc: set and track hw queue in ibmvfc_event struct
        https://git.kernel.org/mkp/scsi/c/cb72477be729
[15/21] ibmvfc: send commands down HW Sub-CRQ when channelized
        https://git.kernel.org/mkp/scsi/c/31750fbd7b6d
[16/21] ibmvfc: register Sub-CRQ handles with VIOS during channel setup
        https://git.kernel.org/mkp/scsi/c/b88a5d9b7f56
[17/21] ibmvfc: add cancel mad initialization helper
        https://git.kernel.org/mkp/scsi/c/a61236da7f9c
[18/21] ibmvfc: send Cancel MAD down each hw scsi channel
        https://git.kernel.org/mkp/scsi/c/a835f386f970
[19/21] ibmvfc: purge scsi channels after transport loss/reset
        https://git.kernel.org/mkp/scsi/c/7eb3ccd884ae
[20/21] ibmvfc: enable MQ and set reasonable defaults
        https://git.kernel.org/mkp/scsi/c/9000cb998bcf
[21/21] ibmvfc: provide modules parameters for MQ settings
        https://git.kernel.org/mkp/scsi/c/032d1900869f

-- 
Martin K. Petersen	Oracle Linux Engineering
