Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3305EBAD5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 08:41:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc94f1GTQz3c7g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 16:41:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LbqXFSm8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.52; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LbqXFSm8;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90052.outbound.protection.outlook.com [40.107.9.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc93t56Ytz2yQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 16:40:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIbpKrNJcrDV8Qot6mJxaFBPObhJUmn6avIxvmv8vkg691TkBVUKWiAAdLiHMbGDV36NxOH5Z7/5FIK0uTToFJl8CHNJHbdBBN1kupvJh2fOYmiuAi/SB1R1dThMqCXrRONAcZl4QqNuA2fIWCs2sVoUJ8c3zW2W8OPRJP4HtREu8suC5/WWsiEybTgxSrX/87XNt9xL0TvoJmamaTj2yj5GhmCSPYKEMyNV3H+DKdyFLULevHjAzGTHgwS6mkf5M18s7I0XijG7UcgdVdy/7EJYbQKINOBL7gA8Or4ojaHbOTJWU0LA8tLCVZ8djHBdgmaJlRVS12V54T0cB1PBXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bj1c3Vt10fceUhzNIpNWvxJgnyUZGYgsRHTfOSgJNNE=;
 b=i8ebucX071KVvG7vI3Pzfsjr08LgFN+b51Wc0HoiHqoPJ4lmEj3gK5tvxzi6VuWY+E5pyd0s/dM7DoKoEjUFFKoI2Dwf7jwm/q4SCOVasTUbDG3lBYKwSK4fYH05HNBeoard1AieHwMAJmcjYRACzKbAFKVm1ONPWt12uItm8qmsw4cV41QDLDNlk5Dh9tEeotxmzkd2f/uE3WMCg51y9Ds8tCR0U+q4GKB8bkHoAOcoG6BTjt9Z15Id9kYZWgd09Ta6xjQAFbaLZDL1Y+wteBPxshjt8V8TJcufGm9I9np9AuGpWAHjoZTxSJwVYanK2SqkSWIK1T0/jUXriiBrrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bj1c3Vt10fceUhzNIpNWvxJgnyUZGYgsRHTfOSgJNNE=;
 b=LbqXFSm8majSf8BVJLAqAD3g/4KJ8wvWA1knnl7I6f5ZEnoCSpshq8XIMZLITq7bXJENUDUuvM0QQxQAqbFgkknCnO8QvVMp6MA212IrFutP4PWNMQ2DFBplwLpw9V0utU1Esbz+kFd+4P7zZ1p/cghnJjPQS5oBNEDDlTv6VA5EU/L2fdHpeled7QVssB/S7G2JFndvV5aIQSXwxI1ULbTgFYr1fHmFZOnB0FC8aDGcEThsZaQZOA8TIAWr9SDUsD5pOxTa74uIirOKgRmpfUSRg95XMm5rUk8ekxLQNFlN/0K1Cj91RsK4kq0RjKe8oZDWrgqyC4/kGk9UmYh6Sg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3094.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Tue, 27 Sep
 2022 06:40:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 06:40:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 1/6] powerpc/code-patching: Implement generic text
 patching function
Thread-Topic: [PATCH v2 1/6] powerpc/code-patching: Implement generic text
 patching function
Thread-Index: AQHY0XNe2Qn934FUS0iRuJQMSwM8K63y1Q2A
Date: Tue, 27 Sep 2022 06:40:06 +0000
Message-ID: <7c06a079-4189-e09f-939e-f672e7ff1ab1@csgroup.eu>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
 <20220926064316.765967-2-bgray@linux.ibm.com>
In-Reply-To: <20220926064316.765967-2-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3094:EE_
x-ms-office365-filtering-correlation-id: 5ec4ed3b-6d2b-429b-41a6-08daa0531d5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZdqWFrZTYux+2bTLN3AGagfZ5YZvWyexjOF8esWthgQrdkLAVlZJ80HxRipf2JrT64zrFYKrQ1LFItgHEOJV0xm+lth/T+epoGuYodw5d7G+B1bYv2/+rkvBoy2BQR8yrJrhK87F+lKK5N76kdHRV3Z3Usr+Eed0/KeI6SyKSBRLInNVs4YfNHKMO+qmjBIK2NhLfOgwDMufv1Du8RClasm92E7TOL2RqXJe/Vwg3HfHSseAntq/Kcj7Cb2tYS81l5UFN/bFyeAE57sk4k1Eas/jatGJu7dmpWKKAs1tCGnY2rvyFLejlRtEU37P7RGtL1E8nCVSHSg3juuO+TuWv1CTC7MV7xba5MFgYaM+u6YvId4SFBKXj6YWk5u0FwaHlXxZkBznZNPuN+tOBZcSEdklkHTDhVmxCQKnVjNiNc7AE9SpjXGAooDM2eumvhCFhE+I+xT0MMOiK7ZIteUsA51lNGJ0ubVP22CmjOmAGVS6XoCNAm0Y+6vkDlH+OgT7A75k0iYZ6qsFdljeBOAvqkPdRWYPCppzV18wE9G44MZhjRICxpZ+P8niONE64NopdoOyI7f6RqGHb21y/g8EkliguUVqjNJC5mr6//c4rvSjdaCm5Wzm0bjTEQNbKDqSVxzH3L0bEUHD4+104UstWhoJIsMnxlsFB9A36cwSOxPw/ToeaFiDvYH/yJAmnOPPME6RihJNrTvcj5c584dCrkw3oyuAw6pkm21NoZt15lAqqnwmfySxr4Rensp0QQy377XeXXwzJDLj/lGwMbWwNlssoOVua3EKuji2SUh4hv5ETPnSSqMPLtRkMp8MGdU5ypsI1VWbtHQbkR3z11o6/jcDwY0diaSMKQCeFpNuncw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199015)(478600001)(8936002)(31696002)(66574015)(86362001)(36756003)(7416002)(5660300002)(2616005)(6486002)(6512007)(26005)(2906002)(44832011)(186003)(6506007)(316002)(91956017)(83380400001)(54906003)(110136005)(76116006)(71200400001)(38070700005)(66446008)(66946007)(66556008)(64756008)(8676002)(4326008)(66476007)(41300700001)(38100700002)(122000001)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UEUrcWc5ajZhbklxY1hMVVF3TlYvSUNBcUcxTDdzSDBxYUF6aDd5Vkdxdmwz?=
 =?utf-8?B?VEtPT1l2Ui9HU1hjKy84V080U3oyL0FVMFlVbUIvU3MrVGlzVEt2VHNLRTdK?=
 =?utf-8?B?SVY1Mm51Q1FwVE5PMEliT0FGeGpBWVFkWWlkWnIrT0xOb0lkdUJwR2lkNTRk?=
 =?utf-8?B?bXlMcDcvT29WWlM1dEkzTW1RVlJuN2w1bSsxdkplaUNOUTFEaUh1aGtKa2tI?=
 =?utf-8?B?SFdCZ0FUd1J1Q0pUeWhwNDhLMFNFNmtNQ3drT2VNMnBPWWZLb1JmVC9jbjMw?=
 =?utf-8?B?cUphVDI4dWdTbUNDaFNWVEVTTTZrQ3I3a0dGcExiWk40VnkvWnBWRzJEZTYr?=
 =?utf-8?B?bWk4WDJiU0xHZ1RFdWJRdnJXM2N0RENYT1IwVmE3L3F1dThiVmxiZDVBN3ky?=
 =?utf-8?B?QWNuQ1pRYXNvUUp6bE5TVjVxYTl2Wms3M1dHNUtSM2Z0cnoySHZYOE5IRWVh?=
 =?utf-8?B?WWNPOUdXTUl6QTMvSzdJd2NJVlo5S25yZ2hLNGZwN1o1b2R6OXdMdy8wNXB6?=
 =?utf-8?B?QWQwbXp6QXJXT0ExWnFzcm9qcjFCTithSVovaGRFUlJsSG1lTEV6cEZsWk1r?=
 =?utf-8?B?ZUVSNXVhOGtVV1lueWVJUkVWU2FsQ29oZjhGL2VtVXd4MXdPMndaMnZPSTRr?=
 =?utf-8?B?dFlMeTN6VU9DYldDbzNmTU9ULzFJZTNkVDVKeGZFV0Q3Z1RYZmJnaEQzQW1S?=
 =?utf-8?B?d1dZUlRBZ0VnaWpOSUZtT3pVOXF1V3E0V2R3UFJ1UVNxMXdCZ3VrNzlKVGIz?=
 =?utf-8?B?NXFqbG02K0FZd2VyNUxWWEF3eWFzcW9nVVAxaUx4UU9laW1VbXJQRWpPRUxQ?=
 =?utf-8?B?UjhrTkVWSjUrWlpTY0xKaDRqanRvaVI5b1BNcVcxNWtkak10Rjh0Y2wrSFdJ?=
 =?utf-8?B?VFdZN0JJNTZLT2hEWVY4U3B3anNmTGFpSlVkcm56RDBXZnVwK0ZveXFKWmJP?=
 =?utf-8?B?SURRbkhzeGdwU2Q2TGs0bE8xV2xuQjc5ckJMRkdCQWdqOWM2U1dKY1pKYkow?=
 =?utf-8?B?bGlaRDVRWmQ5NWhaYUNvR0xVcWJtV0YwU3NpQWdiZGhrN3pSdGtRa2ZPOVBh?=
 =?utf-8?B?VmVvejNwYkRLUDdjZmJTMVk0Y2FlampRWm9HclRXUGt6eWJjQjhlWW9oa2xi?=
 =?utf-8?B?b2FKQ3U5eFhiK0YzQm5FZkY4Z3pvVDdJRVE2Yk1adWZrQ2s3bjhPV1VDTElI?=
 =?utf-8?B?WEtIRnBFRCt0Z3RScWRrbnRLTzJvbkZWUkZGVjQ3V2xPQnQvMkhkVUtZTW5I?=
 =?utf-8?B?SE1yME5BTHJGV1Bha1NHRXZBMGd2YmgzODVNbTYvTC82WVlzM25KNjJYVUxM?=
 =?utf-8?B?dW11MFlRREI5eVhUMkxRcDVGTkpja1ZpdTVEVWpDdHdNbnFuc0RhSm9SUE0y?=
 =?utf-8?B?Z0x6dWY2ZE9neFZGTjByOWYyWWErZkpmWEJFcHBsdmg3WWRxdWxrczVEYUlj?=
 =?utf-8?B?eitqYUROZmhXNE9zLy9zRTdrNXdtdFMxd3phczJpY3QwUGpVK003Ullzdyt6?=
 =?utf-8?B?UUJNRmNMcWQwVGJVc01sYmdGem5YMXQwU3VWQVpqYS9hR1YweU9ibmVlcmwx?=
 =?utf-8?B?VURia2FHejNtRU9RbVgwcjFhN3NSd2ZzODkrYmpXYlVUV2N3bVRUWnBGRlFQ?=
 =?utf-8?B?N0RVYjdXY0lrUFhVSVNCbnFzR2JCOE9BS3BiWmNUTlZoY1RNWElGbDBZMS93?=
 =?utf-8?B?RkluYnBRN3I1SUFWQmQ1TTBvc1VWOUNwS3NHNFZLak9OZ1l3ZmFSWWxDbWJ3?=
 =?utf-8?B?SGxobXliME9kdnNwTjZhUUMzYlNPVkp3eXhLVGNtVkRsazE2VjJKUGRtNXBj?=
 =?utf-8?B?MEc4OC9RazMrZmkrU3pVOEZncEdINWd0Ty96OUZYUEVHTEw4b1JobFhPUUpB?=
 =?utf-8?B?RVBvWG10RlBGdXJEaGNHd0JMYnJtTDZyUmQ1bkZHMVNMQ0x2bGY5d0wwMXhS?=
 =?utf-8?B?N0syVkFPektXdm1maElFY201V0kwMFlCbEF6dTlvaDlLNlNLNlNRbHg5bENF?=
 =?utf-8?B?RTgyMjV4QWI2WlZLU0QyejBaS2NCMTk0T2YyVEtiQTZlVDZKY243M1pUY0tG?=
 =?utf-8?B?QXNGVnltMHFmS2JjV0xocG9ZNTl0NmowbzFqbDBMdkNoVzU2WXJCWUUrNWcy?=
 =?utf-8?B?UE1CRUgrdmpFc1BHYmJyZk04QjRJcXpJdUN2WFh5a3BFallZYUsvanlYM3RK?=
 =?utf-8?Q?5vmFOQyNtEGoyWsuHdw0054=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FA834874EB0DD41A47D89E92E0B2182@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec4ed3b-6d2b-429b-41a6-08daa0531d5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 06:40:06.1324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZasgRvJ9DQww/AEqVwv5a3yycyRPW6/xEIxp7XPioeZLelBksqINxC8LQdlLLzpixFq0XpHmznHK5y5H0SdrgERumgsJYC+j9FJqap/0qqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3094
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzA5LzIwMjIgw6AgMDg6NDMsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
QWRkcyBhIGdlbmVyaWMgdGV4dCBwYXRjaGluZyBtZWNoYW5pc20gZm9yIHBhdGNoZXMgb2YgMSwg
MiwgNCwgb3IgKDY0LWJpdCkgOA0KPiBieXRlcy4gVGhlIHBhdGNoZXIgY29uZGl0aW9uYWxseSBz
eW5jcyB0aGUgaWNhY2hlIGRlcGVuZGluZyBvbiBpZg0KPiB0aGUgY29udGVudCB3aWxsIGJlIGV4
ZWN1dGVkIChhcyBvcHBvc2VkIHRvLCBlLmcuLCByZWFkLW9ubHkgZGF0YSkuDQo+IA0KPiBUaGUg
YHBhdGNoX2luc3RydWN0aW9uYCBmdW5jdGlvbiBpcyByZWltcGxlbWVudGVkIGluIHRlcm1zIG9m
IHRoaXMNCj4gbW9yZSBnZW5lcmljIGZ1bmN0aW9uLiBUaGlzIGdlbmVyaWMgaW1wbGVtZW50YXRp
b24gYWxsb3dzIHBhdGNoaW5nIG9mDQo+IGFyYml0cmFyeSA2NC1iaXQgZGF0YSwgd2hlcmVhcyB0
aGUgb3JpZ2luYWwgYHBhdGNoX2luc3RydWN0aW9uYCBkZWNpZGVkDQo+IHRoZSBzaXplIGJhc2Vk
IG9uIHRoZSAnaW5zdHJ1Y3Rpb24nIG9wY29kZSwgc28gd2FzIG5vdCBzdWl0YWJsZSBmb3INCj4g
YXJiaXRyYXJ5IGRhdGEuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHcmF5IDxiZ3Jh
eUBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vY29k
ZS1wYXRjaGluZy5oIHwgIDcgKysNCj4gICBhcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcu
YyAgICAgICAgIHwgOTAgKysrKysrKysrKysrKysrKystLS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFu
Z2VkLCA3MSBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vY29kZS1wYXRjaGluZy5oIGIvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL2NvZGUtcGF0Y2hpbmcuaA0KPiBpbmRleCAxYzYzMTZlYzRiNzQuLjE1ZWZk
OGFiMjJkYSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NvZGUtcGF0
Y2hpbmcuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vY29kZS1wYXRjaGluZy5o
DQo+IEBAIC03Niw2ICs3NiwxMyBAQCBpbnQgY3JlYXRlX2NvbmRfYnJhbmNoKHBwY19pbnN0X3Qg
Kmluc3RyLCBjb25zdCB1MzIgKmFkZHIsDQo+ICAgaW50IHBhdGNoX2JyYW5jaCh1MzIgKmFkZHIs
IHVuc2lnbmVkIGxvbmcgdGFyZ2V0LCBpbnQgZmxhZ3MpOw0KPiAgIGludCBwYXRjaF9pbnN0cnVj
dGlvbih1MzIgKmFkZHIsIHBwY19pbnN0X3QgaW5zdHIpOw0KPiAgIGludCByYXdfcGF0Y2hfaW5z
dHJ1Y3Rpb24odTMyICphZGRyLCBwcGNfaW5zdF90IGluc3RyKTsNCj4gK2ludCBfX3BhdGNoX21l
bW9yeSh2b2lkICpkZXN0LCB1bnNpZ25lZCBsb25nIHNyYywgc2l6ZV90IHNpemUpOw0KPiArDQo+
ICsjZGVmaW5lIHBhdGNoX21lbW9yeShhZGRyLCB2YWwpIFwNCj4gKyh7IFwNCj4gKwlCVUlMRF9C
VUdfT04oIV9fbmF0aXZlX3dvcmQodmFsKSk7IFwNCj4gKwlfX3BhdGNoX21lbW9yeShhZGRyLCAo
dW5zaWduZWQgbG9uZykgdmFsLCBzaXplb2YodmFsKSk7IFwNCj4gK30pDQo+IA0KPiAgIHN0YXRp
YyBpbmxpbmUgdW5zaWduZWQgbG9uZyBwYXRjaF9zaXRlX2FkZHIoczMyICpzaXRlKQ0KPiAgIHsN
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jIGIvYXJjaC9w
b3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCj4gaW5kZXggYWQwY2YzMTA4ZGQwLi45OTc5Mzgw
ZDU1ZWYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQo+IEBAIC0xNSwyMCArMTUs
NDcgQEANCj4gICAjaW5jbHVkZSA8YXNtL2NvZGUtcGF0Y2hpbmcuaD4NCj4gICAjaW5jbHVkZSA8
YXNtL2luc3QuaD4NCj4gDQo+IC1zdGF0aWMgaW50IF9fcGF0Y2hfaW5zdHJ1Y3Rpb24odTMyICpl
eGVjX2FkZHIsIHBwY19pbnN0X3QgaW5zdHIsIHUzMiAqcGF0Y2hfYWRkcikNCj4gK3N0YXRpYyBp
bnQgX19hbHdheXNfaW5saW5lIF9fX3BhdGNoX21lbW9yeSh2b2lkICpwYXRjaF9hZGRyLA0KPiAr
CQkJCQkgICB1bnNpZ25lZCBsb25nIGRhdGEsDQo+ICsJCQkJCSAgIHZvaWQgKnByb2dfYWRkciwN
Cj4gKwkJCQkJICAgc2l6ZV90IHNpemUpDQoNCkNvdWxkIHlvdSByZWR1Y2UgdGhlIG51bWJlciBv
ZiBsaW5lcyA/DQoNCkZvciBpbnN0YW5jZToNCg0Kc3RhdGljIGludCBfX2Fsd2F5c19pbmxpbmUN
Cl9fX3BhdGNoX21lbW9yeSh2b2lkICpwYXRjaF9hZGRyLCB1bnNpZ25lZCBsb25nIGRhdGEsIHZv
aWQgKnByb2dfYWRkciwgDQpzaXplX3Qgc2l6ZSkNCg0KDQpBbHNvLCAzIHVuZGVyc2NvZGVzIHN0
YXJ0cyB0byBiZSBhIGxvdCB0b28gbXVjaCwgY2FuIHdlIGJlIGEgYml0IG1vcmUgDQpjcmVhdGl2
ZSBvbiB0aGUgZnVuY3Rpb24gbmFtZSA/DQoNCj4gICB7DQo+IC0JaWYgKCFwcGNfaW5zdF9wcmVm
aXhlZChpbnN0cikpIHsNCj4gLQkJdTMyIHZhbCA9IHBwY19pbnN0X3ZhbChpbnN0cik7DQo+ICsJ
c3dpdGNoIChzaXplKSB7DQo+ICsJY2FzZSAxOg0KPiArCQlfX3B1dF9rZXJuZWxfbm9mYXVsdChw
YXRjaF9hZGRyLCAmZGF0YSwgdTgsIGZhaWxlZCk7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgMjoN
Cj4gKwkJX19wdXRfa2VybmVsX25vZmF1bHQocGF0Y2hfYWRkciwgJmRhdGEsIHUxNiwgZmFpbGVk
KTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSA0Og0KPiArCQlfX3B1dF9rZXJuZWxfbm9mYXVsdChw
YXRjaF9hZGRyLCAmZGF0YSwgdTMyLCBmYWlsZWQpOw0KPiArCQlicmVhazsNCj4gKyNpZmRlZiBD
T05GSUdfUFBDNjQNCj4gKwljYXNlIDg6DQo+ICsJCV9fcHV0X2tlcm5lbF9ub2ZhdWx0KHBhdGNo
X2FkZHIsICZkYXRhLCB1NjQsIGZhaWxlZCk7DQo+ICsJCWJyZWFrOw0KPiArI2VuZGlmDQo+ICsJ
ZGVmYXVsdDoNCj4gKwkJdW5yZWFjaGFibGUoKTsNCj4gKwl9DQo+IA0KPiAtCQlfX3B1dF9rZXJu
ZWxfbm9mYXVsdChwYXRjaF9hZGRyLCAmdmFsLCB1MzIsIGZhaWxlZCk7DQo+IC0JfSBlbHNlIHsN
Cj4gLQkJdTY0IHZhbCA9IHBwY19pbnN0X2FzX3Vsb25nKGluc3RyKTsNCj4gKwlkY2JzdChwYXRj
aF9hZGRyKTsNCj4gKwlkY2JzdChwYXRjaF9hZGRyICsgc2l6ZSAtIDEpOyAvKiBMYXN0IGJ5dGUg
b2YgZGF0YSBtYXkgY3Jvc3MgYSBjYWNoZWxpbmUgKi8NCj4gDQo+IC0JCV9fcHV0X2tlcm5lbF9u
b2ZhdWx0KHBhdGNoX2FkZHIsICZ2YWwsIHU2NCwgZmFpbGVkKTsNCj4gLQl9DQo+ICsJbWIoKTsg
Lyogc3luYyAqLw0KPiArDQo+ICsJLyogRmx1c2ggb24gdGhlIEVBIHRoYXQgbWF5IGJlIGV4ZWN1
dGVkIGluIGNhc2Ugb2YgYSBub24tY29oZXJlbnQgaWNhY2hlICovDQo+ICsJaWNiaShwcm9nX2Fk
ZHIpOw0KDQpwcm9nX2FkZHIgaXMgYSBtaXNsZWFkaW5nIG5hbWUgPyBJcyB0aGF0IHRoZSBhZGRy
ZXNzIGF0IHdoaWNoIHlvdSANCnByb2dyYW0gaXQgPyBJcyB0aGF0IHRoZSBhZGRyZXNzIHRoZSBw
cm9ncmFtcyBydW5zIGF0ID8NCg0KZXhlY19hZGRyIHdhcyBhIGxvdCBtb3JlIGV4cGxpY2l0IGFz
IGl0IGNsZWFybHkgZGVmaW5lcyB0aGUgYWRkcmVzcyBhdCANCndoaWNoIHRoZSBjb2RlIGlzIGV4
ZWN1dGVkLg0KDQo+ICsNCj4gKwkvKiBBbHNvIGZsdXNoIHRoZSBsYXN0IGJ5dGUgb2YgdGhlIGlu
c3RydWN0aW9uIGlmIGl0IG1heSBiZSBhDQo+ICsJICogcHJlZml4ZWQgaW5zdHJ1Y3Rpb24gYW5k
IHdlIGFyZW4ndCBhc3N1bWluZyBtaW5pbXVtIDY0LWJ5dGUNCj4gKwkgKiBjYWNoZWxpbmUgc2l6
ZXMNCj4gKwkgKi8NCj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfUFBDNjQpICYmIEwxX0NBQ0hF
X0JZVEVTIDwgNjQpDQo+ICsJCWljYmkocHJvZ19hZGRyICsgc2l6ZSAtIDEpOw0KDQpUaGlzIGRv
ZXNuJ3QgZXhpc3QgdG9kYXkuDQoNCkknZCByYXRoZXIgaGF2ZToNCg0KCUJVSUxEX0JVR19PTihJ
U19FTkFCTEVEKENPTkZJR19QUEM2NCkgJiYgTDFfQ0FDSEVfQllURVMgPCA2NCk7DQoNCj4gDQo+
IC0JYXNtICgiZGNic3QgMCwgJTA7IHN5bmM7IGljYmkgMCwlMTsgc3luYzsgaXN5bmMiIDo6ICJy
IiAocGF0Y2hfYWRkciksDQo+IC0JCQkJCQkJICAgICJyIiAoZXhlY19hZGRyKSk7DQo+ICsJbWIo
KTsgLyogc3luYyAqLw0KPiArCWlzeW5jKCk7DQo+IA0KPiAgIAlyZXR1cm4gMDsNCj4gDQo+IEBA
IC0zOCw3ICs2NSwxMCBAQCBzdGF0aWMgaW50IF9fcGF0Y2hfaW5zdHJ1Y3Rpb24odTMyICpleGVj
X2FkZHIsIHBwY19pbnN0X3QgaW5zdHIsIHUzMiAqcGF0Y2hfYWRkcg0KPiANCj4gICBpbnQgcmF3
X3BhdGNoX2luc3RydWN0aW9uKHUzMiAqYWRkciwgcHBjX2luc3RfdCBpbnN0cikNCj4gICB7DQo+
IC0JcmV0dXJuIF9fcGF0Y2hfaW5zdHJ1Y3Rpb24oYWRkciwgaW5zdHIsIGFkZHIpOw0KPiArCWlm
IChwcGNfaW5zdF9wcmVmaXhlZChpbnN0cikpDQo+ICsJCXJldHVybiBfX19wYXRjaF9tZW1vcnko
YWRkciwgcHBjX2luc3RfYXNfdWxvbmcoaW5zdHIpLCBhZGRyLCBzaXplb2YodTY0KSk7DQo+ICsJ
ZWxzZQ0KPiArCQlyZXR1cm4gX19fcGF0Y2hfbWVtb3J5KGFkZHIsIHBwY19pbnN0X3ZhbChpbnN0
ciksIGFkZHIsIHNpemVvZih1MzIpKTsNCj4gICB9DQo+IA0KPiAgICNpZmRlZiBDT05GSUdfU1RS
SUNUX0tFUk5FTF9SV1gNCj4gQEAgLTE0NywyNCArMTc3LDIyIEBAIHN0YXRpYyB2b2lkIHVubWFw
X3BhdGNoX2FyZWEodW5zaWduZWQgbG9uZyBhZGRyKQ0KPiAgIAlmbHVzaF90bGJfa2VybmVsX3Jh
bmdlKGFkZHIsIGFkZHIgKyBQQUdFX1NJWkUpOw0KPiAgIH0NCj4gDQo+IC1zdGF0aWMgaW50IF9f
ZG9fcGF0Y2hfaW5zdHJ1Y3Rpb24odTMyICphZGRyLCBwcGNfaW5zdF90IGluc3RyKQ0KPiArc3Rh
dGljIGludCBfX2Fsd2F5c19pbmxpbmUgX19kb19wYXRjaF9tZW1vcnkodm9pZCAqZGVzdCwgdW5z
aWduZWQgbG9uZyBzcmMsIHNpemVfdCBzaXplKQ0KPiAgIHsNCj4gICAJaW50IGVycjsNCj4gICAJ
dTMyICpwYXRjaF9hZGRyOw0KPiAtCXVuc2lnbmVkIGxvbmcgdGV4dF9wb2tlX2FkZHI7DQo+ICAg
CXB0ZV90ICpwdGU7DQo+IC0JdW5zaWduZWQgbG9uZyBwZm4gPSBnZXRfcGF0Y2hfcGZuKGFkZHIp
Ow0KPiAtDQo+IC0JdGV4dF9wb2tlX2FkZHIgPSAodW5zaWduZWQgbG9uZylfX3RoaXNfY3B1X3Jl
YWQodGV4dF9wb2tlX2FyZWEpLT5hZGRyICYgUEFHRV9NQVNLOw0KPiAtCXBhdGNoX2FkZHIgPSAo
dTMyICopKHRleHRfcG9rZV9hZGRyICsgb2Zmc2V0X2luX3BhZ2UoYWRkcikpOw0KPiArCXVuc2ln
bmVkIGxvbmcgdGV4dF9wb2tlX2FkZHIgPSAodW5zaWduZWQgbG9uZylfX3RoaXNfY3B1X3JlYWQo
dGV4dF9wb2tlX2FyZWEpLT5hZGRyICYgUEFHRV9NQVNLOw0KPiArCXVuc2lnbmVkIGxvbmcgcGZu
ID0gZ2V0X3BhdGNoX3BmbihkZXN0KTsNCj4gDQo+ICsJcGF0Y2hfYWRkciA9ICh1MzIgKikodGV4
dF9wb2tlX2FkZHIgKyBvZmZzZXRfaW5fcGFnZShkZXN0KSk7DQoNCkNhbiB3ZSBhdm9pZCB0aGlz
IGNodXJuID8NCk9rLCB5b3Ugd2FudCB0byBjaGFuZ2UgJ2FkZHInIHRvICdkZXN0JywgY2FuIHdl
IGxlYXZlIGV2ZXJ5dGhpbmcgZWxzZSBhcyANCmlzID8NCg0KUHJldmlvdXNseSwgdGhlcmUgd2Fz
IGEgY2xlYXIgc3BsaXR0aW5nIG9mIHRoZSBmdW5jdGlvbjoNCg0KCWFkZHJlc3MgcHJlcGFyYXRp
b24NCgkgIGJsYW5rIGxpbmUNCglNTVUgbWFwcGluZw0KCSAgYmxhbmsgbGluZQ0KCXBhdGNoaW5n
DQoJICBibGFuayBsaW5lDQoJTU1VIHVubWFwcGluZw0KDQpOb3cgdGhlIGZ1bmN0aW9uIHNlZW1z
IGRpc29yZ2FuaXNlZCBhbmQgaXMgbGVzcyByZWFkYWJsZS4NCg0KPiAgIAlwdGUgPSB2aXJ0X3Rv
X2twdGUodGV4dF9wb2tlX2FkZHIpOw0KPiAgIAlfX3NldF9wdGVfYXQoJmluaXRfbW0sIHRleHRf
cG9rZV9hZGRyLCBwdGUsIHBmbl9wdGUocGZuLCBQQUdFX0tFUk5FTCksIDApOw0KPiAgIAkvKiBT
ZWUgcHRlc3luYyBjb21tZW50IGluIHJhZGl4X19zZXRfcHRlX2F0KCkgKi8NCj4gICAJaWYgKHJh
ZGl4X2VuYWJsZWQoKSkNCj4gICAJCWFzbSB2b2xhdGlsZSgicHRlc3luYyI6IDogOiJtZW1vcnki
KTsNCj4gDQo+IC0JZXJyID0gX19wYXRjaF9pbnN0cnVjdGlvbihhZGRyLCBpbnN0ciwgcGF0Y2hf
YWRkcik7DQo+ICsJZXJyID0gX19fcGF0Y2hfbWVtb3J5KHBhdGNoX2FkZHIsIHNyYywgZGVzdCwg
c2l6ZSk7DQo+IA0KPiAgIAlwdGVfY2xlYXIoJmluaXRfbW0sIHRleHRfcG9rZV9hZGRyLCBwdGUp
Ow0KPiAgIAlmbHVzaF90bGJfa2VybmVsX3JhbmdlKHRleHRfcG9rZV9hZGRyLCB0ZXh0X3Bva2Vf
YWRkciArIFBBR0VfU0laRSk7DQo+IEBAIC0xNzIsNyArMjAwLDcgQEAgc3RhdGljIGludCBfX2Rv
X3BhdGNoX2luc3RydWN0aW9uKHUzMiAqYWRkciwgcHBjX2luc3RfdCBpbnN0cikNCj4gICAJcmV0
dXJuIGVycjsNCj4gICB9DQo+IA0KPiAtc3RhdGljIGludCBkb19wYXRjaF9pbnN0cnVjdGlvbih1
MzIgKmFkZHIsIHBwY19pbnN0X3QgaW5zdHIpDQo+ICtzdGF0aWMgaW50IF9fYWx3YXlzX2lubGlu
ZSBkb19wYXRjaF9tZW1vcnkodm9pZCAqZGVzdCwgdW5zaWduZWQgbG9uZyBzcmMsIHNpemVfdCBz
aXplKQ0KPiAgIHsNCj4gICAJaW50IGVycjsNCj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4g
QEAgLTE4MywzMiArMjExLDQyIEBAIHN0YXRpYyBpbnQgZG9fcGF0Y2hfaW5zdHJ1Y3Rpb24odTMy
ICphZGRyLCBwcGNfaW5zdF90IGluc3RyKQ0KPiAgIAkgKiB0byBhbGxvdyBwYXRjaGluZy4gV2Ug
anVzdCBkbyB0aGUgcGxhaW4gb2xkIHBhdGNoaW5nDQo+ICAgCSAqLw0KPiAgIAlpZiAoIXN0YXRp
Y19icmFuY2hfbGlrZWx5KCZwb2tpbmdfaW5pdF9kb25lKSkNCj4gLQkJcmV0dXJuIHJhd19wYXRj
aF9pbnN0cnVjdGlvbihhZGRyLCBpbnN0cik7DQo+ICsJCXJldHVybiBfX19wYXRjaF9tZW1vcnko
ZGVzdCwgc3JjLCBkZXN0LCBzaXplKTsNCj4gDQo+ICAgCWxvY2FsX2lycV9zYXZlKGZsYWdzKTsN
Cj4gLQllcnIgPSBfX2RvX3BhdGNoX2luc3RydWN0aW9uKGFkZHIsIGluc3RyKTsNCj4gKwllcnIg
PSBfX2RvX3BhdGNoX21lbW9yeShkZXN0LCBzcmMsIHNpemUpOw0KPiAgIAlsb2NhbF9pcnFfcmVz
dG9yZShmbGFncyk7DQo+IA0KPiAgIAlyZXR1cm4gZXJyOw0KPiAgIH0NCj4gKw0KPiAgICNlbHNl
IC8qICFDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1ggKi8NCj4gDQo+IC1zdGF0aWMgaW50IGRvX3Bh
dGNoX2luc3RydWN0aW9uKHUzMiAqYWRkciwgcHBjX2luc3RfdCBpbnN0cikNCj4gK3N0YXRpYyBp
bnQgZG9fcGF0Y2hfbWVtb3J5KHZvaWQgKmRlc3QsIHVuc2lnbmVkIGxvbmcgc3JjLCBzaXplX3Qg
c2l6ZSkNCj4gICB7DQo+IC0JcmV0dXJuIHJhd19wYXRjaF9pbnN0cnVjdGlvbihhZGRyLCBpbnN0
cik7DQo+ICsJcmV0dXJuIF9fX3BhdGNoX21lbW9yeShkZXN0LCBzcmMsIGRlc3QsIHNpemUpOw0K
PiAgIH0NCj4gDQo+ICAgI2VuZGlmIC8qIENPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWCAqLw0KPiAN
Cj4gICBfX3JvX2FmdGVyX2luaXQgREVGSU5FX1NUQVRJQ19LRVlfRkFMU0UoaW5pdF9tZW1faXNf
ZnJlZSk7DQo+IA0KPiAtaW50IHBhdGNoX2luc3RydWN0aW9uKHUzMiAqYWRkciwgcHBjX2luc3Rf
dCBpbnN0cikNCj4gK2ludCBfX3BhdGNoX21lbW9yeSh2b2lkICpkZXN0LCB1bnNpZ25lZCBsb25n
IHNyYywgc2l6ZV90IHNpemUpDQo+ICAgew0KPiAgIAkvKiBNYWtlIHN1cmUgd2UgYXJlbid0IHBh
dGNoaW5nIGEgZnJlZWQgaW5pdCBzZWN0aW9uICovDQo+IC0JaWYgKHN0YXRpY19icmFuY2hfbGlr
ZWx5KCZpbml0X21lbV9pc19mcmVlKSAmJiBpbml0X3NlY3Rpb25fY29udGFpbnMoYWRkciwgNCkp
DQo+ICsJaWYgKHN0YXRpY19icmFuY2hfbGlrZWx5KCZpbml0X21lbV9pc19mcmVlKSAmJiBpbml0
X3NlY3Rpb25fY29udGFpbnMoZGVzdCwgNCkpDQo+ICAgCQlyZXR1cm4gMDsNCj4gDQo+IC0JcmV0
dXJuIGRvX3BhdGNoX2luc3RydWN0aW9uKGFkZHIsIGluc3RyKTsNCj4gKwlyZXR1cm4gZG9fcGF0
Y2hfbWVtb3J5KGRlc3QsIHNyYywgc2l6ZSk7DQo+ICt9DQo+ICtOT0tQUk9CRV9TWU1CT0woX19w
YXRjaF9tZW1vcnkpOw0KPiArDQo+ICtpbnQgcGF0Y2hfaW5zdHJ1Y3Rpb24odTMyICphZGRyLCBw
cGNfaW5zdF90IGluc3RyKQ0KPiArew0KPiArCWlmIChwcGNfaW5zdF9wcmVmaXhlZChpbnN0cikp
DQo+ICsJCXJldHVybiBwYXRjaF9tZW1vcnkoYWRkciwgcHBjX2luc3RfYXNfdWxvbmcoaW5zdHIp
KTsNCj4gKwllbHNlDQo+ICsJCXJldHVybiBwYXRjaF9tZW1vcnkoYWRkciwgcHBjX2luc3RfdmFs
KGluc3RyKSk7DQo+ICAgfQ0KPiAgIE5PS1BST0JFX1NZTUJPTChwYXRjaF9pbnN0cnVjdGlvbik7
DQo+IA0KPiAtLQ0KPiAyLjM3LjM=
