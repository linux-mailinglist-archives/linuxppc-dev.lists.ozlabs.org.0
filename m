Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EE3480374
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 19:50:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JN6Dl3crfz2yn3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 05:50:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=Y8u4p/Eo;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ONo5LASM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=william.kucharski@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=Y8u4p/Eo; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=ONo5LASM; dkim-atps=neutral
X-Greylist: delayed 4389 seconds by postgrey-1.36 at boromir;
 Tue, 28 Dec 2021 05:49:49 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JN6Cx6tGCz2xBJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 05:49:43 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGBu2M028204; 
 Mon, 27 Dec 2021 17:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=kPaqcnn/Ooh1nfOfX3gR5HA/HOIlXxXxICpUZxBAsqE=;
 b=Y8u4p/Eo3QNNDt8ORI+AqEMfq8ZeIP5Lrioj8Yb/RapSOSOXkhfPYXaO4AIcmhJTVKe0
 yhqmLKse0VXSZQXIXL8MNrdIbY2azc9JczHOn667egN4acp+GsX45SbJvoOGhNM37KOn
 ZI3L1vIyHKXueh79p/BwdUIAoNeRIg6HisXn+QBtuTQmbDRU19W8tBdtmKMA007SK/Dz
 r/nlN7uny2abimupZKQe8lnzRpBxDmW2eRD+Z1bbmpo9p0Vi87SL/149phEzqMaLa5J7
 w6OoC0PDlBc7Vy2Dj90VqOS14/gWbUh18B0qaD7tujQKzVv0czd/3knud8PoeOiLHw8k xg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d7gt2r455-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 17:35:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BRHVBU0065034;
 Mon, 27 Dec 2021 17:35:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by aserp3020.oracle.com with ESMTP id 3d5u42xmr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 17:35:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2boxHk4XL86CaPPseTqOrsWPJkGG5ohCofKuZWLxWj6AKs8lHFd9hf2Qfuicz7C79RluwBRrUepvaf4duFLB66NfNK7HyY0yizTsjiapHC8jD2rHkBsbcwfExMPhrgrtw9JHCNVwt1OgdQnKVxOaTawa3CDDf4jp/CdmedvDRZmnuouHuRMm4fkO60St1lyL/HsUVBRRWUZWmmdlH5pJcV5syseTM51t9lFgZEF8fDw44DDpQWZSyOR974NaZui7f4uCi0MS+5Lkx2aqrS/J6GkxYbeYVKF4NvNidukeFVYY57iMw3GyrLCttjN+q+YmP3zLk8nIlyeKBAEslyAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPaqcnn/Ooh1nfOfX3gR5HA/HOIlXxXxICpUZxBAsqE=;
 b=T+YhOAEzFqSnkT21i08fkzcXB1b198PJ1bzJBBc1F9UDEkF9HFxy6fX7hPkiwKPuXx16OsYMOTI3ZXRDhwENTLHcw6/psRGWXSfXUu/sUsu6of9zHukvYZ7UG8w6OCfUAEUGhxE1AL2U6fS6nwHG4QG6LaDCDAYJx7e5Wmjc+ku2NQHAyjLkqgjpQ+hwkudkt7l2Xs28AJ4UGq+gmxrbyAGEBi3e6l/2ljvGO25zvc9lk3SZk9XnNdQizTL/ofg21UuCZAqAM7Ke120PEYRbRtsDRa9zXj6dwzyzvYwBL4ervCU9c8xeJoUGDJ3Ki6O7TUAbXGDl7BsS2xL/ch65mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPaqcnn/Ooh1nfOfX3gR5HA/HOIlXxXxICpUZxBAsqE=;
 b=ONo5LASMpFLMKxSdkixnaA2bpBTkjePiYv8uAYvzpjZoue2+AE+BP8h/z+xH4rrLS16a15IlZEnYIYdxsHPYn+lShG0DUUR87S9ejCKwegPo4AgfGOSl/u+dij4Ih432OXz44tjTz1l57/bSU3y4FBlJ0EDSNSjE9ajlqyvJHtU=
Received: from SN4PR10MB5559.namprd10.prod.outlook.com (2603:10b6:806:202::16)
 by SA2PR10MB4620.namprd10.prod.outlook.com (2603:10b6:806:fb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Mon, 27 Dec
 2021 17:35:37 +0000
Received: from SN4PR10MB5559.namprd10.prod.outlook.com
 ([fe80::7514:eec6:460d:a074]) by SN4PR10MB5559.namprd10.prod.outlook.com
 ([fe80::7514:eec6:460d:a074%5]) with mapi id 15.20.4823.023; Mon, 27 Dec 2021
 17:35:37 +0000
From: William Kucharski <william.kucharski@oracle.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: (No subject)
Thread-Topic: (No subject)
Thread-Index: AQHX+0gougPWnPQ+60WxMtWyvH/wBQ==
Date: Mon, 27 Dec 2021 17:35:37 +0000
Message-ID: <E2C9DE8E-F5D9-46E9-9298-B632A202B080@oracle.com>
References: <20211227145903.187152-3-wangkefeng.wang@huawei.com>
In-Reply-To: <20211227145903.187152-3-wangkefeng.wang@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 249ad28f-0fa1-40ce-80c2-08d9c95f4b8c
x-ms-traffictypediagnostic: SA2PR10MB4620:EE_
x-microsoft-antispam-prvs: <SA2PR10MB462043D4BA7ED544923A2F6D81429@SA2PR10MB4620.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hmAF40wLdVkwLH0B5M3hKC7pVWhpsktLBcxrlJVFPUL2vI5Lb6JrecnJwdAPCwyTzz6XGDNkwDPARazclsXqy7b9xHFUgq42ZCu960DNCdPV6hHGjI3EwLXZgJy6mDgJwBkb+x+Gv+paZX2njMONgNekyc6NFdGfSOkQG7djVfd1nMJp+udG0gAglaTQxGvsQu9hPwFGaYPMEkIe6Eh9+UfZ46Ppn6O6PprR4p7DGORjf9QU5Uhp+W3rzzjwlYV8mPjVau+B/gSjwDpQTzNOGqPH1zA/b0ISX6a564kNCO2SGlkg4leDtKjfuUOFTaJdPi1fPbp4xJlAy0aBl6gikROcz6QUGAVLljThIE5UGnqFEyDYNSKwX8Y/4r8D7qXABK1dUGvrCyKK8utYsDO0j9UIQQZG0gd8Iq1ckDzpiM6h70NHbpp3Cffzw17sEsyuCbwYQ01w8GASpJmMkF7Z3VMYZfhY/O+NLHMjppHy3Xm5EtyzvXJtYvyRkriY//0szdN9zVr58PGf1wNBiHbhThiU1Ss0j+QVx/WRsu7cfpXNlvV/7xzOhesbDGqIDj83JKi4P0Jzb2VqWtWlqED6wbNBVjh+5mE696nc5tDHclr1YtUAlVBXX43i4O4HAALeLsSzh1iPzx1VLDrv6aMBizi585jzHwzgtD6J0EhylkdhaDgSic7bUGiRIFAVtWE0N8Dh5OtkuVrtsncnSTJayvIfnb+agHjkg0pRqQG8Q+0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR10MB5559.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(44832011)(2906002)(2616005)(66946007)(36756003)(5660300002)(66556008)(66446008)(91956017)(76116006)(64756008)(66476007)(6506007)(8936002)(38100700002)(83380400001)(4326008)(122000001)(186003)(53546011)(7416002)(33656002)(6916009)(508600001)(86362001)(71200400001)(54906003)(316002)(8676002)(6512007)(6486002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEdzVzV2TGd0ZTFkdzcxQnNnVzlTaTRJcG91ZXFuaXUrZEhEdDNwai9vakFy?=
 =?utf-8?B?S211bXcvZElNeEw5MXNJd2pHekVKNFg4RUJSNS9FbWVZWXFJM3ppUDF2NGQ1?=
 =?utf-8?B?RzExL2tkWHZ0bGxQNkFuOEtma0pxaW1zdWdvN2RHWnRFbUJFVVptU0dvN3BU?=
 =?utf-8?B?RU1mMFFySStHRTJoR1hOanFVRlc5MnpNQXVnZzQ1dVc3K0dTQkdGeHRxYmtI?=
 =?utf-8?B?NlhRS1gzRVpzalYyWkZBaW4rN2pUZS9wWXRLM0pQN3BRRGZqZzdFUWwxY1l2?=
 =?utf-8?B?VkNQa1c4T2puR09ZRlRvcjlQLzZ3VHppVnlHMGo2b0ZVOFJRVlF2SXg0MXFL?=
 =?utf-8?B?MzcwRzdTQk9vK1duUWg4ODNDVjFqZTFCWnRuMmtUYlVTUnRqbmNIeVF2Sm9V?=
 =?utf-8?B?bkJGc3EvSmVSVTc0d2kvVk15dGlyb1p0NDFCVERmZnhJOUNwWWpXUnVpd0U3?=
 =?utf-8?B?dy9aSU43dmI0ZGhURFkrUmNjVlFIVzU0bGdpY0poVkFWbjNZZnlScFFpUWx3?=
 =?utf-8?B?MmRTOXNKWlVpMk80M1V2RE05eDlnTU5JYy9rOUZVL0hMOW5JMldQR2dpUEJM?=
 =?utf-8?B?RUN1Y0dwR1ZBQVhHNE9CVFh6VW14R3FTbGpNOXgveXh2V0szZVhNWlV3WnVH?=
 =?utf-8?B?by81Y1Nld2xkclBkTll4TWNMTFR6VlNoMHo5Vjh4a29kQTdhNmhmclc2V1hx?=
 =?utf-8?B?M3FBMDZJNjBRd1BUdVBGWHR3aUViZWFTSkE1dW1xTkMxd2dlNVdJQTZnbURH?=
 =?utf-8?B?RW0xaEp0RDYvRGpqYm9KRm9WbGczQngyYWY2NjBjQkNPU2xIeXZiMEtUUktY?=
 =?utf-8?B?aTV4bUM2K0xBTHhrcTl3YlRTQkpsWXBIbVpzQmY3VEE2cGxKN1NPdTF2WlpL?=
 =?utf-8?B?MU1wdUh0UlVESVJWWnBtSEdIR0cxTHN3YnIyNnVCOFROY3JpcDdiaVZTR2VK?=
 =?utf-8?B?alRzZHcrZXlNaWljaWkrTjIrMis0TzdSeGsvQ1B2TUlRbnVROFdxVHE4YzND?=
 =?utf-8?B?YmVhc0hvdkpGcjAwSkc3NGZlTXVLTDhUQTlXbVE1cnBqemxxVlBPU0tUZkV0?=
 =?utf-8?B?dXRYcmJaWkpqTTNIeGVBbzBVaWdhZ2tITWJNeW1sekJ5dWI4aDlMS2EvVVph?=
 =?utf-8?B?QlM3RldKTUFtMUFMbEU3SkV5OGFkdFY2UmtVTHpBRkExQTJRZFpKWFRVU08y?=
 =?utf-8?B?MzlteWMrcUxPTXlpQkNxTXFnT0RlZEtXSy8vOUpLL0VJcHdIUDJrSkh4M3Mw?=
 =?utf-8?B?MFlFS1VhenB3RWYrRlJaVFZJSmRPK2x3QXFnZGdRR3huZG8yMWFuWWEwTEdv?=
 =?utf-8?B?NEhYUnhRNWFPd25QWE9OZ0FIT2FOSm9Ddy84dHc5WFZMdEVEMkZGYlFwZWVp?=
 =?utf-8?B?RlRya0FDOTNqWGQzYmoxMUIyNXpZSFZTZXlVWDgzRzNyRnVpcTRqYmgxR1RR?=
 =?utf-8?B?d3pWRGh6aDlTOTFjY1pBa1htWWRqNnY5dVl2UDBYS0x4K0hJcDlkakQ5eC9G?=
 =?utf-8?B?Sk5NUEV4WGZDeDhENHhTVHBhZ1dTbmZBM0U3OEo4TXNOSzdjN3o5OE4reWxC?=
 =?utf-8?B?ZFJIdVVZdTE5aUdaUXRGdjh1UGVsVXZSRTJra0dqbkVMS21OQ1VsQlNQd0pD?=
 =?utf-8?B?UlF6Z2Z5d1A1VWdnVEJoSm92WXR1WFJvYVNzc09tQ3UranNyREY3dnM0V01z?=
 =?utf-8?B?amgwNisrTEpyay9ORjJ1bHZYeXA3Mk40TXBGcC9QZzF3dzNXbENlVGYrZURM?=
 =?utf-8?B?V2o0TldNNnlMSTVleGxlckJEZTFnenp2RTgxWVJ6eVd1TDhheE1PZnc2S3Zh?=
 =?utf-8?B?b2J4aUZVQnNTKytYWFN6OE9aZytqLzJqOVpaNTNoU1dLMGhxYW9laFU1NHBk?=
 =?utf-8?B?R05hWTRyUVZvR21QWTBjbU5XU1ErNXYvZ3Vib1pQNkpTUUlxY01oV2lOOGlG?=
 =?utf-8?B?czJQUk04WVZpWDVRNlFFb1JObGl4N3RQVHJrMGFJSUhSZzI2M0FsVlpGbkpQ?=
 =?utf-8?B?b21IMFRVSHl2cTBESnV1bGRwRno2bWIrcVVqbmVzSWpZWlNvdU1jNXhXYXY1?=
 =?utf-8?B?Q0V3cGdRVU9vVjBKUXRVSGxxZnRNQ0xvYzREU2Y4UjVxODRRc2tRdFRDTEdk?=
 =?utf-8?B?SmFsTGNzclRIVk5xUUNGK05ka1cwR1pRSHZJSHFwakZ2UmpqKzVzSkI0RHA3?=
 =?utf-8?B?OGl4UTBEc3R2dGRXTnNLZUFkV0pXYmNWUE9yNmVRVTJRUWF0S3VGUkJjQ0xs?=
 =?utf-8?B?QnRzanNKWk1yNnFUQVNXNGNPOWRjNFBGdE9TL2lGMnlIN3hWMVBvb0tvR1VI?=
 =?utf-8?B?bVVGVGs5U0U1NVhjTjNESzhkalFWTmU3MElGOGxhOFFDNzVuMm9CQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6622DB8763D9724F9D5711FC9E18AD9A@oracle.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR10MB5559.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249ad28f-0fa1-40ce-80c2-08d9c95f4b8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2021 17:35:37.4996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0cglvjwWoGHa7ZWA9iT29GkHxj4W9oIAqIIM+Ld/tXg6bpNHe+LiHYRbZlVbKgCU8osT7KWhPzvaQC4OS+iHLqTnyfq+GuJXF32wE3eF+9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4620
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10210
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112270085
X-Proofpoint-GUID: mxXtanX02KqtiNSVk0nC-ApHIptQ-aMo
X-Proofpoint-ORIG-GUID: mxXtanX02KqtiNSVk0nC-ApHIptQ-aMo
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
Cc: "x86@kernel.org" <x86@kernel.org>, Will Deacon <will@kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

WW91IHNob3VsZCBhbHNvIGZpeCB0aGUgZXhpc3RpbmcgdHlwbyBpbiB0aGUgZG9jdW1lbnRhdGlv
biAoaW5saW5lKToNCg0KPiBPbiBEZWMgMjcsIDIwMjEsIGF0IDA3OjQ5LCBLZWZlbmcgV2FuZyA8
d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+IHdyb3RlOg0KPiANCj4g77u/VGhpcyBwYXRjaCBz
ZWxlY3QgSEFWRV9BUkNIX0hVR0VfVk1BTExPQyB0byBsZXQgYXJtNjQgc3VwcG9ydCBodWdlDQo+
IHZtYWxsb2MgbWFwcGluZ3MuDQo+IA0KPiBDYzogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1h
cmluYXNAYXJtLmNvbT4NCj4gQ2M6IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+DQo+IFNp
Z25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4NCj4g
LS0tDQo+IERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IHwg
NCArKy0tDQo+IGFyY2gvYXJtNjQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMSArDQo+IGFyY2gvYXJtNjQva2VybmVsL21vZHVsZS5jICAgICAgICAgICAgICAgICAgICAg
IHwgNSArKystLQ0KPiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5l
bC1wYXJhbWV0ZXJzLnR4dCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFt
ZXRlcnMudHh0DQo+IGluZGV4IDdiMmY5MDBmZDI0My4uZTNmOWZkN2VjMTA2IDEwMDY0NA0KPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPiBA
QCAtMTYzOSw3ICsxNjM5LDcgQEANCj4gICAgICAgICAgICBwcmVjZWRlbmNlIG92ZXIgbWVtb3J5
X2hvdHBsdWcubWVtbWFwX29uX21lbW9yeS4NCj4gDQo+IA0KPiAtICAgIGh1Z2V2bWFsbG9jPSAg
ICBbUFBDXSBSZWd1aXJlcyBDT05GSUdfSEFWRV9BUkNIX0hVR0VfVk1BTExPQw0KPiArICAgIGh1
Z2V2bWFsbG9jPSAgICBbS05MLFBQQyxBUk02NF0gUmVndWlyZXMgQ09ORklHX0hBVkVfQVJDSF9I
VUdFX1ZNQUxMT0MNCj4gICAgICAgICAgICBGb3JtYXQ6IHsgb24gfCBvZmYgfQ0KPiAgICAgICAg
ICAgIERlZmF1bHQgc2V0IGJ5IENPTkZJR19IVUdFX1ZNQUxMT0NfREVGQVVMVF9FTkFCTEVELg0K
DQoiUmVndWlyZXMiIHNob3VsZCBiZSAiUmVxdWlyZXMuIiANCg0KPiANCj4gQEAgLTM0MjQsNyAr
MzQyNCw3IEBADQo+IA0KPiAgICBub2h1Z2Vpb21hcCAgICBbS05MLFg4NixQUEMsQVJNNjRdIERp
c2FibGUga2VybmVsIGh1Z2UgSS9PIG1hcHBpbmdzLg0KPiANCj4gLSAgICBub2h1Z2V2bWFsbG9j
ICAgIFtQUENdIERpc2FibGUga2VybmVsIGh1Z2Ugdm1hbGxvYyBtYXBwaW5ncy4NCj4gKyAgICBu
b2h1Z2V2bWFsbG9jICAgIFtLTkwsUFBDLEFSTTY0XSBEaXNhYmxlIGtlcm5lbCBodWdlIHZtYWxs
b2MgbWFwcGluZ3MuDQo+IA0KPiAgICBub3NtdCAgICAgICAgW0tOTCxTMzkwXSBEaXNhYmxlIHN5
bW1ldHJpYyBtdWx0aXRocmVhZGluZyAoU01UKS4NCj4gICAgICAgICAgICBFcXVpdmFsZW50IHRv
IHNtdD0xLg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9LY29uZmlnIGIvYXJjaC9hcm02NC9L
Y29uZmlnDQo+IGluZGV4IDNiYjBiNjcyOTJiNS4uYzM0YmJiNDQ4MmIwIDEwMDY0NA0KPiAtLS0g
YS9hcmNoL2FybTY0L0tjb25maWcNCj4gKysrIGIvYXJjaC9hcm02NC9LY29uZmlnDQo+IEBAIC0x
NDIsNiArMTQyLDcgQEAgY29uZmlnIEFSTTY0DQo+ICAgIHNlbGVjdCBIQVZFX0FSQ0hfQVVESVRT
WVNDQUxMDQo+ICAgIHNlbGVjdCBIQVZFX0FSQ0hfQklUUkVWRVJTRQ0KPiAgICBzZWxlY3QgSEFW
RV9BUkNIX0NPTVBJTEVSX0gNCj4gKyAgICBzZWxlY3QgSEFWRV9BUkNIX0hVR0VfVk1BTExPQw0K
PiAgICBzZWxlY3QgSEFWRV9BUkNIX0hVR0VfVk1BUA0KPiAgICBzZWxlY3QgSEFWRV9BUkNIX0pV
TVBfTEFCRUwNCj4gICAgc2VsZWN0IEhBVkVfQVJDSF9KVU1QX0xBQkVMX1JFTEFUSVZFDQo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9tb2R1bGUuYyBiL2FyY2gvYXJtNjQva2VybmVs
L21vZHVsZS5jDQo+IGluZGV4IDMwOWEyNzU1M2M4Ny4uYWY3YjRjYmFjZTJiIDEwMDY0NA0KPiAt
LS0gYS9hcmNoL2FybTY0L2tlcm5lbC9tb2R1bGUuYw0KPiArKysgYi9hcmNoL2FybTY0L2tlcm5l
bC9tb2R1bGUuYw0KPiBAQCAtMzYsNyArMzYsOCBAQCB2b2lkICptb2R1bGVfYWxsb2ModW5zaWdu
ZWQgbG9uZyBzaXplKQ0KPiAgICAgICAgbW9kdWxlX2FsbG9jX2VuZCA9IE1PRFVMRVNfRU5EOw0K
PiANCj4gICAgcCA9IF9fdm1hbGxvY19ub2RlX3JhbmdlKHNpemUsIE1PRFVMRV9BTElHTiwgbW9k
dWxlX2FsbG9jX2Jhc2UsDQo+IC0gICAgICAgICAgICAgICAgbW9kdWxlX2FsbG9jX2VuZCwgZ2Zw
X21hc2ssIFBBR0VfS0VSTkVMLCBWTV9ERUZFUl9LTUVNTEVBSywNCj4gKyAgICAgICAgICAgICAg
ICBtb2R1bGVfYWxsb2NfZW5kLCBnZnBfbWFzaywgUEFHRV9LRVJORUwsDQo+ICsgICAgICAgICAg
ICAgICAgVk1fREVGRVJfS01FTUxFQUsgfCBWTV9OT19IVUdFX1ZNQVAsDQo+ICAgICAgICAgICAg
ICAgIE5VTUFfTk9fTk9ERSwgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApKTsNCj4gDQo+ICAg
IGlmICghcCAmJiBJU19FTkFCTEVEKENPTkZJR19BUk02NF9NT0RVTEVfUExUUykgJiYNCj4gQEAg
LTU1LDcgKzU2LDcgQEAgdm9pZCAqbW9kdWxlX2FsbG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSkNCj4g
ICAgICAgICAqLw0KPiAgICAgICAgcCA9IF9fdm1hbGxvY19ub2RlX3JhbmdlKHNpemUsIE1PRFVM
RV9BTElHTiwgbW9kdWxlX2FsbG9jX2Jhc2UsDQo+ICAgICAgICAgICAgICAgIG1vZHVsZV9hbGxv
Y19iYXNlICsgU1pfMkcsIEdGUF9LRVJORUwsDQo+IC0gICAgICAgICAgICAgICAgUEFHRV9LRVJO
RUwsIDAsIE5VTUFfTk9fTk9ERSwNCj4gKyAgICAgICAgICAgICAgICBQQUdFX0tFUk5FTCwgVk1f
Tk9fSFVHRV9WTUFQLCBOVU1BX05PX05PREUsDQo+ICAgICAgICAgICAgICAgIF9fYnVpbHRpbl9y
ZXR1cm5fYWRkcmVzcygwKSk7DQo+IA0KPiAgICBpZiAocCAmJiAoa2FzYW5fbW9kdWxlX2FsbG9j
KHAsIHNpemUsIGdmcF9tYXNrKSA8IDApKSB7DQo+IC0tIA0KPiAyLjI2LjINCj4gDQo+IA0K
