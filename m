Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F6B5508F9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 08:41:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQjqB37jtz3cdw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 16:41:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=EyZDJvRt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::612; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=EyZDJvRt;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0612.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQjpR5fMXz3bY6
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 16:40:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8FADdPuAlV33y+hAEniRj2qk9YHrKvO53WaYVsdcmLRc9jtS72FZYQ5e7IMWB9fRANDBc5RKYz2xUO6N6ljMJw1lm8DUiSvnPUqlEvGEu+lqUnmOsYDlHIA4FHQPUQ1i2KdCv/aPDBrneDVjrs+NNzPk6n66Fy9lWfkYDSRnBimx9ZvwmN2l8nmg9nGPG54XairzeV3vKMMTHjDfGBI3Ow4wPdCdg+poU4BYksgWZxMxIhAJn0F+SaYuul4vIQTwMiChPqK8HxF6Q9k45T+n5vZZcyiE89DWM5KLfmo8aFHDIx2mf04zRZvBenhTAgsRKSO5iFDV8QOcbMWsHflsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zhFrrop1XZ8G46kznv+jETtzmMzxzUFZC8HaIN7tio=;
 b=Pz8rM+RxX+lQE0Aj2gy0bRN41Zh+W+4K0dDeHNu+TSqm7KU9bFz87HfQz3g6mjdxdS4qUVVdtrWoWYN6KJiXHh5egqPv/hsLIBTK6yOrg9HuScezru+20+gW7DTYZCgxLUUar4uWkAiErvLlv36PEymte1q2PBHDPch3zQja61T7iTFVMDpuiQ1wzQBH3EQIYuwtQOJ+g/23/uiLnKm6vQS6lYzswg23dOZ6akg5QxBoqVZ2aTGQw12N+GNfJBuUWxFxwlYiNmpRST9xmBBcWyClEG4F+Xzx8bK+2N0h0m1mQqfrg/D4ktdnnUdqxPrT5fdHhdUN2DWvdtAs+vS+gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zhFrrop1XZ8G46kznv+jETtzmMzxzUFZC8HaIN7tio=;
 b=EyZDJvRtgOxz07rOEzd+hN5riXhH7U68PDPnCJ5l/A5jcIzp4Kl0Wwl3pdAhMFpHwd+zECQrJo7TUUIedSlxyhXSOaYpENSY2Ret9ztJifZNz21lD5VpnRqD2q9QsnagBd2dHmYmEBaMqqIKuN2DFyKgHXqgCEaZX5+05AIaUjGZyA9g8nTDGRDlotTbnyELGwwy+DJAvSoA6C1sjJH6WFF0yvyzlMCuKHcYqbw10rKJOJ08KAEXBnpQQTBVNrQ0tGiiFt2KVQIccQCtota7zc3BWTWkilxJvEB9E7bR9Xsgf+WxpYw3l+32L1sYJwZU6x6H2wjT1Yb3/+GQyYwY2Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2997.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Sun, 19 Jun
 2022 06:40:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5353.020; Sun, 19 Jun 2022
 06:40:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Souptick Joarder <jrdr.linux@gmail.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"paulus@samba.org" <paulus@samba.org>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>
Subject: Re: [PATCH] powerpc/interrupt: Put braces around empty body in an
 'if' statement
Thread-Topic: [PATCH] powerpc/interrupt: Put braces around empty body in an
 'if' statement
Thread-Index: AQHYg4pDIyyjC9+Uy0y1YNhKTTwve61WR8mA
Date: Sun, 19 Jun 2022 06:40:22 +0000
Message-ID: <9341e518-ba3a-956f-65bf-1a824fa0c77b@csgroup.eu>
References: <20220619031114.92060-1-jrdr.linux@gmail.com>
In-Reply-To: <20220619031114.92060-1-jrdr.linux@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80de0493-c6fc-42c8-3223-08da51be95d1
x-ms-traffictypediagnostic: PR0P264MB2997:EE_
x-microsoft-antispam-prvs:  <PR0P264MB2997EDDF56D61ECC4D3F6AC6EDB19@PR0P264MB2997.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  yTGGoV9VOo/rmt3X3gUcsQrW/lWcgB4+LGC/UGdGMUwF4Popi1Q2JduLqWhdte/S901KdyXWkTtV4CPFnUj9aUqhZKJ3QcCXoK+4Wdh2FeifbIK1Gsi57eKW9UmT/1/fpZ9SbWnTFPKmwh13Urp7irMIRopXFaLT7EQ7bP15ZrSaF/MwQRAAirvMj/aOCjMVV5dXRQWYNpQSwF0w/rEjCGC6etjFdoXcAA3AFrVekg4Rko1VVejXx6E9+9LGWce7kgyP87G4Af7KOyEGvbKlzwvxVT7dAdwQFKLoV7GGS5Dfv/7pE1JmVpxZgNqETayEoGwiDJ9NGG6q7BmHuzNux6a93ITwWDIqScimyYa7GPJDYGZ51DKCVLEsL1aEWeZkIOFAnQCsU4EPFCx4z2sY5IY+lZ5na6sRoY3tyaOg/Bv/vCMUJ414ERd8pOA4l/JawBmT7PacOdg3/U38SfSNUJCTAFQ+aqn+ZY0ceTC3sG/+LxUcGZHDsVmvunwRBWcO30B7gB1lFPmpJN5AAOs8InTdA67LDIp0XJveNIoHPbq2uZWrrdvX/WZFel/hkc0G2TwxzgpS/kshE93lPtxVnuQrWPXbBw0xk5vtASGMScf7IjqDFi0RS1md3ofBTmmWyQa4dAmAj5N9jagk4UvifQY/6KfzYyQ3GUITDPZmSW9pCXuxNNB8A0XXDgNLcLKkGU2mSuylVeKfpE/UXfbimd9vM3xLkbuaFEzDR4U4p7OLSj/9MqpdZa0cS2rnjGGZ1blHAxyeIeIAXJx2ienqunBRp1bMRCVgF4ZSg5zw4nM7KpiTjs1Skfh/Ma4yUk+cXzARRqnx5VeavNS8uvIgwrTVcIHtS77MSdIrBo9fvPk=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(2906002)(5660300002)(66574015)(71200400001)(83380400001)(316002)(31696002)(86362001)(66556008)(8676002)(64756008)(66946007)(4326008)(66446008)(2616005)(91956017)(76116006)(44832011)(6512007)(26005)(54906003)(7416002)(186003)(110136005)(8936002)(66476007)(38070700005)(31686004)(38100700002)(498600001)(6506007)(36756003)(122000001)(6486002)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TmJDUDJIcUFkVXFFOVhGNUtISm9xdTVTRXc2Skt3cGFaTE5ld2dINTJDK0VW?=
 =?utf-8?B?SGNNdkVDQnRhd2ZkMG53NUU1SUhhMUlkYkVFQ2hPL3ByR1lqbWVQNkV1cFlH?=
 =?utf-8?B?bjhkeDZkY0VtZXRLT0l1NmpQdHJsWE9mcStnQ0RuTDlzMFIwRHZjbzNqWFBn?=
 =?utf-8?B?K0xLRjZsRFJGNzRrd3pkR0dWNDhwRW5NbUdnbXdMY0c4VEF1QWlOdGR4Z29x?=
 =?utf-8?B?QmdCaHpTTG8zWE5HZDkvQXN3eDAyaGY2aldxdU9qZEowR3Z1WXJxT0VVNitC?=
 =?utf-8?B?NXl1S1VRMk9hUWVqY3hjVE5XdUVwRVk0T1N3RWtzOUE4TEhWSXRsWVUya1Mz?=
 =?utf-8?B?RjU4dGs3UzVHTCtiMHBIZUcrWmdhMkYvWUxaUmJLbXAydlpNWUhoakxJa1h0?=
 =?utf-8?B?eE5Qckt0aVhPVVpWVGpORFBGTlM5K1VHTmI0WFh2WnVLLzN6MVJuTFdZaDRG?=
 =?utf-8?B?dVN0cVpoaTN5MGhPbTZpd3JjSk1CbTVLbHA5cWF4c015MFBOVzVyTW1DUk9S?=
 =?utf-8?B?R1R5cndwWEJaSzZQaEllL29MMENRYUJWV21xLzU4VDFkSDlzSllmUGxIMXV2?=
 =?utf-8?B?cUZEaUx1Q01pbkRyczFwWndYTkRvU3RIVDUyRnBSVkQ2RFFXRGozeHlRSERp?=
 =?utf-8?B?b2Q4RDFBNmliQlVvS2ZYYWR1WlRkWWF1d1FFRERvV3I0ZDJlUFBZZnBVQUR2?=
 =?utf-8?B?a2wxbm9tVkZMTFNaamVrWURUbWU0ZjdUcnBQdmlaYjNGRWwzelpXcWVFdHZO?=
 =?utf-8?B?djh0UVJyR3lncFlpNkdxbDdUK293S1dxVmJmdjFpSjR0SDVsRm9jN280NjZ2?=
 =?utf-8?B?bWxRTmg4Z0gwM0lvOE41ekZpQU9ZWjEyTDZiK2lBaHRaUm1XOGNueENFVjlJ?=
 =?utf-8?B?L2VLZ0JuK2dkSGtqZmh3YkRjYmVoYmZsUXNiRmo5a3RaRGZRZjZUWThSZWJE?=
 =?utf-8?B?U0xURWhUb1VtOXU0OCs5Nm5CWDNWMDhKM0xwc1JXd0YvempyNkd3aUdrVFF6?=
 =?utf-8?B?UXZUOEdvZVBmSkkzaUNhUTVRQlR1Q0xndGN3eHNFVW00UjNuaHRXRmNrQXpD?=
 =?utf-8?B?T0hFOWhJS29OdzEzTHVJOVRJdS9jUHBlRWlhdkFiUkhjMC84anNrWGtNMkVL?=
 =?utf-8?B?cUgzQnQyejBCc0tJNWhFY2ovMzRQNTVnNUdVajdNOWN3eUN4Vk1CUXc0RnFn?=
 =?utf-8?B?KzdHUXdNRzhHK3JiRVRJRzZadXJFL0l4R1dzK1huR08vbFJmdTFueEN6bUx2?=
 =?utf-8?B?dDZtd0tPemhrc3RKazRTRkNjbTk5WlQ2TWd6UjRQNHo5SmR5Q245c3crbktV?=
 =?utf-8?B?cDBKcXZiZHp6Tmk3eUlkbG96VndoYkxsa1FBZlByU1ZrTFlkUWJZSDVFaEIx?=
 =?utf-8?B?RlZXRjZRYWJYdm9OcWVNUkp2eTQwSS90Y3hPek1TK0hFdXlCaDBtcGZzaE9V?=
 =?utf-8?B?N2gxK3FlN285cTBya3hpKzhvRWo1dXlCSE9vU2EwTWJ1NnhhaFNMd3BRUmNL?=
 =?utf-8?B?eEUvOUNuVGs4Vm0xVitvLzRzNkl5aWRDS3BUTHZRaGNyZ1FRbVZUMHlJQ2g2?=
 =?utf-8?B?RTM3Zk9rT2daaWlvUU5MUTdDV2FjMVpmWkU4UG1hZHd2VGNPdURlRlhEbDhO?=
 =?utf-8?B?QnNSZkY0MUdOK2hXU3M1aEpIMFY5WXIxdVJ6cnB1UVNjdDdtRktQSXVPdUI3?=
 =?utf-8?B?cGYzRXRUVlRURitXL1ExNXhnQlFJaUVtM2JVdGFvVmdIL1VnZDRaQWN3akpy?=
 =?utf-8?B?dlVKNHpVWXhsSGMzODNpYWtLSDlYeERZYW1vZEphbXJ2Z2VHNWlrN0lTQjZZ?=
 =?utf-8?B?TVFVbGRHZFJLZTE3K0hZZ1FuczExMk0wWXVXaEE1Q2xkendrRTdONTJ1ejVG?=
 =?utf-8?B?Z3NSdzRHNGdPOGhvZ2lST0phVWoyUFYrZisrSUlsM2FQNE5jcTc4WEtmNURZ?=
 =?utf-8?B?b0pRM2tpZ2lkbzh2WTZ3S2J4Nmc0bkt5UEU3ODE3YUQybmF4RzhjRllyQ3l4?=
 =?utf-8?B?djZqaUJ2dGdycDNSeFhkQ0R1ZWRvVG5hV0pYclZIYnVWN1Y0c2RNejlYWnJi?=
 =?utf-8?B?QlpGSkswekNwR2tCbmkzUXZKc1FHcnQra3VwSmZVaHZhRHc2VTlpQnZhaXF1?=
 =?utf-8?B?WjRINVpnTUJJN1BzekJyL3JnY3FDaXFSN3dsbHNLYktYNEQxVElHZ3VjYnpx?=
 =?utf-8?B?YVJLTmdJSnpjb0MrMUkwZzU2WjRqNktIZXNMV0pnZkdzNVVoOWNpelUzS21B?=
 =?utf-8?B?V2NIaGRNQW8xNVIwc3poTS9mUGFMNlFKZktFNzBUSXYzcjM2NU9kMTMzSW5S?=
 =?utf-8?B?N01tN2M1WjdyeHBpc0U3dkVxeGszTUdMMysvSTBONmpNSGx5Tm5kQjAyL1pK?=
 =?utf-8?Q?Byt7OgGdVPsG/EziwdXIHa9E9+VEnGmJa/iCp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4844280F052BB4FB6C64327A8060C84@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 80de0493-c6fc-42c8-3223-08da51be95d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2022 06:40:22.5185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PMWOJcL3egJqvDTNdVaOZlZfwtTOUIrR9iES+rZAGNUae4WjoEFdxmKv6OdI18V9G2JvdZ5lthRNefK9mOkVwTXb8t2hT3J+BXV+PlYKCFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2997
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA2LzIwMjIgw6AgMDU6MTEsIFNvdXB0aWNrIEpvYXJkZXIgYSDDqWNyaXTCoDoN
Cj4gRnJvbTogIlNvdXB0aWNrIEpvYXJkZXIgKEhQRSkiIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4N
Cj4gDQo+IEtlcm5lbCB0ZXN0IHJvYm90IHRocm93cyB3YXJuaW5nIC0+DQo+IA0KPiBhcmNoL3Bv
d2VycGMva2VybmVsL2ludGVycnVwdC5jOg0KPiBJbiBmdW5jdGlvbiAnaW50ZXJydXB0X2V4aXRf
a2VybmVsX3ByZXBhcmUnOg0KPiANCj4+PiBhcmNoL3Bvd2VycGMva2VybmVsL2ludGVycnVwdC5j
OjU0Mjo1NTogd2FybmluZzogc3VnZ2VzdA0KPiBicmFjZXMgYXJvdW5kIGVtcHR5IGJvZHkgaW4g
YW4gJ2lmJyBzdGF0ZW1lbnQgWy1XZW1wdHktYm9keV0NCj4gICAgICAgNTQyIHwgICAgICAgICAg
ICAgICAgIENUX1dBUk5fT04oY3Rfc3RhdGUoKSA9PSBDT05URVhUX1VTRVIpOw0KPiANCj4gRml4
IGl0IGJ5IGFkZGluZyBicmFjZXMuDQoNClRoZXJlIG11c3QgYmUgbm8gYnJhY2VzIGZvciBzaW5n
bGUgJ2lmJyBzdGF0ZW1lbnQgLCBzZWUgDQpodHRwczovL2RvY3Mua2VybmVsLm9yZy9wcm9jZXNz
L2NvZGluZy1zdHlsZS5odG1sI3BsYWNpbmctYnJhY2VzLWFuZC1zcGFjZXMNCg0KVGhlIHByb2Js
ZW0gaXMgbGlrZWx5IHRoYXQgQ1RfV0FSTl9PTigpIGlzIGVtcHR5IGluIHNvbWUgQ09ORklHcy4N
CllvdSBoYXZlIHRvIGZpeCBpdCwgZm9yIGluc3RhbmNlIGJ5IGNoYW5naW5nIGl0IHRvIGEgImRv
IHsgfSB3aGlsZSAoMCkiDQoNCj4gDQo+IFJlcG9ydGVkLWJ5OiBLZXJuZWwgdGVzdCByb2JvdCA8
bGtwQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogU291cHRpY2sgSm9hcmRlciAoSFBFKSA8
anJkci5saW51eEBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvaW50
ZXJydXB0LmMgfCAzICsrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL2ludGVy
cnVwdC5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9pbnRlcnJ1cHQuYw0KPiBpbmRleCA3ODRlYTMy
ODljODQuLmI4YTkxOGJhYjQ4ZiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9p
bnRlcnJ1cHQuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL2ludGVycnVwdC5jDQo+IEBA
IC01MzgsOCArNTM4LDkgQEAgbm90cmFjZSB1bnNpZ25lZCBsb25nIGludGVycnVwdF9leGl0X2tl
cm5lbF9wcmVwYXJlKHN0cnVjdCBwdF9yZWdzICpyZWdzKQ0KPiAgICAgICAgICAgKiBDVF9XQVJO
X09OIGNvbWVzIGhlcmUgdmlhIHByb2dyYW1fY2hlY2tfZXhjZXB0aW9uLA0KPiAgICAgICAgICAg
KiBzbyBhdm9pZCByZWN1cnNpb24uDQo+ICAgICAgICAgICAqLw0KPiAtICAgICAgIGlmIChUUkFQ
KHJlZ3MpICE9IElOVEVSUlVQVF9QUk9HUkFNKQ0KPiArICAgICAgIGlmIChUUkFQKHJlZ3MpICE9
IElOVEVSUlVQVF9QUk9HUkFNKSB7DQo+ICAgICAgICAgICAgICAgICAgQ1RfV0FSTl9PTihjdF9z
dGF0ZSgpID09IENPTlRFWFRfVVNFUik7DQo+ICsgICAgICAgfQ0KPiANCj4gICAgICAgICAga3Vh
cCA9IGt1YXBfZ2V0X2FuZF9hc3NlcnRfbG9ja2VkKCk7DQo+IA0KPiAtLQ0KPiAyLjI1LjENCj4g
