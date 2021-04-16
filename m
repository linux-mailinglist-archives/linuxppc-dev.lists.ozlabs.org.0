Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 196403617D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 04:52:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM1300Cytz3bT3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 12:52:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=JbIq7tc4;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=l5kq6Q5M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=JbIq7tc4; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=l5kq6Q5M; dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM12Q1VP9z2xgK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 12:51:56 +1000 (AEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13G2nps0051124;
 Fri, 16 Apr 2021 02:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=1D8nn9yTMsepo+vKcDrwzw271jSKVvjSStL1LpprNYc=;
 b=JbIq7tc4Z2nJIUvS/I7EUBsEFEAbRv4fhZVHSmrUUgeUBWtKHTUXQl++eYPifZFAxg2z
 AlYnrmaOUIIE5yshovjcJZm0peoBVPdW0Lo3obFXTVKhY6EsSF7G/9IzvdKPPv7x7ubU
 dyaDw3WVE+7+CJi+BDaJ5x4y99D73g1SLXnGs2W93gs73dZT8ekGtkpEay7uKwXvDwKb
 ywHwPB8xYnAJNtUQLUj8K0hnf+DMtehtciOaZuIrtZISX72Fo4o8DLf+2AERfXIZWWN4
 uKFdYnE0ezgGIZRb7QrvTRqlt4vc3lidIQYstRW3OMKhlfpW3eFAN20TMykH5BI6Nocr QA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 37u1hbqty6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 02:51:45 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13G2pdFF045037;
 Fri, 16 Apr 2021 02:51:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by userp3020.oracle.com with ESMTP id 37unswhm94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 02:51:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2X4v3b03lDxWNQJpG9pA3xPI8fuEvnJxDdMFMMjZWxucHLdoCTbhVwPXCwwY249Vk1Z7L38JyfWzhQiAhVI3lVJ8PojiC1uV1s/1DzGTRzWyyEBZiupNuFfTXY6Oni8c1Q5HMm48j0rzBgbc/oPc1OIdHk/SSmdjGbwddwFig6ZPl9bTc5z+ZVbhZ8cT1uw2gE77id1cU7TjoPJyGUTymNdNWnhZrz2zxrd8XpEnJgir653/MYkay4L1uSJYVBS+uRIWbTB5BqEq4dXdbCScz5v/nUoxj3+FdE8HDNj2s6GyMka8oAnOfYmzXygvRBRxIiW8hYPcdz/7/k8FiuU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1D8nn9yTMsepo+vKcDrwzw271jSKVvjSStL1LpprNYc=;
 b=Z86UkoDs6BBPTD6NCxUwfYGvxw/MTAfBastOG4s8gibUz2Wc6/lX0okQkkSblmiscARDSOxSMZ4eIevlspRBn+Byj2BCGDVUKkWv5W0ZKrK+ofPNUx5+P/HF3yixhcQRNIlaNVApbmVvNBBe9du+XrG7uIUMxBsx2YIZ5t7J9pm2q+3bYp3JDZZ7353toUlOrPfnLy/uFhWIgU0SShIVwaCSQXWfG+f837ZMoPkpyA9KLOXY7c9wK0rmdE+qKh3nLZ8OFkFw36BREkKDuhM6xM1mLQ8SqqK4teI1kN2IlJJwC9VwySp7GsFH5fRXcXdxZ8EkZLu0ORUZ48Q7FBf86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1D8nn9yTMsepo+vKcDrwzw271jSKVvjSStL1LpprNYc=;
 b=l5kq6Q5M0CX5nyEmmNNbi/w5bwyGN9Zmin84x0RAwpoVBASVkJfk04NDV/7ebcBWwp8FZvu8JhR0WlrOVkPED11VNZlCP8Z6a1bQx3j6efhqjPZiNuiMqQ4NEMURnuuGEzAwjAVJPsVW2w0HdpspOvJwT+PrO2gey/BDOpYhmbo=
Authentication-Results: hansenpartnership.com; dkim=none (message not signed)
 header.d=none; hansenpartnership.com;
 dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5466.namprd10.prod.outlook.com (2603:10b6:510:e2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 02:51:43 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::9ce3:6a25:939f:c688]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::9ce3:6a25:939f:c688%4]) with mapi id 15.20.4042.018; Fri, 16 Apr 2021
 02:51:43 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: james.bottomley@hansenpartnership.com,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH] ibmvfc: Fix invalid state machine BUG_ON
Date: Thu, 15 Apr 2021 22:51:21 -0400
Message-Id: <161853823946.16006.3766095104419488377.b4-ty@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413001009.902400-1-tyreld@linux.ibm.com>
References: <20210413001009.902400-1-tyreld@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [138.3.201.9]
X-ClientProxiedBy: SA9PR11CA0023.namprd11.prod.outlook.com
 (2603:10b6:806:6e::28) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.201.9) by
 SA9PR11CA0023.namprd11.prod.outlook.com (2603:10b6:806:6e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 02:51:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a6450a7-0bec-4f64-5b42-08d90082911b
X-MS-TrafficTypeDiagnostic: PH0PR10MB5466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB5466F8018228B81C2176B7118E4C9@PH0PR10MB5466.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JhKIXJ0TurtaOFwKaiKLu1Y1FpVviXMzLzd1+TAQ8hGh1nN7FOLIu7EFFe3je/xw5ZjuaBs4CJ+ujkvi+dY0vHIbW9ZTCxfu1BuQyjDx16+aw+MGGzNg+tbXGfkstzWvYRAlk/66n65sIpgB99xmDpsoeGZWEe84hw8eWlj/g71YyNP+P7L9KYQnenIZMxT84Q1e8TA49QQdhkTNqz5si4e1wpDYDcTutoyh39g5tdMaFD1NUijW6IsTpgv0Xwc7pav5GGIcXelAoD4Xw7BjQKtW/TXeQhxuKHbdyxbzJlrU5Lg/dz8CaYGYD9p8szqMdkwSjlAGvbAnVoLnlgj/ct61xF7JIFUKTVjsZll5EdF0WR1Aope5PMgp06JJBnvn/XkEG0SNr2w/4E1js5+USexxGHTC5wlW4e2hAiDlPW9C4x9fvO7qwyd89hdYR9mi9gFjNsyl1V0BSdhnB7z5Wp+Pcw6xwmzHCH4oWxE7Xw0U6ttkHS4BXm0yTUhq/j6TWhbXGF9fbBPM7AWX0w0bLbGaGR1E9AAWfTtClvOz6OQS7KjxemdNvwhwYORmfv4+EPEHUq4TtC3ELYJ0jzBtgW92d2ZdGQXiGKYWStT/J3tL7XTXy0xWAY/wSN/LC7Kyb4cfpEvb/zV0ZUFvjEa85pNbsJj3s4iOhzprWYQps/WJLiXT0lbX5j8CQ+OJg/iSqgTbeLxcems6aTIsApXR3XoUh6vCJWoDQVlao1w00lw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(376002)(346002)(136003)(54906003)(7696005)(2906002)(36756003)(956004)(4326008)(6486002)(6666004)(5660300002)(2616005)(103116003)(52116002)(966005)(508600001)(316002)(83380400001)(66476007)(186003)(6916009)(16526019)(66946007)(66556008)(8936002)(38100700002)(8676002)(86362001)(26005)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T0FzMVZzenJndzBrYW1VR2dHY25QUEwrKzdEVWxCWi9oTnducytRb3pJc0tV?=
 =?utf-8?B?QzdOdXBXaUVrSXVnSE9EbU1XV1RGeXhFZEZHTFllYld0YVRObEJaVWxQaStr?=
 =?utf-8?B?V29JTUdhamovWlFvSm1wajFNVEw1UWJ4RGUxYVA0eW9ZSUlZMFpOV051QlFR?=
 =?utf-8?B?QVEyWC8yVGl6RTZlRlpwWXAzZWNuNVJmZXZNMzAzekNBRWtQb0d4MEZxTTZt?=
 =?utf-8?B?aE5Ma2loa2JmNlhJOHZrZndSYTNvVS9oQWxGZCsyZTk1UHRWTURESW42VlJo?=
 =?utf-8?B?TWE0QnFwNmJQcG80OGh4YmxndW91THdSTFhYR2hwNFg1SFN3Lzl1ellPdHht?=
 =?utf-8?B?dktDRXBJYXQxNVRoNjJhUjlXa09md2NNRUhJUTF1OGFVdzFvUmVzQXRxTUZS?=
 =?utf-8?B?T0hXc3UrMk1PZjJ0UjZHOWprK3pOSi9pdGFvVXVMdExnczVFNkEwVzNXSjcx?=
 =?utf-8?B?SFRFUFJLeVBIWTNlZ0lUSTJJYmdWRjRnREdDSUpEbUM1SlZNOWlJUjVVTlNs?=
 =?utf-8?B?Y2JGRlhLSXJaZmYvRXFlTyswTkdZdDJscDVnQTd6ZmxQVVJuNE1reDJjZ1R5?=
 =?utf-8?B?SE5SM3dqS0ZXRENEbzUxb0h5d21USjJ0Ujh3cUVmRXYrMS9SOUEvQlpteFdC?=
 =?utf-8?B?Wkg5MElnWElYMU9uaFlPMnM5N2FWVmMwbllpYUF0WGJvbVlMQ21wNzI4MUZ3?=
 =?utf-8?B?UFZVa0lsUmhSL29qaXdaMXdwS1YzR3hsK2ViTWtoMnBPcmo4WVNMTE9lMWRw?=
 =?utf-8?B?U2lJZXNNMjJaUkZzY0xVQ3pZTkVTUWxXak9RRHhMR0YzaVkzMTR4QWJXUTJj?=
 =?utf-8?B?THg1T0pWWUZCZDhDSXFibk9QM1RCKzc2dkN5eW8zaEVWME9RSjJKY0dYRERl?=
 =?utf-8?B?NkxyZTNBc3VjREs5Y3ZHeFRieCtkTFIwalIyb1E2dEZuWjBYSUY0TkhLSVF5?=
 =?utf-8?B?c1FpVVVCeXZmZkRwL2Z0WXRqYitNTUxGcDVSdUUzcTY0Q09EWUprUGxrVE1Q?=
 =?utf-8?B?U3gwenRJV3lIam53eHFIbkRXTUhQVGt4UjRwNzdNZ3dKa3g3cHhQQ3g0dXdq?=
 =?utf-8?B?R2RYcHI4SkpSUFpqSnJjaVQ1cTJrYVpGa0NpZjBlZndxTS9pOU5iTWVpMCtX?=
 =?utf-8?B?VVlMajV2V0dBTnNCZ3JrT01mMFQ3UGpSRnpPaVdCdkpmOEFHdGRoVzc4Q3pN?=
 =?utf-8?B?RmhkdWl2OGcwajAxVmxDeGdlNFQ5c2ZkQjYwVDhSMXhNVU84L1Jjb0VtdEVk?=
 =?utf-8?B?RnRMbjcyQVovSDJlenppdzdNNXlJajdKZTliUUZ3N1F3Z1ZIQ0toY1lYVUNt?=
 =?utf-8?B?Y1doYjIwNEt1bmJlRXVTcXdZWnVxM296cE1Oek1YakxIdUF2U0ozTWdCOG04?=
 =?utf-8?B?OWhoTlVJS3NMTDY2ZTF6dnlYeWlpUjFuTUdPRTVKM0pjVGNrdy9FSUZXSWZM?=
 =?utf-8?B?Z096QUNZUkN5eklINFZKcmRERVJ1ZFJGd2hOS2JxbnBZZ0RUZUYySEViU2FT?=
 =?utf-8?B?ZldxQkFBSmlrQjFQczBSNUdadUw0SzdlOUlaa3MzcFZrUCtNNE1SRGFSeWxi?=
 =?utf-8?B?WTNnckw5V0N4THBISkhJK1RHNWRIY3JJdTl6Nm5XM2Q0bFRQRVN3S0ZvRWFu?=
 =?utf-8?B?VGpRUnp4M1ZZNlRxcS9zQ01yZjhXeU9va2lmR0RaaFRHRXpZbDh3Vis0eVk5?=
 =?utf-8?B?dWtuMit2a3laSEpKUjV6S0pDMWpkK1lHczd4ZTVId0tNN20vNVNDeDVzbnp6?=
 =?utf-8?Q?x0FFpKpb1cwu5cUEG8MvR2Htz64H9rICG+bxqZR?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6450a7-0bec-4f64-5b42-08d90082911b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 02:51:43.1924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcFrSx0Xq0K0MHaCYFOjaROXGOaHwRInn3ZW5jfgYL+EnbaO2qFk8alI7OcmoWVdXZtbkd2Jzx56CDgdprXDf/1VYCzY4iVyaTUi98L3bYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5466
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160022
X-Proofpoint-GUID: M79TlyoQeNGNXgRif8CVa9-GNznxYAUV
X-Proofpoint-ORIG-GUID: M79TlyoQeNGNXgRif8CVa9-GNznxYAUV
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 clxscore=1015 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104160022
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
Cc: linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-kernel@vger.kernel.org, Brian King <brking@linux.vnet.ibm.com>,
 brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 12 Apr 2021 18:10:09 -0600, Tyrel Datwyler wrote:

> This fixes an issue hitting the BUG_ON in ibmvfc_do_work. When
> going through a host action of IBMVFC_HOST_ACTION_RESET,
> we change the action to IBMVFC_HOST_ACTION_TGT_DEL,
> then drop the host lock, and reset the CRQ, which changes
> the host state to IBMVFC_NO_CRQ. If, prior to setting the
> host state to IBMVFC_NO_CRQ, ibmvfc_init_host is called,
> it can then end up changing the host action to IBMVFC_HOST_ACTION_INIT.
> If we then change the host state to IBMVFC_NO_CRQ, we will then
> hit the BUG_ON. This patch makes a couple of changes to avoid this.
> It leaves the host action to be IBMVFC_HOST_ACTION_RESET
> or IBMVFC_HOST_ACTION_REENABLE until after we drop the host
> lock and reset or reenable the CRQ. It also hardens the
> host state machine to ensure we cannot leave the reset / reenable
> state until we've finished processing the reset or reenable.

Applied to 5.13/scsi-queue, thanks!

[1/1] ibmvfc: Fix invalid state machine BUG_ON
      https://git.kernel.org/mkp/scsi/c/15cfef8623a4

-- 
Martin K. Petersen	Oracle Linux Engineering
