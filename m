Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C51489533
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 10:28:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXT5c2zQhz30MK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 20:28:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::627;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::627])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXT552kT6z2xrr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 20:27:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEu/Rfjal7KU1isFiWwstqrVBA25m1lC6iQozxNsR2zEiqmaB+z1mqVZHo2uXArHDSVMvzRZZPPQbC1HSoUX7JAJQudVKWqQ1t/E+AnhrrDHyJaGhdghHD3FmEXlv1ZtcKlOFhldCHZ1wGehfksc+ZmfCpx184dQ3tPFKwyyNqnw00reXlFe7chn+zPf/WDaPm2wPFWWODybeai6fMd/i7Jq/9qoPBYXkJUAw/UfsYTBwJG7aHPP65E19jzY+8H44YwTxYUeI+pQp5XmOi8XDUpopm69WW4h/TaxrauG3oWOMdM7L20L8jYI77rDw/BYQ+T5TRGCRT5h0PoePBqt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xY4d7NiB4EyWifuXiQaDK9ZfpiN2jf2k2IsHbI3uZHk=;
 b=bfoWJs8WDtHjKy4AzaB7U991hVqDI9HZUJaB7TYxvT5QXQknLllRlB/4MMXsPE4J3zTtSs23vzSWpkcDrLAfcBF3q4C1seBszCODV+g5+4K9U3nKlfQmiKvygMpGlFG6knn+AiPi+qOtbOOq3ujItrXm27AI+o/oE71GnTuYtx5F63PsYHfoP/2C5/33xGqmEBB2UC1OjxwiUxTjwD1WGSAaelU0SwK/zgHRmtmasg/MQzS0QSjNs4TcSMnxPt5Zj7UGdN/2vzfPWw5KDK5+AfaBO08LuEI+JYkmffwUeTYJgnKkLsuC3EhyG9MdffbptKKAhGrpQePtgf6tEk5cEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0824.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:18::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 09:27:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%4]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 09:27:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Daniel Borkmann <daniel@iogearbox.net>, Alexei
 Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH 03/13] powerpc/bpf: Update ldimm64 instructions during
 extra pass
Thread-Topic: [PATCH 03/13] powerpc/bpf: Update ldimm64 instructions during
 extra pass
Thread-Index: AQHYAvMB1UD8Kc4tb0+Z5dnbMY5qE6xcArAA
Date: Mon, 10 Jan 2022 09:27:33 +0000
Message-ID: <09ec6f6f-291f-a6be-24e4-818033178ed2@csgroup.eu>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <7cc162af77ba918eb3ecd26ec9e7824bc44b1fae.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <7cc162af77ba918eb3ecd26ec9e7824bc44b1fae.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80d400fa-3a8a-4473-1a34-08d9d41b6e6e
x-ms-traffictypediagnostic: MRXP264MB0824:EE_
x-microsoft-antispam-prvs: <MRXP264MB0824DE257927F5B110809C24ED509@MRXP264MB0824.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r418OQE8LiBXHSzj0Hg6bEX9FEg6aJfakAJyYAPQzThjHdy6Nm1Awy2XMAfBbSNeCqK6zLczWPdu9/P7LNg2xrvCooF1JBjhvKcKQoNF1kxnfObZwFCgCGoJiEbgDTew+IvcJan2dyzJ8wflWBLAz2KNeOlMdZfwaOL+d4p51hYxCQ1TXVpsoTsTaVWjl8MIgL3TY6TWKd76qVdVKcUdsiu5ktcO06q5Z2S3BtJYmkmmvnCxykjxvtdT3zDcqyHC9bLIsM58w7iFVjVMUqqDpgdZjIP1NBgfunjbRm0jAnwF21kbFo6MJ5PoA2FUnQjnD6kfZWOE45kSomOsvy1kOj2j67dT/B2gRVW2pVAZJLudDr6aEV9ylgMvaBIWC5D8/w2H+T6BKsU9mjpSAS4z35ZgeUr+uT05qRPLdjlAF84HG4s3vmD0+/j+Tv2sLk3RpivKUpS4wkBTvWwTS/yHY35khYf3P4zSvOrKNyG7Ex7uLvVvrfaV8Lzqc+jyV1JwRs/uv1Bx1WnOB77hBsG9pqTHaiSlEHkWN8dt0owwKbrphkAEkzjVtjlkfXrHkFxhlYSDMnwpzcUo0BNvsV+wB8JZ27uyV4flaEmp6hq7sH00ewPXpidQNxiI2uYGbz5k9N8cqcgD1XHs3RRnqQC4B5D15ZKG6Eq71a0p61Q4dxEWcpTxNa+Ey+HLYbHOTabFuosQkqHXcyA5y98lJObGWHsb37fSONSCwO42L+Cirk89fi5h0RxrqbxH7VvQF337PeFL3aEDuuzwtxViyRiLnw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(66556008)(4326008)(26005)(31696002)(8676002)(66574015)(316002)(83380400001)(54906003)(76116006)(5660300002)(66446008)(508600001)(7416002)(66476007)(8936002)(6512007)(86362001)(6506007)(186003)(110136005)(66946007)(2616005)(31686004)(91956017)(15650500001)(64756008)(44832011)(38070700005)(122000001)(38100700002)(6486002)(71200400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHRXU0FWdEhpZlpJYVdzaXFMNHNHRGpCNmYrUHVGUjdBTVVyMW5FMkJDWkJx?=
 =?utf-8?B?Q25VZDhKSXZ3NEFDc0JOOFgxbFZzRDkyZEJqQm8rbnpwU1RKcUdOZXF0K0l4?=
 =?utf-8?B?Zmt1YUlsUDhySHFaUTZYT2YrVWZLWWpUV091WUo1UjBKci9iSDVGdmpmR0ZP?=
 =?utf-8?B?MnkzbEVpVDZnU2YzYzEyOEZmOXFoSGxldERyZmV6cEpHZEFxRWhJei80dTVD?=
 =?utf-8?B?NjYvSnpxblRYaTEwQzY5M1kwbTBiUnNjTVQwRmN1NU5nRHl0SzNvVXRFVDR6?=
 =?utf-8?B?SkJJQ1Bwb1BMblNWTmMyOVBjSk8xNmVobEp1aVoydzg3WFhKQWcyZGQ0amFl?=
 =?utf-8?B?RXZZNHlTVkFEZjdnTGdTZVdQNnB0UG9Ic0QwWFRROEJrc0RlU2grQmsyekFO?=
 =?utf-8?B?WW1rS0JCUnpGTDJ1ckZwK3JhSGRURGZhZmRCNWc1cWJPWWx6dEoxcEJuakJw?=
 =?utf-8?B?MFViRWRldHFoUjJUUm1NSi9QN3NMNFl6UXB4Z1Y3WUllcGJ6RFkvWk10Z3dq?=
 =?utf-8?B?RzNXN2V0QUxsVVF2M3BsbDNhRnB0YXdzR0tLQlkvN1cydVUxeVhjOUptbFov?=
 =?utf-8?B?SWdLWHJxSFBqWkN5TmhBbm0xMzc0RE5SODJaTU5ia01BQS9LYU5SUURVMkk0?=
 =?utf-8?B?cFdtSkhpNUd0Mmt6SE00RUxrQUM1RDlqV1pxMHNVTkcxaEcwOTkrVkc2SzRz?=
 =?utf-8?B?TmhCejFqRUR0MkJBSlpYVkwrK2xBZ1VuOWw3blJHZlBZM2pHbDBFeFhROGdh?=
 =?utf-8?B?cTQ0RkVyMTlzTGsyeTl4NkNzUDc5cWM1aytCRTlSK0x6eVQzTHZMMDhCN3hH?=
 =?utf-8?B?a2xlbTFBUHovT3NmSVg5RlhzT0kzbDZncDlvdFh3dmNiL2tEZE13TjJOcmx1?=
 =?utf-8?B?SDF0VnVFV2diaGVheE9ZQnJRdVNmRDVNS283WU9aRUtPamFQYmNuTWVUdEJw?=
 =?utf-8?B?bUJ2YkErTWVVTUR4OG0rTkpYM05aMTBNWjQwaGxPQldzTlpRRWNBZHl2cmps?=
 =?utf-8?B?aXpab0x1YWVwSHlGK3FBQnRXRVZjN1JDWm5ValhZNVBNK0pMb3JXUkx1dE41?=
 =?utf-8?B?cU50dzJGaVBqdkV4aU9vYklMQ1JzTDBUZ0NqQXpjNk9jZFlER0Q3cFdGY2Nr?=
 =?utf-8?B?alFBd2FJR2pKeldIT2p1L0RqaWhCSURmVytZeGx1Tnp5MWhXeDNSUnZ3WkV1?=
 =?utf-8?B?YU9tL0U0M2V1WkZ1cnUyK0NKclFxeFZiNmphZWppRElMRHh6b0RqL2ZNSEpP?=
 =?utf-8?B?c3NRUEpMU2NkRnF1L2YzeWZkb1o0dkZjZ1BzV1pEd2F5dkliSWNEYXcxUWhk?=
 =?utf-8?B?UUZCbTMzSk5UT3hDdHpHQkxRQVoxcXlXNGZkd1dTT3NOSDlFaGdvUnMvMVdV?=
 =?utf-8?B?Uk83Z3RNL3JQditweHB5QWIxV2ZkQkpXU20yblhnd1hlL1JtVFMxZWs2UDdY?=
 =?utf-8?B?VGZ2dWJZaHdYOGNyVnBWS0x0M0RJREVOczR1TEpWbnZRTjBhbXFwSHg5WVNk?=
 =?utf-8?B?L3FHekNrWHVVbkp4OGVML1FuOEFvTGJkNzV5L0sxM1NWMDVhdERoQXJMVVdh?=
 =?utf-8?B?clRwanAydTd4WHBhVXBqYys0bnVFR3BKc3lON2FzenlaOWVpcVRvVjJ2dXU2?=
 =?utf-8?B?eWQ0T2RjcCtjTVVKTTdkTTd2d1UzTkkwNkcrODhEcEJVT2lkTG1oaFQvcE1q?=
 =?utf-8?B?NWVtSXByMm9xR2gxcGJXZzFLc0JMRVY0OS8wNGE1UXAyN0F0azlrNktjWmhP?=
 =?utf-8?B?bWszdWdSUlEyb0ptZTk2MHlpTGlNNFdCVXF5aUd4ZHErQitLN2xhekNnNnE0?=
 =?utf-8?B?WGZTYkY3QWk3Tkl6eDRMc0U4eU14a3g1am84cDZheWE2aUdtOXBKNHdGdTRL?=
 =?utf-8?B?MC85Si9VbEg0cUJFeEgvNTJDOGZiL3QyaVlPSzdVS2Z1RTJkaFZqNEkwc2lx?=
 =?utf-8?B?K0FvdnFUYWlQem5RRllRa2RYZWQ3ZEo4U3F0Q0lLQ3BuRm1HemxHby93V0JB?=
 =?utf-8?B?REYybkpVYWRRaS9HWFJRM2JnSGNuZUJlbXRTdWFJQjNzcFhMNjdxdnJ6K0dI?=
 =?utf-8?B?eDVzdHJkdGJ0ODZpRHJPNmY5OC95MW40OWlVMGxyRUR0TVZvWmZ3RXM4WDBS?=
 =?utf-8?B?RE5KS1FqRjBmdWV5a2FLYXI1VWl4SUUrcW56Tk5aU21KQUtZTTMzbENma09q?=
 =?utf-8?B?WnljNHd2OGQxUHh3YzhXVnJselVCeUdHbDk4T2FLT053VHJkS0dnUGM4aFI3?=
 =?utf-8?Q?TFhKQWnz6og6a3UE55h9o/CO0v7FkYwEV6+iKNYYk0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B268EA70E6EC90498C58674EEFEA6FF9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d400fa-3a8a-4473-1a34-08d9d41b6e6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 09:27:33.0925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j4AT2RDySLgbvFMwiDaDtdz6JkxdY93qEJSoxfLhoAMtuYQK97FRmr34+jE6mjn+Hvh/sjQ2sBuGw2GfnSnrTdtylR1hlSotLbQqvefS3/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0824
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
Cc: "ykaliuta@redhat.com" <ykaliuta@redhat.com>,
 "johan.almbladh@anyfinetworks.com" <johan.almbladh@anyfinetworks.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "song@kernel.org" <song@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzAxLzIwMjIgw6AgMTI6NDUsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
VGhlc2UgaW5zdHJ1Y3Rpb25zIGFyZSB1cGRhdGVkIGFmdGVyIHRoZSBpbml0aWFsIEpJVCwgc28g
cmVkbyBjb2RlZ2VuDQo+IGR1cmluZyB0aGUgZXh0cmEgcGFzcy4gUmVuYW1lIGJwZl9qaXRfZml4
dXBfc3VicHJvZ19jYWxscygpIHRvIGNsYXJpZnkNCj4gdGhhdCB0aGlzIGlzIG1vcmUgdGhhbiBq
dXN0IHN1YnByb2cgY2FsbHMuDQo+IA0KPiBGaXhlczogNjljMDg3YmE2MjI1YjUgKCJicGY6IEFk
ZCBicGZfZm9yX2VhY2hfbWFwX2VsZW0oKSBoZWxwZXIiKQ0KPiBDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZyAjIHY1LjE1DQo+IFNpZ25lZC1vZmYtYnk6IE5hdmVlbiBOLiBSYW8gPG5hdmVlbi5u
LnJhb0BsaW51eC52bmV0LmlibS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9uZXQvYnBm
X2ppdF9jb21wLmMgICB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+ICAgYXJj
aC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAzMi5jIHwgIDYgKysrKysrDQo+ICAgYXJjaC9wb3dl
cnBjL25ldC9icGZfaml0X2NvbXA2NC5jIHwgIDcgKysrKysrLQ0KPiAgIDMgZmlsZXMgY2hhbmdl
ZCwgMzUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcC5jIGIvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0
X2NvbXAuYw0KPiBpbmRleCBkNmZmZGQwZjIzMDlkMC4uNTZkZDFmNGUzZTQ0NDcgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMNCj4gKysrIGIvYXJjaC9wb3dl
cnBjL25ldC9icGZfaml0X2NvbXAuYw0KPiBAQCAtMjMsMTUgKzIzLDE1IEBAIHN0YXRpYyB2b2lk
IGJwZl9qaXRfZmlsbF9pbGxfaW5zbnModm9pZCAqYXJlYSwgdW5zaWduZWQgaW50IHNpemUpDQo+
ICAgCW1lbXNldDMyKGFyZWEsIEJSRUFLUE9JTlRfSU5TVFJVQ1RJT04sIHNpemUgLyA0KTsNCj4g
ICB9DQo+ICAgDQo+IC0vKiBGaXggdGhlIGJyYW5jaCB0YXJnZXQgYWRkcmVzc2VzIGZvciBzdWJw
cm9nIGNhbGxzICovDQo+IC1zdGF0aWMgaW50IGJwZl9qaXRfZml4dXBfc3VicHJvZ19jYWxscyhz
dHJ1Y3QgYnBmX3Byb2cgKmZwLCB1MzIgKmltYWdlLA0KPiAtCQkJCSAgICAgICBzdHJ1Y3QgY29k
ZWdlbl9jb250ZXh0ICpjdHgsIHUzMiAqYWRkcnMpDQo+ICsvKiBGaXggdXBkYXRlZCBhZGRyZXNz
ZXMgKGZvciBzdWJwcm9nIGNhbGxzLCBsZGltbTY0LCBldCBhbCkgZHVyaW5nIGV4dHJhIHBhc3Mg
Ki8NCj4gK3N0YXRpYyBpbnQgYnBmX2ppdF9maXh1cF9hZGRyZXNzZXMoc3RydWN0IGJwZl9wcm9n
ICpmcCwgdTMyICppbWFnZSwNCj4gKwkJCQkgICBzdHJ1Y3QgY29kZWdlbl9jb250ZXh0ICpjdHgs
IHUzMiAqYWRkcnMpDQo+ICAgew0KPiAgIAljb25zdCBzdHJ1Y3QgYnBmX2luc24gKmluc24gPSBm
cC0+aW5zbnNpOw0KPiAgIAlib29sIGZ1bmNfYWRkcl9maXhlZDsNCj4gICAJdTY0IGZ1bmNfYWRk
cjsNCj4gICAJdTMyIHRtcF9pZHg7DQo+IC0JaW50IGksIHJldDsNCj4gKwlpbnQgaSwgaiwgcmV0
Ow0KPiAgIA0KPiAgIAlmb3IgKGkgPSAwOyBpIDwgZnAtPmxlbjsgaSsrKSB7DQo+ICAgCQkvKg0K
PiBAQCAtNjYsNiArNjYsMjMgQEAgc3RhdGljIGludCBicGZfaml0X2ZpeHVwX3N1YnByb2dfY2Fs
bHMoc3RydWN0IGJwZl9wcm9nICpmcCwgdTMyICppbWFnZSwNCj4gICAJCQkgKiBvZiB0aGUgSklU
ZWQgc2VxdWVuY2UgcmVtYWlucyB1bmNoYW5nZWQuDQo+ICAgCQkJICovDQo+ICAgCQkJY3R4LT5p
ZHggPSB0bXBfaWR4Ow0KPiArCQl9IGVsc2UgaWYgKGluc25baV0uY29kZSA9PSAoQlBGX0xEIHwg
QlBGX0lNTSB8IEJQRl9EVykpIHsNCj4gKwkJCXRtcF9pZHggPSBjdHgtPmlkeDsNCj4gKwkJCWN0
eC0+aWR4ID0gYWRkcnNbaV0gLyA0Ow0KPiArI2lmZGVmIENPTkZJR19QUEMzMg0KPiArCQkJUFBD
X0xJMzIoY3R4LT5iMnBbaW5zbltpXS5kc3RfcmVnXSAtIDEsICh1MzIpaW5zbltpICsgMV0uaW1t
KTsNCj4gKwkJCVBQQ19MSTMyKGN0eC0+YjJwW2luc25baV0uZHN0X3JlZ10sICh1MzIpaW5zbltp
XS5pbW0pOw0KPiArCQkJZm9yIChqID0gY3R4LT5pZHggLSBhZGRyc1tpXSAvIDQ7IGogPCA0OyBq
KyspDQo+ICsJCQkJRU1JVChQUENfUkFXX05PUCgpKTsNCj4gKyNlbHNlDQo+ICsJCQlmdW5jX2Fk
ZHIgPSAoKHU2NCkodTMyKWluc25baV0uaW1tKSB8ICgoKHU2NCkodTMyKWluc25baSArIDFdLmlt
bSkgPDwgMzIpOw0KPiArCQkJUFBDX0xJNjQoYjJwW2luc25baV0uZHN0X3JlZ10sIGZ1bmNfYWRk
cik7DQo+ICsJCQkvKiBvdmVyd3JpdGUgcmVzdCB3aXRoIG5vcHMgKi8NCj4gKwkJCWZvciAoaiA9
IGN0eC0+aWR4IC0gYWRkcnNbaV0gLyA0OyBqIDwgNTsgaisrKQ0KPiArCQkJCUVNSVQoUFBDX1JB
V19OT1AoKSk7DQo+ICsjZW5kaWYNCg0KI2lmZGVmcyBzaG91bGQgYmUgYXZvaWRlZCBhcyBtdWNo
IGFzIHBvc3NpYmxlLg0KDQpIZXJlIGl0IHNlZW1zIHdlIGNvdWxkIGVhc2lseSBkbyBhbg0KDQoJ
aWYgKElTX0VOQUJMRUQoQ09ORklHX1BQQzMyKSkgew0KCX0gZWxzZSB7DQoJfQ0KDQpBbmQgaXQg
bG9va3MgbGlrZSB0aGUgQ09ORklHX1BQQzY0IGFsdGVybmF0aXZlIHdvdWxkIGluIGZhY3QgYWxz
byB3b3JrIA0Kb24gUFBDMzIsIHdvdWxkbid0IGl0ID8NCg0KDQo+ICsJCQljdHgtPmlkeCA9IHRt
cF9pZHg7DQo+ICsJCQlpKys7DQo+ICAgCQl9DQo+ICAgCX0NCj4gICANCj4gQEAgLTIwMCwxMyAr
MjE3LDEzIEBAIHN0cnVjdCBicGZfcHJvZyAqYnBmX2ludF9qaXRfY29tcGlsZShzdHJ1Y3QgYnBm
X3Byb2cgKmZwKQ0KPiAgIAkJLyoNCj4gICAJCSAqIERvIG5vdCB0b3VjaCB0aGUgcHJvbG9ndWUg
YW5kIGVwaWxvZ3VlIGFzIHRoZXkgd2lsbCByZW1haW4NCj4gICAJCSAqIHVuY2hhbmdlZC4gT25s
eSBmaXggdGhlIGJyYW5jaCB0YXJnZXQgYWRkcmVzcyBmb3Igc3VicHJvZw0KPiAtCQkgKiBjYWxs
cyBpbiB0aGUgYm9keS4NCj4gKwkJICogY2FsbHMgaW4gdGhlIGJvZHksIGFuZCBsZGltbTY0IGlu
c3RydWN0aW9ucy4NCj4gICAJCSAqDQo+ICAgCQkgKiBUaGlzIGRvZXMgbm90IGNoYW5nZSB0aGUg
b2Zmc2V0cyBhbmQgbGVuZ3RocyBvZiB0aGUgc3VicHJvZw0KPiAgIAkJICogY2FsbCBpbnN0cnVj
dGlvbiBzZXF1ZW5jZXMgYW5kIGhlbmNlLCB0aGUgc2l6ZSBvZiB0aGUgSklUZWQNCj4gICAJCSAq
IGltYWdlIGFzIHdlbGwuDQo+ICAgCQkgKi8NCj4gLQkJYnBmX2ppdF9maXh1cF9zdWJwcm9nX2Nh
bGxzKGZwLCBjb2RlX2Jhc2UsICZjZ2N0eCwgYWRkcnMpOw0KPiArCQlicGZfaml0X2ZpeHVwX2Fk
ZHJlc3NlcyhmcCwgY29kZV9iYXNlLCAmY2djdHgsIGFkZHJzKTsNCj4gICANCj4gICAJCS8qIFRo
ZXJlIGlzIG5vIG5lZWQgdG8gcGVyZm9ybSB0aGUgdXN1YWwgcGFzc2VzLiAqLw0KPiAgIAkJZ290
byBza2lwX2NvZGVnZW5fcGFzc2VzOw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL25ldC9i
cGZfaml0X2NvbXAzMi5jIGIvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAzMi5jDQo+IGlu
ZGV4IDk5N2E0N2ZhNjE1YjMwLi4yMjU4ZDM4ODZkMDJlYyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL25ldC9icGZfaml0X2NvbXAzMi5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9uZXQvYnBm
X2ppdF9jb21wMzIuYw0KPiBAQCAtMjkzLDYgKzI5Myw4IEBAIGludCBicGZfaml0X2J1aWxkX2Jv
ZHkoc3RydWN0IGJwZl9wcm9nICpmcCwgdTMyICppbWFnZSwgc3RydWN0IGNvZGVnZW5fY29udGV4
dCAqDQo+ICAgCQlib29sIGZ1bmNfYWRkcl9maXhlZDsNCj4gICAJCXU2NCBmdW5jX2FkZHI7DQo+
ICAgCQl1MzIgdHJ1ZV9jb25kOw0KPiArCQl1MzIgdG1wX2lkeDsNCj4gKwkJaW50IGo7DQo+ICAg
DQo+ICAgCQkvKg0KPiAgIAkJICogYWRkcnNbXSBtYXBzIGEgQlBGIGJ5dGVjb2RlIGFkZHJlc3Mg
aW50byBhIHJlYWwgb2Zmc2V0IGZyb20NCj4gQEAgLTkwOCw4ICs5MTAsMTIgQEAgaW50IGJwZl9q
aXRfYnVpbGRfYm9keShzdHJ1Y3QgYnBmX3Byb2cgKmZwLCB1MzIgKmltYWdlLCBzdHJ1Y3QgY29k
ZWdlbl9jb250ZXh0ICoNCj4gICAJCSAqIDE2IGJ5dGUgaW5zdHJ1Y3Rpb24gdGhhdCB1c2VzIHR3
byAnc3RydWN0IGJwZl9pbnNuJw0KPiAgIAkJICovDQo+ICAgCQljYXNlIEJQRl9MRCB8IEJQRl9J
TU0gfCBCUEZfRFc6IC8qIGRzdCA9ICh1NjQpIGltbSAqLw0KPiArCQkJdG1wX2lkeCA9IGN0eC0+
aWR4Ow0KPiAgIAkJCVBQQ19MSTMyKGRzdF9yZWdfaCwgKHUzMilpbnNuW2kgKyAxXS5pbW0pOw0K
PiAgIAkJCVBQQ19MSTMyKGRzdF9yZWcsICh1MzIpaW5zbltpXS5pbW0pOw0KPiArCQkJLyogcGFk
ZGluZyB0byBhbGxvdyBmdWxsIDQgaW5zdHJ1Y3Rpb25zIGZvciBsYXRlciBwYXRjaGluZyAqLw0K
PiArCQkJZm9yIChqID0gY3R4LT5pZHggLSB0bXBfaWR4OyBqIDwgNDsgaisrKQ0KPiArCQkJCUVN
SVQoUFBDX1JBV19OT1AoKSk7DQo+ICAgCQkJLyogQWRqdXN0IGZvciB0d28gYnBmIGluc3RydWN0
aW9ucyAqLw0KPiAgIAkJCWFkZHJzWysraV0gPSBjdHgtPmlkeCAqIDQ7DQo+ICAgCQkJYnJlYWs7
DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNo
L3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcDY0LmMNCj4gaW5kZXggNDcyZDRhNTUxOTQ1ZGQuLjNk
MDE4ZWNjNDc1YjJiIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29t
cDY0LmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXA2NC5jDQo+IEBAIC0z
MTksNiArMzE5LDcgQEAgaW50IGJwZl9qaXRfYnVpbGRfYm9keShzdHJ1Y3QgYnBmX3Byb2cgKmZw
LCB1MzIgKmltYWdlLCBzdHJ1Y3QgY29kZWdlbl9jb250ZXh0ICoNCj4gICAJCXU2NCBpbW02NDsN
Cj4gICAJCXUzMiB0cnVlX2NvbmQ7DQo+ICAgCQl1MzIgdG1wX2lkeDsNCj4gKwkJaW50IGo7DQo+
ICAgDQo+ICAgCQkvKg0KPiAgIAkJICogYWRkcnNbXSBtYXBzIGEgQlBGIGJ5dGVjb2RlIGFkZHJl
c3MgaW50byBhIHJlYWwgb2Zmc2V0IGZyb20NCj4gQEAgLTg0OCw5ICs4NDksMTMgQEAgaW50IGJw
Zl9qaXRfYnVpbGRfYm9keShzdHJ1Y3QgYnBmX3Byb2cgKmZwLCB1MzIgKmltYWdlLCBzdHJ1Y3Qg
Y29kZWdlbl9jb250ZXh0ICoNCj4gICAJCWNhc2UgQlBGX0xEIHwgQlBGX0lNTSB8IEJQRl9EVzog
LyogZHN0ID0gKHU2NCkgaW1tICovDQo+ICAgCQkJaW1tNjQgPSAoKHU2NCkodTMyKSBpbnNuW2ld
LmltbSkgfA0KPiAgIAkJCQkgICAgKCgodTY0KSh1MzIpIGluc25baSsxXS5pbW0pIDw8IDMyKTsN
Cj4gKwkJCXRtcF9pZHggPSBjdHgtPmlkeDsNCj4gKwkJCVBQQ19MSTY0KGRzdF9yZWcsIGltbTY0
KTsNCj4gKwkJCS8qIHBhZGRpbmcgdG8gYWxsb3cgZnVsbCA1IGluc3RydWN0aW9ucyBmb3IgbGF0
ZXIgcGF0Y2hpbmcgKi8NCj4gKwkJCWZvciAoaiA9IGN0eC0+aWR4IC0gdG1wX2lkeDsgaiA8IDU7
IGorKykNCj4gKwkJCQlFTUlUKFBQQ19SQVdfTk9QKCkpOw0KPiAgIAkJCS8qIEFkanVzdCBmb3Ig
dHdvIGJwZiBpbnN0cnVjdGlvbnMgKi8NCj4gICAJCQlhZGRyc1srK2ldID0gY3R4LT5pZHggKiA0
Ow0KPiAtCQkJUFBDX0xJNjQoZHN0X3JlZywgaW1tNjQpOw0KPiAgIAkJCWJyZWFrOw0KPiAgIA0K
PiAgIAkJLyo=
