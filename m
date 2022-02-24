Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDD14C2D72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 14:43:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Ddh5rhGz3cKM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 00:43:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61d;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::61d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Dd91RY9z2xrt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 00:43:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNtJN+eUJeRYpP2b8+E0ZWbfFnhfO3cBq+3Xg9oWeadf9zTGSrfJRIwDKFHB9CNqF+W9TpqJm1WzUdPW4IT31+TB9PCwCsZT+bVYCT1dGnICwNHwKQuG/QkM6dis7TUpZaQeg/MYooFdk7R8o0FRAOJ7cXs6lJc0Y1vTAYHGSm0+LMwfctQiU4t8dqJEt6YP83TKwkngU1DFRaIWAQ39Gisyg0pPaHVUelRBbiPCuj8FiFKmVnQ49anHbgjm1lzYnbz5h/JH3q00tuEA4GZalVMqcee84b/kL+fI0ErBUi4bI19KjpP3y4g0THfn/JkouasAugTia8oJuK2cgt+jeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5gRFUVAb612ChgTF99poeR+NBsa4z1/+XxiN0EgMPg=;
 b=NxIIz+FLcv7yhQqq7ESeHkmpTtNgnyER0XA9Wzt4VWlTEvwCwrIalsJVQy/ek9EVWDYtPkcaABQ2TbN6+t3eOtYHOimQOGJdHq9UGYvFrdKF7C9Syz/g9F9g5sGjEsfmFgJWJJwjyaF5WumvV3IgejhCEfJ/qZoHorw8xbHz6cx2GbiP+7PXqX+d2LsxJtN5E+hh4u6BXnfvStv2ZEhLoThgIMitiROENMeUsIcVsUYrPHitiXI6rquHTwwd6ehr2Jb/jssu96GYUCD2luv0/guyFjKp4NKpaUwaZIrGqggYVCPidYmf8c6abLJmJ8fFF3TK9V+cWA88zxtiQc7Nkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2072.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 13:43:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d%5]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 13:43:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 02/13] tracing: Fix selftest config check for function
 graph start up test
Thread-Topic: [PATCH v2 02/13] tracing: Fix selftest config check for function
 graph start up test
Thread-Index: AQHX9b/2q2Ez9U+DWUatpfXKha82oqyjHWIA
Date: Thu, 24 Feb 2022 13:43:02 +0000
Message-ID: <74775d33-2e54-96ab-4546-57eb2c9e50e0@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <bdc7e594e13b0891c1d61bc8d56c94b1890eaed7.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <bdc7e594e13b0891c1d61bc8d56c94b1890eaed7.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de80f104-9452-4acd-ec7f-08d9f79b9440
x-ms-traffictypediagnostic: MRZP264MB2072:EE_
x-microsoft-antispam-prvs: <MRZP264MB2072A0E7202A713900F9367FED3D9@MRZP264MB2072.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FEDdo4NtmbBZ/kGJ6T6vOam/89SsOomK+x388uZRrOun7B2A0Ai7XCBzAH+1i3NFH7/qR7yIwGEZH6P6r0gzSQm6JRCVrhXg2Thi4kUL96lzK543hhYsNPNM2XIPmKxsxeo8mrW3qDmHu08kKm+Cvtdw0fDLUPrxvoIu2dEqa/i1sWBARzhzLxp5/KlAd3I9lXrTjYiqCe7StGnBglgiNd7+vSi4SmDKsclDjEfUb3pvxbymElAVaC9yN0XTi/Lih/Doa9DJ5GMBSCuXdOxpMGcU9C7qpawYvnSf+KNTmP5NKNKDqavceXq8OXuH0yrPM8REf2qtFcxAHqpjcTLGTTNyukE39ENb7JD32K5c+8SGbwrMQT9k7Aa437kDgK+6W0c4VZCcyte+CwiDeeZA4bWifVglCDy83ZEDSSck6iBoume0VicrcnhEm4RHqFqNTfwaweqxkplAp0q0xwX9MRXTbaMnFMaOdVKizP68tLuXMx80s7MP9Ulcs0gLouQqqn6fecMVxrKQpa+C25ERXRyJPdA1YoFysNi9CyFHeRcsCjoYoaax5uAWTXgSl66XzeknP6UQjs3UmxyMmx4ArRVZG7rfj86BQfv2QSIh22vnVf3UU1+gUVHId9cuH1fdubjqSQiB7ZU2Kg+EpYdmnCemeSSS+oPitlWH/NvdDmWiIyN6aveupTqX5N/yeCuxbq5lp778btUhtoLWgNuNWUb03WEfqbULW56NSUuucO4p1mWAUiMCgehl3ObxG2Xkhpw8YUTbNw/Sug28WcUuxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(86362001)(31696002)(38100700002)(122000001)(66446008)(91956017)(7416002)(6506007)(508600001)(5660300002)(316002)(8936002)(31686004)(6512007)(2906002)(66476007)(54906003)(44832011)(110136005)(66946007)(64756008)(4326008)(186003)(26005)(8676002)(36756003)(83380400001)(2616005)(66574015)(6486002)(71200400001)(76116006)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXpKakpaVzByU3NrTGd1c25SRVlxMWxNOHFEZ2xFeEJObFBqcTFjdWZkaitt?=
 =?utf-8?B?MkVSOWx5QTB2akJPT2JtSm1qdm1sYlgyNzlvR1VvdUN2bVZhemM1aURGSUNV?=
 =?utf-8?B?S1lhVUVrNXl4eXk3bUdldG1kdnp2WXZiNEcwMktvMWtnd3J1RXpGc3BwUkxh?=
 =?utf-8?B?MkRSVzRiaVhqTnRkSW5nYVhUSDlLdllPakxhUDZwS0pmd3FPN0IvSlNJaDU1?=
 =?utf-8?B?eVFUdWgxZEZvRm9kVzlnbHlUMUpTdlhyRnRWTTZJYTUyT3R6U3I4bHI5cEFn?=
 =?utf-8?B?SHBVdkRqSjNlS3lSQ3YyekR4d21OZlJZRVZkQ3pVakFvV2pVZzF6dGlrc1VT?=
 =?utf-8?B?ZXVjd0pSSW80QjVwdlRDMWQ2a2MxRlRJR0ZGcjUzb2tyYWNReHI1NHVBMld3?=
 =?utf-8?B?cTVrUVNOcktVSXR0VXJHczhHenpoa3pFQ3pMWmFJMjRXL2QzYzAwd2xMbCtN?=
 =?utf-8?B?bnkwQzlTRldlTGZHTERLQWE3aWJsR3RGbHZleU43UzZibEMwMnVoc051aFMy?=
 =?utf-8?B?OUMrYWZjd2dvRGk5amNhM2RxVURUYURQVWQxcTN4dG1tMW45dEdDQnphV2Zm?=
 =?utf-8?B?czNtdGlmOXkxMCthbkFuaG1FVmpoZWd2UVFwYjZ6dGZpbkJGV2xrQ1NFeTVx?=
 =?utf-8?B?NEV4WDZMaDc3QUVZV3lCSmtIZGg3UXJyZE12WmRNTnhtOXJ6R29URjVtQVAz?=
 =?utf-8?B?S1ljSWppMmY3cEYvVCtKeHdMNElOelVDd0thcFJFNElKZDZtUU82UnkvWFdj?=
 =?utf-8?B?NHVjamdTOU5SY3c1cXgxbUo2WnFmS1hIbWtYczNPaGxmLzZ0bDJuQUNGbUhZ?=
 =?utf-8?B?eUhTVnZCb0xaeDF5Ui9UcjNQU2czc0xFd3FPMW9MZUdrbHZsNEwrUXBJZW53?=
 =?utf-8?B?RGhuR3g0dXdBcHZVN0w3UFZBUEY0bGRsSTFzQmxOYzBSRzU4S0Zad3d3bWw5?=
 =?utf-8?B?TG1NWWtOV281QXpnekNSZlV4QVIvT2FYWGxiUTIzbVVMZXNNS3Q5MnorM29q?=
 =?utf-8?B?c1dKS1JvQ044SDNrYTJsUFZDY2RmamdZcWZoa1lBMUtGcjJUQktqTmpDbDhT?=
 =?utf-8?B?Q1BldjRBRTcrdmJOWjluRE9LbHlZNGtrWWU5MTZlUGhvWFNka2Y3RGN6YkJS?=
 =?utf-8?B?d3pENFhSTHY1U01ZaXhGZklaNTl0RGlnYklEdS80MjQwZ28zQUVWZVNVVjdY?=
 =?utf-8?B?cDIrYlRRWjBMTUpsQTBXemtPdlRWZjEwMFZEQ2krSUNKbElvVXJVSE9ZclBP?=
 =?utf-8?B?QWo3QlhESlNGM29WZ2w5c1BMVldpR2sybzFXR2lpdnJOVWMxR2dzZGdPTXFD?=
 =?utf-8?B?UVUzTVRuYnRQdFpUNllCUlBFVDY0K0NSRWt5bWUyWmExaFdGTFVIMG1lblR3?=
 =?utf-8?B?S2l6Qkx5M1VSYTZNK2JWQXhhd01ieHlCM05zU3FIaGoxQW80RG52aWtPZ01j?=
 =?utf-8?B?TzlKVzJHeXpkRzRRd3JROExqemJDc0dTNkc1cjJKVENlMWovNFp1bytaM3Nx?=
 =?utf-8?B?OVJGWit3dTJiRHRJS3Zqd0kzaCtYcUxPRlIwUWVLRmtOZUppSDlxMTBuU05z?=
 =?utf-8?B?a1hySTJjc1BMN0ZKeWNoUUlxMGt1Mi9ZYlY5czFuWjdlRGFoMkxaaW1aTDE3?=
 =?utf-8?B?cjdxcURSL0ltbFB4VFVPaGJwYmx1c0xmalFsaHB1UXJhNktvWFVBWFh2bzkx?=
 =?utf-8?B?MjNEN1BZT1p2VEd1enZPbGF3czZja2NNY0RCOHdXQVZUM2ZUdjNaUm1odnVW?=
 =?utf-8?B?L2NESHlpWlZmTTJSK000UUtrRVBCc041MW9QcytuMURLVk94TThXVk5obExT?=
 =?utf-8?B?djVoSGJGOFBlZkd4RXFwdGM3WmswQzdWMFpwUUZ2WXhRbEN4YTMvRGZabnB1?=
 =?utf-8?B?R2tUWGhRRS9SRDE4N3VlUDQvd1BoU1k3MHhNTUpCaFRLbzhIak5vTWdZblQw?=
 =?utf-8?B?TGxEY09wNkhIQm52V1lXeG4wL0VDUDU0UVIrdCttWHhHdlB6Wm4rbUNoNWx6?=
 =?utf-8?B?a3pVZ0RHaFhGbFFYVmxmYXpGM2dHS1ozRUpnV2UyazcrWWhTWlRIN040OTMw?=
 =?utf-8?B?WDkzSWRobURvNjYwdk1RL2pQbVhWOURsQ0NiL3czaWVuS1ZKd3cvNnBielVm?=
 =?utf-8?B?K3gvb1hNR2Vpekw4RkFYTE9pbFR1c0tSL2ZQTm4rUTJNMHFDQUd3WFlqUnpt?=
 =?utf-8?B?TEZxeGRSczVML1RvVFVsMElSbC9sNS84Ui9UYkRoMjUrY255OGxyNm95RDZC?=
 =?utf-8?Q?diOm6MW8rPp68fWaGsTSOMbHwO8t4WEnpxXLJRVY34=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D51856B435202E47B69AA602D1A388EF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: de80f104-9452-4acd-ec7f-08d9f79b9440
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 13:43:02.8285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MRjGx4yT04Zb/bHrjDsB5CDYcDAeU4wOqXcSv1s6fUrHIXBebxI8MM80BMObyRKlbXQp+ux2Fd7BO2/BFpjV0RAZXxWV8CUjX8R/7tvroqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2072
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
Cc: "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTWljaGFlbCwNCg0KTGUgMjAvMTIvMjAyMSDDoCAxNzozOCwgQ2hyaXN0b3BoZSBMZXJveSBh
IMOpY3JpdMKgOg0KPiBDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMgaXMg
cmVxdWlyZWQgdG8gdGVzdA0KPiBkaXJlY3QgdHJhbXAuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCllvdSBkaWRu
J3QgYXBwbHkgdGhpcyBwYXRjaCB3aGVuIHlvdSBtZXJnZWQgdGhlIHNlcmllcy4gV2l0aG91dCBp
dCBJIGdldCANCnRoZSBmb2xsb3dpbmcgOg0KDQpbICAgIDYuMTkxMjg3XSBUZXN0aW5nIGZ0cmFj
ZSByZWN1cnNpb246IFBBU1NFRA0KWyAgICA2LjQ3MzMwOF0gVGVzdGluZyBmdHJhY2UgcmVjdXJz
aW9uIHNhZmU6IFBBU1NFRA0KWyAgICA2Ljc1NTc1OV0gVGVzdGluZyBmdHJhY2UgcmVnczogUEFT
U0VEDQpbICAgIDcuMDM3OTk0XSBUZXN0aW5nIHRyYWNlciBub3A6IFBBU1NFRA0KWyAgICA3LjA0
MjI1Nl0gVGVzdGluZyB0cmFjZXIgZnVuY3Rpb25fZ3JhcGg6IEZBSUxFRCENClsgICAxMi4yMTYx
MTJdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KWyAgIDEyLjIyMDQzNl0g
V0FSTklORzogQ1BVOiAwIFBJRDogMSBhdCBrZXJuZWwvdHJhY2UvdHJhY2UuYzoxOTUzIA0KcnVu
X3RyYWNlcl9zZWxmdGVzdCsweDEzOC8weDFiNA0KWyAgIDEyLjIyOTA0NV0gQ1BVOiAwIFBJRDog
MSBDb21tOiBzd2FwcGVyIE5vdCB0YWludGVkIA0KNS4xNy4wLXJjMi1zM2stZGV2LTAyMDk2LWcy
OGIwNDBiZDIzNTcgIzEwMzANClsgICAxMi4yMzc3MzVdIE5JUDogIGMwMGQwMWI0IExSOiBjMDBk
MDFiNCBDVFI6IGMwM2QzN2ZjDQpbICAgMTIuMjQyNzI0XSBSRUdTOiBjOTAyYmQ5MCBUUkFQOiAw
NzAwICAgTm90IHRhaW50ZWQgDQooNS4xNy4wLXJjMi1zM2stZGV2LTAyMDk2LWcyOGIwNDBiZDIz
NTcpDQpbICAgMTIuMjUxMTU3XSBNU1I6ICAwMDAyOTAzMiA8RUUsTUUsSVIsRFIsUkk+ICBDUjog
MjgwMDAyNDIgIFhFUjogMDAwMDAwMDANClsgICAxMi4yNTc4NzBdDQpbICAgMTIuMjU3ODcwXSBH
UFIwMDogYzAwZDAxYjQgYzkwMmJlNTAgYzIxNDAwMDAgMDAwMDAwMDcgYzEwOGQyMjQgDQowMDAw
MDAwMSBjMTFlZDJlOCBjMTA4ZDM0MA0KWyAgIDEyLjI1Nzg3MF0gR1BSMDg6IDNmZmZiZmZmIDAw
MDAwMDAwIGMxMjliZWFjIDNmZmZjMDAwIDIyMDAwMjQ0IA0KMDAwMDAwMDAgYzAwMDRiNzggMDAw
MDAwMDANClsgICAxMi4yNTc4NzBdIEdQUjE2OiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAwMCANCjAwMDAwMDAwIDAwMDAwMDAwIGMxMDM5MDIwDQpbICAgMTIuMjU3
ODcwXSBHUFIyNDogYzEyZDAwMDAgYzEwMDAxNDQgYzEyMjNjNDggYzEyYjUzYzQgYzEyYjU1ZGMg
DQpjMTI5MzExOCBmZmZmZmRmNCBjMTIyM2MzOA0KWyAgIDEyLjI5Mzg0M10gTklQIFtjMDBkMDFi
NF0gcnVuX3RyYWNlcl9zZWxmdGVzdCsweDEzOC8weDFiNA0KWyAgIDEyLjI5OTI2NV0gTFIgW2Mw
MGQwMWI0XSBydW5fdHJhY2VyX3NlbGZ0ZXN0KzB4MTM4LzB4MWI0DQpbICAgMTIuMzA0NjAzXSBD
YWxsIFRyYWNlOg0KWyAgIDEyLjMwNzAxMl0gW2M5MDJiZTUwXSBbYzAwZDAxYjRdIHJ1bl90cmFj
ZXJfc2VsZnRlc3QrMHgxMzgvMHgxYjQgDQoodW5yZWxpYWJsZSkNClsgICAxMi4zMTQxNTVdIFtj
OTAyYmU3MF0gW2MxMDBjZjQ0XSByZWdpc3Rlcl90cmFjZXIrMHgxNGMvMHgyMTgNClsgICAxMi4z
MTk4MzVdIFtjOTAyYmU5MF0gW2MxMDAxMWEwXSBkb19vbmVfaW5pdGNhbGwrMHg4Yy8weDE3Yw0K
WyAgIDEyLjMyNTQzMF0gW2M5MDJiZWYwXSBbYzEwMDE0YzBdIGtlcm5lbF9pbml0X2ZyZWVhYmxl
KzB4MWE4LzB4MjU0DQpbICAgMTIuMzMxNTQwXSBbYzkwMmJmMjBdIFtjMDAwNGJhOF0ga2VybmVs
X2luaXQrMHgzMC8weDE1MA0KWyAgIDEyLjMzNjc4OV0gW2M5MDJiZjMwXSBbYzAwMTIyMmNdIHJl
dF9mcm9tX2tlcm5lbF90aHJlYWQrMHg1Yy8weDY0DQpbICAgMTIuMzQyOTAyXSBJbnN0cnVjdGlv
biBkdW1wOg0KWyAgIDEyLjM0NTgyOF0gNGJmOWExMzUgODEzZDAwMzAgN2ZjNGYzNzggN2QyOTAz
YTYgN2ZhM2ViNzggNGU4MDA0MjEgDQo3YzdlMWI3OSA5MzlmMGY2MA0KWyAgIDEyLjM1MzY1N10g
NDE4MjAwMTQgM2M2MGMwOGEgMzg2MzY0NGMgNGJmOWExMDkgPDBmZTAwMDAwPiAzODdmMDBiMCAN
CjRiZmY3NmJkIDg5M2QwMDUyDQpbICAgMTIuMzYxNjU5XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAw
MDAwMDAwMDAwIF0tLS0NCg0KDQpXaXRoIHRoZSBwYXRjaCBJIGdldDoNCg0KWyAgICA2LjE5MTI4
Nl0gVGVzdGluZyBmdHJhY2UgcmVjdXJzaW9uOiBQQVNTRUQNClsgICAgNi40NzMzMDddIFRlc3Rp
bmcgZnRyYWNlIHJlY3Vyc2lvbiBzYWZlOiBQQVNTRUQNClsgICAgNi43NTU3NThdIFRlc3Rpbmcg
ZnRyYWNlIHJlZ3M6IFBBU1NFRA0KWyAgICA3LjAzNzk5M10gVGVzdGluZyB0cmFjZXIgbm9wOiBQ
QVNTRUQNClsgICAgNy4wNDIyNTVdIFRlc3RpbmcgdHJhY2VyIGZ1bmN0aW9uX2dyYXBoOiBQQVNT
RUQNCg0KSXMgdGhpcyBwYXRjaCBnb2luZyB0byBiZSBtZXJnZWQgdmlhIGFub3RoZXIgdHJlZSA/
DQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0KDQoNCj4gLS0tDQo+ICAga2VybmVsL3RyYWNlL3RyYWNl
X3NlbGZ0ZXN0LmMgfCA2ICsrLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEva2VybmVsL3RyYWNlL3RyYWNl
X3NlbGZ0ZXN0LmMgYi9rZXJuZWwvdHJhY2UvdHJhY2Vfc2VsZnRlc3QuYw0KPiBpbmRleCBhZmQ5
MzdhNDY0OTYuLmFiY2FkYmU5MzNiYiAxMDA2NDQNCj4gLS0tIGEva2VybmVsL3RyYWNlL3RyYWNl
X3NlbGZ0ZXN0LmMNCj4gKysrIGIva2VybmVsL3RyYWNlL3RyYWNlX3NlbGZ0ZXN0LmMNCj4gQEAg
LTc4NCw5ICs3ODQsNyBAQCBzdGF0aWMgc3RydWN0IGZncmFwaF9vcHMgZmdyYXBoX29wcyBfX2lu
aXRkYXRhICA9IHsNCj4gICAJLnJldGZ1bmMJCT0gJnRyYWNlX2dyYXBoX3JldHVybiwNCj4gICB9
Ow0KPiAgIA0KPiAtI2lmIGRlZmluZWQoQ09ORklHX0RZTkFNSUNfRlRSQUNFKSAmJiBcDQo+IC0g
ICAgZGVmaW5lZChDT05GSUdfSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1MpDQo+IC0jZGVm
aW5lIFRFU1RfRElSRUNUX1RSQU1QDQo+ICsjaWZkZWYgQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJ
VEhfRElSRUNUX0NBTExTDQo+ICAgbm9pbmxpbmUgX19ub2Nsb25lIHN0YXRpYyB2b2lkIHRyYWNl
X2RpcmVjdF90cmFtcCh2b2lkKSB7IH0NCj4gICAjZW5kaWYNCj4gICANCj4gQEAgLTg0OSw3ICs4
NDcsNyBAQCB0cmFjZV9zZWxmdGVzdF9zdGFydHVwX2Z1bmN0aW9uX2dyYXBoKHN0cnVjdCB0cmFj
ZXIgKnRyYWNlLA0KPiAgIAkJZ290byBvdXQ7DQo+ICAgCX0NCj4gICANCj4gLSNpZmRlZiBURVNU
X0RJUkVDVF9UUkFNUA0KPiArI2lmZGVmIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVD
VF9DQUxMUw0KPiAgIAl0cmFjaW5nX3Jlc2V0X29ubGluZV9jcHVzKCZ0ci0+YXJyYXlfYnVmZmVy
KTsNCj4gICAJc2V0X2dyYXBoX2FycmF5KHRyKTsNCj4gICA=
