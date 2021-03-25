Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D83C3487B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 04:54:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5WTF3NXbz3bth
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 14:54:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=bOEJPbM2;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=qNIvVAHs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=bOEJPbM2; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=qNIvVAHs; dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5WSj147Hz2xVt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 14:54:27 +1100 (AEDT)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12P3mYxX194876;
 Thu, 25 Mar 2021 03:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=hiZkDQg53MM54IsjN13m+OxrhlBFcrlX6EZjSFDgANc=;
 b=bOEJPbM2fwaWso/yxD8xUchvUG08uYE/Vl2gtMj2h8tXZpVoHzUw9OqBqYe03stqwBK6
 RONHEYIMWRjdmFtYkzzTVoaAJhqiC8jIKkIZZd72Wd3FK4y+/R9ycwHdB/lm+V38HsIp
 vKg5sdCpwemfmVOnz4Jfx/YABZTPAsTn0RQDNa2nZXKyHlaL6ubKVdn3K3Snskt0uFbf
 C6jsNovj2/OG+PjIFv+fAwb5kDEx3TGgQaJzNFtIglY5hlrbKZaZdpK0jnw8wkc/+4Uc
 grNXS3VrDcDZBQrw15Gbz9iDaQhglCkc1xCHCAWj27Kz55hnOusUTsHbimxPqiEoLa6Z jA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 37d6jbn0yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 03:54:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12P3pFgx134348;
 Thu, 25 Mar 2021 03:54:00 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by aserp3030.oracle.com with ESMTP id 37dtmrmunn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 03:54:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1LzvQfsKINlP/UKhx4RgS1HE97fwLsGZ11fsRs0KYbvShmz8THBGyheN36Ilai7pSajugqiyMOZTfCEawn4cnhE3TFknZO1ZRGnGwRIQPFVleGX0pwaOB5o48fjp+LbkSSqry05gBtu881RTmIy5112c9aNotWmzhR1Qr7PENbBcI8dFt+FV387kPrk30UrRFt0iJ/Xnl6u3NZGGx+6SMp83bBgkEc+8gzyy6lU0ZgxfeC//Jg06ceakDbNMR/IFz4L3wA0y1U/Oa9kNH4jHfF8tQtySfWqRC60Z6LTLhqGwBSk7gXrZCMG2LlF1LNnUVYZfAvIZAFV/dRelylDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiZkDQg53MM54IsjN13m+OxrhlBFcrlX6EZjSFDgANc=;
 b=gBmFhD4KQ+X+UOexSiagQ0L6AhIuYzY+HnWOPPSVc9ZNgns4IU/XQ5tMBfLzozjn9XKAKgSz7gfvCBCCYFY/Ckrhq+eiUpo61OdJholuZQMNPgoGR/CQDa6CRCtNVxQquDZ7jD+otIN9l3wWacPnf/SIAQx7hG0sHY3xyi2/Af4orhH49lZTOzXGNyv9ND06jPMsM29TwVXl5LbvuVveI6EqQn4wzh+ioARP0JYfiWh5DefV8uVzxIOpAR871RWz1hcmlUsBHiMGffeTEFiggq0LPtaYIL6Pryc3yfTEos5WTa0IteEzpUoapcrVJ1zFNVWVf0GXMloQmgT4UECoNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiZkDQg53MM54IsjN13m+OxrhlBFcrlX6EZjSFDgANc=;
 b=qNIvVAHsQtLHtwAhSh6rfbmP0DytwK7rfaYqph7IZG1qc/Mg6GOOE451sJ2oQb1oI06U+lMDi7B1sR2wJQUdoWNAumRGsxXSdwf6aYx37UEYXeBS0l2dRlM81IsbLdDKb/urzMI4twhpCe2vlbGo/pe9K6ZGyP5UFmmHsQtCdqA=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4774.namprd10.prod.outlook.com (2603:10b6:510:3b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 25 Mar
 2021 03:53:59 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e%5]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 03:53:59 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 james.bottomley@hansenpartnership.com
Subject: Re: [PATCH 0/2] Fix EH race and MQ support
Date: Wed, 24 Mar 2021 23:53:49 -0400
Message-Id: <161664413898.21300.158645434947164288.b4-ty@oracle.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210319205029.312969-1-tyreld@linux.ibm.com>
References: <20210319205029.312969-1-tyreld@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [138.3.201.9]
X-ClientProxiedBy: CH2PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:610:38::30) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.201.9) by
 CH2PR05CA0053.namprd05.prod.outlook.com (2603:10b6:610:38::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.10 via Frontend Transport; Thu, 25 Mar 2021 03:53:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df44e4f7-fccc-42a3-f313-08d8ef419ee7
X-MS-TrafficTypeDiagnostic: PH0PR10MB4774:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB47747BF7DD637A5723E8AF538E629@PH0PR10MB4774.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W4M9DLdUS5UKmMBaqv5PLuGCqTxwmfA9nx+p6Qkk19uPtdvOSc8dlOWU5ADDFysbQT7TGPjP8Jsx5/7iXSmUOfeiedTjwzeiClNs4/G5fTfoHAkVTDYPGwbKyiAPYwIcwkaQP4x3B2mXCTgMVrxoLO5FcBmMv7uy9orHNKKfQi7wL8OBwD/PYmYFwHATTuj6pe1+VrD11i0M7lEphtEB4a3C7iZv08oop4tkv5OS9Fx8tE556uNv0GXg2Pamkn2E9qnOolpuVQ16yAjX+VTQc17IaOLgtm/hfEV7Z023ru5uFiqFv3kcvNe5knuLJjYQU7rF113j3QnZZgaEO3htWHyFvw8L53gZTs+UvKYzrsEx7zMpLrTKbWrHDq4U8QvK3pmMMu953bdK8+4/n4L2RZKU74ugFgF1eM/wYiUYyrdoqSCBfGmHCy389scjg1HaZbIlNuDuo7Dle59VpbvQpTy3m1N+Y71kFKIYdFYPn7Lm1moEGqAz5RCPVWjhpzAt3OniVVsMAM85QAf7TMTVGmweo8RkhJMlB/+rVZCqxD1t4+THHY8jh8svYjcEwoEbMUhCeSXRCqaqjcUtOUEaFSdugt3QX0TuaYEvs8m/riIFV1tRzj7hkHaY4F7r5fwsObJF/p2EWGcR2yxukCF9IZAgmZQnqhFjD0k6alrUE/M0ycq22zxvUdSANGk4ZAf1ysHtoSSaPjiwJoGwaqoy5znOXoQgpBZOh05l676Ol90=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(366004)(39860400002)(136003)(8676002)(4326008)(86362001)(103116003)(6666004)(36756003)(966005)(4744005)(38100700001)(8936002)(2616005)(2906002)(16526019)(186003)(66946007)(956004)(66556008)(26005)(316002)(52116002)(7696005)(83380400001)(66476007)(478600001)(5660300002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UXFBVEtlQ1RYWWZCM3cxaG1FZXVZMkRHYjdFT2p6di9keDBDdDJ3SmpGZStP?=
 =?utf-8?B?SDd3cHpDSWdEczBhZURyeENLemoxYkViWTVLVlF1NEVoVHZnWWpubzh0NkUw?=
 =?utf-8?B?ejkydUh2ZU9zMTlJSzArQ0dLaGtGOXhSZDlNeUFpcXVQcjR4T0N4VittK2lD?=
 =?utf-8?B?aVFHZGFMUXZyeEZ3ZzNXTTRNSDJJVE9FazUzQzJoZVNKU05yVExFdFAvTUNS?=
 =?utf-8?B?M1NXZThBVHQ2YmlwcUdDc3RMOW85VzVMVURuRzRCU1hyTlhTUHpwRFdlQWRk?=
 =?utf-8?B?Q0V2RnV1QUtOV3lZb3Fqb0dZMnBIeEM2VmJpZkFNd0VLM09CWE4xbUZQNm9L?=
 =?utf-8?B?aU9ucFFzd0trYVZsRzdrTmRTcTh6UmRPT08zL0RKQzAwbkdXeGYrT1RrNElE?=
 =?utf-8?B?clEwVWpaVWhsMi85TkVhaGdHalBSVmp0TUR0cEcxeHdsMWpWUFV0ZFJDTDUr?=
 =?utf-8?B?UnIwZm94SjZTR0g5Yk9qYmM0WlE1dC8vWlUzTTdCRWQ4S3lLd1JqelAvWERQ?=
 =?utf-8?B?RFFZelZLNVBJNzBxUHJ6U3F2SHRhR2dVWHh2d013b05IYi9pcEdPMW85cmhi?=
 =?utf-8?B?VXBzZngrczRGUnJOSGhGRmlwY0JnZldXNUoxWHRZSTQ5aU9UQWtZZUdTQnlG?=
 =?utf-8?B?R0xqK0haL3JBN2t4MHJNRjRhRTFQWEF2K0w5UkJialpHaXovTHo1a0JSZFZX?=
 =?utf-8?B?VkoxK0NKNW05NkNMdkRIYVo0Q3lad0N0V0NOanJaZmRja0crcEhSL2x0QXBy?=
 =?utf-8?B?R2lSVktBcXkwU3dvWjFMZXVNRFdCMjkvVy8rUXRFRXpIOUlrcEUvLzBQYWNF?=
 =?utf-8?B?RGh6RktRdmtiMjB6aVA5dUMvZHRrYXVZdHBoclhFaGg3dTBPbTBEL1NsMTlF?=
 =?utf-8?B?VEVRT1lYU1NCL1dueTBpU1JzcTBFZjkzbVpnMlhuOVprckU2b3Nud09nekND?=
 =?utf-8?B?TGxRQUg0WW1qNERLQ2R0RmsrTFFIUzdYZ3l5VGRCVkpKWWNGK0RMSzdKaXRJ?=
 =?utf-8?B?RWpySTlnQ3VoL0gvSWwvR1orZ05uMFlMMmdxV0kwUHlDREZtaHZTanVjUmxu?=
 =?utf-8?B?RkhkMFBIdUp0cFU1Q1p3NHAvR1RiRmZjYmRmc0Z3ZzJOR3h3aWY2NUI1R0lk?=
 =?utf-8?B?em9MRmJXK05sSHNnVGRtc09VYkljMzhjYnhGaFVwZWJGTlN2MFBCMnlIV0k3?=
 =?utf-8?B?NnBnMnFtWFVmU00wRjZubHM4SWV6NFg0OFRCYlUzRFRxUE9aOWRwaE1OM3RX?=
 =?utf-8?B?NDFQU3hqQ3crNC9PdDJnbEw1VkY1cmEyNGdwQmNqMjFERXI0ekx3NEo1SGZk?=
 =?utf-8?B?M3dmU0pvQUxZYVRtMzN5cldmaUlXWWhRNmJPa2U4ZzRLRjE5d3daRDRZYk9G?=
 =?utf-8?B?aDQ0VWUvRDlERDJIWE9zaUgvWjljeldhamNuSE5qbEgySjZHSWw4S002Nkdk?=
 =?utf-8?B?TjhvaWFjc1QxVmdnalJNeWd4NEd5Z1pzem9Lblp3WitqeDdvQ09URHQ1OFY1?=
 =?utf-8?B?aEtWWjd0cHdNdXlVZVNBSGhyaVZ5V0xtN28zZUVIeGlqeDBhd016dTJPQ1gw?=
 =?utf-8?B?VG42UVQ3dXRqUTRlQmFJRGtveWxMdHAwV1FTZWdqQjdnK2VjRkRVbEM1clcy?=
 =?utf-8?B?YnZWNFdFK0pCbHlkK2dJbHhaNFJwMXd5SGlueUdyS245bGNnVHg5WGhFQllo?=
 =?utf-8?B?TFB3VTNDZ3U0dCt0cHRtemhTVG0wWE4xM01Ia1l0RlFHaGd3R2tkNEJieS9x?=
 =?utf-8?Q?nyRzqB0O7f8dhI3kSn+MKPOOgwUG8xTBI+M2oku?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df44e4f7-fccc-42a3-f313-08d8ef419ee7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 03:53:59.2890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVSaBMMgKWMmKyO4v/CUd2SaXvtUzLWQGpSr9nU5JmewIsOouZ6n70VrUM366c7IKDIp6jQAQGLije5xaj2AK6fuCe/KUMZ+0MXOuxTKVEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4774
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103250026
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9933
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250026
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
 linux-scsi@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Mar 2021 14:50:27 -0600, Tyrel Datwyler wrote:

> Changes to the locking pattern protecting the event lists and handling of scsi
> command completion introduced a race where an ouststanding command that EH is
> waiting ifor to complete is no longer identifiable by being on the sent list, but
> instead as a command that is not on the free list. This is a result of moving
> commands to be completed off the sent list to a private list to be completed
> outside the list lock.
> 
> [...]

Applied to 5.12/scsi-fixes, thanks!

[1/2] ibmvfc: fix potential race in ibmvfc_wait_for_ops
      https://git.kernel.org/mkp/scsi/c/8b1c9b202549
[2/2] ibmvfc: make ibmvfc_wait_for_ops MQ aware
      https://git.kernel.org/mkp/scsi/c/62fc2661482b

-- 
Martin K. Petersen	Oracle Linux Engineering
