Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71B4D12A5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 09:48:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCTWb5rS1z3bd2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 19:48:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::611;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::611])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCTW65yRJz2xD7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 19:48:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwMAgw4xRedwsvfj6iPVpzf3CmsVv1TfcW3IARPoKnt6Dp3gtTqiVhCWTA89Iw3FREX6DfERuzct0tYQeKV3bQRPRI9XUUN5/mHah38o0ARKKQqhbGxSoBFWGPQHqBEtRa3fl4PNRLEe5BAAzQCTm1Tjlq1+Lv5JE1gBIJdi7CLN1teabCk1zlfTsAW0dSbga7rQUYejtKSdOkQjyTxNf60+YFLbFWU0zPt0mfTUnTQf4owqbOGbSytVJ30ALWhE04gFWjCBNe+xL4Z/rF4JHbRNxGXcIcjMKpkmKrFZ6ueS4CdF88SCekn9cxQLO2RAFZR93S3l2qx79X2sHfPwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFs9e27MRrHYp3KqNVy5pg+b/CZ4aJC3EKAsBdhSvcc=;
 b=hwLriFDnUQhOEnimlW2AkGqO8HmI+K6CdceocJX4B6VEK1EAUwaGM3JjQg+NCLmoFEj2AxMqJFHqVsojrYyA+yO38zXUPiFZD9peRFGw69BUZUh/nyAU73zAkxtiaN79+u+QDtk7BOy4saNcvtC0tGqjm2P1DcJL59yhDXJEyzKTnRL0RnPK6smp2rEilrm+6qiWuP8X4Ht8GUurNnkaKbl1WGucwlzLi7MklGqbd/23j0RhBrO8VC6k1m+DO803Rc+WGD9K/k8VLH8z4qxdfazDSRtFe6sfczPbYChff0SSz1DxB4tLYpZfUd3D1jAmffXLPRAVbarK++C4LWI4XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0312.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:16::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 08:47:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 08:47:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 1/4] powerpc: Cleanup asm-prototypes.c
Thread-Topic: [PATCH v1 1/4] powerpc: Cleanup asm-prototypes.c
Thread-Index: AQHYL+nkU2y28o0pEEGGi1zd99wPu6y1Mo+A
Date: Tue, 8 Mar 2022 08:47:50 +0000
Message-ID: <d8a91ad9-328f-d0cb-1112-7ddccd8873d4@csgroup.eu>
References: <3ed660a585df2080ea8412ec20fbf652f5bf013a.1646413435.git.christophe.leroy@csgroup.eu>
In-Reply-To: <3ed660a585df2080ea8412ec20fbf652f5bf013a.1646413435.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 677bc64c-662a-442c-c1b5-08da00e0540f
x-ms-traffictypediagnostic: MRXP264MB0312:EE_
x-microsoft-antispam-prvs: <MRXP264MB03129E8C3EDAB8B8152A6E96ED099@MRXP264MB0312.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hqU7DVYPfQoq2jDgGUSygYiSb+Uq2iC63Mz4ZKEu84lnbBxWFjIf1cQlMP7ZzrwTmv+PX7GCb8W0G9HCt0SKpBH+Y+jHxEe5r+7AuYnsgacP3py8rNc9veGZ7Fnr4nZTQtAZ5ylQmdbc29aIHSaDQS05javjOSHmYxTV2X081J3iQPFPhir8NJfKMSfoEumNm+wP7I3maW5xy2YUFXTIIlfsLZsPaj56/hIUNoiQ3c23WkDKIc+uTkRlQ8Z+bDiB9SKQZPS/fuyTYaftdz/fd+vjWB6wTrgwZk++wHToYiqHbJ5cagoZNoXphshBYhJT4gbr9wOdJIUHFjDV9t0oERcyxtgm79BhX5GmBHp+/n+dk3mqVtmgWT923ggBEASA+yubesz8KwFTRi2RTIQ5KrZhuA+lCgIQe/pQK58hj0DwfeYZToaqD//ry6b3hbTc0iCooSLlRvzxl6n3JqkClsZ4YLfdtqbiztc7ciL3bTVVjyxdofQgsuW2WGf9WUrENo6mhsfln+s9Za4qsTWCArfSZGsM6/5ikSpvqHmMK3x+A1pZRMni3w2sj0+1O0ZeAz9m9fvbP7zkS2c2txMD/U6bxBfuWtma3MWj68QbC1JXZDLSuo4SaCmC0TZf/bDvSMh9NY1Zc716ExCEIftghotF8L6D6oTgzt5Ie7PPWhTzNduXx7hbcHvnXjWVO8wYFX2JrXl4/cje26Zy9AGFaxJDkZDGyrwm7RjNszTgST0FnvM0HaRlSl/lVph7iBMNEBogtav38RN2doUgAnEuqQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(83380400001)(66446008)(2906002)(6486002)(31686004)(44832011)(5660300002)(38070700005)(6506007)(8936002)(64756008)(316002)(6512007)(54906003)(66476007)(186003)(110136005)(122000001)(26005)(66946007)(66556008)(4326008)(31696002)(2616005)(86362001)(8676002)(38100700002)(76116006)(71200400001)(508600001)(91956017)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vm9zQ3pVYVVhV3dpMXBBd0ZLbzRLbE41NGQ2VzM5NG9yK0txdkx4ajk5dHpj?=
 =?utf-8?B?MlpYeU9nSjcvQ09yTC9KYVl4cUVPNHhUdnVpQzNPWVBjUVk3dTZXaDlsSkRv?=
 =?utf-8?B?SWNQcUFQQ2xXSi9WdHQxVkxqNU5yL2dsbGRzTm43QmlwZ0pMV0xnaWphZ0xW?=
 =?utf-8?B?TjF0bzJmNDRvRnVuSGt2RlRiVkRGZWpuMXB5U0l0OXgvWGpSUktRcVJDcXEv?=
 =?utf-8?B?WFNrUmZ5aDVHNU5kd2Q2NFpDZ1BBL01tRWo3K3dLZ3I0SmhVbGFhY25NU3Rz?=
 =?utf-8?B?OW4wc21XMjNxaGRxaWdFTFhrNU1XMDhVMFAvc2RrVzBweGtCaWI3TFRhOXJ4?=
 =?utf-8?B?NlBZYzJKMTdLNHpOcFJsTWlsYitqNVFsRGVBRHVkK1Q4Y3g1dWtXNGc1TGRs?=
 =?utf-8?B?YjBEcmk3SUtranVaQ0R6WkNyM0o3WkpTM3Z2QUtTWEVyZHVCL2MyaUVzQzZp?=
 =?utf-8?B?cXhySFR6U2ovQW4yVEZtd3MrUStRSlhVanhtN1A3WVorZ1Vxak5OYlFzWnYr?=
 =?utf-8?B?azgwK2EzbnpYUlpiZWQ3UVJzbURadGlLY1VIVGIrZlFnc0I0bEtvUDQ1bjFI?=
 =?utf-8?B?aGlaMU45S3BBVVBHVlA4S2FuQTVUSXl5eVpKR3ZrKzdpS0dOSDIwem96NUdr?=
 =?utf-8?B?WEthSmY4ZnZaOGwrS0Q0ODdOa2JxZSthZlFlRVZhTnZpQ1p6RkFHR3JkV3Bn?=
 =?utf-8?B?MTQxREs0MTUrVWd4aWIzSnl4Y3g1RUZhVitFUHA5QUZPckJLb0RibmdDOFF5?=
 =?utf-8?B?TkR6NUxxS1NGT29CdWFoVndQazE5cVlpc0FsdWx0QUxwR2REZU9mWmN2QWY2?=
 =?utf-8?B?TEpabWpyNTZaRk8yYmpGeU1QdW91a2NUdW1maHFDNlVJMHU1WFg3UnU1Sk16?=
 =?utf-8?B?Vm52dkhoYWdpOHEwemdFQVduWGtJcnVMUEhtaUJ0aUZ4VG9ja2QzdGtNdUhi?=
 =?utf-8?B?c3ZXYS9nWXVLdGkyVGEyODFmby9WaXM5bUFhTi9KcGdKYWdpcENoNjExSXdY?=
 =?utf-8?B?dy9GUE9lWmlJRDBITEdPZG5XOSt2eGpCRGdMbktrZHVBLy93VURHNTFjNnlX?=
 =?utf-8?B?MlpTcklCUmFuTHVzV0ZINkd3ZUVqeEpXbHdtVThkRTh5bVFXTkd6VEpUcWQ2?=
 =?utf-8?B?aUtKY2t4V0hBTVpmNFptY3ZjTFZyc0JsOUY4RGV5YzM3Vi9sM1dteERlOEZT?=
 =?utf-8?B?QXNzNWdyaWFqeWRGNXZhSEJland3YXVKdzRReUM0Skt3SzZrOFJFVnZmaW1v?=
 =?utf-8?B?SjFWZ2Z5T3F0VVdiVkV4R0FtYTFvSTduUGM3RDQ1VzB4blBnK044KzQybkkz?=
 =?utf-8?B?dkpPTXdHczZFeEo3aVdWZlpCRmxUWm0zSjZNdklOdFh5MVhhUEMrOGFEcGVi?=
 =?utf-8?B?VzduOFFvTDRiR2lEemgyM3FpZHdPM3RKZTJ0QWtxODZSTHFNR3pCTWJnLy9m?=
 =?utf-8?B?T2FORFZpMndKa2RlMmI0L21YMGZpTW1BdVQwVWlqRFYrRGR6OWV3cHl6Mlps?=
 =?utf-8?B?SjRFQnFheFVtVE80VUl5S1MrMHE5NU5BV2h3MGl5S3h6bzBMRGhYd3dkWGMz?=
 =?utf-8?B?Y3NBRmpGTi9uSEpVUTVyeFBGazlsbmdFeVN2Snk0c3hEdXBtNnBNVGRNTFNv?=
 =?utf-8?B?dE5ndXpicDAyL0JMdThBdVZnM20wbkdWc3hiTUEzRVREKy92aVFONFliOVVK?=
 =?utf-8?B?MmNkN0pKZi9zODE3Qm5GYTVoelFMS3MrMnp5ZGRGUlJPZy9VNmlWMmh2amJD?=
 =?utf-8?B?TDlpQmw1WUN2VGtuVG9uSm52MmZTaEFCV3JTdENJSXI5RHp2M3kyMkxpb2ps?=
 =?utf-8?B?V3ZwTEJWQjlTWndOVWhhdFVVcWZmRVNsWFBRNVpCY3RKNzBTeTBMcVdja09l?=
 =?utf-8?B?SHl6QXpxTTRQWGd5eDlVZDVqQmdmek83dEIvS0lWcHJkekkzOUJRN2NDL3pI?=
 =?utf-8?B?NGd0NFd1cHB1WGF2NVNQSHpEb2txTjJBMjkvVEtHMHFGWEVHNHZFajJqTk53?=
 =?utf-8?B?UXpVV0V5SkJzOC9VVkpLelB1dllmcE13dzg3ZWczZkVyOFNXeDROVDNvOUpm?=
 =?utf-8?B?d2lDbkNqdWxqRFplbFJXR0ZmUGVJVXB3aWdSL0E1VFBqYmtDUllncTFnUURV?=
 =?utf-8?B?Z2RwRnZrTEJSZmQ5ZXR6dERCaXc2KzNLT3U5SjFRSXFNUCtLRGpjR0pFbHpH?=
 =?utf-8?B?bzgrNTlROE9EMmtRTUhiUkpjcWJtZXd6dHVoVEowdlh5MU1jSEladDY5M013?=
 =?utf-8?Q?zsA1PiVYnvEvqVjo54/bwvUI1L6Owj6R0PSBMTvu38=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC572D15935A0E4FA27E3C024F46A25B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 677bc64c-662a-442c-c1b5-08da00e0540f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 08:47:50.8714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJlUU7Tv2xsnWCtI7kw8BJt5hldsiDTWRSvK9g8B/2laTSxu2OCpFQ8C/+4+m+nSrn4Xz9zNHWNSAxRnuS/N8SaUjZ/XqXILVll0f6NXTRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0312
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTWljaGFlbCwNCg0KTGUgMDQvMDMvMjAyMiDDoCAxODowNCwgQ2hyaXN0b3BoZSBMZXJveSBh
IMOpY3JpdMKgOg0KPiBMYXN0IGNhbGwgdG8gc3lzX3N3YXBjb250ZXh0KCkgZnJvbSBBU00gd2Fz
IHJlbW92ZWQgYnkNCj4gY29tbWl0IGZiY2VlMmViZThlZCAoInBvd2VycGMvMzI6IEFsd2F5cyBz
YXZlIG5vbiB2b2xhdGlsZSBHUFJzIGF0DQo+IHN5c2NhbGwgZW50cnkiKQ0KPiANCj4gc3lzX2Rl
YnVnX3NldGNvbnRleHQoKSBwcm90b3R5cGUgbm90IG5lZWRlZCBhbnltb3JlIHNpbmNlDQo+IGNv
bW1pdCBmMzY3NTY0NGUxNzIgKCJwb3dlcnBjL3N5c2NhbGxzOiBzaWduYWxfezMyLCA2NH0gLSBz
d2l0Y2gNCj4gdG8gU1lTQ0FMTF9ERUZJTkUiKQ0KPiANCj4gc3lzX3N3aXRjaF9lbmRpYW4oKSBw
cm90b3R5cGUgbm90IG5lZWRlZCBhbnltb3JlIHNpbmNlDQo+IGNvbW1pdCA4MWRhYzgxNzc4NjIg
KCJwb3dlcnBjLzY0OiBNYWtlIHN5c19zd2l0Y2hfZW5kaWFuKCkgdHJhY2VhYmxlIikNCj4gDQo+
IF9tb3VudCgpIHByb3RvdHlwZSBpcyBhbHJlYWR5IGluIGFzbS9mdHJhY2UuaA0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
Pg0KPiAtLS0NCg0KSSBzZWUgdGhpcyBzZXJpZXMgaW4gbmV4dC10ZXN0IGJyYW5jaC4NCg0KQ2Fu
IHlvdSAjaW5jbHVkZSA8YXNtL2Z0cmFjZS5oPiBpbiBhc20vYXNtLXByb3RvdHlwZXMuaCBzbyB0
aGF0IA0KX21jb3VudCgpIHN0aWxsIGdldHMgdmVyc2lvbm5lZC4NCg0KSWYgeW91IHByZWZlciBJ
IGNhbiByZXNlbmQgdGhlIHNlcmllcy4NCg0KVGhhbmtzDQpDaHJpc3RvcGhlDQoNCj4gICBhcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vYXNtLXByb3RvdHlwZXMuaCB8IDcgLS0tLS0tLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2FzbS1wcm90b3R5cGVzLmgNCj4gaW5kZXggNDFiOGExZTExNDRhLi40ZmQ3OTIwN2ZkNDEg
MTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5o
DQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9hc20tcHJvdG90eXBlcy5oDQo+IEBA
IC01NywxMiArNTcsNyBAQCBpbnQgZW50ZXJfdm14X29wcyh2b2lkKTsNCj4gICB2b2lkICpleGl0
X3ZteF9vcHModm9pZCAqZGVzdCk7DQo+ICAgDQo+ICAgLyogc2lnbmFscywgc3lzY2FsbHMgYW5k
IGludGVycnVwdHMgKi8NCj4gLWxvbmcgc3lzX3N3YXBjb250ZXh0KHN0cnVjdCB1Y29udGV4dCBf
X3VzZXIgKm9sZF9jdHgsDQo+IC0JCSAgICBzdHJ1Y3QgdWNvbnRleHQgX191c2VyICpuZXdfY3R4
LA0KPiAtCQkgICAgbG9uZyBjdHhfc2l6ZSk7DQo+ICAgI2lmZGVmIENPTkZJR19QUEMzMg0KPiAt
bG9uZyBzeXNfZGVidWdfc2V0Y29udGV4dChzdHJ1Y3QgdWNvbnRleHQgX191c2VyICpjdHgsDQo+
IC0JCQkgIGludCBuZGJnLCBzdHJ1Y3Qgc2lnX2RiZ19vcCBfX3VzZXIgKmRiZyk7DQo+ICAgaW50
DQo+ICAgcHBjX3NlbGVjdChpbnQgbiwgZmRfc2V0IF9fdXNlciAqaW5wLCBmZF9zZXQgX191c2Vy
ICpvdXRwLCBmZF9zZXQgX191c2VyICpleHAsDQo+ICAgCSAgIHN0cnVjdCBfX2tlcm5lbF9vbGRf
dGltZXZhbCBfX3VzZXIgKnR2cCk7DQo+IEBAIC04MSw3ICs3Niw2IEBAIHVuc2lnbmVkIGxvbmcg
aW50ZXJydXB0X2V4aXRfa2VybmVsX3Jlc3RhcnQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOw0KPiAg
IA0KPiAgIGxvbmcgcHBjX2ZhZHZpc2U2NF82NChpbnQgZmQsIGludCBhZHZpY2UsIHUzMiBvZmZz
ZXRfaGlnaCwgdTMyIG9mZnNldF9sb3csDQo+ICAgCQkgICAgICB1MzIgbGVuX2hpZ2gsIHUzMiBs
ZW5fbG93KTsNCj4gLWxvbmcgc3lzX3N3aXRjaF9lbmRpYW4odm9pZCk7DQo+ICAgDQo+ICAgLyog
cHJvbV9pbml0IChPcGVuRmlybXdhcmUpICovDQo+ICAgdW5zaWduZWQgbG9uZyBfX2luaXQgcHJv
bV9pbml0KHVuc2lnbmVkIGxvbmcgcjMsIHVuc2lnbmVkIGxvbmcgcjQsDQo+IEBAIC0xMDIsNyAr
OTYsNiBAQCBleHRlcm4gaW50IF9fY21wZGkyKHM2NCwgczY0KTsNCj4gICBleHRlcm4gaW50IF9f
dWNtcGRpMih1NjQsIHU2NCk7DQo+ICAgDQo+ICAgLyogdHJhY2luZyAqLw0KPiAtdm9pZCBfbWNv
dW50KHZvaWQpOw0KPiAgIHVuc2lnbmVkIGxvbmcgcHJlcGFyZV9mdHJhY2VfcmV0dXJuKHVuc2ln
bmVkIGxvbmcgcGFyZW50LCB1bnNpZ25lZCBsb25nIGlwLA0KPiAgIAkJCQkJCXVuc2lnbmVkIGxv
bmcgc3ApOw0KPiAgIA==
