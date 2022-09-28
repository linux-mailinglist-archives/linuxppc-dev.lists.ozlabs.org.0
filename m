Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E23945EDAA6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 12:54:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mctfs55znz3f2X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 20:54:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=GD8kDTlE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.83; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=GD8kDTlE;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90083.outbound.protection.outlook.com [40.107.9.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MctcV60xjz3f45
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 20:52:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XG8Q8aIKknOqpPQmxsXfcXO+dR1+v0EAal8T8DuWhr4QpQUgcwInUTWvCPJSawc9/PMpYyqzW7rKuoDO3V/XIY5qmbGiaEC2/Sb0V2kVA2RZHToG08PqjHdD141HHoqnO8fyJHYt2VEUoBzk9gae5vuG6iLqN2DIxFQpoY7Ytc8/GYprRWVnG70nM6To9yyUtY1LDq8yeQ3ETrO1DWEKE6pC4/WH8H+5R7xAFJNza+Gge/eVdsO1CUhVxXHpIhE4Dc4jw75zlRqCQAkdtMmb3/ybZuOguRPkAcBmuaD9P24+XDPbAFDJAIJujhjwvIJQQfKkUtJk4DCIxxyWTxJqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plkLNcEptXHsqgShMDWPRmxCcbirL5CSobnqxZ0yAu0=;
 b=QjrPfSDul3Ay6LEqBPhW9OonXpX99H3JjjWjZjf5CfQygGmX5ixFsyHEAyVhu15gQoaSmLewLpEJkO3fkrBuBiG6bRI3rtPoT9jIe6f1j7zsUHs9Vc9TOIWVaxUdWDBd5qp0uqshhTncxvo+eDh2EIuIFOgXQyEDu/yq/uB8Ox6SYiYtDUNej2PAAwwIovYHx9pDLTlMoLZWmCEgSkpnTpxmxJfE/t8g5c6oKN1WdQQzYzbUtdVGmIMgqg6zY81ECN/9pTKe8WAo+UADWu5QLZdB8vepENNolhEx8gxzMe7mW/8PL8g2ykDqy/jcg1p9LfaF/OQ4lZPbIYG6tZ3UHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plkLNcEptXHsqgShMDWPRmxCcbirL5CSobnqxZ0yAu0=;
 b=GD8kDTlEFfoQQoumnj5xmP+UGfQPwMhml6wUG3I8qAlDe2ok3bA58rQFXuBrQn9VYEU3GobF7Vrxz1v2quG8yL8XxyMVPrw3Q+5jPGSoXujtLfk9MzvJaX18mt4RJqI+Xj5Oj8ppM7LfG+FVAzw0K53AjDs26VJrz118NWfocFdbhzxwy4eZWsFRHrbV0M7iBr3LXDuW8CL96cA82nGITZwCsvTLEwQnV1VWk32pp3l9+qNk/wfy8Q25ZPsQTOJHJ47zZzKDVhksNXAETuoKvhJhIksM58Yiw3Aw3eqETCV+wmYclMXtivzvA9xiRRnolH/jwYd11GspJEwx6KjG2Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1835.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:169::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Wed, 28 Sep
 2022 10:52:21 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 10:52:21 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 1/6] powerpc/code-patching: Implement generic text
 patching function
Thread-Topic: [PATCH v2 1/6] powerpc/code-patching: Implement generic text
 patching function
Thread-Index: AQHY0XNe2Qn934FUS0iRuJQMSwM8K63y1Q2AgAE7tACAAJ0bAA==
Date: Wed, 28 Sep 2022 10:52:21 +0000
Message-ID: <53cb5afc-7413-84a1-fcd9-23e95f231af8@csgroup.eu>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
 <20220926064316.765967-2-bgray@linux.ibm.com>
 <7c06a079-4189-e09f-939e-f672e7ff1ab1@csgroup.eu>
 <d0c9bde1e7be8004155bb8179f9ea2a17d874471.camel@linux.ibm.com>
In-Reply-To: <d0c9bde1e7be8004155bb8179f9ea2a17d874471.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1835:EE_
x-ms-office365-filtering-correlation-id: f9fecca7-1eb8-47d1-175b-08daa13f8555
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hcXNlrzDl3qrWM00CyVT1rPa+efLnDtJt6SHgXklg/h/gZJSaWfCgEP/lBVugni5Vs6GAQmP8fhQ0+E2VY4xbA8ekrOZHsW/+mLW6/cAnV9PvJZDQeVYDA6a9NC4Xv62/DePOOr7p1cT9/g56xU8Sf7Jq/L2Ay5eOgmhJoKdwfOW5ynsXB20kVEZVns+kNw4C0LI7hclPwDEpxrP+Cim8dso42TkwBvq090vA+fIcAlmz/OGiWZr07sABZwSWFX6522eoF0UdB/r+0qlkcqqJcIcPjY9AkHNP7YA4kP2g+w3hOlJ47nlGfUBQ/kI08N7v4KHpiOMZNtv3UOWGkVU7O6ECHr5FyQJwovvtE6UTasRLFASto741iRZ7wG0e3baUQkXlFyBDzbggyjNuMpsWxmOpkirzy8cxTJXAZGLlt+VT/RAxaNWd/0aQmoTWVyBwjsvFDsNS3d74UbQe5pNE7/xP391adpyItk5DcxasC0mgp7OMn6ObqFYNwnWYoCAahoFP2TS5gWTTyAdC+x8/tVR8A7ncYhqk9R1Vc8an+AEbnf19L9sh++mL1ff/0q0zHclZoYUu4iBLWtzXzVqnRXIeznmRbT4bxSem5Fpswjar0sSIkdTQol7VXRFY9N1TPG4jrXzuE6D+T8MK/GdmmFsaGCgP0HCS4EAppVa4P9Phgm9tYXCUOTfGDKmiVLv8CE7GvT6F+qVjsU//2GXRJSQs0Uq7eQeyDI8pWdMuPM38J2cBLfeI5ZBprMlsSws0opBEuYRmA0QuC+VvvAHZAC6NtqtYukBGS+r1+/3/ZPz3jIOZ0VXN67oGwLr915EEo+Gl5/A1VQfPJRNygmoLA7W3O4mP3eg0N4AaDoCpok=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(451199015)(83380400001)(2616005)(66574015)(5660300002)(26005)(6512007)(7416002)(86362001)(31696002)(122000001)(8676002)(4326008)(54906003)(66476007)(64756008)(478600001)(38100700002)(6486002)(66446008)(8936002)(6506007)(316002)(31686004)(186003)(44832011)(36756003)(66946007)(91956017)(76116006)(2906002)(66556008)(38070700005)(41300700001)(71200400001)(110136005)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R1hSbDF5bWZEeUd3bGNHYXp6bzNVY1ovMGtuN3dtTkdxeExpbWxnZWowVW5r?=
 =?utf-8?B?SXJtcXV3ZlNlTkFoSnZtRHplVE9tcjBtWjNKQW5MZU9rN0xQVno5N2tDSEJE?=
 =?utf-8?B?VXp2M25NVzlUZkVjZjdITjBZNnJZTXJ3dTZISmUycWsvYUpyWEduTlVaclZK?=
 =?utf-8?B?eXdXcVA4ZzJaV1lrUmxrNHVUYmpVWXBQVnVRc2FSS3dUd1NvZ0ltTHZXTTR3?=
 =?utf-8?B?NDNpUFVTd1Npd1AvaUc3RDBrblhVMnlsQlMybmV4SDZBT0NnQnBUdFdYZVZ1?=
 =?utf-8?B?dW12b2IzeTRzKys5QjlmbGJPaEsvN0JNWmJYLzg2Ky9NalIzM0J0anZnN0Fw?=
 =?utf-8?B?MThzZ29jTE1seVBHUTArTXBBRGdaLzdZUk0wSGhKeFVHSFRCcTNSTHRGcWl0?=
 =?utf-8?B?OVNzeFRNMTU1VUM1bDRjSCt1a0MxRmdlSG56YTlVTDFRaU5qRElWekpPN0d4?=
 =?utf-8?B?TStDbWljM2RiWGUzNFNobCtlL3NsRnpDZnpldWIzR1lOa0xIS0NJMWpZbjd0?=
 =?utf-8?B?TmlpbHlaSkxmM3FwQVBIM2taWEtnQXBCZEkxcEM4TEdpYzFIMitSZVU5dmt6?=
 =?utf-8?B?U1RHNVZRSzM5QTdVMDR4UGMvcFAyRnA1aGRxckFhUFM0SUYzZGtMUDlwMVF0?=
 =?utf-8?B?S0VIMjJ5Sk1BQTNGeXpER05Hci85eTF1S0hTNFZjT1MrdVlXeGVaVTh0TzFz?=
 =?utf-8?B?bkZOT0pUenEreStEZVYySUtJOTdiS2g1UUNldUFMYjZHSGJtSFZ3dXI5M2tF?=
 =?utf-8?B?RjNBcWxUS0hGcWw3UGYwNm5hcGIvNUduSGFYcGRYMHBqcVVXN1lKNDRtRXFS?=
 =?utf-8?B?STdsR254QjVkTUxuREVrWjFKU3VjSG95OGxLdWVtOE5qSVV1cFJ6UEpoY1Qz?=
 =?utf-8?B?cWVqaU5zQm5aRlNHMlpGeTEzSVVTOVpyWUFKRHNQY3dTZUhWYkR4SVk1Zlhv?=
 =?utf-8?B?YmtSalh0V2xQZzEzM2ZTL1hoYVU2REpqOVg1UVNiOW9wQ0lTU0NVY0l1UnJS?=
 =?utf-8?B?ZlhkVU1tYWlWek43a3NuajJjMmpYd2ZlcDhFZXI0MnZMN3NFYmI2bE9uQ2hl?=
 =?utf-8?B?dVZOak9tWlJ4ODROemxRUm5HbVAyc3JJWktJM3NpSHk2b2pBbGNlV094ZnVJ?=
 =?utf-8?B?WTNjeGZKbE8vZHlJZDE3U3JyTWtERXBhbVFCYlA1VG1VcUdqYVQ4c3ZOZ1lY?=
 =?utf-8?B?NTN2N05TRHU1blZ3aCsvbDFmdlRvMXdOSEtUL0plQkNtcmJFc1JnSXBJdity?=
 =?utf-8?B?V1JGWE1WTlcrZG9LdzBlK3diNFB1S1BYMEpDM285YUc2UXlGdmJyeThqZFBm?=
 =?utf-8?B?OVpDSnRXMzN2NEx1WE5ieDhSeDBiTEVJTEtpRysrakpNdHNYMTlhbm9jYUQ3?=
 =?utf-8?B?aVlIcFFydzJibStuMjBuZWREOVY3YjQybmNrdHltWnBqZXNyMUhWZkg4Tisr?=
 =?utf-8?B?UEttd0E0Z01MMGNPSVFUZEJCTDRCazAwRVN6bTdmdDBNcVdwalNyNzZMZkhz?=
 =?utf-8?B?MncrVGc2ay91SFNTSFdRM00rZTlSd3RQS2h2bXpCZ242cENDa0lFSDN4dFB0?=
 =?utf-8?B?SG9pdDQvbndNQURzbk5qWG4yb0ZIbVZRL1dpaE9NWkRQdGw3c0s0cDhTdTg2?=
 =?utf-8?B?S3JNdStxdUlKbktOejhGR09NTjZDQU96S3RXV21QR1NFK0hGL3BSbXJIN3RC?=
 =?utf-8?B?dWRTemgrTXZUenJTaWluUEVTOXZobWx1ZDZMcHY1TFE1d0N6cE9hOVBoQ2c4?=
 =?utf-8?B?clJQa3BlamNmL2VWazRtOExsRVRNRDBWM0ZYQmNJcVhka28rWkg5aWFwSkZh?=
 =?utf-8?B?NlJaMm5CZENqK0RpNjcxZGtTRVJ6aXQvYnJCbldGcnVVOXhYZFdQVG1raDJs?=
 =?utf-8?B?VXVXNkFOMUErR1VMQkhJbG0wSWp3TDFOeDVKZ0NKdUpYSkVLOXdjRkM1REI1?=
 =?utf-8?B?anpQRTVSQzBQRWVJdGt5UjRkZE9wMjVadVVCbFpMU2JWV0tVSC80RWhWem9Y?=
 =?utf-8?B?aDBscUNEWkRRSFVWeThWWlM0aVlseGdrdGtiMlg4WGp3MnhielhXcmk0UzZ0?=
 =?utf-8?B?UDYvQTBGd0xGRXZ6RXFUYTZlT0duUEpxZElmVnU4dW9nQ0FSMWd3SjhqOVhU?=
 =?utf-8?B?WkhDalBNMnZVYXhFZVdnR0N6UHZuK2UxM09RZU80OXE3TUZTWUFFampFOFkw?=
 =?utf-8?Q?aarPXV5tUazIsmDpm+bm+7k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7CD4430E14E8F428C65093D6C65886B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fecca7-1eb8-47d1-175b-08daa13f8555
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 10:52:21.7835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I7sWbgfBHCa67xCag7PtplJupCEO2E3SOmkEzfVUpJASFLd7og3Bu/DWx2Gz8ALOSsx0K/nKngnBjvaFPAXc3cikUhidjhOxIW2nNc4TOKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1835
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzA5LzIwMjIgw6AgMDM6MzAsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
T24gVHVlLCAyMDIyLTA5LTI3IGF0IDA2OjQwICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPj4+ICvCoMKgwqDCoMKgwqDCoC8qIEZsdXNoIG9uIHRoZSBFQSB0aGF0IG1heSBiZSBleGVj
dXRlZCBpbiBjYXNlIG9mIGEgbm9uLQ0KPj4+IGNvaGVyZW50IGljYWNoZSAqLw0KPj4+ICvCoMKg
wqDCoMKgwqDCoGljYmkocHJvZ19hZGRyKTsNCj4+DQo+PiBwcm9nX2FkZHIgaXMgYSBtaXNsZWFk
aW5nIG5hbWUgPyBJcyB0aGF0IHRoZSBhZGRyZXNzIGF0IHdoaWNoIHlvdQ0KPj4gcHJvZ3JhbSBp
dCA/IElzIHRoYXQgdGhlIGFkZHJlc3MgdGhlIHByb2dyYW1zIHJ1bnMgYXQgPw0KPj4NCj4+IGV4
ZWNfYWRkciB3YXMgYSBsb3QgbW9yZSBleHBsaWNpdCBhcyBpdCBjbGVhcmx5IGRlZmluZXMgdGhl
IGFkZHJlc3MNCj4+IGF0DQo+PiB3aGljaCB0aGUgY29kZSBpcyBleGVjdXRlZC4NCj4gDQo+IEkn
bSBub3Qgc3VyZSB3aGF0IGl0IGNvdWxkIGJlIGNvbmZ1c2VkIGZvciBvdGhlciB0aGFuICJ0aGUg
YWRkcmVzcyB0aGUNCj4gcHJvZ3JhbSB1c2VzIiAoYmUgaXQgdXNlcyBmb3IgZXhlY3V0aW5nLCBv
ciB1c2VzIGFzIGRhdGEpLsKgSSBqdXN0DQo+IGNhbGxlZCBpdCB0aGF0IGJlY2F1c2UgaXQncyBu
b3QgbmVjZXNzYXJpbHkgZXhlY3V0ZWQsIHNvICdleGVjX2FkZHInIGlzDQo+IG1pc2xlYWRpbmcg
KHRvIHRoZSBleHRlbnQgaXQgbWF0dGVycyBpbiB0aGUgZmlyc3QgcGxhY2UuLi4pLg0KDQpGb3Ig
bWUsIGF0IGZpcnN0IGxvb2sgaXQgbWVhbnMgJ3Byb2dyYW1taW5nIGFkZHJlc3MnLCB0aGF0IGlz
IHRoZSANCmFkZHJlc3MgdGhhdCBpcyB1c2VkIHRvIHBlcmZvcm0gdGhlIHByb2dyYW1taW5nIGll
IHRoZSBwYXRjaGluZy4gSGVuY2UgDQp0aGUgY29uZnVzaW9uLg0KDQpXaGVyZWFzIGV4ZWNfYWRk
ciBpcyBleHBsaWNpdGVseSBmb3IgbWUgdGhlIGFkZHJlc3MgYXQgd2hpY2ggdGhlIGNvZGUgaXMg
DQpydW4uDQoNCg0KPiANCj4+PiArwqDCoMKgwqDCoMKgwqBpZiAoSVNfRU5BQkxFRChDT05GSUdf
UFBDNjQpICYmIEwxX0NBQ0hFX0JZVEVTIDwgNjQpDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGljYmkocHJvZ19hZGRyICsgc2l6ZSAtIDEpOw0KPj4NCj4+IFRoaXMgZG9lc24n
dCBleGlzdCB0b2RheS4NCj4+DQo+PiBJJ2QgcmF0aGVyIGhhdmU6DQo+Pg0KPj4gIMKgwqDCoMKg
wqDCoMKgwqBCVUlMRF9CVUdfT04oSVNfRU5BQkxFRChDT05GSUdfUFBDNjQpICYmIEwxX0NBQ0hF
X0JZVEVTIDwNCj4+IDY0KTsNCj4gDQo+IFN1cmUsIEkgY2FuIGFkanVzdCB0aGUgc3R5bGUuDQoN
ClRoYXQncyBub3QganVzdCBzdHlsZSAuLi4NCg0KPiANCj4+PiArc3RhdGljIGludCBfX2Fsd2F5
c19pbmxpbmUgX19kb19wYXRjaF9tZW1vcnkodm9pZCAqZGVzdCwgdW5zaWduZWQNCj4+PiBsb25n
IHNyYywgc2l6ZV90IHNpemUpDQo+Pj4gIMKgIHsNCj4+PiAgwqDCoMKgwqDCoMKgwqDCoGludCBl
cnI7DQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqB1MzIgKnBhdGNoX2FkZHI7DQo+Pj4gLcKgwqDCoMKg
wqDCoMKgdW5zaWduZWQgbG9uZyB0ZXh0X3Bva2VfYWRkcjsNCj4+PiAgwqDCoMKgwqDCoMKgwqDC
oHB0ZV90ICpwdGU7DQo+Pj4gLcKgwqDCoMKgwqDCoMKgdW5zaWduZWQgbG9uZyBwZm4gPSBnZXRf
cGF0Y2hfcGZuKGFkZHIpOw0KPj4+IC0NCj4+PiAtwqDCoMKgwqDCoMKgwqB0ZXh0X3Bva2VfYWRk
ciA9ICh1bnNpZ25lZA0KPj4+IGxvbmcpX190aGlzX2NwdV9yZWFkKHRleHRfcG9rZV9hcmVhKS0+
YWRkciAmIFBBR0VfTUFTSzsNCj4+PiAtwqDCoMKgwqDCoMKgwqBwYXRjaF9hZGRyID0gKHUzMiAq
KSh0ZXh0X3Bva2VfYWRkciArDQo+Pj4gb2Zmc2V0X2luX3BhZ2UoYWRkcikpOw0KPj4+ICvCoMKg
wqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgdGV4dF9wb2tlX2FkZHIgPSAodW5zaWduZWQNCj4+PiBs
b25nKV9fdGhpc19jcHVfcmVhZCh0ZXh0X3Bva2VfYXJlYSktPmFkZHIgJiBQQUdFX01BU0s7DQo+
Pj4gK8KgwqDCoMKgwqDCoMKgdW5zaWduZWQgbG9uZyBwZm4gPSBnZXRfcGF0Y2hfcGZuKGRlc3Qp
Ow0KPj4+DQo+Pj4gK8KgwqDCoMKgwqDCoMKgcGF0Y2hfYWRkciA9ICh1MzIgKikodGV4dF9wb2tl
X2FkZHIgKw0KPj4+IG9mZnNldF9pbl9wYWdlKGRlc3QpKTsNCj4+DQo+PiBDYW4gd2UgYXZvaWQg
dGhpcyBjaHVybiA/DQo+PiBPaywgeW91IHdhbnQgdG8gY2hhbmdlICdhZGRyJyB0byAnZGVzdCcs
IGNhbiB3ZSBsZWF2ZSBldmVyeXRoaW5nIGVsc2UNCj4+IGFzDQo+PiBpcyA/DQo+IA0KPiAnYWRk
cicgd2FzIG9ubHkgcmVuYW1lZCBiZWNhdXNlIHRoZSB2MSB1c2VkIGEgcG9pbnRlciB0byB0aGUg
ZGF0YSwgc28NCj4gJ2FkZHInIHdhcyBhbWJpZ3VvdXMuIEknbGwgcmVzdG9yZSBpdCB0byAnYWRk
cicgZm9yIHYzLg0KPiANCj4gSSdsbCBhbHNvIHJlc3RvcmUgdGhlIGZvcm1hdHRpbmcuDQoNClRo
ZW4gbWF5YmUgdGhlICdzcmMnIHNob3VsZCBiZSByZW5hbWVkICd2YWwnIG9yIHNvbWV0aGluZyBl
bHNlLg0KDQpDaHJpc3RvcGhl
