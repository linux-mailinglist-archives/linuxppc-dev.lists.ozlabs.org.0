Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F354B4686
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 10:50:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxzxX2w4cz3cT4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 20:50:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60b;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::60b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxzx26XKHz30hm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 20:50:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVwurtrXI6thWtpp02ieVL/fXssYImd46SOadrUUzJnrjKoqQEqEoR82xTiEgSDuh9Iti5K4iZjWVklWWWEDYN0sTz6/g266HwWtfwyxgtTnzMZoasjs9rDgSyD/cvfqCP43oeP0Y7ERWXwZeYN2A1qUmkxg8vE7QGswv8mtY6xxhWme1rFSGmnfXl89DbJPXcOG4bdnySdHvLLLhX5yKPs1kJHZkszkptHiZm8N9ZC3ovuFjOTwbZZT3LaYiG4uTbz9Qn4pXGqjrtpvw2A5BaCVOcAAP4XhZIyDS0kOsJb4Qr27wajdqpAVpN2Sy3v9LFudW0gNWvdjpD+KcZdK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxhp1B9rFrYNbQRG/k9f5ggPlijXbahKeg1rQaRkyM0=;
 b=iT8HwJUf2R3G4OzEJP44Slc/tz5iFebg1zk334kEkv3dAHDlWt/dWva6+OYHUVDvTz9QRPJyVHFPuVQj5/6vBcOZRMMiQthPeP+r18ZYNDdXaIo8CgOMoA4fFgWcQyRWCH6KTSdKZVuqD1SHj7btL26QjuJ7YPVgtiLd0VQ2LCStsndgfADZFa9M1z6aF5UwOsZdStWD7JDBhFuwl0e96244QvWe70VCTY6AoOtt5mXZ58XVQHvuD+6CSE39agq3e9zSLOXAIWeFhOCLKfj04I52Rp2AggHQfACAYiz9N2KZ4RQjrXeBDTPAEmCNTLIdKeZmzW3ME9LXYJbvXoJPtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR2P264MB0160.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 09:50:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%9]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 09:50:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>, Paul Menzel
 <pmenzel@molgen.mpg.de>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: BUG: sleeping function called from invalid context at
 include/linux/sched/mm.h:256
Thread-Topic: BUG: sleeping function called from invalid context at
 include/linux/sched/mm.h:256
Thread-Index: AQHYIGUrh/GHNmjCTEyAzDxYump2zqySy5UAgAAEHgA=
Date: Mon, 14 Feb 2022 09:50:06 +0000
Message-ID: <af4ecc95-8cb0-10a8-1819-cb6431b02156@csgroup.eu>
References: <244218af-df6a-236e-0a52-268247dd8271@molgen.mpg.de>
 <YgoiWlNZvTusk1B9@hirez.programming.kicks-ass.net>
In-Reply-To: <YgoiWlNZvTusk1B9@hirez.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b81f382-ba79-4d26-245b-08d9ef9f61c8
x-ms-traffictypediagnostic: PR2P264MB0160:EE_
x-microsoft-antispam-prvs: <PR2P264MB0160BBBB4816D4D37FF6174AED339@PR2P264MB0160.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /lmsLmNVY/qOT6K7+ozzEZMG/h3RlZy4A5HBUoZxWLmJk9Bbr5neFScxhxYyDFIIHskRXiek52KGP6YBKEMJQgZ//4OwHh+jEfgdk8WzXZPdBhQTzmzR+iWtFV4eVgz5FReejeBgPbuxOEc7SK58v0y5bNUszBkdhoXdLZHQKqnL9kmgX41vjW1xfLjQar95dPzKWCSdV+iBmj3Wl1KAJLNNXhsTcjzJAJceCupsueWVIxgO68EC/sCMZMhzr78b9OfxdCHSNOSL9wGadp92PgqJSkFNFUfqWLfE31Yjv4SosR9BXfGB5VOK7F6cQHSxoCpJav8kOtERxx9ZAxvLdRLj1U7arCclzqzFIk5tTnrHuPwiMoM3GBooa7RkzMAhVsqErHrEC+7ND0JhCnmiZoLfDQ6GLDH5DmbLux9xWs0Ko2GFRICBkvsTG+Ua0pk+mELpEOaEtrY4QA7g6pCCmUaQGPQojK/WpElPHWZRXWZ6TpRp4oF94CyVWPZJGdSIUP4e2Hbw8QxQM065MA53eqND06lbH2cBu9kMWB809ZRQ8Ykhrep/SH+QZUdW2KBNk3+5dnuq112ynWhx6HIpMDahL/Q9vZ3YRYGwzAt83EBB5uanUfIKCrZ9MMnkhgqauGNRfRHN7YkQCOjMpM4KyuQ6bkCxyBwDL134kyY4cLtVD00bNbFaarVUwPV9ZQLOndylYQS1XpcSbWbPpMPRVhDHPQO03Zlzsv7+Xku0D/7ny8tX244gHx9SDqw7dvzSo2Z7YPOhCOaf63EGg0p35Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(110136005)(316002)(64756008)(54906003)(38070700005)(2616005)(8676002)(4326008)(26005)(186003)(86362001)(66556008)(66476007)(66446008)(76116006)(91956017)(31696002)(66946007)(6486002)(122000001)(38100700002)(71200400001)(6506007)(6512007)(5660300002)(508600001)(31686004)(44832011)(2906002)(36756003)(7416002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1hBdjV3VXlJcUliZkVGTVdodjV0VjVxYzQwa0FuS0VkNHhHOEgzU0RDZWs1?=
 =?utf-8?B?dlhsNzFkYmpsOUVCNUlYR28veHJTTDhUTnFwRUt2ZnZFL0pVc0djdzEzU2RC?=
 =?utf-8?B?elErWUdqc2FvQ242UVRaZk5FQVNqUlQ0Sm1YWW9aYUw0Q2l1RmN6bGtPdVov?=
 =?utf-8?B?YWNFVjV2RXcwOHhmTTFaMHl3UnJMTEk5eVdlcWlrbFR0UGtTYlIxMmRnVUxy?=
 =?utf-8?B?dVpjSWwzUWRqcVlTNUFyS0FmZlJFVkVrbVJYaTczWlcrT3lkYnZlUEs0b0lB?=
 =?utf-8?B?T2FBdDJMZXpGcTRYYlFrU2g3RWx3c0N5RVZPZUdkRnVTdWsyanAzK3NYcmdD?=
 =?utf-8?B?OUpuQitsWm8zRUpsUW0xMkVQRjJmbWo3TVY0MktPME5Ta2xCbHdjQ1l1T21H?=
 =?utf-8?B?cHpPZlEzU2Fza0lrZnpPQ0lNTGd6NnpobVRKMGs3NHpJZUpxOTNwY3Q3Q1N1?=
 =?utf-8?B?TDJ0MzQxT1phZTFOMGVaMytRdTZtb1lEMHN4aFFaMVJ3c2tZbkNyQVVUaEJC?=
 =?utf-8?B?VzhUd242VnMranZhVmYxMDJ0TUVVTENGWkozZGw2YjFHbG1RZkgwSm9uSnUr?=
 =?utf-8?B?R09oZTY0VjhsQmJnaS9RREJ5QzFyTVZ0MG5WV09FNEg5Q3diT1ZOU3VDY2hH?=
 =?utf-8?B?bEZpZG5WZUI2KzR4R203bXJMa1dWb0p3cCt5NTl4YkZmK0ZhMStEVGpQL0My?=
 =?utf-8?B?eXYxWlFyb3c3aHZJZUhKWkxCYjlLb1lTMnM1TjRMc1dMSFN1dnhtWlVJTmZG?=
 =?utf-8?B?ekpBcFg0ejlSSTRiN0xOUFk2dUIyaXZQUERNVmZBSGhzLzJPWHg3UHBEcVpX?=
 =?utf-8?B?TjJZWUZxUWV2SStEc0NMTFAvaVYvL1BCN2pIbTlNejU5NStleEg4bUtadjkv?=
 =?utf-8?B?ZW1Fa0Znb1lxTkVqdjA0Z09BZmoxekUrZGZEbGZ4UnJsaU1mY2VNdm9NcEJq?=
 =?utf-8?B?dExtc1BaS0dkdHp3M2pqbEh4cmtpWXdPUFo1S1hlTlExLys2SStOME1Ja3Ew?=
 =?utf-8?B?Q0NFMk5FV0ZNamNtQXZ5ZmVuWis2c2ZzbWJzQ3dBRUhhWUJwTUhRMlJXVys5?=
 =?utf-8?B?RmNueHp1U0N1am9KZGV3M0NXa1dtVEsvMVBBVHViV3hEUmRJa1djNFVlREpR?=
 =?utf-8?B?amRXMVFxL2VVTzg2UHBCNjVGRlBBWmwxbnBUWEtLbXc0L1ZYMit2RGhabFFt?=
 =?utf-8?B?bmFCR3ZWSVExamo3VXdUQU5wcmtiaUxsd1MxczI4blpYRWpuVGZIT2VNaXdD?=
 =?utf-8?B?UHhuNVdtMUpLTTlXVEh1bGNqRzE3UDhsajFmNkVBaDM5N3N0RFpacytOTSsv?=
 =?utf-8?B?TFljbVhFbW1sN3hpK2dZRGJFYVFZTDRqNzhxeXVIRjE5cXRvRGtKZFhYN2Zq?=
 =?utf-8?B?bHdodm8zekFJUzFkK3FGcTY0NHNxbDdJdDA2aTRyNmNkMHN4QjB1bG9mOFRL?=
 =?utf-8?B?b01ZY09OUVdwUDlrWVUwM05rTGFaSytoK2pJMnJrVEVRYW9HRys5a1loNEtO?=
 =?utf-8?B?bWc5TTZkeFdxOHZnemhwM1EvTDBCYjNQQ0VQU3d3OVM4RmVDOVRUeGlsUmNi?=
 =?utf-8?B?TFIvYThpNndJM2tjTzNRZk5UbVV6Ris3MStMRGJnb1NzeTZaVHhraDg2ZCsx?=
 =?utf-8?B?aVgzaWQ0MmZrc2FpNmFEWnhwWUZCNEtLVzJGUXJxYXZTVURYNjdieE00S1Z1?=
 =?utf-8?B?RlJrT2lmSjZmekt4UVNDY3ZvMkpPMjZIN2E2eE9KeVpVNFlXL1Z6VmJrWCtt?=
 =?utf-8?B?dGxla1JzQ0ZHWnJpa29hUHB3aE0rYWM1UFUrV2t1bVlzVldKVEx1SFJ4dHB6?=
 =?utf-8?B?UnVrTWI4ODNpaUp0M0kzZ1lxY0Z2a0NDTzFOSm9xL0htRzFic3k3SnJIWUQy?=
 =?utf-8?B?eW5tU3AvSVVTSVJydlQyNGVTM01CZ2tkaTJGaG5GZDJuMW9ROWtmL1plVmtB?=
 =?utf-8?B?TGozMVNHblIrYlVMc1RLRHFXVkFuak45bnU5UHRLelB2MlREZnVXc0lBOGdW?=
 =?utf-8?B?SU1iUlFKazlEZVhhVms0RVZmdjBuWjhJV3Q2NE9oLzZDK3IwdlJJY2wyaXcy?=
 =?utf-8?B?MTBJSGVwdHVhbWFkT2c1ZkRnczE0b1RBcGg2S0V4L1IvWXFMYnJXalpMTS9j?=
 =?utf-8?B?SkU1MG12VTFMcXFlcktIYlhsbGJzV0gxMDR0N1czVDFyOHhvelB2bFlEaVpq?=
 =?utf-8?B?Zyt2TFViNjJZVUZPRFlBR0VtbkJQTVczMHk4OWlrMCsrQ3ZlRGc2RHQ2WEpU?=
 =?utf-8?Q?b0OT0FnJEpSQ2gsAwuzsnGh52C8UgTlDPNcjdIKt38=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED5D6D17E9010E468233B008563408D3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b81f382-ba79-4d26-245b-08d9ef9f61c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 09:50:06.8355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LFNavLzCvMZhZoGlhwNlgZCKvufBxr1XcP7k1RLcqFxhuxCiizluMMIY8b/4XqEsFVtOihxQFcVpgtoHqYqk589gXFkXUuhel577IIvf1lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2P264MB0160
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
Cc: "Paul E.
 McKenney" <paulmck@kernel.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "rcu@vger.kernel.org" <rcu@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Baron <jbaron@akamai.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzAyLzIwMjIgw6AgMTA6MzUsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6DQo+
IE9uIFN1biwgRmViIDEzLCAyMDIyIGF0IDEyOjA1OjUwQU0gKzAxMDAsIFBhdWwgTWVuemVsIHdy
b3RlOg0KPiANCj4+IFsgICAgMC4wMTIxNTRdWyAgICBUMV0gQlVHOiBzbGVlcGluZyBmdW5jdGlv
biBjYWxsZWQgZnJvbSBpbnZhbGlkIGNvbnRleHQgYXQNCj4gDQo+PiBbICAgIDAuMDIyNDQzXVsg
ICAgVDFdIFtjMDAwMDAwMDA4NDgzN2QwXSBbYzAwMDAwMDAwMDk2MWFhY10gPiBkdW1wX3N0YWNr
X2x2bCsweGEwLzB4ZWMgKHVucmVsaWFibGUpDQo+PiBbICAgIDAuMDIzMzU2XVsgICAgVDFdIFtj
MDAwMDAwMDA4NDgzODIwXSBbYzAwMDAwMDAwMDE5YjMxNF0gPiBfX21pZ2h0X3Jlc2NoZWQrMHgy
ZjQvMHgzMTANCj4+IFsgICAgMC4wMjQxNzRdWyAgICBUMV0gW2MwMDAwMDAwMDg0ODM4YjBdIFtj
MDAwMDAwMDAwNGMwYzcwXSA+IGttZW1fY2FjaGVfYWxsb2MrMHgyMjAvMHg0YjANCj4+IFsgICAg
MC4wMjUwMDBdWyAgICBUMV0gW2MwMDAwMDAwMDg0ODM5MjBdIFtjMDAwMDAwMDAwNDQ4YWY0XSA+
IF9fcHVkX2FsbG9jKzB4NzQvMHgxZDANCj4+IFsgICAgMC4wMjU3NzJdWyAgICBUMV0gW2MwMDAw
MDAwMDg0ODM5NzBdIFtjMDAwMDAwMDAwMDhmZTNjXSA+IGhhc2hfX21hcF9rZXJuZWxfcGFnZSsw
eDJjYy8weDM5MA0KPj4gWyAgICAwLjAyNjY0M11bICAgIFQxXSBbYzAwMDAwMDAwODQ4M2EyMF0g
W2MwMDAwMDAwMDAwYTk5NDRdID4gZG9fcGF0Y2hfaW5zdHJ1Y3Rpb24rMHgxMzQvMHg0YTANCj4g
DQo+IGRvX3BhdGNoX2luc3RydWN0aW9uKCkgcmlnaHRmdWxseSBkaXNhYmxlcyBJUlFzLCBidXQg
dGhlbiBpdCBnb2VzIGFuZA0KPiB0cmllcyBhIG1lbW9yeSBhbGxvYywgd2hpY2ggc2VlbXMgYSBi
aXQgZGFmdC4NCj4gDQo+IEknbSB0aGlua2luZyBDaHJpc3RvcGhlIG1pZ2h0IGtub3cgbW9yZS4u
LiBoZSdzIHJlY2VudGx5IGJlZW4gcG9raW5nIGF0DQo+IFBvd2VyIHRleHQgcG9raW5nLi4NCg0K
DQpJIGRvbid0IGtub3cgYWxsIGRldGFpbHMgYWJvdXQgUFBDNjQsIGJ1dCBoZXJlIGl0IHNlZW1z
IGxpa2UgDQpoYXNoX19tYXBfa2VybmVsX3BhZ2UoKSBhbGxvY2F0ZXMgaW50ZXJtZWRpYXRlIHBh
Z2UgZGlyZWN0b3JpZXMgd2hlbiANCnRoZXJlIGlzIG5vdCBvbmUgeWV0LiBTbyBpZiB0aGF0J3Mg
dGhlIGZpcnN0IHRpbWUgDQpoYXNoX19tYXBfa2VybmVsX3BhZ2UoKSBpcyBjYWxsZWQgZm9yIHRo
ZSB0ZXh0X3Bva2VfYWRkcigpIGl0IGFsbG9jYXRlZCANClBVRCBhbmQgUE1EIGlmIG5lY2Vzc2Fy
eS4NCg0KQXMgaXQgaXMga2VybmVsIG1lbW9yeSwgb25jZSBQVUQgYW5kIFBNRCBhcmUgYWxsb2Nh
dGVkIHRoZXkgd2lsbCByZW1haW4gDQpmb3JldmVyIEkgdGhpbmsuIFNvIG1heWJlIHRoZSBvbmx5
IHRoaW5nIHRvIGRvIGl0IHRvIHBlcmZvcm0gYSBkdW1teSANCm1hcHBpbmcvdW5tYXBwaW5nIGlu
IHRleHRfYXJlYV9jcHVfdXAoKSB0byBlbnN1cmUgdGhlIHBhZ2UgZGlyZWN0b3J5IGFyZSANCmNy
ZWF0ZWQgaW4gYWR2YW5jZS4NCg0KQ2hyaXN0b3BoZQ==
