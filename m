Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A287C83AA89
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 14:02:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Z1lOMkVv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKkdR2CRRz3cWf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 00:02:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Z1lOMkVv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::601; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKkcV5XR9z3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 00:01:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJjIXltplQqdi5lbA93MxeYofG9nulArgHcFBYMQ6IOsq2j3oNmDwcuS4Be/NerbHLjzz9oLmiEt9CjaFFI+KXapdF1/6oNHKts5ig8UvE/lL/2jPn2cFd3kr2zHvE12lyyO0ZjrMnanOt/M7PQVzQK3Irpzj+MUKeGWacwMn/xwFsixWY1BJ6TCHP9B10z7krlnp4zfX72xT41+Y34yQkzh1yOEHSpWb+NonxH4rbA8miv0e3tWhCuFl//8pGjOIWPaomHq/mh6WLHinBIvlNMpbrUFDj3nP/m7C7cov/KE8RWXSlFMjcxt5fZlzLA7W9g9n8cO3D8BkYtVCnsq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJQwJrTZScHYPhCz35m64+bNWiicKGN2FJuY3RsBx90=;
 b=eMNbD5k3VlCLprYEg777qlhLFciWDR76nqz0N06GvupM9WkN7X8mu3/rHn/nvATjKu1pfP1imtmpOwQIBUh8xhAKlnxQ3Ob4tv5dc0wE2dPHvwbcEyPCobMZVnmdBLI7HXl3f4ZFopkyTuzWGzPWg5bn85A9XcXbVbi6XWRbo6JTPbXPLbWctYcKxEDtqjSq7ETm39CLYfJyBNX4UHajJ7Ws8r5wwAMh6kAq4p2rtDHoIuT8xG+SqYupsSF9dTSvqjLmQx1ae7uSTVzXhO619NdrzBebNF8E9bu/xH2n8al2ek5SBzXVN77ZDgLx158aGeVSZA04a/PE9hCtR853OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJQwJrTZScHYPhCz35m64+bNWiicKGN2FJuY3RsBx90=;
 b=Z1lOMkVvH5OL80CuuaJ5jzrJ72A37OjtP4wEEC5WLrbIG73fyFwLCGcuvVfuEG9hLINS3bd6cyluBr7wbNWpTuu5JUuRk39y5Tl4MFP5QrlfaTgKE/wieFZf+sl/jxVbYX1HtYt4fPPZWW0CdmlAjlsgJJ+Y5LZksma/zNoXQdfw9UN6FkiI81amtsghoHznkCLtHGgLkLoRM4xAXIJKbWlcbSCkvjL14u5sCYpAFGmKg7pWlNwPN5rWcaREQaAD04ADx94wD4y15Ed4ubjGXnxC0dN6PDeGWrWy3p1G/O5cG1gZZIpy70BCnJOOE0CxjS2tjswJ477o1Hr1ayTY0g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2897.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:36::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 13:01:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96%4]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 13:01:17 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kunwu Chan <chentao@kylinos.cn>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] KVM: PPC: code cleanup for kvmppc_book3s_irqprio_deliver
Thread-Topic: [PATCH] KVM: PPC: code cleanup for kvmppc_book3s_irqprio_deliver
Thread-Index: AQHaTqmg+i3TWacp9Eemz4MraJixcrDo7YKA
Date: Wed, 24 Jan 2024 13:01:17 +0000
Message-ID: <91bfb613-222b-41ea-a049-d4252b655176@csgroup.eu>
References: <20240124093647.479176-1-chentao@kylinos.cn>
In-Reply-To: <20240124093647.479176-1-chentao@kylinos.cn>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2897:EE_
x-ms-office365-filtering-correlation-id: 07ea6494-d67d-4d4f-406d-08dc1cdc8da1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  fVw+Rk9NV4aq51ZKnvG5MZ7clDi2urYVkhFJ9WCCX+rgpJxVsbQAdK7B6ZTLOKx98arb7iDWtERAdmvlAOtxvgmsixSo0OLNhd08zg5h81GPsfw/rmE6eDLV0JRUq7wrLHdB5tGiK8n477hYmjXIxcP7mhqZpTN9vuQLPwtZ2QKDpD5B5U6lVsyQpn1EY9MMsGZ9KfUs2nh1iqVb3Z9M7Kg8m5blSCLBmEJQVUR+UcT0myaxpnyLtyy01FpDA3Z35mL32N+kEKbnn7vGo4GIoTSkv6flbsNkAEZwz0oQ57f/S8Lpm97M0VS63D81yFzUvTPrOb8oXdWlfetBUB1I6d1PRkk3l/UvX+Ermk21CL53Ff17pFPEc7H8qnuAynM9Z/qPextrRlSGZRuE2iNY87kHQwwW68CK519JVjYSG/SGLAWE09ZQ6Q6fMrE60cEd91wD56w9va3ewY8bvhF3XhyrotNUjtHurv4XlR+V4FYnZ1W1TnoXhugRHuM/2R4IGl9xOV35qv6Wdpbi9TOgwXwePR3T+Lh2TWnKkD76fim0Wxx0mR/qQyn3IeCzuNTxqmG2kZa9+ltiRLP7eFlbGiyYX9oAHQMfQFQlYeo5HnRvayd4Y04ccE7wj2KlNp/X4FURznvYBODDyv8c28siec6qexrgM3+RajJR10Qkr44TlfBNwbHxEzQP18tJ0faU
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(39850400004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(38070700009)(71200400001)(6506007)(6512007)(86362001)(2616005)(31686004)(6486002)(83380400001)(478600001)(26005)(4326008)(36756003)(8936002)(8676002)(66476007)(66946007)(66446008)(64756008)(66556008)(76116006)(316002)(110136005)(91956017)(54906003)(31696002)(4744005)(2906002)(5660300002)(38100700002)(44832011)(122000001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?alFjZ2ZJRzFOUStHbEdQRVE1V013b1RvVjQxTHdiTDhHQTdYVGs3UytNaUNu?=
 =?utf-8?B?YVRobmFNWU51ZmhETXJvaGpqbVUrYkk2TC9xcDYvb0hUTThDditUSzBwbW9N?=
 =?utf-8?B?Q3Zpb094TWhKTkU2eGpVenlKWGZKd3hkc0NxTmRoTmlZQWlDNTZIRnI4czc1?=
 =?utf-8?B?eTZWOVMxakE5eWdMdC9lR05Cc3FpQnlENTNwREJIK3lsR1FPYjR6Y2t1SEJ2?=
 =?utf-8?B?aHA1cjBldGU1SE1oOGlTNHc0L1h6M3RXSm1xNzAyeERCQ1FzS1E0MHZNSFJJ?=
 =?utf-8?B?aFJibTBVckF1Y3JBL3F0MlVlVkd2R1RqN0NyTVUyeWpMZjZQNkpRM0x4REZw?=
 =?utf-8?B?WlVzeTBLeERtSjJnR1RSN1JObjdQZG5uZ2pvNGM0Q3YwRDdhenhhYTdMZnU4?=
 =?utf-8?B?QVoxNjZQaExQR0FnR2FkdWhPaVBLRmVTM1ByZFNoRllBbTJEa3VNTkl2SVpX?=
 =?utf-8?B?V2FsQm1wVzZ6aDB2WDF5RGdtK3NmK1JSM0ZPM0l4UzlHUjh3b2EyNXJIRk42?=
 =?utf-8?B?Z2g2blRVa1JOdDZ6WUh1M1k2YkptaW5abTR5a3hGSTB5L1piRFJxLzBqYzBx?=
 =?utf-8?B?VmdqUG53SjcrcWsyd3BxVkZjdUJkQnJGb3RYMzdtaTZVN3JPQlFpTnlqeTdt?=
 =?utf-8?B?KzBCdVNXSkVTMFc1T284Z2wrTEN3M0ZIb0N1a2FrcXJGb3VhM3hyZmk5Szkx?=
 =?utf-8?B?ZUcrWndDbG5tN0UvWVdzeDlHUXFVcUNna0w5d1Vkc0RNTlVIL0Eyd09YQU9O?=
 =?utf-8?B?ZHI2Yi9xTnRKZzhPV3R5clk1K0c1aUdMV082Sk5nbnpEMFROTzhheVVjUHBv?=
 =?utf-8?B?bU0rNUpQcUg0aTNSbEFzc3BhQWJRRjBNL20vZit4bHVpQVZBdW5WZ1pETzV1?=
 =?utf-8?B?Y2tQbTlJN084NllBZndQVUh1aE1BdUM5ZHFicFduckxxS3dic1NXbG5SQVVm?=
 =?utf-8?B?UnJ0UDFpLzNuSjBRdzdYbmpFalJOaFN6eGxDVDhWQTNFcHNDQ01NLy9KWEZ6?=
 =?utf-8?B?cS9BRzVIWU9aS1lHRk5JRWJLTlYwd0JLYWlHZWlPOTY1NlN3OWZqdWRQU3Na?=
 =?utf-8?B?ZWxIOVIxWkZ5Wm4xa3VHYitFUmVGSkFjVC9tTlJHYTB5WldlY1BOWnQ3a3Ni?=
 =?utf-8?B?TnBob0I5a3h0MWRhNk9VbHM5cm5UU0NleElZRk9VSkxKVmp5WFlNRS83MTRm?=
 =?utf-8?B?a2J6a0hDV1NzQXgxQzBRaVV4U3c5dUVYVVJqM0JuTzQ0N1k5SDMrU3dUQktu?=
 =?utf-8?B?dk9qdFp2WUpzSlY4WGU1UVB2MHNCdVcwSnVnUVBvRkNpV2ROejg1VWlRSWtY?=
 =?utf-8?B?KzIxRlc4ZTVBeXJpR0hYMWhKdHRxQm8yc3cvUUdlN25QOVlNZ1FseTRvSEE4?=
 =?utf-8?B?UTR3MnExSVBEVU51VjBOT0FaMzBhajJIVEV5SGVDSDVDRHBJVk5PQnorZlFT?=
 =?utf-8?B?cHAzeTRTZ0Y1WDF6VlVkT202Wng4NG8zckFJamhvS3ZjeDBXcXVTNkN5TUtN?=
 =?utf-8?B?TC9Ebk9NakFqdFdONzQzZU5CdjdoMTA4UFl6eTl3YTFzVkdQelZXTGFEQlVX?=
 =?utf-8?B?RW9OWS9SemN3WHNNSHo5WklmQlhDZWVTOTNTNUpWSUdNb0Q5akJ6Y3c2UG9L?=
 =?utf-8?B?SXp3bmM3RkJLU3hJRTZRUTZBUXRGZmlST3oveXBmb0Fwa3A3Mzl6SUJiTDJI?=
 =?utf-8?B?d01ZZjFWNzd2MnRVTHQwY3FhRFpVSXRydzZ3bC9WK3pVc0drUy9MallLVkJS?=
 =?utf-8?B?TXBCOFZvcncvaE5ZMzJ3a1ZKVVJvdFNnSlNqSm5VUXNSMjJiemNTY2R4VVN2?=
 =?utf-8?B?aU80Nm04c0tqWUFLNUQyZFlUcERScjdLMGltbkp2RWd3S0hSd2xUQ1Blem10?=
 =?utf-8?B?dkwzVVpWVDNXNmRpZTcxOS9YaVRaRmRJc0V6T2hVaDQrckRQazFGcjVlTFpJ?=
 =?utf-8?B?dGtOVXUwdksyTXZJbUNSTDkwVHJmQkdmdW42YUVyaXVGeHA4a3ZITTgrNytJ?=
 =?utf-8?B?d2NWRkZSRk9FZ2ZFUlFuclVJb0tpNWwxZEoyNjBrZW40WVVFdWZxRFIvVGdx?=
 =?utf-8?B?Y1lEVEJLYi81eUpZK2t2eldST1BLYytUS2NudVRMeTRPOEszbmdGMXJNVDhL?=
 =?utf-8?Q?F65DJ0VESgIwyQTrbGGvUaBrU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B253792A5C56E648885916B19A2CBFBC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ea6494-d67d-4d4f-406d-08dc1cdc8da1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 13:01:17.3811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q8BRWxsuBnwRVJGJf4/w8WPZp4l9h1p+w+BnyQOI8BkRErjQVcUu//xOcALr/6FNcMtMO3sG+rbsTqYWHgB7VBDo6ZL/qNYOUzQTLKqrzt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2897
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzAxLzIwMjQgw6AgMTA6MzYsIEt1bnd1IENoYW4gYSDDqWNyaXTCoDoNCj4gVGhp
cyBwYXJ0IHdhcyBjb21tZW50ZWQgZnJvbSBjb21taXQgMmY0Y2Y1ZTQyZDEzICgiQWRkIGJvb2sz
cy5jIikNCj4gaW4gYWJvdXQgMTQgeWVhcnMgYmVmb3JlLg0KPiBJZiB0aGVyZSBhcmUgbm8gcGxh
bnMgdG8gZW5hYmxlIHRoaXMgcGFydCBjb2RlIGluIHRoZSBmdXR1cmUsDQo+IHdlIGNhbiByZW1v
dmUgdGhpcyBkZWFkIGNvZGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLdW53dSBDaGFuIDxjaGVu
dGFvQGt5bGlub3MuY24+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rdm0vYm9vazNzLmMgfCAz
IC0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzLmMgYi9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szcy5j
DQo+IGluZGV4IDhhY2VjMTQ0MTIwZS4uYzJmNTBlMDRlZWM4IDEwMDY0NA0KPiAtLS0gYS9hcmNo
L3Bvd2VycGMva3ZtL2Jvb2szcy5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzLmMN
Cj4gQEAgLTM2MCw5ICszNjAsNiBAQCBzdGF0aWMgaW50IGt2bXBwY19ib29rM3NfaXJxcHJpb19k
ZWxpdmVyKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwNCj4gICAJCWJyZWFrOw0KPiAgIAl9DQo+ICAg
DQo+IC0jaWYgMA0KPiAtCXByaW50ayhLRVJOX0lORk8gIkRlbGl2ZXIgaW50ZXJydXB0IDB4JXg/
ICV4XG4iLCB2ZWMsIGRlbGl2ZXIpOw0KPiAtI2VuZGlmDQoNClBsZWFzZSBhbHNvIHJlbW92ZSBv
bmUgb2YgdGhlIHR3byBibGFuayBsaW5lcy4NCg0KPiAgIA0KPiAgIAlpZiAoZGVsaXZlcikNCj4g
ICAJCWt2bXBwY19pbmplY3RfaW50ZXJydXB0KHZjcHUsIHZlYywgMCk7DQo=
