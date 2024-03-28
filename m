Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6CA88F749
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 06:34:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=kKv04IFq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4sfw587zz3vcn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 16:34:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=kKv04IFq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4sf34g6Xz3dS4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 16:33:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZR2qGbuFv8aSHrJ0oUS8PjMfHY0QKs6MYYIZBT2Fu+Ai3kUJwQxuiZsLr59JNEh8R2ar9Z+qXw/ThJ4SxrSvAtOeTjfGkaLPRgd1PTAX/FgTchjMyClg8X3LtNzcNnNkOmLv0ejsB0zHcvbLIYP9T6QKpheVgqoZh7L/M0PKLBMLfZ1Kt5jFZ1zVYcP2rHYQhC5in8LdpY2q2Eqo93CrtqKhWgSA//xGrGs1bfEmUVVuPdaPhj0urEGXMFwLF1jHUzuP+Jsw3+eN48DE50Qi/92ok1NDCY38gJi0vG6FTeA8Gah3iE5OCcEIXU7ws/rqV9iS9NEjstZpxFOUYh3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIVIWVfPOUd4UHJ7zCzfhBVbXaWNPKAvJp/Xojg2ens=;
 b=k0142f9h33U0k7LPuWXkD7qgaI5nHI+3OEanvn6I+m3EaNR3XtJ+tVjsPNGXx5UpAeCfIlnYt8nlfilttVMG+C332kie5krtdPrGCCJvWvt4O9ZytHMSumgb3oJrNK6vpUYV8aKweuEVOjEU5Y5XeR8SHipQGu7NYVXx60LMmimPjHtwd/R665dL7hv6WMW/YDml+2xiSKf7N3IsUxi5uKwc3bYRkIsJjDdwG0DEo3qP4OJ1itWdtINSgnGJrDadwiMHqxramXDMLEu33gx17X5A5fPJksiF3GlHBtoHTRtAFpsvHTSBvtI4Y9HfkICYkkwlA/5NJrLOEyrNEcQ9zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIVIWVfPOUd4UHJ7zCzfhBVbXaWNPKAvJp/Xojg2ens=;
 b=kKv04IFqTDAf/2JbFKPVKU51AHBNnU50XEgLRce/7nKQ9xcOtghx506bxQDn4aG2dM2Ohn0PdaIfUaL1z1e1Bq8lQ5cV3uLc1hONxB57jFvOSUQNym7ZFIwrX3dSN58U74gzxqhuU0EIZMoHf09dCSpQKCXwS28LbMxZFO4zLkVwaLTtF/T14Dfqwb+mOy+7kGpYtV+8ms8MuDSV0BXzoq90juvWAVQ7wwfPGo7+Hzuv4OelJkhVgaCUlgBbV0GQ2S5ZT2qFz6q4M67DLY/OkgBnZ9vJZ9AlRC3+GhI8dK7a9rb1aPwPRJn3Au+kPJSc/F1ESd4BInuhhqUzhRqijw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1731.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 05:33:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7409.038; Thu, 28 Mar 2024
 05:33:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v11 08/11] powerpc: mm: Add pud_pfn() stub
Thread-Topic: [PATCH v11 08/11] powerpc: mm: Add pud_pfn() stub
Thread-Index: AQHagMz+sMyINKPrYEOECARFbC3lZbFMoT6A
Date: Thu, 28 Mar 2024 05:33:12 +0000
Message-ID: <3771c19e-8127-4b5a-bf86-da43e545d1f7@csgroup.eu>
References: <20240328045535.194800-3-rmclure@linux.ibm.com>
 <20240328045535.194800-11-rmclure@linux.ibm.com>
In-Reply-To: <20240328045535.194800-11-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1731:EE_
x-ms-office365-filtering-correlation-id: 8f78aa95-bcbb-44f9-816f-08dc4ee88f47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2QKP/cojdngDa/HxspzAfsC5UcbmyqB2j2Cix/cFdMweQrsc5rh2MB8BZft9QabeeWH292Mv9vx3jKjjzGrpjEg18DcvurgM6lLoWOQoj0swbrbnvLbiRemMNPD511DMFuIE45JT0agrmp8XC87vq/th1xxmL8Sme0jPzJXrm3cLPXmqbD5K3tGKPa6TIyubziBKUpi2lD8XdskYQuI4esBypf6fUdTA3Me+0IBugq5/6gSfY4mWBohIBGbRgL/jgUzqupHntex4GB6VMDYa5eFdRYXf6im2yiM3rB1fVLZ9OtX4500pXahc6dqH6DWHFH1crouF2rwWZFvXQG2yrosl8x34Kt6UBtAg3S5v9OyO6rib9w3Yo1E+GA/YYDpf2d1BqrDo51VtvBgllXJu7j9EioC3qiKbLSYRM2H5M5GeJZWRIWh8I6mOfv1q0TyAzsIcLbmwuZqKSwoQiUbX5Zi6ZJPaJ90I9Kz98fr2D2Tz6RyiVzw2/7L5W1CqyzVAyuH88JujXt6u9kfOKt+m1rtul7zcIU5xEVCdv26Spfqk7WSASJboHZZ71r0bwC+/JyEDYUIEA+NO5ntHfRuoFIb8IlTAEwUf/K1xD5cZekP1aSnzSBuCvxQkVZP6M2zau83wPf+Mk0FXcrx5wRD7isIIbP5L8q9jJ8EWy57LibR+GDhs3ugly8XXIkIYcfbS6VN3+jvCmOtsW9QU1ChX5Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MkgrMWRUMVg0ZGU1bWdmTnNaR0hKL0dJTHd3aWhXUHBrb3RQNTNJK2hEeU1t?=
 =?utf-8?B?bUFPb0hkcWxGV0N6alVoTE52cW9VczBvVXJDMHRlamJoWDRvZ0hwWHVuSjBG?=
 =?utf-8?B?NlNBeFQ1Qmk3U1dQWWZ5MWY5VDdpb3FRSWlEd05DWTJrdWpRUmRxemswclRI?=
 =?utf-8?B?dFhHNWJwdDR6K0FJekFKYWdhc3FqM1BCWHNJTlFFcG1CWUFuUEJFM2RHTVNF?=
 =?utf-8?B?bEZoTkorSVl5YlVJdk9EYnJkYnNCSmthZmJ2Z3FHNWlaalVPTjdvM2NPME5t?=
 =?utf-8?B?NWdyRVZIMHVicTNrN0xQT2VWd1J3U3dnMTUxQUhRRUJDaDRKM2VBbnJEVVBp?=
 =?utf-8?B?djlSY3lQQUtkMlZKRElQOGVnZkp5YlZReHNMWWRrQXp6VjVNSmJqZGR3NXA5?=
 =?utf-8?B?cll1SStzLzcvdHYvWTJGeVNKNFdvWldhMC9pTG5YZlMybnpoVmhVK2NwUXBk?=
 =?utf-8?B?dGtjTEY5U2NpQTNSRWNPYUdmZWpNZUNOS2ZLVzFVM0FQdHh3eHBlMEVBRDNR?=
 =?utf-8?B?R0hSOUR3OHozWEVHSlZTSFE1WjVEYXFObjFnZ1NRUFZlQWMzUWpoNmlzYmJu?=
 =?utf-8?B?d1hpWjlaOG5jZDhCMFY4Rit1NndZYi9RTmZkT05yWEdBSDVXSC9IUWJHRXFY?=
 =?utf-8?B?eG1mYlhnRnh5RDlVOFh2Wko1TGtHQ0xYYVFuMDFidU1laDYrd3g0RUg2cHFl?=
 =?utf-8?B?V0tmakhDaEhCTGZLaXU3MEV5OEx2RS9ibEpQTmVjMnRLbjExejAwUW4vQkJx?=
 =?utf-8?B?V0p2dHBGUm92QktPcit4L3d0RHU0UFZDRW5HWlpBUEk3WStrYit1M0Jva0lk?=
 =?utf-8?B?YmlBeHdUYlJzQllXb2drcCtFbk1sbjBSNWdGRHJtaEo0SFAwZGE4UW5IMGg4?=
 =?utf-8?B?SWhrc3pkazh4N0RBMXVDR3Z3WVRlY3JaVmZDYXA3bDdGdGJ2dzlESy85cUtt?=
 =?utf-8?B?K3JRbDVnZFVEMnBiRG5zTExhL1ZOYVVjTU41eDMvOUVjWGNlT0hGc2IyQW52?=
 =?utf-8?B?bEoxbTU5TkNGMUVmUlJhNldMZ0NERGJmSmU3SEY5M214R1RkUm4yM2RKYS9C?=
 =?utf-8?B?ZWF0dStsVk4vMndFaFFlTXl2Ym8zRjRiYWQ5VWVyWkt1R3FUWEZXVW1BVmpx?=
 =?utf-8?B?SE5SZ09UWmFuQWU2WTBFalhiWmg5bDAwNUEvbHhQczJBS3hzOXdBb2JlVW45?=
 =?utf-8?B?UDJRMnIrREhBdDhCcU9oQ2w1NGZaekZ6NldPMkU0Q1dVaXZDajFTY3F3L2xN?=
 =?utf-8?B?a1ZRZEl2UUcwZ3N5T1NuWHl2WjI0TjBiWVdPVmYrVG1aVEVRYjd6cEZNTDc3?=
 =?utf-8?B?bG82Y1RBMzlZWXdDODFHYmsrdTUwbmROUE8vTzJ5YTQ5NklpMTFUMzNqYmZP?=
 =?utf-8?B?QWdad1FJaXB5eWprcDg2R1lZSWt0S1o3VkVDQWQvN1AxdHZSdzR3bFVQOU1I?=
 =?utf-8?B?ZXNkSlFSVmd4RmtHRzVsb0dacHBJSDllNkZ6ZXRGNlZjQThuL0tLWFFWRStK?=
 =?utf-8?B?MG9IRmdpV3RtT25SdjRpanQ1VkJ6S1EvZHNnNGdSUWxXS3YrN3EzUE1QbjBi?=
 =?utf-8?B?YUFwUHlTc01nbmcwRVZtYUIwb05BbERWS29oNlpHNGhuWXhWcDhUYVFaZjFr?=
 =?utf-8?B?cFJTbXRSUlNkNmhVUlVsZERvUEtPNHc0WXRFb0ViV3pEWGIyTTROeWlFQXdv?=
 =?utf-8?B?ek9PaFVpOXJzT3dXc2wyZU9NV0gvUytValNhNjEybE5TSEhFeHFDZHJ1Umxa?=
 =?utf-8?B?WXh4TG91S1JoazBLQnh6L21IT1lqQ3FocVFERXhJNTFoVHlZczhkTDBNSWtp?=
 =?utf-8?B?cmtIaVRCbFc4U3d4Y3U1ZFo3elBMMmJORGp3UmFSR1FscGY1LzFjUEp0VFp6?=
 =?utf-8?B?S2pCeEo0bjVXNURpSVUwbGZqTGNIMnpyVDJWbHdXZ3UycVFYSUtBYitWd2t6?=
 =?utf-8?B?bVRiQ2NjcXdibTd3MTJvN3AyRGtMY0R1eXJoZmhHNzNnTEhmR3FJTGVkdWVF?=
 =?utf-8?B?Ty81YVpUK2l5aVVtS1MrM0w5Q1lnZis2MlVCVGsvQVFQZUw2WDNaMEFPSGI4?=
 =?utf-8?B?ekRhMUQ0OHV6dStyZkt2TTFXa1pCY3h5amZKbkxhdSs0aWlmaHlHOE1QUlVW?=
 =?utf-8?B?TWc3R2lVNmZuUzJJOGJFY1J4OHRqY2k0aHR5UzAybk5OblhobXlKa1c5OVBl?=
 =?utf-8?Q?z15MjcXsDoftjmSsrRADAr6cvfJDAGbDBbBA4ZWIEYJF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEC40C867ACF5045BA0DCB6634D4668A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f78aa95-bcbb-44f9-816f-08dc4ee88f47
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 05:33:12.2660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBmpH9Nf2/Uhq2IIAgOaaT8klQYzQsE8JPM9YYGXd1EMgKVVdg8z+y2O0GozNrDiVmWCSpZ+koIvCL/RmiSBalUCQKZf/1Bsk4yvWkE2IQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1731
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzAzLzIwMjQgw6AgMDU6NTUsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBU
aGUgcGFnZSB0YWJsZSBjaGVjayBmZWF0dXJlIHJlcXVpcmVzIHRoYXQgcHVkX3BmbigpIGJlIGRl
ZmluZWQNCj4gb24gZWFjaCBjb25zdW1pbmcgYXJjaGl0ZWN0dXJlLiBTaW5jZSBvbmx5IDY0LWJp
dCwgQm9vazNTIHBsYXRmb3Jtcw0KPiBhbGxvdyBmb3IgaHVnZXBhZ2VzIGF0IHRoaXMgdXBwZXIg
bGV2ZWwsIGFuZCBzaW5jZSB0aGUgY2FsbGluZyBjb2RlIGlzDQo+IGdhdGVkIGJ5IGEgY2FsbCB0
byBwdWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UoKSwgd2hpY2ggd2lsbCByZXR1cm4gemVybywNCj4g
aW5jbHVkZSB0aGlzIHN0dWIgYXMgYSBCVUlMRF9CVUcoKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFJvaGFuIE1jTHVyZSA8cm1jbHVyZUBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gdjExOiBwdWRf
cGZuKCkgc3R1YiBoYXMgYmVlbiByZW1vdmVkIHVwc3RyZWFtIGFzIGl0IGhhcyB2YWxpZCB1c2Vy
cyBub3cNCj4gaW4gdHJhbnNwYXJlbnQgaHVnZXBhZ2VzLiBDcmVhdGUgYSBCVUdfT04oKSBmb3Ig
b3RoZXIsIG5vbiBCb29rM1M2NA0KPiBwbGF0Zm9ybXMuDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCA4ICsrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IGlu
ZGV4IDIzOTcwOWEyZjY4ZS4uZWU4YzgyYzA1MjhmIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmgNCj4gQEAgLTIxMSw2ICsyMTEsMTQgQEAgc3RhdGljIGlubGluZSBib29sIGFy
Y2hfc3VwcG9ydHNfbWVtbWFwX29uX21lbW9yeSh1bnNpZ25lZCBsb25nIHZtZW1tYXBfc2l6ZSkN
Cj4gICANCj4gICAjZW5kaWYgLyogQ09ORklHX1BQQzY0ICovDQo+ICAgDQo+ICsjaWZuZGVmIHB1
ZF9wZm4NCj4gKyNkZWZpbmUgcHVkX3BmbiBwdWRfcGZuDQo+ICtzdGF0aWMgaW5saW5lIGludCBw
dWRfcGZuKHB1ZF90IHB1ZCkNCj4gK3sNCj4gKwlCVUlMRF9CVUcoKTsNCg0KVGhpcyBmdW5jdGlv
biBtdXN0IHJldHVybiBzb21ldGhpbmcuDQoNCj4gK30NCj4gKyNlbmRpZg0KPiArDQo+ICAgI2Vu
ZGlmIC8qIF9fQVNTRU1CTFlfXyAqLw0KPiAgIA0KPiAgICNlbmRpZiAvKiBfQVNNX1BPV0VSUENf
UEdUQUJMRV9IICovDQo=
