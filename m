Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2534D4D4208
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 08:50:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDh7j0cGGz30Jm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 18:50:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::615;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDh793jsKz2xss
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 18:50:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M68qoh9GL1oTgcYVfCZhiHUEh0kkuDNGI2cQEAKWFhtZ0f78WhaqoX3CVGP/CTqZoZmeIoHGAdui6NtgZzCAFtCyKUfcMy86OnM9/SBu1ch+fV+dnXVzwSbJSCSR6QaOtnsvzLWvHjqmr/UXIVJMtjJ089rwlmfw3mH1coITKu+fkER1ZWplihiObDsPPVp/Giewz5JTWw9YLHOPiaDRHzM52Y2/fyF4Zy8IR4Pjq213s0kucwB/tMiuYz6bqJSwXodiZfq5q1nZRSmjeNy1TEjnlhyYm7g/SxSWsh/Djb6/l3AT5GC/NYiehBoKYEHcBC6BNq2e8YgYtgEUIS5sKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SLju3DDxcnqTdWpYjaV8gfOE2tS3iaqKhiryQzVjcM=;
 b=HzdapicRGTgwPHuyK0C7C1hxnzAeKQpxSq7AhLk2uJom3bplW/Uxx+jRnSq7Mbs3mBjvB9KzTLFyr8zbVRsH/tjzYrYY8FfDdOd0+d8pgszdg1ibErMD4QCIyi5wrNtIcwSzgrtmzjKDEWby/dn44+HvYVWnKd0lJpHv8e5VsRTYNEpK2gMzN/tnKiaT1S1qpDszVK4WmLRSL2L9gae2gtsar0reSOTgYPxDzS/7e0CVJPDHkIPAlQaPvvDzG5aECXIyifeyF1d+HaxXvV1lAUWGbDBykjJGxFXZHe6Iy3AY8yTJyf2BuS7xeHvffd1BHYA4KuHsV0wmSpFFqfauxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2997.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Thu, 10 Mar
 2022 07:49:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.029; Thu, 10 Mar 2022
 07:49:51 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kajol Jain <kjain@linux.ibm.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH 16/20] selftest/powerpc/pmu/: Add selftest for mmcr1
 pmcxsel/unit/cache fields
Thread-Topic: [PATCH 16/20] selftest/powerpc/pmu/: Add selftest for mmcr1
 pmcxsel/unit/cache fields
Thread-Index: AQHYE1AWMSXWrrhwYEyGPS+9ySxqAqy4gDkA
Date: Thu, 10 Mar 2022 07:49:51 +0000
Message-ID: <4c7785cf-3b92-c273-35ea-fc95131fac46@csgroup.eu>
References: <20220127072012.662451-1-kjain@linux.ibm.com>
 <20220127072012.662451-17-kjain@linux.ibm.com>
In-Reply-To: <20220127072012.662451-17-kjain@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38792924-ad4e-40ae-42ad-08da026a8eff
x-ms-traffictypediagnostic: PR0P264MB2997:EE_
x-microsoft-antispam-prvs: <PR0P264MB29974FD345D4758A880E69F3ED0B9@PR0P264MB2997.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DpnJQhbVh7/bnWtjZYYwK9gBS3yhyZ7YQWfc0Kwjkpuqf0Hnx/lKs2S0dyovC6f0kfwjfn2X9BUOgSdDjGMVl5pz2vee5iBSu4MK9/qNTWBFJt1GfNIEAFePM7mz14ZL2VYOaHkFsiUYgBBEfIJ+PzTKufGLQRdPzkTEVPH68qaB7DytFdZ0lph1a2WpnU/uMS2nSjar/xGIf4w3hMdTf5Dmw4vZSODBPoO81mxgjNmkuxXPwA8utcCmcPdTCJE00keA30mjSxcRX3KdTTH+0azQVcmoM4hYf8a/DOVJqJWEhxmYtsnUxFlKZxmztqX7mK+Rtey+6tqpV0iUmF1huaTqC8iePu4e5Nfo0tQrAThwG503V+Qr9CrW+vkMeVyGJFEr2Y9GxmEdfAiTvWkoDAb0UhNhrZUjsrqByAASuLeq/QMX6rXMyJJ1XfELU94aV9+HD6UqueoKUoRUduvc4gXSJjYlviSIc2EFTwZGRl1UAVjRUcbIsXDfcadMIp1qyp+OYyuntmUH1ZJCsfbfmNi9fNYnWTma0xQFMe11y3rYDQIjQtsRZzBVUtTCOrj4O/7DVVpdWABkF44S8R8sUyNXEv2LlA9BFmvJj/KD/nfNC0Z8Rme7j8FSH+IETfchJvaHXUVGAHG12xUdj+Cz9kczd3+WiEqHtpXhDRcWH+52bMKnWUdSVCyp2AWXkgpIHcAYuHuBN54kkAtSgfcsEfYzTDlUjwKI8LOnExus4aLYkwBA0OrC/fzHvvy0OgM8C+Inff1eTKtAunOMV+8+yA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(91956017)(2616005)(66446008)(66556008)(66946007)(6512007)(86362001)(4326008)(76116006)(8676002)(2906002)(316002)(36756003)(64756008)(110136005)(186003)(122000001)(54906003)(66574015)(38100700002)(26005)(44832011)(8936002)(6486002)(5660300002)(31696002)(508600001)(38070700005)(83380400001)(6506007)(31686004)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2RVVlJaZm1VdWNObmVVSVJ0T0VqdFdKNzN5djdMRVBRbmhTOWFDYnAzcEF4?=
 =?utf-8?B?SGpKTlBqS0lyVkZZYUhQaVFnL0ZBbG5WSjZxekwwVzdwb1VucjJ1NWtpRUw3?=
 =?utf-8?B?NHFPdWdMNWtzcDdWTzZJU2xNNEZiZWJOZXRBSXhzOEc5MUNWb3pKQXNNdndG?=
 =?utf-8?B?QVdCWElaYldxai9ZTHl0VmxoUjZ5U1dXelRMWDMra0JxcitzVWZQWjNHUFZ0?=
 =?utf-8?B?T25MYWxheHU2aHAxaGVUWDlOTm1ITnJXdVZxV3V6azcvY0NHS3RrWithQjQw?=
 =?utf-8?B?eXo3K2JSZTJwV3FPR1BsVFY5R3c4ZDl4dllxTVRqZ2JLaHRqZFZVLzhuY1JW?=
 =?utf-8?B?OXlQeHhoV3YrMU1vWnJPYmhWYk9xdlRUcCtTMFpzdmVjR0hIRWNIUmlERmhF?=
 =?utf-8?B?bEdVcFlYVFY0a0ltaWZubGhISUxWamxxMVNlQm1yZDlVTUZOK0hVTTZrMm9k?=
 =?utf-8?B?NjBXNW1CMnhHOG1tT0wyZHFuTVdhOVVGN0RUQlFYRS8yWmNsV0FjRTRjZnRQ?=
 =?utf-8?B?VXFFSjI4ZWI2UnpKUnZpMTFQbUJHTzlZTFY2bHlRZFBLbXdsWEc1a29qOXFM?=
 =?utf-8?B?VG9Vem9qeDQ1SUR0Ukt1VU9HV3lkZjMzZS9SUXhPdERkM0ZLSCtLcjJZWGlx?=
 =?utf-8?B?SE5UVFpQRlhHcDZUMlU5RGtzd1JGem5GQVhEczVwcDFZdlF3VzExc01QUXFz?=
 =?utf-8?B?WHMvakl1MkYyQmRYWllXbEpZQzNxU2hNM0RiSFFWNWwvMmoxWFc5RWVWOXFQ?=
 =?utf-8?B?a1o4VlRycTZJK2NqU0NydUlpYW9WMDFZM21xOVg1dnBjYy9Ic3VtKzQvbC9q?=
 =?utf-8?B?RXRIUk5ldU5aQ0VWMTJ1Ungrc2E5TmxGMDNjTmxxdXdpd1BLM21FTHpwbnpG?=
 =?utf-8?B?T2hvcFNpazZPajBCNnFZYko2dmhzTUtGUmw2d1JXOVlJbSswTnN4V2xlYnM5?=
 =?utf-8?B?cHgwRmVpYnhCalFDdUI0dXZURGN4RjZzRExlaFU1T3VMQzFTTHJrbCtBb0Vp?=
 =?utf-8?B?bGtHelpxOVhxSWd0d1ZYSy90cUpodnRWRVVEM1JMZ2l6c2E2K3pyakkzdWN1?=
 =?utf-8?B?cU5JQ0h3VXd2RnVDOGx5TEtudVhOM0t4VHNCMFpSdUI1V1VpOGRMejVxTGlj?=
 =?utf-8?B?RnFZNnJwM0ZJUDFEN0VaTHQ2Nnk0ZzNYTEkvdVJsNjFsbWFEMEh5eVhrZFV2?=
 =?utf-8?B?N3BSYjIvZElTRVp0ZE9UZlpPQkRKbXhIaGlyUTk2a0dHOWc1NW1aaDZ5LzJS?=
 =?utf-8?B?Y3ZqTEp4RXd0SlVXMDdGQ3hxb3dILzljdFRmMVgwWkdKOHZTRTZ2Z3dTa1U4?=
 =?utf-8?B?UHVMWE1ac2dsMyszQzhVb3d3elVoSzFXSjdlMzFEbGtBZ3VmYTJ4M1NFdnNY?=
 =?utf-8?B?bm1UTjdzdlFPSURFZ0g3VThRRW1KRWtZMEZMNjFwcUdiZTdiTG5COVl4a3g3?=
 =?utf-8?B?ZDNLUCtqRTNldnNBc2pOOTBGSmNyajBvNjVsZ2lWSUNtdHdRZkdreGhJK1Ji?=
 =?utf-8?B?bzB1d3lsc2tXMllFek1EQmNWV0FyYStNUVhXMGcxMzQ0QmE1NFZuQ1l2RGxC?=
 =?utf-8?B?ZkxzYVVMZkNhaVBvay9USnc1OElmLzRpSktiZDE5Y1VaTlVzSE1xV1ZEOTJW?=
 =?utf-8?B?VXRhUGhPZlNZYjZKY3ZMRzdYWGZHeUZGdEJIaUVvcnVHZ1Z1d3phd2hlcHZw?=
 =?utf-8?B?SXlmcXlyYmdSNlV6S3hwcDltMFZhWnpZR3RPMFpodCtkVE03TWh2MnVhZE43?=
 =?utf-8?B?UGMzUWczODdGRGJkSVZKWjJIZ0ZFdDd5ZlJ2UzR1bXpxR1NVNU1LNGZtMmZY?=
 =?utf-8?B?eXd6ZCtRWEgvRTE1WEpXY2RjbDBNRVIrS1VEWXduRTdxd215UFVkajMyaDli?=
 =?utf-8?B?U3JNb3Z0ay9zS0ZJUExWS1dibm00REZMR2JOSDRHZWFsZFpkLy9yK28vaURw?=
 =?utf-8?B?R05SNHRBUm9XRnBKLzFCRnRldzAyRC9XVmhLV3MzSFNNN01ESDBVYzJCWFFo?=
 =?utf-8?B?TDhDY1lxNXQvMWlCRUI1Nm8xZmdrc3NtamczOERMMG05V0hmNVpBNGJURGVJ?=
 =?utf-8?B?WnVJSHFaOGtzQWIrNW5OL2JBelN1c1VJdkxRTTdOV1RDT2RxbzAvK2VMakZo?=
 =?utf-8?B?ZzhFczExS1RrK05ZVi9vOS82K2M0dndEdm1JT0ZLbEo0N0h5dWRHenNFQjhR?=
 =?utf-8?B?TVVSQmpjNy83cHg3RFMxTitYQmw0Y29qaHFiRDdKNm9PdXM1MS9VbHorTFVr?=
 =?utf-8?Q?hn4SIQdzLGx0k7SA5llse6XLMR6U6ZyOC/1LY+AsEY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA90668761BFE046A1058189BF328967@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 38792924-ad4e-40ae-42ad-08da026a8eff
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 07:49:51.4135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VWpaUjLWdijFjYeyHNn6v9ANeYdYGUMQhu/x8QQ606TBDV4ubIz3Daid5HBZA9+mhFvg4IpaUNTYIfFJ2GniDov1fMzxrBfWt0D9LbaN0XE=
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "atrajeev@linux.vnet.ibm.com" <atrajeev@linux.vnet.ibm.com>,
 "maddy@linux.vnet.ibm.com" <maddy@linux.vnet.ibm.com>,
 "rnsastry@linux.ibm.com" <rnsastry@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzAxLzIwMjIgw6AgMDg6MjAsIEtham9sIEphaW4gYSDDqWNyaXTCoDoNCj4gRnJv
bTogQXRoaXJhIFJhamVldiA8YXRyYWplZXZAbGludXgudm5ldC5pYm0uY29tPg0KPiANCj4gVGhl
IHRlc3RjYXNlIHVzZXMgZXZlbnQgY29kZSAiMHgxMzQwMDAwMDAxYzA0MCIgdG8gdmVyaWZ5DQo+
IHRoZSBzZXR0aW5ncyBmb3IgZGlmZmVyZW50IGZpZWxkcyBpbiBNb25pdG9yIE1vZGUgQ29udHJv
bA0KPiBSZWdpc3RlciAxIChNTUNSMSkuIFRoZSBmaWVsZHMgaW5jbHVkZSBQTUN4U0VMLCBQTUNY
Q09NQg0KPiBQTUN4VU5JVCwgY2FjaGUuIENoZWNrcyBpZiB0aGVzZSBmaWVsZHMgYXJlIHRyYW5z
bGF0ZWQNCj4gY29ycmVjdGx5IHZpYSBwZXJmIGludGVyZmFjZSB0byBNTUNSMQ0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQXRoaXJhIFJhamVldiA8YXRyYWplZXZAbGludXgudm5ldC5pYm0uY29tPg0K
DQpJIHNlZSB0aGUgc2VyaWVzIGhhcyBiZWVuIGFjY2VwdGVkIGJ1dCB0aGlzIHBhdGNoIGhhcyBi
ZWVuIGxlZnQgb3Zlci4NCg0KQW55IHJlYXNvbiA/DQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0KDQoN
Cj4gLS0tDQo+ICAgLi4uL3Bvd2VycGMvcG11L3NhbXBsaW5nX3Rlc3RzL01ha2VmaWxlICAgICAg
IHwgIDQgKy0NCj4gICAuLi4vbW1jcjFfc2VsX3VuaXRfY2FjaGVfdGVzdC5jICAgICAgICAgICAg
ICAgfCA3MCArKysrKysrKysrKysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3MiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9wb3dlcnBjL3BtdS9zYW1wbGluZ190ZXN0cy9tbWNyMV9zZWxfdW5p
dF9jYWNoZV90ZXN0LmMNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9wb3dlcnBjL3BtdS9zYW1wbGluZ190ZXN0cy9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL3Bvd2VycGMvcG11L3NhbXBsaW5nX3Rlc3RzL01ha2VmaWxlDQo+IGluZGV4IGJiNWZm
ZDJlMzIyZC4uMzQ1YWQ2NmJkMWIyIDEwMDY0NA0KPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9wb3dlcnBjL3BtdS9zYW1wbGluZ190ZXN0cy9NYWtlZmlsZQ0KPiArKysgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9wb3dlcnBjL3BtdS9zYW1wbGluZ190ZXN0cy9NYWtlZmlsZQ0KPiBA
QCAtMyw3ICszLDcgQEAgaW5jbHVkZSAuLi8uLi8uLi8uLi8uLi8uLi9zY3JpcHRzL0tidWlsZC5p
bmNsdWRlDQo+ICAgDQo+ICAgYWxsOiAkKFRFU1RfR0VOX1BST0dTKSBtbWNyMF9leGNlcHRpb25i
aXRzX3Rlc3QuYyBtbWNyMF9jYzU2cnVuX3Rlc3QuYyBtbWNyMF9wbWNjZXh0X3Rlc3QuYyBcDQo+
ICAgCQkJbW1jcjBfcG1jamNlX3Rlc3QuYyBtbWNyMF9mYzU2X3BtYzFjZV90ZXN0LmMgbW1jcjBf
ZmM1Nl9wbWM1Nl90ZXN0LmMgXA0KPiAtCQkJbW1jcjFfY29tYl90ZXN0LmMNCj4gKwkJCW1tY3Ix
X2NvbWJfdGVzdC5jIG1tY3IxX3NlbF91bml0X2NhY2hlX3Rlc3QuYw0KPiAgIA0KPiAgIG5vYXJn
Og0KPiAgIAkkKE1BS0UpIC1DIC4uLy4uLw0KPiBAQCAtMTYsNyArMTYsNyBAQCBuby1waWUtb3B0
aW9uIDo9ICQoY2FsbCB0cnktcnVuLCBlY2hvICdpbnQgbWFpbigpIHsgcmV0dXJuIDA7IH0nIHwg
XA0KPiAgIA0KPiAgIFRFU1RfR0VOX1BST0dTIDo9IG1tY3IwX2V4Y2VwdGlvbmJpdHNfdGVzdCBt
bWNyMF9jYzU2cnVuX3Rlc3QgbW1jcjBfcG1jY2V4dF90ZXN0IFwNCj4gICAJCSAgIG1tY3IwX3Bt
Y2pjZV90ZXN0IG1tY3IwX2ZjNTZfcG1jMWNlX3Rlc3QgbW1jcjBfZmM1Nl9wbWM1Nl90ZXN0IFwN
Cj4gLQkJICAgbW1jcjFfY29tYl90ZXN0DQo+ICsJCSAgIG1tY3IxX2NvbWJfdGVzdCBtbWNyMV9z
ZWxfdW5pdF9jYWNoZV90ZXN0DQo+ICAgDQo+ICAgTERGTEFHUyArPSAkKG5vLXBpZS1vcHRpb24p
DQo+ICAgDQo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9wb3dlcnBjL3Bt
dS9zYW1wbGluZ190ZXN0cy9tbWNyMV9zZWxfdW5pdF9jYWNoZV90ZXN0LmMgYi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9wb3dlcnBjL3BtdS9zYW1wbGluZ190ZXN0cy9tbWNyMV9zZWxfdW5pdF9j
YWNoZV90ZXN0LmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAw
Li4xYTRkMTljMTEwMTcNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9wb3dlcnBjL3BtdS9zYW1wbGluZ190ZXN0cy9tbWNyMV9zZWxfdW5pdF9jYWNoZV90
ZXN0LmMNCj4gQEAgLTAsMCArMSw3MCBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seQ0KPiArLyoNCj4gKyAqIENvcHlyaWdodCAyMDIyLCBBdGhpcmEgUmFqZWV2
LCBJQk0gQ29ycC4NCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8c3RkaW8uaD4NCj4gKyNpbmNs
dWRlIDxzdGRsaWIuaD4NCj4gKw0KPiArI2luY2x1ZGUgIi4uL2V2ZW50LmgiDQo+ICsjaW5jbHVk
ZSAibWlzYy5oIg0KPiArI2luY2x1ZGUgInV0aWxzLmgiDQo+ICsNCj4gK2V4dGVybiB2b2lkIHRo
aXJ0eV90d29faW5zdHJ1Y3Rpb25fbG9vcF93aXRoX2xsX3NjKHU2NCBsb29wcywgdTY0ICpsbF9z
Y190YXJnZXQpOw0KPiArDQo+ICsvKiBUaGUgZGF0YSBjYWNoZSB3YXMgcmVsb2FkZWQgZnJvbSBs
b2NhbCBjb3JlJ3MgTDMgZHVlIHRvIGEgZGVtYW5kIGxvYWQgKi8NCj4gKyNkZWZpbmUgRXZlbnRD
b2RlIDB4MjFjMDQwDQo+ICsNCj4gKy8qDQo+ICsgKiBBIHBlcmYgc2FtcGxpbmcgdGVzdCBmb3Ig
bW1jcjENCj4gKyAqIGZpZWxkcyA6IHBtY3hzZWwsIHVuaXQsIGNhY2hlLg0KPiArICovDQo+ICtz
dGF0aWMgaW50IG1tY3IxX3NlbF91bml0X2NhY2hlKHZvaWQpDQo+ICt7DQo+ICsJc3RydWN0IGV2
ZW50IGV2ZW50Ow0KPiArCXU2NCAqaW50cl9yZWdzOw0KPiArCXU2NCBkdW1teTsNCj4gKw0KPiAr
CS8qIENoZWNrIGZvciBwbGF0Zm9ybSBzdXBwb3J0IGZvciB0aGUgdGVzdCAqLw0KPiArCVNLSVBf
SUYoY2hlY2tfcHZyX2Zvcl9zYW1wbGluZ190ZXN0cygpKTsNCj4gKw0KPiArCS8qIEluaXQgdGhl
IGV2ZW50IGZvciB0aGUgc2FtcGxpbmcgdGVzdCAqLw0KPiArCWV2ZW50X2luaXRfc2FtcGxpbmco
JmV2ZW50LCBFdmVudENvZGUpOw0KPiArCWV2ZW50LmF0dHIuc2FtcGxlX3JlZ3NfaW50ciA9IHBs
YXRmb3JtX2V4dGVuZGVkX21hc2s7DQo+ICsJRkFJTF9JRihldmVudF9vcGVuKCZldmVudCkpOw0K
PiArCWV2ZW50Lm1tYXBfYnVmZmVyID0gZXZlbnRfc2FtcGxlX2J1Zl9tbWFwKGV2ZW50LmZkLCAx
KTsNCj4gKw0KPiArCWV2ZW50X2VuYWJsZSgmZXZlbnQpOw0KPiArDQo+ICsJLyogd29ya2xvYWQg
dG8gbWFrZSB0aGUgZXZlbnQgb3ZlcmZsb3cgKi8NCj4gKwl0aGlydHlfdHdvX2luc3RydWN0aW9u
X2xvb3Bfd2l0aF9sbF9zYygxMDAwMDAwMCwgJmR1bW15KTsNCj4gKw0KPiArCWV2ZW50X2Rpc2Fi
bGUoJmV2ZW50KTsNCj4gKw0KPiArCS8qIENoZWNrIGZvciBzYW1wbGUgY291bnQgKi8NCj4gKwlG
QUlMX0lGKCFjb2xsZWN0X3NhbXBsZXMoZXZlbnQubW1hcF9idWZmZXIpKTsNCj4gKw0KPiArCWlu
dHJfcmVncyA9IGdldF9pbnRyX3JlZ3MoJmV2ZW50LCBldmVudC5tbWFwX2J1ZmZlcik7DQo+ICsN
Cj4gKwkvKiBDaGVjayBmb3IgaW50cl9yZWdzICovDQo+ICsJRkFJTF9JRighaW50cl9yZWdzKTsN
Cj4gKw0KPiArCS8qDQo+ICsJICogVmVyaWZ5IHRoYXQgIHBtY3hzZWwsIHVuaXQgYW5kIGNhY2hl
IGZpZWxkIG9mIE1NQ1IxDQo+ICsJICogbWF0Y2ggd2l0aCBjb3JyZXNwb25kaW5nIGV2ZW50IGNv
ZGUgZmllbGRzDQo+ICsJICovDQo+ICsJRkFJTF9JRihFVl9DT0RFX0VYVFJBQ1QoZXZlbnQuYXR0
ci5jb25maWcsIHBtY3hzZWwpICE9DQo+ICsJCQlHRVRfTU1DUl9GSUVMRCgxLCBnZXRfcmVnX3Zh
bHVlKGludHJfcmVncywgIk1NQ1IxIiksIDEsIHBtY3hzZWwpKTsNCj4gKwlGQUlMX0lGKEVWX0NP
REVfRVhUUkFDVChldmVudC5hdHRyLmNvbmZpZywgdW5pdCkgIT0NCj4gKwkJCUdFVF9NTUNSX0ZJ
RUxEKDEsIGdldF9yZWdfdmFsdWUoaW50cl9yZWdzLCAiTU1DUjEiKSwgMSwgdW5pdCkpOw0KPiAr
CUZBSUxfSUYoRVZfQ09ERV9FWFRSQUNUKGV2ZW50LmF0dHIuY29uZmlnLCBjYWNoZSkgIT0NCj4g
KwkJCUdFVF9NTUNSX0ZJRUxEKDEsIGdldF9yZWdfdmFsdWUoaW50cl9yZWdzLCAiTU1DUjEiKSwg
MSwgY2FjaGUpKTsNCj4gKw0KPiArCWV2ZW50X2Nsb3NlKCZldmVudCk7DQo+ICsJcmV0dXJuIDA7
DQo+ICt9DQo+ICsNCj4gK2ludCBtYWluKHZvaWQpDQo+ICt7DQo+ICsJRkFJTF9JRih0ZXN0X2hh
cm5lc3MobW1jcjFfc2VsX3VuaXRfY2FjaGUsICJtbWNyMV9zZWxfdW5pdF9jYWNoZSIpKTsNCj4g
K30=
