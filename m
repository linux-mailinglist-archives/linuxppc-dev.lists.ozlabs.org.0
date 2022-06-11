Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 513505472F9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 10:43:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKrvn1SMHz3cFH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 18:43:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=p1U1wLZp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60e; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=p1U1wLZp;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKrv15zjtz3bkR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 18:42:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2m2JdOhVZMZXsNthd0XJHULnyBbsWL6pfAGQWTA8CPlPQxXtNI85xWpKgRMj+6J8bzckoZlnu4WO9PD7uaif9u2FXORfDLJr0aCE3zwSG4cOoDlYqB0R2ygRrzmzC/9AlKMPbViYEdK2kDO3ql3wiQgD+/VIHshv67I15sEKZV5YkRwie0SXgav1djQ+AD5ipuiyhBCeT8VUfkznbbA6stRPuMP/hznbNaC4zQHZiuIj8E5vz0h06za4AnfUQCak9JW3AJ+FF4rcC6ZEupBQ3SZJscRvbQM+yQCdt8ZeEGJHRWDibmnoZ2grYVA4UXWiHof0swf+S8HcC9+tVNuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQUv/BYhZh52fZjV6sLTZ7Lsd7d9+7JFRgcFJCGeVtY=;
 b=d7jbBXMBsFyaL2fd8ga7mW3caGbcylxoJvPSD0eOQrpGt4CubEshSPR+Xjim4ZUM41Jv/+QD8h1VVzqzP6XNCHsg5fGztOjIBya9DrivJC2DpWJdExBUCz+bfVCW2XD4rkVR6E5qiNzWBvN8J+gb3NZM+7gA+L5F5jfMssiHDu96uXXQsUi4LaM3YD1VTXfFyZANpdvzuqhY0y2AeZ/PZw3aAs2E1w9kd27vH0QlmrN+rAY+E5RrMaVfea08iCzcxTWbnDYdZks+5PemabzTwAWhtIN3L09Gx8UfNg1napC1Aumx2vv/JxCv358B0mgxfJBXB2gr9Cz5F+jmn7qcxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQUv/BYhZh52fZjV6sLTZ7Lsd7d9+7JFRgcFJCGeVtY=;
 b=p1U1wLZpcLe3zHVFhoRo5lJXXdpD/F6rmd6TBCBaKS2Yh+7XLDUoqSAiIku5dNm/reGWOyF83oY0umbiFxtnI2my2BBH5eKdQTiNPUSu1Od+SeWk69iSbdRvINJ4oEqgMuuNcVxYgTmHyfl2/ch52a4Kp1VgUYOnjMVIwqlK/wTSh+PtjPLNhhF6ZeCTxXzuDiFxZviPWag97NKw9gbFHP5TcxUYAVacG00XxfvNQz064ETN+sWoh6MFgYG1xJYast+AJABXukfm2ITBGrUQxloalVUzjMGZRyF51QB/2MFYJ6hVIuD1mq0UiTwACQdMaP+3LaxgW2SgzmYpqzst6Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1524.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Sat, 11 Jun
 2022 08:42:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%6]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 08:42:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, Segher Boessenkool
	<segher@kernel.crashing.org>
Subject: Re: [PATCH 1/6] powerpc: Add ZERO_GPRS macros for register clears
Thread-Topic: [PATCH 1/6] powerpc: Add ZERO_GPRS macros for register clears
Thread-Index: AQHYdXtpaW8/+lAeO0S/NXN9LWGx5606tm+AgA1UKACAAejOAA==
Date: Sat, 11 Jun 2022 08:42:27 +0000
Message-ID: <d79992ce-d49b-314a-cb64-8804f43f6c03@csgroup.eu>
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
 <20220601160023.GV25951@gate.crashing.org>
 <88BD925A-D6A8-4983-A573-7D9CEE51CDE7@linux.ibm.com>
In-Reply-To: <88BD925A-D6A8-4983-A573-7D9CEE51CDE7@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c09892b5-98f6-4817-2e17-08da4b8650bb
x-ms-traffictypediagnostic: MR1P264MB1524:EE_
x-microsoft-antispam-prvs:  <MR1P264MB1524094452B47CC5021EAB99EDA99@MR1P264MB1524.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  m9wKSxW8No3wdeb3Ls6zDphLetNeZvMDj6fDyP4wfyBYG3rGN8I2rF7yF2+lQKhl6vmV+GFikq/Qkali8WqFBfapDOHsRvHef6p4x0qLQXL0Kgt51yxmGa0yRMVWK1pW44OLVeTgts4EkR/UclBnih0XveqRV33hsVfb2lsdUSav4i9PoSFAkb4pwrsOgo81iU1uP9Ww9jcrs3TZEyYIjRELyGss2sdLnd/LONbPfga4/ze15lzQy6aQIq06pu6mY3QSddLVFG3CVfKsuZYxNzuaZW0t86+6o2ytPTWZvbnq9IX7L++mhtbD1kDBchM5XmgDlbAwVSBWkPfHuVg09HS6GnTrq1VkPbKPbTminErj8lDm45Iytd08uJo5yjZZRXiyCYGYSnreipQdZV7uWQMrfS9PgYFEUYkNaA1UayVOspv7L1qPAf0G3Ig7/ZRPX0UQq3L6SyQsJkHdPimWyP+hfTrtBl/ImFbDvy2T6/JD9R5kqJ1jhUM/wSxyujBAZ7Mh3SHhGw+nD+/br7YMESZ74si6RWh9V3nefPO0srEWtR0HAwSSOfXMfkwgvS/w/PL9/gKb3eXtgNxsdLjrpQHsATnwUB5dJWk0zpnPLYpPPvpVe23LnEQS89nHhHklrY3k3V83zJD15eRFS4ZdfuM0cYCKIQdF7S53+4LC6p/0coGyTu+ut1aQXffkoeZP7TpWSJxEdnoQvVUxZZvusqbwE7IthLrDpRNV91pMmpyi79umkL2Dgrk0xpwTijvraGU4Nlq2ERsbSGA5Mc4cIQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(38100700002)(6486002)(44832011)(71200400001)(5660300002)(8936002)(508600001)(186003)(66574015)(110136005)(2616005)(2906002)(6506007)(31696002)(26005)(53546011)(86362001)(6512007)(76116006)(38070700005)(66946007)(91956017)(36756003)(66476007)(66446008)(54906003)(122000001)(64756008)(66556008)(316002)(31686004)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ajQ5dDVWZHdWa2VjdUN5SEVGSHlNTXBzZDc4WDlCRURqc3FORWFoTE91WExI?=
 =?utf-8?B?NDk1a1NrNGhoTkZyWjNwTHEvVk53Z3U5VDdTamtVN1pPRGNWOUZQY3hZZzY5?=
 =?utf-8?B?OWF2amN3dnhGZDI2b3BhZiswUHFlQzlsbjc3MmJOWEJteHZ0bXJ4cjB6dzg5?=
 =?utf-8?B?ZUZjKzdBUmFRZnNjVnpyS2ExcUtDZm9PRFl0ZUxaYVY3ZU1ISEJkV3BzeTE1?=
 =?utf-8?B?SFo1UVpXY3ZpdTdtNmFvaEFQVFBzMWZHOFJaekJ6b2ljL3VWTTRLRURZMXQy?=
 =?utf-8?B?NkhMT3llUWlKdDlWUDZoMGpyQWIxS2p1MkJDODB1MkwyYk5BbzhmMmd6ZktY?=
 =?utf-8?B?djhsZlgxaDJzbDU2Z1FXNktRb0FqMHZZOU9PNFI5YThZREpqMGMwazE3K3pN?=
 =?utf-8?B?YnBsU2JQRzZETkxNQXZ6L3ZPc0xscklLV05lMC9WNzB3eGNRd2hCc2JXa3J0?=
 =?utf-8?B?V1JWS3NNaEFBRFV0V0lsUlQyQlZVZERPTTJvcGY3dERZV0FCL3hMV3o4WHg5?=
 =?utf-8?B?MHBLZmFlMmRkUVd3LzdhZ3E0WVVvVWVZOVZsamxYUjBwYi9taEdOQVU4OHpS?=
 =?utf-8?B?OG1hZmJZQitTaTcyVTgzcU9xeUJZTGRGeGNFL256UXd1V3FWNEsxeTBJR3B0?=
 =?utf-8?B?YUpTTnphQ1dMRE9Eb3JPa1pOSVcwQjlsNStXT2Vqd005bGMrbGhRS3RtdWlG?=
 =?utf-8?B?RHlLb1drRGtYT1d6emVxVmFmQWhwbmFBK25LblI0T203K2FFVWdFZVlxTkVX?=
 =?utf-8?B?ZEN2SG84ck5UNDRWeTlHS3FXTW9DVUNEOEJ0OEYybjI4Y0N3d3h1WmdlRWN6?=
 =?utf-8?B?RzJsQmQ5Q3RUQkoxYjJ6Q3BsSkFWYVlRcGtucFYyeXRyeGtwTlAzVmx6aFcv?=
 =?utf-8?B?QlZuZUJKSFN4NGw5eUplMHJoZ1JwdjBWYUQ1N1dVU2h2ZDNPM3k2ZzZkWmFF?=
 =?utf-8?B?b0RuNTlobkpWRG92NnBNUXJqYSt0ZlRVVjNGNDVhR3NsTmgxM3N1RjNJcVYy?=
 =?utf-8?B?L003L2xBSitsdk5keVphbTNhRkJBU1VxQ0xFeFR2azQxM3dRWE95RjhWb29W?=
 =?utf-8?B?Wk9wbXIreGhQemtRUEdvZGNnOVBVd1VncUZiL2RuaUhoeUlRVERHYjJBTDlD?=
 =?utf-8?B?Y1FrSFpSZzVzY29nK2N2dzJiWlNMRDhYOERQb3orWXQ4ckJGNjEvRDNaQmRw?=
 =?utf-8?B?Qk9SdUdOWU1wQ1BQQXFRYlpaTCt3T01kTkpKQUV6OGpndjZ6MDNmRnhwMXV4?=
 =?utf-8?B?V01ya2k2SGRubm5HSnZJcFlXUXFjUFJYQmxvOCtTUFp0eWh2S0l3ZW03a3FO?=
 =?utf-8?B?Z2ptQ2VJWktpZFlweE0xTHJOTTArNFhzMVkvRVVYaXh5R085STNXSGc2TVhv?=
 =?utf-8?B?KzVkT2tOWTZlM1lNdXYrQml5QjRHT0UwQTZ4azRVQU0wbkFSdWRBNnBldGd1?=
 =?utf-8?B?QWZpSE02N0N5MFZ4cFhWNEZReUg2SlE4SGFQQjZJT0hSZU13U1VGbXZrZjhr?=
 =?utf-8?B?d1ZIOFpadzhONG9HVFRZalNVck1BTmxTZE9UUkdPUGFxUFdSQkdaS3ExSW1F?=
 =?utf-8?B?TzU1bWxOWk5ndUdlYXQ3Z0ZCbkVTRXo2ZU1VVlpyM0o3cmVacDZNdWtyMUhx?=
 =?utf-8?B?RlpsckQrVEJkOFBuMUNURTBQN25jZHhxS3Vkc3RTMXozQ0hmdlBBeStVQzl4?=
 =?utf-8?B?dElxeENkeFE2b3RnU21FM05RSm1QMkdLMm9GN1RGL3NsanhvUHF2cWRQTjNG?=
 =?utf-8?B?ZGY2S1MrUUJrMEtnZW1CcHlyVDVodXRiSlpoZGJ0bmVpSHlLazhVc01yMi9a?=
 =?utf-8?B?by9sSVVkamZmNDFkUnpQSElrWnppRFlkUmJWMlVTZDFiVkx3b3EwVXRRUnhp?=
 =?utf-8?B?by9XU2d3NkdDOFNESlJVZ0swcHVXOWg2V1ZKMGNqbnNZUE8wQnZRU2VxYThD?=
 =?utf-8?B?dVJ5RVhuMzFxdTFCeVhCWm1obHFxcDF2ZGEvMjRaeHgrZlh6QmZQRmUzYUUw?=
 =?utf-8?B?M2lCbU84TnhNbUM4SnhleWJSdVFRemdvRWlBaDU4Kzk3M2NldGlrQSt0V2pT?=
 =?utf-8?B?NWJhUHR3K1JCK29ZYnY1ZDlTcStzdTJhcEJKZDJ4aThtalVqREtISkh1eW9W?=
 =?utf-8?B?bTdIU28xd2hOMjNMbXc4d29qQ2l0bk0rbEhRVzhYUGxJK0VzcmZtcFNDODZT?=
 =?utf-8?B?ZHFqeWkxcHkwSGFJV1AvRjBlb2Z3Q3hHdzZtbjR5THNyc3ZsTDdVUFZUd012?=
 =?utf-8?B?ZzhXZzdVbnFycE1BdVdpOXVYZ0RUT3dKV0x2WHNXNkxZQW1HWWlzeGxFeVk1?=
 =?utf-8?B?N0dVbmxnNVJhZit2a3JxSlFzWnNDT1JHenYzUkRwbVRGM01OSHBZeEpWVGVa?=
 =?utf-8?Q?ljMAKV1NIxXjj7TNBUwsZY1mb9Pu90gbtY3k4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1866D4D9B55C9C49995575E3F2406207@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c09892b5-98f6-4817-2e17-08da4b8650bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2022 08:42:27.8335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L5WNfbiJCpz54pScNH7F7K9X9dMqRNBCoxgr5F21LRGVHNOp9atHwDXjPrFkoIKku5FHSZfhTgnrPF5XvCGKnUoA/zBwhiL/c2/hm9sEirQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1524
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA2LzIwMjIgw6AgMDU6MzIsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPj4g
T24gMiBKdW4gMjAyMiwgYXQgMjowMCBhbSwgU2VnaGVyIEJvZXNzZW5rb29sIDxzZWdoZXJAa2Vy
bmVsLmNyYXNoaW5nLm9yZz4gd3JvdGU6DQo+Pg0KPj4gSGkhDQo+Pg0KPj4gT24gV2VkLCBKdW4g
MDEsIDIwMjIgYXQgMDM6NDg6NDVQTSArMTAwMCwgUm9oYW4gTWNMdXJlIHdyb3RlOg0KPj4+ICsu
bWFjcm8gQklOT1BfUkVHUyBvcCwgcmhzLCBzdGFydCwgZW5kDQo+Pj4gKwkuTHJlZz1cc3RhcnQN
Cj4+PiArCS5yZXB0IChcZW5kIC0gXHN0YXJ0ICsgMSkNCj4+PiArCVxvcCAuTHJlZywgXHJocw0K
Pj4+ICsJLkxyZWc9LkxyZWcrMQ0KPj4+ICsJLmVuZHINCj4+PiArLmVuZG0NCj4+DQo+PiBUaGlz
IGlzIGZvciB1bmFyeSBvcGVyYXRpb25zLCBub3QgYmluYXJ5IG9wZXJhdGlvbnMgKHRoZXJlIGlz
IG9ubHkgb25lDQo+PiBpdGVtIG9uIHRoZSBSSFMpLiAgWW91IGNhbiBpbiBwcmluY2lwbGUgcHV0
IGEgc3RyaW5nICJhLGIiIGluIHRoZSByaHMNCj4+IHBhcmFtZXRlciwgYnV0IGluIHByYWN0aWNl
IHlvdSBuZWVkIGEgb3IgYiB0byBkZXBlbmQgb24gdGhlIGxvb3AgY291bnRlcg0KPj4gYXMgd2Vs
bCwgc28gZXZlbiBzdWNoIHRyaWNraW5lc3Mgd29uJ3QgZG8uICBNYWtlIHRoZSBuYW1pbmcgbGVz
cw0KPj4gY29uZnVzaW5nLCBtYXliZT8gIE9yIGRvbid0IGhhdmUgYW4gdW51c2VkIGV4dHJhIGxl
dmVsIG9mIGFic3RyYWN0aW9uIGluDQo+PiB0aGUgZmlyc3QgcGxhY2UgOi0pDQo+Pg0KPj4NCj4+
IFNlZ2hlcg0KPiANCj4gVGhhbmtzIFNlZ2hlciwgQ2hyaXN0b3BoZSBmb3IgcmV2aWV3aW5nIHRo
aXMuDQo+IA0KPiBZZXAgSSBzZWUgaG93IGhhdmluZyBhIG1hY3JvIHRvIHBlcmZvcm0gclggPSBy
WCA8PiBZIGZvciBhcmJpdHJhcnkgaW5maXggPD4gYW5kIG9wZXJhbmQNCj4gaXMgdW5saWtlbHkg
dG8gZmluZCBtdWNoIHVzZSBvdXRzaWRlIG9mIFpFUk9fR1BSUy4gQXMgSSByZXN1Ym1pdCB0aGlz
IHBhdGNoIHNlcmllcyBJDQo+IHdpbGwgcmVuYW1lIGl0IHRvIFpFUk9fUkVHUyBvciBzaW1pbGFy
IHRvIGJlIG1vcmUgZXhwbGljaXRseSBjb3VwbGVkIHRvIFpFUk9fR1BSUy4NCj4gDQo+IFNvbWV0
aGluZyBsaWtlIHRoaXMgSSB3YXMgdGhpbmtpbmc6DQo+IA0KPiAubWFjcm8gWkVST19SRUdTIHN0
YXJ0LCBlbmQNCj4gCS5McmVnPVxzdGFydA0KPiAJLnJlcHQgKFxlbmQgLSBcc3RhcnQgKyAxKQ0K
PiAJbGkJLkxyZWcsIDANCj4gCS5McmVnPS5McmVnKzENCj4gCS5lbmRyDQo+IC5lbmRtDQo+IA0K
DQpJJ2QgaGF2ZSBhIHByZWZlcmVuY2UgZm9yIHVzaW5nIGEgdmVyYiwgZm9yIGluc3RhbmNlIFpF
Uk9JU0VfUkVHUyBvciANCkNMRUFSX1JFR1MNCg0KQ2hyaXN0b3BoZQ==
