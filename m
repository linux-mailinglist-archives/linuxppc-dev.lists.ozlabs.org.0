Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC4947EBF9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 07:11:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKxX81XzSz308G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 17:11:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62d;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKxWf48MFz2xXs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Dec 2021 17:10:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBEHNc+Ccgqjiv90oVUHDKD7/0Tu6huNRNQ+JQ61vhVB9PjrtID4YsHlpwL6//rD5ixPkj1huhkJUGsjx+5Y7FVUdpaYX44zmCh/8XJvQwsDvdbzX+NtWUq3Zjn61E6trP5F5qbEbC00WRtNM0ocTl4W77MX8blGXSC/aN2ctnBPvxb/yxOz+slZO6x50JhgIyXOFCxQ1clRcpiaKN3yfNrertfP8cnw+g+RXyi+JfwqZql1xeF3vfm2PaoMIlJC+WGiQOZHfY6r9XVYalYjYlotCgszpbzLwBqIR2ZQicIuuEbM4rR88T/2eV2sobDmFMf4LNNX8WezhjTrpSFx4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYfYlP/ZorviMIZ+RtEYpwXT7dJwdA7a3JZrUJZm7Gs=;
 b=kERA4ermxTi+1XLnWKW/PlCuN5QXmHXWGRj+2tLi1t9fm+FeHYsH5Fd3K+TXPiLtFF5TprAN7OhKmteQJaOUoyMdaURCY0VWj3Dlb7alTsgfOzMYMsBOdMFgun8lHl9STXLnSTBgmCY8n415gjX4ioiQSdb7oaBTFp/l40C2j+DgFi4meSXRO5K24g/VFyV9ngICa4R+NtkLmGoFsd4DFW6kTlUyupQ3T3Vy1s6z3LOMXPa66AOGtKtAko44KrGMM6JRR2/Vm8QkBJ4CqVLD7G6ICUPZFUKncJo3DpYpdYV9rGhRjHP0tneWynZbFB7ReScb7gFGRtGhPM13XsTMGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2780.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:19::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Fri, 24 Dec
 2021 06:10:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%7]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 06:10:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: code conditional on non-existing PPC_EARLY_DEBUG_MICROWATT.
Thread-Topic: code conditional on non-existing PPC_EARLY_DEBUG_MICROWATT.
Thread-Index: AQHX9+bpwKxnLB6mCUGSdobyDruDOqxBKhwA
Date: Fri, 24 Dec 2021 06:10:33 +0000
Message-ID: <27eefbf2-fc2c-7800-1397-8acfea7ed7e8@csgroup.eu>
References: <CAKXUXMxa6zuTncNjTVHeU7nJ9uvv3KqMtSDocMC7P5hxfrkakQ@mail.gmail.com>
In-Reply-To: <CAKXUXMxa6zuTncNjTVHeU7nJ9uvv3KqMtSDocMC7P5hxfrkakQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88e845c2-985e-4159-fddd-08d9c6a41820
x-ms-traffictypediagnostic: MRZP264MB2780:EE_
x-microsoft-antispam-prvs: <MRZP264MB2780C14517FB91FF8BC49649ED7F9@MRZP264MB2780.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MBw5kXQWEyUYPc392iTCH0yg8iHuV9KUsWops/GjrwQxEaluHeMZm/9hHaBHYktRofX/ctA5BuIYwoGROtrX5O26tVBkleQlV2MBPEUuIz2E9B/27em2Mfm003m7bpJ2vHF4UZ7VZ+mraepJIucFhWrh1dvL6lCcJNwgm+LJ4F6MW17Gt6scfZD9mdBMHub5DqXBFskm5jYEgZIKrU2hwrMTkFptKVyNf2qQZm6syLkZl6OmL9SUklZX2EtluObHrlQdgMfde2WOZ3cBqUr/RpJ6dA7vFZrxiyvsUqcFTiayiop3MPE84kL5D8UgjCHE7l0YGyVrfQfkcl/RAJCu0VVu7BQPTelOZSjDtEvhUjfCOQZ2ot4Rzz1Rl2k4CBuAC226vmpTdgRQK4sjzovULLklOa+tOwuOG5xwCfoREnARJiq5L0whVBXn4F3BaVPEcLNTp3RRd9obRIzTuljlmyzR+fa0PPDjEvBI6dwh5lt53lxZKOytA/7ATag4IgURD0nNF7WBkttAvXcI1QPm1oYPoXMYHDwSk/v4MQVQTDshZtIjC6XjtBo189J1PQz8CFoQAGEjBjtnmbrZYvgg1v2tc4EdtTbvdMnTWgtlbu0NULYe45uoVfiTPqm+UBjbnRT/64ktBnqKqn20qvGW+1aLhN/XWi78xMexTXUsQKEmvb6w7Eo+hbRcbRARLR6MxMElPG7fqZDJI3OK17zgnvEdXrLG+CAaTYVIg98p/805dvm5ARqmx8GpiRHQARzVOxHQScoZwWV1z3tIoO7zdBdAK/cKfrc1Lb8kGVGuFif2waHmpXbLdo4eRK8Xr6IWl5ueuUeZeOSePMl1GAU/Tvl9nALxwd/VsgeXUqLjGps=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(31686004)(36756003)(38100700002)(508600001)(26005)(4744005)(66946007)(66446008)(6506007)(76116006)(966005)(91956017)(54906003)(122000001)(71200400001)(83380400001)(64756008)(66476007)(66556008)(31696002)(2616005)(110136005)(5660300002)(2906002)(4326008)(8676002)(316002)(66574015)(186003)(44832011)(6486002)(38070700005)(8936002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1NhcE9Jb0l3TmU3VzgrcHBmRlR0TFE3OExzeEs5MDA2ZTJnSFdyMHpXUG9T?=
 =?utf-8?B?UHd2NktCK1pLRmJZMmRxc2dEUFJqcExpU0hiclFVRmU4WWFjYmtKVU4wTGts?=
 =?utf-8?B?Tkh6dHB4NHQ0QXBLV204ODFld2dyb3JpYWgyanhkRktQV2NZekhWN2k2YXJ2?=
 =?utf-8?B?dGd5TzZlWktBZkQrSFIrbXZZWjZKMDdMeVdsbDJhaGVMWG4rb1hndmxzb2Rm?=
 =?utf-8?B?K3dYZ0YxVm5PSU1BVDRXaTlUYTZVLzN0cVlDc0U3VnpJTFlNQmVrdWlubWxh?=
 =?utf-8?B?ODVuc0gwL2xUbDY1Sno3dkZ1ZmFFVDBLODJtYjBpcmIwakxYUVN3UlZyS2tV?=
 =?utf-8?B?K3orbTIwU1YwNDFMbHNPam5FQWRrOFhrUEJKZ2djUG1nY1hJRVA3c25qL0VQ?=
 =?utf-8?B?eVR3Q3dwZmMyS0xYSGlVa3pYQTJwVnVHd0xRSFVpaytvNCtDalJaNjdwcWFi?=
 =?utf-8?B?dGU1eTZjdXNIZDZTenB1c1d2Z1V6TG5FMXRhVkZLQlhieXc3YmJIQXg5VmMv?=
 =?utf-8?B?M0VDSXFtMmZPTFJZMi9HaXl4QXc2cmhyNy83WWdtdTZJWHdBcy9lUVBJVVJN?=
 =?utf-8?B?N3RGeEdZSnloSGJORlhRaHYvOXNlb1pmbGlzMXJHaHlnRHJKVHA4WENPd1E2?=
 =?utf-8?B?STU2TEFzNU9Gc1RlVGRPeG00cWJWaG9KLzUvLzBEazFFekZhRUVUTW9BNkVT?=
 =?utf-8?B?eFpwVTlPU2tVTkZYME9jQ1phQmRocXVBdTVCVXNqcHk2NFlaZVRsY01HRlBX?=
 =?utf-8?B?anV0SG45aFc1bjZiNUZqZm50Ylg5NzZVSHQwdUpHejFtd1lXcXluTHdtNEVo?=
 =?utf-8?B?ZGpKZ0RmNmhUeFlkNFE0c01SYWp3ZUUwTDQ4MENBMG5HMXRyUmJRVjNLWGx4?=
 =?utf-8?B?SjlHdmhXZEF1WUhFdHNXUm0rVXNmODNVRGxYUzNGWE12YXEzRmtkQmtlWC9n?=
 =?utf-8?B?TU53SDRrdlo4SkhzSnMrd2R6L3lpWHRrV002eDZCOHRVaHhHQy8wWGFVSWMx?=
 =?utf-8?B?MUVJQkFZME9VS0VXYXA2SVBLSUZrM2RtcGdCT25DZFRmYkc3d2s3QU1iN3pF?=
 =?utf-8?B?M3loTGo3cFExVk91MnZ6MEh6YnJ6bXRJSXRBdXRFSWUyK1B1dUwxU2JYK0dJ?=
 =?utf-8?B?ZzduRU5GMGI0ZGp4S1RmZENkNHFVdE9PRU5IVmdCbjk4TExLR2E4WXk2SC8x?=
 =?utf-8?B?TWxpRG5lUXR4dXAxdURuaVBNQStRdW5pM0RUTTZkREgza0IrM1ZPSit3SFVY?=
 =?utf-8?B?dFNGWHo5aFBhcHpmNjl5bFpDd2xKUm0yRXVsZ1BIeVRydEd6ZGxSWEtkT0d1?=
 =?utf-8?B?eDZheWFscFRJOHo1SkIyNEpxR2lWU0RYZzV4SG1UZlhuNGdLWGwrNGREa3Ru?=
 =?utf-8?B?OGNEV3RMNkkwQzE4c0RpbDc2SHhYa3JhUldqVGs5VGhtNEhqblEwOEJ2aU9C?=
 =?utf-8?B?bVJ0U3BhL2lSU0QrNFpxRXRnNk1QcTdNMFhpWTJyQXpCZHhVUmhUS2JPbSsz?=
 =?utf-8?B?cXE0c1pjOWN6ZFhqTWhEdHlib3NoN1dFdmV0N2FCcHRsSlpjOEM3U3ZDUW5X?=
 =?utf-8?B?aXVUZlh6L0E1SnhPWC90N2xycW1nQ3pYVkpuUEpOaStWMFNMTXlTaTh5VmJ0?=
 =?utf-8?B?cWJBdjY3TVNsM3FNU013VFZtSXdsSlhjZWZtZTlUVlF2b0hkYjk4cllrTmww?=
 =?utf-8?B?bkltVjV1L2tXclBxNzNEbnhwUWlnQVJOTFpHV0hYQndKbjRXNGFmTkMveVFl?=
 =?utf-8?B?eTJzWFlNUkhlUnZNcG13ZHoxUzIwYkJPKzgveUFERWhsQVV3blZGZU80SkRS?=
 =?utf-8?B?d3JBZG5PYnJoNnpTdEFNZi9sdGZNN3dJR1dxdzNPME95eHU3MmRnbTZySWZl?=
 =?utf-8?B?bHhQOHFsTllzRnNNeWFkd0VOSmo4YVRBSUZ2V0pnM3hrdnY0R3ZDUjJTV2to?=
 =?utf-8?B?VXE2RHVGbXlvYzRuSjVwWHpwZWQ4RXExT3ZXays4Y2dxSVpsaDVTWjNLeElW?=
 =?utf-8?B?S1luMmhyZWRjd292R29ZY1ppYWZwQXFvMTFFZkszVk1HVHJSZ1NqYkk4MEVX?=
 =?utf-8?B?Vi9nSTkxVFdMdHlTZEtCTXAxNmM1YzlDV2xwYWg4akpTR1ZHWGhaRTlRRVBi?=
 =?utf-8?B?cURvanFiemtBaFNsZzBBbW9kWUwrVVdkaTczRExtTUdiNmQ3UGY3djFDQjlC?=
 =?utf-8?B?WHIyWklBNlJqSWIrdGR2bmg2SFNVZExqZ096ZWl2eDJMK0ZPaG9qUUd0WVFX?=
 =?utf-8?Q?du98xYjWtR7i6SuuxX0WwTukn468s0rejpQQlz44Zo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0FE4D49D4F44844B7F5878F027863AA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e845c2-985e-4159-fddd-08d9c6a41820
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2021 06:10:33.1074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aEOB3x7zj60x7TEJnSEsAkFTwRBSztetWlpJ/1bnoEeS3VDCaizSvhgxheEzDw5qS0Zx8MWFGNbUCRw8hc+i1Dxs/+i9uXapy5MwJrX8qNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2780
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
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzEyLzIwMjEgw6AgMTE6MjEsIEx1a2FzIEJ1bHdhaG4gYSDDqWNyaXTCoDoNCj4g
RGVhciBCZW5qYW1pbiwgZGVhciBQYXVsLCBkZWFyIE1pY2hhZWwsDQo+IA0KPiB3aXRoIGNvbW1p
dCA0OGI1NDViODAxOGQgKCJwb3dlcnBjL21pY3Jvd2F0dDogVXNlIHN0YW5kYXJkIDE2NTUwIFVB
UlQNCj4gZm9yIGNvbnNvbGUiKSwgeW91IGhhdmUgc29tZSBjb2RlIGluIGFyY2gvcG93ZXJwYy9r
ZXJuZWwvdWRiZ18xNjU1MC5jLA0KPiBjb25kaXRpb25hbCBvbiB0aGUgS2NvbmZpZyBzeW1ib2wg
UFBDX0VBUkxZX0RFQlVHX01JQ1JPV0FUVC4gSG93ZXZlciwNCj4gc2luY2UgdGhlbiwgdGhlIGRl
ZmluaXRpb24gb2YgdGhpcyBLY29uZmlnIHN5bWJvbCB3YXMgbmV2ZXIgaW50cm9kdWNlZA0KPiB0
byB0aGUgbWFpbmxpbmUgcmVwb3NpdG9yeSBvciBjdXJyZW50IGxpbnV4LW5leHQsIG5vciBhbSBJ
IGZpbmRpbmcgYW55DQo+IHBlbmRpbmcgcGF0Y2ggZm9yIHRoYXQuDQo+IA0KPiBBcmUgeW91IGdv
aW5nIHRvIGFkZCB0aGlzIGNvbmZpZyBkZWZpbml0aW9uIHNvb24/IE9yIGRpZCB5b3UgaWRlbnRp
ZnkNCj4gdGhhdCB0aGlzIHNldHVwIGNvZGUgaW4gdWRiZ18xNjU1MC5jIGlzIG5vdCBhY3R1YWxs
eSBuZWVkZWQgYW5kIGNhbiB3ZQ0KPiBzaW1wbHkgZHJvcCB0aGlzIGNvZGUgYWdhaW4/DQo+IA0K
PiBUaGlzIGlzc3VlIHdhcyBpZGVudGlmaWVkIHdpdGggdGhlIHNjcmlwdCAuL3NjcmlwdHMvY2hl
Y2trY29uZmlnc3ltYm9scy5weS4NCj4gDQoNCg0KV2FzIGl0IGZvcmdvdHRlbiB3aGVuIGhhbmRs
aW5nIGNvbW1lbnRzIHRvIA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xp
bnV4cHBjLWRldi9wYXRjaC8yMDIwMDUwOTA1MDM0MC5HRDE0NjQ5NTRAdGhpbmtzLnBhdWx1cy5v
emxhYnMub3JnLyANCj8=
