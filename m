Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4345591D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 07:23:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTls66qWcz3f75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 15:23:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ltM60Dp5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.73; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ltM60Dp5;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90073.outbound.protection.outlook.com [40.107.9.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTlrL1VXwz2yMj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 15:22:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIMdzgrB1SadWm2ntNixdUeI2tLytRrg8YjrHJYfhtJSwz2bCGtj8MWyVtM1TviWW3muyTXn4gA8v6SStuMxXiJyTEhel26wJkuhpNNg3WQAJ35gvw0f2VBd/rW/nQtZpw7Xr6amauDAKBw951eaE9qFf3cD7NhSpANioqktBAzelfMtSKvR41gRu5VDTB49LzaNDG2nIkRJjnQahqRLuJO7OcOChPnF94Wwxai4+6ahW4PpJoyoQoQTLdN4A0pyy/mM+sST6S8QDvJYeKOo/YxY14cvkKbZWBOXvJXPdvrKJZAznl2POsTpUMOAyNLRkLTCcM75oM2SkmPaH8r0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8CMthjKq6gjxJxXVOUckSCfx5NCEdDoyuA3JcvBRmo=;
 b=SWI86mixqfnYQY4B5EXjN45axnec9aGBZ/uEx/KmJZ3BmOZAalRWzReXFg8dlfge1PZ8dfRzyuWOQPY44iYDN9D9KFwOCQ93f5xnILgx7SyMguqLxEGcINz16vhM3SkMtjdWvwRfcDBXKBq5XVQXDZuYLs2XZOdNP+sazD3Yyn6Kn8TEHLp4FTI8ufKBw6Ug3xv9cxrPFhyb33xW8+kRVXqw9saiOexoN0flbQEnNr+QzNb+RcQ6V4iWD526O2UMx33uedNR7EnzvD7mHSX0H/oUmaHtoE72wAk+0UjstCVuhIrL/TzemBp2OSlh8TBwD6zx3Z38an3UFibZGnV+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8CMthjKq6gjxJxXVOUckSCfx5NCEdDoyuA3JcvBRmo=;
 b=ltM60Dp5vORb3pNhxyG0si+y5N/w7O3aH/b4IAv8/+FBkPJ01aZifjnmpSCKwjDsDel0j/xxiTtTrEpSu/IrmC3StBy35XUQxnfHoi1BfRtTvzsdLJqNSlYE6mfH3hB5jp2e8ZrpqwfU4xHlbDagTlpRlL8jTET2yDs9xy/7XZOvhDfxngwMXG9biJnXHsth8jz0D1fPSlEYNxKhcRQIRoj+70OhyLuJTsnWC+9xxNP8mL4oZHJuPAaWXBJhmmf2GaabJtNPiszJefJqw50ExYE/vqyEIMkXATgPhrLC4K4y6kkXPMFj20WgoGJe9CJYrH+aOL277M4hdjEyWfQl1w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3068.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 05:22:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.015; Fri, 24 Jun 2022
 05:22:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH V4 07/26] mm/mmap: Build protect protection_map[] with
 ARCH_HAS_VM_GET_PAGE_PROT
Thread-Topic: [PATCH V4 07/26] mm/mmap: Build protect protection_map[] with
 ARCH_HAS_VM_GET_PAGE_PROT
Thread-Index: AQHYh4UmuFs6WyWI+EODK+/fOi1l/61eBcqA
Date: Fri, 24 Jun 2022 05:22:39 +0000
Message-ID: <10aca763-2313-84bf-9200-6a6037fd748c@csgroup.eu>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-8-anshuman.khandual@arm.com>
In-Reply-To: <20220624044339.1533882-8-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c5fa3a1-17a1-4307-b2ec-08da55a18e62
x-ms-traffictypediagnostic: MRZP264MB3068:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  etIQ9TaY4zQXoCl0B+4SYTWPpvlp7RGOktENplz+KWh3AeuSYYPq6SFgsJlb9bhmdLYYSfsEhyHUMymok1i7WoMFiEsS4dN4Q6Trw7CjDcohoccDYob/Htpwr5t5lXK+YyJSjO03A6vd/NN4YmCDfd8kkEQtfvVKz3itWhmISFWBgQ8bGOOcAARsUhqdT1+XWgkQ6nM40rTpCm72wuIwDfx5/rxZmiwmchazcwhnAFYbegf96gKjE5OAmDZSSH3rwKP9aY25oNiKVlQ+R7/IIKIceIhtZHfYL5utxlmpQ163gvDo+S9hoqh/r7InirkpQpG6NqAFOE9kAopf16ve9YGZnJWu+Jh+4WmUxwcIBbFBMCbPdzOfev4pY8xbxyLJtwHZn7JNcRPaLtKw3F1Amti99BtXkctqqd/EbpBoVKjjapM1JYb5cBgIB8hDsZsJIVx4pK4n35bt/V2GM/WhEc8fd9CSwKXAR01NRNgSawV141EAgrmt9nBcByfmONYidyAwpX1GNJRAb6G7NPMlSrbMW0T9KOBEDzGmayOL2/FwIqPRWRlGm0UewQFPbCStrnzmZrdHtQAQ8W0J/W80Nl/j+PKd+Lq20lNqY5Gobwo7IfBAOlujBn4Gh3+A5b+rKKLfkqpk/Dn9g+I5nDCqgxJpv2tctVXxao+R5l9MI3vo465PJYscXvitmsvsjp8MjvropVcw1pSTgDLmPAbOe2xhMXjvIoWKqPdMr3XBEt/5Rv2hLb+TbzTUocEDcHZsOr+6H9hpovKtMMXAcB1crI26aHei8j1bym2ar2vz6iwJ2nc6TF4u/SNc51o/j9ewicH7X0P20NjgrA1hz5oYMfefAjs6tzAXJVd4Iv7areA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(6512007)(83380400001)(6506007)(38100700002)(31686004)(478600001)(6486002)(2906002)(316002)(36756003)(41300700001)(26005)(2616005)(54906003)(31696002)(66556008)(8676002)(76116006)(4326008)(91956017)(66476007)(66446008)(66946007)(64756008)(71200400001)(44832011)(122000001)(7416002)(8936002)(186003)(38070700005)(110136005)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WWJFR2h2anY1VE1wSTFWMTU0T1grTjduNllrTUN3NlNWUS94a0dDWjdiUVl2?=
 =?utf-8?B?aDJkMjJTcEdtcU9wTjJYdHc1WEF5ZDB1Zjd1d254WkcvRkYyNXd5TlNVTFJo?=
 =?utf-8?B?ckZGU1Fvc2tSOHI0U2xZSlJDUlFzd2xGaHZId2RvNTZ4Z1pxc0RNdklxNm1p?=
 =?utf-8?B?MktXS0xiZE5JZy9HWnM3L1p0YmpkM2ZVcm1qQUdEMDI0TllPb1AveXluaDhn?=
 =?utf-8?B?aCtkbFd2clZOUFZ6V2RoTVRscVF3VnNpbHcrRktoVWpnV0hKcWFQOG9rTENB?=
 =?utf-8?B?WExLeWh6UXJlTTJUNHdMYWc0cm1rZnhSSjFZVnNFTjZVZCtmeVU4RGFSclJO?=
 =?utf-8?B?UlNkUzB0UTF0TEFndXRwYWRsQkZLcFlOWEJRUnFkL0wzZktqYUJZTGNsaFQ2?=
 =?utf-8?B?cldxcTZVWE5PYnBxTGlxRTk2TlNaZThnd2ZIQVRuK2FPZExsQ3dLeE5LV2pI?=
 =?utf-8?B?YUhIYzRacGF4ZjlCbXl5UHMvWTBQakVIa1hWaldXNEZwUzNKUUFGbzlCODE3?=
 =?utf-8?B?WDNkakwxdVJheDM1eTJwTkg1V09Zc0VRd21meFc1eTdXalM3QTUwanZqbTcw?=
 =?utf-8?B?bVpaaU80UHNsbXBMMzMrOUhkaU1QODY4YUxqMlJZL3pWMDlIRmFKY0dXSmFD?=
 =?utf-8?B?Q0E2UlYxVTBlY1dkZ3pvQlQxUWRTT0JVOWl3YUlQVkxxVmdQRHVBMEpmTkRP?=
 =?utf-8?B?TjdSRGJlVlR2czVVZXBNcUNiTkNraTRQN2psRXpzN0x3ZzR6ZFQ1UFpwNFdu?=
 =?utf-8?B?MTNHQVFqQ1Q1dElKZ3gxVG51Q2FrSzl5NWRLWTRXZ1BDU09oWGg5RUFTQlBH?=
 =?utf-8?B?WFFxb1d2SkFmUmVyMVp0RHgvb2RUblFsaGpHSi9qMGJTV2Zma25BbmtVbDBG?=
 =?utf-8?B?YjZKU2h4Y2NsSGN2UXkrcWtYTTNDekN2NEJwZ1FpVFJUeVI5aVNpNG5lU3ZJ?=
 =?utf-8?B?aEpWWmh4U28wZG8rdnc5dThIK25PZ0paaGpTaVZkaGFaNzd6VXdueGxKeklL?=
 =?utf-8?B?bUV2RWJvZVdPc0Y1TWtHQU03WW1YUkFtZUxuaktSTkNaelZHTEJBVk4rVnRC?=
 =?utf-8?B?ZEhJTDAyN29GbGljVUVScXRSK2N2clpSNVBUa2NyTFdCYXJNL01CUnBDRlcx?=
 =?utf-8?B?YzNsQmtqWWx6S2wvbTd5UkMxVi8vci9oNFlOMmtEbUdzR0tOWTQ4dkJFSGdT?=
 =?utf-8?B?dlBDbzkyTVBRbEdTSkFSaVpka3NOMFBVdU1sNDNxRDVES25KMHhVeGZzZUhC?=
 =?utf-8?B?d2pmUWVKVEx1YkkwOEJvOXQ4Qktkd0wrejZpYlgrQnFIdi8ydE1NWmQzOHh4?=
 =?utf-8?B?cGlWdjZUSjkvRnhMUHN3RGJhcklxL3h1cTc5VC9mb21vN2VIU01wd3Y2YnBi?=
 =?utf-8?B?cmhQRGZmejVmckl0cGtrbk9nQzNCY1d2cjlRNHZJUTFTK0VtcUFINjdKVHN3?=
 =?utf-8?B?enR3RUZsL1N4b3V6dVoxMEVTVnNCL0NlYWxMY0dob0gxZ2Y2NjJtRyszdldH?=
 =?utf-8?B?Y0dMQXRaRFZLNURMSXpCeVBEQndjU1BFTUdIZTRRaWxpNzhacHZ1RE1MaDJG?=
 =?utf-8?B?WWtHWHA4K21rdWduVVNRNU5WNlN3NDdOSml4bDZwbm0zT09INXRPOHdWVWhW?=
 =?utf-8?B?LzdkWGJVaUM5VjI2MzNhWEllK3lOblByNUNrRUp2dFNEVWhqM0kvbUttcTd5?=
 =?utf-8?B?dW54UUdiZVp4MVk5ZGV5WDdUMkpSWDJHcXllbjNXb3JpWVd1R3oxRjlONk5K?=
 =?utf-8?B?SjAxbGVGTnhqbnMyTnZpSVgyNndCdWpaNUY4V0JOc0gxc2htVkZnSkFhYmY5?=
 =?utf-8?B?WmMrMTBnZ3RhZnQ3TzlrMTF5elN1MHp0NmZ0TW1zZHEvYzBIYmhxdFc3N2pK?=
 =?utf-8?B?UGJ1VjBRajdKSU9EZzVoVHhtdTFGOXpRUFFiK2N0M2EyNlBvZVhQakZKZjF0?=
 =?utf-8?B?NFhkREFtaXEwcE1zSE95UW4vNWVjS1dxeTJOU2RtSUR6L1lmZzFwdmpMYmhE?=
 =?utf-8?B?NURTSFE3Tk05MFFKTW9xalliR3N0ZVhpalNSY3U3SlZBQWY4RHJFOGtxTk1E?=
 =?utf-8?B?K1llVXgvT3NRNUd0NVVQejg0YXdiYU4xc0ZtTzdDelhUWnZwNzB3Z3lScFhK?=
 =?utf-8?B?T0w5Zkh3di9IN0NSblFNcFRiWFd6TEVkczQ2dFBRRzdzbzUyS0pyVE1acFdy?=
 =?utf-8?Q?+3DtW2fUt0EbY39cJnTHYEw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B8A216CE4B01D4CBB97BDEBCC820B57@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5fa3a1-17a1-4307-b2ec-08da55a18e62
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 05:22:39.2649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JEq+cr75N/6NC/Kz0BySfvqwYK9oYRxf1mscr2gQls81n589voBdSg2vvJolwrBED91qBV1PccgiYZgiwnbKmeCejdhFOiot8fBYSev1y38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3068
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
Cc: "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linux-snps
 -arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA2LzIwMjIgw6AgMDY6NDMsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IHByb3RlY3Rpb25fbWFwW10gaGFzIGFscmVhZHkgYmVlbiBtb3ZlZCBpbnNpZGUgdGhvc2Ug
cGxhdGZvcm1zIHdoaWNoIGVuYWJsZQ0KDQpVc3VhbGx5ICJhbHJlYWR5IiBtZWFucyBiZWZvcmUg
eW91ciBzZXJpZXMuDQoNCllvdXIgc2VyaWVzIGlzIHRoZSBvbmUgdGhhdCBtb3ZlcyBwcm90ZWN0
aW9uX21hcFtdIHNvIEkgd291bGQgaGF2ZSBqdXN0IA0Kc2FpZCAiTm93IHRoYXQgcHJvdGVjdGlv
bl9tYXBbXSBoYXMgYmVlbiBtb3ZlZCBpbnNpZGUgdGhvc2UgcGxhdGZvcm1zIA0Kd2hpY2ggZW5h
YmxlIC4uLi4iDQoNCj4gQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4gSGVuY2UgZ2VuZXJpYyBw
cm90ZWN0aW9uX21hcFtdIGFycmF5IG5vdyBjYW4gYmUNCj4gcHJvdGVjdGVkIHdpdGggQ09ORklH
X0FSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QgaW50ZWFkIG9mIF9fUDAwMC4NCj4gDQo+IENjOiBB
bmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPg0KPiBDYzogbGludXgtbW1A
a3ZhY2sub3JnDQo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1v
ZmYtYnk6IEFuc2h1bWFuIEtoYW5kdWFsIDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPg0KPiAt
LS0NCj4gICBpbmNsdWRlL2xpbnV4L21tLmggfCAyICstDQo+ICAgbW0vbW1hcC5jICAgICAgICAg
IHwgNSArLS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUv
bGludXgvbW0uaA0KPiBpbmRleCAyMzc4MjhjMmJhZTIuLjcwZDkwMGY2ZGY0MyAxMDA2NDQNCj4g
LS0tIGEvaW5jbHVkZS9saW51eC9tbS5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaA0KPiBA
QCAtNDI0LDcgKzQyNCw3IEBAIGV4dGVybiB1bnNpZ25lZCBpbnQga29ianNpemUoY29uc3Qgdm9p
ZCAqb2JqcCk7DQo+ICAgICogbWFwcGluZyBmcm9tIHRoZSBjdXJyZW50bHkgYWN0aXZlIHZtX2Zs
YWdzIHByb3RlY3Rpb24gYml0cyAodGhlDQo+ICAgICogbG93IGZvdXIgYml0cykgdG8gYSBwYWdl
IHByb3RlY3Rpb24gbWFzay4uDQo+ICAgICovDQo+IC0jaWZkZWYgX19QMDAwDQo+ICsjaWZuZGVm
IENPTkZJR19BUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+ICAgZXh0ZXJuIHBncHJvdF90IHBy
b3RlY3Rpb25fbWFwWzE2XTsNCg0KSXMgdGhpcyBkZWNsYXJhdGlvbiBzdGlsbCBuZWVkZWQgPyBJ
IGhhdmUgdGhlIGZlZWxpbmcgdGhhdCANCnByb3RlY3Rpb25fbWFwW10gaXMgb25seSB1c2VkIGlu
IG1tL21tYXAuYyBub3cuDQoNCj4gICAjZW5kaWYNCj4gICANCj4gZGlmZiAtLWdpdCBhL21tL21t
YXAuYyBiL21tL21tYXAuYw0KPiBpbmRleCA1NWMzMGFlZTM5OTkuLjQzZGIzYmQ0OTA3MSAxMDA2
NDQNCj4gLS0tIGEvbW0vbW1hcC5jDQo+ICsrKyBiL21tL21tYXAuYw0KPiBAQCAtMTAxLDcgKzEw
MSw3IEBAIHN0YXRpYyB2b2lkIHVubWFwX3JlZ2lvbihzdHJ1Y3QgbW1fc3RydWN0ICptbSwNCj4g
ICAgKgkJCQkJCQkJdzogKG5vKSBubw0KPiAgICAqCQkJCQkJCQl4OiAoeWVzKSB5ZXMNCj4gICAg
Ki8NCj4gLSNpZmRlZiBfX1AwMDANCj4gKyNpZm5kZWYgQ09ORklHX0FSQ0hfSEFTX1ZNX0dFVF9Q
QUdFX1BST1QNCj4gICBwZ3Byb3RfdCBwcm90ZWN0aW9uX21hcFsxNl0gX19yb19hZnRlcl9pbml0
ID0gew0KDQpTaG91bGQgdGhpcyBiZSBzdGF0aWMsIGFzIGl0IHNlZW1zIHRvIG5vdyBiZSB1c2Vk
IG9ubHkgaW4gdGhpcyBmaWxlID8NCkFuZCBpdCBjb3VsZCBhbHNvIGJlICdjb25zdCcgaW5zdGVh
ZCBvZiBfX3JvX2FmdGVyX2luaXQuDQoNCj4gICAJW1ZNX05PTkVdCQkJCQk9IF9fUDAwMCwNCj4g
ICAJW1ZNX1JFQURdCQkJCQk9IF9fUDAwMSwNCj4gQEAgLTEyMCw5ICsxMjAsNiBAQCBwZ3Byb3Rf
dCBwcm90ZWN0aW9uX21hcFsxNl0gX19yb19hZnRlcl9pbml0ID0gew0KPiAgIAlbVk1fU0hBUkVE
IHwgVk1fRVhFQyB8IFZNX1dSSVRFXQkJPSBfX1MxMTAsDQo+ICAgCVtWTV9TSEFSRUQgfCBWTV9F
WEVDIHwgVk1fV1JJVEUgfCBWTV9SRUFEXQk9IF9fUzExMQ0KPiAgIH07DQo+IC0jZW5kaWYNCj4g
LQ0KPiAtI2lmbmRlZiBDT05GSUdfQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVA0KPiAgIERFQ0xB
UkVfVk1fR0VUX1BBR0VfUFJPVA0KPiAgICNlbmRpZgkvKiBDT05GSUdfQVJDSF9IQVNfVk1fR0VU
X1BBR0VfUFJPVCAqLw0KPiAgIA==
