Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B4655B7D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 07:50:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWcJB1Znpz3dr5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 15:50:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ubrOO/84;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.47; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ubrOO/84;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90047.outbound.protection.outlook.com [40.107.9.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWcGH0trtz3bx8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 15:48:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bW95xgSo76ghVTl7m+J6GFkEnkYoHVhTsjzffEAf5sZBIPixqpAayC9h+Jl6lmCc5x5A3W6anryH4jw13M4v7GuYVLliWXLfBReU2F7JdFtgm2yvLMGE8OU9kw4ziLO0mYE7CCIjAEcHcA6+ckCSmeef6+gaIVpYNvAnTjLsSlrudw7as7ctJx5Ogh0sFwc+seRCUuY5YgdQ3I4bbOGv/LgNs8fLpUXQuebEyC69QEqYrBrFU09fNvT2KnYIjB95BwuZ7Cju9ZclVmm/eSY22iLi7R/YqXqJmb0mRIKDgNdfMYNRLbS/ySrhicD598159xnQFpMBAUO34KeQ73/whw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQkoQdQaSGQoMNqsEWNMExgvTCZHaNJJKMiDTMDPCt4=;
 b=S0foOLVY/fxQB0P10nhbHWvJcj1MP0bBRkd54rxgMmwqIANMMlg5kCG/kBByci4Ht/My+k2bIUh9hQ6wwURGwseXVnKHhR/v4QUPhTBUMr42weYICtDSIoJIL4Cs4TmA6T0JO0bj5diOsLwJ/9uJtcXYUZ5gzlHeNlGddSRkzg5fP3oQ2juZprqFDiaMTNPJ8M+qxn2R4RcD8CiFW8Yq3vQlnw1MtsqV+Et0T07OpKFmWdsov//ZMz2bG9UQ/20bx2590i4Qk6dnIwv1WEf4nqF/3pVmeyuxpFNmKSs9tGTEnoqN9/e8gFqpHD+7ugecl+P0WuqhSbN2vGuk5iDVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQkoQdQaSGQoMNqsEWNMExgvTCZHaNJJKMiDTMDPCt4=;
 b=ubrOO/84U7cDJ99O5HrMdgSUBxa5/4ADQAOhwdRWGsS8oFt5wTzSVL1Za++2nnL+yFHAb6LAdKPuWsT7056rRX74fbXfgRVBMhyqZQQRZg7UKT4nE0nXczn6L4cxh+uTYPkcsL4dOXCv4qi6BzD5fcl0tvaK/ZX0Nh19OieRnp6c9rntQzRmar6rPiBfPozWg0G7s2aKAuCCH2w5UK/xy/ihMwlM7aR3E17eSO6qshisL4gSCO+zINzCEBO65XvchRwc3AzdeJbtPYBVc/TIXcf7tJHdV4dzQuAklc6gyL6x/lfF1JeBEmL0XV0XfSrE/sP0Errpy8YRCF711Eq8fA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1617.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 05:48:05 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 05:48:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH V4 03/26] powerpc/mm: Move protection_map[] inside the
 platform
Thread-Topic: [PATCH V4 03/26] powerpc/mm: Move protection_map[] inside the
 platform
Thread-Index: AQHYh4UT4ajuZYkeKEiGebOQBcEAVq1iw+UA
Date: Mon, 27 Jun 2022 05:48:05 +0000
Message-ID: <3374e97e-e5d0-e789-440c-e39dd3e66693@csgroup.eu>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-4-anshuman.khandual@arm.com>
In-Reply-To: <20220624044339.1533882-4-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f83efad0-b283-4c83-bf99-08da58009b11
x-ms-traffictypediagnostic: MR1P264MB1617:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Sw8L0qslipd/qZk2C7p2s7rIgdp8zeXCL7z0Q7cDgrXKHMRT2Y90lh6EpTxbnz110ifxDZxRBPf323KsdWUqG3GGv3lR97pWQMzgG/qn7lPrrN3+/XDEp5mg4Ws/yBCAbZwmZ6ZVOGwjqW8OX6V2IvK8QygXaFQQvL+W012TYEi+bj5GUYh0xmnhmJ0F7oRydB2JruraenhKrP/6GcqWWjci98DaqOposoAUv+zL+MiGMAMqOSAv3bZz+gv/PMlVd70qxHxax1ObchO6BhN5Ebkuoi0aYw0GPL9t6LDb1oNpkjAlPZG3wgMsssNiyF4BbWDG0ZZlxTvokpHwKzX16Ee6FNBo+NgHDqoGaBkqIwpVNqAj85SXdz8mn30Xs8xysN6NNEiqhSTYTKH/JreX2LWO1q9dcO4IY/wp6c+rAQZ1W98z0v/w7r0X/bLVBzLOBcIx3AzpAs4yZTOy88YxCZPUDmgTn/gyIBIPD1N91udimbpEODSyZlxdQTudJoZmpnEzlTLU0EMo3VmJscPq8RioCw832jahbNsYLb33aFjcpLOfBAuhwan9/eTKGysTcd8tu/sZdjHy2LGo/o7/9VIQ4vGcKQEs7cuf1USnXtM9Q9y78IJ42bvkDoon21TFf5QlscMnsxsZPu50TKDDPHfDM0KA3aQG9Ov3Sv8J5+5lXukqTo9CxmuifSFv8qBww0oD4BvLDQQ90Ogz1HoOQPl5tOE6MWflC2SZQIYGMYYLAcVIdYy4K1hXyRIjcKAFRCjTFEZ/KQYlk32Leu5xY+YoU5vktZFlK64bbCoMK8ZoQ6gxjJi0mqeZHmsoxMwBTV1lrtU8TpQTPRJcqI/aHj5VStbeoK1bOuG7cWGctqo=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(366004)(376002)(39850400004)(396003)(66476007)(66946007)(66446008)(8676002)(64756008)(6486002)(66556008)(76116006)(4326008)(38100700002)(5660300002)(71200400001)(38070700005)(8936002)(91956017)(44832011)(478600001)(186003)(2616005)(41300700001)(83380400001)(2906002)(122000001)(54906003)(7416002)(86362001)(31696002)(36756003)(316002)(6506007)(26005)(6512007)(31686004)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SW14VXgwNnlLd1hvTjE0WWxZWlVlSUU1ZnkxWHBOT3NkZ3B1WFZHTzhGYjFW?=
 =?utf-8?B?dW84Qk1qdzlBR29GODJrV0tybnNNZWlVWnpTUS9TS1h3U3pPYmZYVWkzOUZi?=
 =?utf-8?B?ZnFPUk5hU1hMWmZJQVgwcEpDd1BNQksvT3VRVkYxZnBiRDhPbDdyQzJkdGJu?=
 =?utf-8?B?elN4eTVQTWpkemxhNVluRGl2enMrdllCZWVKLzkxWTR6dlgwYVh5R2tZd0U1?=
 =?utf-8?B?b0FmNUhiRVIyeDNRUnFoUHJ0WWZqYnNWSnNtN0dVNHVqSUQ0eXdJd3p5UVVO?=
 =?utf-8?B?eWVKTWxSV0lOdHBHTnJnM3JHV2hTZUJHVnRwT1JZMW4zNlYxUG9ydUptTjQr?=
 =?utf-8?B?ZnpmNXk0c0pFQzJxRkkrSVJWaWlqRWhEZ21vQVpib2ZsY1E1c2IxUEJnR3ZQ?=
 =?utf-8?B?MXRSKzJ5Um9WVzZQbTJjNnNvWmt6QWNyUVJzRHJUc3l2dDRXOXVpTGZhMUJt?=
 =?utf-8?B?cU1jd3BwdURaQUtLaHRFdm1lUGtJaFF4TjV6eWtYSjNqdGlPMjhqRm5pOGFy?=
 =?utf-8?B?L1BJa2gwcW96Qko1bHNhUWg5WTJHQ3Q5MGZnazQ2emYyeXhPN01Qcm9aM1h1?=
 =?utf-8?B?eklwZVprUjZJdzlmV2RqcC85OHVUcEo5NWJqKzJRN0pnRUFqclBuaUNlN1Mr?=
 =?utf-8?B?RWxQb0kxSTRsdlF4S1Nrby83aDBBUXR6U0NEWVNkalRMdDg3ZnFjRm5iaWhJ?=
 =?utf-8?B?Ymh6QmZvL2F3djc1MmlCUWJSa1VUR25OanoxemFQRjlzUERKKytFUk1BR1BK?=
 =?utf-8?B?YnNpSEFWTlY3U2FTek1SaFlWL2xrN2hDbHNaU2tYODQ3UkdFMXh1a001UWg5?=
 =?utf-8?B?LzR0bk1NRU1MRnpKODJWcHRpbDhTc0N5SGZYU21iSVVFSUI1V09OSUFhNGhP?=
 =?utf-8?B?ZTU4ZDhDR0hxYlVrc3ZoOEVvK2JBRVY5SXdaNURwTm1SQnNsWGVBUEJ5Y3hE?=
 =?utf-8?B?eWlUcXcwS2ZNRUdHYnpjTmJEeGwyNHZEZURpMGJORmE1UDQ5eHFHWWdkZUFY?=
 =?utf-8?B?MU5vemo4Z3dNdlk2OERucGxQWEVYSUlXN21DVmNPRTVzRnJtYWZSQTFWVnJv?=
 =?utf-8?B?c2wwRnp1YitSYWFqazNzSUxHV1B2OENEYWtHRkZGQnR1SHViZ21MeXhkL0J3?=
 =?utf-8?B?K3JISkRaMVE1Nno5Mm5qbm1BQ29SUTRndEE5ZVMvQlM3aS9yU3JVc2NKNXVs?=
 =?utf-8?B?NzczR2pURVhmWTZZR0hOeGlHTjNlaDdoNUlkTVpEN0owOVBvL08wRFV4M2tt?=
 =?utf-8?B?eVBKUk1GRVFLTzJJM1lFenJjNG91WGxzYURUM2l0VmJUaktqR2lNODQzV0V0?=
 =?utf-8?B?cGw2VGh5SnNSVUxLM0orK1VhZHFiVDY4OVlKTVZSR1crMDRlVVJaT202Uk4x?=
 =?utf-8?B?N0xMQVN2cmdlVjRDU2locUgvNzVSaGR1Nkt2MUZWYzA0ZUJ5bG9hbkR4RE9s?=
 =?utf-8?B?RGZFcUx1bENyOVI5V29DZWJON2ZwUVBRY1Y3QnhodXQyTDJtKzZ0cHpSenpN?=
 =?utf-8?B?azUvLzRuQm1JQXFodHRNbmdBdzhEUlp4YWE3TTFkcFJGRktqNmtaU2lhMS9J?=
 =?utf-8?B?V0dXNllEY3luVjNYR2lRdjd3Zkc0TmwzazdnSm5YZHg3dXl3Z3ZYVTljOXBH?=
 =?utf-8?B?SWMvYW5jTnFsQXNpVHhvTHd0em9QVWxIaWFuVU9FYWVHSUJjd3RSdjdqQlZJ?=
 =?utf-8?B?NEtXQXpwWHlDV1NTVzdQN2x1WWFMVHgxS3oxOTRwUU1CaWN2MUhYcm1uWWJw?=
 =?utf-8?B?ampadzNaTjlET1l1aEE0a1QvV080YTNjMkNCaGpLaTVsWkQ0VzhWWVlyaEZ1?=
 =?utf-8?B?cndYMFFtOXAvOXlqbjlNdjQ5djBoQTBoem8rcTdMTTc0WGRwNG40cExsOG9r?=
 =?utf-8?B?VHJ4dTVHRkJoUFdsaVEvSFd0azBic285a0dZTXA5bFFxdnh5T3BkTnBSZjF2?=
 =?utf-8?B?bVJJTFpQZ2ltWGl3U3UwUVhDeCtkSkRXcmh0NzhlZHNmVEYvdzhTNGhtY1Js?=
 =?utf-8?B?bFc2RllVVE0zeGcrdWpjYi9wWThRL3BVaGlGNnZjaFpPNmg5MkZuV1VzNUpu?=
 =?utf-8?B?bUljc21ybFlZZWFkcTJzNnlobzI0djRCd28ra0xNYitSQ01uVkZFd3dROGZ2?=
 =?utf-8?B?WERlQWFjNVJtSUZjQmFtUXJEeTRJRjZzZDFCVTBaUW4zMVFiamJuNW1vSUJH?=
 =?utf-8?Q?5HZw95VMxzXxEn098YndeWg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D69E061429755A4E9BD04CB56A2420A2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f83efad0-b283-4c83-bf99-08da58009b11
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 05:48:05.0910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zqeOEwE6RL8+65kfXa+qKBcJFrn+2mx048SMNhJRdpWXDbCe3UUkPD2kEKDJQgG0ECh2ypnlIKKJGXc+W5+3nlzIpebQvyTxZjM1zZgYt4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1617
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecore
 s.org" <openrisc@lists.librecores.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA2LzIwMjIgw6AgMDY6NDMsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IFRoaXMgbW92ZXMgcHJvdGVjdGlvbl9tYXBbXSBpbnNpZGUgdGhlIHBsYXRmb3JtIGFuZCB3
aGlsZSBoZXJlLCBhbHNvIGVuYWJsZQ0KPiBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UIG9uIDMy
IGJpdCBwbGF0Zm9ybXMgdmlhIERFQ0xBUkVfVk1fR0VUX1BBR0VfUFJPVC4NCj4gDQo+IENjOiBN
aWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+DQo+IENjOiBQYXVsIE1hY2tlcnJh
cyA8cGF1bHVzQHNhbWJhLm9yZz4NCj4gQ2M6IE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dpbkBnbWFp
bC5jb20+DQo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZw0KPiBDYzogbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBLaGFuZHVh
bCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUg
TGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBhcmNoL3Bv
d2VycGMvS2NvbmZpZyAgICAgICAgICAgICAgIHwgIDIgKy0NCj4gICBhcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vcGd0YWJsZS5oIHwgMjAgKy0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBhcmNoL3Bv
d2VycGMvbW0vcGd0YWJsZS5jICAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9L
Y29uZmlnDQo+IGluZGV4IGMyY2UyZTYwYzhmMC4uMTAzNWQxNzJjN2RkIDEwMDY0NA0KPiAtLS0g
YS9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiArKysgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiBA
QCAtMTQwLDcgKzE0MCw3IEBAIGNvbmZpZyBQUEMNCj4gICAJc2VsZWN0IEFSQ0hfSEFTX1RJQ0tf
QlJPQURDQVNUCQlpZiBHRU5FUklDX0NMT0NLRVZFTlRTX0JST0FEQ0FTVA0KPiAgIAlzZWxlY3Qg
QVJDSF9IQVNfVUFDQ0VTU19GTFVTSENBQ0hFDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19VQlNBTl9T
QU5JVElaRV9BTEwNCj4gLQlzZWxlY3QgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVAlpZiBQUENf
Qk9PSzNTXzY0DQo+ICsJc2VsZWN0IEFSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QNCj4gICAJc2Vs
ZWN0IEFSQ0hfSEFWRV9OTUlfU0FGRV9DTVBYQ0hHDQo+ICAgCXNlbGVjdCBBUkNIX0tFRVBfTUVN
QkxPQ0sNCj4gICAJc2VsZWN0IEFSQ0hfTUlHSFRfSEFWRV9QQ19QQVJQT1JUDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL3BndGFibGUuaA0KPiBpbmRleCBkNTY0ZDBlY2Q0Y2QuLmJmOThkYjg0NDU3OSAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiArKysg
Yi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IEBAIC0yMCwyNSArMjAsNiBA
QCBzdHJ1Y3QgbW1fc3RydWN0Ow0KPiAgICNpbmNsdWRlIDxhc20vbm9oYXNoL3BndGFibGUuaD4N
Cj4gICAjZW5kaWYgLyogIUNPTkZJR19QUENfQk9PSzNTICovDQo+ICAgDQo+IC0vKiBOb3RlIGR1
ZSB0byB0aGUgd2F5IHZtIGZsYWdzIGFyZSBsYWlkIG91dCwgdGhlIGJpdHMgYXJlIFhXUiAqLw0K
PiAtI2RlZmluZSBfX1AwMDAJUEFHRV9OT05FDQo+IC0jZGVmaW5lIF9fUDAwMQlQQUdFX1JFQURP
TkxZDQo+IC0jZGVmaW5lIF9fUDAxMAlQQUdFX0NPUFkNCj4gLSNkZWZpbmUgX19QMDExCVBBR0Vf
Q09QWQ0KPiAtI2RlZmluZSBfX1AxMDAJUEFHRV9SRUFET05MWV9YDQo+IC0jZGVmaW5lIF9fUDEw
MQlQQUdFX1JFQURPTkxZX1gNCj4gLSNkZWZpbmUgX19QMTEwCVBBR0VfQ09QWV9YDQo+IC0jZGVm
aW5lIF9fUDExMQlQQUdFX0NPUFlfWA0KPiAtDQo+IC0jZGVmaW5lIF9fUzAwMAlQQUdFX05PTkUN
Cj4gLSNkZWZpbmUgX19TMDAxCVBBR0VfUkVBRE9OTFkNCj4gLSNkZWZpbmUgX19TMDEwCVBBR0Vf
U0hBUkVEDQo+IC0jZGVmaW5lIF9fUzAxMQlQQUdFX1NIQVJFRA0KPiAtI2RlZmluZSBfX1MxMDAJ
UEFHRV9SRUFET05MWV9YDQo+IC0jZGVmaW5lIF9fUzEwMQlQQUdFX1JFQURPTkxZX1gNCj4gLSNk
ZWZpbmUgX19TMTEwCVBBR0VfU0hBUkVEX1gNCj4gLSNkZWZpbmUgX19TMTExCVBBR0VfU0hBUkVE
X1gNCj4gLQ0KPiAgICNpZm5kZWYgX19BU1NFTUJMWV9fDQo+ICAgDQo+ICAgI2lmbmRlZiBNQVhf
UFRSU19QRVJfUEdEDQo+IEBAIC03OSw2ICs2MCw3IEBAIGV4dGVybiB2b2lkIHBhZ2luZ19pbml0
KHZvaWQpOw0KPiAgIHZvaWQgcG9raW5nX2luaXQodm9pZCk7DQo+ICAgDQo+ICAgZXh0ZXJuIHVu
c2lnbmVkIGxvbmcgaW9yZW1hcF9ib3Q7DQo+ICtleHRlcm4gcGdwcm90X3QgcHJvdGVjdGlvbl9t
YXBbMTZdIF9fcm9fYWZ0ZXJfaW5pdDsNCj4gICANCj4gICAvKg0KPiAgICAqIGtlcm5fYWRkcl92
YWxpZCBpcyBpbnRlbmRlZCB0byBpbmRpY2F0ZSB3aGV0aGVyIGFuIGFkZHJlc3MgaXMgYSB2YWxp
ZA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYyBiL2FyY2gvcG93ZXJw
Yy9tbS9wZ3RhYmxlLmMNCj4gaW5kZXggZTYxNjZiNzFkMzZkLi42MThmMzBkMzViMTcgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBj
L21tL3BndGFibGUuYw0KPiBAQCAtNDcyLDMgKzQ3MiwyNyBAQCBwdGVfdCAqX19maW5kX2xpbnV4
X3B0ZShwZ2RfdCAqcGdkaXIsIHVuc2lnbmVkIGxvbmcgZWEsDQo+ICAgCXJldHVybiByZXRfcHRl
Ow0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MX0dQTChfX2ZpbmRfbGludXhfcHRlKTsNCj4gKw0K
PiArLyogTm90ZSBkdWUgdG8gdGhlIHdheSB2bSBmbGFncyBhcmUgbGFpZCBvdXQsIHRoZSBiaXRz
IGFyZSBYV1IgKi8NCj4gK3BncHJvdF90IHByb3RlY3Rpb25fbWFwWzE2XSBfX3JvX2FmdGVyX2lu
aXQgPSB7DQo+ICsJW1ZNX05PTkVdCQkJCQk9IFBBR0VfTk9ORSwNCj4gKwlbVk1fUkVBRF0JCQkJ
CT0gUEFHRV9SRUFET05MWSwNCj4gKwlbVk1fV1JJVEVdCQkJCQk9IFBBR0VfQ09QWSwNCj4gKwlb
Vk1fV1JJVEUgfCBWTV9SRUFEXQkJCQk9IFBBR0VfQ09QWSwNCj4gKwlbVk1fRVhFQ10JCQkJCT0g
UEFHRV9SRUFET05MWV9YLA0KPiArCVtWTV9FWEVDIHwgVk1fUkVBRF0JCQkJPSBQQUdFX1JFQURP
TkxZX1gsDQo+ICsJW1ZNX0VYRUMgfCBWTV9XUklURV0JCQkJPSBQQUdFX0NPUFlfWCwNCj4gKwlb
Vk1fRVhFQyB8IFZNX1dSSVRFIHwgVk1fUkVBRF0JCQk9IFBBR0VfQ09QWV9YLA0KPiArCVtWTV9T
SEFSRURdCQkJCQk9IFBBR0VfTk9ORSwNCj4gKwlbVk1fU0hBUkVEIHwgVk1fUkVBRF0JCQkJPSBQ
QUdFX1JFQURPTkxZLA0KPiArCVtWTV9TSEFSRUQgfCBWTV9XUklURV0JCQkJPSBQQUdFX1NIQVJF
RCwNCj4gKwlbVk1fU0hBUkVEIHwgVk1fV1JJVEUgfCBWTV9SRUFEXQkJPSBQQUdFX1NIQVJFRCwN
Cj4gKwlbVk1fU0hBUkVEIHwgVk1fRVhFQ10JCQkJPSBQQUdFX1JFQURPTkxZX1gsDQo+ICsJW1ZN
X1NIQVJFRCB8IFZNX0VYRUMgfCBWTV9SRUFEXQkJCT0gUEFHRV9SRUFET05MWV9YLA0KPiArCVtW
TV9TSEFSRUQgfCBWTV9FWEVDIHwgVk1fV1JJVEVdCQk9IFBBR0VfU0hBUkVEX1gsDQo+ICsJW1ZN
X1NIQVJFRCB8IFZNX0VYRUMgfCBWTV9XUklURSB8IFZNX1JFQURdCT0gUEFHRV9TSEFSRURfWA0K
PiArfTsNCj4gKw0KPiArI2lmbmRlZiBDT05GSUdfUFBDX0JPT0szU182NA0KPiArREVDTEFSRV9W
TV9HRVRfUEFHRV9QUk9UDQo+ICsjZW5kaWY=
