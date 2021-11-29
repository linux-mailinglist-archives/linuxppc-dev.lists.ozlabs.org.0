Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E124D461CB0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:25:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2sgq0V7Xz3bXJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 04:25:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256 header.s=sel1 header.b=sbS4NXeH;
	dkim=pass (1024-bit key; unprotected) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256 header.s=selector1 header.b=ZnegSyl6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=selinc.com (client-ip=148.163.143.141;
 helo=mx0b-000e8d01.pphosted.com;
 envelope-from=prvs=096727bffe=eugene_bordenkircher@selinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256
 header.s=sel1 header.b=sbS4NXeH; 
 dkim=pass (1024-bit key;
 unprotected) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256
 header.s=selector1 header.b=ZnegSyl6; 
 dkim-atps=neutral
Received: from mx0b-000e8d01.pphosted.com (mx0b-000e8d01.pphosted.com
 [148.163.143.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2sg04W1Vz304y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 04:24:55 +1100 (AEDT)
Received: from pps.filterd (m0136174.ppops.net [127.0.0.1])
 by mx0b-000e8d01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ATDHwsW005994;
 Mon, 29 Nov 2021 09:24:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=sel1;
 bh=8523BVCjcleQZuY/muWNA/v3JZlDKVUKzQKJitDaGqs=;
 b=sbS4NXeHJCZ73uz5b83wPhulnOE+Tc6K8vlr4UOskhHx0PvGXEk6BFz44vJjBmvxmNbZ
 VY9gSufvCq7cFrsmgc1bnf5YZPcBlB6DswXc9vRMCakhE0AlxrPnU0DDKDX/Ljn5367e
 iFSPDzFTvmUrOZWwRuKAS0/TDYyG9MlY9zDVlRmBDoeoTIJRnJCh67b6d23nVqiMfXIk
 BusIFU27mDMyP1NVajfd/8BHhj/Y8MK7sVH3OlZG5rvypyt/0Rhyw7d8VbltgZAiZ6rD
 vBfofXQCwxO1NWyqNdCEk81C5qgkptomj/tCTe/H/BTg5D62Ti4icS0MAnxcmAGxrNHP bw== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=Eugene_Bordenkircher@selinc.com
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by mx0b-000e8d01.pphosted.com (PPS) with ESMTPS id 3cmpwrrcy5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 09:24:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ER/LIcq7S25P9Sa5fkFUCd2klzLUIKRWSswtrHyBUluY3081KTtFwdJf6CLvOOIbHXUGpC46F2lQttIAlr852yA+sXn68aeEKhGmdZphMPJ/RUh+bFoD73Bf8RNC8W5WRym7cFNavkfyPl9wuhoJDoN+6CHMA4ZNzTHmQ5IzzJdKKKz7O0Jvw7ArwEfSASPaHEjLfOuscu7zTj0EP7aJMVqfliFFPpkN1i8IDHlWjWtkRPnH6z6ppuxmdzNgPqFZVgmXsoB37iX1eF+zhar5eX5KEEOAPGj136jvofh9+xSCDVtPh+JO4kP98NgXhiHP/Nru/REYOOh0BF2NEoCOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8523BVCjcleQZuY/muWNA/v3JZlDKVUKzQKJitDaGqs=;
 b=Y+NdX5KwfB2PbggU9R05IjWn8DU3gy7WgTez9WiKM4+SnkbnSwT0WDFRI6UJ329bR2DebJzF8JgqQosluqy9pZpwO2/IGK/drsEGhqmCCaA0UKZWYjm/umKQlNBXrG9kBSivUAr5cOLKweDBoxkYThQKkyy7MGCgP78RkYEezdThCDxtLFb04ji2c6Gfx4+366cQwOelFBw9IcQxMuFHXabKqv5Lhh7z5veZ781s9O4ncsuh5QK1QBRBgZ+9yXOSwJ6OikWldqlK3DSQ1nNx8SuDsIJkZR5b5NPJPVe0xdHxQIQuz+OlHi4fW+4UDIJZGfgzOUiDmwa+/ILZkQxOUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=selinc.com; dmarc=pass action=none header.from=selinc.com;
 dkim=pass header.d=selinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8523BVCjcleQZuY/muWNA/v3JZlDKVUKzQKJitDaGqs=;
 b=ZnegSyl60+VMMChZvv6Zxsr7Tk8KFlOmduoASMB87rt3EKFaHdAzja1xY9BC1iDDwheV5J8yLjzxtaYSv0ZTasOEAZwHPWCF/JAnT2b3ymEsvq3EC69iEcpv5y9E3/unMiI2zHSSmDNbD060I4qa8yDZTxMpwCrsUqanUcKgAgs=
Received: from MWHPR2201MB1520.namprd22.prod.outlook.com
 (2603:10b6:301:34::25) by MWHPR22MB0318.namprd22.prod.outlook.com
 (2603:10b6:300:72::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 17:24:33 +0000
Received: from MWHPR2201MB1520.namprd22.prod.outlook.com
 ([fe80::bc7f:f01f:c0f8:2492]) by MWHPR2201MB1520.namprd22.prod.outlook.com
 ([fe80::bc7f:f01f:c0f8:2492%4]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 17:24:33 +0000
From: Eugene Bordenkircher <Eugene_Bordenkircher@selinc.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>
Subject: RE: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Topic: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Index: AdfM5PT/NvfAW0+iTcC+AdIF01azggAtEqGAAKVd5oACc0lYgABIbVXQAbnCUAAA0DL90A==
Date: Mon, 29 Nov 2021 17:24:32 +0000
Message-ID: <MWHPR2201MB1520A85FE05B281DAA30F44A91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <2c275adc278477e1e512ea6ecc0c1f4dcc46969d.camel@infinera.com>
 <6659a2c7fd9fffac766b8389244e5885ccbd38bd.camel@infinera.com>
 <bb5c5d0f-2ae7-8426-0021-baeca8f7dd11@leemhuis.info>
 <MWHPR2201MB15209AA4F2457934BDD3293B91999@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <726d3561-1842-72c7-d4cb-9a99211bb05c@leemhuis.info>
In-Reply-To: <726d3561-1842-72c7-d4cb-9a99211bb05c@leemhuis.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8927b5fc-2e5c-48e8-fd95-08d9b35d1bdd
x-ms-traffictypediagnostic: MWHPR22MB0318:
x-microsoft-antispam-prvs: <MWHPR22MB03189BE53B6C62231B0C8D6A91669@MWHPR22MB0318.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ph/F0eIT4GEDugAfW04LSwlqaQh3e1dz128JeN+x/cjpxzBODhSh5bN2YIRnuyMNFhiU+qXw9TV4SsMaUcR7HdrcEFrnOvCo6GFHjLo9UQ3+61hoWAbLazx4kf/+rWRhVCRcc55EGMdaiSIsKCzO+WXci4PeCOQ5Hf+bBBSID1dCbZgaQznlomRVkGzpqz3hcAluIuu9m56aqp9Ie9ZWR5uMoMgmMjf9gDwHPMPqAsmXtjmFxAg1TBjet11ihWz6aWPHdyvC0ZoWQBs6AxvPpWJOf36coputfgPdKwFZKMKOt/lavCuczE5EoL+e2ykNQIAZyCFWMsbcaQb2NMZ+LCC3N/z6DoKnEuP0QUUsqbIpC4Sfzptrm6Nc7TZYMYegdEJL0W4+iqtdbn1BHd2kWC3IzkN/zZjuf1Rmkt1WYurrtT2SswTEu9kZ/kiBRfERU2u/gqqEBbQ8mTjuj2CXiZmGVEMdTi7htwT2Qw1B4ahe8KGOYyh8re/8Luxxv2DH3pz2bLgs49s3ag+rAQ/cLsD+Jle1Q0q6xaPXmgZbTS6luOUzrn8+I6eITZJh17dxHV3OcVP5bknGoS/0J0Q9yKP+rxJcVkk/AGQW3ZDNotvriOX6zOEFV6jlTyo5OQ+vyKdiIRRfIq3h78I32qOdVTx0Z3/gSQjD+wHkcnBwVDahKWK6DOCITDAAbKGVoSDQaOtCF7O5ipLNpiZAtDiIY6+3Xu+pjlNBUenq6/5/cYiOsvBHMj+eq6um4p0l8P/ZPrfeln0JsGudabpgj3Y7lmwOC73sVG/RSqfG2zAjk7w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR2201MB1520.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(8936002)(26005)(86362001)(316002)(53546011)(71200400001)(110136005)(54906003)(9686003)(4001150100001)(55016003)(66556008)(83380400001)(2906002)(508600001)(8676002)(38070700005)(186003)(4326008)(38100700002)(66476007)(6506007)(5660300002)(33656002)(122000001)(66946007)(66446008)(64756008)(52536014)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUd2Vm1tMSs0ajVkMlo1N0c3eWVTaHA2QU5EbDZPU3d2allxYTgycEw4MStr?=
 =?utf-8?B?b3JOcmNKbDNzcWx0dGtKOEc0NFIrL2ZzYlY1d1dXZWhqNUNla0YxSWsycXNt?=
 =?utf-8?B?L2JUZkVHbXVtWWVveGk3Mm5NbjQ4S1pLemFBNldaOWVrSDUzNU85dkNWMnZN?=
 =?utf-8?B?UlpIQVZ6MVc5S2hNbVpKVEFkWHFYSFViTUtldk0xUFlNUkZqSzRmYWx1VE1k?=
 =?utf-8?B?b2l0SHlvOHF2K1YrRWRKdHRBMzRGb3V4cklBSm9EbklsSk1ZdjBtMnFXdUtt?=
 =?utf-8?B?WXowQkx1T1NpMEd0TnlERTlFbDdkc3JLenFNV1AwaWJQNm9ESDNhcXBQMjcx?=
 =?utf-8?B?M1ZUSnpuWTFidGhOM3JDNUw2RytrYU40bmV4dHlGRXFMQjQrUm5LSStrU04z?=
 =?utf-8?B?d1hLZHZTR2hMT0dsZXhjQWtnRUpaczhRYXhIaCtYR2Q0ZnU5ZS9WaW9hbjBX?=
 =?utf-8?B?aGJ1dXhxMFVvR1gzRHFueWZMNTdnRmMxTldnR29ZTERqWGxtNnp5MEdHVUVx?=
 =?utf-8?B?cjlNM1N2eTNSK2VZdkVLSGdmZWdlQkZLS251N1NKeCt5VzdwY1o4M1Vsbi9q?=
 =?utf-8?B?ekRzeVNBejR1YlpRMHFiejAyRUpoUmpaVlBUS1NMY0hrTFVwRjJFMUltZUkv?=
 =?utf-8?B?dStUZUVEWVlHckc1dG9rY0c2MDgvci9YczRDZmxrbUpwTEU0aGZ3dDVzZEpP?=
 =?utf-8?B?dUhpcmFNaVRnc0tBUllwTmprUHVmT3JPQVNybTNCWW9oUzVvWXVqdW5FaWpI?=
 =?utf-8?B?a2JjMUpGdEhYOEpaTEJNdEVzMmNLNHB2V3NSZkhHWXNkb2lET2hod0ROb1R1?=
 =?utf-8?B?aG03QmJaQzBYbzNMTXZzVFQvcXplTWN2MG92Yk4xSnlRT2haazdqcjNMZTAx?=
 =?utf-8?B?ZGZkZGF1ZytxVFhDUXRhZ1JKdDUyc1prMFBiTkgxWkVTRStyZENSaDBsVlNI?=
 =?utf-8?B?MjdVdDkzWEpHRUdUUkNYQ0VuSkRsUXY3VU9SNUxPOE55RjJraTdVTmhZdktx?=
 =?utf-8?B?YXZ0aDN0VjNBQmozcUpIQStScjBJMTI0a1ZwQlNUOGQxWXowWFRHaXN3dXBQ?=
 =?utf-8?B?Z3pXdGJ3eXVraVlaODhZYytqQkRqM05QcEM0YjhTbGloUHdpVHpORS9Yeng4?=
 =?utf-8?B?MURvb3NXRG9PeVM0MlJ6YkhZTU03b1VBbC9KUVB4SWp6c0hOangycW82VEZa?=
 =?utf-8?B?Y0Jtb3I0MGVBblFUZzlyRjErUmpRM1JXdlkxSkJsVkhyQ1UwRUFEaXJCZUNU?=
 =?utf-8?B?TllkTHJHc2ZRelNwMWN6S3l4aWZESHNaNzZZOUtwbW12bkxhTFZhUG5IQWV2?=
 =?utf-8?B?UFU2L3ZZbnZERXVXVzNKWWpITnJTRnlUSlNhbGZWR0hGWjJGMGtFbWNyZGpn?=
 =?utf-8?B?SkNRNFQxRlp3Y2hJNlFvdUtIc1ZKUXlsYXo0NkdIYWlhb1hCejE0ZHBxbDBh?=
 =?utf-8?B?T2x5ZHU1Tmp5UmI1MUxvdGNHelRPN0JXWk95R2psTDE3QkJ2enBHdDNGaHhk?=
 =?utf-8?B?UStGWlp0RjR5aFFubmdxdXBWMEwwUUdBR2NkTzhnMHR2S3NuUFIreGFaMGho?=
 =?utf-8?B?OVlFYXFTcW5IaWhYV3h6Umk3SWJWMEh4YVl4L0d5bnFVSVFmMjZIK3hyVXdK?=
 =?utf-8?B?QUkvZkE5UWNSQjMxaHI0NEtBaG1NbGJuUFdSZThiR2laQmVTTStRSHl0OE9r?=
 =?utf-8?B?Qm8rYk9tbmN5MGUxa3M2b0pKVUl0eHVkL1Bydmh3d01sak9ublk3T25aYk1a?=
 =?utf-8?B?NjEwZ25ZWERHZy9NM29pNFREMUREN1JuZFZ2ZVpxdForenRPMG96NFdNUUVC?=
 =?utf-8?B?QjVldGFnQlFPWjFSbmU0d2dIRjhEeHA3OFFnQ0wwb1FvcEdac0Frc0c4UllX?=
 =?utf-8?B?L2pROEdib0VwalNqY1lNem4wK25pckJhcUs2d01lZzM4QTRuMEdjWEFWTnVl?=
 =?utf-8?B?R25ZbTZROTBqY2t5QlhKWHVYeVVKVVFTTXhzU1lmS2wrVUpDNW9wNmQyVFUv?=
 =?utf-8?B?SURvZkpHY0kyM0NINDAwbVJkUTNFUzMySjFFb2UzZElGMmhRZHFuL2lXVit4?=
 =?utf-8?B?QWdiMVduTDBlRFVOTE91TmlrSEdXM0RjWTVHSmdrblk4L1FyakpZcnpIRURu?=
 =?utf-8?B?THRRZ3QxZnNXd2p0cE5FYW9yYnJwcUI1ZnpaM3AyV2tNWWhoVWtOeXY4SnBl?=
 =?utf-8?B?b0dnVWZMWUVZTEVRejMralFzOWhuNkNvS0x6RnZVdHpFSm14T0tTUTM0NUJz?=
 =?utf-8?B?TDVrOWRRYU5BbGdmL0pGRWFhc2hRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: selinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR2201MB1520.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8927b5fc-2e5c-48e8-fd95-08d9b35d1bdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2021 17:24:32.9310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 12381f30-10fe-4e2c-aa3a-5e03ebeb59ec
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YWNQklGikha26y2hetdAW6Qmh6gvP76ilkEuJRVgwT/y6rmxZS7GbFk7wXFySRnmWVb5WDndybi3nIo+CGMlREpUgskexCyh9cXhuRfljB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR22MB0318
X-Proofpoint-GUID: 81jJmJVC00JGwn9NwlRNFHqAf_xZCD7X
X-Proofpoint-ORIG-GUID: 81jJmJVC00JGwn9NwlRNFHqAf_xZCD7X
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111290082
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "balbi@kernel.org" <balbi@kernel.org>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VGhlIGZpbmFsIHJlc3VsdCBvZiBvdXIgdGVzdGluZyBpcyB0aGF0IHRoZSBwYXRjaCBzZXQgcG9z
dGVkIHNlZW1zIHRvIGFkZHJlc3MgYWxsIGtub3duIGRlZmVjdHMgaW4gdGhlIExpbnV4IGtlcm5l
bC4gIFRoZSBtZW50aW9uZWQgYWRkaXRpb25hbCBwcm9ibGVtcyBhcmUgZW50aXJlbHkgY2F1c2Vk
IGJ5IHRoZSBhbnRpdmlydXMgc29sdXRpb24gb24gdGhlIHdpbmRvd3MgYm94LiAgVGhlIGFudGl2
aXJ1cyBzb2x1dGlvbiBibG9ja3MgdGhlIGRpc2Nvbm5lY3QgbWVzc2FnZXMgZnJvbSByZWFjaGlu
ZyB0aGUgUk5ESVMgZHJpdmVyIHNvIGl0IGhhcyBubyBpZGVhIHRoZSBVU0IgZGV2aWNlIHdlbnQg
YXdheS4gIFRoZXJlIGlzIG5vdGhpbmcgd2UgY2FuIGRvIHRvIGFkZHJlc3MgdGhpcyBpbiB0aGUg
TGludXgga2VybmVsLg0KDQpJIHByb3Bvc2Ugd2UgbW92ZSBmb3J3YXJkIHdpdGggdGhlIHBhdGNo
c2V0Lg0KDQpFdWdlbmUgVC4gQm9yZGVua2lyY2hlcg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogVGhvcnN0ZW4gTGVlbWh1aXMgPHJlZ3Jlc3Npb25zQGxlZW1odWlzLmluZm8+
IA0KU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDI1LCAyMDIxIDU6NTkgQU0NClRvOiBFdWdlbmUg
Qm9yZGVua2lyY2hlciA8RXVnZW5lX0JvcmRlbmtpcmNoZXJAc2VsaW5jLmNvbT47IFRob3JzdGVu
IExlZW1odWlzIDxyZWdyZXNzaW9uc0BsZWVtaHVpcy5pbmZvPjsgSm9ha2ltIFRqZXJubHVuZCA8
Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+OyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJz
Lm9yZzsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZw0KQ2M6IGxlb3lhbmcubGlAbnhwLmNvbTsg
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGJhbGJpQGtlcm5lbC5vcmcNClN1YmplY3Q6IFJl
OiBidWc6IHVzYjogZ2FkZ2V0OiBGU0xfVURDX0NPUkUgQ29ycnVwdGVkIHJlcXVlc3QgbGlzdCBs
ZWFkcyB0byB1bnJlY292ZXJhYmxlIGxvb3AuDQoNCkhpLCB0aGlzIGlzIHlvdXIgTGludXgga2Vy
bmVsIHJlZ3Jlc3Npb24gdHJhY2tlciBzcGVha2luZy4NCg0KVG9wLXBvc3RpbmcgZm9yIG9uY2Us
IHRvIG1ha2UgdGhpcyBlYXN5IHRvIHByb2Nlc3MgZm9yIGV2ZXJ5b25lOg0KDQpMaSBZYW5nIGFu
ZCBGZWxpcGUgQmFsYmk6IGhvdyB0byBtb3ZlIG9uIHdpdGggdGhpcz8gSXQncyBxdWl0ZSBhbiBv
bGQgcmVncmVzc2lvbiwgYnV0IG5ldmVydGhlbGVzcyBpdCBpcyBvbmUgYW5kIHRodXMgc2hvdWxk
IGJlIGZpeGVkLiBQYXJ0IG9mIG15IHBvc2l0aW9uIGlzIHRvIG1ha2UgdGhhdCBoYXBwZW4gYW5k
IHRodXMgcmVtaW5kIGRldmVsb3BlcnMgYW5kIG1haW50YWluZXJzIGFib3V0IHRoaXMgdW50aWwg
dGhlIHJlZ3Jlc3Npb24gaXMgcmVzb2x2ZWQuDQoNCkNpYW8sIFRob3JzdGVuDQoNCk9uIDE2LjEx
LjIxIDIwOjExLCBFdWdlbmUgQm9yZGVua2lyY2hlciB3cm90ZToNCj4gT24gMDIuMTEuMjEgMjI6
MTUsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+PiBPbiBTYXQsIDIwMjEtMTAtMzAgYXQgMTQ6
MjAgKzAwMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+Pj4gT24gRnJpLCAyMDIxLTEwLTI5
IGF0IDE3OjE0ICswMDAwLCBFdWdlbmUgQm9yZGVua2lyY2hlciB3cm90ZToNCj4+DQo+Pj4+IFdl
J3ZlIGRpc2NvdmVyZWQgYSBzaXR1YXRpb24gd2hlcmUgdGhlIEZTTCB1ZGMgZHJpdmVyIChkcml2
ZXJzL3VzYi9nYWRnZXQvdWRjL2ZzbF91ZGNfY29yZS5jKSB3aWxsIGVudGVyIGEgbG9vcCBpdGVy
YXRpbmcgb3ZlciB0aGUgcmVxdWVzdCBxdWV1ZSwgYnV0IHRoZSBxdWV1ZSBoYXMgYmVlbiBjb3Jy
dXB0ZWQgYXQgc29tZSBwb2ludCBzbyBpdCBsb29wcyBpbmZpbml0ZWx5LiAgSSBiZWxpZXZlIHdl
IGhhdmUgbmFycm93ZWQgaW50byB0aGUgb2ZmZW5kaW5nIGNvZGUsIGJ1dCB3ZSBhcmUgaW4gbmVl
ZCBvZiBhc3Npc3RhbmNlIHRyeWluZyB0byBmaW5kIGFuIGFwcHJvcHJpYXRlIGZpeCBmb3IgdGhl
IHByb2JsZW0uICBUaGUgaWRlbnRpZmllZCBjb2RlIGFwcGVhcnMgdG8gYmUgaW4gYWxsIHZlcnNp
b25zIG9mIHRoZSBMaW51eCBrZXJuZWwgdGhlIGRyaXZlciBleGlzdHMgaW4uDQo+Pj4+DQo+Pj4+
IFRoZSBwcm9ibGVtIGFwcGVhcnMgdG8gYmUgd2hlbiBoYW5kbGluZyBhIFVTQl9SRVFfR0VUX1NU
QVRVUyByZXF1ZXN0LiAgVGhlIGRyaXZlciBnZXRzIHRoaXMgcmVxdWVzdCBhbmQgdGhlbiBjYWxs
cyB0aGUgY2g5Z2V0c3RhdHVzKCkgZnVuY3Rpb24uICBJbiB0aGlzIGZ1bmN0aW9uLCBpdCBzdGFy
dHMgYSByZXF1ZXN0IGJ5ICJib3Jyb3dpbmciIHRoZSBwZXIgZGV2aWNlIHN0YXR1c19yZXEsIGZp
bGxpbmcgaXQgaW4sIGFuZCB0aGVuIHF1ZXVpbmcgaXQgd2l0aCBhIGNhbGwgdG8gbGlzdF9hZGRf
dGFpbCgpIHRvIGFkZCB0aGUgcmVxdWVzdCB0byB0aGUgZW5kcG9pbnQgcXVldWUuICBSaWdodCBi
ZWZvcmUgaXQgZXhpdHMgdGhlIGZ1bmN0aW9uIGhvd2V2ZXIsIGl0J3MgY2FsbGluZyBlcDBfcHJp
bWVfc3RhdHVzKCksIHdoaWNoIGlzIGZpbGxpbmcgb3V0IHRoYXQgc2FtZSBzdGF0dXNfcmVxIHN0
cnVjdHVyZSBhbmQgdGhlbiBxdWV1aW5nIGl0IHdpdGggYW5vdGhlciBjYWxsIHRvIGxpc3RfYWRk
X3RhaWwoKSB0byBhZGQgdGhlIHJlcXVlc3QgdG8gdGhlIGVuZHBvaW50IHF1ZXVlLiAgVGhpcyBh
ZGRzIHR3byBpbnN0YW5jZXMgb2YgdGhlIGV4YWN0IHNhbWUgTElTVF9IRUFEIHRvIHRoZSBlbmRw
b2ludCBxdWV1ZSwgd2hpY2ggYnJlYWtzIHRoZSBsaXN0IHNpbmNlIHRoZSBwcmV2IGFuZCBuZXh0
IHBvaW50ZXJzIGVuZCB1cCBwb2ludGluZyB0byB0aGUgd3JvbmcgdGhpbmdzLiAgVGhpcyBlbmRz
IHVwIGNhdXNpbmcgYSBoYXJkIGxvb3AgdGhlIG5leHQgdGltZSBudWtlKCkgZ2V0cyBjYWxsZWQs
IHdoaWNoIGhhcHBlbnMgb24gdGhlIG5leHQgc2V0dXAgSVJRLg0KPj4+Pg0KPj4+PiBJJ20gbm90
IHN1cmUgd2hhdCB0aGUgYXBwcm9wcmlhdGUgZml4IHRvIHRoaXMgcHJvYmxlbSBpcywgbW9zdGx5
IGR1ZSB0byBteSBsYWNrIG9mIGV4cGVydGlzZSBpbiBVU0IgYW5kIHRoaXMgZHJpdmVyIHN0YWNr
LiAgVGhlIGNvZGUgaGFzIGJlZW4gdGhpcyB3YXkgaW4gdGhlIGtlcm5lbCBmb3IgYSB2ZXJ5IGxv
bmcgdGltZSwgd2hpY2ggc3VnZ2VzdHMgdGhhdCBpdCBoYXMgYmVlbiB3b3JraW5nLCB1bmxlc3Mg
VVNCX1JFUV9HRVRfU1RBVFVTIHJlcXVlc3RzIGFyZSBuZXZlciBtYWRlLiAgVGhpcyBmdXJ0aGVy
IHN1Z2dlc3RzIHRoYXQgdGhlcmUgaXMgc29tZXRoaW5nIGVsc2UgZ29pbmcgb24gdGhhdCBJIGRv
bid0IHVuZGVyc3RhbmQuICBEZWxldGluZyB0aGUgY2FsbCB0byBlcDBfcHJpbWVfc3RhdHVzKCkg
YW5kIHRoZSBmb2xsb3dpbmcgZXAwc3RhbGwoKSBjYWxsIGFwcGVhcnMsIG9uIHRoZSBzdXJmYWNl
LCB0byBnZXQgdGhlIGRldmljZSB3b3JraW5nIGFnYWluLCBidXQgbWF5IGhhdmUgc2lkZSBlZmZl
Y3RzIHRoYXQgSSdtIG5vdCBzZWVpbmcuDQo+Pj4+DQo+Pj4+IEknbSBob3BlZnVsIHNvbWVvbmUg
aW4gdGhlIGNvbW11bml0eSBjYW4gaGVscCBwcm92aWRlIHNvbWUgaW5mb3JtYXRpb24gb24gd2hh
dCBJIG1heSBiZSBtaXNzaW5nIG9yIGhlbHAgY29tZSB1cCB3aXRoIGEgc29sdXRpb24gdG8gdGhl
IHByb2JsZW0uICBBIGJpZyB0aGFuayB5b3UgdG8gYW55b25lIHdobyB3b3VsZCBsaWtlIHRvIGhl
bHAgb3V0Lg0KPj4+DQo+Pj4gUnVuIGludG8gdGhpcyB0byBhIHdoaWxlIGFnby4gRm91bmQgdGhl
IGJ1ZyBhbmQgYSBmZXcgbW9yZSBmaXhlcy4NCj4+PiBUaGlzIGlzIGFnYWluc3QgNC4xOSBzbyB5
b3UgbWF5IGhhdmUgdG8gdHdlYWsgdGhlbSBhIGJpdC4NCj4+PiBGZWVsIGZyZWUgdG8gdXBzdHJl
YW0gdGhlbS4NCj4+DQo+PiBDdXJpb3VzLCBkaWQgbXkgcGF0Y2hlcyBoZWxwPyBHb29kIHRvIGtu
b3duIG9uY2Ugd2UgdXBncmFkZSBhcyB3ZWxsLg0KPg0KPiBUaGVyZSdzIGdvb2QgbmV3cyBhbmQg
YmFkIG5ld3MuDQo+DQo+IFRoZSBnb29kIG5ld3MgaXMgdGhhdCB0aGlzIGFwcGVhcnMgdG8gc3Rv
cCB0aGUgZHJpdmVyIGZyb20gZW50ZXJpbmcgYW4gDQo+IGluZmluaXRlIGxvb3AsIHdoaWNoIHBy
ZXZlbnRzIHRoZSBMaW51eCBzeXN0ZW0gZnJvbSBsb2NraW5nIHVwIGFuZCANCj4gbmV2ZXIgcmVj
b3ZlcmluZy4gIFNvIEknbSB3aWxsaW5nIHRvIHNheSB3ZSd2ZSBtYWRlIHRoZSBiZWhhdmlvciAN
Cj4gYmV0dGVyLg0KPg0KPiBUaGUgYmFkIG5ld3MgaXMgdGhhdCBvbmNlIHdlIGdldCBwYXN0IHRo
aXMgcG9pbnQsIHRoZXJlIGlzIG5ldyBiYWQgDQo+IGJlaGF2aW9yLiAgV2hhdCBpcyBvbiB0b3Ag
b2YgdGhpcyBkcml2ZXIgaW4gb3VyIHN5c3RlbSBpcyB0aGUgUk5ESVMgDQo+IGdhZGdldCBkcml2
ZXIgY29tbXVuaWNhdGluZyB0byBhIExhcHRvcCBydW5uaW5nIFdpbjEwIC0xODA5Lg0KPiBFdmVy
eXRoaW5nIGFwcGVhcnMgdG8gd29yayBmaW5lIHdpdGggdGhlIExpbnV4IHN5c3RlbSB1bnRpbCB0
aGVyZSBpcyBhIA0KPiBVU0IgZGlzY29ubmVjdC4gIEFmdGVyIHRoZSBkaXNjb25uZWN0LCB0aGUg
TGludXggc2lkZSBhcHBlYXJzIHRvIA0KPiBjb250aW51ZSBvbiBqdXN0IGZpbmUsIGJ1dCB0aGUg
V2luZG93cyBzaWRlIGRvZXNuJ3Qgc2VlbSB0byByZWNvZ25pemUgDQo+IHRoZSBkaXNjb25uZWN0
LCB3aGljaCBjYXVzZXMgdGhlIFVTQiBkcml2ZXIgb24gdGhhdCBzaWRlIHRvIGhhbmcgDQo+IGZv
cmV2ZXIgYW5kIGV2ZW50dWFsbHkgYmx1ZSBzY3JlZW4gdGhlIGJveC4gIFRoaXMgZG9lc24ndCBo
YXBwZW4gb24NCj4gYWxsIG1hY2hpbmVzLCBqdXN0IGEgc2VsZWN0IGZldy4gICBJIHRoaW5rIHdl
IGNhbiBpc29sYXRlIHRoZQ0KPiBiZWhhdmlvciB0byBhIHNwZWNpZmljIGFudGl2aXJ1cy9zZWN1
cml0eSBzb2Z0d2FyZSBkcml2ZXIgdGhhdCBpcyANCj4gaW5zZXJ0aW5nIGl0c2VsZiBpbnRvIHRo
ZSBVU0Igc3RhY2sgYW5kIGZpbHRlcmluZyB0aGUgZGlzY29ubmVjdCANCj4gbWVzc2FnZSwgYnV0
IHdlJ3JlIHN0aWxsIHByb3ZpbmcgdGhhdC4NCj4NCj4gSSdtIGFib3V0IDkwJSBjZXJ0YWluIHRo
aXMgaXMgYSBkaWZmZXJlbnQgcHJvYmxlbSBhbmQgd2UgY2FuIGNhbGwgdGhpcyANCj4gcGF0Y2hz
ZXQgZ29vZCwgYXQgbGVhc3QgZm9yIG91ciB0ZXN0IHNldHVwLiAgTXkgb25seSBoZXNpdGF0aW9u
IGlzIGlmIA0KPiB0aGUgTGludXggc2lkZSBpcyBzZW5kaW5nIGEgc2V0IG9mIHJlc3BvbnNlcyB0
aGF0IGFyZSBjb25mdXNpbmcgdGhlIA0KPiBXaW5kb3dzIHNpZGUgKHNwZWNpZmljYWxseSB0aGlz
IGFudGl2aXJ1cykgb3Igbm90LiAgSSdkIGJlIGNvbnRlbnQgDQo+IGNhbGxpbmcgdGhhdCBhIHNl
cGFyYXRlIGRlZmVjdCB0aG91Z2ggYW5kIGxldHRpbmcgdGhpcyBvbmUgY2xvc2UgdXAgDQo+IHdp
dGggdGhhdCBwYXRjaHNldC4NCg0KUC5TLjogQXMgYSBMaW51eCBrZXJuZWwgcmVncmVzc2lvbiB0
cmFja2VyIEknbSBnZXR0aW5nIGEgbG90IG9mIHJlcG9ydHMgb24gbXkgdGFibGUuIEkgY2FuIG9u
bHkgbG9vayBicmllZmx5IGludG8gbW9zdCBvZiB0aGVtLiBVbmZvcnR1bmF0ZWx5IHRoZXJlZm9y
ZSBJIHNvbWV0aW1lcyB3aWxsIGdldCB0aGluZ3Mgd3Jvbmcgb3IgbWlzcyBzb21ldGhpbmcgaW1w
b3J0YW50Lg0KSSBob3BlIHRoYXQncyBub3QgdGhlIGNhc2UgaGVyZTsgaWYgeW91IHRoaW5rIGl0
IGlzLCBkb24ndCBoZXNpdGF0ZSB0byB0ZWxsIG1lIGFib3V0IGl0IGluIGEgcHVibGljIHJlcGx5
LiBUaGF0J3MgaW4gZXZlcnlvbmUncyBpbnRlcmVzdCwgYXMgd2hhdCBJIHdyb3RlIGFib3ZlIG1p
Z2h0IGJlIG1pc2xlYWRpbmcgdG8gZXZlcnlvbmUgcmVhZGluZyB0aGlzOyBhbnkgc3VnZ2VzdGlv
biBJIGdhdmUgdGhleSB0aHVzIG1pZ2h0IHNlbnQgc29tZW9uZSByZWFkaW5nIHRoaXMgZG93biB0
aGUgd3JvbmcgcmFiYml0IGhvbGUsIHdoaWNoIG5vbmUgb2YgdXMgd2FudHMuDQoNCkJUVywgSSBo
YXZlIG5vIHBlcnNvbmFsIGludGVyZXN0IGluIHRoaXMgaXNzdWUsIHdoaWNoIGlzIHRyYWNrZWQg
dXNpbmcgcmVnemJvdCwgbXkgTGludXgga2VybmVsIHJlZ3Jlc3Npb24gdHJhY2tpbmcgYm90ICho
dHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9saW51eC1yZWd0cmFja2luZy5sZWVt
aHVpcy5pbmZvL3JlZ3pib3QvX187ISFPN3VFODlZQ05WdyFhSGE1X21MTW5CZURqSU5sQXRWMTl0
QkhtLUhlOWpidXNYdWNNQTVoN29vbkh2TkZ3WXBPSEFhYXFxZXdQT3VHSzlIQXpKVXokICkuIEkn
bSBvbmx5IHBvc3RpbmcgdGhpcyBtYWlsIHRvIGdldCB0aGluZ3Mgcm9sbGluZyBhZ2FpbiBhbmQg
aGVuY2UgZG9uJ3QgbmVlZCB0byBiZSBDQyBvbiBhbGwgZnVydGhlciBhY3Rpdml0aWVzIHdydCB0
byB0aGlzIHJlZ3Jlc3Npb24uDQoNCiNyZWd6Ym90IHRpdGxlOiB1c2I6IGZzbF91ZGNfY29yZTog
Y29ycnVwdGVkIHJlcXVlc3QgbGlzdCBsZWFkcyB0byB1bnJlY292ZXJhYmxlIGxvb3ANCg==
