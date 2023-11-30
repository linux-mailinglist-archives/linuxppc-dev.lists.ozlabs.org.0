Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F827FF34D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 16:17:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=hCpCvkmA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh0DD4C3Bz3cgQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 02:17:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=hCpCvkmA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::602; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh0CK3qyMz3bwJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 02:16:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWcC8YxhvSmBhzeyYjVc5ComMZ0a4h4hIXx4P+Ky/KpVq3xaMP+2q4YgPc8cY8u5a6ofVhMJ61XcdBHFLOcEkYrmUBNVa38vJLIbLHVPAHmfJCaIQIA31hr7+TjWKFWWBU3tJy+WyqCIk7euLXaCpAsPFOpaGF0xTylCFdqz0w2Y2F+AeFKdd+o/Cw+49AxhXZUuuIJ3mNzfmownVDj+13+oMoxH98Bvd00rp+7N629BbkBkPRxn/2Uw7XfGbQj9QsgNZJFz6Fq/EP+NuH7v9a9gHiOqH+65G3tXlu+0YGPqC0IKArlifCVgknB4Q9sqsis/pWV69xEVpxchEZnJKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yojn7RoFD4VRqjnaC7FGZug+voYAy6JFP8NGDu7/kBk=;
 b=dVRKe8DSzWJ+AvPdGiOHGUSG1kigFJxHDKR8IdPm07RH0b0EelyTRk/6PkMwYStZ3bDvwdhPkl2qUtK6Fq/vuV8F6GUZx713YQ4KvYYBWFJZ5WPMH/evQvLMtCNMzak6c78oujhspcxg+/KbQn6IMoNgwrqyBwwPpodIONgEWiiJko6AC76NkGEA1IgbpSQZBSr7w9itBR2EAs9o1BS8PbaKP7qm1FL6ihKbT1Ra0NMx0ncoRtMsWHCa3JUwNh+SsyWVXjSGS0Eu/zSVPL7j3DoDr4Hao5jtlA0j8QqwK0RKT8VBToCjUxKIJWcxmeyHYNwK9GFyrOFfN0uelvWzaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yojn7RoFD4VRqjnaC7FGZug+voYAy6JFP8NGDu7/kBk=;
 b=hCpCvkmA8jbyeV1GC7eHKn7esc1d7Q1dtVvGaqdilswK8/1s04vCA3133epjtOZnhKwlJqJXMnf5KiWWrWV1e7R0A2clqjQKLLhqkxs6nw+tyGHUrjqxA11ulwj+gJHvip+KV4PLCGKM2dX+QnqpGXHM62R+QlO6L9QO3dbkrZOvVSn6okhbpwZAyFk056n3vk45uq8b/PfLYK1DPxvSC1dsK4G9KJ59hrNqiPKr2z7zagxJk3eo3wZMoHi5B9SwRHEGKzTyISbl9s/fLHti1pyJhsXJgoVOU63MYk1zPxYEb1Dg6eBM99t0aQeIZH+zOS/mYJEm25N1FpkTmshg6Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2309.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Thu, 30 Nov
 2023 15:15:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.011; Thu, 30 Nov 2023
 15:15:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/irq: Allow softirq to hardirq stack transition
Thread-Topic: [PATCH] powerpc/irq: Allow softirq to hardirq stack transition
Thread-Index: AQHaI4v/GaSM9UOZTUyS6175YVG11bCS+SMA
Date: Thu, 30 Nov 2023 15:15:57 +0000
Message-ID: <77e18f24-7f06-4d91-b57c-af8837be0420@csgroup.eu>
References: <20231130125045.3080961-1-mpe@ellerman.id.au>
In-Reply-To: <20231130125045.3080961-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2309:EE_
x-ms-office365-filtering-correlation-id: b79962df-5e8b-48da-bc30-08dbf1b740d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  TLIqARGAic2WBRNBTEs+cXfaIshbQcTaQwFEcIaqqOZJnPji4YdfVZfn4S5/Z9EzFAupyqXP8l6QZCvoBiZuGHAtW/vOMoJNPxtj2CmB979Y/83mKJMYddqD8fYfX4eXHNO27QWhNgLVxxhm8gPQcHnXxnDBjup7nzCjiO52KH+awx/Eh1Su23Gvb3rjXXKh7cvNO0J2VosiQZHexkaF2DH+viBd/pG6A7c0DmhzoYeoPtWTr98BYNHMYVKE0ECVm2N3bBs+jNG/3iofhTnf4e5WZcb+6kR7Suc3Jg/HG/ApqbVl7fTAgEstDvfqIoJtHmT4AkDD7lDyJGhwfC4hm3pKd+LlW4oe/Nz5YXtgOzSwHtezwAmvpSTmO06PumBsfg76pYm9DQAsH7wKcaVFSiElZsSI+JjkgfxEhNXkEvXctLnZawmoUiE+fivX1twEMoLvASBI7LmYiqmoWS4ZUocbnbk5kIU+SkrjmNMefWicJg9KNiTR+BMBiiqxgjGfSarK52cZhbl8G9HD5w3koBEMCATI2r2lKS83QDY7xAkXHpW8v4smtSHXUo0DkvuAGn3SuyDnWWLaLQN1QFXBY1YB3wJPrckG8bdAC8JE51uWwdrCjFbeFd38Ccike1x5XMJOmeU9f6LrXseM2hsti6sFDwMPyChAkytlbQLtnTM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(966005)(86362001)(31696002)(44832011)(4326008)(8936002)(8676002)(31686004)(122000001)(38100700002)(41300700001)(38070700009)(6512007)(76116006)(91956017)(6486002)(5660300002)(66946007)(36756003)(2906002)(83380400001)(66476007)(110136005)(66556008)(478600001)(64756008)(71200400001)(316002)(2616005)(66446008)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?M3ZVOWNYdndibldBTmlrT2k4MzhmN2wyY0RSUUozcStETWNLVkp3Yi9iR3pv?=
 =?utf-8?B?dFBWakU1VFhYMkpiSmxTdDlTMmFPSVlKZzh5RkFRY28xUWhJU3o4RlNCaFh2?=
 =?utf-8?B?Sm5yTmYzU1FPY1hlSGYwaWNVaThXOGxmenBrRzhiRmFPNU9UbHhtOEJRZ1du?=
 =?utf-8?B?UlFIYTBTODBLcjlHdkhNREpocFEzd056WDIwSW9QcU5xd1lXS0Z4Y1VYbUdv?=
 =?utf-8?B?cWZyTlY5UDVRQ1pUNVhtdCtoZ1oxZW9zb3hlS2ZhOU83eENVNXZuUmgwZUtN?=
 =?utf-8?B?b2dWNk1aaTRXV0xBdHU3bUZZeEJha2xJdFdJeGpkN3IyNHh6bDU4L01ZZ2VU?=
 =?utf-8?B?eEZyNGl6VXB0SU5OUzRVVDU2ZmxmWXcwWkJ0dXVaQlV4cGpYMkpyYWV0aVo3?=
 =?utf-8?B?bEpsZnBFTlF0U0RPSFlqQk5adWNmUEdPdUE1eG4xd3pXK3VSYmV3RDM3akxt?=
 =?utf-8?B?aFEvWE1TYXV5eVNuSDRlclVvdXlFWnBzcFVvMDZkU280RHlrdjlVUmVFVlFQ?=
 =?utf-8?B?TjgxNlF0TTdKWkp2K0gxZlVMTlc3dEh4Rk9LVWx1K3psYlczNUJDRHhWcXlZ?=
 =?utf-8?B?VEVzQXdBR2pYK3pCdWpRYlgzNnNOcFBKa0NyVW1uNWVEZlBMelJ2TFRIalRy?=
 =?utf-8?B?YUtJNllUT21ZUHNLSEgwY1k1OVN6SGJScndEWXhhOGVlZFBHRGlJTit5anRm?=
 =?utf-8?B?cjRxM2lzOXpncW5raFFIM0RSNTF2YUJPc0llRGROTEtydmZLckdHU05TRDlw?=
 =?utf-8?B?K3cwbDhQS3JJS0g4b3J1NEcxc3ZRdHpQZFo1NkNLV2RXS0RrQmlYWm5uZ2Ju?=
 =?utf-8?B?YUR4bnRaK2FaaVRXY2thVjJvRWVWOURZaGhWSUxWMndreHhQaXJuWVVtWmZE?=
 =?utf-8?B?alZDNGNSOTVzcXhuMDZnU05aNUVUR1FuNmJYWUJBaTFVRzNBcjBKeTQzbzl2?=
 =?utf-8?B?bnpsM0RScmZnTTcrSjhVOGxzREUxeXpwc2Yxa21MNU1qMitia04zcytTeGJh?=
 =?utf-8?B?c2ZoTndnb2wyMkF5REk3S3dBeDBaaGRJcCtaRms2cHZDYlNzTWh3K0doT0o3?=
 =?utf-8?B?by9peHFaOGh2UHIvVHduRFhZVUtMaUtwN0JTQk9takd6bFNVS2dXSEEzMEtY?=
 =?utf-8?B?YzNsQUNja1ZUK0t4UCtGbXNjWmUybUFBaFZ4VXpmUmN3bnVnNENRMmFGWGNT?=
 =?utf-8?B?SGRSWkJZTXZVK1dzNk5nd2lpUk9QK0sxMm01bzNOMlA0c0tha0lCRHFCWUJt?=
 =?utf-8?B?TEM5MWdvRXpvQnpEVWNjRHgyVGkrT3VFU1ZoTmVtVlk3cWhRN3pqU2p6T3pz?=
 =?utf-8?B?SitERyt2aFN1dTRjUEhjeFdYWjNUUkxsM0pjWmt5WXRieEIxWG1jZk1EWWQr?=
 =?utf-8?B?WldOTlg0Q0ZzaXNPeFA5M1ZRR29keCt3N2ltZ2VkYlhlNzJVQ1FXSWxEUTB5?=
 =?utf-8?B?WHNOM0NRSnRhSHlaL2xGd2FXYzF2NVlBbGhMeUVCSytiK3Q3bGVIMnBUZ2VZ?=
 =?utf-8?B?aU5CbHhaSjJoYkxrVlpBYmJ6ZXFzSjI3SFh3T0FIOFdBMFJvS1UrNFZabXBS?=
 =?utf-8?B?QjEvejUvVU1oVFE0cFg3NTlHbGptR0NuZ3YyekUzUGxMSk1LTk5tR3ZzSFVu?=
 =?utf-8?B?VC9vKzhUcmI2cnVOYTZDUURUVFJSVVpIYVJ0SHJyRUlBSWJOU09ybnNHVEdJ?=
 =?utf-8?B?SmtaS0lmSEw4d3lZTEFLUW1wajYrTG84OHQ5SGlqR1BlM0c2RUpGcE1FRThs?=
 =?utf-8?B?QUN3S0pnbDk1Y0s3b3FzdlJoeWVyRms4TUl4bTFTVXV2R0NtbkxUY2NHNk9J?=
 =?utf-8?B?TGFFdGZZZ0w3Rk0wckkvWFVjSnhienM3cVVtYzdObHdITUduWHd3MTZQa1Iz?=
 =?utf-8?B?ZjlmaStwQXRvbjJ3MTlWR0wwYnE0N3Z0YVJ5bGh2YzBFTEJOZlRLUm10eU9V?=
 =?utf-8?B?cUR2VlZRQXRVWTBHV0tMcmxISUZrRFdLS0J1VE5ZS3NCUSs3cWtjcXlVaVIx?=
 =?utf-8?B?WVFEL2haSStGb3BrZGNDQWdHK0RYS2VrQ0RQeFlBZDlKL3RnU2hUUlJDbXM2?=
 =?utf-8?B?cXpualZteElaaXVEa1ZqVC9mMG5xaE5LWUw1aVJFb3dxTFFIb01Cc203L3dm?=
 =?utf-8?B?RHJGcVlLWWlyV0h6RUNrQmoxSTdhWjBmT3J6TkNxRm5jZUVjSG9DRGRGelhG?=
 =?utf-8?B?dWdMbWJFenFKdGx3VEtPZHhHelZZdFdjRXFVR2JEd2x0RWd3cDhvd3RiUDVj?=
 =?utf-8?B?K1p5UndYZnFXVWRuYWx0ODY0RTRnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C370A6D6397141469B6E479A32B0CA40@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b79962df-5e8b-48da-bc30-08dbf1b740d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 15:15:57.1690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mlXKrRyt/sm1bAH+qXR8MkRV+e/ThXYYxwH73PqKMtu98BZ84LhNPyCvjIXFylZ/lvJ/l05vOW7hpE7qe5gBp3rzESCR2oeOEJw4rX/td7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2309
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMwLzExLzIwMjMgw6AgMTM6NTAsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQWxsb3cgYSB0cmFuc2l0aW9uIGZyb20gdGhlIHNvZnRpcnEgc3RhY2sgdG8gdGhlIGhhcmRp
cnEgc3RhY2sgd2hlbg0KPiBoYW5kbGluZyBhIGhhcmRpcnEuIERvaW5nIHNvIG1lYW5zIGEgaGFy
ZGlycSByZWNlaXZlZCB3aGlsZSBkZWVwIGluDQo+IHNvZnRpcnEgcHJvY2Vzc2luZyBpcyBsZXNz
IGxpa2VseSB0byBjYXVzZSBhIHN0YWNrIG92ZXJmbG93IG9mIHRoZQ0KPiBzb2Z0aXJxIHN0YWNr
Lg0KPiANCj4gUHJldmlvdXNseSBpdCB3YXNuJ3Qgc2FmZSB0byBkbyBzbyBiZWNhdXNlIGlycV9l
eGl0KCkgKHdoaWNoIGluaXRpYXRlcw0KPiBzb2Z0aXJxIHByb2Nlc3NpbmcpIHdhcyBjYWxsZWQg
b24gdGhlIGhhcmRpcnEgc3RhY2suDQo+IA0KPiBUaGF0IHdhcyBjaGFuZ2VkIGluIGNvbW1pdCAx
YjFiNmE2ZjRjYzAgKCJwb3dlcnBjOiBoYW5kbGUgaXJxX2VudGVyLw0KPiBpcnFfZXhpdCBpbiBp
bnRlcnJ1cHQgaGFuZGxlciB3cmFwcGVycyIpIGFuZCAxMzQ2ZDAwZTFiZGYgKCJwb3dlcnBjOg0K
PiBEb24ndCBzZWxlY3QgSEFWRV9JUlFfRVhJVF9PTl9JUlFfU1RBQ0siKS4NCj4gDQo+IFRoZSBh
bGxvd2VkIHRyYW5zaXRpb25zIGFyZSBub3c6DQo+ICAgLSBwcm9jZXNzIHN0YWNrIC0+IGhhcmRp
cnEgc3RhY2sNCj4gICAtIHByb2Nlc3Mgc3RhY2sgLT4gc29mdGlycSBzdGFjaw0KPiAgIC0gcHJv
Y2VzcyBzdGFjayAtPiBzb2Z0aXJxIHN0YWNrIC0+IGhhcmRpcnEgc3RhY2sNCg0KSXQgbWVhbnMg
eW91IGRvbid0IGxpa2UgbXkgcGF0Y2ggDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzZjZDlkOGJiMjI1OGQ4YjUxOTk5YzI1ODRlYWM3NDQy
M2QyYjVlMjkuMTY1NzIwMzc3NC5naXQuY2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1LyANCj8N
Cg0KSSBuZXZlciBnb3QgYW55IGZlZWRiYWNrLg0KDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1p
Y2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dl
cnBjL2tlcm5lbC9pcnEuYyB8IDUgKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9r
ZXJuZWwvaXJxLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL2lycS5jDQo+IGluZGV4IDZmN2Q0ZWRh
YTBiYy4uNzUwNGNlZWM1YzU4IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL2ly
cS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvaXJxLmMNCj4gQEAgLTI4NCwxNSArMjg0
LDE0IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBjYWxsX2RvX2lycShzdHJ1Y3QgcHRf
cmVncyAqcmVncywgdm9pZCAqc3ApDQo+ICAgdm9pZCBfX2RvX0lSUShzdHJ1Y3QgcHRfcmVncyAq
cmVncykNCj4gICB7DQo+ICAgCXN0cnVjdCBwdF9yZWdzICpvbGRfcmVncyA9IHNldF9pcnFfcmVn
cyhyZWdzKTsNCj4gLQl2b2lkICpjdXJzcCwgKmlycXNwLCAqc2lycXNwOw0KPiArCXZvaWQgKmN1
cnNwLCAqaXJxc3A7DQo+ICAgDQo+ICAgCS8qIFN3aXRjaCB0byB0aGUgaXJxIHN0YWNrIHRvIGhh
bmRsZSB0aGlzICovDQo+ICAgCWN1cnNwID0gKHZvaWQgKikoY3VycmVudF9zdGFja19wb2ludGVy
ICYgfihUSFJFQURfU0laRSAtIDEpKTsNCj4gICAJaXJxc3AgPSBoYXJkaXJxX2N0eFtyYXdfc21w
X3Byb2Nlc3Nvcl9pZCgpXTsNCj4gLQlzaXJxc3AgPSBzb2Z0aXJxX2N0eFtyYXdfc21wX3Byb2Nl
c3Nvcl9pZCgpXTsNCj4gICANCj4gICAJLyogQWxyZWFkeSB0aGVyZSA/IElmIG5vdCBzd2l0Y2gg
c3RhY2sgYW5kIGNhbGwgKi8NCj4gLQlpZiAodW5saWtlbHkoY3Vyc3AgPT0gaXJxc3AgfHwgY3Vy
c3AgPT0gc2lycXNwKSkNCj4gKwlpZiAodW5saWtlbHkoY3Vyc3AgPT0gaXJxc3ApKQ0KPiAgIAkJ
X19kb19pcnEocmVncywgY3VycmVudF9zdGFja19wb2ludGVyKTsNCj4gICAJZWxzZQ0KPiAgIAkJ
Y2FsbF9kb19pcnEocmVncywgaXJxc3ApOw0K
