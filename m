Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFD334DF9E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 05:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8bGR0BGQz30Fy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 14:56:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=lBoC0cYO;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=IU21k6r5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=lBoC0cYO; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=IU21k6r5; dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8bFr0cwHz2xg1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 14:55:42 +1100 (AEDT)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12U3lxJw004459;
 Tue, 30 Mar 2021 03:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=yNbIs4rlQ8ayFwpkEolxhuqeN3gNVQQ6av2N+5Hewto=;
 b=lBoC0cYO5uT1gE6SzUmQ/qwXFIcteSLvkboI1js2eerCHtsPWjGVBNpiY/nVB6+u9wiP
 S7vLKqGBhU32vsPjGsQ/JNs2MhXbiH0Z7G/LRYUSMjP6414HKhg92fcgxoWwhm6ZbCTl
 yJmiweAZos48Vro09agQkxdKoTBrwd7pdiRIA6ReQ5a+Ev8dPCsduSK1FXL1hqslpJDv
 oanyoxtmzRd8HiZhIEMoTD6dP4+auUT9SPuJfTQlLDfNqTpR+Zh/5GV/Lp3y39rhAcV7
 SevpAEXdKFcAwdfoXcSHiuJK6xqEpfcQDrbzNRCwMl6W1RR9k6U06GLoiNjZhIxIut8i ww== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 37ht7bdq5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 03:55:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12U3jRdG187799;
 Tue, 30 Mar 2021 03:55:19 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by userp3030.oracle.com with ESMTP id 37jemwj7hh-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 03:55:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfawCaDh5/3SV5SmOe/MvPx2MkgLbOcUw3rd+r5uvFAlES2W2LIw+icii7KNwLc+kirtGO911YXHceiUT/WfZzAyhiirBRnFZHr2qQHgQZ+KqxRjUa7g+AvyMC8MyB9hG+kfzjtR741RyFYWlveU3rsgMNOdoB/1uUehMu2B5gb2zVd+8t7guDUkT7RajB2giOMUSvXQdupFkyyCbLynUPty99Tezm82ng0NvBwKU2WIPCKyNGvbDKmGzkfIh/Ve82bzA4abffDR7h3AhzTRhm9fDNG8bJgUCJZ4b/YF8PrV4bywcsBueMYm02EDor8jcqOxmfNUn5Z+Sa4a/jiH/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNbIs4rlQ8ayFwpkEolxhuqeN3gNVQQ6av2N+5Hewto=;
 b=JJaaraS5Bgawo6vXrLLeMkzjKqhDXZOMdZcCrWKOJuZBPtT4w9J6vtVnGr2H5/Cvq0LA9KiHw1Ok7DP2Cg9HKZEyvaCzpEWh5Gdr3n206DXQeHdEoR9wscqyVbf8QH7y6eIaHSw9lfV/2n4y/hbZ+dQ5ivnpU61pJNMImb9zAhzBK80EHzirF8TuUAScMww8JUsoYVtMv03YEnTJBf5fo950XK6M+3AsQPfgJz9ec/JaSlIJmyBGopbZkU+g0h3tHzR9glzHRdUUUHGxhBhWohtZrrB/sSL1ajMjd6ek8eQCWblKUsOc4qRa9m1GdLULHbZSSQyp+PPEDtHpebkjdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNbIs4rlQ8ayFwpkEolxhuqeN3gNVQQ6av2N+5Hewto=;
 b=IU21k6r5TfbP82KD+zFVi0npKEHUK0vtd7xsOPbVcbwGkOjGDFK2UeE6x2xzid5a7/XeHmPbZufXunUvYjsbjSGs32ajDoDzgDgclXNwVG3/i/94H5oiAKMmTrq7SRzbp4dLl1fpf+ixVCWrikoCeXk70MVmxSh/JQ1e7Z7EM2M=
Authentication-Results: ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4760.namprd10.prod.outlook.com (2603:10b6:510:3b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 03:55:18 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e%5]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 03:55:18 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Wang Qing <wangqing@vivo.com>, linux-kernel@vger.kernel.org,
 Tyrel Datwyler <tyreld@linux.ibm.com>, linux-scsi@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] scsi: ibmvscsi: delete the useless casting value returned
Date: Mon, 29 Mar 2021 23:54:48 -0400
Message-Id: <161707636880.29267.16463436541519396499.b4-ty@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1615515534-1250-1-git-send-email-wangqing@vivo.com>
References: <1615515534-1250-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [138.3.201.9]
X-ClientProxiedBy: SJ0PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::26) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.201.9) by
 SJ0PR03CA0231.namprd03.prod.outlook.com (2603:10b6:a03:39f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Tue, 30 Mar 2021 03:55:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd6ac646-34a1-453c-c004-08d8f32fa21d
X-MS-TrafficTypeDiagnostic: PH0PR10MB4760:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB47605F72DF0F5697DA69C0A38E7D9@PH0PR10MB4760.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gr2QBdomNMxx3DPl+IUIuztkVnZvXIu4dLyhf6egDIzgD0xl49BY5k1hBFg/bh2XjHy4NV8vDlDoXwtWg/wYpndXR2S67Xqh0o6Y2BfBfbeFvSE3yGqPM0F+2NZwy/AJ5xMpKojjKgHGoMktPTGFed+EOHiYN6+bm9SFZCBkhbFwRJu5oztYPd1/rAOoNrGyGg+D2n8MKHWx0o6+AKSe55N2PUkhNei8l9DrGCPMDGCSqdcjy9i1g+wmI7WhePyk7JwFlo2FEiebhTUQpb93gZUqrTy+ID1s+lK5YQBDPHG2TkjObZY4/vH/DzoVl3zyddSiqOCo7ijeEJBjASbeTEWgG4VFm8cUCh8wil6hqy7pv0xRDN50lERgMIKB/B8kcQRfoLKzjrPHB84IjgvpTJCLVwaR5FJxkkmN6E9CbgUqW3jOr6TmX0Ry7Dr38qLLgpbFSFujozBsS9qF4iOXGMyEgd8VGc/g41tB8IzXWLRnKE3MCfEOp4RL1owW5fB6FK8sHSJzQ2bpMJVS0po7ILpEVMvx4TF4iPiatShmhdtoWcQ0FRud7w5WPXsvXsjnMYBMmFbaNd+Q7JV+0j+q16Bk+ew2ORuSY1+Elex8+51/q37CLLwWYuvDvTg24B+Q6TpSOuQaucU7yQvWwD49avrWnyY3IIEA/fLKjwEyxcrlJFzYVc8RD3sS9OL8HGEt1Y0fY/hpHO5uekVT6XcyX1fuODuPVgzAYW8FNDHOqtU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(396003)(366004)(346002)(376002)(83380400001)(66476007)(52116002)(86362001)(4744005)(110136005)(66946007)(66556008)(6486002)(26005)(8676002)(478600001)(7696005)(186003)(36756003)(956004)(316002)(966005)(103116003)(16526019)(107886003)(2906002)(5660300002)(6666004)(2616005)(38100700001)(8936002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UUFGR1dPckVZR25OV04vK3k3R3ZUS2s0SHhGKzk2a3ZoVUx1bWRGb3ZnWXpn?=
 =?utf-8?B?Y1UrWkZHMnQ2NXZqMCtCcnhHbHJuM2YxWWFVaXJoUFNmRGVYOU5pUDdJUzFl?=
 =?utf-8?B?UHJHZnN0NW9yTk9kS1Y1YzNQNk8wS2dPOUVIenNPeTBpczliUlQ0ZUdsenA3?=
 =?utf-8?B?d2tKMFFXSnltRm5JK2pXNm1yMEk2VGYrT0w3cjF2YlRpKzlVaGlGU3JxVFh4?=
 =?utf-8?B?cXFWZWNFQ2V3OVFUN2k0NmFiMkxDMWtOa2lqbFVEMDVRdlV5eGVGWERqYlBx?=
 =?utf-8?B?VnZsMXNwS2tacCt3SU9YUVFpWDNxbkxqK2RiWHF2djBBdFlNSVRrZkZBV3N6?=
 =?utf-8?B?NStrVERadENoMXFGZmhKaGRUay8wSlBoVzl2MjZQYzJNNWRqeU5PM2J2UDBZ?=
 =?utf-8?B?Q3JjdWs4dy9CY3JwRXpTTkx6V1AydTZJRk1JcXRtaXZ1L3NnNjFxaHVJNFc1?=
 =?utf-8?B?OVFOS0pwaWszTHpLTC9qQm11cXY5TTFyenRXUnVGSUJrU2JHZGVENjJzdjB0?=
 =?utf-8?B?d1plb3RPVHVnalp2cEtpR29ZYTRQT1Z5QnFmWG5KMG1CRmVkRFB4a2lxbzhh?=
 =?utf-8?B?dnVOc2FuRjJxYUNvNkNRU08xTzNweGU5S0dSV0I1Qjk0VkVCWm92STFMT2xI?=
 =?utf-8?B?KzV4Y1RZNXNENUxoNjFOTFJhQ0h2WUF4c1lDdGJTeGdkWFhSME82cUw3MVMy?=
 =?utf-8?B?ZVFDM2ZPcVI5azAyN1NFN2psOGpLdjJoQ0I0SlhaZUFLWFhyRG5XRnNFTG9B?=
 =?utf-8?B?Rk4zTGJDK1ZJNGZiajhaU09Ld09tYUxXRHpBYzMzZ0huTWlYQmo0dEJmNnVI?=
 =?utf-8?B?ZXRQQlB6dUJDekNYUWM4WFRlenlhZ1o1Rk9GL0N0Z1pRdmVOa1FjYWlPNnVP?=
 =?utf-8?B?V3haRy95dTQ4VGprZ3FjRzI1RGZoeFV1WmtoeDc5Y1R4cnZhendXOUVYSStX?=
 =?utf-8?B?UjZ1N05oM2F3SnFIVU9mY2U5Z01keU5LYVRwNXJNUEIzZUhvNjVSSmNlMFND?=
 =?utf-8?B?NjNFS214SGJCTmpzeSs0MzBybGNHQ2xUK1M0UkllRS81Y3JkNytSd0dMNm5s?=
 =?utf-8?B?b0Q2bmdYQy8wZWYrR0cyazBvQ0FjK0IySTZNQXR2MDUyZ0JscXRseGoxVTVB?=
 =?utf-8?B?ei9OeVVjSjZCWG14Ui9jMjRubjc0VXJyZlFHWjVVTFpGZ1ozSU1IMm0xamtD?=
 =?utf-8?B?UWI2VVVLVmRVc0VSWlhya1hhZXlCcXBVcGtYWFJVZWlreEZiK1F1T3pmWmp4?=
 =?utf-8?B?Ny9FeFMxNUtJbkxtZTRjZWZOSEdXanZKMk5VZ2NJdnd1cE41amNqZjlMNHN5?=
 =?utf-8?B?NEZoVEd4dEFvV00vY290OWlQZFNhelcvSnF3a3lLUXBudWJIeUZMeVZjbXFl?=
 =?utf-8?B?S3RoNkQ0dWZRT1g5eFhnekVQUHpaZ3ZuM2tnWmVjdFEwOGlwVjJRRzgwL1F1?=
 =?utf-8?B?VVEwbExMbVRUL1JlTVRHSk12VGF0cFJuczhnVmVmdCtwOElaaFV3ZjZiOW1Z?=
 =?utf-8?B?eTRNc3JmSXJFMWs5Y2IvVGJITDNmTktBY1JQMmtFSHVtK054QzVXbVpEWXMz?=
 =?utf-8?B?bXZTTVFJVWdRaUpjQmRxOXc3Mk4vVlNVVUxtQXgzWnRndWNiTXg0NHBzT1dJ?=
 =?utf-8?B?cGxacWlCcm1RRzJHc0JZZ08rdWtCU3MvcmowbmRqbG1WYk1FTDNMd1dZNFR1?=
 =?utf-8?B?MEwyM3cvN0hmb3RWTkhiWVR0QkpTSWxvbzRLcFE5NmFtSXB3bWZSZVh0Q091?=
 =?utf-8?Q?pw1CX5x+WNA2ejtLWM50dp9yX1dHa1YxgXqEqc/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6ac646-34a1-453c-c004-08d8f32fa21d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 03:55:18.3996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRTUlwIxHILnLz0BBUweY5zbi7H9/ube469RX2hwXVi6zBO+85OEHQ901tS3mWtlaYDB3IKLGfrET/DD5Tm6QwkicaCZDFXgoeEkPuzqEug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4760
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103300023
X-Proofpoint-GUID: 9q5wqXu8xC0SJJjKvcGuJgg4Pmu1ncUP
X-Proofpoint-ORIG-GUID: 9q5wqXu8xC0SJJjKvcGuJgg4Pmu1ncUP
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103300023
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
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Mar 2021 10:18:53 +0800, Wang Qing wrote:

> Fix the following coccicheck warning:
> WARNING: casting value returned by memory allocation function is useless.

Applied to 5.13/scsi-queue, thanks!

[1/1] scsi: ibmvscsi: delete the useless casting value returned
      https://git.kernel.org/mkp/scsi/c/0d556a21a9da

-- 
Martin K. Petersen	Oracle Linux Engineering
