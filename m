Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 841CB59956B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 08:46:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8C2K37ftz3cfS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 16:46:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kuSBvk6W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.43; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kuSBvk6W;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90043.outbound.protection.outlook.com [40.107.9.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8C1Y1DKCz3cBB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 16:45:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5iKGrzOnDHz+R/OC9c9veJcZ+VlQOkMAYNR+lXdhMRYHljrn2jrOfBNCuqSMaC5k2uARkEK5WaxotA49FLwIJOxpzEbtZWXCfYTF5fYYHvUhVfSKtmbSY7e7djJ40gYSAjMa0tQBoyjcln1H7rNtXNrgYQXrwovWchXcTkehsYH3lZmOa+KdZVK6Bzb3hW6b0RzmAQ809ZwTZNcUSHPtmOER38/h/4GRZtqv9rOsncrpW9hAhee+PzBkJrfupUB6uyho2oACptpjY+m4H6NYBpwCjgG4WvSuRZLcjFIdejr3J9Dz3ol+2VvA/v8mycI70DAsrdC6XbX8BjW90oIoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4/TXSZQUd+OBowAwFZb0TtMwTfHrGdOw1tYumxrGew=;
 b=n4XkPl5GHKdjnfGJmH13dgFl+QtnAB3D1aJbzlCLgtKPyFfCmHmrMIjqytelW4E1ca54D4Uu4OKrPOr7hw4ShEdo7Q4DXKRNR+TtnDWP+ziSHzk9HYjbX3opo0USklwVlJ3KdsuVQsrWWwmFHIrQN4Vq+7sC/QQH9L0CR2bl6ALY/8B/Sd67k7SkmGImbE5/K8PKYC3eWpNf12flIIGU5CRRW1b2MtJZkn2gc9uBc2neTdasyLggHIbch+zPhY6kcgpJ2IyaIf7fDxQCK3O5gccm4b+JH53wSRNfa9HdRFzYoQpmJktKHSl3bCnLCg5aJVhdV85ZCcVlz/4NJZ25jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4/TXSZQUd+OBowAwFZb0TtMwTfHrGdOw1tYumxrGew=;
 b=kuSBvk6WxwUSc89k7nUbfMgMw5Gm4bmTNmOW9mYFa2pn4QNpFryXLB1sT885BlpqwMzfKni+y5IqacRk5pZyY7YGvqH9LgNA49sxhEQL1Ujf0frMNbWq3yHzY/NTqRNLDwltTkgfdUjATmYF/nRjWaOuvPVc51RqSru0Bd9P6Zxd+mzYHNpZJJegxNYnUbS5jDaKz0FthKEa94L2aUWgsaSh0/rsU+sQfw++38Q8uAC7/ENyhiCEwILGopLJWcfDcpcjASvuMPpQ9Q9vhDV+kBXqnK6pv3FdK/vN8DWU801YUfk0GPCykPVJL3Dfa6dEGttTAzNmeEkTH5nIb8lWRw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2343.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 06:45:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 06:45:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 11/18] powerpc: Add ZEROIZE_GPRS macros for register
 clears
Thread-Topic: [PATCH v3 11/18] powerpc: Add ZEROIZE_GPRS macros for register
 clears
Thread-Index: AQHYs376Ss2GENm+8EaC4kf6C5Comq21x2iA
Date: Fri, 19 Aug 2022 06:45:01 +0000
Message-ID: <946821e1-f04c-011e-5908-428cbf4dd0d5@csgroup.eu>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
 <20220819033806.162054-12-rmclure@linux.ibm.com>
In-Reply-To: <20220819033806.162054-12-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f8b1048-cfbd-4eb9-e9a3-08da81ae573d
x-ms-traffictypediagnostic: PR0P264MB2343:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KLBg8+jHQ6Dyh7e1EbwcqBVyhN0EbIEtB4WID3J3QSC91y78Lv6mOJr9n5sk2vhA0zlOZPMx53mb0+DnKv7SewMog3Rj32zex0Xnf4xHmVNozTF+Yljv8rjVtrrmZIEDrk0zASnMtS4v0EKtCUyTn3a5dIMDq7524vdYS6DVGmIHfQmfG3ccGBL9tv/4cth0hGal/n7m94vL69sTYJwAFLdvRKzeG8NqoSOB+riNEgrCII2pk/rAbaSKV5shiRg/FOP4bNMFr4mc/RLf/N1a5Ya3z0SzEMzKjw/907zSyr4rTBOtsQPDzBXzQIrLP3CtBDMOI/20bHkton7EXke7XQHDQLcQ1ijg9RD1EnD9Owko1MJU+1PUOvY3b+p4KL9ujyCnlzEHP7iYfqufJv2iv1u3s4HYNDCDBApT4Qub0F0BbAWhjmX6nHUO+lnzWhXWiUszPjjp3eyQ7o+iiXa2151XosA9UhRDwacVUmsZ1SSc36QpYHvHE1wxfFSGJ9pfF0u24C/rWp8XVrUL07WXhNbyDyDuUE2TrNWmawqSx6WQmteDrJX8DM/iGchKoWR2zz3wcWHiT8r/8uCC59E2WYeADye7ZnOyNQ+ywoQRz3HRBVyIdFwr2zUgtoA6jYtRzbsP5IQ7/3aTSlJys18YbLYtArnQmqhuAYVAIRUB4HrRGBAmM7U7LKQZ+ZzADEd+aMUUvLF636jFUJZgLublLcDPtlP4DKpbyLk/dpIvHou0CR8ghjskpRzsk2SXpobhCKsoYksZhA67MqnrQ8Ul+w3Xkgl8Ug4+yhTipDbQ9JKEbaHLUm0s0IaE5C8HPXrSdTUFgzs1H9FQgD4KnTW6yQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(366004)(346002)(396003)(136003)(376002)(36756003)(6486002)(41300700001)(91956017)(31686004)(110136005)(6512007)(71200400001)(478600001)(316002)(76116006)(6506007)(26005)(38070700005)(2616005)(66574015)(86362001)(31696002)(186003)(5660300002)(8936002)(66946007)(44832011)(66556008)(66446008)(66476007)(64756008)(8676002)(2906002)(83380400001)(38100700002)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QkFOWVVZOHhLbEJYT0hTUXo1MDk4SHd5TG9TaTlHVDlEQStGTjFtc01LR1l5?=
 =?utf-8?B?VEg3STF5Ym11TGRtaUlGUmJHN3NlRFhRMEVVY3BVb1BuN0lPWnU2ZUVzSFor?=
 =?utf-8?B?VE93WmIxSGlJa1lNcXdmTW5mUVVSYVhaWjdhV1pXUnZqbE04Y2E2WEFnbGxQ?=
 =?utf-8?B?TDhuOXVFZ0FzemdqbGo2QUxSUHRlT0QrakYxdi9nK0FHNTV1ZUt5elhmTWtC?=
 =?utf-8?B?ODl4dnU2K3RIMS9BZmlaY2pjSUI4NHFVQ2hsMU8yYXBHUXdsR25sNnlmMUMw?=
 =?utf-8?B?T0ZxTnRtR0xvL2Rpbi9kVDArOXVrdkhTVGNGaDUyVTMwdmZMeU43c242QXla?=
 =?utf-8?B?MUZZRDNRRXVpNFcwa0FPRmN1eWgyWlZiZ2gwNzQ1Y1VZc2lRY1ROVGg4aDlX?=
 =?utf-8?B?SFZUdGRwNTV3UTF4Y1VNVlJuV3BwcElhY1VrYld5WHp1b2w5MWRFNmxKV1Rq?=
 =?utf-8?B?QW5WOUF2YUQ3R2VHR2E3aGt3VHlSajVHNXFVSFBMa2U0bWZObEYxcnR3SFEr?=
 =?utf-8?B?L1p2LzFFTlh4VmkwUTJKT0NtdHI5d3JMQU5yUHZJdjFDS2hiaGlnOE9wT1d5?=
 =?utf-8?B?SmQ0Uzhqa3NFRzdpMFVaR1BlSVMxVXY2S1JMK0pybzZOaTdGUXo4WDJrUS9V?=
 =?utf-8?B?dHowS2tqMURvcVdvVHdXcHdyNUxvL3hzRGtEOUpsdm1rYm1hN2VMcXRwQlQ3?=
 =?utf-8?B?RGxBazZZUVhqbkp5MTkzbzAvMEg0TlFlRWVBZVA4NlNZWW1ERjVoaWd1SFRS?=
 =?utf-8?B?ZlJLV01ITzN6NTlSQzI0cDhkeFhMLzFGT3VpTmZIdkhTRUpvbVR0dGVRNHd6?=
 =?utf-8?B?c253RnB1OFREakJZWmNlNWlIenZldS9YazdlalE2YmdGNzBMYmJQdmJXVFE4?=
 =?utf-8?B?SlJDRXlDcjc3eEtqUS9uSjBxd1hGcFc3UzdneGhLZWxKLzFtRDZVbEpaNE4r?=
 =?utf-8?B?Mk1YVXdreGxzR01yZWNnSUJGVHVnSGc3VElyd0pDSEk3Vnl3MkJEYWI4aGVF?=
 =?utf-8?B?REFwZWlLVjNvbXpMdGxIVUg0L2pLMFoxamhLS1FJcVdJclNiQnczaFRTbUpu?=
 =?utf-8?B?OVhubGJSMndlWUJ0UVVDTmtRbHJZb3JFTFJUVml4MTYzUzZLeENocjRrSmFE?=
 =?utf-8?B?Z0ZtTWNuZXNyMjNKRHpPWEt1cjNvVWhwdTMzdi9ndVNCSGRuWjVtbXNiNEZp?=
 =?utf-8?B?WjZNdlBVcXhUVVVtNWpGV202bGwyZVIzVVZ1bW5PYUthK2VmNkFZdlZ4TEdx?=
 =?utf-8?B?T29kcHhDWmQveVdRSGxKTnF4b1Z5VTlKdThTdmlTZ01aazVEcHBiYWFFYnFq?=
 =?utf-8?B?VjlkT1pYczRNYW95TEJtT1pJNXEvd2tMRldiNU1zY0lWS0RiQ1R4d1dGNVJw?=
 =?utf-8?B?QXBpMXNXcVZOaDgrNjVzR0xYdUNlSm4rSnhQMHN0VkZuZ2FicWVhMzhtOCty?=
 =?utf-8?B?VHBkYWxqVm5ZS0E5eVd0K0dEZXpXZjUzOElETnhJNXA1UWQ0WGY0bmlhb1Zk?=
 =?utf-8?B?RVArZ2F3VTByZmJXLzFvYkpZQm00RUE0dVU2bkk1UFpEK2pTKzBYTXM2THpN?=
 =?utf-8?B?TmY0UG5qY0JmQkZyQ2JHanRUQ0Z1TzBNa0p4RmE0T3FTY2NOd0d2UlVkd1JN?=
 =?utf-8?B?R0tyVkkzN2hScndSRXJLZUxwdElFMEdpQXozUENaeHN5V0hqUTJnVEVvRWJu?=
 =?utf-8?B?VGR3SCtmWjZ0RVlyVFRsQ1dvTkpkQjJCSlE5ZE9yVnhzM3Vya0x5cFZ1Vmhh?=
 =?utf-8?B?QTdYNHBCTEN6bnVaNFdCRUR4UkZPWEU5SFA5eUd2cGVCd2NQNkN0dUV0YVdn?=
 =?utf-8?B?TmhuekV5QjE2SllUSFE5ZVI0MWNtUzg2b01HSk9tbjBDUStOSnJuQU13S3lC?=
 =?utf-8?B?SHdHS3FCZk51dDhhUVVYdFN6Q2NtWTFROEkzNENQZEVFREZYYk4rU3JuRDJq?=
 =?utf-8?B?S01pVzFrQTZjTlZSNjVKeHVwYnYrQmhGK2ZTNHEyZlFDNGg4U2lsN1hFNmxl?=
 =?utf-8?B?bGlWa1pJcXllWUhEN2V0eFhUSzN5aEQySGFBc0VzYmcrZUpQeklSSU1qR3dn?=
 =?utf-8?B?c3hmRmwwZkx2KzZQdUdxRzNWWmN2Z1ZGVU15Q3BxN290VU41bEx4K0RJSlBX?=
 =?utf-8?B?dzJ4ODhEeXR2R2lLam9rbGh6WnBWT3dPeFBMSkEwSVh6cVVrdEt3QlF1SUV1?=
 =?utf-8?Q?Z3124PWMZ97fmAqqGnFRmBI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <420E844E1341D4449F4546A8EB96C235@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8b1048-cfbd-4eb9-e9a3-08da81ae573d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 06:45:01.3689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V/9mtWBG+zEtuZvDUFbyAabO31hQTgAIA6tqJfB5+mmUkNbXVY+tLehf+VGVwDeZBMu+5EDl/Nkgizdqbo4ZEKU4re54HKnU2aB1uXKFdzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2343
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

DQoNCkxlIDE5LzA4LzIwMjIgw6AgMDU6MzcsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBN
YWNyb3MgZm9yIHJlc3RvcmluZyBhbmQgc2F2aW5nIHJlZ2lzdGVycyB0byBhbmQgZnJvbSB0aGUg
c3RhY2sgZXhpc3QuDQo+IFByb3ZpZGUgbWFjcm9zIHdpdGggdGhlIHNhbWUgaW50ZXJmYWNlIGZv
ciBjbGVhcmluZyBhIHJhbmdlIG9mIGdwcnMgYnkNCj4gc2V0dGluZyBlYWNoIHJlZ2lzdGVyJ3Mg
dmFsdWUgaW4gdGhhdCByYW5nZSB0byB6ZXJvLg0KPiANCj4gVGhlIHJlc3VsdGluZyBtYWNyb3Mg
YXJlIGNhbGxlZCBaRVJPSVpFX0dQUlMgYW5kIFpFUk9JWkVfTlZHUFJTLCBrZWVwaW5nDQo+IHdp
dGggdGhlIG5hbWluZyBvZiB0aGUgYWNjb21wYW55aW5nIHJlc3RvcmUgYW5kIHNhdmUgbWFjcm9z
LCBhbmQgdXNhZ2UNCj4gb2YgbnVsbGlmeSB0byBkZXNjcmliZSB0aGlzIG9wZXJhdGlvbiBlbHNl
d2hlcmUgaW4gdGhlIGtlcm5lbC4NCg0Kcy9udWxsaWZ5L3plcm9pemUNCg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiBW
MSAtPiBWMjogQ2hhbmdlICdaRVJPJyB1c2FnZSBpbiBuYW1pbmcgdG8gJ05VTExJRlknLCBhIG1v
cmUgb2J2aW91cyB2ZXJiDQo+IFYyIC0+IFYzOiBDaGFuZ2UgJ05VTExJRlknIHVzYWdlIGluIG5h
bWluZyB0byAnWkVST0laRScsIHdoaWNoIGhhcw0KPiBwcmVjZWRlbnQgaW4ga2VybmVsIGFuZCBl
eHBsaWNpdGx5IHNwZWNpZmllcyB0aGF0IHdlIGFyZSB6ZXJvaW5nLg0KPiAtLS0NCj4gICBhcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vcHBjX2FzbS5oIHwgMjIgKysrKysrKysrKysrKysrKysrKysr
Kw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwY19hc20uaCBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9wcGNfYXNtLmgNCj4gaW5kZXggODNjMDJmNWE3ZjJhLi5iOTU2ODlhZGE1OWMgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wcGNfYXNtLmgNCj4gKysrIGIv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwY19hc20uaA0KPiBAQCAtMzMsNiArMzMsMjAgQEAN
Cj4gICAJLmVuZHINCj4gICAuZW5kbQ0KPiAgIA0KPiArLyoNCj4gKyAqIFRoaXMgZXhwYW5kcyB0
byBhIHNlcXVlbmNlIG9mIHJlZ2lzdGVyIGNsZWFycyBmb3IgcmVncyBzdGFydCB0byBlbmQNCj4g
KyAqIGluY2x1c2l2ZSwgb2YgdGhlIGZvcm06DQo+ICsgKg0KPiArICogICBsaSByTiwgMA0KPiAr
ICovDQo+ICsubWFjcm8gWkVST0laRV9SRUdTIHN0YXJ0LCBlbmQNCj4gKwkuTHJlZz1cc3RhcnQN
Cj4gKwkucmVwdCAoXGVuZCAtIFxzdGFydCArIDEpDQo+ICsJbGkJLkxyZWcsIDANCj4gKwkuTHJl
Zz0uTHJlZysxDQo+ICsJLmVuZHINCj4gKy5lbmRtDQo+ICsNCj4gICAvKg0KPiAgICAqIE1hY3Jv
cyBmb3Igc3RvcmluZyByZWdpc3RlcnMgaW50byBhbmQgbG9hZGluZyByZWdpc3RlcnMgZnJvbQ0K
PiAgICAqIGV4Y2VwdGlvbiBmcmFtZXMuDQo+IEBAIC00OSw2ICs2MywxNCBAQA0KPiAgICNkZWZp
bmUgUkVTVF9OVkdQUlMoYmFzZSkJCVJFU1RfR1BSUygxMywgMzEsIGJhc2UpDQo+ICAgI2VuZGlm
DQo+ICAgDQo+ICsjZGVmaW5lCVpFUk9JWkVfR1BSUyhzdGFydCwgZW5kKQlaRVJPSVpFX1JFR1Mg
c3RhcnQsIGVuZA0KPiArI2lmZGVmIF9fcG93ZXJwYzY0X18NCj4gKyNkZWZpbmUJWkVST0laRV9O
VkdQUlMoKQkJWkVST0laRV9HUFJTKDE0LCAzMSkNCj4gKyNlbHNlDQo+ICsjZGVmaW5lCVpFUk9J
WkVfTlZHUFJTKCkJCVpFUk9JWkVfR1BSUygxMywgMzEpDQo+ICsjZW5kaWYNCj4gKyNkZWZpbmUJ
WkVST0laRV9HUFIobikJCQlaRVJPSVpFX0dQUlMobiwgbikNCj4gKw0KPiAgICNkZWZpbmUgU0FW
RV9HUFIobiwgYmFzZSkJCVNBVkVfR1BSUyhuLCBuLCBiYXNlKQ0KPiAgICNkZWZpbmUgUkVTVF9H
UFIobiwgYmFzZSkJCVJFU1RfR1BSUyhuLCBuLCBiYXNlKQ0KPiAgIA==
