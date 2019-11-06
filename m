Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9858F1D68
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 19:20:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477ZZh4Y3yzF5gG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 05:20:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=synopsys.com (client-ip=149.117.87.133;
 helo=smtprelay-out1.synopsys.com; envelope-from=vineet.gupta1@synopsys.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=synopsys.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="D+SxQLwT";
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=synopsys.onmicrosoft.com
 header.i=@synopsys.onmicrosoft.com header.b="DnV33DVR"; 
 dkim-atps=neutral
X-Greylist: delayed 513 seconds by postgrey-1.36 at bilbo;
 Thu, 07 Nov 2019 05:17:05 AEDT
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477ZW55PCdzF5cr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 05:17:03 +1100 (AEDT)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 30EA5C08C8;
 Wed,  6 Nov 2019 18:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573063706; bh=fmcUSQy+Rboqs0cgOnfekDx6LEtxeUQPlxV0dMHzFM8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=D+SxQLwTfz+9krEZ0lWZ4ohNWs/jpeV1yzvhe2Tzdael1hRlgJcnUAC5uAKRNcexR
 pqv+k5E+odEpPYfUptYa/Sn2SmW6VX4QU2wxJyGhtyPcHzx+Nv0A/QOxOsQNbEE/v4
 h6qx8Oa4JoskvLFMnrzzpZj70fb6qxl0EHQ4DUirYuSRK/a7Tz7hMJbTuB6acDmQdt
 b3D5T9toIORhYkOu8c6BGeqFamYw1449Kwh6IKaUx3V14bqNvKTEVr2LVQ+9eZ5YrR
 iBVgPrVSTOL60az5Mu+IJGPWhedHLvplRYt4t62FoNBBixcVOC3wK4GUoyBItjJN33
 jwOirddB8jOIw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D2B65A006B;
 Wed,  6 Nov 2019 18:08:04 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 6 Nov 2019 10:07:46 -0800
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 6 Nov 2019 10:07:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJdaIvjlVM4PnIjAdA0wWCDPToNIEt4+pIqxu+Xcw0M7C8CGqhqyQLXaedBGpexXmaDK1VS5StFMi4mdFb8ejwZ63tARWt/x59ghyc9lZtj4aez+xf+hED5Q6vMDPTu8iiVZkLzHsL4iB0arEKoheOQoqWqMl3zAfjUvyPE86ISYYiKGum1DCwXJ4BbaNWgcpwOaz+p37sWwYw2DkmW9rPl7hZsw85+B6rMfqjx5vf+1gFMQKQw7ZlGSiwT3H/ylPtPRWfGZKRuEHqxxQvVPC+0WLA7QKNm96H8lsaTQg9DXVlJfaLuNaKCcPSPgLrRvrQbuvgwW6Qm3huJgTIvKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmcUSQy+Rboqs0cgOnfekDx6LEtxeUQPlxV0dMHzFM8=;
 b=fm0XcbFcXIiGQJQvNUgSa7Gj9JmBI33asjUkcZj9vl4PLKboQoJ3xCKo4k0rs0MLJy0Qr/+ZEL66T09MifgTLXh54wFZSdcJzqObPjaesDael2ENi3ayZCE0hrk3I1O6F5/TjS9vZOnggbmgi6eKU2r8eFz2vHNT6tHRY6C+6w8mk/u0+AHgkWeF3rqByUTLKWafGDfGRv4gROHa7gC/FuurnrGs1vlsJHFcv96eJlyot42dHltuvyi4FbrHKr9LFBAjw7WPBsfcdAdWC25nZdnBxOEm5T4566fI+e6WTd/+tiX978E/63xvItqx1jv7GXlqsSP/OuOoZxM081K1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmcUSQy+Rboqs0cgOnfekDx6LEtxeUQPlxV0dMHzFM8=;
 b=DnV33DVR4t5e6H92ZF/Ro4U9uKYi64vW1pE4cV+eYiigF6kP+Of6UPeDMfW6lpRGa5jHYJ3R6TdTV/voMwksP+mWVqW0YBc7R+/6cou31X87VzbjPiTMF+i2i+/uBN1jRHNys6fpq3LljngHomysK/kyBmYz4CfYwpZUtyzZR4g=
Received: from DM6PR12MB4089.namprd12.prod.outlook.com (10.141.184.211) by
 DM6PR12MB3338.namprd12.prod.outlook.com (20.178.31.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Wed, 6 Nov 2019 18:07:45 +0000
Received: from DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd]) by DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd%5]) with mapi id 15.20.2430.020; Wed, 6 Nov 2019
 18:07:45 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table
 helpers
Thread-Topic: [PATCH V8] mm/debug: Add tests validating architecture page
 table helpers
Thread-Index: AQHVk2wP8ZQH8Ag2aUW4lQaNsiawtKd9KlIAgABMeACAAPyJgA==
Date: Wed, 6 Nov 2019 18:07:44 +0000
Message-ID: <b93ffe1f-b198-a042-ecd4-b0f2b0171f72@synopsys.com>
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
 <e0aa8d49-5511-15e4-f413-62c99eea4fab@arm.com>
 <e0dc3636-8c6e-0177-9a7f-fefd28c74f27@synopsys.com>
 <dc2746c9-bde4-ac00-88d1-2bd1cea1f105@arm.com>
In-Reply-To: <dc2746c9-bde4-ac00-88d1-2bd1cea1f105@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28dbea8e-a3a5-4001-3d60-08d762e43953
x-ms-traffictypediagnostic: DM6PR12MB3338:
x-microsoft-antispam-prvs: <DM6PR12MB3338B3B518E9E6DC6294832EB6790@DM6PR12MB3338.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(366004)(136003)(376002)(346002)(199004)(189003)(476003)(31696002)(54906003)(186003)(256004)(7406005)(7416002)(14444005)(305945005)(66066001)(65806001)(71200400001)(81156014)(65956001)(7736002)(81166006)(71190400001)(99286004)(86362001)(446003)(11346002)(2616005)(478600001)(25786009)(486006)(6246003)(36756003)(316002)(76116006)(102836004)(4326008)(6506007)(2906002)(66446008)(8936002)(66556008)(58126008)(66476007)(2501003)(64756008)(110136005)(5660300002)(3846002)(6436002)(8676002)(6512007)(6116002)(14454004)(229853002)(26005)(6486002)(31686004)(91956017)(66946007)(76176011)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR12MB3338;
 H:DM6PR12MB4089.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XtKGpBsaaMrPeaBRy0h8zOYJ+LLnNSnXwi9mH/eZpVb7ma46ZxcgjNMTrcGXzN0hsofjRcgX8lIqgmsBvS4qCkrbdTehm2zXvB9MxUrzBmrmrmIag9f4b4gVbQEtI/PMOYamAkw3KtuNYhl7TySVLrV9n/3roslJmbLg8/yShuVb7H1e7RaHCk2LQDpOC6HegDtVakwEI+KkoWcN0WpURfm/4eBVxXebscpZQxcWWMqoKM0XCiPpB5MTBtWi+gRlP8BfsfrVmTGZSMqRk2EYYoF3mmMNXTNuL3GTkdYcrLZuWt4dd3kMqgyUh6N8E7Yvu+mVSAZgjrKo63Fv38I/pXuY3t4EbsdurTvrN903SG/HR7D1EDH/St830a8g8vzwnPyDcse3o2TfG8/2mBRWT8W4d3fRNsZ/29t19HrWf1R237NDBHEkB946DY7VzMGl
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DFA87E4256F23B4D9C57EFB0864104E5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 28dbea8e-a3a5-4001-3d60-08d762e43953
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 18:07:44.8861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 55pU9yaZ6oMhi8wafxb08Z5+Hjbv2SqDFDB+oMzjkWVK4HvkBhHlO7Wl6/HzP4BitruHWz8RLnOPgWPngSQmfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3338
X-OriginatorOrg: synopsys.com
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, James Hogan <jhogan@kernel.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Paul Mackerras <paulus@samba.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Dan
 Williams <dan.j.williams@intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, "x86@kernel.org" <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Mark
 Brown <broonie@kernel.org>, "Kirill A .
 Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Mike
 Rapoport <rppt@linux.vnet.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMTEvNS8xOSA3OjAzIFBNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToNCj4gQnV0IHNob3Vs
ZCBub3QgcGZuX3BtZCgpIGJlIGVuY2Fwc3VsYXRlZCBpbnNpZGUgSEFWRV9BUkNIX1RSQU5TUEFS
RU5UX0hVR0VQQUdFDQo+IGF0IHRoZSBtaW5pbXVtIChidXQgSSB3b3VsZCBzYXkgaXQgc2hvdWxk
IGJlIGF2YWlsYWJsZSBhbHdheXMsIG5vbmV0aGVsZXNzKSB3aGVuDQo+IHRoZSBwbGF0Zm9ybSBz
dWJzY3JpYmVzIHRvIFRIUCBpcnJlc3BlY3RpdmUgb2Ygd2hldGhlciBUSFAgaXMgZW5hYmxlZCBv
ciBub3QuDQoNCkZvciBBUkMgaXQgd2FzIG9ubHkgaW50cm9kdWNlZC9uZWVkZWQgd2hlbiBJIGFk
ZGVkIFRIUCBzdXBwb3J0IHNvIGl0IGlzIGRlcGVuZGVudA0KaW4gc29tZSB3YXkuDQoNCj4gSSBj
b3VsZCBzZWUgaW4gdGhlIGZpbGUgKGFyY2gvYXJjL2luY2x1ZGUvYXNtL3BndGFibGUuaCkgdGhh
dCBmZXRjaGluZyBwZm5fcG1kKCkNCj4gYW5kIGFsbCBvdGhlciBiYXNpYyBQTUQgZGVmaW5pdGlv
bnMgaXMgY29uZGl0aW9uYWwgb24gQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFLg0KPg0KPiAj
aWZkZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFDQo+ICNpbmNsdWRlIDxhc20vaHVnZXBh
Z2UuaD4NCj4gI2VuZGlmDQo+DQo+IElJVUMsIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSBz
aG91bGQgb25seSBlbmNhcHN1bGF0ZSBQTUQgcGFnZSB0YWJsZSBoZWxwZXJzDQo+IHdoaWNoIGFy
ZSBleHBlY3RlZCBmcm9tIGdlbmVyaWMgVEhQIGNvZGUgKHBtZF90cmFuc19odWdlLCBwbWRwX3Nl
dF9hY2Nlc3NfZmxhZ3MNCj4gZXRjKSBidXQgbm90IHRoZSBiYXNpYyBQTUQgaGVscGVycyBsaWtl
IHBtZF9wZm4sIHBtZF9ta3lvdW5nLCBwbWRfbWtkaXJ0eSwNCj4gcG1kX21rY2xlYW4gZXRjLiAN
Cg0KQVJDIG9ubHkgaGFzIDIgbGV2ZWxzIG9mIHBhZ2luZywgc28gdGhlc2UgZG9uJ3QgbWFrZSBh
bnkgc2Vuc2UgaW4gZ2VuZXJhbCBhbmQNCm5lZWRlZCBvbmx5IGZvciBUSFAgY2FzZS4NCkkgY2Fz
ZSBvZiBhcmNoL2FybSB5b3Ugc2VlIGl0IGlzIG9ubHkgZGVmaW5lZCBpbiBwZ3RhYmxlLTNsZXZl
bC5oDQoNCj4gSGVuY2Ugd29uZGVyaW5nIHdpbGwgaXQgYmUgcG9zc2libGUgdG8gYWNjb21tb2Rh
dGUgZm9sbG93aW5nDQo+IGNvZGUgY2hhbmdlIG9uIGFyYyBwbGF0Zm9ybSAobm90IGV2ZW4gY29t
cGlsZWQpIGluIG9yZGVyIHRvIGZpeCB0aGUgcHJvYmxlbSA/DQoNCkknbSBvcGVuIHRvIG1ha2lu
ZyBjaGFuZ2VzIGluIEFSQyBjb2RlIGJ1dCBsZXRzIGRvIHRoZSByaWdodCB0aGluZy4NCg0KPiAg
ICovDQo+IC0jaWZkZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFDQo+ICsjaWZkZWYgQ09O
RklHX0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRQ0KPiAgI2luY2x1ZGUgPGFzbS9odWdl
cGFnZS5oPg0KPiAgI2VuZGlmDQoNClRoaXMgaW4gd3JvbmcuwqAgQ09ORklHX0hBVkVfQVJDSF9U
UkFOU1BBUkVOVF9IVUdFUEFHRSBpcyBhIGp1c3QgYSBnbHVlIHRvZ2dsZSwNCnVzZWQgb25seSBp
biBLY29uZmlnIGZpbGVzIChhbmQgbm90IGluIGFueSAiQyIgY29kZSkuwqAgSXQgZW5hYmxlcyBn
ZW5lcmljIEtjb25maWcNCmNvZGUgdG8gYWxsb3cgdmlzaWJpbGl0eSBvZiBDT05GSUdfVFJBTlNQ
QVJFTlRfSFVHRVBBR0Ugdy9vIGV2ZXJ5IGFyY2ggbmVlZGluZyB0bw0KZG8gYSBtZSB0b28uDQoN
CkkgdGhpbmsgeW91IG5lZWQgdG8gdXNlIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSB0byBn
dWFyZCBhcHByb3ByaWF0ZSB0ZXN0cy4gSQ0KdW5kZXJzdGFuZCB0aGF0IGl0IG9ubHkNCg0KLVZp
bmVldA0KDQo=
