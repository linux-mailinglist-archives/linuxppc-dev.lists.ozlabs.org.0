Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D2F53C705
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 10:40:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDxCr62j6z3br2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 18:40:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pOEkPGpy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::609; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pOEkPGpy;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0609.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDxC62f4Lz2xBF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 18:39:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgABl0FvOzfNO1X1j/f+/2X5aN4V9x48mW5ITxxS7DExUrJzqzU3ijfHFYuoAzIQ1pv5vaFzywcnKa8G2HYd1cwJJJE6zmhsy7UxbUzKUzhrA9tqITo2hFnA+gTpccU8BwKunHDf8jxgMnG5pLg9LfXtuNNn2q4WfgrqrKORnmbn+L3MpmdmePSsPOJ6O0V1jdFE4im4kVDQ9ECcCLk/ILvY/jFbjwR1OsWVI/NzPakGyU1opwmxafuTf+T5bayp6uNypOUdlm4y+dKRaUN/H0E5iBwcoPk4fNGDAhHwjS3fB7aWCzKkJeaqzqMcXnEERli6KAgnddOJLHbAHCA29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUbHXZVENEnHU0nJ91gx6T1Xg2UObTUtEBHHTrI7/LI=;
 b=hUBV6JSSDSfj53caz59ck5/O6x7fK8AfjUNBhFE5oieLw47AKHAg/xj85V16JE034qjctmkoKvKwKYFCw5v9uovpwkzBfAWrKNStIfL1cDzfKjAEmbcjLFEHzwJ9omjyhyUBB1kAQFoqg4phFdr6LjsZ5XC+dnqWeAEbuoM1qmqrbNotrfxC+X3NYMohu7EQE+E8UTxKkX9ppnD8YHZbSad6aMN/dmkxOMhF3vYid6MdQHYimRIaEv1HWo+iyAdySoQdcD0P77S/ucDDvOGQhMn3710MDJ5pPfNjnNUZb8Qm6fKIAg/cB9o7qmol+HoqaSAbXURClLXwoEPHKq2u8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUbHXZVENEnHU0nJ91gx6T1Xg2UObTUtEBHHTrI7/LI=;
 b=pOEkPGpyYMJBfNtz7IPeDLumtvdEk+cjYVnt4/fwN1GTjj+XEUC1buzX6K+uTY824cRK24lj9g0Gj0N6n2Bo6Ce59HcpntMglHTdm5C1qcVm94X6nQxovHBZI5LXm+VGOjHQMGT5eYj+RYE1jkiITwqsHlFY1R1xuje262+CLiyiZd5zVfG9euOMONY6y0/Pm2LLdySo3YKD+XWWJ4QKW31ha4rbHXzEZHFGdOjKpKwhICFvOOJEMTEOceroldP+xbuqQS1ZXTrG3f5EAuxhDHzV59h8DiV0qLWUkwKGEzamUBDHdRL1wmZPD+MMU3YkkxdT6ErVpUkoX4vpvSkE3A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1606.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.13; Fri, 3 Jun 2022 08:39:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%6]) with mapi id 15.20.5314.013; Fri, 3 Jun 2022
 08:39:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Donnellan <ajd@linux.ibm.com>, Rohan McLure
	<rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/6] powerpc: Provide syscall wrapper
Thread-Topic: [PATCH 2/6] powerpc: Provide syscall wrapper
Thread-Index: AQHYdXuAopXX3FcHP0KN1CVo2r/5hq06njSAgAJpxwCAAD7HgIAAGR8A
Date: Fri, 3 Jun 2022 08:39:22 +0000
Message-ID: <8e7f310d-00bd-7b49-32a4-af33dd124b25@csgroup.eu>
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
 <20220601054850.250287-2-rmclure@linux.ibm.com>
 <d5a2d52a-a74b-3df8-8772-f37d61d47641@csgroup.eu>
 <4900183A-EABD-427D-A930-F2D44DD59C94@linux.ibm.com>
 <6683e7913a993251de2c491ece0879cae74d4402.camel@linux.ibm.com>
In-Reply-To: <6683e7913a993251de2c491ece0879cae74d4402.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49ed799c-ed36-4fa0-53c2-08da453c8f13
x-ms-traffictypediagnostic: MRZP264MB1606:EE_
x-microsoft-antispam-prvs:  <MRZP264MB160648DBE488292BE731C073EDA19@MRZP264MB1606.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  chmbhf3TNPCfQoBRkRShWVQvKxZWIBkbtVfUuajYZnHVkBu/jMdydgfDWIO3onB783mq9BYLaIteC70CZwK/bNHR5dDJ00qQ2+PEvjuC8m3nOrC7LE5kU8s/IWK2j/Ei1HFrHGt7QV+C1DIcoVooB6QLxfssFfktFwRSICm3CFthY1d43r4Z0hSaGIftE9V5UdrZamuI5cjn1tJl5v1kmN4sbn6qZ6u8BkNcrzyDGRAajzxEewhfYvC46Lhx7VBw528pXI4ykGY276dPa3Ky1XB2Gzpp9v4r2Hvg57NC534LinKAIlqMEzkKUF9MYUYjldkrcIFoj2jBR9fsO7hMLwDxRRZt7b/1L6KiZTz8zH6QsnZzJj5oXCqlfcEGJUBhvI7ISSMykU9y9iTpMn+5dShx+VtEo7F20LSlv6oJVeeNn/2P77nnhCnM3MRCoXzdYg8RZKiN/1YZ8j2SjahGlPbbA+lvIkyUYFQlDeRt5OiP2aTlEupzKH87HbnbmjPmyN31uLkLdS0oPLXQVELXlEJ2arqn5iENhaP020sjYalSghdksnf1quYtnji/z6OWGFC9L/nl3Y6+pDP+VgyCcrMQcD9G1x06tmuXkssCJJiQhh+3tZMLBocH+GAc+ilV5z3DGMifEkFs8xtHY9xIEl02RtXUGJ2nClQKlP40HAYIK7VcpgJfP7VAr5QuF1yvCLB7Lunr//ka6/0yYxz9pqDwdXOJekvsSMnxgsgR7cPY1LU44iUxb9LnbwfUucDfIrZM3HfxVBVD4jbiDOK/FpCk8uGoGAzqfMclN9XUsxo5VKg3GCK6V7Xr9W53LkTFhoa+Tpb3TBLuyhRlDNC7BKFEy4tP2t9vYXC1ApAxT2w=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(76116006)(91956017)(4326008)(122000001)(31696002)(86362001)(8676002)(110136005)(38100700002)(36756003)(31686004)(5660300002)(316002)(8936002)(64756008)(66446008)(66556008)(66476007)(2616005)(186003)(2906002)(508600001)(26005)(6506007)(83380400001)(6512007)(44832011)(71200400001)(6486002)(966005)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ei94dVVWT3VBMFBsRkh5c3J4dGZiS0FMRkFDeUM4bThRRGN3aktZSjNVSkY1?=
 =?utf-8?B?ajYyUHNHWGE2QTYyMXdQZXliL205RytsYUNuVHRqZkk2Q0psMERWRVhncThr?=
 =?utf-8?B?eENNajVNYTdyMUNnRlZBQjh1RjhkSXhUUHM2Wlhnd1U3OUdkcE1ZVHNQcmN5?=
 =?utf-8?B?V3g3cDhhVTJGaU5kVGZhQTNWZ05ReG9lRTRDL2kwZDRIMzFvYUJidHNaZkUx?=
 =?utf-8?B?M0VHTWQxQUphNTUzQndhaUQyaWNhS0ZibTAwWWJVUkpicnRhMlk2TlZWU2k4?=
 =?utf-8?B?S0x1SkNyTFI3dEdVMjlvTXBjTUFmcStScFgwYVhJeE5wTzA4ZFVlcWZzamlN?=
 =?utf-8?B?ZVBxSUxtaDh4bkV1Y1JQSUZySGxWVWRlVXV6ZTgzcTAwOFAySng3eGI1U29w?=
 =?utf-8?B?a0F2S1VQVEU5T0JUWkZiSXFSckt2Q0NJeWZSQTcyZWZvVXp1c3BqRDdDaDFz?=
 =?utf-8?B?ZTN0UXppVTN5Z1NDbEx6dk4yaW1GcGYra0hCV0dKZmVBa1o1UmxRYXhvZ1ZR?=
 =?utf-8?B?Y3c4dGZYM0JKT3RsQ1VBMzFQNXluTHBqSXkrZzdoY3dPSE0yRkptM0k3VWtT?=
 =?utf-8?B?RWZoUWZvYXdKOE15MnFxbVZtSmQ5SHFMSkpyYjdJRkZaVjhiaFZ6VGpXWHBN?=
 =?utf-8?B?ODUrRXMySmRPRWJrUDAxbXlyWGtIODN3YnVPT201NUZEcW5YQUxOMG1NRm1M?=
 =?utf-8?B?VkZweWZIVi9YZXJSditmSThsSTU0OTFvUk9KeXdnR3JjeDFUaVRRckpCMGE1?=
 =?utf-8?B?WWt3RDRPeG9PdkxzMUowZ0tncGp3TFpqRXJjUzk4a0dFMThlRC9YRWVPRDhl?=
 =?utf-8?B?UlNVb2VMcjZJRWZES0hhZ2U0TGQrVXdNR0xvWDNzc3J1NXduZC9pVjBnRGNa?=
 =?utf-8?B?K0lLL0JtME52SWVLc2tRclBoeC9DUFJ2VFZubk1QZEFlenhBeHlWWUtIbURQ?=
 =?utf-8?B?SXdXdXJKOWxnTGFVTFIvb3JTOEIrL2F6TWFWWDN4WUJxMFUxK3UyWEljSWlV?=
 =?utf-8?B?NGN5KzlFbW1tVTFRdXdHejRLRURDZmQ5bkZOMCt6TS9MUXBYMWcxclk0M2lj?=
 =?utf-8?B?N1phMWtFNUlQYjAveWFlNEcvMFZTaUx1UldMcHZxajg1QnVzbjlQbWk1ZXVV?=
 =?utf-8?B?V0l4akV0VUp4b05sZFVuWStJUkZrY05DSlJrRklGTHZkVXUrUUhGNmNOdm5J?=
 =?utf-8?B?NDVlL0lnUi9jQ1Q3ZVJpU1FWNmo2L05sTXh1dnk4VzRYa29EbTJWTFFUSHJa?=
 =?utf-8?B?bkNiV2R0SG5TV3gxUnhXQkVGRVEwejNHUEZ6em5IbEZ2ZkM3cWFXSyt0S0xi?=
 =?utf-8?B?QVkrR1pPZlI2d0VJSlB3Z2xzTjZlKzdQaVhhaDR5S2tCOElKSjh5LzFYWjQx?=
 =?utf-8?B?VWp0ZkE3RGNjQ21QYlE2T3BDV0RmVFRqREZOMkpHdHRhemZ0bWxFbVFlOHUv?=
 =?utf-8?B?dHZrOWZRQ3BjVnd5RlJtQXNCaFNuYTJ0L3BMRFBuOWZxbVRDdkJlU3Y0cUp0?=
 =?utf-8?B?SGgwMUdJRG43ci9TYkpzenI0em4ydy9xMVBEZnBESXpFaFhua0tpRlNrY1E3?=
 =?utf-8?B?VFY0bkFHWnF1M3BBb3hwVmNqT1ZWOEg2KzhlSmw1aUM3S2xwYXh4MlhOQm1P?=
 =?utf-8?B?Ym12UEVMd3hxdEVJTVA1a3dTQ1hpVGZNNS8yWXF6YWdwUldpVUZ4Z09nNnRZ?=
 =?utf-8?B?ZDFaVThkRVNLaUZnSlM3eno2QTYxampJeFJuUkNoVWJYNU1Va0ZYVmRINmg4?=
 =?utf-8?B?ZFc4UXJxTW9xVmVZZUt2YmJmUEhhdW4va3ZSeDJoL1M3N25LNVpqUlJ6UkVm?=
 =?utf-8?B?RGZPcFV3L3NGcEtITTJyZFRUMmlVUzRUUlNya3R0TXQwL282eFRaclVZdG9z?=
 =?utf-8?B?VkVqY3JEZUZLV1ErNzgveE1ZUVFIWmRKQ1p2NlNwYjVsaC90dTl6NnFhZlRl?=
 =?utf-8?B?UGJRdnQ3akd3elBsbjN5YVc3ejA2QVZuOEQrYWVyUXFFc3JzbSt2b3dMMVpG?=
 =?utf-8?B?VGJUSlJYWVVUbFQ4TG9zU3BEKzdoZERDOVZTcVdXd1Y3WDRlVDNuclpacUxZ?=
 =?utf-8?B?TlhuYTErM1MwZkplb3NMWFJMYytlMUdoNVMxQkNqMWJURHNnWVdORHdWZkF1?=
 =?utf-8?B?NVRNTUtrZEtuTEJXZ3hlYUNBaDd2TmxRMFdpSjhWMG5YdlI1bG5PRG9WZ1FI?=
 =?utf-8?B?YnpIYUFJOUp0NEp1cmlvd2c4ZXdJa1RrZTNoYkhQLzFRWHJpUkxaRGtxZmIx?=
 =?utf-8?B?TWJLa09oYVQ4MEJPeUlOZmJGMFlLaEwzdlJ2dExrenlweWx2L1luck0yZ0t6?=
 =?utf-8?B?a0Vja0R0MFg4SnduWjRRQjdQTWtvQm1sa0lxTURSc2VvNEk4bWdhOG5KblZK?=
 =?utf-8?Q?RznUC4+mLr8QchwWkzviLkhwRsEa6qSXtoax5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AB388B6F0490647A1E8EA974203B178@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ed799c-ed36-4fa0-53c2-08da453c8f13
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 08:39:22.6953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +tIrY/gMbWfoUH+m448NzLKUsQ9ZlVVoflHclC+2XStrdTmu2G1gEkoZcNhRRJgqIzBEsG6Bv4V5aReAm4ERLcVpjbHMS5zc7vLYnOsMkME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1606
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzA2LzIwMjIgw6AgMDk6MDksIEFuZHJldyBEb25uZWxsYW4gYSDDqWNyaXTCoDoN
Cj4gT24gRnJpLCAyMDIyLTA2LTAzIGF0IDEzOjI0ICsxMDAwLCBSb2hhbiBNY0x1cmUgd3JvdGU6
DQo+PiBUaGUgaW1wbGVtZW50YXRpb24gb2YgcHBjX3BlcnNvbmFsaXR5IGNhbiBiZSBpbW1lZGlh
dGVseSByZXdvcmtlZCB0bw0KPj4gY2FsbCBrc3lzX3BlcnNvbmFsaXR5LCBidXQgSSBjYW7igJl0
IGRvIHRoZSBzYW1lIGZvciBzeXNfb2xkX3NlbGVjdCBmb3INCj4+IGV4YW1wbGUsIHdoaWNoIGlz
IHJlcXVpcmVkIHRvIGltcGxlbWVudCBwcGNfc2VsZWN0LiBBcyBzdWNoIHdlIGVtaXQNCj4+IGJv
dGgNCj4gDQo+IEZvciBwcGNfc2VsZWN0LCBJIHN1Z2dlc3Qgd2UgcmVzdXJyZWN0DQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNTgxMTk1MGQtZWYxNC1kNDE2LTM1ZTYtZDY5NGVmOTIw
YTdkQGNzZ3JvdXAuZXUvVC8jdQ0KPiBhbmQganVzdCBnZXQgcmlkIG9mIHRoZSBoYWNrLg0KPiAN
Cg0KTm90IHN1cmUgSSB1bmRlcnN0YW5kLCB3aGF0IHdvdWxkIHlvdSBsaWtlIHRvIHJlc3VycmVj
dCA/IFlvdSB3YW50IHRvIA0KcmVzdXJyZWN0IHRoZSBkaXNjdXNzaW9uLCBvciByZXZlcnQgY29t
bWl0IGZkNjlkNTQ0YjBlNyANCigicG93ZXJwYy9zeXNjYWxsczogVXNlIHN5c19vbGRfc2VsZWN0
KCkgaW4gcHBjX3NlbGVjdCgpIikgPw0KDQpXZSBhcmUgdGFsa2luZyBhYm91dCBhIDI1IHllYXJz
IG9sZCBhY2sgLi4uLg0KDQpIb3dldmVyIGNhbGxpbmcgc3lzX29sZF9zZWxlY3QoKSBmcm9tIHBw
Y19zZWxlY3QoKSBpcyBqdXN0IGEgdGFpbCBjYWxsIA0Kc28gSSBjYW4ndCBzZWUgd2h5IGl0IHdv
dWxkIHJlcXVpcmUgZHVwbGljYXRpbmcgdGhlIHB0X3JlZ3MuDQoNCmMwMDA0ZGRjIDxwcGNfc2Vs
ZWN0PjoNCmMwMDA0ZGRjOiAgICAgICAyOCAwMyAwZiBmZiAgICAgY21wbHdpICByMyw0MDk1DQpj
MDAwNGRlMDogICAgICAgNDEgODEgMDAgMDggICAgIGJndCAgICAgYzAwMDRkZTggPHBwY19zZWxl
Y3QrMHhjPg0KYzAwMDRkZTQ6ICAgICAgIDQ4IDE1IGI5IDk4ICAgICBiICAgICAgIGMwMTYwNzdj
IDxfX3NlX3N5c19zZWxlY3Q+DQpjMDAwNGRlODogICAgICAgNDggMTUgYmMgYzAgICAgIGIgICAg
ICAgYzAxNjBhYTggPF9fc2Vfc3lzX29sZF9zZWxlY3Q+DQoNCkNocmlzdG9waGU=
