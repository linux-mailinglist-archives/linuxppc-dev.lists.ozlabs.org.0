Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DC8868057
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 20:03:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WAVky+kY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk94c1g3Vz3dX6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 06:03:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WAVky+kY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::701; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk93s4td5z3cFf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 06:02:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwsB+ZQoaCc4FEKbN6iUdsHEha4h9dMsBajQoRoMsu+XAMGKJ7wSSgGjjmIRoVvbL+LjKG7fLFbaCDI5TAbjxNfWq0Ikgz44tkXhaBu9R68Lu/aHlYdNsaB+IGGXWxFxSlhKam6SQ2rRFq8mIzK+kpOSeNoLa31/FrxT61fRN0mCFU/7QC+kGUp386WWsYyOUV2oumHGaBJcHZzzgshA0VvnlTPI1qzIfCQnn/ze85tUMLPXt5fJItK51PcYezoCvsOJeGZzbpwzxxcZHivwAuaa3ZydfJUTWBX3CXOQ8NwpK002GSxcI3m99dcckSeDLF0hIrAREqI0ZOGYAWBIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63iy1cHEb+hJBvJ1MSRh7y8sSDFhqkCsu0Cg818Svyo=;
 b=nyufXwcsefaWuTAJc0GoACKzWvJ+/WWjKJOv5f//5woLSGxypsebaFdGhCVf8mjSon+kl2nHo3GHC/n5hj6BWWsdOACNFC1BpFUZHKy5csq/nK+g+8kSqVUf+uuRTIS6NQYFKbCEpx4j9VohhGRUSMyFYaY2KMdfFATtGGe8XhuC25RyFrw2NcMiZ9RbQ9yFYTV8KMCXBd7Xl8DRqyEdCiXuee6RhP6uDvsGMROJ0rimkB5zm0w4pkQLN9wVEZqyt4DRCtGZHjZ/pnd4nFed0fThJ4Q0pt9/HxGbXhcTpIqo6apF0lWULykhPQau1ZgjtehvRh4HtQOOIvWpKBZ4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63iy1cHEb+hJBvJ1MSRh7y8sSDFhqkCsu0Cg818Svyo=;
 b=WAVky+kYhaAt1rNBgYcL2svBPSxrDP8KAlI4aO07nOuzs2y8aYj7tCVHvQpJV7K3N3WOO+qfLNThBpIsvQM6wb9Ib3izwHS2gnZU69ACWMuzdvIlNdemOHb4B0Dso8r7yfgagLfwFhuwSVPoxkuhvzobbrePh1OgUHLoQd+X1xvrPzvS+eqYtZ0lNGQgmXKE/U2pakSP/B8OqJF66ztpY3D0SJMxJ+8XXfQArz8jVqXXORU0HcnWKXhTj0uuwj3llHtKP9UXLT4yLpJuMC6VcAOm/eD2j7ZLENpRn7FqbH3rvs9ChxFrB7rty5QBWoKqeH4vNrePPxQjigErZgcayw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3219.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 19:02:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7316.035; Mon, 26 Feb 2024
 19:02:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook
	<keescook@chromium.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB
 definitions
Thread-Topic: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB
 definitions
Thread-Index: AQHaaM7rN2hV21jYgUGwUZqovHeHwbEc+xEA
Date: Mon, 26 Feb 2024 19:02:29 +0000
Message-ID: <9aae81d0-dfaf-423c-8ceb-72829a98420d@csgroup.eu>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-2-arnd@kernel.org>
In-Reply-To: <20240226161414.2316610-2-arnd@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3219:EE_
x-ms-office365-filtering-correlation-id: 7f0c6bf2-4cef-40dd-8983-08dc36fd7afe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  yPMvzfWzUBoH8MpY8O7bXP2oDzPIN1dkcoRQWPeHzb8AsCM48ORwi/CWBivBlSWukGqQnsHteBtghynjPaM58D71bkiwuBmngFBjKRFLdhijbDokqQHMzC4rnyEUbc5nPd+aPqkwuF/KG0wg/6R+LvzULHWSR/+cAxU9+0hlDoGBT0WmxhwBusSbxEwK6N4Jy6oa18i+uPZfGx8TY07xf+bp4fSksvL7pWU82andrDQrdV8l52SwYPdgBL+v0edf6b2hUxnyr+H0ZOCLngNzxk2LzRYE5alVBr2O63IxM5dHPWNFj+a2zeajPj2BhUfRq9t0oH2kdpPWhPstd9eOhgLQjLrvNEROdspje25E/TmqY7sGTxUitJCO9nzP7BmLsIuWQ2RVngaO0ik/7eKO8z+hd85iks/TpchQTMNMJc/2vFtu/EIXRuxeeIyjZKCt9xZB86YPRM6aNOYuDwTKNO+sa8UY1ce2y8fd1mHEAJfsvkAuSC6M4a5EaTBzOajE1dRrJDuvaOMHuCr1Us6vN7fmcSGSuQcj8WXf+YsGAUb2nNPYwb4Md+7YTBGyZoYVCwcqLLkqArgt3FND38Y36YVySgcpI3CDhTxcDXpEpRQj5sECHuT89hUnbMgmoK4P/OmRkSS9/bX61TiPBKSAWl0IO5EeDnWCRVh09C/7k3KFjwyUZk0EWQmjB8JOnS1TyvKx1SB6duSmcPDpXp2ODQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cU1MNXJrZnpEYmptdWhzK2kvNGw5WnJIYzJGTzd3L3pCTXpaTjJZSTBOZkZj?=
 =?utf-8?B?dXRXKyt6NXNBMVEwZXBmUFZZWGt1NXRTMjVxelZFTmtZZDFDQm1WUDVhSGZq?=
 =?utf-8?B?bmUvQTBDQUdneDFIZkpSMVRENURwdWdtVXp5QXNpeDQvc01zdXliZW9JUmxF?=
 =?utf-8?B?YU5WbFowZ3A2a0lyNjV3QTFLRU5paWx2M29QOEhVSEdha2Z5V0dtMGdMWXNZ?=
 =?utf-8?B?bkhIN3Y1QTBkTVBxakNscDdmNVptMUVBK2o2aENBWFRnaitnOXF5Nnh2eklI?=
 =?utf-8?B?MWtjTVdSWmVCclJzNGM0dElWVXQrLzRxZmR1b1Zubm1CMTY2Z285NXlSMmJC?=
 =?utf-8?B?a1dnaWs5cC9LK0hHS0ZDM1ZNMHl3RmZuN05Sdm9VQnJBTTEvWGFPZVR4Lzhj?=
 =?utf-8?B?RWhKbnJOa0pvMVlsZFpNT1ZKUFV2bFFSbXIvbGVOQitoR21EVjY1emd6dVlZ?=
 =?utf-8?B?bXZZRUFqdEtaR2Y0c0FvS1g5ZjVlcUtOK1NBV3hLdWhFUE1LdkE2Qm92V2Vx?=
 =?utf-8?B?cFhYS0lFM3NqR2U4c0RXSzExKzRtYVRaSTB5MkR4N3NvenM4NkNnY2w3bkdx?=
 =?utf-8?B?eUtJWm1XZHA4QlhHblN5MUxCRU9qbXNhcjZITUxZR0JnVEwrY0Z0RzJUWFBL?=
 =?utf-8?B?OVVhWXljUVRNRmhEYkd4dkJVeGF6NlA0a211MzVYTml3MGUrQXNFZUE5K25E?=
 =?utf-8?B?OFhOVnNCTzIrK3hMRytRTWViRHpYYUx6TTMxc3c5ekh4bHRzUzhoV3FZaHdP?=
 =?utf-8?B?ZzlaV0ZzeWt3eEZnYm1xS0ppTDRYZFA0USs1WDRmekFyOG5FajVETlo0NXdv?=
 =?utf-8?B?d2wxaUc2TmtlZWFuU3FXTmNMSWlJZ05xUkYxWTZQY2d0alArYVhwNTM3dDdl?=
 =?utf-8?B?YzNJRmlpRjFWQWxUNFlvTlFhdWRleS9nREVIOGhrdjZvS3pPNUFlckFENk42?=
 =?utf-8?B?NFZyUHBNM25uOC9QM3dva2wxYVVScDR5YUF2K1dhKzBNV1BQMWZlM3M2RDNj?=
 =?utf-8?B?VzlHUncrZldVdTVlYzBoLzdCUVJZeVNVRWR2TXRXUHRGY1hGRnloNkI4WlEx?=
 =?utf-8?B?SU5ZM0J4blNtaVBCRHJpaDEweENVVGV6dyt0bmorNUpXVXVaRHdpNXRRZVB1?=
 =?utf-8?B?UTV2VXBmcHlGbTdxb295T1B1akFhZlpFWVhzaG13SnZ5OEdlU0h5QWJHNHZZ?=
 =?utf-8?B?VXFPRnA0K2drMTVSWmlVZmpxaW0xVHRRaWZEUTErWnc4NXVkYU5TbjZyQW1J?=
 =?utf-8?B?VnhoTVFYQmZPR2daT1ZFdExOdktrNzF3enBuMy9pdy9sdEJLcEc5L2VMOVRO?=
 =?utf-8?B?OUd0Tkw3NkJuazIxN1hrTlJCdnZDZUtnUlg1OEtqWnY1VW43QUEzYkJpZ0Q1?=
 =?utf-8?B?OVpUS28raGlMVG9GVmVwQ3JacGdsVVZwZm02Ym9LNWU4UUpNdTkvMHJjeE45?=
 =?utf-8?B?ZERkK1FWSUZZTmM3WE1IZVJCV3lEK2V6MHhIamxUUFBTOWY1b0t5V1FZaEFW?=
 =?utf-8?B?WEhVY1duRFJERTBIQ0xHV2hGSzRxelFIcFVsalV4bFFESXMyMXBDd1AzTlAr?=
 =?utf-8?B?QzRnOWc3bkUzR09MV0NJSVRiajA5S2pEMHhXd3paSkk5OFg5bTNZaFFQTm8v?=
 =?utf-8?B?RjZrd2RTaXFEaGJmS1lNbjNmcXpVTGR0b0g3Q3E2d0l3YnpDNU9peklIT0xS?=
 =?utf-8?B?NzVwOFA2a09OUVhCRjJ1WXB6UDFVQ3BvVlRQcE5BRlhUZUUrMWw0MHlxNVE0?=
 =?utf-8?B?eVlpTGgrQWtTbzVPM2dtL2dtVEhvVTJzeE90ZXJVY2UzWmdTVGVMRGJnSjl1?=
 =?utf-8?B?Sms5dWJJcUhZRS9wZm84L3dIOE82QTRqNDBQemkzS3FzdTlIbjNPbWo2N1Ey?=
 =?utf-8?B?OE5xQ1B3UXNNaVUxVlpQTnJZNFQyUXdvM0J3WnBuOTFTeTVVbS9SSEcybVUw?=
 =?utf-8?B?RHJLRWthVmk0ajdPTkpwQ0VOcisrUG83ZXJJVHF5dU02TThISnU1Y0NLMmFv?=
 =?utf-8?B?eFJua2pPV3NhWmlaZzZtc0owZnBKRUtQRmdUQVk2ZjkvWCtOWjhJZGFmK3hH?=
 =?utf-8?B?VlNabEZ3Q2srbjhMTVYzeUtsNjVmcmNwdWRaWHdjMTU0Nm90eHJrdDhtYmNq?=
 =?utf-8?B?Ri8xWUt3WGM2WThHamNKanFCVVNZYXhxL3Vrbk1GMi81SS95NkVYekJObmtx?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFD2F81AA0835F4FA268BEB367E2D1C7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0c6bf2-4cef-40dd-8983-08dc36fd7afe
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 19:02:29.7787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /q2BCeYoW9m0j2S3gLSH120YZt9Qu06LLWV/oq5SeYDkEb1/DOTQfiBnVCiZST53S3Ivsuqk6lBbvbUngZiefE52Mskyl0AVML4qA12wEew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3219
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
Cc: "x86@kernel.org" <x86@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Jan Kiszka <jan.kiszka@siemens.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, "linux-snps-arc@lists.infradead.org" <lin
 ux-snps-arc@lists.infradead.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Kieran Bingham <kbingham@kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzAyLzIwMjQgw6AgMTc6MTQsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gDQo+IFRoZXNlIGZvdXIgYXJj
aGl0ZWN0dXJlcyBkZWZpbmUgdGhlIHNhbWUgS2NvbmZpZyBzeW1ib2xzIGZvciBjb25maWd1cmlu
Zw0KPiB0aGUgcGFnZSBzaXplLiBNb3ZlIHRoZSBsb2dpYyBpbnRvIGEgY29tbW9uIHBsYWNlIHdo
ZXJlIGl0IGNhbiBiZSBzaGFyZWQNCj4gd2l0aCBhbGwgb3RoZXIgYXJjaGl0ZWN0dXJlcy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+IC0tLQ0K
PiAgIGFyY2gvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8IDU4ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0NCj4gICBhcmNoL2hleGFnb24vS2NvbmZpZyAgICAgICAgICAgICAg
fCAyNSArKystLS0tLS0tLS0tDQo+ICAgYXJjaC9oZXhhZ29uL2luY2x1ZGUvYXNtL3BhZ2UuaCAg
IHwgIDYgKy0tLQ0KPiAgIGFyY2gvbG9vbmdhcmNoL0tjb25maWcgICAgICAgICAgICB8IDIxICsr
KystLS0tLS0tDQo+ICAgYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vcGFnZS5oIHwgMTAgKy0t
LS0tDQo+ICAgYXJjaC9taXBzL0tjb25maWcgICAgICAgICAgICAgICAgIHwgNTggKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9wYWdlLmgg
ICAgICB8IDE2ICstLS0tLS0tLQ0KPiAgIGFyY2gvc2gvaW5jbHVkZS9hc20vcGFnZS5oICAgICAg
ICB8IDEzICstLS0tLS0NCj4gICBhcmNoL3NoL21tL0tjb25maWcgICAgICAgICAgICAgICAgfCA0
MiArKysrKysrLS0tLS0tLS0tLS0tLS0tDQo+ICAgOSBmaWxlcyBjaGFuZ2VkLCA4OCBpbnNlcnRp
b25zKCspLCAxNjEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9LY29uZmln
IGIvYXJjaC9LY29uZmlnDQo+IGluZGV4IGE1YWYwZWRkM2ViOC4uMjM3Y2VhMDFlZDliIDEwMDY0
NA0KPiAtLS0gYS9hcmNoL0tjb25maWcNCj4gKysrIGIvYXJjaC9LY29uZmlnDQo+IEBAIC0xMDc4
LDE3ICsxMDc4LDcxIEBAIGNvbmZpZyBIQVZFX0FSQ0hfQ09NUEFUX01NQVBfQkFTRVMNCj4gICAJ
ICBhbmQgdmljZS12ZXJzYSAzMi1iaXQgYXBwbGljYXRpb25zIHRvIGNhbGwgNjQtYml0IG1tYXAo
KS4NCj4gICAJICBSZXF1aXJlZCBmb3IgYXBwbGljYXRpb25zIGRvaW5nIGRpZmZlcmVudCBiaXRu
ZXNzIHN5c2NhbGxzLg0KPiAgIA0KPiArY29uZmlnIEhBVkVfUEFHRV9TSVpFXzRLQg0KPiArCWJv
b2wNCj4gKw0KPiArY29uZmlnIEhBVkVfUEFHRV9TSVpFXzhLQg0KPiArCWJvb2wNCj4gKw0KPiAr
Y29uZmlnIEhBVkVfUEFHRV9TSVpFXzE2S0INCj4gKwlib29sDQo+ICsNCj4gK2NvbmZpZyBIQVZF
X1BBR0VfU0laRV8zMktCDQo+ICsJYm9vbA0KPiArDQo+ICtjb25maWcgSEFWRV9QQUdFX1NJWkVf
NjRLQg0KPiArCWJvb2wNCj4gKw0KPiArY29uZmlnIEhBVkVfUEFHRV9TSVpFXzI1NktCDQo+ICsJ
Ym9vbA0KPiArDQo+ICtjaG9pY2UNCj4gKwlwcm9tcHQgIk1NVSBwYWdlIHNpemUiDQo+ICsNCg0K
VGhhdCdzIGEgbmljZSByZS1mYWN0b3IuDQoNClRoZSBvbmx5IGRyYXdiYWNrIEkgc2VlIGlzIHRo
YXQgd2UgYXJlIGxvb3Npbmcgc2V2ZXJhbCBpbnRlcmVzdGluZyANCmFyY2gtc3BlY2lmaWMgY29t
bWVudHMvaGVscCB0ZXh0LiBEb24ndCBrbm93IGlmIHRoZXJlIGNvdWxkIGJlIGFuIGVhc3kgDQp3
YXkgdG8ga2VlcCB0aGVtLg0KDQoNCj4gK2NvbmZpZyBQQUdFX1NJWkVfNEtCDQo+ICsJYm9vbCAi
NEtCIHBhZ2VzIg0KPiArCWRlcGVuZHMgb24gSEFWRV9QQUdFX1NJWkVfNEtCDQo+ICsNCj4gK2Nv
bmZpZyBQQUdFX1NJWkVfOEtCDQo+ICsJYm9vbCAiOEtCIHBhZ2VzIg0KPiArCWRlcGVuZHMgb24g
SEFWRV9QQUdFX1NJWkVfOEtCDQo+ICsNCj4gK2NvbmZpZyBQQUdFX1NJWkVfMTZLQg0KPiArCWJv
b2wgIjE2S0IgcGFnZXMiDQo+ICsJZGVwZW5kcyBvbiBIQVZFX1BBR0VfU0laRV8xNktCDQo+ICsN
Cj4gK2NvbmZpZyBQQUdFX1NJWkVfMzJLQg0KPiArCWJvb2wgIjMyS0IgcGFnZXMiDQo+ICsJZGVw
ZW5kcyBvbiBIQVZFX1BBR0VfU0laRV8zMktCDQo+ICsNCj4gK2NvbmZpZyBQQUdFX1NJWkVfNjRL
Qg0KPiArCWJvb2wgIjY0S0IgcGFnZXMiDQo+ICsJZGVwZW5kcyBvbiBIQVZFX1BBR0VfU0laRV82
NEtCDQo+ICsNCj4gK2NvbmZpZyBQQUdFX1NJWkVfMjU2S0INCj4gKwlib29sICIyNTZLQiBwYWdl
cyINCj4gKwlkZXBlbmRzIG9uIEhBVkVfUEFHRV9TSVpFXzI1NktCDQoNCkhleGFnb24gc2VlbSB0
byBhbHNvIHVzZSBDT05GSUdfUEFHRV9TSVpFXzFNQiA/DQoNCj4gKw0KPiArZW5kY2hvaWNlDQo+
ICsNCj4gICBjb25maWcgUEFHRV9TSVpFX0xFU1NfVEhBTl82NEtCDQo+ICAgCWRlZl9ib29sIHkN
Cj4gLQlkZXBlbmRzIG9uICFBUk02NF82NEtfUEFHRVMNCj4gICAJZGVwZW5kcyBvbiAhUEFHRV9T
SVpFXzY0S0INCj4gLQlkZXBlbmRzIG9uICFQQVJJU0NfUEFHRV9TSVpFXzY0S0INCj4gICAJZGVw
ZW5kcyBvbiBQQUdFX1NJWkVfTEVTU19USEFOXzI1NktCDQo+ICAgDQo+ICAgY29uZmlnIFBBR0Vf
U0laRV9MRVNTX1RIQU5fMjU2S0INCj4gICAJZGVmX2Jvb2wgeQ0KPiAgIAlkZXBlbmRzIG9uICFQ
QUdFX1NJWkVfMjU2S0INCj4gICANCj4gK2NvbmZpZyBQQUdFX1NISUZUDQo+ICsJaW50DQo+ICsJ
ZGVmYXVsdCAxMiBpZiBQQUdFX1NJWkVfNEtCDQo+ICsJZGVmYXVsdCAxMyBpZiBQQUdFX1NJWkVf
OEtCDQo+ICsJZGVmYXVsdCAxNCBpZiBQQUdFX1NJWkVfMTZLQg0KPiArCWRlZmF1bHQgMTUgaWYg
UEFHRV9TSVpFXzMyS0INCj4gKwlkZWZhdWx0IDE2IGlmIFBBR0VfU0laRV82NEtCDQo+ICsJZGVm
YXVsdCAxOCBpZiBQQUdFX1NJWkVfMjU2S0INCj4gKw0KPiAgICMgVGhpcyBhbGxvd3MgdG8gdXNl
IGEgc2V0IG9mIGdlbmVyaWMgZnVuY3Rpb25zIHRvIGRldGVybWluZSBtbWFwIGJhc2UNCj4gICAj
IGFkZHJlc3MgYnkgZ2l2aW5nIHByaW9yaXR5IHRvIHRvcC1kb3duIHNjaGVtZSBvbmx5IGlmIHRo
ZSBwcm9jZXNzDQo+ICAgIyBpcyBub3QgaW4gbGVnYWN5IG1vZGUgKGNvbXBhdCB0YXNrLCB1bmxp
bWl0ZWQgc3RhY2sgc2l6ZSBvcg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9oZXhhZ29uL0tjb25maWcg
Yi9hcmNoL2hleGFnb24vS2NvbmZpZw0KPiBpbmRleCBhODgwZWUwNjdkMmUuLmFhYzQ2ZWUxYTAw
MCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9oZXhhZ29uL0tjb25maWcNCj4gKysrIGIvYXJjaC9oZXhh
Z29uL0tjb25maWcNCj4gQEAgLTgsNiArOCwxMSBAQCBjb25maWcgSEVYQUdPTg0KPiAgIAlzZWxl
Y3QgQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0RFVklDRQ0KPiAgIAlzZWxlY3QgQVJDSF9OT19QUkVF
TVBUDQo+ICAgCXNlbGVjdCBETUFfR0xPQkFMX1BPT0wNCj4gKwlzZWxlY3QgRlJBTUVfUE9JTlRF
Ug0KPiArCXNlbGVjdCBIQVZFX1BBR0VfU0laRV80S0INCj4gKwlzZWxlY3QgSEFWRV9QQUdFX1NJ
WkVfMTZLQg0KPiArCXNlbGVjdCBIQVZFX1BBR0VfU0laRV82NEtCDQo+ICsJc2VsZWN0IEhBVkVf
UEFHRV9TSVpFXzI1NktCDQo+ICAgCSMgT3RoZXIgcGVuZGluZyBwcm9qZWN0cy90by1kbyBpdGVt
cy4NCj4gICAJIyBzZWxlY3QgSEFWRV9SRUdTX0FORF9TVEFDS19BQ0NFU1NfQVBJDQo+ICAgCSMg
c2VsZWN0IEhBVkVfSFdfQlJFQUtQT0lOVCBpZiBQRVJGX0VWRU5UUw0KPiBAQCAtMTIwLDI2ICsx
MjUsNiBAQCBjb25maWcgTlJfQ1BVUw0KPiAgIAkgIFRoaXMgaXMgcHVyZWx5IHRvIHNhdmUgbWVt
b3J5IC0gZWFjaCBzdXBwb3J0ZWQgQ1BVIGFkZHMNCj4gICAJICBhcHByb3hpbWF0ZWx5IGVpZ2h0
IGtpbG9ieXRlcyB0byB0aGUga2VybmVsIGltYWdlLg0KPiAgIA0KPiAtY2hvaWNlDQo+IC0JcHJv
bXB0ICJLZXJuZWwgcGFnZSBzaXplIg0KPiAtCWRlZmF1bHQgUEFHRV9TSVpFXzRLQg0KPiAtCWhl
bHANCj4gLQkgIENoYW5nZXMgdGhlIGRlZmF1bHQgcGFnZSBzaXplOyB1c2Ugd2l0aCBjYXV0aW9u
Lg0KPiAtDQo+IC1jb25maWcgUEFHRV9TSVpFXzRLQg0KPiAtCWJvb2wgIjRLQiINCj4gLQ0KPiAt
Y29uZmlnIFBBR0VfU0laRV8xNktCDQo+IC0JYm9vbCAiMTZLQiINCj4gLQ0KPiAtY29uZmlnIFBB
R0VfU0laRV82NEtCDQo+IC0JYm9vbCAiNjRLQiINCj4gLQ0KPiAtY29uZmlnIFBBR0VfU0laRV8y
NTZLQg0KPiAtCWJvb2wgIjI1NktCIg0KPiAtDQo+IC1lbmRjaG9pY2UNCj4gLQ0KPiAgIHNvdXJj
ZSAia2VybmVsL0tjb25maWcuaHoiDQo+ICAgDQo+ICAgZW5kbWVudQ0KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9oZXhhZ29uL2luY2x1ZGUvYXNtL3BhZ2UuaCBiL2FyY2gvaGV4YWdvbi9pbmNsdWRlL2Fz
bS9wYWdlLmgNCj4gaW5kZXggMTBmMWJjMDc0MjNjLi42NWM5YmFjNjM5ZmEgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvaGV4YWdvbi9pbmNsdWRlL2FzbS9wYWdlLmgNCj4gKysrIGIvYXJjaC9oZXhhZ29u
L2luY2x1ZGUvYXNtL3BhZ2UuaA0KPiBAQCAtMTMsMjcgKzEzLDIyIEBADQo+ICAgLyogIFRoaXMg
aXMgcHJvYmFibHkgbm90IHRoZSBtb3N0IGdyYWNlZnVsIHdheSB0byBoYW5kbGUgdGhpcy4gICov
DQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJR19QQUdFX1NJWkVfNEtCDQo+IC0jZGVmaW5lIFBBR0Vf
U0hJRlQgMTINCj4gICAjZGVmaW5lIEhFWEFHT05fTDFfUFRFX1NJWkUgX19IVk1fUERFX1NfNEtC
DQo+ICAgI2VuZGlmDQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJR19QQUdFX1NJWkVfMTZLQg0KPiAt
I2RlZmluZSBQQUdFX1NISUZUIDE0DQo+ICAgI2RlZmluZSBIRVhBR09OX0wxX1BURV9TSVpFIF9f
SFZNX1BERV9TXzE2S0INCj4gICAjZW5kaWYNCj4gICANCj4gICAjaWZkZWYgQ09ORklHX1BBR0Vf
U0laRV82NEtCDQo+IC0jZGVmaW5lIFBBR0VfU0hJRlQgMTYNCj4gICAjZGVmaW5lIEhFWEFHT05f
TDFfUFRFX1NJWkUgX19IVk1fUERFX1NfNjRLQg0KPiAgICNlbmRpZg0KPiAgIA0KPiAgICNpZmRl
ZiBDT05GSUdfUEFHRV9TSVpFXzI1NktCDQo+IC0jZGVmaW5lIFBBR0VfU0hJRlQgMTgNCj4gICAj
ZGVmaW5lIEhFWEFHT05fTDFfUFRFX1NJWkUgX19IVk1fUERFX1NfMjU2S0INCj4gICAjZW5kaWYN
Cj4gICANCj4gICAjaWZkZWYgQ09ORklHX1BBR0VfU0laRV8xTUINCj4gLSNkZWZpbmUgUEFHRV9T
SElGVCAyMA0KPiAgICNkZWZpbmUgSEVYQUdPTl9MMV9QVEVfU0laRSBfX0hWTV9QREVfU18xTUIN
Cj4gICAjZW5kaWYNCj4gICANCj4gQEAgLTUwLDYgKzQ1LDcgQEANCj4gICAjZGVmaW5lIEhWTV9I
VUdFUEFHRV9TSVpFIDB4NQ0KPiAgICNlbmRpZg0KPiAgIA0KPiArI2RlZmluZSBQQUdFX1NISUZU
IENPTkZJR19QQUdFX1NISUZUDQo+ICAgI2RlZmluZSBQQUdFX1NJWkUgICgxVUwgPDwgUEFHRV9T
SElGVCkNCj4gICAjZGVmaW5lIFBBR0VfTUFTSyAgKH4oKDEgPDwgUEFHRV9TSElGVCkgLSAxKSkN
Cj4gICANCg0KQ291bGQgd2UgbW92ZSBQQUdFX1NJWkUgYW5kIFBBR0VfTUFTSyBpbiBhIGdlbmVy
aWMvY29yZSBoZWFkZXIgaW5zdGVhZCANCm9mIGhhdmluZyBpdCBkdXBsaWNhdGVkIGZvciBlYWNo
IGFyY2ggPw0KDQpDaHJpc3RvcGhlDQo=
