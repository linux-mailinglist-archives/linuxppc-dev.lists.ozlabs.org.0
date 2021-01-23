Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A8530130B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jan 2021 05:26:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DN33c441tzDsRF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jan 2021 15:26:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=FCN7XtEd; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=BcMoYjSA; dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DN31h63mjzDrqJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jan 2021 15:24:40 +1100 (AEDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10N4ONUr066522;
 Sat, 23 Jan 2021 04:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=8nKXgeDBZe8C9QIc1ADgVn7S8VVUdCc7SIg20AflIuk=;
 b=FCN7XtEdBINf2/WKbWyyvDp673IeU5aFY6hVmGhAVUbsmn5uIIWNcdPB9jUH8Y/eb3Bk
 Yp0NYeal5QJLkCpKOdPidluwyzBmb8CRpEFp+7yqaZeDGdBZw/PxaunieV6N5MYr+kOF
 kM7HS9TzVR4Zoke5ZMyNFKzv4she4Vs2G9ztIiU+BQzTrUK7H/HdbQtGLmB6E2XQfsmC
 /y/LvZ4QV0RldAMcsB9U/59dT1w0DAZfZCtuZFMLQ3uTDtvIZ86mItveUnsN+PdCdK2i
 8vbwrUi6OblliTTVlm0gbYtxKUTZ/l5T0qRPLiWlgaroT6o+gzERJUPpXEUogfgXQXNs ew== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 368brk82yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 23 Jan 2021 04:24:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10N4KngR078352;
 Sat, 23 Jan 2021 04:22:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by aserp3030.oracle.com with ESMTP id 3689u8v0nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 23 Jan 2021 04:22:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbV8pp1DPN3mkaR1s2FcRODyEA3wmygDyy6OdTso6KIxkGHqYWWuh/WhGP+EekKc7s1kh5LKjGwyFcERcxeZgGPp/oYH1Cy7YlWsgc3o+25P226f9Mko1FTLkuGBEXhZg8VcXGL33i8mk5z2iy7XKsMmUqsN6gZrI+8uWTgO7c1S+lV6ffjEhhbced+1fXVsX4qVwNYPD5qumTKjx27Sbs+wIuraAsjLl9pYVohXOgwZFfojZH1uvf4TyQH49+ThrcGdlTeva6+BOV/jrXpTPhatpor/thYSNVloQa8P2CnYOxBiM/MedqMj/XmjgiE7rM84bAOaSBqTwt58y048Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nKXgeDBZe8C9QIc1ADgVn7S8VVUdCc7SIg20AflIuk=;
 b=OzLZFFLzAzTrUJ50vZ4WVDLVOQQm4cBGYrOYsNBt5h1D8yqZGhYzWBJyMM6GPLUW+r5CDTQom7WIr2/wpaxwvv0upVhya8/jExNKcxy0EQagfJ4MgnmKFAAKnFO9Sn/bs9KWMQla9T+Pu9p+K3cTdLsrpD1gQ7gx9LQuceyR03ijPQJPTbaGYKXmAWDITxRI4F7+uVtC5itgrOZTxwWMzWTRxmy00VHtvYa5a45o6CYS+x9GuR6lbRpZEHj54jjg8JBl4oigRpdHuLtMnOx9TQ8Dz49gpRpuWmQ4tN4Z28U29kkrz2JOb+7D4SuMQuBEInZrTftsEkQ2L6bHstx2Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nKXgeDBZe8C9QIc1ADgVn7S8VVUdCc7SIg20AflIuk=;
 b=BcMoYjSAlrgYDbxwIHup0/FDjjkjtLC+/iycJBhZBL3s9T1nYSegc6Ma1R6LyWCmX+lD3yzfUIYYUfavBLHdmjd36l+edARSv2oacb3bHNMRtx6xFDSPEoXbzMCEAkolkIhzoJsBPCOitDnOJyadPXu+KQnook2bGieIE79Txq0=
Authentication-Results: kernel.crashing.org; dkim=none (message not signed)
 header.d=none;kernel.crashing.org; dmarc=none action=none
 header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4439.namprd10.prod.outlook.com (2603:10b6:510:41::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Sat, 23 Jan
 2021 04:22:20 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::54f3:a8aa:a2cd:a3a4]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::54f3:a8aa:a2cd:a3a4%5]) with mapi id 15.20.3784.016; Sat, 23 Jan 2021
 04:22:20 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Colin King <colin.king@canonical.com>, linux-scsi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH][next] scsi: ibmvfc: Fix spelling mistake "succeded" ->
 "succeeded"
Date: Fri, 22 Jan 2021 23:22:05 -0500
Message-Id: <161136635066.28733.17649415088814618744.b4-ty@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118111346.70798-1-colin.king@canonical.com>
References: <20210118111346.70798-1-colin.king@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [138.3.200.9]
X-ClientProxiedBy: DM5PR12CA0019.namprd12.prod.outlook.com (2603:10b6:4:1::29)
 To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.200.9) by
 DM5PR12CA0019.namprd12.prod.outlook.com (2603:10b6:4:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.14 via Frontend Transport; Sat, 23 Jan 2021 04:22:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa816512-f9c5-4f59-5663-08d8bf567974
X-MS-TrafficTypeDiagnostic: PH0PR10MB4439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB44393A885CF9F8B5BAD0C3C78EBF9@PH0PR10MB4439.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BsEziW+sRQ8KQ9cOVhdRwCho1G5ZmkDLuucAfXd2x9DInhHb5Fz9v9uilVj/bK2ny3+ye63A40P+hR2vBRQdF3CdbrLgBtgFYGdPwmd541oIY3zdXOmHCA4o47u2ZegB5kH7mJ1N61EIVKJX7koq8SdQBEYwJaWPb0oHlYHJGGM6Lzk3gx2c/eMBMeONc82xkq136/aC6sAsUQOmYENgxDjUiy6V1WpdBO8ZIaaR2wK7cf5BnpJGLi5fvdnoe4kjH9QkmM63j5BE6p3boKLFUIzNniDE+cgcbsN21rLvuSS6dRJmb9Ce7A7j6cWOw82+c5tK9Z4wtiDxokmDGZIhUq7cppWijTKNd6u18hocYH+RSvo+HMzS3WfwE/3At0q59MCnGezzgaOKQ/jfkJY7g9JTSu96DUQjtd+ORisNzxiWSZyeE2tJBAYhbOI6FsfiojD0BLBgncTMNinPTj01VA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(136003)(376002)(346002)(52116002)(6486002)(110136005)(7696005)(2616005)(186003)(316002)(4326008)(5660300002)(8676002)(478600001)(956004)(16526019)(4744005)(86362001)(103116003)(966005)(83380400001)(66946007)(2906002)(66556008)(26005)(8936002)(7416002)(66476007)(36756003)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MmpTVWVaUWpGZVc5TFNxZjJWMnhwem1yUnE1V2ZEWHBOcmk3Y09jeUFGcUJP?=
 =?utf-8?B?T1ZBeG82Nmlzd3VTUDVZWkZic0ttQnY0MVNNb2NMOEgvS0docjFNbDZqM0VW?=
 =?utf-8?B?OFczUmd5Z200cDFublU4eXJ2aTNEZEJGNGlEdzkydVlISmZtRzFtSnBvaFBL?=
 =?utf-8?B?WlJEYXRTc25TOTlIekJ1bmpjUlRDNHJKVHJTQlg2c2hpTVhQRXRFT0NLbm5M?=
 =?utf-8?B?TmdmcHZhTm5HclFQTTloc3NON2RPME8rWkFJTTNUZ0cwS2JDUnpoaVdnT1dS?=
 =?utf-8?B?YU5wNXAwKzluZXBYTlNqZWxITExvdnhMQm5ZS001VEI2VjBDSWd6R2o3UnR2?=
 =?utf-8?B?UzhuNmVYd2N6WVhya29ib2g0ZFVTYVlVTU14S0Y4K3lHY1FwalFpeUI3K0lU?=
 =?utf-8?B?QnhRYm9sOFJqZkVTN0plbEorb0cvZ3hTK3VjOGlCTG5laE5jQW5hdkJPcDJw?=
 =?utf-8?B?Wi9xdS9YL2xKZ1IrTzhCVXFnSnFCWm9kV0ZsejBCdmtiNk9SSjdUWGlqWmo5?=
 =?utf-8?B?ZFp4TDJ5SWtRVkhlcWxrQVV0cTZWODR5V1VCbTFacnArd0xWL3RIc1dIdjEx?=
 =?utf-8?B?dFdndFdqYzRLY3cxSnBuSXlwK2FXUVVkclQ4c1FaeFRVT0V2T3FVMlFsa2dJ?=
 =?utf-8?B?UnpLblN1dWRUejdubEQvZ3FLemxzMkZRM0luYzN0YkR6NE1ZWHp2d3M5a25p?=
 =?utf-8?B?UFl0MDdGbi9lRTJrY1k3MTZ4NWZyRmYxYmlodTJ4blJheGRHY2xwL0pqUkgv?=
 =?utf-8?B?ZFlWdUFhVTBZakJWQWZRaW5pWHdIV050N1NndXQ3SzZ0WEFhZzhBZkF4V2NW?=
 =?utf-8?B?b25LR0ZDNDFyWlBsWlZUUWpWclJsWjArRVkvNENEWTFiN2xhUXNsNmthaWxw?=
 =?utf-8?B?UkNrN1JPZGcyaXQ2YVVXdlJTa1pnellOSmxmSS94S1B3Q0JNN20zNFNDTy9M?=
 =?utf-8?B?QXMvSkQxZzFOa3Y2NHlZeGRwdWRibHA4dkhuQ1pWL0puNnlaTlFXWUJQVlF2?=
 =?utf-8?B?TjRFMU04SXlVU0FwQWRuTDZ3RTN2YUhmSVNxREdrQjdvOWgxTEt6VXBodG1O?=
 =?utf-8?B?SE9ZSm00aWpjQnd5eWFQTW8zY0hJRC81ajZzT3g1RnM0VkJwQUcxNHdvY21s?=
 =?utf-8?B?ZG90Zjd1dzc3TDl5dWw4RUlmck1mRVowaStONklCMEllMzNJNHV1dWEwbkE2?=
 =?utf-8?B?ZllPdHIzNDF0c0NKcTBZUUdnamtIeTN5eG0rQzJsNjdzRlRVLzZSbWJxdkVx?=
 =?utf-8?B?Vkp2TTJKNVlZZUhHVTV2RHlIaGljUHNHQ0U4SkMwVklTRHRwbnNoK3ZLYnFY?=
 =?utf-8?B?WmZ2dDZlVUk5MWpLbXZzMzR2RW9EVUlHak45Mk0wRWRQRXFueFQzS09mbjUx?=
 =?utf-8?B?aGozemMyd1l1Y3lpL2ZHTGtJWXh6dHQ2TzdKeUFZck9mU3hBZnFqUGwxVVNp?=
 =?utf-8?Q?hQLeRymm?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa816512-f9c5-4f59-5663-08d8bf567974
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2021 04:22:20.0985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAkSBLhAvPZM1Fv1p9DOWoXy19wWyULq1FAcYu4J7U6vUGwm15hlT+3CVfXv7FncLRSKFfPGB3EgoMlm4Y8qHrzU9D1SWCnEI1feyFWzhJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4439
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101230022
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101230022
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 18 Jan 2021 11:13:46 +0000, Colin King wrote:

> There is a spelling mistake in a ibmvfc_dbg debug message. Fix it.

Applied to 5.12/scsi-queue, thanks!

[1/1] scsi: ibmvfc: Fix spelling mistake "succeded" -> "succeeded"
      https://git.kernel.org/mkp/scsi/c/ff79acc49af8

-- 
Martin K. Petersen	Oracle Linux Engineering
