Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C55BC207
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 08:49:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46csH33dHSzDqRR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 16:49:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.55; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=biwen.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="r9a/Ej2P"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150055.outbound.protection.outlook.com [40.107.15.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cmgJ1Kv6zDqHZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 13:21:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRGGpIV8fxDCiu7UetzOCTxWFMHrR17RKAaLNg6gtlYbugLZ3uOJb4Q1ZwGAW2YSSPJR1HG4N+dsJ5KUaTb22k3JFayo+vwi72qpIbU88ys20b/X2bjX5xvSTG+sRJQ+RRolRbSXkLF3tQfmHfOQlH402I7uHZasShNhkyeQVCZMNVGIRurXeCT7aAI7UZTNfS6NYA0HbZZyM2PRZrv8WQg2z1eT2RtOLdYIbjso3wdR+04D9V1M2obM4y1YGSwvsCXJeZeDhsu0+vqCB7CZLycyeXtxnWyjiz7+AwPei2lUh4wC2d+ch+8hoqftksS3zvgEeM6E+wcWg0i93ttWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kh9vFlSS8lraEsld/SbRvuQyOnWnz7lLhYxhRySih1Y=;
 b=FoXqqBzSQsk74sx3qaHj1mRBC5V9AjjO8haSmSQ26DeyoF1b6z7zzjrSsZEpbBVG5nDZOE8Q67/4RTpq/0ViFZvbwgfPGVOtkBo0YspfneLFIZE6p8VB3H1/ZQtejg+kcqFk+55NElUOQyz763qOGWY04J7V59jmGq6Da3ma/op24dxWlwbSIx+zXSRopo9niVyHeAmNtMx7+Gb23wrXDcm+EvIWsslkC1yTFGyTMZ7zIeaGQcw7zV+yS82slgrJfIKOgsCvWG9wqur1372OHmctHvk5SzV9TNQFkqefsHsErcIj+yU66OL56sMrPjFb47NogQT+loYnKhI+BaGM3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kh9vFlSS8lraEsld/SbRvuQyOnWnz7lLhYxhRySih1Y=;
 b=r9a/Ej2PDjEcfpnAFY84PBeF2gAH+ehXtPwjf3NNKHHjWk1jnzL9Li7oi9CpbzglAJxr3T+pYM7KTCUalDkd9GWcPXRrk1PqW4E2ZG9WxM7k5brVidP9JwKHRDStqM5eK5YHax88NxhKYHwpyxYTxJNJeKwVdc7eR8rDDmU/V9w=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4235.eurprd04.prod.outlook.com (52.135.128.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 03:21:06 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa%5]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 03:21:06 +0000
From: Biwen Li <biwen.li@nxp.com>
To: Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, Ran Wang <ran.wang_1@nxp.com>
Subject: Re: [v3,1/3] soc: fsl: handle RCPM errata A-008646 on SoC LS1021A
Thread-Topic: [v3,1/3] soc: fsl: handle RCPM errata A-008646 on SoC LS1021A
Thread-Index: AQHVcoOmitQBbHVgdECNbAMdvm8Piqc6KSq3
Date: Tue, 24 Sep 2019 03:21:06 +0000
Message-ID: <DB7PR04MB44900683D093367E995C6C048F840@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190924024548.4356-1-biwen.li@nxp.com>
In-Reply-To: <20190924024548.4356-1-biwen.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [117.136.38.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a69d958a-3624-42e0-fc61-08d7409e3ce4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB7PR04MB4235; 
x-ms-traffictypediagnostic: DB7PR04MB4235:|DB7PR04MB4235:
x-ms-exchange-purlcount: 5
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4235E633FCDFEABA85A94D0F8F840@DB7PR04MB4235.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:312;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(199004)(189003)(53754006)(8676002)(486006)(52536014)(3846002)(186003)(11346002)(66066001)(256004)(2906002)(14454004)(6116002)(102836004)(606006)(25786009)(6506007)(53546011)(2501003)(71190400001)(9686003)(26005)(71200400001)(99286004)(45080400002)(4326008)(236005)(76176011)(7696005)(110136005)(476003)(66446008)(64756008)(7736002)(66476007)(66556008)(66946007)(316002)(44832011)(478600001)(966005)(446003)(55016002)(54906003)(229853002)(6306002)(6436002)(54896002)(14444005)(76116006)(91956017)(74316002)(8936002)(6636002)(5660300002)(81156014)(86362001)(6246003)(81166006)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4235;
 H:DB7PR04MB4490.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tQ6vVtEvUshOXz1xVMymh6rCRjMckHEQ1T4UN73A41PDOwQ4T+snMvIqg5mUved7R+VarZuPKnr3KkQq/3+fwqOoa+TZEXwF3ZqgoO0aR3OWLd6JQO3TSPSIiecAOsLNnrqgjUllfjdoOAlzX10N7vUTyRDrZ3W8hPr/l04hoshAkfzjdNn3ilPGFMuQ5HBolOV7YY4VfQfXXJmEN06UUWw/1lb1hh9VW/HzgbmTQx4KR3QjBGrIoPlC6j982PQkFYv51yQI3/YNZB4tr7o9Xes7bY2K3bFeCdFkEsPEMhn7M5gb3zsy5ZnQO9Gxf7iY8Y0iG/cMhvRLD0sgdN+4TSTOBiLrkk7h1CcPJjxj8nLhq9yLPPRPmmPLQEUO164DSrKYJ9stn+6nhhzoYouGu7N+ZcAtR/DYMQwer2l2GiU=
Content-Type: multipart/alternative;
 boundary="_000_DB7PR04MB44900683D093367E995C6C048F840DB7PR04MB4490eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69d958a-3624-42e0-fc61-08d7409e3ce4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 03:21:06.4276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HN3roFPKbsLBAV0RJx4IeCbTQFQUGQ2MvWiMQTkT6fKQsoinNJd/ms7l2L4HDEWnJMARAcya223sdFgBF6dmKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4235
X-Mailman-Approved-At: Tue, 24 Sep 2019 16:47:21 +1000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_000_DB7PR04MB44900683D093367E995C6C048F840DB7PR04MB4490eurp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KdGhlIGxpbnV4IHBhdGNoZXMgZGVwZW5kZWQgYnkgUkNQTSBkcml2ZXIsRmxleFRp
bWVyIGRyaXZlciBhbmQgRmxleFRpbWVyIGR0cywgbmVlZCBhcHBseSB0aGVzZSBwYXRjaGVzIGFz
IGZvbGxvd3M6DQoNCjEuIFJDUE0gZHJpdmVyOg0KDQpodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Nlcmllcy8xNjI3MzEvbWJveC8oaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRj
aC8xMTEwNTI3OS8pDQoNCjIuIEZsZXhUaW1lciBkdHM6DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3BhdGNod29yay9zZXJpZXMvNDA1NjUzL21ib3gvKGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3BhdGNod29yay9wYXRjaC8xMTEyNDkzLykNCg0KMy4gRmxleFRpbWVyIGRyaXZlcjoNCg0KaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9zZXJpZXMvMTI0NzE4L21ib3gvKGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTE0NTk5OS8pDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvc2VyaWVzLzEyNjk0Mi9tYm94LyhodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3BhdGNoLzExNTIwODUvKQ0KDQo0LiBBZGp1c3QgZHJpdmVycy9zb2MvZnNsL01ha2VmaWxlOg0K
DQpyZW1vdmUgdGhlIGxpbmUgJ29iai15ICs9IGZ0bV9hbGFybS5vJyBpbiBkcml2ZXJzL3NvYy9m
c2wvTWFrZWZpbGUgdG8gcmVzb2x2ZSBhIGNvbXBpbGF0aW9uIGVycm9yDQoNCrvxyKEgT3V0bG9v
ayBmb3IgQW5kcm9pZDxodHRwczovL2FrYS5tcy9naGVpMzY+DQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQpGcm9tOiBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4NClNlbnQ6
IFR1ZXNkYXksIFNlcHRlbWJlciAyNCwgMjAxOSAxMDo0NTo0NiBBTQ0KVG86IExlbyBMaSA8bGVv
eWFuZy5saUBueHAuY29tPjsgc2hhd25ndW9Aa2VybmVsLm9yZyA8c2hhd25ndW9Aa2VybmVsLm9y
Zz47IHJvYmgrZHRAa2VybmVsLm9yZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgbWFyay5ydXRsYW5k
QGFybS5jb20gPG1hcmsucnV0bGFuZEBhcm0uY29tPjsgUmFuIFdhbmcgPHJhbi53YW5nXzFAbnhw
LmNvbT4NCkNjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZyA8bGludXhwcGMtZGV2QGxp
c3RzLm96bGFicy5vcmc+OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcgPGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZyA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBCaXdlbiBMaSA8Yml3ZW4u
bGlAbnhwLmNvbT4NClN1YmplY3Q6IFt2MywxLzNdIHNvYzogZnNsOiBoYW5kbGUgUkNQTSBlcnJh
dGEgQS0wMDg2NDYgb24gU29DIExTMTAyMUENCg0KRGVzY3JpcHRpb246DQogICAgICAgIC0gUmVh
ZGluZyBjb25maWd1cmF0aW9uIHJlZ2lzdGVyIFJDUE1fSVBQREVYUENSMQ0KICAgICAgICAgIGFs
d2F5cyByZXR1cm4gemVybw0KDQpXb3JrYXJvdW5kOg0KICAgICAgICAtIFNhdmUgcmVnaXN0ZXIg
UkNQTV9JUFBERVhQQ1IxJ3MgdmFsdWUgdG8NCiAgICAgICAgICByZWdpc3RlciBTQ0ZHX1NQQVJF
Q1I4Lih1Ym9vdCdzIHBzY2kgYWxzbw0KICAgICAgICAgIG5lZWQgcmVhZGluZyB2YWx1ZSBmcm9t
IHRoZSByZWdpc3RlciBTQ0ZHX1NQQVJFQ1I4DQogICAgICAgICAgdG8gc2V0IHJlZ2lzdGVyIFJD
UE1fSVBQREVYUENSMSkNCg0KSW1wYWN0Og0KICAgICAgICAtIEZsZXhUaW1lciBtb2R1bGUgd2ls
bCBjYW5ub3Qgd2FrZXVwIHN5c3RlbSBpbg0KICAgICAgICAgIGRlZXAgc2xlZXAgb24gU29DIExT
MTAyMUENCg0KU2lnbmVkLW9mZi1ieTogQml3ZW4gTGkgPGJpd2VuLmxpQG54cC5jb20+DQotLS0N
CkNoYW5nZSBpbiB2MzoNCiAgICAgICAgLSB1cGRhdGUgY29tbWl0IG1lc3NhZ2UNCiAgICAgICAg
LSByZW5hbWUgcHJvcGVydHkgbmFtZQ0KICAgICAgICAgIGZzbCxyY3BtLXNjZmcgLT4gZnNsLGlw
cGRleHBjci1hbHQtYWRkcg0KDQpDaGFuZ2UgaW4gdjI6DQogICAgICAgIC0gZml4IHN0eXBlIHBy
b2JsZW1zDQoNCiBkcml2ZXJzL3NvYy9mc2wvcmNwbS5jIHwgMjEgKysrKysrKysrKysrKysrKysr
KysrDQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc29jL2ZzbC9yY3BtLmMgYi9kcml2ZXJzL3NvYy9mc2wvcmNwbS5jDQppbmRleCA4MmMw
YWQ1ZTY2M2UuLjdmNDJiMTdkM2YyOSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvc29jL2ZzbC9yY3Bt
LmMNCisrKyBiL2RyaXZlcnMvc29jL2ZzbC9yY3BtLmMNCkBAIC0xMyw2ICsxMyw4IEBADQogI2lu
Y2x1ZGUgPGxpbnV4L3NsYWIuaD4NCiAjaW5jbHVkZSA8bGludXgvc3VzcGVuZC5oPg0KICNpbmNs
dWRlIDxsaW51eC9rZXJuZWwuaD4NCisjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+DQorI2luY2x1
ZGUgPGxpbnV4L21mZC9zeXNjb24uaD4NCg0KICNkZWZpbmUgUkNQTV9XQUtFVVBfQ0VMTF9NQVhf
U0laRSAgICAgICA3DQoNCkBAIC0yOSw2ICszMSw5IEBAIHN0YXRpYyBpbnQgcmNwbV9wbV9wcmVw
YXJlKHN0cnVjdCBkZXZpY2UgKmRldikNCiAgICAgICAgIHN0cnVjdCByY3BtICAgICAgICAgICAg
ICpyY3BtOw0KICAgICAgICAgdTMyIHZhbHVlW1JDUE1fV0FLRVVQX0NFTExfTUFYX1NJWkUgKyAx
XSwgdG1wOw0KICAgICAgICAgaW50IGksIHJldCwgaWR4Ow0KKyAgICAgICBzdHJ1Y3QgcmVnbWFw
ICogc2NmZ19hZGRyX3JlZ21hcCA9IE5VTEw7DQorICAgICAgIHUzMiByZWdfb2Zmc2V0W1JDUE1f
V0FLRVVQX0NFTExfTUFYX1NJWkUgKyAxXTsNCisgICAgICAgdTMyIHJlZ192YWx1ZSA9IDA7DQoN
CiAgICAgICAgIHJjcG0gPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCiAgICAgICAgIGlmICghcmNw
bSkNCkBAIC02Myw2ICs2OCwyMiBAQCBzdGF0aWMgaW50IHJjcG1fcG1fcHJlcGFyZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYpDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRt
cCB8PSB2YWx1ZVtpICsgMV07DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlvd3JpdGUzMmJlKHRtcCwgcmNwbS0+aXBwZGV4cGNyX2Jhc2UgKyBpICogNCk7DQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9DQorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIFdvcmthcm91bmQgb2YgZXJyYXRhIEEtMDA4NjQ2IG9uIFNvQyBMUzEwMjFBOiBU
aGVyZSBpcyBhIGJ1ZyBvZg0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiByZWdp
c3RlciBpcHBkZXhwY3IxLiBSZWFkaW5nIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgUkNQTV9JUFBE
RVhQQ1IxDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIGFsd2F5cyByZXR1cm4g
emVyby4gU28gc2F2ZSBpcHBkZXhwY3IxJ3MgdmFsdWUgdG8gcmVnaXN0ZXIgU0NGR19TUEFSRUNS
OC4NCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICogQW5kIHRoZSB2YWx1ZSBvZiBp
cHBkZXhwY3IxIHdpbGwgYmUgcmVhZCBmcm9tIFNDRkdfU1BBUkVDUjguDQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAqLw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
Y2ZnX2FkZHJfcmVnbWFwID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZShucCwgImZz
bCxpcHBkZXhwY3ItYWx0LWFkZHIiKTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aWYgKHNjZmdfYWRkcl9yZWdtYXApIHsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkoZGV2LT5vZl9ub2RlLA0KKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZnNsLGlwcGRleHBjci1h
bHQtYWRkciIsIHJlZ19vZmZzZXQsIHJjcG0tPndha2V1cF9jZWxscyArIDEpKSB7DQorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzY2ZnX2FkZHJfcmVnbWFw
ID0gTlVMTDsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnRpbnVlOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0NCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWdtYXBfcmVhZChzY2ZnX2Fk
ZHJfcmVnbWFwLCByZWdfb2Zmc2V0W2kgKyAxXSwgJnJlZ192YWx1ZSk7DQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogV3JpdGUgdmFsdWUgdG8gcmVnaXN0ZXIgU0NG
R19TUEFSRUNSOCAqLw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
Z21hcF93cml0ZShzY2ZnX2FkZHJfcmVnbWFwLCByZWdfb2Zmc2V0W2kgKyAxXSwgdG1wIHwgcmVn
X3ZhbHVlKTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAg
ICAgICAgICAgICAgIH0NCiAgICAgICAgICAgICAgICAgfQ0KICAgICAgICAgfSB3aGlsZSAod3Mg
PSB3YWtldXBfc291cmNlX2dldF9uZXh0KHdzKSk7DQotLQ0KMi4xNy4xDQoNCg==

--_000_DB7PR04MB44900683D093367E995C6C048F840DB7PR04MB4490eurp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Hi all,<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
the linux patches depended by RCPM driver,FlexTimer driver and FlexTimer dt=
s, need apply these patches as follows:<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
1. RCPM driver:<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
<a href=3D"https://patchwork.kernel.org/series/162731/mbox/(https://patchwo=
rk.kernel.org/patch/11105279">https://patchwork.kernel.org/series/162731/mb=
ox/(https://patchwork.kernel.org/patch/11105279</a>/)<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
2. FlexTimer dts:<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
<a href=3D"https://lore.kernel.org/patchwork/series/405653/mbox/(https://lo=
re.kernel.org/patchwork/patch/1112493">https://lore.kernel.org/patchwork/se=
ries/405653/mbox/(https://lore.kernel.org/patchwork/patch/1112493</a>/)<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
3. FlexTimer driver:<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
<a href=3D"https://patchwork.ozlabs.org/series/124718/mbox/(https://patchwo=
rk.ozlabs.org/patch/1145999">https://patchwork.ozlabs.org/series/124718/mbo=
x/(https://patchwork.ozlabs.org/patch/1145999</a>/)<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
<a href=3D"https://patchwork.ozlabs.org/series/126942/mbox/(https://patchwo=
rk.ozlabs.org/patch/1152085">https://patchwork.ozlabs.org/series/126942/mbo=
x/(https://patchwork.ozlabs.org/patch/1152085</a>/)<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
4. Adjust drivers/soc/fsl/Makefile:<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
remove the line 'obj-y &#43;=3D ftm_alarm.o' in drivers/soc/fsl/Makefile to=
 resolve a compilation error<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
<span id=3D"x_OutlookSignature">
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
=BB=F1=C8=A1 <a href=3D"https://aka.ms/ghei36">Outlook for Android</a></div=
>
</span><br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Biwen Li &lt;biwen.=
li@nxp.com&gt;<br>
<b>Sent:</b> Tuesday, September 24, 2019 10:45:46 AM<br>
<b>To:</b> Leo Li &lt;leoyang.li@nxp.com&gt;; shawnguo@kernel.org &lt;shawn=
guo@kernel.org&gt;; robh&#43;dt@kernel.org &lt;robh&#43;dt@kernel.org&gt;; =
mark.rutland@arm.com &lt;mark.rutland@arm.com&gt;; Ran Wang &lt;ran.wang_1@=
nxp.com&gt;<br>
<b>Cc:</b> linuxppc-dev@lists.ozlabs.org &lt;linuxppc-dev@lists.ozlabs.org&=
gt;; linux-arm-kernel@lists.infradead.org &lt;linux-arm-kernel@lists.infrad=
ead.org&gt;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&=
gt;; devicetree@vger.kernel.org &lt;devicetree@vger.kernel.org&gt;;
 Biwen Li &lt;biwen.li@nxp.com&gt;<br>
<b>Subject:</b> [v3,1/3] soc: fsl: handle RCPM errata A-008646 on SoC LS102=
1A</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Description:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Reading configuration register=
 RCPM_IPPDEXPCR1<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; always return zero<b=
r>
<br>
Workaround:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Save register RCPM_IPPDEXPCR1'=
s value to<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; register SCFG_SPAREC=
R8.(uboot's psci also<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; need reading value f=
rom the register SCFG_SPARECR8<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to set register RCPM=
_IPPDEXPCR1)<br>
<br>
Impact:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - FlexTimer module will cannot w=
akeup system in<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; deep sleep on SoC LS=
1021A<br>
<br>
Signed-off-by: Biwen Li &lt;biwen.li@nxp.com&gt;<br>
---<br>
Change in v3:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - update commit message<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - rename property name<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fsl,rcpm-scfg -&gt; =
fsl,ippdexpcr-alt-addr<br>
<br>
Change in v2:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - fix stype problems<br>
<br>
&nbsp;drivers/soc/fsl/rcpm.c | 21 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 21 insertions(&#43;)<br>
<br>
diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c<br>
index 82c0ad5e663e..7f42b17d3f29 100644<br>
--- a/drivers/soc/fsl/rcpm.c<br>
&#43;&#43;&#43; b/drivers/soc/fsl/rcpm.c<br>
@@ -13,6 &#43;13,8 @@<br>
&nbsp;#include &lt;linux/slab.h&gt;<br>
&nbsp;#include &lt;linux/suspend.h&gt;<br>
&nbsp;#include &lt;linux/kernel.h&gt;<br>
&#43;#include &lt;linux/regmap.h&gt;<br>
&#43;#include &lt;linux/mfd/syscon.h&gt;<br>
&nbsp;<br>
&nbsp;#define RCPM_WAKEUP_CELL_MAX_SIZE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 7<br>
&nbsp;<br>
@@ -29,6 &#43;31,9 @@ static int rcpm_pm_prepare(struct device *dev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct rcpm&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *rcpm;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 value[RCPM_WAKEUP_CELL=
_MAX_SIZE &#43; 1], tmp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, ret, idx;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct regmap * scfg_addr_regmap =
=3D NULL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 reg_offset[RCPM_WAKEUP_CELL_M=
AX_SIZE &#43; 1];<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 reg_value =3D 0;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rcpm =3D dev_get_drvdata(d=
ev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!rcpm)<br>
@@ -63,6 &#43;68,22 @@ static int rcpm_pm_prepare(struct device *dev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; tmp |=3D value[i &#43; 1];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; iowrite32be(tmp, rcpm-&gt;ippdexpcr_base &#43; i * 4);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Workaround of errata A-008646 on SoC=
 LS1021A: There is a bug of<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * register ippdexpcr1. Reading co=
nfiguration register RCPM_IPPDEXPCR1<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * always return zero. So save ipp=
dexpcr1's value to register SCFG_SPARECR8.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * And the value of ippdexpcr1 wil=
l be read from SCFG_SPARECR8.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scfg_addr_regmap =3D syscon_regmap_look=
up_by_phandle(np, &quot;fsl,ippdexpcr-alt-addr&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (scfg_addr_regmap) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; if (of_property_read_u32_array(dev-&gt;of_node,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;fsl,ippdexpcr-alt-addr&quot;, reg_of=
fset, rcpm-&gt;wakeup_cells &#43; 1)) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scfg_addr_regmap =
=3D NULL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; regmap_read(scfg_addr_regmap, reg_offset[i &#43; 1], &amp;reg_valu=
e);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; /* Write value to register SCFG_SPARECR8 */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; regmap_write(scfg_addr_regmap, reg_offset[i &#43; 1], tmp | reg_va=
lue);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } while (ws =3D wakeup_sou=
rce_get_next(ws));<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_DB7PR04MB44900683D093367E995C6C048F840DB7PR04MB4490eurp_--
