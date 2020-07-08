Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D85C217F53
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 08:05:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1pgK2GZ0zDr3B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 16:05:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1pdg5Y2hzDqJM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 16:03:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=ZUCMyNTo;
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B1pdg47L9z9Cvn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 16:03:35 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B1pdg3lpbz9sSJ; Wed,  8 Jul 2020 16:03:35 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.7.84;
 helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=madalin.bucur@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=ZUCMyNTo;
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B1pdf4hCFz9sQt
 for <linuxppc-dev@ozlabs.org>; Wed,  8 Jul 2020 16:03:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJ7KmS3VMJAvnAEjO5pQ9FJlPOtTLWtsmHnbgp1LIPnZb/eR7myxKY58OHYHL3A09+BDgTfGPfREZzamt9v8cFxpbKQWwE/B7JFSVHhkgySTyAyriUpYcXGexAME9XC2vtzHNZDEVQnKwcCHS3+fJ4qIpBt7GphePQ2WjJ+LQVon/nRTTIhaMBgOMhzizLPuBiF4KU78KOECP+kYupVLQJ9fxCH0LZ99CbZu23e3LhaFgI9VjZhgD8UxVmzecB63RwkOgAAWVyYiJQ+255bj/b+Pt7HlWp01hdCTGfNQ2/oMQdiAtA5s4gU87/ez0lTcXDa+HJueemg0s8EdTIeKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eXroiyaTUVz/jMlhfrLPuH4CdnBu0Eg5+qZp8k6A84=;
 b=V2lEs9XPMdQ0ylxPQHlAuKBFCj1tDu3C7JCFLOzTG5RxaSwFYoGLWDtajdiik6XtgiWy9MT9m80EDdU03mRs2KsUgK5UpkFB5LomKyE334iwN0oWikXcNBuXDtpWZLbiWVzvCVMOy71izRTDOrHDANtCfaI196psTPrzWPIq4GiN9sCGMRvA0UtBl4mHxrLiwA/HJEQmT1RL0U4PYaEmJkrR3F1hp8dSDI7fvCHnfTCkNsJydFCQS5JXwZiCsLlRFDRHbv5eccXFEwLNhLufYobt+IHyPlMhr0CL2QeUVtMlqwONVsKWd72MaH7+TzC7fiaJOT2NEierjf85kgtenA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eXroiyaTUVz/jMlhfrLPuH4CdnBu0Eg5+qZp8k6A84=;
 b=ZUCMyNTo6PcDGBz9/axkXH9kS8MmgyFjv6Adco8SUqtNfefR+Z3wHO1a6IgadAhNWBDRWbmI3ZE9BylgDsgLr4RGoW+zaPEBQaY4cTLztrzTEX1vVviqCJ23FoIaRwuVHv/abNF+gmg5PV37Q1tb3HzqlsLVYjq6H8UiFLG/IdI=
Received: from AM6PR04MB3976.eurprd04.prod.outlook.com (2603:10a6:209:3f::17)
 by AM5PR04MB3155.eurprd04.prod.outlook.com (2603:10a6:206:4::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Wed, 8 Jul
 2020 06:03:28 +0000
Received: from AM6PR04MB3976.eurprd04.prod.outlook.com
 ([fe80::8576:ca02:4334:31a3]) by AM6PR04MB3976.eurprd04.prod.outlook.com
 ([fe80::8576:ca02:4334:31a3%5]) with mapi id 15.20.3153.030; Wed, 8 Jul 2020
 06:03:28 +0000
From: "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, "Madalin Bucur (OSS)"
 <madalin.bucur@oss.nxp.com>
Subject: RE: FSL P5020/P5040: DPAA Ethernet issue with the latest Git kernel
Thread-Topic: FSL P5020/P5040: DPAA Ethernet issue with the latest Git kernel
Thread-Index: AQHWR5jTHhTZbrfIEky9D5Mwx4KsRKjncmWAgAD1TgCAAL4jgIASsgeAgACCSgCAAC7WAIAAweuA
Date: Wed, 8 Jul 2020 06:03:28 +0000
Message-ID: <AM6PR04MB3976996912A9342D7BB7C1FFEC670@AM6PR04MB3976.eurprd04.prod.outlook.com>
References: <AM6PR04MB3976584920CFDC269D859DBBEC660@AM6PR04MB3976.eurprd04.prod.outlook.com>
 <4E3069C3-B777-4460-A781-84214C4539DA@xenosoft.de>
In-Reply-To: <4E3069C3-B777-4460-A781-84214C4539DA@xenosoft.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xenosoft.de; dkim=none (message not signed)
 header.d=none;xenosoft.de; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [82.76.227.152]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ce9bd2c0-ecff-4309-f299-08d82304a255
x-ms-traffictypediagnostic: AM5PR04MB3155:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3155B963A88A8B65ACEE076BAD670@AM5PR04MB3155.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J3PiOIuOskq6teFPnynqQB2JiHmf7PFeNIYNg7l33Wyk8dyYqIfl32AMak+oWV/yag6NBSLWGjru5iUIRPn7hR1+7rqGhkC1gbfqTS8WN1/N8Fs1tWaWmvT4I7NkRyP65JkzuQqXdfNU5d6PAs8vKre54Jx41Ku7S5ZjC0+0p2/NKHARG5FkCLwQEiyyQmhVxhV6yWL2tMQ4BBj58yQ/Mxt/NAABmdc2hFLTYaIDQkEnxdVAvH+5XFaDZV3lPTkwIZLYkDHJhkiidQ5RZ75jCGN3/yC7HbNb5v/9dXnqUr3W8JAojYMYuaHll1Kf9+boCDpZpBZDaIjaGg/ibakElBo16C0IYJ1h/mC1bfkAzjKCAO6MFlGwbDVz6/gsnMRXqs+N1d7FAUFLEZbXSG9cPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB3976.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(8936002)(86362001)(8676002)(186003)(2906002)(966005)(478600001)(52536014)(16799955002)(26005)(55016002)(33656002)(4326008)(54906003)(9686003)(53546011)(110136005)(7696005)(316002)(71200400001)(76116006)(64756008)(66946007)(66556008)(66476007)(66446008)(5660300002)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Sfi0ufi/N0wDJmmlzAge4SUEfVIQPUSKxje0KfBv6skfbFb51SrU6kIuz7lv+GphL9ikwevK9V3iuG06yw9uZjIAEVMSAc3QHFasSeqTJWj8zOJdssn9Vha5FjqPq9ux6tzm1JcOluk8EShKTNvND7J2z+awxiCgPLe80W/FNICqTaRuPagneoB5eMs1jkncVRkZ8xqT/DBUwwu/lWN6xSdIFeMhYjPzZ5LemdMcLLvW8ZgLYN5q8uY9T3dzyr7CzTDVkL745cZQ5kftbKm0IQ0cZFg2FOQcaOiyGkzH3gigoiQzYJQKrZya+0RMi3Zf73F9m99JqZwKajligQPcc8yF6zjhDu/V5V7fsKljc8g98OizQ23LLuHdwTlkYFYTLXG3DRL767NKUngtUNpBUv+TlybRK1VpIuz4J/dY1URaGBjtB90cslGrENUSlufG4dBg+O3sPHnrjwpsxLsU/UT5RPdKF15iV2EzVBwkxcM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB3976.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9bd2c0-ecff-4309-f299-08d82304a255
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 06:03:28.1988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CdC8+BM8Uk0DI8c8EiuRLFQC9PEhVY16eU4CNw29SslsQ4ZZbabVAeUO3xJVsXoGCOAI746e1RlZtfMJlNMlHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3155
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 Camelia Alexandra Groza <camelia.groza@nxp.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBDaHJpc3RpYW4gWmlnb3R6a3kgPGNoemlnb3R6a3lAeGVub3NvZnQuZGU+IA0KPiBT
ZW50OiBUdWVzZGF5LCBKdWx5IDcsIDIwMjAgOToyNiBQTQ0KPiBUbzogTWFkYWxpbiBCdWN1ciAo
T1NTKSA8bWFkYWxpbi5idWN1ckBvc3MubnhwLmNvbT4NCj4gQ2M6IG1hZCBza2F0ZW1hbiA8bWFk
c2thdGVtYW5AZ21haWwuY29tPjsgQ2FtZWxpYSBBbGV4YW5kcmEgR3JvemEgPGNhbWVsaWEuZ3Jv
emFAbnhwLmNvbT47DQo+IGxpbnV4cHBjLWRldkBvemxhYnMub3JnOyBuZXRkZXZAdmdlci5rZXJu
ZWwub3JnOyBSLlQuRGlja2luc29uIDxydGQyQHh0cmEuY28ubno+Ow0KPiBEYXJyZW4gU3RldmVu
cyA8ZGFycmVuQHN0ZXZlbnMtem9uZS5uZXQ+DQo+IFN1YmplY3Q6IFJlOiBGU0wgUDUwMjAvUDUw
NDA6IERQQUEgRXRoZXJuZXQgaXNzdWUgd2l0aCB0aGUgbGF0ZXN0IEdpdCBrZXJuZWwNCj4NCj4N
Cj4gT24gNy4gSnVsIDIwMjAsIGF0IDE3OjUzLCBNYWRhbGluIEJ1Y3VyIChPU1MpIDxtYWlsdG86
bWFkYWxpbi5idWN1ckBvc3MubnhwLmNvbT4gd3JvdGU6DQo+IFdhcyBEUEFBIGZ1bmN0aW9uYWwg
YmVmb3JlIGNvbW1pdCBBPw0KPiBIb3cgYWJvdXQgYWZ0ZXIgY29tbWl0IEEgYW5kIGJlZm9yZSBj
b21taXQgQj8NCg0KPiBUaGUgRFBBQSBFdGhlcm5ldCB3b3JrcyBmcm9tIMKgdGhlIGtlcm5lbCA1
LjYtcmM0IFsxXSB0aWxsIHRoZSBHaXQga2VybmVsIGZyb20gdGhlDQo+IDExIG9mIEp1bmUgWzJd
LiBJdCBkb2VzbuKAmXQgd29yayBzaW5jZSB0aGUgY29tbWl0IOKAnGZpeCBiaXRtYXBfcGFyc2Xi
gJ0gWzNdLg0KDQo+IFsxXcKgaHR0cHM6Ly9mb3J1bS5oeXBlcmlvbi1lbnRlcnRhaW5tZW50LmNv
bS92aWV3dG9waWMucGhwP3A9NDk5MzYjcDQ5OTM2DQo+IFsyXcKgaHR0cHM6Ly9mb3J1bS5oeXBl
cmlvbi1lbnRlcnRhaW5tZW50LmNvbS92aWV3dG9waWMucGhwP3A9NTA4NDgjcDUwODQ4DQo+IFsz
XcKgaHR0cHM6Ly9mb3J1bS5oeXBlcmlvbi1lbnRlcnRhaW5tZW50LmNvbS92aWV3dG9waWMucGhw
P3A9NTA5ODAjcDUwOTgwDQoNCkhpLA0KDQpjYW4geW91IHBsZWFzZSB0cnkgdG8gZGlzYWJsZSB0
aGUgbmV0d29yayBtYW5hZ2VyIChzZWUgWzFdKSwgdGhlbiBib290IHdpdGgNCnRoZSBsYXRlc3Qg
a2VybmVsLCB0aGF0IGRvZXMgbm90IHdvcmssIGFuZCBzZXR1cCB0aGUgaW50ZXJmYWNlcyBtYW51
YWxseT8NCg0KTWFkYWxpbg0KDQpbMV0gaHR0cHM6Ly9oZWxwLnVidW50dS5jb20vY29tbXVuaXR5
L05ldHdvcmtNYW5hZ2VyI1N0b3BwaW5nX2FuZF9EaXNhYmxpbmdfTmV0d29ya01hbmFnZXINCg0K
