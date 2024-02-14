Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7EA8546A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 10:55:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GEf+BcEk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZYTf6Gp7z3dSM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 20:55:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GEf+BcEk;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZYSx5NZGz2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 20:54:41 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TZYSx59R0z4wby
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 20:54:41 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TZYSx55K6z4wcJ; Wed, 14 Feb 2024 20:54:41 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GEf+BcEk;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::700; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TZYSx1csjz4wby
	for <linuxppc-dev@ozlabs.org>; Wed, 14 Feb 2024 20:54:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxBhSYa1xwTZTgUXOnWxJuzNvc7hKk8+pwqA/Dd64XQeU+oOrnF7B4i6iZFEjGPiamNadje8IF75oPvMODGoC3VCLQnZZFvlVn2LLH+EbenItR0iQg16dEZEBbsg2/NRpbx/hWpkCtamdkIpNnDvXI42aigEtNL7qrdNKHaRbtRYOq0b7x0RPBZqmzfr+XFoZgbUlfvgrtJzHjM2H8LlmOZRw+Iu9FjLXEgZ/Xi+IKg5svhl5zn/VBJhKC2rNy6mv/IwipNnfYMpzhhmWQst/pNwvhOrZddo9gvaeFUWH1B+H0cQzkuhRuUPOYPHV2/kbFQteri1wWItqeyapehZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E70sr+5pJ2CivOTMSRDGFI17JCIXCWmL1xYiD1+ApWI=;
 b=ei3cQYupLqnDHCE8rYj4lwFZjbW9RrwfWLD0dVxc/iZ1HeSUk1QlCQJ8I8VTq/mns9Ea3swAIhL+qZl9RIWR/ZYG607KVeY2dm1TcLBWxVpIL4S13kxe8x9RbhSORNFj4IxECnmDb67pY8KDt+37QTSsnqQ94jswRoQeT5PbxhaBxS2ibBEqnpCDL3QGk30BxB/TqsSf4cjB3pRstnQjus72/svnPYca06doOLHgvrga5GD4ZAl6u4HqRRtFM7wXjWfTta3hiI6vMTXBofS4Eak9DE8NgDWuQvd0QKMFLrZmtpjlx8RXbmU0bcEAUhLhUaWkbdQh/3TzRKd89jQ1Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E70sr+5pJ2CivOTMSRDGFI17JCIXCWmL1xYiD1+ApWI=;
 b=GEf+BcEkj1tXT3x7w2/meo9Nco0NRZ45HaGVepQwCZ8nNN7VryfsvJN12hSCCvu9ZG3l/wn6v7jW7AgdEbddbmzDJUvKmjdgzllKIQAHNRtzEh0P/ajMueIgiYgFnsp3I/Z1ga0obruS1/9DpFE92yjxGQ5xy10wOqzAmaTk5nl/gIi8gUOD/ZHAJXzwNAIYTA+2tHPwL5AmIcnSMiwKHLZrAkBHOyt3/FObOcoC8WE5l3+L6Xx9jFBTlkdEXi45ChIYJ7J0aGxSrIIgD0z05Rxqm12XWo+zk9pKI0PgoI+912LlDfcVfJm8gKxpL5mR+Dkj/dHev11uLfwNW1Urkw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1966.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:192::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 09:54:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%6]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 09:54:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v4] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
Thread-Topic: [PATCH v4] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
Thread-Index: AQHaXyt0S7sehwjYk0i3Iug0Otyz2rEJmUiA
Date: Wed, 14 Feb 2024 09:54:33 +0000
Message-ID: <c1f601e3-120b-43bd-b356-992f5c909e48@csgroup.eu>
References: <20240214095146.1527369-1-mahesh@linux.ibm.com>
In-Reply-To: <20240214095146.1527369-1-mahesh@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1966:EE_
x-ms-office365-filtering-correlation-id: 0070bf9e-822c-43fe-0a17-08dc2d42f270
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  c7OYyPNwE1gyQOpFRvytXxuvWmTI/U/l/FGr9AM2E3RCfYXo6D30bbPI/Dqx/qoGCt4qGS/OB9ifQOtqfQd9wEes0n3sX16uQzSPgllKrAvmGJunLYfwzOln0PB6WIz8CbwQmryn1HnrWN48jDsQrsd8WZksriptDkjAADD6BX1n1lHm4ne2oiwY+8U3T2FkqwxtFqkMWy3ehl+z24GHuM9WUL+R0IwznkPMKOCi2f8o0PATAx26zMZw6tQTC6kTT6Z19Vie7gfjY4iTeTh7WTqznk0cUJfmRFrpZTUsFINsPALBkiV2ViJIXq1hTsKkpdWZOxO8+TQJanTRj+P8EqlNmhBndnk+grrQBvodOy9gdQRCLLZKB/A1/vhuEM02Ut8sJALx9CRWoeBUDkXYYUaH+c+UbWLHkQYLuWEF+1cdWr6vL+y9pQQ4yuQuJ0uUWqtsTi+njvjN/+Lx3gMLdVM9ANA5ovmocGy+xp7XZ0dhzbPv4pAl9+mVItQx/m9k/n8vCRRdRZjMXyDJzKKJo9RgsyeDnsgPuVegYuW+yLISRdRCPVZAGo+bIOOZ8OVIFsHyogOXSmiaaWmqwS8ZO/50TyljfZjVsOa+2vL8bBg=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(346002)(366004)(136003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(2906002)(44832011)(38070700009)(478600001)(6512007)(6506007)(6486002)(966005)(71200400001)(54906003)(316002)(110136005)(2616005)(26005)(66556008)(66476007)(76116006)(66946007)(66446008)(64756008)(91956017)(8936002)(4326008)(8676002)(41300700001)(86362001)(122000001)(31686004)(31696002)(38100700002)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MVlQRDltRnIzV3NmbEdlZFVZQkZuUWdGc2ZrNjhxWUppYXBuNXczNjdKbHg1?=
 =?utf-8?B?VHlGanNaZEZlTW1pOHRJdU8xRDJEczZFbVRsaHhOTm9FVmVUTEs0Y3ZVYmRC?=
 =?utf-8?B?OGFIZWhCTXFLK2huWE5LZVVqZUMxQm5pb2dUSW1FZCtZbkRUeWtTZW5hMWk1?=
 =?utf-8?B?SlpDdE5lMXEyN0YxSURCa2FBcUVGMDlRQ2Q5cXB4Q1VTVjU2T3dZTVlpMVlz?=
 =?utf-8?B?bS9JK0x4Z3JqTWxjeXpWTkpTSU52S0Rna3hidkJkWVo0R3FXeEFHZ3FwWlhJ?=
 =?utf-8?B?WFJPeXh4aHhUQW54NUhsY0tCWHZoQ2VUbGVjMWtsc1czeFlyZ283bjE5eWdZ?=
 =?utf-8?B?eWF2Zy95VGNSMG1lMW00a3EzTFdwSUhyb0dDRlJKN0YvWGpnT1NUMXU4aGRO?=
 =?utf-8?B?MUMyRlZBN2R3VEkzNWFld3lmd3pMYzVGTmFUU0ExZmYzUCtaMlBSNWNqVG1I?=
 =?utf-8?B?cXE4NkFXd3AyMUp3dDJncVI5L1lCd1pOUWlQNTNORHZEc0hOdU9EamZoenVk?=
 =?utf-8?B?V0VrT3hpQkt3ZE5CTlNEbVd5eGZPaUZ1VnJzT2ppbmNsM1p5dUErR0Nsb25E?=
 =?utf-8?B?TTlVV0syWTRYZWhGSGh3SXk5aGNzcFRCbCtVdUU5ZUtLa2piVnFwekpML3Nn?=
 =?utf-8?B?V1BKQktlS2c3VzU3OHFJSmM2OU53eHRURlNjWldBbDZjbDJHWlRYT2dqemVs?=
 =?utf-8?B?Ynl6OWpuSmpjcE5EN29CT213S2ZuV29KSnlpeVpjb1BqelZkcDZQUXh0QjRt?=
 =?utf-8?B?NEdGc1pqa0tEdStkWFIyL2J2UWoyNEF0M2t0ZVdNK3RuaEpJMVNQclU5aDdD?=
 =?utf-8?B?cHhpZXRua2VETGpnbUpIdUpCSHljZTZPbjNkdHExM2tkMDU1Vk83NFdROTBU?=
 =?utf-8?B?STRxZlFsL2p1RGFGWmlBZVNpOGlvVFYvZTFHUUs5bStrWnVOUCtPRU4wc2Ji?=
 =?utf-8?B?VlBNSUQ2Q1BDUm1OMmZYbHFHQWNndzlZT1d3STN4TGhCZTNlc2ZmY244WHRP?=
 =?utf-8?B?N2pYTVhiUXlhRWo3dlJabThwbGx3N2N4OGR1NGNueFpZdVB3VWlRVzQ1TlVl?=
 =?utf-8?B?bUJSYTdYTUsvQTVlSVRHZldkV0xPU2x5Q0J4bmhQMHR4VWlqeENrTXA5UnA5?=
 =?utf-8?B?Szd6RVFHYmZDZ2RXNUtWSjdnVzBsdUMxeGtUYWVuQ0pQQU1CZXR0SC9zVG5E?=
 =?utf-8?B?SVU5YjRZL2ZaM0k1YlZNOHkrWkZzWC9IQXE0MkxCOFVobk5LSEpyaEpxakov?=
 =?utf-8?B?d09kTnYvOFZHS1QwMU85OVJVekV6QjVieEhOSW14T3lUYzd5MUc0aGpNaGp5?=
 =?utf-8?B?eTFYVzNzS09mcldCYWJ4SS9SUzJkT3JFVmR3NjZqRjM4MUg0a2ZsVUM5bm9h?=
 =?utf-8?B?VU1pYksyNzdvbXYvWHNCcXBRQ2pzZHQyOFNzMkpWTjlpOFNxOTUxZTJ2NUFx?=
 =?utf-8?B?N1Fpd3F0OEVQUUtuUW43Y01ZMGs2TUlRZ3E4Qm5JM1JzLzhKWTd4eThVWmxq?=
 =?utf-8?B?aC8vdGN0UUl3elN5K3BxME1tVDhyTFJ3ZWVxelZhUmYvRjI5TzRXbWhFYmRB?=
 =?utf-8?B?ZlZpdGYzQlhKMnRmYmNab2RyZEttSXBtV1djc2NydnVSck03SURXMjBaV3Zh?=
 =?utf-8?B?OHlFSkR0cjBkYWNBelpQNEJjczJZWGFQNjlScE8xZDFmai82dEd2d3RFMW5n?=
 =?utf-8?B?aEY1Y3kwTFlKRHIvcEUwdk9hbndBbXY1UTNybHJTbExJc2NzekdJNFFqdzl6?=
 =?utf-8?B?c2pPTmV2ME1LdkZ3VVFoeHJZRkdTRnBsazRBVTFnZDMwMzFJRzBiQXVsbzIv?=
 =?utf-8?B?dWRqL3pBVGhkeUJaTjFBV3pxUFIrTVJldjY5clp2bmxLNTViVVZIWDNHc0Ex?=
 =?utf-8?B?L1pyRCtoR1dQdjg3TWpWaDBDWVBjL3E3cWZTK0p6MHRGeVFjclRnNlFoZ0JR?=
 =?utf-8?B?eWNVZU1udkpoZVpiRWlCcWRsVXE1K3RQdm9DYWZiQ3ozNHhhc0xVcGlMRlBk?=
 =?utf-8?B?Z0ZpSlpLZW1pNExtMG1aSzVISmwzNHU2dmtoclNONGFkY20yMkwvTVNVZGU2?=
 =?utf-8?B?K2dqbXo0Zk9HcStWcm4ydVBseCtPdWxXMEIvdmd0N1dXN0RXcGREN0hENUhR?=
 =?utf-8?Q?nWm/0RCKz4QDtHIOhJUm68XCd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38AC94ACA1E0884A9F19B014E2BCD9F8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0070bf9e-822c-43fe-0a17-08dc2d42f270
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 09:54:33.8026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iAqnxicEyL5vo8IGinUPnYtIUy67Ksn/m4rISoTfX1PCYO9CP2IMhURFAfx+UIhZqCyf6eJwpJckuOCCuuV3nYyLKAmZyRCV581x0A5W8lI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1966
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzAyLzIwMjQgw6AgMTA6NTEsIE1haGVzaCBTYWxnYW9ua2FyIGEgw6ljcml0wqA6
DQo+IG5taV9lbnRlcigpL25taV9leGl0KCkgdG91Y2hlcyBwZXIgY3B1IHZhcmlhYmxlcyB3aGlj
aCBjYW4gbGVhZCB0byBrZXJuZWwNCj4gY3Jhc2ggd2hlbiBpbnZva2VkIGR1cmluZyByZWFsIG1v
ZGUgaW50ZXJydXB0IGhhbmRsaW5nIChlLmcuIGVhcmx5IEhNSS9NQ0UNCj4gaW50ZXJydXB0IGhh
bmRsZXIpIGlmIHBlcmNwdSBhbGxvY2F0aW9uIGNvbWVzIGZyb20gdm1hbGxvYyBhcmVhLg0KPiAN
Cj4gRWFybHkgSE1JL01DRSBoYW5kbGVycyBhcmUgY2FsbGVkIHRocm91Z2ggREVGSU5FX0lOVEVS
UlVQVF9IQU5ETEVSX05NSSgpDQo+IHdyYXBwZXIgd2hpY2ggaW52b2tlcyBubWlfZW50ZXIvbm1p
X2V4aXQgY2FsbHMuIFdlIGRvbid0IHNlZSBhbnkgaXNzdWUgd2hlbg0KPiBwZXJjcHUgYWxsb2Nh
dGlvbiBpcyBmcm9tIHRoZSBlbWJlZGRlZCBmaXJzdCBjaHVuay4gSG93ZXZlciB3aXRoDQo+IENP
TkZJR19ORUVEX1BFUl9DUFVfUEFHRV9GSVJTVF9DSFVOSyBlbmFibGVkIHRoZXJlIGFyZSBjaGFu
Y2VzIHdoZXJlIHBlcmNwdQ0KPiBhbGxvY2F0aW9uIGNhbiBjb21lIGZyb20gdGhlIHZtYWxsb2Mg
YXJlYS4NCj4gDQo+IFdpdGgga2VybmVsIGNvbW1hbmQgbGluZSAicGVyY3B1X2FsbG9jPXBhZ2Ui
IHdlIGNhbiBmb3JjZSBwZXJjcHUgYWxsb2NhdGlvbg0KPiB0byBjb21lIGZyb20gdm1hbGxvYyBh
cmVhIGFuZCBjYW4gc2VlIGtlcm5lbCBjcmFzaCBpbiBtYWNoaW5lX2NoZWNrX2Vhcmx5Og0KPiAN
Cj4gWyAgICAxLjIxNTcxNF0gTklQIFtjMDAwMDAwMDAwZTQ5ZWI0XSByY3Vfbm1pX2VudGVyKzB4
MjQvMHgxMTANCj4gWyAgICAxLjIxNTcxN10gTFIgW2MwMDAwMDAwMDAwNDYxYTBdIG1hY2hpbmVf
Y2hlY2tfZWFybHkrMHhmMC8weDJjMA0KPiBbICAgIDEuMjE1NzE5XSAtLS0gaW50ZXJydXB0OiAy
MDANCj4gWyAgICAxLjIxNTcyMF0gW2MwMDAwMDBmZmZkNzMxODBdIFswMDAwMDAwMDAwMDAwMDAw
XSAweDAgKHVucmVsaWFibGUpDQo+IFsgICAgMS4yMTU3MjJdIFtjMDAwMDAwZmZmZDczMWIwXSBb
MDAwMDAwMDAwMDAwMDAwMF0gMHgwDQo+IFsgICAgMS4yMTU3MjRdIFtjMDAwMDAwZmZmZDczMjEw
XSBbYzAwMDAwMDAwMDAwODM2NF0gbWFjaGluZV9jaGVja19lYXJseV9jb21tb24rMHgxMzQvMHgx
ZjgNCj4gDQo+IEZpeCB0aGlzIGJ5IGF2b2lkaW5nIHVzZSBvZiBubWlfZW50ZXIoKS9ubWlfZXhp
dCgpIGluIHJlYWwgbW9kZSBpZiBwZXJjcHUNCj4gZmlyc3QgY2h1bmsgaXMgbm90IGVtYmVkZGVk
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFoZXNoIFNhbGdhb25rYXIgPG1haGVzaEBsaW51eC5p
Ym0uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJv
eUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHY0Og0KPiAtIEZpeCBjb2Rpbmcg
c3R5bGUgaXNzdWVzLg0KPiANCj4gQ2hhbmdlcyBpbiB2MzoNCj4gLSBBZGRyZXNzIGNvbW1lbnRz
IGZyb20gQ2hyaXN0b3BoZSBMZXJveSB0byBhdm9pZCB1c2luZyAjaWZkZWZzIGluIHRoZQ0KPiAg
ICBjb2RlDQo+IC0gdjIgYXQgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXhwcGMtZGV2LzIw
MjQwMjA1MDUzNjQ3LjE3NjM0NDYtMS1tYWhlc2hAbGludXguaWJtLmNvbS8NCj4gDQo+IENoYW5n
ZXMgaW4gdjI6DQo+IC0gUmViYXNlIHRvIHVwc3RyZWFtIG1hc3Rlcg0KPiAtIFVzZSBqdW1wX2xh
YmVscywgaWYgQ09ORklHX0pVTVBfTEFCRUwgaXMgZW5hYmxlZCwgdG8gYXZvaWQgcmVkb2luZyB0
aGUNCj4gICAgZW1iZWQgZmlyc3QgY2h1bmsgdGVzdCBhdCBlYWNoIGludGVycnVwdCBlbnRyeS4N
Cj4gLSB2MSBpcyBhdCBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eHBwYy1kZXYvMTY0NTc4
NDY1ODI4Ljc0OTU2LjYwNjUyOTYwMjQ4MTczMzM3NTAuc3RnaXRAanVwaXRlci8NCj4gLS0tDQo+
ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ludGVycnVwdC5oIHwgMTAgKysrKysrKysrKw0K
PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZXJjcHUuaCAgICB8IDEwICsrKysrKysrKysN
Cj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3NldHVwXzY0LmMgICAgICAgfCAgMyArKysNCj4gICAz
IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vaW50ZXJydXB0LmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vaW50ZXJydXB0LmgNCj4gaW5kZXggYTQxOTZhYjFkMDE2Ny4uMGI5NjQ2NGZmMDMzOSAxMDA2
NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ludGVycnVwdC5oDQo+ICsrKyBi
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9pbnRlcnJ1cHQuaA0KPiBAQCAtMzM2LDYgKzMzNiwx
NCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaW50ZXJydXB0X25taV9lbnRlcl9wcmVwYXJlKHN0cnVj
dCBwdF9yZWdzICpyZWdzLCBzdHJ1Y3QgaW50ZQ0KPiAgIAlpZiAoSVNfRU5BQkxFRChDT05GSUdf
S0FTQU4pKQ0KPiAgIAkJcmV0dXJuOw0KPiAgIA0KPiArCS8qDQo+ICsJICogTGlrZXdpc2UsIGRv
IG5vdCB1c2UgaXQgaW4gcmVhbCBtb2RlIGlmIHBlcmNwdSBmaXJzdCBjaHVuayBpcyBub3QNCj4g
KwkgKiBlbWJlZGRlZC4gV2l0aCBDT05GSUdfTkVFRF9QRVJfQ1BVX1BBR0VfRklSU1RfQ0hVTksg
ZW5hYmxlZCB0aGVyZQ0KPiArCSAqIGFyZSBjaGFuY2VzIHdoZXJlIHBlcmNwdSBhbGxvY2F0aW9u
IGNhbiBjb21lIGZyb20gdm1hbGxvYyBhcmVhLg0KPiArCSAqLw0KPiArCWlmIChJU19FTkFCTEVE
KENPTkZJR19ORUVEX1BFUl9DUFVfUEFHRV9GSVJTVF9DSFVOSykgJiYgIWlzX2VtYmVkX2ZpcnN0
X2NodW5rKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gICAJLyogT3RoZXJ3aXNlLCBpdCBzaG91bGQg
YmUgc2FmZSB0byBjYWxsIGl0ICovDQo+ICAgCW5taV9lbnRlcigpOw0KPiAgIH0NCj4gQEAgLTM1
MSw2ICszNTksOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaW50ZXJydXB0X25taV9leGl0X3ByZXBh
cmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHN0cnVjdCBpbnRlcg0KPiAgIAkJLy8gbm8gbm1pX2V4
aXQgZm9yIGEgcHNlcmllcyBoYXNoIGd1ZXN0IHRha2luZyBhIHJlYWwgbW9kZSBleGNlcHRpb24N
Cj4gICAJfSBlbHNlIGlmIChJU19FTkFCTEVEKENPTkZJR19LQVNBTikpIHsNCj4gICAJCS8vIG5v
IG5taV9leGl0IGZvciBLQVNBTiBpbiByZWFsIG1vZGUNCj4gKwl9IGVsc2UgaWYgKElTX0VOQUJM
RUQoQ09ORklHX05FRURfUEVSX0NQVV9QQUdFX0ZJUlNUX0NIVU5LKSAmJiAhaXNfZW1iZWRfZmly
c3RfY2h1bmspIHsNCj4gKwkJLy8gbm8gbm1pX2V4aXQgaWYgcGVyY3B1IGZpcnN0IGNodW5rIGlz
IG5vdCBlbWJlZGRlZA0KPiAgIAl9IGVsc2Ugew0KPiAgIAkJbm1pX2V4aXQoKTsNCj4gICAJfQ0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BlcmNwdS5oIGIvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL3BlcmNwdS5oDQo+IGluZGV4IDhlNWI3ZDBiODUxYzYuLmUyNDA2
M2ViMGIzM2IgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZXJjcHUu
aA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGVyY3B1LmgNCj4gQEAgLTE1LDYg
KzE1LDE2IEBADQo+ICAgI2VuZGlmIC8qIENPTkZJR19TTVAgKi8NCj4gICAjZW5kaWYgLyogX19w
b3dlcnBjNjRfXyAqLw0KPiAgIA0KPiArI2lmZGVmIENPTkZJR19QUEM2NA0KPiArI2luY2x1ZGUg
PGxpbnV4L2p1bXBfbGFiZWwuaD4NCj4gK0RFQ0xBUkVfU1RBVElDX0tFWV9GQUxTRShfX3BlcmNw
dV9lbWJlZF9maXJzdF9jaHVuayk7DQo+ICsNCj4gKyNkZWZpbmUgaXNfZW1iZWRfZmlyc3RfY2h1
bmsJXA0KPiArCQkoc3RhdGljX2tleV9lbmFibGVkKCZfX3BlcmNwdV9lbWJlZF9maXJzdF9jaHVu
ay5rZXkpKQ0KPiArI2Vsc2UNCj4gKyNkZWZpbmUgaXNfZW1iZWRfZmlyc3RfY2h1bmsJdHJ1ZQ0K
PiArI2VuZGlmIC8qIENPTkZJR19QUEM2NCAqLw0KPiArDQo+ICAgI2luY2x1ZGUgPGFzbS1nZW5l
cmljL3BlcmNwdS5oPg0KPiAgIA0KPiAgICNpbmNsdWRlIDxhc20vcGFjYS5oPg0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cF82NC5jIGIvYXJjaC9wb3dlcnBjL2tlcm5l
bC9zZXR1cF82NC5jDQo+IGluZGV4IDJmMTlkNWU5NDQ4NTIuLmUwNGYwZmY2OWQ0YjYgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXBfNjQuYw0KPiArKysgYi9hcmNoL3Bv
d2VycGMva2VybmVsL3NldHVwXzY0LmMNCj4gQEAgLTgzNCw2ICs4MzQsNyBAQCBzdGF0aWMgX19p
bml0IGludCBwY3B1X2NwdV90b19ub2RlKGludCBjcHUpDQo+ICAgDQo+ICAgdW5zaWduZWQgbG9u
ZyBfX3Blcl9jcHVfb2Zmc2V0W05SX0NQVVNdIF9fcmVhZF9tb3N0bHk7DQo+ICAgRVhQT1JUX1NZ
TUJPTChfX3Blcl9jcHVfb2Zmc2V0KTsNCj4gK0RFRklORV9TVEFUSUNfS0VZX0ZBTFNFKF9fcGVy
Y3B1X2VtYmVkX2ZpcnN0X2NodW5rKTsNCj4gICANCj4gICB2b2lkIF9faW5pdCBzZXR1cF9wZXJf
Y3B1X2FyZWFzKHZvaWQpDQo+ICAgew0KPiBAQCAtODY5LDYgKzg3MCw4IEBAIHZvaWQgX19pbml0
IHNldHVwX3Blcl9jcHVfYXJlYXModm9pZCkNCj4gICAJCQlwcl93YXJuKCJQRVJDUFU6ICVzIGFs
bG9jYXRvciBmYWlsZWQgKCVkKSwgIg0KPiAgIAkJCQkiZmFsbGluZyBiYWNrIHRvIHBhZ2Ugc2l6
ZVxuIiwNCj4gICAJCQkJcGNwdV9mY19uYW1lc1twY3B1X2Nob3Nlbl9mY10sIHJjKTsNCj4gKwkJ
ZWxzZQ0KPiArCQkJc3RhdGljX2tleV9lbmFibGUoJl9fcGVyY3B1X2VtYmVkX2ZpcnN0X2NodW5r
LmtleSk7DQo+ICAgCX0NCj4gICANCj4gICAJaWYgKHJjIDwgMCkNCg==
