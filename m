Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F5D649994
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 08:33:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVtfH4yG8z3bhY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 18:33:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KrBZyXPl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.80; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KrBZyXPl;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2080.outbound.protection.outlook.com [40.107.9.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVtbR21DQz3bfN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 18:31:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OI6IfZzXvqT/3xMZ5VBtdj3W/CSET+I8VQ1Kuz+n0Dm08vPXwev4cgYvWZ8Z2dVmuIrObXPm8HksCx9bRgDYsLy8eJYpYV8eksiOc/zrOV4AFl1Z+CSiroqQt9xcKWEs8p9Sd/H3ega5tc4wPF6ueQQwrhJj6b4DpofwqrsXjP13cCoyew6pI6ShN4qbtwtzhVkB7hdxCXdGFk+kuKuByLu2Vct8NIzBqVFxX6pXaxS99SAEj+ZfbAbaNqv0Ek6MIYhpI7eWsecipuBuTU296TTdyR3ZVmOSFTKHe2cXi9KQjlqhYQP+53HWZP5kVcmZCbJT3Ans+khq7qj1a6Nh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jr/k57kZORynNRYbh/WtYCeChnsDD4/i2Knd5/bq304=;
 b=bheJtV+dSJIV6X1X8JXiE+lMq9qwnoMmrjrrs5s4TpCLHZ762bZF1cpemcXkJjYk1GDTwpy11W6H9ogGu2uskoJW3qZkFU+LLwrGKYnMaWG/uP0ESWSBJPxUjX0Cp2qRSiIan7hDvFFUbN3Jm6E+vigWOh4vfemGbQbJNW+LMxthenNCYJGAjWlK6x5h67le/Wyq03ScsmLtpcX9OWvMt4qbsD4Y5g0SckbOUiVM8HOSHCyuO+ERQ6T25iAPqhuwTtz1uNyGeCz2Pt6pZHkAi7J01xH2fQCQ1b5MplX7pEAssvntkKZYgbBsVvrmpYFG3c2NjmAfhf13sAuWLkgdEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jr/k57kZORynNRYbh/WtYCeChnsDD4/i2Knd5/bq304=;
 b=KrBZyXPl3EcsvSOPD7oQgNl0kG1hnMUAQPGabEGonffc38ASQXuG5pFkvMxw79I18m0L84f9sYDQ3AMazYz/qAda3OfEliaFS07fYuYWbxL2j0OfK1PctqbgWuhLixeLOeVaG9WLp7lDPGaqj546JgtHO3OVlz/OkNCqkOs+fKu6xZrYthhRWw0CwuAPbZSd0XimZ7EI2RJNxe71PaDdT7yljoRffiy5SsW9BsVExk4PO3Jn+qEzT03pHL7Jz32mO7Lev0TqWggYJ94vwxqxP9WUq45A+y+fzDSJLkUhJkvM2dA8iCNnPVF6zYwCdMot+CCRAeG+mloQFlDkEsOMRQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2918.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 07:30:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 07:30:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "bugzilla-daemon@kernel.org"
	<bugzilla-daemon@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [Bug 214913] [xfstests generic/051] BUG: Kernel NULL pointer
 dereference on read at 0x00000108 NIP [c0000000000372e4]
 tm_cgpr_active+0x14/0x40
Thread-Topic: [Bug 214913] [xfstests generic/051] BUG: Kernel NULL pointer
 dereference on read at 0x00000108 NIP [c0000000000372e4]
 tm_cgpr_active+0x14/0x40
Thread-Index: AQHZDWNGe7eB+L10ck+5v9T2L8d1065pn4cAgAA9BIA=
Date: Mon, 12 Dec 2022 07:30:52 +0000
Message-ID: <fb3d079c-3e8b-af91-f2a6-13ccb9e91373@csgroup.eu>
References: <bug-214913-206035@https.bugzilla.kernel.org/>
 <bug-214913-206035-wclPzMFhaA@https.bugzilla.kernel.org/>
 <COZJ8XSHX9KD.1JWG82VQXX2LE@bobo>
In-Reply-To: <COZJ8XSHX9KD.1JWG82VQXX2LE@bobo>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2918:EE_
x-ms-office365-filtering-correlation-id: b9e7edc2-8057-4de9-a296-08dadc12cc66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  FbHSdTE+5cmDf4F3S70/j1xLEHlMNug3NNXWGJUnD6HDWM3QfqJvYmf+jqeKUVRcItW8kZdlmNfhIxBv9ytVJmt/yWCbOGvLbuO4uNKg9XwkyBW8vVFBrcMZDKBzB0WfgR5oVdTk4s0D6JUZ40YNSQ3bs5+KgWQyMaEkNKM29GMWRAB+3nluYHyz/DtNWw1fsKCTxtlKP/fsXAgFzgx4s6EvRQDoZvLMYGX4vBLA+GeT5mxptvL9K4WmgyVzBOJ+l0RVNbSnFqqaDhZDX8PsMFTef0Uf176qpj2FcfRiuTvZwK+8yJhqiwvdbDBAAXzFwLpsSMVWMnJHzvXZwm/dDktMRCfkt+YxsL7xtDjaVHFW1QH4jwLZaSPrykP4MhGoqlcl9nFRnyvevj+AiJdnw04YhR49nD0vtxrcJB6EibGfFHbGvuIJM4uMzBVw9+Q9hRvs7m8OdcjM1dgLRSOsM1/0KoFeodDkhj2iZ5etsljw6jMV1///PV//c5E/P5XdD3h4Bp7ckQc93q29aJfbwsyBUsfPmdOpj3AS6aXM6qB5Ssr4LtXZ3btmo5asfRVPgtUCEerid0Jiv5YphScpoFvBVUHL+zYhQmqzbW+4F87AG4NuLLjm74Xhp90L00llJDuMHUa/Web8PcuqQjmlmRrNIJGufKEiOk2v0Q7OPLMLqCA97uwAvlfC4hqaAZkcqi8RYY/YP/bUtNsh8f76FvTbDQprAPVK/pf249Ir6XGLIRWCv4dpZmrgELJdLtWdBoxphgc+F/2zR6K5fDz36MnTQ6i8iEEcyT15tpCIlMWSVHyTWXU9HKMDpPmLk5+9
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(366004)(39850400004)(451199015)(36756003)(86362001)(31696002)(44832011)(2906002)(2616005)(186003)(83380400001)(110136005)(91956017)(6512007)(478600001)(71200400001)(122000001)(26005)(6506007)(966005)(6486002)(38100700002)(41300700001)(38070700005)(5660300002)(76116006)(66946007)(66476007)(8936002)(66556008)(66446008)(64756008)(316002)(8676002)(31686004)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cDh5N21lU1lCdzI4WFJoMXNTSXZXb1V3a3ZPK1Jsbk9wVTZqcHY2a1Y4QmUx?=
 =?utf-8?B?MlM0U1didEtmWDB0OHhsODlMSmFsUnQ2V2NQakJtcmI4VGROUWZ1cmJTOVN5?=
 =?utf-8?B?MXRnVkpTc1NMVWM2S1hIRUh4cXAwOU1jNk01YXphMTQzelV6UitzMUhtRHVO?=
 =?utf-8?B?KzVacEpKTjR5Mkp3ZGZJclNjcmhndnRqZXNZMVNxOEZSY3BMUzVkZk5sQVB2?=
 =?utf-8?B?dnZOR0syU3V5amNSSWhLYWVaTUp5V3N1K2NrSW5rQ01ZdUl3dVFUQzVTTmp1?=
 =?utf-8?B?WlNyVEllNW1qVGdCalVSZHNmUFpRTnRybUkrODFlM3B5akxqSUxpS2pqZy96?=
 =?utf-8?B?QlV2cHY5NlczUXlsTWQ1d050eTR4bFBrZnQ3RUNEaGl2VGt2RHY5ZmgrUk9Q?=
 =?utf-8?B?czV4ZnQrelJkSTFIOW9tNmZnOFRGY1JmRlMyOGhnbFNpbnFuc1d4OXRObG52?=
 =?utf-8?B?RmFtenpVa1pBNFVIQ2pwMmVMRnFlZmtvWFpCTjYrNGkvOGhhbTRkVDRnTjBR?=
 =?utf-8?B?RTZKaEdhUS9xdGEzMGJwaCtxa1VDQlhKaTkyL1F0S044N3ltRmN3SFFFWDhP?=
 =?utf-8?B?NXlCbTBsOVB3K1ZEWHhEdlRyb3NpQXd5T0h6cmFVTEFaVUl0MFBQOGtHWXZU?=
 =?utf-8?B?WUJHVER6dkl6Zy9ROXRyVkYvS3YxbkdDYzRQTEMwUjlWcyt2V1ZrTnZNUDJ4?=
 =?utf-8?B?TCs5OU4xRmh5QkJ6Z1RHVm5OeFRJS0VTa2tqQ0k1blhTV0pHR0NXanhGK290?=
 =?utf-8?B?VGIvSlJaUXZOajEzelVXVHBNL1VyZHBMODVLaHhQSjV5Qmo0U3Vhd24wbzNV?=
 =?utf-8?B?YVdlbXY5Qmp4eWZ4ME9mczlWNmk3VGpMM1FSbGhvUEJiejg0Y1IrMjZ5WFp0?=
 =?utf-8?B?UFZTSGpZRnZyYnQ3dE5zeTh0OUs0M0tlLzVENzhGaEk0SjNGNlFMZFlWd2dX?=
 =?utf-8?B?cEdzRTJXekVmMFQ2YWt5Q3lQMXAzRWpLMUdQdDRJUFBKUkpIejNHTmdqMjlB?=
 =?utf-8?B?R0R4QTZsSk1ZcUYxTUJIU01meFVEU3RMeElJcGwzRGp2UndwOG42NHdscTJK?=
 =?utf-8?B?UEpvRUlnVnRMUnRtVTZUZFNZdG9YbGdvbmpBRCt3R1lLM1VmUHkwWlUydDBo?=
 =?utf-8?B?ZWF3dW0rMmRZUy9aL3JHLzJUR1FhcDRzMk5rRTRzTEtnZk9pR3ZPTGNNQUlj?=
 =?utf-8?B?Vk0vREo3R0VqTFVhLzAxWWhmd3RJT2c5NTd0TW02UUx6N01hQmhXSVlXOUxH?=
 =?utf-8?B?YWg2Vm10dW4vNjlaZG1GK21lMmJveDZ3NVEzZ09ZeU0wOXZXTmd5dlZHZ3Bh?=
 =?utf-8?B?dTZTSDF5UWxjRCtIYy94dE90MVdlQVpUV1NwQ1VseTRPQ1RBaUt4ZEhia3k4?=
 =?utf-8?B?QWdzb0gvZVJZcmViZXFPaDBvdlVUTWEvOHUvcHZHdHVrb1pydG1QYkE0dURy?=
 =?utf-8?B?UkFuZmxuUVhVQU1ud1lMeUVsSzQ1LzF4VzYwb0sxbVNiMlVnMlgxNWpJL0Vt?=
 =?utf-8?B?KzRjQnQzckFpV2I4V0F5QkVQa3JsVG4wNm1vSDQ2UHo3WXJkNXRqWm5PYm5x?=
 =?utf-8?B?ZVg3NkozS2s5aE43dGtiSDNHc3FSVjJ0NkRCanVTNVpUSE1PMDdlbGI5UnVi?=
 =?utf-8?B?TXlMVE1rbWFCVHkyT0NIb1dqaDNhWFY3d1JOV2tJWmhlZ3pFQmxlZ0s1MFlt?=
 =?utf-8?B?S0lTMzZqbWt1R0lLaDhrbXBJeUJ5ODIzYVc4ck8yTmNhR3ZqVzU5bC9ESzN3?=
 =?utf-8?B?b0Y5QTJrcytVTmRSNU1ibGJMeTdPOGRaaDFZc1d5WnVzeERYN2NxOEQ0WndL?=
 =?utf-8?B?alhhSkZMbHhDeVoybTlmY084STU4SXdISlUzcm51UWZHaGdCc2pPSW0zNWFV?=
 =?utf-8?B?NFpqZ2ljRnc5bGVOaWVuSjVCNjVFdng5YVFsdmZQbHFOYWkzYjNqVjVPcHpz?=
 =?utf-8?B?QzRHVFVoM1cxeGIybG83Qi9pSE1lZCt2bGVkOVpScFJ3VXJKSHpuQ2tiaDdD?=
 =?utf-8?B?QW9vQUNkUFF6YkFIVDdaQ2lMZWVScE5ORW5oV0lOQ2JRQnYwWnBsOUhBRmZI?=
 =?utf-8?B?VGU0MmJVaGJaVXdSMG4wbkZ6eUVodUk1VjRDNHFzcDFIdHpScDNxQjU4bGF4?=
 =?utf-8?B?MFMxOEUxUk0rUTFyMXZHamdQd2JJUjRZSlV5WmwvUW9IcEYwbWxOZzJUYkg5?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A00E690C0EAB64281652AD1E0315C17@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e7edc2-8057-4de9-a296-08dadc12cc66
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 07:30:52.2835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TX1MyXVuzVee+JWcMJgSpkcUgmfH7eaAPf8zmbnnCv3Ve1RGWH/reConMLg6J3SuJlbRB9kTU0u88MsdHCdRFWrYkk1kCCXzT5wLPu55ihk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2918
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzEyLzIwMjIgw6AgMDQ6NTIsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBTdW4gRGVjIDExLCAyMDIyIGF0IDExOjE5IFBNIEFFU1QsICB3cm90ZToNCj4+IGh0dHBz
Oi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE0OTEzDQo+Pg0KPj4gLS0t
IENvbW1lbnQgIzcgZnJvbSBab3JybyBMYW5nICh6bGFuZ0ByZWRoYXQuY29tKSAtLS0NCj4+IChJ
biByZXBseSB0byBNaWNoYWVsIEVsbGVybWFuIGZyb20gY29tbWVudCAjNSkNCj4+PiBTb3JyeSBJ
IGRvbid0IGhhdmUgYW55IGlkZWEgd2hpY2ggY29tbWl0IGNvdWxkIGhhdmUgZml4ZWQgdGhpcy4N
Cj4+Pg0KPj4+IFRoZSBwcm9jZXNzIHRoYXQgY3Jhc2hlZCB3YXMgImZzc3RyZXNzIiwgZG8geW91
IGtub3cgaWYgaXQgdXNlcyBpb191cmluZz8NCj4+DQo+PiBZZXMsIGZzc3RyZXNzIGhhcyBpb191
cmluZyByZWFkL3dyaXRlIG9wZXJhdGlvbnMuIEFuZCBmcm9tIHRoZSBrZXJuZWwgLmNvbmZpZw0K
Pj4gZmlsZShhcyBhdHRhY2htZW50KSwgdGhlIENPTkZJR19JT19VUklORz15DQo+IA0KPiBUaGUg
dGFzayBiZWluZyBkdW1wZWQgc2VlbXMgbGlrZSBpdCdzIGxvc3QgaXRzIHRhc2stPnRocmVhZC5y
ZWdzLiBUaGUNCj4gTlVMTCBwb2ludGVyIGlzIGhlcmU6DQo+IA0KPiBpbnQgdG1fY2dwcl9hY3Rp
dmUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXJnZXQsIGNvbnN0IHN0cnVjdCB1c2VyX3JlZ3NldCAq
cmVnc2V0KQ0KPiB7DQo+ICAgICAgICAgIGlmICghY3B1X2hhc19mZWF0dXJlKENQVV9GVFJfVE0p
KQ0KPiAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPiANCj4gICAgICAgICAgaWYg
KCFNU1JfVE1fQUNUSVZFKHRhcmdldC0+dGhyZWFkLnJlZ3MtPm1zcikpDQo+ICAgICAgICAgICAg
ICAgICAgcmV0dXJuIDA7DQo+IA0KPiAgICAgICAgICByZXR1cm4gcmVnc2V0LT5uOw0KPiB9DQo+
IA0KPiBPbiB0aGF0IHJlZ3MtPm1zciBkZXJlZi4gcjkgY29udGFpbnMgdGhlIHJlZ3MgcG9pbnRl
ci4NCj4gDQo+IFRoZSBrZXJuZWwgYXR0ZW1wdCB0byByZWFkIHVzZXIgcGFnZSAtIGV4cGxvaXQg
YXR0ZW1wdD8gbWVzc2FnZSBpcw0KPiBJIHRoaW5rIGEgcmVkIGhlcnJpbmcgaXQncyBjb21pbmcg
dXAgYmVjYXVzZSBvZiB0aGUgTlVMTCBkZXJlZiBJDQo+IHRoaW5rIChJIHRob3VnaHQgd2UgZml4
ZWQgdGhhdCkuDQo+IA0KDQpObyB3ZSBkaWRuJ3QgZml4IHRoYXQsIG15IHBhdGNoIHdhcyByZWpl
Y3RlZCBzZWUgDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMt
ZGV2L3BhdGNoLzhiODY1YjkzZDI1YzE1YzhlNmQ0MWU3MWMzNjhiZmMyOGRhNDQ4OWQuMTYwNjgx
NjcwMS5naXQuY2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Lw0KDQpUaGUgcmVhc29uIGZvciB0
aGUgcmVqZWN0aW9uIHdhczoNCg0KICAgVGhlIGZpcnN0IHBhZ2UgY2FuIGJlIG1hcHBlZCBpZiBt
bWFwX21pbl9hZGRyIGlzIDAuDQoNCiAgIEJsb2NraW5nIGFsbCBmYXVsdHMgdG8gdGhlIGZpcnN0
IHBhZ2Ugd291bGQgcG90ZW50aWFsbHkgYnJlYWsgYW55DQogICBwcm9ncmFtIHRoYXQgZG9lcyB0
aGF0Lg0KDQogICBBbHNvIGlmIHRoZXJlIGlzIHNvbWV0aGluZyBtYXBwZWQgYXQgMCBpdCdzIGEg
Z29vZCBjaGFuY2UgaXQgaXMgYW4NCiAgIGV4cGxvaXQgYXR0ZW1wdCA6KQ0KDQoNCg0KQ2hyaXN0
b3BoZQ0K
