Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE587815E53
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 10:32:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=T6uGIJXT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4StHms3Vtmz3cQj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 20:32:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=T6uGIJXT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::600; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4StHm045R3z301f
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 20:31:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7xQv5KWuv1oT3aGZETXuH5xgW0nr3NmcKK1OCgyt95W97VAleX+TP6f6HfGesjF420amULWT+ha6K/cwUwtkgZPDS/o+xtybiRJ42O+usY0j66fmp4Bx8xk6F6g6nMH2GDG2gs0EuRGOa/ARDja7zD4ePlJVa0VjJNk7uNLwiYs+/5ZbIetC+VpwSVSwxOoGnvQVQUgSmBbEsER6wsWzMwnD6O87BGW/JdK+iL003E2mkMNYES1DmsRBMDFXii+F4UkURZvSB3PI+S+UD78pzoid5zY9rYj/SMwZwTNGLjCyVR8LTDWX/ybYdCj4vVR4b1dCJvY0wdp64pn1tjKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FThNnBKAeB+MuyRm2Jp3fhB2WVppw/4x0m7daFRLDJs=;
 b=BSXtFHzBX/xJT7TKzJ7BLlZblvacjNGj3iKJu+gg3hbkO5eQVDwct8Rdgr8VHI8EmE3U5nwZckdf/wDUEWn3VAcCfO8o9VRH5Gjdq6vjbj+eknuKsaRH/VbdtPU/+nUUlOT4iexpvDc9D/HZc308toIK8vXNCwlUlDjBns0knA8Tw4l2VXlnmf7M6fiVpe0XNfUm0srmFfEE/5THrwP2Zg3ZbMtEVo53jevMa4952JzT3VeQAkFvfd4489CQ1uR27B74s/G8EDY2omgmbXWHd/NVybDmDovx2QSmEXIUdXnjSbH9GSu0rYwPw1B1KAea+u8fkciriSTDgcWKe+8Bmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FThNnBKAeB+MuyRm2Jp3fhB2WVppw/4x0m7daFRLDJs=;
 b=T6uGIJXTRwAzxAu2iNsI8OLmv3MBGyMoc4S1O0m4p22CputHQAP/dWegWg5fMazQnUxptz5hUrvr8mb+JVb5WG3JUAYTB7s59HIhAr6vY40IVli9GQ17cpaOgXK/5eaAxh9GD0x5D3xLigcumN3ttTV9KUVg2zTrIkQ9SCjFgKQM79kVTYbddU/3A34a6c9T83Pro7qIkfQC+Wy2FgbVOWbg5hjbvannSlCmcvDckirkQCwqQmm9sa9svgxCKGmidyn0RjhqqcWntinW0oh5snZPOEjBmaceSYPQusG7mlfulbRFqNtlynWGwt/cnjqzmZHiF5eb59Feb1vLO/L8zQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3168.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Sun, 17 Dec
 2023 09:31:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.034; Sun, 17 Dec 2023
 09:31:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, Waiman Long
	<longman@redhat.com>, "andy.shevchenko@gmail.com"
	<andy.shevchenko@gmail.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "lee@kernel.org"
	<lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"will@kernel.org" <will@kernel.org>, "boqun.feng@gmail.com"
	<boqun.feng@gmail.com>, "nikitos.tr@gmail.com" <nikitos.tr@gmail.com>
Subject: Re: [PATCH v4 02/10] locking: introduce devm_mutex_init
Thread-Topic: [PATCH v4 02/10] locking: introduce devm_mutex_init
Thread-Index:  AQHaLrQSLTXRy4mOS0OgHh/wjtvn+LCpHvQAgAASE4CAACAsAIAAhXeAgALWTACAAI1EgA==
Date: Sun, 17 Dec 2023 09:31:32 +0000
Message-ID: <0a81e53d-f837-486c-8b0b-7a3c62853be7@csgroup.eu>
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
 <20231214173614.2820929-3-gnstark@salutedevices.com>
 <5c10f66c-3fd8-4861-994b-13e71c24f10a@redhat.com>
 <b158ca2b-7300-4ad0-82b8-e1442d267734@csgroup.eu>
 <300d2131-87ef-48c1-b162-dcef0d8d5722@redhat.com>
 <5ef8a83a-5dfd-4038-851e-c730d5f1b6f3@csgroup.eu>
 <1e5907f2-c794-4ee2-8abc-b45831cca5bb@salutedevices.com>
In-Reply-To: <1e5907f2-c794-4ee2-8abc-b45831cca5bb@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3168:EE_
x-ms-office365-filtering-correlation-id: ee9ca7be-016b-46b8-fafd-08dbfee2f4fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  W+cyZRvWpEsc+YGXx1FIsfbavNLaOukeCdebFJFzTLrLfNFW9Uid5Pp1dZEVoo91w8enlHmK/hzSDbu2aevkuKQu38605Rk/da1fPg5D/iUxsKHMYr1P7QOw3BBxbmdnxJF0HnlR9q7wpOSC8NgU464VTV9JZ6PKmPeCMvFpLh4KyoiCWkFAIsrVFdi1BbZHFZD8bkB9J9ualB6hH5FFE05h9irgLTmDHsQNCubdYuImbdcF2P5olCsTy5bIQICTTAX+SSJmYWCKPOtyoM213VEoQvsQaVggS4rVpxDFuS38eBIfx/P+kyF3mTn6ZOC/lOBdvV3avMa3Wy9ndtyFQiP6Vc7sVIVqvH1hARk60lOxFHjQkJl1rHqy7DAiWmo4siXBSRiEVl+5Yq8Xy458NOO974Dm4JgNy7L++J+HbcVROzYWi3W2ljUKYomD6uqizyAMP5NEec0CCkx5DUXKhgFCtysSr2Rf0Mf9tSMBF2psU0Eo6ALyXk2orESxzCmnLAE987mrDQ8dsrQb5pZtzaDe3WA5FGU5A7IYebG3KOUZIxo6rtkzKZjLxBOBKixn1rZKPOO+Wq5CeJbbgyGYC1P6Ef3n6BQkDg048mEaQqeVBpBMypjztkrvzaHZHqRy+4cwLAbG8Tl4JFXvm9bEneUCnQBC2wce09inG4mXq4iw8QoHFyxewiDelYUbH0YPunybEE/MEHFqdLPaKBs806BM/UwlpLguOZSyGWu0jO8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39850400004)(230173577357003)(230273577357003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(36756003)(38070700009)(921008)(66556008)(316002)(83380400001)(66574015)(91956017)(110136005)(66946007)(66476007)(54906003)(64756008)(66446008)(76116006)(7416002)(38100700002)(2906002)(122000001)(8936002)(4326008)(8676002)(5660300002)(44832011)(71200400001)(53546011)(6506007)(6512007)(26005)(31686004)(966005)(6486002)(478600001)(2616005)(31696002)(41300700001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UGx0QkJRQ01CdDZLZ0puSWVEZ1V2WnBFK3N0L0kzS096MVpIeGVGbE05N0pn?=
 =?utf-8?B?MndqNEg5enVEUCtsSm4wQ2twTmh2R29JL1lwdGhHVStpZEkvd3VqaVdoVVJP?=
 =?utf-8?B?dVVXR2drVVdJaUE1U0M3VFZsMmNsU0dQdTVSRmZVaU5GUElXS25yYVN3SlEx?=
 =?utf-8?B?cDdHNnBEdXY3ZVhXSytEaUFYb3M0dDVxb0ZmRUplcDJ2Y1F3SE1PVVpxNnBJ?=
 =?utf-8?B?OTgzZmVqTklYWTFsaTIyQWZLRHZFR2tUR2JubW9hdWZlQ3hRZTExaThkM3Iw?=
 =?utf-8?B?WVdaR2N4K3o4SUJRRFRINFp3S2QwNEZJMldHbDhYdTNqTVppc2JkY1JqVDRZ?=
 =?utf-8?B?VXhJdzdraHU2eitScG10MlNnMHJQZ0pNaUFwNTcvOFB2ZzlDZDA3Z0dyS2V3?=
 =?utf-8?B?WCtEalU3S1BsaHVrQzBZNU9mZmY0dVZHMEpuMldFYTdsbFZJUlM3U2JjeXdF?=
 =?utf-8?B?cEN4bzM4aUZOQnN3eGx4RHMyOXJWUi9JYkxYRmlCYm1EVGYyODF2Vlg2cEZh?=
 =?utf-8?B?RGVHRVpSV05FbzZHakh6Q3hER1hJTDNNR0xMTlpiNkphcGJPRjJYN2lKU0t3?=
 =?utf-8?B?QXA0NDZCRjR4ZzJPcVBBbW5nM01HMndhbHd2TjJ6STdadFRSd2l0Z3g3QjFJ?=
 =?utf-8?B?Ni9LODM2eVdIQXdNWnVGZXk5M0tGVHVEM0hBTUZQdE9hV291UDhMYVFrakZ6?=
 =?utf-8?B?ZE50eCtRbUpLMENkZVZwTDM5NFRrb2h2WmV5VmNqT2R0Ylp5aElEdm8vcUll?=
 =?utf-8?B?am45NDB0a0g1MTZTbzRxOXNZOE5QcjhaYWRNZ2ljSnA0VnIrZW5JVHY5QXor?=
 =?utf-8?B?LzE5a1RUaHlxeXFoQ2tlWmd6a0NTQWFXMElSWkhIME5EKzJQNGRBMXVpQ1Ix?=
 =?utf-8?B?SmROS2Q5UWliWmp0R0x0ZE00eVU2QmM5ZUc0MXp0MnR1Y25QSloxSnp0U09u?=
 =?utf-8?B?TGRpVnFUZTc2Wi96bVM1ZUcxWGd1bUQ0dHRLbDVxQzJmTEJvTTlLYzFRN3VM?=
 =?utf-8?B?cmlnVGlvMlhqTzZzTjRPNnZpaG04SkhIdWJ5ZFhQMS8vNCt6Z3lRZms0aFFQ?=
 =?utf-8?B?YXJNcUxpUVloVlhoSzFscThMSkQ2MWk5ditFZjlCd2ZNV1F0S1V4cXJ6OFpU?=
 =?utf-8?B?dWM1K3pTelNiUW1hcWxmODVIQmc1TjB2TytaMzk3bE5QR1NsYkhjMGt0c1BV?=
 =?utf-8?B?OFp6SElKMmtvckgzSUJZSSthekFDNFJuQTFtdThDaWJJK0lhVjAxNVZUbXZC?=
 =?utf-8?B?ZE9vY05GemZzQnp2UXgxNi9GVmFkeXYzYWFIUHRUSU9GU3o5cTdzQXBtd2ZH?=
 =?utf-8?B?eFNXMjVYcGpUVEVRR0M1L0VCYm5OUmdRdVN5blp1azFvdlBnK3Y5NGtzYmJr?=
 =?utf-8?B?SXBQZ0pKSDBWVlVBcUZ0L1g1S0g4UEJicWhWa3ZTZFg4QVBWTGRybE5PNk0w?=
 =?utf-8?B?eTBYZFpac3NqSEN3dGREUmtxdUR2aDRYbXlrYURwVXArcmxkdVhBdlhnRmJr?=
 =?utf-8?B?dHF4UG1RK055TitONmZVVzVmVytyeEs4UHpQYzFFSHlUbk1hWlFxWWxqTWFM?=
 =?utf-8?B?ZnM1QXd1T280a1VXYmFTUURha0FkditXRWJZMmVvMnNBdyswTHJRYXYyM0Ur?=
 =?utf-8?B?VjBDeWhVdEhsQVQ4cHdMS2tzaWdXRkJkZ2xQeEFoOTgxNUxNZjBXb1QzeitE?=
 =?utf-8?B?dmkxQ2duWk1tWm91MmtqSGl1bldabGdpd0tjVDFacjJOcGxOMXNWNmp6Z2xp?=
 =?utf-8?B?dnJCT2RZTkdKNHh0YnJBaDhKZjRBNGgyemFMQWNFYzZ3bDV2VXhmV1hxQ0VL?=
 =?utf-8?B?L1RXMUV2aHM2SVpCNThRYkZNNStySzd6VEZRekJhN0hTZFJXYi9BN1oyNXZZ?=
 =?utf-8?B?SUJkMitHTmthaXpnd1dDdXJPOGc2M2l2Q3Q4ejdxTzF2ZkN4Q3lCMDlGM0ZM?=
 =?utf-8?B?dzFOWFQ2TUZialZ0R093allmUktudEJkTG5qeURXWlBGVVJMamJuMnd3MmdV?=
 =?utf-8?B?emxQajU0bVlQSTM1T2ZaOEMvNXVxY3d6N2pPVjBnQjlTQngzbzBHVEx1L2Z0?=
 =?utf-8?B?TWJTYVVENnNTV3lRVnMzK1VVSWJrRGszR2Y5ay84UXBUQ1lQVWdsWGo3WFRL?=
 =?utf-8?Q?jHOJV5z48VyEi46SlzMqsSxNx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E538E0EB29CBE44AA2AEF4760B9F4979@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9ca7be-016b-46b8-fafd-08dbfee2f4fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2023 09:31:32.9159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L+c04SfoEENiLzemP8tqxSSRgXfsZW/xbBuSdGdYl9AiYq8ElxocQOmpiILM10ykEjv9lLh7bKyThfutJ2D8LrdPB497zhQcEh1cYjdURtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3168
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
Cc: "kernel@salutedevices.com" <kernel@salutedevices.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzEyLzIwMjMgw6AgMDI6MDUsIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiBb
Vm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBnbnN0YXJrQHNhbHV0
ZWRldmljZXMuY29tLiANCj4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQg
w6AgDQo+IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+
IA0KPiBIZWxsbyBDaHJpc3RvcGhlDQo+IA0KPiBPbiAxMi8xNS8yMyAwODo0NiwgQ2hyaXN0b3Bo
ZSBMZXJveSB3cm90ZToNCj4+DQo+Pg0KPj4gTGUgMTQvMTIvMjAyMyDDoCAyMjo0OCwgV2FpbWFu
IExvbmcgYSDDqWNyaXQgOg0KPj4+IE9uIDEyLzE0LzIzIDE0OjUzLCBDaHJpc3RvcGhlIExlcm95
IHdyb3RlOg0KPj4+Pg0KPj4+PiBMZSAxNC8xMi8yMDIzIMOgIDE5OjQ4LCBXYWltYW4gTG9uZyBh
IMOpY3JpdCA6DQo+Pj4+PiBPbiAxMi8xNC8yMyAxMjozNiwgR2VvcmdlIFN0YXJrIHdyb3RlOg0K
Pj4+Pj4+IFVzaW5nIG9mIGRldm0gQVBJIGxlYWRzIHRvIGEgY2VydGFpbiBvcmRlciBvZiByZWxl
YXNpbmcgcmVzb3VyY2VzLg0KPj4+Pj4+IFNvIGFsbCBkZXBlbmRlbnQgcmVzb3VyY2VzIHdoaWNo
IGFyZSBub3QgZGV2bS13cmFwcGVkIHNob3VsZCBiZSANCj4+Pj4+PiBkZWxldGVkDQo+Pj4+Pj4g
d2l0aCByZXNwZWN0IHRvIGRldm0tcmVsZWFzZSBvcmRlci4gTXV0ZXggaXMgb25lIG9mIHN1Y2gg
b2JqZWN0cyB0aGF0DQo+Pj4+Pj4gb2Z0ZW4gaXMgYm91bmQgdG8gb3RoZXIgcmVzb3VyY2VzIGFu
ZCBoYXMgbm8gb3duIGRldm0gd3JhcHBpbmcuDQo+Pj4+Pj4gU2luY2UgbXV0ZXhfZGVzdHJveSgp
IGFjdHVhbGx5IGRvZXMgbm90aGluZyBpbiBub24tZGVidWcgYnVpbGRzDQo+Pj4+Pj4gZnJlcXVl
bnRseSBjYWxsaW5nIG11dGV4X2Rlc3Ryb3koKSBpcyBqdXN0IGlnbm9yZWQgd2hpY2ggaXMgc2Fm
ZSBmb3INCj4+Pj4+PiBub3cNCj4+Pj4+PiBidXQgd3JvbmcgZm9ybWFsbHkgYW5kIGNhbiBsZWFk
IHRvIGEgcHJvYmxlbSBpZiBtdXRleF9kZXN0cm95KCkgDQo+Pj4+Pj4gd2lsbCBiZQ0KPj4+Pj4+
IGV4dGVuZGVkIHNvIGludHJvZHVjZSBkZXZtX211dGV4X2luaXQoKQ0KPj4+Pj4+DQo+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogR2VvcmdlIFN0YXJrIDxnbnN0YXJrQHNhbHV0ZWRldmljZXMuY29tPg0K
Pj4+Pj4+IC0tLQ0KPj4+Pj4+IMKgwqDCoCBpbmNsdWRlL2xpbnV4L211dGV4LmjCoMKgwqDCoMKg
wqDCoCB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+Pj4gwqDCoMKgIGtlcm5lbC9s
b2NraW5nL211dGV4LWRlYnVnLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+Pj4g
wqDCoMKgIDIgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQ0KPj4+Pj4+DQo+Pj4+Pj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXV0ZXguaCBiL2luY2x1ZGUvbGludXgvbXV0ZXgu
aA0KPj4+Pj4+IGluZGV4IGEzM2FhOWViOWZjMy4uZWJkMDNmZjFlZjY2IDEwMDY0NA0KPj4+Pj4+
IC0tLSBhL2luY2x1ZGUvbGludXgvbXV0ZXguaA0KPj4+Pj4+ICsrKyBiL2luY2x1ZGUvbGludXgv
bXV0ZXguaA0KPj4+Pj4+IEBAIC0yMSw2ICsyMSw4IEBADQo+Pj4+Pj4gwqDCoMKgICNpbmNsdWRl
IDxsaW51eC9kZWJ1Z19sb2Nrcy5oPg0KPj4+Pj4+IMKgwqDCoCAjaW5jbHVkZSA8bGludXgvY2xl
YW51cC5oPg0KPj4+Pj4+ICtzdHJ1Y3QgZGV2aWNlOw0KPj4+Pj4+ICsNCj4+Pj4+PiDCoMKgwqAg
I2lmZGVmIENPTkZJR19ERUJVR19MT0NLX0FMTE9DDQo+Pj4+Pj4gwqDCoMKgICMgZGVmaW5lIF9f
REVQX01BUF9NVVRFWF9JTklUSUFMSVpFUihsb2NrbmFtZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwNCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICwgLmRlcF9tYXAgPSB7wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+Pj4+IEBAIC0xMjcsNiArMTI5LDIw
IEBAIGV4dGVybiB2b2lkIF9fbXV0ZXhfaW5pdChzdHJ1Y3QgbXV0ZXggKmxvY2ssDQo+Pj4+Pj4g
Y29uc3QgY2hhciAqbmFtZSwNCj4+Pj4+PiDCoMKgwqDCoCAqLw0KPj4+Pj4+IMKgwqDCoCBleHRl
cm4gYm9vbCBtdXRleF9pc19sb2NrZWQoc3RydWN0IG11dGV4ICpsb2NrKTsNCj4+Pj4+PiArI2lm
ZGVmIENPTkZJR19ERUJVR19NVVRFWEVTDQo+Pj4+Pj4gKw0KPj4+Pj4+ICtpbnQgZGV2bV9tdXRl
eF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG11dGV4ICpsb2NrKTsNCj4+Pj4+IFBs
ZWFzZSBhZGQgImV4dGVybiIgdG8gdGhlIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIHRvIGJlIGNvbnNp
c3RlbnQgd2l0aA0KPj4+Pj4gb3RoZXIgZnVuY3Rpb25hbCBkZWNsYXJhdGlvbnMgaW4gbXV0ZXgu
aC4NCj4+Pj4gJ2V4dGVybicgaXMgcG9pbnRsZXNzIGFuZCBkZXByZWNhdGVkIG9uIGZ1bmN0aW9u
IHByb3RvdHlwZXMuIEFscmVhZHkNCj4+Pj4gaGF2aW5nIHNvbWUgaXMgbm90IGEgZ29vZCByZWFz
b24gdG8gYWRkIG5ldyBvbmVzLCBlcnJvcnMgZnJvbSB0aGUgcGFzdA0KPj4+PiBzaG91bGQgYmUg
YXZvaWRlZCBub3dhZGF5cy4gV2l0aCB0aW1lIHRoZXkgc2hvdWxkIGFsbCBkaXNhcHBlYXIgc28g
DQo+Pj4+IGRvbid0DQo+Pj4+IGFkZCBuZXcgb25lcy4NCj4+PiBZZXMsICJleHRlcm4iIGlzIG9w
dGlvbmFsLiBJdCBpcyBqdXN0IGEgc3VnZ2VzdGlvbiBhbmQgSSBhbSBnb2luZyB0bw0KPj4+IGFy
Z3VlIGFib3V0IHRoYXQuDQo+Pg0KPj4gRldJVywgbm90ZSB0aGF0IHdoZW4geW91IHBlcmZvcm0g
YSBzdHJpY3QgY2hlY2sgd2l0aCBjaGVja3BhdGNoLnBsLCB5b3UNCj4+IGdldCBhIHdhcm5pbmcg
Zm9yIHRoYXQ6DQo+Pg0KPj4gJCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLXN0cmljdCAtZyBI
RUFEDQo+PiBDSEVDSzogZXh0ZXJuIHByb3RvdHlwZXMgc2hvdWxkIGJlIGF2b2lkZWQgaW4gLmgg
ZmlsZXMNCj4+ICM1NjogRklMRTogaW5jbHVkZS9saW51eC9tdXRleC5oOjEzMToNCj4+ICtleHRl
cm4gaW50IGRldm1fbXV0ZXhfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAq
bG9jayk7DQo+Pg0KPj4gdG90YWw6IDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAxIGNoZWNrcywgOTkg
bGluZXMgY2hlY2tlZA0KPiANCj4gVGhpcyBpcyBhbWJpZ3VvdXMgc2l0dWF0aW9uIGFib3V0IGV4
dGVybi4gSXQncyBkZXByZWNhdGVkIGFuZCB1c2VsZXNzIG9uDQo+IG9uZSBoYW5kIGJ1dCBoYXJt
bGVzcy4gQW5kIHRob3NlIGV4dGVybnMgd2lsbCBub3QgZGlzYXBwZWFyIGJ5IHRoZW1zZWxmDQo+
IC0gaXQnbGwgYmUgb25lIHBhdGNoIHRoYXQgY2xlYW4gdGhlbSBhbGwgYXQgb25jZSAoaW4gb25l
IGhlYWRlciBhdA0KPiBsZWFzdCkgc28gb25lIG1vcmUgZXh0ZXJuIHdpbGwgbm90IGFsdGVyIHRo
ZSBvdmVyYWxsIHBpY3R1cmUuDQoNClRoYXQga2luZCBvZiBjbGVhbnVwIHBhdGNoIGJvbWIgaXMg
YSBuaWdodG1hcmUgZm9yIGJhY2twb3J0aW5nLCBzbyBpZiBpdCANCmhhcHBlbnMgb25lIGRheSBp
dCBzaG91bGQgYmUgYXMgbGlnaHQgYXMgcG9zc2libGUsIGhlbmNlIHRoZSBpbXBvcnRhbmNlIA0K
dG8gbm90IGFkZCBuZXcgb25lcyBhbmQgcmVtb3ZlIGV4aXN0aW5nIG9uZSBldmVyeXRpbWUgeW91
IG1vZGlmeSBvciBtb3ZlIA0KYSBsaW5lIGluY2x1ZGluZyBpdCBmb3Igd2hhdGV2ZXIgcmVhc29u
Lg0KDQo+IA0KPiBPbiB0aGUgb3RoZXIgaGFuZCBpZiB3ZSBtYW5hZ2UgdG8gcGxhY2UgZGV2bV9t
dXRleF9pbml0IG5lYXINCj4gbXV0ZXhfZGVzdHJveSB0aGVuIHdlJ2xsIGhhdmU6DQo+IA0KPiBp
bnQgZGV2bV9tdXRleF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IG11dGV4ICpsb2Nr
KTsNCj4gZXh0ZXJuIHZvaWQgbXV0ZXhfZGVzdHJveShzdHJ1Y3QgbXV0ZXggKmxvY2spOw0KDQpJ
IHNlbnQgeW91IGFuIGFsdGVybmF0aXZlIHByb3Bvc2FsIHRoYXQgYXZvaWRzIGR1cGxpY2F0aW9u
IG9mIHRoZSBzdGF0aWMgDQppbmxpbmUgdmVyc2lvbiBvZiBkZXZtX211dGV4X2luaXQoKS4gSWYg
eW91IGFncmVlIHdpdGggaXQganVzdCB0YWtlIGl0IA0KaW50byB5b3VyIHNlcmllcyBhbmQgdGhh
dCBxdWVzdGlvbiB3aWxsIHZhbmlzaC4NCg0KPiANCj4gYW5kIGl0IHJhaXNlcyBxdWVzdGlvbnMg
YW5kIGRvZXMgbm90IGxvb2sgdmVyeSBuaWNlLg0KDQpJZiB5b3UgbG9vayBhdCBsaW51eC9tbS5o
IHRoZXJlIGFyZSBwbGVudHkgb2YgdGhlbSBhbnl3YXksIHNvIHdoeSBkbyANCmRpZmZlcmVudCA/
IEZvciBhbiBleGVtcGxlIGxvb2sgYXQgDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92Ni43LXJjNC9zb3VyY2UvaW5jbHVkZS9saW51eC9tbS5oI0wyMzcyDQoNCg0KQ2hyaXN0b3Bo
ZQ0K
