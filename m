Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69E16DA8AF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 08:03:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pt7823PWTz3fSy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 16:02:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pLHy5Afe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60f; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pLHy5Afe;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pt76z2B7Tz3fJd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 16:02:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UK8yEPhjCN5Vo/H7u5sSKaF0nDb4Mk8cMLs04m+MVLVEPcTbKQFl++if4M+x73nMJrxSZBYaj6AdaEX5zVz7IH5SDnig3sZuSF55d2R6oQX3VpfVkH00wmW8u+AqdSKKXibI2j2NMu2OGR+SerLgxaqdLe/PLAJjL1TUu4dBXfcw6tEGpp0aqsLN4iEmvTdwRAaVZ7H2tv2yD5+02ubpB7SqQFIdsTI4moauQNwyo6QYLDw83WSM0fv2OkU6lCSk2ISGc9Uq8D6s1/7WN5+t0BdGQ/p6n1M3ABscNrJe1lCqJP0zfbBu4UU6BYaiZXzUvNhImL/zZpI1qBmiR/25AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryh9vhXzbpmc63UGS+5AeH9OsA2M4i1cAITujoKLjtc=;
 b=gTEsrJDuOZtEDdrMYfHg24n9rsSoojnTN/P6otewLKcEFmzx7X1RuTvlm9kfEhRBlVM6TRBxrD8t9THtD3novMDCJmZU9WRx0N3Rtm9ZW7pNA+KvAViuPnvl1Qxc13FfxLOkJTd8m9K5eq5KHJX/nLerShC+MhnUDBuk4BBGVrpFIIKpu+0q4RZneeO3iGOFYBRff1lvVy2VY9smnG6WUGDwATT7PUW6n4cal/4Tab++WJxIEd9i++k8IEJYClNoTTjxdLkvdt11Guy9FZC4i5/m19SI2i9/c9d4RaRO4KXyo/J3bQ5x5WZdprWhTw9qan9644EONebpIMPtpNX+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryh9vhXzbpmc63UGS+5AeH9OsA2M4i1cAITujoKLjtc=;
 b=pLHy5AfesFpeIWymdEFoMW8zY7DZQ+SWGF3X+ER0QK46nE7yKTruQzLV6pV4T1obsYXZOwXYklwWsVymjYnb7qY87XVPgiXXBP0G73uUVN8XKsIoqFVkamSgwele8feVZ1taydawfN0MzMFyjFE2bm3tTVnyA3NleCt9/+sy4B/uvYi6FzUv97zXuZ1rUvT+yRWdpHriDUT9JzzEN1vZJOZYPTQHZbxm1Cxak7gBPAuW6uVSv6LXuo1VNvpUrfVs3uTGpkrVDtRWAYIvEoV/m/Kg63dIS6XAMIj3WAd66OspkpUPwDcm5FqKMze55CwLmAdJeQQoAPdQMXmmDBnnww==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3209.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.33; Fri, 7 Apr
 2023 06:01:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25%6]) with mapi id 15.20.6277.033; Fri, 7 Apr 2023
 06:01:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [PATCH] powerpc/bpf: populate extable entries only during the
 last pass
Thread-Topic: [PATCH] powerpc/bpf: populate extable entries only during the
 last pass
Thread-Index: AQHZaFpdL7c/nmP7bk618gBMwF2ina8fXB6A
Date: Fri, 7 Apr 2023 06:01:38 +0000
Message-ID: <857125b9-90b3-fba1-beed-6ffda703f873@csgroup.eu>
References: <20230406073519.75059-1-hbathini@linux.ibm.com>
In-Reply-To: <20230406073519.75059-1-hbathini@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3209:EE_
x-ms-office365-filtering-correlation-id: 8026a225-1b48-4c72-790e-08db372d8d06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  83BX9VWkqW8gJQlKGVHCmDnFcAOc53f04mHq2TczSKLNc36qecgCWPKLu1L2yRYVJgISO848/O6SRb5taEHmMz6RWTG3nkk9Y6NAhXC3IbMZUmT5kUbsrAjZEjz9ZH+s6S9GVgykkspF5ICfYkZsq8jXeidgthgKluIxljJ9v/G2tC9l0Im0L13ihRYrXlKZ3Tv9gJWZCjAAh4KW+l9gCpWChOowfuINQBxDKVvCsOA8ba+5cDkvtWRMymmwHrCI07d3fHMDYW7WCdLXcW/bX+fPq7xFjwpSj/NWo/NczMkwEv8Uw1nggvj8PTpiGsinjWSPB168mN5sp+QSCP2BCCJ2B7MM/NPRDZ8DGBV2A3HEu8QMRUm23CAYo5AsW24H6rzWm15D1Nktr7ePVH4N7rM0gKP5e412J7gtdMpAlY//eau15mu98Gx2qNnRJqFPPc4AqpjdKtSMYlEvgDBZLVJvuREinhefaGhrmeyO8asKfajUrDG7D2XAd49RJlYAWOJ5z9uaqgjNFskuvwjSc4HPCEAXm8jFyL2hQZP44JOzf2tpoZMcXQTBKtp5einD6Phi7GX9H07z95lUdyfAk9T7vcb3/r8knWCyLphJsq+fq4tPI0hVmM47SCQ2TbzMNEl8hZnlaSyPda2oUQXCK8G6Mntz65GoUCjVbhrFK3nMynitYUrKOAHkVsv42PUB
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(31686004)(66946007)(66476007)(478600001)(6486002)(66556008)(64756008)(66446008)(4326008)(54906003)(71200400001)(38070700005)(8676002)(91956017)(41300700001)(110136005)(316002)(76116006)(36756003)(31696002)(86362001)(83380400001)(66574015)(2616005)(6512007)(6506007)(26005)(44832011)(2906002)(8936002)(5660300002)(38100700002)(186003)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NmRxd2NTa2JmWFZhNWZ3L3VOKzlXbWxaUzBKUFpkWlZXSUszZlJLMHg0SHNW?=
 =?utf-8?B?VmU3OUlzWGxvT0tNOVJFVC9UR0FhZTN3YkpqUSsrd3JTS0pnZ0tuemZld1Bs?=
 =?utf-8?B?dWVUTTBpOHFsUzQ2NU9qNlBBS2k1ODUxT1UzV3V6Y0l5ajloSEdWM2lmV1ZT?=
 =?utf-8?B?MVpKb1p4TUZ0SGVqT1Zmeml2d21rd1hDem5aZzFKVnA0S3BIL3dXQjgzNkVY?=
 =?utf-8?B?TFhOMGZDMWJSUXYvVHNxTTNZTUh5TFY1eFo2VTFURFd6aHBEV2hsUjd4d2lR?=
 =?utf-8?B?eC9RZU1IMjRyc0s5N3gzVHBUUXF2NnVxL3VrdUU0WlBuVllKUVZBVjFoRXc0?=
 =?utf-8?B?Q1RhSVFWeU1ITHViSVNZK09yQnZ1SThTdjg0RTY3TzF5V2d1UWg5cnZPU2tH?=
 =?utf-8?B?akN2NWlDQ0Z2bmVoWGlHcHo2RWZKdDRvekZhWUExcHk1R1VIYzhxWHA0UU1y?=
 =?utf-8?B?WC9XVDVsbTJXanp6NmlpRTRRMThmbSt4SnlpMjJoMFpQd1RSaW5QK2xqZk9H?=
 =?utf-8?B?Z2R3VEdYM0dNSVVRb2NYTjR5TjhyU0JnZ3JLOWhrajlseGFnWmJxQ01vOXJ4?=
 =?utf-8?B?cU50SVhQNzJDa3lLMDF2ck5HMlVwLyt1Tk5wL01wNGxpZWMzT0xwdlIvaXp4?=
 =?utf-8?B?UHpPSVhCZlZBdGlNMVpJdVh5ZHM2WWVBMVhIeVJObXVFWnNuQXZIZUVmdUdu?=
 =?utf-8?B?RERKVDFqdjBtcUVuZ3J4LzF1VjJHaFFQSVlpNXRkcXk5aktsMU40Z1FBKzJS?=
 =?utf-8?B?M0VxL0xHMTRWdTdEc2xWc1NWQlB6TXVrTEtFZTJWdmxMTk13YzgwQzlRbngw?=
 =?utf-8?B?ZSs1K3d6bjBmSkk5UHd1K25wWnk5OEROY2hjU1A3TEV5VzZPZTJwcEFtKzIv?=
 =?utf-8?B?Z2gxM2crQld4TFk0UkN1cUhlQktFR0cxTndWbEhPbzdKNHg4dmFPc2t6eE80?=
 =?utf-8?B?VlVJbUFmQmFjcTRydEFBWTAwMzhQMFZFQ1d0MXBleHFQSzFMYnUvTjNEM2Rl?=
 =?utf-8?B?b0ovQUZwd1YzdGMvbVY0Ui9sUTJ1ZUpNR2JGZUVORE5aV2c0bWc1dTI0VE5Z?=
 =?utf-8?B?NENXR2xxV2NicW1JVnE4RGxrTzZGUXE0eDhWdnQyOVNIRVVMR1ZtdnRWazN4?=
 =?utf-8?B?UWpZSHROaXFFNnlHWERQWHg0OWozSWNNVXMwNGpkUWFGZjUzZkNiU3VvZzdX?=
 =?utf-8?B?emZ0aXVnbmovdVpqSkNLVmxrTWhEWDljbSttYWRleEVxQnh6Z2c1dVY0OGd4?=
 =?utf-8?B?WS8rOGlzUno5ZjFVVXQ2azZyYmV2UDNHSkJqVGtuZnUzdmFpUm5WT0ZmdnVo?=
 =?utf-8?B?R0V6cnp4S3UrWHJFOHQ3Z2x1clRJQWQwL0lVdlhIOHg4MC9xM1VXeU5QV0ZK?=
 =?utf-8?B?ZXdjeTRnUElFTEU3YVExT2IrckJWSHBPZ0hoVzZ5ZStqeEpUVU5YK2E3NHRn?=
 =?utf-8?B?bzcyK0xBNmY4N0Q1VG1yVENzOFhuZjBnVWtYNXBlbFNGTk8vSVJzZERzb0RV?=
 =?utf-8?B?MUlJcHZ5VHBQeXZCT0J6ZXZHTm9SYUExU2thbGVWdXBpOEw0Q0dZVUVmbTZw?=
 =?utf-8?B?QkNEMnl2QkdidXYwaGxlOUpYbGZJRkhmSWhPOWtmditVY3VDa3VPUzJRUUJl?=
 =?utf-8?B?cXVUVmtmWDhpY3RzUUl4RER6bUlEU2hCQzRlWGI1MSttQUREL2JXQ0JuR0ZH?=
 =?utf-8?B?ZlAyWVNCNy9vQUJ4dS9YOU1qU2FRRCs0OURKKzhLNTF2ZVRiZzRDSGFhckRo?=
 =?utf-8?B?M05YTXI0TVY3enNWc3haT2FpdEJSdTMvWENCUEk0SkpjRXNudDNLY1pyTUpW?=
 =?utf-8?B?cTZyVkRpYmtJckNyOFdLbEd5cXRwZ2FrQlAyMVE2MVVvaU1DUlYreVZUZm9B?=
 =?utf-8?B?bVduM3ZlNjZEVmJ6aUdIbU9peHExSDZqT3UrWHRxanRNMUZiM2JhSXI5aUxU?=
 =?utf-8?B?QXc5MER0VHZHMzYzY3dXRW5Rd3UwTVE3eFVCN2dTVWF1WHMvdzFaeVkvVVJq?=
 =?utf-8?B?Mlh2QnVoOWlYQ3BHVURBZUxQQkMrS3VQZ1lBT1JWUE9mWHNpa0ZBK2xWLzh6?=
 =?utf-8?B?QXY1TURMc2JvZ2pnS2RoM2xiaWZYbVNUcHBNRTNQbHd5ZDVRR0tTM29WeHky?=
 =?utf-8?Q?T6bXae35KuZuw2rbT4XgMfmbu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C45E98099AD9E54A8386780424718A95@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8026a225-1b48-4c72-790e-08db372d8d06
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 06:01:38.1999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WUzmoVtrdsMHZOJ3eF8vdT3LstlxS30PFy2ZTGpByvGyydyzTfimiLILwfxmsozH4rgSfHQeGH76d4NencT1yjf+JyRazd1c64arqs2FQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3209
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzA0LzIwMjMgw6AgMDk6MzUsIEhhcmkgQmF0aGluaSBhIMOpY3JpdMKgOg0KPiBT
aW5jZSBjb21taXQgODVlMDMxMTU0YzdjICgicG93ZXJwYy9icGY6IFBlcmZvcm0gY29tcGxldGUg
ZXh0cmEgcGFzc2VzDQo+IHRvIHVwZGF0ZSBhZGRyZXNzZXMiKSwgdHdvIGFkZGl0aW9uYWwgcGFz
c2VzIGFyZSBwZXJmb3JtZWQgdG8gYXZvaWQNCj4gc3BhY2UgYW5kIENQVSB0aW1lIHdhc3RhZ2Ug
b24gcG93ZXJwYy4gQnV0IHRoZXNlIGV4dHJhIHBhc3NlcyBsZWQgdG8NCj4gV0FSTl9PTl9PTkNF
KCkgaGl0cyBpbiBicGZfYWRkX2V4dGFibGVfZW50cnkoKS4gRml4IGl0IGJ5IG5vdCBhZGRpbmcN
Cj4gZXh0YWJsZSBlbnRyaWVzIGR1cmluZyB0aGUgZXh0cmEgcGFzcy4NCg0KQXJlIHlvdSBzdXJl
IHRoaXMgY2hhbmdlIGlzIGNvcnJlY3QgPw0KRHVyaW5nIHRoZSBleHRyYSBwYXNzIHRoZSBjb2Rl
IGNhbiBnZXQgc2hyaW5rZWQgb3IgZXhwYW5kZWQgKHdpdGhpbiB0aGUgDQpsaW1pdHMgb2YgdGhl
IHNpemUgb2YgdGhlIHByZWxpbWluYXJ5IHBhc3MpLiBTaG91bGRuJ3QgZXh0YWJsZSBlbnRyaWVz
IA0KYmUgcG9wdWxhdGVkIGR1cmluZyB0aGUgbGFzdCBwYXNzID8NCg0KQ2hyaXN0b3BoZQ0KDQo+
IA0KPiBGaXhlczogODVlMDMxMTU0YzdjICgicG93ZXJwYy9icGY6IFBlcmZvcm0gY29tcGxldGUg
ZXh0cmEgcGFzc2VzIHRvIHVwZGF0ZSBhZGRyZXNzZXMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBIYXJp
IEJhdGhpbmkgPGhiYXRoaW5pQGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9uZXQvYnBmX2ppdF9jb21wMzIuYyB8IDIgKy0NCj4gICBhcmNoL3Bvd2VycGMvbmV0L2JwZl9q
aXRfY29tcDY0LmMgfCAyICstDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL25ldC9icGZf
aml0X2NvbXAzMi5jIGIvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAzMi5jDQo+IGluZGV4
IDdmOTFlYTA2NGMwOC4uZTc4OGIxZmJlZWU2IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMv
bmV0L2JwZl9qaXRfY29tcDMyLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2Nv
bXAzMi5jDQo+IEBAIC05NzcsNyArOTc3LDcgQEAgaW50IGJwZl9qaXRfYnVpbGRfYm9keShzdHJ1
Y3QgYnBmX3Byb2cgKmZwLCB1MzIgKmltYWdlLCBzdHJ1Y3QgY29kZWdlbl9jb250ZXh0ICoNCj4g
ICAJCQlpZiAoc2l6ZSAhPSBCUEZfRFcgJiYgIWZwLT5hdXgtPnZlcmlmaWVyX3pleHQpDQo+ICAg
CQkJCUVNSVQoUFBDX1JBV19MSShkc3RfcmVnX2gsIDApKTsNCj4gICANCj4gLQkJCWlmIChCUEZf
TU9ERShjb2RlKSA9PSBCUEZfUFJPQkVfTUVNKSB7DQo+ICsJCQlpZiAoQlBGX01PREUoY29kZSkg
PT0gQlBGX1BST0JFX01FTSAmJiAhZXh0cmFfcGFzcykgew0KPiAgIAkJCQlpbnQgaW5zbl9pZHgg
PSBjdHgtPmlkeCAtIDE7DQo+ICAgCQkJCWludCBqbXBfb2ZmID0gNDsNCj4gICANCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcG93ZXJwYy9u
ZXQvYnBmX2ppdF9jb21wNjQuYw0KPiBpbmRleCA4ZGQzY2FiYWE4M2EuLjFjYzI3NzdlYzg0NiAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXA2NC5jDQo+ICsrKyBi
L2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wNjQuYw0KPiBAQCAtOTIxLDcgKzkyMSw3IEBA
IGludCBicGZfaml0X2J1aWxkX2JvZHkoc3RydWN0IGJwZl9wcm9nICpmcCwgdTMyICppbWFnZSwg
c3RydWN0IGNvZGVnZW5fY29udGV4dCAqDQo+ICAgCQkJaWYgKHNpemUgIT0gQlBGX0RXICYmIGlu
c25faXNfemV4dCgmaW5zbltpICsgMV0pKQ0KPiAgIAkJCQlhZGRyc1srK2ldID0gY3R4LT5pZHgg
KiA0Ow0KPiAgIA0KPiAtCQkJaWYgKEJQRl9NT0RFKGNvZGUpID09IEJQRl9QUk9CRV9NRU0pIHsN
Cj4gKwkJCWlmIChCUEZfTU9ERShjb2RlKSA9PSBCUEZfUFJPQkVfTUVNICYmICFleHRyYV9wYXNz
KSB7DQo+ICAgCQkJCXJldCA9IGJwZl9hZGRfZXh0YWJsZV9lbnRyeShmcCwgaW1hZ2UsIHBhc3Ms
IGN0eCwgY3R4LT5pZHggLSAxLA0KPiAgIAkJCQkJCQkgICAgNCwgZHN0X3JlZyk7DQo+ICAgCQkJ
CWlmIChyZXQpDQo=
