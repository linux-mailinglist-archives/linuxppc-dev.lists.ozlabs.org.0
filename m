Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252184892F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 09:02:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXRBY03Qrz3bZF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 19:02:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::603;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::603])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXRB36nq8z2xrm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 19:02:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCuzEdkmh45L5FnAzaoXnzRchtmUGqHCDKKBYXWgu98Vkn7vlC4uURNHw/d63W3rtEte2kG1m3YxJOrMZ2lMljcZ5744KKZR0bEYPOdwjwbbM8Tug18vXJfbfJ1cnxmZNkpt0ZHoyzCe5COvN+vug8qTonYs8UO4u8oC2xPOjyHQ/31N2uJPCb8ISchC85gY1YaOHW0RnN/DISKvKQ2lgNHunHStlySEN5Z27fCzQZYz7XrOROoznfMOEd2gRcpCQrweLOvAMPLhFaq/OtahPnRg8SMrsr0HE7GHNMmPtS2LzZqNfY7ksSZHofCtxudt3wxWOazeEbD2lE07fxtNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5ZXQwcnL5aRJRi9zd8QJo9dqYaG3uds3pdwcxEelVY=;
 b=lycLtep1saGRDnJOfDYAl4yXrobWqMWO0E482QjBlrYqTQFAgkx5243SveLlClGODIsrW0ZSMOfWQcFeZnaLHCzh6/mvauyUrtGUMeLELxikq39vARMp0hR9AiloHYnYflXnqPfbbH8XQifaszxi5P0AjfNLzJsV60G/VpbW2tf/hGUbOWALYS2sYjfcEVAWyXdT9G7arA92fAEsLyydu+7v6OI/tZN39IncMzXHAP5j6MdvmfK8EUzTyn/M51FXZ+8kHSHgtjQ2KpykxLdTAntVUsufhBxVLz+7r330/ctstOgWahY0l9e84jOX1x9Ibrp21dlJ25atCCZYTEZ+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2117.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 08:01:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%4]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 08:01:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Kees Cook
 <keescook@chromium.org>, Laura Abbott <labbott@redhat.com>, Mark Rutland
 <mark.rutland@arm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew
 Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 1/2] powerpc: Fix virt_addr_valid() check
Thread-Topic: [PATCH v2 1/2] powerpc: Fix virt_addr_valid() check
Thread-Index: AQHX+Ya2u0aEpSnXzUqUcTfc81tnDqxb/YkA
Date: Mon, 10 Jan 2022 08:01:38 +0000
Message-ID: <b377978c-7953-ba08-c775-f2f991c9932c@csgroup.eu>
References: <20211225120621.13908-1-wangkefeng.wang@huawei.com>
 <20211225120621.13908-2-wangkefeng.wang@huawei.com>
In-Reply-To: <20211225120621.13908-2-wangkefeng.wang@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9de55b6b-5f84-4b1a-6616-08d9d40f6e26
x-ms-traffictypediagnostic: MRZP264MB2117:EE_
x-microsoft-antispam-prvs: <MRZP264MB2117FFC07B049BEEB6E596EFED509@MRZP264MB2117.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vt2HOtzNCUMn09MSnUT6Uxw5ZOfHGyzWPfyyaBctCudoR1OZvlsvmULj+VH+8qefpQIV71SJ615GKpp8ikFR6a16Jz0Rgfq/EFOpvMMvMWHBj2Cy8qg6aLxnRp27jiYC4BSHvsfPZQNaFIlImgJsEseVasfOlbh2DVUMPal0/9t1jmNjiE44Vzj7lTVqZeP7gU7nBeA/MdI7OMY0d7Ju7SjaS/qATYhqVLoQgX6beYbIliqAQ4P0eaALIwNqRPLJtz1kyvGF2TPTmaimy6pWLQ8z1yKBjQj9Q500bjFQzDwd871K+gAnRqHTKSIhxtUAb30iOwU3+OwJSm6tn5TEOjM1iPvVHJKHN0VmrcLt63/aQ8AwStMMdhVG63shagJ2PYTMDUamVhu4ZeyBcsl0/QgihNu4ptIL37XK/XTLVdxEYX1u7soQFhH0xeARM5aW1gB2kGCkrSJzV+MvN/FL80vjgIFcu8ApG2xzuLI7Ed48QPeQRS9jdTR2nM6/ZA+y+EH3oPdRcty42A91hV2OyP4PcOT9FOe18xlAklmeg5fruhP4zrEMgxhITammr3LRHh8uvfXB4rIwXw7bGgDOk1VQ2BLW9APKQ7744q0V48SlDzZOlmQdxS8S1idlnLV1LOmrvOLs91SjMdRfFuXLm8Y/Mz+onsqDYB7yeGYk9TDsEcZpHUAJW0vRRnhXsz9EoGxjYH1wSGqzk0mQ2Bqs8xmGdYHM/0ReGwRRh247OHre5VaRni5mnYIe37Eh5XJmO7hQl2juYuVYMoR05C+BVAryl0GTVl9EX+wkR9ElRYc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(186003)(71200400001)(8936002)(66574015)(508600001)(316002)(31686004)(6512007)(110136005)(2906002)(5660300002)(26005)(4326008)(44832011)(66476007)(38070700005)(6486002)(86362001)(122000001)(921005)(38100700002)(76116006)(6506007)(91956017)(31696002)(36756003)(7416002)(66946007)(64756008)(66446008)(2616005)(8676002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXdJazNhdUtTRTdPM3k5OGtIMTlpZG1RR2FtS3k4ZFRFbFdZSmh1QVdaQ25J?=
 =?utf-8?B?WCtIMWV4THIvS25mYTdxWGJIOXpvdDFFK2dIKzJaZmpEVnYwMi9Ed2JETW1q?=
 =?utf-8?B?NXUyUEVZZThVNFhJKzhidnRFQkJQNDhhTytyekdLQVRpWGw3cmJBWmx1Rlph?=
 =?utf-8?B?SUhrK3V5anVpd0tSdmhrSGdITmhVWVEvZkJhZGhrT3dNSUs0L2FGeUFPTk51?=
 =?utf-8?B?dGl5cEM0ajZ5bzdhT2hkOEE0bEVRM08yYTYrQVRzTURJdWMwRnQ1UFJJMjR0?=
 =?utf-8?B?RG5URzBlWFVyK0t6QjRsZ2QyMWhrazNJS2d0RlBpblJHSjBTL3dVSGlsTnRQ?=
 =?utf-8?B?eWc3UmNqYk8yR2tWVkFobEEyRkt4K2xqSjRmLzg2cHhDWTUwS1N6L3lEUW91?=
 =?utf-8?B?eVpHR2k4blNna0RkM1VSR0poaEJBaWxwSG1TNHNvUlVNVHExVjduKzNWczF0?=
 =?utf-8?B?c1pxRmpnT2syQ1Zza0RwOUdYdmNOdDZaSXMvZ2FWejdRWFB1R25GMjdYUm9h?=
 =?utf-8?B?N0VTbXdjMEZ1TUlSNWw1RTI5TFBMSFFpYnJ2WTNiUEhhdmNvTS9wc1FrZHZo?=
 =?utf-8?B?STRaQmF0Zi83MHJzTHo3R1VxQmt4aFRYR2hWa0Vna2VwZDNvdENTMllnM1FZ?=
 =?utf-8?B?b1lRbFRVTnkzOHh2YVAwQ203TVd6dDErb2FBYlJBZVptVlFZb1FkdjdiOFdI?=
 =?utf-8?B?eTdpNlVXVzBBbDMrdHZtcjVkWWR0TGgyRWx2U0dvYnBveUdPRkdFbTM5bTJR?=
 =?utf-8?B?cGdDeXZQejR0aG15TUZoQlNneE80b1laL2s4Q3k0ZXdXalFGRDM2S2tVT0pT?=
 =?utf-8?B?WnRRYm54bDBsYVYvLzNNZ3ArK0tkT2tjVXpkenRtRzI1ZTUvSlJ3RDVCa204?=
 =?utf-8?B?OE1oUVJRZkhZWEpuOTNSK3QyZ3ZpSkdMNEhTV2YyL2JQM2R1ODlJMjZqQXJm?=
 =?utf-8?B?MFZkTGdzVEhYV2RxK1ZnQTNCN3NKcjZqWW1aY2h4aHhLWVhGenk2THE4YzdU?=
 =?utf-8?B?L0xYeHA5bGQwUDZpYk9XVXo3MHIya3U0ZS9MNTJlMUNSaW1wQ1hFUmxDSzFr?=
 =?utf-8?B?WklpeXBMekMrZ1h4K0JnaFV3ZDdsVCtYTEJyTEREdGZXa1ZrYjJKdlJTYnZJ?=
 =?utf-8?B?K3ZsMktTdHk1aVlRSkVnY0xHeGtFSVZDTlE5M3k4ZEFYSGd4VEJ1Y04xUCtC?=
 =?utf-8?B?OFVUc0o5bjVzejh5SFRHR3h4aGRKNXFuWnVCOVlPVDNzOTZ4cGZJSDJQZ3d6?=
 =?utf-8?B?Z2VXMmhSUUpYcVVMR0VVVTJjaGgrMlNrK0F6dlJ2NzQrNFViZXg3QUxQdlZB?=
 =?utf-8?B?MkYyZHNUVXN1Z1owa08wUGZpT05Ub2s4THFwaENqd3U3TExPSitjWEd1TGpL?=
 =?utf-8?B?dTVJVTM0dVRTVXY4U1ZMVHl6dkZpQ3k0dFF2bUJHS2diMmR5WkRPeks1Y21R?=
 =?utf-8?B?QnJjS2RQVEhTZXpUc3ZHWnpUL3pZUzQvZ3ZRWHdoVmhzS2dPbE5QQmVoMlEw?=
 =?utf-8?B?RDdRSlJLcW1JNGVDekhyYnAyRlNsS2ltSWZaSWRvY3pOMnN4N0Zva0IyK3BZ?=
 =?utf-8?B?Y2FtSVZmaDJ3UnhkRXF1WDVVRzlwNFF0VHRpTjZGY3Q5VXFkSnM2MFB6eEFz?=
 =?utf-8?B?RTJwOHhiZkZYaHZrTVFONTI3VHl1SEFZbmZ3NTBvMVEzL3dyNG1DZ2ZydmVF?=
 =?utf-8?B?SHRvbjRNTVZoaTJ5dzRCUzhiUGdxMXM1MU45azRudHpjM0FCUDUzYnhGR3cw?=
 =?utf-8?B?d1Qzb2x5TlBCbmJobE9vV3FRd1A2QmZ4d0ZZM1Z0WlJqOW55MSszSnJ4NVFw?=
 =?utf-8?B?VTlWNFpyTXNDcUxSS2ZYVWl2UmZvTWpLRDhvK1NrZFZYTXovQXp4TTNiWGdE?=
 =?utf-8?B?dXAva2ZOZ3gvVDdDMFNkWGFReW5ZYU9SYnpjcnVmckRGb2tibVhrVlowcVJq?=
 =?utf-8?B?UStYWHd2ZW0rRmtkNnd5SHZFTWFaWEdoMmhKTGcxUHBXR3hCNlkwT1Fjbkh0?=
 =?utf-8?B?bHVxek5WaCtXSVF6MnJTa1ZFcXZkaktuMnpVSmRwRTlldzQ3NkFOSnI2ZmEv?=
 =?utf-8?B?UTZuZTgzRCtiYXdjck1NaDIxUHhCZkRvQzdMdjhqSjM5NmYyTndtdEE5M3cz?=
 =?utf-8?B?L0VZUUoyNEFQVHY3WTZoWDlCZmRnYy9aMUNRcmJxQ3NLYUh1NzdXcUw1ZGJw?=
 =?utf-8?B?aFlWQXVwTHlwcmppbXpBNFpVb0JXSkNORUhuUERYcmRwUFI3RnhCcHUxWUhG?=
 =?utf-8?Q?wBZH+nifa78xEiXPl/yhs29hd/N/7rLfNBPkJKn29I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <07CE5A009FD16845B5EFFDCDFD143BBB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de55b6b-5f84-4b1a-6616-08d9d40f6e26
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 08:01:38.6619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H4FWna8mR34BgsnT4vvvX34DVCeTiUTj8NplT+A7oIFSaKULIRcMysBQwlgsWHf0muGA8U2tS/BAQoChBMXMd63A5Ulx02A9rmHVM5RU7aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2117
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzEyLzIwMjEgw6AgMTM6MDYsIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6DQo+IFdo
ZW4gcnVuIGV0aHRvb2wgZXRoMCwgdGhlIEJVRyBvY2N1cnJlZCwNCj4gDQo+ICAgIHVzZXJjb3B5
OiBLZXJuZWwgbWVtb3J5IGV4cG9zdXJlIGF0dGVtcHQgZGV0ZWN0ZWQgZnJvbSBTTFVCIG9iamVj
dCBub3QgaW4gU0xVQiBwYWdlPyEgKG9mZnNldCAwLCBzaXplIDEwNDgpIQ0KPiAgICBrZXJuZWwg
QlVHIGF0IG1tL3VzZXJjb3B5LmM6OTkNCj4gICAgLi4uDQo+ICAgIHVzZXJjb3B5X2Fib3J0KzB4
NjQvMHhhMCAodW5yZWxpYWJsZSkNCj4gICAgX19jaGVja19oZWFwX29iamVjdCsweDE2OC8weDE5
MA0KPiAgICBfX2NoZWNrX29iamVjdF9zaXplKzB4MWEwLzB4MjAwDQo+ICAgIGRldl9ldGh0b29s
KzB4MjQ5NC8weDJiMjANCj4gICAgZGV2X2lvY3RsKzB4NWQwLzB4NzcwDQo+ICAgIHNvY2tfZG9f
aW9jdGwrMHhmMC8weDFkMA0KPiAgICBzb2NrX2lvY3RsKzB4M2VjLzB4NWEwDQo+ICAgIF9fc2Vf
c3lzX2lvY3RsKzB4ZjAvMHgxNjANCj4gICAgc3lzdGVtX2NhbGxfZXhjZXB0aW9uKzB4ZmMvMHgx
ZjANCj4gICAgc3lzdGVtX2NhbGxfY29tbW9uKzB4ZjgvMHgyMDANCj4gDQo+IFRoZSBjb2RlIHNo
b3dzIGJlbG93LA0KPiANCj4gICAgZGF0YSA9IHZ6YWxsb2MoYXJyYXlfc2l6ZShnc3RyaW5ncy5s
ZW4sIEVUSF9HU1RSSU5HX0xFTikpOw0KPiAgICBjb3B5X3RvX3VzZXIodXNlcmFkZHIsIGRhdGEs
IGdzdHJpbmdzLmxlbiAqIEVUSF9HU1RSSU5HX0xFTikpDQo+IA0KPiBUaGUgZGF0YSBpcyBhbGxv
Y2VkIGJ5IHZtYWxsb2MoKSwgdmlydF9hZGRyX3ZhbGlkKHB0cikgd2lsbCByZXR1cm4gdHJ1ZQ0K
PiBvbiBQb3dlclBDNjQsIHdoaWNoIGxlYWRzIHRvIHRoZSBwYW5pYy4NCj4gDQo+IEFzIGNvbW1p
dCA0ZGQ3NTU0YTY0NTYgKCJwb3dlcnBjLzY0OiBBZGQgVklSVFVBTF9CVUdfT04gY2hlY2tzIGZv
ciBfX3ZhDQo+IGFuZCBfX3BhIGFkZHJlc3NlcyIpIGRvZXMsIG1ha2Ugc3VyZSB0aGUgdmlydCBh
ZGRyIGFib3ZlIFBBR0VfT0ZGU0VUIGluDQo+IHRoZSB2aXJ0X2FkZHJfdmFsaWQoKS4NCg0KVGhl
IGNoYW5nZSBkb25lIGJ5IHRoYXQgY29tbWl0IG9ubHkgYXBwbGllcyB0byBQUEM2NC4NCg0KVGhl
IGNoYW5nZSB5b3UgYXJlIGRvaW5nIGFwcGxpZXMgdG8gYm90aCBQUEM2NCBhbmQgUFBDMzIuIERp
ZCB5b3UgdmVyaWZ5IA0KdGhlIGltcGFjdCAob3Igc2hvdWxkIEkgc2F5IHRoZSBhYnNlbmNlIG9m
IGltcGFjdCkgb24gUFBDMzIgPw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLZWZlbmcgV2FuZyA8
d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9wYWdlLmggfCA1ICsrKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9wYWdlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFnZS5oDQo+IGluZGV4
IDI1NDY4NzI1OGY0Mi4uMzAwZDRjMTA1YTNhIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vcGFnZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdl
LmgNCj4gQEAgLTEzMiw3ICsxMzIsMTAgQEAgc3RhdGljIGlubGluZSBib29sIHBmbl92YWxpZCh1
bnNpZ25lZCBsb25nIHBmbikNCj4gICAjZGVmaW5lIHZpcnRfdG9fcGFnZShrYWRkcikJcGZuX3Rv
X3BhZ2UodmlydF90b19wZm4oa2FkZHIpKQ0KPiAgICNkZWZpbmUgcGZuX3RvX2thZGRyKHBmbikJ
X192YSgocGZuKSA8PCBQQUdFX1NISUZUKQ0KPiAgIA0KPiAtI2RlZmluZSB2aXJ0X2FkZHJfdmFs
aWQoa2FkZHIpCXBmbl92YWxpZCh2aXJ0X3RvX3BmbihrYWRkcikpDQo+ICsjZGVmaW5lIHZpcnRf
YWRkcl92YWxpZCh2YWRkcikJKHsJCQkJCQlcDQo+ICsJdW5zaWduZWQgbG9uZyBfYWRkciA9ICh1
bnNpZ25lZCBsb25nKXZhZGRyOwkJCQlcDQo+ICsJKHVuc2lnbmVkIGxvbmcpKF9hZGRyKSA+PSBQ
QUdFX09GRlNFVCAmJiBwZm5fdmFsaWQodmlydF90b19wZm4oX2FkZHIpKTsJXA0KDQpfYWRkciBp
cyBhbHJlYWR5IGFuICd1bnNpZ25lZCBsb25nJyBzbyB5b3Ugc2hvdWxkbnQgbmVlZCB0byBjYXN0
IGl0Lg0KDQo+ICt9KQ0KPiAgIA0KPiAgIC8qDQo+ICAgICogT24gQm9vay1FIHBhcnRzIHdlIG5l
ZWQgX192YSB0byBwYXJzZSB0aGUgZGV2aWNlIHRyZWUgYW5kIHdlIGNhbid0
