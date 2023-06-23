Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D905573AFBD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:16:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DBXqopIY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnQSV5qxwz3by9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 15:16:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DBXqopIY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62d; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnQRT3n53z3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 15:15:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jppnte60l6bdbFSDKrej1CuweVBbxAzemRFAeW2m5baccVhytWeSCIVzwKuXtwLxG6DlLelmFM9N0prkp7z0byk/o32hEDIQettZj1neJdlUDCajkoT2tBfCxv7poAb5Fp8WOzoM4gZ/Eos0VEPbsr5NKdNr4M9qIs22LmBaeWgYWXC/27R7AHP0uBV8ScoiMwpUHk8/4ompRnPABcUXcESoJgQb0nG1F+GAeQrZArscdQv04Esgcd8YZIe3GIZ4TZ5D5w6aMocg1i7Koo1+ywA+Grax38FpFPM5KTL2hNt/Lx8MQe1AH+w5622lpzpwfKRh9ISPsG+U5E3seIS7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CCj2TxyUN1Gaj88mSO++7HWYR2MJv//3wEX20UxWi4=;
 b=dw67tfNjkE+60CkfDGVCvVFUSbqR+L9VjUjWBU62CTBgucKvAEzBL6AFiZ0e0XEU1vyCzvAT4WKx6Oaa9ME0Pmy10otKmqHTmSQJchmFRhqApxxj5znSq9UROPigR8LPk798+B4567G7sdvCDNaXajyn2EWOXAUKQFBbyhVwIkOrbh6DZUebgE4OigvdZRcpY+tpvN9hhbam0KSC8qRcRZmVjroJIvToly0QOXD1/8Pr6HQ+KD1DONRlMQXbVDANw/HN0nOvZjmwsbhIgVIRrehwJV9TaGjUvWvEdn7a9AYPi8oDBxXXvURRJLgRH2wt7gv4ejY97wJwkiriyl361g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CCj2TxyUN1Gaj88mSO++7HWYR2MJv//3wEX20UxWi4=;
 b=DBXqopIYUxSVc1YrcV8a/0/UdlKe1GBznEFMEk8ls9384Kk6c+xKD/S2RjJFVZqzCoXbCON7dYJ530227CcHTN9wWkSfP+fKIetnyoJuXkuNZZdKSKOSQEHFCDhWJCgZ2cVcuueHv9Jo0bCtU+8ZoPOi+1C8Dn4/wvL9E7lzTndsil6vKDZJ2YZXTZydFOepR6BVm1W5NgY8PMKAawqIVooK5iS0s7rJLFTDfKxHVXygDn+vhNWS0j1mU8uyx1500qmoF3qwW3wyQADLyaAL5Svnz9E1Sy13bNys95MObiss/7JQeseXmUC/HKrxuw//CSejukdkCeWumLgKil8n/w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1809.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 05:14:58 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 05:14:58 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 04/17] powerpc/ftrace: Simplify function_graph support in
 ftrace.c
Thread-Topic: [PATCH 04/17] powerpc/ftrace: Simplify function_graph support in
 ftrace.c
Thread-Index: AQHZopXjSBPPiCQCcEC/grryNb8MWq+X3iIA
Date: Fri, 23 Jun 2023 05:14:58 +0000
Message-ID: <fc416471-dd66-94d0-f1e0-393801643210@csgroup.eu>
References: <cover.1687166935.git.naveen@kernel.org>
 <4dc92c4b1ed444dc62b748ae7327acdb9e096864.1687166935.git.naveen@kernel.org>
In-Reply-To:  <4dc92c4b1ed444dc62b748ae7327acdb9e096864.1687166935.git.naveen@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1809:EE_
x-ms-office365-filtering-correlation-id: 2045d85a-feb9-4b34-ff34-08db73a8ca0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  orc2+RIs/jXcwgeboiiPQ145jwbKSeaCZuOyskqYISYOFM+roTh6uvZKOebdUTWnrqQY181latTura/QIBCIOfXGhtMir+jJwEEI+zZrKQQNQNOTUHgH0ewTEBoVbVVavFPuXxGI6fQCEpqNxm7GZCdcgrYMEBBXsUVo7c4IdVnpsT11YTISu50lWBOwK3aWpzf9P3MddL0LPKumUAprl0M+a/7USfxvW+ImB0aQQ7vWyQxw39CZayZ0OmXNEfi9tKqqnFjuMT4C+ySbnW1mS9yeeGYP0KZ0K4xPthTnLEdc1uz06b1ejwprWE8ixwJoPG6kSSbNfqS/acEcZg/4loN3XU/Ud6aY502kCeLXsJMIX53qX0k3hn7aSwWpeFxJF6uszcWgC92ZJR33t8kQT2UkfRZo4WQm0rWLRv3cX3ijcvVTowo/ufHdnoqgTiAiDl5mgU1sKd0HQq8PlE7WEh9ZlaOEb286PMDcNIqFuLaB15zI59ZSa0k9+47YJvA85gCPR3xWbGjX7VPWN+q9FMNj7/VdOdbsJOfhCteJn0rT1+UJMwjTjRxDV2AIf5CMeyut3Ucdpv6UPqnHnFbkzZ/0W/IdFPV4hCHzWNpEFdQVTthNeGHvx5TRh1SDXM0qBM2LXhEmZHRhhmhnfWh6SDltM5BshRBtpvpZfZ8ye5P2mDdc8zLmihTXjlexCteZ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(396003)(376002)(136003)(366004)(451199021)(122000001)(38100700002)(38070700005)(86362001)(31696002)(76116006)(91956017)(4326008)(66556008)(316002)(64756008)(66446008)(66946007)(66476007)(2616005)(110136005)(5660300002)(8936002)(83380400001)(8676002)(41300700001)(6486002)(31686004)(6512007)(26005)(478600001)(186003)(71200400001)(6506007)(2906002)(36756003)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RG12azRzcDc0UGMxRWhHUGJoU1oyRFFMUzI5WE5rOWVqVnlRalRveVRhbUll?=
 =?utf-8?B?Qm83UEhzT0YwcUR2SStsNzFNMmR3dDBmMXNiRHJmRUdrcDFoMW5hRTMxYWgw?=
 =?utf-8?B?V0pFUDZNeTVxZklvNHNVUnlkaVJLQkJkb04rV3R1NzI3RmNCaWpuL0w5cWdS?=
 =?utf-8?B?ck16U3FrOFhzQ0FZdnQzbDM4cXZBck5XRFh0MFlQODlaalpjR2ErRWFwdTlK?=
 =?utf-8?B?YjFTUjFVWWxxZm1SOXQxb1ZoQTQ5YjBYZ1BjTjZEMUxuZlZnNWt6cHZjRTRx?=
 =?utf-8?B?bGdRSlZRdUtabmpEL25ET3ZIU3NtNVJDdXhvZXJ6TzZtN2hZbzBEQXRNYTdE?=
 =?utf-8?B?ak5yTFNwWjFnSHg3NmF3R281MW1pbTJjRCtaSDl2NkRiM1Z4STNUakxmcEtD?=
 =?utf-8?B?THZVR0JwT2hjQjlZTnN6dDIrT0tXVE4zYUNQbldXQWt5eUw5Z0w3eHdGRmJ6?=
 =?utf-8?B?SlhiL0FybVNGek1VdTZXbThxb2dJY3NpOFBTMVdXbDI3MERBSnNWUHVxNWtU?=
 =?utf-8?B?RXcwOFpJSDJUN1lKVU9OM0VTMnRjNjNCTFAvQ1N0OTNsTjVhdUU3d3gyNFpw?=
 =?utf-8?B?cTFSRTN0cFN3aFJnT1Ria1Q5bFhmZlVBbkZEcTNJV1NBdThkSytrMFZqU25F?=
 =?utf-8?B?KzBGUVA4ZFRzemUwbk1xR0JmRm1pMTB0ZmxZamhIbkpvUUVYQ1V6Wm1PWEkz?=
 =?utf-8?B?b0VkbGpFZHFmT0xDMmVJTmVQQnAyeXVwcjUzUis3aWxvWCswOUxKbmg4WEJD?=
 =?utf-8?B?MUFsVTJDM2JJRzJGRE5JV05IMkczeFlNcjQxQlpOd2MzQzlDZVU4Qy9obEUr?=
 =?utf-8?B?VlNRU0RERVVJd250amdZU2JDeEpIMzd3NXIxQ2xRMzZoNW9tWGdIZUM1UmE2?=
 =?utf-8?B?OWV5MnJqVlJQaXFGeWJwYlVFbXJrcHVESDhRWVBVY1plWFFSRUhaOVdVdWNt?=
 =?utf-8?B?YzdIdTJqTmYzRFNXQ2gwN21RbVFZRjRNbDFxK0dabGIxaFVoRVJuQmQ3eC9o?=
 =?utf-8?B?ZGtvZmxpeWxuR1BWcWM3NTk1Q212a3hDVjcvUERSN0EvNUJDbW41YS9hODds?=
 =?utf-8?B?RHBKMlM3ZWk4bkJiWk9hbVl0dUNzOURzQ2ZtVUt6Y1Urc01ja3NiZzBRWTUz?=
 =?utf-8?B?Q2RmWHBUVDBCSE9CRWJoYjl1ZW9TQWhoalBsY0N0TVFTd0JrU094bjRieDE3?=
 =?utf-8?B?VG8vTm5kUk1jdU1CQWRvNlJSOGhaYnVxUHNwTG1rNGYvTDRNTFlTN3VMLzVS?=
 =?utf-8?B?dDFsR3poMHF3LzV1QlllbHJ6YVpmcjJlWlZvOUxoUk56Rm5KZ1MrRzd1REJw?=
 =?utf-8?B?T0ViSDV1ZTN1R3RmZW5oVVpxQ3hCYmZxL25Kd0NzS1RYdW5hQks4ODVYZHZy?=
 =?utf-8?B?UnN4ZVF0WFRYSFRDUUtkaCs1bktwN3ZvYjNXTkg0ZUMyU2dCR1V2N2Q5Mndr?=
 =?utf-8?B?L2JOZW01WEpWZU5VOFNUVlhxRVBFczM3RG1kSktpSWJjSkNnYWNRZjJkanNo?=
 =?utf-8?B?MFg5b3hOMFZUQ2VVMTRvN0lyZ1J0ZWRlTXRKWkpnb2tCMTh3RWx3TGVqMCtV?=
 =?utf-8?B?UkRkUE54SlNSTjR0K0R0d0FoRUZHMlRvOU5LdnU1ZUk2ZzE4QnFZTWFXUmFn?=
 =?utf-8?B?Y0NyVy9hTVQyYitaWHVYTnRIWTRQanBlL2Z4L2wwZC9Yengrd0JRTWtwU2dP?=
 =?utf-8?B?RUhEMUovQVl2NjdtWDRSZHBVRHhwZytjcjhmTEhmZ2xZaUFDdkFkSTdSVnB3?=
 =?utf-8?B?ZVFwMy9hTjhEdHkzOXZYNnFBQnNneGptTnI1cU04aDFRTWFoUW8ydjVwQ2ZZ?=
 =?utf-8?B?S0ppTzM2V1hha0M5enVFR2dadUdJTkFoT1Nza1l1RU9BVnV5d2s0TCs0cDZV?=
 =?utf-8?B?aG1DWHFLRUcxUGI0SDZKOHZhWURpZFlqWXpldDgzbW1USmMrVmFCaXBUa3dH?=
 =?utf-8?B?bC94UnlmOUh1dmJtdVFubzNGazJTUnBEZDJRL1NIZ0E4ZHJJSENVZFA2Ukx4?=
 =?utf-8?B?eG1DelFzdFRZNWtleFBYUzVJZEZaWU9kR1lic3ZjV1lEOTVrOCtSRFJCOURa?=
 =?utf-8?B?M2Urc3pHV3RTd1cyQnlERmpnYzhTb282MjZCalZiYjlFaXV4cWQrZThYbnor?=
 =?utf-8?B?NFVjTCtta09mUGJMYXVyeGlpN3E4QUs1SHRNZGdNWVlkZmwrNmE2ZFI1aG5y?=
 =?utf-8?B?clE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3D54541232FF243BA542511FEFD8149@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2045d85a-feb9-4b34-ff34-08db73a8ca0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 05:14:58.3969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S2FpWjRJX1z4nUdOKDrzA8Qm5l7DeJrXqEWrumWP+w7GD2Ab/HqV4ShtcguGqzuwQADUdBnrs8P85cjCHj0lyNO1RJ7UcBI8HECWxJW08N0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1809
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA2LzIwMjMgw6AgMTE6NDcsIE5hdmVlbiBOIFJhbyBhIMOpY3JpdMKgOg0KPiBT
aW5jZSB3ZSBub3cgc3VwcG9ydCBEWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1MgYWNyb3NzIHBwYzMy
IGFuZCBwcGM2NA0KPiBFTEZ2Miwgd2UgY2FuIHNpbXBsaWZ5IGZ1bmN0aW9uX2dyYXBoIHRyYWNl
ciBzdXBwb3J0IGNvZGUgaW4gZnRyYWNlLmMNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5hdmVlbiBO
IFJhbyA8bmF2ZWVuQGtlcm5lbC5vcmc+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95
IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBj
L2tlcm5lbC90cmFjZS9mdHJhY2UuYyB8IDY0ICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhY2UvZnRyYWNlLmMgYi9h
cmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+IGluZGV4IDgxYTEyMWI1NmM0ZDdm
Li5mMTE3MTI0YzMwMzI1ZiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC90cmFj
ZS9mdHJhY2UuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+
IEBAIC03OTAsNDQgKzc5MCwxMCBAQCBpbnQgX19pbml0IGZ0cmFjZV9keW5fYXJjaF9pbml0KHZv
aWQpDQo+ICAgI2VuZGlmDQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJR19GVU5DVElPTl9HUkFQSF9U
UkFDRVINCj4gLQ0KPiAtZXh0ZXJuIHZvaWQgZnRyYWNlX2dyYXBoX2NhbGwodm9pZCk7DQo+IC1l
eHRlcm4gdm9pZCBmdHJhY2VfZ3JhcGhfc3R1Yih2b2lkKTsNCj4gLQ0KPiAtc3RhdGljIGludCBm
dHJhY2VfbW9kaWZ5X2Z0cmFjZV9ncmFwaF9jYWxsZXIoYm9vbCBlbmFibGUpDQo+ICt2b2lkIGZ0
cmFjZV9ncmFwaF9mdW5jKHVuc2lnbmVkIGxvbmcgaXAsIHVuc2lnbmVkIGxvbmcgcGFyZW50X2lw
LA0KPiArCQkgICAgICAgc3RydWN0IGZ0cmFjZV9vcHMgKm9wLCBzdHJ1Y3QgZnRyYWNlX3JlZ3Mg
KmZyZWdzKQ0KPiAgIHsNCj4gLQl1bnNpZ25lZCBsb25nIGlwID0gKHVuc2lnbmVkIGxvbmcpKCZm
dHJhY2VfZ3JhcGhfY2FsbCk7DQo+IC0JdW5zaWduZWQgbG9uZyBhZGRyID0gKHVuc2lnbmVkIGxv
bmcpKCZmdHJhY2VfZ3JhcGhfY2FsbGVyKTsNCj4gLQl1bnNpZ25lZCBsb25nIHN0dWIgPSAodW5z
aWduZWQgbG9uZykoJmZ0cmFjZV9ncmFwaF9zdHViKTsNCj4gLQlwcGNfaW5zdF90IG9sZCwgbmV3
Ow0KPiAtDQo+IC0JaWYgKElTX0VOQUJMRUQoQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfQVJH
UykpDQo+IC0JCXJldHVybiAwOw0KPiAtDQo+IC0Jb2xkID0gZnRyYWNlX2NhbGxfcmVwbGFjZShp
cCwgZW5hYmxlID8gc3R1YiA6IGFkZHIsIDApOw0KPiAtCW5ldyA9IGZ0cmFjZV9jYWxsX3JlcGxh
Y2UoaXAsIGVuYWJsZSA/IGFkZHIgOiBzdHViLCAwKTsNCj4gLQ0KPiAtCXJldHVybiBmdHJhY2Vf
bW9kaWZ5X2NvZGUoaXAsIG9sZCwgbmV3KTsNCj4gLX0NCj4gLQ0KPiAtaW50IGZ0cmFjZV9lbmFi
bGVfZnRyYWNlX2dyYXBoX2NhbGxlcih2b2lkKQ0KPiAtew0KPiAtCXJldHVybiBmdHJhY2VfbW9k
aWZ5X2Z0cmFjZV9ncmFwaF9jYWxsZXIodHJ1ZSk7DQo+IC19DQo+IC0NCj4gLWludCBmdHJhY2Vf
ZGlzYWJsZV9mdHJhY2VfZ3JhcGhfY2FsbGVyKHZvaWQpDQo+IC17DQo+IC0JcmV0dXJuIGZ0cmFj
ZV9tb2RpZnlfZnRyYWNlX2dyYXBoX2NhbGxlcihmYWxzZSk7DQo+IC19DQo+IC0NCj4gLS8qDQo+
IC0gKiBIb29rIHRoZSByZXR1cm4gYWRkcmVzcyBhbmQgcHVzaCBpdCBpbiB0aGUgc3RhY2sgb2Yg
cmV0dXJuIGFkZHJzDQo+IC0gKiBpbiBjdXJyZW50IHRocmVhZCBpbmZvLiBSZXR1cm4gdGhlIGFk
ZHJlc3Mgd2Ugd2FudCB0byBkaXZlcnQgdG8uDQo+IC0gKi8NCj4gLXN0YXRpYyB1bnNpZ25lZCBs
b25nDQo+IC1fX3ByZXBhcmVfZnRyYWNlX3JldHVybih1bnNpZ25lZCBsb25nIHBhcmVudCwgdW5z
aWduZWQgbG9uZyBpcCwgdW5zaWduZWQgbG9uZyBzcCkNCj4gLXsNCj4gLQl1bnNpZ25lZCBsb25n
IHJldHVybl9ob29rZXI7DQo+ICsJdW5zaWduZWQgbG9uZyBzcCA9IGZyZWdzLT5yZWdzLmdwclsx
XTsNCj4gICAJaW50IGJpdDsNCj4gICANCj4gICAJaWYgKHVubGlrZWx5KGZ0cmFjZV9ncmFwaF9p
c19kZWFkKCkpKQ0KPiBAQCAtODM2LDMxICs4MDIsMTUgQEAgX19wcmVwYXJlX2Z0cmFjZV9yZXR1
cm4odW5zaWduZWQgbG9uZyBwYXJlbnQsIHVuc2lnbmVkIGxvbmcgaXAsIHVuc2lnbmVkIGxvbmcg
c3ANCj4gICAJaWYgKHVubGlrZWx5KGF0b21pY19yZWFkKCZjdXJyZW50LT50cmFjaW5nX2dyYXBo
X3BhdXNlKSkpDQo+ICAgCQlnb3RvIG91dDsNCj4gICANCj4gLQliaXQgPSBmdHJhY2VfdGVzdF9y
ZWN1cnNpb25fdHJ5bG9jayhpcCwgcGFyZW50KTsNCj4gKwliaXQgPSBmdHJhY2VfdGVzdF9yZWN1
cnNpb25fdHJ5bG9jayhpcCwgcGFyZW50X2lwKTsNCj4gICAJaWYgKGJpdCA8IDApDQo+ICAgCQln
b3RvIG91dDsNCj4gICANCj4gLQlyZXR1cm5faG9va2VyID0gcHBjX2Z1bmN0aW9uX2VudHJ5KHJl
dHVybl90b19oYW5kbGVyKTsNCj4gLQ0KPiAtCWlmICghZnVuY3Rpb25fZ3JhcGhfZW50ZXIocGFy
ZW50LCBpcCwgMCwgKHVuc2lnbmVkIGxvbmcgKilzcCkpDQo+IC0JCXBhcmVudCA9IHJldHVybl9o
b29rZXI7DQo+ICsJaWYgKCFmdW5jdGlvbl9ncmFwaF9lbnRlcihwYXJlbnRfaXAsIGlwLCAwLCAo
dW5zaWduZWQgbG9uZyAqKXNwKSkNCj4gKwkJcGFyZW50X2lwID0gcHBjX2Z1bmN0aW9uX2VudHJ5
KHJldHVybl90b19oYW5kbGVyKTsNCj4gICANCj4gICAJZnRyYWNlX3Rlc3RfcmVjdXJzaW9uX3Vu
bG9jayhiaXQpOw0KPiAgIG91dDoNCj4gLQlyZXR1cm4gcGFyZW50Ow0KPiArCWZyZWdzLT5yZWdz
LmxpbmsgPSBwYXJlbnRfaXA7DQo+ICAgfQ0KPiAtDQo+IC0jaWZkZWYgQ09ORklHX0RZTkFNSUNf
RlRSQUNFX1dJVEhfQVJHUw0KPiAtdm9pZCBmdHJhY2VfZ3JhcGhfZnVuYyh1bnNpZ25lZCBsb25n
IGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCwNCj4gLQkJICAgICAgIHN0cnVjdCBmdHJhY2Vf
b3BzICpvcCwgc3RydWN0IGZ0cmFjZV9yZWdzICpmcmVncykNCj4gLXsNCj4gLQlmcmVncy0+cmVn
cy5saW5rID0gX19wcmVwYXJlX2Z0cmFjZV9yZXR1cm4ocGFyZW50X2lwLCBpcCwgZnJlZ3MtPnJl
Z3MuZ3ByWzFdKTsNCj4gLX0NCj4gLSNlbHNlDQo+IC11bnNpZ25lZCBsb25nIHByZXBhcmVfZnRy
YWNlX3JldHVybih1bnNpZ25lZCBsb25nIHBhcmVudCwgdW5zaWduZWQgbG9uZyBpcCwNCj4gLQkJ
CQkgICAgdW5zaWduZWQgbG9uZyBzcCkNCj4gLXsNCj4gLQlyZXR1cm4gX19wcmVwYXJlX2Z0cmFj
ZV9yZXR1cm4ocGFyZW50LCBpcCwgc3ApOw0KPiAtfQ0KPiAtI2VuZGlmDQo+ICAgI2VuZGlmIC8q
IENPTkZJR19GVU5DVElPTl9HUkFQSF9UUkFDRVIgKi8NCg==
