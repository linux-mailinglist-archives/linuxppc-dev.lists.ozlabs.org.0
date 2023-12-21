Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A9E81BA76
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 16:21:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=J76Pu3Fe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwvKQ1gJjz3cY0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 02:21:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=J76Pu3Fe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::600; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwvJV0yzZz30gm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 02:20:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFh4umfDw6w5N/+jsizY8nhdE3CNs0jDV2iYovAXrhPLh+KiyJdNiu0zs7sjqnUDrghyuv+nUxX/aERIrO7InrY7q9v/Ut+Fk4oALoztd3WIjU5rVPprfYwL//wvHmvoYygPUy+EUTsAKtoupoAy13NBhaXVMJ8ALgPDTx6hE72sxKr+rcSKgGPxVXKjIGlj5kZKr+nKYFKQOX/AstkjKyh7Iq9ljKKu/7Oda/jRcbTNRastgOiKL53qXoWiZi0/YKzPMGoEq309flpm2HwqAp7JhkX9h/yqnhJDssQqLm2e3ocklrIPPADN9LLVLuCmcVzMMv4KU/wbUw2PTrOVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBZ2uCcv/rJmRbj5GHNtsHy5UVo3T5tg7GNP34Vo3ts=;
 b=eShJda/Mt89oDUlrJZg/ZoFZtsNWhGpOCpr81OBfA4kl7AlXtkT3sYTK8ZYT3CyuwqmwluQ1soSW/GyGi6RTOqPRw6sGmnCKq42GT7aLIhFUCPPzOcB8IedXCGH73Ot3Of+R34rqweYq9n6CSzQPhmRvNNyrpSEQXLYerrZdEguqs1+9accAozAL2QJ0++d1kXXVhlAOhPKkJo3Mgw1SjlpX8t8EVh18EeQA2r/AbE9lMY18I5eCA/fDYfQPlm4tUQEudtD4ivwZ40/b316Zp5wkhh1AyJBcJaNtekbzqXAC01donhT+nMlO5p/ZMX5K51JEFVCoa1feYwzRf5bGgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBZ2uCcv/rJmRbj5GHNtsHy5UVo3T5tg7GNP34Vo3ts=;
 b=J76Pu3FeeUQQGwaISFAFtw9h+OhLbLVK8pUKmgxjrY8YexXNgph3LYBK/XHMVDzgOw+PUPQlFPBkLtE0l5EXYAR3dNKsHw+yS7SdGI9h/vT1eAp124O+iZ5JzGhNgP7AKjhay4lsLosrAqXn6fIe4FX0J8SHOscpgVcqDucz3L/SxTeNrL6SypbRwOZ+86BWntgh/oN3GjbYBS2uvwzIZkFzEuSTF9TVe8KSXoe8VudvRG0n+aQUgl/2zqrNLplUG/LnvR6f0Fh0rJ5jHEBQbT8y2c//V5TWCZ7IsxzamVqfZ0P6IidxA68Gpj9/EgU647pSOIPZR+OosTx4fN3fQg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3337.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:110::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 15:20:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 15:20:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC PATCH 6/9] powerpc/ftrace: Update and move function profile
 instructions out-of-line
Thread-Topic: [RFC PATCH 6/9] powerpc/ftrace: Update and move function profile
 instructions out-of-line
Thread-Index: AQHaKfSSFFbB72zM4keIX1bFln/D9rCzoeSAgAA9XoCAAA85AA==
Date: Thu, 21 Dec 2023 15:20:14 +0000
Message-ID: <107a3da4-def6-4e66-a09d-67592ae056c7@csgroup.eu>
References: <cover.1702045299.git.naveen@kernel.org>
 <39363eb6b1857f26f9fa51808ad48b0121899b84.1702045299.git.naveen@kernel.org>
 <e2e467a3-7283-4f22-8cd9-2d1875f60e92@csgroup.eu>
 <20231221092545.1b696eb6@gandalf.local.home>
In-Reply-To: <20231221092545.1b696eb6@gandalf.local.home>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3337:EE_
x-ms-office365-filtering-correlation-id: 5baa7e72-7e56-4129-8451-08dc02385505
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3trNu0MMlcpM1dM4jwNO3dbn3Q+HTrkLIVqfbSg0bfU+mYtJ9xp8cDtV3VgpmtVbxYShEczyhMuvaj64C/o0AqXrgIzr4wA0pGlj8OqERLZxiuTECCE5ptgB3hTxNxp+wvjYf6qSgVY2RP+m5cl4rkH8C8AxiDQzpUPqm7qq8AyqTBVxgw8qlH/oQAnrgIp1W9FFJm+f0Q8P4qJQ4XPvUBKxCyoq5m53faVKP7kNkyGNlBNGQkbgSddc3pW1Qv96HFhSdhuxaGrRLbs5hEQTTOCodgEgtKbT7akvk5sO2TnWNukZx4E3UtcqkBxucFQQdHvDku5Vu6Qpt3/gdT+EV2KO0xv+ElH+fJpjQ3cG+rsi7x1gl4v5vHpE8t9OhJqE2eWnxDadFUwEptSCUghOs34bvMWqu92qbfpre5Ovb5I3UbNpyF0VEMViTBMxSzTFNf//JyiGEUBdIu0NoP9M/Zg2FDBhSCjrypsvY2kqOkpJpEqU5RM9mrRAqbLdhJVcpkuxG5O0peYDP40Stfc2PvMwMM4+qy4kJpiPRS9OHuKY1cXbgp7Ebihi1jo6wOG24IebtnZB5KUrVvsunmT3D2CzrF4lhMpzS66IZOmaEJ8qz4O0+jWDjrtx+Tgbk6tYR8nz/FOw8Ex6APo8FUUBFsQblzmi991MPCB7r1wWM8y6Wuf7fr9kQ+4aDkA5vzIe
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(366004)(396003)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(31686004)(2616005)(26005)(6512007)(71200400001)(6506007)(66574015)(36756003)(86362001)(31696002)(38070700009)(38100700002)(7416002)(83380400001)(4326008)(8936002)(8676002)(41300700001)(44832011)(122000001)(66446008)(64756008)(54906003)(66946007)(5660300002)(76116006)(91956017)(6916009)(15650500001)(66476007)(6486002)(2906002)(66556008)(316002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NHpNd29KK1BqT1pqamVWb0lNOEdvVFRqb012a2huS0lhZGFoZE0yN1h1Smlk?=
 =?utf-8?B?UFRNakVCZCswSnlnK2MwWk1aOUJwWm1rT2JUaGJwNlVsV3NUckdWQzI2VGZV?=
 =?utf-8?B?SjZIT0dWQXpPUEtaTnFRVzNLQnRkUGE1TDFNWXI0L0dNSTQ4bDk4T1h4ZlFw?=
 =?utf-8?B?T3BYdkk4RGF5YkxmUm80MUtQbjZUaktmcWZ4VS8rTWJCcmdpQUQ4bzJFckdr?=
 =?utf-8?B?eUYwUkRUQUJhTFRielJFdHZMZnFzUW04UmRoUWJWTEFJWUNGQUNyVkJWM281?=
 =?utf-8?B?L3JSUjM5MEZZNWJlYVlrRmhRU1BJN0pUMkhWUXNYeHBpTjBTVW1veFRlRmVy?=
 =?utf-8?B?azR4V0VDcHh0WUlrcWRVNXpnQmtDOWh0b3o0amFxN1ExaWl4YkUvWW82N0xY?=
 =?utf-8?B?YnhEd1YvM1VpUVVHMUdWRjEwVmJLMXJoSzBSQUN1eXByQ2R1TTBkYmhpMUlv?=
 =?utf-8?B?Qjl4NjVNY0FCMVdveURtYWNEZjlGSVRkM3NuVjhjUkdRVm1iM1dtVXZvM2Q0?=
 =?utf-8?B?c1lKYlI1NTROcTNKdUpyNkZVTUQ4S0JNaUlzODlJMlh0czBvZmF0TTgrU25M?=
 =?utf-8?B?azV0WE9ZTkJYdHUwa1g2Y0NpekVGMGorU0phRDBjZ3Q1SmdxVG84RXd2WHN1?=
 =?utf-8?B?aWM3TkQ3bEIvbjBDM2ZpQXlUb3NCTWdxVURCVmZBMlI2SHJXMTRoVTd1a0pQ?=
 =?utf-8?B?Y3RWd2JaTG10U0liRU13NXhSYmlKaFU4dnlxSXlBV1F2aVpUaXRmZmZpUGF6?=
 =?utf-8?B?blpPVDRUT3dESDFuU09TRDdmakg0TmdqUWh4SFV0YW9GME16NHA5b0lwb0VZ?=
 =?utf-8?B?elRISytUNlBMeE1VYTBaMFJWTUxabFV0WUZwOTk5QWVLa1NpaWc2VitSb2FZ?=
 =?utf-8?B?UUZIOXRKQ0JObGdGYnpsVW5tNEFnWDEwempZV1l6cFBuYmgzcExFTThMazFp?=
 =?utf-8?B?UVdkOXJlZTl6bnh6NElYdEU3b0RqUy9KWCtra3hiZk5xY1FIdTJXMmpJazY3?=
 =?utf-8?B?NWU4aWJ6Zjl1L2c0NUI0QzJQbkFBdWhieHdFdGNEKzJXaEczcHJMOXlSeXJF?=
 =?utf-8?B?NFFHZXY4cnlTZVNVZTBoT0s5ZGVNcW8wSHh4SHhxRElxbDV5MXdrL0M5WXBs?=
 =?utf-8?B?VURCeVdOTTdjQUZUUTZLN1VxaVdoTHU4b01ENjlyWWNQUDdwUTFKWC9tR3A4?=
 =?utf-8?B?eG5QQTkzOWJValRuUmFjUmFkOU91YzVXWDlvaXFNREI2Mm9xaEJ4VGFTUVZV?=
 =?utf-8?B?MzVhaUJSSWRNVS9hSm9HZTh4ZDVUSjlIczZQOWFiVEJLYWtxRGQwQkdUVFd4?=
 =?utf-8?B?cjlrU3I0U0JWdlF3L2IvWDhtS0ZuZ1Bpc1RvRkZTOTJiK1Z6b09tQksyc1Y1?=
 =?utf-8?B?UDZPMWVJUHIrRkZpdFpiWUZvSkhBZTlZelFEcy9nbFZqcXhSOWdabHZJazRS?=
 =?utf-8?B?RXdvZ1JJTHZwaTZTYjVpd2Z0WVRaZWZzaUNVZkxyRThSVGNvdkpoa2QrbTN6?=
 =?utf-8?B?eUVHcWpxOVI4eWNZR1R3L052Y1RJUk53YWo4RnNrNXRxNUV4RDJSMTBFTnRr?=
 =?utf-8?B?YnNTTFU0ZTI3ZUpMcHJnSlVwRDYwWlhNSXFId0NNWXBhVHdwaEpReS9oa0Zr?=
 =?utf-8?B?TWdkck5GbkJqcjBSSWFEbzJrK3dkZmpEc1ZxTGQ3RFRNVHErRlhjYVdRdFBx?=
 =?utf-8?B?YWZCT2h1UVhEamNCRXNOTmJzY3NOQzdPZ1ZhNjgrSXJRL1lQQVE0WlhMNHBi?=
 =?utf-8?B?UWE1ZGJWcVZFQzJTR3RobXlPV0Fua1o5ZDh0eXFPbkxITllaTi84dUJUM0Vk?=
 =?utf-8?B?MCs5b3dGL2wzbzdqQk9oYk11ckNnZHBFY0xzZ01Zd0NYdTc1TkpCYWRDQzdS?=
 =?utf-8?B?MkhGWHpEbm5lUGJqTmU3WHRGUkxyeVY0S05hQ1g5Vy80K1ppQWhJNjV2S3Fk?=
 =?utf-8?B?aTN5eGZac2w3UElFNWF1VERxVGhpWHY1cFdXZ2wxemdnblUxcEozbzRUL3h4?=
 =?utf-8?B?NzhiamRHN0RQNXg1UWNTdXVGQWY2TWFjVG9pUlhvMnVPSHQwNFovNy8wRGtv?=
 =?utf-8?B?SS9qdGNaaWFiQUhvcEpIT1paTG9EV1Y0SDhJa0Ztd2JmbGJkR2kvNzl1MkVC?=
 =?utf-8?Q?gcbseBnqwiGX3KTQ18ZIadyup?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F8943835091C04BAD318F290206F5AE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5baa7e72-7e56-4129-8451-08dc02385505
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2023 15:20:14.7377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jWh5pdhaKjzEnfCJG9hwAhDQEE7MC4yyBwF7G7mmElniuG968PseuZwSr3mozGgA/pELb8Ox6Egex0Hdz3fnDnNxCvJdzUGVUVpLpdXR/Gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3337
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
Cc: Mark Rutland <mark.rutland@arm.com>, Florent Revest <revest@chromium.org>, Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzEyLzIwMjMgw6AgMTU6MjUsIFN0ZXZlbiBSb3N0ZWR0IGEgw6ljcml0wqA6DQo+
IE9uIFRodSwgMjEgRGVjIDIwMjMgMTA6NDY6MDggKzAwMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+Pj4gVG8gZW5hYmxlIGZ0
cmFjZSwgdGhlIG5vcCBhdCBmdW5jdGlvbiBlbnRyeSBpcyBjaGFuZ2VkIHRvIGFuDQo+Pj4gdW5j
b25kaXRpb25hbCBicmFuY2ggdG8gJ3RyYW1wJy4gVGhlIGNhbGwgdG8gZnRyYWNlX2NhbGxlcigp
IG1heSBiZQ0KPj4+IHVwZGF0ZWQgdG8gZnRyYWNlX3JlZ3NfY2FsbGVyKCkgZGVwZW5kaW5nIG9u
IHRoZSByZWdpc3RlcmVkIGZ0cmFjZSBvcHMuDQo+Pj4gT24gNjQtYml0IHBvd2VycGMsIHdlIGFk
ZGl0aW9uYWxseSBjaGFuZ2UgdGhlIGluc3RydWN0aW9uIGF0ICd0cmFtcCcgdG8NCj4+PiAnbWZs
ciByMCcgZnJvbSBhbiB1bmNvbmRpdGlvbmFsIGJyYW5jaCBiYWNrIHRvIGZ1bmMrNC4gVGhpcyBp
cyBzbyB0aGF0DQo+Pj4gZnVuY3Rpb25zIGVudGVyZWQgdGhyb3VnaCB0aGUgR0VQIGNhbiBza2lw
IHRoZSBmdW5jdGlvbiBwcm9maWxlIHNlcXVlbmNlDQo+Pj4gdW5sZXNzIGZ0cmFjZSBpcyBlbmFi
bGVkLg0KPj4+DQo+Pj4gV2l0aCB0aGUgY29udGV4dF9zd2l0Y2ggbWljcm9iZW5jaG1hcmsgb24g
YSBQOSBtYWNoaW5lLCB0aGVyZSBpcyBhDQo+Pj4gcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgb2Yg
fjYlIHdpdGggdGhpcyBwYXRjaCBhcHBsaWVkLCBnb2luZyBmcm9tIDY1MGsNCj4+PiBjb250ZXh0
IHN3aXRjaGVzIHRvIDY5MGsgY29udGV4dCBzd2l0Y2hlcyB3aXRob3V0IGZ0cmFjZSBlbmFibGVk
LiBXaXRoDQo+Pj4gZnRyYWNlIGVuYWJsZWQsIHRoZSBwZXJmb3JtYW5jZSB3YXMgc2ltaWxhciBh
dCA4NmsgY29udGV4dCBzd2l0Y2hlcy4NCj4+DQo+PiBXb25kZXJpbmcgaG93IHNpZ25pZmljYW50
IHRoYXQgY29udGV4dF9zd2l0Y2ggbWljb3JiZW5jaG1hcmsgaXMuDQo+Pg0KPj4gSSByYW4gaXQg
b24gYm90aCBtcGM4ODUgYW5kIG1wYzgzMjEgYW5kIEknbSBhIGJpdCBwdXp6bGVkIGJ5IHNvbWUg
b2YgdGhlDQo+PiByZXN1bHRzOg0KPj4gIyAuL2NvbnRleHRfc3dpdGNoIC0tbm8tZnANCj4+IFVz
aW5nIHRocmVhZHMgd2l0aCB5aWVsZCBvbiBjcHVzIDAvMCB0b3VjaGluZyBGUDpubyBhbHRpdmVj
Om5vIHZlY3Rvcjpubw0KPj4gdmRzbzpubw0KPj4NCj4+IE9uIDg4NSwgSSBnZXQgdGhlIGZvbGxv
d2luZyByZXN1bHRzIGJlZm9yZSBhbmQgYWZ0ZXIgeW91ciBwYXRjaC4NCj4+DQo+PiBDT05GSUdf
RlRSQUNFIG5vdCBzZWxlY3RlZCA6IDQ0LDlrDQo+PiBDT05GSUdfRlRSQUNFIHNlbGVjdGVkLCBi
ZWZvcmUgOiAzMiw4aw0KPj4gQ09ORklHX0ZUUkFDRSBzZWxlY3RlZCwgYWZ0ZXIgOiAzMyw2aw0K
Pj4NCj4+IEFsbCB0aGlzIGlzIHdpdGggQ09ORklHX0lOSVRfU1RBQ0tfQUxMX1pFUk8gd2hpY2gg
aXMgdGhlIGRlZmF1bHQuIEJ1dA0KPj4gd2hlbiBJIHNlbGVjdCBDT05GSUdfSU5JVF9TVEFDS19O
T05FLCB0aGUgQ09ORklHX0ZUUkFDRSBub3Qgc2VsZWN0ZWQNCj4+IHJlc3VsdCBpcyBvbmx5IDM0
LDQuDQo+Pg0KPj4gT24gODMyMToNCj4+DQo+PiBDT05GSUdfRlRSQUNFIG5vdCBzZWxlY3RlZCA6
IDEwMCwzaw0KPj4gQ09ORklHX0ZUUkFDRSBzZWxlY3RlZCwgYmVmb3JlIDogNzIsNWsNCj4+IENP
TkZJR19GVFJBQ0Ugc2VsZWN0ZWQsIGFmdGVyIDogMTE2aw0KPj4NCj4+IFNvIHRoZSByZXN1bHRz
IGxvb2sgb2RkIHRvIG1lLg0KPiANCj4gDQo+IEJUVywgQ09ORklHX0ZUUkFDRSBqdXN0IGVuYWJs
ZXMgdGhlIHRyYWNpbmcgc3lzdGVtIChJIHdvdWxkIGxpa2UgdG8gY2hhbmdlDQo+IHRoYXQgdG8g
Q09ORklHX1RSQUNJTkcsIGJ1dCBub3Qgc3VyZSBpZiBJIGNhbiB3aXRob3V0IGJyZWFraW5nIC5j
b25maWdzIGFsbA0KPiBvdmVyIHRoZSBwbGFjZSkuDQo+IA0KPiBUaGUgbm9wcyBmb3IgZnRyYWNl
IGlzIGVuYWJsZWQgd2l0aCBDT05GSUdfRlVOQ1RJT05fVFJBQ0VSLg0KDQpZZXMgSSBzZWxlY3Rl
ZCBib3RoIENPTkZJR19GVFJBQ0UgYW5kIENPTkZJR19GVU5DVElPTl9UUkFDRVINCg0KQ2hyaXN0
b3BoZQ0K
