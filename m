Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E921876F8B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 08:49:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=HzHftXvn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TsFYq5wd9z3dWw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 18:49:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=HzHftXvn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TsFY55TtKz3cST
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 18:49:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C03oX79c29A9ox5Bzv/e56BGZYqwqC3JzwuejZSuuDzGVFVueiJi0P+S9rgh98jklNNF7bma4l/dTOVAaPAOur7hVhrul1y4KdWW/04qHxprQPMgGlOgVckmjS8pWQYrxQE6Cv/FJIhibr3MtZ9chkasSiZ8hZ9SAGpzSfwpveWIcDGBP8VFgLFcPgPUMeactZ9903RWTe4HbAtTJueEa58BVz3Ag0d5hCjEE5WkcvzW4n9rCpRlr2Tx12ZOlW+qxZUFLLJvAkN52SVE+kwnGwUieybL5a574lh2uyaFSBsul2TX6RtHhGeqlDuXwPyWYrz+VdxtSNCIi6BuW5ENmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BD0asHNV/RoqRkUz6wCn1jAdY1rssFxvh3XYaPpfj/E=;
 b=eH29LUv54pK76wLbQdzKPSV9YZQNQ085BF8a13Pc4HYx24YZIxhSfMxZ8NpQzX/61u8LS7Q5vhYMqJeGdw5g4yQ/q8CPH4kAfOBKUqeDz062AZ11GVqBDnRPyxJU18YNpLmBMrV+5YFkvWETFZAXeYV8JIKsLeh2K0VRCU6qUkaLqm0QpK1WDIfKC7v+pyhts8H+VTJGTBZx8xOuD+Y7Ifq++Uhf23eMkmA+2PuOoc98IccRHORhlQfcB1zvIS17Ubn1jPpfQ3kf1TgUYneUsgO+0a9M7nTEzdU85WNB5wsdxHEEAB3+eZ/9ckQcAlWR/EJqNu7kQTceUf4OsA1g0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BD0asHNV/RoqRkUz6wCn1jAdY1rssFxvh3XYaPpfj/E=;
 b=HzHftXvnBy20EEh6sOt7oc8eCyQzfiOs2ugYyOnecF3ot6PGQ1KOgC8B1z3lR4X+ZAYEunxopdtv0FPyXP+68S3ZqszI1YJctRWwKCV3M/c3vlroqlqeSRMQZn5kbsXYLK23COYFsR0OJzCQXqnxwxFhiswcaAKJYujqyHsN5lH9TMOxVZbGuGFqePi/PHxNZErJNY6S5RJ1lg8kytVi4p0MG7jELOLwWRWzmQadlty8z8h7qhH5e3tAAra+zFcglkEBVY0lGN3ijuWLVwZ6ouGjLOVXnw+lpuafAJQ9RIXfsmfzo42pcn8V8LAUOFCkinjauRH74/dU0fr+ok1fBw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2943.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Sat, 9 Mar
 2024 07:48:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7362.031; Sat, 9 Mar 2024
 07:48:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner
	<tglx@linutronix.de>
Subject: Re: [PATCH 01/19] vdso: Consolidate vdso_calc_delta()
Thread-Topic: [PATCH 01/19] vdso: Consolidate vdso_calc_delta()
Thread-Index: AQHacVq7tNOrMh7ipEym8vPgc6GuULEvCbMA
Date: Sat, 9 Mar 2024 07:48:44 +0000
Message-ID: <094a2fd9-23d9-405b-9b6f-0e2516cd5a57@csgroup.eu>
References: <20240308131512.44324-1-adrian.hunter@intel.com>
 <20240308131512.44324-2-adrian.hunter@intel.com>
In-Reply-To: <20240308131512.44324-2-adrian.hunter@intel.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2943:EE_
x-ms-office365-filtering-correlation-id: 6deeda94-8ad7-42e7-3834-08dc400d58d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VarsPf3GQpn1RHMPeaOHK6m/w0WYTABJ3OKKz1U57/LxU/Dj10+wFi5DthWfZMlugH4Bx6vQq2ECuVyhP6m8ku3wSK2l5s/uPy9B4uxBDGOl7nQRlUh5zVDwCp49PyxSkFSwmlwdbGyvPlA/sIy2aGsfXaVmKz+XEiOhVpCuFtxLokLm7CccYf744S23YOwOVhWMjWkBeJ4dYPL9Rxiw9V4A/wMZ4PtEadWKbNWZpYrZ0Vl9etk9QDq/tJtFKzo8HXhbtsH4RFwB++GuN6ZjOGbraDyUCxutdRMHC087B44ZYgiR6X+8fedPIBxWKuxNulq3Jn0QLDUM4CKHsl2uACKqAy2PGAlh/LxmuXr7yseYVAmLkCep0Za38aD0i27htgzjtyxiBRw06Uja0BvKQQl+imwSjKtFypVUUjG3xQZDBbNAYbMNsrCaIHa1QF/U9sZtAz/DKmN+MB13YVy0Pqz29wEfvNrcoyla0XeKOKn4MAXhHMQ/R0ULct6g6b8nO+27wFo7NfWWHOKic9qIcmRbXR2CRcsiAnDXCrMTFnOCl9nu06IEMUsOBUiJInB5dr2Z01BG1o/EPUI3QHVJuVLLmrPfMLvig44Fmw9wRHMSJv4pqS9Nv77n325uIRenicXhK6WIGkjaL0ULu2rQZmCCorBDoGX1S3AgPi7Nn8E=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YTZkbmd5NWxjQWw3ZWJIbFM5QTEwY2hPSkJ5UnRlSnRLVE05QXdlZlBYRDNE?=
 =?utf-8?B?NmhDRVloN2xjTFdDZndXbnUvcTUyOUNWWnVaek1VNWdCVGdJRXIzYjN4d1BJ?=
 =?utf-8?B?RlR2TGJRa01MK0dqRlFhUVY3OXlJajRxUW8xaW95dGpWYUswZ3RNdzdkb1R3?=
 =?utf-8?B?QmxVUWkzd2VXOW9MZkJreExRSFc5bW14YjV5dlc5dGFMdHRnb3dCdU54SVFq?=
 =?utf-8?B?a1ZMYkxSS3ZSbks3YTFCZDNPNmtIbGhYS3VidXJ6RVNDdk5YZkk3MzhaTDh6?=
 =?utf-8?B?RmxHdkJXbEM1WEtuaTdRc0pWdHdnUkE2cnhsWXFDUEZlT0JRMkdXNnFCeWdx?=
 =?utf-8?B?NDhpQ0kxUTE1dWZKeXBSeXlFM3JGYjhtVE1ETlZaVUk2UlloalpUL09XVC9S?=
 =?utf-8?B?Z1ZKRVJqVEJpaFM5T3hpSkJ0OWxuM2ZMdFBjZjF2RlRIM0pnRktxQU4rZzFU?=
 =?utf-8?B?bVk4ajFLT1NZL2NVRVVSN1I1aEIrclFzR3pac3VzV2tLL0d1MUU1NEhlNEE4?=
 =?utf-8?B?Y2lsU1ZlT1dvZVRnbjB0MmVUMjJEb05jRHJ6OUc1WWxZdjhkOXIvYnM5U1FL?=
 =?utf-8?B?RGhFeVUvbWhzYkt1TEZyUTh4Umc2dC8rcGpnb2xrYXl0a29VMFFRS1JsUWlI?=
 =?utf-8?B?bkh2dGVtSDhDaDljTnl5QllHZmxSN1NaNGtUSS9MclJMVEMyb3AvdFBiZEo0?=
 =?utf-8?B?U3FnN0JJVUlreU51OE9Bc3N3T0I1c01uZmZsSW1LcGxxMThlcGpoM2NqQzRx?=
 =?utf-8?B?amFHZUhOb3VkbEwxWGJub0FhQ2pEWEtBN05jOWpPTnJublU1SlNyWXZkc0FR?=
 =?utf-8?B?OVArOU44VFdWOEZUOVZDamtTanRVZHV5aDVEaFpDa2VoTGtHRmpFWmZQRDVa?=
 =?utf-8?B?aXM2bmVLOU0xNFhLY1FEMk14d1VqMVM4RSswOVZhWUlvWW9uSk5jaGlKQnBM?=
 =?utf-8?B?RHA0M2NFTTY1UXlPV3ZpVVBRcXdwSzNKWVdnTnE1V3VDU0pFbExHSFhqd3E2?=
 =?utf-8?B?RDRmQVV2S2xscG5PaHoxOWlkMlowbTl0QmJ0YUM4b21lZUVmWmZjK0szYVcy?=
 =?utf-8?B?Ulk1ZmoxRHU4ZmJESUdwRTRZK0V6U0toY0VQN1hqdU5wWCtoT2xmMDBZMEc0?=
 =?utf-8?B?UzZ5SUlHTkJuNjdySitzTEhDblZkOXJ4bWFVUmw3djJoQVQ3cmhJa3d4WG9K?=
 =?utf-8?B?K2NTaDVpd0d4Rld3TFllY2lOb0JiQnZRRzVDaVZxdlhVUkd5VHNGN2V4c044?=
 =?utf-8?B?bkhTZ1hleFl2dUVDU0RmZTBSUEtERTcxTmpJVjNnRmNQNGNWNmxDdDdwSzFa?=
 =?utf-8?B?VytjbVUyd3pkbHd2RC9xZWtFR29XMDJodnlFYnlBZHRwNW92Qko2Z3hBZ0pv?=
 =?utf-8?B?dXR1M1dpcnhlaGVtVUFDK1p4dDBEU2ZJRjRJbDJPZTdjZElTYm9lcUd1Y3c3?=
 =?utf-8?B?QlpGQW9pTFdwN3psT3EwQktjSEtRWFFmamJ1a3JUbWprRS9DSk1QemMvWjdk?=
 =?utf-8?B?MFJVeWRPSW1FQlNJNG9jNnhkbVAxME1hZ2dWMDQ4ZWM1WXczbUFhWVpoZ1A2?=
 =?utf-8?B?M2hqRjluKzc5RWoxdmZsQ2o5cklZd0ZGZ2ljRGgveUE2SEhuNkMxZHNlaGpw?=
 =?utf-8?B?emEwdG82bEs2YStxQXB0U1BNVG5KZndtYjg4NnFWL2VqaGkrZzROdTNEeGtX?=
 =?utf-8?B?c1EyME4ralcrQkcxbVprcUF1VVZDN0lXMmkvbURoYmJyWFAvKzJJUzJpV0RX?=
 =?utf-8?B?TWJyc25NSEVqNy9Kc3hZZzd1cERHbzZVaC9lMHZQT0lPd2kzdEhxVzlGcmNH?=
 =?utf-8?B?WXR3WUhlVllpRDdDQzk0NWMwYzhhREtqYTNYRXdqcFIzdjhZNHdZMXE2ZzYx?=
 =?utf-8?B?c3Fqa1A2SThYRzJDMng2aXdDQmJSMFRzeUpSc1lNMnBrUzNzQTlVczJtSi9Q?=
 =?utf-8?B?YmwyNXZoVTk3SFo1Mk9SOGljaEFQTTY1N3BzVXg5NkV4OUZnRzhxZVNDVVBI?=
 =?utf-8?B?ckgycFRpcnNmdytKRldkR1NsQng3YjBveXJ4T0R1M2Zib0lUekJVZEQybVVU?=
 =?utf-8?B?alB5K0JiUWhYS2Q0ajNUZmR1M09zL3hqZUhqUzJJZ1hrREErQy9EU2J5cTR2?=
 =?utf-8?Q?Xv5NgGHV4Nq6IgxfnGh5zIgEX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D2524EED37B3C4C9307186933319E40@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6deeda94-8ad7-42e7-3834-08dc400d58d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2024 07:48:44.8813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x/D8xjUyfjBxVnHgNNTdGhZaUYjzkMJ7VBh444sNqKqJKxS8lMTwbd2px+fctF/X2x4mjgtzY9Zuuj3zhBnQC+PrniDRb8YRT31M4Fp0Vtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2943
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, "x86@kernel.org" <x86@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N.
 Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sven Schnelle <svens@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzAzLzIwMjQgw6AgMTQ6MTQsIEFkcmlhbiBIdW50ZXIgYSDDqWNyaXTCoDoNCj4g
W1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgYWRyaWFuLmh1bnRl
ckBpbnRlbC5jb20uIETDqWNvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50IMOgIGh0
dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBDb25z
b2xpZGF0ZSB2ZHNvX2NhbGNfZGVsdGEoKSwgaW4gcHJlcGFyYXRpb24gZm9yIGZ1cnRoZXIgc2lt
cGxpZmljYXRpb24uDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVu
dGVyQGludGVsLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Zkc28v
Z2V0dGltZW9mZGF5LmggfCAxNyArKy0tLS0tLS0tLS0tLS0tLQ0KPiAgIGFyY2gvczM5MC9pbmNs
dWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oICAgIHwgIDcgKystLS0tLQ0KPiAgIGxpYi92ZHNv
L2dldHRpbWVvZmRheS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKysrKw0KPiAgIDMgZmls
ZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaCBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oDQo+IGluZGV4IGYwYTRj
ZjAxZTg1Yy4uZjRkYThlMThjZGYzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vdmRzby9nZXR0aW1lb2ZkYXkuaA0KPiBAQCAtMTQsNiArMTQsOCBAQA0KPiANCj4gICAjZGVm
aW5lIFZEU09fSEFTX1RJTUUgICAgICAgICAgICAgICAgICAxDQo+IA0KPiArI2RlZmluZSBWRFNP
X0RFTFRBX05PTUFTSyAgICAgICAgICAgICAgMQ0KPiArDQo+ICAgc3RhdGljIF9fYWx3YXlzX2lu
bGluZSBpbnQgZG9fc3lzY2FsbF8yKGNvbnN0IHVuc2lnbmVkIGxvbmcgX3IwLCBjb25zdCB1bnNp
Z25lZCBsb25nIF9yMywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCB1bnNpZ25lZCBsb25nIF9yNCkNCj4gICB7DQo+IEBAIC0xMDUsMjEgKzEwNyw2IEBA
IHN0YXRpYyBpbmxpbmUgYm9vbCB2ZHNvX2Nsb2Nrc291cmNlX29rKGNvbnN0IHN0cnVjdCB2ZHNv
X2RhdGEgKnZkKQ0KPiAgIH0NCj4gICAjZGVmaW5lIHZkc29fY2xvY2tzb3VyY2Vfb2sgdmRzb19j
bG9ja3NvdXJjZV9vaw0KPiANCj4gLS8qDQo+IC0gKiBwb3dlcnBjIHNwZWNpZmljIGRlbHRhIGNh
bGN1bGF0aW9uLg0KPiAtICoNCj4gLSAqIFRoaXMgdmFyaWFudCByZW1vdmVzIHRoZSBtYXNraW5n
IG9mIHRoZSBzdWJ0cmFjdGlvbiBiZWNhdXNlIHRoZQ0KPiAtICogY2xvY2tzb3VyY2UgbWFzayBv
ZiBhbGwgVkRTTyBjYXBhYmxlIGNsb2Nrc291cmNlcyBvbiBwb3dlcnBjIGlzIFU2NF9NQVgNCj4g
LSAqIHdoaWNoIHdvdWxkIHJlc3VsdCBpbiBhIHBvaW50bGVzcyBvcGVyYXRpb24uIFRoZSBjb21w
aWxlciBjYW5ub3QNCj4gLSAqIG9wdGltaXplIGl0IGF3YXkgYXMgdGhlIG1hc2sgY29tZXMgZnJv
bSB0aGUgdmRzbyBkYXRhIGFuZCBpcyBub3QgY29tcGlsZQ0KPiAtICogdGltZSBjb25zdGFudC4N
Cj4gLSAqLw0KDQpQbGVhc2Uga2VlcCB0aGUgY29tbWVudC4gWW91IGNhbiBtb3ZlIGl0IGNsb3Nl
IHRvIFZEU09fREVMVEFfTk9NQVNLDQoNCj4gLXN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdTY0IHZk
c29fY2FsY19kZWx0YSh1NjQgY3ljbGVzLCB1NjQgbGFzdCwgdTY0IG1hc2ssIHUzMiBtdWx0KQ0K
PiAtew0KPiAtICAgICAgIHJldHVybiAoY3ljbGVzIC0gbGFzdCkgKiBtdWx0Ow0KPiAtfQ0KPiAt
I2RlZmluZSB2ZHNvX2NhbGNfZGVsdGEgdmRzb19jYWxjX2RlbHRhDQo+IC0NCj4gICAjaWZuZGVm
IF9fcG93ZXJwYzY0X18NCj4gICBzdGF0aWMgX19hbHdheXNfaW5saW5lIHU2NCB2ZHNvX3NoaWZ0
X25zKHU2NCBucywgdW5zaWduZWQgbG9uZyBzaGlmdCkNCj4gICB7DQo+IGRpZmYgLS1naXQgYS9h
cmNoL3MzOTAvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaCBiL2FyY2gvczM5MC9pbmNs
dWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oDQo+IGluZGV4IGRiODQ5NDJlYjc4Zi4uNzkzNzc2
NWNjZmE1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3MzOTAvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1l
b2ZkYXkuaA0KPiArKysgYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2ZkYXku
aA0KPiBAQCAtNiwxNiArNiwxMyBAQA0KPiANCj4gICAjZGVmaW5lIFZEU09fSEFTX0NMT0NLX0dF
VFJFUyAxDQo+IA0KPiArI2RlZmluZSBWRFNPX0RFTFRBX05PTUFTSyAxDQo+ICsNCj4gICAjaW5j
bHVkZSA8YXNtL3N5c2NhbGwuaD4NCj4gICAjaW5jbHVkZSA8YXNtL3RpbWV4Lmg+DQo+ICAgI2lu
Y2x1ZGUgPGFzbS91bmlzdGQuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvY29tcGlsZXIuaD4NCj4g
DQo+IC0jZGVmaW5lIHZkc29fY2FsY19kZWx0YSBfX2FyY2hfdmRzb19jYWxjX2RlbHRhDQo+IC1z
dGF0aWMgX19hbHdheXNfaW5saW5lIHU2NCBfX2FyY2hfdmRzb19jYWxjX2RlbHRhKHU2NCBjeWNs
ZXMsIHU2NCBsYXN0LCB1NjQgbWFzaywgdTMyIG11bHQpDQo+IC17DQo+IC0gICAgICAgcmV0dXJu
IChjeWNsZXMgLSBsYXN0KSAqIG11bHQ7DQo+IC19DQo+IA0KPiAgIHN0YXRpYyBfX2Fsd2F5c19p
bmxpbmUgY29uc3Qgc3RydWN0IHZkc29fZGF0YSAqX19hcmNoX2dldF92ZHNvX2RhdGEodm9pZCkN
Cj4gICB7DQo+IGRpZmYgLS1naXQgYS9saWIvdmRzby9nZXR0aW1lb2ZkYXkuYyBiL2xpYi92ZHNv
L2dldHRpbWVvZmRheS5jDQo+IGluZGV4IGNlMmY2OTU1MjAwMy4uMDQyYjk1ZTgxNjRkIDEwMDY0
NA0KPiAtLS0gYS9saWIvdmRzby9nZXR0aW1lb2ZkYXkuYw0KPiArKysgYi9saWIvdmRzby9nZXR0
aW1lb2ZkYXkuYw0KPiBAQCAtMTMsNyArMTMsMTEgQEANCj4gICBzdGF0aWMgX19hbHdheXNfaW5s
aW5lDQo+ICAgdTY0IHZkc29fY2FsY19kZWx0YSh1NjQgY3ljbGVzLCB1NjQgbGFzdCwgdTY0IG1h
c2ssIHUzMiBtdWx0KQ0KPiAgIHsNCj4gKyNpZmRlZiBWRFNPX0RFTFRBX05PTUFTSw0KPiArICAg
ICAgIHJldHVybiAoY3ljbGVzIC0gbGFzdCkgKiBtdWx0Ow0KPiArI2Vsc2UNCj4gICAgICAgICAg
cmV0dXJuICgoY3ljbGVzIC0gbGFzdCkgJiBtYXNrKSAqIG11bHQ7DQo+ICsjZW5kaWYNCg0KU2Vl
IA0KaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvcHJvY2Vzcy9jb2Rpbmctc3R5bGUuaHRtbCNjb25k
aXRpb25hbC1jb21waWxhdGlvbg0KDQpZb3UgZG9uJ3QgbmVlZCAjaWZkZWZzIGhlcmUuDQoNCk9u
ZSBzb2x1dGlvbiBpcyB0byBkZWZpbmUgVkRTT19ERUxUQV9OT01BU0sgdG8gMCBpbiANCmluY2x1
ZGUvdmRzby9kYXRhcGFnZS5oIGFmdGVyIGluY2x1ZGluZyBhc20vdmRzby9nZXR0aW1lb2ZkYXku
aCA6DQoNCiNpZm5kZWYgVkRTT19ERUxUQV9OT01BU0sNCiNkZWZpbmUgVkRTT19ERUxUQV9OT01B
U0sgMA0KI2VuZGlmDQoNClRoZW4NCg0KdTY0IHZkc29fY2FsY19kZWx0YSh1NjQgY3ljbGVzLCB1
NjQgbGFzdCwgdTY0IG1hc2ssIHUzMiBtdWx0KQ0Kew0KCWlmIChWRFNPX0RFTFRBX05PTUFTSykN
CgkJbWFzayA9IH4wVUxMOw0KDQoJcmV0dXJuICgoY3ljbGVzIC0gbGFzdCkgJiBtYXNrKSAqIG11
bHQ7DQp9DQoNCm9yDQoNCnU2NCB2ZHNvX2NhbGNfZGVsdGEodTY0IGN5Y2xlcywgdTY0IGxhc3Qs
IHU2NCBtYXNrLCB1MzIgbXVsdCkNCnsNCglpZiAoVkRTT19ERUxUQV9OT01BU0spDQoJCXJldHVy
biAoY3ljbGVzIC0gbGFzdCkgKiBtdWx0Ow0KDQoJcmV0dXJuICgoY3ljbGVzIC0gbGFzdCkgJiBt
YXNrKSAqIG11bHQ7DQp9DQoNCg0KDQoNCj4gICB9DQo+ICAgI2VuZGlmDQo+IA0KPiAtLQ0KPiAy
LjM0LjENCj4gDQo=
