Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C80EB3A4291
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 14:59:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1gss2xZpz3bvd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 22:59:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=GXyLfXH8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=579658a80c=clm@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=GXyLfXH8; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1gsF4Gs6z2ymN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 22:59:12 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.43/8.16.0.43) with SMTP id 15BCtfSX020303;
 Fri, 11 Jun 2021 05:59:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=1Odm7n1R5mKZBER6gJN89XcGzGFIJYcLUSrXgxBt45M=;
 b=GXyLfXH8Wh9HB/xBL9DGakGBSrAJhNviu8V8zPDIXiotVjMfxtvMpvNFvOox7SFmdxvP
 rGFb081cZ5Ahs8o5gL1bAGYXI45m2QT+aL/uo7IFCAP3XUwDseit/MFePSjuSCbeFIFS
 yLm9fOZFHACmyCRcCZZmGrWBaCajx7dEtJU= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net with ESMTP id 393scmvj4v-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 11 Jun 2021 05:59:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 05:59:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvC2mfAJvwSlTEpsvfrqxoNwpW8Sx7G9DQTk96dyrI1IoHOLJsAyT/u+xd0aPG4VsdEsIeAUoHH6ez1MNh7oUswOmIEXJERKL4mV+KHJE4bix1uuRb7PcUJfTjvPARcwsKYEJOtBIp1jsHxvBgqfDayIq/hOsgdiRoe2UKUlm6+tlK8eIkOsZ9WorvKusGyCUUloXSd7ogI/lBZKH5kGMdVMQ0Qqy7VAO2w+t5iPepQZnd/hP9W3Ih5OqtZjQX2esFAZPIol+IJzwzHitcCk0YbIqLtYCLLcInXvgiKQSuMmJaTLKzPm0bemiu+Uh/zxzdu6uIJ/RY8LS251ve1GYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Odm7n1R5mKZBER6gJN89XcGzGFIJYcLUSrXgxBt45M=;
 b=b6E/qpNnuTATogeQ3MmB43QtA4UixL30QCBg3J/6ufPbMTIBAi01bJSuiFkFif0zaLEr2d/FTDgCKegZejF6X+q+iO1SzxGJQGYilcDzd9I8X1I7idBhoPzaCLuL0RZNiRLqWhlhCZ793CZrcet1bzRofvWsyQb4XsNETfjbMqwmbMsKEX97vD2Ob+3zTqRyUnd4dztzWZ832uHspghJbWAY8ZvkkT0QdevAQl+fla7FPKyCq4kCVRL0lfmbdlHLXSHAlK8IB7WVg1UgO8H1otJb65GvBuW8OpiGUzi4JOjoHE2prdeKp1bbHiTDLmsZfzQ1z54M0yn+/LCX0zeu6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from CO1PR15MB4924.namprd15.prod.outlook.com (2603:10b6:303:e3::16)
 by MWHPR15MB1343.namprd15.prod.outlook.com (2603:10b6:320:25::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 12:58:58 +0000
Received: from CO1PR15MB4924.namprd15.prod.outlook.com
 ([fe80::2d50:36f7:4bce:9b01]) by CO1PR15MB4924.namprd15.prod.outlook.com
 ([fe80::2d50:36f7:4bce:9b01%6]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 12:58:58 +0000
From: Chris Mason <clm@fb.com>
To: "dsterba@suse.cz" <dsterba@suse.cz>
Subject: Re: [PATCH] btrfs: Disable BTRFS on platforms having 256K pages
Thread-Topic: [PATCH] btrfs: Disable BTRFS on platforms having 256K pages
Thread-Index: AQHXXgAh7cM+p+g0g0iDshoLzzyYuqsNU9CAgAAZUgCAAVnygA==
Date: Fri, 11 Jun 2021 12:58:58 +0000
Message-ID: <6769ED4C-15A8-4CFF-BF2B-26A5328257A0@fb.com>
References: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
 <185278AF-1D87-432D-87E9-C86B3223113E@fb.com>
 <cdadf66e-0a6e-4efe-0326-7236c43b2735@csgroup.eu>
 <20210610162046.GB28158@suse.cz>
In-Reply-To: <20210610162046.GB28158@suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.100.0.2.22)
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c091:480::1:ee07]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a7a5a11-7301-48b2-4019-08d92cd8ada6
x-ms-traffictypediagnostic: MWHPR15MB1343:
x-microsoft-antispam-prvs: <MWHPR15MB134319A6894349082C7441E2D3349@MWHPR15MB1343.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O2Qavn6BpKgfIM1Bru/fdKAy9axqWw4zytOMWL5Mz12DPUbbJRPl/76O4OypDibF3CfOVaA5Rztvs8prHqKYlE1yP/sG/gu6LlUbxzVs2maeuGeC+Bk/awlQycJMoYlgt5DR+PIObhGL31BEsDvcl7wDaOKcMsRbIaeJRN1lG2k5mIR5wBWqNYnICAFq3JnfeuIskAprpNd6SINPOT58XQ8xPs82LwJAlqaEfSfPB1eQRVtppXFxDDOjtcM76IvXKxz4bDtFk4JoFjHyqQzfEUf3j5Ks3FZbUsPUxL7HEmzfUTGJKIl99q00TDNMsuweoCUZ2kt043n0ejjvlRZThx9XLHdO/0P6FUNT2p6wMEthlQGW0mit1dTpRD04YgQB5ZtDplWtZydgBNFJwQ8WKQX9TygT4DW34TltMsS/Wia5SXAW6sbI9mDNyfSv3umhfi3gZQ68E7sRnW5gZJLdVEqRlJ4viFwzKGpEBQB1WNniVXRXqYluhBsQHKJHvaFDkoTaGfF57V7+VuqOqLSB5+NVFbhNcgSDs7V82SbaOAABwJP72Bnz72HNU3WBvzu2mliF1LEnzOFVqafTxNZk/bO5BKhHQ0vWDZ5h5z5uFYPeW0VgMNenyTuc1nVYIr3Rq4UrEcEitxcQgQRRifWHDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR15MB4924.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(76116006)(5660300002)(316002)(8936002)(91956017)(186003)(6506007)(53546011)(2616005)(86362001)(36756003)(54906003)(38100700002)(122000001)(83380400001)(66556008)(66446008)(66476007)(8676002)(64756008)(4326008)(6486002)(6916009)(66946007)(478600001)(71200400001)(2906002)(33656002)(6512007)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVFSTHNDVVFvQzA2bDZ6VnozL1U1a0RmYVp1cTFRSFc0RlZDWjcvTFVqMTVi?=
 =?utf-8?B?OGhOWkh1K3RNTVdQakZNbndCZnV0UFZMWVdFbkJ3LzZFbnMwOC9CTEk0WDFM?=
 =?utf-8?B?YjkzejlBUVdTWCtQQlNyVENsRHFzUHNMZTNudnluZXNkZ1RxaUpSUjY0L05S?=
 =?utf-8?B?STlhUTJCWHI5WUxWU01TNENzOGc2TnhmQWJjL2N1aXNzL2IvSWRxSHJaeFE1?=
 =?utf-8?B?QW0vTDJhZS82UUxSTWFoMjNyK3F3RnJQVnRrMlR1N2JhSkdreTlFRXZjdnc1?=
 =?utf-8?B?bGVkUGZGWTMvUFBJMDNGYWJOdzU2N3owNkltS0c2bXludERVZGF1SjlnQU1X?=
 =?utf-8?B?SjJyK0VsTDZzaFJIVm40bDBad0tYMXFGWXV1MDBZb3dVRmY3VUdHSFNiUW1q?=
 =?utf-8?B?bituY3lWdUwxTDd2cjNjS2Z5c2pFOGVxRnZ5a1dMOHBPYnFHeDEvYlJZaXgy?=
 =?utf-8?B?ODlVODY4T3kxcnhhaGoyNkwyQ2ZEemxJL1BSVTlEMW5NQXAzaE9JSjJPaFlK?=
 =?utf-8?B?dGg1MURzak5pbkVqTFVLZEMzM0ZMMElSVnVhckV6cVNheXlaL2JKazJTdGMy?=
 =?utf-8?B?bk1PTWlzU29oZ1duWlUwNDdOY3FZV2NQZGJhb3lHZkY3NUhEbERmTkxORnRp?=
 =?utf-8?B?ZllqaXpGWjFRdUpNa0pKWmZjVk5UUFVjT2Z2SWUyVEJMd2hmeVBoNWZnUWxn?=
 =?utf-8?B?c1dFWHl2NmNQVmM4c1doQ21Qdk9idDlHWTZEUFJSc3hHZGNjaksxVTlXejlj?=
 =?utf-8?B?MGYyK1RNcUc1QmdHS2w4cWl0Rm12SzFQTjB0eFk0ZXNqMWoyYmJaS1pGOEdh?=
 =?utf-8?B?Y0RjeU5TOEpTNDNzQ1dmclRQZG1aZkV2SlFQOE5KQitJMjVRQ2N4cFAzTTBl?=
 =?utf-8?B?dnNRbmloU0NqQ29FTFFuVGVRcEtKb3JONkxhMlpXVWpwWlJrQmExMGVFMk00?=
 =?utf-8?B?Ym84dTB5NHJNYU4rSnhJdmdkSWhkZis4SS9kdWxMR1BzZklubWM2bUVnZnJ5?=
 =?utf-8?B?YysyVjhmcCtqenlEMmpSbTdaSXY0STgxT2lxVjJIbEx4Tk9uVzVNaXhDaXJI?=
 =?utf-8?B?OHA3WWVXaWppWnhXTmdiSXVUZ0h1T3dnZTk4VmxVc2NNR1FnaEpFdittclJn?=
 =?utf-8?B?cFNxMjFsb2NBaXRIYTRNRFZ4elh5bTk1eDlLYWxmOW44d1c5OEFWd3JVZE4z?=
 =?utf-8?B?ekRseE1pbmZIb2piN2NUWUhVOU5tektOMkY5d1hsc0VDSUcxZE1hZUwrM1BZ?=
 =?utf-8?B?bVJ2K2hlYWZETFF6UDdOVHdQM3BQaklWdkVhOWZFSDBsWUFZY1pLd0VEYVN1?=
 =?utf-8?B?c2ZDMi9RQUwyZ0x0ZVMzU2dsQllvVFVHTi9QNk1aTS9hb2E0R2VSbU0rN2RM?=
 =?utf-8?B?ZWxYVTAyekpraXVhajRnZ0NUMEJIbDNMTDAzS2lncWo1anRuUEozaTFwSk9Q?=
 =?utf-8?B?N2l2c1YrbnloVlFUaWp6T2Y3RUVEUjAvYVZNQ2dydTg5OG1kQk9BTWV3OWFL?=
 =?utf-8?B?OVJYb2tkWTlxRUlvYUR0RGg5Mjg0Q2lQV1hlWkNCMkNtajVtOXZuTktiZTM1?=
 =?utf-8?B?aUJyTlkrV1EzR2dCaGJqR0Z6NWNxTWZSNTZMZ1Q2S1pDZzk4b3dJdTlWU2FW?=
 =?utf-8?B?QkFEcGlnelRvd0RjTmpIZEFuRW84QlV6VVJ6TUVNNW1rMG9qSjdHS1ZHY2hl?=
 =?utf-8?B?OUJ1Tmp4QkVRSURRRXFzY1ZiSXcxU0NoSmFaU0pwa3dZS2ZQZElLOEpwSk5W?=
 =?utf-8?B?M1B1QjdJOXJsaVB2N2g3VGU3azI4TFBXd3BxZGNMSzN2QWFDanhUbzZLWG1y?=
 =?utf-8?Q?CKjdbxn/N9nsvhMq3E7Yzh1v7viqF6B+K9r8o=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3578489A2DE29A4CAA2B434D1802B8D6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR15MB4924.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7a5a11-7301-48b2-4019-08d92cd8ada6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 12:58:58.5884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7xDUKeVPUvV24rUG4cj7AH1Fo7nPMC7MA4ZoosPJMrKG3/zazBh6yadbcArk4Vgr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1343
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: zDzmvpRLH6_xvZkGLqvT7P_AtmBa3GLo
X-Proofpoint-ORIG-GUID: zDzmvpRLH6_xvZkGLqvT7P_AtmBa3GLo
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-11_05:2021-06-11,
 2021-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106110083
X-FB-Internal: deliver
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
Cc: "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 Josef Bacik <josef@toxicpanda.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Sterba <dsterba@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQo+IE9uIEp1biAxMCwgMjAyMSwgYXQgMTI6MjAgUE0sIERhdmlkIFN0ZXJiYSA8ZHN0ZXJiYUBz
dXNlLmN6PiB3cm90ZToNCj4gDQo+IE9uIFRodSwgSnVuIDEwLCAyMDIxIGF0IDA0OjUwOjA5UE0g
KzAyMDAsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+PiANCj4+IA0KPj4gTGUgMTAvMDYvMjAy
MSDDoCAxNTo1NCwgQ2hyaXMgTWFzb24gYSDDqWNyaXQgOg0KPj4+IA0KPj4+PiBPbiBKdW4gMTAs
IDIwMjEsIGF0IDE6MjMgQU0sIENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nn
cm91cC5ldT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiBXaXRoIGEgY29uZmlnIGhhdmluZyBQQUdFX1NJ
WkUgc2V0IHRvIDI1NkssIEJUUkZTIGJ1aWxkIGZhaWxzDQo+Pj4+IHdpdGggdGhlIGZvbGxvd2lu
ZyBtZXNzYWdlDQo+Pj4+IA0KPj4+PiBpbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6MzI2
OjM4OiBlcnJvcjogY2FsbCB0byAnX19jb21waWxldGltZV9hc3NlcnRfNzkxJyBkZWNsYXJlZCB3
aXRoIGF0dHJpYnV0ZSBlcnJvcjogQlVJTERfQlVHX09OIGZhaWxlZDogKEJUUkZTX01BWF9DT01Q
UkVTU0VEICUgUEFHRV9TSVpFKSAhPSAwDQo+Pj4+IA0KPj4+PiBCVFJGU19NQVhfQ09NUFJFU1NF
RCBiZWluZyAxMjhLLCBCVFJGUyBjYW5ub3Qgc3VwcG9ydCBwbGF0Zm9ybXMgd2l0aA0KPj4+PiAy
NTZLIHBhZ2VzIGF0IHRoZSB0aW1lIGJlaW5nLg0KPj4+PiANCj4+Pj4gVGhlcmUgYXJlIHR3byBw
bGF0Zm9ybXMgdGhhdCBjYW4gc2VsZWN0IDI1NksgcGFnZXM6DQo+Pj4+IC0gaGV4YWdvbg0KPj4+
PiAtIHBvd2VycGMNCj4+Pj4gDQo+Pj4+IERpc2FibGUgQlRSRlMgd2hlbiAyNTZLIHBhZ2Ugc2l6
ZSBpcyBzZWxlY3RlZC4NCj4+Pj4gDQo+Pj4gDQo+Pj4gV2XigJlsbCBoYXZlIG90aGVyIHN1YnBh
Z2UgYmxvY2tzaXplIGNvbmNlcm5zIHdpdGggMjU2SyBwYWdlcywgYnV0IHRoaXMgQlRSRlNfTUFY
X0NPTVBSRVNTRUQgI2RlZmluZSBpcyBhcmJpdHJhcnkuICBJdOKAmXMganVzdCB0cnlpbmcgdG8g
aGF2ZSBhbiB1cHBlciBib3VuZCBvbiB0aGUgYW1vdW50IG9mIG1lbW9yeSB3ZeKAmWxsIG5lZWQg
dG8gdW5jb21wcmVzcyBhIHNpbmdsZSBwYWdl4oCZcyB3b3J0aCBvZiByYW5kb20gcmVhZHMuDQo+
Pj4gDQo+Pj4gV2UgY291bGQgY2hhbmdlIGl0IHRvIG1heChQQUdFX1NJWkUsIDEyOEspIG9yIGp1
c3QgYnVtcCB0byAyNTZLLg0KPj4+IA0KPj4gDQo+PiBCdXQgaWYgMjU2SyBpcyBwcm9ibGVtYXRp
YyBpbiBvdGhlciB3YXlzLCBpcyBpdCB3b3J0aCBidW1waW5nIEJUUkZTX01BWF9DT01QUkVTU0VE
IHRvIDI1NksgPw0KPj4gDQo+PiBEYXZpZCwgaW4gYmVsb3cgbWFpbCwgc2FpZCB0aGF0IDI1Nksg
c3VwcG9ydCB3b3VsZCByZXF1aXJlIGRlYXBlciBjaGFuZ2VzLiBTbyBkaXNhYmxpbmcgQlRSRlMg
DQo+PiBzdXBwb3J0IHNlZW1zIHRoZSBlYXNpZXN0IHNvbHV0aW9uIGZvciB0aGUgdGltZSBiZWlu
ZywgYXQgbGVhc3QgZm9yIFN0YWJsZSAoSSBmb3Jnb3QgdGhlIEZpeGVzOiB0YWcgDQo+PiBhbmQg
dGhlIENDOiB0byBzdGFibGUpLg0KPj4gDQo+PiBPbiBwb3dlcnBjLCAyNTZrIHBhZ2VzIGlzIGEg
Y29ybmVyIGNhc2UsIGl0IHJlcXVpcmVzIGN1c3RvbWlzZWQgYmludXRpbHMsIHNvIEkgZG9uJ3Qg
dGhpbmsgZGlzYWJsaW5nIA0KPj4gQlRSRlMgaXMgYSBpc3N1ZSB0aGVyZS4gRm9yIGhleGFnb24g
SSBkb24ndCBrbm93Lg0KPiANCj4gVGhhdCBpdCBibGV3IHVwIGR1ZSB0byB0aGUgbWF4IGNvbXBy
ZXNzZWQgc2l6ZSBpcyBhIGNvaW5jaWRlbmNlLiBXZQ0KPiBjb3VsZCBoYXZlIGV4cGxpY2l0IEJV
SUxEX0JVR19PTnMgZm9yIHBhZ2Ugc2l6ZSBvciBvdGhlciBjb25zdHJhaW50cw0KPiBkZXJpdmVk
IGZyb20gdGhlIHBhZ2Ugc2l6ZSBsaWtlIElOTElORV9FWFRFTlRfQlVGRkVSX1BBR0VTLg0KPiAN
Cg0KUmlnaHQsIHRoZSBjb25zdHJhaW50IGlzIGJpZ2dlciBhbmQgbW9yZSBjb21wbGV4IHRoYW4g
QlRSRlNfTUFYX0NPTVBSRVNTRUQuDQoNCj4gQW5kIHRoZXJlJ3Mgbm8gc3VjaCB0aGluZyBsaWtl
ICJqdXN0IGJ1bXAgQlRSRlNfTUFYX0NPTVBSRVNTRUQgdG8gMjU2SyIuDQo+IFRoZSBjb25zdGFu
dCBpcyBwYXJ0IG9mIG9uLWRpc2sgZm9ybWF0IGZvciBsem8gYW5kIG90aGVyd2lzZSBjaGFuZ2lu
ZyBpdA0KPiB3b3VsZCBpbXBhY3QgcGVyZm9ybWFuY2Ugc28gdGhpcyB3b3VsZCBuZWVkIHByb3Bl
ciBldmFsdWF0aW9uLg0KDQpTb3JyeSwgaG93IGlzIGl0IGJha2VkIGludG8gTFpPPyAgSXQgZGVm
aW5pdGVseSB3aWxsIGhhdmUgcGVyZm9ybWFuY2UgaW1wbGljYXRpb25zLCBJIGFncmVlIHRoZXJl
Lg0KDQotY2hyaXMNCg0K
