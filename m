Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A35414742D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 13:45:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCyl93xVWz30RK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 23:45:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::601;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCykh282Zz2ymt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 23:44:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lpxq4FPo4t0eb1tX7PaISxO5ARJW9g7yeteR1NtBl/NfbjGQ3MJ7o1s4yVLczZAZlt9I7WvasWF0MYEhGHWCafbYHNqcmFVMU76q8u+ZJvGz+SOg9GWaGtn4A0QM0EugC//SQcVHwTcJ7Zm0Z2CSt1krADSoib+HIOteAPYFzfimMVg8ytBBJhvnKuFdocvDsBrOTWUEJpllMbhaUCC7Z+lPQB3JE+HcoEw4/IBq+gcx+RVloZpHWL4dDHXxmwmoxtC3wTAIVKk0PzQ15K/GLQ12U9jO9uTb71Q3dFwt2yR43QQadZ9RQXjZ1z01BA90z9SGR2zWrx9wBiqT43nQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M66lch/hsDicYPYqrsumXoHZ/JYUaphgiV559WXZps8=;
 b=QERZ0yVvfpRne5n96Ohz08VyLVANEihMHg4zv1uOISvF5VTpmBbs/vYmEwaVXclDFGnqyWk67EIdGTiaX1pzSD5KccybbmmoCOlAuKK2fnTnsTAeOGOnn2MfjnFemd85ZhLFUp+pkTAmtqF0qRaPDFuPMbIFnl7KcBzLD0ALVRa+Cai9dV/bOiTBnNaBp7Ho8IsEtlnvEiMhPQOLmk9z29mOgSJqOAaemN0Sp/JoVNJZzyYWDw21Omw6fl16rMGi4us/d9fgVYsavoA07fVgvvbtRHMtdqfLZsqrV8S9bxIjS1nzFZiuZ+tqT+RFvxQ8xdN9NMQOCcVVJ+dJ9y1zvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2588.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 12:44:16 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 12:44:16 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Joe Lawrence <joe.lawrence@redhat.com>, Russell Currey
 <ruscur@russell.cc>, "live-patching@vger.kernel.org"
 <live-patching@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add()
 crashes
Thread-Topic: ppc64le STRICT_MODULE_RWX and livepatch apply_relocate_add()
 crashes
Thread-Index: AQHXzspJJmoyNvOd+UCDOrmbjdknXavuZfuAgABKxICAQZuGAIAAducAgAAeaoCAAA4TAIABQ1yA
Date: Tue, 14 Dec 2021 12:44:16 +0000
Message-ID: <27cee0a4-aa34-7a52-f98c-ab8c13aafb12@csgroup.eu>
References: <YX9UUBeudSUuJs01@redhat.com>
 <7ee0c84650617e6307b29674dd0a12c7258417cf.camel@russell.cc>
 <f8a96ac1-fda3-92da-cf27-0992a43a2f3f@redhat.com>
 <bed88ff4-e5d3-4b78-4f28-29fc635c2f97@csgroup.eu>
 <919a79b8-feff-b0a4-b96a-73f376b7f6dc@redhat.com>
 <61a5f29c-5123-5f0f-11aa-91cb0ac95a69@csgroup.eu>
 <8a68ffef-7e0d-b1ff-1102-2e6f2c999455@redhat.com>
In-Reply-To: <8a68ffef-7e0d-b1ff-1102-2e6f2c999455@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f7d4923-0769-47ee-4827-08d9beff7078
x-ms-traffictypediagnostic: MRZP264MB2588:EE_
x-microsoft-antispam-prvs: <MRZP264MB25887B9E01425E872BE3A38AED759@MRZP264MB2588.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9TE0IzZJFHtL1teQgcWRX7yclORPtP7Jw12/c/Enjhl/dj1w9is7A7SdWBFZ8qaRdlVfqdywZCsTkI7e+GoNo01URV3wntJNmA3o8sGbcf0z2KkzDohyI2VE+jEJat9c+Pv6dr5oTBoIMrc0LbUKbHVfGlTxLOOlFv7MHN+Ka+dzOdxgdHER0pClu+2ybrXjFcysxgpbgolymHqdkPmMjI1W/ZHNfb0UM/PQ0iBSyPpd1vAHhxJ+nLu9lE0PydXIkdFDXSDbL1ZmoNC81D5EMxT/NV9j/+VaAg9i4Ju/2L8YVC0eI2UjH6AgMwm1fQs29bprpiOjGqWMNU36E3jST2vp9ELTbbMt/2G5hm3yczNFYvqLrQxL3bhh6gJH1XGmHCPXuPzJK+LSnvDcd41Q0P3X2EzcLfAZ/9MFdS4PjhcdzNNUFDMwGTMW2uzjssX13yfi8VZdh0wYBD1nDt/9ylvdIRyMKB4GXdDKnaYEB3I55lRki/gfY4fxFynC/R3Oe9bCsdkB7umtuw9qbOeSB1rHwMspK76cZ1AUKLlq68YDO7jP+VwIjNVx+H6vRATZwn3XlqQ2AieiIZLIw74fKrOJp0yFPqVkCpQKlC8Wg55guV9kOUCx86UJVtVvfqYZCEMmsHOmRDzwckqlmTqkVprrXVu66+lxiiGxA653dood0uQPZsR+/w1OK990eJZ9lxe/UqQ4f73K+nuCSccN/ESj1fP8mCvDHDlYuJphnIqY4eXJUquU2yeGauuqhYLml7m7JL3gJvkDwxLhPqYImQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(91956017)(316002)(76116006)(53546011)(83380400001)(6506007)(110136005)(66476007)(66556008)(44832011)(66446008)(86362001)(64756008)(38070700005)(31696002)(66946007)(2616005)(54906003)(2906002)(26005)(8676002)(31686004)(186003)(122000001)(66574015)(38100700002)(4326008)(508600001)(8936002)(6512007)(6486002)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmtJdmoyWVRVQzRFOWltMDZCRG90VzRnckZDM3JrdzZvT01kS0prTm1DVzdQ?=
 =?utf-8?B?VmtkRFpGOGpMdkpJY1pnSWwvcC9ZT092VzcvTTl2RFRtaWJkcmsrdzIzc0ht?=
 =?utf-8?B?Q0JFT0RCQkdXOXB4NUwwMklqdHg2UWRKbCt3OVR2d3VHa2pvR1UrQ2phZHlG?=
 =?utf-8?B?Z1FrbzNvRWlHd0ZIRHdHd01WMHg2OUV4SlJUWWQzZ1gwWEtZdE5xUTd1Q2ZH?=
 =?utf-8?B?SmdZdllBVEh5Q09JNHp4dDlXU2xmUGlWWnRLaU5WVjJHYThmaW9ISGJzRHpU?=
 =?utf-8?B?di9YZXB1NkpuWWJhMnp3d21pTjg3eDJ3MS90cmJydDZmcVl4YWRKdVBvNkNp?=
 =?utf-8?B?WVA2TDkvclZtRW1jT05PYWxibmdjOHdmR3FiUGRoUjBwSHl4S2trejlzSzd2?=
 =?utf-8?B?NUFLRzNER04yczdEb0c5QUVKSkMxK0hnNVB3SE14UFlMZmxCUUZlckJMZ0Qw?=
 =?utf-8?B?UXVvQlQyT2MrWlI4QllpbGtzQVl3K0FFcmVKeWxKdElEd0hnRzR0OWRnN0o2?=
 =?utf-8?B?dFRZK00wRUc1V2NocmtQSnRlbUdZeWJ2cnBwZUpLQzNoRlNIb2FOVXZiU3pI?=
 =?utf-8?B?dUZ5T052Q0hmSWNIOEF5YVhOTURYdC95UHlYM2VPb09IVWZYUndjUUVEU3Rl?=
 =?utf-8?B?bU81Yzg0M25zRVZkb2VIcUlma1Ardk91Z1pnWDRWNGp2UWl0VHRjejFucE01?=
 =?utf-8?B?bFpIbklEREE0NkUyeWhIU2tFZTRWUGlKY0hqVmVwVzhKckdTVGcyNzVDSW5E?=
 =?utf-8?B?WE1HTlhHcDNZOThLMG1HVDZkcGM2NitjNVpkdkRxSndwRXhpYzcyK2FyOVBR?=
 =?utf-8?B?cHR2RU1OS0djY1ZNUExsMlp3QTVXcmlZelBYRWVuTjZwQVZCSFZOUFdZZnov?=
 =?utf-8?B?Um94L2RTUjJlNlVoK3VERG4vOTRJMkUvemNtbTFjNXArUjMxRitQYWZEL1J6?=
 =?utf-8?B?WjJPRzZLVXVFbzQ2bjlldXhRTmxvSGtZanN5U1ZuUjlkSWU2bHhGMDhFbnBx?=
 =?utf-8?B?enJKUEdaRkpzakFVaGFEVVEyNUlsakoxTjY4dHYxNEZQMVh2N21qSCtPanBh?=
 =?utf-8?B?UjA1Z2xmc05zb2MrbUNMOGxpQzVjQVM5VVg2Mm1rL2Q3WEl4UE9rRFNlMkcr?=
 =?utf-8?B?OUlBblBLWXh1cXBOVVpCOEhIUG1hemhDdmRGY05pS1FCSUM1Q1JBdUQydVk0?=
 =?utf-8?B?VHB1V0JmWWhUNk9BVWNpOU1kODVHWjJnUlpkUk1lenhSamhYRFZ3bEFLNjda?=
 =?utf-8?B?VWJneGZhTFBXWE9kbjRMdi9VU1diQjRaYWE5WE1IN0Jxb2wyQUpRSUk5S2Zo?=
 =?utf-8?B?WkZMZzVJREdpWjJVWVFzZFhPMnErWWplRm1BNmd6cFNncU1HVDVWM0RiaGlk?=
 =?utf-8?B?SlhEZ09iSG0zQ3h6enJCU3dQYXdvT2s4dmhOaW5GSXVzVE4yYjNSdzNWRDkr?=
 =?utf-8?B?L0NNZmtDMGR3RWxSNytyYnJuUXphY0RHaytiRmxWK20yN1doTysvNFFJTGpk?=
 =?utf-8?B?ellGb2tIYzhaZFJualFuVldPVzdMdDVTenlESlU1VllJeHY2L3ZDNGRrOWRw?=
 =?utf-8?B?ZTJBdi8vUm9NQ1drY0cwNTZMelV6WWJqS2Q1NEs4WmU2Z2pleWVKZzliSURx?=
 =?utf-8?B?ZFBBanNWOUx6WHE3SzMwa0FoeUhGeW5JdGZBUjY2ZVNEZjdGZzZweUNlTXky?=
 =?utf-8?B?dGt2OStzQUc4RktSZUZEV2plQ0JBSnErdWZQUWtkOXFtL1I5bkkrV2tJUng1?=
 =?utf-8?B?TlVuNjdhZGpheWk4bk83MlRnZ3FuUTlLY042a1RWSWJrMWo1WWF2NjVwRXps?=
 =?utf-8?B?cmV0SlNDR0Zxbk4yL0ZZOEhBeFh3Q293RmU4QUJwV29GRHhWbzlLVnovc291?=
 =?utf-8?B?UU5NN1c1VGd2N1NVNHNDaENBR0JVVktaUzlRZGlISkZ4L1lOVklhSjVQZzB1?=
 =?utf-8?B?TWdYTTNqTEE4d3pET3o5Wis3TURiVk1NMCttOXpGL1JrR3hpMTZrQ1ZDOHda?=
 =?utf-8?B?Zmd6d1lOaVd1Mms4VXFYWlRpc3FaZWk3aU9WL2dZRTJWVXRxYmtnQnNOVURl?=
 =?utf-8?B?c2Nsd1o3bW1ONFI4SFAvZnkrdXFBK0h4SUtwU25vU25JeW9jeVRmTVFTWkN2?=
 =?utf-8?B?bmFIS2tRdUxINk1PZTQwa0dHeTJhTGhxWHFYYTVLK09UUDVoRGp4Wm8zbkpj?=
 =?utf-8?B?ejZHcmhIWlJKMm14cXJQeFVzOTAvMzVKNHdwV0M3ZE5GeGdiYkd5OFQ0YTRv?=
 =?utf-8?Q?CYwRbd/K2zAgwkXYXT4XOQVySC7V5vtJahXteItDYI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B120842FA0D6345BA91791571DB92A2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7d4923-0769-47ee-4827-08d9beff7078
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 12:44:16.1857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NLkfl0ldYyyv2+ZpO71dUelpcRLZU69c8m+jgJlhPPnKizVGZKp1Xg7XfAvCeQFfD3d/WiEEam3nWWQWydUisZKB8igPdybxb2p3wNkKTgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2588
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
Cc: Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 Jessica Yu <jeyu@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzEyLzIwMjEgw6AgMTg6MjYsIEpvZSBMYXdyZW5jZSBhIMOpY3JpdMKgOg0KPiBP
biAxMi8xMy8yMSAxMTozNiBBTSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+DQo+Pg0KPj4g
TGUgMTMvMTIvMjAyMSDDoCAxNTo0NywgSm9lIExhd3JlbmNlIGEgw6ljcml0wqA6DQo+Pj4gT24g
MTIvMTMvMjEgMjo0MiBBTSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+Pj4NCj4+Pj4gSGVs
bG8gSm9lLA0KPj4+Pg0KPj4+PiBJJ20gaW1wbGVtZW50aW5nIExJVkVQQVRDSCBvbiBQUEMzMiBh
bmQgSSB3YW50ZWQgdG8gdGVzdCB3aXRoDQo+Pj4+IFNUUklDVF9NT0RVTEVfUldYIGVuYWJsZWQg
c28gSSB0b29rIHlvdXIgYnJhbmNoIGFzIHN1Z2dlc3RlZCwgYnV0IEknbQ0KPj4+PiBnZXR0aW5n
IHRoZSBmb2xsb3dpbmcgZXJyb3JzIG9uIGJ1aWxkLiBXaGF0IHNoYWxsIEkgZG8gPw0KPj4+Pg0K
Pj4+PiAgICAgIENBTEwgICAgc2NyaXB0cy9jaGVja3N5c2NhbGxzLnNoDQo+Pj4+ICAgICAgQ0FM
TCAgICBzY3JpcHRzL2F0b21pYy9jaGVjay1hdG9taWNzLnNoDQo+Pj4+ICAgICAgQ0hLICAgICBp
bmNsdWRlL2dlbmVyYXRlZC9jb21waWxlLmgNCj4+Pj4gICAgICBLTFAgICAgIGxpYi9saXZlcGF0
Y2gvdGVzdF9rbHBfY29udmVydDEua28NCj4+Pj4ga2xwLWNvbnZlcnQ6IHNlY3Rpb24gLnJlbGEu
a2xwLm1vZHVsZV9yZWxvY3MudGVzdF9rbHBfY29udmVydF9tb2QgbGVuZ3RoDQo+Pj4+IGJleW9u
ZCBucl9lbnRyaWVzDQo+Pj4+DQo+Pj4+IGtscC1jb252ZXJ0OiBVbmFibGUgdG8gbG9hZCB1c2Vy
LXByb3ZpZGVkIHN5bXBvcw0KPj4+PiBtYWtlWzJdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUubW9k
ZmluYWw6Nzk6DQo+Pj4+IGxpYi9saXZlcGF0Y2gvdGVzdF9rbHBfY29udmVydDEua29dIEVycm9y
IDI1NQ0KPj4+PiAgICAgIEtMUCAgICAgbGliL2xpdmVwYXRjaC90ZXN0X2tscF9jb252ZXJ0Mi5r
bw0KPj4+PiBrbHAtY29udmVydDogc2VjdGlvbiAucmVsYS5rbHAubW9kdWxlX3JlbG9jcy50ZXN0
X2tscF9jb252ZXJ0X21vZCBsZW5ndGgNCj4+Pj4gYmV5b25kIG5yX2VudHJpZXMNCj4+Pj4NCj4+
Pj4ga2xwLWNvbnZlcnQ6IFVuYWJsZSB0byBsb2FkIHVzZXItcHJvdmlkZWQgc3ltcG9zDQo+Pj4+
IG1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5tb2RmaW5hbDo3OToNCj4+Pj4gbGliL2xp
dmVwYXRjaC90ZXN0X2tscF9jb252ZXJ0Mi5rb10gRXJyb3IgMjU1DQo+Pj4+ICAgICAgS0xQICAg
ICBsaWIvbGl2ZXBhdGNoL3Rlc3Rfa2xwX2NvbnZlcnRfc2VjdGlvbnMua28NCj4+Pj4ga2xwLWNv
bnZlcnQ6IHNlY3Rpb24gLnJlbGEua2xwLm1vZHVsZV9yZWxvY3MudGVzdF9rbHBfY29udmVydF9t
b2QgbGVuZ3RoDQo+Pj4+IGJleW9uZCBucl9lbnRyaWVzDQo+Pj4+DQo+Pj4+IGtscC1jb252ZXJ0
OiBVbmFibGUgdG8gbG9hZCB1c2VyLXByb3ZpZGVkIHN5bXBvcw0KPj4+PiBtYWtlWzJdOiAqKiog
W3NjcmlwdHMvTWFrZWZpbGUubW9kZmluYWw6Nzk6DQo+Pj4+IGxpYi9saXZlcGF0Y2gvdGVzdF9r
bHBfY29udmVydF9zZWN0aW9ucy5rb10gRXJyb3IgMjU1DQo+Pj4+IG1ha2VbMl06IFRhcmdldCAn
X19tb2RmaW5hbCcgbm90IHJlbWFkZSBiZWNhdXNlIG9mIGVycm9ycy4NCj4+Pj4gbWFrZVsxXTog
KioqIFtzY3JpcHRzL01ha2VmaWxlLm1vZHBvc3Q6MTQ1OiBfX21vZHBvc3RdIEVycm9yIDINCj4+
Pj4gbWFrZTogKioqIFtNYWtlZmlsZToxNzcwOiBtb2R1bGVzXSBFcnJvciAyDQo+Pj4+DQo+Pj4N
Cj4+PiBIaSBDaHJpc3RvcGhlLA0KPj4+DQo+Pj4gSW50ZXJlc3RpbmcgZmFpbHVyZSBtb2RlLiAg
VGhhdCdzIGtscC1jb252ZXJ0IGNvbXBsYWluaW5nIHRoYXQgaXQgZm91bmQNCj4+PiBtb3JlIHJl
bG9jYXRpb25zIGluIGEgLmtscC5tb2R1bGVfcmVsb2NzLjxvYmpuYW1lPiBzZWN0aW9uIHRoYW4N
Cj4+PiBleHBlY3RlZCwgaS5lLiBucl9lbnRyaWVzID0gc2VjLT5zaXplIC8gc2l6ZW9mKHN0cnVj
dCBrbHBfbW9kdWxlX3JlbG9jKS4NCj4+Pg0KPj4+IEEgZmV3IHBvc3NpYmlsaXRpZXM6IHRoZSBF
TEYgc2VjLT5zaXplIHdhcyBpbmNvcnJlY3RseSBzZXQvcmVhZCBieQ0KPj4+IGJ1aWxkL2xpYmVs
ZiAoSSBkb3VidCB0aGF0KS4gIE9yIG1heWJlIHRoZSBsYXlvdXQvc2l6ZSBvZiBzdHJ1Y3QNCj4+
PiBrbHBfbW9kdWxlX3JlbG9jIGlzIG5vdCBjb25zaXN0ZW50IGJldHdlZW4ga2VybmVsIGFuZCB1
c2Vyc3BhY2UgKEknbQ0KPj4+IG1vcmUgc3VzcGljaW91cyBvZiB0aGlzKS4NCj4+Pg0KPj4+IENh
biB5b3UgcG9zdCBhIGNvcHkgb2YgdGhlIGJ1aWxkJ3Mgc3ltYm9scy5rbHAgYW5kDQo+Pj4gbGli
L2xpdmVwYXRjaC90ZXN0X2tscF9jb252ZXJ0MS50bXAua28gc29tZXdoZXJlPyAgSSBzaG91bGQg
YmUgYWJsZSB0bw0KPj4+IHN0YXJ0IGRlYnVnIHdpdGggdGhvc2UgZmlsZXMuDQo+Pj4NCj4+DQo+
PiBJIHNlbnQgeW91IGJvdGggZmlsZXMgb2ZmIGxpc3QuDQo+Pg0KPj4gSXQgbG9va3MgbGlrZSBr
bHAtY29udmVydCBkb2Vzbid0IHVzZSB0aGUgY29ycmVjdCBzaXplLiBJdCBmaW5kcyBhDQo+PiBz
dHJ1Y3Qgb2Ygc2l6ZSAxMiBoZW5jZSAzIGVudHJpZXMgZm9yIGEgc2VjdGlvbiBvZiBzaXplIDQw
Lg0KPj4NCj4+IE9uIFBQQzMyIHRoZSBzdHJ1Y3QgaGFzIHNpemUgOCAodm9pZCAqIGlzIDQgYW5k
IGludCBpcyA0KS4NCj4+DQo+PiBCdXQgSSdtIGNyb3NzLWJ1aWxkaW5nIGZyb20geDg2XzY0IHdo
ZXJlIHRoZSBzdHJ1Y3QgaXMgOCArIDQgPSAxMi4NCj4+DQo+PiBDYW4gaXQgYmUgdGhlIHJlYXNv
biA/DQo+Pg0KPiANCj4gSSdtIHByZXR0eSBzdXJlIHRoYXQgaXMgaXQuICBJIGhhdmVuJ3QgaGFk
IG11Y2ggcnVudGltZSB3aXRoIGtscC1jb252ZXJ0DQo+IGFuZCBjcm9zcy1idWlsZGluZyAoSSd2
ZSBvbmx5IGZvdW5kIG9uZSBiaWcvbGl0dGxlIGVuZGlhbiBidWcgd2l0aA0KPiB4ODZfNjQtPnMz
OTB4KSBhbmQgd2FzIGdvaW5nIHRvIGFzayB5b3UgaG93IHlvdSB3ZXJlIHRlc3RpbmcgOikNCj4g
DQo+IERvIHlvdSBrbm93IGlmIHRoZXJlIGFyZSBvdGhlciBrZXJuZWwgYnVpbGQgdG9vbHMgdGhh
dCBkZWFsIHdpdGggc2ltaWxhcg0KPiBzaXR1YXRpb25zPyAgVGhpcyBzZWVtcyBsaWtlIGEgdHJp
Y2t5IGpvYiBmb3IgdGhlIHVzZXJzcGFjZSBidWlsZCB0b29sDQo+IHRvIGRldGVybWluZSBub24t
bmF0aXZlIHRhcmdldCBzdHJ1Y3QgbGF5b3V0Lg0KPiANCj4gSW4gdGhlIG1lYW50aW1lLCBoYWNr
aW5nIGluOg0KPiANCj4gICBzdHJ1Y3Qga2xwX21vZHVsZV9yZWxvYyB7DQo+IC0gICAgICAgdm9p
ZCAqc3ltOw0KPiArICAgICAgIHVpbnQzMl90IHN5bTsNCj4gICAgICAgICAgdW5zaWduZWQgaW50
IHN5bXBvczsNCj4gICB9IF9fcGFja2VkOw0KPiANCj4gZ2V0cyBtZSBnZW5lcmF0aW5nIGFuIG91
dHB1dCAua28gZmlsZSwgYnV0IHRoZSByZWFkZWxmIG91dHB1dCBkb2Vzbid0DQo+IGxvb2sgcmln
aHQuDQo+IA0KPiBJJ2xsIGFkZCB0aGlzIHRvIHRoZSBwYXRjaHNldCBUT0RPIGxpc3QsIGJ1dCBt
YXkgbm90IGdldCB0byBpdCBmb3IgYQ0KPiB3aGlsZSAtLSBpcyB0aGVyZSBhbnkgY2hhbmNlIHRo
ZSBhYm92ZSBoYWNrIHdvcmtzIG9yIGNvdWxkIHlvdSB0ZXN0IGENCj4gbG9jYWwgbm9uLWNyb3Nz
IGJ1aWxkPw0KPiANCg0KTm8gSSBoYXZlIG5vIHdheSB0byBkbyBhIG5vbi1jcm9zcyBidWlsZC4g
TXkgdGFyZ2V0IGlzIGFuIGVtYmVkZGVkIGJvYXJkIA0Kd2l0aCBzbG93IENQVSBhbmQgbGl0dGxl
IG1lbW9yeS4NCg0KSSB0ZXN0ZWQgd2l0aCB5b3VyIGhhY2ssIEkgZ2V0Og0KDQpyb290QHZnb2lw
On4jIGluc21vZCAvbGliL21vZHVsZXMvdGVzdF9rbHBfY29udmVydDEua28NCmluc21vZDogY2Fu
J3QgaW5zZXJ0ICcvbGliL21vZHVsZXMvdGVzdF9rbHBfY29udmVydDEua28nOiB1bmtub3duIHN5
bWJvbCANCmluIG1vZHVsZSwgb3IgdW5rbm93biBwYXJhbWV0ZXINCnJvb3RAdmdvaXA6fiMgaW5z
bW9kIC9saWIvbW9kdWxlcy90ZXN0X2tscF9saXZlcGF0Y2gua28NCmluc21vZDogY2FuJ3QgaW5z
ZXJ0ICcvbGliL21vZHVsZXMvdGVzdF9rbHBfbGl2ZXBhdGNoLmtvJzogdW5rbm93biANCnN5bWJv
bCBpbiBtb2R1bGUsIG9yIHVua25vd24gcGFyYW1ldGVyDQoNCg0KSSBhZ3JlZSB3aXRoIHlvdSBy
ZWFkZWxmIHNob3dzIHNvbWV0aGluZyB3ZW50IHdyb25nIHdpdGggcmVsb2NhdGlvbnMuDQoNCkNo
cmlzdG9waGU=
