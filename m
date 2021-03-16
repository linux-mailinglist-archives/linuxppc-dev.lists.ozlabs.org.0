Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C45633CBBB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 04:14:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzz1B3rdZz303S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 14:14:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=eNJg49vG;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=IGjep7mf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=eNJg49vG; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=IGjep7mf; dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzz0d4kwbz2ydJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 14:14:24 +1100 (AEDT)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12G3AuMS169200;
 Tue, 16 Mar 2021 03:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=qPbwybmF74AWyKtZafk0bMp/+UMNEj9ekFBGtD+NqAE=;
 b=eNJg49vGHjW6yFgIZpaOxW+na0/gn2xezlfDSs6bHPWvp8klyRNbmd2WVa//jwbXcmn/
 3QDenhMzSrf+Qt926WIB+PmB9ZePVzNrVCi8KYF/cUJaQULHHEcKnSZglvRPZkH8RJcT
 fQJGJBmhVGoBOJbj90JlsY1dedl46AV0JyXFmQKHg2Ntd8kbqS3TrDoYmJ5rqIAg3n/l
 sJ2nlju7gNCPAcQkGembwWn8+3lN8zlSZIrbGbD5mkUyHuhSZsOSLKiULzYaylzNr8em
 KRK6XIvSaUIZ0nxkm12d7IYkDZ7kD7IwqkBH7KyQSte9ODSwX71YK2IruFYq0A3wHTbY mA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 378jwbe7s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 03:14:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12G3BCWG139271;
 Tue, 16 Mar 2021 03:14:09 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by userp3020.oracle.com with ESMTP id 37a4esbpjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 03:14:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZpAEANi9e0B0qnX1FgXw2+gupb48X8Hyw5R80MPQw4VLJwW7HfiIsCzKhYW67LKWUW4DSQhubcbByFqnP0LSeLKuiDIWZ3ezOyWhPdoCgDyp9P2xUUGiTIVBM+a91Skm7a9W/sHel/e26GQMxZzSZNgQdVdUQ3H11kfX8jjZfLm6RgvvNKjdoRH1fNAEMa4Rq+pfiBY/FG2vZP2/mCBuE4mlbsr1In+6no7Qk3o14hMShFo6i7s3eNIXm/+BmWIYXM8SLRfUcyfGBA9T2/xq8Y68+re9xZ2usu33DKeQUxL5YsqnlwZa3z3MTvFjK+k8J8aKLxsHCjGppbkPsqhrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPbwybmF74AWyKtZafk0bMp/+UMNEj9ekFBGtD+NqAE=;
 b=NW/QqBA7TbRBp4apV1jHp9P0Xq7gKtMfz+nnzwo+abg/cgDvqBlCNqs50IJDLOZnRHlr73To+arGOkVtpMz54MML4TwP3aFAQIcqA8uTQYvp+7ec7Jxjz9TeV5J3ErSP4YFAzsOxj304gHkCod3S/WscZdIyAGt3+dPbgWxz50AEr4EP5EETy0mOIJkOHv2YF7wwQrmgSCv2gR7ewQRQ8FVk5MxZrc8ot/i5UDEH7/uE+TDE8Qa9RI5G3aW/iEZRRE+UHeOHf2EEIB3ldyTHLE+dl0v2BYKjFYK+pavlrhhGErFWHKzqlBFmUqPRFO8HCJD5JYyfGxXzLQaYETnyQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPbwybmF74AWyKtZafk0bMp/+UMNEj9ekFBGtD+NqAE=;
 b=IGjep7mfncc4o0JxMO9CRUKqTuxGHM+Cw6m4P1TXdY6Oi19BRmFOwNEiVHpGh16BzktmnLagRhwLWHheiT3GEAxcHuPSqYoWEN0KOaZlOO/6mHIZjtWKXcrK+I/Ic7KipMv02oXc63MaASRwn/OLlpsRmcbLkUWL1sV77ltg5vQ=
Authentication-Results: hansenpartnership.com; dkim=none (message not signed)
 header.d=none; hansenpartnership.com;
 dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4709.namprd10.prod.outlook.com (2603:10b6:510:3d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 03:14:07 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e%5]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 03:14:07 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: james.bottomley@hansenpartnership.com,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH] ibmvfc: free channel_setup_buf during device tear down
Date: Mon, 15 Mar 2021 23:13:58 -0400
Message-Id: <161586434244.11995.1429133965746647049.b4-ty@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210311012212.428068-1-tyreld@linux.ibm.com>
References: <20210311012212.428068-1-tyreld@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [138.3.200.9]
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.200.9) by
 SJ0PR03CA0119.namprd03.prod.outlook.com (2603:10b6:a03:333::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Tue, 16 Mar 2021 03:14:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68ccfaa1-2cb7-447b-b31c-08d8e8298f40
X-MS-TrafficTypeDiagnostic: PH0PR10MB4709:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4709A671D3E7B588C6B38FE58E6B9@PH0PR10MB4709.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +bKG74fZX+tR3gY9QbAl/W5iTxQVGazYAFlH/6FurSR3PPStcp9c6uoDFhxUSQNkHe+taonHV/i8iphFwKoA8sLOld4ivLBjsMZqqlpVLZ6xpM6GKD+G6kLpZxAyCtU2fBS/tfnesz31PqK+4kClo/dT1aTBEp8Vw10xFCoUHsxDSP26af6Ds0TwzQVCi4KW0bOJp6+ji+emHZcYyxAXgi42Jk1hc4SSnOsb4T4dQ0Yinp9DByNj8AkYAlquOz2sa6xxV4YEVgg7Xx422aiMSullGn9L8KaCm/pbTXY60XCRo4yPn/p1l59db1NdOv59nTSZFEcATDyFFdZxtIFIZyxPf2OZA5h5g6FWCIHizbGKgxJ9nhbGrlprZ6ap0vG0a0xvQlXDWSAf6ORKuXMSlnIMCpDKWNd9VQEto1GN0SyP4urJLCpBblPDa6YWeIU5ysspD+fE4Es4N+WNGLXAwFNgkb6loDPxynllRYGOaYJZlPoVV58PxYKCImLj5tRMxO5KR4q4zPqNBcv6lcdUPW6FYAsffXeajZxubh8Z73w1/8QqEfzmSZHRSe7398ShygW1ErBwLhH1FGIlp/elUN1+bQxs1Ls43in5orptVyNEoPOAJViKEACmpzp3KJpunV59c7REXekBu0f99IaM7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(39860400002)(366004)(136003)(396003)(2616005)(26005)(478600001)(956004)(4326008)(6486002)(186003)(66946007)(103116003)(4744005)(316002)(5660300002)(966005)(6916009)(8936002)(86362001)(8676002)(16526019)(6666004)(2906002)(36756003)(7696005)(52116002)(66556008)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bnRTQk1heFd6SVpxeStDc2NJcVhndlNFaGxzekN0a2ZwbDMvNk1UMVBxMFN0?=
 =?utf-8?B?a3ZqL040VitSTWR1bWh2T0lDa1B1UlhLVVdYZ2MwTHhQa0RzTE5BUS9TOFRm?=
 =?utf-8?B?SXdjZHNKNjF4SFJvTjIwajVHVDgzblUvWTlOVEhsc2xOUmFsQlBad1JiWXM3?=
 =?utf-8?B?dGVkOTZjcFdrc2RucTZzdG5jdjZGSkR3d2EzSmRCa3BTYnZEQmcyaWxOd3Zk?=
 =?utf-8?B?YkNCQ2NpZTR1RmVENWEybkpwYnFEL2RGSVc0cW8zOUpLMmtMYnN2WVE3dWJR?=
 =?utf-8?B?cXRkNEhGaHRRbjJSOXlFbk1QMHBJYTZkR05EazBRbmpabkxTOW9aM0Rqc0k3?=
 =?utf-8?B?dkUyOVBtV2dXN2UrcnpkeDJaTUdCc0Z4c0NoK09BcEFwSnZGWWVVZm5UQUkr?=
 =?utf-8?B?L0RhZzZaNU95OVNJVlRoT2tPbVNQRDcyTDBMVDhNSmpORkptMGthZSt5WGl1?=
 =?utf-8?B?Uk1oV1FIVVVyLzdQUEtja1hTbENGK0RwSjc3L3Yxc2tTS3VDZlQvbnM4Q0c3?=
 =?utf-8?B?d1BwSklYbU02dnVXRWpVaDBUYmpETzNIbnhZRUpZSDB2YW0yYjBNazAzeWRC?=
 =?utf-8?B?aEE5eTB3S25rYitudWZLSGFCbytjdENNNy93QjByUDhibnpCRXJDL0ZxODZJ?=
 =?utf-8?B?YzNwdlV0R2FrWm1VRXk3ZDkzRDBsUlEzOFR6U0w1UVN3TC84S25JSm56VFdQ?=
 =?utf-8?B?UDhGZi84MGV4UnJ1UmZkY3FnZ0pMdDRCSzMzeDR2RG5kTHRlWFAzZUxFdWJl?=
 =?utf-8?B?YmZ2Z01jb1N4eGh5KzliV3VqM3Fqa25Mb09DZUh4NHNsWE5pa3V3VGNrdVp3?=
 =?utf-8?B?VTVkaXVyenlFNXFSK0RBRjZtS201TE84VFhFNERaVFoxd1ozWW9JZFdQNURH?=
 =?utf-8?B?UW1BYUVHblRvMHlxTmdJVXlPbWROMGJsZEdTdzI1QUZXVXFzUXlJUHlLVHNG?=
 =?utf-8?B?dm5ETUtSK2hWbSt4ZkVRNGYwYnZ4amd3RkNCSXcyL255dlZ6OFo3NHVlaGU3?=
 =?utf-8?B?b010RXladjZ6dnBLNEhoSURJdkI4VVBLdHlXcEl5Nm5abmJmRGtCUW4xbkk0?=
 =?utf-8?B?Sy9XdFlFVXQyTkhFeGhnUmN5MjlST3pjNCtzdVByQjRzdnU0TGRpMkd3bmRt?=
 =?utf-8?B?ak9WdWsyRThpRlNpVWNLSENUMmJuNFcwZWFVcTFCcHJGZTM1WExVUGtYYVJj?=
 =?utf-8?B?WTJFd3JTa0MrQ0ZVbEhpS0ZYcDVmWmw4RmhoMDFneXpLS3IzdWRwVDA3ZmJM?=
 =?utf-8?B?STB2MGNXNGFOM294cVplb29TMkIyTGRDT3pqcEQwOEUyRkQ0MXNsdi9VRWJq?=
 =?utf-8?B?R0JCMjhVK2kxWGhYS0tTSDVzSmpJajBSci9qYUxwWXhzRE03eTB0NDV6bVVL?=
 =?utf-8?B?VUhhdnkyVGFPTVlDZFY3RmEwc1VjaTdhL1BKMTJMelJBdlVsSkZtUmhYS3VF?=
 =?utf-8?B?N21jcWxBejRBc2QzK2tBYUp6M2txR1A1aDJsczhVTnpGbHBLRy85UTFDUlVq?=
 =?utf-8?B?MUpSOWQ2SlF3bk05bmYrWnNUanU2L3U0aGtVVUpJcW5CclJBTVZEdGVVWTVk?=
 =?utf-8?B?NXZYdGF4dFM3b1BnY1ZmWWVEMmNDemJIK2ZVSWF4aGlyRTEwQmhKS3hoS0h4?=
 =?utf-8?B?K2VRb1dMbnQ0K0JWVm55UUltZG1UV3ZsbC9Td3JlNk9uTFNycXNNZVZmNnN1?=
 =?utf-8?B?c25XU0hVZ0dDSW9Rb0Yzc1JXczRmcjdoeHBvMTRPQ2MzOWFldkROSW92eW0r?=
 =?utf-8?Q?p/xuRDZobtQOtqCcaLIrfCa/IrT7oGpmbaoNvoH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ccfaa1-2cb7-447b-b31c-08d8e8298f40
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 03:14:06.9352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9V/lOuOLrWeqQKlRvtor7aCZHToOtmpcRxp1A8fM0pTUHvE1UDwPSlu3WR3V85IdqblCRQhLKdBFbf/v+U8ehMuGQijsE8l3HB8u+twqzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4709
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9924
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103160021
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9924
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 impostorscore=0
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 Mar 2021 19:22:12 -0600, Tyrel Datwyler wrote:

> The buffer for negotiating channel setup is DMA allocated at device
> probe time. However, the remove path fails to free this allocation which
> will prevent the hypervisor from releasing the virtual device in the
> case of a hotplug remove.
> 
> Fix this issue by freeing the buffer allocation in ibmvfc_free_mem().

Applied to 5.12/scsi-fixes, thanks!

[1/1] ibmvfc: free channel_setup_buf during device tear down
      https://git.kernel.org/mkp/scsi/c/febb0cc847e7

-- 
Martin K. Petersen	Oracle Linux Engineering
