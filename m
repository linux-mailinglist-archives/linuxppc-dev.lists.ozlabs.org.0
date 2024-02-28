Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA9286B38F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 16:45:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=NnQnpny3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlJb21bPwz3vZd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 02:45:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=NnQnpny3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::700; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlJZH3Phhz3bZ1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 02:44:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+lKkzUgiT28zuxxjj7VCP1mTgz9av7kywkvH7DKkQeSPO7r6CIfkKBrN/OKAPWPHW4Ls8lCIrLhgiuucUWTqHW4l21XvY1haaUOjOVnBGMlHtxSag3akKDlG1wmBRkRmjZOUGEP+kAH5ou4gL9yX1gHWKs2GTXzprspj+vR6S8zwHQ6Q4BdCWYGdz0V/bjLACP0oygBHnlWGrYH9Ex2yfip/PebFAYB2QVf7OA6jZnyiw3XChKd4s7WAvWU5tfF6UbeQDo/Ntd4772qWiVxEpJv85lU5/Mz01NnG3Ojk4YvwRm2LO/8A2ML9YENcXQXLH278K2yM1exhk4l6CmyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CENs7gSpryXGKee86mfDA0ussYio97rqoQhbB4ptrE=;
 b=LlqCzv7QYPFFnDlDGnTY/6D31H6IkzS6gLU3GbCl09jWlbdvaLOSzepuyTNNH6qgpPJVthh+f6f3D8OIvUsFqXFRjUcQZbku5A0jS5H4ZkeIje3lMVVyDlFGxNan6bKzRwI82bmPB3fKOw6hlyNWlDsRVbNDyn6zYK0cDCnF4mdzpaukjntTp0hMFE8eRrt/I4amjLNinbJCV1R5GaXUv0is8Q+b0IxdTsTIgZuKKf2ZpC9Qq0H0AQvpZQRMOtBoEgfA/UEe6sTsUVbZgk2nA7CZLxOt3/pxvbxg9jQlC2BNkHlrALbr0E1aFi8Oosx0sS4fHNCb9vzYF04s3A/d5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CENs7gSpryXGKee86mfDA0ussYio97rqoQhbB4ptrE=;
 b=NnQnpny3+s4D+qqSyscdJguu931ZkAxqJeOokKa0xKkSrS/bSZPF6vEfWqFrqcBJ3S64bVHagmbWHesCXWLPRh6e6QvTZqe7EHkFW7sOUerEJmBs6ESa38BmkiKm/gFLBk1iRdZX+KZrzTgDbvn+SD9uFhGPKaEf1pI5hPRMmF18r6bYlRcEQnfGKSdPZD+nuOrpFICMRKOj4TknGUT6rr/DbyOKSr+W1509QAObOL9FGSx/LtN2gKAx2hujrkc/fQM2KEOz7Y9iX7GgPAbirR4aspXPWHmVP4oc/O351JDmnElVxBXKyWr+9kKRxo7Pzb2EOOz/MqmLX+yXT7LvlA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3118.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Wed, 28 Feb
 2024 15:44:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7316.037; Wed, 28 Feb 2024
 15:44:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Eric Dumazet <edumazet@google.com>, Vadim Fedorenko
	<vadim.fedorenko@linux.dev>
Subject: Re: [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
Thread-Topic: [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
Thread-Index: AQHaajbPzM0q4kW/m0SFUzTmZzl0P7EfynaAgAAKIQCAABDwgA==
Date: Wed, 28 Feb 2024 15:44:14 +0000
Message-ID: <ad84ba42-2555-47dc-ba6b-66ce0eb0b1db@csgroup.eu>
References: <3fcf3a2c-1c1b-42c1-bacb-78fdcd700389@linux.vnet.ibm.com>
 <85b78dad-affa-47c3-9cd0-79a4321460b8@linux.dev>
 <CANn89iJEzTjwxF7wXSnUR+NyDu-S-zEOYVXA+fEaYs_1o1g5HQ@mail.gmail.com>
In-Reply-To:  <CANn89iJEzTjwxF7wXSnUR+NyDu-S-zEOYVXA+fEaYs_1o1g5HQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3118:EE_
x-ms-office365-filtering-correlation-id: 3e94b9ed-6a82-4a38-2555-08dc38741d8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +/f0brVt/tYbOs9mJDOnY7awi9aujNucyEWy8gmaI0gMO9N6mOTs0RFjyhQnlXJsOsLzYNZL2giUhOIFvoI1WIYSe40zAXkYejFKQFOImhvWhTLJjjwMARPwD8AKOIFQQpctDQe/GA8Pi8aUuoXm5v7/9l/XIczKEuR/fI1I3X5MMchAZhAUBwOSVFWSdvsRJ1ltqYaMVul9XvHj9AGWCvz/Zwedcm2zAKKmNss+PVOoQEsbGLLqdOWgvSQC7Q2zsm1ULGISyRvf0Me99w3bn1Lxq3g1iJSh3Al1uvh3O1VFNC/+iIcyLRPgAGtQZ5YOCFfTcbmbaBTYN+BTMBEV2Iji1YqNXQw6t41Lqo1synLU6cBt8mNplUNf2IIjMc4YqnOB7WACn50k0fQx9VJc5nEGdu+IFKXqjBVQWk3rUmTaELuymO9EcuVAUOpk+9/k8JQyBa/zg5JAgpLE1FW6ONfQIxM3VHUZK0l2u/5CdB6DKa0LfgGvZLGol6s+r9b1ouWoZ5Z0RpRC12GRQ5W771Ewa08s8kt04Li3/pbrnwWkbTNL9tAc+Yja19k3k968QmKpNkjxU98H9LC7HBjYNObWLTs2WmfLJ70yt2d0kLZK14Tj6kWLaeISHH7ZiAW4lrdvtZKBngzRlv9zXLZyhv50utRnLTJ/jkCsimbfmnkC6OZypYm/rjXRjH9Z48zrF/PhFy0njUm5qxO9Sh0P7T2MFnVpZM5/+T8IKGF1ZYk=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cSs4S1M5Vm5rOEpmMkU5QmtUWlZSd2NBcm83ZmJna3VNRWtMbGRyVEVlRWpO?=
 =?utf-8?B?c3A4clNVV3dlKzRCVVFKUTJ4QjE2OEZ3R3VPRzhZb1Nvc3dTTGluZWNla3dv?=
 =?utf-8?B?WUg4TU9kQmtVcTBEV3h4VHlLZy9CK0QzUlZXenlVelF3cHNHNmpWZGdQL081?=
 =?utf-8?B?L2djMlFMbTNkN0tYdWluaGEzWGo2elVsQ3dpSXpwVGZYeEtrTkN4UldqSkND?=
 =?utf-8?B?OVJEdldFcVZiOGFaOTRCZDZWV2N3ekg2Mzd3dGdVN1JPQlVPYm5VMWdTaXhN?=
 =?utf-8?B?azJNNjkvQ092ZlJvOE5tbTFsVVNreDNIWkxTcGh2bEhaTXlxdHY0WWQweEVk?=
 =?utf-8?B?c2JJSFRGLzZOazFlZW13NkRWV2FqNlpmSHZKcnV4cG9lVzg1L1hHcEVtSDgz?=
 =?utf-8?B?QUxGRGYvU0RtK2xJOWZHM2dqWFhENFJINzFTMmFIdFBpRW9pSzlVRUNUd1pH?=
 =?utf-8?B?bXBjeGVSZEM0WmRCZU0zTVovUjJUTWU5QWFXeGozbEVVTHVGRXRBeTV0RHlG?=
 =?utf-8?B?bDlERDRsUk94ZFlSb1ZycnF5NTZFNlZQVkpRb0ZRcVZpKzR4dHBYbEc5QWpw?=
 =?utf-8?B?VVpqTVdJZVU0NWNzUVlDR2tSN0NZbTFIdDRRZ3BUa2NGTWdUaHZlbXI2WHBB?=
 =?utf-8?B?b09BNUc0eUlvVm43UzhDbEllRldMVVFkVllUSkpobjdWcGh1MGd5OHZFT1dh?=
 =?utf-8?B?bThTaUs4VDJFM0lRUndHK3lSREoyUTZQVmVuejJERExGVlE3ay9TQVdnTGtl?=
 =?utf-8?B?Mk9rUEM1eWtaeUJ3Z0YwaFpGM2plR0FlMDdjNngycFVEWGdhWitVZHZleS9v?=
 =?utf-8?B?Q01EZFVJUndrN0lUNUtPV1NZVXNlMzd3cE1FUWRHYmZGcnhaZ2ZOOUYrUjlo?=
 =?utf-8?B?akk5MkF6OWIyY0RlZlVibUFkTEV6UkgvWGNpWmJDTUFsUSttS0w5Ui9jVkNI?=
 =?utf-8?B?RVluZGhrZkhOWEFUL3ZVYi9XWnBGTTBzR3JqMWkvWTlkalF1c2ovSGhaWS9w?=
 =?utf-8?B?SDhSaXlhVnRzbG5ldmtSNWs4WnVSdVhmUFBYMEwwK0RFblNDekkyd2dMS0Mv?=
 =?utf-8?B?RDAwQzZxck9sYnVpQVliWkVYcElTQXczWWhhOWJUcmNEOXpLaFVkSjBzNDVq?=
 =?utf-8?B?STh0YUVPV0pWMmVDajBQYWlLcStFRlJnOUNmUFpQNHlJTlhyTkRlbzlzWEtm?=
 =?utf-8?B?MlF3NTZsWHh3elFZTDQ4d0tGaFRzWjVhSFJGZzRUWmpZRWlvdlIzcFNsU3hX?=
 =?utf-8?B?QzlEMkRHSS8xeUZPSXNQZFJKRnJ3OUVVSmJBSzRtNlptOUMya2VDRWJBeHZ2?=
 =?utf-8?B?ZVkrM0V5T1dVV25Mc1Vkd2pNQ1ByeXZBYnRFdGRGa2h2QkxsQnllVy9nUG54?=
 =?utf-8?B?U3JOb09Ra2toN0ZwdVlONGVmK0ZabEZWd1o5V0ZNYlJySjcvaExLb3BxWVhB?=
 =?utf-8?B?VkR6MVI3d0pkMlJLdDhtWFlNSHJmNTVlSkZaeENpRDZJd0lYUm01QzdWeUQv?=
 =?utf-8?B?QlBqUjFtYzZGTWp6UVZPRzJhTG9NczRhd1h2WnR5bjZodE5DQ0FJUXl2OUNr?=
 =?utf-8?B?NVp4WWhzUHhYLzlZMTVDVlZUeWx0TUZIRVowN1Q1K1Y0TEJZQitaQXM1bVRO?=
 =?utf-8?B?OGIyRU9zRkFOM0JvMmhtTElSa0ZPV0NLSll2dTNtTk9jay8rTjFJb2Jzci9w?=
 =?utf-8?B?d0NJaEsrSkJzcTZYRjJNUEdpd3M2YkRsbjZjUy9RNmd5QXlyc2N5R2JJcklJ?=
 =?utf-8?B?Kzd1SlBubERXbEhOY2VXblQvS09XWjBzeDdpR085dDM5TWhnVUozUkFWWk9Y?=
 =?utf-8?B?UjEyUFhuMU9zN09rYVpDVDNYUTlHSUM5LzA5SUovTjZ3ME5HNU00NG1DNDVi?=
 =?utf-8?B?cFJQUVFSd3gwc3dXR2VDbTRzMVBtaitQR2pXWVRucUNKQnppdE4zNnRZSmQv?=
 =?utf-8?B?WFNxaXpxWFpPY1B3Q3FzZUMwcSszaTMrWDkxZG85dnZnMllHcmkzMmtHQXBz?=
 =?utf-8?B?c1RsbWUzaVY0K1JjdXpjUzBFcnJmRm8zdXVuRGRCUzFRVE5xYXUzQ1pOeVNz?=
 =?utf-8?B?QTNRWi9kcHFwSmFtRUsveFFwRDlTejZFZGs2QVIvRDdaUTJsWFJKN25BcUNv?=
 =?utf-8?Q?uKkZwYpblm3RrT+o0PxkFk/Dm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0864BC955030D8438CBD8578674EBBB2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e94b9ed-6a82-4a38-2555-08dc38741d8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2024 15:44:14.2485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8b/cbpOLEy1XZnrhh+75qAcGe8DJ9HF1K/UHxUXwjF3TDIfVPEDL0BeWU3kvOxZeiuAzznI5YIeh+JTNyHVvurSjeSw97dOhGAOtsFc6UBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3118
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
Cc: "venkat88@linux.vnet.ibm.com" <venkat88@linux.vnet.ibm.com>, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arkadiusz.kubalewski@intel.com" <arkadiusz.kubalewski@intel.com>, "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, "jiri@nvidia.com" <jiri@nvidia.com>, "kuba@kernel.org" <kuba@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzAyLzIwMjQgw6AgMTU6NDMsIEVyaWMgRHVtYXpldCBhIMOpY3JpdMKgOg0KPiBP
biBXZWQsIEZlYiAyOCwgMjAyNCBhdCAzOjA34oCvUE0gVmFkaW0gRmVkb3JlbmtvDQo+IDx2YWRp
bS5mZWRvcmVua29AbGludXguZGV2PiB3cm90ZToNCj4+DQo+PiBPbiAyOC8wMi8yMDI0IDExOjA5
LCBUYXNtaXlhIE5hbGF0d2FkIHdyb3RlOg0KPj4+IEdyZWV0aW5ncywNCj4+Pg0KPj4+IFtyZXZl
cnQgMGQ2MGQ4ZGY2ZjQ5XSBbbmV0L25ldC1uZXh0XSBbNi44LXJjNV0gQnVpbGQgRmFpbHVyZQ0K
Pj4+DQo+Pj4gUmV2ZXJ0aW5nIGJlbG93IGNvbW1pdCBmaXhlcyB0aGUgaXNzdWUNCj4+Pg0KPj4+
IGNvbW1pdCAwZDYwZDhkZjZmNDkzYmI0NmJmNWRiNDBkMzlkZDYwYTFiYWZkZDRlDQo+Pj4gICAg
ICAgZHBsbDogcmVseSBvbiByY3UgZm9yIG5ldGRldl9kcGxsX3BpbigpDQo+Pj4NCj4+PiAtLS0g
VHJhY2VzIC0tLQ0KPj4+DQo+Pj4gLi9pbmNsdWRlL2xpbnV4L2RwbGwuaDogSW4gZnVuY3Rpb24g
4oCYbmV0ZGV2X2RwbGxfcGlu4oCZOg0KPj4+IC4vaW5jbHVkZS9saW51eC9yY3VwZGF0ZS5oOjQz
OTo5OiBlcnJvcjogZGVyZWZlcmVuY2luZyBwb2ludGVyIHRvDQo+Pj4gaW5jb21wbGV0ZSB0eXBl
IOKAmHN0cnVjdCBkcGxsX3BpbuKAmQ0KPj4+ICAgICB0eXBlb2YoKnApICpsb2NhbCA9ICh0eXBl
b2YoKnApICpfX2ZvcmNlKVJFQURfT05DRShwKTsgXA0KPj4+ICAgICAgICAgICAgXg0KPj4+IC4v
aW5jbHVkZS9saW51eC9yY3VwZGF0ZS5oOjU4NzoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFj
cm8NCj4+PiDigJhfX3JjdV9kZXJlZmVyZW5jZV9jaGVja+KAmQ0KPj4+ICAgICBfX3JjdV9kZXJl
ZmVyZW5jZV9jaGVjaygocCksIF9fVU5JUVVFX0lEKHJjdSksIFwNCj4+PiAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4NCj4+PiAuL2luY2x1ZGUvbGludXgvcnRuZXRsaW5rLmg6NzA6Mjogbm90
ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvDQo+Pj4g4oCYcmN1X2RlcmVmZXJlbmNlX2NoZWNr4oCZ
DQo+Pj4gICAgIHJjdV9kZXJlZmVyZW5jZV9jaGVjayhwLCBsb2NrZGVwX3J0bmxfaXNfaGVsZCgp
KQ0KPj4+ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+PiAuL2luY2x1ZGUvbGludXgvZHBs
bC5oOjE3NTo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8NCj4+PiDigJhyY3VfZGVyZWZl
cmVuY2VfcnRubOKAmQ0KPj4+ICAgICByZXR1cm4gcmN1X2RlcmVmZXJlbmNlX3J0bmwoZGV2LT5k
cGxsX3Bpbik7DQo+Pj4gICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fg0KPj4+IG1ha2Vb
NF06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNDM6IGRyaXZlcnMvZHBsbC9kcGxsX2Nv
cmUub10gRXJyb3IgMQ0KPj4+IG1ha2VbNF06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpv
YnMuLi4uDQo+Pj4gICAgIEFSICAgICAgbmV0L21wbHMvYnVpbHQtaW4uYQ0KPj4+ICAgICBBUiAg
ICAgIG5ldC9sM21kZXYvYnVpbHQtaW4uYQ0KPj4+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2lu
Y2x1ZGUvbGludXgvcmJ0cmVlLmg6MjQsDQo+Pj4gICAgICAgICAgICAgICAgICAgIGZyb20gLi9p
bmNsdWRlL2xpbnV4L21tX3R5cGVzLmg6MTEsDQo+Pj4gICAgICAgICAgICAgICAgICAgIGZyb20g
Li9pbmNsdWRlL2xpbnV4L21tem9uZS5oOjIyLA0KPj4+ICAgICAgICAgICAgICAgICAgICBmcm9t
IC4vaW5jbHVkZS9saW51eC9nZnAuaDo3LA0KPj4+ICAgICAgICAgICAgICAgICAgICBmcm9tIC4v
aW5jbHVkZS9saW51eC91bWguaDo0LA0KPj4+ICAgICAgICAgICAgICAgICAgICBmcm9tIC4vaW5j
bHVkZS9saW51eC9rbW9kLmg6OSwNCj4+PiAgICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1
ZGUvbGludXgvbW9kdWxlLmg6MTcsDQo+Pj4gICAgICAgICAgICAgICAgICAgIGZyb20gZHJpdmVy
cy9kcGxsL2RwbGxfbmV0bGluay5jOjk6DQo+Pj4gLi9pbmNsdWRlL2xpbnV4L2RwbGwuaDogSW4g
ZnVuY3Rpb24g4oCYbmV0ZGV2X2RwbGxfcGlu4oCZOg0KPj4+IC4vaW5jbHVkZS9saW51eC9yY3Vw
ZGF0ZS5oOjQzOTo5OiBlcnJvcjogZGVyZWZlcmVuY2luZyBwb2ludGVyIHRvDQo+Pj4gaW5jb21w
bGV0ZSB0eXBlIOKAmHN0cnVjdCBkcGxsX3BpbuKAmQ0KPj4+ICAgICB0eXBlb2YoKnApICpsb2Nh
bCA9ICh0eXBlb2YoKnApICpfX2ZvcmNlKVJFQURfT05DRShwKTsgXA0KPj4+ICAgICAgICAgICAg
Xg0KPj4+IC4vaW5jbHVkZS9saW51eC9yY3VwZGF0ZS5oOjU4NzoyOiBub3RlOiBpbiBleHBhbnNp
b24gb2YgbWFjcm8NCj4+PiDigJhfX3JjdV9kZXJlZmVyZW5jZV9jaGVja+KAmQ0KPj4+ICAgICBf
X3JjdV9kZXJlZmVyZW5jZV9jaGVjaygocCksIF9fVU5JUVVFX0lEKHJjdSksIFwNCj4+PiAgICAg
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+PiAuL2luY2x1ZGUvbGludXgvcnRuZXRsaW5rLmg6
NzA6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvDQo+Pj4g4oCYcmN1X2RlcmVmZXJlbmNl
X2NoZWNr4oCZDQo+Pj4gICAgIHJjdV9kZXJlZmVyZW5jZV9jaGVjayhwLCBsb2NrZGVwX3J0bmxf
aXNfaGVsZCgpKQ0KPj4+ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+PiAuL2luY2x1ZGUv
bGludXgvZHBsbC5oOjE3NTo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8NCj4+PiDigJhy
Y3VfZGVyZWZlcmVuY2VfcnRubOKAmQ0KPj4+ICAgICByZXR1cm4gcmN1X2RlcmVmZXJlbmNlX3J0
bmwoZGV2LT5kcGxsX3Bpbik7DQo+Pj4gICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fg0K
Pj4+IG1ha2VbNF06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNDM6IGRyaXZlcnMvZHBs
bC9kcGxsX25ldGxpbmsub10NCj4+PiBFcnJvciAxDQo+Pj4gbWFrZVszXTogKioqIFtzY3JpcHRz
L01ha2VmaWxlLmJ1aWxkOjQ4MTogZHJpdmVycy9kcGxsXSBFcnJvciAyDQo+Pj4gbWFrZVszXTog
KioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4NCj4+PiBJbiBmaWxlIGluY2x1ZGVk
IGZyb20gLi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9nZW5lcmF0ZWQvYXNtL3J3b25jZS5oOjEsDQo+
Pj4gICAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyLmg6MjUx
LA0KPj4+ICAgICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9pbnN0cnVtZW50
ZWQuaDoxMCwNCj4+PiAgICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvdWFj
Y2Vzcy5oOjYsDQo+Pj4gICAgICAgICAgICAgICAgICAgIGZyb20gbmV0L2NvcmUvZGV2LmM6NzE6
DQo+Pj4gbmV0L2NvcmUvZGV2LmM6IEluIGZ1bmN0aW9uIOKAmG5ldGRldl9kcGxsX3Bpbl9hc3Np
Z27igJk6DQo+Pj4gLi9pbmNsdWRlL2xpbnV4L3JjdXBkYXRlLmg6NDYyOjM2OiBlcnJvcjogZGVy
ZWZlcmVuY2luZyBwb2ludGVyIHRvDQo+Pj4gaW5jb21wbGV0ZSB0eXBlIOKAmHN0cnVjdCBkcGxs
X3BpbuKAmQ0KPj4+ICAgICNkZWZpbmUgUkNVX0lOSVRJQUxJWkVSKHYpICh0eXBlb2YoKih2KSkg
X19mb3JjZSBfX3JjdSAqKSh2KQ0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fg0KPj4+IC4vaW5jbHVkZS9hc20tZ2VuZXJpYy9yd29uY2UuaDo1NTozMzogbm90
ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybw0KPj4+IOKAmF9fV1JJVEVfT05DReKAmQ0KPj4+ICAg
ICAqKHZvbGF0aWxlIHR5cGVvZih4KSAqKSYoeCkgPSAodmFsKTsgICAgXA0KPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+DQo+Pj4gLi9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vYmFycmllci5oOjc2OjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybw0KPj4+IOKA
mFdSSVRFX09OQ0XigJkNCj4+PiAgICAgV1JJVEVfT05DRSgqcCwgdik7ICAgICAgXA0KPj4+ICAg
ICBefn5+fn5+fn5+DQo+Pj4gLi9pbmNsdWRlL2FzbS1nZW5lcmljL2JhcnJpZXIuaDoxNzI6NTU6
IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybw0KPj4+IOKAmF9fc21wX3N0b3JlX3JlbGVhc2Xi
gJkNCj4+PiAgICAjZGVmaW5lIHNtcF9zdG9yZV9yZWxlYXNlKHAsIHYpIGRvIHsga2NzYW5fcmVs
ZWFzZSgpOw0KPj4+IF9fc21wX3N0b3JlX3JlbGVhc2UocCwgdik7IH0gd2hpbGUgKDApDQo+Pj4g
Xn5+fn5+fn5+fn5+fn5+fn5+fg0KPj4+IC4vaW5jbHVkZS9saW51eC9yY3VwZGF0ZS5oOjUwMzoz
OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8NCj4+PiDigJhzbXBfc3RvcmVfcmVsZWFzZeKA
mQ0KPj4+ICAgICAgc21wX3N0b3JlX3JlbGVhc2UoJnAsIFJDVV9JTklUSUFMSVpFUigodHlwZW9m
KHApKV9yX2FfcF9fdikpOyBcDQo+Pj4gICAgICBefn5+fn5+fn5+fn5+fn5+fg0KPj4+IC4vaW5j
bHVkZS9saW51eC9yY3VwZGF0ZS5oOjUwMzoyNTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3Jv
DQo+Pj4g4oCYUkNVX0lOSVRJQUxJWkVS4oCZDQo+Pj4gICAgICBzbXBfc3RvcmVfcmVsZWFzZSgm
cCwgUkNVX0lOSVRJQUxJWkVSKCh0eXBlb2YocCkpX3JfYV9wX192KSk7IFwNCj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn4NCj4+PiBuZXQvY29yZS9kZXYuYzo5
MDgxOjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhyY3VfYXNzaWduX3BvaW50ZXLi
gJkNCj4+PiAgICAgcmN1X2Fzc2lnbl9wb2ludGVyKGRldi0+ZHBsbF9waW4sIGRwbGxfcGluKTsN
Cj4+PiAgICAgXn5+fn5+fn5+fn5+fn5+fn5+DQo+Pj4gbWFrZVs0XTogKioqIFtzY3JpcHRzL01h
a2VmaWxlLmJ1aWxkOjI0MzogbmV0L2NvcmUvZGV2Lm9dIEVycm9yIDENCj4+PiBtYWtlWzRdOiAq
KiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLg0KPj4+ICAgICBBUiAgICAgIGRyaXZl
cnMvbmV0L2V0aGVybmV0L2J1aWx0LWluLmENCj4+PiAgICAgQVIgICAgICBkcml2ZXJzL25ldC9i
dWlsdC1pbi5hDQo+Pj4gICAgIEFSICAgICAgbmV0L2RjYi9idWlsdC1pbi5hDQo+Pj4gICAgIEFS
ICAgICAgbmV0L25ldGxhYmVsL2J1aWx0LWluLmENCj4+PiAgICAgQVIgICAgICBuZXQvc3RycGFy
c2VyL2J1aWx0LWluLmENCj4+PiAgICAgQVIgICAgICBuZXQvaGFuZHNoYWtlL2J1aWx0LWluLmEN
Cj4+PiAgICAgR0VOICAgICBsaWIvdGVzdF9mb3J0aWZ5LmxvZw0KPj4+ICAgICBBUiAgICAgIG5l
dC84MDIxcS9idWlsdC1pbi5hDQo+Pj4gICAgIEFSICAgICAgbmV0L25zaC9idWlsdC1pbi5hDQo+
Pj4gICAgIEFSICAgICAgbmV0L3VuaXgvYnVpbHQtaW4uYQ0KPj4+ICAgICBDQyAgICAgIGxpYi9z
dHJpbmcubw0KPj4+ICAgICBBUiAgICAgIG5ldC9wYWNrZXQvYnVpbHQtaW4uYQ0KPj4+ICAgICBB
UiAgICAgIG5ldC9zd2l0Y2hkZXYvYnVpbHQtaW4uYQ0KPj4+ICAgICBBUiAgICAgIGxpYi9saWIu
YQ0KPj4+ICAgICBBUiAgICAgIG5ldC9tcHRjcC9idWlsdC1pbi5hDQo+Pj4gICAgIEFSICAgICAg
bmV0L2RldmxpbmsvYnVpbHQtaW4uYQ0KPj4+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2luY2x1
ZGUvbGludXgvcmJ0cmVlLmg6MjQsDQo+Pj4gICAgICAgICAgICAgICAgICAgIGZyb20gLi9pbmNs
dWRlL2xpbnV4L21tX3R5cGVzLmg6MTEsDQo+Pj4gICAgICAgICAgICAgICAgICAgIGZyb20gLi9p
bmNsdWRlL2xpbnV4L21tem9uZS5oOjIyLA0KPj4+ICAgICAgICAgICAgICAgICAgICBmcm9tIC4v
aW5jbHVkZS9saW51eC9nZnAuaDo3LA0KPj4+ICAgICAgICAgICAgICAgICAgICBmcm9tIC4vaW5j
bHVkZS9saW51eC91bWguaDo0LA0KPj4+ICAgICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVk
ZS9saW51eC9rbW9kLmg6OSwNCj4+PiAgICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUv
bGludXgvbW9kdWxlLmg6MTcsDQo+Pj4gICAgICAgICAgICAgICAgICAgIGZyb20gbmV0L2NvcmUv
cnRuZXRsaW5rLmM6MTc6DQo+Pj4gLi9pbmNsdWRlL2xpbnV4L2RwbGwuaDogSW4gZnVuY3Rpb24g
4oCYbmV0ZGV2X2RwbGxfcGlu4oCZOg0KPj4+IC4vaW5jbHVkZS9saW51eC9yY3VwZGF0ZS5oOjQz
OTo5OiBlcnJvcjogZGVyZWZlcmVuY2luZyBwb2ludGVyIHRvDQo+Pj4gaW5jb21wbGV0ZSB0eXBl
IOKAmHN0cnVjdCBkcGxsX3BpbuKAmQ0KPj4+ICAgICB0eXBlb2YoKnApICpsb2NhbCA9ICh0eXBl
b2YoKnApICpfX2ZvcmNlKVJFQURfT05DRShwKTsgXA0KPj4+ICAgICAgICAgICAgXg0KPj4+IC4v
aW5jbHVkZS9saW51eC9yY3VwZGF0ZS5oOjU4NzoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFj
cm8NCj4+PiDigJhfX3JjdV9kZXJlZmVyZW5jZV9jaGVja+KAmQ0KPj4+ICAgICBfX3JjdV9kZXJl
ZmVyZW5jZV9jaGVjaygocCksIF9fVU5JUVVFX0lEKHJjdSksIFwNCj4+PiAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4NCj4+PiAuL2luY2x1ZGUvbGludXgvcnRuZXRsaW5rLmg6NzA6Mjogbm90
ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvDQo+Pj4g4oCYcmN1X2RlcmVmZXJlbmNlX2NoZWNr4oCZ
DQo+Pj4gICAgIHJjdV9kZXJlZmVyZW5jZV9jaGVjayhwLCBsb2NrZGVwX3J0bmxfaXNfaGVsZCgp
KQ0KPj4+ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+PiAuL2luY2x1ZGUvbGludXgvZHBs
bC5oOjE3NTo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8NCj4+PiDigJhyY3VfZGVyZWZl
cmVuY2VfcnRubOKAmQ0KPj4+ICAgICByZXR1cm4gcmN1X2RlcmVmZXJlbmNlX3J0bmwoZGV2LT5k
cGxsX3Bpbik7DQo+Pj4gICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fg0KPj4+IEluIGZp
bGUgaW5jbHVkZWQgZnJvbSBuZXQvY29yZS9ydG5ldGxpbmsuYzo2MDoNCj4+PiAuL2luY2x1ZGUv
bGludXgvZHBsbC5oOjE3OToxOiBlcnJvcjogY29udHJvbCByZWFjaGVzIGVuZCBvZiBub24tdm9p
ZA0KPj4+IGZ1bmN0aW9uIFstV2Vycm9yPXJldHVybi10eXBlXQ0KPj4+ICAgIH0NCj4+Pg0KPj4N
Cj4+IEhpLCBFcmljIQ0KPj4NCj4+IExvb2tzIGxpa2Ugd2UgaGF2ZSB0byBtb3ZlIHN0cnVjdCBk
cGxsX3BpbiBkZWZpbml0aW9uIHRvDQo+PiBpbmNsdWRlL2xpbnV4L2RwbGwuaCB0byBoYXZlIHRo
aXMgZml4ZWQsIHJpZ2h0Pw0KPj4NCj4gDQo+IE5vIGlkZWEgd2hhdCBpcyB3cm9uZy4gSXMgaXQg
cG93ZXJwYyBzcGVjaWZpYyA/IFNvbWUgY29tcGlsZXIgdmVyc2lvbiA/DQoNCk1pZ2h0IGJlIGEg
Y2lyY3VsYXIgaGVhZGVyIGluY2x1c2lvbi4NCg0KQ2hyaXN0b3BoZQ0K
