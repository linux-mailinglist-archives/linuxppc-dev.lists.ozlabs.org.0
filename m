Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CA6154E94
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 23:07:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DCGS2rq6zDqSZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 09:07:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.20.78; helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=BMnv4GKJ; 
 dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DCD96Y7gzDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 09:05:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jt+kP+ui1kZmQVTRzLzkvLtY/OIE8V45WB3VcIahHak8LX+nNTuFFMf5rd0WE9GAeaECoet8IEcaelSo9Nm3iIHJoUQt6UvInwpZZJC/tT1o1hCL9261bJ1256T1g51A09lNknCxanpiR4OZtE8M84mreRShTt9L8FSR5RzZh4/JpQKbjmqZiLhK2ZOWntmzJDDZfjAOqkHQPhthZ0qHdhf68qXGQ0dxGvSWCzrBGvDTa5O2X5rCKTL3LtlhlJ9g2bq3MTMeUxD+2FJyIBIS0H9MI43HgteWAxZAr7NQqDjI0eOeglRnYf0WznVSznO8SKQYyZQo51AdS0bLbzLNSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdR4gpIVxJd550kKdP/INW3feEywfXEHvXdc41R5k/w=;
 b=oY7455CFUjEd1JOVnvEV03ZtLIEC4D/004Q7o2PYTA7wW6eFcpATh+cP5KnQyjGgZB/5BcKp2Ml+Rhm2z6Yk8YxzrckoLRlMUEBdpPp8r1mbBTw0zR/OKEMoMC1TQ2Q9GMCQEDcqod2LYd04RIynkqiCvGPg/A6JNOhH4ouy4mpvyFeJ3iA0pFFbG1uwI7uB8BFlVpQ2yJwhZ6GqZYllmEJnpO9NYYG8l6EW98ieYpdWSS1tUzPJ9Treu47l7Tyn6UvVn59SKRHuj6izyvfEsXr2QEG1eGE9B50eN/EWV5BbT4ZN+ZaGXzBNpYu70tA8FIrryq12oneyQP3ejI/BRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdR4gpIVxJd550kKdP/INW3feEywfXEHvXdc41R5k/w=;
 b=BMnv4GKJix6xK6i34ZE7OjsGCzt8n0j7hTGxlc/y2UkrU3jQ4ZK/LAjQ5xbIZ/BQeFdQn0dqs4AxJtmIcw6nUGddreV4+aOI/OGSzxVlNqQvhe4x1AubAgmX1CNbVqak7P+G9qkSqI2NLYs/af3s6vHwJYjGZw4VmEgOQBCf9QI=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.234.30) by
 VE1PR04MB6432.eurprd04.prod.outlook.com (20.179.234.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Thu, 6 Feb 2020 22:05:19 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::b896:5bc0:c4dd:bd23]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::b896:5bc0:c4dd:bd23%2]) with mapi id 15.20.2686.036; Thu, 6 Feb 2020
 22:05:19 +0000
From: Leo Li <leoyang.li@nxp.com>
To: "Roy Pledge (OSS)" <roy.pledge@oss.nxp.com>, Youri Querry
 <youri.querry_1@nxp.com>, Roy Pledge <roy.pledge@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Alexandru Marginean <alexandru.marginean@nxp.com>
Subject: RE: [PATCH 0/3] soc: fsl: dpio: Enable QMAN batch enqueuing
Thread-Topic: [PATCH 0/3] soc: fsl: dpio: Enable QMAN batch enqueuing
Thread-Index: AQHVsQ3AyGczVLMI40Km2qz47OLo96gO+P6AgAAW+uA=
Date: Thu, 6 Feb 2020 22:05:19 +0000
Message-ID: <VE1PR04MB668700BA28E1E9DE514AD5488F1D0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <1576170032-3124-1-git-send-email-youri.querry_1@nxp.com>
 <a46accbc-becf-ad23-8504-70ce619e2b11@oss.nxp.com>
In-Reply-To: <a46accbc-becf-ad23-8504-70ce619e2b11@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0382b7c3-6a3c-4355-4cad-08d7ab50a7ef
x-ms-traffictypediagnostic: VE1PR04MB6432:|VE1PR04MB6432:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB643236A60493745F840737C88F1D0@VE1PR04MB6432.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0305463112
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(189003)(199004)(71200400001)(8936002)(8676002)(478600001)(81166006)(81156014)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(316002)(110136005)(7696005)(6636002)(33656002)(86362001)(6506007)(55016002)(186003)(53546011)(26005)(9686003)(5660300002)(2906002)(52536014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6432;
 H:VE1PR04MB6687.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fr662aR0DVwp3goEk+SXzvkBd+dJGznF/JAq8qis15MrrrQkM9QuzOWq1QEmFpacH3BsxL6Az+aAZBbilyr8QjoZZoBNdbOYaMITZwjKSpb3+tBdwmX8I1BJO13fmbvhJywXQ0LzDYqFt4wm05YTD/CTfZvIfdrMz+abvNd0fOIT0G5eGg+ffDOCPZSOxUCtQJ5Pk6Pp9/WUsMgqtHYniwMlts+EofzkpIw9AMcLXLaVDdjO8ItaIpkBEHeRfY4E9a8RXtII8ryIe+Kc/DpnPxli9YgngsAacgb0sPw+SfQ6EhK+JJ2vzNr2KLur/X2UuB+hjleNkIArvMXTSUV2w/w09kYzF9KzjW7jM3myB15EmGEuRJyq+Ipit/FLlwidZA9tNfLtFasNQQuJRO3gYBonL/t4Fa8V1yREycjrIZdLxKf9AWozKzzyu4iu7WSd
x-ms-exchange-antispam-messagedata: TTvY70DYDQ7jBSXvSMhHYHoNiqHsLSXEYSFXELJmzTd7PcjalPwUH+v2z0XL7UkTkY1jxEP5iB/NDUcDRhAoDsR2j9e1CLI14eGU62Y3mIfDnkus0tqe02/K8+mvM9QDm4tqqzxqD8t0LlOmJJM9og==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0382b7c3-6a3c-4355-4cad-08d7ab50a7ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2020 22:05:19.8266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mH2645N//jIobiWvbF/TsSmdqlVR2s+Y8YPAEaMynyfJuQ1DbwZQzYdiaZzgD3bpqZ5sfoTasZEo2b63uNlbDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6432
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm95IFBsZWRnZSAoT1NT
KSA8cm95LnBsZWRnZUBvc3MubnhwLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDYs
IDIwMjAgMjo0MCBQTQ0KPiBUbzogWW91cmkgUXVlcnJ5IDx5b3VyaS5xdWVycnlfMUBueHAuY29t
PjsgUm95IFBsZWRnZQ0KPiA8cm95LnBsZWRnZUBueHAuY29tPjsgTGVvIExpIDxsZW95YW5nLmxp
QG54cC5jb20+OyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXhwcGMtZGV2
QGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmc7IElvYW5hIENpb3JuZWkgPGlvYW5hLmNpb3JuZWlAbnhwLmNvbT47DQo+IEFsZXhhbmRydSBN
YXJnaW5lYW4gPGFsZXhhbmRydS5tYXJnaW5lYW5AbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAwLzNdIHNvYzogZnNsOiBkcGlvOiBFbmFibGUgUU1BTiBiYXRjaCBlbnF1ZXVpbmcNCj4g
DQo+IE9uIDEyLzEyLzIwMTkgMTI6MDEgUE0sIFlvdXJpIFF1ZXJyeSB3cm90ZToNCj4gPiBUaGlz
IHBhdGNoIHNldCBjb25zaXN0cyBvZjoNCj4gPiAtIFdlIGFkZGVkIGFuIGludGVyZmFjZSB0byBl
bnF1ZXVlIHNldmVyYWwgcGFja2V0cyBhdCBhIHRpbWUgYW5kDQo+ID4gICAgaW1wcm92ZSBwZXJm
b3JtYW5jZS4NCj4gPiAtIE1ha2UgdGhlIGFsZ29yaXRobSBkZWNpc2lvbnMgb25jZSBhdCBpbml0
aWFsaXphdGlvbiBhbmQgdXNlDQo+ID4gICAgZnVuY3Rpb24gcG9pbnRlcnMgdG8gaW1wcm92ZSBw
ZXJmb3JtYW5jZS4NCj4gPiAtIFJlcGxhY2VkIHRoZSBRTUFOIGVucXVldWUgYXJyYXkgbW9kZSBh
bGdvcml0aG0gd2l0aCBhIHJpbmcNCj4gPiAgICBtb2RlIGFsZ29yaXRobS4gVGhpcyBpcyB0byBt
YWtlIHRoZSBlbnF1ZXVlIG9mIHNldmVyYWwgZnJhbWVzDQo+ID4gICAgYXQgYSB0aW1lIG1vcmUg
ZWZmZWN0aXZlLg0KPiA+DQo+ID4gWW91cmkgUXVlcnJ5ICgzKToNCj4gPiAgICBzb2M6IGZzbDog
ZHBpbzogQWRkaW5nIFFNQU4gbXVsdGlwbGUgZW5xdWV1ZSBpbnRlcmZhY2UuDQo+ID4gICAgc29j
OiBmc2w6IGRwaW86IFFNQU4gcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQuIEZ1bmN0aW9uIHBvaW50
ZXINCj4gPiAgICAgIGluZGlyZWN0aW9uLg0KPiA+ICAgIHNvYzogZnNsOiBkcGlvOiBSZXBsYWNl
IFFNQU4gYXJyYXkgbW9kZSBieSByaW5nIG1vZGUgZW5xdWV1ZS4NCj4gPg0KPiA+ICAgZHJpdmVy
cy9zb2MvZnNsL2RwaW8vZHBpby1zZXJ2aWNlLmMgfCAgNjkgKysrLQ0KPiA+ICAgZHJpdmVycy9z
b2MvZnNsL2RwaW8vcWJtYW4tcG9ydGFsLmMgfCA3NjYNCj4gKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tDQo+ID4gICBkcml2ZXJzL3NvYy9mc2wvZHBpby9xYm1hbi1wb3J0YWwu
aCB8IDE1OCArKysrKysrLQ0KPiA+ICAgaW5jbHVkZS9zb2MvZnNsL2RwYWEyLWlvLmggICAgICAg
ICAgfCAgIDYgKy0NCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgOTA3IGluc2VydGlvbnMoKyksIDky
IGRlbGV0aW9ucygtKQ0KPiA+DQo+IEFja2VkLWJ5OiBSb3kgUGxlZGdlIDxyb3kucGxlZGdlQG54
cC5jb20+DQo+IA0KPiBMZW8gLSBjYW4geW91IGxvb2sgYXQgdGhpcyBzZXJpZXMgc28gd2UgY2Fu
IGdldCBpdCBpbnRlZ3JhdGVkPyBUaGFua3MNCg0KU3VyZS4gIFRoYW5rcyBmb3IgdGhlIHJldmll
dy4gIEkgd2lsbCBxdWV1ZSB0aGVtIHVwIGZvciB2NS43Lg0KDQpSZWdhcmRzLA0KTGVvDQo=
