Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B78CA532B49
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 15:29:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6w5s4FSFz3bnd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 23:29:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::622;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::622])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6w5P0QzJz2xX6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 23:28:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sa+iDv8wo/1WUqF+8ErxZO5yHNhP/QwgKHrdivl2eBclpR2NGKZ5/ip10k/KxPwNdEgDT/SMWNY+leaRtNhk11dC3ruphFaDC6qgd1HM22k8GN9/HAmjucKfMa41oUeHHh0m6cEG3wSIDTOr06YJDvlv/QDgc+uX8Fp6AdCFcWrgBUpmRSiRpJpy5TB/dIfstKl6hivYpWfYdIXPbK5wvEl4iOGscUtN/EkOTh1xskPqvbeGZ7R5umXuEZYObrNxtc6hlejJH/ENbENd7vNjMeIblvFwiLuiqKUOBSvuR2fy3Edczxabh7T0s2oN5OG3DVJnQ5Vdh4wICrKV6sM4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u69MdDk2CpCr2//TMJBJI10tRlJIoEHmqfL6476CVbI=;
 b=Y1JoUyIRVmxgZJGVe8KCYqBqyIBhw9GFepTXs2D59LIxb+n5KLaQUAR42YI+0C8l4LQ21usqfo8CZ80FSKKLWkg0HKkw0iix9N85hWOQZUaz5ZJRlvBa+n1i5y7O0FHLn5owK/N5qQ64/BtSj2vnUrlJoEH+Wr1cJKXtK1ioZkyvBC3mSYnq2cRdUSvrQxuzUL9VxflQ1Y6fCxx/hMXbJ0RNH1YRBR6My3BrYUHWGm2DsBAqmoOjvLFlXHs1GWKQF5oLEpD/+3FdSzvz7MA3f8J446a6+A8O6sDd9KU+qW61KfVhm2ORODxwmk/GlQLUWK0QZyu/NRC0jh9nOjTMUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1664.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 13:28:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 13:28:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 2/4] objtool: Enable objtool to run only on files with
 ftrace enabled
Thread-Topic: [RFC PATCH 2/4] objtool: Enable objtool to run only on files
 with ftrace enabled
Thread-Index: AQHYbs5kDECg5GS16kaacJPiXFfVO60tuxeAgAAgbICAACs0gA==
Date: Tue, 24 May 2022 13:28:34 +0000
Message-ID: <ce4d2b3c-5cd9-d33a-648c-7f294e9eb94f@csgroup.eu>
References: <20220523175548.922671-1-sv@linux.ibm.com>
 <20220523175548.922671-3-sv@linux.ibm.com>
 <89012c4c-e989-6092-d4f1-0dc4eca983f1@csgroup.eu>
 <d28a9bf0-65ac-797c-3640-8af7e0beec33@linux.vnet.ibm.com>
In-Reply-To: <d28a9bf0-65ac-797c-3640-8af7e0beec33@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 245c6ff2-a865-4bf3-4899-08da3d894d4d
x-ms-traffictypediagnostic: PR1P264MB1664:EE_
x-microsoft-antispam-prvs: <PR1P264MB1664BC09D85C481F8F07FAD7EDD79@PR1P264MB1664.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iZfSHLL6ch6r+Wuwt3DcxhTlmD2UQqLtrONMBZHonrvKwiDeu9TeT6tI3mzmF3Remau4zZpPuRRySdRyLGxpEQxHPWoxmhSqcWdSDw3yJEU56SItb9gUbDbpPDQsAp/6rHzVAGO0ic0+EHmLQtr2cXE10ztTfS8gS58butq+9hKnH24WJQviNHeZraQMkFViLeQCqmA94LLsx3bdOPCR4Y7fXbCxMGQqtb9ztIDqYfa+Xt3Y1wGFgvGDumoRhA8a0cS09Tw/xmzK0FlPTFwx/fSKsapTUs8rskZQuZtlzWD/u8AI3ZOFUMywKUPY5h06EOUBlhyefP60uj7KsmMeL//zJeo0Rddo2IYEaclxuEiLbzQrDeKfbNfjnJ74DwFilhXTA5wFxAy5vhF5Y9/dBI2/1qnjAo6z3aYGzk6GaGNQOh9hvm3xvJc6BJ2tzRnqGYhRSTXkoWbE/AUi24kwOQ0LpuSCvNw7PpD7Vkz7xs+cpAWNNaiA2RCiHjifwVkWNOGe/O9ZWrJwQ66SGALh+QU2bkiD/8a/tDObRv5B4r1cWkL2eqCWlxlt4Ne9/iFrRHw5xMyvFvmRSBpgz6aHVWP9ZC6h+t8K4UahEl+YD5TBtCymbJI5mPja02za0I/eGrDkOSvSPfPV83IewmLcEB3VZOivmoJKBtjZ++cVDllFXakjMYy3h09zdNPzs/Mp3uMp7WZPj7U/DJiYtw8seAiw7cSKUP0PSAOrQd+c+7OYgliqwSXtB+tCXJJZZM93huRzsKtshB0UGZ/GWNzezAmLTLovtqqfcMmwFSbBuy3nHXfSNXTKtLc+j4sdpKd+NpvU2CzubvIUpXR0XCcv/J9Ijig+6BzP89/rzR6sIk4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(71200400001)(66446008)(64756008)(26005)(36756003)(122000001)(66556008)(83380400001)(66476007)(4326008)(76116006)(8676002)(5660300002)(6512007)(91956017)(38070700005)(38100700002)(2616005)(316002)(110136005)(31686004)(966005)(6486002)(54906003)(86362001)(8936002)(6506007)(508600001)(66574015)(186003)(2906002)(7416002)(44832011)(53546011)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXR6ejQ3d3EvYjhNKzhyUTBMWTFTUXZ3VWtPVHMzdnBwUXlmdHpHNU9YNDBw?=
 =?utf-8?B?OTF4N3loOHhNajlYZm0ycStNU1QwSWFiS2xiTEtmQXdZRkcvU2FYTnl1WkFX?=
 =?utf-8?B?ZWRhK3Jic05pb1lncUlXL3NKWFdDVTRKR253a09vaHVRQlJ4ZVJhS0tSdDRW?=
 =?utf-8?B?VldwUFJZR04vS3BXR2UyMi8wMzM1RHdSVjIxTkRkSGhjTlYyUkl6MXZ0YzF1?=
 =?utf-8?B?dHN6c0Jud3c1L21XWmlVWm4xcitmd0U0alNEK1VhSHQ5MFpJTkp2Zm42RDA0?=
 =?utf-8?B?aXVBblBlRlcyRUJiRzZCaFNXT3hLVmFjc0cyblI4SUw5VUZVMHlzV0VxamF4?=
 =?utf-8?B?WlZETkcyMmxicitsS2xhK3dpT0dKVjV2dC9FcnZjUnI4aFpKbUpubmlKMm4w?=
 =?utf-8?B?VDYrMDE3OXVNMTZaQndDUThLWEFGM1BYa1lKVmcvM0k5ajlWSTMzUDNkdnFH?=
 =?utf-8?B?SDAveEp4MXUvbEY0N1A5dEpMN0UwVmJlZDBsMGJBOHpxSkJvK1BQOWhyb013?=
 =?utf-8?B?ZXg5cWMwMEZDZE5KMmFQWStFdkNvWk1XVWU2SjFsN3pOajJlMzVUcnpQN1hM?=
 =?utf-8?B?QXQrMnJFc2o1bVh1MXZoZjM1cGJkZVU4NWF0Tmo1bHBjMXgrTi80ZG1vTDJ2?=
 =?utf-8?B?Y2Z4bGRhTmZxYWN3TWFRU3Rqd1hZTGZ4dW5zT1pZVjR0MDlkbUpvcEIxblFL?=
 =?utf-8?B?VHJYRkZTTWwwdHhZZXZyRHNGRGdKV3FuOWduaHEvWkR6WGlKYkF0TGRlMVpG?=
 =?utf-8?B?ay9ORkFoUEF3dko3ejZXc1BWekg3Vzh4Z2RqTjhDVzlPanVlRG1nZSs5U2hB?=
 =?utf-8?B?WThVM0s4Q09rTW5KYXhaVTJqZmtFQlhsQ3RISkRrVkNHR05GVmRKMlpWWVR0?=
 =?utf-8?B?SHdGcTVJQmY3UXAxT2NmNmpQMTc5c21TWDhqVjlEai95TVpsRS8xaWp3b0Ft?=
 =?utf-8?B?YWJkOUVQaEYya2FKUGU0d0IwTFJHZW1UU3hCYU1SM2dZaTFDcVI5WDBYMDhv?=
 =?utf-8?B?VUR0T3owNWFzRkdBYk1KNDBjZjVlRnQ4NVdoeXRsM1l0dm5JYmpFT1Ftckk1?=
 =?utf-8?B?eFNNODVNM1RjVnJrRzJnWjhRVG1xYWR4bUsxbkNUV1JTTnpkR1RLZUNQZjQ3?=
 =?utf-8?B?b1piaitZNHhnWnNPMW9PaWlISUZNV0NqVlJhaTUwTCt2OTRobWlzYUpJckRC?=
 =?utf-8?B?cUdCTC9SaGZZTHdjekVjSjg3ZGxHazdXa1BuM1cwZWc4Q0dIQzZoaDFwaURZ?=
 =?utf-8?B?SmFkMzk3SEY5ekRGWWh2bXlvVmVGQjdqRDk4NHFzbnE0VTZVanFOZWlLRXBD?=
 =?utf-8?B?c1BqSXNHdXVIcVN6di9yb1VnQU1SUnZlb2Q5WG5LdUdIMDRCUVhEUVNvVjl1?=
 =?utf-8?B?dzRvVHE2clprbmhQam9hZGpNM0RZK1R2MzcrdVFkNGNrRjEzUmt1ZG9objFz?=
 =?utf-8?B?Z3FQcy9pbXRtV1I3bVdnQzFCN3Rrc1lZT1VQakJvL0FVcDJIQXgra1ZjN3po?=
 =?utf-8?B?WWxabDJ3S3ZuNGsxWGtPNmsrQUg3MW1weHljRndIK1kxWm5mRjhLckpXU2dj?=
 =?utf-8?B?alhpaS8wYUFBWDBwem41L1BjTmd5aDJiL3V4eEp1MGx5TTgrcXdHR2xqYVhL?=
 =?utf-8?B?VFlqc05CK29DeFpZVk12VlVuTzA0TU5zOU43MHZXa0EzY1hocFVJcXV2ZVcw?=
 =?utf-8?B?VE9JcHMxRUhNZFlUOVU1cG01UnB4ZzBWL2U3UTlQZGhJUm5KRm9yS2dyYlRy?=
 =?utf-8?B?Zk5zN3JvV3RGUDFINmVOZkZoK0JuWGl0OEd1RDQ5WHRiNWRhTEx3WFFtR285?=
 =?utf-8?B?RXlzRkZHSVNROUkxY2dDYWg5SnlpVVE4aHNWbmNYcG1FRW12TUNhYmtZWU54?=
 =?utf-8?B?UlhmQXFFeExaY21CMDRhdW5yMk94UmRYWHo2TEVvTW9TMERLQWRKOG9mMk9X?=
 =?utf-8?B?T2VybUJLaWdRYkxrcVBCK09QeEQzQU5mVHpVbGRCVW5qK04xbmZ5aXdQSERi?=
 =?utf-8?B?dnpNalVuWGV3ekZUdlJ6SEZuNktkNTlQVlk5a0NTb1A3bmNPNkpRS0F1QVhw?=
 =?utf-8?B?cTJiSVhHOGw3ZkdxT1F1SVZwL3E5SkJZSHNRN0FiZHoxSnh2T1pBbis1WktY?=
 =?utf-8?B?dmJZc0VyRmZOT2N5QmdMV2Z1MFlncytsS3NYWVQ0VTgwZFQyNlRoRjRBSWgv?=
 =?utf-8?B?aFhHK2toenorTWYzb2k0MjE1NStOVS9aa0tEeS80ZExraWg3NGtEZU1qVkUz?=
 =?utf-8?B?MUNFUTlWRVIwazhWQkgzRys3bTFDa1Jvb3NaQmNRQXh3dHhPS3dkQk5qb0dQ?=
 =?utf-8?B?elV3MGdYV0pmWUdGSk42aGNqbWRRRUJab3UzenBEUGt5dTRDVVh0MTNZcWFR?=
 =?utf-8?Q?39ZZqNtogpUYSP+Ajp48Fc48mkndggJvSzaTq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EB17579976E1B489494DED33B913012@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 245c6ff2-a865-4bf3-4899-08da3d894d4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 13:28:34.2914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +KwB2xNbLvsuVPATrNqHjUGijOoOc0DXEtgQEcV37P8mWMk1m/V+pN2PEH3/TVutkVcwGPMkL8XzD+kkNbO4M4lmk/tqxyqoe8AyACOcEXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1664
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
Cc: "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "mbenes@suse.cz" <mbenes@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgU2F0aHZpa2ENCg0KTGUgMjQvMDUvMjAyMiDDoCAxMjo1MywgU2F0aHZpa2EgVmFzaXJlZGR5
IGEgw6ljcml0wqA6DQo+IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJz
IGRlIGxhIHBhcnQgZGUgDQo+IHN2QGxpbnV4LnZuZXQuaWJtLmNvbS4gRMOpY291dnJleiBwb3Vy
cXVvaSBjZWxhIHBldXQgw6p0cmUgaW1wb3J0YW50IMOgIA0KPiBs4oCZYWRyZXNzZSBodHRwczov
L2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24uXQ0KPiANCj4gSGkgQ2hyaXN0
b3BoZSwNCj4gDQo+IE9uIDI0LzA1LzIyIDE0OjI3LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0K
Pj4NCj4+IExlIDIzLzA1LzIwMjIgw6AgMTk6NTUsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3Jp
dCA6DQo+Pj4gVGhpcyBwYXRjaCBtYWtlcyBzdXJlIG9ianRvb2wgcnVucyBvbmx5IG9uIHRoZSBv
YmplY3QgZmlsZXMNCj4+PiB0aGF0IGhhdmUgZnRyYWNlIGVuYWJsZWQsIGluc3RlYWQgb2YgcnVu
bmluZyBvbiBhbGwgdGhlIG9iamVjdA0KPj4+IGZpbGVzLg0KPj4gV2h5IGRvIHRoYXQgPw0KPiBU
aGlzIHdhcyBkb25lIHRvIGFkZHJlc3MgdGhlIGlzc3VlIGRpc2N1c3NlZCBoZXJlOg0KPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvYjA2YmI5YmMtMjJkMS1hY2NlLWZlNjgtYzdjNGNiN2Mx
NWI1QGNzZ3JvdXAuZXUvIA0KDQpBaCA/IE9rLg0KDQpCdXQgaG93IGRvZXMgeDg2IGRvIGl0IGF0
IHRoZSBtb21lbnQgPyBTaG91bGRuJ3Qgd2UgdXNlIA0KT0JKRUNUX0ZJTEVTX05PTl9TVEFOREFS
RCBpbnN0ZWFkID8NCg0KDQo+IA0KPiANCj4+DQo+PiBXaGF0IGFib3V0IHN0YXRpY19jYWxscyA/
IFRoZXJlIG1heSBiZSBmaWxlcyB3aXRob3V0IGZ0cmFjZSBidXQgd2l0aA0KPj4gc3RhdGljIGNh
bGxzLg0KPiBZZXMsIHRoaXMgcHJldmVudHMgb2JqdG9vbCBmcm9tIHJ1bm5pbmcgb24gdGhvc2Ug
ZmlsZXMuIFdlIGNhbg0KPiByZXN0cmljdCB0aGlzIGNoYW5nZSB0byBGVFJBQ0VfTUNPVU5UX1VT
RV9PQkpUT09MDQo+Pg0KPj4gQnkgdGhlIHdheSwgaXQgd291bGQgYmUgbmljZSBpZiB3ZSBjb3Vs
ZCB1c2UgaXQgb25seSBvbiBDIGZpbGVzLg0KPj4gSSBnZXQgdGhlIGZvbGxvd2luZyBlcnJvcnMg
Zm9yIEFTTSBmaWxlczoNCj4+DQo+PiBhcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5XzMyLm86IHdh
cm5pbmc6IG9ianRvb2w6IC50ZXh0KzB4MWI0Og0KPj4gdW5hbm5vdGF0ZWQgaW50cmEtZnVuY3Rp
b24gY2FsbA0KPiANCj4gSSdtIGxvb2tpbmcgaW50byB3YXlzIHRvIGFkZHJlc3MgdGhpcy4NCj4g
DQoNCk5pY2UuDQoNCkNocmlzdG9waGU=
