Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C745632AA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 13:41:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZCvz2nX5z3dtT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 21:41:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ccN3FKYK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.40; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ccN3FKYK;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120040.outbound.protection.outlook.com [40.107.12.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZCvF0RPBz3bkR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 21:40:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V30Ps+cLAG6Bc0a3y9/CyCAYREDlRreb517opvpqrGuZBsRdyAwjIov/+yf4m+Ml5XNB4YYTeZdToy2YeW0O3GcGwk0kd32o0B5Z2RhZg+rHzjd+ZjhSvx2YykAeVM6+YmPd0e764L/ZsBrCApUwVX5GI02E4r+w59M6QrEvtUxhTkxZ3PzYVvP9xKDPge3Abfn/XPT5H6VB4lY1c4EmQ6MMPwSZmuGLS4SDKAEYxh3vDMwmXYP48iRq0OX5l1hRto3pnehZE2XorfCSdx+bx5wYUCjvt5VE+t4KhnDa7K+tNnmBAVRYSeCJppyhcIP8lZsQaa1aUGqkgJmPqO2nTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EBq95AbrJGqc9Z49TggYj/VoCNo2tdXhKvkgtWv9+8=;
 b=UmDacLxrOq9M68WspaYrwZFxjV17/UrQaKxQkSfPZDMicHpfphOnWXOXd1E5ZtujRMVHUDrIvSRMrM/o+cvIf/+fkxu2SRwCHFh8MqgxMS36T33m9osKEm+nk/S/KpLkpdEu+nky+MzB24TQ2UuhLmCiGa8Z9QbCTyZFqFtrb9v4b5bR1Q+2Ag3i4/2E8p+xKvaeoluoaVatOHPfqNKxfy4SEFPOdX52DiWK44B0ZojM8AgI57i0JKsp5k+kCXJsangw31i1Uvh9Vz3Zg12TNResyykQ2tjrhMUF4T9m1kH0gIyyQdqunB8jaNAbXiShmu5D9wAP6c0qP4t+Ca8ptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EBq95AbrJGqc9Z49TggYj/VoCNo2tdXhKvkgtWv9+8=;
 b=ccN3FKYKBgZcQK74lz/DOsPE1Qc109Z8JhFgdZ71/ZQkiBF5nXaP/ihuPmAd+YzC8PXCOSkpNnuJc98ABVhNi4n2QCEGDYb/MEhp9nKeYfcnya6CB1rDgEOnHd+vkl4ISxz3tXH7vTcSRN0E+3pSji8yq/Dzzp35TIoDQzJfRSiirC/4ts6fTOn+Ff3UA0jGLXS8xi/fqrLdSIMw3oimUpegSIW71r64Yp4QwQnUHe6kUcOD27gYvQ3Vt8U6Des886/7PJyk6T4Ha8HbTVgqHVThFTxdyjnKwU5gGwKeyrpV5zHYLG8qnnZyszuX1/6Wl0jgTHll+dHFAJX1SIDUBA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1558.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.15; Fri, 1 Jul 2022 11:40:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 11:40:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.vnet.ibm.com>, Chen Zhongjin
	<chenzhongjin@huawei.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Sathvika
 Vasireddy <sv@linux.ibm.com>, Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
 (gcc issue ?)
Thread-Topic: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from
 WARN_ON() (gcc issue ?)
Thread-Index: AQHYjT9gRWPRgSaiG02JtSE75knJYw==
Date: Fri, 1 Jul 2022 11:40:35 +0000
Message-ID: <937625af-92a9-a954-dfd6-2c5ab6bbfab3@csgroup.eu>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-12-sv@linux.ibm.com>
 <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
 <92eae2ef-f9b6-019a-5a8e-728cdd9bbbc0@linux.vnet.ibm.com>
 <cce19b1c-449a-f306-533a-9edc855049aa@csgroup.eu>
 <1656572413.pbaqjnrrcl.naveen@linux.ibm.com>
 <dcbc25df-ce0c-45bf-35af-4d694e09ad37@huawei.com>
 <8787a12a-e84c-cb0e-abe0-6bd6093e359a@linux.vnet.ibm.com>
In-Reply-To: <8787a12a-e84c-cb0e-abe0-6bd6093e359a@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5ebb0d0-8aae-4b81-8e9d-08da5b568356
x-ms-traffictypediagnostic: MRZP264MB1558:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  jD+OMM5RNFo7m4D6ux4YaqE5zzg3hFxnbefI28C+K5IpNsn1/R/vU74/Ft4jQgEi9nveF5NDwghbrJyp6yZHS0WuiiKuB2Za/wuQ/cdJS0KIQC1OGcXB2CzWlpdNVUisAbaUpO7FPt8UDxQJxXfAXmFjm998e+dCAD9u4Iqi/iSpfbs8X4vTAjVMxQfs5v+NkMK9zb/sdnBHjY4qTXB4DybGobLt4AqeXIHNdy/8Tj53mAO1v2k+UtP7nG9/YrPNTOSA0otgxRKdnWyKXc5NuD18Nhj6Fzt+9Tvua0/1tYMCWU70JDdjs8dz39tNFEaBsQzhRUSIlokdP2y6FRm4fcX1lvuw5LqSjmVGfJq3x72r97SZq8uK636K8SBSZTjt9/uwyLevEesOH7Fq3PMp00F4GUhIZgnM1swZ0FGZZAuJVNr9Y+ZlZVFbjh8dqtpIFQGaNZ/we7wq2+BCg4zBiHprJRxhymCWiIzgq66Q1EfViP5ccyAmXVqCD9VypETO2JyTewH9wB+0fFPBSRAjwUfTOFXFuhLcKMwBoqrIgDfEdpLb5H900Kqli9N+jYTwiaRPhapLh2pFIxxo6KU8FOwdQLhX2qL+WNnmOvwdoBVLPIpPI3OB9LJa73N8NZVK0P31x2FruV+kfhcs5RfreSMxg5i0IdhcthUUj+rZzmzb7mJ3yXex/e45Wn2LAWfxx7nKva0Gw/PWPlR4sg1lht/zfKkIPLL87pgm0PRLXU9LI6fipNVf6bsgfCjSrKqJGwE8AM1PkSO4ekUUsau1gl7IzQBQZ6zlXMTYEoWeF8LSa2c4Eipy7LHAHKsr86LkIS4RWgU4hKbNw0uD4uHMIPU9yptz1FbWJowQduA7b8D5aFeBpIq9N/mNMEfHlLth
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39850400004)(376002)(346002)(396003)(366004)(86362001)(53546011)(6512007)(26005)(41300700001)(38070700005)(6506007)(2906002)(4326008)(110136005)(8676002)(31696002)(66476007)(66556008)(54906003)(38100700002)(31686004)(316002)(66946007)(76116006)(36756003)(91956017)(66446008)(6486002)(64756008)(5660300002)(7416002)(44832011)(71200400001)(83380400001)(186003)(66574015)(2616005)(8936002)(122000001)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?azUwQ2lsUFBDY3d5WG05YXgvc3VYdUg3VkN0TGhmYk9JZmVoaUorM3dqWFVX?=
 =?utf-8?B?TU1mY0wwUUEvTkFLWnMvcE9tcXBvQnV3OVN3ZUFUQzhaQVB6RDBieS9zUGFX?=
 =?utf-8?B?MWIyZlV2SGt3TlM2K3hQWndoZGtvZGttRUFRTUJLZ3FBTlBPYk9SdDBiNFpO?=
 =?utf-8?B?UlQyTDcwTnNvZStlOWwvc3NxTUxJNVpWN21ic3QyU1BtT2x0eTdEaXJGT1Er?=
 =?utf-8?B?aitKVmxjK01jK0s3NldtMGhxSmhLT2JrQTBMTTBtUXIzYXhGQVFhZXNjZVF3?=
 =?utf-8?B?b1oxL3phVVliUkFwSHM1b1ZPQjRQWHRVckttZm84YXdBOWEwYzM5djBlaXpa?=
 =?utf-8?B?bEJqTFJvN2I4QmN5ajU1VzVWQmowVFAydFVoQnU2U2NsczFLcWRTTlVEZ1BW?=
 =?utf-8?B?TThWYThVeExlVysyTFpqL0ZodjU4Q3cyNVpXdmVqektRclRqZC8rSjArZ2ZF?=
 =?utf-8?B?VngvdVBhU0UzYThjb1JVb0VueVB1K2tUeFBTbUc0TEpUQTdrMXdVdjhMWmM0?=
 =?utf-8?B?V2hxWFJOcUtmcmZ3SVFCWHlhZXRjc25VaFhQNzQxNFJqbGxlVWJMaFNueXRN?=
 =?utf-8?B?bXZpYTB4VU5EZ0hudklEdGRLMHQ1S1lNcy92V3oxYXJMTlRoa1VQcURySTVV?=
 =?utf-8?B?NXNFU2h6eWcyNXIxanBMWjdNODVFZ1FCdnE1MmEreU5Bc3U0VC9WWkhPdzV1?=
 =?utf-8?B?ZG1Ba1hVZEJLQUhhRHoxTzdXMTY2M0FGditxRGJnQ1pUUjZoTUdZOTZhalZJ?=
 =?utf-8?B?ZHFmV3A1bDVSckpKOGhYTEVIZ3g1SmRicmVXM1hXTmNJbWhCNmFIS1J2M2xo?=
 =?utf-8?B?ck5kK09BbXgva3dqQnVyWUZaS3cyMkVkT2NSZ2lla242OWh6Z0pZdnI3eEJT?=
 =?utf-8?B?cDJjQWVyRDhreFQvdUlSck5WTlJ1R1lXNGtPWXpRWUVnbitReGtCSkE2U05y?=
 =?utf-8?B?RHJtTkxtaS90L2xCSUtpcnpYNm8zRDZvMk04RmlrbXRibWhzTWxBZW1VeC9n?=
 =?utf-8?B?bkUrNnV4dUh0WlhEb292U3BLNWxLajVaVUw5ZDY5ZFJmcHFRN0VzWm9vNnhm?=
 =?utf-8?B?dnRwRnUzRTJRRW5mVmZXbWJ3ekNod0tXc3F6RkRnZWttWURydzhXV2RMbEFK?=
 =?utf-8?B?bFF0bUROb3FaQ290WU12WkxhNHRZYXlHZ1NPU0dpVWdSWWJ6TnYxanN5NEM1?=
 =?utf-8?B?eHNGdnAwZVJsNDdZaHNRTk00SHRjS2xYVGlpaThFTmxiODI3MG1vV1E5WlBX?=
 =?utf-8?B?MVloL2gwYzVpWnJIejlCeHFjcWtSTnRRcUNGaGJ2a0ZwVVliOStWMitVODNi?=
 =?utf-8?B?dEJuR3BrRWFheTZURkNNdFN2SEFVY0lnc3BMUm1uUDJKUzhxamZBWkFlWkJB?=
 =?utf-8?B?WmZFK1RVRVVPTStTOE92TUlYNWlsZ3U2Z1U2d2RaWU1wU1JONE82aGYrTmhi?=
 =?utf-8?B?OWVoTzFlZWJkdVgwQlNURzhraXpUWUR0UUNQTm1QL0ttYWFsUFlYRExYbFJP?=
 =?utf-8?B?bCswYTJML1JRdmZUNldtVDV4cEVlT1FsQTFud1gxNHBISTlycU5RaUlLblQ3?=
 =?utf-8?B?WlM5MmpOWVNVRHpmSVdBYXd1QzB4ZG9FRnRsSVJyaXkvcGhQeVNJTEwrMjVH?=
 =?utf-8?B?QkNDVE5adzBndVI0SHRkWHRRcTVDYTFWVkJvemxUMnZ6YjNEN1BTM1ZTUXdO?=
 =?utf-8?B?VjlwSWRhNUJObzlzbGxYVmdMamJYa3dacHJqQnB2K1phNldhTFVHcnJLUFV0?=
 =?utf-8?B?S0NHVSt3MERuNXV1SXp5bU9OWWE1cUZ5c001cnRlT3lneU9sdGpYYkg3d3BV?=
 =?utf-8?B?WllMSWRIcjRnQ29xWTJLNjA2cVZrUDdoZDUrZkVEYkM0amxCRktucU5lbmE1?=
 =?utf-8?B?WVJCbTF6akFuTTZkbXp3K0FKZWdXZU1neDRJZStwWTRZUjVFYWxFMG9pd2Zn?=
 =?utf-8?B?a0pDUEZtOUdvdjBPWk16VTAwOVV3MkFPRjZRTDVTaVdvUEFPZWY1YURlckEv?=
 =?utf-8?B?UVN6cStHVVpNTURvdEdqREd5eWtwcHJneDdIY0VaSnFvVVpVN0RXL1QyZWhB?=
 =?utf-8?B?Q1gzWHhZMDZVTmdxS0toRkZpSG1BaUVoUThUTUJja24zYkRqSjV0Wkcya3Yx?=
 =?utf-8?B?Wk1yQ0ExNENvL3FXZTZ6VjdQUFc3UklDcTNhSFBPVTlqaU9KWmg4ZVo0WGNl?=
 =?utf-8?Q?xcVGnUXofNtHilyNIjBptlA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9E10777420F7F40B87C2CDBB16F9D2A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ebb0d0-8aae-4b81-8e9d-08da5b568356
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 11:40:35.4680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1vpfvuKEhei2br6Kyt3h7WaABu1kKPngStGuds1OfXNXogumNqdBzWzpmfwxxoURTHbbKjkJ6AozXHP0kykJ6uxGCTf05kcnhg3DsePtBbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1558
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "paulus@samba.org" <paulus@samba.org>, Marc Zyngier <maz@kernel.org>, "mbenes@suse.cz" <mbenes@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgU2VnaGVyLCB5b3VyIGhlbHAgbWlnaHQgYmUgd2VsY29tZSwNCg0KTGUgMDEvMDcvMjAyMiDD
oCAwODo1NiwgU2F0aHZpa2EgVmFzaXJlZGR5IGEgw6ljcml0wqA6DQo+IEhpIENoZW4sDQo+IA0K
PiBUaGFua3MgZm9yIHBpdGNoaW5nIGluIGFuZCBwcm92aWRpbmcgeW91ciBpbnB1dHMgOi0pDQo+
IA0KPiBPbiAwMS8wNy8yMiAwNzo0MywgQ2hlbiBaaG9uZ2ppbiB3cm90ZToNCj4+IEhpIGV2ZXJ5
b25lLA0KPj4NCj4+IEhvcGUgSSdtIG5vdCB0b28gbGF0ZSBmb3IgdGhpcyBkaXNjdXNzaW9uLg0K
Pj4NCj4+IEknbSBub3QgZmFtaWxpYXIgd2l0aCBwcGMgc28gaXQgc3BlbnQgbWUgc29tZSB0aW1l
IHRvIHJlcHJvZHVjZSB0aGlzLiANCj4+IEJ1dCBhdCBsYXN0IEkgZGlkbid0IG1ha2UgaXQuDQo+
Pg0KPj4gV2hhdCBJIGRpZDoNCj4+DQo+PiAxIGNoZWNrb3V0IHRvIHRpcC9vYmp0b29sL2NvcmUN
Cj4+DQo+PiAyIGFwcGx5IHRoaXMgcGF0Y2gNCj4+DQo+PiAzIHJlY292ZXIgdGhlIHVucmVhY2hh
YmxlKCkgYWZ0ZXIgV0FSTl9FTlRSWSguLg0KPj4NCj4+IDQgY29tcGlsZSBvbiBkZWZjb25maWcv
YWxseWVzY29uZmlnDQo+Pg0KPj4gSWYgYW55b25lIGNhbiBwb2ludCBvdXQgd2hpY2ggZmlsZSB3
aWxsIGdlbmVyYXRlIHRoaXMgcHJvYmxlbSBpdCB3aWxsIA0KPj4gYmUgcGVyZmVjdC4NCj4gDQo+
IFRvIHJlcHJvZHVjZSB0aGlzIHByb2JsZW0sIHlvdSBtYXkgd2FudCB0byBhcHBseSB0aGlzIHBh
dGNoIHNlcmllcyBvbiANCj4gdG9wIG9mIG9ianRvb2wvY29yZSBicmFuY2ggb2YgdGhlIHRpcCB0
cmVlLCBhbmQgY29tcGlsZSBvbiANCj4gcHBjNjRsZV9kZWZjb25maWcuDQo+IA0KPiBUaGVyZSBh
cmUgYSBjb3VwbGUgb2YgQyBmaWxlcyB0aGF0IGFyZSBnZW5lcmF0aW5nIHRoZXNlIHdhcm5pbmdz
LiBPbmUgDQo+IHN1Y2ggZmlsZSBpczogYXJjaC9wb3dlcnBjL2t2bS8uLi8uLi8uLi92aXJ0L2t2
bS9rdm1fbWFpbi5vIHdoaWNoIGdpdmVzDQo+ICphcmNoL3Bvd2VycGMva3ZtLy4uLy4uLy4uL3Zp
cnQva3ZtL2t2bV9tYWluLm86IHdhcm5pbmc6IG9ianRvb2w6IA0KPiBrdm1fbW11X25vdGlmaWVy
X3JlbGVhc2UrMHg2YzogdW5hbm5vdGF0ZWQgaW50cmEtZnVuY3Rpb24gY2FsbCogd2FybmluZy4N
Cj4gDQo+IFdpdGggdW5yZWFjaGFibGUoKSBpbiBfX1dBUk5fRkxBR1MoKSwgd2UgZ2V0IHVuYW5u
b3RhdGVkIGludHJhLWZ1bmN0aW9uIA0KPiBjYWxsIHdhcm5pbmdzLCBidXQgd2l0aG91dCB1bnJl
YWNoYWJsZSgpIGxpa2UgaW4gcGF0Y2ggMTEvMTIgb3Igd2l0aCANCj4ganVzdCB0aGUgYnVpbHRp
biB2YXJpYW50IG9mIHVucmVhY2hhYmxlIChfX2J1aWx0aW5fdW5yZWFjaGFibGUoKSkgDQo+IGlu
c3RlYWQgb2YgdW5yZWFjaGFibGUoKSwgd2UgZG8gbm90IGdldCB0aG9zZSB3YXJuaW5ncy4NCj4g
DQoNCg0KSSBtYWRlIGEgc2ltcGxlIHRlc3QgYXNpZGUgb3VyIGlzc3VlIHRvIHNlZSBpZiBJIGdl
dCBzb21ldGhpbmcgc2ltaWxhciANCnRvIEFSTS4gSSBkb24ndCBpZiBpdCBpcyB0aGUgc2FtZSBh
dCB0aGUgZW5kLCBidXQgaXQgbG9va3Mgb2RkIGFueXdheToNCg0KaW50IHRlc3QoaW50IHgpDQp7
DQoJc3dpdGNoKHgpIHsNCgljYXNlIDAgOiByZXR1cm4gMzsNCgljYXNlIDEgOiByZXR1cm4gNTsN
CglkZWZhdWx0IDogdW5yZWFjaGFibGUoKTsNCgl9DQp9DQoNCjAwMDAwMDAwMDAwMDFjODAgPHRl
c3Q+Og0KICAgICAxYzgwOiAgICAgICBhNiAwMiAwOCA3YyAgICAgbWZsciAgICByMA0KICAgICAx
Yzg0OiAgICAgICAwMSAwMCAwMCA0OCAgICAgYmwgICAgICAxYzg0IDx0ZXN0KzB4ND4NCiAgICAg
ICAgICAgICAgICAgICAgICAgICAxYzg0OiBSX1BQQzY0X1JFTDI0ICAgICBfbWNvdW50DQogICAg
IDFjODg6ICAgICAgIDAwIDAwIDIzIDJjICAgICBjbXBkaSAgIHIzLDANCiAgICAgMWM4YzogICAg
ICAgMTQgMDAgODIgNDEgICAgIGJlcSAgICAgMWNhMCA8dGVzdCsweDIwPg0KICAgICAxYzkwOiAg
ICAgICAwMSAwMCAwMyAyYyAgICAgY21wd2kgICByMywxDQogICAgIDFjOTQ6ICAgICAgIDA1IDAw
IDYwIDM4ICAgICBsaSAgICAgIHIzLDUNCiAgICAgMWM5ODogICAgICAgMjAgMDAgODIgNGQgICAg
IGJlcWxyDQogICAgIDFjOWM6ICAgICAgIDAwIDAwIDQyIDYwICAgICBvcmkgICAgIHIyLHIyLDAN
CiAgICAgMWNhMDogICAgICAgMDMgMDAgNjAgMzggICAgIGxpICAgICAgcjMsMw0KICAgICAxY2E0
OiAgICAgICAyMCAwMCA4MCA0ZSAgICAgYmxyDQoNClNvIGl0IGxvb2tzIGxpa2UgaXQgdGFrZXMg
bm8gcmVhbCBiZW5lZml0IGZyb20gdGhlIHVucmVhY2hhYmxlIG1hcmtpbmcuDQoNCk5vdyB3aXRo
IF9fYnVpbHRpbl91bnJlYWNoYWJsZSgpIGluc3RlYWQgb2YgdW5yZWFjaGFibGUoKSA6DQoNCmlu
dCB0ZXN0KGludCB4KQ0Kew0KCXN3aXRjaCh4KSB7DQoJY2FzZSAwIDogcmV0dXJuIDM7DQoJY2Fz
ZSAxIDogcmV0dXJuIDU7DQoJZGVmYXVsdCA6IF9fYnVpbHRpbl91bnJlYWNoYWJsZSgpOw0KCX0N
Cn0NCg0KMDAwMDAwMDAwMDAwMWM4MCA8dGVzdD46DQogICAgIDFjODA6ICAgICAgIGE2IDAyIDA4
IDdjICAgICBtZmxyICAgIHIwDQogICAgIDFjODQ6ICAgICAgIDAxIDAwIDAwIDQ4ICAgICBibCAg
ICAgIDFjODQgPHRlc3QrMHg0Pg0KICAgICAgICAgICAgICAgICAgICAgICAgIDFjODQ6IFJfUFBD
NjRfUkVMMjQgICAgIF9tY291bnQNCiAgICAgMWM4ODogICAgICAgMDAgMDAgNjMgMjAgICAgIHN1
YmZpYyAgcjMscjMsMA0KICAgICAxYzhjOiAgICAgICAxMCAxOSA2MyA3YyAgICAgc3ViZmUgICBy
MyxyMyxyMw0KICAgICAxYzkwOiAgICAgICBiYyAwNyA2MyA1NCAgICAgcmx3aW5tICByMyxyMyww
LDMwLDMwDQogICAgIDFjOTQ6ICAgICAgIDAzIDAwIDYzIDM4ICAgICBhZGRpICAgIHIzLHIzLDMN
CiAgICAgMWM5ODogICAgICAgMjAgMDAgODAgNGUgICAgIGJscg0KDQoNCkhlcmUgdGhlIGdlbmVy
YXRlZCBjb2RlIHRha2VzIGFkdmFudGFnZSBvZiB0aGUgdW5yZWFjaGFibGUgbWFya2luZyBhbmQg
DQpyZXN1bHRzIGluIGEgYnJhbmNobGVzcyBjb2RlLg0KDQoNCkNocmlzdG9waGU=
