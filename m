Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4142B6235C2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 22:25:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6yg00TYRz3dvJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 08:25:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=2+rqNbb3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.70; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=2+rqNbb3;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120070.outbound.protection.outlook.com [40.107.12.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6ydz5p7Cz2yR9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 08:24:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAU8eIDsuSJIpAZKrZ+pc3OtnnLxcq2hlkSa6PiB8fpJxY1kFRA+S+m4NwqsfdrdrUR7idaaysF3CFI/FU4UYirj+rnicTbuXYWTLz1Ypfnlqiv4Jz5MQmRDbemZPakv1mrhjbg/hq+az4J4I8sW0Qn9H/BwAGnO/Y2yw9x7BT/rCH4hk9RnZleIuVPPebuWSiI+FxwyzYN8Wsn56n0PmNZGw7IeXgpBl59fvg1yLum76YBetjL11icnwOcYUy/B7Mss2FbenChWMNA5cudQH9F8chah7OO9yxWj7WGa85pqM2xGQvvXEVCvvXdNqFwiXd6Qb5Bd6TTF9kVbbu+AGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWH/M9gCgz4Ga0pCi3cyE59BnWacLyoq2QmZOW3dPno=;
 b=mm9scaegvJntKFMagu/3ZCPq/92X/uBaIQeAFgIYiW2I7NeeRcFNPtl0U+j+uoG9ECen8o2t2E+kAsMQkZzrpcEuQegzRSI9CpvGgBv23aoyOMqvHOkp2Hs3BZ5RYYRj1CRkw66STS7cW2AWxKA6hF6Ofo8Zr/1vdeqd2y1ZDkcMmPngjBKDaWkLxrsPCBkAsCIHkiYyITJTPrsyXzy0IxsCvKxCIRoxvKZvkEYl+3aJiYD5B/3mVKzoFrUYDGA4CzGKUm1A2DlDkeu2DiCzrziXzZ6e6nsnnZAyAOzS1uhBWRldmUPEe/b1CVpMFPhmK//6DtUXpLE7gz9nYruqGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWH/M9gCgz4Ga0pCi3cyE59BnWacLyoq2QmZOW3dPno=;
 b=2+rqNbb3BdzT81jyhBapr8+sd1DXIwucVq1+lc6n06kRDWLrw+/ALc/D7ciBen+idkCCpagKsPtjRi3ZftL1QCNQHWE1u/ByL9cDlQqO4tjYNsFc9kQHeJCOS67T3w5GkHsLYbfrfnNI/X9dPT69FjEJemGJcovd89f7RXywi0rOKxw5JbF/XyfKwftDoh9Y6TsuzhQCxc/v6y16JL/ZA9ldqxXezVQFETCLtuxtdv2CM9KNtCBJAexeLmfxIBu9LqcYJwlei8DFMF0glV3afIktGcY+LGaoK75ww6JINKh50Mp4Nec8Sfd3IbD4Il9+9a96tXz3py5gpHHeGirUwQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1790.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 21:23:58 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 21:23:58 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Song Liu <song@kernel.org>, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH bpf-next v2 0/5] execmem_alloc for BPF programs
Thread-Topic: [PATCH bpf-next v2 0/5] execmem_alloc for BPF programs
Thread-Index: AQHY8voad8K6jE28j02RCI2Gw4PNuq405DmAgABacACAATUsAIAAa90AgAA9fwA=
Date: Wed, 9 Nov 2022 21:23:58 +0000
Message-ID: <d60266dc-6a10-b234-954c-a899a7ad054f@csgroup.eu>
References: <20221107223921.3451913-1-song@kernel.org>
 <Y2o9Iz30A3Nruqs4@kernel.org>
 <9e59a4e8b6f071cf380b9843cdf1e9160f798255.camel@intel.com>
 <Y2uMWvmiPlaNXlZz@kernel.org>
 <CAPhsuW5e8rBnu73DYkyc1L6gC-WBxjTZVwdFC_L12GVyzROR1w@mail.gmail.com>
In-Reply-To:  <CAPhsuW5e8rBnu73DYkyc1L6gC-WBxjTZVwdFC_L12GVyzROR1w@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1790:EE_
x-ms-office365-filtering-correlation-id: 1dda1ec3-6579-426e-e322-08dac298b703
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  DZKDRiEpe2xByeq7QqGx7I1jOaQNSzaSoITmz8suifKypw87hQCuXNnFUCcsFFV2b1QrM4axna5BQUpqe1YwIhJSd4e2VtO4a8Tp0iR3QKk2U+nRusFPSTHMQ1VNzFwvsj5/YhOOeUyPtDUBtv+JyelPZIk4Zwz/D0gYPIOsoDlTlDD9maExogAG+IVUcenrOFhapNqWHfLG5N4jUlJqJPGQ+nHKOFpo33fSILikoXwSdpxjqh6h+ZLWfX3xsTz3PmcSf96GPvU6vFD2xB0kmbeu6DI11+o0EM3kC45WPKqXbsVEt6Lv1umhNxSNJpek65nIfU4DwZm6VtTWAMtoCNHQ08Ik7lTPYX8aqduV2twX5iltUBsAOcRuGSba1LavPfq2t/Qgr4YZ/uaE/4c2Z5UsizFpngotAd6vTOTcCpFbrE+Cs+cZsKB3vW/cDybNJdaFF9rPzIok8SmDeyHxV2f7HM/+XMa+sLr582Oe2bHAZ7vJGVKhnFoFSADyL0Fq7RNAKbYSYdhRKmtIS02Wb27Tp+s+dEejhlS9SKf09gYiI7ASlkbsz77N87NxqkT5ondRiXXoJP+mRrRTb1pAQls2gdNmUrIfv+iChzwm8cc/GkLMPTaSVnKRmSXglgJ8cdM/87W01D2ihHeOFeXghqsEwN09Mv7Yz8gWygo92UVbc8nNBgInVtYoPgtllF1ZX1LHFZEtei7xA/9ssDTPLfcnU7WU5I7CosgdfyPrY/mLGo2nYapgmkvC2sj/2rCUIQ+Zx4FmN4PQSG4Q3GPRYVZ+FuxqYYS1FiiSDEGJjWH1nLV4sQBApOfE8qjSdCUuwwGLtuzfqUBn5AF/MNlA0A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199015)(71200400001)(6486002)(53546011)(478600001)(66574015)(4326008)(91956017)(8676002)(66556008)(76116006)(64756008)(66446008)(66476007)(66946007)(83380400001)(5660300002)(44832011)(41300700001)(8936002)(7416002)(122000001)(86362001)(31696002)(38100700002)(2906002)(31686004)(26005)(54906003)(110136005)(38070700005)(2616005)(6506007)(6512007)(316002)(186003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Uk5MOVpydGQ1aVdTdWlacTE4TDVZbWhYSkhTQXFrWlZOUVJFZk9iZGp2NVBD?=
 =?utf-8?B?Q21SVzdhcmluaHVaZzBRdERpSFJzRUdzeC9Gc09IT0o1SytNQUpjdnd2QkRx?=
 =?utf-8?B?bzQyYW8zZXFtY3ViTmF0TTdVckhMdmRaUnhxRGRXdjF2c0F3RnBJSVM4NHRu?=
 =?utf-8?B?RmxFanY0T0N5dGpia1lQQ3dGdWFRTmozYXovR3lLQ01ORWZHL3IwQUVjeVcz?=
 =?utf-8?B?dWJkOWFMSHNORDBXY3ZZRmJnZ1AydXdaOE12Yk9sZi81ZE10OEZWMS84RHFE?=
 =?utf-8?B?RjNPS2txQzIwVVIrQkNhbjRvNHpIZWNUdjVFVFJMeThGbEJBbHNmV1F1RlFF?=
 =?utf-8?B?MDh0bnRoL2o3VEt3blg5eURRakhJZDVWQkp4b3dLZzhUUEtwblFjQUxHL2pY?=
 =?utf-8?B?djJDb3lSM08xSmR2T0ZvMk1yZ2d3UFgzdFNXajg4V1pxMkloazVFSVJ0TWhG?=
 =?utf-8?B?bzZWbU94V0xGaCtqOCtmalZEcHkxVGFUTEdITytHNzRYcWVHcm0rU0hNcC9H?=
 =?utf-8?B?cERheHRkQVA3RXNmTXlETHQ1RFNNdi9nUEJtWTliYjJieElMV24yOUtZWDd6?=
 =?utf-8?B?Tmd2bnU0QnZDY0xCdFpKQU9keVdpK1k2OXd5NnFyYVc5VkhBUXlSL2E1SDY4?=
 =?utf-8?B?VHd2WE9heHZlNEo0STl3WTdNbVU2OEhYa2ZmSmdCMFBoR1JsUTNjU2NKU2M4?=
 =?utf-8?B?T0tYQlM2MkdSakVzWlYzcEM4OUhpaUlvUlE4RGlXR1dVMlZxcGppWDJoandD?=
 =?utf-8?B?Rk9LTmREUDdEcUUwMzVpTEhydjFjT3gxY0xKQUR3QnMxVE5QNTZhNWM3dkZC?=
 =?utf-8?B?VnVIWnIybm53cHJhWEJQZEgxcmdpYTBlTFZSNVd2WlQyV2NIenJrMzljd2Vq?=
 =?utf-8?B?bFNGSzFMUDJ5WUx3Z3dodUNqWFRkSS9ETVBkZStrbGlrcHUwMEZHTWRVSVB2?=
 =?utf-8?B?Z01MZ0xkS1hBU3NyT2FqSCtnU3ZXQmhMUzlGbkxSU1ArV2lsbTJOUXcxQlQy?=
 =?utf-8?B?dnpDYWFDQm9IQjZDNXFoNzVzVDR4SlZ0cXBrNEJXS3YzQjZtSEoxMEJNbHg5?=
 =?utf-8?B?UGo5RmZLcDFudnhnYTgzTkx6Qk5uYngwN3BWd0tPT0NxcjlaaGY4MHFldzhC?=
 =?utf-8?B?Z3BqelJoNUpta1hHQjVibDlxaE14UmhITEV5WDNsRW9IeUZUZXpnWHBZMGtS?=
 =?utf-8?B?UEYxMDBtbUlBOEFncTlzaVRPdDJ1OWN1K05DZTliWjlnR3c4cExsV0I4YldQ?=
 =?utf-8?B?ZWZGYmRta3BrV29VRlZkd29TMHMyQ1VjOHBTUmkyS0YzRXFjVVVUTnJWN0Nn?=
 =?utf-8?B?T2xpMWFCWlhxWnFlcXF2NkE0aGM1RXpNK0xTbmRMMFlHaXZnQnVlSmFmZklj?=
 =?utf-8?B?djM2bDU2RnRLRjU3Sm41RWkvalZDQ240QkNvTit0b3lTM1FQQnNJY2JsaTdk?=
 =?utf-8?B?V29LSnY4R214ZHgrUjZ1ay9JSkpxQXM4SlNQVVF4dys4MnU2ZHp1MElwc3JP?=
 =?utf-8?B?bWo1YVc2SzJwazNEL0ZzVm1nVmhzdFVESVpEdUJiY252ZjZTNi90eHpZbTFT?=
 =?utf-8?B?UWd3RkJsQk1zQXk3d0xwQ2ZWc2JtZHpaMGQrT2FET2pRT1IvL3FqQjZQOXpL?=
 =?utf-8?B?NGt3SVcvQzk2Y1ZnalZGdEVUY1ZGclA4T3FZc2N4SktVWHhwVlNsd1E3Tngy?=
 =?utf-8?B?U0M2NHpWRDJkL2NJcVE0NWpwb3Z5N3JBMVAvbjd3cHNETVVKUFErb2FRYUND?=
 =?utf-8?B?NC90Wit4eTVMbXREejE3allmUnhqYnlKVTZST25jdUFLenNVQmRaSnNKNHVx?=
 =?utf-8?B?SjJZbkZrN283ZDRkd1BKbnVzQytrMXBRUk1DalFFVEFadEFEYVA2My9nMWUz?=
 =?utf-8?B?MzVOZ1d4ck5ITjd0RHM3elNvT2NCc1RBWDlPQ0s2ZGIvRkgzakFEai9xNE5j?=
 =?utf-8?B?dFhKZnJxbjQ5T2Z0TGhDbGVKeXNFOFRXTzVRajd4Y2hOaDljVjVMLytQQjNu?=
 =?utf-8?B?cVhkVVJ5Um1UTWQ4MTUwSk5ncFBVUERSV0tla0tydmNQdm8zWVY1enpxK0U1?=
 =?utf-8?B?cm94ZUVtQS8rdnhDaUtKMEZCcWpuVS8ybU1GVHZFeklDL201bWZQT3poSVIv?=
 =?utf-8?B?TWlxaUtOdHVyOXNrOWpGdDBSeDZPcVpFZmJ5M2YzbS9SUWJ6MC9ORTRWZVZZ?=
 =?utf-8?Q?Nnh/C7/LOiSiZzv+K73nUD8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9ED4B6E3CD86F4397D4543C1CFF7ACA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dda1ec3-6579-426e-e322-08dac298b703
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 21:23:58.7492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GjjiXPq9+4nJGOECogrPTg2UPEcT/HZ609VjWP24cvzdU7/zga1Z0xS3b/eBtTPDS6vMXufHqI1JAU2br/kndgIFk1sBC6mDpfWHTN0x9KQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1790
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
Cc: "Lu,
 Aaron" <aaron.lu@intel.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "peterz@infradead.org" <peterz@infradead.org>, "x86@kernel.org" <x86@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "hch@lst.de" <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KyBsaW51eHBwYy1kZXYgbGlzdCBhcyB3ZSBzdGFydCBtZW50aW9uaW5nIHBvd2VycGMuDQoNCkxl
IDA5LzExLzIwMjIgw6AgMTg6NDMsIFNvbmcgTGl1IGEgw6ljcml0wqA6DQo+IE9uIFdlZCwgTm92
IDksIDIwMjIgYXQgMzoxOCBBTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+IHdyb3Rl
Og0KPj4NCj4gWy4uLl0NCj4gDQo+Pj4+DQo+Pj4+IFRoZSBwcm9wb3NlZCBleGVjbWVtX2FsbG9j
KCkgbG9va3MgdG8gbWUgdmVyeSBtdWNoIHRhaWxvcmVkIGZvciB4ODYNCj4+Pj4gdG8gYmUNCj4+
Pj4gdXNlZCBhcyBhIHJlcGxhY2VtZW50IGZvciBtb2R1bGVfYWxsb2MoKS4gU29tZSBhcmNoaXRl
Y3R1cmVzIGhhdmUNCj4+Pj4gbW9kdWxlX2FsbG9jKCkgdGhhdCBpcyBxdWl0ZSBkaWZmZXJlbnQg
ZnJvbSB0aGUgZGVmYXVsdCBvciB4ODYNCj4+Pj4gdmVyc2lvbiwgc28NCj4+Pj4gSSdkIGV4cGVj
dCBhdCBsZWFzdCBzb21lIGV4cGxhbmF0aW9uIGhvdyBtb2R1bGVzIGV0YyBjYW4gdXNlIGV4ZWNt
ZW1fDQo+Pj4+IEFQSXMNCj4+Pj4gd2l0aG91dCBicmVha2luZyAheDg2IGFyY2hpdGVjdHVyZXMu
DQo+Pj4NCj4+PiBJIHRoaW5rIHRoaXMgaXMgZmFpciwgYnV0IEkgdGhpbmsgd2Ugc2hvdWxkIGFz
ayBhc2sgb3Vyc2VsdmVzIC0gaG93DQo+Pj4gbXVjaCBzaG91bGQgd2UgZG8gaW4gb25lIHN0ZXA/
DQo+Pg0KPj4gSSB0aGluayB0aGF0IGF0IGxlYXN0IHdlIG5lZWQgYW4gZXZpZGVuY2UgdGhhdCBl
eGVjbWVtX2FsbG9jKCkgZXRjIGNhbiBiZQ0KPj4gYWN0dWFsbHkgdXNlZCBieSBtb2R1bGVzL2Z0
cmFjZS9rcHJvYmVzLiBMdWlzIHNhaWQgdGhhdCBSRkMgdjIgZGlkbid0IHdvcmsNCj4+IGZvciBo
aW0gYXQgYWxsLCBzbyBoYXZpbmcgYSBjb3JlIE1NIEFQSSBmb3IgY29kZSBhbGxvY2F0aW9uIHRo
YXQgb25seSB3b3Jrcw0KPj4gd2l0aCBCUEYgb24geDg2IHNlZW1zIG5vdCByaWdodCB0byBtZS4N
Cj4gDQo+IFdoaWxlIHVzaW5nIGV4ZWNtZW1fYWxsb2MoKSBldC4gYWwuIGluIG1vZHVsZSBzdXBw
b3J0IGlzIGRpZmZpY3VsdCwgZm9sa3MgYXJlDQo+IG1ha2luZyBwcm9ncmVzcyB3aXRoIGl0LiBG
b3IgZXhhbXBsZSwgdGhlIHByb3RvdHlwZSB3b3VsZCBiZSBtb3JlIGRpZmZpY3VsdA0KPiBiZWZv
cmUgQ09ORklHX0FSQ0hfV0FOVFNfTU9EVUxFU19EQVRBX0lOX1ZNQUxMT0MNCj4gKGludHJvZHVj
ZWQgYnkgQ2hyaXN0b3BoZSkuDQoNCkJ5IHRoZSB3YXksIHRoZSBtb3RpdmF0aW9uIGZvciBDT05G
SUdfQVJDSF9XQU5UU19NT0RVTEVTX0RBVEFfSU5fVk1BTExPQyANCndhcyBjb21wbGV0ZWx5IGRp
ZmZlcmVudDogVGhpcyB3YXMgYmVjYXVzZSBvbiBwb3dlcnBjIGJvb2szcy8zMiwgbm8tZXhlYyAN
CmZsYWdnaW4gaXMgcGVyIHNlZ21lbnQgb2Ygc2l6ZSAyNTYgTWJ5dGVzLCBzbyBpbiBvcmRlciB0
byBwcm92aWRlIA0KU1RSSUNUX01PRFVMRVNfUldYIGl0IHdhcyBuZWNlc3NhcnkgdG8gcHV0IGRh
dGEgb3V0c2lkZSBvZiB0aGUgc2VnbWVudCANCnRoYXQgaG9sZHMgbW9kdWxlIHRleHQgaW4gb3Jk
ZXIgdG8gYmUgYWJsZSB0byBmbGFnIFJXIGRhdGEgYXMgbm8tZXhlYy4NCg0KQnV0IEknbSBoYXBw
eSBpZiBpdCBjYW4gYWxzbyBzZXJ2ZSBvdGhlciBwdXJwb3Nlcy4NCg0KPiANCj4gV2UgYWxzbyBo
YXZlIG90aGVyIHVzZXJzIHRoYXQgd2UgY2FuIG9uYm9hcmQgc29vbjogQlBGIHRyYW1wb2xpbmUg
b24NCj4geDg2XzY0LCBCUEYgaml0IGFuZCB0cmFtcG9saW5lIG9uIGFybTY0LCBhbmQgbWF5YmUg
YWxzbyBvbiBwb3dlcnBjIGFuZA0KPiBzMzkwLg0KPiANCj4+DQo+Pj4gRm9yIG5vbi10ZXh0X3Bv
a2UoKSBhcmNoaXRlY3R1cmVzLCB0aGUgd2F5IHlvdSBjYW4gbWFrZSBpdCB3b3JrIGlzIGhhdmUN
Cj4+PiB0aGUgQVBJIGxvb2sgbGlrZToNCj4+PiBleGVjbWVtX2FsbG9jKCkgIDwtIERvZXMgdGhl
IGFsbG9jYXRpb24sIGJ1dCBuZWNlc3NhcmlseSB1c2FibGUgeWV0DQo+Pj4gZXhlY21lbV93cml0
ZSgpICA8LSBMb2FkcyB0aGUgbWFwcGluZywgZG9lc24ndCB3b3JrIGFmdGVyIGZpbmlzaCgpDQo+
Pj4gZXhlY21lbV9maW5pc2goKSA8LSBNYWtlcyB0aGUgbWFwcGluZyBsaXZlIChsb2FkZWQsIGV4
ZWN1dGFibGUsIHJlYWR5KQ0KPj4+DQo+Pj4gU28gZm9yIHRleHRfcG9rZSgpOg0KPj4+IGV4ZWNt
ZW1fYWxsb2MoKSAgPC0gcmVzZXJ2ZXMgdGhlIG1hcHBpbmcNCj4+PiBleGVjbWVtX3dyaXRlKCkg
IDwtIHRleHRfcG9rZXMoKSB0byB0aGUgbWFwcGluZw0KPj4+IGV4ZWNtZW1fZmluaXNoKCkgPC0g
ZG9lcyBub3RoaW5nDQo+Pj4NCj4+PiBBbmQgbm9uLXRleHRfcG9rZSgpOg0KPj4+IGV4ZWNtZW1f
YWxsb2MoKSAgPC0gQWxsb2NhdGVzIGEgcmVndWxhciBSVyB2bWFsbG9jIGFsbG9jYXRpb24NCj4+
PiBleGVjbWVtX3dyaXRlKCkgIDwtIFdyaXRlcyBub3JtYWxseSB0byBpdA0KPj4+IGV4ZWNtZW1f
ZmluaXNoKCkgPC0gZG9lcyBzZXRfbWVtb3J5X3JvKCkvc2V0X21lbW9yeV94KCkgb24gaXQNCj4+
Pg0KPj4+IE5vbi10ZXh0X3Bva2UoKSBvbmx5IGdldHMgdGhlIGJlbmVmaXRzIG9mIGNlbnRyYWxp
emVkIGxvZ2ljLCBidXQgdGhlDQo+Pj4gaW50ZXJmYWNlIHdvcmtzIGZvciBib3RoLiBUaGlzIGlz
IHByZXR0eSBtdWNoIHdoYXQgdGhlIHBlcm1fYWxsb2MoKSBSRkMNCj4+PiBkaWQgdG8gbWFrZSBp
dCB3b3JrIHdpdGggb3RoZXIgYXJjaCdzIGFuZCBtb2R1bGVzLiBCdXQgdG8gZml0IHdpdGggdGhl
DQo+Pj4gZXhpc3RpbmcgbW9kdWxlcyBjb2RlICh3aGljaCBpcyBhY3R1YWxseSBzcHJlYWQgYWxs
IG92ZXIpIGFuZCBhbHNvDQo+Pj4gaGFuZGxlIFJPIHNlY3Rpb25zLCBpdCBhbHNvIG5lZWRlZCBz
b21lIGFkZGl0aW9uYWwgYmVsbHMgYW5kIHdoaXN0bGVzLg0KPj4NCj4+IEknbSBsZXNzIGNvbmNl
cm5lZCBhYm91dCBub24tdGV4dF9wb2tlKCkgcGFydCwgYnV0IHJhdGhlciBhYm91dA0KPj4gcmVz
dHJpY3Rpb25zIHdoZXJlIGNvZGUgYW5kIGRhdGEgY2FuIGxpdmUgb24gZGlmZmVyZW50IGFyY2hp
dGVjdHVyZXMgYW5kDQo+PiB3aGV0aGVyIHRoZXNlIHJlc3RyaWN0aW9ucyB3b24ndCBsZWFkIHRv
IGluYWJpbGl0eSB0byB1c2UgdGhlIGNlbnRyYWxpemVkDQo+PiBsb2dpYyBvbiwgc2F5LCBhcm02
NCBhbmQgcG93ZXJwYy4NCg0KVW50aWwgcmVjZW50bHksIHBvd2VycGMgQ1BVIGRpZG4ndCBpbXBs
ZW1lbnQgUEMtcmVsYXRpdmUgZGF0YSBhY2Nlc3MuIA0KT25seSB2ZXJ5IHJlY2VudCBwb3dlcnBj
IENQVXMgKHBvd2VyMTAgb25seSA/KSBoYXZlIGNhcGFiaWxpdHkgdG8gZG8gDQpQQy1yZWxhdGl2
ZSBhY2Nlc3NlcywgYnV0IHRoZSBrZXJuZWwgZG9lc24ndCB1c2UgaXQgeWV0LiBTbyB0aGVyZSdz
IG5vIA0KY29uc3RyYWludCBhYm91dCBkaXN0YW5jZSBiZXR3ZWVuIHRleHQgYW5kIGRhdGEuIFdo
YXQgbWF0dGVycyBpcyB0aGUgDQpkaXN0YW5jZSBiZXR3ZWVuIGNvcmUga2VybmVsIHRleHQgYW5k
IG1vZHVsZSB0ZXh0IHRvIGF2b2lkIHRyYW1wb2xpbmVzLg0KDQo+Pg0KPj4gRm9yIGluc3RhbmNl
LCBpZiB3ZSB1c2UgZXhlY21lbV9hbGxvYygpIGZvciBtb2R1bGVzLCBpdCBtZWFucyB0aGF0IGRh
dGENCj4+IHNlY3Rpb25zIHNob3VsZCBiZSBhbGxvY2F0ZWQgc2VwYXJhdGVseSB3aXRoIHBsYWlu
IHZtYWxsb2MoKS4gV2lsbCB0aGlzDQo+PiB3b3JrIHVuaXZlcnNhbGx5PyBPciB0aGlzIHdpbGwg
cmVxdWlyZSBzcGVjaWFsIGNhcmUgd2l0aCBhZGRpdGlvbmFsDQo+PiBjb21wbGV4aXR5IGluIHRo
ZSBtb2R1bGVzIGNvZGU/DQo+Pg0KPj4+IFNvIHRoZSBxdWVzdGlvbiBJJ20gdHJ5aW5nIHRvIGFz
ayBpcywgaG93IG11Y2ggc2hvdWxkIHdlIHRhcmdldCBmb3IgdGhlDQo+Pj4gbmV4dCBzdGVwPyBJ
IGZpcnN0IHRob3VnaHQgdGhhdCB0aGlzIGZ1bmN0aW9uYWxpdHkgd2FzIHNvIGludGVydHdpbmVk
LA0KPj4+IGl0IHdvdWxkIGJlIHRvbyBoYXJkIHRvIGRvIGl0ZXJhdGl2ZWx5LiBTbyBpZiB3ZSB3
YW50IHRvIHRyeQ0KPj4+IGl0ZXJhdGl2ZWx5LCBJJ20gb2sgaWYgaXQgZG9lc24ndCBzb2x2ZSBl
dmVyeXRoaW5nLg0KPj4NCj4+IFdpdGggZXhlY21lbV9hbGxvYygpIGFzIHRoZSBmaXJzdCBzdGVw
IEknbSBmYWlsaW5nIHRvIHNlZSB0aGUgbGFyZ2UNCj4+IHBpY3R1cmUuIElmIHdlIHdhbnQgdG8g
dXNlIGl0IGZvciBtb2R1bGVzLCBob3cgd2lsbCB3ZSBhbGxvY2F0ZSBSTyBkYXRhPw0KPj4gd2l0
aCBzaW1pbGFyIHJvZGF0YV9hbGxvYygpIHRoYXQgdXNlcyB5ZXQgYW5vdGhlciB0cmVlIGluIHZt
YWxsb2M/DQo+PiBIb3cgdGhlIGNhY2hpbmcgb2YgbGFyZ2UgcGFnZXMgaW4gdm1hbGxvYyBjYW4g
YmUgbWFkZSB1c2VmdWwgZm9yIHVzZSBjYXNlcw0KPj4gbGlrZSBzZWNyZXRtZW0gYW5kIFBLUz8N
Cj4gDQo+IElmIFJPIGRhdGEgY2F1c2VzIHByb2JsZW1zIHdpdGggZGlyZWN0IG1hcCBmcmFnbWVu
dGF0aW9uLCB3ZSBjYW4gdXNlDQo+IHNpbWlsYXIgbG9naWMuIEkgdGhpbmsgd2Ugd2lsbCBuZWVk
IGFub3RoZXIgdHJlZSBpbiB2bWFsbG9jIGZvciB0aGlzIGNhc2UuDQo+IFNpbmNlIHRoZSBsb2dp
YyB3aWxsIGJlIG1vc3RseSBpZGVudGljYWwsIEkgcGVyc29uYWxseSBkb24ndCB0aGluayBhZGRp
bmcNCj4gYW5vdGhlciB0cmVlIGlzIGEgYmlnIG92ZXJoZWFkLg0KDQpPbiBwb3dlcnBjLCBrZXJu
ZWwgY29yZSBSQU0gaXMgbm90IG1hcHBlZCBieSBwYWdlcyBidXQgaXMgbWFwcGVkIGJ5IA0KYmxv
Y2tzLiBUaGVyZSBhcmUgb25seSB0d28gYmxvY2tzOiBPbmUgUk9YIGJsb2NrIHdoaWNoIGNvbnRh
aW5zIGJvdGggDQp0ZXh0IGFuZCByb2RhdGEsIGFuZCBvbmUgUlcgYmxvY2sgdGhhdCBjb250YWlu
cyBldmVyeXRoaW5nIGVsc2UuIE1heWJlIA0KdGhlIHNhbWUgY2FuIGJlIGRvbmUgZm9yIG1vZHVs
ZXMuIFdoYXQgbWF0dGVycyBpcyB0byBiZSBzdXJlIHlvdSBuZXZlciANCmhhdmUgV1ggbWVtb3J5
LiBIYXZpbmcgUk9YIHJvZGF0YSBpcyBub3QgYW4gaXNzdWUuDQoNCkNocmlzdG9waGU=
