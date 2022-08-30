Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A425A5BE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:33:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGyDN12Wjz3dx8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 16:33:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=aT7hp1Nd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.58; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=aT7hp1Nd;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90058.outbound.protection.outlook.com [40.107.9.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGyC75SVzz3c6q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 16:32:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7KmY0b/ZxGLzHQllB7i6SVYX1BNVVOwFyBwg11Oqyydq1DyjrPvPJZlSVzJWLWhp0oFWuS+ChOJyrzikIkCj6SKXSLlElE4bkLCE5jqrW5HydpObeZ99hNKg0PbpHCZpKmxawnkusMzPMOjpsdZa6tQZ778/mHakTTlv1zYfRaNU5fPFzYa5co+eHC+EYfoDRWLcBTiGR/CuNWS9+49XFPEM7qmNYrEs+Z10u4DtqlC1ITkeMF8sztw53t0SiWUJ3sTu0c/ti6tSpd5vVH1h2LP9lgkQnvcI11SjuWsvJ+yCb6IZhCE0wr9neJ/YuOpcQfgE/nOmz8DNVEtpnSNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyKGN9tvKDnJ0V85O2pVyTkRNcstjhMcFMZFc+YRD2w=;
 b=nPU3/CM9skCXG9kxfuxLtXXTA6cn1fFSqhyBmeAyg0i3zPnHxhAADGLf6xddANaKm+EbdZZ2Tc+XwWYVEF1mcf3Co5ugbLC+iISzimIPSYlPgRZOiOJJqaeNJe9egMvbGnHt1/9Sialjg/3/MZbf0vmt8jVWaIuXLYQOkjc4MiSMEX1r7Nwfwv4Ubc/GWQ84FFwk7rEpZadoWisUWMs/EP4uIkattVRJEqRZ1g9XC7fb801PJc+ndx9aeMo1EuIhG97nC5catQP7yih5KLROVB1qnV8xbRtyjQlTGaOnTOITTLF5cJBkT/XpqkLhwgYKffMVjaMeD2qX/8bZDS2Ysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyKGN9tvKDnJ0V85O2pVyTkRNcstjhMcFMZFc+YRD2w=;
 b=aT7hp1NdSKcgoF/VcJqp1/ONMsViuJDRB0b/4pdWUgW/ToGTheHQ1M4jmgZr2/RFEq67BXXGvyg3rwbFijmX4imhG03Fy4JgYIiCGDpx2ey6riCFlWjIyz1eRJ1da5HP+luqevVbupHbifvRJ+EfzdsP5fUz6X2rV6Vypdr1/99pI/ConzETvavK983WRxIEszGyc5B/Kusy251PYQ3kQZP0xkUfho+lzGqpG336UZlXwCrGkp1da503vtwZ7Fj0HzJ79do/VGLK5xssVmM3idIwOFdgrbrYjci4WHZpJakUAZMIH3l+HXk/ldgopcxWJ/juHyLRRt1ptrtTmPwGcA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1939.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Tue, 30 Aug 2022 06:31:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:31:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 12/16] objtool: Read special sections with alts only
 when specific options are selected
Thread-Topic: [PATCH v2 12/16] objtool: Read special sections with alts only
 when specific options are selected
Thread-Index: AQHYu2uy8aA5Oejs+0m9dhjO6mK4LK3G/X+A
Date: Tue, 30 Aug 2022 06:31:44 +0000
Message-ID: <32162c49-ab78-5ece-acfc-c4224131638b@csgroup.eu>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-13-sv@linux.ibm.com>
In-Reply-To: <20220829055223.24767-13-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71a0e6f7-59c6-4b1b-8ba2-08da8a514ee4
x-ms-traffictypediagnostic: MR1P264MB1939:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MzJJqqbaRRb+K0OZUJMQABz61rnaAssAiJTRnlmSDpvIlBYOQS5Vm3PQwmpzfWLBAXr5F/8QWVsuCWxu/3cDATmIO1oIHKOoMcsJz2zzLXmf8FZ5/+/bn3g2xPMQ78VC9J2b+a3Tcv5iAb2TZkOlk+F9qUMQHBL5xugjVl6lz5TonkslrbP6HKCGzgW9/QFsTRMPULY5vix12hM9OFu7GfF85abIBnZkl5b8RRCYyrcKUDQjV+salXs9pb8QpdKtvjUqhDQikds8MNxWcVdxx33ytppMtQM0VKrVBBXq6oVd2ub+MXucBfkkOoUYtv9/aE4l3/4uO4RLXNL26FGh7hs69kKt1i6eRH33H9iZsbysxxVja6edUBxV4jV3OLGHa9Z3IZDHSFO8ZQ37LGHTd4KY1DcaYNq44CU1xG5UyooBL95Eo62ckg4yTuXmdKI9xf6EjRjGpwrQGQqVXAXg5lU7MLsJxkCc2xl298STro5aOvDBGMk4wHyaC199E2uqaRSLI1pymZq7sRKlBfem47Hefn34w890g6h4GszpEVNn1nzirZ0TcOltddFGCSk8K9kay0XkxwsD47uBi4/+zqS+6nPyLyjrL8TDFwotCAqxadQCiFFdd1+WDrI/Amg2CcUsbgr2BdwkwLAlO+7+kyHPbuMVeUbAOI1YJzfDmKEKNQfQ0m4eyDbIc5M1PZSBhCj/HW85mAlUYpQp3ZTq96A/h1hisHlXZckGuvOsz2OGkQxDlWtLPIiXfjZSEuQJW7pOfcqEhWIc9HhIqW3GEjsOc4tPRoRyHiYkSTEEsa41Yw/q3Hj4zzHdUPoYW8P4eN8IS5jEMiEZquTETZ80Tg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(366004)(396003)(39850400004)(346002)(6486002)(66946007)(54906003)(66446008)(66556008)(66476007)(31696002)(316002)(8676002)(4326008)(110136005)(71200400001)(64756008)(31686004)(76116006)(38070700005)(8936002)(5660300002)(36756003)(86362001)(478600001)(41300700001)(7416002)(2616005)(122000001)(6506007)(6512007)(2906002)(26005)(44832011)(38100700002)(83380400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SXpFdU41QThRWTJFNlVUNEhIK1dvcVdUU3FvUGxRaUhxY082YXNpZ2R2T3VM?=
 =?utf-8?B?SHRHL0pXQndSVmRhVVQrWERhcFRLM2d3L2VvdmxmTW96MEpVcHFhSjJQWE9H?=
 =?utf-8?B?L0tEM0ZTWEViVHZUV0Z5TkdFNVFnWkhuNGdiN3E1SklWeEkxZDk5aDUwbVJ0?=
 =?utf-8?B?QVFYUDBxbHZ5OFdqTmY2N2ptczdueVU2Z2crN2JuMjRjOEJ5S3BQT0tUNGJ4?=
 =?utf-8?B?RlZCZGlkVmoydlFlQ1R1OUZqaU1FQ2g2VitLWVoyTEQ0bDVzMDV0K214UDQr?=
 =?utf-8?B?eEVKZHdsQzN2Y09Kbk10L0FPOVpUN2NzWlJTc2JjUEsra3FQaEY4TEUzanFs?=
 =?utf-8?B?MWRwWGNodk5iSlJZdDFrYUJQbjN6SDZ5WHBYMVc5TVlDR2NOR21mVFhuQjRj?=
 =?utf-8?B?azNFbFhFUWdBekJ4Z3krR2c1NHJud1FqYmNUcDQ5eUdOZVNWZ080aXFjbW1P?=
 =?utf-8?B?NWpRRmRlVy9xRVBSUFR6WGR1aFpOM0tyMTh6L1BJQXdnTmI5OTFkK2M3K0lp?=
 =?utf-8?B?NmNVUzVuaVRuaGhDRExWWWpMR1ovZE1tVGZBYlF2ZlJyeDVteExyaCthSmxU?=
 =?utf-8?B?ZVdRdjZoRVpBRlpaK0JPMUNCS2d5VVo2SWtVYThyeGJjYjgwczNkUHRNaXdo?=
 =?utf-8?B?SXQyUFl2QVJrMDFyZVJ2bWRKNWVXM3VDd0t5cFNwVUVSZjdYN2ZLUkJWS1lD?=
 =?utf-8?B?QkI3cU1lNFdiL1V5MkR5czhRTnEzUXFFSVBaampaN01wNkR4WC9aU0VHelc2?=
 =?utf-8?B?ZFhrWFhyaXVyZVdwZ3VuZlQvV0ZDUHFVSmVMaklwdUZEUmkxT2k3QWRLcG5n?=
 =?utf-8?B?KzFlZ3M2S1pOS2JIbVNzWkRZMk1tRjJnQSt3MmVodWxIMzRjbGk3YjZmb3M1?=
 =?utf-8?B?b251Q1BOd3BFTUhscE1YRC9QSjhiSFJEWWdrRnBESmluK2cyQlVlendpcUcv?=
 =?utf-8?B?aHpNTmF2WHNnVTUzMnRqcmc0NFF1eGVmUlE2aGhISXlOdFozY1lHTEplZitQ?=
 =?utf-8?B?UWhaVE13SUg3WGdlNnZhY3JFcGtaR3hwdWQwWHQ5OUNQTkZ0cE1tSm1ua2xW?=
 =?utf-8?B?MHVvdGlSeGQ0dkd4VlVkVDl2cUZTZjQxNm9XZ3pyclE5bmZSSVZOWndqYUNV?=
 =?utf-8?B?Z1ZLbjhnSjdydlZiYkhnZWtnamkzb2cyalUyb3Axa0U3aXJOODBjZVdvRTZK?=
 =?utf-8?B?a0RNTENRcGlJVUp5TG5MZk53S05aaUkzekY3QzJaRU5aTUZnTThNMkJMZGhY?=
 =?utf-8?B?UHpZcUxtU2RvUzRLT1NVSFpUUGVNZ20yYVZLMWVvRUY5L1ZRd0ROUzd6NGxF?=
 =?utf-8?B?WnA2MDljOEQzUm4wczF3eEl6NDhYY1ZIS1ZwNmZUcjZkK1NiVU1WVkxDMWgy?=
 =?utf-8?B?TFl4QXM0YnlydmxzelQrVVZEd1pRbytXODBpeTRIRG0yemcrUWJ6UkhZVzJX?=
 =?utf-8?B?bW1qK296S0NDamZBZy91Z2krSzg5aGFOTzFraVBVR21mbDliRzdsdm5ReXJY?=
 =?utf-8?B?REplRkxRbTRJL1NiL0syaXpydTY1K01UeFVsYkh1aXFROVkxTm14N29PM2JG?=
 =?utf-8?B?UTdXaEZNbWRnMDlrR3o1dDYrdGxZVXJSNzVSYXMwZ1drdUJGTHRxMWs1ek5C?=
 =?utf-8?B?VGJHM0ptcUdRV0N6b1lnQVZGbHZqQTdoZzE2OG1weHNPTEFXWG9EUXMrTnQw?=
 =?utf-8?B?WlF1NlZRWTdGc0V0QkNpV2E1N0VWQVZYdlh2QmFSNUtRSGZVYzRUamhPalJs?=
 =?utf-8?B?YlFWdDZ0dlJmcnJPZ3paR3pEcElUMEhXZ2pYZGUvek9DbVJtTzFDRllYSlpR?=
 =?utf-8?B?cEwxbkVqRlg0MlFldDRNK3J5ZUxySXhwdWN6Z0lXSlpBR254MmQ1emEzKy9a?=
 =?utf-8?B?bWZPYXVkKzB5T0YzRTY2bTJETmNlYStHT1ZmOUwwTExyOHEzS05MNFVkdnRW?=
 =?utf-8?B?VU8ydmZHQkV5QUVwTG43UHpiNHRERWpCamFYcjhwZ25kQ21EUVZKMDh5a1ZU?=
 =?utf-8?B?bmxxaEErTjY3S1hyVU9ENkhlY3E0TlM3clN1anRabThNVEdMMkxpOVNLY0ha?=
 =?utf-8?B?ZG5iTmxOUWxVVWtRR2NIUmRjQ0FhWkpQaWpjRC9taWNmVXk1UTEzME1UQ1Bv?=
 =?utf-8?B?TEsrLzlMaDlQS2NLYXIzeXlEbHdQRVplcWQ4S3VOaVhBNEdqankwK1NzRWln?=
 =?utf-8?B?c2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEF426B6722CA444ADAE0C939BE9D52E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a0e6f7-59c6-4b1b-8ba2-08da8a514ee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 06:31:44.6618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x7ZBOjW+EWh5lufLoVLlvW3HohfUrEQfK+Xo3oVN+KNDAqtzOGnIecYJX7XQBOIR9xmMPcVPGDztXXNBrfT18A5zCAmom/muX7woW7ifsB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1939
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA4LzIwMjIgw6AgMDc6NTIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBUaGlzIHBhdGNoIHJlYWRzIHNwZWNpYWwgc2VjdGlvbnMgd2hpY2ggaGF2ZSBhbHRlcm5h
dGUNCj4gaW5zdHJ1Y3Rpb25zLCBvbmx5IHdoZW4gc3RhY2t2YWwgb3Igb3JjIG9yIHVhY2Nlc3Mg
b3INCj4gbm9pbnN0ciBvcHRpb25zIGFyZSBwYXNzZWQgdG8gb2JqdG9vbC4NCg0KVW5jbGVhciwg
SSBoYWQgdG8gcmVhZCBpdCB0aHJlZSB0aW1lIHRvIHVuZGVyc3RhbmQuDQoNCldoYXQgYWJvdXQg
c29tZXRoaW5nIGxpa2U6DQoNCi0tLSA+OCAtLS0NClJlYWRpbmcgc3BlY2lhbCBzZWN0aW9ucyB3
aGljaCBoYXZlIGFsdGVybmF0ZSBpbnN0cnVjdGlvbnMgaXMgb25seSANCm5lZWRlZCBmb3Igc3Rh
Y2sgdmFsaWRhdGlvbiBvciBvcmMgb3IgdWFjY2VzcyB2YWxpZGF0aW9uIG9yIG5vaW5zdHIgDQp2
YWxpZGF0aW9uLg0KDQpPbmx5IGNhbGwgYWRkX3NwZWNpYWxfc2VjdGlvbl9hbHRzKCkgd2hlbiBz
dGFja3ZhbCBvciBvcmMgb3IgdWFjY2VzcyBvcg0Kbm9pbnN0ciBvcHRpb25zIGFyZSBwYXNzZWQg
dG8gb2JqdG9vbC4NCi0tLSA+OCAtLS0NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2F0aHZpa2Eg
VmFzaXJlZGR5IDxzdkBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICB0b29scy9vYmp0b29sL2No
ZWNrLmMgfCA4ICsrKysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9vYmp0b29sL2NoZWNrLmMg
Yi90b29scy9vYmp0b29sL2NoZWNrLmMNCj4gaW5kZXggM2NlYTU4ZjczODc4Li41Mjk4YTE0M2Nl
YWMgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL29ianRvb2wvY2hlY2suYw0KPiArKysgYi90b29scy9v
Ymp0b29sL2NoZWNrLmMNCj4gQEAgLTIzNzAsOSArMjM3MCwxMSBAQCBzdGF0aWMgaW50IGRlY29k
ZV9zZWN0aW9ucyhzdHJ1Y3Qgb2JqdG9vbF9maWxlICpmaWxlKQ0KPiAgIAkgKiBNdXN0IGJlIGJl
Zm9yZSBhZGRfanVtcF9kZXN0aW5hdGlvbnMoKSwgd2hpY2ggZGVwZW5kcyBvbiAnZnVuYycNCj4g
ICAJICogYmVpbmcgc2V0IGZvciBhbHRlcm5hdGl2ZXMsIHRvIGVuYWJsZSBwcm9wZXIgc2libGlu
ZyBjYWxsIGRldGVjdGlvbi4NCj4gICAJICovDQo+IC0JcmV0ID0gYWRkX3NwZWNpYWxfc2VjdGlv
bl9hbHRzKGZpbGUpOw0KPiAtCWlmIChyZXQpDQo+IC0JCXJldHVybiByZXQ7DQo+ICsJaWYgKG9w
dHMuc3RhY2t2YWwgfHwgb3B0cy5vcmMgfHwgb3B0cy51YWNjZXNzIHx8IG9wdHMubm9pbnN0cikg
ew0KPiArCQlyZXQgPSBhZGRfc3BlY2lhbF9zZWN0aW9uX2FsdHMoZmlsZSk7DQo+ICsJCWlmIChy
ZXQpDQo+ICsJCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gICANCj4gICAJcmV0ID0gYWRkX2p1bXBf
ZGVzdGluYXRpb25zKGZpbGUpOw0KPiAgIAlpZiAocmV0KQ==
