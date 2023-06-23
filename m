Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA65473AFBB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:13:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ko9OBSlB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnQPC55Qxz3btP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 15:13:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ko9OBSlB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::618; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnQNG0WBfz30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 15:12:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+OZ7glX/SMQx9pYA6Jg1aWpY+zkZ36kxokZ1DOHOzgMRHIIIrxiEO93V+Dt+3hyFpl/MsIkX4qZ8nmE3QM4L2YJiZhmca4UjUkVGSLThcQPlQAdQoh/LP53y61OZSPV+hCUv+Hz9KBOXkOC0R9Kn2M3F52nLpbdcpmAd8lLRr/X6CuKpT2C+CtibNJALDiqE6ciPG32GPGzYNj1HPj8eYOJvLUQsoQWgrXjvwhGdSKt9pWPcmtwa19gD04o1rDx1xlwrnrR5mFVrWb//6a+Pk7Gaybusjr2tpGGfe4Q5Sc4lzx+th0X4wO5Z+F62iCuzf/1JtmxgrJaQ+XTFXz43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2+GZkGzPkOkEktTnMwM2kFnOAmVzj0otGWS5hZKgZg=;
 b=X8pncQabPBFTqH0USV8rNw1DZTMZYOjqOIo1ounmIsUW0OHUM7EIYNBQSdF0URNWmZG3LmGic1Z3k4p/x8cZl35p4MG6qEH8QEpUGdBFUTA1fWgVparewp0UH1QIFGk8G8v2O3b3iDIPYytVXhmQV18zL89U5rr6jNk00nBKMzT89DA8vB879JGJ3H1SzEMgxP0fh5LCh3tbzUDgBfZgIcMYsdBNK/e/5aWt8HYxSckKP6Xh5dSWeti7eaBGqklsIyNkU44fZSJXCivV0oIAstHHGyGGgkznIKAAY+ScBRVoTf+gzw8MO8lOiy9Nop7d9ySwLYgvhaSFMGlyDSXk5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2+GZkGzPkOkEktTnMwM2kFnOAmVzj0otGWS5hZKgZg=;
 b=ko9OBSlBOpBTA0XrTpOxJijT9LvFqaIo1uvdYuXe2BOQ+W1PGoXP6CtM2+4dH7Qjdh3Eu4N13FV0J/slV9aghIJbil1l4l/GyWvB5rf95mX/tgp1fgu6fpqTeNzhlx42+mENuXpZv/V5dinFWVcaGDVOPzqH7WspQ8/aLWjN0ebeOzRhpyPD/jd/IeUmyv4AtmWYZgSuFbBXiN7dMxOakoodsh7v02nUpYl+pVCy79IcqyCzY3BYcFrPXeemjeVm3JykuXu4sPb23q7JNTyS+sIGtbJfUdj+iZTaojzMJGf+7NKV2e58uVMrCZ4bVlQ/iMwobwv3KeVPQ65ej+lgQQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1809.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 05:12:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 05:12:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 02/17] powerpc/module: Remove unused .ftrace.tramp section
Thread-Topic: [PATCH 02/17] powerpc/module: Remove unused .ftrace.tramp
 section
Thread-Index: AQHZopPnzSISskreuUSbUX55DenFF6+X3WKA
Date: Fri, 23 Jun 2023 05:12:13 +0000
Message-ID: <c4986f18-15b6-fd9f-e1eb-e27acf9fae4a@csgroup.eu>
References: <cover.1687166935.git.naveen@kernel.org>
 <9cf6d7f37ba82f7cb6dafecf660f44925c526d8d.1687166935.git.naveen@kernel.org>
In-Reply-To:  <9cf6d7f37ba82f7cb6dafecf660f44925c526d8d.1687166935.git.naveen@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1809:EE_
x-ms-office365-filtering-correlation-id: 1059183b-ecb5-47a9-ebbc-08db73a867a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  oJd8OpMdsJQBONqDfHvORvd4AF4AXpoypbBHnFKQ7gqxtdiNZWPxPSo3elCkEZMjeYhIRHPBrHt4PFB5eX9Bo7Lajyw8QBWziK7dFzCGzKVOSH6uoAlRkdiAHx6sYE2J2MQDkTJGwWuXs785AwIciNG7D/vjalIOtMzzZFVhMmA0gdLWRdGExav6k8gUkwZVtfMBObwFKty79EQ+NqkR8kJ6J/ke9UnwuRUis1H8pxxYnKtaTfKUB/60NgppRedu6P9Yg5gsmyD1fLz9lIE1Y7q/DAxL2hmzFiycqshXjsoHSpYm6AjeGyclnSggi0V81XSnsWI8muybxp5V65VhUyBQRVVPt5HczOyGhkRE6Un60409yI5Y2RYAfw3daw+tMltqjor6eZPwDqyYELcPLDF+X6bpKId804YWsNNb5Bq4AzlYSQ8d8KddAauGvto6oLdQ6HKRRV7Q3hKz0rOhlVyI3bZ0ENVVcQaRGnge6HMraFJIFG4ta0K+sUOleT66HJUZU5UOqwqQs5liBXOU1Dqg1RkfTTXtS145qTtsD6+iXque6GBs1vkYRC0oDC/gO9byNntQ7cct0HrFsOQJABMF86FxdVbG8mACh8gs+GbmeAa2vGw2UiHDZHDYfPF3E99riYSbUXvI3usuITVV9fx3J1r/b+6PrLJjShAO4JmqryhREPoHwLae/CYhi3Q8DYosYf+3L7qkl4QCFC9vOA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(346002)(396003)(376002)(136003)(366004)(451199021)(122000001)(38100700002)(38070700005)(86362001)(31696002)(76116006)(91956017)(4326008)(66556008)(316002)(64756008)(66446008)(66946007)(66476007)(2616005)(110136005)(5660300002)(8936002)(83380400001)(8676002)(41300700001)(6486002)(31686004)(6512007)(26005)(478600001)(186003)(71200400001)(6506007)(4744005)(2906002)(36756003)(44832011)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dSt2RmFDMi9aUTNuQXJkVkFlbGQ4RHRzRDVJTDdZR0lOY05rRzF5akI1RFJG?=
 =?utf-8?B?Z2pkRDQ5UHI0ZkRxeEtlL2x3YkFhT2RhRDBVVnlvbmZmZnV0aE12c2licEds?=
 =?utf-8?B?eHhONGsrbGQzRXJTOUdSUlYxYkRudklYV3RjMVZXeU5UNzFDNUJmRk5VTVE1?=
 =?utf-8?B?ZjFNcnVJdmJlNWw1ZVZaN2xPS2JzMFduclVld2ZuR29hd3FuY3ZFdHpWTHo0?=
 =?utf-8?B?NnNKOStScTVodENiMHltOThWVWxUZjlIcC9JVVVlTWx5K1RzRC9OTWlWUUhL?=
 =?utf-8?B?Y0tNYzAvWEpjUTloN3NtSHNubllwUC9vZGVLWXl5RytDdThaQTIxb3lvL1Vs?=
 =?utf-8?B?WjcxSS9xOTRyK0NpeFlBMUhWaTM1MVBkcHk2Z3Z1NmxhaDNKWlpVTlBheDRE?=
 =?utf-8?B?ZWFwb3V4K3VyOFV0Wmhta1dJWStPMlhUSVN5d2VueXRFWjA3VEFZR0xld0JC?=
 =?utf-8?B?YVFyV1VZVmZYdmZLcVphZlZERllDRXQ4QlZvaUxFOUNkckY3ekc1bTJRdGY3?=
 =?utf-8?B?N3dkRytQVk5GUmRlNHJvVExOWHRDSCtIUnQ1Nll1clpYRHJESkxQYkJmMzFi?=
 =?utf-8?B?REg3SG10dzc4UVZzeWM2ZU9RVFRhbEYxcmhCeGwvcjJ2UnA0T0owMklrb25t?=
 =?utf-8?B?Wm9HZ0lGTjFjdjN2bDBhUFBxRmlOSXBPQ2pFYk54ek9zZU5VVzRXRTN6RjVx?=
 =?utf-8?B?TU1vT21FODlRSHU4SzY1aUZIZkZQWGxmOTFISDJRWFB5VzE3V3RPV0xHYnhI?=
 =?utf-8?B?eXREMFR0RDNjT1NQaFdPc29TbjZpblByNHRnb3V3RVhiZ1g2MkY1NXVhNnJw?=
 =?utf-8?B?UW85L2FzRWdBMmt1Mm53ZThMd29EcG1jU29pbTMvL25NZzdERmtSMkszRXdX?=
 =?utf-8?B?SWdkTlp1M0lGc25VMm8yb21sY2N5clVwdlpFdDFRMW0vbXptbVlxMmJhSmlZ?=
 =?utf-8?B?VEVRRzJzcVR0b2hGdWwvanJJV2k3NkV1akxlTExkMEZJKzFPbEVIZTdDYXVq?=
 =?utf-8?B?SmdleWQzRzNjbEpnR29DQjI5K3BrVWtObXVSNm81YUxNcXloVEZiZW4wcU42?=
 =?utf-8?B?ZVAwa1hSUHFYNGVGaDVPVThNMWdzMlBvbHQwTi9WWW5zUWdlRnhYZTRHQ21h?=
 =?utf-8?B?b05SUUM2bHVjVWE2OHk0MGUwOFZBMWYya1FLUHFhTExPbVFuam95T2tpbEpn?=
 =?utf-8?B?TEJwWG56TldsN3MvTStvWlh5V3psNDdXMStsNGRoUkQ0R1Q5V3J1R1VhaTZW?=
 =?utf-8?B?VS9LT0REem83M3dRcVlVUFBIOVM2ZjVxR25Ldk11N0VzaFlSZWxBZHhHMFkx?=
 =?utf-8?B?am5QWVRGaXVCSkdkdEVNWHlFb1Y1ZGZRYnphdC9qNXVzVlFhZlgvRGFlZnVK?=
 =?utf-8?B?R0RYdzV5cG05SG5FemNFaXFkUGdvRHJzRHllc0xCUWsyQ0FMWE80TitnK2NC?=
 =?utf-8?B?MytwRHFLZXJ2VVU3REpPT2tDV0JmbXJBRStwUUx2ZUJ5VzcrZTFvV1grdnpk?=
 =?utf-8?B?Q3QyYnNrekw5Z29qdUpqc2NQS2JMQkEyQUFwNnBOaGFGWTRUOTJ3SDVnZFdV?=
 =?utf-8?B?b3VLV2l1d0s2QmN0MEhEYldmU1Fuc29WYk5RRHZLS3VRaUtvYzFhaDE2N05m?=
 =?utf-8?B?V3V1OFQ3Mmh4bG9OdENXZExJaGh6Rld0c3pjUlFSTnpmNTJOcnhIUFprRjAz?=
 =?utf-8?B?OStPWkFOSk9NeDB1L2dOKzNuZi9Pb25RakRUV2h5Yk9mR0Y0dnA1VXNyZmY4?=
 =?utf-8?B?YVArR3F6bDhDYW9qTU5PM3o4cDkrQUgxcSs5eXZEeG9ldEhqVmxPQ2N4V2g5?=
 =?utf-8?B?NXRnZXF5RTBEODFsRTBIOTZBdXMxcWJ3bDZSclBxU2RDbW41ejY4SWZraWlq?=
 =?utf-8?B?YUhwZThQQTBJV3JZVm80aEtNNWlJYnNQbUFlcDdCbDdJeUdCcjE3R2twSFd0?=
 =?utf-8?B?NDM2L245K2FJZ0srbHU4NjhxU0RFRjliWEdQYTJzVWJCaUszSFc4Rm5nMTdu?=
 =?utf-8?B?OFB6cnBCdVpEc2x1L3FlRGE5bXZIcUNQTFE3dXpkL3R6d1NYTU5UMWpBVEo1?=
 =?utf-8?B?T1BrZXRzOXNoVHBCK1FsWlQ2THoyY3AwRyt2REszVGdUNUI0WFNuNmprdkgr?=
 =?utf-8?B?Z3NJb1lWcWtRWGRGN1N4d0VRLy90YmdyaEZ0aUZLczFBQTRpTGYvV3N1QUpM?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E998E45030F9A4D8EF5AD113B3DD66E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1059183b-ecb5-47a9-ebbc-08db73a867a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 05:12:13.3069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C9mRT3nHhf3AYSP2uXaRydJx0YknbdWwTTEdIexpVU7LETJwq1LwigDkCVeGKqFefQs0vSPC6qE6MIztuN/Oq+ASRh6xYyOyE5gMP3AVTWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1809
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA2LzIwMjMgw6AgMTE6NDcsIE5hdmVlbiBOIFJhbyBhIMOpY3JpdMKgOg0KPiAu
ZnRyYWNlLnRyYW1wIHNlY3Rpb24gaXMgbm90IHVzZWQgZm9yIGFueSBwdXJwb3NlLiBUaGlzIGNv
ZGUgd2FzIGFkZGVkDQo+IGFsbCB0aGUgd2F5IGJhY2sgaW4gdGhlIG9yaWdpbmFsIGNvbW1pdCBp
bnRyb2R1Y2luZyBzdXBwb3J0IGZvciBkeW5hbWljDQo+IGZ0cmFjZSBvbiBwcGM2NCBtb2R1bGVz
LiBSZW1vdmUgaXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOYXZlZW4gTiBSYW8gPG5hdmVlbkBr
ZXJuZWwub3JnPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5s
ZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9t
b2R1bGUuaCB8IDQgLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9tb2R1bGUuaCBiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9tb2R1bGUuaA0KPiBpbmRleCBhYzUzNjA2YzI1OTQzMC4uYThl
MmU4MzM5ZmI3ZjQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9tb2R1
bGUuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbW9kdWxlLmgNCj4gQEAgLTc1
LDEwICs3NSw2IEBAIHN0cnVjdCBtb2RfYXJjaF9zcGVjaWZpYyB7DQo+ICAgI2VuZGlmDQo+ICAg
DQo+ICAgI2lmZGVmIENPTkZJR19EWU5BTUlDX0ZUUkFDRQ0KPiAtIyAgICBpZmRlZiBNT0RVTEUN
Cj4gLQlhc20oIi5zZWN0aW9uIC5mdHJhY2UudHJhbXAsXCJheFwiLEBub2JpdHM7IC5hbGlnbiAz
OyAucHJldmlvdXMiKTsNCj4gLSMgICAgZW5kaWYJLyogTU9EVUxFICovDQo+IC0NCj4gICBpbnQg
bW9kdWxlX3RyYW1wb2xpbmVfdGFyZ2V0KHN0cnVjdCBtb2R1bGUgKm1vZCwgdW5zaWduZWQgbG9u
ZyB0cmFtcG9saW5lLA0KPiAgIAkJCSAgICAgdW5zaWduZWQgbG9uZyAqdGFyZ2V0KTsNCj4gICBp
bnQgbW9kdWxlX2ZpbmFsaXplX2Z0cmFjZShzdHJ1Y3QgbW9kdWxlICptb2QsIGNvbnN0IEVsZl9T
aGRyICpzZWNoZHJzKTsNCg==
