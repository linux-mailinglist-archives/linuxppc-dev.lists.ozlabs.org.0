Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8423A5A933B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 11:33:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJG7z4f7lz30L6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:33:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=stoiVcDG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.74; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=stoiVcDG;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90074.outbound.protection.outlook.com [40.107.9.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJG784Gbzz2xHd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 19:33:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4gU/46XmYKFGFSmigsHE+NjDi+VLOfl2YmWeSa68dFNn/ZuVO1TaxtOTl8M//YG1WFKTcoEyLWpTAxcHtrWxQxdrrbctDEGs9gs+38Zqg5OQbaCY+rVFfLC8BVoujmOdGV2HtG6bgw20Mj2+wijMacjWQsPpWcs95aTCCIiK9IOiulOrt/uId5qFjB6VdJxIjMVfh0th27v2RwJuRybguWHeOotKqRtcBbzhBcws7x1kANbj55im5Tt1AVc8upcRlERmwFgMO4flIVTNQzJpnKvxVfYAYZ0d5oLK2rijuxw6FaVd1mRwdrTPB4946hPCzkdzQ6ywCdsrTlArWl7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWvaiqMomtU9SS8C7Uw4gPlKa8ftrYQQ4nF6J/OItMo=;
 b=J3GvDQfCjls7AVdMAoXBucYy3+yfrM8Z3M4sq+yNI/dXNnneDVo8LJ4DdW96mcL5kKMfigsKUydLRGxtHiJ0F/FB5kJ0kVIEmo5USPOlaadAQAZ5pfizkQk3BV41R2av2bRrGI+pjyyT1odbNS2U+VMDxn02maK25uUPqvvhjjtiTNGkgprCZBB+V2A/03Y8Rq+HKWS/c9XrEApmtR7z5K20l15Q7QlOsFeQR/Yl0gDwLEzGLTzoavT9qgPEJSXCncTeCy2jGobttcoQ3Tv3zK5KYkNStMhYq/dY2MxEy9bj1apLwimFOXI9JWzpZL1ZmqxKvquiLx3KIzfsbrwjgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWvaiqMomtU9SS8C7Uw4gPlKa8ftrYQQ4nF6J/OItMo=;
 b=stoiVcDGax9F769NaYwOQZRX13RSnbvLt38wr8SIYbX3tbuKPVUGCjOkWJ9ZVN+KZUEHX7YFyfQd++Sk5draOyvpnaDZ0HlHQN2PDz7fFeP9UKTER1lRKYo3U95OhVOojzmab6YfTCF5WLZbfXuT7+OvjpvlbIA2O+RmUq1LKQzpzzsTbZch3yP4hclBGdgPWYGZY3mQNGZC8kzqtaoniDnaJh568mEvWCJRvCa4Ds8K8ivkAVZuBliUg2eTmkFxZExT2Eud9sWCK+3ngzunqKPs1DiRVuRLGkpOfh1n14vFMBZEaZE9HCZwZfzSilv+nVJ5JltXMUGb6dMTqn0zag==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1728.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 09:32:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 09:32:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 15/16] objtool/powerpc: Enable objtool to be built on
 ppc
Thread-Topic: [PATCH v2 15/16] objtool/powerpc: Enable objtool to be built on
 ppc
Thread-Index: AQHYu2u8Ps+epogb9EGxz6u3b2lu0K3KVLuA
Date: Thu, 1 Sep 2022 09:32:46 +0000
Message-ID: <2fb92e17-2ad5-9732-560c-a7321e6a2528@csgroup.eu>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-16-sv@linux.ibm.com>
In-Reply-To: <20220829055223.24767-16-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a929bbac-b69d-42da-839d-08da8bfcedef
x-ms-traffictypediagnostic: PR1P264MB1728:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  B4wRVdDjkI/64kRsQDlaU2Johdfu4Zi33BGx/Z5+8z25vD8AbSrpRuXPel9pzBBGwLNRHT8gqltE8o6nFyLSxJuodvm1MopmuLKCuCnKj1MOJnP4icY0CWUxa3mK/Kz6b4KJZ7OSSdiTUJVgofurYBTy8IHo9ezWDYpl3CMlcwRhDg22nwZKGaCvtEPilxvYgUma05Asi5RQhK0UhVoYINTFG9e0MxvE5AMgqvUUTPw5cc8771lpKBnZS46MKsfsw550yHEiQ/k2L8G2aHb9xMXgbuK4zJ4IaI4RlRbbxO5mBNMYeIuHLBSnKYoT3zjaNToMxIeaENP78hxh6C45Ck103Q6sb3ckV81mrDwLVF726qpQhmNiipWdpYECKCPiOq3wFPvzkltCzldvGojv5VthsEbqpLnBWwinvjO9pGXM5WxF47QYmsVXflXgZIzGfIUnA2FOo8uA59m88Bhra0BAsS85zIwa2PbSS12lWqMLM0945Gelt+ItSMhZgHMRCC0BPyb58Bnphw/lYyhyc/YxD+yIEdK3igAL2NHunS6DnAo16TVAIohBMfb7tCpcWXKOY6i1D+TUf4sY9yzsIm0a1tcRtuye0LQaxNM/t2z8hBJuy8CE1uXANklf0kcXqXjhumpdK9yoi4rBjAerGuV9HXN/xU0KD5F3eFAhyfZWMcAkokc+FjZsZJtXhs8uw+m/9D4SvvwISKAYno25Mu7IKivLwSgt2N8ABXSsdHuHDLAl14cYJPpPYYHNf2/m3g9MplXbcksUoI5QzLJYxaM8MtwLuOJMGBj+wOWyrQH3NmB31SmgKeikNrz5uUf/Out1J4AB4tN+cTMdjSKm/A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39850400004)(376002)(366004)(396003)(6506007)(86362001)(6512007)(31696002)(6486002)(71200400001)(26005)(122000001)(38100700002)(478600001)(41300700001)(2616005)(38070700005)(66574015)(83380400001)(186003)(36756003)(5660300002)(44832011)(110136005)(8676002)(7416002)(54906003)(4326008)(91956017)(66446008)(66946007)(8936002)(66476007)(66556008)(64756008)(316002)(2906002)(76116006)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aXM0N0FjTHFhOTZWUVE0MmhFN2V4dFZWQ2lnVTV2d2JpWXJhK1l6M0JscE5z?=
 =?utf-8?B?eTZWWGp3bURlNEwzaWREVlFDNEtuSDJuL2tWSyt4WElJUkhQMWh1Sm9RYUNL?=
 =?utf-8?B?bWNwZVhmanV2dndGQkZnNjZBMTFvN09xUzZ2Wm1weElpZCtUL2d6Qkd1VThk?=
 =?utf-8?B?RWdQNGVtdnhHa01Sa0h0Z1NqM2ZKQi9MOGRjd1VYcWhjd215ZllmS0hjVTlB?=
 =?utf-8?B?SllWZDh4VXBpTnlkQUxaTm41QUJwUmhkcXNhbHc5Z2ZheWNuRm1CWWZNazJE?=
 =?utf-8?B?c2lHOG5GM0g5RUYyWmc3bjdBV25IT3FLSU5WeDQ1cGVXSXl5ZncyR2xRam9X?=
 =?utf-8?B?ZjEwK0RMbjhTeUlaMmpQdWZTbVZ0WHRscldSMlNFMFBzc0VMUm5GMThKK3d5?=
 =?utf-8?B?TVc4bTdybFZ2VDBpRUU5SEF0ZGpudXFjL0FxdU5IalB5cWtUa1VPS2xGUjNB?=
 =?utf-8?B?K1IvY0NWNnlROWplWTBjY3RWYjJsWmJ2RC9XSUQ5a05QZk5wc29hYW1YY1R6?=
 =?utf-8?B?cWJEZFJLbzJKMEhOZzZOUVhtL1pHSjRFU0lxMWZjOFpUYm43dHl5NHl5SFNi?=
 =?utf-8?B?dEljemF2MU4rY1kxeDVKaHBSQjJqdWg1bHNUUlI3ZlRKK3Qxek9LWWlEcndU?=
 =?utf-8?B?NE5MQzROLzl4RkpaTTFLRmVxSE9MT1dKYVg1OW1HNExKbHFValVXcm45WFo4?=
 =?utf-8?B?VW12eUdXNHRGWENxOXBPb0lXT1ZhbVFaTlc1M1dJYVlDL0JqMEVaSDVKUVpn?=
 =?utf-8?B?WTd3QldDUWs2ZW1DS1V3b3Zkek9RMkdFUXQvMlNQa2FyOGlVVnpVb3krS2NR?=
 =?utf-8?B?MnhOQUFRNzJ2cDBTazFRNHIzQVdySzdHVFBMY0NPclh3Y09OSWJxK3BUQmxZ?=
 =?utf-8?B?bXFlblZvbzhhekNPMnMyc1huYW1rZFBXTE9ZTVlLWUJTSmh2RHd5SWZhMkZG?=
 =?utf-8?B?QzJUN3ZkMXRYVUkwOFAwWnBwU3FUN0hNY29VOFRWdjBoSnR6ZjdTSjhtYkww?=
 =?utf-8?B?SXVoSFBwUU83OEFjNExkcVpuZm1vV2RPNjQxSitWdXU0VUpXQzhSNHFXUFBi?=
 =?utf-8?B?U0VsZm44MlBQeGMrR3BYbDV3ZUZ4TFpWV1dJaHhXY01Ucng5SlZqMmRyVWVS?=
 =?utf-8?B?ZzR5NzNvdGJwNHRzbXJXQ3REWjBpalBUN3U0SWljRnREbGQ1a0tpQ3I5WWVS?=
 =?utf-8?B?Y2xnTzdMSmZKeGpqZVFHOGRyNlpvS2NCeWNPU2h2dXZnQ1ZkUndDMU1mMVFa?=
 =?utf-8?B?czlldFlWcU9rbzY0RXAzbmFYaHArdllUU3J2NGtVYkVmU25nYWZoaHJTUG5Q?=
 =?utf-8?B?QlhaSExTdzRZSU9KenE5Rm94MEY2a3NsZEN2SHF5MndyZDJjeTVwMUFwQTIw?=
 =?utf-8?B?RXZRTjhnbm95WCtIeVhycjhjc0MwTThRVjJoU3VtcVNUWW1MM3lIWW9zWVRz?=
 =?utf-8?B?TGEyT1kwUktXWGRyRWhUZjIrUCtvM2pDVERmSE9kci9WR2FwdzIwTFdvZ3g3?=
 =?utf-8?B?QUs0bENzMVlXY1VwUGk4YW1Pbmt3czRJOTI1THZ1c3ViSjdyK3l4cWtyaE9W?=
 =?utf-8?B?WDkxc2hmL0FXUFByN0pqOUExS09mSzR3WENmTlZwamZNQVFWZTVTaWcwZHgy?=
 =?utf-8?B?QXJpZFJCY0FHbnpxUW4yc0UxaWZEQ2IzZzhXVzRIeEFWRnpQcnpONWlKMDRq?=
 =?utf-8?B?TDRpZVR4VnBsZFlrUXJERk96N0RoSlh2dEdubCs0UFhHNGhodm85UGZoU2o2?=
 =?utf-8?B?UWl1cy9GTFdPMjJXbHZ0WEVHNUxQaG9zT0xGUFU0QzhpNVpIeDAxUHZ0aVpx?=
 =?utf-8?B?UkY3MmhKRFpUa0taL296SXp3eGovK2xQNStFeWxmY2RVZzU0TFpkRUU4SFJr?=
 =?utf-8?B?Y2g0c1E3WkhDQ1N2V0ZsYjZ3OTM0UlpGQXA4dm1uTjhDNngwR3BVbDNBeXBa?=
 =?utf-8?B?TjZHTURJRDRZTHlFUnVBdjVaOWoxSXhCWWhYemRYVkd1VGZIRzRqQkJESVEx?=
 =?utf-8?B?bjg3RU5LbTNIdVRkNlpDaUpSR3lOTlZpTnBTcmM4cTlaQnBNN1d1U284eTJj?=
 =?utf-8?B?K3BZdnBCaEdFMGVtYWl5MGlESzNoWUprOE5iOHZDbWNOVlR3U21USFBkR3pi?=
 =?utf-8?B?cyt0MEQvRzlBY1JaNUhENUkwU3Q1NEdjTDFINXZoSktOVGtEa0ZHL0hBT2ZJ?=
 =?utf-8?Q?/0Zz4JddlM0OlYuYt46EY94=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2A26A3A8D527E43A6452128EF6F343F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a929bbac-b69d-42da-839d-08da8bfcedef
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 09:32:46.5950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MNCBeMX93Ay0Hee85Rz27giKw4H6WPJksLhGTl1vB8VplE9U4nG+SxXK2qnJ3qudOcNYKbOCjJfYfI+Kx5Gj9GhAHCUzl/9MmHXdzhPNZws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1728
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA4LzIwMjIgw6AgMDc6NTIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBUaGlzIHBhdGNoIGFkZHMgW3N0dWJdIGltcGxlbWVudGF0aW9ucyBmb3IgcmVxdWlyZWQN
Cj4gZnVuY3Rpb25zLCBpbm9yZGVyIHRvIGVuYWJsZSBvYmp0b29sIGJ1aWxkIG9uIHBvd2VycGMu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTYXRodmlrYSBWYXNpcmVkZHkgPHN2QGxpbnV4LmlibS5j
b20+DQo+IFtDaHJpc3RvcGhlIExlcm95OiBwb3dlcnBjOiBBZGQgbWlzc2luZyBhc20vYXNtLmgg
Zm9yIG9ianRvb2xdDQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9hc20uaCAgICAgICAgICAgICAgICB8ICA3ICsrDQo+ICAgdG9vbHMvb2JqdG9vbC9hcmNoL3Bv
d2VycGMvQnVpbGQgICAgICAgICAgICAgIHwgIDIgKw0KPiAgIHRvb2xzL29ianRvb2wvYXJjaC9w
b3dlcnBjL2RlY29kZS5jICAgICAgICAgICB8IDc0ICsrKysrKysrKysrKysrKysrKysNCj4gICAu
Li4vYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXJjaC9jZmlfcmVncy5oICAgICAgfCAxMSArKysNCj4g
ICB0b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FyY2gvZWxmLmggfCAgOCArKw0K
PiAgIC4uLi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hcmNoL3NwZWNpYWwuaCAgICAgICB8IDIxICsr
KysrKw0KPiAgIHRvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL3NwZWNpYWwuYyAgICAgICAgICB8
IDE5ICsrKysrDQo+ICAgOCBmaWxlcyBjaGFuZ2VkLCAxNDMgaW5zZXJ0aW9ucygrKQ0KPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYXNtLmgNCj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvQnVpbGQNCj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvZGVjb2RlLmMNCj4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hcmNo
L2NmaV9yZWdzLmgNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvb2JqdG9vbC9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hcmNoL2VsZi5oDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL29i
anRvb2wvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXJjaC9zcGVjaWFsLmgNCj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvc3BlY2lhbC5jDQo+IA0KDQoNCj4g
K2ludCBhcmNoX2RlY29kZV9pbnN0cnVjdGlvbihzdHJ1Y3Qgb2JqdG9vbF9maWxlICpmaWxlLCBj
b25zdCBzdHJ1Y3Qgc2VjdGlvbiAqc2VjLA0KPiArCQkJICAgIHVuc2lnbmVkIGxvbmcgb2Zmc2V0
LCB1bnNpZ25lZCBpbnQgbWF4bGVuLA0KPiArCQkJICAgIHVuc2lnbmVkIGludCAqbGVuLCBlbnVt
IGluc25fdHlwZSAqdHlwZSwNCj4gKwkJCSAgICB1bnNpZ25lZCBsb25nICppbW1lZGlhdGUsDQo+
ICsJCQkgICAgc3RydWN0IGxpc3RfaGVhZCAqb3BzX2xpc3QpDQo+ICt7DQo+ICsJdTMyIGluc247
DQo+ICsNCj4gKwkqaW1tZWRpYXRlID0gMDsNCj4gKwlpbnNuID0gYnN3YXBfaWZfbmVlZGVkKGZp
bGUtPmVsZiwgKih1MzIgKikoc2VjLT5kYXRhLT5kX2J1ZiArIG9mZnNldCkpOw0KPiArCSpsZW4g
PSA0Ow0KDQpTaG91bGQgYmUgKmxlbiA9IDggd2hlbiBpbnNuID4+IDI2ID09IDEuDQoNCkkgd2ls
bCBzZW5kIHlvdSBzb21ldGhpbmcgbGF0ZXIgb24uDQoNCj4gKwkqdHlwZSA9IElOU05fT1RIRVI7
DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiArdW5zaWduZWQgbG9uZyBhcmNoX2p1
bXBfZGVzdGluYXRpb24oc3RydWN0IGluc3RydWN0aW9uICppbnNuKQ0KPiArew0KPiArCXJldHVy
biBpbnNuLT5vZmZzZXQgKyAgaW5zbi0+aW1tZWRpYXRlOw0KDQpUd28gc3BhY2VzIGFmdGVyIHRo
ZSArDQpTaG91bGQgYmUgb25seSBvbmUuDQoNCj4gK30NCj4gKw0KPiArdm9pZCBhcmNoX2luaXRp
YWxfZnVuY19jZmlfc3RhdGUoc3RydWN0IGNmaV9pbml0X3N0YXRlICpzdGF0ZSkNCj4gK3sNCj4g
KwlpbnQgaTsNCj4gKw0KPiArCWZvciAoaSA9IDA7IGkgPCBDRklfTlVNX1JFR1M7IGkrKykgew0K
PiArCQlzdGF0ZS0+cmVnc1tpXS5iYXNlID0gQ0ZJX1VOREVGSU5FRDsNCj4gKwkJc3RhdGUtPnJl
Z3NbaV0ub2Zmc2V0ID0gMDsNCj4gKwl9DQo+ICsNCj4gKwkvKiBpbml0aWFsIENGQSAoY2FsbCBm
cmFtZSBhZGRyZXNzKSAqLw0KPiArCXN0YXRlLT5jZmEuYmFzZSA9IENGSV9TUDsNCj4gKwlzdGF0
ZS0+Y2ZhLm9mZnNldCA9IDA7DQo+ICsNCj4gKwkvKiBpbml0aWFsIExSIChyZXR1cm4gYWRkcmVz
cykgKi8NCj4gKwlzdGF0ZS0+cmVnc1tDRklfUkFdLmJhc2UgPSBDRklfQ0ZBOw0KPiArCXN0YXRl
LT5yZWdzW0NGSV9SQV0ub2Zmc2V0ID0gMDsNCj4gK30=
