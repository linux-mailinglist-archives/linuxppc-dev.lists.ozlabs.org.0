Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8474E9F0E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 20:37:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KS1db4JTKz3c6S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 05:37:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::624;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::624])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KS1d30sMYz3c00
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 05:36:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSr3zGjvfgeDDYhQCPy6erUJujXQXM1XAiHTYFsD4/Ruo7lD/ttqYBCcID5sNeZ8+ECNaYxNmgq9vt6GKSwUx8QLpEgq95c12g7Bn8/kGDNQD8vSUAo4q07k54MA33QBzSsScm8oVFFs+12TQ0DXG/PGGnCZ7SPWmPZYXlBgaL65RVv3zhe55MNyRjMpMsRnUKkUadm6UXInboHLow+jHJ24Uw5a69ZqpTohOAnreDfyu5Q0dy13IIxhx7MCxzGnd6rmpdz6wD7Ic1sjObr5mgMWhnJG4gdG4asDkFjMHNbeDE+m6zaqVZRDjlUys8Elx5HtaIvPDENIVp0zbnCkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qDqONWrX9v2AE9/95Qdt5lzPxHBhhblvZcNCw5Lpzk=;
 b=JfSuqdyB2td/9o0PKyDsknZYQxFEk8ulB5hwvTR5m9Eh+7vwuxVDSwF0CvbMR6Eg8UXhHclLeL8Cs58PYSJD5ClMtxdqws46F0kv0Lq4rBsQRII3PgnBIJ6IyasmVQi8Byjl5zXyDpPlN650SnhcpPKgWOD+n27mwP2k2bnSW9mCPmCl1gK3ZG48oeu9ExmYtTxVEg54h6TcxeSI/OqfXmx9xPsO3sYIPiJBu4+kwbnjO8kjCseUGIiLwPccd/4M3UvgMgBA717ALk3m8vFuemAIxa1QR3pLS8rjEmgAKpleIB5WJEKtkgdSb0IB5KgydLegX1fPUIuPxiwVwjmFDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB4266.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:25d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Mon, 28 Mar
 2022 18:36:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 18:36:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 =?utf-8?B?TXVyaWxvIE9wc2ZlbGRlciBBcmHDumpv?= <mopsfelder@gmail.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc: Reject probes on instructions that can't be
 single stepped
Thread-Topic: [PATCH 1/2] powerpc: Reject probes on instructions that can't be
 single stepped
Thread-Index: AQHYPqxy/rrErpVr9kyPbKPlEiDiuKzOleUAgACSIYCABerMgIAAFU+A
Date: Mon, 28 Mar 2022 18:36:30 +0000
Message-ID: <0ce827d8-cd2b-b113-d645-a469d687d615@csgroup.eu>
References: <cover.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
 <e81779aa105d67799742c3e3f59075dce9f05cfb.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
 <9b5ec756-a074-390a-0955-6d973eacac28@gmail.com>
 <8735j7gdpi.fsf@mpe.ellerman.id.au>
 <1648487815.ub2owcvzpb.naveen@linux.ibm.com>
In-Reply-To: <1648487815.ub2owcvzpb.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccd05683-eae6-4393-8e3f-08da10e9e096
x-ms-traffictypediagnostic: PR0P264MB4266:EE_
x-microsoft-antispam-prvs: <PR0P264MB42668F78E6D312A9CA0949F5ED1D9@PR0P264MB4266.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: upPkZb7m01woqicITpv7TH9a3/3lkAqD2yOY8UFPQHxlYcNxRX3yZLLaoGUwUncmjOHdVy4l06GnyrAInD/vKyMKIErZsVJYpYMHndhXumE7/vIHk+M4C3Lz4Z1yJb38iTe8RgFODoE0biIRo+7UNpij3gZsc/awKAZ9KV2i67yTRUYvbj65yHOBGPLjVlvLsvxsfPbAKiPlfvKWnzSBeuosmi+RafCtrHxdPejpBErdjbIBZD4i4IzE9kAJVhE7aM8uj2SXi7hKc+UOR1HYK4mnzkdN+q04gt5oFDo+fozRbGlvh2keAp+maVRh+fVKZf/zqverDbDMk882cLqD2fhygRswMifsQuY8ql2pLGR72bLGn1F4jgLQpgPSoF8lqvLG7HbMDhQVrKSi1RT9LgFq4gLQR/C0E1zGugrUkBqVrSTMTUCSbpf14h+YufMdGzLSG7mm6/qaFvG8G63WhyaItn5spfFZ7Fh6yvLFpmzNeuFOZoU3O83e6oUFC+djGfcHbAYxOHntbUcPVf1VV1s+mEKKsjP2VWRFmpz0AVLS3HtSyWSi2ER5V4iJshCz2Ji74bSyJf8yDprYh54honygUQiRST35j0957/If+wtaAOhQPYtBZ34pZtHiMIfSdrpQDdtjEPU3usF1d8nsgyrugKF55YTCIdFd4yGjfQwaK98w1bL7C7RSQIgmswrIimS9VGm9k+Te/DavPmAKOs4AO0kJnz4C3e+FC4QpTlInx/Pv59tMHhfwWJeJhSOg9jBDnbFOOxHKblChzCU2Lg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(91956017)(66476007)(8676002)(76116006)(110136005)(64756008)(38100700002)(66946007)(66446008)(86362001)(122000001)(36756003)(508600001)(31696002)(316002)(38070700005)(66556008)(4326008)(71200400001)(66574015)(8936002)(6486002)(6506007)(2616005)(6512007)(83380400001)(5660300002)(26005)(53546011)(2906002)(186003)(31686004)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVBhdURJd3ZRUnhRM1RvcUJKZzNjM2RMSmN2SnJoSTBmQlI4RkQ2amdPS1JT?=
 =?utf-8?B?NUVzSW1YQkVDR3Voek1BU2FrR3gyeGJCM0tSKzVDemZJOVlLQW5uYmlZWDlV?=
 =?utf-8?B?M1A2REpoOVRDNGNMQk9CRjZSbjlOa2FZSWdjajFyVlFmQkRtdi9rRTZZTDY1?=
 =?utf-8?B?YkZOVnRMYVFHWC81bmlnUkVDYVBVM3M5b3liZUJyZWdKd09hcmZxWkJ4a1ZC?=
 =?utf-8?B?N1NPQ2lFWG80NERTdFdPSHZldGpBS1dMWkVrM2ZYOGx4d0RJU2dYNU0zQ2ZZ?=
 =?utf-8?B?TzBmQWtHcW9TSHlqYjNzaEpNU1REWFZyWkcxdy9wYnZyUWs3anFQenpGMjdx?=
 =?utf-8?B?TldGdW9ZU05RYzdSbzNaZ3ZzblByc1k5ZEkxSG5seEhIZkRDMWxIemM5RnFT?=
 =?utf-8?B?VVRWc1M2a212a0lSVHJQZlFDT1cwNSsyYXNQOVdDektPbkh4NlJtWm5CN2do?=
 =?utf-8?B?T1NtYWNPdjBYZitIa3J3T294ejhFZkswbVY4OFhFdWk3d0pUYi80Ykt6cG1R?=
 =?utf-8?B?S2lrZSsva3AvQWpKcVgydE9OR2cyc096YnIzWis2TW5SWFcwTVhxdndNbURY?=
 =?utf-8?B?TGYrakhhbTBhMVNNa0JkK2FLNUlNZ3g2dURMYlErUHlCNEU2NDhoanZIeHRl?=
 =?utf-8?B?NmFiM0RsMGJ2dGxiaUxLL05IY3VTNmZ3MlBvTVQzRFB5c1VNMU82SnBxeWhr?=
 =?utf-8?B?QjRzVm84TjBFb2hvbC83WG9icE4zdXA3TDR2M0tiQkp1N05obG5UdVB6SlpT?=
 =?utf-8?B?L21NS3lSam40V2ttS0RqRjduRHVCenJXM0N1eGY5MXdZV1VEVzFPZi9FenUv?=
 =?utf-8?B?VUlrWHZhT3l2UFhtVGxVdC9kMzNQNVRhMlRPcDVkY1hRTzloWU1Ga1VhUzVo?=
 =?utf-8?B?UFNvQ1pJdE50Vk94c0pEa1JQeTY1NWVIcDlNdzhjRWFLdU9CY0lTbGpoWGlx?=
 =?utf-8?B?NVBqZGdQNy9PSU9sbVprQ0FhRlBhcnZhQTRLVGFzY05xSjV5bm9SRUhQemQz?=
 =?utf-8?B?UlFBVnpXMCt0bHZjY3dDeVNLM3J1bE93d0hvcDUwczd5Q2sxSzFBdVJWckJk?=
 =?utf-8?B?di9kc0VpazNZcHJmWGZPMlNVam4zQktaL21vM2ROdzVBQXBWVmpTS1UwaGdj?=
 =?utf-8?B?RnF3SmJCdWlLZDkxOGlFS2pic2J2ZGxUZU1nMXNmUmwxUjZZaFBXTU9ha2dE?=
 =?utf-8?B?MURsdkJiS1Z6WXZ6d2lIbVZuOGEzb0dRN3cwOG5DTUppYkZJY1N4YjZvUGFx?=
 =?utf-8?B?M2QrVmh5MDZZcEsxWlhzbi9nTXJmSDJxVjFyeG5XZjF4SkRrS2Q1MVVkdDB4?=
 =?utf-8?B?di8wYlY2Nzd1ODJncytwSzFYVVNDUmVWTm9EdGtsL0tVTmh0Mll5OVhacWF6?=
 =?utf-8?B?NzRqYW5MRkhrWjh1SDJJWS91NWV4VFY5cWlKQk9jVERWZjZMUDNpSklzazV2?=
 =?utf-8?B?eEM4cWNBaXFqQ2Y3c0xYemhlQ3JjNVQzV24yUkZEbUY0K1RiR3IrYTIvTVRD?=
 =?utf-8?B?dmh0NHlBRTlLZlN0Zy9TU3hQZW9RRlRrc3pRMkE2NUprR2d1SnJUMGhKSTdo?=
 =?utf-8?B?V1lITnNRU2c1MDE2RzY0WUdobloxRHZXVzE2R0M3OFd2dHVyRW10Q0N0cEQ0?=
 =?utf-8?B?MXBzbVU0SGVYandrRWk4SXZWRVFYNW1lR1JNQzlUZUpZcVNJMjVmNHYyOXl4?=
 =?utf-8?B?R29ZSE5oZzJUc0lsZmZDdGFoTzhvVk8wSDRKZktzaC9DcWRpS05jVlBuZjJi?=
 =?utf-8?B?R25lTG96ZXk5V1EwUHBMNzBHUlpqTVlKLzNvNVFqUjdpeWtuMFVmbUtpTWE4?=
 =?utf-8?B?ak1SMExtMTJ6dUtiaHRtNWpzd3V0VElobVV1NzhuTWZEbnEyMnJsdnd1OStB?=
 =?utf-8?B?Q3lsb0dIVlpzdDA1dGxvZ0dJcVJYM3lOWDc1aE5WeDAzczVlTE85WnZHWUlT?=
 =?utf-8?B?aEcxYkdZSmVvdjBWcklpV1FMWFhCT096YXBHcVhpNnd6c250ZTFPMkE5RVRi?=
 =?utf-8?B?eHY3NXJiNUY4UWhJR2dmZ2ZOMnF5bXU2VnlVM2IwYkkwdURORCtyOVBQTXh6?=
 =?utf-8?B?bDA0WVB2eWdPN3gzaW9zZlhVUjdjWmN0eHBkYmlGR2tWRWwvd1A5RllsRENr?=
 =?utf-8?B?akV6c09qakdBM1RvM2VBYWV3MHlTWmFoekdqbW5rZ3FuT1pKTWR5MlpzamZD?=
 =?utf-8?B?eCsreEpUdlQrNlk0YWNUdGpUU0tKRTdrcE9kdllCK0NVcGlxb1IrNW1Va0o2?=
 =?utf-8?B?M1FTc3ZRQkFJSU1YMlpKeE9hY2hicFg0MHJRQXJKVm9PZzVDVDlZeHZRbmZR?=
 =?utf-8?B?ekx5QlVySlBvd1gyeUZYbjVVdGRxK3pFRVhLVHJGSGtUYnUxRFhjenVSNjQr?=
 =?utf-8?Q?qEB5Ul7c+YORwSZ1KV8IOhtcP/XRRR3UQYY6y?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22552CD999327345A49A7A3DAF0ED215@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd05683-eae6-4393-8e3f-08da10e9e096
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 18:36:30.6952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7SAzfmc+q0CoXqoRb/dnlqs9FiGJP3wyqYKg/uvcQwde7++WpG76bk1G4DhsyQtwS+vUFhddKwMwDn32yaXoheKGjSo7KpElaB8EUnhX3UM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB4266
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzAzLzIwMjIgw6AgMTk6MjAsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
TWljaGFlbCBFbGxlcm1hbiB3cm90ZToNCj4+IE11cmlsbyBPcHNmZWxkZXIgQXJhw7pqbyA8bW9w
c2ZlbGRlckBnbWFpbC5jb20+IHdyaXRlczoNCj4+PiBPbiAzLzIzLzIyIDA4OjUxLCBOYXZlZW4g
Ti4gUmFvIHdyb3RlOg0KPj4+PiArc3RhdGljIGlubGluZSBib29sIGNhbl9zaW5nbGVfc3RlcCh1
MzIgaW5zdCkNCj4+Pj4gK3sNCj4+Pj4gK8KgwqDCoCBzd2l0Y2ggKGluc3QgPj4gMjYpIHsNCj4+
Pg0KPj4+IENhbid0IHBwY19pbnN0X3ByaW1hcnlfb3Bjb2RlKCkgYmUgdXNlZCBpbnN0ZWFkPw0K
PiANCj4gSSBkaWRuJ3Qgd2FudCB0byBhZGQgYSBkZXBlbmRlbmN5IG9uIGluc3QuaC4gQnV0IEkg
Z3Vlc3MgSSBjYW4gdmVyeSB3ZWxsIA0KPiBtb3ZlIHRoaXMgb3V0IG9mIHRoZSBoZWFkZXIgaW50
byBzb21lIC5jIGZpbGUuIEkgd2lsbCBzZWUgaWYgSSBjYW4gbWFrZSANCj4gdGhhdCB3b3JrLg0K
DQpNYXliZSB1c2UgZ2V0X29wKCkgZnJvbSBhc20vZGlzYXNzZW1ibGUuaCA/DQoNCj4gDQo+Pj4+
ICvCoMKgwqAgY2FzZSAzMToNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHN3aXRjaCAoKGluc3QgPj4g
MSkgJiAweDNmZikgew0KDQpGb3IgdGhhdCBvbmUgeW91IGhhdmUgZ2V0X3hvcCgpIGluIGFzbS9k
aXNhc3NlbWJsZS5oDQoNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgNDrCoMKgwqDCoMKgwqDC
oCAvKiB0dyAqLw0KDQpPUF8zMV9YT1BfVFJBUA0KDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiBmYWxzZTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgNjg6wqDCoMKgIC8q
IHRkICovDQoNCk9QXzMxX1hPUF9UUkFQXzY0DQoNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIGZhbHNlOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgY2FzZSAxNDY6wqDCoMKgIC8q
IG10bXNyICovDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsNCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGNhc2UgMTc4OsKgwqDCoCAvKiBtdG1zcmQgKi8NCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAg
fQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+Pj4+ICvCoMKgwqAgfQ0KPj4+PiArwqDC
oMKgIHJldHVybiB0cnVlOw0KPj4+PiArfQ0KPj4+PiArDQo+Pj4NCj4+PiBDYW4ndCBPUF8qIGRl
ZmluaXRpb25zIGZyb20gcHBjLW9wY29kZS5oIGJlIHVzZWQgZm9yIGFsbCBvZiB0aGVzZSANCj4+
PiBzd2l0Y2gtY2FzZSBzdGF0ZW1lbnRzPw0KPj4NCj4+IFllcyBwbGVhc2UuIEFuZCBhZGQgYW55
IHRoYXQgYXJlIG1pc3NpbmcuDQo+IA0KPiBXZSBvbmx5IGhhdmUgT1BfMzEgZnJvbSB0aGUgYWJv
dmUgbGlzdCBub3cuIEknbGwgYWRkIHRoZSByZXN0Lg0KDQpJc24ndCB0aGVyZSBhbHNvIE9QX1RS
QVAgYW5kIE9QX1RSQVBfNjQgPw0KDQpDaHJpc3RvcGhl
