Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BB532CC0F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 06:38:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drfls4Y67z3cSq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 16:38:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=aKpibkcW;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=mi1poXP5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=aKpibkcW; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=mi1poXP5; dkim-atps=neutral
X-Greylist: delayed 4832 seconds by postgrey-1.36 at boromir;
 Thu, 04 Mar 2021 16:37:31 AEDT
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrflH5wmTz30Ny
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 16:37:30 +1100 (AEDT)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1243x9gn002035;
 Thu, 4 Mar 2021 04:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=SywWquSNTQkvOp0ahhdh7o3bMGlASpEQAN2IyItUwbg=;
 b=aKpibkcW5NADECwgIaAukRTGZRRGSsOkmMkcpPU+AfsUry61UDIpV12I/N6Wt9w2YaS8
 0G06cY45xuNzb0mNHXQDMULew6NPH1xikjfjc5S855QFeSKi2jXlfWeu91BpDoMYsQ9y
 MzEUVwLn0ldaSMwuWFNDGElmIyOawg3NsCzgohvuqNolAkhif4gyd2Mt5bqizqkhpeWG
 DC/tDl30EXHez9JkMZAg46sCo1LIn96MlBVWVn3j6o0L75xXJpulVBIAl2Ek7RohMkye
 pk8Tm9UG2vjbACrAPMtr7fSgcz2y/g1Z74BJx6TM8FQEg1PRQXUXKR2fIIqtocxwSVsC rg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 36ybkbdtwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Mar 2021 04:16:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1243t20O125591;
 Thu, 4 Mar 2021 04:16:49 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by userp3030.oracle.com with ESMTP id 370010a2ge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Mar 2021 04:16:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwx68XP9JfWxg2yTXOievMV411bSnWgDQBzK/kFIb1YznwCwJdKFeAcvtXAXbwoRb61FDq5XsHxfgCd8wrbv3Oc7Ma0MfasGwVE5XGZeM7lKdymMtbx3y+Wcd1DAI4u0uxKUYjCiYQizc/TI6vGns4j0ZUlTAaCu5Xfs11/J2Ldfa6vMA5OztncAGq/e0vtcXOcfHuU6/tG3VFMK8jX4Dt+0hj9W8RBIcGq0UlSL7YD1h2weGlG+CGwyI7mcvs/4Ek3cFIGxm14LsKbcVK8DzypCmbzgr991DIoUTXUZs7jfxIp4Mi5PLeMUFyixsyeNGYFb7kB9APrmXXEoWld11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SywWquSNTQkvOp0ahhdh7o3bMGlASpEQAN2IyItUwbg=;
 b=VYiBu3/8h0VSxVI7aXAlwDmZWV/hwvs4UQ4KtS1BEq16dWyH1y9uk6vZNHc8vAtNFQWHpePHTQBGc4adg8VdJeacaEE6OFfHiP6zixLmn/se7V2jjk24CSeGgtcAfV7uY71baHlJksDVx+/8G3/Td5ZQTaJnziAhVL15pTSQuoZN+jUiHSAQYoIGL18AVAT8yirqzqlTfnsEesA2C6m7la1xsYjPdh6aI5HKEF0VAJJ03fpGqa8ot5EMeziq/kcagzv4dTQxjEHkXH76u6NueR7RiXeAJnWGEws8ld8kEmzU4TP8UUj/pZg/tMZEavqdPjh91i2lachbq+PfNUo8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SywWquSNTQkvOp0ahhdh7o3bMGlASpEQAN2IyItUwbg=;
 b=mi1poXP54RDEWbNUnjv6sb5iOifj7N/nX/MDhtOW7txOhvBX/Z5tbXLYmTIBwm9z2DIIMkSf2L/eujY2B9AJVeSCVfk9soz+PI8tE8cqC7Mr0hbpmMrfSOHjXAdizR5eH0sIyz1a5xoAnUmo9u3RbH7455bb5erW0WRynuO1FvY=
Authentication-Results: hansenpartnership.com; dkim=none (message not signed)
 header.d=none; hansenpartnership.com;
 dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4552.namprd10.prod.outlook.com (2603:10b6:510:42::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 4 Mar
 2021 04:16:47 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::dc39:c9fa:7365:8c8e%5]) with mapi id 15.20.3912.018; Thu, 4 Mar 2021
 04:16:47 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: james.bottomley@hansenpartnership.com,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH v5 0/5] ibmvfc: hard reset fixes
Date: Wed,  3 Mar 2021 23:16:40 -0500
Message-Id: <161483137623.31239.17498888451553810306.b4-ty@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302230543.9905-1-tyreld@linux.ibm.com>
References: <20210302230543.9905-1-tyreld@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [138.3.200.9]
X-ClientProxiedBy: SJ0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::12) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.mkp.ca.oracle.com (138.3.200.9) by
 SJ0PR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:33b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.13 via Frontend
 Transport; Thu, 4 Mar 2021 04:16:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 050c8657-8f72-41cc-00b8-08d8dec453db
X-MS-TrafficTypeDiagnostic: PH0PR10MB4552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4552BB2E11BBF88842A33A318E979@PH0PR10MB4552.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Gu/B9d769tRUbKdGIVBF4j/YpfEf8XpguPTl4xF+hv79Q7NPYxwWiP2ikr5lsCisoHja38AHfhzJfoCT8SowZtMvggRFNR63gHqRmrqc/EA8lLgC+8HsWmoVfiIslrIpFlG2EJCOm9OxbyuG5W+KrLHARiHCpNzqyIHOiM0UajOh2QoQe+lkHa/y6V9o1xnDOY68NtU8BxsxgcqxDWpu99L6EHdCTqfqg1rQ47vGOp1deHuqmjDgyxGj/w6/THgl4vFjxsvi+7RQmk/CxyPKjMZTiGAq/Z2xLEObRjqxMWqXAauggBexd6lLY98obdOSKGraWCIzDvbPdJZF5u5T4URruZ4gFuB9HCCHh9hfzH6VnBY46/ZB6UAYgvDOwwIlDfQCUjrNJ1bQR3CVzsvVMkEB/LEuAVQgWWeirRzlxGLnuqSOgBShpuYgiMKrFVwtG52E2GbKfrc5Ez+roppCPsPIT5Pqm862mQEsvOROWsbP6qorwLgK/BiD4F1EkiUpmSL7N9QdN9Peahmv527npUsFe20/rdOVegnX9d/kH6CdGWvDxbJgvI7HvW3iwf8gokOFhTYw53FgYnS/qrTY7mTHVfsAZYUXeiy0JmGp8o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(366004)(346002)(376002)(26005)(66946007)(6666004)(16526019)(316002)(6486002)(66476007)(478600001)(966005)(7696005)(66556008)(86362001)(4744005)(2906002)(83380400001)(186003)(103116003)(956004)(2616005)(36756003)(8936002)(4326008)(6916009)(8676002)(52116002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z1YyVFl0Nlk1Sm4xQVdON0Z1T00yditpc3h4ZDA0NU5tMTBTNkRQWmhleDdl?=
 =?utf-8?B?RWcxQkIyNTBSY3IrSWgySkM3VXJOVTJTR1NiMmZHOFlPWHpJK3JUT01WeVNu?=
 =?utf-8?B?WS9Ed3dBb0NvS1doZDg3RzRuRVFneU1wdk8xaENzTTkzaGhTMFhtV0EvaEUy?=
 =?utf-8?B?alF1Y1lmTWtrek1MYnY5K3lzL250NFVsMTVoTGMydHdNYzV2cUgxNklPSEZ1?=
 =?utf-8?B?QVJHcXZNRWhWWXRjS2RON0h3QVNESndXOGJMVUhFYzNrRFZtYzdXbnVwdWZH?=
 =?utf-8?B?Z0k4THFmci9SNmpPMjA0d3UwSDZZbi9FL3JnQ0Exdll1UzVlVVlyQzFMVjZG?=
 =?utf-8?B?REViUmRqRE4vSjRLcnpVem5jZ1BraW9hcFRyZ0xqYW43NHJTVTBSMlBMSVRR?=
 =?utf-8?B?REtwNHZTc2ZydndjMm5LWmduMkVBSm9XMmd2V21SSWk0RFlIVWMwcmdjeTAy?=
 =?utf-8?B?MkFrOXMzV2VMOWNvdW8wbFNBTG1uYWt5a0NTN0dBYmh1NEZ2cmtObkVKVmpi?=
 =?utf-8?B?YW81VUdmVS9LOFE3dTZDM01Wb2pBaTRkYnFTdmR0R3RyWEoxV2ZldGdXdGZ6?=
 =?utf-8?B?QzBuWE83RXhMMStleTJ2dk9VSXZXNlJSbkZVc1g5MUh4bDh1OTVucDBwV2gy?=
 =?utf-8?B?R3d0UkR5Y01RYXpaQUJTV01Tb2tsM2lPblJ3Z3lQRURIc3FYbndYcEdKVWlM?=
 =?utf-8?B?Z0xORm0wWG5BK3pnVnJ1TVg0Si90RFNKRTYwY3JsR2JkZWtnQXk1R2MrVFdG?=
 =?utf-8?B?NTc4VW1COHgybWZBR3RSdEhKYmZHc2NRdEZsRFZ3MlRCM2dKK2hrOWN4OEJu?=
 =?utf-8?B?WmVJdnlzbWRYTXlJRzlsTWhPZVZ1RVkzaFFqWEM5NWFrOFJlSk96WWlNdUk3?=
 =?utf-8?B?ejI2aUxYRERWa0xUenJJcTE1Q0RHWWtYSGI4SlpIMVZoUEJ1ZnRHS1ZRUlhG?=
 =?utf-8?B?Q0RQajJWYmxTUGVvbU92RW9pRU0vTndYWFRVc0lwUmYvVmF2Z3pGc1Q5Um9h?=
 =?utf-8?B?NGErVzNqdDlKMmdBNnFxaUtsUEZ1QnNSVEpIY2VwSitJOWtaQlUyMi9ROVkr?=
 =?utf-8?B?bmh3eU1CaXB0MUlxQ1EvOHFRNHZCZThGZ0daMG5Tc0lRN2tHSS9UbW5yMldk?=
 =?utf-8?B?MzBoM1l1ZFo0S1ZFTGRGVnhQandPQ0IxU3ZJQ1pWSkJlQkV5dktlT1Q1WUFJ?=
 =?utf-8?B?WFlZSEg4WGNXc01iV21EQkxjRlE2SkI5WlFVeHlEd2ZVc0NUa25ROE9HaDhW?=
 =?utf-8?B?U1pDRmo5YUNRbnU1SWNJdUZBdW5xalVDd1NhUkw5NTZsUFpETWNiRDQ0SGli?=
 =?utf-8?B?T1AybXI5WjMzT2NBUkRBQlUzYjl6YWp4dTg5c0hRNis3QlM5VTV6OE93U1BD?=
 =?utf-8?B?UmVCVFlER2g0cjlnMXBpZmkrcnN2eDZnM2o3dndxanpMdEI2SzZSS3ZnTCtw?=
 =?utf-8?B?RzFaSTF5VVdTNEQ3N3IxSXhEVmRPK0xuZ3pqUXhVOVB3MW94TFF4RXBQbWhR?=
 =?utf-8?B?bU03SlhBNGlBKzFDcVQyVVN2bU9RQ0E4WFEzcnBzOFFzWDltUmp4RHp4aUxz?=
 =?utf-8?B?YlhHRXpJZ2tyWWRUQUxWY1BpbERKL3N3QVlGQ2JmZm9PajFCR2Rrc1kxbmVW?=
 =?utf-8?B?N0JGQk1aZ1hhQSt1ZTh1MGVJSXE5K0FoaEJjOWdTOHd1Qmd2bFhrQVljckQ3?=
 =?utf-8?B?WWVjb3E2bnZZVFdkSnRNL0xEK0VnS3hXK2tYSVJRclBPdU1ZVnU1bkIyRkFE?=
 =?utf-8?Q?YL5xYHkNnigGe87NSwjM2S8rQX50ZIP+ZqZhYth?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050c8657-8f72-41cc-00b8-08d8dec453db
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 04:16:47.6465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0KyoOPBdbADD5sm0+C6Tg1F48h9tFF8L8Ij5Gj32SIIMfQXp716bURAY6fBSfgsdgynPWJxLSq59aciF+WlCEnvnfkb0dmwWiOrD1hHZ6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4552
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9912
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103040014
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9912
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103040014
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

On Tue, 2 Mar 2021 17:05:38 -0600, Tyrel Datwyler wrote:

> This series contains a minor simplification of ibmvfc_init_sub_crqs() followed
> by a couple fixes for sub-CRQ handling which effect hard reset of the
> client/host adapter CRQ pair.
> 
> changes in v5:
> Patches 2-5: Corrected upstream commit ids for Fixes: tags
> 
> [...]

Applied to 5.12/scsi-fixes, thanks!

[1/5] ibmvfc: simplify handling of sub-CRQ initialization
      https://git.kernel.org/mkp/scsi/c/2e415356fd6f
[2/5] ibmvfc: fix invalid sub-CRQ handles after hard reset
      https://git.kernel.org/mkp/scsi/c/2de4c19179b1
[3/5] ibmvfc: treat H_CLOSED as success during sub-CRQ registration
      https://git.kernel.org/mkp/scsi/c/98cf9a92b8d6
[4/5] ibmvfc: store return code of H_FREE_SUB_CRQ during cleanup
      https://git.kernel.org/mkp/scsi/c/5bc26ea9498a
[5/5] ibmvfc: reinitialize sub-CRQs and perform channel enquiry after LPM
      https://git.kernel.org/mkp/scsi/c/f4c5e949056d

-- 
Martin K. Petersen	Oracle Linux Engineering
