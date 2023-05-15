Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AF6702F72
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 16:20:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKhNB0vLzz3f8Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 00:20:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LEIt6092;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::613; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LEIt6092;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKhMJ3fl8z3bgn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 00:19:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfoC2ee68NyLr81UKFd+4BIuh1bygqb9cbTvEPuhV4KX0ZMuJLLIG0qqGOZstcx1vdot9bhClTN2iPTCmNXce6b0Tdbqbiw/Sir1GjWNKT7Zj7aHYhshDST4GVp9H/14eBed4uGQ2eDvNAj+a8iRIFTLeTtDfqWzHUWtj7k4rG5aDLcutCiroknGCGCIJvxX9ZEexow4r4bMbaC8ahSxs3OwpJadNEaapKyQTa/q+oba4feetgOnpzqW4SrO68vARkNdcgP5IfqTserHl/sSjiUmDA6w/CuCvxqT1nNTHdSTn7SwVjLBWinrYp6kEjhX08GcT91W+0Yzi5+oWWtRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DRrNbIqwclRcLY6CAJfqjf/M4ZzXlEscMPtvUQphsE=;
 b=cfnZvOU3xWAK6BYF99dLLjVNqts+BIWXIVhfyD43IqHf13XDmCgyn8t8pR92EnEnim8YEl4SXX8CwAdm5I/Ij0gc1LMaEz/ou7OXO7VVhtYwofUImdqcgGRUVcH9VOLv6QNmMMDDlgS+lBkJh3hc+EkGK6DGmIE3S0zI7E0Apx4Z4hgw3tYhmOsgaYOHZ92q3swgkyJSFCKcPly5IXOjF6iHEJKWPYoXWpOb3XV61AJBZPStzQQFHpGN9RRbAaRRgrqs6r80YmQTf9JExNxa95yunuGrpJVgkCkrcNb/CmYJvuV4Z1BGGpCUh4/rPIdli9ewpl0/og20WEso53Mvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DRrNbIqwclRcLY6CAJfqjf/M4ZzXlEscMPtvUQphsE=;
 b=LEIt6092nmAYEdtAbtTPeHSYchIv4ctPhAXid6hJu7DHkslX6ANRxs4/UP5Fmu2bEgQi1FWQTEGZUbVyEAjIyHSYd79gQ666LT0OBycF4+I5VLjv9UDhjfi3FNRsQTTSah+wwbf4CPhEVR29qTyiBv9vxWdUloZfeXsTgwCaWCFvf2d/LSrpE9apRCJHlTfrOTUIaGLjpf5u6fXx0HwzpntMAwQPF3d2vn1cPmmH3y7zuVDRT/G4K8n/TekoLbGfWZjL9rXZAQfUnLXa7lHuLNFZR1ztfIuEPL04IvZmLiL9dLbqDvbS/BUJ2tjA4R+BCjZKx63Vrsv8iw0352JoTA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3358.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 14:19:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 14:19:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 6/6] powerpc/64: Rename entry_64.S to prom_entry_64.S
Thread-Topic: [PATCH v2 6/6] powerpc/64: Rename entry_64.S to prom_entry_64.S
Thread-Index: AQHZhugt6aecBubnS0CBC5XNfwgKo69bUW6AgAARJgA=
Date: Mon, 15 May 2023 14:19:02 +0000
Message-ID: <08db0f60-d3ce-d49f-98d0-9d0a6c672ae6@csgroup.eu>
References: <20230515044543.78903-1-npiggin@gmail.com>
 <20230515044543.78903-7-npiggin@gmail.com>
 <CSMVPKLWONBY.2X37RTHC6OCNB@wheely>
In-Reply-To: <CSMVPKLWONBY.2X37RTHC6OCNB@wheely>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3358:EE_
x-ms-office365-filtering-correlation-id: c5776ddc-822d-48ec-04ef-08db554f5576
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  m7mxVfwrYBGnrBZ5am+B7bkP3dsufy4D9E6qeXYFcYtCHgtLnHKmHp64ffK5+q6/61IasNu1JfSCOu8R8rwJgwsjrPLYPU5B7CiPwre3JuWedf+7r0HgqNZ/YKQFe9+JYjk+WWO6uJdUPSiK92RO759khQzn7T4dDjKbyy1X9LUT41UlJUD8+CkClENorDH1KOUYvMVwX8Fuy3ZjIcDszInPCY7f4vkhTzxMxX8NjNB6IvryvFAEvAdiqYe9vnSJrJSbweAuXt6Amm+GdFJig5+K2rXr6fcPy8e5PqfMXUfY7VLGznoW9Iu+4BCM+fcut2Te9ABcK+AKW0CMGHHENRImlQI6pucZAfax/78klB8edrwycZk4AiW00y2N65UY1XB9jVIrkUHo6CFg7Gs0FjIfWAEsGTjab2AKUiihiwg0O52Fi3t4mYLMhOB7H4KQnJJ+Q4QT0kd/PcVN2uzHYz5YsApKIYuzZ0YE+Pw4DGHXEVnCQn9z6SPzQ9h4EXyfgYcsYERsEnWZ3KB9P5b0Ueikg5nxsvB2vX3jZH4PWgrEwuhiphKFfMUya926woBYw1kG6ubpvpos1qxgxQhSfF/HEEyaE4YLsFiwabLw07mONzLb0mlHuuvpAwdcAzRcgihV7Pu0yZEZKY4X8gWgq+Ie566KYdPIqlyReeMSjO6esRk13HdTpr7/gkEyFeWR
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(451199021)(66574015)(83380400001)(66476007)(66556008)(64756008)(66446008)(66946007)(91956017)(76116006)(2616005)(6486002)(26005)(6506007)(6512007)(478600001)(110136005)(71200400001)(186003)(44832011)(86362001)(8676002)(8936002)(5660300002)(2906002)(31696002)(36756003)(41300700001)(38070700005)(316002)(38100700002)(122000001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TFo4ak1KR0dUMHVCWWs2OFlkSS9CakxtK09GMHZLdG5Ick9IMjZ5VDAxcnkr?=
 =?utf-8?B?TTlSamd6VlhVb2pPcUhLalpDdUlYeXBYdzFFK2MwOTlWTmN2UzUyUy9jN1Rh?=
 =?utf-8?B?LzcvMEdsUVVYSGlkeGtHczA1Z1ZHdHQyakxtNWFESXUybUg4OC9FcERMTHJu?=
 =?utf-8?B?MCs3UkVwQ0lBM29BTGQreDh6M1c4UExLRXhGYmhTbWZnSnNiNlFOcSsxSEp2?=
 =?utf-8?B?UEUzMElINzlYaDFReXJEMTBBOUpKQmw4amlHa1JpMHhWdU15bGppNS9HZzZM?=
 =?utf-8?B?akxCRUZrbVlibjhvazE4bHJaQzB1UEJ3T2xsRDJYVE9xTTdqWm5EWUpnaXQz?=
 =?utf-8?B?cDlKSWhvY0Y3NENKZzl3QzVjQUhaRnI0NkIzenNEMmc2dGU3TWxkWmV0UUJl?=
 =?utf-8?B?MWZQek1YMHNHVi9XaXE4OWs3VFhKaitMYlBQWHh2ZW5aV1l2ME5kWGtzVHFi?=
 =?utf-8?B?Q1NiTGhudTY3NGRBUk9VcmE5Mm1HMnBmeEc3TTlDUU15VTF6NnFRdVJSRFVW?=
 =?utf-8?B?eUJIKzluRVZSZmVZSTd5S3ZFTU5MbC9GbGNrdkg4WVZQOHE5dTFraGh6Vzlj?=
 =?utf-8?B?eDh5UW94VlJ5MS92amcxUWpwQmhGU1FUOVUyam8raFhmNTBwcFhxM1BPK2dP?=
 =?utf-8?B?ckRIN2E2L29qcjY5VFBkYXdXdkZHUUljOGh6YVFSNUp0RVZ5c1c3dU5vZW03?=
 =?utf-8?B?aVR5a0p6TXVRbnRsdXNlZUZqWHJIRWR2MENuRThyRGFoZFA1Z0V2NUpnODBu?=
 =?utf-8?B?M1R0SkNSWG0zR04xaHFtcDZJQUFKTWZoMy9TWVA0T3BXK1d6TnhOUjBVRlZm?=
 =?utf-8?B?bU5HWGc4dnRUZFZSVCtaRGdLcG9pQ3hlcTRHVUJOZFRYMVc4cnMzU2pobU9p?=
 =?utf-8?B?UWgvaTFXV1RaNFRoa2hxWGVLbVpHbU85ZEEvdzV1NkJpeWxHUXdxbytnUS9Z?=
 =?utf-8?B?NE1IUmRrenF0SXc4QkVlZ3BqQzVXUkhnVTJrYVM2NG4vbFc5MnJjZDlLY1Q2?=
 =?utf-8?B?eVhGOE5Zdi9kTlM3OS9SbFdSb0MyUG5NcEJIeC9KUGViV2VvckpnK0NkQmpj?=
 =?utf-8?B?UDBwbWhRZFNYY29XWG84V1JKYXRqd1dJRk8zNjFvTEFuYzdRQ2VmU2g1QjRI?=
 =?utf-8?B?WGNjQ2RnUVZSa0tMNm13T3RCeWJNV3h3S01GSVR0emxmZFVwaGl6Qkh6WEIr?=
 =?utf-8?B?SjMxK1c5b0xjZHY5Q1hnNFA3ZXNDOUM1bHlXR3FVTkRJNFVUVWw4T1dyaEdq?=
 =?utf-8?B?amF5M0ZHN2xtdHMreXdtWXhQc1diUVJ3KytOWUxzSnI1OWdxVW95Y0Z6NnJK?=
 =?utf-8?B?bXZyR2JzT0hibElhQzEyUmZiWmNVaGgxenZ0cXBXbnJJZ2Z1ZHVVc3FwUXI1?=
 =?utf-8?B?U3NZVmQ4Rk5nQm5Yd244Rnh1VzNOMExENG5Nb0Y1b2t2eWdzQUhZdGhnUUhM?=
 =?utf-8?B?WkFrU1lOa0hOeDduSk9lMXMzYVgyYVlhT0FNaGhEdENYZWhpWWdWeit1QmdL?=
 =?utf-8?B?V1JUZ0pNU0hpeEpOT2V4d1RnSzFkZzl4ZUNtWlhHTlNwWmVKTXlzUkF3LzVo?=
 =?utf-8?B?QXJPcW9ndzhWSUhUalQ0MVdVT3pIRFRTaFR1bitjRnhwUkVNU1ZNZVdBNmZK?=
 =?utf-8?B?d3RkbjJqOUpXOUlKSXU1bndYcmRIdHRsZ2l4Qk9tZm0rMnFzL3VtMDVaRmtv?=
 =?utf-8?B?UVhGNWdKdEx1dVpmMzNGZWtJcXRyZEVpbVFIeERqM3A5ellKbWJ4R0FVQlZr?=
 =?utf-8?B?RGE2MXdDaHd0WVEwY0RqRXk4T042SS9qTDRqdjFXYkxWaWgzSzRwVUJSTFVO?=
 =?utf-8?B?TzdOZWh6SnBuejRCRUlsRWZJNmVRSm50VnZtQlBWdmIwbVhrNjYvNDBJNXNl?=
 =?utf-8?B?cU9kN3NHdG5oV1UzSTJTeDM0Q1QxTzBmRFZVUHZ1aU0xQnRhUW1BdmluNGgr?=
 =?utf-8?B?a0hyQ2U4K2FTbDN1RHE2V1VJNGdLQWRJbzNtZEkxaVNkVG5VYUpRSmJ1WUNQ?=
 =?utf-8?B?N29tRHAyTFphZzhLVlhocUhJdXpYWmpKalNxdkwrK2FtU0ltSkRwcWYvS1lE?=
 =?utf-8?B?K3J4VXltYlc5T202ZHZ0ZGlHTmtEZ0ZVYnJwaFY1dytrK2pxbFY3K2MvSCsx?=
 =?utf-8?B?OXJhL3pCYkFHdGJBNjBhR1JEYnE1UkNlQUVISCt1bzM2QWRGN09IV0dSbWxG?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <220DC55DD27FBA439585AF953B683B96@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c5776ddc-822d-48ec-04ef-08db554f5576
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 14:19:02.7105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 66aZjPEK0KSrcuwO4Kut/vkPNayXPKd6QCFmaU5IRiBjUWTay7cBRHqerYZs6ro+TY6/2ibJIZYpNVn70Elt1ebk4DvUFraIGToA1VH6enQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3358
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzA1LzIwMjMgw6AgMTU6MTcsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBNb24gTWF5IDE1LCAyMDIzIGF0IDI6NDUgUE0gQUVTVCwgTmljaG9sYXMgUGlnZ2luIHdy
b3RlOg0KPj4gVGhpcyBmaWxlIGNvbnRhaW5zIG9ubHkgdGhlIGVudGVyX3Byb20gaW1wbGVtZW50
YXRpb24gbm93Lg0KPj4gVHJpbSBpbmNsdWRlcyBhbmQgdXBkYXRlIGhlYWRlciBjb21tZW50IHdo
aWxlIHdlJ3JlIGhlcmUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgUGlnZ2luIDxu
cGlnZ2luQGdtYWlsLmNvbT4NCj4+IC0tLQ0KPj4gICBhcmNoL3Bvd2VycGMva2VybmVsL01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgfCAgOCArKystLQ0KPj4gICAuLi4va2VybmVsL3tlbnRyeV82
NC5TID0+IHByb21fZW50cnlfNjQuU30gICAgfCAzMCArKy0tLS0tLS0tLS0tLS0tLS0tDQo+PiAg
IHNjcmlwdHMvaGVhZC1vYmplY3QtbGlzdC50eHQgICAgICAgICAgICAgICAgICB8ICAyICstDQo+
PiAgIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkNCj4+
ICAgcmVuYW1lIGFyY2gvcG93ZXJwYy9rZXJuZWwve2VudHJ5XzY0LlMgPT4gcHJvbV9lbnRyeV82
NC5TfSAoNzMlKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL01ha2Vm
aWxlIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9NYWtlZmlsZQ0KPj4gaW5kZXggZWM3MGExNzQ4NTA2
Li5mOTRjODkzZTAxNGQgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL01ha2Vm
aWxlDQo+PiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL01ha2VmaWxlDQo+PiBAQCAtMjA5LDEw
ICsyMDksMTIgQEAgQ0ZMQUdTX3BhY2EubwkJCSs9IC1mbm8tc3RhY2stcHJvdGVjdG9yDQo+PiAg
IA0KPj4gICBvYmotJChDT05GSUdfUFBDX0ZQVSkJCSs9IGZwdS5vDQo+PiAgIG9iai0kKENPTkZJ
R19BTFRJVkVDKQkJKz0gdmVjdG9yLm8NCj4+IC1vYmotJChDT05GSUdfUFBDNjQpCQkrPSBlbnRy
eV82NC5vDQo+PiAtb2JqLSQoQ09ORklHX1BQQ19PRl9CT09UX1RSQU1QT0xJTkUpCSs9IHByb21f
aW5pdC5vDQo+PiAgIA0KPj4gLWV4dHJhLSQoQ09ORklHX1BQQ19PRl9CT09UX1RSQU1QT0xJTkUp
CSs9IHByb21faW5pdF9jaGVjaw0KPj4gK2lmZGVmIENPTkZJR19QUENfT0ZfQk9PVF9UUkFNUE9M
SU5FDQo+PiArb2JqLXkJCQkJKz0gcHJvbV9pbml0Lm8NCj4+ICtvYmo2NC15CQkJCSs9IHByb21f
ZW50cnlfNjQubw0KPj4gK2V4dHJhLXkJCQkJKz0gcHJvbV9pbml0X2NoZWNrDQo+PiArZW5kaWYN
Cj4gDQo+IE9vcHMgdGhhdCBkb2Vzbid0IHdvcmssIG9iajY0LXkgaXMgbWVyZ2VkIGludG8gb2Jq
LXkgYmVmb3JlIHRoaXMuIE5lZWQNCj4gdG8gbW92ZSB0aGF0IG1lcmdlIGRvd24gYmVsb3cgaGVy
ZS4NCj4gDQo+IFRoYW5rcywNCj4gTmljaw0KDQoNCkFuZCBpbnN0ZWFkIG9mIHRoZSBpZmRlZi9l
bmRpZiwgeW91IGNhbjoNCg0Kb2JqLSQoQ09ORklHX1BQQ19PRl9CT09UX1RSQU1QT0xJTkUpICs9
IHByb21faW5pdC5vDQpvYmo2NC0kKENPTkZJR19QUENfT0ZfQk9PVF9UUkFNUE9MSU5FKSArPSBw
cm9tX2VudHJ5XzY0Lm8NCmV4dHJhLSQoQ09ORklHX1BQQ19PRl9CT09UX1RSQU1QT0xJTkUpICs9
IHByb21faW5pdF9jaGVjaw0K
