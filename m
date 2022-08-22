Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3783959C167
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 16:10:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBDmB0HyNz3cCY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 00:10:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=W3iVvxUo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.59; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=W3iVvxUo;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90059.outbound.protection.outlook.com [40.107.9.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBDlP3DtGz2xHl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 00:10:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QG9/JsGsHX3dGIvfiGHMIF4HFydbpesmj0tBg0s2lKJeK7eL6u+hmuMvkXGUPchKAsGLQVprIcPDRbzP7Y81bVVYUyK8HgnFmOfsM1RNKDVmX3sDPJKDrXCCvO8e0rq05Ys4F+TamfCDJsgeEn0ymjmXwmCQ3r9m0tdjyCeGMU2AqRD41j3BmfMCO4WqjnVMYtKLAALEoIyabkA2UrUjFRLIhtFLU1qqEHomxAk6nkje7XRJ/OiYLQBD2tgGSQPsO+NxY09gL6FNoVlnkA+1k4TUW0nhMK2mHRgO/s9jHVk+3OH4rvQMbJyWlA1AbJJSbTMAQrefyUlNFtKG6rdtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgP4VgTfFFsLFoO6OIufjrMJpCiH7MKTMrlemsKI5Ps=;
 b=nR+xQl5RL0Ea/J85yoHUnIUZtg9viI1rVsBBeXFljf/uRpJ4hQE4UhAeCzLshmhPqfVr9UPXOm6TD4zTJ04sLXDop6p5t6KE3DSJVo4gmpwOYrlU/szVgwzbCvvkAeXuy14TE3rG7oHpRNE8ARj9p3Zop1fpSvgZcPPCJRGXktSVm5fkwU9Y6zZpSN8fFg4w4Evl2TGm+n2YSBr86AdchC264QhrCBP59GW22k5JuXlROeLZrV2t4E1jZBfFbOlmjjRBYOmSBRSAqbJvYVx5qzkdizf3h2U595XS5dqYcrgwoN0r18GZtCzJsN1HjpWCnLMgHP1lrd53Lz7rvSw4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgP4VgTfFFsLFoO6OIufjrMJpCiH7MKTMrlemsKI5Ps=;
 b=W3iVvxUoeKsvTEwwUv8m2BQYPtdlxGPsb1DUHdBd5cHqfwDO0+idZXY8Y35QhO/fAc5LjuHmHKQFN2O+xoewRKnAFGXr85ndNaNPNjlVH80RMTMCuHP5P2pY1GvCU9I4eneYZ1worPrvkVPL7aZ1wzveE89WmSWJFGSuLD34aoVbT650Sa/ivFN6WCEzaHia2yVw8MTyhz0rniZDPK90Oxz2VDyIVhcpDlj3YxxZoFg5BDpCWSrgrzg2Zl04Wt3ir4EXwhgBf7bDfFeWcbkuqXqJ5j4E7mwu6pdVTOdSuEQqB9izYDdf4OYWk/X1zSxw2pz5kue+6XHuTDV7ifWx+Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2590.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 14:09:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 14:09:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>, =?utf-8?B?UGFsaSBSb2jDoXI=?=
	<pali@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
	Nick Child <nick.child@ibm.com>
Subject: Re: [PATCH] powerpc: Add support for early debugging via Serial 16550
 console
Thread-Topic: [PATCH] powerpc: Add support for early debugging via Serial
 16550 console
Thread-Index: AQHYtBCQTPmF1chLTkiejFUksD5Awq22z30AgAQqDAA=
Date: Mon, 22 Aug 2022 14:09:46 +0000
Message-ID: <952773db-4b27-c0af-f976-b14445af0276@csgroup.eu>
References: <20220819211254.22192-1-pali@kernel.org>
 <35c0ff6a-387d-3c01-66b3-f659cfe67c2a@infradead.org>
In-Reply-To: <35c0ff6a-387d-3c01-66b3-f659cfe67c2a@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 016c71b4-5c1a-4a96-871a-08da8447f830
x-ms-traffictypediagnostic: PAZP264MB2590:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  iVdzmoOpAW1LDBw6ux/diFNklh6gi6Q6ISo1Y0CUYHNYIk5TMdQo1alznO2U7UvqAJj8ad305/t0gIQXrcoa8LN3LlrlwLWmWe4P9ivXg/5BRbArsuUJLiG3hhvst6R/dtR2+IxglSelG0N5Mo6XNfOZbXvJgm5vSG+/vd4+nsSrNyinhq5m4pj/wQAEOUQ3dOqae1bm1vYGLOACFQX18zqk3sSZMj5jNCJLvLtpMi+q/7sL9kMspctWYVjdG8eTjfI9HyWzfNti42rqpdAJ1pV71M6jTxvYF7jibary9VNCB9TvhQ6z4SUdjvhHkF9QL2Ny7sD4bpeFv5S7qiFmBMvfDcScZmleg7MrtCBgDRmFDx+ir/fjZYi0rZZSrbOLszvBbgElEN479VPhNW8zxIBRZDsnj41/jMr+UAVgqBa1OGexyPQF8NmxtaAes1u1A5n8F28EHh7HnLWafeAAGpIil6OpwhFkV0mhutf2hh/FzFIM25vEmpj7aJkNVE/pTRv6LAMT8ezeZ3hdifT3V5iZNJvabZXAlgcLvTq+CAXxkeqNrK1kfzP69KGbLhdjyNDLI6iRyF4bAMw6iOYXsUEtafedbz/fj8J/sOOJIFv1/+s5RrlAUNAjVhJyTT6x4uMSBwy3OfsPnyKVR+nJ86Jt0/dRrLaga/pGD1DoeI0ZJ6bdKWgYhWcQm+M2TQcYcgr98+u9EUszGwfyuMTVqzc971om6kjb5d0JVIgKOmo0bTTGJHcEQR4r/wBlZk4/5Hgs3cpJUTvx1THAI2sv48YLmV+CvPQ6jy6IavtTKB8ORgnT0yd039/L8EztSVFeSrr8JXdhYyp513u53A16YB8EHDs20KsOhzLCByeS5w0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(346002)(39850400004)(136003)(44832011)(76116006)(66946007)(8676002)(66556008)(66476007)(66446008)(64756008)(4326008)(31686004)(122000001)(86362001)(31696002)(54906003)(110136005)(91956017)(38070700005)(36756003)(38100700002)(2616005)(186003)(6512007)(26005)(53546011)(66574015)(6506007)(6486002)(478600001)(71200400001)(966005)(316002)(2906002)(83380400001)(8936002)(41300700001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?K0RpK3ZRM3dicEpLcHdRaXdFZEpXQzc5dzBQVWpTUXB4RDZHc0tyVGNlRXly?=
 =?utf-8?B?dStxQkJPWU5qbXRQb2RtY0tkMGdSM3plWE9zVTgrR1FLSFZOZ1hLVmFFYWYy?=
 =?utf-8?B?T2Z5eUF1VU5WV0hsK0hLYnM2V29kU0psWnplemlYK1hQcGRhWUZDT0MwbFYr?=
 =?utf-8?B?ek9yWnNKRnBKclZ0UWl1MitpTU5CZ3plc2h2SGI1a2k4MkJjenMwdFkxRW1z?=
 =?utf-8?B?eVJrcndpM2tURXNGdWU5NncwWW9aUGxRcFJKR2Y2WVhEcWwxWFZQZisyV2VX?=
 =?utf-8?B?c1BPQ3ZjQ0xuNDUrRnlDK0tuMnVWMkpLMndZWXBpODJ1TXVXTDRsR3hxMGw4?=
 =?utf-8?B?TVlia1VkMkdnaERNalBoMVMraG5sd0ZBSXdvelhTTC9ndmhUc3VQVHVINWRC?=
 =?utf-8?B?ZkpoUHFrT3hyZnBGM1FwWHo0UTM2UTUxbmlzbU9tVWgyaUxGYnhDa25Ca1R3?=
 =?utf-8?B?MWFRMTBxUWdFK2tVaDhZNmhRRWNqcERoWTNHQnZCY2NLVTc5TWRvQW56Z2Fk?=
 =?utf-8?B?UHhqSjFMSEZtQ1BpTzZvVVNRYU80QjRFdFJWUEpsRUIxTXkrSGQzREFWbTdq?=
 =?utf-8?B?YVEyOUd2OE9zU24yWThjMFp5bVZhWDZlYy94NXlHRmdMYi9RUzZPYlFzSXNj?=
 =?utf-8?B?MThMVDBHWWUzZVEzY1ptOGR0T2FHVDN2cUtPNEFFYjdqTUZkWmtnOHRCZzJ4?=
 =?utf-8?B?Y1I3NjRiOGNTc1V1dGVxZEhrOXdyT0RQTmFjdEtjT3AwbGFYdXFyc2hReWNI?=
 =?utf-8?B?U1dnazBmMDZaZ1IreWpKY1hBM3NNZ1ovZUd5MjJPOUlJUm1lc0JQbmVyZmFE?=
 =?utf-8?B?RnlIVGV4TklMckRNYWp1VWQwbDM3dUVLWXVVaGdzOFIva0J5T3NPU0FKeHNC?=
 =?utf-8?B?NDdzQ1hzOXRHc2FDd3JYMEQvK2g3Um1lTmZNNm16Zjd6TWd5WU1ycTdJc0Jw?=
 =?utf-8?B?Ym1GR0xXWnJ5QzU2Z3N2R2RYa1dQaGVFMkxPTXF4a1Y2c1RDUU5RT1pycnhV?=
 =?utf-8?B?V0FXNG0xYWp5dHBSbW9naS84aFVrRFNCWjYrRS9OWkZiUHFIcU5pV0lDOW5i?=
 =?utf-8?B?RnY4QVNrYlVuYWx5V3YxeERnMWlVYnR5eVZoZEZWcFhPNGVBREo1ZWhlUzZq?=
 =?utf-8?B?KzhVTU8yTjhxSitOWFFDZG1HUzVIM29CMys3K2FkWWNIaGhncmNZQmROR3kr?=
 =?utf-8?B?UEJWMG15Z29zd0l5SWgzWlRxVVVJWVBCSHpMY3RkQktvNE1OcGg4RmJ1bGp0?=
 =?utf-8?B?VTVRdDJOUUNwSGQxaUsyNy9oc1czc0czNXJUQzZUZHZ0eUZ5YWo5NjV1VjVj?=
 =?utf-8?B?SXU2WXp0Zm1JN2c1bG1iR0Y4cHU2VFNDRUtMMjJhenIrdEpkNm5DTGttWUli?=
 =?utf-8?B?YjVWdGEzZEdNNHRUU21DbWwrV0dldDdhQWE5R25sdVpxeWFsRkFSSkdNMVBL?=
 =?utf-8?B?czF2Q1lmck1VWnJ4RGdqYWUySlZCeTZZRDJzS2JNMzliRExHbEc3T1dUejRp?=
 =?utf-8?B?ZVpTSi9IdkJjOUlrS2NiaElCaG0raFREdnplc2lOWFRXWkhKQnR1VTlrQzkw?=
 =?utf-8?B?WlNNRDVNdlJjaldaaEZXK0ZaV3dLTlZvTEhwL2g4SWlIQzZ0a3l0KzZPUDMx?=
 =?utf-8?B?ZTV3WWRPSzFEUFRNdWVOMFRPTjY3dThWaUdlK3NxNk9KT0x0M25EYmFCQURM?=
 =?utf-8?B?L3ZFMlU5dUhBdG8yTll2Q3JjMkdMa1QveVp3UzZiT2EwZHROUmVJTkV1cW9w?=
 =?utf-8?B?anVyU1pYcVlob3VlKytmbHZkdGcwN2w0VGFZMHBQc21zeDlMZWdHOTl6VjVH?=
 =?utf-8?B?Wk1xMlBMYVVYdzZPS1d4dzROQnVkdVVOMFIwdVBoUVlPTnB2clRTamVmR1dn?=
 =?utf-8?B?Zy9WOHZjLzM1NUJlWGdTSCt5RHZERXdQMG1YaWhXd2I2bnRHS0lPSTB3ZFhN?=
 =?utf-8?B?ZE93YlBwMDVGUzdIVnV1T1c2Y3ZISlpMbWlDL01ncFFjbTVzaStCZHBXZWxF?=
 =?utf-8?B?UjhVejNGN0t4eWhlRnZKUW1pYUxsVTdLUlN3WThPZjdvczRVYmdiNlV1MHZ2?=
 =?utf-8?B?eWNJSTJmenhCdFVHenBIRjZMcHJ6aWp0VkRNTS9zdlZ3OEFvS1RMcDdhMGNJ?=
 =?utf-8?B?TTdNcTVpOTdJUzRZWnY5enpUdWUxUGU3VDBQeFhOZW1sL0ZGaDdYd1hldWFj?=
 =?utf-8?Q?RjmvGI/+Ev5jqvH5c7sCuGc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F74904F29988264CBDFE4695EFC5F6B9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 016c71b4-5c1a-4a96-871a-08da8447f830
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 14:09:46.7195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lilXKvP+KYoLVpwVcLzdKTOBmxlRwxwM2xAKg6dCnYa/bDhYhYOW8RBCW6kAJ0eghVTHgiiw6sw9zov8Wi/Fw5u9BL8swApSuzSqFWl61r4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2590
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzA4LzIwMjIgw6AgMDA6MzQsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOg0KPiBI
aS0tDQo+IA0KPiBPbiA4LzE5LzIyIDE0OjEyLCBQYWxpIFJvaMOhciB3cm90ZToNCj4+IEN1cnJl
bnRseSBwb3dlcnBjIGVhcmx5IGRlYnVnZ2luZyBjb250YWlucyBsb3Qgb2YgcGxhdGZvcm0gc3Bl
Y2lmaWMNCj4+IG9wdGlvbnMsIGJ1dCBkb2VzIG5vdCBzdXBwb3J0IHN0YW5kYXJkIFVBUlQgLyBz
ZXJpYWwgMTY1NTAgY29uc29sZS4NCj4+DQo+PiBMYXRlciBsZWdhY3lfc2VyaWFsLmMgY29kZSBz
dXBwb3J0cyByZWdpc3RlcmluZyBVQVJUIGFzIGVhcmx5IGRlYnVnIGNvbnNvbGUNCj4+IGZyb20g
ZGV2aWNlIHRyZWUgYnV0IGl0IGlzIG5vdCBlYXJseSBkdXJpbmcgYm9vdGluZywgYnV0IHJhdGhl
ciBsYXRlciBhZnRlcg0KPj4gbWFjaGluZSBkZXNjcmlwdGlvbiBjb2RlIGZpbmlzaGVzLg0KPj4N
Cj4+IFNvIGZvciByZWFsIGVhcmx5IGRlYnVnZ2luZyB2aWEgVUFSVCBpcyBjdXJyZW50IGNvZGUg
dW5zdWl0YWJsZS4NCj4+DQo+PiBBZGQgc3VwcG9ydCBmb3IgbmV3IGVhcmx5IGRlYnVnZ2luZyBv
cHRpb24gQ09ORklHX1BQQ19FQVJMWV9ERUJVR18xNjU1MA0KPj4gd2hpY2ggZW5hYmxlIFNlcmlh
bCAxNjU1MCBjb25zb2xlIG9uIGFkZHJlc3MgZGVmaW5lZCBieSBuZXcgb3B0aW9uDQo+PiBDT05G
SUdfUFBDX0VBUkxZX0RFQlVHXzE2NTUwX1BIWVNBRERSIGFuZCBieSBzdHJpZGUgYnkgb3B0aW9u
DQo+PiBDT05GSUdfUFBDX0VBUkxZX0RFQlVHXzE2NTUwX1NUUklERS4NCj4+DQo+PiBXaXRoIHRo
aXMgY2hhbmdlIGl0IGlzIHBvc3NpYmxlIHRvIGRlYnVnIHBvd2VycGMgbWFjaGluZSBkZXNjcmlw
dG9yIGNvZGUuDQo+PiBGb3IgZXhhbXBsZSB0aGlzIGVhcmx5IGRlYnVnZ2luZyBjb2RlIGNhbiBw
cmludCBvbiBzZXJpYWwgY29uc29sZSBhbHNvDQo+PiAiTm8gc3VpdGFibGUgbWFjaGluZSBkZXNj
cmlwdGlvbiBmb3VuZCIgZXJyb3Igd2hpY2ggaXMgZG9uZSBiZWZvcmUNCj4+IGxlZ2FjeV9zZXJp
YWwuYyBjb2RlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5l
bC5vcmc+DQo+PiAtLS0NCj4+IFRlc3RlZCBvbiBQMjAyMCBib2FyZC4gSXQgYWxsb3dlZCBtZSBk
byBkZWJ1ZyBhbmQgaW1wbGVtZW50IHRoaXMgcGF0Y2ggc2VyaWVzOg0KPj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXhwcGMtZGV2LzIwMjIwODE5MTkxNTU3LjI4MTE2LTEtcGFsaUBrZXJu
ZWwub3JnLw0KPj4gLS0tDQo+PiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnLmRlYnVnICAgICAgIHwg
MTQgKysrKysrKysrKysrKysNCj4+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3VkYmcuaCAg
fCAgMSArDQo+PiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvdWRiZy5jICAgICAgIHwgIDIgKysNCj4+
ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC91ZGJnXzE2NTUwLmMgfCAzMyArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPj4gICA0IGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcuZGVidWcgYi9hcmNoL3Bv
d2VycGMvS2NvbmZpZy5kZWJ1Zw0KPj4gaW5kZXggOWYzNjNjMTQzZDg2Li5hNGU3ZDkwYTQ1ZDIg
MTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZy5kZWJ1Zw0KPj4gKysrIGIvYXJj
aC9wb3dlcnBjL0tjb25maWcuZGVidWcNCj4+IEBAIC0yNzYsNiArMjc2LDExIEBAIGNvbmZpZyBQ
UENfRUFSTFlfREVCVUdfT1BBTF9IVlNJDQo+PiAgIAkgIFNlbGVjdCB0aGlzIHRvIGVuYWJsZSBl
YXJseSBkZWJ1Z2dpbmcgZm9yIHRoZSBQb3dlck5WIHBsYXRmb3JtDQo+PiAgIAkgIHVzaW5nIGFu
ICJodnNpIiBjb25zb2xlDQo+PiAgIA0KPj4gK2NvbmZpZyBQUENfRUFSTFlfREVCVUdfMTY1NTAN
Cj4+ICsJYm9vbCAiU2VyaWFsIDE2NTUwIg0KPj4gKwloZWxwDQo+PiArCSAgU2VsZWN0IHRoaXMg
dG8gZW5hYmxlIGVhcmx5IGRlYnVnZ2luZyB2aWEgU2VyaWFsIDE2NTUwIGNvbnNvbGUNCj4+ICsN
Cj4+ICAgY29uZmlnIFBQQ19FQVJMWV9ERUJVR19NRU1DT05TDQo+PiAgIAlib29sICJJbiBtZW1v
cnkgY29uc29sZSINCj4+ICAgCWhlbHANCj4+IEBAIC0zNTUsNiArMzYwLDE1IEBAIGNvbmZpZyBQ
UENfRUFSTFlfREVCVUdfQ1BNX0FERFINCj4+ICAgCSAgcGxhdGZvcm0gcHJvYmluZyBpcyBkb25l
LCBhbGwgcGxhdGZvcm1zIHNlbGVjdGVkIG11c3QNCj4+ICAgCSAgc2hhcmUgdGhlIHNhbWUgYWRk
cmVzcy4NCj4+ICAgDQo+PiArY29uZmlnIFBQQ19FQVJMWV9ERUJVR18xNjU1MF9QSFlTQUREUg0K
Pj4gKwloZXggIkVhcmx5IGRlYnVnIFNlcmlhbCAxNjU1MCBwaHlzaWNhbCBhZGRyZXNzIg0KPj4g
KwlkZXBlbmRzIG9uIFBQQ19FQVJMWV9ERUJVR18xNjU1MA0KPiANCj4gSXMgdGhlcmUgYW55IGNo
YW5jZSB0aGF0IHlvdSBjb3VsZCBwcm92aWRlIGEgZGVmYXVsdCB2YWx1ZSBoZXJlDQo+IHNvIHRo
YXQgJ21ha2Ugb2xkZGVmY29uZmlnJyBkb2VzIG5vdCBlbmQgdXAgbGlrZSBpdCBkb2VzDQo+IHdp
dGhvdXQgaGF2aW5nIGEgZGVmYXVsdCB2YWx1ZT8NCg0KSSBkaWQgYSBmZXcgdGVzdHMgYW5kIGl0
IHNlZW1zIHRoYXQgYSBkZWZhdWx0IGRvZXNuJ3QgaGVscC4gSSB0cmllZCANCnNldHRpbmcgJ2Rl
ZmF1bHQgbicgdG8gUFBDX0VBUkxZX0RFQlVHXzE2NTUwIGJ1dCBJIHN0aWxsIGdldCBhIHByb21w
dCANCndoZW4gZG9pbmcgYW4gb2xkY29uZmlnLiBCdXQgb25seSBpZiB5b3UgaGF2ZSBDT05GSUdf
UFBDX0VBUkxZX0RFQlVHPXkgDQppbiB5b3VyIG9sZCBjb25maWcuIEJ1dCB0aGF0J3MgZXhwZWN0
ZWQgYmVoYXZpb3VyIHdoZW4gZG9pbmcgJ21ha2UgDQpvbGRjb25maWcnLCBpc24ndCBpdCA/DQoN
Ck9yIGFyZSB5b3UgbWVhbmluZyBhIGRlZmNvbmZpZyA/IEJlY2F1c2UgSSBnZXQgd2hhdCB5b3Ug
ZGVzY3JpYmUgd2hlbiANCmRvaW5nIDgzeHgvbXBjODM2eF9yZGtfZGVmY29uZmlnLiBBbmQgSSBh
Z3JlZSB3aXRoIHlvdSB0aGlzIGlzIGdvaW5nIHRvIA0KY3JlYXRlIHByb2JsZW1zLg0KDQo+IA0K
PiBDT05GSUdfUFBDX0VBUkxZX0RFQlVHXzE2NTUwPXkNCj4gIyBDT05GSUdfUFBDX0VBUkxZX0RF
QlVHX01FTUNPTlMgaXMgbm90IHNldA0KPiBDT05GSUdfUFBDX0VBUkxZX0RFQlVHXzE2NTUwX1BI
WVNBRERSPQ0KPiBDT05GSUdfUFBDX0VBUkxZX0RFQlVHXzE2NTUwX1NUUklERT0xDQo+IA0KPiB3
aGljaCB0aGVuIGNhdXNlcyBhIGtjb25maWcgcHJvbXB0IHdoZW4gc3RhcnRpbmcNCj4gdGhlIGJ1
aWxkLi4uDQoNCk1heWJlIGEgc29sdXRpb24gaXMgdG8gbWFrZSBQUENfRUFSTFlfREVCVUdfTUVN
Q09OUyB0aGUgZGVmYXVsdCwgZG9pbmcgDQp0aGF0IEkgZ2V0IG5vIGNoYW5nZSBmcm9tIGJlZm9y
ZS4gQnV0IHRoYXQgY2hhbmdlcyB0aGUgYmVoYXZpb3VyIGZvciANCm1wYzg4NV9hZHNfZGVmY29u
ZmlnLCBzbyBpdCBpcyBub3QgdGhlIHNvbHV0aW9uLg0KDQpTbyBJIHRoaW5rIHRoZSBvbmx5IHNv
bHV0aW9uIGlzIHRvIHByb3ZpZGUgYSBkZWZhdWx0IHZhbHVlIHRvIA0KUFBDX0VBUkxZX0RFQlVH
XzE2NTUwX1BIWVNBRERSLCBqdXN0IGxpa2UgaXQgaXMgZG9uZSBmb3IgDQpQUENfRUFSTFlfREVC
VUdfQ1BNX0FERFIuDQoNCg0KPiANCj4+ICsNCj4+ICtjb25maWcgUFBDX0VBUkxZX0RFQlVHXzE2
NTUwX1NUUklERQ0KPj4gKwlpbnQgIkVhcmx5IGRlYnVnIFNlcmlhbCAxNjU1MCBzdHJpZGUiDQo+
PiArCWRlcGVuZHMgb24gUFBDX0VBUkxZX0RFQlVHXzE2NTUwDQo+PiArCWRlZmF1bHQgMQ0KPj4g
Kw0KPj4gICBjb25maWcgRkFJTF9JT01NVQ0KPj4gICAJYm9vbCAiRmF1bHQtaW5qZWN0aW9uIGNh
cGFiaWxpdHkgZm9yIElPTU1VIg0KPj4gICAJZGVwZW5kcyBvbiBGQVVMVF9JTkpFQ1RJT04NCj4g
DQo+IFRoYW5rcy4=
