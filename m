Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0249686582
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 12:42:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6Kll42Ltz3f3l
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 22:42:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=izJFJqKN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e1a::610; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=izJFJqKN;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6Kkl4DSLz3cBj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 22:41:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFfLF3ZboeeI6JBLKhLX6ryVCSZYu8WbeWCc82vxTbm2hQ1yWhZ8W1VilUab5fn0YxLZjh48YCM7Nadyf2CuKb71+wK+WLV6n6VlqiGZWQfaFZl3fG0sZNEfwfRiXCUF7drMCNpwaFOshhLOyyFgchtXpS4PWwS7wna9UtcwwznoonJng52IKMWJ2W2uJGcJzhDZGSfPMTOsTjEI3wyCZfjPtaf62C08zi/kxHvMIQbHidCJR3NqHv8tSFIn+aXJ+EQFW0Br/ai9LqkpMrW37z8ilhw1Yzh+TlYwj0QZ551wHTshvPMMWE7WGmM+ni0ZvDd0fhA5xTPLF39hcV5rtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKsLVQK41pGtW2Ud0v8w5+UtHQX/tsFrk+nyUeG0/e4=;
 b=gDNNbwVAius5n4p3FRaQ4Nz9JkOcj4K3FvgHssTzylGWeq/kISJd9Dw6WPKKIH+qoNKyH4Ce0L88+ZVyMJytJ+sjBct2hKavP5mvUCKNSswokF+rnJIqaE7ehflECwbPzCRoL5ijIcHi4wNGJ93JFVZ1Rpbg6cDtC64t0Svdw6QXMSMzIiqbEyz1/sTBPJ9Ywn5TFqsHgQlBAIpc3iTeW175pYN3UnSiEW66BqA6m01nloUV13ROgh7Hqe7OqBAZ1kEcnA1y0tkmtZ2AQAAvjY2QRbjiNdI0E07BABg+7VmfJL5pwOelKuuYERhBqM4SoZGOgT0O+tIml71+RllSBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKsLVQK41pGtW2Ud0v8w5+UtHQX/tsFrk+nyUeG0/e4=;
 b=izJFJqKNk3YCvtt8WEqp+MFXcX1tvfVemtnKemDyGlxt8SuNbu2MKzLyzTuxT8eIcbIEEXCh/EkkzlkMfs6wzyuy7Q/ZBolZYfmjW1Mmzq17iQ16irUoy3dohTD6DqdAtXLJlnn2xuMBWBvbEI5bbBzRxzaWAsZO3TM8tR4gYivvfjgpUKIlLvrYqt29e/NLpjX9V3JLW/ox846FwG1Mmd6wDw9q/IrKi2WaJYsJh/cZri+gYUQfiJB+6myx2JsDt8wVnrMUYvKAD1uGrE7reH/7RGJSDzvBAHXy850/r2Cpz+s7z1zL126IWLNsOwGTRmPw6pgjes6W5nHkk7YT+g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2425.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 11:41:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6064.024; Wed, 1 Feb 2023
 11:41:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH 1/2] powerpc/64: Set default CPU in Kconfig
Thread-Topic: [PATCH 1/2] powerpc/64: Set default CPU in Kconfig
Thread-Index: AQHZMJAoHnrP29o+IEWPR5CDVAsvZa66AHKAgAAClgA=
Date: Wed, 1 Feb 2023 11:41:10 +0000
Message-ID: <04b55866-aa17-f500-855a-7d4fb4bbaacf@csgroup.eu>
References:  <76c11197b058193dcb8e8b26adffba09cfbdab11.1674632329.git.christophe.leroy@csgroup.eu>
 <20230201113155.18113-1-naresh.kamboju@linaro.org>
In-Reply-To: <20230201113155.18113-1-naresh.kamboju@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2425:EE_
x-ms-office365-filtering-correlation-id: 34e0ffcf-8af8-498f-8a5f-08db044936f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bSJqmdJqWs3ap5EF6uwYXo7FWvyinc31LmDiDkEZM3+DFBemjsNp0ChTnAowX2PJDbrwcfWXuvgJyzACsHYt30dPafmIxcRqL73lrrqQlHTNogCpaXTA1hpITkDJTpFNQeVdjdB1aaaqPzQoJgg/FkO62ycuuqPHvW37D1FH+cPbSGR07jXIxRILWToq4xRFR5EZxtfVrGNzHdkYB9tsI2UxMMnqdqsIdPvNMNa6AV/lOsFjIn97pk6j0tmUFwkvSzw71AVVmLdL6WY+X8SMtn+FkZNbbxn2U1EXpdfikkpEx9xvsmRz9jxXPxFwThX+mQ3mrNr3JaVPYGEVuvuh9VrmyVMGPcijCrRbUzyRf75Z0G1K53aiMua4PbVsLdXF0StAcpS+HGU2s1mOdFdD6iOC84dW3fccIdQ/DMV29AnbrAe8nHpIB13bBI8B0gct1h5myCwZnb7CKtl/qlE+OkHMvaPUe5sabavISVv1UzTv+z8tP78tLJh/il2IAhmB/O/wU/TN7OS6DaE4ryaMCdLoX2T83BLpeMqrMHSOiT8ZPOtxOFjNglAd/iJKxl3hloCcaayPvhbbSa4jEibjPdonyUKVVsJw8FUtgAK/2UgN/va9lMHTD2wJ/iWbfVJ/MhLYGAaylpLq16agUaiEwpbU0/hi6uBZ4hfn/t6wrl0HAHhDw1ruOUkEDBFDIAljo6dAJdfRH/wj/AKnKPdTbBdndRfjFphPlNfKgGD1efNr3WcyoHO9wgJ86Ru1XLitjW3RI0EU7QcDGfke2nQv0KGD3TpRFx8HCuDzbFl0tm0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(346002)(396003)(39850400004)(136003)(451199018)(7416002)(4326008)(5660300002)(66476007)(91956017)(66556008)(86362001)(64756008)(76116006)(6916009)(38070700005)(8936002)(40140700001)(122000001)(54906003)(38100700002)(316002)(41300700001)(31696002)(66946007)(36756003)(8676002)(478600001)(71200400001)(966005)(6486002)(186003)(26005)(6512007)(6506007)(2906002)(31686004)(66446008)(44832011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eDRVelYxa3B0UDcvYUVZOGtnTHorU3JwQ2l0RWNGeHdzRDJpUk5nRW5lTmta?=
 =?utf-8?B?bk1YTjJkQlMyVnltWkpBT2t2VnNEa3QwNllSMFVmUkwyTTNlMnpNblY3YW9L?=
 =?utf-8?B?K3NscnhiUGxYdXZ3aEx4ZU14VzVpOGhrZ3hBdzIxdEdnTkN4OUV1S2FpSy9S?=
 =?utf-8?B?ZVloZDdxTmFrL3g1ZmlDYmtzRTNzQitZU3V5VFpWemU0K0duN0NxNEdtRkxB?=
 =?utf-8?B?YlRYZ29Kd0tLa3VHUlAvdDlQeTYxOHo5a3ZiYm45ZzUzOWpucytYRTZYSFU4?=
 =?utf-8?B?aUN6cC81ZGdxUWZiekdmc2I3NDlYMG40NWs2ZDVHRnZtM3FHZHExL2ZsVkZG?=
 =?utf-8?B?ZkhLeGsvaTEwOThQZEp1U3p2alVBSldUZVBFTlE1VlV0WFQ4eVhWditYSU9W?=
 =?utf-8?B?SUZuS2dxSW14UHlqWnVYem1XQ3VpbmZGNWFySWJ2azFRT1YxSVQ1K3p0U2tt?=
 =?utf-8?B?dkROZTh2ekxZb2ZPeFJFcmlpZk9wUTV5bkU5OHVoRndRR1hxQ2JyRlZTTnpI?=
 =?utf-8?B?L0VxSmhsOEliR2cyM2lmeFpHWlNwVkhUTTNMemxSSHRENFU5eUM1R3loUmI2?=
 =?utf-8?B?QjgycUdSWi9wbGNaekxURVQ4eUpZVWhLMmEzU3RSNWZpK3VwSUFrUnRxMjM1?=
 =?utf-8?B?eVFqRHZJZC9hcFRYNE54alVMSkpSNXJRdEFOWHkvK3k2d3NhSUdrK2ZPNGZO?=
 =?utf-8?B?WmgxZlVaR2Nud0hnZlRMZTFCTCtvc3BJU0k5dUkwNTZTUkZ3ajI1MlFIVUtE?=
 =?utf-8?B?cVEySXRnV21DTlpXWVpRTzBibWJrdFlXRTl1V0VzVW5nQ01MYTJyK0ZYdXlI?=
 =?utf-8?B?bDlqYlpXNExoRE9GNEIwWXp3amh5bjdDQzgraGYzaUhUOFFDTXBCWS9yY3lP?=
 =?utf-8?B?cFdRcmluOHpyMmlSRkQvMzQ2cHZMSGU5Y3RtclB2aGhpamxPRTY4Qlltbm5E?=
 =?utf-8?B?MkJob1BzOEJiYmMwWVRSd2JzQmxqNXcwNTBlN3Z4cUhCVmo2SEdaVGZzakdu?=
 =?utf-8?B?UkhoeG41LzhJdlVaSFpZbHYzTXRxWHRTUGlJZG1iZWJpb0pDU1JnKzdoMDht?=
 =?utf-8?B?SkhTQlMwSFdYWCt3NTgzaG00VFNBUDRnQXBSajRTVUZpK004T0c5bGRZUmcx?=
 =?utf-8?B?YmE0Mjd2YllOSlhIOEwxam9sL3BkU2V6Q1lSbUx5bnh2VVVIcHZvSTRVR3F1?=
 =?utf-8?B?V3R6SWJjSVRSME4yRE9KalVnYTRTTHVEMU5RaXFzcWZQbmJWU0ljZzZOSTBP?=
 =?utf-8?B?SklzV2VzWHFTUXY3eE4xbHNkRmVuTmFIREdpTzV0QzMrSWNMMStIS3d6WlEv?=
 =?utf-8?B?TUcwZDV1cGpZdklibUwvSXZrOWZGam80VWhXbUJSZFVNanpDdURzaC90ZzFn?=
 =?utf-8?B?cSs4WDlFVDE3TCtHR0xtQmNpRHlBZCtKREN3YkRZdzZZTGgxaGIvbTZNY2Vj?=
 =?utf-8?B?QmFxWUtiVjBUbUk1Ynd3Zm1sVEl5WnNIbmZWVDNFRzh2K3E2eEtRSlZkeEF3?=
 =?utf-8?B?WXpWdERtVDdVa1RROUduQS9XekE2ZEhqeFdDN2lJUkNyVmJQdUxBUXJFa29V?=
 =?utf-8?B?bVhHYStZZkQzb3c2TXNaNHE3MEZOSTlRSEFYS2cwS1E5N3gvY0hOVERkaHEy?=
 =?utf-8?B?WngyZ0s3Q1RLeVcyS1A1R2NKRHVhbUM3akRMcGZSaHhOUHJraCtvbVR6UGlX?=
 =?utf-8?B?NDIva200bjhBZ1RJSVRIVWpWaitMTU1aRk9wMWxRS3VLRUlmQ1g1YkErL0M1?=
 =?utf-8?B?VG95VGpZUnE3Q1gxVnpDcWo2dFZvM1hqOEh2K01KeXB2MkJ5S0x6WUFUOHEx?=
 =?utf-8?B?U2FQdVpDOE40Nk9NR3ZQc3hkSGI1TkF5bkFQRjBMQWpMLytOaVBhdDFkUVQ3?=
 =?utf-8?B?dVdwc0t0azdpbXhOV2gzTGE5K081RE1ISWdGaC9ZcDI3cFY0UEN0RHp2NStY?=
 =?utf-8?B?YzBiWFdxTjJkL1hPdnFzdERPSG1rdk9ZUHZqOGtPNUpLZ2JSVXN6ZWZ5d3Fr?=
 =?utf-8?B?aHZDUEdYT1F1WWFTcmEvNm5RTU44cytDNEFtMUZFamIxOE9iaUlzRUlVUjJp?=
 =?utf-8?B?R0VqRytPL01IM2hoY1V3NWlrNnM2Vm0zRlN5NUhCMEl6dTN1R3FjenRMSFZa?=
 =?utf-8?B?aWdqeStlaDRpVmZyNm5GWmcvKzVFY0wrREt2TTFHRFJCTmhXM0ovTFFGRk5K?=
 =?utf-8?B?RXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41EAFD4BDB254D48AE5BA6573F0C7139@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e0ffcf-8af8-498f-8a5f-08db044936f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 11:41:10.4060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IRgdwjcUPykK8ES30cCTEpfGiIPPBY1JFqKC+m1v6ETrHZYQgX/BiruA9DPE+K24agCaa8vVkkZTKntZ3vFgklkHDRaOIe+7bTqVke5Ayxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2425
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
Cc: "anders.roxell@linaro.org" <anders.roxell@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nathan@kernel.org" <nathan@kernel.org>, Linux Kernel Functional Testing <lkft@linaro.org>, "pali@kernel.org" <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzAyLzIwMjMgw6AgMTI6MzEsIE5hcmVzaCBLYW1ib2p1IGEgw6ljcml0wqA6DQo+
IEZvbGxvd2luZyBidWlsZCByZWdyZXNzaW9uIHN0YXJ0ZWQgZnJvbSBuZXh0LTIwMjMwMTMxLg0K
PiANCj4gUmVncmVzc2lvbnMgZm91bmQgb24gcG93ZXJwYzoNCj4gDQo+ICAgIGJ1aWxkL2NsYW5n
LW5pZ2h0bHktdHFtOHh4X2RlZmNvbmZpZw0KPiAgICBidWlsZC9jbGFuZy1uaWdodGx5LXBwYzY0
ZV9kZWZjb25maWcNCj4gDQo+IA0KPiBtYWtlIC0tc2lsZW50IC0ta2VlcC1nb2luZyAtLWpvYnM9
OCBPPS9ob21lL3R1eGJ1aWxkLy5jYWNoZS90dXhtYWtlL2J1aWxkcy8xL2J1aWxkIEFSQ0g9cG93
ZXJwYyBDUk9TU19DT01QSUxFPXBvd2VycGM2NGxlLWxpbnV4LWdudS0gSE9TVENDPWNsYW5nIEND
PWNsYW5nIExMVk09MSBMTFZNX0lBUz0wIHRxbTh4eF9kZWZjb25maWcNCj4gbWFrZSAtLXNpbGVu
dCAtLWtlZXAtZ29pbmcgLS1qb2JzPTggTz0vaG9tZS90dXhidWlsZC8uY2FjaGUvdHV4bWFrZS9i
dWlsZHMvMS9idWlsZCBBUkNIPXBvd2VycGMgQ1JPU1NfQ09NUElMRT1wb3dlcnBjNjRsZS1saW51
eC1nbnUtIEhPU1RDQz1jbGFuZyBDQz1jbGFuZyBMTFZNPTEgTExWTV9JQVM9MA0KPiANCj4gZXJy
b3I6IHVua25vd24gdGFyZ2V0IENQVSAnODYwJw0KPiBub3RlOiB2YWxpZCB0YXJnZXQgQ1BVIHZh
bHVlcyBhcmU6IGdlbmVyaWMsIDQ0MCwgNDUwLCA2MDEsIDYwMiwgNjAzLCA2MDNlLCA2MDNldiwg
NjA0LCA2MDRlLCA2MjAsIDYzMCwgZzMsIDc0MDAsIGc0LCA3NDUwLCBnNCssIDc1MCwgODU0OCwg
OTcwLCBnNSwgYTIsIGU1MDAsIGU1MDBtYywgZTU1MDAsIHBvd2VyMywgcHdyMywgcG93ZXI0LCBw
d3I0LCBwb3dlcjUsIHB3cjUsIHBvd2VyNXgsIHB3cjV4LCBwb3dlcjYsIHB3cjYsIHBvd2VyNngs
IHB3cjZ4LCBwb3dlcjcsIHB3cjcsIHBvd2VyOCwgcHdyOCwgcG93ZXI5LCBwd3I5LCBwb3dlcjEw
LCBwd3IxMCwgcG93ZXJwYywgcHBjLCBwcGMzMiwgcG93ZXJwYzY0LCBwcGM2NCwgcG93ZXJwYzY0
bGUsIHBwYzY0bGUsIGZ1dHVyZQ0KPiBtYWtlWzJdOiAqKiogWy9idWlsZHMvbGludXgvc2NyaXB0
cy9NYWtlZmlsZS5idWlsZDoxMTQ6IHNjcmlwdHMvbW9kL2RldmljZXRhYmxlLW9mZnNldHMuc10g
RXJyb3IgMQ0KPiBlcnJvcjogdW5rbm93biB0YXJnZXQgQ1BVICc4NjAnDQo+IG5vdGU6IHZhbGlk
IHRhcmdldCBDUFUgdmFsdWVzIGFyZTogZ2VuZXJpYywgNDQwLCA0NTAsIDYwMSwgNjAyLCA2MDMs
IDYwM2UsIDYwM2V2LCA2MDQsIDYwNGUsIDYyMCwgNjMwLCBnMywgNzQwMCwgZzQsIDc0NTAsIGc0
KywgNzUwLCA4NTQ4LCA5NzAsIGc1LCBhMiwgZTUwMCwgZTUwMG1jLCBlNTUwMCwgcG93ZXIzLCBw
d3IzLCBwb3dlcjQsIHB3cjQsIHBvd2VyNSwgcHdyNSwgcG93ZXI1eCwgcHdyNXgsIHBvd2VyNiwg
cHdyNiwgcG93ZXI2eCwgcHdyNngsIHBvd2VyNywgcHdyNywgcG93ZXI4LCBwd3I4LCBwb3dlcjks
IHB3cjksIHBvd2VyMTAsIHB3cjEwLCBwb3dlcnBjLCBwcGMsIHBwYzMyLCBwb3dlcnBjNjQsIHBw
YzY0LCBwb3dlcnBjNjRsZSwgcHBjNjRsZSwgZnV0dXJlDQo+IG1ha2VbMl06ICoqKiBbL2J1aWxk
cy9saW51eC9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI1Mjogc2NyaXB0cy9tb2QvZW1wdHkub10g
RXJyb3IgMQ0KDQoNCk9uIEdDQywgdGhlIHBvc3NpYmxlIHZhbHVlcyBhcmU6DQoNCnBwYy1saW51
eC1nY2M6IG5vdGXCoDogdmFsaWQgYXJndW1lbnRzIHRvIOKAmC1tY3B1PeKAmSBhcmU6IDQwMSA0
MDMgNDA1IDQwNWZwIA0KNDQwIDQ0MGZwIDQ2NCA0NjRmcCA0NzYgNDc2ZnAgNTA1IDYwMSA2MDIg
NjAzIDYwM2UgNjA0IDYwNGUgNjIwIDYzMCA3NDAgDQo3NDAwIDc0NTAgNzUwIDgwMSA4MjEgODIz
IDg1NDAgODU0OCA4NjAgOTcwIEczIEc0IEc1IGEyIGNlbGwgZTMwMGMyIA0KZTMwMGMzIGU1MDBt
YyBlNTAwbWM2NCBlNTUwMCBlNjUwMCBlYzYwM2UgbmF0aXZlIHBvd2VyMyBwb3dlcjQgcG93ZXI1
IA0KcG93ZXI1KyBwb3dlcjYgcG93ZXI2eCBwb3dlcjcgcG93ZXI4IHBvd2VycGMgcG93ZXJwYzY0
IHBvd2VycGM2NGxlIHJzNjQgDQp0aXRhbg0KDQpIb3cgZG8geW91IHRlbGwgQ0xBTkcgdGhhdCB5
b3UgYXJlIGJ1aWxkaW5nIGZvciBwb3dlcnBjIDh4eCA/DQoNCj4gDQo+ICAgICAgDQo+IFJlcG9y
dGVkLWJ5OiBMaW51eCBLZXJuZWwgRnVuY3Rpb25hbCBUZXN0aW5nIDxsa2Z0QGxpbmFyby5vcmc+
DQo+IA0KPiBodHRwczovL3FhLXJlcG9ydHMubGluYXJvLm9yZy9sa2Z0L2xpbnV4LW5leHQtbWFz
dGVyL2J1aWxkL25leHQtMjAyMzAyMDEvdGVzdHJ1bi8xNDQ3OTM4NC9zdWl0ZS9idWlsZC90ZXN0
L2NsYW5nLW5pZ2h0bHktdHFtOHh4X2RlZmNvbmZpZy9oaXN0b3J5Lw0KPiANCj4gVGhlIGJpc2Vj
dGlvbiBwb2ludGVkIHRvIHRoaXMgY29tbWl0LA0KPiAgICA0NWY3MDkxYWFjMzUgKCJwb3dlcnBj
LzY0OiBTZXQgZGVmYXVsdCBDUFUgaW4gS2NvbmZpZyIpDQo+IA0KPiAtLQ0KPiBMaW5hcm8gTEtG
VA0KPiBodHRwczovL2xrZnQubGluYXJvLm9yZw0K
