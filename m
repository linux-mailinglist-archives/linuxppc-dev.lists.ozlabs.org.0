Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8A49ABFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 06:53:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjbdJ4xNMz3cPm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 16:53:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62f;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jjbcn5qwLz2xYQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 16:53:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCIWLLDTbjuo0Z7enPHZtGU1ikikg1LE60vy8dmaUduvRc8r0ulmfDQHClPArTVFzuTJGxURQsv0UUWBEq4kQCDZ+YKaXORktyZiQ/6Qm9Bejoy4csVXxZTIrp2OhwagAjHey7TY8bp0VKHHLTmXQH6fS0c6mft/agZ7zwdv+e/ORMIMrSf5yZ6pjbq65g6vRxPNrZRB3Bqd4VC/wCdNK7Nl+q3RC6V0GxOhLfBgc2itcpJzQgb+KpVvkGPCJuqADAPZApGynXocjMo4AlUatVqCG3D9vyslm59eofKNDls4XTAO5xU7+N7YtR9hkGEHtdkWuujmloKQ7zIe1Ok7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCNJzXmmNBpU1LyO1V/B5RXhuXfJ7nxVpQITMby7b30=;
 b=YyY8b9QKIo3IJg3IhiG2hnxdJ/I4X02eiFFHgd9JY1mz91pvFI357KcB/cChjOLlb++lWquKcMVpDSdaHiCBc3jDs2oTeFYa8ND4pncFwISLkdygij4srXPGapKNz8HXRqqSzdan/cW5H+Bs6PtPzHnsN3cJ4dUK2jiS81odfcJEGOilpXkPtJ056GqMGUFdXUz74qc1mbM0D0mKCHKRuQmfJZWojU4S5MUAHG1ILNv/KMLmXuTGMtuoO/L6OGyHPuRD+AgQ99F3VpK296qAU+49TR7KthWX6CcIZ9+cS1hODaDJAkmbjXAFZblzk9xQ1eFzvRpYtR2X48rR2tSxnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2834.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 25 Jan
 2022 05:53:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 05:53:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 0/2] powerpc: Disable syscall emulation and stepping
Thread-Topic: [PATCH 0/2] powerpc: Disable syscall emulation and stepping
Thread-Index: AQHYEOeB4z6fursSD0u9V83cevLE86xxuICAgAFWH4CAAC84gA==
Date: Tue, 25 Jan 2022 05:53:08 +0000
Message-ID: <d352c741-baaf-3be3-ef31-81ce6250876c@csgroup.eu>
References: <20220124055741.3686496-1-npiggin@gmail.com>
 <d3ab1142-5f62-6cbc-067c-6a34f4f28ef2@csgroup.eu>
 <1643079479.32j7nee5j0.astroid@bobo.none>
In-Reply-To: <1643079479.32j7nee5j0.astroid@bobo.none>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a974c8ec-1966-4813-3281-08d9dfc6f6bd
x-ms-traffictypediagnostic: MR1P264MB2834:EE_
x-microsoft-antispam-prvs: <MR1P264MB2834FA6FEFF5AFFD3859A43FED5F9@MR1P264MB2834.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QEUDkHeREaRKaimZK5Iflq+0lTyIi4tV6zycFprIvURWOjbLAQfi5DvnV2l2aC5oxN/Q4GbKLv2IGKSHndOEkcHBkTgLn8GBmQPa5EHkvK0pVk4KM8KIxvJoPsUcKJ+z8Um7r16CZ8LG6sfVhhT33bhoRWPCeTs0wuEUobZyGEpNCLMUPUOoQGfiUQnE+GIQ0cYNmZqWpPVzScLCF8mrSB+Yx6HH8SDil3DWCNTdF9cC7ruwcdRqkhphQTQiK1GWSn/kuVUyth1hOJdv26+WZYg8kl2P+NgbiQcxlcPnA0zfP/GZWuLTPsiODa/cbNzlQRqcH5Vadtl+ZTWzzRkRm3mL+BVT8YOBrrlHmIK0ddZ6/m0K3GCi2tv5mAeMfaH8sBCj1wY9ijOUnVYBC6AxAHJCjWbQwsLP7vCGUOD/ddAAz//9lzs40evi9dMudXiQUVjRVUNLSYEw9wSTiRprT0XpEBo+xe/HF4xkNVtUru9y1OcI2eTQuh8V2IKWigOAQoRu+6xjTel2Vhue1oXtqeM2PqUlN/77ZZgDugMZvufE6rwL1Ltf/kyS5LkPtdWzxNCBE7SlrE8FxCpCEPRjP5DZ44GxAezyaUU1R1uzYN5Aw2WnSOH6pvF9cRT3a0pdvlRherGkiwcqdExQKJa90ffId9aF+KgFpNDlq/xgHqTUAQEFTbTr6pKXfNiwd5C7V5Ol9A9vz5FGOQ+M1gQCuWwVAU27FmaTEd0JQJJQLU3BDe2wDJR29zL55YVB5L+7pAxA16QhjT5+SwoZOD/ESHxr0cPSVTZYl6uKkYJt9ynQ69mhRZYI8YpcVIYNLLBoFKzYS8ZtkZe+mkwTd9RptF1czyO9BJBon7DKjJSxiq4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(91956017)(31686004)(4326008)(64756008)(66574015)(2906002)(6486002)(44832011)(508600001)(2616005)(8936002)(966005)(66556008)(83380400001)(66446008)(66476007)(66946007)(186003)(71200400001)(110136005)(36756003)(6506007)(38100700002)(122000001)(26005)(6512007)(31696002)(316002)(5660300002)(8676002)(86362001)(38070700005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUFtVjN3dE9JWE5DZ2g0dGZhbTE4TCszd2xDcHA1YXRiMkx5R2xqWmtzR0Yr?=
 =?utf-8?B?WEJEZGdDUkt4UXh6VERvQ1luRGdqcHBjeVVuZ1VhMi95ZHlpZGF1RjRBdkpa?=
 =?utf-8?B?bXFEVUcwb3RjazlkVzNQQW93VmwvVTR1SkU1Rk5sdXY4Mk9YSDdzTHJoQnJt?=
 =?utf-8?B?VXhXbm8xYVRXUVlkVDZzLzlpdm1WeXJRcm9BdUZ6b0pWQ1BaWWd1WGxVcG10?=
 =?utf-8?B?MzFEMVdGRERTQm9pa3hVUzU2WGp6c0s5aTdUU2RTaGk3Y0V3TlptZDUybys5?=
 =?utf-8?B?YkczQUdvVUp0ZGVOUGtybHhjKzVCYXRoRDNZSzFTUGdDNUFUd3BwNnhYT2pZ?=
 =?utf-8?B?TTZPTlpsNlpyVGY2Tk1iVFZ6dVVaL0JJaEs1b3ZsSTNSSzdUNVpqSjRiU3BO?=
 =?utf-8?B?RTZYbmRUd0w1ZHdvM0RyUVVtbVRFWnRoR2FxMjkvVnVzbFNoU25PdkcxemZQ?=
 =?utf-8?B?a0M0VmJwMTM4eG8zamRGYjNOQWYvTHZ6bEJWbVdhWjc4SUtuZlYwMTBpN3JI?=
 =?utf-8?B?U09sMGM3YTFlK2psTnlGQlNVSFlhMGhKdTFJQWlITngydWRhVHRNSVg3bkNB?=
 =?utf-8?B?VW9BQUVDQ2ZtenpNVUJUSGNmcms1Y21TOTFnZHBSbURpNnpBUHlYWTNpbW4x?=
 =?utf-8?B?QWxJU05yZlEycDNrRFpnMXhQS3dNak9VQ3JxZUF6bUxJVnNDM0Q0bUdUS2cr?=
 =?utf-8?B?enQ4ME1FdmY2SUtuWlpsbjlVUERndGVTcTduN3JDMlpVMTVHNWs0aWZIY1Uz?=
 =?utf-8?B?UVFydmc0aWNNTmxranlESHM0bjJLeStDWU45LzllWFZUTm9icDF0ZHVsNy9L?=
 =?utf-8?B?NUlpRVVoME5rY0EyZytsUU9YTmRZZEhjaTZYZGhCdGlucDdPL2QzWk1yZit0?=
 =?utf-8?B?NnplSUVwNHVQUjBaQWhrUUFlb3ZvVTkrNVFVcFFub2FrK3V0RjRVcThzRzF2?=
 =?utf-8?B?eVdEa1BoWXpZVVp4RjZZRFlnRzhnRUgwWXprMnluRjgzWWxvbDJEYWxiLzk0?=
 =?utf-8?B?MkVVbXBNbjJwZnBHTUxjQkY3S1dVdUN2bzZHa0l6Y2ZnYVVUU09lZEk0Y3lq?=
 =?utf-8?B?VVluR2ZkVkFoRDJXME91NjJUNDVKTHpoT0NuOW1LQUFFWjBZaG44SDRRaE5o?=
 =?utf-8?B?d1NPR0x6a0RzOEFmZFczYjBvektkZmkxZTNQV1lVbm1uQjBLWlRlVDg2TzJE?=
 =?utf-8?B?R0RYY3pzdnd1UUJva1lBV3ZPTkR3dlRmZ3o3YmpjVVlXNnZxK1dPY0RqOWVB?=
 =?utf-8?B?N2FBd2NrdU9HR2hIaFpQRW5rS1hVRlI1YmNtUzlFeTUvY1hHYVlLNU0vS0Z3?=
 =?utf-8?B?bjkvbzFvNHF6NUZhNlVVQ3IwK1dZNFZkQ2psZE43NUU0QXk3aXZUU1hJeTV5?=
 =?utf-8?B?NEh0Z1kvVnc3MnRPSmgxMGNkWDFWSXA5NWw0S1BaWklGNk5rUktNN1FhR05S?=
 =?utf-8?B?RG8rSkp1UWszVTJjajRQclM2blFSNk0wWE4vbGhjNzZzTi9hcEMyZkxUcGM3?=
 =?utf-8?B?cFl1eDcxbTFLb1M1T2hONHppRGx2VU80R3pkR05ERFhsdkRKNmRBd1lMRm9s?=
 =?utf-8?B?YVM4ZUpibkQxd1RubFYvOHFSSW10YVhibFVUMUVRQWJORjE5TnBGVGQ3T2E0?=
 =?utf-8?B?SmlOb3NUNXFSa25abkNwL1pjcERQK2ZCdE1VK1A0UldLMTZCMG9KZ0lRdGV1?=
 =?utf-8?B?TGZteVdCckFUWURzNUJUV2l1WkJ0aTI5ak9DdzZ5K3ArL1FjTlY4VXZJMXo0?=
 =?utf-8?B?eXBlODBzUVRCWE94bUF4N1Y5SG9rQ1BweHE3ZERQMkVtODBBTGpZN0JGVmVy?=
 =?utf-8?B?SDErVjNxS3hjdzB2b25URkVxSjhqSHRKejA3NHF2aDE3NExuWVJmODZHVGlp?=
 =?utf-8?B?NlExNWdHYnhGY2pnTCtsZTFjZjRJVzJ4WmliV0VCR1hZWHM5VkFBOHI0UjR4?=
 =?utf-8?B?d0xBMkVJTUFiZmN6aUZqc0E0STV4Uk9MTXo0R0hNendpaWxVL3IvNmcwL3JR?=
 =?utf-8?B?RFczZk5ncDYwZTUzWTErREN6UE9Ob2JuSmxnSEYzbkdkOW8vT3FhWVRTZnda?=
 =?utf-8?B?ZWFYQ1c5dzVxK0Z4OWJlNy9LSXpGd1F3L3BkSGdSNVFJaUhYZHJlVXhtZEZp?=
 =?utf-8?B?cmFsQkNBdmRna2k1UjZDeWRLc2tmWHV3RFc5NDRmWDVqbEpwbUpGc2pFT1lk?=
 =?utf-8?B?bmdadWxqdzExcVh0Y3h3eWl0UWhxMVVZN0wrcUljTEljVDFIbVNQZHQ1eCtY?=
 =?utf-8?Q?coVYP8FTYdY3AKVIvy6UpMUFyT1YiYvCvQccFfUpSA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA639261E3F78B4F90D37AEFBDB492F2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a974c8ec-1966-4813-3281-08d9dfc6f6bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2022 05:53:08.4811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jk/dZVBCCL48+CCLvVOHtCgVuiYRw2MkeOQeA4Cq22iYKgNKGUbvt1K1Dq99u8LOHzgzYG73XBNDHRbO2C/3rj/x5JmDAcf3RHBa4WDlVYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2834
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzAxLzIwMjIgw6AgMDQ6MDQsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiArTmF2ZWVuIChzb3JyeSBtaXNzZWQgY2MnaW5nIHlvdSBhdCBmaXJzdCkNCj4gDQo+IEV4Y2Vy
cHRzIGZyb20gQ2hyaXN0b3BoZSBMZXJveSdzIG1lc3NhZ2Ugb2YgSmFudWFyeSAyNCwgMjAyMiA0
OjM5IHBtOg0KPj4NCj4+DQo+PiBMZSAyNC8wMS8yMDIyIMOgIDA2OjU3LCBOaWNob2xhcyBQaWdn
aW4gYSDDqWNyaXTCoDoNCj4+PiBBcyBkaXNjdXNzZWQgcHJldmlvdXNseQ0KPj4+DQo+Pj4gaHR0
cHM6Ly9saXN0cy5vemxhYnMub3JnL3BpcGVybWFpbC9saW51eHBwYy1kZXYvMjAyMi1KYW51YXJ5
LzIzODk0Ni5odG1sDQo+Pj4NCj4+PiBJJ20gd29uZGVyaW5nIHdoZXRoZXIgUFBDMzIgc2hvdWxk
IGJlIHJldHVybmluZyAtMSBmb3Igc3lzY2FsbA0KPj4+IGluc3RydWN0aW9ucyB0b28gaGVyZT8g
VGhhdCBjb3VsZCBiZSBkb25lIGluIGFub3RoZXIgcGF0Y2ggYW55d2F5Lg0KPj4+DQo+Pg0KPj4g
VGhlICdQcm9ncmFtbWluZyBFbnZpcm9ubWVudHMgTWFudWFsIGZvciAzMi1CaXQgSW1wbGVtZW50
YXRpb25zIG9mIHRoZQ0KPj4gUG93ZXJQQ+KEoiBBcmNoaXRlY3R1cmUnIHNheXM6DQo+Pg0KPj4g
VGhlIGZvbGxvd2luZyBhcmUgbm90IHRyYWNlZDoNCj4+IOKAoiByZmkgaW5zdHJ1Y3Rpb24NCj4+
IOKAoiBzYyBhbmQgdHJhcCBpbnN0cnVjdGlvbnMgdGhhdCB0cmFwDQo+PiDigKIgT3RoZXIgaW5z
dHJ1Y3Rpb25zIHRoYXQgY2F1c2UgaW50ZXJydXB0cyAob3RoZXIgdGhhbiB0cmFjZSBpbnRlcnJ1
cHRzKQ0KPj4g4oCiIFRoZSBmaXJzdCBpbnN0cnVjdGlvbiBvZiBhbnkgaW50ZXJydXB0IGhhbmRs
ZXINCj4+IOKAoiBJbnN0cnVjdGlvbnMgdGhhdCBhcmUgZW11bGF0ZWQgYnkgc29mdHdhcmUNCj4+
DQo+Pg0KPj4gU28gSSB0aGluayBQUEMzMiBzaG91bGQgcmV0dXJuIC0xIGFzIHdlbGwuDQo+IA0K
PiBJIGFncmVlLg0KPiANCj4gV2hhdCBhYm91dCB0aGUgdHJhcCBpbnN0cnVjdGlvbnM/IGFuYWx5
c2VfaW5zdHIgcmV0dXJucyAwIGZvciB0aGVtDQo+IHdoaWNoIGZhbGxzIHRocm91Z2ggdG8gcmV0
dXJuIDAgZm9yIGVtdWxhdGVfc3RlcCwgc2hvdWxkIHRoZXkNCj4gcmV0dXJuIC0xIGFzIHdlbGwg
b3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8NCj4gDQoNCkZvciB0aGUgdHJhcHMgSSBkb24ndCBr
bm93LiBUaGUgbWFudWFsIHNheXMgInRyYXAgaW5zdHJ1Y3Rpb25zIHRoYXQgDQp0cmFwIiBhcmUg
bm90IHRyYWNlZC4gSXQgbWVhbnMgdGhhdCAidHJhcCBpbnN0cnVjdGlvbnMgdGhhdCBfZG9uJ3Rf
IA0KdHJhcCIgYXJlIHRyYWNlZC4gVGFraW5nIGludG8gYWNjb3VudCB0aGF0IHRyYXAgaW5zdHJ1
Y3Rpb25zIGRvbid0IHRyYXAgDQphdCBsZWFzdCA5OS45JSBvZiB0aGUgdGltZSwgbm90IHN1cmUg
aWYgcmV0dXJuaW5nIC0xIGlzIG5lZWRlZC4NCg0KQWxsdGhvdWdodCB0aGF0J2QgcHJvYmFibHkg
YmUgdGhlIHNhZmVzdC4NCg0KQnV0IHRoZW4gd2hhdCBoYXBwZW5zIHdpdGggb3RoZXIgaW5zdHJ1
Y3Rpb24gdGhhdCB3aWxsIHNwYXJzZWx5IGdlbmVyYXRlIA0KYW4gZXhjZXB0aW9uIGxpa2UgYSBE
U0kgb3Igc28gPyBJZiB3ZSBkbyBpdCBmb3IgdGhlIHRyYXBzIHRoZW4gd2Ugc2hvdWxkIA0KZG8g
aXQgZm9yIHRoaXMgYXMgd2VsbCwgYW5kIHRoZW4gaXQgYmVjb21lcyBhIG5vbiBlbmRpbmcgc3Rv
cnkuDQoNClNvIGF0IHRoZSBlbmQgaXQncyBwcm9iYWJseSBvayB3aXRoIHJldHVybiAwLCBib3Ro
IGZvciB0aGVtIGFuZCBmb3IgdHJhcHMuDQoNCkNocmlzdG9waGU=
