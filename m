Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B4081CBD8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 16:13:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XBcoNCdl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxW5B6yrdz3cbg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Dec 2023 02:13:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XBcoNCdl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::600; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxW4K73vWz3c84
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Dec 2023 02:12:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxDkC7xhII7pPL6mpxgWBPAYxeRSiZEflxbYUq0LJ/rCFs5V++G6IZLGu3lOQ48ybNRRyWzAuSDZHqvq1H2Zo8cXmZFyglQQweC3IJobsRnDDvDdXHQbgzG+AHxUWDlS1DcljAzGtsznON3FEkSH6gm+XCwoe1+tuGYTYa7YnYwwb2sFkUJ0YyO4P1AO7soalu0sM2L7B4pvfpp83QyFuI2hUIz9BKLs3FERkKbzr5GkFpKt7k3d0gdinV8tlAFM+y4TteoTvBn4Ht8PSEcsIoYUEJf+MurMR/Tgy0HG/umfExDYBzrJ1P5gDHsXgUA5XF/TNGZS9z6Y37Ncx7dU1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+R42bZ5zEFvlSZR0pQXTA0KQwNMolGChjUFaVEWHui4=;
 b=lBFRLFuEN1DUD4E2GjWYZH7izAyNftRtmjOcrYzpUVKunqFVE53LsCKMDo6WDt0XeLMVpWVnHcVawitmA6PZvYZl/PNyQvop3FH6oJF8iMH4BT2lndvhWdxMPN8Y0kgWYK6Nt8+Y9bO/NxUnxWOzsYVGmcyYxlWiccKG/aIgWnH6WOF/Jie4KydXXYEBknnS9W5EW9/6Ibxl7ayNCMtcN0oVxMkcxllOA+iDu1jp0u+9tFu65F1hGjip5xboDs+kc60XLI5IHGPyhKf7AuCnQUPE2Ueb4IIp5MA8iQzmRV6IbJRF6k9tH0WsGCU8kTm/oIzlNwnK136PSSN0+c9vgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+R42bZ5zEFvlSZR0pQXTA0KQwNMolGChjUFaVEWHui4=;
 b=XBcoNCdlsLLZaHG22uCVbFJC6nghUtA2Fda1jOhiE7djq7p+BLJaYM6oMD9h3Ec04xkB3LPItyNJZmwhfYYhmg5tyznz9X1ltCgGxL3oeeAcN9VoiMvuiS7STS+h0RF6zW7+6ZCA4K5R+SN88QMq2ne8WUs9R1HlGnPuXHAM/bYQSZOPS2HLhoCWxkIgsH/KsQTmUJC+mrEfQv6MMDm9idtuzAPQod0M3Si+icgyf52io5ScliR1JXhZQ3pT5I5O4u6hNkhmTXLynkN518KA/phn+7TPXxcZQeibPDzSMrDlHXqcmxdFeDslDm70CyIZH4YYSB6Vrz/E0ev37OWdZA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2407.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 15:11:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 15:11:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/6xx: set High BAT Enable flag on G2 cores
Thread-Topic: [PATCH] powerpc/6xx: set High BAT Enable flag on G2 cores
Thread-Index: AQHaNAu2YovK4Jn7OUefUWrjeoMLCrC0gO4AgAB6OgCAAG8jAA==
Date: Fri, 22 Dec 2023 15:11:52 +0000
Message-ID: <867f29f4-c421-4a5f-8a48-2c48ebdeb4c8@csgroup.eu>
References: <20231221124538.159706-1-matthias.schiffer@ew.tq-group.com>
 <875y0rkpe1.fsf@mail.lhotse>
 <ced9897c5db7ea22313d58ba95590e634e98e54b.camel@ew.tq-group.com>
In-Reply-To: <ced9897c5db7ea22313d58ba95590e634e98e54b.camel@ew.tq-group.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2407:EE_
x-ms-office365-filtering-correlation-id: 50c3511b-47e8-46ab-9f4e-08dc03005460
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4I9kYPVcrP2jQyIP+kLDxWtfauBeJAzH3PaFLdJ5EgD6tqcMF/lo6lEBtxgIcBxFWf5jGhWfRDKn0iGc44mbQHUT9F56h2fBfiTlB76aDBfRj3SnB6JTPVUctBeEsDsdRdAS0ZMSmZQ0JfUJwGT3mPwMKdkiUpaNcc8JlDFldHJBqCj6w7a//cxAGJwSGsnJ2tsg05MXz8SFrb4rb5mjrSaTJOHmk0cmEVGw4innZduueI6Q8xH6g+yJqfK9x0r+v45vrIb3ciYZlOEP2K/V3FNhLtg77hhJkJir+StvmDv5Tkx7avdHjq8X59tXPDUQUmf7KO68dDJ1ZHClXP3l3uxiDRy+TTEOkJAcX/XF6JmcJGzq67uLq++K5rHuuca/eYL5+kCFPomnC09pIxIY9f+ClzXyA0bs6il9eYzOpR/swhtfWtg6+bxNnjMdHdZaeJCXENg0jC/UrFtsnIBKo52r49DED2tMADjTmVlmtKtaTezq/sRStW/uAGNErsAIfSaSwZYJKYYdtnLXKokAteqH4u57153cU+bxC6lkd8Lis3X5HrX6QBdiWIDbtJqXH7CAoJoa1LrBTm+KsQlLDEcGvEF0Z+o4Fc0lzsXpfZZCj7oMG/AzrAIe2g7UgN+H3O7fSEJjWCLqhMOtxDmqgwI+z7e6N0k+OVHRcDcWzco=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(366004)(346002)(396003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(31686004)(66899024)(6506007)(66574015)(2616005)(6512007)(26005)(71200400001)(86362001)(36756003)(31696002)(38070700009)(38100700002)(122000001)(66446008)(8936002)(66946007)(41300700001)(44832011)(76116006)(54906003)(8676002)(66476007)(5660300002)(6486002)(91956017)(110136005)(83380400001)(66556008)(4326008)(4001150100001)(478600001)(966005)(64756008)(316002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R2IrTFZWbTBHeGxhTk5YUEtkUU9XbWpYTmFxZFRKa3dhU2JOQmZnQ3Z1TVh0?=
 =?utf-8?B?Sm5UeXBsZXQvbUpkWDVzcVA1T0dRTEFrQWptTXh2VUVkTW9WUXRMWE1yc1Rw?=
 =?utf-8?B?RUlDWmMxeU5nSFVHSm5paEtKWGIxUitJQnpGS3hUSHR5am9tUWxqakk0OWVq?=
 =?utf-8?B?cmY2TDBLV2tLQVhiYmwrV0dNdDVnYjVOdUFlMnZ6N3pUblpWN2k5SnJob0pT?=
 =?utf-8?B?UVFDQTF2aHRMNFdBSXNVaGhUelFQbVdLM3MrQUVuam0vQWVtMktnQjBweFRI?=
 =?utf-8?B?SmxnM2g4Z3gzc1kyTVRqVFlHVUlsZWUxWHBUZHhLREpQMzBFMCtkWU1tZHRo?=
 =?utf-8?B?djdUWjV2UTNLT3FXMWx3dXZiREgwOTRJK2tKTkJYdzU4bmYrOGh6MGVJSE4x?=
 =?utf-8?B?NnhBcENZTHhUMU9HNzlPRk9SUjcrUk81T0krTmhiRXVMcW9aWFZIYytNQ01t?=
 =?utf-8?B?b3d3L2o2bzhMbktkdm80RDU0QlIxUElGbzVPQmdmeEZZdjBjTkg2Yk50cUtl?=
 =?utf-8?B?dzRCR1l0MjZVL2FEcTU4TjB3LzJUQzRqUmMyaWw2RUNXakxJMWN5U2w0Nkxx?=
 =?utf-8?B?MUhLVnJORUhhY3NKbjl0K2tkTXZkNmxFcGNBRE1LOGM3VDl3b2ZXVVRJVnlJ?=
 =?utf-8?B?b3dWRVdaQjVLNXNodWhJZFVCRkYwN2p0ZWxtUm5ET0s2bjI3dWRWU2NCZWdB?=
 =?utf-8?B?a0R3WHBPSUdvVzZ2cEc2anVaQjFwMnU0OXptK3o0aDEyRUVVSStpS2VHSHRD?=
 =?utf-8?B?WlB1WG1wVUhLT2VUSEREVldBZUkrb1pNb1VKMTFlbU9OOThxQ3RoMUg0aVRB?=
 =?utf-8?B?Tk41VWRob0x1K29EUzRsWm9UUmlpN3BoQytGZkd2cEVVUytTRXdwa3BKVWVz?=
 =?utf-8?B?S25paWx4UWpXRkZnaGRZRHhOK254MWVrRzAxcDZCVm9qeEUrMGRBcmpDL0pR?=
 =?utf-8?B?QVE2U2ZvTzJLME8vYzIzOVVUQ0grblYxMmFiUFFQQjFNVXB5K3FJNGFqTE1L?=
 =?utf-8?B?Y3h5QmlodnUwdnJwQitFdHJ1S1dDeFI0QzB2ZTliUmRMakVlYXFEVHh2SmJQ?=
 =?utf-8?B?ZTVWelpyaEVzdjBCaHR0Y2ppcG1Gcm4wbTN6T1JIWmNJVGhoYmpBNGRQNlRr?=
 =?utf-8?B?YVRYZWJZWnRObVE0WTlMMnNiTUZaNUx3a3dHa3ZTVWZSWjlvZVU2TklmVUxF?=
 =?utf-8?B?MWF2bW5PN2RqVlFSTHMvTGxMMU9DUXZOSzBZaVJEYko4YlZwL2k5Sms4dUQ0?=
 =?utf-8?B?UzMxdHhIQ1dsenBoVUhuYmNDMkpvRmhzMDlxT3RIaVlnbGp6K0VxMlBVa2Rp?=
 =?utf-8?B?by9vQUJDVXZPQ205YjFXcFNBb0p3czVpYmVrdGdFdXdTWHp3SDh0aHBPN0gz?=
 =?utf-8?B?RzZ0TU5Rc2tzam9WRVdzT2xNMjVNSFpERDdrMDE2c0xDZFhHWUo3dS9YemlV?=
 =?utf-8?B?d3ZVbWVmU25mR2xQWThNMkJZWkNCdzlKNVUwVHdnNEFpVkNXaG1IVmpYbm5W?=
 =?utf-8?B?bzZMWSsxb1hSWFhObnRpZE5Lb0dqY0ZzRVkvenQvbkN3RDROMjlBY3EwOExU?=
 =?utf-8?B?UVBqZGFPQk9jWXpTZVovNFpGOXlSYXYyekVibFQxNTVFeGdMK0oyMWg0bUd3?=
 =?utf-8?B?Y2UxQ3JxSDJDU3pwMTIvcGw5Y01tQTkrelVoZ2JGQi9NbUljZUF1NWYvRlpO?=
 =?utf-8?B?UFhsYlIxVjFvUXpjeVF6VVQ1WDFnblRqS3Uva1ZJWXNkRm1aNEYvY0VzemxB?=
 =?utf-8?B?aDlPVnFQQzAvcW00NHFJaDgvMW5GK21QRzBna0J1QnMxSy8yNjYrb0VNVGZl?=
 =?utf-8?B?NTVUU0VCOG1QUjZpdzhKUTJxRnVmK3dmV3orNkZKVytUMTgzREo0S000SzBx?=
 =?utf-8?B?WGVud3Y2YVJWT0tFdlE5ek5ITGJEK2lmTENXd0FpQ2Niem5qV01TSXVnMmpx?=
 =?utf-8?B?ZFZGbmE1Qkk4Vm9PU2NVZ2pKSWoxWXZnTitnWXBwUnRsSnYyNDAxd2haZXNm?=
 =?utf-8?B?NTYzVXhpRzI1VW95T3JhUjhINmZoUDJ3VDg4Y1UyRkxPRmhRS1RZUDZsdHFm?=
 =?utf-8?B?UU9tNUFJbVJhV1dQQVQ0ODVpTXFCdWxwTWZZU21OOGNBaWx0bjV3OG5ySUZz?=
 =?utf-8?Q?KDViyYqrL6zLxhJ/ywV+Ruqh4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2EE6DD0AE325F44A10CFEF1BDC70714@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c3511b-47e8-46ab-9f4e-08dc03005460
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2023 15:11:53.0009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EAIngyfvE+LeM7LzwuRk2qavF/2BBuA9zL7LM6cctV8JE1H13sHfxfiIfk0R7OcsLDGQ/QiGduwhzaBXyh/nfqgaIZ8v7qwQt5LKEcvll6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2407
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux@ew.tq-group.com" <linux@ew.tq-group.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzEyLzIwMjMgw6AgMDk6MzQsIE1hdHRoaWFzIFNjaGlmZmVyIGEgw6ljcml0wqA6
DQo+IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIG1hdHRoaWFz
LnNjaGlmZmVyQGV3LnRxLWdyb3VwLmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBp
bXBvcnRhbnQgw6AgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9u
IF0NCj4gDQo+IE9uIEZyaSwgMjAyMy0xMi0yMiBhdCAxMjoxNiArMTEwMCwgTWljaGFlbCBFbGxl
cm1hbiB3cm90ZToNCj4+IE1hdHRoaWFzIFNjaGlmZmVyIDxtYXR0aGlhcy5zY2hpZmZlckBldy50
cS1ncm91cC5jb20+IHdyaXRlczoNCj4+PiBNTVVfRlRSX1VTRV9ISUdIX0JBVFMgaXMgc2V0IGZv
ciBHMi1iYXNlZCBjb3JlcyAoRzJfTEUsIGUzMDBjWCksIGJ1dCB0aGUNCj4+PiBoaWdoIEJBVHMg
bmVlZCB0byBiZSBlbmFibGVkIGluIEhJRDIgdG8gd29yay4gQWRkIHJlZ2lzdGVyIGRlZmluaXRp
b25zDQo+Pj4gYW5kIGludHJvZHVjZSBhIEcyIHZhcmlhbnQgb2YgX19zZXR1cF9jcHVfNjAzLg0K
Pj4+DQo+Pj4gVGhpcyBmaXhlcyBib290IG9uIENQVXMgbGlrZSB0aGUgTVBDNTIwMEIgd2l0aCBT
VFJJQ1RfS0VSTkVMX1JXWCBlbmFibGVkLg0KPj4NCj4+IE5pY2UgZmluZC4NCj4+DQo+PiBNaW5v
ciBuaXQgb24gbmFtaW5nLiBUaGUgMzItYml0IGNvZGUgbW9zdGx5IHVzZXMgdGhlIG51bWVyaWMg
bmFtZXMsIGVnLg0KPj4gNjAzLCA2MDNlLCA2MDQgZXRjLiBDYW4gd2Ugc3RpY2sgd2l0aCB0aGF0
LCByYXRoZXIgdGhhbiB1c2luZyAiRzIiPw0KPj4NCj4+IFdpa2lwZWRpYSBzYXlzIEcyID09IDYw
M2UuIEJ1dCBsb29raW5nIGF0IHlvdXIgcGF0Y2ggeW91J3JlIG5vdCBjaGFuZ2luZw0KPj4gYWxs
IHRoZSA2MDNlIGNvcmVzLCBzbyBJIGd1ZXNzIGl0J3Mgbm90IHRoYXQgY2xlYXIgY3V0Pw0KPj4N
Cj4+IElmIHVzaW5nICJHMiIgbWFrZXMgdGhlIG1vc3Qgc2Vuc2UgdGhlbiBpdCB3b3VsZCBiZSBu
aWNlIHRvIHVwZGF0ZQ0KPj4gRG9jdW1lbnRhdGlvbi9hcmNoL3Bvd2VycGMvY3B1X2ZhbWlsaWVz
LnJzdCB0byBtZW50aW9uIGl0IChub3QgYXNraW5nDQo+PiB5b3UgdG8gZG8gaXQgbmVjZXNzYXJp
bHksIG1vcmUgYSBub3RlIGZvciB1cykuDQo+IA0KPiBBY2NvcmRpbmcgdG8gdGhlIDYwM2UgbWFu
dWFsIEkgY291bGQgZmluZCAoTVBSNjAzRVVNLTAxKSwgdGhlIEhJRDIgcmVnaXN0ZXIgZG9lcyBu
b3QgZXhpc3QgaW4gdGhlDQo+IG9yaWdpbmFsIDYwM2UgY29yZXMgLSB0aGUgcmVnaXN0ZXIgd2Fz
IG9ubHkgYWRkZWQgYnkgRnJlZXNjYWxlIGluIGl0cyBleHRlbmRlZCBpbXBsZW1lbnRhdGlvbnMu
DQoNCkFzIGZhciBhcyBJIGNhbiBzZWUsIHJlZiBHMiBjb3JlIHJlZmVyZW5jZSBtYW51YWwgDQoo
aHR0cHM6Ly93d3cubnhwLmNvbS93ZWJhcHAvRG93bmxvYWQ/Y29sQ29kZT1HMkNPUkVSTSk6DQoN
ClRoZSBwcmltYXJ5IG9iamVjdGl2ZSBvZiB0aGlzIHJlZmVyZW5jZSBtYW51YWwgaXMgdG8gZGVm
aW5lIHRoZSANCmZ1bmN0aW9uYWxpdHkgb2YgdGhlIEcyIGNvcmUsDQphIGRlcml2YXRpdmUgb2Yg
dGhlIG9yaWdpbmFsIE1QQzYwM2UgUG93ZXJQQ+KEoiBtaWNyb3Byb2Nlc3NvciBkZXNpZ24uIFRo
ZSANCkcyIGNvcmUgaXMNCmFuIGltcGxlbWVudGF0aW9uIG9mIHRoZSBQb3dlclBDIG1pY3JvcHJv
Y2Vzc29yIGZhbWlseS4gVGhpcyByZWZlcmVuY2UgDQptYW51YWwgYWxzbw0KZGVzY3JpYmVzIHRo
ZSBHMl9MRSBjb3JlLCB3aGljaCBpcyBhIGRlcml2YXRpdmUgb2YgdGhlIEcyIGNvcmUuDQoNClNv
IHdlIGhhdmUgdGhyZWUgc3RlcHM6IDYwM2UsIEcyIHRoZW4gRzJfTEUuDQoNClRoZSBvbmUgdGhh
dCBoYXMgOCBCQVRzIGlzIHRoZSBHMl9MRS4NCg0KQnV0IGl0IGxvb2tzIGxpa2Ugb3VyIFBWUiBl
eHBlY3RhdGlvbnMgYXJlIG5vdCBjb21wbGV0ZWx5IHJpZ2h0LiANCkFjY29yZGluZyB0aGUgbWFu
dWFsOg0KDQoweDAwODEgMDAxMSBpcyB0aGUgb3JpZ2luYWwgRzIgY29yZSwgYnV0IDB4MDA4MiAx
MDEwIGlzIGFsc28gRzIgY29yZS4NCk9ubHkgMHgwMDgyIDIwMTAgaXMgRzJfTEUgY29yZSwgd2hl
cmVhcyBvdXIga2VybmVsL2NwdV9zcGVjc19ib29rM3NfMzIuaCANCmNvbnNpZGVycyBhbGwgMHgw
MDgyIHRvIGJlIEcyX0xFIGNvcmUuDQoNCj4gDQo+IFRoZSBtYW51YWwgb2YgdGhlIE1QQzUyMDAg
Y2FsbHMgaXRzIGNvcmUgYW4gImUzMDAiLCBidXQgdGhhdCBzZWVtcyB0byBiZSBhbiBvbGRlciBp
bXBsZW1lbnRhdGlvbg0KPiB0aGFuIHRoZSAiZTMwMGNbMS00XSIgY29yZXMgZGVzY3JpYmVkIGlu
IHRoZSAiZTMwMCIgbWFudWFsLiBJJ20gbm90IHN1cmUgaWYgImUzMDAiICh3aXRob3V0ICJjWCIp
DQo+IGFuZCAiRzJfTEUiIGFyZSBzeW5vbnltb3VzLg0KPiANCj4gU28gQUZBSVIgZWl0aGVyICJH
MiIgb3IgImUzMDAiIGNvdWxkIGJlIGFuIGFwcHJvcHJpYXRlIG5hbWUgZm9yIHRoZSBmYW1pbHks
IGJ1dCB3aGljaCBpcyBiZXR0ZXIgSQ0KPiBjYW4ndCBzYXkuDQoNCkkgZG9uJ3QgdGhpbmsgd2Ug
Y2FuIGNhbGwgaXQgZTMwMC4gWWVzIE1QQzUyMDAgbWFudWFsIGNhbGxzIGl0IGUzMDAgYnV0IA0K
cmVmZXJzIHRvIEcyIGNvcmUgcmVmZXJlbmNlIG1hbnVhbC4NCg0KVGhlIGUzMDAgcmVmZXJlbmNl
IG1hbnVhbCANCihodHRwczovL3d3dy5ueHAuY29tL2RvY3MvZW4vcmVmZXJlbmNlLW1hbnVhbC9l
MzAwY29yZVJNLnBkZikgb25seSBkZWFscyANCndpdGggZTMwMGMxLWUzMDBjNCBzbyB0aGF0IHNl
ZW1zIHRvIGJlIHdoYXQgZTMwMCBpcy4NCg0KSG93ZXZlciwgaW4gZTMwMCBtYW51YWwgdGhlIFBW
UiB2YWx1ZXMgYXJlIG5vdCBpbiBhY2NvcmRhbmNlIHdpdGggdGhlIA0Kb25lcyBnaXZlbiBpbiB0
aGUgRzIgY29yZSByZWZlcmVuY2UgbWFudWFsLiBIZXJlIHRoZXkgc2F5IDB4MDA4MjEwMTAgaXMg
DQphbHNvIGEgRzJfTEUgY29yZS4gU28gd2hpY2ggbWFudWFsIHNoYWxsIHdlIGJlbGlldmUgPw0K
DQpDaHJpc3RvcGhlDQo=
