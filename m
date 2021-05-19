Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6304388839
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 09:34:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlPl45ssgz2yYv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 17:34:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256 header.s=selector2 header.b=Rm80R7xv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.102.55;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=Rm80R7xv; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2055.outbound.protection.outlook.com [40.107.102.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlPkS4Hm1z2xvc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 17:33:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MH/qZ5qm0/NzC7XLOsi/TRhJ7PosaqyYOwdXQN5zTvBaksZQDM4bCw6753tOPKm3ZlDnUQZbL4uk2bJvyWN4zR89BCJ6PC2Ho9S81I9OgHI+iXWM3YdCYIMElsh0WSgHX0TnphpmwJP2iWC2tS3NaVy+OVPizfr9/OsIfRRrOuxCryEHHlvhOZxfDy6slKk3HHSiiXvDDgDHMxrAb5FiQMGUACwsF7IQGkMcABgpdYJ4/NykYhVS9Y62n5zsKytS2G3SC1jfdvwujVvvODV71HsICePxBPkZf04EYlpd43J45SgKVFgB6z1vlZhqhE7tShw/rCzJwMVqOa3r3FeK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcrDJQO751qdxQvAoOLh5DB2z00diPyWQ8nylwack9Y=;
 b=goKPPxrPOibTjs4Z6fFHIubMKEg8pCcXJ5XzT7o92pvfYGmxGQ2VAUU0nBQixVfXjZnoXg4naYJkx7ViL10UZZmPlJC2pPyIzwsE43iKxs11m3eVH48K1oJz71VStIuKNb9z1uMI5cONkFcv7wtCExwLKLEXIL5ExhXG9KGI3c+xn3poDQw1mMc/GygsRxdWvtPVdoql3LqiJLZd/ofkN4eKk8zMOfKxT/bOZMEpzKxi4RWmXXtJT6BlnipylAMeTHc2sVEo/lQ9pkZbFBKcP5Tbiqq2s6DhT9RGi6YaRlZgJf6OVtvX8gOUJZkUHdC5e+cc56FSkjPqv3DgxmWcVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcrDJQO751qdxQvAoOLh5DB2z00diPyWQ8nylwack9Y=;
 b=Rm80R7xvtO+TUXV0DmcaJafKaHJ221gHNWNwA80t+8S11hJg3p8RThO4HnM7kh1ldY2T6F1oOnG15QXisyuMW6xEKTrczOCN9kgswp5X4gQupgeoQa6+L0B+LukHC4MIrUTRtTr4m8uqicOTxTM5Bwq5nuShWx1E4dW5ZScu2lM=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB4695.namprd10.prod.outlook.com (2603:10b6:510:3f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 07:33:44 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::5021:f762:e76f:d567]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::5021:f762:e76f:d567%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 07:33:43 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "ldv@altlinux.org" <ldv@altlinux.org>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
Thread-Topic: Linux powerpc new system call instruction and ABI
Thread-Index: AQHXTDxnjXzNFE+v10y5IiWAVxRCH6rqahwA
Date: Wed, 19 May 2021 07:33:43 +0000
Message-ID: <9b5ea7059c5a5d4e9ccccd7d73ce2c66b2203f52.camel@infinera.com>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
In-Reply-To: <20210518231331.GA8464@altlinux.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.0 
authentication-results: altlinux.org; dkim=none (message not signed)
 header.d=none;altlinux.org; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6242f394-657d-4308-9d86-08d91a986e4f
x-ms-traffictypediagnostic: PH0PR10MB4695:
x-microsoft-antispam-prvs: <PH0PR10MB469502A77898719DAF60EA76F42B9@PH0PR10MB4695.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c3u/Fqge24x1VqL5fedE0YqX9GsisGEDorVSzOLbwX+B+FoMuOPT3tfHOvMiN7jDNRbwEUOnvIY1Rm+Q2in3lVxuYcyUEoXkv5Z/Qmj3y6UAgkjmI8X5l115zrSNIjRACA6HpuVGNz9EgrEJQgV1+LHJ1/aeVr5GxEPy5AO4BMeHXfE1eGaugF6i/Z1TiWsfWte4EcyUw2sdV6dO3RwNk24GjW0nRQIz4ZU/21Hodl3kz3sgqy6s9fYf0t94qv6BD8OD1ZJ4vPzdOKcuMUj0wxACOFuGAQMlIB2bmgJ4+T1umFUFWtayXdINMlEnvCuzLumFX2zGKtzxvlKNcJxbLMOGN3C7Fa0s3tQXCKczmHz26c/rvDrnzTPwCnyR1t8yQCB6r5A3L6k2+IeHh4Zs+89MRtQU17Kkq9t/L03WUYVrUKBx/d6cClW+4UtOOL20Y5cRjrDSKw47Zjq0jATzE3YdJaNcwckXj62qMeLmCkcbZTuG535kkSBh/tWyHAphSDzJl56h0EEDBTa5ufE/ZmIXZtyC08SpIapHQ+Xl+czsna2Vs/fBfBL5TLAeXmHRwRn2qmgVwwaBA+DGzIHXwyvOqJI2/D0hzzGRfiZESpo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4615.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(36756003)(6512007)(83380400001)(71200400001)(2906002)(186003)(8936002)(38100700002)(86362001)(6506007)(2616005)(8676002)(26005)(66946007)(66476007)(66556008)(64756008)(66446008)(110136005)(4744005)(6486002)(4326008)(76116006)(122000001)(316002)(478600001)(91956017)(5660300002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eWZZVGF5d2xjRm5ZZ2tMV1Juamlha0pDd2NZQVFnby9EWE5DK1d2bGgvNnht?=
 =?utf-8?B?ekgyZjNzOEwxcDBhZDBnT0Jib2taLzZod1JyYkZYLytpd01IWldpeGFUZytK?=
 =?utf-8?B?MDI1dHRDaHV0TFpOV1NkUmpQTThqM0tLQ2F5MEMwZHdxQVhTMmM0dFAwek5F?=
 =?utf-8?B?T2tqSGVBZlRCeUI1Njh3STQ3V3FLcGQ1UXZSNEdvTktmblg0QkFCNlE4dmti?=
 =?utf-8?B?enppUnF2OGwva2xIK0N4anNEdEg3VEhUZy9sbDcvdHc2RG1OL3FER3hVbjcw?=
 =?utf-8?B?QTBVNUNsb0pxeTY1Z01BUmxPL3E5TE44WVFiNC84Z25acXpmdGJoWk1tYUw2?=
 =?utf-8?B?MzZiZ1I2WTBKMEswWkRHUldXS1lxeHlpYk1QOEpxcXR0M0hvUWp5RGlGVWw0?=
 =?utf-8?B?SU5ROXdoVDBoUDcxcW1lT3hmSHlDMG9FbENOY05ScDVCRjA4QzdpMEhCelNi?=
 =?utf-8?B?cGwvREdPQ2xhdlpsbHNxNzlGUTJYV0dRZDBEU1R6M3NtcWFBUXJOaEZnc0dj?=
 =?utf-8?B?MTN1Sk03andtWGx0aGNBbHBZb0xHdTgvbkNaZmxWaUZON0wrWkdTWFpYclha?=
 =?utf-8?B?VGhZNmx6SUkxRjNwVFcxVngvc1IxSzUxOFpDZnJ2NjJjTE5pSXdyN2JmVUZ6?=
 =?utf-8?B?U1JZbVh3Y3l0TlZRamRPZ05WWDVENUZNUFg2ZUMreitVdzFLbHF5MjBBVVp5?=
 =?utf-8?B?bGE1dzd4Z3RNSjdCQ094UVFGRlZiZjBKZWRvYkl6dWlzMTdOc0xkcmxlV2Fp?=
 =?utf-8?B?N2wwMSsyMUU5N295VmlFODhWcENrSDZGdEpxZkdLSEhkNkpaSkUzRkVRVjQ0?=
 =?utf-8?B?SnZTQWFOMUVWQytzN1d2NFh0ZGpQeGhjRUJ5VHF4NlpFOUduTGJIVHgwdHR3?=
 =?utf-8?B?d0k0WElKam8zcE1zbnNKS3A1Mlc5emtzNENXVFNCVWR3blRSV0dNQWpxT2V1?=
 =?utf-8?B?UnNZc3Q3ZG1LVDJXcTNDWlNNUlJ3Zmg0dEE2dlo3Y0JqYlFod0NjRTdUTjRV?=
 =?utf-8?B?OVkzMGxFU2ZTb0JtaFZvblRDdUpkT0lyMno5U21LNlhaMG9uak1RSWlkcDBv?=
 =?utf-8?B?ZFlPdG1GS1g2QTR5TTg1Ui9wT2N4UnU2V2dROXI4elJoeWcvSHRIR1BVeE9W?=
 =?utf-8?B?U0QwRU14alpFRnlOOTlNRG02V0JSV1JkYktmQUZwUk5aOTYwVXovZTlnbXM2?=
 =?utf-8?B?RlhoWW1xUm5rR1p0bzl2NCt4TUZROWEwM2RqMlB6ZDg5aGZGa1o1VzZ1VDIx?=
 =?utf-8?B?VnBxUVVBaWVHWHh1N2N6eis3eDBUNldPTlJFUDMwUmpVeHFBdTF1aDlzRzUr?=
 =?utf-8?B?ZUJzaks1djI0U2lEUFBsbm5oQmhLL0VJOWlkTDVBUFYzRHgvb0VVcFp1NlQw?=
 =?utf-8?B?VFNzS01TdUEzWi9CbzU2U1BDWlVSaHVYK0tuQnhJK2tRVzE0eEZNMmtNZEt1?=
 =?utf-8?B?L0FJcWlKWHdXT0JER3RvKzlBaHRoajF6V2pxTkFHM0tlU1pLODFITnpvRzdE?=
 =?utf-8?B?andxRDgzL0M3ZFBJc3E3SkxIWEMvZUZWNks0cmREMldJYVdTbFhneEY0aTRW?=
 =?utf-8?B?QWdHb3BkZS9qUHE5ZzlobGhHSHpWcks5VnFkN05CM3YzTUZuR093RnNtR3k0?=
 =?utf-8?B?RGM0VzBORjV5eUhtR3pENVkyT29RYWl6VjY1elVEaWFjT1dQM0xiWU9nM3Uv?=
 =?utf-8?B?Wjh1MnM5Mnlyb1JTS3FCRFErZGJuTmNMMCtxa2lSOW1lNU4xTThjL1UzR29U?=
 =?utf-8?Q?AcNI7fqC7tCHKHc3HfvPeMfOb0J0Y8j0PdJOXEz?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C06641E135CF1E4C94916C740E238614@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6242f394-657d-4308-9d86-08d91a986e4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 07:33:43.5637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iXxkWDK6Kr30Hy+ktNds6R0fY1OT0915oOxTxp5ILwYmmar6MwY8SrL0hgbxlOZ5zCuJOZlXZ47ju5JBh/HYLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4695
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
Cc: "libc-dev@lists.llvm.org" <libc-dev@lists.llvm.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "musl@lists.openwall.com" <musl@lists.openwall.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIxLTA1LTE5IGF0IDAyOjEzICswMzAwLCBEbWl0cnkgVi4gTGV2aW4gd3JvdGU6
DQo+IEhpLA0KPiANCj4gT24gVGh1LCBKdW4gMTEsIDIwMjAgYXQgMDY6MTI6MDFQTSArMTAwMCwg
TmljaG9sYXMgUGlnZ2luIHdyb3RlOg0KPiBbLi4uXQ0KPiA+IC0gRXJyb3IgaGFuZGxpbmc6IFRo
ZSBjb25zZW5zdXMgYW1vbmcga2VybmVsLCBnbGliYywgYW5kIG11c2wgaXMgdG8gbW92ZSB0bw0K
PiA+IMKgwqB1c2luZyBuZWdhdGl2ZSByZXR1cm4gdmFsdWVzIGluIHIzIHJhdGhlciB0aGFuIENS
MFtTT109MSB0byBpbmRpY2F0ZSBlcnJvciwNCj4gPiDCoMKgd2hpY2ggbWF0Y2hlcyBtb3N0IG90
aGVyIGFyY2hpdGVjdHVyZXMsIGFuZCBpcyBjbG9zZXIgdG8gYSBmdW5jdGlvbiBjYWxsLg0KDQpX
aGF0IGFib3V0IHN5c2NhbGxzIGxpa2UgdGltZXMoMikgd2hpY2ggY2FuIHJldHVybiAtMSB3aXRo
b3V0IGl0IGJlaW5nIGFuIGVycm9yPw0KDQogSm9ja2UNCg==
