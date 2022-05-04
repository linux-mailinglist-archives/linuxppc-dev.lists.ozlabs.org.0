Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDBF519ECD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 14:02:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktb6y4Ggmz3byX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 22:02:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62b;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ktb6W0jqKz3bbV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 22:02:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnJsvzYjlAJRiEsyMFJKS4arkMzJ8AjYxh3BWz06ExIFuq3oudW/u2KU8jAnwmcpJwFjcEjrKiHd29zPa2YBT55Hmfkm/4dhmx+SBfXchuOhjIoV/QXSjq897Vshs0u/O0wSxqD3bQKvGiD3Rp8Cp3WZclS0Md2bk9fiH6QxUSKzgY1AD8ANe9aKMCBzFIJEWGF/m2b8w3uFJ5a0ODolvZoqOyIhDZQmxDjpMsnD0gmIUS5q/SPQLPtwhR7c9V3aycCZxec1fe48C3SOt0Am0xwUNwnxPAUzIV7L9JlMnotxtYPRFKA9atIpAWLzzkjmiUpjyEyeSfgFsPWFDIogbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUttYRyARZRns788RXFfknV4mMItEyBuGKt2nD8EryU=;
 b=H1UGKqNuU8Hvn+XXMAz8TlHD73x4TgyLTvLutFBzhq6FxtPw1KTHj3StsWgr6VyhGznmCbymEyMnjLku2U1mZPrkLHs0NKyw5HkC/2Rrgw5w9d41myMvMoI3o/SZpu5jTyarZg1EtZM45AN7gSE9l+r1v11/9azC7T+Fzxy8/hK5FWOfSQMLlYAk4s1yGEs6g3TZaNe6X0PRQW9muU5rrd2BGUr/pRozfuOlXBCdn1cVwED4nLG2H4vmoRy/pDICMj60AFc8XFbgbjL1rt/MTmeWopnrZVAWXnxGx93Y+NMwLUREiIIHAcxbRvCcKgKOQR3c6OCAv+7hDb3fnSJM6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2871.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 12:01:49 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 12:01:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v1 07/22] powerpc/ftrace: Use patch_instruction() return
 directly
Thread-Topic: [PATCH v1 07/22] powerpc/ftrace: Use patch_instruction() return
 directly
Thread-Index: AQHYP4vPGkUo3THR/0i3/gMUYPH6cKz1We0AgADgXQCAGKQWgA==
Date: Wed, 4 May 2022 12:01:49 +0000
Message-ID: <b7e8ffec-e13f-a423-4baf-b13cb8b5ad41@csgroup.eu>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
 <b4505e936e1aee411f7132a27791cf138102f35f.1648131740.git.christophe.leroy@csgroup.eu>
 <1650262058.altfknhzto.naveen@linux.ibm.com>
 <20220418154418.72ccc00c@gandalf.local.home>
In-Reply-To: <20220418154418.72ccc00c@gandalf.local.home>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 847a7c63-43c9-4681-c13e-08da2dc5deca
x-ms-traffictypediagnostic: PR0P264MB2871:EE_
x-microsoft-antispam-prvs: <PR0P264MB28712A79310D99B08FDB3E8DEDC39@PR0P264MB2871.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GsMpkkYJUjC6dW0QlMz5SQnjMRupN4zHxa4LFmE5+AUJr46jBDDVIQKr6blmCSHMUF1VrRMc1BDjDKKqtZivboa2aXhQbKZEABsFFB5G7zoTYjeNnQtaNEAr4n/H05/Nh3mXqlk4kyxG5kZd9le4cHDpFccVcLcCfx699b1yz5RcNQgGQl30jrFHZlDaMsQmGPB//zxviURg/V2oZJcmasY/mD3I7b/9FhXXMbPMynR5bBMF0ENklQFcYfSSHeLw8TYFTakAjQJFsGyYZ5hRB3CHoZgZ6jT+oDsH/BCZQeYsc+fSLFCyo8WSdijEvi5oPJy4tim5y9pyCMomMYXwn9BWCgPzvuytjb4erJ7rkM4OUMfksAEaWb+O3zBLWt9seWMiDqD181AR2vLk7/gAHefU+iSsKrSZ9lh2kP3/zm3el5v9folGYmk9R3uahDrYJ9Q2O5P12b057JvoimPWFjVPKj+3ZCmsUMVZJuLXSgx9pp3CIe3N2criMrvCCvub+IxqcPqE2Vw1ZUBhUI1JrymyYsUjWMJn81b5+q6RlyqprSdcH/niTqC+pjzYNHm8e0PA4nqwxeWcH3b9G+2TMMaBHpsR4GCgSaRz2OgJSDFET6cX6d4jv5KarsczpQ57VyG7bqYUpHN5yFAwx1cPcnQP7CyHhOSKBGS8x4GLjcXAnFtbADhq4xsWGQOY7zj8u/9al/j0DbiQtZ45zryDi396nX2F1cvYXVFkEI5Imm5t+nI/WXkVG1RCBL/8pZ0wNzhvlHc85SVRPfRINxOatg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(44832011)(122000001)(66946007)(66556008)(76116006)(66446008)(64756008)(86362001)(5660300002)(66476007)(4326008)(31696002)(91956017)(8676002)(38100700002)(38070700005)(6506007)(6512007)(31686004)(71200400001)(2616005)(26005)(2906002)(316002)(186003)(66574015)(83380400001)(6486002)(110136005)(508600001)(54906003)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MENwb3VhZGYzR0dLRXJKQ20vMkhxdmZ4V0RsZCtkYVlpeU5FWnVYbmx3cXhz?=
 =?utf-8?B?RFJEUXlVMzB2dzNoOGxrT292eHo3V0x2Y2dndHJoQjZVeTc0UkNtdkJXdXRU?=
 =?utf-8?B?RjhaTkhac2NFdDlLU3hoTFZFMnpadXVSdU4xK1ZzbjMvZGJnWmNOM080V2xX?=
 =?utf-8?B?TXJ4a2hzWmFUbWlIZytzdFpIV2VUQ1RBTWdMOG52NjRkeGhWdTlLR0hzUHFz?=
 =?utf-8?B?SENUaGlBMTd5Mk8zVlBpNnVIaHI3dC9tOWJ2MXFQL0cybEppQUlWYTlkSEEz?=
 =?utf-8?B?U0tKUHZzYWl5UXJuMG4xd1Z3UEc5blFVS2FxTUtlZ2JXK2JHM21vNzlwb2tM?=
 =?utf-8?B?SnB0bGtkUllWTXQ2bXJmOWdmNWRnQUZza3JEQVB2cWl2QVZUUElZb0F2WldU?=
 =?utf-8?B?Tkt4dlJ0MDhoRE9ZN0YrakNZV3FaLytXL3IvV3JYQTFVWjJmaGNXN2xZM0Jy?=
 =?utf-8?B?UU9md2xTaGdyYjJmVWxaUG5hQ2lPYnp1WTNnbFY4R3VVMjdvRGtsQnBtbVlE?=
 =?utf-8?B?TkgxWXoyb0pKOXowbjd6VUxadUs1YUlsMk9tZ2tPVWZuMlVKYjdidnMrYzZY?=
 =?utf-8?B?eG8vNUI5dXI4VEhWcVVEUzF2aDRSaHdUNWJ0ZHpKQy9jck4rQU1NRXVhN0ln?=
 =?utf-8?B?M0VvQzZGTEtTSElEaGxITWNSZ08wVE9LTWM5K0RVY0tPY05lUE5BYVJnNTVh?=
 =?utf-8?B?elljZkpncUNzWmVqam0yRVVSOEtlN01pYWowRGtHOVJLc2JLQVgwam5wK2JW?=
 =?utf-8?B?ajB1SVNlMit6ME9uTkVkc1BJaG00ZmFsYklIRDBRdkVxUFdrR0UxSUtLdDB3?=
 =?utf-8?B?ZjRmSXFNMHp1eVBFV3lFS1cyTnMzQkxRTjEzd29Yb0FsRDduNEhpdDdWRUV5?=
 =?utf-8?B?ZVJMQVZzSTc4UDJPeGRiQmx1LzFGdUR4QlQ5MzdLS1pvU1ZxQW9ZUFo0QWpI?=
 =?utf-8?B?RTZxbVg3bWw3c2oyQnNpWVZJTmUvdm50VHBUVi93ZHpUcnBrdkUwVnk1aDB4?=
 =?utf-8?B?eTFPbjRRZ0E5RGFoUGFNdTFjYVBrSmVQdUJQQ0VNZFByMmlEL0MvRVgzeHdX?=
 =?utf-8?B?MDdBR0wvOHZqRFVjNkJXdDI1eUV1YS90bWgwVWNtcFNndHBmUWhlaG91Z2Mx?=
 =?utf-8?B?d2M3S2VhRWNZL2lUYzhjdWlpK29xTnJRQjJ5TkEwT0RLRHpZM2YycEM0ZklG?=
 =?utf-8?B?U2w1eUpmcUNUVXh1U2FHVkE2UVQ2SWpHYk1HWnZja3hHSjRRNE45VU9KOFBj?=
 =?utf-8?B?MFNHNWlJTkRMa0dPRXRDRTNVWmtxT0RBcHRQdDJDd21IUTlxTGNwQXQ3U042?=
 =?utf-8?B?VFhCQThKd2xpTis0b0pjWEtUVW5PaEVZMTR4MkhkMG1VMWdoRXBiTEM2WURk?=
 =?utf-8?B?SHIxTUlZdk05bFFzdUh3c1J5cTRGRzYxd3N3N2Rja0ZXYW9ub3VnSUV1czRv?=
 =?utf-8?B?UVg5WFBHRzlhZXNUMjBjbTJteHlqOVhnRzZxdDNWejhhZU5qNUhGWFYrbEE0?=
 =?utf-8?B?c3pjOVVoRy8ybzQ3VzVUSU0ya2k3SUdWVUJiUTBNV0ViYjR1VjBFOWtkSDIz?=
 =?utf-8?B?T3pIeVpXY2FoRDRlVnp2ay9QdVAraUp5MFlVcW1UMlVESE9nWjdHM1JOdGpS?=
 =?utf-8?B?Zkd3SS9FMElkOU80RER5ZnA0ZTA2SjhPVlJBa0JIa1Q2ak1lVUlvRGtoWWJl?=
 =?utf-8?B?dW5mb29NeFA5N3JhWGtkUHhWa0UrVGI4NmZ3VE5mb0dTUjZKWUxIVlBFNUxp?=
 =?utf-8?B?bUZGUkd3VzY0UUhaSkRGUjgveUNvdGpEenFTbDYxOFoxckpjSEFKL3lBbUFk?=
 =?utf-8?B?Ukd6VzlUMFhHcGVBU3Nka3hxUWljVEZGY3pYWkxZN2RLUjllRWNLelcrSVA5?=
 =?utf-8?B?VjVXUWVaUS8yZW9RcSsxNXlFNHhiMlR0TjhTcFV0K3JYWHBoWmE3K3RpNzJ3?=
 =?utf-8?B?dkJrSGRzb084WUd4UzBpTWRRbVd5VFlzaTFCNHdFQnVGSjJJaTZ2SEt1MDYx?=
 =?utf-8?B?aVJhd3Z3YzZxSlpEcm12dFRNL3h2K1cwYThFdlZIL0ViSGUzT3pXT01Ldkky?=
 =?utf-8?B?VzVaNUx2eFJXV01hVGJFK3kvdG9GcVdNcGs1M2UwQUhxMGprWnZnMUpqcG92?=
 =?utf-8?B?d1pGa1pYRFpwVlJQNGRoT1QzazNrUXlQajlaT3VVZ2NhaXVrMW1NRGJDckFH?=
 =?utf-8?B?ai8zcW1pWmpkSHE0THNmWmhwblNYWVdQT3RQQ2g5blRpODJ3c0Q0a0grWFZ0?=
 =?utf-8?B?bWNRR3lsOE1SSVFSbDdmdXc4TnBVR0c4bWR1R09nRDZ6cnlQK1dSVEdnNWJ4?=
 =?utf-8?B?ZjhmRlBlL2hJM0pYVEVxT2JFUENXU2ltakc2N2s4R2JvSDRWMW5wMHQ3OExu?=
 =?utf-8?Q?+4ZXkloTNTtmEl9LGj0kmeE7qwvIM9Z/oK7jE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08757EE514A15947863FC621C8E0CCD5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 847a7c63-43c9-4681-c13e-08da2dc5deca
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 12:01:49.5358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x34L690Vy5f+4NO4M6pnVLZxuyo8jo5ZdF8lo+6q6OYjzhNiA5hatKQ5R2P4jxnLY9u6Gjl3EM8RBmEXEYGG3xAj09TuLFPaE0btgKZbyRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2871
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzA0LzIwMjIgw6AgMjE6NDQsIFN0ZXZlbiBSb3N0ZWR0IGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgMTggQXByIDIwMjIgMTE6NTE6MTYgKzA1MzANCj4gIk5hdmVlbiBOLiBSYW8iIDxu
YXZlZW4ubi5yYW9AbGludXgudm5ldC5pYm0uY29tPiB3cm90ZToNCj4gDQo+Pj4gLS0tIGEvYXJj
aC9wb3dlcnBjL2tlcm5lbC90cmFjZS9mdHJhY2UuYw0KPj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9r
ZXJuZWwvdHJhY2UvZnRyYWNlLmMNCj4+PiBAQCAtNzgsMTAgKzc4LDcgQEAgZnRyYWNlX21vZGlm
eV9jb2RlKHVuc2lnbmVkIGxvbmcgaXAsIHBwY19pbnN0X3Qgb2xkLCBwcGNfaW5zdF90IG5ldykN
Cj4+PiAgIAl9DQo+Pj4NCj4+PiAgIAkvKiByZXBsYWNlIHRoZSB0ZXh0IHdpdGggdGhlIG5ldyB0
ZXh0ICovDQo+Pj4gLQlpZiAocGF0Y2hfaW5zdHJ1Y3Rpb24oKHUzMiAqKWlwLCBuZXcpKQ0KPj4+
IC0JCXJldHVybiAtRVBFUk07DQo+Pj4gLQ0KPj4+IC0JcmV0dXJuIDA7DQo+Pj4gKwlyZXR1cm4g
cGF0Y2hfaW5zdHJ1Y3Rpb24oKHUzMiAqKWlwLCBuZXcpOw0KPj4NCj4+IEkgdGhpbmsgdGhlIHJl
YXNvbiB3ZSB3ZXJlIHJldHVybmluZyAtRVBFUk0gaXMgc28gdGhhdCBmdHJhY2VfYnVnKCkgY2Fu
DQo+IA0KPiBUaGF0IGlzIGNvcnJlY3QuDQo+IA0KPj4gdGhyb3cgdGhlIHJpZ2h0IGVycm9yIG1l
c3NhZ2UuIFRoYXQgd2lsbCBjaGFuZ2UgZHVlIHRvIHRoaXMgcGF0Y2gsDQo+PiB0aG91Z2ggSSdt
IG5vdCBzdXJlIGhvdyBtdWNoIGl0IG1hdHRlcnMuIC1FRkFVTFQgYW5kIC1FUEVSTSBzZWVtIHRv
DQo+PiBwcmludCBhbG1vc3QgdGhlIHNhbWUgZXJyb3IgbWVzc2FnZS4NCj4gDQo+IEluIHRoZXNl
IGNhc2VzIGl0IGhlbHBzIHRvIGtub3cgdGhlIHR5cGUgb2YgZmFpbHVyZSwgYXMgdGhlIHdheSB0
byBkZWJ1ZyBpdA0KPiBpcyBkaWZmZXJlbnQuDQo+IA0KPiAtRUZBVUxUOiBJdCBmYWlsZWQgdG8g
cmVhZCBpdCB0aGUgbG9jYXRpb24uIFRoaXMgbWVhbnMgdGhhdCB0aGUgbWVtb3J5IGlzDQo+IGxp
a2VseSBub3QgZXZlbiBtYXBwZWQgaW4sIG9yIHRoZSBwb2ludGVyIGlzIHdheSBvZmYuDQo+IA0K
PiAtRUlOVkFMOiBNZWFucyB0aGF0IHdoYXQgd2FzIHJlYWQgZGlkIG5vdCBtYXRjaCB3aGF0IHdh
cyBleHBlY3RlZCAodGhlIGNvZGUNCj4gd2FzIGFscmVhZHkgdXBkYXRlZCwgcG9pbnRpbmcgdG8g
dGhlIHdyb25nIGxvY2F0aW9uLCBvciBzaW1wbHkgdGhlDQo+IGNhbGN1bGF0aW9uIG9mIHdoYXQg
dG8gZXhwZWN0IGlzIGluY29ycmVjdCkuDQo+IA0KPiAtRVBFUk06IE1lYW5zIHRoZSB3cml0ZSBm
YWlsZWQuIFdoYXQgd2FzIHJlYWQgd2FzIGV4cGVjdGVkLCBidXQgdGhlDQo+IHBlcm1pc3Npb25z
IHRvIHdyaXRlIGhhdmUgbm90IGJlZW4gdXBkYXRlZCBwcm9wZXJseS4NCj4gDQo+IERpZmZlcmVu
dGlhdGluZyB0aGUgdGhyZWUgaXMgY3J1Y2lhbCB0byBsb29raW5nIGF0IHdoZXJlIHRoZSBpc3N1
ZSBsaWVzDQo+IHdoZW4gYW4gZnRyYWNlX2J1ZygpIHRyaWdnZXJzLg0KPiANCg0KDQpBcHBhcmVu
dGx5IG5vIGNhbGxlciByZWFsbHkgY2FyZSBhYm91dCB0aGUgdmFsdWUgcmV0dXJuZWQgYnkgDQpw
YXRjaF9pbnN0cnVjdGlvbigpLCB0aGUgb25lcyB3aG8gY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBq
dXN0IGNoZWNrIHRoYXQgDQppdCdzIG5vdCAwLg0KDQpTbyB0aGUgbW9zdCBwZXJmb3JtYW50IHdv
dWxkIGJlIHRvIGhhdmUgcGF0Y2hfaW5zdHJ1Y3Rpb24oKSByZXR1cm4gDQotRVBFUk0gaW5zdGVh
ZCBvZiAtRUZBVUxUIGluIGNhc2Ugb2YgZmFpbHVyZS4NCg0KQ2hyaXN0b3BoZQ==
