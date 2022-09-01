Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5885A8EBD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 08:51:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJBXy5hk1z3cFJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 16:51:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=qy9BgfBR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.85; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=qy9BgfBR;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90085.outbound.protection.outlook.com [40.107.9.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJBX91lGzz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 16:51:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpN9unb9KLbukjx3upfSbEmGiEyJ0u8X9njgz/J39L8a2pAQ+9BCVNQ/xD9cGXkn2/0L/TO0J420E4cxA3tH7XnleVBy00zZXtqhwGsRbUlNJk3ERma9JWfm39KBTnCYdjJ3g9Fr4YubZ1wffqFxcl2NLQBY8/qPdU9KeboNLx7SLM4nOtYJxtDWwY655a+jhIsjKhn6MzCZBScLcaVwrb0IhwptbuM7R+BWYsShwdcm6wUHD1Nt/J8qHdSYbAL2iqhtA6b266Ev4ziSGALQ58zzC9RjSlGrqNqSxs2LHb1PSKhioey5iFfY/fdJzXfVgdxIc5K3MIDlZ8NyERo+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPuPmXGYICsR6oJ77uAR5r3Xe6B8oLM7se+/c/Ml8BA=;
 b=P6/ElwAbiv+Iopf7XngSl/qf+WSMCSi1KnQnogYbG+zkMlta0F1o7NBCHz/sJ14OsK2v+aFPetmZsK69F+VmcCQCDHuqQ2SBXn5JIiLwHNrwio+qL9U5tPmZVz48uJqfTJ7Zx08YaboCb9fwQuB2MnbT5004zB83V2ybr8MXPzAvLc9taet8U8kPNsiHjrJCLvQM1RGXXKJzWXknADXOHRiV7HNT8ggtnuePlCzlqOCrQtGZSsG5rJ+pCcjKE8MUNqbQ5OvlZtSNRe8ZLnXtYrpzN4Yp8bXVVYrFC/m7i+sYj+MRTXnBuYpX6QQsGiPbDhQ0bkXluRkjaTvzCnWq6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPuPmXGYICsR6oJ77uAR5r3Xe6B8oLM7se+/c/Ml8BA=;
 b=qy9BgfBRZ2RZBTNNGGgLPCm9o4h+uQmyRUq7XeeO+qiYFcbxIzQ8iQ8XhZQxzvZ+a5+P3hQ3Kd1gRUgbS1YRCUww5G5wSIr2Io6dNhtvWo7cHBITOHQLnlYFAXLSDltIH8KPp8rg3BIMiBK9H61Opr1hoGHeiXQ+c9Yw8syqCFrpu9953rIhzI509wmpNYS6XzIAWYlnHc+OhaVuEIpkaKCNzC/V97PiY0vAXcVlxSX0izx3G0nMhNtd5k2OU+pYFtuLpgtfXhZmEgflIc+DDAoBSIiq6pt/8l9xOwOyNwpwF1MJZqE9ZW6fiKzJUlHVl6Yc20ujRwiPaxM5Q0sU/A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3135.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 06:50:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 06:50:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 2/4] static_call: Move static call selftest to
 static_call.c
Thread-Topic: [RFC PATCH 2/4] static_call: Move static call selftest to
 static_call.c
Thread-Index: AQHYvcfi1eQzoOj3ckWaGGklGo989K3KIr4A
Date: Thu, 1 Sep 2022 06:50:44 +0000
Message-ID: <92f0720b-776e-149d-d734-739ccf5e736b@csgroup.eu>
References: <20220901055823.152983-1-bgray@linux.ibm.com>
 <20220901055823.152983-3-bgray@linux.ibm.com>
In-Reply-To: <20220901055823.152983-3-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2324ae59-ba45-46ed-867b-08da8be64b27
x-ms-traffictypediagnostic: PAZP264MB3135:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  aaT4edoldHNBlmY8b0cpimo6oKNu/cU0Mupn4qjEyYYMAkNwQFceaEJ6QIbP2xEOtcwTz4ShFEaJlBC9kuCMStyphStQM7RY+8IguVQxhlfY8EKQgvx+53XG0/W6HuWOu9jnratI5G9oE7qHPDEg00q9DIOw6yDsNRSrZFNz1quK07O/C+yFNhaxPAbKhdYcMctiV4nrBuGcXk4g4MEYJReIdHoi8aQMD11T4PvZ0VXvRmrsV9rc2gvgH8lh8tRD/vnw1cWsTKXVxyLIqg9w1H5fbhqKo6ZNtYub5a9JMrJ6Y4OZlMCKVKhLq1xsVnI6RYsVJg5g/W9LZeWxTxl1twzPOUc59esgfK2Yse7t4Dyl/8/AvXb5EF/B8SFwJ5jnvNO087cMZPXU8K4oPUDg8OkQB6fdk8W/YsjM2Ov6+IfG+dBTuTxcaSIaEGVxF5n+U5xbVWtVrkaF7zf4X/9MsHxezWex3M419FzdPf04UxfeWU6kl06eEUbhcEBWaLewaOXpI4JiiqbrCRxOJ2Fsh1JCC3yGfH2DqblTyuEUgzh0n1NxOyUk9OvTjjuqo7DAoAfYaw17EoUVH3ZbYldpX5Bfcniw1RwGJAZ+ZBYOzeFdbK/LQU5u83o+v8dXP61OMxzA/uKuhhC+SozsgqNFWyUpIn0WItOMMLx6xe8wBw9I/lETko0f3zxZPABYUdCI4eIGPHeYp4AqU66fRgHxncOUpvRJwK/godIkTqg+glJVPDk91hq03BZBtiUkLTAIevczbaIcPjdu+tYRcYMyV0Wm0NrAnGhYKha4vBVgMTh+PcvRqvbziNpJQJaHM9yNsRIuV6+MqOQBs0IkZXb6/A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(136003)(346002)(366004)(396003)(376002)(83380400001)(54906003)(110136005)(31696002)(41300700001)(86362001)(26005)(6506007)(66574015)(71200400001)(6512007)(478600001)(186003)(6486002)(2616005)(31686004)(8936002)(2906002)(36756003)(38070700005)(44832011)(5660300002)(7416002)(122000001)(4326008)(66446008)(64756008)(8676002)(66476007)(66946007)(76116006)(66556008)(38100700002)(91956017)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YWFOK3NWMEtSL1RuaWVpU2drRjFzSnRoTnhDSENwaUVwKy9jTXlKMVBscTRk?=
 =?utf-8?B?WEdNRFBxQ3FnNFZ0bTNXQ2tTKytVWVVDdDBDcDc3OHc4bUtIL0ljZFVCc3l4?=
 =?utf-8?B?Vks4Vlc3VU9xY282TFB5QUwwNE14Q0xiQlJrQ0VwSDAwOTdrOTR6K3NGb0lG?=
 =?utf-8?B?K0lYRFlBcHdYdVhoWEc0MEZWUkhyaXR1ZGJ2WFhIQ1p4K2RGVzZPWVdnWXp5?=
 =?utf-8?B?eU9Wb0I5L3BZQVhSdmhJaEN0WUtIT2dIa3V2aUZTZE5JOTNPd0tvKzVSSjJN?=
 =?utf-8?B?T0pxWkEySEJ0UkJwUnZibS9DakdGbUl1cE1ySVh4L0tTL05KdU1ad2VoVkJz?=
 =?utf-8?B?eE1GN0NpMEVWK0xINWpSR0E1YktCek0xME9WWURDd2dLR3YxYjZpdHYzUHpZ?=
 =?utf-8?B?NzBMZ1ovT2IxVGFEVS9oODB3MzRackVPK2xEeWNEeThhUDlhY3czMXB2V29B?=
 =?utf-8?B?NDFyN3JzSXFRd3lzcDY5NGZMdFZpRWtJcE80d0o5NlZ5dXM5ZHM5M01XaVpT?=
 =?utf-8?B?bGxLZkN4Mzc0REF3S3JmUkpjcnk1TU5LdWtxTmV2alcvSkU4TDFSaE4wSWxD?=
 =?utf-8?B?L2NmekRIODFUWHp4SGNjT052TFJ5Q2s3Kzl3VU02bmVPaTZlMzk4bXkwM1Yx?=
 =?utf-8?B?djlyRU1UdGFsS3RtdnVFSks1b1VGWWVFL1NZTmRveGxZeGtOVmE1dHhrVUpC?=
 =?utf-8?B?djV0d1VMUnFySk1PeCtLR1pybThsVWlOelBtMTBWMk9jUEZLY1ZZRlBsdVQ3?=
 =?utf-8?B?S0dLN0ZxSERJQnJZalZVeFJ1Q3RrbzIwZjFHcWN3QXN6aXVUUmN1RDFaU3pI?=
 =?utf-8?B?RHRMM1h5bmVRVHRXcG5idDNKcjdMeUxTeEl6eDFKNVpueWJLWkJ0Ti9UbUV1?=
 =?utf-8?B?QnBka0FZMDEyT0d5eC9LS2Npc1ZYSkZEOEtEN0RTN1VXc2lRR1JCeXF0TDJx?=
 =?utf-8?B?djI3c2xXT2hqYXh6V3MzZzRQUmptVTdyazFXR3UzUkxKSDFaNHcydjlhRnZO?=
 =?utf-8?B?QTVkR1ZvUldDcyt1RDhkUmFXWGN4Smw0QThoT0JlNmVuOE5ZRVhSYjFCUnRC?=
 =?utf-8?B?WUpiZDJvZTl5TXNzL3FERmxySVN5S01mU0FZZnNMU1hRbWJtL3dWWmdGMkRU?=
 =?utf-8?B?ZjcwZVhRdUhESTcwVlFNMEo0NGYzRUFuUDI4TmtDb2hSK0t3alVjVXBkNWJi?=
 =?utf-8?B?SmdIMFpzaHhPSDI4UGhLZHRDQlRJemRwY2pFTlNyQnBodzN5STE2ZlI2ODB0?=
 =?utf-8?B?Umw3YkdVNmZvc2IyTW90bEtBQnhTN09vengxQjQ1dkJoRXdycURUWWo4ODhQ?=
 =?utf-8?B?dERkZFBZRWdhUjAzREFPcE1yKzRxUDNDbGEwTmxaZVlhTFZsMEFPNzFpc09l?=
 =?utf-8?B?NVQ5QTc1Zy9WRUtyWUtiUWZsRU9jeHg1WTB2emNHZ3B0YmEvK3JmY1VrT3hG?=
 =?utf-8?B?ZnpqMEFJeENQc0hFYTNWZTNNRzhGaW1xaVBPb0p2ZWxiRisxN21JTnVVdmNV?=
 =?utf-8?B?TWp4L2FWUWl3Mnh5MFd2MFY2akZmV05tN050ZWRwb2JNTVBDQnVKcmJ0ZGFO?=
 =?utf-8?B?Sm1pOEhnTlppUHdLRElxc1hRemxLdDZOMytnSk1najlDQlpOYUh2eVhqbVY5?=
 =?utf-8?B?dVExYWVDd08zMWx3bTBpTExDMmREbXd0MHVrdU5QTXJvTVRaVEtLamN0M0M0?=
 =?utf-8?B?eUowVzdPY3pLbklaOWFmb0x1SEdtdFUyWktGcXh4NmN3YWxaM2FpZXYvWlNj?=
 =?utf-8?B?WndOdUVEcGxwMDRpeTVPaDVxZGdGenNFOHdrV1hqVUthV3RQaEVQUkJwUkR0?=
 =?utf-8?B?VmgyUEJUNngxUVNPQjZuQzdISC9mVXlmQ01GWVVkSEJKNTdsSFlVUXRPYUJs?=
 =?utf-8?B?MFN4OFJOdVJ5SDdUdmZEV3ZGQ2U0YzdHTFhyc21LdkpGdk05MmlJY3htR29D?=
 =?utf-8?B?K0diNXhFVGNVemg1YkdseU8xb2JEZmljVlRVUldpcFRabHdWWlh4K0RVVkFY?=
 =?utf-8?B?RXBLRmFVelRrUHBPdlNpMHZjMnd5aE1VamNwcCtKRkZocEh1MFVuMFhYQSti?=
 =?utf-8?B?Ung5aXc0OXBGYXVDMnBHVmhGSjRwb1hPV2FkV0N2OXpjRlN3V01hbFkreWp6?=
 =?utf-8?B?c25TTzRPdkNkOTZvSFpsNTBCcmFxMC9FaGlCYzdOc2pEMnZxSDlwUk9rZ3hD?=
 =?utf-8?Q?bttPDI1BrW97p1XuDVQeBak=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AA8D99E8A040346918504F44B762A21@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2324ae59-ba45-46ed-867b-08da8be64b27
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 06:50:44.5810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ISK8Y+PrDKVGQiHRwHsEERMr25SgqiELL4j6815BDjr7fxz2BfG3WdxJLghDEqtjmMSmiiHr2ZHGehHeB7bG7L1xCw6LyT1rr0tkKowEb1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3135
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA5LzIwMjIgw6AgMDc6NTgsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlc2UgdGVzdHMgYXJlIG91dC1vZi1saW5lIG9ubHksIHNvIG1vdmluZyB0aGVtIHRvIHRoZQ0K
PiBvdXQtb2YtbGluZSBmaWxlIGFsbG93cyB0aGVtIHRvIGJlIHJ1biB3aGVuIGFuIGFyY2ggZG9l
cw0KPiBub3QgaW1wbGVtZW50IGlubGluZSBzdGF0aWMgY2FsbHMuDQoNClRoZXNlIHRlc3RzIGxv
b2sgbGlrZSBzdGFuZGFsb25lIGNvZGUsIHdvdWxkIGJlIGJldHRlciB0byBoYXZlIGEgbmV3IA0K
c3RhdGljX2NhbGxfc2VsZnRlc3QuYyB0aGF0IGlzIGJ1aWx0IHdoZW4gQ09ORklHX1NUQVRJQ19D
QUxMX1NFTEZURVNUIGlzIA0Kc2V0Lg0KDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWlu
IEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiAgIGtlcm5lbC9zdGF0aWNfY2Fs
bC5jICAgICAgICB8IDQzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4g
ICBrZXJuZWwvc3RhdGljX2NhbGxfaW5saW5lLmMgfCA0MyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCA0
MyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9rZXJuZWwvc3RhdGljX2NhbGwuYyBi
L2tlcm5lbC9zdGF0aWNfY2FsbC5jDQo+IGluZGV4IGU5YzNlNjlmMzgzNy4uOTUzZWM0NmU1Njkx
IDEwMDY0NA0KPiAtLS0gYS9rZXJuZWwvc3RhdGljX2NhbGwuYw0KPiArKysgYi9rZXJuZWwvc3Rh
dGljX2NhbGwuYw0KPiBAQCAtNiwzICs2LDQ2IEBAIGxvbmcgX19zdGF0aWNfY2FsbF9yZXR1cm4w
KHZvaWQpDQo+ICAgICAgICAgIHJldHVybiAwOw0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MX0dQ
TChfX3N0YXRpY19jYWxsX3JldHVybjApOw0KPiArDQo+ICsjaWZkZWYgQ09ORklHX1NUQVRJQ19D
QUxMX1NFTEZURVNUDQo+ICsNCj4gK3N0YXRpYyBpbnQgZnVuY19hKGludCB4KQ0KPiArew0KPiAr
ICAgICAgIHJldHVybiB4KzE7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgZnVuY19iKGludCB4
KQ0KPiArew0KPiArICAgICAgIHJldHVybiB4KzI7DQo+ICt9DQo+ICsNCj4gK0RFRklORV9TVEFU
SUNfQ0FMTChzY19zZWxmdGVzdCwgZnVuY19hKTsNCj4gKw0KPiArc3RhdGljIHN0cnVjdCBzdGF0
aWNfY2FsbF9kYXRhIHsNCj4gKyAgICAgICBpbnQgKCpmdW5jKShpbnQpOw0KPiArICAgICAgIGlu
dCB2YWw7DQo+ICsgICAgICAgaW50IGV4cGVjdDsNCj4gK30gc3RhdGljX2NhbGxfZGF0YSBbXSBf
X2luaXRkYXRhID0gew0KPiArICAgICAgIHsgTlVMTCwgICAyLCAzIH0sDQo+ICsgICAgICAgeyBm
dW5jX2IsIDIsIDQgfSwNCj4gKyAgICAgICB7IGZ1bmNfYSwgMiwgMyB9DQo+ICt9Ow0KPiArDQo+
ICtzdGF0aWMgaW50IF9faW5pdCB0ZXN0X3N0YXRpY19jYWxsX2luaXQodm9pZCkNCj4gK3sNCj4g
KyAgICAgICBpbnQgaTsNCj4gKw0KPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KHN0YXRpY19jYWxsX2RhdGEpOyBpKysgKSB7DQo+ICsgICAgICAgICAgICAgICBzdHJ1Y3Qgc3Rh
dGljX2NhbGxfZGF0YSAqc2NkID0gJnN0YXRpY19jYWxsX2RhdGFbaV07DQo+ICsNCj4gKyAgICAg
ICAgICAgICAgIGlmIChzY2QtPmZ1bmMpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXRp
Y19jYWxsX3VwZGF0ZShzY19zZWxmdGVzdCwgc2NkLT5mdW5jKTsNCj4gKw0KPiArICAgICAgICAg
ICAgICAgV0FSTl9PTihzdGF0aWNfY2FsbChzY19zZWxmdGVzdCkoc2NkLT52YWwpICE9IHNjZC0+
ZXhwZWN0KTsNCj4gKyAgICAgICB9DQo+ICsNCj4gKyAgICAgICByZXR1cm4gMDsNCj4gK30NCj4g
K2Vhcmx5X2luaXRjYWxsKHRlc3Rfc3RhdGljX2NhbGxfaW5pdCk7DQo+ICsNCj4gKyNlbmRpZiAv
KiBDT05GSUdfU1RBVElDX0NBTExfU0VMRlRFU1QgKi8NCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9z
dGF0aWNfY2FsbF9pbmxpbmUuYyBiL2tlcm5lbC9zdGF0aWNfY2FsbF9pbmxpbmUuYw0KPiBpbmRl
eCBkYzU2NjViNjI4MTQuLjY0ZDA0ZDA1NDY5OCAxMDA2NDQNCj4gLS0tIGEva2VybmVsL3N0YXRp
Y19jYWxsX2lubGluZS5jDQo+ICsrKyBiL2tlcm5lbC9zdGF0aWNfY2FsbF9pbmxpbmUuYw0KPiBA
QCAtNDk4LDQ2ICs0OTgsMyBAQCBpbnQgX19pbml0IHN0YXRpY19jYWxsX2luaXQodm9pZCkNCj4g
ICAgICAgICAgcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIGVhcmx5X2luaXRjYWxsKHN0YXRpY19jYWxs
X2luaXQpOw0KPiAtDQo+IC0jaWZkZWYgQ09ORklHX1NUQVRJQ19DQUxMX1NFTEZURVNUDQo+IC0N
Cj4gLXN0YXRpYyBpbnQgZnVuY19hKGludCB4KQ0KPiAtew0KPiAtICAgICAgIHJldHVybiB4KzE7
DQo+IC19DQo+IC0NCj4gLXN0YXRpYyBpbnQgZnVuY19iKGludCB4KQ0KPiAtew0KPiAtICAgICAg
IHJldHVybiB4KzI7DQo+IC19DQo+IC0NCj4gLURFRklORV9TVEFUSUNfQ0FMTChzY19zZWxmdGVz
dCwgZnVuY19hKTsNCj4gLQ0KPiAtc3RhdGljIHN0cnVjdCBzdGF0aWNfY2FsbF9kYXRhIHsNCj4g
LSAgICAgIGludCAoKmZ1bmMpKGludCk7DQo+IC0gICAgICBpbnQgdmFsOw0KPiAtICAgICAgaW50
IGV4cGVjdDsNCj4gLX0gc3RhdGljX2NhbGxfZGF0YSBbXSBfX2luaXRkYXRhID0gew0KPiAtICAg
ICAgeyBOVUxMLCAgIDIsIDMgfSwNCj4gLSAgICAgIHsgZnVuY19iLCAyLCA0IH0sDQo+IC0gICAg
ICB7IGZ1bmNfYSwgMiwgMyB9DQo+IC19Ow0KPiAtDQo+IC1zdGF0aWMgaW50IF9faW5pdCB0ZXN0
X3N0YXRpY19jYWxsX2luaXQodm9pZCkNCj4gLXsNCj4gLSAgICAgIGludCBpOw0KPiAtDQo+IC0g
ICAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzdGF0aWNfY2FsbF9kYXRhKTsgaSsrICkg
ew0KPiAtICAgICAgICAgICAgIHN0cnVjdCBzdGF0aWNfY2FsbF9kYXRhICpzY2QgPSAmc3RhdGlj
X2NhbGxfZGF0YVtpXTsNCj4gLQ0KPiAtICAgICAgICAgICAgICBpZiAoc2NkLT5mdW5jKQ0KPiAt
ICAgICAgICAgICAgICAgICAgICAgIHN0YXRpY19jYWxsX3VwZGF0ZShzY19zZWxmdGVzdCwgc2Nk
LT5mdW5jKTsNCj4gLQ0KPiAtICAgICAgICAgICAgICBXQVJOX09OKHN0YXRpY19jYWxsKHNjX3Nl
bGZ0ZXN0KShzY2QtPnZhbCkgIT0gc2NkLT5leHBlY3QpOw0KPiAtICAgICAgfQ0KPiAtDQo+IC0g
ICAgICByZXR1cm4gMDsNCj4gLX0NCj4gLWVhcmx5X2luaXRjYWxsKHRlc3Rfc3RhdGljX2NhbGxf
aW5pdCk7DQo+IC0NCj4gLSNlbmRpZiAvKiBDT05GSUdfU1RBVElDX0NBTExfU0VMRlRFU1QgKi8N
Cj4gLS0NCj4gMi4zNy4yDQo+IA==
