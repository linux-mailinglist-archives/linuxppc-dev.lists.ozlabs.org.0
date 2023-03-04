Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BDB6AA88F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 08:33:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PTGlp0nqQz3f4r
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 18:33:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=oTgsBdqC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::603; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=oTgsBdqC;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PTGkm1J2Bz3c8h
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Mar 2023 18:32:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdJSMRcsJzvC/vmuavfhnw5qnoxgJeDwtr4RjF3QOG+thUMq7VbsnYc55Lf8vR8JFclb+DtSJWP9uw4i5zEc74jDjAW0kQpxunLiA7pebMFDE5Jyft0c91aL2xFgJ4G5PnevO4qlJFkpClCeP9u52Z6J5N4Zc+XBVCrwkaFHDY9Em3LGu7FMAy/1uvfLbF7qeVkEefNqfRfJzoms9NNERevGbfRa3FsA8YXyb57W3iZw9po8rMxg/S5UqY1u5w0AnnBcfgu/vKlNys5O/152ZMSfODg2WwtzYlBDHbgPuJjE5R67BDpCqpXZPRuOYwmLNnDQQMgR6X1sYj29DRbv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlmOrjOojsUiykGWi2NZpRR3ZSnJPF2xjKJwDsnDxNA=;
 b=bbyk60lrO+QVDqRbb7JRiewPcBrZ1V5Y7Q5dV5I7ORXk9ktxGkuq+a924I8LL4DgpDpr+YJRPdV1MbZTakgUak6cHuh7YMORIjRXLHS+6Ms/flheH5HDIj7yBrKKYcP+t4P0d8vEV6/5E93HUppbLhVzbTCGPXn+f09U6+AZIsJQwVSdpI302OEX3+1fEDpoC8k6FVg/sgF2kT9nVPikzX+LRMFU7SZ8cCukXHA/IKwBnytjyE+D/9XM/RTsKuMeUE7TY+nFPrSL+yIj2AqTOJMGJnaWPSkYlQHbenLoUHmNacWRLfRI4x7U1k+02QEYQg1hmKySqa7FQiUdzeB+Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlmOrjOojsUiykGWi2NZpRR3ZSnJPF2xjKJwDsnDxNA=;
 b=oTgsBdqCu18tcRWDSvw+CcS4ofeBaw82qOVq0pqep2j2Zh7eJU/BXLrcFQOdEC/IQ1L2b52AQyNGOQvjPPdP9WBjeU2CY3ujFe6thC8b6ZGpvDpqlm97u0HrNANARfyHTIXlAlClOJijfo5ozaPQaZT/NWLjlaTu7ULmSpDBGAP5aQGzbyI7VPbLMflDYRDbZNSCft1d1YmOwfOdpfstcLti6szyaDVVuO3ektGD/r2gdXSPSPtrNdVj9cwcToH+yZA/crVqKD4beQb0PpjpS5Z6EcAGtkXdGqL70ovb57MKUtkKqx9r2kkAJVL6KJDaOTWv0TqIx0/ykmOqJLt+vQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2179.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Sat, 4 Mar
 2023 07:31:49 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a%8]) with mapi id 15.20.6156.023; Sat, 4 Mar 2023
 07:31:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Crystal Wood <oss@buserror.net>, Arnd Bergmann <arnd@arndb.de>, Paul
 Gortmaker <paul.gortmaker@windriver.com>, =?utf-8?B?UGFsaSBSb2jDoXI=?=
	<pali@kernel.org>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Thread-Topic: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Thread-Index:  AQHZRSlRQroQjo8Bc0a1UitSGMqXAa7eoBaAgAFIPICAA2b4AIAA3ieAgACCsgCAAVhcAIACRWSAgACI0ICAAK9IgIAAxnYA
Date: Sat, 4 Mar 2023 07:31:49 +0000
Message-ID: <7b1bf4dc-d09d-35b8-f4df-16bf00429b6d@csgroup.eu>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
 <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <Y/o8bQz5CuRhdD8B@windriver.com>
 <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
 <1b9d4d586ae7bb5cddbb97fbc9ec7de1c475afee.camel@infinera.com>
 <83565b97-8149-492e-8f22-e3722e659b98@app.fastmail.com>
 <a1e955cb-f48d-4630-6c9d-2fb3e2212aff@csgroup.eu>
 <ZAFHnaSN6F5ZYTO5@windriver.com>
 <3efa1e29-3be9-4047-beef-eb02762ae8db@app.fastmail.com>
 <2a48667f70276ad7097e898d439dea6a9c0b414b.camel@buserror.net>
In-Reply-To: <2a48667f70276ad7097e898d439dea6a9c0b414b.camel@buserror.net>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2179:EE_
x-ms-office365-filtering-correlation-id: 1afa42d0-efc2-4603-6e60-08db1c828445
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Qd6fslBjvzqw5j+gTh4WUa5BiLTlacTQzuj+80U2kZoy35dKmU9BhSh4jBInnPHVpXf3Ln9QLmI2iOFL+QZNtDcAb/+j+3amKIgKY68luIFeB+nFr30z4mX2nXX8tVpQRmFcHiSTFklU4TDGLrx5A5ydG32ScQ8YFI/YNiN6mN8rJZP2A2tLY1tb+cjQaOKZ73Lw3ALoN05XAknx9MldsaTk4KC9N/saWzkFo2FzCS2EQdaBQvJ6PFP3mJ2WoENRWV07ab4Zq69VhOeX5xci4HTPxTQDoD85no1EYkhAfULQSMGNUHE2zJsCjh8FGdeeltPeYKLVdkXiiqd52R5s9Fw5R7ymXyOfOPl/JXW4MeHpfZBET1BAFpCjOICba/BUW2gnfFsNvb85XETpFaua05AoaJ4y+PKbKxiMDKLcg6T3W8buqxkjGDG9uNSMWjxFVcQsgXOg1aW4jQcAsgCHKGlsdRaY034JKN5dCm2V2Q8fzHf9UMVBcE/g0+87qaMGgvTDoP03/fZEHCwjxGHy5pvK42XNLZZ0yacbUIPWqBesGS2FQO55zueTia5ut8PgHy447AOxuZ+jNpCplNmZ+7jGgNFcD4KQ+/M8lxbccu1ub5TB0Ci7ZlbeVrundGjF4qb+Qz+YeNIl5VMojs8PfalsJURmHfvS/4ddYjUPhD8lclo7FomlMTRRRqJwKEF5lHlYf3FDEFf7w8xxLkO7VhSgog2U4IuwlpFLg/gtRdTlDlZmB0qmnBiKSdB64RI8SvOvxIxLap28KovNoNwlKw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(396003)(136003)(346002)(39850400004)(451199018)(31686004)(83380400001)(36756003)(478600001)(110136005)(122000001)(38070700005)(54906003)(316002)(38100700002)(71200400001)(41300700001)(2616005)(6486002)(6506007)(6512007)(26005)(186003)(5660300002)(44832011)(66476007)(66946007)(76116006)(31696002)(66446008)(66556008)(8936002)(91956017)(86362001)(2906002)(8676002)(4326008)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WmFlVGJRaEZwTEJVbG15cFBwYUxiZGZjeUVvNzF2djc1Rlo1cXBIOFZ3SmJF?=
 =?utf-8?B?dEFGTUtNbHdCWEp6N09sbC8zYTFWcVVld2c3azJDSnRJNVZYUENPUWFJci9Y?=
 =?utf-8?B?WEx5cjV0ZFhmMmdldVFGYlRLdkFCYUUwRjdFSGNXTXExNzJqaHhFd0lyaUli?=
 =?utf-8?B?K1pjanh4NFVwTmJhVVZjVndOQi9LY1hmRUM2czFXSFlxY2tTSDVwWFJxdUov?=
 =?utf-8?B?K05VUkdYZ2JqVTF5R2lob3QzZDRaemgyeFQ5VUV1V2tDYS83eFRsWGVHVTNq?=
 =?utf-8?B?SitCajIyQXJzOW92Z2E1RWdlSVZkanN1TnErdmQ5dC9LSDV3THZjS1RuT0g2?=
 =?utf-8?B?RTZ1dEkxdm1hVWNoQm45S1ljb3o1MmdMenh1OVpvUWhMbjdZWjNwUU45Nmhn?=
 =?utf-8?B?aWJhY295MldCNVVyaEN5b1dvblY1Skt4eWswMWZodWhSQmJhWDd0WjZCb1ph?=
 =?utf-8?B?dmtibVR6NjhFSTU3VEg4cHlEWUhrWWc1aStTUmpOcDR2eUljNXBXaEwwejE5?=
 =?utf-8?B?cFAyWjhTcmsrOVV5Q0dNWW5UcVRxNW4xZjZ0dlcrSkJNQTIrUmM5VGc2ak1H?=
 =?utf-8?B?dFpVMDlEbUFoMi82bkI3QVl0ZEIxS1NYZ29yTW5acGNSbmZzc0R3VFRJekpo?=
 =?utf-8?B?U3ZhejQxcmw3cmQzUml3b3YyMXphZ21LWEIzWDlpdFlqU0pkSWZVOEFsampP?=
 =?utf-8?B?N3JVTmNUcGZrUEF4Q2R6TVRrcjZ6Nlg1bnBPWWZXaFhjUHU2NFNDb0ZxWFNy?=
 =?utf-8?B?Zlp0K3htOUpBQ2lVdVBLSStvMGNlS2V0TGFVektxWGNOb2NEaDArNFJXYVRp?=
 =?utf-8?B?eVJwcVBEaW5jbDgvRzZueVQ0T1NiSG1sMmhJSTFQQjBlNm5KNmI5SWxQcE9y?=
 =?utf-8?B?Mm1tZU9rVDBaem01bWc3V01CekVvTGxlb0c2TVRYTGcwTlNmOHNSa2h1UC9R?=
 =?utf-8?B?andDYnlqbm1sS2hQZG1CUm56cWNkcGtUd0w4QmczR3AyakxGakxQTFNBRFdQ?=
 =?utf-8?B?NzNBMThobjZIUGFxMlEzMFNhVlRiUkM4OCtPcVBlbUVYV1VDNVB2RnF1Q3Ax?=
 =?utf-8?B?RnpPTDNOaXdKcHNHUFNmZGtIb1FMZmh6VVFIalAxclAyRGpIUG14bmpEbitt?=
 =?utf-8?B?allkUFcxRUlPOTFzWHlUZmFhUC9ENCs3TmNjKzVjZUlFZFdVS3J5RkpCTGRS?=
 =?utf-8?B?eDB3UVA4Qkdxc3puR1JmTk1zN3E4VVpUQzNvZ0FFUWFkWkNrSnNLOUJ2WkJx?=
 =?utf-8?B?SXRMWkRqMGc0UGwwMGs1MUVaMDJwZlFYR2Z5SjFHRTJpTkxKNjdRNGZpVnBm?=
 =?utf-8?B?aXJtNU5GMDdRYnhUTVRQdlN1QklwN2grUnhhc3JjblRhVzZtV2hKc016WEVn?=
 =?utf-8?B?SnlVZ0srOGN3VWlwYUwzbS9BcnlTcWp3dUtkU1hCMHA3N0xUdFExVU84WE8y?=
 =?utf-8?B?ZDRxNU05RldodFFId3hNajlzVDUzeE1keGhOMW5Qb2cvOTF3S20yS3VzaVFO?=
 =?utf-8?B?MWd2c0NUU3ZHZUdxVkk5OFU3MXdMZktxbzBHdUsycXJtMHk2bmJWbzZnYVZw?=
 =?utf-8?B?eUxXNWlvVlZQamwyYVZaajNrVHlZUGtUaGR5OWgvKzQxQWVoaUtKQkloaWJ0?=
 =?utf-8?B?K0duS1gxc2podjNhc2MrbHRpNUtBa0M0ZXFiN0Z6a2hodVJodWNNQU5McHFm?=
 =?utf-8?B?b3AyL2g4WTVoL2lBMjE1THluYkNnbG1ZSEpJZ0luYWV6OEFoZ1FPbmtvenVp?=
 =?utf-8?B?a2MwZlhDQlFlWFJDQ3Z0aVhxYXZkUkVJNkJ2cHVrbGV6SlVDM3N2WXBPdjQ1?=
 =?utf-8?B?bUpSUTBGcTRxdjRRSFdoVVIxUFVsbEtrb3BVNXRnZU1FMWd6M1RHMVN0QXc5?=
 =?utf-8?B?TFVuUDZpNXhzUWNiaHozeHRzRE9CTEZDckNJRE9TbjJZQ3JUSXBXemNkWlEy?=
 =?utf-8?B?cTRPTG9yWHJuVGwvYnlsU0RnUTNtWFVhZmZrSGIwaVhkRGlWWUhJV0M3RGZm?=
 =?utf-8?B?V2hYZE1UaG40WUJCbloyVjlWOUM2dUJxZzAzY25OeVE3K1FITmVOQ1NEVHFG?=
 =?utf-8?B?L0pxYkJPb1pxbmNoWmJhdStGVTVXSkdSZGtMc0MzZ0ticjhSTzFSVmZQTUdI?=
 =?utf-8?B?a0UwTVVUTkhFNEJuUlN3RmplVmhvRWVnQ3dEdTZ1aGV2VEFKUkRjZ3R6dzZr?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <52FCD841C8901F4DA0546A78590B4CE0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afa42d0-efc2-4603-6e60-08db1c828445
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2023 07:31:49.3213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BInm5SxA8HDKvkOTzRlknChNdXwG1TDBs7x6rh/FDk9Ph3cL6zLcL5yqv66sAfZtkFib+0dYeiAr5uN+cQLUpYtuzUn4nLq53nw3fBieRz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2179
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, Leo Li <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzAzLzIwMjMgw6AgMjA6NDEsIENyeXN0YWwgV29vZCBhIMOpY3JpdMKgOg0KPiBP
biBGcmksIDIwMjMtMDMtMDMgYXQgMTA6MTQgKzAxMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+
PiBPbiBGcmksIE1hciAzLCAyMDIzLCBhdCAwMjowNCwgUGF1bCBHb3J0bWFrZXIgd3JvdGU6DQo+
Pj4gMDEvMDMvMjAyMyAoV2VkIDE0OjIzKSBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4+PiBM
ZSAyOC8wMi8yMDIzID8/IDE4OjUxLCBBcm5kIEJlcmdtYW5uIGEgPz9jcml0Pz86DQo+Pj4+IEhv
cGUgaXQgY2xhcmlmaWVzIGhvdyB0aG9zZSByZWZlcmVuY2UgYm9hcmRzIGFyZSB1c2VkLg0KPj4+
DQo+Pj4gSXQgd2FzIHJlYWxseSB1c2VmdWwgaW5wdXQgYW5kIGdhdmUgYW4gaW5zaWdodCBpbnRv
IGhvdyB0aGluZ3MgZ2V0IHVzZWQuDQo+Pj4NCj4+PiBCdXQgbGV0IG1lIHB1dCBhIHNsaWdodGx5
IGRpZmZlcmVudCBzbGFudCBvbiB0aGluZ3MuwqAgSWYgdGhlcmUgaXMgbm8NCj4+PiBtYWludGFp
bmVyIGZvciB0aGUgcGxhdGZvcm0vYXJjaGl0ZWN0dXJlL0NQVSwgdGhlbiB3aGVyZSBpcyB0aGUN
Cj4+PiBvYmxpZ2F0aW9uIGZvciBtYWlubGluZSB0byBrZWVwIGl0IHVwIHRvIGRhdGUganVzdCBm
b3IgeW91ciBjb21wYW55IHRvDQo+Pj4gdXNlIHRoZSBjb2RlL0JTUCBhcyBhIHJlZmVyZW5jZT8N
Cj4+Pg0KPj4+IERvIHRoZXkgY29udGludWUgdG8gZG8gdGhpcyBmb3Igb25lIG1vcmUgeWVhciwg
b3IgdGhyZWUgb3IgLi4uwqAgPz8/DQo+Pj4gRG9lcyBzb21lb25lIGxpc3QgdGhlbXNlbHZlcyBp
biBNQUlOVEFJTkVSUyBmb3IgYXJjaC9wb3dlcnBjLzgzeHggPw0KPj4gLi4uDQo+Pj4NCj4+PiBJ
ZiB5b3Ugc2VlIGNoYW5nZSAwMTIzYWJjZGVmIGJyZWFrcyBib290IG9uIHlvdXIgcGxhdGZvcm0s
IHlvdSBoYXZlIGENCj4+PiBsZWdpdCB2b2ljZSB0byBncmlwZSBhYm91dCBpdCByaWdodCB0aGVu
IGFuZCB0aGVyZS7CoCBEb24ndCB3YWl0ISEhDQo+Pg0KPj4gSSB0aGluayB0aGUgYW5zd2VyIGhl
cmUgaXMgdGhhdCBDaHJpc3RvcGhlIGlzIGFscmVhZHkgdGhlIG9ubHkgcGVyc29uDQo+PiB0aGF0
IGRvZXMgdGhpcywgc28gaGUgaXMgdGhlIGRlLWZhY3RvIG1haW50YWluZXIgZm9yIHBwYzMyIHJl
Z2FyZGxlc3MNCj4+IG9mIHdoZXRoZXIgaGUgd2FudHMgaGltc2VsZiBsaXN0ZWQgaW4gdGhlIGZp
bGUgb3Igbm90Og0KPj4NCj4+ICQgZ2l0IGxvZyAtLW5vLW1lcmdlcyAtLWZvcm1hdD0iJWFuIiB2
NS4wLi4gYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9bNDU4ZV0qIHwNCj4+IHNvcnQgfCB1bmlxIC1j
IHwgc29ydCAtcm4gfCBncmVwIC12dyAxDQo+PiAgwqDCoMKgwqAgNjEgQ2hyaXN0b3BoZSBMZXJv
eQ0KPj4gIMKgwqDCoMKgIDEyIE1pY2hhZWwgRWxsZXJtYW4NCj4+ICDCoMKgwqDCoCAxMSBUaG9t
YXMgR2xlaXhuZXINCj4+ICDCoMKgwqDCoCAxMSBPbGl2ZXIgTydIYWxsb3Jhbg0KPj4gIMKgwqDC
oMKgIDExIExpYW5nIEhlDQo+PiAgwqDCoMKgwqDCoCA3IFV3ZSBLbGVpbmUtS8O2bmlnDQo+PiAg
wqDCoMKgwqDCoCA2IE5pY2sgQ2hpbGQNCj4+ICDCoMKgwqDCoMKgIDQgUmFzbXVzIFZpbGxlbW9l
cw0KPj4gIMKgwqDCoMKgwqAgNCBSYW5keSBEdW5sYXANCj4+ICDCoMKgwqDCoMKgIDQgTWlrZSBS
YXBvcG9ydA0KPj4gIMKgwqDCoMKgwqAgNCBKdWxpYSBMYXdhbGwNCj4+ICDCoMKgwqDCoMKgIDQg
QW5keSBTaGV2Y2hlbmtvDQo+PiAgwqDCoMKgwqDCoCAzIFhpYW9taW5nIE5pDQo+PiAgwqDCoMKg
wqDCoCAzIE5pY2hvbGFzIFBpZ2dpbg0KPj4gIMKgwqDCoMKgwqAgMyBNYXJjIFp5bmdpZXINCj4+
ICDCoMKgwqDCoMKgIDMgQ2hyaXN0b3BoZSBKQUlMTEVUDQo+PiAgwqDCoMKgwqDCoCAzIENocmlz
dG9waCBIZWxsd2lnDQo+PiAgwqDCoMKgwqDCoCAyIFBhdWwgR29ydG1ha2VyDQo+PiAgwqDCoMKg
wqDCoCAyIE1hdGhpZXUgTWFsYXRlcnJlDQo+PiAgwqDCoMKgwqDCoCAyIE1hcmt1cyBFbGZyaW5n
DQo+PiAgwqDCoMKgwqDCoCAyIEpvcmRhbiBOaWV0aGUNCj4+ICDCoMKgwqDCoMKgIDIgRG1pdHJ5
IFRvcm9raG92DQo+PiAgwqDCoMKgwqDCoCAyIEFybmQgQmVyZ21hbm4NCj4+DQo+PiBQcmV0dHkg
bXVjaCBldmVyeW9uZSBlbHNlIG9uIHRoZSBsaXN0IGFib3ZlIG9ubHkgZGlkIHRyZWV3aWRlDQo+
PiBjbGVhbnVwcywgZGVhZCBjb2RlIHJlbW92YWwgb3IgY29tcGlsZS10aW1lIGZpeGVzLCB3aGls
ZSBDaHJpc3RvcGhlDQo+PiBpcyB0aGUgb25lIHRoYXQgZml4ZWQgbWFjaGluZSBzcGVjaWZpYyBi
dWdzIGFuZCBhZGRlZCBuZXcgZmVhdHVyZXMuDQo+IA0KPiBTcGVha2luZyBvZiB0aGF0LCBJJ2Qg
YmUgZmluZSB3aXRoIENocmlzdG9waGUgcmVwbGFjaW5nIG1lIGluIHRoZSAiTElOVVggRk9SDQo+
IFBPV0VSUEMgRU1CRURERUQgUFBDODNYWCBBTkQgUFBDODVYWCIgZW50cnksIGdpdmVuIHRoYXQg
aGUncyBiZWVuIHdheSBtb3JlDQo+IGludm9sdmVkIHRoYW4gbWUgbGF0ZWx5Lg0KDQpNUEM4M1hY
IHllcyBJIGNhbiwgSSBoYXZlIE1QQzgzMjFFIEhhcmR3YXJlLCBidXQgUFBDODVYWCBJJ20gbm90
IHN1cmUuIEkgDQpkb24ndCBrbm93IG11Y2ggbW9yZSB0aGFuIHdoYXQgSSBjYW4gZXhwZXJpbWVu
dCB3aXRoIFFFTVUuDQoNCk1heWJlIFBhbGkgZm9yIE1QQzg1WFggPw0KDQpDaHJpc3RvcGhlDQo=
