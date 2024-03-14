Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8C187B9C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 09:54:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OiM186Ny;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwLmF3ZYsz3vvt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 19:54:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OiM186Ny;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwLgn01B3z3vtD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 19:50:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxVHuG5UTnpkeFtJH70Wd/jLewA1jQlnjUZIlm0veXv8OLdD2l0GPMmT1O+mg+YAlWToBtnERy1NZvJvOvAzKGvuFhJn5VSpAFzTYbTeWXluH+NZV8G7JyRRnlAJJVdu20ryNkG5kO24WpMkoTfzlA26ZXqP5HaJTi130YKAfrVYUON2EnzmC/zHVG2ac2ZwuAUS53wXdEo4hJ2c/G53bCeROezMROmdeZsO9uB6fhHYqGnZRak53Mykf87th0B+II8XyvTGkTdSkENW3m73XFDtMhkxoSOtDM3/l3bOoFlJiefO9wPS0G5jCJVHM4Crm/50gNO2LgL6a7b+q9O6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTqNNFPcVVba85dtnUyVw0hDAaN53TM5ZKMxFWaTnFU=;
 b=BhZiKBVMq03VxEUbgpKNibtKEFQXdM1jbkmyplMNsDXnLIFrg18c5Jc++Vyo3KFGVPRP7xdByhsk8+/r2qJh8jZzlId8R9nacs0ryyvTOSNyagQ9SASJDIR0m1gjeVqDFGYtryqCFT40JGap6bk0icAutTdO6tI8jbjR9TxMexGsiN2kq1kTey7BgX8uWMIVIy+azQjE3Ei8n8zKqmnjDWceWk79bXG4zKn5qkfDhMmdewFZNE6t+wctrHktW2fVFc8ddQ7RVlbIWeCxyKX6N5Zd1fjU7Asr1CLbSeJTLokqmXdIoi2te3jCKhc5GmG4ZiJn8rHUy70KOebvUpO39w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTqNNFPcVVba85dtnUyVw0hDAaN53TM5ZKMxFWaTnFU=;
 b=OiM186NyjJg+NudaOWptFWswCAo8hPbaq+TsDEoLK37M4IXLj0eg259hqFRxOHSQpZwvN13DbIwIVVUeReEuLfj3eOwLO5SJL9XmzttTctKDeDwuWfNPt6zYmrps4xJNmFQzSCGyJEWOM3M+H5ZUb4+B0GdOrnXMz0gdAdaXzQQ7l/GbDrlC/Gwg/jViriheyBgSJwS0jkBGoeAYVWFAWc9Dtq+FEhQ2rd5P0l9yXHZ9o9pvXzNksyJICR8FjBqwibEJEN8aExp4TmPBVs/ArpHiBDW3AZ+RvT0Mgsh1+8B7yL0jP9f0feGvmuFx3aDn19eUvEl3EkdkhD16jn1Gbg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3155.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Thu, 14 Mar
 2024 08:50:20 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.020; Thu, 14 Mar 2024
 08:50:20 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "peterx@redhat.com" <peterx@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH 11/13] mm/treewide: Replace pXd_huge() with pXd_leaf()
Thread-Topic: [PATCH 11/13] mm/treewide: Replace pXd_huge() with pXd_leaf()
Thread-Index: AQHadZATCnRyw+CF/EiLhRcoRNfJMbE27iiA
Date: Thu, 14 Mar 2024 08:50:20 +0000
Message-ID: <0f929f80-92fd-4824-a7d6-839f1aef4c8a@csgroup.eu>
References: <20240313214719.253873-1-peterx@redhat.com>
 <20240313214719.253873-12-peterx@redhat.com>
In-Reply-To: <20240313214719.253873-12-peterx@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3155:EE_
x-ms-office365-filtering-correlation-id: 993b8244-509e-49df-7f94-08dc4403c7a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  d9pRIEqu8CjRtX9xP6IN99NuaCFbICRK7gemiG4pczMFiJGFAPSyD9ERsO87nfpS3Ht13QEUfpWcMq7Sc3cYsj/x0vhkoT/sinG3AWz4oIlrSRiKG+VrUIrWJqkm4tno/qj0Xqw22z20UDa9AYT59EBztWbdzT26m4mAfVj+kqcwSW7X5XYBg81+hAErnEl34p3FHmCyeNuwctCkao2wV5LZ5vYms4bogNWc9sr5DWbuCpLBWdyj/kIoj/R/L/xbCaO+SH3L/MNAQyvjDdQwQX7LN0lOE1ek1JIGcvOnLVrH1u8PGvNmBnqKYjvwQGw9Fl44LToLyduNJglrV3G7tmZeD79ccndUUdsLcbWjaxTL627fItv/zdSE7kxAqR98nvF3d+3erGBgyMCMVi3l7kbs2X9xixvUzCRte/TmY6ZjbqBHPVBZOHqovesIdTMZO961goBIaNWzJwBhYbKYFJLUSD+e8y8HxX5YW+mWiJtvvp0uf3YknRPulIEy7qF7Vf0uir6uCeTD9NJdqOKD3H7l/OsRQ7CVPdP0hVuOD5hS3NZtYgzfx/GpOQQBlPQb+14sSUfd1ujj/8kUykL7ocCcfakoQGbPL3H/4D4iALSBQzl6iwC7/9acH2xOUuSJN4E23rRhRlXzJeFZ+St9+zwIYxjBm2dJiganWc3Kt/iKl1jWwpEspzfCDTdMunFycIz3AauSkZ7q1sUOuk5cEw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VVRPNGxBSDFlWGx3ZHFGOWxUL0MzeFFyN0tyWHl1SWFwcXRNQWN0cklEV0pF?=
 =?utf-8?B?ZGtKMlFib1BOYmpUbmhaQ3JtSmkrL2dhOEFXMjdnejAyZFVvdnpWeHJKb05x?=
 =?utf-8?B?aC9NS3Bnc0dsc0liVmx2SDdabEljZGhKOGk3amt3aHlSRmtsVFduMGhXYTdR?=
 =?utf-8?B?aktYNUd2UFpSWUxTNmFCZjRHcGVTamJ1QmNiK3JkVGJFUHNxQmhrOFFEZENR?=
 =?utf-8?B?UTJ3ODc1OXNEVjJPclJPZE00RlFDMzM0WGRPWnN1VUxZazU1bzBaYUdZOVNG?=
 =?utf-8?B?U1VkQUg3TCs2R0JuT1JPdW9EZUQ2TVFWUU1GeGpzNTBSOWpLUEhGUWkzbXRt?=
 =?utf-8?B?OThUNnlXb0hhUUp1Z1JlVUlxNlBMTlBoWkZGMkVsWmZPdUhkOXp0RU1JVS95?=
 =?utf-8?B?VFNmb2tpT1VST2U2TStiVGdOc2ZtdlluYkxSbS9SOWtpNUhTV0gza0tBWGRy?=
 =?utf-8?B?dkRWQ2lHZUxsc2xZbTJlYkhQbXBYMzJWazNBWndvak1zM05oVWFDQ2IwSlYy?=
 =?utf-8?B?NytwSjlsM09HbVAzNTNhWitBdGpIRHdtbkJSWHk3Ny95eE92VkVHUm5FMnVm?=
 =?utf-8?B?bWVpTVNVa1dCN0tzU3E3cDAyRW8vMjQ1UnVHME9FRlNzV0o4c0EzK2hGeUtQ?=
 =?utf-8?B?aHFaVC9FNDNsN05sVXNBOW4yT1pIL2ZwUXRselFjazh4WDQxSmpNNllESjhx?=
 =?utf-8?B?SFBUakR3Lys0eGJLdEtIRTdlL2tNMXFIa0NNRmlHVnBMZnNjN1gzUDJyMGli?=
 =?utf-8?B?dUVaRVFRTjJYTlBON0Y1ZlhWMXVaNkl1ektsYVpHVGVFMlJTc3JLa2t4Vm1D?=
 =?utf-8?B?L2x4T055a0pRay9GM01CQk9BNzVLaWRzQzRPb24zbS9ISDZwOFBpcEp1dmsw?=
 =?utf-8?B?cmp4N2V0V0JvWVZlVzdwTTdLTTVicnc5dFhpVmYvbitLblZFa1ZJNm5OcDY1?=
 =?utf-8?B?dUZSS1orVk9yTllxUlNPelBBcDR0a2FINkIxRW1ybTZMY0QwUGU1ZXRMeWdj?=
 =?utf-8?B?TUgrS01RK0NFSUpLbEtEMkw1NEJnK3BaRGMwMEJlcWcxbXhNUnFRRnczem81?=
 =?utf-8?B?NWxUQVFXUjVBV0ROUDF1cVhVOUtmN1VES2RnUWo3SjRVVWJ4OERkU2t2NEhP?=
 =?utf-8?B?VkV6QVpiNm5nTlo5WXpXc0FNbk5HUms4eXllRGJMTGNNREtyamRsaEFaQzBq?=
 =?utf-8?B?aG1CZC81OGJXd1ZUbEFiVmRRV2NIbk5NMkh4V1RHY2lxOGsxdC9FcnlrcGdP?=
 =?utf-8?B?cE9LTjc3S1dwMklqT0k0ZTB0QVlhb1JPajcwV3E1RjZRS2ZwNGFBSURMeWtw?=
 =?utf-8?B?eVpZaEhmdWdpT0dLWllCbXhLdSt6azFMY2hKZkdFeTY4amVHY2ZvL0JDZTRw?=
 =?utf-8?B?dmN1SG4yQTVSU1Z4Q1h2NmtYMXJWaE9yUlpBVDRoeSs1Mm4zMzcySm1OWm90?=
 =?utf-8?B?cXluSHdjQ2h5MTZ2MGhmWGpLQmd6cjArYXk3ZmJrUzcyLzN6UVJmUExocnJL?=
 =?utf-8?B?MGZ1OW51d3dJM3UxbWFZZ3RTbjRxd0dHd1IxZlo0QWU2UEkwbCszdzJZTWc4?=
 =?utf-8?B?OU0wUmxkc0N1Z25pZk5taGFFbnpNZkorZ3J5QzZHdjZjYk1kVS9nQnJ1Yk1N?=
 =?utf-8?B?ZU9FdTZUOG1WeVo2Wk0yQVdBcVI0UFhWdkZkQUtsV2JzT3VkT1J4ODk2K1M3?=
 =?utf-8?B?UkhpcktYUVc3U2F3WHFLWjNCRTFaNzdOS2NRZmp6OEg2ZG94QnhWNzdBdE8v?=
 =?utf-8?B?UzNrY3hLL2dKSGVza2xiT0pXZTVBV1NZVEhLMUdPU2ZMN2xVa0diNFJvdnUw?=
 =?utf-8?B?aG9OQ2M4dEkyVjlaUlJhTUVVMDFEbVV4S0ZURFlFOVpIQ0tUaG5lMzJiWEh0?=
 =?utf-8?B?VmRhK3dSNDY1aXpjUkcwSTJ5QzFFMEFyUkFtR2pwVHBrVXRGZHZGcXU1bUtD?=
 =?utf-8?B?ZXlaaDdTOWJqbmhYcmlVWWRvWXZMcFJ4Umk4SVdHeFBkN1ZzcjllMGNONTFP?=
 =?utf-8?B?WDFmNndzMXhsSlNBbXJMZ0xwdFA4ZjRLZWlBU3ljTTg5ckRldmVaQ2p6NUdw?=
 =?utf-8?B?Z1JCbEFnZGF5VmlpQUZSeXMwS0Y0Q3paZEZ3Q2k5RjVRUVY1QnVaZXdnaFV4?=
 =?utf-8?B?OVFQaG9rOERwb2pmbi96bVVwYkVIUTVydmQwclk3aGRIWjBwdU1CSU1xSGlY?=
 =?utf-8?B?T0p0K1dlc0RESnFhbzNhRVlpSmhPcGlnYkc2R0h2aVpBVTBqYmhNNkYvZExr?=
 =?utf-8?B?Mit1Qzd3OWRFdWZIUTFlVUxzd1RnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D37F01569758DF41A7BFB3AE1E66DE7E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 993b8244-509e-49df-7f94-08dc4403c7a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 08:50:20.4668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GR07ASjcIRcC/OI7+nToG0uvaatvUNwXOgYfUvD3ZwLZwgJejPT4mUH+JMRsvC/K7r+JR0cMd+ePp71QnnVQ5PZL1rim3Tpz/lzYs+1kQEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3155
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
Cc: Muchun Song <muchun.song@linux.dev>, "x86@kernel.org" <x86@kernel.org>, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzAzLzIwMjQgw6AgMjI6NDcsIHBldGVyeEByZWRoYXQuY29tIGEgw6ljcml0wqA6
DQo+IEZyb206IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4NCj4gDQo+IE5vdyBhZnRlciB3
ZSdyZSBzdXJlIGFsbCBwWGRfaHVnZSgpIGRlZmluaXRpb25zIGFyZSB0aGUgc2FtZSBhcyBwWGRf
bGVhZigpLA0KPiByZXVzZSBpdC4gIEx1Y2tpbHksIHBYZF9odWdlKCkgaXNuJ3Qgd2lkZWx5IHVz
ZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBYdSA8cGV0ZXJ4QHJlZGhhdC5jb20+DQo+
IC0tLQ0KPiAgIGFyY2gvYXJtL2luY2x1ZGUvYXNtL3BndGFibGUtM2xldmVsLmggfCAyICstDQo+
ICAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgICB8IDIgKy0NCj4gICBhcmNo
L2FybTY0L21tL2h1Z2V0bGJwYWdlLmMgICAgICAgICAgIHwgNCArKy0tDQo+ICAgYXJjaC9sb29u
Z2FyY2gvbW0vaHVnZXRsYnBhZ2UuYyAgICAgICB8IDIgKy0NCj4gICBhcmNoL21pcHMvbW0vdGxi
LXI0ay5jICAgICAgICAgICAgICAgIHwgMiArLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxl
XzY0LmMgICAgICAgICAgfCA2ICsrKy0tLQ0KPiAgIGFyY2gveDg2L21tL3BndGFibGUuYyAgICAg
ICAgICAgICAgICAgfCA0ICsrLS0NCj4gICBtbS9ndXAuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgNCArKy0tDQo+ICAgbW0vaG1tLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDIgKy0NCj4gICBtbS9tZW1vcnkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiAr
LQ0KPiAgIDEwIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BndGFibGUtM2xldmVs
LmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wZ3RhYmxlLTNsZXZlbC5oDQo+IGluZGV4IGU3YWVj
YmVmNzVjOS4uOWUzYzQ0ZjBhZWEyIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLTNsZXZlbC5oDQo+ICsrKyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BndGFibGUt
M2xldmVsLmgNCj4gQEAgLTE5MCw3ICsxOTAsNyBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9t
a3NwZWNpYWwocHRlX3QgcHRlKQ0KPiAgICNkZWZpbmUgcG1kX2RpcnR5KHBtZCkJCShwbWRfaXNz
ZXQoKHBtZCksIExfUE1EX1NFQ1RfRElSVFkpKQ0KPiAgIA0KPiAgICNkZWZpbmUgcG1kX2h1Z2V3
aWxsZmF1bHQocG1kKQkoIXBtZF95b3VuZyhwbWQpIHx8ICFwbWRfd3JpdGUocG1kKSkNCj4gLSNk
ZWZpbmUgcG1kX3RocF9vcl9odWdlKHBtZCkJKHBtZF9odWdlKHBtZCkgfHwgcG1kX3RyYW5zX2h1
Z2UocG1kKSkNCj4gKyNkZWZpbmUgcG1kX3RocF9vcl9odWdlKHBtZCkJKHBtZF9sZWFmKHBtZCkg
fHwgcG1kX3RyYW5zX2h1Z2UocG1kKSkNCg0KUHJldmlvdXMgcGF0Y2ggc2FpZCBwbWRfdHJhbnNf
aHVnZSgpIGltcGxpZXMgcG1kX2xlYWYoKS4NCg0KT3IgaXMgdGhhdCBvbmx5IGZvciBHVVAgPw0K
DQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQ0KPiAgICNkZWZp
bmUgcG1kX3RyYW5zX2h1Z2UocG1kKQkocG1kX3ZhbChwbWQpICYmICFwbWRfdGFibGUocG1kKSkN
Cg0KDQo+IGRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jDQo+IGluZGV4IGM5NWI5ZWM1
ZDk1Zi4uOTNhZWJkOWNjMTMwIDEwMDY0NA0KPiAtLS0gYS9tbS9obW0uYw0KPiArKysgYi9tbS9o
bW0uYw0KPiBAQCAtNDI5LDcgKzQyOSw3IEBAIHN0YXRpYyBpbnQgaG1tX3ZtYV93YWxrX3B1ZChw
dWRfdCAqcHVkcCwgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQsDQo+ICAg
CQlyZXR1cm4gaG1tX3ZtYV93YWxrX2hvbGUoc3RhcnQsIGVuZCwgLTEsIHdhbGspOw0KPiAgIAl9
DQo+ICAgDQo+IC0JaWYgKHB1ZF9odWdlKHB1ZCkgJiYgcHVkX2Rldm1hcChwdWQpKSB7DQo+ICsJ
aWYgKHB1ZF9sZWFmKHB1ZCkgJiYgcHVkX2Rldm1hcChwdWQpKSB7DQoNCkRpZG4ndCBwcmV2aW91
cyBwYXRjaCBzYXkgZGV2bWFwIGltcGxpZXMgbGVhZiA/IE9yIGlzIGl0IG9ubHkgZm9yIEdVUCA/
DQoNCj4gICAJCXVuc2lnbmVkIGxvbmcgaSwgbnBhZ2VzLCBwZm47DQo+ICAgCQl1bnNpZ25lZCBp
bnQgcmVxdWlyZWRfZmF1bHQ7DQo+ICAgCQl1bnNpZ25lZCBsb25nICpobW1fcGZuczsNCg0KDQo=
