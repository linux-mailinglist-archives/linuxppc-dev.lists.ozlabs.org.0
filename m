Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F7945B04B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 00:35:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzL9P4T4Bz2ywX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 10:35:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=K1tlQYrk;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=AkbGmKkt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=K1tlQYrk; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=AkbGmKkt; dkim-atps=neutral
X-Greylist: delayed 10478 seconds by postgrey-1.36 at boromir;
 Wed, 24 Nov 2021 10:34:53 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzL8Y32P6z2x9X
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 10:34:51 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ANJXv93004389; 
 Tue, 23 Nov 2021 20:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=wbd07SskJyfq9lGZee2wDVPsRPNPFK9VMcymRcUeS1I=;
 b=K1tlQYrkFD9/betcFf2F7XhCmGfWOhrp+5+IW3RdP+rjMAc0Ri6kwy/WFI5D7QB+9+Wy
 2/l8QAdbc3qlZ14ZPdTc2XquanS8XJvbyXUUhvVacqpNan23SWU7OtRpV4sBH4NwEfwt
 62tyPO7RmScTBc5VifE3QKYXVh+sfK4CPDdMz83EWi1q/8IeBoWb47hWqPiIRKLy/JTh
 cJWXK2KAGA/FbUzsYg0f4DS6JXYNvilnRskNN+4if/LgwOnWp4Y5EcCd7tVMopulVlJJ
 dttlugqKMvaFur8cmtuhC0RDuqfsJT2NZgwpAqm7JJ+bf0BcfwzpcaPeFXrCDNCBEU2e 8Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cg305bs3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Nov 2021 20:39:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ANKQmJ1148028;
 Tue, 23 Nov 2021 20:39:48 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by aserp3030.oracle.com with ESMTP id 3ceq2evfq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Nov 2021 20:39:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dD3ZFd0TBCOWTFh+5hDRtp47hRvAlZXrzOdUp7JFhKBnmBU6qduCI2f0az3LWn7P/TMlKqimXSnlbg55c6ntNp+WIEvNMI/pRaALwxEwpUd8J3WoUlXcw3Z5rXHomFAZ3E5qmXFhCYxJULskKrJxRPkkr9n5Bz3Ma8DIm/1z6hs+V/odVBNJZvXGVg8mZaF2Wd6YLDYddvvGuXyUTON+1XHlNitscjKmaqivMW9infmzS1ioZ2lJMW4o0bN2dRnFG2mUrVDAr0VtXS34tpWD7gvJlgxNRMivv+xWG8I/9DAcdZ9YyWeLs3NMrN9NkZu2pvdHWweYbKVqNgc1AwbLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbd07SskJyfq9lGZee2wDVPsRPNPFK9VMcymRcUeS1I=;
 b=CdO+vuSYsRZh42bNQLBkLdim2O/p07rVuP2VQPimf1ZZ7yxVRMeno1J5gt7LGJpEsDhN3fA3/L42WyxFq/Xh100FYfkB2XrVG3z3DVEy+SjIFtXcO87QzHRHK72IrrtNYgD2VreziJ5To6YXN770SomzQ+CZOlsBK2ef54Qy88aGjaVWWdx84OYdmIDn1uRIRNU6WwHhA0PdcEGcxtKusXz9DgbWH2FjERhRhn1i3yoQDf4jlrDx7d8pJhE4AmCoqkk4WQSH9qExkI7dvUfRO7uRnjBM/lDATnulmUQ8UKt4l2IsBYSZFpuut42VOA7G264ZNSQy82PoSkXOPY9OqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbd07SskJyfq9lGZee2wDVPsRPNPFK9VMcymRcUeS1I=;
 b=AkbGmKktl4DLOxSvUWl16L0FRGwUfsmQZFtUyyHIpgU7j56zNzWLVfO4wxp0meW+iain0+Dk0DwhJV1wa1VgqWWJbr3yyD5YYA9w3T6X6j2TgEtBEFau5FTC3W14yKLmXHDjjN98R4RVcXAxptmUG0mINTzRg+et75JDnSBFu/g=
Received: from BN0PR10MB5014.namprd10.prod.outlook.com (2603:10b6:408:115::5)
 by BN0PR10MB5302.namprd10.prod.outlook.com (2603:10b6:408:117::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 20:39:46 +0000
Received: from BN0PR10MB5014.namprd10.prod.outlook.com
 ([fe80::40b1:8e73:d851:6dc9]) by BN0PR10MB5014.namprd10.prod.outlook.com
 ([fe80::40b1:8e73:d851:6dc9%3]) with mapi id 15.20.4713.025; Tue, 23 Nov 2021
 20:39:46 +0000
Message-ID: <07b650a8-7ede-3716-2e35-b0d4f94802cd@oracle.com>
Date: Tue, 23 Nov 2021 15:39:39 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 0/5] xen: cleanup detection of non-essential pv devices
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20211022064800.14978-1-jgross@suse.com>
 <bf5a4749-0216-53db-a022-ef4f84d823c5@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <bf5a4749-0216-53db-a022-ef4f84d823c5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:806:d0::12) To BN0PR10MB5014.namprd10.prod.outlook.com
 (2603:10b6:408:115::5)
MIME-Version: 1.0
Received: from [10.74.107.95] (138.3.200.31) by
 SA0PR11CA0037.namprd11.prod.outlook.com (2603:10b6:806:d0::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.24 via Frontend Transport; Tue, 23 Nov 2021 20:39:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c079e34f-f15a-41dc-7975-08d9aec16307
X-MS-TrafficTypeDiagnostic: BN0PR10MB5302:
X-Microsoft-Antispam-PRVS: <BN0PR10MB530297E3D1AC49C4C7BAD6E38A609@BN0PR10MB5302.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UtmrreEWfLEixJIs71qdTO9z8BuD+G78109jS2832F+Igll9XQqsssMeM/AJbjeEX/Daxv60kjR219VSuvTJjSFmV6p5pKKE3Kt8bs1FsOX+SVEKJt35mGhIgXV7XHmM3ByST+f3xxJeyTBP6Wwnd3AQcJ9vby1CKP502LkopHtubkSjSO3LaRetTaKYMPxzYlDzgqMQomnIqLh38Yb3zFOD0LfLAYQrmCai3fWXWCWWLUk/eeALl+HArgnFphjW6Eomcj+UKnAiMVo95i84XBobgalkFzc7lWh1MPkpbK1QECbRop8DqiJ3LEE0HB5feg4laPemv8MUU/+LfwYBoNgdpeDIOnT2leakZpiS0rrqKK11DnnMaQEArvc0LQoIxdeX8z4N2xZVwW4YIxv5grTD4Zh4+2uHZxACyKmwRz5/fJVjozbCWEqo7CIWw54TOaIOxD60Sz22FMRPOAh319eYg/lV86mbIVWsWd7kJ48S0K0hNcDb5CU+5Fu4Izyz5QIaNfNSA5gyAmKT+2m5JMr68cLJ0PPxmyX7ggc63TAE2JQ1Q4jNxv97rulEBGeF8a4POAdyQuQS2kFq42AqWoz8ftsgQh4UfSTiRAo4t3MERHPEFubW0rnHYz80WgFZ4WRkGhKZSw2RqR0fFnfQ1a1fx8gi4W2ZEHN+6RgsK87pCawo93FTogQP/fQcbhSFwvWe93RRNiC6XkZbaVJHs2rw0LEqgAtD5zE9xMwM6/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5014.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(54906003)(16576012)(2906002)(316002)(26005)(38100700002)(7416002)(2616005)(66556008)(83380400001)(66946007)(66476007)(956004)(44832011)(6666004)(8936002)(6486002)(508600001)(4326008)(8676002)(31686004)(53546011)(5660300002)(31696002)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjNHdUVucE95NFVFcFlUYm1wNncwbis4c2hXSngweGF4UlNwd0ZxRzRxaVJ6?=
 =?utf-8?B?MzZlQWxaVU11ZU5wN1JONnVkNnVTYUlQMEUvanhFYVFZNW81Rkd3ZHJxdzdv?=
 =?utf-8?B?d2pHSmZEV2s4aHBxYWkzUFVrQXN0SkcreU9HRmNETTZ6bnpDVlVpNXZ4bHBa?=
 =?utf-8?B?VllsWWZFdk5aTEtyamo1TnNOQk5wZStiTHVSaE1GRElJMWcwT2IyakxzaUtn?=
 =?utf-8?B?OTRNTHJ0RG0zMWh5eWRta2RHSEczbUw2ZThHenZYUTQrZWp6WEVKcEZpV1Zo?=
 =?utf-8?B?eFV6c0pLV211UXBzQUlNSlFaR09JS05aL0Q0ZkFpMmVoQXk5a2NqYVRjNm1s?=
 =?utf-8?B?Yi9HMERpNHorT2REL284b0ZwS0FhQ25maHRtci9UN0NCY0dnSUswem9pNW5T?=
 =?utf-8?B?amVJRlpqYXdNYitTQmNnYlhwZnNTNVgvUHhTcXNTRzRjOTJEdlQ5Rnh6L0F3?=
 =?utf-8?B?SjM3VzlkaGFmTlRHTlVpaThEMUtFVGNkK2NEUEN6RGh3QmhBbzVYY1NabEQ3?=
 =?utf-8?B?eUJFRjAyL0pkMnYzMW9RR0x3SCtIRmpxVVI1MHg2ZDllNW5mTndqMzQrNVgx?=
 =?utf-8?B?bGZmdWhiVFo3dVRKcmtKcmJndlFkWW9aOEhYWEFHYzh5d0hoVFNOUjNhWVNq?=
 =?utf-8?B?b3E1eWc4TElKcFdpbDFDZXppSGM3L29PSy9qa0YwcmEzV2h4RlVmK3ptYk1I?=
 =?utf-8?B?YldsVmlMVTZWZVBvL0RUZHdtMmJYUndQS0tibEpraGR0YVlpYWw2bGloTlNo?=
 =?utf-8?B?WFhRTnVMdlJYNnNlT1dOTDludmp5cDV3RDc1cmo4emF2ZVRISnp5VFp5d1cz?=
 =?utf-8?B?d2hkQzVDVG1PeUN5Q3RtMnJkenVpcEN5RUVlWHZIQ1VoaVAyNTZWeDJyWkEw?=
 =?utf-8?B?Qkg5YkJPL3Y2ODg0YXdLVW1NTFdGZlJkMW16LzhScjZPTjhPbHpQUW50NVE5?=
 =?utf-8?B?aXZiUnpHUktnQWM4YzZOMGZ2cUdpQVhhQ2VoaEoyaExjQkdYRnFnVFp1ZnVG?=
 =?utf-8?B?dkh6S0c1WnpBSCs5MDBlTlZUbjNhRG9paXlFOGF0dWdWcHlZWHpHeEJOVEZF?=
 =?utf-8?B?UGVsTTZjOGptK3MvNSt1WU9pb2MraTQvMnltem54NThFbGlhcWZ2cW9OTTg5?=
 =?utf-8?B?TUtEaTVXUUJHWTBvc0ZEMmZqNUxDSGJuSzVVekVLek9zajMwTnQrYWk4S2ZQ?=
 =?utf-8?B?cjY5YmEwRVlHS3hyQStkd00reEc1WEFMMlFnT0lpRFZGdVVpS2hsMEtRUG5l?=
 =?utf-8?B?RlNuZ05qdE9SUUQ0Yi9hUmdEcTJNNUFKMzRuT05YRDRmM3lqV0pwdVcybnM2?=
 =?utf-8?B?OFRYbEl0Vit3anE5YjV3R3Myb0tNOE9ZM2YwK3FvTS9UWGVtZFRUZmQyb3Fh?=
 =?utf-8?B?MFVnV0RaRHpyb0xCQTBaY1hYeFFQNGpiNGg5dGlneFYzWUsreTk4QjZYRG1k?=
 =?utf-8?B?ZUVIcVFsZFNJN2NzcFBPcGcxUmdLbGNEdDg4eDVMNkU3Q2JiM0dtNkxCbXpS?=
 =?utf-8?B?d2o3ZFRIeDVlZkpHSFpjZEZZSjJJbXFEd1NMdXV1ZTZhNHdlRWEwcFhKMWw4?=
 =?utf-8?B?U04zSDRtQ0pKd2QzbzQzalNiVlFZNVlIRFdkNDd5ZFBzdHN6QmJtR2Y3RHht?=
 =?utf-8?B?UXhpbk02YlFoTFQ5RiszS3dHbEdYQkVCMmc0OUZPMVRJZXV5R3FFVzMzV2pt?=
 =?utf-8?B?bjd6SnR3dWsyOVZYYjcxdjFIZHIyNVV0V2kyL01SblZDeUNZYW1jcit2eng2?=
 =?utf-8?B?SVlnNWx2U1NhUTRmNkxTUmxHOG1BUDdaTG1Tcml5TDBmYy9rcmtMMGE3UnVF?=
 =?utf-8?B?RGsxanM0QWtlejZja0lsMWJFT3YxOU9zQjVtNW1IU2h0S3ZhYmREV2xOd2VQ?=
 =?utf-8?B?ZUFqUERTQkxIV0NmNmpsdEhjTjh2ZGl1V2RJVVBmRkFjS0VweVpNNnhTOW1X?=
 =?utf-8?B?UTBSUXcvOXpoM1I5YzRVV25CRUY5b2I5ZUNaVFppN1ZsMGNJV2Npay9MajVO?=
 =?utf-8?B?SjFZVldjV3dySnRjbmJuVW9wWUxudy9LWHhBNmxmKzIrT0VEMTJuc3EwWmFh?=
 =?utf-8?B?SHM3RlNJcHNVN2x1QlU3OEkzcXdTWkgxWG9GMGNpNjBxaVNFOWtzRFJpdE5r?=
 =?utf-8?B?b0dQSE91UnRuMmlNa1RONmQwRWc4SlcrSG4vVWNURHREWWtxZk9EdTQ1d1ND?=
 =?utf-8?B?NDNFcHE1dmxBOG4zZFFMK2p2S1ZxcjRIb1oyamgvcHF6dEZlVXh6Ry9oWlRz?=
 =?utf-8?Q?nLoQy1p7XsikijXTikqBhZh0ix9pP9keS0lztnCP2k=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c079e34f-f15a-41dc-7975-08d9aec16307
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5014.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 20:39:46.6037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdBIO6cmWfp7QEOOqKSVjSaq4WkOJ27h7FylC2afgUY6xufGZ3ti3zya2xSQMeXCV5juS43RqHnADupJqUdEZfUTyWsCvggnL52dFzVcfUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5302
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10177
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111230100
X-Proofpoint-GUID: 0KfI6w_OY80QNNxMKpeQKcEIe64cjXie
X-Proofpoint-ORIG-GUID: 0KfI6w_OY80QNNxMKpeQKcEIe64cjXie
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
Cc: alsa-devel@alsa-project.org, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Daniel Vetter <daniel@ffwll.ch>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/22/21 3:20 AM, Juergen Gross wrote:
> On 22.10.21 08:47, Juergen Gross wrote:
>> Today the non-essential pv devices are hard coded in the xenbus driver
>> and this list is lacking multiple entries.
>>
>> This series reworks the detection logic of non-essential devices by
>> adding a flag for that purpose to struct xenbus_driver.
>>
>> Juergen Gross (5):
>>    xen: add "not_essential" flag to struct xenbus_driver
>>    xen: flag xen_drm_front to be not essential for system boot
>>    xen: flag hvc_xen to be not essential for system boot
>>    xen: flag pvcalls-front to be not essential for system boot
>>    xen: flag xen_snd_front to be not essential for system boot
>>
>>   drivers/gpu/drm/xen/xen_drm_front.c        |  1 +
>>   drivers/input/misc/xen-kbdfront.c          |  1 +
>>   drivers/tty/hvc/hvc_xen.c                  |  1 +
>>   drivers/video/fbdev/xen-fbfront.c          |  1 +
>>   drivers/xen/pvcalls-front.c                |  1 +
>>   drivers/xen/xenbus/xenbus_probe_frontend.c | 14 +++-----------
>>   include/xen/xenbus.h                       |  1 +
>>   sound/xen/xen_snd_front.c                  |  1 +
>>   8 files changed, 10 insertions(+), 11 deletions(-)
>>
>
> Any further comments?
>

Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


(I'll fix the semicolon typo in the last patch, no need to resend)

