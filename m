Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D808F7F64
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 20:10:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BgSm2YJVzF4B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 06:10:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=synopsys.com (client-ip=149.117.87.133;
 helo=smtprelay-out1.synopsys.com; envelope-from=vineet.gupta1@synopsys.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=synopsys.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="YHY6a4dx";
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=synopsys.onmicrosoft.com
 header.i=@synopsys.onmicrosoft.com header.b="ohcz7XLj"; 
 dkim-atps=neutral
Received: from smtprelay-out1.synopsys.com (us03-smtprelay2.synopsys.com
 [149.117.87.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BgN24Xy5zF4Mr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 06:06:40 +1100 (AEDT)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BA50FC08B5;
 Mon, 11 Nov 2019 19:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573499197; bh=QBVdyiKQbS3H1lagoc5mtPh+ja7kNaVS5m18UIbFmS4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=YHY6a4dxeepbBRRazqGdsalzyTjPjbVn1ZDtMMYJBruh+gtAiLVOvJFUqe+Clh6d+
 Yg7ZypWUASh96P1hLKcpl66yTGpGNEHTimEa/taGmVVx4t7s2wZdgTZaiB2nbnY2Pj
 7CbDyYKirnPCpFPtmgNdKBwhGtrqashme9lIP7n9IagRmnBV+Wg8VfbVhrXu4KPsdH
 xmy/LiozUow6kFBQAG0ieQhEcjJyE1lXrTeiG6tClGwl7qzlctw1/7QvLE964wlGBp
 U0ohVw1+rLsbSFz/Wv/M4PihCg2ULkpu//cz/rl9ETM5p3BcxgpgE2qZNRAQNh4AaG
 dAxaAL4kzXNeA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C537DA006A;
 Mon, 11 Nov 2019 19:06:23 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 11 Nov 2019 11:06:23 -0800
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 11 Nov 2019 11:06:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bqq0cvWoVfXnPmKF9cJGV+p3kv/KKqWDhyBZ7c3tpNQxxPXlKa/a3Ze5jtinqq32ZL8qc6rghuwwJpQHRSaW4AF7b3BfA6v8DSiDXqNJDTYCXEMilWt76mKvPhgTTTWzB2XtXLiBNhG98LlAtIP2fYd3W6+fu7hITVCsFRTytL3uU9hdo3kgcwJdVu7fid4N6WKCPNpnJpevKW6ogi8s8kPYioIfv2tDxI0vrv238y/0JhKk+AmReI7xY96lRR5ijxKE02CsUQ8jzwpQAILlt3uHHZU7RQY1KwtGxtzGJLmG5ZNzbu11X1pn6aNoGEoHyJQRsVfX/VDoTiZmoBDIfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBVdyiKQbS3H1lagoc5mtPh+ja7kNaVS5m18UIbFmS4=;
 b=l9vb0x8Hi/aPs2x0Vg2JlqmQ9jnK5QLR4inHSDqtNDbxvLchES31MFQ9HUL5KfBAQRXTBnMzHdbvTTMUuRZCWz00QKx4YWyVg4hTcwnRd1IqJrXBittSgvj4vd79UyIh9yMMP5Cgppq3rDsN6HWTl53ZNz7jzY1LxLlc9YZdiLA4vj9LWpyODMyoR8Soi8pm+wnBcMH0hAoHGXsPjORBefaBb0C/WrJu+dZxKCglyTTjpfHSm59MSiU7KvT/8WhC3fOS0e816rSUFhI7B8ONQdjx5i7HJ3Vnsw6TKxjKQ4FTpX5WFIB+9LcdsSn6dDrt/4q84lawuF4DfSW66tbFSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBVdyiKQbS3H1lagoc5mtPh+ja7kNaVS5m18UIbFmS4=;
 b=ohcz7XLjlKDppAYDc8jPlBR1OtepkrQ0a2m5nWakFXFdbOFoyDfDL7mM75UY65TZQ3DI4AjtHpo9/Cy08DoGJpsTVLs9h94ObpEUZ04/+UYPwq7b4UtoQBGZ/FsXtsdDq75FKRjWbkNip81Fd6erI/g38LCTcU5ow5LVk0yBU20=
Received: from DM6PR12MB4089.namprd12.prod.outlook.com (10.141.184.211) by
 DM6PR12MB2779.namprd12.prod.outlook.com (20.176.114.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Mon, 11 Nov 2019 19:06:22 +0000
Received: from DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd]) by DM6PR12MB4089.namprd12.prod.outlook.com
 ([fe80::19df:560:b8d3:e1cd%5]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 19:06:22 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table
 helpers
Thread-Topic: [PATCH V8] mm/debug: Add tests validating architecture page
 table helpers
Thread-Index: AQHVk2wP8ZQH8Ag2aUW4lQaNsiawtKd9KlIAgABMeACAAPyJgIAAseoAgADwcQCAAJ0WAIAFrJmA
Date: Mon, 11 Nov 2019 19:06:22 +0000
Message-ID: <0ee4ff85-40f0-73c2-62cc-32d5ea551dbe@synopsys.com>
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
 <e0aa8d49-5511-15e4-f413-62c99eea4fab@arm.com>
 <e0dc3636-8c6e-0177-9a7f-fefd28c74f27@synopsys.com>
 <dc2746c9-bde4-ac00-88d1-2bd1cea1f105@arm.com>
 <b93ffe1f-b198-a042-ecd4-b0f2b0171f72@synopsys.com>
 <da665683-6946-b411-57f9-e1689d4b50fe@arm.com>
 <c204de13-48e7-015f-1a09-263fce7882f1@synopsys.com>
 <a4c5f1cd-7d9e-0f97-5e0e-19d17adc5b33@arm.com>
In-Reply-To: <a4c5f1cd-7d9e-0f97-5e0e-19d17adc5b33@arm.com>
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
x-ms-office365-filtering-correlation-id: 345beb3d-cf55-442d-25a1-08d766da3dc7
x-ms-traffictypediagnostic: DM6PR12MB2779:
x-microsoft-antispam-prvs: <DM6PR12MB277917A1673595A37A03978BB6740@DM6PR12MB2779.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(39860400002)(136003)(366004)(376002)(189003)(199004)(6246003)(6512007)(26005)(446003)(11346002)(186003)(65806001)(71200400001)(71190400001)(2616005)(65956001)(3846002)(6116002)(2906002)(102836004)(66066001)(476003)(486006)(6506007)(53546011)(66476007)(7406005)(7416002)(4326008)(99286004)(76176011)(14454004)(478600001)(2501003)(86362001)(31696002)(76116006)(66946007)(229853002)(316002)(305945005)(6436002)(8676002)(66446008)(58126008)(7736002)(31686004)(8936002)(54906003)(110136005)(5660300002)(36756003)(64756008)(66556008)(6486002)(256004)(14444005)(81156014)(25786009)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR12MB2779;
 H:DM6PR12MB4089.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YETJBIvfNW/TAUehYyurxDHG+LaLC001tEJd/8NX/Y9VdrncXZEt4DqNDtsLIqz/lVevMHqHZT03p0/4KZM8pcbSZgXpQSY4kIipSsANZDQO3kHe4ZWVtuyuuAyH06cu29KY9S3hQgWzoWdUOImbi5FV+wm2arM/SYimUr7bT4+D+0cI0N4KlPte/C/GuSSkew9OcxeanW4S5o6+C2vr2oxqW3vd3dRy53EekbT0bQkShbT2om4kcpxFGS1o/cXQLKiCy3hzast+w1dF6i3WcXad+aQZaYuTPtdN0TCFteYZAtbMJbdRaPf2oeBAKJpeNXeA9T/ZVniH+/60xC1cbftpjp4g6ImGAWMzus7x2BNNn/TdhuK07ggpQRmR5YOK895cd4QkjQr/0SyIRKjqw9ab6wAzXVSSCv/K1UPbWT4SZb6PjQ5Paebt6BdqH8T1
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <44CE0A6AF55EF049A3A7CA9B4287DAD7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 345beb3d-cf55-442d-25a1-08d766da3dc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 19:06:22.1231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3a4xRHOT2LulyxBkptagS5hDRt59x3Z240bn0UgFriCcIp19lK20gFYofLUJtWlhJnNNPUjiu1Q1Pk4lDzC0Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2779
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

T24gMTEvNy8xOSA4OjI3IFBNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToNCj4NCj4gT24gMTEv
MDgvMjAxOSAxMjozNSBBTSwgVmluZWV0IEd1cHRhIHdyb3RlOg0KPj4gT24gMTEvNi8xOSA4OjQ0
IFBNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToNCj4+Pj4+ICAgKi8NCj4+Pj4+IC0jaWZkZWYg
Q09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFDQo+Pj4+PiArI2lmZGVmIENPTkZJR19IQVZFX0FS
Q0hfVFJBTlNQQVJFTlRfSFVHRVBBR0UNCj4+Pj4+ICAjaW5jbHVkZSA8YXNtL2h1Z2VwYWdlLmg+
DQo+Pj4+PiAgI2VuZGlmDQo+Pj4+IFRoaXMgaW4gd3JvbmcuwqAgQ09ORklHX0hBVkVfQVJDSF9U
UkFOU1BBUkVOVF9IVUdFUEFHRSBpcyBhIGp1c3QgYSBnbHVlIHRvZ2dsZSwNCj4+Pj4gdXNlZCBv
bmx5IGluIEtjb25maWcgZmlsZXMgKGFuZCBub3QgaW4gYW55ICJDIiBjb2RlKS7CoCBJdCBlbmFi
bGVzIGdlbmVyaWMgS2NvbmZpZw0KPj4+PiBjb2RlIHRvIGFsbG93IHZpc2liaWxpdHkgb2YgQ09O
RklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFIHcvbyBldmVyeSBhcmNoIG5lZWRpbmcgdG8NCj4+Pj4g
ZG8gYSBtZSB0b28uDQo+Pj4+DQo+Pj4+IEkgdGhpbmsgeW91IG5lZWQgdG8gdXNlIENPTkZJR19U
UkFOU1BBUkVOVF9IVUdFUEFHRSB0byBndWFyZCBhcHByb3ByaWF0ZSB0ZXN0cy4gSQ0KPj4+PiB1
bmRlcnN0YW5kIHRoYXQgaXQgb25seQ0KPj4+IFdlIGNhbiBwcm9iYWJseSByZXBsYWNlIENPTkZJ
R19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0Ugd3JhcHBlciB3aXRoDQo+Pj4gQ09ORklH
X1RSQU5TUEFSRU5UX0hVR0VQQUdFLiBCdXQgQ09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9I
VUdFUEFHRV9QVUQNCj4+PiBleHBsaWNpdGx5IGRlcGVuZHMgb24gQ09ORklHX1RSQU5TUEFSRU5U
X0hVR0VQQUdFIGFzIGEgcHJlcmVxdWlzaXRlLiBDb3VsZA0KPj4+IHlvdSBwbGVhc2UgY29uZmly
bSBpZiB0aGUgZm9sbG93aW5nIGNoYW5nZSBvbiB0aGlzIHRlc3Qgd2lsbCB3b3JrIG9uIEFSQw0K
Pj4+IHBsYXRmb3JtIGZvciBib3RoIFRIUCBhbmQgIVRIUCBjYXNlcyA/IFRoYW5rIHlvdS4NCj4+
Pg0KPj4+IGRpZmYgLS1naXQgYS9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMgYi9tbS9kZWJ1Z192bV9w
Z3RhYmxlLmMNCj4+PiBpbmRleCA2MjFhYzA5Li45OWViYzdjIDEwMDY0NA0KPj4+IC0tLSBhL21t
L2RlYnVnX3ZtX3BndGFibGUuYw0KPj4+ICsrKyBiL21tL2RlYnVnX3ZtX3BndGFibGUuYw0KPj4+
IEBAIC02Nyw3ICs2Nyw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwdGVfYmFzaWNfdGVzdHModW5z
aWduZWQgbG9uZyBwZm4sIHBncHJvdF90IHByb3QpDQo+Pj4gIAlXQVJOX09OKHB0ZV93cml0ZShw
dGVfd3Jwcm90ZWN0KHB0ZSkpKTsNCj4+PiAgfQ0KPj4+ICANCj4+PiAtI2lmZGVmIENPTkZJR19I
QVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0UNCj4+PiArI2lmZGVmIENPTkZJR19UUkFOU1BB
UkVOVF9IVUdFUEFHRQ0KPj4+ICBzdGF0aWMgdm9pZCBfX2luaXQgcG1kX2Jhc2ljX3Rlc3RzKHVu
c2lnbmVkIGxvbmcgcGZuLCBwZ3Byb3RfdCBwcm90KQ0KPj4+ICB7DQo+Pj4gIAlwbWRfdCBwbWQg
PSBwZm5fcG1kKHBmbiwgcHJvdCk7DQo+Pj4gQEAgLTg1LDkgKzg1LDYgQEAgc3RhdGljIHZvaWQg
X19pbml0IHBtZF9iYXNpY190ZXN0cyh1bnNpZ25lZCBsb25nIHBmbiwgcGdwcm90X3QgcHJvdCkN
Cj4+PiAgCSAqLw0KPj4+ICAJV0FSTl9PTighcG1kX2JhZChwbWRfbWtodWdlKHBtZCkpKTsNCj4+
PiAgfQ0KPj4+IC0jZWxzZQ0KPj4+IC1zdGF0aWMgdm9pZCBfX2luaXQgcG1kX2Jhc2ljX3Rlc3Rz
KHVuc2lnbmVkIGxvbmcgcGZuLCBwZ3Byb3RfdCBwcm90KSB7IH0NCj4+PiAtI2VuZGlmDQo+Pj4g
IA0KPj4+ICAjaWZkZWYgQ09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRV9QVUQN
Cj4+PiAgc3RhdGljIHZvaWQgX19pbml0IHB1ZF9iYXNpY190ZXN0cyh1bnNpZ25lZCBsb25nIHBm
biwgcGdwcm90X3QgcHJvdCkNCj4+PiBAQCAtMTEyLDYgKzEwOSwxMCBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgcHVkX2Jhc2ljX3Rlc3RzKHVuc2lnbmVkIGxvbmcgcGZuLCBwZ3Byb3RfdCBwcm90KQ0K
Pj4+ICAjZWxzZQ0KPj4+ICBzdGF0aWMgdm9pZCBfX2luaXQgcHVkX2Jhc2ljX3Rlc3RzKHVuc2ln
bmVkIGxvbmcgcGZuLCBwZ3Byb3RfdCBwcm90KSB7IH0NCj4+PiAgI2VuZGlmDQo+Pj4gKyNlbHNl
DQo+Pj4gK3N0YXRpYyB2b2lkIF9faW5pdCBwbWRfYmFzaWNfdGVzdHModW5zaWduZWQgbG9uZyBw
Zm4sIHBncHJvdF90IHByb3QpIHsgfQ0KPj4+ICtzdGF0aWMgdm9pZCBfX2luaXQgcHVkX2Jhc2lj
X3Rlc3RzKHVuc2lnbmVkIGxvbmcgcGZuLCBwZ3Byb3RfdCBwcm90KSB7IH0NCj4+PiArI2VuZGlm
DQo+PiBGYWlscyB0byBidWlsZCBmb3IgVEhQIGNhc2Ugc2luY2UNCj4+DQo+PiBDT05GSUdfVFJB
TlNQQVJFTlRfSFVHRVBBR0U9eQ0KPj4gQ09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdF
UEFHRV9QVUQ9bg0KPj4NCj4+IC4uL21tL2RlYnVnX3ZtX3BndGFibGUuYzoxMTI6MjA6IGVycm9y
OiByZWRlZmluaXRpb24gb2Yg4oCYcG1kX2Jhc2ljX3Rlc3Rz4oCZDQo+Pg0KPiBIbW0sIHJlYWxs
eSA/IFdpdGggYXJtNjQgZGVmY29uZmlnIHdlIGhhdmUgdGhlIHNhbWUgZGVmYXVsdCBjb21iaW5h
dGlvbg0KPiB3aGVyZSBpdCBidWlsZHMuDQo+DQo+IENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFH
RT15DQo+IENPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0U9eQ0KPiBDT05GSUdf
SEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFX1BVRD1uCS8qIEl0IHNob3VsZCBub3QgZXZl
biBhcHBlYXIgKi8NCj4NCj4gV2l0aCB0aGUgYWJvdmUgY2hhbmdlLCB3ZSBoYXZlIG5vdw0KPg0K
PiAjaWZkZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFDQo+IHN0YXRpYyB2b2lkIF9faW5p
dCBwbWRfYmFzaWNfdGVzdHModW5zaWduZWQgbG9uZyBwZm4sIHBncHJvdF90IHByb3QpDQo+IHsN
Cj4gLS0tLQ0KPiAtLS0tDQo+IH0NCj4NCj4gI2lmZGVmIENPTkZJR19IQVZFX0FSQ0hfVFJBTlNQ
QVJFTlRfSFVHRVBBR0VfUFVEDQo+IHN0YXRpYyB2b2lkIF9faW5pdCBwdWRfYmFzaWNfdGVzdHMo
dW5zaWduZWQgbG9uZyBwZm4sIHBncHJvdF90IHByb3QpDQo+IHsNCj4gLS0tLQ0KPiAtLS0tDQo+
IH0NCj4gI2Vsc2UgLyogIUNPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0VfUFVE
ICovDQo+IHN0YXRpYyB2b2lkIF9faW5pdCBwdWRfYmFzaWNfdGVzdHModW5zaWduZWQgbG9uZyBw
Zm4sIHBncHJvdF90IHByb3QpIHsgfQ0KPiAjZW5kaWYNCj4gI2Vsc2UJLyogIUNPTkZJR19UUkFO
U1BBUkVOVF9IVUdFUEFHRSAqLw0KPiBzdGF0aWMgdm9pZCBfX2luaXQgcG1kX2Jhc2ljX3Rlc3Rz
KHVuc2lnbmVkIGxvbmcgcGZuLCBwZ3Byb3RfdCBwcm90KSB7IH0NCj4gc3RhdGljIHZvaWQgX19p
bml0IHB1ZF9iYXNpY190ZXN0cyh1bnNpZ25lZCBsb25nIHBmbiwgcGdwcm90X3QgcHJvdCkgeyB9
DQo+ICNlbmRpZg0KPg0KPiBXaGVuICFDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UNCj4NCj4g
LSBEdW1teSBkZWZpbml0aW9ucyBmb3IgcG1kX2Jhc2ljX3Rlc3RzKCkgYW5kIHB1ZF9iYXNpY190
ZXN0cygpDQo+DQo+IFdoZW4gQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFIGFuZCAhQ09ORklH
X0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRV9QVUQNCj4NCj4gLSBBY3R1YWwgcG1kX2Jh
c2ljX3Rlc3RzKCkgYW5kIGR1bW15IHB1ZF9iYXNpY190ZXN0cygpDQo+DQo+IFdoZW4gQ09ORklH
X1RSQU5TUEFSRU5UX0hVR0VQQUdFIGFuZCBDT05GSUdfSEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hV
R0VQQUdFX1BVRA0KPg0KPiAtIEFjdHVhbCBwbWRfYmFzaWNfdGVzdHMoKSBhbmQgcHVkX2Jhc2lj
X3Rlc3RzKCkNCj4NCj4gVGVzdGVkIHRoaXMgb24gYXJtNjQgd2hpY2ggZG9lcyBub3QgaGF2ZSBD
T05GSUdfSEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFX1BVRA0KPiBmb3IgVEhQIGFuZCAh
VEhQIGFuZCBvbiB4ODYgd2hpY2ggaGFzIENPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVH
RVBBR0VfUFVEDQo+IGZvciBUSFAgYW5kICFUSFAgd2hpY2ggYmFzaWNhbGx5IGNvdmVyZWQgYWxs
IGNvbWJpbmF0aW9uIGZvciB0aGVzZSBjb25maWdzLg0KPg0KPiBJcyB0aGVyZSBzb21ldGhpbmcg
SSBhbSBzdGlsbCBtaXNzaW5nIGluIHBsYWluIHNpZ2h0IDopDQoNClNvcnJ5IG15IGJhZC4gSSBh
cHBsaWVkIHlvdXIgbWFudWFsIGh1bmsgbWluZGxlc3NseSBhbmQgbWlzc2VkIHRoZSBuZXN0ZWQg
I2Vsc2UuDQpTbyBpbmRlZWQgaXQgd29ya3MuIEFsdGhvdWdoIHRoZSBzdHViIGZvciBwdWRfYmFz
aWNfdGVzdHMoKSBpcyBub3cgZGVmaW5lZCB0d2ljZQ0Kd2hpY2ggbWFrZXMgaXQgYSBiaXQgdWds
eS4gQnV0IEknbGwgbGVhdmUgdGhhdCB0byB5b3UuDQoNClRoeCwNCi1WaW5lZXQNCg0KDQo=
