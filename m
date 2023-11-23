Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B117E7F5877
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 07:41:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ijGbXesF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbT6F4XNkz3vp4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 17:41:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ijGbXesF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::625; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbT4n6BjDz3vkL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 17:40:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7VXGiM+g6e/wiNe+M3dPJqAR302mC9b0z7VF6OgpKzXKnzwK1XOQcyqCWLLpjbIOroZqlzJujl8JmlPHlfaNQ932aIY9V/icavCsBJnzTJpl96sTevHIlYIKiTCkhlTba0x5vTjdlo4W7wcWyP/aIIfn2kVjR8mRT1wKJ8VYKZjx5h26ZcP2zY6dZEjHrvTtBS7IU1m85qFHe3COQMnMUf+AnjEf6+4+MY3u5ChuErGkGAM3jtoLEpsmDyW5sV8Pfpy+7pEklBollSvTNA34oZsyvbSpehHOl//6mhDJxdzaa5ctxyv9TyfEAwc84bM4kbYOK8c5KMG42mrNa/BEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRe8iza77wO1vVx4GauRgYWVXOn+mo6rjbLVdHU0gN8=;
 b=cZWF4G+R7tiBVSHpIJeVkdoFRekubgWT+9ebdq7lSwazPGT8t3nnKa0HSbp+LE0J4Qwe4D/wLsfNYk6QqOSDRncMIYM4mYwU4J4T1jH1RUgIJZ/at9jRYyiiUtbh6j23v7fVmv8/rCZqPDuKroeN/RD6cfbmO5n1rKsFWfQVlOrq/qOjIcganqS4qLCmB2WyssxAnXXsM5F4ypYJgQ7s57uVxPJ/vqnFUJWNj3yk82GYJJXf9eKrv1wqL5EHs4HARynNLysXbn/pb2x9CiWqAitXv/eXLzGwnK68CBFOKeT8bk/mWr32EH1Ippq4MNb5pDr+2OnhCzEoe8zLipDyYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRe8iza77wO1vVx4GauRgYWVXOn+mo6rjbLVdHU0gN8=;
 b=ijGbXesFux7V5jx6mKOKd3rZcWZiD0KJox+KoHvvsCzc3Fn1VLQ5Mth4FzK6xRGTDd+xzyofiG5ylyKbFfWaFFrxstKiDFbCmVV3xQXQ48s1wxw/2dzbyiBrGWs6WnJxRW+qp6rPyWqOTZdhEtI4EgdNBStfJ7CiIb9PDPIniD2DgjisctxCiNjzqL5k0oHA9KhWFE914WYu3X2ArVSOxjME1lbQs9ryXisWI6R7qOV2+r1iBGyOcYavGJN+nbVUcvas9plPyaCyvtBlU6fYBNe95AchIJd4+sNlObHiKZMvPVPuUM9IeuAke5hEeQuiAwEZgo0lNQeGpteaKb+JgQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1542.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.12; Thu, 23 Nov 2023 06:39:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 06:39:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>, Rob
 Herring <robh@kernel.org>, Daniel Gimpelevich
	<daniel@gimpelevich.san-francisco.ca.us>, Andrew Morton
	<akpm@linux-foundation.org>, Pratyush Brahma <quic_pbrahma@quicinc.com>,
	Tomas Mudrunka <tomas.mudrunka@gmail.com>, Sean Anderson
	<sean.anderson@seco.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Catalin
 Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 8/8] CMDLINE: arm64: convert to generic builtin command
 line
Thread-Topic: [PATCH 8/8] CMDLINE: arm64: convert to generic builtin command
 line
Thread-Index: AQHaE3akfEDOC7VXYE69fXl7TfJ9HLCHiMkA
Date: Thu, 23 Nov 2023 06:39:50 +0000
Message-ID: <ef5f8592-2032-417c-80b3-7d81e6e49026@csgroup.eu>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-9-danielwa@cisco.com>
In-Reply-To: <20231110013817.2378507-9-danielwa@cisco.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1542:EE_
x-ms-office365-filtering-correlation-id: 9e77e612-a0c6-483e-e7ca-08dbebeefe8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  tP8kFVu4agLh9xQo9CQemrtN7Zyu233cMtMOAcRxDlUiMQM4+peDABdISq7qZ2O+gH/0JgfGNsIdWohvbmpstZxc4zUkHONVHdBZYdENHn4YM6S2swDkf7rP4Ft2ba/EhT8hTAQU3vCUoBtFnBFiZHtNyhskv8pL5jOb9J5c6OAkLd29a/XmeGjIPTD5dNjV/Jl1BKL3MKIjd7qf8Z5JiEJhC72uZp6I3NUY6LBZjNArLJOIhj6G87TxYIwXFe2jJPIdx49jwyO57e2rztiIwRp25JuM6iQYjakgo+eskYa3gQN9ZaNfENAle8UmMTScviTwlGCjwCuzJhh7kjQw8z3EPa6E/HJBvL3YT/MNME8oD/GUsbM7ADpl7SIeoUq8vG0NBz9wXz6wpToHh2Hsvrjrf6sXEiqPXNJlHqqUfQnm228Sbg+X33a1Lxw09AFUiYRIwgoRm5gctTMMwsKKNi8EKq7S1fv5xZGDlPdm2rxEh2vXpOIXMMT1vyPgwmgb2+uxiZzMi7hzU73Hz2HSJ1n3rb85cSycNSKkG6O0kJWwW6zYD/nORjYL7wbvNsuZE1kaF0b3HasEEficeqrTxgwxoZcWYpy76dH4/Z/C1ggk4hHEdf56Cpb66mJS7cgXQHXT2ZpiXkAcjSHWSnot7lpc8b0O4kVeywUws0jJW4Tr7QKbHadU1vKTIms3GAdy29gvBzJD/vIOVCpFyk/xsY+6pPJmZh7VTdldeTdbAOfElxD5qmA+gguSxU+atyU+Hq0YjLXeZEVpihM+4CCBkQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(230173577357003)(230273577357003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(31686004)(921008)(38070700009)(66946007)(66556008)(76116006)(66476007)(66446008)(64756008)(54906003)(91956017)(110136005)(38100700002)(36756003)(122000001)(31696002)(86362001)(83380400001)(66574015)(26005)(6506007)(6512007)(2616005)(6486002)(2906002)(7416002)(316002)(478600001)(8676002)(5660300002)(4326008)(44832011)(71200400001)(41300700001)(8936002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cXI2Zmd0WTRESElTWVU2WTVvRmhTaHVXV0lwZHlydkxXV0NqNElVSWx2UUU1?=
 =?utf-8?B?cWZzdVBlbXZXUmwvMW9DZFRPd1BaV1UwZHZtUWEyaDVtcHNTbXVMaTJ6LzI2?=
 =?utf-8?B?K2tOT3FhRGN3T3lGUDNNMVdsK21DLy8rOERYaGdJVzBRclZPVTNaRm5wSFZC?=
 =?utf-8?B?WDI3U3VaUFBPYmJEZ0ROVlYrcS9mWE9XcDI1TXJyK3dyUjdWemZVVmpVRzVi?=
 =?utf-8?B?cHM5UVZaNW5FNS8zMnEyNlNNTUkvR2JDKzRYZ1NudVBscGh3eVNyc2w1YTNz?=
 =?utf-8?B?YUg4Y2FHTzZqVFZKRlZUSUV3OHVueWd0eGZlSXJSZVQxdWVhSEJiaU9NYUJZ?=
 =?utf-8?B?U21LakZjUkFJSmxyWUFVaHhLSHFocTM5VHJ4VWo5ZXgxcDVhMkpDYVRMbWNw?=
 =?utf-8?B?T0lTSWs2L0QxclljTEQyaGpmWUdMRUVQdThCRml1M05ZTXdnQVg2dEE2OUFL?=
 =?utf-8?B?MXQ5TlM3UU9ZdG96WkFvWWMvQ2NaQlRQamdKNVJzWkVKdTZ3dVN1TkRYb3h2?=
 =?utf-8?B?UjFQSDhoUXZrczFaeGJkcVljSTBhTW1HcDBBZUJsV2I1N1RMUlQxQkZRN0hT?=
 =?utf-8?B?THdRZWJpNTdVZFBqa2FPQzdvVVR2ZnBtV3AzKzVHNEh4ZURCMjVZWSs2YUFh?=
 =?utf-8?B?QVBFajZzaTNFcExIeUM5QWNERlRVcUJSNlB3ZkJBR0U2T3VLYW0za0Y1cGhG?=
 =?utf-8?B?MXkzSGRzUmFya3FuM0dvZ2piMUJpL1pKQyswUStEclB3ZjBublpWbjVRZTIv?=
 =?utf-8?B?MGYrWUJxUHp6Nk1sRG9KZmxFWWNLZlFBTHYwSkt6YThHdVJ5djV3TXVkR3Jn?=
 =?utf-8?B?akVXMkp6MVcxbGt4Y2lrcmYrbGJ0L0lKN00rdm9TOG1jZEpmMWxwc1BXUk0w?=
 =?utf-8?B?clQzZ3JoMUFOY0FwY1YybmpKcFIxODAvUHl2WHdZcnJwTHhSWXlBMzRrbUM4?=
 =?utf-8?B?SWJZemZ3L0MwdlhvOTFrd0F6WTM5d1U1alkvbkRTU0pjdnNpNXc1Z0s0cyt0?=
 =?utf-8?B?bXlOQ1JoZkJCWmFCVVNJaEhCMzBZYnM4c1Y2U0RncytBUjBtbmo1MG0wbE9I?=
 =?utf-8?B?dFU5NDdUcWhtd1crdk1zUXk5UHFDaXlncElNQnk1NlozMDR1THIzQTR2V0Nx?=
 =?utf-8?B?VDdpOHdzTit1TFhCVzc0UisrMmhYWFY2ZVJGdDI5N0FQWWFVdWdaaHZrbnE5?=
 =?utf-8?B?YTM0aDk2bUI1dHhKdGR6cU5DN3IxYjJQSC9yL1FtbmU2UG40aGFpSVRpcCta?=
 =?utf-8?B?YUxaYTVuY3NsUXUxUkdvVTlKUFBFcTIwOXAyZ3hqU0g5ZlF5aXJldDY1RU5Y?=
 =?utf-8?B?V2E2RElqR2lRTzk3amN0Mm9VNzU5Tkh1OStmRXF6UHhwNUs5MzVDNlhFS3Fv?=
 =?utf-8?B?U2Y2ZGR3M3VpbFUrMWxzL29hWkc0V2xILzNQbHhzUS80TGtFaHlON01BZlRo?=
 =?utf-8?B?L2JyR2JnMHplM3V3THI4VHpLaFJQUjVRWU8yOVQzNi9sTFhOQW8zZGp4MFg1?=
 =?utf-8?B?Q1IxL1k3cWxvRWQrdEVPM3N1SUJJWk1mTFlLS2lGZ2loU0lTYWI1WWtNSTgy?=
 =?utf-8?B?cEVmdE9ha3VhSzd3eDYrak9qR01WRzhyeTF3Wkl1RXBucW5mQTNLa2ZJc1pu?=
 =?utf-8?B?TXQ5Y3VEQkI5L1Rqcys2dGJOa2h5L0c2VGdYdHBsUHhoaUxXVStzNUVVcjA0?=
 =?utf-8?B?cFdwWG5YRy90M1FNVWFwUEdGUHZyc1VTTHhzdkMzbDlQV1ZhRE0yMjhXSzIx?=
 =?utf-8?B?d3VaNkpzUVNubHJOQkZoUFQwQU1FVnhhTkpwWFc5YWhXQk1saGkvT25KckY1?=
 =?utf-8?B?eDFxZ3BFbExJSnZOWU9Za2pPV3BWY3EyVTBFQTR5aFZtaVg4eDBhTm15QU00?=
 =?utf-8?B?K29VeHMycnR4ZW1meHJLNktSUXo5bEpsQWN3MUNLdk9JYlo1T01TOTBpcHhU?=
 =?utf-8?B?dlh4WmJzQ2lMeG5wdUhYd0RtbWdjNWdGcmVCVW00UXlNMXRnU2RmVm81Vjgv?=
 =?utf-8?B?cGZzdG9leHg1TjQ4RHJyYUtwZzVNY1BSb1NReE1hNG5QdFVIZzFwMXVDNkVZ?=
 =?utf-8?B?UElqK2xVZC8xSGkxamp4dUJaNUtXM2lLU1BQTElBeGtKNmxGZmlMNXB0YW9x?=
 =?utf-8?Q?oI7ODf97moaOJo/0SVjfeGYt2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <496A0422877A794DB1C8871C385344BE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e77e612-a0c6-483e-e7ca-08dbebeefe8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 06:39:50.7975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N890sEA8f3S02Yt1RG/I6tXWQOFuUG620YG1gE7K5CoWAOxU/dc9NPtHCzJK4c3mAwBLnR65ntZAV3EbxsyU+SUeCFf2T3HZx7hjsTfN2cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1542
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzExLzIwMjMgw6AgMDI6MzgsIERhbmllbCBXYWxrZXIgYSDDqWNyaXTCoDoNCj4g
VGhpcyByZW1vdmVzIGFybTY0IGZyb20gdGhlIGRldmljZSB0cmVlIGhhbmRsaW5nIG9mIHRoZQ0K
PiBjb21tYW5kIGxpbmUgYXJndW1lbnRzLg0KDQpZb3Ugc2hvdWxkIHByb3ZpZGUgbW9yZSBkZXRh
aWxzIG9uIGhvdyBlYWNoIGV4aXN0aW5nIEtjb25maWcgb3B0aW9uIGlzIA0KY29udmVydGVkLCBm
b3IgaW5zdGFuY2Ugd2hlbiBDT05GSUdfQ01ETElORV9GT1JDRSBiZWNvbWVzIA0KQ09ORklHX0NN
RExJTkVfT1ZFUlJJREUuDQoNCj4gDQo+IFRoZSBib290X2NvbW1hbmRfbGluZSB2YXJpYWJsZSBp
cyBwb3B1bGF0ZWQgaW5zaWRlIHRoZSBlYXJsaWVzdA0KPiB1c2VyIG9mIHRoZSBjb21tYW5kIGxp
bmUsIHdoaWNoIGlzIGluIGlkcmVnLW92ZXJyaWRlLmMuDQo+IA0KPiBUaGUgZGV2aWNlIHRyZWUg
c2hvdWxkIG5vdCBiZSBuZWVkZWQgdG8gZG8gYW55IGZ1cnRoZXIgaGFuZGxpbmcNCj4gb2YgdGhl
IGJvb3QgY29tbWFuZCBsaW5lIG9wdGlvbnMuDQoNCnNob3VsZCBub3QgYmUgPyBCdXQgd2hhdCdz
IHRoZSByZXN1bHQgYXQgdGhlIGVuZCwgaXMgaXQgbmVlZGVkIG9yIG5vdCA/DQoNCj4gDQo+IENj
OiB4ZS1saW51eC1leHRlcm5hbEBjaXNjby5jb20NCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFdh
bGtlciA8ZGFuaWVsd2FAY2lzY28uY29tPg0KPiAtLS0NCj4gICBhcmNoL2FybTY0L0tjb25maWcg
ICAgICAgICAgICAgICAgICB8IDMzICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAg
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9zZXR1cC5oICAgICAgfCAgNCArKysrDQo+ICAgYXJjaC9h
cm02NC9pbmNsdWRlL3VhcGkvYXNtL3NldHVwLmggfCAgMiArKw0KPiAgIGFyY2gvYXJtNjQva2Vy
bmVsL2lkcmVnLW92ZXJyaWRlLmMgIHwgIDkgKysrKy0tLS0NCj4gICBhcmNoL2FybTY0L2tlcm5l
bC9waS9rYXNscl9lYXJseS5jICB8IDE0ICsrKysrKy0tLS0tLQ0KPiAgIDUgZmlsZXMgY2hhbmdl
ZCwgMTkgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9LY29uZmlnIGIvYXJjaC9hcm02NC9LY29uZmlnDQo+IGluZGV4IDc4ZjIwZTYz
MjcxMi4uZDNiN2ZkMTA4MGQwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L0tjb25maWcNCj4g
KysrIGIvYXJjaC9hcm02NC9LY29uZmlnDQo+IEBAIC0xMzEsNiArMTMxLDcgQEAgY29uZmlnIEFS
TTY0DQo+ICAgCXNlbGVjdCBHRU5FUklDX0FMTE9DQVRPUg0KPiAgIAlzZWxlY3QgR0VORVJJQ19B
UkNIX1RPUE9MT0dZDQo+ICAgCXNlbGVjdCBHRU5FUklDX0NMT0NLRVZFTlRTX0JST0FEQ0FTVA0K
PiArCXNlbGVjdCBHRU5FUklDX0NNRExJTkUNCj4gICAJc2VsZWN0IEdFTkVSSUNfQ1BVX0FVVE9Q
Uk9CRQ0KPiAgIAlzZWxlY3QgR0VORVJJQ19DUFVfVlVMTkVSQUJJTElUSUVTDQo+ICAgCXNlbGVj
dCBHRU5FUklDX0VBUkxZX0lPUkVNQVANCj4gQEAgLTIyMTcsMzggKzIyMTgsNiBAQCBjb25maWcg
QVJNNjRfQUNQSV9QQVJLSU5HX1BST1RPQ09MDQo+ICAgCSAgcHJvdG9jb2wgZXZlbiBpZiB0aGUg
Y29ycmVzcG9uZGluZyBkYXRhIGlzIHByZXNlbnQgaW4gdGhlIEFDUEkNCj4gICAJICBNQURUIHRh
YmxlLg0KPiAgIA0KPiAtY29uZmlnIENNRExJTkUNCj4gLQlzdHJpbmcgIkRlZmF1bHQga2VybmVs
IGNvbW1hbmQgc3RyaW5nIg0KPiAtCWRlZmF1bHQgIiINCj4gLQloZWxwDQo+IC0JICBQcm92aWRl
IGEgc2V0IG9mIGRlZmF1bHQgY29tbWFuZC1saW5lIG9wdGlvbnMgYXQgYnVpbGQgdGltZSBieQ0K
PiAtCSAgZW50ZXJpbmcgdGhlbSBoZXJlLiBBcyBhIG1pbmltdW0sIHlvdSBzaG91bGQgc3BlY2lm
eSB0aGUgdGhlDQo+IC0JICByb290IGRldmljZSAoZS5nLiByb290PS9kZXYvbmZzKS4NCj4gLQ0K
PiAtY2hvaWNlDQo+IC0JcHJvbXB0ICJLZXJuZWwgY29tbWFuZCBsaW5lIHR5cGUiIGlmIENNRExJ
TkUgIT0gIiINCj4gLQlkZWZhdWx0IENNRExJTkVfRlJPTV9CT09UTE9BREVSDQo+IC0JaGVscA0K
PiAtCSAgQ2hvb3NlIGhvdyB0aGUga2VybmVsIHdpbGwgaGFuZGxlIHRoZSBwcm92aWRlZCBkZWZh
dWx0IGtlcm5lbA0KPiAtCSAgY29tbWFuZCBsaW5lIHN0cmluZy4NCj4gLQ0KPiAtY29uZmlnIENN
RExJTkVfRlJPTV9CT09UTE9BREVSDQo+IC0JYm9vbCAiVXNlIGJvb3Rsb2FkZXIga2VybmVsIGFy
Z3VtZW50cyBpZiBhdmFpbGFibGUiDQo+IC0JaGVscA0KPiAtCSAgVXNlcyB0aGUgY29tbWFuZC1s
aW5lIG9wdGlvbnMgcGFzc2VkIGJ5IHRoZSBib290IGxvYWRlci4gSWYNCj4gLQkgIHRoZSBib290
IGxvYWRlciBkb2Vzbid0IHByb3ZpZGUgYW55LCB0aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZA0K
PiAtCSAgc3RyaW5nIHByb3ZpZGVkIGluIENNRExJTkUgd2lsbCBiZSB1c2VkLg0KPiAtDQo+IC1j
b25maWcgQ01ETElORV9GT1JDRQ0KPiAtCWJvb2wgIkFsd2F5cyB1c2UgdGhlIGRlZmF1bHQga2Vy
bmVsIGNvbW1hbmQgc3RyaW5nIg0KPiAtCWhlbHANCj4gLQkgIEFsd2F5cyB1c2UgdGhlIGRlZmF1
bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nLCBldmVuIGlmIHRoZSBib290DQo+IC0JICBsb2FkZXIg
cGFzc2VzIG90aGVyIGFyZ3VtZW50cyB0byB0aGUga2VybmVsLg0KPiAtCSAgVGhpcyBpcyB1c2Vm
dWwgaWYgeW91IGNhbm5vdCBvciBkb24ndCB3YW50IHRvIGNoYW5nZSB0aGUNCj4gLQkgIGNvbW1h
bmQtbGluZSBvcHRpb25zIHlvdXIgYm9vdCBsb2FkZXIgcGFzc2VzIHRvIHRoZSBrZXJuZWwuDQo+
IC0NCj4gLWVuZGNob2ljZQ0KPiAtDQo+ICAgY29uZmlnIEVGSV9TVFVCDQo+ICAgCWJvb2wNCj4g
ICANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vc2V0dXAuaCBiL2FyY2gv
YXJtNjQvaW5jbHVkZS9hc20vc2V0dXAuaA0KPiBpbmRleCBmNGFmNTQ3ZWY1NGMuLjVhODAzNzI2
MmNiYiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9zZXR1cC5oDQo+ICsr
KyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vc2V0dXAuaA0KPiBAQCAtMywxMCArMywxMyBAQA0K
PiAgICNpZm5kZWYgX19BUk02NF9BU01fU0VUVVBfSA0KPiAgICNkZWZpbmUgX19BUk02NF9BU01f
U0VUVVBfSA0KPiAgIA0KPiArI2lmbmRlZiBfX0FTU0VNQkxZX18NCj4gICAjaW5jbHVkZSA8bGlu
dXgvc3RyaW5nLmg+DQo+ICsjZW5kaWYNCj4gICANCj4gICAjaW5jbHVkZSA8dWFwaS9hc20vc2V0
dXAuaD4NCj4gICANCj4gKyNpZm5kZWYgX19BU1NFTUJMWV9fDQo+ICAgdm9pZCAqZ2V0X2Vhcmx5
X2ZkdF9wdHIodm9pZCk7DQo+ICAgdm9pZCBlYXJseV9mZHRfbWFwKHU2NCBkdF9waHlzKTsNCj4g
ICANCj4gQEAgLTMwLDUgKzMzLDYgQEAgc3RhdGljIGlubGluZSBib29sIGFyY2hfcGFyc2VfZGVi
dWdfcm9kYXRhKGNoYXIgKmFyZykNCj4gICAJcmV0dXJuIGZhbHNlOw0KPiAgIH0NCj4gICAjZGVm
aW5lIGFyY2hfcGFyc2VfZGVidWdfcm9kYXRhIGFyY2hfcGFyc2VfZGVidWdfcm9kYXRhDQo+ICsj
ZW5kaWYgLyogX19BU1NFTUJMWV9fICovDQo+ICAgDQo+ICAgI2VuZGlmDQo+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaCBiL2FyY2gvYXJtNjQvaW5jbHVk
ZS91YXBpL2FzbS9zZXR1cC5oDQo+IGluZGV4IDVkNzAzODg4ZjM1MS4uZjVmYzViODA2MzY5IDEw
MDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaA0KPiArKysg
Yi9hcmNoL2FybTY0L2luY2x1ZGUvdWFwaS9hc20vc2V0dXAuaA0KPiBAQCAtMjAsNyArMjAsOSBA
QA0KPiAgICNpZm5kZWYgX19BU01fU0VUVVBfSA0KPiAgICNkZWZpbmUgX19BU01fU0VUVVBfSA0K
PiAgIA0KPiArI2lmbmRlZiBfX0FTU0VNQkxZX18NCj4gICAjaW5jbHVkZSA8bGludXgvdHlwZXMu
aD4NCj4gKyNlbmRpZg0KPiAgIA0KPiAgICNkZWZpbmUgQ09NTUFORF9MSU5FX1NJWkUJMjA0OA0K
PiAgIA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rZXJuZWwvaWRyZWctb3ZlcnJpZGUuYyBi
L2FyY2gvYXJtNjQva2VybmVsL2lkcmVnLW92ZXJyaWRlLmMNCj4gaW5kZXggM2FkZGMwOWY4NzQ2
Li42MzM0YTkyMjg5MDkgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQva2VybmVsL2lkcmVnLW92
ZXJyaWRlLmMNCj4gKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvaWRyZWctb3ZlcnJpZGUuYw0KPiBA
QCAtOSw2ICs5LDcgQEANCj4gICAjaW5jbHVkZSA8bGludXgvY3R5cGUuaD4NCj4gICAjaW5jbHVk
ZSA8bGludXgva2VybmVsLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2xpYmZkdC5oPg0KPiArI2lu
Y2x1ZGUgPGxpbnV4L2NtZGxpbmUuaD4NCj4gICANCj4gICAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1
c2guaD4NCj4gICAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4NCj4gQEAgLTMwNCwxMSArMzA1
LDExIEBAIHN0YXRpYyBfX2luaXQgdm9pZCBwYXJzZV9jbWRsaW5lKHZvaWQpDQo+ICAgew0KPiAg
IAljb25zdCB1OCAqcHJvcCA9IGdldF9ib290YXJnc19jbWRsaW5lKCk7DQo+ICAgDQo+IC0JaWYg
KElTX0VOQUJMRUQoQ09ORklHX0NNRExJTkVfRk9SQ0UpIHx8ICFwcm9wKQ0KPiAtCQlfX3BhcnNl
X2NtZGxpbmUoQ09ORklHX0NNRExJTkUsIHRydWUpOw0KPiArCXN0cnNjcHkoYm9vdF9jb21tYW5k
X2xpbmUsIHByb3AsIENPTU1BTkRfTElORV9TSVpFKTsNCj4gKwljbWRsaW5lX2FkZF9idWlsdGlu
KGJvb3RfY29tbWFuZF9saW5lKTsNCj4gKw0KPiArCV9fcGFyc2VfY21kbGluZShib290X2NvbW1h
bmRfbGluZSwgdHJ1ZSk7DQo+ICAgDQo+IC0JaWYgKCFJU19FTkFCTEVEKENPTkZJR19DTURMSU5F
X0ZPUkNFKSAmJiBwcm9wKQ0KPiAtCQlfX3BhcnNlX2NtZGxpbmUocHJvcCwgdHJ1ZSk7DQo+ICAg
fQ0KPiAgIA0KPiAgIC8qIEtlZXAgY2hlY2tlcnMgcXVpZXQgKi8NCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQva2VybmVsL3BpL2thc2xyX2Vhcmx5LmMgYi9hcmNoL2FybTY0L2tlcm5lbC9waS9r
YXNscl9lYXJseS5jDQo+IGluZGV4IDE3YmZmNmUzOTllNC4uMWUwMGJjMDFmYTdhIDEwMDY0NA0K
PiAtLS0gYS9hcmNoL2FybTY0L2tlcm5lbC9waS9rYXNscl9lYXJseS5jDQo+ICsrKyBiL2FyY2gv
YXJtNjQva2VybmVsL3BpL2thc2xyX2Vhcmx5LmMNCj4gQEAgLTExLDYgKzExLDcgQEANCj4gICAj
aW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvc2l6ZXMuaD4NCj4g
ICAjaW5jbHVkZSA8bGludXgvc3RyaW5nLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvY21kbGluZS5o
Pg0KPiAgIA0KPiAgICNpbmNsdWRlIDxhc20vYXJjaHJhbmRvbS5oPg0KPiAgICNpbmNsdWRlIDxh
c20vbWVtb3J5Lmg+DQo+IEBAIC00Miw3ICs0Myw3IEBAIHN0YXRpYyBib29sIGNtZGxpbmVfY29u
dGFpbnNfbm9rYXNscihjb25zdCB1OCAqY21kbGluZSkNCj4gICANCj4gICBzdGF0aWMgYm9vbCBp
c19rYXNscl9kaXNhYmxlZF9jbWRsaW5lKHZvaWQgKmZkdCkNCj4gICB7DQo+IC0JaWYgKCFJU19F
TkFCTEVEKENPTkZJR19DTURMSU5FX0ZPUkNFKSkgew0KPiArCWlmICghSVNfRU5BQkxFRChDT05G
SUdfQ01ETElORV9PVkVSUklERSkpIHsNCj4gICAJCWludCBub2RlOw0KPiAgIAkJY29uc3QgdTgg
KnByb3A7DQo+ICAgDQo+IEBAIC01NCwxNiArNTUsMTUgQEAgc3RhdGljIGJvb2wgaXNfa2FzbHJf
ZGlzYWJsZWRfY21kbGluZSh2b2lkICpmZHQpDQo+ICAgCQlpZiAoIXByb3ApDQo+ICAgCQkJZ290
byBvdXQ7DQo+ICAgDQo+ICsJCWlmIChjbWRsaW5lX2NvbnRhaW5zX25va2FzbHIoQ01ETElORV9T
VEFUSUNfQVBQRU5EKSkNCj4gKwkJCXJldHVybiB0cnVlOw0KPiAgIAkJaWYgKGNtZGxpbmVfY29u
dGFpbnNfbm9rYXNscihwcm9wKSkNCj4gICAJCQlyZXR1cm4gdHJ1ZTsNCj4gLQ0KPiAtCQlpZiAo
SVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9FWFRFTkQpKQ0KPiAtCQkJZ290byBvdXQ7DQo+IC0N
Cj4gLQkJcmV0dXJuIGZhbHNlOw0KPiArCQlpZiAoY21kbGluZV9jb250YWluc19ub2thc2xyKENN
RExJTkVfU1RBVElDX1BSRVBFTkQpKQ0KPiArCQkJcmV0dXJuIHRydWU7DQo+ICAgCX0NCj4gICBv
dXQ6DQo+IC0JcmV0dXJuIGNtZGxpbmVfY29udGFpbnNfbm9rYXNscihDT05GSUdfQ01ETElORSk7
DQo+ICsJcmV0dXJuIGNtZGxpbmVfY29udGFpbnNfbm9rYXNscihjbWRsaW5lX2dldF9zdGF0aWNf
YnVpbHRpbigpKTsNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIHU2NCBnZXRfa2FzbHJfc2VlZCh2
b2lkICpmZHQpDQo=
