Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E490887701E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 10:49:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=TxjhZi1u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TsJCr4q4dz3vYd
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 20:49:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=TxjhZi1u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TsJC54yS0z2xb2
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 20:48:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UG4G/io1De7jZdmGFBepnIUtGj/HiLzMEckbF+66XxwVYZTeAg575AF3YO1DHMNQrb8NbSvoOklelWEdt8TEGLEq2qp/o1j65v1m36tQ7gZLa4rK5S0fxgyvb9iKxc5uwWNCm/183ca02nrwBcuwkoUu9tK8cEosjPjh7S8fCUmd210C2l4wN/2N+B+w7DOkghSFaipc4NI0dfByXZE8fQFgqk0Jo0h9ih6TL8EyNwifvKuZ1NH2rQkKPR3MBkzX/1ecBaMMeA/LGKBZud+yRlmQ5YUAe3V1m2xGP5ExG9+uFV/8IV1u77OiiDeL8BKCwq/MqZHHfhDprP4OP6/bVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7y82gtj/zcmajsL/R/DvMdadr7cFqFCIDRlkK1jMlvo=;
 b=Ghtd4rAjRpEFrK6MT+ObawX9ANUcGOOtW5ed5bgrNhwIaa8ssCwCAol3Zsa0CDOzkb/8GDVlcvpWCjCl0TOTjVRzePgNiIAsumsTfrVznlF2n1XSRUnbRaDbJdsJqGS6zOAnrLyZ97ypVHDXIQmC7YcmiZQBtO3gZME8SmoBGPR4Rjn889RS3wt+v6prwfLu489EQTxNjnpUJbvGvZrnje8Gj/66FiqiY0G2D28hY/TjtOOQ4j/LHBGfz7h/7r1rSoaNzRcjK4+KhWBtpqP+BOVg13dKFV+o5ioul7MosieX3TO2dA18cfAMzybYMwUq0KZuvnNkzGki7d1Z7HIXfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7y82gtj/zcmajsL/R/DvMdadr7cFqFCIDRlkK1jMlvo=;
 b=TxjhZi1uFcfiH58En8KUQnJSfdJqCf89ZMtnEi6Y1OtqjgJCRMK3BGPSE5slErd+tibmZi3eDUvLw7mNJSCs4BiPaK+JfUGroqCHpt07KPxxIHceprb55t3Afv4EK07TqYw2jyMJgg532FD2HlqT2ip19Y7oMfCjIiLXXbvd9OOPgUGUL5fVSGhJ6LSYmBNNG2CRdlGK+/sse9OmYshdcNpa5Gbb5DdEWnDVtOyIcciqFPDV+Z2ykNDjfPZ3hc+S/NsK+oH9UagNA1Q3gQ6BpgMX+utUlOS8MwWuqe7LOeaThj9DSjoMhKar5mryguHOExGGsz9wBILO7aHZ2ucE9g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3119.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Sat, 9 Mar
 2024 09:48:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7362.031; Sat, 9 Mar 2024
 09:48:21 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, "acme@kernel.org"
	<acme@kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>,
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "irogers@google.com"
	<irogers@google.com>, "namhyung@kernel.org" <namhyung@kernel.org>
Subject: Re: [PATCH 1/3] tools/perf/arch/powerpc: Add load/store in powerpc
 annotate instructions for data type profling
Thread-Topic: [PATCH 1/3] tools/perf/arch/powerpc: Add load/store in powerpc
 annotate instructions for data type profling
Thread-Index: AQHacfMp/ur6yWGDXE2/zgJzTc93eLEvKe6A
Date: Sat, 9 Mar 2024 09:48:21 +0000
Message-ID: <821ddf3c-d383-4b79-a7cb-b67034f56f10@csgroup.eu>
References: <20240309072513.9418-1-atrajeev@linux.vnet.ibm.com>
 <20240309072513.9418-2-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240309072513.9418-2-atrajeev@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3119:EE_
x-ms-office365-filtering-correlation-id: 7392dbeb-95b3-4442-e0b3-08dc401e0e81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  oV2q0VkmvURuZOr3/AqJtiIjECBwNL+Ew+gA0RLvr4A3Jm6VAnUPcEkFym01Vlx+R3UodOe47av6HSpGke0qZXjCJ050bROS9TjD/yuceZavJI5tnbJJnjHdhcaaBVDQozSgH5Wnz5mfyErP+Z9jGCz/NNX+jBXh50oHhUt4aWeGKGnWuSyKfWH55v/xxkmWm1fuDhWqUmFDrMF/azqIP5bWnrpkHwcuJVQBtoDGNxaswguCqpJUC/8hZXjInfqsTSEk6VwPGKxzLB9SQNhoxIHqHFASaeVywSqsue1Gw7ApAOootgGWeb7jUYVF5kypug6u0sdQDGb1gqDHoz0/PBb6QwSiIHs6Gk2QtTPxl9c8IByilu1vjTwam02oSBPzaLHcbkYyrVLCMRvUjL6kYuhfOv9CijnzND5CjcHHLkC/OVy7wMW0S3elmrhu9raTa2b/YbVdi2+8wF55wZgfIfEir27U0ue+X48kPhHoaU4ixxkhKlT0aUEwEhIeHVj2CJZGr8sL4mcsxwflA4k2+Js0zVbfZEmeZbfwSuXRBX2BW4mhx6zehTqjSVhJiXHTlAeRymH2rryEs88lVHNzU6nKRujQv2SulK8AD++o4wybZxTL5kGfaJ/MPsrImEVhJABdHKyRJS1hDT1faMMpBdfs0S1kAtuAEuMtNxRu7VH7PxqD4F7cWxk0YTzMj0+qpkrgCx8X7AptA0cS+p3YnLOyVYUuGRbys5kp6OarXrI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RTBtTGN2RFVRNTFhRVFjWExkN01DUXdGQ2t4dWFPUG5MWElaa0I1MXRHTkxF?=
 =?utf-8?B?OGpYeGN4eGg3MFdMRHBjdXpmdGowMkwzTTEwS21lOWdQU25ERTBtWDRlTk9s?=
 =?utf-8?B?RW1BY1ZXNU5OejRwU0xGOFBJZ1ZWSTB4ZlBhTVNEMFVENG9MRjB6TXk4bisy?=
 =?utf-8?B?aXEyRWlNZW1wbmpiMEJZZGc2bERUNkFPL1pZc2ZnZ3ZPZnRYZllrTWlkWFNh?=
 =?utf-8?B?UGdheFNRWmdRQnhGaVJrVHN3L2Vyd25zSnp2NHRZRlM2SEx0Yk1nMEowRXZu?=
 =?utf-8?B?Z2VqcjZkblJpZkZwSTdwZXFvNFN2SFd5RE5ISXpucEhLNkp6ZTYvTHFDMksv?=
 =?utf-8?B?WGtaZWdLaEd3bmIwcmNoRUZWQnBoWG0zUEU1SzRBSmxidDhvbkF6b3BNODNt?=
 =?utf-8?B?SjZrbWNwZzFDSzZGZzYzb1hwQUZmZ29kZjdQNFp0ckRyL2xHbTdUWmRPendN?=
 =?utf-8?B?S1NIVVV2UzVaaHM5NnJURW1PQzhWTDJsdkZ2NzVZNlNBQWlhbjNocktYa0tx?=
 =?utf-8?B?U1kvaUFFczZyOS9LemQrNkowQmpNR2kyazBJZHdHNVpFYmZFN2ZndVExNDNs?=
 =?utf-8?B?YjRuYjhYN1F3NW9qZitKSlFUZjVteTh1T0grOXNWRERQaWdNTGhaMjREOE5H?=
 =?utf-8?B?eWVJaXVBYUxKdXlPL1dLdGRsdWtLeG5EV2tna3BycFBuaXUzNWwyL01lUE5h?=
 =?utf-8?B?ei9ka0gweVNUdURVT3V5WXgrYitsUlNxU1RVdk9SdHFQTmFDODVxbXpOK1Jr?=
 =?utf-8?B?WXpQSnJUeTJMMCtCb0pVWEJyOUhRbjRuU2E1bWJiNkVhZEdpUFNwL0ZMRzJV?=
 =?utf-8?B?T05JdlZRVGc1WFM4bTRwa0RWN0I5aDVzQjBJM1ZHY2xrV3hOQXhxdHQza0FB?=
 =?utf-8?B?QXljWGQyd0ZFNVpNUjlpSE9sOVQwK1pyZkJ4TCtxbTk0aWZncTIxM25xelFF?=
 =?utf-8?B?Qnd0bGF5WmJweU5uMlNWK1k0ZitwQVBiU1UvSVAveUVFQmUwVzMxTURxRjhy?=
 =?utf-8?B?bWE3MnNXSEtlSHd0VElITWRGYVQvNGRKWEhNZTZKMkYyS1dGYmxvMFppODlQ?=
 =?utf-8?B?L0NjVTFBL1pzS2ZTNUJFUHB0VXBFUitINnZha0dvTk1pcy9yMHRGdll6Y1By?=
 =?utf-8?B?VTAwMTR3dVBMU3NuNHIzZnBIa091SFZDeHlmb3lUaWFTWk1vZ29EMUlUMXEy?=
 =?utf-8?B?eExlbUVRMGRpL0oycTN5dDR5ZnRmeWJYRkRNWndEeWZHblpXWGhKT0VHZ3Uz?=
 =?utf-8?B?cnBENm1uNS80eUFMRzdoQTQwRUFFR1RwVnlRVHBHTGJXZ3lOWVptdCtuWU5O?=
 =?utf-8?B?QTVnMEhwMnVqdjI0bW00L2llK0J3UmJDekxqZm81eXdNcWU3M2wvMTBzZUlK?=
 =?utf-8?B?TEFxSERmOWJGYSttMi9MbWhGZDBUOTlmNkVydXhNSTZvb24wY3R2b0ZhdFhR?=
 =?utf-8?B?dDVZRnBDMDByU1FnWVNReUNoeS8wR0p0WlZrM25wL0JIb0JQaUFTMk9XbXJP?=
 =?utf-8?B?UGVXcExSYTdjVjlqVXFiRnNrdkNERVlPeWxoOFVWaEE1Um5LNHNncFJuQ1VZ?=
 =?utf-8?B?dHdCL2NNZW9yWEJOaGlxWXpJbXAyT1MwbHpTczdyeU02SDgyS1pLVWQ0UUtr?=
 =?utf-8?B?ZWVxNW5Hc2JvVTNJbU1ackZlTDB2ZFpaUG4xOXRXbEh6UjZKSS9FQ0c4SnFG?=
 =?utf-8?B?R29Ra1hrSDdxYnlkZlNPejZqYUkrdXM5dFVUcWxiWG1oMkRoOXV1T0RFQjJE?=
 =?utf-8?B?TXpBSzAxamV2ZkhrZjlZdW1VcjM1d2VHNVlpcUVhM0hQMXJXTFhLZlJHUG5Q?=
 =?utf-8?B?VHQ3eDYrbXh0bDRsVGtlVG5lTHBWVmFHNk1GQit1MnE3bWtZYmtvU3J4OC83?=
 =?utf-8?B?UnJXdHdYbUpWd3Y2SjFPNTYxU1hwaXNUUlpkSjdOd3VVcVVoRFZCQ1diNzVG?=
 =?utf-8?B?Vng5bk45VlZiQ3VmOW01blIrQ2hzNVpsVUxLUEN3R0pGN2VvS3lkeXkwdC9R?=
 =?utf-8?B?NlVOZ1YyU2RqZXh6aUh0V0xLMUp4ME9oYTFSUHZBWHpFWnpSMVZNWHhVTXlj?=
 =?utf-8?B?dnpzOVplZnFGNlpiVUVHWnJMUDBrd0tYQXdvYjNvdE1QeE5RM1VuUG5DVWE4?=
 =?utf-8?Q?8mqGbw82/37IsoVzoO32aLQbV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7230AC7EB6C871469C17B85C74861385@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7392dbeb-95b3-4442-e0b3-08dc401e0e81
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2024 09:48:21.5914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qh7MKo1XnVjwSOIYPrqv4XOdzy/tv3pTVTDKFKktk8GGLtQQ2HBv4Cv+Yt9Jx3wxboo7H9E7+m2jQLfgYjE6VFAyn5rLqXgCotSM3ICxPpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3119
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
Cc: "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "disgoel@linux.vnet.ibm.com" <disgoel@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzAzLzIwMjQgw6AgMDg6MjUsIEF0aGlyYSBSYWplZXYgYSDDqWNyaXTCoDoNCj4g
QWRkIHBvd2VycGMgaW5zdHJ1Y3Rpb24gbm1lbW9uaWMgdGFibGUgdG8gYXNzb2NpYXRlIGxvYWQv
c3RvcmUNCj4gaW5zdHJ1Y3Rpb25zIHdpdGggbW92ZV9vcHMuIG1vdl9vcHMgaXMgdXNlZCB0byBp
ZGVudGlmeSBtZW1fdHlwZQ0KPiB0byBhc3NvY2lhdGUgaW5zdHJ1Y3Rpb24gd2l0aCBkYXRhIHR5
cGUgYW5kIG9mZnNldC4gQWxzbyBpbml0aWFsaXplDQo+IGFuZCBhbGxvY2F0ZSBhcmNoIHNwZWNp
ZmljIGZpZWxkcyBmb3IgbnJfaW5zdHJ1Y3Rpb25zLCBpbnN0cnVjdGlvbnMgYW5kDQo+IG5yX2lu
c3RydWN0aW9uc19hbGxvY2F0ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEF0aGlyYSBSYWplZXYg
PGF0cmFqZWV2QGxpbnV4LnZuZXQuaWJtLmNvbT4NCj4gLS0tDQo+ICAgLi4uL3BlcmYvYXJjaC9w
b3dlcnBjL2Fubm90YXRlL2luc3RydWN0aW9ucy5jIHwgNjYgKysrKysrKysrKysrKysrKysrKw0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMgYi90b29scy9w
ZXJmL2FyY2gvcG93ZXJwYy9hbm5vdGF0ZS9pbnN0cnVjdGlvbnMuYw0KPiBpbmRleCBhM2Y0MjNj
MjdjYWUuLjA3YWY0NDQyYmUzOCAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvcGVyZi9hcmNoL3Bvd2Vy
cGMvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMNCj4gKysrIGIvdG9vbHMvcGVyZi9hcmNoL3Bvd2Vy
cGMvYW5ub3RhdGUvaW5zdHJ1Y3Rpb25zLmMNCj4gQEAgLTEsNiArMSw2NSBAQA0KPiAgIC8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICAgI2luY2x1ZGUgPGxpbnV4L2NvbXBp
bGVyLmg+DQo+ICAgDQo+ICsvKg0KPiArICogcG93ZXJwYyBpbnN0cnVjdGlvbiBubWVtb25pYyB0
YWJsZSB0byBhc3NvY2lhdGUgbG9hZC9zdG9yZSBpbnN0cnVjdGlvbnMgd2l0aA0KPiArICogbW92
ZV9vcHMuIG1vdl9vcHMgaXMgdXNlZCB0byBpZGVudGlmeSBtZW1fdHlwZSB0byBhc3NvY2lhdGUg
aW5zdHJ1Y3Rpb24gd2l0aA0KPiArICogZGF0YSB0eXBlIGFuZCBvZmZzZXQuDQo+ICsgKi8NCj4g
K3N0YXRpYyBzdHJ1Y3QgaW5zIHBvd2VycGNfX2luc3RydWN0aW9uc1tdID0gew0KPiArCXsgLm5h
bWUgPSAibGJ6IiwJLm9wcyA9ICZtb3Zfb3BzLCAgfSwNCj4gKwl7IC5uYW1lID0gImxiengiLAku
b3BzID0gJm1vdl9vcHMsICB9LA0KPiArCXsgLm5hbWUgPSAibGJ6dSIsCS5vcHMgPSAmbW92X29w
cywgIH0sDQo+ICsJeyAubmFtZSA9ICJsYnp1eCIsCS5vcHMgPSAmbW92X29wcywgIH0sDQo+ICsJ
eyAubmFtZSA9ICJsaHoiLAkub3BzID0gJm1vdl9vcHMsICB9LA0KPiArCXsgLm5hbWUgPSAibGh6
eCIsCS5vcHMgPSAmbW92X29wcywgIH0sDQo+ICsJeyAubmFtZSA9ICJsaHp1IiwJLm9wcyA9ICZt
b3Zfb3BzLCAgfSwNCj4gKwl7IC5uYW1lID0gImxoenV4IiwJLm9wcyA9ICZtb3Zfb3BzLCAgfSwN
Cj4gKwl7IC5uYW1lID0gImxoYSIsCS5vcHMgPSAmbW92X29wcywgIH0sDQo+ICsJeyAubmFtZSA9
ICJsaGF4IiwJLm9wcyA9ICZtb3Zfb3BzLCAgfSwNCj4gKwl7IC5uYW1lID0gImxoYXUiLAkub3Bz
ID0gJm1vdl9vcHMsICB9LA0KPiArCXsgLm5hbWUgPSAibGhhdXgiLAkub3BzID0gJm1vdl9vcHMs
ICB9LA0KPiArCXsgLm5hbWUgPSAibHd6IiwJLm9wcyA9ICZtb3Zfb3BzLCAgfSwNCj4gKwl7IC5u
YW1lID0gImx3engiLAkub3BzID0gJm1vdl9vcHMsICB9LA0KPiArCXsgLm5hbWUgPSAibHd6dSIs
CS5vcHMgPSAmbW92X29wcywgIH0sDQo+ICsJeyAubmFtZSA9ICJsd3p1eCIsCS5vcHMgPSAmbW92
X29wcywgIH0sDQo+ICsJeyAubmFtZSA9ICJsd2EiLAkub3BzID0gJm1vdl9vcHMsICB9LA0KPiAr
CXsgLm5hbWUgPSAibHdheCIsCS5vcHMgPSAmbW92X29wcywgIH0sDQo+ICsJeyAubmFtZSA9ICJs
d2F1eCIsCS5vcHMgPSAmbW92X29wcywgIH0sDQo+ICsJeyAubmFtZSA9ICJsZCIsCQkub3BzID0g
Jm1vdl9vcHMsICB9LA0KPiArCXsgLm5hbWUgPSAibGR4IiwJLm9wcyA9ICZtb3Zfb3BzLCAgfSwN
Cj4gKwl7IC5uYW1lID0gImxkdSIsCS5vcHMgPSAmbW92X29wcywgIH0sDQo+ICsJeyAubmFtZSA9
ICJsZHV4IiwJLm9wcyA9ICZtb3Zfb3BzLCAgfSwNCj4gKwl7IC5uYW1lID0gInN0YiIsCS5vcHMg
PSAmbW92X29wcywgIH0sDQo+ICsJeyAubmFtZSA9ICJzdGJ4IiwJLm9wcyA9ICZtb3Zfb3BzLCAg
fSwNCj4gKwl7IC5uYW1lID0gInN0YnUiLAkub3BzID0gJm1vdl9vcHMsICB9LA0KPiArCXsgLm5h
bWUgPSAic3RidXgiLAkub3BzID0gJm1vdl9vcHMsICB9LA0KPiArCXsgLm5hbWUgPSAic3RoIiwJ
Lm9wcyA9ICZtb3Zfb3BzLCAgfSwNCj4gKwl7IC5uYW1lID0gInN0aHgiLAkub3BzID0gJm1vdl9v
cHMsICB9LA0KPiArCXsgLm5hbWUgPSAic3RodSIsCS5vcHMgPSAmbW92X29wcywgIH0sDQo+ICsJ
eyAubmFtZSA9ICJzdGh1eCIsCS5vcHMgPSAmbW92X29wcywgIH0sDQo+ICsJeyAubmFtZSA9ICJz
dHciLAkub3BzID0gJm1vdl9vcHMsICB9LA0KPiArCXsgLm5hbWUgPSAic3R3eCIsCS5vcHMgPSAm
bW92X29wcywgIH0sDQo+ICsJeyAubmFtZSA9ICJzdHd1IiwJLm9wcyA9ICZtb3Zfb3BzLCAgfSwN
Cj4gKwl7IC5uYW1lID0gInN0d3V4IiwJLm9wcyA9ICZtb3Zfb3BzLCAgfSwNCj4gKwl7IC5uYW1l
ID0gInN0ZCIsCS5vcHMgPSAmbW92X29wcywgIH0sDQo+ICsJeyAubmFtZSA9ICJzdGR4IiwJLm9w
cyA9ICZtb3Zfb3BzLCAgfSwNCj4gKwl7IC5uYW1lID0gInN0ZHUiLAkub3BzID0gJm1vdl9vcHMs
ICB9LA0KPiArCXsgLm5hbWUgPSAic3RkdXgiLAkub3BzID0gJm1vdl9vcHMsICB9LA0KPiArCXsg
Lm5hbWUgPSAibGhicngiLAkub3BzID0gJm1vdl9vcHMsICB9LA0KPiArCXsgLm5hbWUgPSAic3Ro
YnJ4IiwJLm9wcyA9ICZtb3Zfb3BzLCAgfSwNCj4gKwl7IC5uYW1lID0gImx3YnJ4IiwJLm9wcyA9
ICZtb3Zfb3BzLCAgfSwNCj4gKwl7IC5uYW1lID0gInN0d2JyeCIsCS5vcHMgPSAmbW92X29wcywg
IH0sDQo+ICsJeyAubmFtZSA9ICJsZGJyeCIsCS5vcHMgPSAmbW92X29wcywgIH0sDQo+ICsJeyAu
bmFtZSA9ICJzdGRicngiLAkub3BzID0gJm1vdl9vcHMsICB9LA0KPiArCXsgLm5hbWUgPSAibG13
IiwJLm9wcyA9ICZtb3Zfb3BzLCAgfSwNCj4gKwl7IC5uYW1lID0gInN0bXciLAkub3BzID0gJm1v
dl9vcHMsICB9LA0KPiArCXsgLm5hbWUgPSAibHN3aSIsCS5vcHMgPSAmbW92X29wcywgIH0sDQo+
ICsJeyAubmFtZSA9ICJsc3d4IiwJLm9wcyA9ICZtb3Zfb3BzLCAgfSwNCj4gKwl7IC5uYW1lID0g
InN0c3dpIiwJLm9wcyA9ICZtb3Zfb3BzLCAgfSwNCj4gKwl7IC5uYW1lID0gInN0c3d4IiwJLm9w
cyA9ICZtb3Zfb3BzLCAgfSwNCj4gK307DQoNCldoYXQgYWJvdXQgbHdhcnggYW5kIHN0d2N4ID8N
Cg0KPiArDQo+ICAgc3RhdGljIHN0cnVjdCBpbnNfb3BzICpwb3dlcnBjX19hc3NvY2lhdGVfaW5z
dHJ1Y3Rpb25fb3BzKHN0cnVjdCBhcmNoICphcmNoLCBjb25zdCBjaGFyICpuYW1lKQ0KPiAgIHsN
Cj4gICAJaW50IGk7DQo+IEBAIC01Miw2ICsxMTEsMTMgQEAgc3RhdGljIHN0cnVjdCBpbnNfb3Bz
ICpwb3dlcnBjX19hc3NvY2lhdGVfaW5zdHJ1Y3Rpb25fb3BzKHN0cnVjdCBhcmNoICphcmNoLCBj
b24NCj4gICBzdGF0aWMgaW50IHBvd2VycGNfX2Fubm90YXRlX2luaXQoc3RydWN0IGFyY2ggKmFy
Y2gsIGNoYXIgKmNwdWlkIF9fbWF5YmVfdW51c2VkKQ0KPiAgIHsNCj4gICAJaWYgKCFhcmNoLT5p
bml0aWFsaXplZCkgew0KPiArCQlhcmNoLT5ucl9pbnN0cnVjdGlvbnMgPSBBUlJBWV9TSVpFKHBv
d2VycGNfX2luc3RydWN0aW9ucyk7DQo+ICsJCWFyY2gtPmluc3RydWN0aW9ucyA9IGNhbGxvYyhh
cmNoLT5ucl9pbnN0cnVjdGlvbnMsIHNpemVvZihzdHJ1Y3QgaW5zKSk7DQo+ICsJCWlmIChhcmNo
LT5pbnN0cnVjdGlvbnMgPT0gTlVMTCkNCg0KUHJlZmVyZWQgZm9ybSBpcw0KDQoJaWYgKCFhcmNo
LT5pbnN0cnVjdGlvbnMpDQoNCj4gKwkJCXJldHVybiAtRU5PTUVNOw0KPiArDQo+ICsJCW1lbWNw
eShhcmNoLT5pbnN0cnVjdGlvbnMsIChzdHJ1Y3QgaW5zICopcG93ZXJwY19faW5zdHJ1Y3Rpb25z
LCBzaXplb2Yoc3RydWN0IGlucykgKiBhcmNoLT5ucl9pbnN0cnVjdGlvbnMpOw0KDQpObyBuZWVk
IHRvIGNhc3QgcG93ZXJwY19faW5zdHJ1Y3Rpb25zLCBpdCBpcyBhbHJlYWR5IGEgcG9pbnRlci4N
Cg0KDQo+ICsJCWFyY2gtPm5yX2luc3RydWN0aW9uc19hbGxvY2F0ZWQgPSBhcmNoLT5ucl9pbnN0
cnVjdGlvbnM7DQo+ICAgCQlhcmNoLT5pbml0aWFsaXplZCA9IHRydWU7DQo+ICAgCQlhcmNoLT5h
c3NvY2lhdGVfaW5zdHJ1Y3Rpb25fb3BzID0gcG93ZXJwY19fYXNzb2NpYXRlX2luc3RydWN0aW9u
X29wczsNCj4gICAJCWFyY2gtPm9iamR1bXAuY29tbWVudF9jaGFyICAgICAgPSAnIyc7DQo=
