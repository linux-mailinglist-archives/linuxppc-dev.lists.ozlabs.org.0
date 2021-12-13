Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 608AF472F8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 15:40:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCPLG1d0Jz3c73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 01:40:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::604;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCPKl265fz2yJL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 01:39:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VW1OyLlY615zMryDmeZQlO/newz24hiGX0XwQwP7KVn0BMmsE+Mwm0lmlpozD9+n9ukvV6/nR2DItedjv3+2s78lJQkkr7dOklKkhoExyq6nfhooGEVCzKzBNp6zJQM7rY5Fl336e1NvbNDqgj+4cmug6HwKjXtbrr4aAxyQjsDwNBxFMs6ZkEIWdtjpL/HWhy4MrFY991J1cq+ETUooyzWiy0WO69AWHElNtLKDPKqraAAxxh2JcE4bb5P9V71SeOKgJp+iea8KLgGAEUcL08dYjoIp0GlUge7/6rw4heYYrVvk0YEZBLBJJNxo89Xx87Bt03ER2Gh9c2+QvLmbsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZ4njUpgx/7hIkV27E+CdURWlv5ieX945djZEz/Nrjg=;
 b=IG82cUb3P2HoB3iErtC3mepWmIYxoG8eRV6gAiPZwBtN9LE6XtuWE8q+4wlzRaGRp7BVBO98+K8ZYLunTjV4KCrQ9QylQNCgByJ+T8NUo64wBDciGCeAI5XOYtxUXhf56EJZhOClv74VU3keuCTf/Z41qwtoMIld38OL9AUxk8IqllB+UknMGYxiKPNWYGlkcKOJ45wB916sy7j+qSmRPNdp+09wuJaKQkGOP+TWtarxGHNdrtkmi9gQtvaabErQNx7S8PRG3PytQzXN4B0wyLM/zFZfbWYFmCsJ1Mr6DGkCWgxhJ2VIQGs/CWtv2T0Ig1SCDT/HUc3tubPAVUAzjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2908.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:19::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Mon, 13 Dec
 2021 14:39:16 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 14:39:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v1 0/5] Implement livepatch on PPC32
Thread-Topic: [PATCH v1 0/5] Implement livepatch on PPC32
Thread-Index: AQHXy/a61L5ufkyTwk+E9T1IN+85JqvoaYCAgEhc+YA=
Date: Mon, 13 Dec 2021 14:39:15 +0000
Message-ID: <6209682d-0caa-b779-8763-376a984d8ed8@csgroup.eu>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
 <20211028093547.48c69dfe@gandalf.local.home>
In-Reply-To: <20211028093547.48c69dfe@gandalf.local.home>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a943eb41-fc34-43b9-fc69-08d9be46569f
x-ms-traffictypediagnostic: MRZP264MB2908:EE_
x-microsoft-antispam-prvs: <MRZP264MB29087B5A7B33868D630666EFED749@MRZP264MB2908.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /y/iIMSA+nCGFqqe8nbgOZK4eHNWAOFM0cTpmcjBq+cy0lJx0+O1rHCh0sKg09JhK5YjhZxmz/zL//hIk+6OpGzobZJjclXKCYW9VYALkMJaz8p0xUe8GYb8zSrgoXaFExf58SN46XOeeHGog3tVAIs2iq1qyy5YTk0+T0kxt50pdmE+ykt58cqjQ4c8Z74o24c2MQwI/VlJtEIbZLOgCEJEAoQ8ZBCh9IHKA6AYU77CJaZHABbiC8coJ+pAjJoxgPuiwVQwt1+afHyt5m0TLUqLgUO9svhiAor2Kg8Tuayb+M63Ah7h+iZpTf9ZwF6h5BuRhKWYF/0K2An4dp+E2JNCYjH/o3RkwjVmXU8mPFTGO2tSazHWMhtCa3nTB39VAaU0jZVbNhfrD/Z7Ak4IHVlF/Gvh7uiRFK/irR0bGBmybtMG9f6rIpj7v+g/BLNTq58BPrKDTz4N/yhPkybe6vxTDPh5YN1hKrCErBptUMK2nuYu/rkjLND7n9kIPUTFsmiUA7DK5WuRdR5OJmPWeez/mOtlFBPrYoTJhKQEQACuunwrmuXnkNffoH9YaNGxfjRWJBp+DOd0Rqe8cB073n3HXEseIkJ8ilqqYv72coVC+HWMiAIg4PAZqxfSdbPGZn/GtGKOA4yXbvvcdh6J41V5Aad5ImUd7PWEgw1alY8zfvqAC7nccU8bzCJWdWa66mFqTryseknNy8Licl23KCvszgfRz/fIB+qXQAn/VFtpSHniu6on//3W361oyCRBy1KUd5jMvRAeM3mFlLFFUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(186003)(6512007)(7416002)(4326008)(8936002)(8676002)(2616005)(31686004)(2906002)(122000001)(66946007)(38070700005)(91956017)(66574015)(508600001)(31696002)(5660300002)(316002)(44832011)(66556008)(76116006)(64756008)(66446008)(86362001)(66476007)(83380400001)(71200400001)(6506007)(54906003)(36756003)(6916009)(6486002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekFTTStkUGNUUktTL0QvYnR5RXIxR0d2aGlHejI2M0NTclk2RFRJeFFFU0lL?=
 =?utf-8?B?SElsb2U3ZVdpNGd0L3VUOTdUemY1RjIvNS83QTdheUozeTNNR0l3cE9hU1k4?=
 =?utf-8?B?TWovOENqV0xoYW1hVTJQQlk0Vzl0Z1hFZWhvVFFBSitKK2NJYjVBU0ljekRr?=
 =?utf-8?B?cys2UWo3dEdWcFJUa29JUi9acldwUHFuTTRGN1IvZ3VEdU9HckNUWm10WDVM?=
 =?utf-8?B?S2g4OGUrWWhuUWRGTHlza1V0RGdLN004UmVOeVdTVUxlTFp2VUNTekRmYTRF?=
 =?utf-8?B?enRnTHJ0VHVwS050cHdrMi9DY3VXMnRGaHprZUt1ZVdaM0NYZUxGQWFHMDk5?=
 =?utf-8?B?RmRrWCtVQmY5NGM3c2pHS2RqckZmalNyVjlYOFh0a0xHTFFoYWpEdVRwa2dn?=
 =?utf-8?B?SEVsaG0ydVQ5TGZCaG8zVWd6RzVsTjAvUk9PSmE0WXVuZWQvbktsV0hsWHpX?=
 =?utf-8?B?bEhaSk9maWVvMVR0QzZUeGpYbVJrd0ZqOFFTenVscVBJakpRbnVtZEpHd05P?=
 =?utf-8?B?ZHBtOHpoMiswMFM3a05vNE9Jb1VRL1dzbkt2djFjSlNobXZFekFpOTBrejJR?=
 =?utf-8?B?ZS9KUVczTHVsalp1UTJrK0hNMjB6WnM0Qko5Y0J2NVZKaXMvdlpNdG1PZUdm?=
 =?utf-8?B?eFRIMG12RmZBdHpMdkJnVUNqczZIeHZ2V2lJMjlxdm5jdlNNbEEzVkxxaEtX?=
 =?utf-8?B?VFA3RTArZDJ4S3lselFCOGdlUHM4REljc2dRWVRySDFRMU1uTlRaeWNmN3Z5?=
 =?utf-8?B?QXZFeEZ0cWdkU3FYNTlDZ2NrbUVMVUpBTkNITm8rYXFkU01yWEhoT3QweUVQ?=
 =?utf-8?B?eXVkS3dnN0d5Y1A0MDRKaUpRYm9IL1czNGVXYWJYZWxubkFQeFRDMndza21O?=
 =?utf-8?B?Um5UY0ZLckIybGRrajltaUlrYzZQNUhnNzZubVI4NTFQWk11aStzOWdUK3RB?=
 =?utf-8?B?bE5tdSt1Mi9tREVHY2xxb3J6UDd1dmt0QjRWRGY0WG9KbW5Sdy8rcVdyYU9x?=
 =?utf-8?B?WVpWZlNrYklEZGEzeUlSTmlPSU5ia3lXZlRYVlRvNTQ4SHh0M21ibG1PV2NL?=
 =?utf-8?B?a0IrVWh6bGlIOE1adUR6SGIyTk1HVTRtWWVjRzJtYW1DVy96WlFVcUZEY2hI?=
 =?utf-8?B?ZzVYU2p1V0FXVGhneEdqTkVQbTFxcmtXWmtjWkFqQ3VKYjVFSnF6OHFwNi9S?=
 =?utf-8?B?QkpVNVQzRnFHemhSRTVPVCtEUHcvLzY4eUJUMmk5dEZycFR3Yk1SS2I4S3Y0?=
 =?utf-8?B?L1BweGVVWXQrUzhkcGZUVGRFRjRZVFJ1TGk0R0hNUC9ONjJYQzBoYWlPM1pQ?=
 =?utf-8?B?amU5azErbEU4MDZKUDV6NnNBMWhOS3VhSi9Jby9lSkQrc0dqV0kwbDYrZFR3?=
 =?utf-8?B?ekFvNFJLbW5OR3BJeE13Q3dScUt4bktVYlFibituaEtFVXhUTE13Q203SjRx?=
 =?utf-8?B?VEdZcUFKMXRLU3BuN1V1d3RodExlUC91TnQxWWtoQmRSWmhTcEZkaUdxSTVq?=
 =?utf-8?B?TzVYb0psVTJTUlhRUVRBQ0dzYVJMc3QxNnNQOFk1SjFwam1tTEdTNVQ5N0hU?=
 =?utf-8?B?UEtjdXVCaGFKWndJblhQeTc1TmVVQml5Nlh6cHpOZ0FuVDNwMTYvdlFsY1VU?=
 =?utf-8?B?SUg4RksrQmY0aEx4emp0SVR6bXZ2bVdzTVFzUS9qbzEvdjl2WjZibTY4NXRT?=
 =?utf-8?B?LzI4SW5UZWJlQjh4bzMzTllnb1d5L3pwRklya0VDeUZQQk95VzY2dmF6RUpT?=
 =?utf-8?B?VVVnc2FjekdhVTYvSVFyamJVWDVOTUFUc1U0NVZWVzJoQnlhd1lnNjYxZjhT?=
 =?utf-8?B?VGZqRlRlcDEzQzdCTEJXZFpDaER5K01XTlZCT1l0VGF0M3cvNmk2Y09OZk1N?=
 =?utf-8?B?b3lDWHI5UGJZMldhbzRyMHRtOVdXYUFkUVgxMDc1VDRtY3NnU0VkK29tWHgx?=
 =?utf-8?B?Qys4RGtIcFJ1RWV5RTJVR0lETElVZTE4YVVORGpVbWNHWFpwQmh2QUpqT2R0?=
 =?utf-8?B?c0R2eVFURGFBMVZvc2xjZ1ppZ1JPNGRQZFFIYnhyQW5Lc29OUTZoMVZqT3FU?=
 =?utf-8?B?T3NVVlc3REl4S0dBL3ZxaEo4R3VSMDZPQVJkeTBzenBMcDkwL0dGK29nYXFt?=
 =?utf-8?B?T1Q1RmR0bkIwd1lVR3pqcmdCTE1CMTN5c2VTbHRETDlTY1VvdjVmNFhBRUpt?=
 =?utf-8?B?Nnhxd1pCQWh2SjFaTGFzZW1KNnBYeWFXSmJtOVdCU1dTdmt6ZDQwdkZ2VnFu?=
 =?utf-8?Q?i+VvmD15dux3CMNhYztuIVdAn9E1/7VPHby3QapwKw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4071BF982D0AA14B94048AB7356DB90B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a943eb41-fc34-43b9-fc69-08d9be46569f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 14:39:15.9023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 41CRrEzoYV6SZf27XIULcML4baAZtI88tLpcbhHbyxxhGoZydguQ8CNzlSZ+o/RYx8MARsgKPmhzJkALkzLvfKpneAvRSwWHt0hCrYFEgUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2908
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzEwLzIwMjEgw6AgMTU6MzUsIFN0ZXZlbiBSb3N0ZWR0IGEgw6ljcml0wqA6DQo+
IE9uIFRodSwgMjggT2N0IDIwMjEgMTQ6MjQ6MDAgKzAyMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+PiBUaGlzIHNlcmllcyBp
bXBsZW1lbnRzIGxpdmVwYXRjaCBvbiBQUEMzMi4NCj4+DQo+PiBUaGlzIGlzIGxhcmdlbHkgY29w
aWVkIGZyb20gd2hhdCdzIGRvbmUgb24gUFBDNjQuDQo+Pg0KPj4gQ2hyaXN0b3BoZSBMZXJveSAo
NSk6DQo+PiAgICBsaXZlcGF0Y2g6IEZpeCBidWlsZCBmYWlsdXJlIG9uIDMyIGJpdHMgcHJvY2Vz
c29ycw0KPj4gICAgcG93ZXJwYy9mdHJhY2U6IE5vIG5lZWQgdG8gcmVhZCBMUiBmcm9tIHN0YWNr
IGluIF9tY291bnQoKQ0KPj4gICAgcG93ZXJwYy9mdHJhY2U6IEFkZCBtb2R1bGVfdHJhbXBvbGlu
ZV90YXJnZXQoKSBmb3IgUFBDMzINCj4+ICAgIHBvd2VycGMvZnRyYWNlOiBBY3RpdmF0ZSBIQVZF
X0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyBvbiBQUEMzMg0KPj4gICAgcG93ZXJwYy9mdHJhY2U6
IEFkZCBzdXBwb3J0IGZvciBsaXZlcGF0Y2ggdG8gUFBDMzINCj4+DQo+PiAgIGFyY2gvcG93ZXJw
Yy9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4+ICAgYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL2xpdmVwYXRjaC5oICB8ICAgNCArLQ0KPj4gICBhcmNoL3Bvd2VycGMva2VybmVs
L21vZHVsZV8zMi5jICAgICAgIHwgIDMzICsrKysrDQo+PiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwv
dHJhY2UvZnRyYWNlLmMgICAgfCAgNTMgKysrLS0tLS0NCj4+ICAgYXJjaC9wb3dlcnBjL2tlcm5l
bC90cmFjZS9mdHJhY2VfMzIuUyB8IDE4NyArKysrKysrKysrKysrKysrKysrKysrKystLQ0KPj4g
ICBrZXJuZWwvbGl2ZXBhdGNoL2NvcmUuYyAgICAgICAgICAgICAgIHwgICA0ICstDQo+PiAgIDYg
ZmlsZXMgY2hhbmdlZCwgMjMwIGluc2VydGlvbnMoKyksIDUzIGRlbGV0aW9ucygtKQ0KPj4NCj4g
DQo+IFRoaXMgaXMgZ3JlYXQgdGhhdCB5b3UgYXJlIGRvaW5nIHRoaXMsIGJ1dCBJIHdvbmRlciBp
ZiBpdCB3b3VsZCBldmVuIGJlDQo+IGVhc2llciwgYW5kIG1vcmUgZWZmaWNpZW50LCBpZiB5b3Ug
Y291bGQgaW1wbGVtZW50DQo+IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9BUkdTPw0KPiANCj4g
VGhlbiB5b3UgZG9uJ3QgbmVlZCB0byBzYXZlIGFsbCByZWdzIGZvciBsaXZlIGtlcm5lbCBwYXRj
aGluZy4gQW5kIEkgYW0NCj4gYWxzbyB3b3JraW5nIG9uIGZ1bmN0aW9uIHRyYWNpbmcgd2l0aCBh
cmd1bWVudHMgd2l0aCB0aGlzIHRvby4NCj4gDQo+IFRoYXQgaXMsIHRvIGNhbGwgYSBnZW5lcmlj
IGZ0cmFjZSBjYWxsYmFjaywgeW91IG5lZWQgdG8gc2F2ZSBhbGwgdGhlIGFyZ3MNCj4gdGhhdCBh
cmUgc3RvcmVkIGluIHJlZ2lzdGVycyB0byBwcmV2ZW50IHRoZSBjYWxsYmFjayBmcm9tIGNsb2Ji
ZXJpbmcgdGhlbS4NCj4gQXMgbGl2ZSBrZXJuZWwgcGF0Y2hpbmcgb25seSBuZWVkcyB0byBoYXZl
IHRoZSBhcmd1bWVudHMgb2YgdGhlIGZ1bmN0aW9ucywNCj4geW91IHNhdmUgdGltZSBmcm9tIGhh
dmluZyB0byBzYXZlIHRoZSBvdGhlciByZWdzIGFzIHdlbGwuDQo+IA0KPiBUaGUgY2FsbGJhY2tz
IG5vdyBoYXZlICJzdHJ1Y3QgZnRyYWNlX3JlZ3MiIGluc3RlYWQgb2YgcHRfcmVncywgYmVjYXVz
ZSBpdA0KPiB3aWxsIGFsbG93IG5vbiBmdHJhY2VfcmVnc19jYWxsZXIgZnVuY3Rpb25zIHRvIGFj
Y2VzcyB0aGUgYXJndW1lbnRzIGlmIGl0DQo+IGlzIHN1cHBvcnRlZC4NCj4gDQo+IExvb2sgYXQg
aG93IHg4Nl82NCBpbXBsZW1lbnRzIHRoaXMuIEl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBkbyB0
aGlzIGZvcg0KPiBhbGwgb3RoZXIgYXJjaHMgYXMgd2VsbC4NCj4gDQo+IEFsc28gbm90ZSwgYnkg
ZG9pbmcgdGhpcywgd2UgY2FuIHRoZW4gZ2V0IHJpZCBvZiB0aGUgZnRyYWNlX2dyYXBoX2NhbGxl
ciwNCj4gYW5kIGhhdmUgZnVuY3Rpb24gZ3JhcGggdHJhY2VyIGJlIGEgZnVuY3Rpb24gdHJhY2lu
ZyBjYWxsYmFjaywgYXMgaXQgd2lsbA0KPiBhbGxvdyBmdHJhY2VfZ3JhcGhfY2FsbGVyIHRvIGhh
dmUgYWNjZXNzIHRvIHRoZSBzdGFjayBhbmQgdGhlIHJldHVybiBhcw0KPiB3ZWxsLg0KPiANCj4g
SWYgeW91IG5lZWQgYW55IG1vcmUgaGVscCBvciBpbmZvcm1hdGlvbiB0byBkbyB0aGlzLCBJJ2Qg
YmUgaGFwcHkgdG8gYXNzaXN0DQo+IHlvdS4NCj4gDQo+IE5vdGUsIHlvdSBjYW4gaW1wbGVtZW50
IHRoaXMgZmlyc3QsIChJIGxvb2tlZCBvdmVyIHRoZSBwYXRjaGVzIGFuZCB0aGV5DQo+IHNlZW0g
ZmluZSkgYW5kIHRoZW4gdXBkYXRlIGJvdGggcHBjNjQgYW5kIHBwYzMyIHRvIGltcGxlbWVudA0K
PiBEWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1MuDQo+IA0KDQpJIHRyaWVkIHRvIGFjdGl2YXRlIERZ
TkFNSUNfRlRSQUNFX1dJVEhfQVJHUyBvbiBQUEMzMi4NCg0KSSBjb3BpZWQgaW50byBwb3dlcnBj
IHRoZSBjaGFuZ2VzIGZyb20gNTc0MGE3YzcxYWI2ICgiczM5MC9mdHJhY2U6IGFkZCANCkhBVkVf
RFlOQU1JQ19GVFJBQ0VfV0lUSF9BUkdTIHN1cHBvcnQiKQ0KDQpGdHJhY2Ugc2VsZnRlc3RzIHRl
bGwgIlRlc3RpbmcgdHJhY2VyIGZ1bmN0aW9uX2dyYXBoOiBGQUlMRUQhIi4NCg0KSXMgdGhlcmUg
YW55dGhpbmcgZWxzZSB0byBkbyA/DQoNClRoYW5rcyBmb3IgeW91ciBoZWxwDQpDaHJpc3RvcGhl
