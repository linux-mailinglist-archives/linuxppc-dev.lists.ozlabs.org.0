Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517AE4C3332
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 18:08:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4KB73sChz3bcn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 04:08:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=BSO7Y07j;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WIDO5I5O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=boris.ostrovsky@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2021-07-09 header.b=BSO7Y07j; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=WIDO5I5O; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4K9L2DLFz2xKJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 04:07:59 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OFWY9S007293; 
 Thu, 24 Feb 2022 17:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=+nO2rVtfBk9wR3DMR04tVAteK2MA3ZuQ7oyViyDcIDI=;
 b=BSO7Y07jUq+hOiswwyQjaNk0Rf4Qem25r1XSYc06GKiF7kkMoALbP4o+BzutS40I69Fd
 8ihLbse+7W6v+nkMuxEk5EqVL/Pno1ymI6GT5qmk5Ob9vZgkC9AKwRgMHRXHVoMtFmHK
 ihA/qxSIp0rlilQBALJ7QMP5bZdRZL7qx9jl/pOEx1Z5kLC2CPnT67dZ8ZhRqY8fcUDT
 bjKoQMfUIGO/eTaQCX86n2pdK4QvHcc5rTi5WWAMH7oZ3UqGJrWG2LJQAijkDfkA9BKI
 pYO+eQkmihWGBUpc0fFzcEas/9JcL2MR4udgrkD3tS+Dva2Jlrz+dMOHgnJVVJ9495GO xQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ectsx81m3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 17:07:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21OGuuWh068779;
 Thu, 24 Feb 2022 17:07:40 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by userp3020.oracle.com with ESMTP id 3eat0r21w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 17:07:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7HTRI2p8jGmYKYKwfRH3F6dgPGyUlDb3C3/CIX5pPDnFgjAis12c4DbJkwVeWYeR5R/WsHrDeCjU63WVOFatjlWeRVrb5dg992LmyR+SEZcH/fAtDXLxnbwX0C8LhyJjJmywT9479U6gP/TMucv+U8HwPAmSP/JMPY6ir+Hzo8eHLDwXOZOLsriKR9yEppz2W13dIAY+vUPZ/OvHXNjLrsZySst/DBWyCVgV1wk393K7+BmP1gTcooDbJPJJvwV+RNRWAea+a1wlOeuoGxYVabU7vj88rnwpIE07e/n6uEMBRtsAkETHgnJ/xqajCv5dlaGaRdhYiSy0pCm2ompBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nO2rVtfBk9wR3DMR04tVAteK2MA3ZuQ7oyViyDcIDI=;
 b=eJ7UjF9fYf6MYMcev9J0D1H2opwgPKQpkRqYjZYovyj0aqwDVNL2CLBn+WqkHA6/solgKLQrxZ9fqZ8WAsqEdgCux9FgVNF4Wsqb93eWI73B1L8rjvNKxpVxUIjJqAFatLNtal64BYDRNOW4Jv4E0sOGnahS6NKDAYlcDBTnaU2oqdwRmDxY5rFe7HvRaGGRioxeHR946y9Phmwcd7UufMbX25j2eKYTfYCXfxcbC0KFjqCxSqmGvSHDAIu3tt+/ZV1tPro8vzJ95X4G2YLFJUxm67sh8CUL0kqkdbkODM7gRw1E34z3se3s+wGz+NIsBxjfQRau6+d62OWE6OXd8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nO2rVtfBk9wR3DMR04tVAteK2MA3ZuQ7oyViyDcIDI=;
 b=WIDO5I5Oi1Atd6Raf3i6egZhe1p19jRmqLMdnPz5HcDZum3+eXSmPCsKvQZ/S5fNgdDgotue79Q9tBCsB0dD6aDeUp053r1fh6Zijm7kiFydEG06zCveIGtO4kQDUL5Hx3BMC8XH84cuiSndsLW48qtLTj0slqmZTt8NDqnHxFk=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BYAPR10MB2933.namprd10.prod.outlook.com (2603:10b6:a03:88::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 17:07:38 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6d20:6694:a16:56f7%3]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 17:07:38 +0000
Message-ID: <8ffd8587-7eb3-d5b6-eab0-b86df5c0ebbd@oracle.com>
Date: Thu, 24 Feb 2022 12:07:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: cleanup swiotlb initialization
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220222153514.593231-1-hch@lst.de>
 <09cb4ad3-88e7-3744-b4b8-a6d745ecea9e@oracle.com>
 <20220224155854.GA30938@lst.de>
 <206ba6a3-770a-70ad-96bc-76c6380da988@oracle.com>
 <20220224163943.GA32088@lst.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <20220224163943.GA32088@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0046.namprd08.prod.outlook.com
 (2603:10b6:a03:117::23) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c344323-bd09-4fec-46b3-08d9f7b828c9
X-MS-TrafficTypeDiagnostic: BYAPR10MB2933:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB293364751D244699B3F963878A3D9@BYAPR10MB2933.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kmiNM9QWpQj3JRvlplQEXw9n/9qemJPRczQ5h4XI1X8TxQHyezzBVC9rnADCp2fQAXXDnirGZjBwrzUFahXAvyn+ZrgRnnGA8JSlOTFJL/H8zlqul10fbhpvtAJcmkA8sb5IHqltBJzSdfZEbXEZXrcgsALNz6uL0wz/mTfoAWVTwijIR9d6xyTcHGIaPo7A2fpM4N/uGqydbJ8HWbbeAST5OfyagYqb/itokkBoo74tZG2399h1ml2KwkL2jL8yF2eO64sFOFvISf57tcEBGfQj2EC75U0TKbmZhXvGRi9SNPlM8/lDy0ZSejtGKPCm3lh+K+QbTXBaRgQGYHDn/giW54+4W1OJidcWHRiI1+JrxJHX+osAJyFn+xh/Z7zC6Z2Vm0AYphpP0hB+I4PZ/1eMmIe2ausp9TT+kFZVBoDsYs/nlZgsWqOPDu4SCwf3dl6125h/KADx/uWixUHPw0xZf1JgAPc+Va69FcDxHKc4fyLWF7zP9F+e2mGzcm55TvPiF40j5X6qOJ/j//AMkdfBWLHaOLu7sFN/FNn4KjtxUMHFuSlH+lqKWTIz27mM2YPDYrRuJoJo8b7CWj+OHWPEeFHlkZWQFGZ4+91MpaEBE1VDauQZuYBLtz5+YsKAgJD4mu4zvFw5NYHUAuBPBLcrw12d9ut06+uF1DCCLxcMDXkl1sR6gZ2iQOpzndC8n1ioPsYMOYeeeVRIY05b6QatGIfcU441X05vSGYbbtU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5009.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(508600001)(38100700002)(186003)(2906002)(2616005)(316002)(6486002)(31686004)(86362001)(36756003)(6666004)(53546011)(8936002)(31696002)(5660300002)(6512007)(66556008)(66476007)(8676002)(4326008)(3480700007)(66946007)(6506007)(54906003)(6916009)(7116003)(44832011)(4744005)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXQ2a3h3YzlVY3psR24zdC9QcUZ6TTFiRE9UUDhmRXczMEEyaG81YkY0em1H?=
 =?utf-8?B?Z2pjY05OVFJVRkluTFJ6S3hhM0ZlYVd6bXlYMlVtRCtpOUtZa243QWZIOW45?=
 =?utf-8?B?cytsS3I5UmR6VWliQ2lnWUtxZzlJZkFjbTkxMUtzcGlTc0p5Q0dYVUE4aU52?=
 =?utf-8?B?WE51WEV3Zkl0UGpObFU4MGR1MjAyR1hrMVJIeExudXRtbTRLcWZ6cXdTWjBj?=
 =?utf-8?B?RTF3OXhkcjlieklUcEZqSDRZeS9JbitvWTR3d0tOOGpjcEtVcVNXaE9NUnZs?=
 =?utf-8?B?cVBRdDNXblJJZ2tmZTRUU2NUbUh5ZWg2K1RKK0ZCWGtYa2hRSDVORStiNzds?=
 =?utf-8?B?Zll0cmdDQzlsT1VnOVNPSmQxQVJUeWpPZ0czamNqRURWOTRxTGNMRjk0SndO?=
 =?utf-8?B?Z1RRbjZFbCtSQ1kvSFh5QmNVNzNNWE9UUmF3TmxjblA4Tml1TjZVSlVteFVD?=
 =?utf-8?B?UmtJdGFkSlpUQ1ZlMW1OSkZlcXJWcTNXTkpFcXRoNDdIWTRoSkdhY0hJeEs0?=
 =?utf-8?B?Uk1Gc3B3RzhHelRWMDlBbkZDcVdkWFB6TzB1Y3RqbUVpZExEWUM1M3N3OGJl?=
 =?utf-8?B?S1BQc0Z4VlhQeHZudjdMOGxpc0RpN3dOM1RaUXg0SHFUYWFJTElyNmgyRlRD?=
 =?utf-8?B?SS9XZWxxYjY4R0lQWGhXeU5scXhGRTJWYXVNdFZsWEl1TG9BaFdjVEQzT1JU?=
 =?utf-8?B?bm1oOHQyVGlqVExLMjAxNjlTRSsvYkFwZjZhZGUrTDNCTkFlanoyUHVSb05v?=
 =?utf-8?B?NFU1bHp6dDB1ak1wL1N5bWhlWkdqc3h0Q0Z5dm9naW4rMXFEa1VXNVdnS01s?=
 =?utf-8?B?aHU4N3lsNkVBSlNrNnhtMnhJd3pwRElmVmk3bFZpbis2dU4rSENVSVBrLzFB?=
 =?utf-8?B?YzVlMXdMSVY4dS8ycjlHam5hRkh2ZFFwSEFnNTdIZGRwT1hMcGNIbkRPbFNs?=
 =?utf-8?B?SWoxbTZDelRrbWU1QlhOODRJeHJZc0hIWnJhVmhtVnhxNGxhRVMxcGc1SHJr?=
 =?utf-8?B?WEx2bEZCMlN6bStlUTBiS2tISUl4cmFYbE54SzRSWjFwVGN2czVlaisrN1lP?=
 =?utf-8?B?enB5UUgzL3NpcEE1TWRFT0dnRE5NS01OVkwxTHdFQ1Jzb3QvRUdNVUVYNGZQ?=
 =?utf-8?B?KzdaKzJ5SmlnN1dqa1h6L1ZmK0FYUUxaeU5IR0xRS1dCVktrQnB4TDdxR3dM?=
 =?utf-8?B?eFczVlRRSWZIWG5ubzNkc2VwS0xSc29oanJWVjhrN2dyNVc2a0tCbXROdlZJ?=
 =?utf-8?B?U0pCQUp0VktzNHoxTG9ubDdBRnRPWTNYb1R5dWUzOVh6TTJJUGp4UUtHbWdJ?=
 =?utf-8?B?aWVCMW9YTDFmV0F0WnM3UVVwVVRHSnBaUGx4ZFUrTXpFR1ZkRkZ6S01Fa0dD?=
 =?utf-8?B?NVBjM3h3alBHU3ViRkRSTWpubUZSODVTaWxwQmZzai9OOTFPMFJXQk01Yk14?=
 =?utf-8?B?dFJVbVowK1c5cTlQZ0cyWjNRRUQ2S3ZNZEJWQVFETGZPM1hlckROd3JpUjk4?=
 =?utf-8?B?d0JKWFUwYW1XQ1l6OEd4MVVhQWY1VVZPZi96cTVkaDlkdVYvSlRyRm1SVThN?=
 =?utf-8?B?UVBmTGE0bFZwVVA0bXc5cnJzZzZoSVRwRWY2UmluWGc4NHYyNnRuMXJwRWNO?=
 =?utf-8?B?ZlVkT1lMYm9GYzlYemdVZWF3TUFCc044OEtVQmVvYWM4Wk5FUStEV0VZUEVU?=
 =?utf-8?B?R1ZqZ1VUc0VCTHdhOURsWXVFZERiTmIxdEVnVnpOdVlJeWJFMjdUUkRqZGZr?=
 =?utf-8?B?ZjdJYUt5WEV5aGk0aHA3S3drN2FlZ0xmRzcrR0hieHJSdEd1ek0zdDhqUjgx?=
 =?utf-8?B?ai81TzFIMjlmSWJRRFFJRXdEZlQ1MDBqS2J6ZTh0c3Z1SnFiaC9yTjhha0Jq?=
 =?utf-8?B?UzFFQiszbC9mOTladHdUN0xVa09qbm9DUVRuV2RqTTFTSWNTVmQ1eDI0Y2Jr?=
 =?utf-8?B?SWk1dUN1bmY2bG5OZlJaWVE4b0puc1BMMmxYdUVKRW9qRlE1bVZkdXREYW9N?=
 =?utf-8?B?QlJxK0ltVEtuTzdTclAyVkc0UWczU2tOTHZIdHNTTytLcWF4REhOa2lXOGFE?=
 =?utf-8?B?bEZSV2p2VkhkbExtUnAwUkRiNTVqTjNya0NZRzZ5RW5HWWFrZmRLY3dxbERW?=
 =?utf-8?B?ZFhVN1dUOGVzWUFka1c3dERxUmI2MGJjYTdSaHBpbm5zVlFsQlV2TXdnejJj?=
 =?utf-8?B?bXRuaFBhZXhaVzM2czAwNS9RMmYxbjhCWEgwWDFtNEZmZDVwQmVXd0VxOWJE?=
 =?utf-8?Q?BkoLh6ytPfb1Mq2SNHtZK1OlFSwXllg8oIkRQkvJBo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c344323-bd09-4fec-46b3-08d9f7b828c9
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 17:07:38.1520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQhDrtunFcKjN1DE8Dow4ZY7CuAmUiIhNF7BLK4sLDan25KyIQMoygGuCDWSe0UW3is5lw+Dsq8etoGwToveJaplWJMRTMAkmSb9T/DDWXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2933
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10268
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202240097
X-Proofpoint-ORIG-GUID: dRhxuVACkwLDmdqzFGNh1tB3chsQYZpc
X-Proofpoint-GUID: dRhxuVACkwLDmdqzFGNh1tB3chsQYZpc
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
Cc: Juergen Gross <jgross@suse.com>, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
 tboot-devel@lists.sourceforge.net, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2/24/22 11:39 AM, Christoph Hellwig wrote:
> On Thu, Feb 24, 2022 at 11:18:33AM -0500, Boris Ostrovsky wrote:
>> On 2/24/22 10:58 AM, Christoph Hellwig wrote:
>>> Thanks.
>>>
>>> This looks really strange as early_amd_iommu_init should not interact much
>>> with the changes.  I'll see if I can find a AMD system to test on.
>>
>> Just to be clear: this crashes only as dom0. Boots fine as baremetal.
> Ah.  I can gues what this might be.  On Xen the hypervisor controls the
> IOMMU and we should never end up initializing it in Linux, right?


Right, we shouldn't be in that code path.


-boris

