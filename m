Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE0A51D6E7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 13:42:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvpZw03C5z3cFK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 21:42:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::601;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvpZQ3xf8z3bpw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 21:42:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDxKyxez+BuqBq5mWaJ2S7dn1DH/ncV5Eow2wogPau4ps+M6+lb/gYLYVLGHiOF6upqfNw8565sZX6qIWZ2RHEoac4gI+uopSeu9UYhlQv61p2QxQXCGnMz2rN/s7y4TroaeXmCXtRkVjjFqseAshy8Wtpgl7vGGljyfXoYRAghfiq9d4hZ8Tb3QgRGuObdTERWwIuX6YwMtnWTLgLY7/falv1maeEqu8dz68aMsTbJ+xBBbbdq8Bu4cS/dO/J2TgxJozqNihC+1n7qZNsCsxNN1FhGuyAYe7cwfErZ4d02oEDC8dfGmyS1gMmvl5aKt3pNs8BtEc+xZoG7e4zR/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkVBYOcLCJUSP01mepRfYhCs8nWXTUJVkTSXpHGaKpU=;
 b=bCKW2fg1x3e+/s5xdde6Fkpu2ihu5tHgyM4vL0u9J3Y30TYq60wpgdEH9cUwWMLVldx8S1fs8m/w3W3l9ZESbRDVyttyKAaFLD9d8+BzbLtQZ/8Nw27XjldnDMu9YJwEkI9X036pfTmc05N3AX2jRcpIwGP25GAMEBL66eC6BDAVSbopGsN5reR9+CpVBoQDOeZVw7rY+TY90GgoTv7gm5RCpKmjAjJQM/SwNH1lFKvPMOapsXhNxe0w1q+kbri/7wMKEGsrPQam/3aa91lwGYwgtH890fRCIwUfUHkQ7c2Va7yy9JvKsxW03FobX5VobgqWaHrVKAPXKxLfTpYHPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2676.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:39::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Fri, 6 May
 2022 11:41:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%6]) with mapi id 15.20.5227.020; Fri, 6 May 2022
 11:41:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Ingo Molnar <mingo@redhat.com>,
 Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Steven Rostedt
 <rostedt@goodmis.org>
Subject: Re: [PATCH v1 08/22] powerpc/ftrace: Make __ftrace_make_{nop/call}()
 common to PPC32 and PPC64
Thread-Topic: [PATCH v1 08/22] powerpc/ftrace: Make __ftrace_make_{nop/call}()
 common to PPC32 and PPC64
Thread-Index: AQHYP4vPBTNDUSKTeEOC4y2yFRN9Daz1Xy0AgByeQgA=
Date: Fri, 6 May 2022 11:41:47 +0000
Message-ID: <c089741c-d5c8-2e9f-c249-a0deb9cdc627@csgroup.eu>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
 <fb60b19f154db8132a00c2df7aca7db3e85603b5.1648131740.git.christophe.leroy@csgroup.eu>
 <1650262952.h2adiu8czw.naveen@linux.ibm.com>
In-Reply-To: <1650262952.h2adiu8czw.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc32c3e9-a5ad-4f5e-6369-08da2f556729
x-ms-traffictypediagnostic: MR1P264MB2676:EE_
x-microsoft-antispam-prvs: <MR1P264MB26766352428893D0B0084A15EDC59@MR1P264MB2676.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: apnUrHwZZ76OtgESsIyt5r7XDDDB7vwy3j0rDzu/U5imOBnyDTelyliM10A2aT2VxfzxscVhwxLuXb4QNoBMeGZCJyn0n4Gmy2rMFI7qihc9w9q999ZYembrUGl55bMdh/Z+OvdebfCBW6DdNJNktJwnfh1VPPrDpflpIJ50Gaqmn6Dv2dhrMOhq3MAwexpLgMX35lPLSjwTz3ZFtSJBFzC9meO8p85YXZErTeHVKRztQZpjWBfc/NpFCfbeUp/E44YosL83+Z1msdF9wkuFXXZCSkHuJia5/8paXYnkYmpcukb8kH7euPmF9q1hUQdj0DCEYr8vjMHH0po90BIqbPm7bfburhoRfVlNd3JyVaxlx3oPMhyDSWeS1+ClB5b1NwtQISmtxLri6tZ7HN63F6eYzG6C25NhmyPCqH9T9jLVqbQq8rt50A6JstGY3EhXsHqr10Atb5mQAHw13W+UTAlIOEYXItpN8lk5ruLn3qkft4fNYre66RPO69PA0p0Iz0y+zMxUpEegbNNAdPuZXjCY/onqtrolD4nVXG4ES7MTJD4ng0WrJ8OHPsALY9RGVCOU6W2ig0+B/oyRXTchbcr0l6FhGG+/lkabJ8ZnLkSqV6HBp/2dNPJxL/b4rUblRWlHdap407aUq0z4vw8HnwN5f3RUtCBM1snCFm0IcClOIMejtNRxQ8T+2ENutsNPFdEUKu+wbPKtRSsZkjkoS68+pfXGoFz7iKZOXkR5a+SsEs72Lr7J1yd2BSiizcm0GB5gKAPGLBTBnMhBINXK2g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(8676002)(5660300002)(6506007)(4326008)(2906002)(26005)(71200400001)(6512007)(36756003)(83380400001)(38100700002)(38070700005)(2616005)(31686004)(66446008)(316002)(508600001)(54906003)(6486002)(186003)(110136005)(122000001)(66574015)(31696002)(91956017)(44832011)(66556008)(76116006)(66946007)(86362001)(66476007)(64756008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2xabnUwYXEyQzZtSEgwSi9tbWZEbDliaVlDQmx6MHliN2RaMW9BbEtlR3F0?=
 =?utf-8?B?bFp1eHlERXRWdndmZHl6eDZXMkhua2dsdTZZajBzTnhXVWVScnJHQlJybzlj?=
 =?utf-8?B?elp3Kzgxck9VYm4wanV5UGV4YmpaeDJzQzZ1SCtnNXhzVUtjZDM1YUxrOTFj?=
 =?utf-8?B?dml0WDdibW5Td1hIM0MzV3Q3WVdUb3BtU2svT3U2OW8rQlRuZWVvMlg1Rkdt?=
 =?utf-8?B?NG9JZXNkNzJrNGpDdTZSeXdWVjR3M1VCbWdJTXNSa3paWXMyYUxnRDZGbmly?=
 =?utf-8?B?dUU2a0FzaW5uRnZ3dTB3aWJEcEJ3ZXdoQU13dTFMejRHcHlSN3UwbnRBUnd3?=
 =?utf-8?B?d3JDNFhCMjZqRXVqU3NJWmt1UkFPbVhyRWN3eHg1cGhWZS9VRC9oeGxKSkdC?=
 =?utf-8?B?NHRNaHZwMWtGZmp1c1BITEpOVVU0TEYzaEt0eGFPMVpvbG5LN0J1d2Z1MDZj?=
 =?utf-8?B?ZlorZDc2RklnSmRpM0JhUnl1cVp4eEhlTUVUalI4MjJmNW1XRDZ1Uzk0cjl1?=
 =?utf-8?B?YmYxbFZkcUl4WlFQMW9FVWU4ZCt5QnBuelJXd21JK0VGcEM2MlJtTUNSK1hC?=
 =?utf-8?B?Mm1FL3UxbUZQRE1KUFliZXMrMk5uS2lZM2pxM0hBSERXbnpIUXZkN05iYlR0?=
 =?utf-8?B?L1l0NDZld0dEOU9Nb01vQTZSWjFuRnYvTjBHLzNnY2RUMzNJUGwvSjczbWFz?=
 =?utf-8?B?Y3dLUFE4ZkxSaW1iSGREbHcvVDJwN0JDa0VCTkZtcVBON2JEcjBYb3U3Zjcr?=
 =?utf-8?B?Q3FCcGxVbU9zSFRnaXIyVFF1Wk1zVHRmWjVVZ2FOVjNKZlpqcnhVb1NNUktC?=
 =?utf-8?B?Y2N5Y3BkSG9yTHJrVkwvNEpqUHJ0QkcrWGR0SG9IU0x3NXdrb0NEb3VqNXFl?=
 =?utf-8?B?NktycGRIVUZmTWtMb2I0SmRnR0RQb2hLNUd4akExWXpQRWNJVzdQcnNkQzlT?=
 =?utf-8?B?K3dleFdNVWJFMEx3TFZ5SE9nZEhCTzY2Mk9CWTRkaldlVFErNWMwNDlTbmJh?=
 =?utf-8?B?U3dMSEJJcVlWQy9EQzhWMHBRQlY3UTMvbXZCMzA4SGpwRVYycDlpeTM0TGlM?=
 =?utf-8?B?aTJMWjg4M0dIeUZCNThaZWJPdHMxdW85bmh5QWgvL0VvdDJaK1VLSGllZ3Q5?=
 =?utf-8?B?aWsrS1ErWHZvczJ4VFhTSCthTlB2bjdpQjd1YmswbFA5cVFuYWlDcjd1MmFw?=
 =?utf-8?B?QnVieXlqVVgvSzlGYnBqMXVDUlhJY1lFc09XQkJmOG4wMTlVTE1mcFF4d2JN?=
 =?utf-8?B?TTI0VTYvcXBSbGFIaUJPYWlqTkVtaHVmWllyOWY5Sk16UDg3aDRJQUozTVYx?=
 =?utf-8?B?aCtUNWJBK1RocWVyekJacG5hbXI5SG9oVnBrNk5SNkFCdWFIdW8xZXErK0Y1?=
 =?utf-8?B?QXhtcGN0NW12SlJwOG0wOENia0o4SVJReDFraE1BZVRvczdPSEhOd1FpOXRD?=
 =?utf-8?B?VUdWOGxXQzZuakdNSVJyZmRSVkVaaXBiMzF2U1gzcGU0ZW5uQXRxblR6U2JI?=
 =?utf-8?B?VXFmbTZLemR2VnlaNU91RTVMUXplQkg5T05LQkFlNTl5QjBvSkdFRFNnV2hu?=
 =?utf-8?B?K0FpajBmNHBtUkx5MjVoOGVoV2NoMEgrcWpGbHQzWkVHRHlSZzNoYnZSajlO?=
 =?utf-8?B?T005NlpIK1piL2RiSTdFbVhRNzhBL1c0NCtiakpzeU1WT1VESE42bmx0WTdQ?=
 =?utf-8?B?dzBlSytmOW0zNi92VytUQ1VHaVpFdmsrdElUMEdiYVBTZDNsTnRyWHZjb2Vj?=
 =?utf-8?B?bEJHTVRneFBKdE9lUTRETGNQc0pRdlg2d2poQ1RiU1VWUU5UNHI3M0NXNGhV?=
 =?utf-8?B?ZklPSG1EQU10MnpZTk82OUNWd0pXOGUrRUsrSmI5SitZUWpkQXE4ZUhPUlRQ?=
 =?utf-8?B?ZjZxYzNIT1BGbGNzZmROQTdxMzNMMmdId1I3bEdiV2JMRjlWcCtBZklLcGdo?=
 =?utf-8?B?S3REMExrNy8xdWpYYXQrOHRpaFlrWWZQQisydnRTc1dCaWxCWHRMbE5CeDBH?=
 =?utf-8?B?ZGJ5MlQzUUxobk9mandqL0dtazNWcFBTTVdFa0dwd3NrNFBXWCtWMHBXVFlL?=
 =?utf-8?B?ZUJVUXFFVXQvUDJpQ1FGcUFEcW9SK3JMQ0NCUlB0V2hYZ1VLVHpPMWNERExO?=
 =?utf-8?B?WnFGOG5GS1hibkljWTNpdk0yWlljOENYZkZQV2lNV25pbjF6MGdrQXh0Nnoy?=
 =?utf-8?B?MVB5bmNaWnFBcW5sd1Q2SXR0SlV5b1N4S3E3SkxLbGI5dExKam9nN3Q0dW1F?=
 =?utf-8?B?Q01XelBEQUN4Q1lETnJXUlk2bERrWUZDUjcyWGJqZW1ZWjNTTTVEbG5zNk1R?=
 =?utf-8?B?MDVvdk92eml0ckRtVThSd1FiNnIwU2NVNkpSUGwxdWJ5NkxXbzI3RDJnTTlw?=
 =?utf-8?Q?gLmOMwq8vWr2447kUJK46/ch0NXgp9smmOLwL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D895AF58D1C454BBB184DC4A166AB0B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cc32c3e9-a5ad-4f5e-6369-08da2f556729
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 11:41:47.5212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pSLHrftbJRAlDpOY5jvqIfRnpuWErjBf/jEbM3RH3k+8zhSRfa+L5Ep23io7hgUNUespEjFofRe+7iRfONgdt7p9gLhdr/ALPtfkgel1aBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2676
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzA0LzIwMjIgw6AgMDg6NDAsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IFNpbmNlIGM5M2Q0ZjZlY2Y0YiAoInBvd2VycGMv
ZnRyYWNlOiBBZGQgbW9kdWxlX3RyYW1wb2xpbmVfdGFyZ2V0KCkNCj4+IGZvciBQUEMzMiIpLCBf
X2Z0cmFjZV9tYWtlX25vcCgpIGZvciBQUEMzMiBpcyB2ZXJ5IHNpbWlsYXIgdG8gdGhlDQo+PiBv
bmUgZm9yIFBQQzY0Lg0KPj4NCj4+IFNhbWUgZm9yIF9fZnRyYWNlX21ha2VfY2FsbCgpLg0KPj4N
Cj4+IE1ha2UgdGhlbSBjb21tb24uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBM
ZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPj4gLS0tDQo+PiDCoGFyY2gvcG93
ZXJwYy9rZXJuZWwvdHJhY2UvZnRyYWNlLmMgfCAxMDggKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4+IMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTAwIGRlbGV0aW9u
cygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFj
ZS5jIA0KPj4gYi9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+PiBpbmRleCAx
YjA1ZDMzZjk2YzYuLjJjN2U0MmU0MzliYiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9r
ZXJuZWwvdHJhY2UvZnRyYWNlLmMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhY2Uv
ZnRyYWNlLmMNCj4+IEBAIC0xMTQsNyArMTE0LDYgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZmlu
ZF9ibF90YXJnZXQodW5zaWduZWQgbG9uZyANCj4+IGlwLCBwcGNfaW5zdF90IG9wKQ0KPj4gwqB9
DQo+Pg0KPj4gwqAjaWZkZWYgQ09ORklHX01PRFVMRVMNCj4+IC0jaWZkZWYgQ09ORklHX1BQQzY0
DQo+PiDCoHN0YXRpYyBpbnQNCj4+IMKgX19mdHJhY2VfbWFrZV9ub3Aoc3RydWN0IG1vZHVsZSAq
bW9kLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGR5bl9mdHJhY2UgKnJlYywgdW5z
aWduZWQgbG9uZyBhZGRyKQ0KPj4gQEAgLTE1NCwxMCArMTUzLDExIEBAIF9fZnRyYWNlX21ha2Vf
bm9wKHN0cnVjdCBtb2R1bGUgKm1vZCwNCj4+IMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5W
QUw7DQo+PiDCoMKgwqDCoCB9DQo+Pg0KPj4gLSNpZmRlZiBDT05GSUdfTVBST0ZJTEVfS0VSTkVM
DQo+PiAtwqDCoMKgIC8qIFdoZW4gdXNpbmcgLW1rZXJuZWxfcHJvZmlsZSB0aGVyZSBpcyBubyBs
b2FkIHRvIGp1bXAgb3ZlciAqLw0KPj4gK8KgwqDCoCAvKiBXaGVuIHVzaW5nIC1ta2VybmVsX3By
b2ZpbGUgb3IgUFBDMzIgdGhlcmUgaXMgbm8gbG9hZCB0byBqdW1wIA0KPj4gb3ZlciAqLw0KPiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtbXByb2ZpbGUta2VybmVs
DQo+IA0KPiBTaW5jZSB5b3UgYXJlIG1vZGlmeWluZyB0aGF0IGxpbmUgYW55d2F5IF5eDQo+IA0K
PiANCj4+IMKgwqDCoMKgIHBvcCA9IHBwY19pbnN0KFBQQ19SQVdfTk9QKCkpOw0KPj4NCj4+ICsj
aWZkZWYgQ09ORklHX1BQQzY0DQo+PiArI2lmZGVmIENPTkZJR19NUFJPRklMRV9LRVJORUwNCj4+
IMKgwqDCoMKgIGlmIChjb3B5X2luc3RfZnJvbV9rZXJuZWxfbm9mYXVsdCgmb3AsICh2b2lkICop
KGlwIC0gNCkpKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgIHByX2VycigiRmV0Y2hpbmcgaW5zdHJ1
Y3Rpb24gYXQgJWx4IGZhaWxlZC5cbiIsIGlwIC0gNCk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRUZBVUxUOw0KPj4gQEAgLTIwMSw2ICsyMDEsNyBAQCBfX2Z0cmFjZV9tYWtlX25vcChz
dHJ1Y3QgbW9kdWxlICptb2QsDQo+PiDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOw0K
Pj4gwqDCoMKgwqAgfQ0KPj4gwqAjZW5kaWYgLyogQ09ORklHX01QUk9GSUxFX0tFUk5FTCAqLw0K
Pj4gKyNlbmRpZiAvKiBQUEM2NCAqLw0KPj4NCj4+IMKgwqDCoMKgIGlmIChwYXRjaF9pbnN0cnVj
dGlvbigodTMyICopaXAsIHBvcCkpIHsNCj4+IMKgwqDCoMKgwqDCoMKgwqAgcHJfZXJyKCJQYXRj
aGluZyBOT1AgZmFpbGVkLlxuIik7DQo+PiBAQCAtMjA5LDQ4ICsyMTAsNiBAQCBfX2Z0cmFjZV9t
YWtlX25vcChzdHJ1Y3QgbW9kdWxlICptb2QsDQo+Pg0KPj4gwqDCoMKgwqAgcmV0dXJuIDA7DQo+
PiDCoH0NCj4+IC0NCj4+IC0jZWxzZSAvKiAhUFBDNjQgKi8NCj4+IC1zdGF0aWMgaW50DQo+PiAt
X19mdHJhY2VfbWFrZV9ub3Aoc3RydWN0IG1vZHVsZSAqbW9kLA0KPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoCBzdHJ1Y3QgZHluX2Z0cmFjZSAqcmVjLCB1bnNpZ25lZCBsb25nIGFkZHIpDQo+PiAtew0K
Pj4gLcKgwqDCoCBwcGNfaW5zdF90IG9wOw0KPj4gLcKgwqDCoCB1bnNpZ25lZCBsb25nIGlwID0g
cmVjLT5pcDsNCj4+IC3CoMKgwqAgdW5zaWduZWQgbG9uZyB0cmFtcCwgcHRyOw0KPj4gLQ0KPj4g
LcKgwqDCoCBpZiAoY29weV9mcm9tX2tlcm5lbF9ub2ZhdWx0KCZvcCwgKHZvaWQgKilpcCwgTUNP
VU5UX0lOU05fU0laRSkpDQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7DQo+PiAt
DQo+PiAtwqDCoMKgIC8qIE1ha2Ugc3VyZSB0aGF0IHRoYXQgdGhpcyBpcyBzdGlsbCBhIDI0Yml0
IGp1bXAgKi8NCj4+IC3CoMKgwqAgaWYgKCFpc19ibF9vcChvcCkpIHsNCj4+IC3CoMKgwqDCoMKg
wqDCoCBwcl9lcnIoIk5vdCBleHBlY3RlZCBibDogb3Bjb2RlIGlzICVzXG4iLCBwcGNfaW5zdF9h
c19zdHIob3ApKTsNCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsNCj4+IC3CoMKg
wqAgfQ0KPj4gLQ0KPj4gLcKgwqDCoCAvKiBsZXRzIGZpbmQgd2hlcmUgdGhlIHBvaW50ZXIgZ29l
cyAqLw0KPj4gLcKgwqDCoCB0cmFtcCA9IGZpbmRfYmxfdGFyZ2V0KGlwLCBvcCk7DQo+PiAtDQo+
PiAtwqDCoMKgIC8qIEZpbmQgd2hlcmUgdGhlIHRyYW1wb2xpbmUganVtcHMgdG8gKi8NCj4+IC3C
oMKgwqAgaWYgKG1vZHVsZV90cmFtcG9saW5lX3RhcmdldChtb2QsIHRyYW1wLCAmcHRyKSkgew0K
Pj4gLcKgwqDCoMKgwqDCoMKgIHByX2VycigiRmFpbGVkIHRvIGdldCB0cmFtcG9saW5lIHRhcmdl
dFxuIik7DQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7DQo+PiAtwqDCoMKgIH0N
Cj4+IC0NCj4+IC3CoMKgwqAgaWYgKHB0ciAhPSBhZGRyKSB7DQo+PiAtwqDCoMKgwqDCoMKgwqAg
cHJfZXJyKCJUcmFtcG9saW5lIGxvY2F0aW9uICUwOGx4IGRvZXMgbm90IG1hdGNoIGFkZHJcbiIs
DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0cmFtcCk7DQo+PiAtwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC1FSU5WQUw7DQo+PiAtwqDCoMKgIH0NCj4+IC0NCj4+IC3CoMKgwqAgb3Ag
PSBwcGNfaW5zdChQUENfUkFXX05PUCgpKTsNCj4+IC0NCj4+IC3CoMKgwqAgaWYgKHBhdGNoX2lu
c3RydWN0aW9uKCh1MzIgKilpcCwgb3ApKQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAtRVBF
Uk07DQo+PiAtDQo+PiAtwqDCoMKgIHJldHVybiAwOw0KPj4gLX0NCj4+IC0jZW5kaWYgLyogUFBD
NjQgKi8NCj4+IMKgI2VuZGlmIC8qIENPTkZJR19NT0RVTEVTICovDQo+Pg0KPj4gwqBzdGF0aWMg
dW5zaWduZWQgbG9uZyBmaW5kX2Z0cmFjZV90cmFtcCh1bnNpZ25lZCBsb25nIGlwKQ0KPj4gQEAg
LTQzNywxMyArMzk2LDEyIEBAIGludCBmdHJhY2VfbWFrZV9ub3Aoc3RydWN0IG1vZHVsZSAqbW9k
LA0KPj4gwqB9DQo+Pg0KPj4gwqAjaWZkZWYgQ09ORklHX01PRFVMRVMNCj4+IC0jaWZkZWYgQ09O
RklHX1BQQzY0DQo+PiDCoC8qDQo+PiDCoCAqIEV4YW1pbmUgdGhlIGV4aXN0aW5nIGluc3RydWN0
aW9ucyBmb3IgX19mdHJhY2VfbWFrZV9jYWxsLg0KPj4gwqAgKiBUaGV5IHNob3VsZCBlZmZlY3Rp
dmVseSBiZSBhIE5PUCwgYW5kIGZvbGxvdyBmb3JtYWwgY29uc3RyYWludHMsDQo+PiDCoCAqIGRl
cGVuZGluZyBvbiB0aGUgQUJJLiBSZXR1cm4gZmFsc2UgaWYgdGhleSBkb24ndC4NCj4+IMKgICov
DQo+PiAtI2lmbmRlZiBDT05GSUdfTVBST0ZJTEVfS0VSTkVMDQo+PiArI2lmbmRlZiBDT05GSUdf
RFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTDQo+IA0KPiBJdCBpcyBiZXR0ZXIgdG8gZ2F0ZSB0aGlz
IG9uIFBQQzY0X0VMRl9BQklfdjENCg0KT2sgSSBkbyB0aGF0IHdpdGggdGhlIG5ldyBDT05GSUdf
UFBDNjRfRUxGX0FCSV9WMS4NCg0KPiANCj4+IMKgc3RhdGljIGludA0KPj4gwqBleHBlY3RlZF9u
b3Bfc2VxdWVuY2Uodm9pZCAqaXAsIHBwY19pbnN0X3Qgb3AwLCBwcGNfaW5zdF90IG9wMSkNCj4+
IMKgew0KPj4gQEAgLTQ2NSw3ICs0MjMsNyBAQCBleHBlY3RlZF9ub3Bfc2VxdWVuY2Uodm9pZCAq
aXAsIHBwY19pbnN0X3Qgb3AwLCANCj4+IHBwY19pbnN0X3Qgb3AxKQ0KPj4gwqBzdGF0aWMgaW50
DQo+PiDCoGV4cGVjdGVkX25vcF9zZXF1ZW5jZSh2b2lkICppcCwgcHBjX2luc3RfdCBvcDAsIHBw
Y19pbnN0X3Qgb3AxKQ0KPj4gwqB7DQo+PiAtwqDCoMKgIC8qIGxvb2sgZm9yIHBhdGNoZWQgIk5P
UCIgb24gcHBjNjQgd2l0aCAtbXByb2ZpbGUta2VybmVsICovDQo+PiArwqDCoMKgIC8qIGxvb2sg
Zm9yIHBhdGNoZWQgIk5PUCIgb24gcHBjNjQgd2l0aCAtbXByb2ZpbGUta2VybmVsIG9yIHBwYzMy
ICovDQo+PiDCoMKgwqDCoCBpZiAoIXBwY19pbnN0X2VxdWFsKG9wMCwgcHBjX2luc3QoUFBDX1JB
V19OT1AoKSkpKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+IMKgwqDCoMKgIHJl
dHVybiAxOw0KPj4gQEAgLTQ4NCw4ICs0NDIsMTAgQEAgX19mdHJhY2VfbWFrZV9jYWxsKHN0cnVj
dCBkeW5fZnRyYWNlICpyZWMsIA0KPj4gdW5zaWduZWQgbG9uZyBhZGRyKQ0KPj4gwqDCoMKgwqAg
aWYgKGNvcHlfaW5zdF9mcm9tX2tlcm5lbF9ub2ZhdWx0KG9wLCBpcCkpDQo+PiDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiAtRUZBVUxUOw0KPj4NCj4+ICsjaWZuZGVmIENPTkZJR19EWU5BTUlDX0ZU
UkFDRV9XSVRIX1JFR1MNCj4+IMKgwqDCoMKgIGlmIChjb3B5X2luc3RfZnJvbV9rZXJuZWxfbm9m
YXVsdChvcCArIDEsIGlwICsgNCkpDQo+PiDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUZBVUxU
Ow0KPj4gKyNlbmRpZg0KPiANCj4gSGVyZSB0b28uLi4NCj4gDQoNCkRvbmUNCg0KQ2hyaXN0b3Bo
ZQ==
