Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3C35B2E59
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 07:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP4xC40jWz3c3B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 15:56:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wG2Yjm1U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.75; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wG2Yjm1U;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90075.outbound.protection.outlook.com [40.107.9.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP4wR6m17z2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 15:55:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwe79bz2kDpf6Uc7i7djMqk/7q4V8B5JG9yUfHPQXCqnsUSnW/XLl+qSJ/7Y4/EtEdXRq4ms/3NL/Jpjq7tAGcHjsHgov45AeMw1EfGUUmU5DnIGnNdPFs+rEy/K+BzxhPY3yHqV/1xeLbbbMpB0pYnQMa2Sp55hrUth4yE387vpYf8K8CKKNT55Fiw+0/gdnJWgoBrXe2s8bv3LiFk0vVt6TtH+fJ4YH6vZVOTMzvLfG/w1Z2kesicaay/YNQ+Nz1K2cdKnRC2xATnxU0j52xu/5u9bDjBtfafTib2RhaI7njvic/bfZjac6mqcNc5/5S72fXWT9DWknP489RReWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voRtdrPCYLt2fGFbPrBvDaxsJ+UVIRvyQtnVbqRCb40=;
 b=XeSznY7HaGN0E17YLiZQFOfFy7V7cT5Uue3rywXGyAmhKn6DrBDBhFE3hT+F8IY54cb3sJJ1gFduTzVhZdHUg/H+uSkMIOxsVo7XfN1d55VBZdBuBhAuiadGGyH0194sdpPYd+m7VclnaqX6tw2zmREbWC+c6t8062jvrhBG8duqu9xvijQMERiZPU6fBIIsaD33yTG89Itf5Bk7WZiSflZOhqvCOhga1eMCfxdKMqtHj47ZxckE4nfrxmweuGUZlZECKElbetKwQKo6oVwB+tv0TyNaJhAqpQtTtzWzCPZHrRk0N5gZwfKIvY8G6tyHXhFnC8Y/B7WMg39920xarQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voRtdrPCYLt2fGFbPrBvDaxsJ+UVIRvyQtnVbqRCb40=;
 b=wG2Yjm1UD6Y2+kXILVvLgt56PbwZ3CnO1KPSUNEWWCnLCL7eN7koIzuA0qKgax/DG5FoiCOearVsY2AgPDVbUgNi7J+yYIbbwfjbR2Ep+pXelR5cm6fgPb9tBKqfQctz37xspRenO6BXRqUlOzDvb/mD5qzGEqcehx5+BwN1KqZsUY43aNEtm+EmBH4Ph9gmS3dTI3GzFfndFrU/oj8HCTaarCs3FZ8wb+XtHhsfFQUrupoA9U7Y/uBzOpgD4zeFjV93o2vYCGYl/F/v/DSDxQpkErA5t2kiwlNJKEEJ3idysAbS8KUgsLo8RV2Ddlwb8D2VvMjPg0m4PSyXw1X7yg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2486.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.15; Fri, 9 Sep
 2022 05:55:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.020; Fri, 9 Sep 2022
 05:55:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "isaku.yamahata@intel.com" <isaku.yamahata@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Marc Zyngier
	<maz@kernel.org>, Will Deacon <will@kernel.org>, Yuan Yao
	<yuan.yao@linux.intel.com>
Subject: Re: [PATCH v4 23/26] RFC: KVM: powerpc: Move processor compatibility
 check to hardware setup
Thread-Topic: [PATCH v4 23/26] RFC: KVM: powerpc: Move processor compatibility
 check to hardware setup
Thread-Index: AQHYw9w2QY5z7tuWaEKuRgw/aK7FM63WmbuA
Date: Fri, 9 Sep 2022 05:55:14 +0000
Message-ID: <ee18616b-e657-7c10-5224-d9b18dbb9ea7@csgroup.eu>
References: <cover.1662679124.git.isaku.yamahata@intel.com>
 <b348201517333f52c570f359e0d94bc9d5afc4f2.1662679124.git.isaku.yamahata@intel.com>
In-Reply-To:  <b348201517333f52c570f359e0d94bc9d5afc4f2.1662679124.git.isaku.yamahata@intel.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2486:EE_
x-ms-office365-filtering-correlation-id: 0cf61cae-7cc7-430b-695a-08da9227dd62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  TY4zacpqLEnkfzyHBagxisAIVpTwerGc2ZFzpc03EClxoCBmXZH+vMZLMElc6Kcp85v7JPohf8CTyi5UDqCXGDlZrvIS4vldsKr1gOqBe21ZmOAGH9eLf4qEyrG0iOu2UcM8omsWHdrSb+zadzyUeCgRRA6LXXANsTXTZs2RaHwwYwAxv50M7JMeyoFb47cC7CAsqJ0CONjpUN8E8oXE6sn2UzTOLldkuTBrqsLQ37cDACrJqy4p3HFrNagTsyrPJT6lR2HjOqIMszVmX/437Osau6POL42QLfShyc9gReenwOAT0bLrTCVZlrGvB2BSkh2A6awnnoY0VlXrGcyDndkAM9Z41xhRLYk7jRyluJJNNpbvJX7MXU9WOKqgF3UJv/3BFI0EKT9uLVhRUgnEkx8EqiuX/ZKIBokVuSHynsgfD9Yhobsw4fblFv4qIMJTgv8aFByGgXSg7nI2MLSZhcZ7gcqPwbTaLcylfeTh3FT62H+4Q5EI9RIi6gJsRW2tkwF4IaU0qB6X85MW6/OtNH5t4KCo7rJo5bEh2qX5+hDnufErDbQFzFUwaR2txosfw7ZFjQJfPW5B1wQxZAEOitGV/SGdRA6DWiyLoBshXcV88esMM6OiJKXedU7sudmJWp3RzkAAFyjA5q5VCIL7B86ar14/hmvm1/pkOowmq+j0jizZQ3uIfBfywIuOvPjgc6jvhx45tn4H3TYTTupX8WuTpjTYqS2iEFR0zbViEEmEDJtwR+FiKoTK/42JhTkWCZcbC72C88WGYmMgdj0/xpDG4tffdpv3tGBqzyglC52KsjHU4CCpik2cU59O/kE9HlEVSm8tXL0qodK/EYV3Qw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(2906002)(7416002)(44832011)(66446008)(66556008)(8936002)(5660300002)(66946007)(64756008)(66476007)(122000001)(38100700002)(31696002)(86362001)(36756003)(38070700005)(76116006)(41300700001)(6512007)(26005)(6506007)(186003)(83380400001)(66574015)(2616005)(110136005)(316002)(91956017)(4326008)(8676002)(54906003)(966005)(6486002)(71200400001)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ejJGNHE0aEc2ZVh4dzk4TlFYR040VkJWSHU2ZjFxbjRsV29HZXZhdWQ4V0ts?=
 =?utf-8?B?QVhGUkZabDlHK0Rsa0loUURSK2FTZWMwTkJzRzJPdzV6c1VxTU1kZXB3VjRk?=
 =?utf-8?B?L3ZoaEpJUTZLZ1hhdlBxbjIxSnNENDk0QWhvYVRBSlJYVTV2NEFWbFpzT1Fv?=
 =?utf-8?B?ZVV4emFVekpGNWxFYUQ5VTVXdU9aZkxsUGpld1ZPK0R2ZW44RXNadDdXMkZW?=
 =?utf-8?B?bTNDUURXUkNQdDVqUkpPYWFGQWlDdDB0K1F1NVVzaVRCY1N6b2F1b2Y4ei9M?=
 =?utf-8?B?WEpJblVFTnFrRHY3dVdDS0FRYnVtalB2d2JMdk1UaTNZS1JWSkc2SUNseEYr?=
 =?utf-8?B?TXJKYkpWRWlXcVhSWEZjM2FjMVBqa2RHUGhVcjVlTElqUFBsMWFKMzAzaGlv?=
 =?utf-8?B?T3lHdG1acTdVcUhhNm1PN2Vic1dSL0RvRGR3TEwxS2w3ZjF2VFNvQ0V4ZmNy?=
 =?utf-8?B?SFZQbEh6UmNKblo5ZGpTTHliZmZKMHFRWGpiNnNXLzdDSDR3K2tmcUhLamRP?=
 =?utf-8?B?ZEVpUERaektSNm9kbldTOUs4VE10UWFjUlVzWmZQUlV4azlmK2NKMjF3aVpk?=
 =?utf-8?B?TEpjTUhNem52Unl6Rk1OOGJXeXVZd0NwV2RpbCtDMlhjbFlIWXJYa3BsbVNI?=
 =?utf-8?B?Z0JBTm14UXZJT0FMckFiU2dHWGplNXNpMS9QRFhTeGFVbTZCMGdCaGtHNWp0?=
 =?utf-8?B?VEdZcUg2ektVNHhwazdBdnc3OXdPa3JRK0FtVUdkS1V2VDlha29NNnFwN2d3?=
 =?utf-8?B?cmNhbVIvZHhSMXczQ29icmx2VVBIL1lhWGNuc1NjcHF4anpkV25MWHhFRWQz?=
 =?utf-8?B?Q1FhRVdEQ242RXlqKzVCQ00ydk5lQ1NVdHJlQ1BxR3hVcEU3VGV4OHF5MzRr?=
 =?utf-8?B?dXpqcHorbzhvOWRyK2huSTViT3U1dnhFWnJqamhHV1VGd2RYeVZqNmR0aFNZ?=
 =?utf-8?B?eWVjdWo2aXRmVjE0MFZ6NkJKb2dtc1pYT2ZZT1hsdkoxc3pGZVFIa25kcHVy?=
 =?utf-8?B?azZWVXN3aUdzUFp0R1g4QmJ6cWFjWllDbFVDYWFkZGVoZ1U1dzY2bjFwV3BN?=
 =?utf-8?B?Mm1NVW8zMWFBNXVmMExkWllhN1E3NE4vRWpDbFpLWC8zeElKQitRUVY1VVdo?=
 =?utf-8?B?TFBkVktGK3YxdjhpSy9tRzhmckVBb0xraU9EZ0luOW9FL0ZKL0VwVWZFU3Mx?=
 =?utf-8?B?WTMzZFZTVkdMU3VhMGoxd0NET05TYWtyc2cvM2lIMTVmWjg2T2hRUkZGcWZH?=
 =?utf-8?B?Z1JkangzQjRGM09UaHA5bzlMTG42cEVXdXU0b2FlM0grdzI4SElyYmU2cGEv?=
 =?utf-8?B?Y3JmLzFoV3dzUHJxck9kcm9leFBZOTFKMVZvK0RNaHpyTW80M0gvc1FlTWhW?=
 =?utf-8?B?QjNJMkg4MXB0MFlOLzV0N2VzOVk3RXc2KzVMUHpSYkhvSGt2N0oyRVU4RitE?=
 =?utf-8?B?by9DUUV0Q0o2OUtKNHBTdnZXRUNmNDBUUVNXQjVMTzdxaXpzZVE5RzZQUVhJ?=
 =?utf-8?B?dFFwbDFxZnBFdGhEd3NiaWJER2N0dk1PeWU1QzM4WmliS1NDeE1IdkxVUFBl?=
 =?utf-8?B?OGc4NW11Y0ZlR29ZYSt2bi9FNVlWSjFTSVJ5dWFjYmtMMjVpRXFpUzZNZ1RP?=
 =?utf-8?B?bEpRNXVJdWpqbVQxcHBWNHMzOS9OdWNOM1p1Qm82WkhRVVJydGhud0VxbUZU?=
 =?utf-8?B?WGw2NjZKOUFVaDVLNlBNZ1pMNTk3QndDSVVLUUF0Rm9YL25hT1dPL2pMeHFI?=
 =?utf-8?B?UlpqK1U1bjJjUVBxeGNkdjhsODg4SU40c0EwQUJYWU1aYWl5MExrRXZiVTd0?=
 =?utf-8?B?T1pKRDZxMHV6QkczN3YyYklTTVM5dml3QWRhaE0wR2FGaVpQblY1VHEvSzVs?=
 =?utf-8?B?NVNnWmV6M2lpSVU4MmxoTnQ0aThPeHQwYnJOVkUvdG1SeEdMcnhVUWhQK1pX?=
 =?utf-8?B?cEIxZTU2dGxIM29FK2pTMmdNTUp0M0RKRmJpSnVaTERQekk4WTI0a1h1cE9H?=
 =?utf-8?B?RFd0YW5YWE9BbWpqd1Q3MzhmSG4vcFpONkkwT09kZERaTHBUY1hCZTZpU3hE?=
 =?utf-8?B?QVpkbktJY1hpY3A5QlBjY2lDak4wRXEzYVhlM1ZuVVdWL0J0L1d0NldBSTA3?=
 =?utf-8?B?RC8rUlZhcUlFeDJBRCtKdklXc3VWV0o3N3dEUkhYMUNiSUY5di9OVndTdmwr?=
 =?utf-8?Q?nGyLZlR4KKqC+kqRKKT5C50=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F10711ECC72224C9FDE8831C8E0CF9D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf61cae-7cc7-430b-695a-08da9227dd62
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 05:55:14.1472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W7K6ldxt8cqYJKHTN6kRBus5F/VC62scyIkQp6Aw8rtNm1pdgtD73TOrEEQBHQ7Mjv9rsukYJnh7G95VpO+Lp//GcauShKK3dhObG5nEndg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2486
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@atishpatra.org>, Fabiano Rosas <farosas@linux.ibm.com>, Qi Liu <liuqi115@huawei.com>, John Garry <john.garry@huawei.com>, Shaokun Zhang <zhangshaokun@hisilicon.com>, Kai Huang <kai.huang@intel.com>, Huang Ying <ying.huang@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, Chao Gao <chao.gao@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzA5LzIwMjIgw6AgMDE6MjUsIGlzYWt1LnlhbWFoYXRhQGludGVsLmNvbSBhIMOp
Y3JpdMKgOg0KPiBbVm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBp
c2FrdS55YW1haGF0YUBpbnRlbC5jb20uIETDqWNvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1w
b3J0YW50IMOgIGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBd
DQo+IA0KPiBGcm9tOiBJc2FrdSBZYW1haGF0YSA8aXNha3UueWFtYWhhdGFAaW50ZWwuY29tPg0K
PiANCj4gTW92ZSBwcm9jZXNzb3IgY29tcGF0aWJpbGl0eSBjaGVjayBmcm9tIGt2bV9hcmNoX3By
b2Nlc3Nvcl9jb21wYXQoKSBpbnRvDQo+IGt2bV9hcmNoX2hhcmR3YXJlX3NldHVwKCkuICBUaGUg
Y2hlY2sgZG9lcyBtb2RlbCBuYW1lIGNvbXBhcmlzb24gd2l0aCBhDQo+IGdsb2JhbCB2YXJpYWJs
ZSwgY3VyX2NwdV9zcGVjLiAgVGhlcmUgaXMgbm8gcG9pbnQgdG8gY2hlY2sgaXQgYXQgcnVuIHRp
bWUNCj4gb24gYWxsIHByb2Nlc3NvcnMuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IFNlYW4gQ2hyaXN0
b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBJc2FrdSBZYW1h
aGF0YSA8aXNha3UueWFtYWhhdGFAaW50ZWwuY29tPg0KPiBDYzogbGludXhwcGMtZGV2QGxpc3Rz
Lm96bGFicy5vcmcNCj4gQ2M6IEZhYmlhbm8gUm9zYXMgPGZhcm9zYXNAbGludXguaWJtLmNvbT4N
Cj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2t2bS9wb3dlcnBjLmMgfCAxMyArKysrKysrKysrKy0t
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2t2bS9wb3dlcnBjLmMgYi9hcmNoL3Bvd2Vy
cGMva3ZtL3Bvd2VycGMuYw0KPiBpbmRleCA3YjU2ZDZjY2ZkZmIuLjdlM2E2NjU5ZjEwNyAxMDA2
NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2t2bS9wb3dlcnBjLmMNCj4gKysrIGIvYXJjaC9wb3dl
cnBjL2t2bS9wb3dlcnBjLmMNCj4gQEAgLTQ0NCwxMiArNDQ0LDIxIEBAIGludCBrdm1fYXJjaF9o
YXJkd2FyZV9lbmFibGUodm9pZCkNCj4gDQo+ICAgaW50IGt2bV9hcmNoX2hhcmR3YXJlX3NldHVw
KHZvaWQgKm9wYXF1ZSkNCj4gICB7DQo+IC0gICAgICAgcmV0dXJuIDA7DQo+ICsgICAgICAgLyoN
Cj4gKyAgICAgICAgKiBrdm1wcGNfY29yZV9jaGVja19wcm9jZXNzb3JfY29tcGF0KCkgY2hlY2tz
IHRoZSBnbG9iYWwgdmFyaWFibGUuDQo+ICsgICAgICAgICogTm8gcG9pbnQgdG8gY2hlY2sgb24g
YWxsIHByb2Nlc3NvcnMgb3IgYXQgcnVudGltZS4NCj4gKyAgICAgICAgKiBhcmNoL3Bvd2VycGMv
a3ZtL2Jvb2szcy5jOiByZXR1cm4gMA0KPiArICAgICAgICAqIGFyY2gvcG93ZXJwYy9rdm0vZTUw
MC5jOiBzdHJjbXAoY3VyX2NwdV9zcGVjLT5jcHVfbmFtZSwgImU1MDB2MiIpDQo+ICsgICAgICAg
ICogYXJjaC9wb3dlcnBjL2t2bS9lNTAwbWMuYzogc3RyY21wKGN1cl9jcHVfc3BlYy0+Y3B1X25h
bWUsICJlNTAwbWMiKQ0KPiArICAgICAgICAqICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cmNtcChjdXJfY3B1X3NwZWMtPmNwdV9uYW1lLCAiZTU1MDAiKQ0KPiArICAgICAgICAqICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cmNtcChjdXJfY3B1X3NwZWMtPmNwdV9uYW1lLCAiZTY1
MDAiKQ0KPiArICAgICAgICAqLw0KDQpUaGlzIGV4cGxhbmF0aW9uIHNob3VsZG4ndCBiZSBpbiB0
aGUgY29kZS4gVGhlIGNvbnRlbnQgb2Ygb3RoZXIgZmlsZSBtYXkgDQpjaGFuZ2UgaW4gdGhlIGZ1
dHVyZSwgdGhlIGZpbGVzIG1heSBiZSByZW5hbWVkIG9yIGRlbGV0ZWQsIG5ldyBmaWxlcyBtYXkg
DQpiZSBhZGRlZC4gQW5kIHRoZXJlIGlzIG5vIGFkZGVkIHZhbHVlIHdpdGggdGhhdCBjb21tZW50
Lg0KDQpUaGF0IGRldGFpbGVkIGV4cGxhbmF0aW9uIHNob3VsZCBnbyBpbiB0aGUgY29tbWl0IG1l
c3NhZ2UuDQoNCj4gKyAgICAgICByZXR1cm4ga3ZtcHBjX2NvcmVfY2hlY2tfcHJvY2Vzc29yX2Nv
bXBhdCgpOw0KPiAgIH0NCj4gDQo+ICAgaW50IGt2bV9hcmNoX2NoZWNrX3Byb2Nlc3Nvcl9jb21w
YXQodm9pZCkNCj4gICB7DQo+IC0gICAgICAgcmV0dXJuIGt2bXBwY19jb3JlX2NoZWNrX3Byb2Nl
c3Nvcl9jb21wYXQoKTsNCj4gKyAgICAgICByZXR1cm4gMDsNCj4gICB9DQo+IA0KPiAgIGludCBr
dm1fYXJjaF9pbml0X3ZtKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyB0eXBlKQ0KPiAt
LQ0KPiAyLjI1LjENCj4g
