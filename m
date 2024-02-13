Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC998853C1D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 21:17:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oyaztb6E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZCLN5L1pz3vX0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 07:17:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oyaztb6E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=wenxiong@us.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZCKZ373lz3c6Q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 07:17:05 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41DJE7id000344;
	Tue, 13 Feb 2024 20:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : date :
 message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=9BP2nCsE95ZGVeeRSAyKTS+eoxBXadNnRJ1AeEQ3KrI=;
 b=oyaztb6ESErRWSoY/7zwLYciDBMwsKCpcizEPGZNkqDZW287M8mml4tnCkyLRxjrS/R5
 I+wXKq24ziQ0nOUFRcro7QSF4M8s3/aqI9ntnsaE5F2b429F4ZX+eVdNbgB16jhlcIO3
 F/DZxF9b+MMdophJrl/m2VGBiFp6IjAPQqyIqXWIj5tEfAe9foLuiFOeT7g4h5tUroL6
 8uC0SQpUYGZ54umBpO6il0Zwp7cYLvCGlArFxBCE81tuEt4gOQqaEumF6gliGyPrR9qj
 Tamnho6VSn7Af5muMPpY3BdvVNiFf6gd6aPhI6kkmv42H7DwIhrov15djKWJ5QnDsb6v og== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w8d98b9y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 20:16:58 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41DKGqF4015959;
	Tue, 13 Feb 2024 20:16:58 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w8d98b9xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 20:16:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dry+oSMfeBjzGJTelUWE/X0UGjve2X/UtUddGdOgyxSaGI3JMe9I6wgtyOjJ7sT+zDDzZm9hR2bc16lBO8MuBa+azxiQamskLGQltPAB5PnZqIt0PZ5AOnZEWVUANUwbJHJHgK/EJT34GeeXXeRytsqorhmDaGC4OewKir51VaenLBnytiL9B/3VDsIRXvmq1urILJbZrd68RnSY64IT5wj6wgLoinaFIp9WMGhz/raVt+qrOEqEOLU4D2mkfizf0s10Gt3lPCpuVVa885D1sVko3D0s7chYVfJ/FenA++SMnIi9VxzNaFYfDiuq5bNp9VlxzHCxVhMyr1HT8XBRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BP2nCsE95ZGVeeRSAyKTS+eoxBXadNnRJ1AeEQ3KrI=;
 b=lrpCJ/q7FaQ+W9iKGfiXjIvq0pJ95m5HGMZNGdbQJAnWC+AuaR7JZuz+RsZHQGjh7E+CcTgVn1qFT+gHxgl4yc2Q0H9C4z8olWqNlEDHy6x7Tr71m5R804B+ZPMlY45laviT1rIkPQyuRmhkE2RjOMucppcKJfg31cCIRF8G/33oyA9v4OC03ymoP6OFmi71I/xihF35QgU1Rim3I091EeJs/QcBzLlBHzT1TOriRuahrGCkB6HqfoC68/Dt7Ffwu8trMauL1j22UNYr5EFsmOMqsEZocrTrMv2P5ssDhvT0UhiQ+wYfoKoplu9WkAgpJAOe1T5qqA4Wr2LXQfj+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=us.ibm.com; dmarc=pass action=none header.from=us.ibm.com;
 dkim=pass header.d=us.ibm.com; arc=none
Received: from BL0PR1501MB2033.namprd15.prod.outlook.com
 (2603:10b6:207:1b::19) by SJ0PR15MB4153.namprd15.prod.outlook.com
 (2603:10b6:a03:2ec::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Tue, 13 Feb
 2024 20:16:56 +0000
Received: from BL0PR1501MB2033.namprd15.prod.outlook.com
 ([fe80::e6b0:c5a:444e:e76c]) by BL0PR1501MB2033.namprd15.prod.outlook.com
 ([fe80::e6b0:c5a:444e:e76c%5]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 20:16:56 +0000
From: Wen Xiong <wenxiong@us.ibm.com>
To: Pingfan Liu <piliu@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>
Thread-Topic: [EXTERNAL] Re: [RFC PATCH 5/5] powerpc/smp: Remap boot CPU onto
 core 0 if >= nr_cpu_ids
Thread-Index: AQHaPRXuqjMIi75qgUOl8aZB3+OVjbEI9oqQ
Date: Tue, 13 Feb 2024 20:16:55 +0000
Message-ID:  <BL0PR1501MB203368E0F789B454F8B94DECF04F2@BL0PR1501MB2033.namprd15.prod.outlook.com>
References: <20231229120107.2281153-1-mpe@ellerman.id.au>
 <20231229120107.2281153-5-mpe@ellerman.id.au> <87tto1jjou.fsf@mail.lhotse>
 <CAF+s44QfT+m1hL=Z-wevFhWff=O6DNK=WRxcdjK+p-rK5J=LKQ@mail.gmail.com>
In-Reply-To:  <CAF+s44QfT+m1hL=Z-wevFhWff=O6DNK=WRxcdjK+p-rK5J=LKQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR1501MB2033:EE_|SJ0PR15MB4153:EE_
x-ms-office365-filtering-correlation-id: 525ffa44-17ff-40c3-b850-08dc2cd0b9b2
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4lUsmwiwc0U58VM5eNP65MizOo09tDteC9v79wAmXpoWL2y3T6jjkGCnG1PEOZ+ZWKiUR6sItflAK8uYiZYVDPw42KZtA1GP4vqe9Lu/oEnklAtYsNULpHdVRN0qjMvI9oFiGyoAGBAPdgasimdl+nVb4SM4TWEwNTrFEOTVPIhm8JR8KDhpbcoU3jb8UMJ8TaHI63Zdo32RfAPSbOyke1YVBBuvwdvlEb32ZTXVhS8IBaw2EkcMJPK0aDBrPOmqobqmfwGBzxA4my24AvJEY7K9orxaSNoSC/L+nTxOElVUL8llo/t9QVtAYHSAK8R8krWLRX//I44B672kpAdHEX8DJhYCJlfcdr1e78iwmavlb/ggKyvJv05OJl1Aj5a/yIUgwQ/Dn+ThqxnG2GfLkB4BNdcsGJrPPDm4hzPVv3w1WMi7AX8HBKBUx7GGkYYdoyekbKolKDJiWpRC9m5KkhGe/LGUOf3AUKEQbTQM0ZvqpEUG4ZCMuMLc9xx6IhDr4YfHV2fmQW1JealfbWrupjs4Axg/Fcy+/G+8n1sUM3U0MI9Nu1MAotFOqtvtossRRV6CaFefDRKyNBQcOFvYWJqZOlHm9Qt08ndQBv05SkF2yf/GIx2zjQFCU/LoPy2g
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR1501MB2033.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(39860400002)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(55016003)(110136005)(76116006)(316002)(66946007)(66556008)(54906003)(41300700001)(38100700002)(66476007)(66446008)(64756008)(8936002)(38070700009)(4326008)(5660300002)(2906002)(8676002)(7696005)(26005)(9686003)(71200400001)(6506007)(86362001)(33656002)(122000001)(52536014)(478600001)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OTNOc2xCWU1uak9JbG1Od3N2bHlZTzN6UEtUZTh4SW45WDlFcG5sUFIwU0hT?=
 =?utf-8?B?VkpsbWE2TmN0eE9POUZDK01VamtnVTM0cFJtVUQ4NktSUmYwcWlSMGFrSmpR?=
 =?utf-8?B?Q2tyOU9uMzZLOUw2eDV3YjYyVWx0NXQzQWh5RVFSeXorem5JRUdWVUVyTXUv?=
 =?utf-8?B?ZFk4NFFPSjJwUWgrWEpzVk9hVTkycDVRTDVhQVdyWHUyNWUrNmMrWFFhb2xB?=
 =?utf-8?B?V0ZaMnpIK0pybllSODlPY0Ryc1dxdlg3WVV5R3J6NGlrTmJESUozZWV6MjVk?=
 =?utf-8?B?dHpyWWdiMHJZN1gveXBkSVdjNTk4c0k5VEwveXRwQ1lOSCttSUpGdU5iUEdV?=
 =?utf-8?B?MkZmTENUM3k0dklhM1g2U1FPWmpJdnNIeCtDVXdaWDVsVXV6SnF1cHFWK1JQ?=
 =?utf-8?B?OERST256YytPZ3FxQmlITkhUTmpiYmtMelJpblRFWDZzTUo4SVBuZk5oQVJM?=
 =?utf-8?B?a05oN2RQdnF3YVVEeWRCd3ZaV0ZFT0VYbGFYbG1Ga2tlbWd5Snl0dXpyTHd2?=
 =?utf-8?B?OFFuQ0NnbWlOZFQzaFhaekJUQWFvNUI3MXNneG14NGl6TjBTamtUbElodm9V?=
 =?utf-8?B?QWY4dGpienpjclBoaGkwZXpUdm15elhLRWJ3VUtxQ2owYVc3eUhWTlpPemVi?=
 =?utf-8?B?eEFmclNQSTlDWFFOSWxzQzlhZ1hzVEpLZUROLzBtL0VtRFUvVHgrcytPNVFp?=
 =?utf-8?B?SFE1Vkx3N2o2UzBwWk02NFJ0SnRyRVBRSEFTbE9SUGFidTRNallHbzhlT0Jl?=
 =?utf-8?B?a29SZUZzOWdHd2NyOXk2b2EzRlg2T29EME9hRE9Vck9DUUxyMzZ5Wnl5eHhq?=
 =?utf-8?B?M3R1SkVuRkYxV1NHNWV1SFdrelRSVTlhSVV1N1hoSHg5V0VXSDhjaWFVWms0?=
 =?utf-8?B?T2t6b2p1ZWprTTJQRXlvNWNnSXUvTWJ4dVpGZmFkbnZVZ3JibjNGeWhWY2ti?=
 =?utf-8?B?cmZ6NlErd3kzMXliRkM1Y0RuVEZZMzBhTDRTUlEvNWEzVWJaMk5EN0Vmemhz?=
 =?utf-8?B?azJmUVhhYUEram5qOGpjY2U2TE1OeHhUR09xYTVVT01zSzFIRE0yQTlaMjNT?=
 =?utf-8?B?SWVBaHJoM2tNdlpSSHFyeVlXUE9xVWRpVlFhSFA3dEpVTlJLbU81RllmWWZO?=
 =?utf-8?B?Tmd0VnpZbkkxMGJjR0g4S0xBTGVYUmsvQ3B2d2lHVjNvL3VSaGVoUjZWVnZy?=
 =?utf-8?B?NEc4NWMrUTh5R1pwZ0pZaUd6RW1YWmkyTi9iSmE2MjVONk1oNkhkblQxZWVE?=
 =?utf-8?B?M1JWbTdYc1AzeWRTVWFLdVc4dHFPbStGQmw0V2JPSzlLNTN2ZmtsWGo0dU56?=
 =?utf-8?B?VFp1TlRiOUpOUERoL2pOT1l4d3IreitRcCtUSkEwb0d3L3Z4ckZtZzNzSkty?=
 =?utf-8?B?bm5DNzdaMHc0dFRpajVEU2V1VFZHNFlLRVhWak1jVks5bU5qWUxaV1kwaUJu?=
 =?utf-8?B?L1FuWjYyOWovZlRTOUp0eG80TGh2Uk9HUmVDQTZSdGJEVjVqa2hMZ0N3VS91?=
 =?utf-8?B?ajFsRU1abVVoTjhEaW9yaGF5cldYV01RSzJZVXJXdXZGQS83OTJRaVZpYXV2?=
 =?utf-8?B?THVqcVFoWnVqQXU1cDRFQXVBWFJZNzlyR21kYk9tVWhXMTBFUmdLMitPRzhB?=
 =?utf-8?B?b2VZdGhrQlpSbHdwbGR1NzVFWE8xZWppdkkvL3ZsejBjTUJDdXZ6d1NnZzE2?=
 =?utf-8?B?RkRNamlaMzNlTERVTmFZby9nUHhZZUdwN21tR0cwVG00VHZIbG9GaHVoMVkv?=
 =?utf-8?B?UVBnSDAvU0J2NERiaENwWExzYXRCN0lId0RGYVZ2a0h2RGV0bjVyMitQYnQ3?=
 =?utf-8?B?OGNNRndxR0EvN1hiMXJWUWR2R2hZaEh4QmlheEZiMjZocjlXS0ZFMGY2SEdU?=
 =?utf-8?B?ZUxycVVqNmF4ZERubUIwckZzL3I5QkVhTk9QOFpYMjJWb3M2QzVtcDgrWU9l?=
 =?utf-8?B?TGFqTVY2Z2w5b3J2RS80QklIbmRlZ016RWFRMGF6eDZiWm1ZUm9IMDZxM0Zu?=
 =?utf-8?B?NTNTR1UycEFUUmk4dUhWa0Y3azdmdWRTMmpWRXpVM1dIWlA1WmV0VmhOdkNo?=
 =?utf-8?B?RlNOVDZSRmdtUE5iOTdaYmVycDV1b3ovMy9hTHNLcG9ZSVhQS1JId1dFUlJ1?=
 =?utf-8?Q?clOA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: us.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR1501MB2033.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525ffa44-17ff-40c3-b850-08dc2cd0b9b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 20:16:55.9580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rjBF8qtZM5HLpgjZxGIQiDUAu5Ope8H2P0m+tlgxzKiG92dSlTGwcVKwx/Udi3Visi889Q/5gc+N+b+cOLnVgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4153
X-Proofpoint-ORIG-GUID: weMyRKjJ_esQWkOVnFjsJZ6WgGre0DBC
X-Proofpoint-GUID: vecq0WORw1oxpw3NG1tcOq1jVRnQLF5Y
Subject: RE: [RFC PATCH 5/5] powerpc/smp: Remap boot CPU onto core 0 if >=
 nr_cpu_ids
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_12,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402130161
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Hari Bathini <hbathini@linux.ibm.com>, Pingfan Liu <kernelfans@gmail.com>, Ming Lei <ming.lei@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pj5BbmQgbG9vcCBpbiBXZW4gWGlvbmcgYW5kIE1pbmcgTGVpLCB3aG8gY2FyZSBmb3IgdGhpcyBp
c3N1ZSB0b28uDQoNCg0KSGkgUGluZ2ZhbiwgVGhhbmtzIGZvciB5b3VyIGVtYWlsIQ0KDQpIaSBN
aWNoYWVsLA0KDQpUaGFua3MgZm9yIHlvdXIgbmV3IHBhdGNoc2V0IQ0KDQpJbiBwYXN0IG1vbnRo
LCBPdXIgc2V2ZXJhbCB0ZXN0IHRlYW0gaGF2ZSBtb2RpZmllZCAvZXRjL3N5c2NvbmZpZy9rZHVt
cCBmaWxlIHdpdGggbnJfY3B1cz0xLCB0cmlnZ2VyZWQga2R1bXAgb3ZlciB0aGUgZm9sbG93aW5n
IElPIGRldmljZXMgYW5kICBrZHVtcCB3b3JrcyBmaW5lIHdpdGggZ2VuZXJhdGluZyB2bWNvcmUg
ZmlsZS4NCg0KVGVzdCBrZXJuZWw6ICB0aGUgbGF0ZXN0IHVwc3RyZWFtIGtlcm5lbCArIHlvdXIg
cGF0Y2hzZXQNCiAgICAgICAgICAgICAgICAgICAgICB0aGUgbGF0ZXN0IHJoZWw5NCBrZXJuZWwg
KyBiYWNrcG9ydCBvZiB5b3VyIHBhdGNoc2V0DQoNClRlc3QgaGFyZHdhcmU6IE52bWUgZHJpdmVz
LCBGQyBhZGFwdGVyLCBOVm1mLW92ZXItRkMNCg0KVGVzdCBkZXZpY2UgZHJpdmVyczogbnZtZSwg
bHBmYywgbnZtZS1mYw0KDQpUaGFua3MgZm9yIHlvdXIgd29yayEgUGxlYXNlIGNvbnNpZGVyYXRp
b24gZm9yIGluY2x1c2lvbiBpbiB1cHN0cmVhbSBrZXJuZWwuDQoNClRoYW5rcyBmb3IgeW91ciBo
ZWxwIQ0KV2VuZHkNCg0KPiB0aGUgcHJvYmxlbXMgdGhhdCBoYXZlIGJlZW4gc2Vlbi4gSSd2ZSB0
ZXN0ZWQgdGhpcyBmYWlybHkgdGhvcm91Z2hseSANCj4gd2l0aCBhIHFlbXUgc2NyaXB0LCBhbmQg
YWxzbyBhIGZldyBib290cyBvbiBhIHJlYWwgbWFjaGluZS4NCj4NCj4gSWYgeW91IGNhbiB0ZXN0
IGl0IHdpdGggeW91ciBzZXR1cHMgdGhhdCB3b3VsZCBiZSBncmVhdC4gSG9wZWZ1bGx5IA0KPiB0
aGVyZSBpc24ndCBzb21lIG9ic2N1cmUgY2FzZSBJJ3ZlIG1pc3NlZC4NCj4NCj4gY2hlZXJzDQo+
DQoNCg==
