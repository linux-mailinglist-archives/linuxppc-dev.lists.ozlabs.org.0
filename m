Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE9148F64E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 11:12:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbYqn5V4Cz3bb7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 21:12:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::623;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbYqH1dszz2xKR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jan 2022 21:11:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVjPxcNe+jeejmW80vqo2sb5i+5N1dV/UugwYFS3KReCxHt5kqwMidelJdhwKavUKCEG9Sh8xmP4oaBbkSnMSBv1XhLH9kNEkxF+cx4+VdZRwondYNW+Losz/OtRBeGpYJ6BQaAWSuwb/4io1TfQJe4exZclzVpY5Dj87aN4mJhDPWf5npbKMqCT/oDQUqV+5z9hMoEeFS5Nlr9FAnGRa4mVTEB5ZmWGWimeJ6lA1HrxxIzVqRNeRfWxcRwC2t5FzDEl/Yr/SOpS7CwSG1fVh4wwfM37yoxJBiiGR89UD1nrjzMuGF8aEkFnoUmplkGeXntksZqtxciH/9g3R5IUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVOIuvti3s6nCSjPzXW3r2jwqLlOUsrTNXgWvMl731w=;
 b=bFnHt4I3ZEDOQnGnLkwN+KGSQpJuExtpFV7ikchMODOgbExCYTST2cWgyS+9LA+5ncC39Tx+n0TtIzJuglvocSeYPFw9lcj+1rLirzTkedsBnW/2h1sgMbaHxFD2lqtOfFewwR+6o9blKIZzhnUAaxVW9zU4bFiyK+rKD3MUGj/boPJCodMshXP0AkUoedTsNFpAxiclUa0TLlR8hnvK2xXAuAbtlGUM7ImShyBgH84Ll/oT+Wb8VhqtWF6H8gi3/cDxlNKcmhEXNZVf8BuEwDI7IKlSySDdsq+sROrO/mi0bmpuqgAy/UAymcs64wLBdutEcNvM3iU+UybW2bOuGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PAZP264MB3686.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:d8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Sat, 15 Jan 2022 10:11:19 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8%2]) with mapi id 15.20.4888.012; Sat, 15 Jan 2022
 10:11:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Dave Hansen
 <dave.hansen@intel.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 3/3] x86: Support huge vmalloc mappings
Thread-Topic: [PATCH v2 3/3] x86: Support huge vmalloc mappings
Thread-Index: AQHX+zD/hWUWAcg7A0O0lNZsb1MJ4KxGfioAgAE2QICAHEWrgA==
Date: Sat, 15 Jan 2022 10:11:18 +0000
Message-ID: <21d6fc65-d9d1-66bb-9bea-a4bad78c7aac@csgroup.eu>
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
 <20211227145903.187152-4-wangkefeng.wang@huawei.com>
 <70ff58bc-3a92-55c2-2da8-c5877af72e44@intel.com>
 <3858de1f-cdbc-ff52-2890-4254d0f48b0a@huawei.com>
In-Reply-To: <3858de1f-cdbc-ff52-2890-4254d0f48b0a@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e914dbf9-b3c1-4150-77ff-08d9d80f5f7d
x-ms-traffictypediagnostic: PAZP264MB3686:EE_
x-microsoft-antispam-prvs: <PAZP264MB3686105B605202E8D4949985ED559@PAZP264MB3686.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WfYYZCNoa7R2apZkagWecW8GnTI9eEabI35eK4jm3sPZ1yoBT7rpV5jNfq04ABfqfKP0E06+i8DJdtOsHvcxWtYOH+qAxY7hhg8D7EgMWtjFEmJpl9MobEe/YPL3Wv621+B2nLb9WUCRiGTe1hNSjYiMkn17746uY+UIGpUNCo252Ew3LIoA5KAVzT/u83124kXfoqETmLxaoJeNk+xQ/+np2oNA6VFIzpD4gc7OnTTtrC/nHlZ2WNvyEkglG+6coSekUCyjd0OGp3dbiaLDSLy24VLRvKcxaTeMwQzygCZMPmxehsUtVaOSbX5cLk+DCILC1vv/Hz8WyU45dEo7ibvdXmP4o7A9qdLwk6le1zKwVQtIgREBXgH7al4uF1VaYt5aCZEypiSQXFesEjSwUUNZPiC64OQ69BtuMFl8LLG6zOxV0pl6msXl/cR0TcsFmVtcU6O4dBB0CMPN+OEhSJggrFUZ+Pn8aYLWYIl6qVeZUImdbXu+XEkUyGm1+dMaSViPSkhwiFOukPbp2nJGGRUa5oSm9pjO9LTpZtpaS2gtVdE18n9H0s1pmUkAXmmnKf6DyyHLQ7pjP9U5ATmOfTZe2e5rj4tMsV0NE9vPCjxmiH+Nx13l05RbVM+bMhCeK4Z0U4jd8HaCyneuO4GO+65ltERrFDG7KEM/w4EWPXSay0K72PPywsbtFXtmRrng9PpS0gCoHbFG2XpVyw2hDgY2Fhol4LzwGE0g8F29hgI80jrLGpvDG+h2K2X2JmMC/4ni5vXgSxow31s6ELChtoao3WabsdziV6GYYqtEXS1eK1IP/JaNA3yqwruIQ3Uf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(91956017)(5660300002)(4326008)(66946007)(6486002)(66476007)(36756003)(31686004)(38070700005)(26005)(66556008)(64756008)(66446008)(66574015)(508600001)(2906002)(6512007)(186003)(7416002)(31696002)(44832011)(2616005)(38100700002)(921005)(122000001)(316002)(8936002)(71200400001)(110136005)(53546011)(8676002)(6506007)(54906003)(86362001)(14583001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmVRTlpzNXd1T2wyOHZjSzlpSStZNXlqN1BGUUJhUlAvOWh2SVJLYjBHMVFL?=
 =?utf-8?B?RkFsbXRaUFExT1hUU21uY0pCRzQ3c2V1blpBN0lQVFVwS1NuYTFiN0NXWkR5?=
 =?utf-8?B?MnlMeWVMSTB0QlR3R3dTbDM1VUsyZEdkZEk1aUlvVlRSZ0pDaHFYLzlFdmhY?=
 =?utf-8?B?cXpPODY4K09tN29QSkFmV2ZJZ0RjZ09vRndMczI0MDhkYVVNQ3hOSDZVa3VZ?=
 =?utf-8?B?VXZJYmlUODZTVmFkY2NwT212aGRBazQ2WXptdjhkVnZhVFR4ZnExRXVrMWdH?=
 =?utf-8?B?WXdZRFI3V0lDNEVqNFh1eEZvWWtpUkVranRlWWNzVE5NYlJwTkYrTy9lODNI?=
 =?utf-8?B?a1pJMzBwRk1ObEJKNTAyZDVIT2hidW1oN2VDdDVFUUlSUWdUOFZaTC9QK0wy?=
 =?utf-8?B?NmpsNjRGek83a3JzK0RQZ3JWeGhvb0dDbUNEODJZQjJld3RWK3JhSkQ0NzdB?=
 =?utf-8?B?R08rR09BK3JlejBkZ2hvcGFGU0JwZnZpU3JWZVhMZHJSMWh3YUUvMGZXUWtQ?=
 =?utf-8?B?VmVNMjMvdHQyWmw1dmd4YTlYM3F3OGdrbGN2MjhDS1ZKYng2RlNzcnNrVzIz?=
 =?utf-8?B?cVZOVVg0WUZhMWZLWFZjVGI2K1NtUUZlRWxHelBlc08zT1lsZWpFVno1R1B4?=
 =?utf-8?B?bTlnck9qWFhQWHBNSVVvTkJlbEwrMXFlRlZ0dWw1WUsvanFLYVFlK3R0WVZs?=
 =?utf-8?B?V2FvT3VuVysrcUpCdmFqaW05c2pJdGRqekRDdjE2Uk43Q3BESXRUMXBYZEd1?=
 =?utf-8?B?c0QwVGpWdzdnbHAydHVYNTI3TFpucHFWaDdwdkxQVDdSNGQ3bFU1VGo3dWxC?=
 =?utf-8?B?MnRQSnIwWmwzN0R2VTZla2NmOEtuUkJoVmlXT2xNMldNTHg2Y1FaZXNGUEwy?=
 =?utf-8?B?ZnRWR3dWVGNFamg0VXJnVWZ0OU14WU5JcU90WUROMno1cjd2WXpuTW95cVZ5?=
 =?utf-8?B?MHpyRDhETGpsakFoaHdHekJ5ZnBIbWRmYmtxbWg1c2FhMWhiY0JaVWdRdWJr?=
 =?utf-8?B?bXRNYWp6V3dVMVVKWGpHemxETjhLTU5pby9KaTVyNzR3YVpLNnJhU3J4MTNW?=
 =?utf-8?B?ZFJSYXNNM0VtOE5Cem91TlBIenNzNmNIdURwNFdFd05xaVVNSnREVlc5OXJW?=
 =?utf-8?B?d3JiME8xTC9RTlAydEpvOXVndEsxaDAxTExBNnBlejFZYW9PZTAwRlY1c3dp?=
 =?utf-8?B?Vnh5aEUvbjBNcVhUZ093djJIRUptS0hrZFA3ZUVvbWpYVmJqRkk3bjZkWDRm?=
 =?utf-8?B?ZWVFRyszcDVQMUE1eWgyejZFVi8zQmJXWWVRZXUwZlZVTEwyVDR6cTErWnlN?=
 =?utf-8?B?dmpWWDZ3NDJSUTBtdldjcXBWUys2SjlFY2tvMW1OT1lZRFZkNzZHdmUzOFpI?=
 =?utf-8?B?cVhOMWw3WFNIUXEvdkZNY0ZJai9GRE5uelAxUFBGSm1iRU91NEhyS01iZXRn?=
 =?utf-8?B?b21EVWF6dElaY2hTeDF4Q0Z5dXhBNDUwYkNtYTM4eWdJNmhTL3ZETnN5NkUv?=
 =?utf-8?B?RWJlMXJZMndWa0RYQW9INFdnSUR5WTBibHlScWtaSGpONGVDbTVaVkY5RTk4?=
 =?utf-8?B?NktCdk9SbHM4Mm5HTUV1TXlnYUFTZ3RjbWdLOWtHS29vbGN3NHgwSTlrb29X?=
 =?utf-8?B?d2RPSk1hV3dPZmpaU2ZlZzkwd2d5VlJoYTF3UGZoVTZvVTVCRUhsR2UrK3Y2?=
 =?utf-8?B?U0MrUGhZdkhjR3RFSmFtaCs5Q1J2RTY4MVYvbmxCMGEwdm9aeGRoQ1VaYmRp?=
 =?utf-8?B?QXQwYXNyeFBXN1FtOENROTZIUlhtY0V1T2h2cG4zV1IxZjFaeldxRWg2eE5l?=
 =?utf-8?B?UDRWYWxFTjRVWkRmVG9uemZHYXFFTTZ6UXYyYk9BakFWL1pjcjFoN1FjS1dJ?=
 =?utf-8?B?V05YTzh2K3cxK0cvemZLbTE5R2pSc2YxZy93dHNjVlNJWkJKanpXZ2swM1Q5?=
 =?utf-8?B?QXNCSSttWkZQV2Z6SitBOEdiQlNhSW1lREhIZWY0eGc2WTRSdVRPN3c4Nk03?=
 =?utf-8?B?bXRTZzNiRnBRVFFTWXZZajhEZ2YvYlViU2R6bHVPVTVMRlM5cDUzVUQyN1FU?=
 =?utf-8?B?QWRUZkxFdW5FZ3d5eGl1YXpnd092TzRGcDFIeE95bWZMUVRoSEhicTA2aVAz?=
 =?utf-8?B?cWVCRlpHaTI3azB0YlBQMkpLVlIyTjhlVGtzM05oUzdhNmtkK3RHTzZXMGI2?=
 =?utf-8?B?c1RGaVh3WlUvL3MrbllVRU1hcTU5QTIyVjQ3aWV5VXVZUGtObTl2VjdRR0VM?=
 =?utf-8?Q?COh7oP7oAcVYqutxd1qrPY+frq9/f4nujscVOUMJrw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1F55E2FDAAD514FBEAF8D5FC65A0A47@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e914dbf9-b3c1-4150-77ff-08d9d80f5f7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2022 10:11:18.6688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dcOomDxu6/fHIr6hYZbIoONxy9D41g5l8hnVzc9Etj2qHXKjPI4yKShFAU28fH9C8v/ZW+8ofZxOoLw7mrDEYCwboBO3rnrb/4ZgNv89ABg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3686
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzEyLzIwMjEgw6AgMTE6MjYsIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6DQo+IA0K
PiBPbiAyMDIxLzEyLzI3IDIzOjU2LCBEYXZlIEhhbnNlbiB3cm90ZToNCj4+IE9uIDEyLzI3LzIx
IDY6NTkgQU0sIEtlZmVuZyBXYW5nIHdyb3RlOg0KPj4+IFRoaXMgcGF0Y2ggc2VsZWN0IEhBVkVf
QVJDSF9IVUdFX1ZNQUxMT0MgdG8gbGV0IFg4Nl82NCBhbmQgWDg2X1BBRQ0KPj4+IHN1cHBvcnQg
aHVnZSB2bWFsbG9jIG1hcHBpbmdzLg0KPj4gSW4gZ2VuZXJhbCwgdGhpcyBzZWVtcyBpbnRlcmVz
dGluZyBhbmQgdGhlIGRpZmYgaXMgc2ltcGxlLsKgIEJ1dCwgSSBkb24ndA0KPj4gc2VlIF9hbnlf
IHg4Ni1zcGVjaWZpYyBkYXRhLsKgIEkgdGhpbmsgdGhlIGJhcmUgbWluaW11bSBoZXJlIHdvdWxk
IGJlIGENCj4+IGZldyBrZXJuZWwgY29tcGlsZXMgYW5kIHNvbWUgJ3BlcmYgc3RhdCcgZGF0YSBm
b3Igc29tZSBUTEIgZXZlbnRzLg0KPiANCj4gV2hlbiB0aGUgZmVhdHVyZSBzdXBwb3J0ZWQgb24g
cHBjLA0KPiANCj4gY29tbWl0IDhhYmRkZDk2OGEzMDNkYjc1ZTRkZWJlNzdhM2RmNDg0MTY0ZjFm
MzMNCj4gQXV0aG9yOiBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPg0KPiBEYXRl
OsKgwqAgTW9uIE1heSAzIDE5OjE3OjU1IDIwMjEgKzEwMDANCj4gDQo+ICDCoMKgwqAgcG93ZXJw
Yy82NHMvcmFkaXg6IEVuYWJsZSBodWdlIHZtYWxsb2MgbWFwcGluZ3MNCj4gDQo+ICDCoMKgwqAg
VGhpcyByZWR1Y2VzIFRMQiBtaXNzZXMgYnkgbmVhcmx5IDMweCBvbiBhIGBnaXQgZGlmZmAgd29y
a2xvYWQgb24gYQ0KPiAgwqDCoMKgIDItbm9kZSBQT1dFUjkgKDU5LDgwMCAtPiAyLDEwMCkgYW5k
IHJlZHVjZXMgQ1BVIGN5Y2xlcyBieSAwLjU0JSwgZHVlDQo+ICDCoMKgwqAgdG8gdmZzIGhhc2hl
cyBiZWluZyBhbGxvY2F0ZWQgd2l0aCAyTUIgcGFnZXMuDQo+IA0KPiBCdXQgdGhlIGRhdGEgY291
bGQgYmUgZGlmZmVyZW50IG9uIGRpZmZlcmVudCBtYWNoaW5lL2FyY2guDQo+IA0KPj4+IGRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvbW9kdWxlLmMgYi9hcmNoL3g4Ni9rZXJuZWwvbW9kdWxl
LmMNCj4+PiBpbmRleCA5NWZhNzQ1ZTMxMGEuLjZiZjVjYjdkODc2YSAxMDA2NDQNCj4+PiAtLS0g
YS9hcmNoL3g4Ni9rZXJuZWwvbW9kdWxlLmMNCj4+PiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvbW9k
dWxlLmMNCj4+PiBAQCAtNzUsOCArNzUsOCBAQCB2b2lkICptb2R1bGVfYWxsb2ModW5zaWduZWQg
bG9uZyBzaXplKQ0KPj4+IMKgwqDCoMKgwqAgcCA9IF9fdm1hbGxvY19ub2RlX3JhbmdlKHNpemUs
IE1PRFVMRV9BTElHTiwNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgTU9EVUxFU19WQUREUiArIGdldF9tb2R1bGVfbG9hZF9vZmZzZXQoKSwNCj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTU9EVUxFU19FTkQsIGdmcF9tYXNr
LA0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQQUdFX0tFUk5F
TCwgVk1fREVGRVJfS01FTUxFQUssIE5VTUFfTk9fTk9ERSwNCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTU9EVUxFU19FTkQsIGdmcF9tYXNrLCBQQUdFX0tFUk5F
TCwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVk1fREVGRVJf
S01FTUxFQUsgfCBWTV9OT19IVUdFX1ZNQVAsIE5VTUFfTk9fTk9ERSwNCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19idWlsdGluX3JldHVybl9hZGRyZXNz
KDApKTsNCj4+PiDCoMKgwqDCoMKgIGlmIChwICYmIChrYXNhbl9tb2R1bGVfYWxsb2MocCwgc2l6
ZSwgZ2ZwX21hc2spIDwgMCkpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdmZyZWUocCk7DQo+
PiBUbyBmaWd1cmUgb3V0IHdoYXQncyBnb2luZyBvbiBpbiB0aGlzIGh1bmssIEkgaGFkIHRvIGxv
b2sgYXQgdGhlIGNvdmVyDQo+PiBsZXR0ZXIgKHdoaWNoIEkgd2Fzbid0IGNjJ2Qgb24pLsKgIFRo
YXQncyBub3QgZ3JlYXQgYW5kIGl0IG1lYW5zIHRoYXQNCj4+IHNvbWVib2R5IHdobyBzdHVtYmxl
cyB1cG9uIHRoaXMgaW4gdGhlIGNvZGUgaXMgZ29pbmcgdG8gaGF2ZSBhIHJlYWxseQ0KPj4gaGFy
ZCB0aW1lIGZpZ3VyaW5nIG91dCB3aGF0IGlzIGdvaW5nIG9uLsKgIENvdmVyIGxldHRlcnMgZG9u
J3QgbWFrZSBpdA0KPj4gaW50byBnaXQgaGlzdG9yeS4NCj4gU29ycnkgZm9yIHRoYXQsIHdpbGwg
YWRkIG1vcmUgaW50byBhcmNoJ3MgcGF0Y2ggY2hhbmdlbG9nLg0KPj4gVGhpcyBkZXNwZXJhdGVs
eSBuZWVkcyBhIGNvbW1lbnQgYW5kIHNvbWUgY2hhbmdlbG9nIG1hdGVyaWFsIGluICp0aGlzKg0K
Pj4gcGF0Y2guDQo+Pg0KPj4gQnV0LCBldmVuIHRoZSBkZXNjcmlwdGlvbiBmcm9tIHRoZSBjb3Zl
ciBsZXR0ZXIgaXMgc3BhcnNlOg0KPj4NCj4+PiBUaGVyZSBhcmUgc29tZSBkaXNhZHZhbnRhZ2Vz
IGFib3V0IHRoaXMgZmVhdHVyZVsyXSwgb25lIG9mIHRoZSBtYWluDQo+Pj4gY29uY2VybnMgaXMg
dGhlIHBvc3NpYmxlIG1lbW9yeSBmcmFnbWVudGF0aW9uL3dhc3RlIGluIHNvbWUgc2NlbmFyaW9z
LA0KPj4+IGFsc28gYXJjaHMgbXVzdCBlbnN1cmUgdGhhdCBhbnkgYXJjaCBzcGVjaWZpYyB2bWFs
bG9jIGFsbG9jYXRpb25zIHRoYXQNCj4+PiByZXF1aXJlIFBBR0VfU0laRSBtYXBwaW5ncyhlZywg
bW9kdWxlIGFsbG9jIHdpdGggU1RSSUNUX01PRFVMRV9SV1gpDQo+Pj4gdXNlIHRoZSBWTV9OT19I
VUdFX1ZNQVAgZmxhZyB0byBpbmhpYml0IGxhcmdlciBtYXBwaW5ncy4NCj4+IFRoYXQganVzdCBz
YXlzIHRoYXQgeDg2ICpuZWVkcyogUEFHRV9TSVpFIGFsbG9jYXRpb25zLsKgIEJ1dCwgd2hhdA0K
Pj4gaGFwcGVucyBpZiBWTV9OT19IVUdFX1ZNQVAgaXMgbm90IHBhc3NlZCAobGlrZSBpdCB3YXMg
aW4gdjEpP8KgIFdpbGwgdGhlDQo+PiBzdWJzZXF1ZW50IHBlcm1pc3Npb24gY2hhbmdlcyBqdXN0
IGZyYWdtZW50IHRoZSAyTSBtYXBwaW5nPw0KPj4gLg0KPiANCj4gWWVzLCB3aXRob3V0IFZNX05P
X0hVR0VfVk1BUCwgaXQgY291bGQgZnJhZ21lbnQgdGhlIDJNIG1hcHBpbmcuDQo+IA0KPiBXaGVu
IG1vZHVsZSBhbGxvYyB3aXRoIFNUUklDVF9NT0RVTEVfUldYIG9uIHg4NiwgaXQgY2FsbHMgDQo+
IF9fY2hhbmdlX3BhZ2VfYXR0cigpDQo+IA0KPiBmcm9tIHNldF9tZW1vcnlfcm8vcncvbnggd2hp
Y2ggd2lsbCBzcGxpdCBsYXJnZSBwYWdlLCBzbyB0aGVyZSBpcyBubyANCj4gbmVlZCB0byBtYWtl
DQo+IA0KPiBtb2R1bGUgYWxsb2Mgd2l0aCBIVUdFX1ZNQUxMT0MuDQo+IA0KDQpNYXliZSB0aGVy
ZSBpcyBubyBuZWVkIHRvIHBlcmZvcm0gdGhlIG1vZHVsZSBhbGxvYyB3aXRoIEhVR0VfVk1BTExP
QywgDQpidXQgaXQgbGVhc3QgaXQgd291bGQgc3RpbGwgd29yayBpZiB5b3UgZG8gc28uDQoNClBv
d2VycGMgZGlkIGFkZCBWTV9OT19IVUdFX1ZNQVAgdGVtcG9yYXJpbHkgYW5kIGZvciBzb21lIHJl
YXNvbiB3aGljaCBpcyANCiAgZXhwbGFpbmVkIGluIGEgY29tbWVudC4NCg0KSWYgeDg2IGFscmVh
ZHkgaGFzIHRoZSBuZWNlc3NhcnkgbG9naWMgdG8gaGFuZGxlIGl0LCB3aHkgYWRkIA0KVk1fTk9f
SFVHRV9WTUFQID8NCg0KQ2hyaXN0b3BoZQ==
