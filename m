Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FE824F5B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 10:52:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZm8f1xhHzDqJs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 18:52:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.237.52;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=EJLFmMRk; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZm5N0CTpzDqQk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Aug 2020 18:49:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j03ZgCfMrzPRF5/mJipXvXWy+neAmqRWPIGiQRgB1K5ZXtFvcH318csUlTxhNLZJYuxaX3PagUhc5GT8o9OEN9O69md4l4gqllwrTWNmDlHv6yGDXG2Lh8y9T9oP0ZWGLdYVloXYKyIpRNE1ZSgE05YOOyE3wlWmz68JA2zct0iui/3xUeXryIqEY8MZANatllsu70zs1rGMDvv+fwaOOJ1Mill7b3oBYgRyDtKQvdk/HPDHjarYzFrQl+OAbuKfAbNkF0taoDctZCmvOF46FvExr+aHRiPOh0FqkIZO0K4/9wdvV+Nkd9N0yIssRin9M3PQUlCygwebdYAdgHbORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTrt4QnTATuTJiebqsrkllOyJxogDghlkm95Sr25XhA=;
 b=IPjTQ/R486YQ6VpE3+iDCpg9UIymoow0Rp0zS0uQRgJ4SNjIhKnFl9eneE31BHRx6uWlLH8lp5T6E3moNLKEN6swxNGyfKix8mOxbDHxNYoFBj0egjPCP45TPTECzvKNBtFvHg16vuWZiio37soNHVv9BgUCqrx5KUvLQbiH690j41tN21Km+9JlGuuap1Y4bVpUm9w/ttFMFrXZzV3GCXXun6f9YqGlk4MFHga/G2qXZOKxlyBL9xZopc6CiMt26Iq4QAtLs5j/AyYwfWl7OKoCvcKqX4tcVFv9R8KKLxVKu7Y1CF6XfLFOjFbt/sZWt0mF739fjpYLpnei8ue3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTrt4QnTATuTJiebqsrkllOyJxogDghlkm95Sr25XhA=;
 b=EJLFmMRkMPFtidX5sZvgCgvnnrxUlPX0grucokGTBYL7VJ5eIqxiOmCKQUxH3ijwVARuUIJqwon81FIL3vrOwk55Uc4NRVOZggVOwfdNU7oqUk6n8UdfkzeTP9c9OV7CYeLjX+mcl1q8/nILRmX4B/2BHqV4p022y+71IogIwwI=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR1001MB2312.namprd10.prod.outlook.com
 (2603:10b6:910:49::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Mon, 24 Aug
 2020 08:49:19 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::7c3b:e8e3:3d1b:284d]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::7c3b:e8e3:3d1b:284d%7]) with mapi id 15.20.3283.024; Mon, 24 Aug 2020
 08:49:19 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "yebin10@huawei.com" <yebin10@huawei.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: gadget: fsl: Fix unsigned expression compared with
 zero in fsl_udc_probe
Thread-Topic: [PATCH] usb: gadget: fsl: Fix unsigned expression compared with
 zero in fsl_udc_probe
Thread-Index: AQHWee+zZeLUHMNpPkKw58UdehD37KlG8waA
Date: Mon, 24 Aug 2020 08:49:18 +0000
Message-ID: <f61f4bc3916f852799edb6af9740afb2118ec84f.camel@infinera.com>
References: <20200824080437.229826-1-yebin10@huawei.com>
 <20200824082122.GA336539@kroah.com>
In-Reply-To: <20200824082122.GA336539@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.37.90 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aff5f45a-306f-4dd1-7b00-08d8480a96d1
x-ms-traffictypediagnostic: CY4PR1001MB2312:
x-microsoft-antispam-prvs: <CY4PR1001MB2312D39A0EA6056E3725B2E5F4560@CY4PR1001MB2312.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OJbsPBaFt/8xKoBASEaOwKfoTv1kW7efqgrc4yUFFZkuDzo9nqprX8MbW/FWMd9M772cjQbQVF1KLtOXaY7F2AKE/1Ol5aHfIIsOYLLIBZptq9pQ3onyso1mYCQfqBGveSZRwDl7Vlv11qKnTj669mFiwjA1MsoD5A6daL0g2cuZZ+B8EBImviau3hzDPPPObO6UHdsFveU9gbI6aBSc6vKNr8CQCoWxv9SRgywrZYRQtcyKHc81NoJ/ldtNoNR6BzaCePVz3c9Sam6OLRLZxedQUQumVX245xNPEGf0+uWzbg1RwJFMvWe6ENuV649z
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39850400004)(186003)(6512007)(2616005)(26005)(8676002)(6506007)(316002)(66446008)(86362001)(6486002)(8936002)(4326008)(66556008)(66476007)(110136005)(64756008)(71200400001)(4744005)(5660300002)(91956017)(76116006)(54906003)(66946007)(478600001)(36756003)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: D6BSCoc7RQRICFA2/0MQiUruQCvlYmQQzaDTvjX/+/ooJohzYepQ5sF6Ar9BU+Shy2D2bP74L8YcNNwUMSlTq8+H4CJSA/0dWGUL0aQl7JNLGBfOv72or1yofU3NRFPh8diukUxlAcNthda9RGFiYLXbtQaCK4lSg4N6D83AItvjoixWNTLieF5z9+R7Wh+VHhawCWI2YbTfYWxa07yLi19vmfjz00EEvOTBQvmMiqQ7yC78pompMMDVyvfFxOyc26D8IXYE4BqF0xrB7JIQ8g1pQOUuUXs0ywKztGiUd0SK1GqSbivIjSXwg7P3Zb/0/tXaeKJ5CmkBMVEvcSRhCmdcKwRp8QDWhR2H95SPiidn2Jm8XKQbKupdAun8yujDO7Ig2KlKilGCntNwwzGQ8GZnh5sVjgJBAP8EAkPnd62YEdnU4H8Y1BRXBbBDBfn/igHkga4uWeHOd/PAW1x+A9U66+RK4dN4BZgInDBAe6RqKJmvTovelNZWCQpfd6YbtCzc0hu/fuDiFqFwhjIr6Z/hOKoj9Jw8BXPoMXp5f5eEFX15ZrOPLiOFch+3s8lKtE+78ST1k3zfRm1cbFV8dK0LjmyA2EFaCC0zvTKfbBk9NXLzoJJwCs7pqjw5tacmg+g7a1AVMF6my6U0qg5ppw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7728E8FC8339A4688608D875D04735D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff5f45a-306f-4dd1-7b00-08d8480a96d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 08:49:18.8459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cMfpcdpJv+cnoLNVgDE/AaaxkMkMgZDFg8PSfTn4uDnC9aUBdFZBNqM0dZXL0VCo8Wupt0DUsZEP/liGb7jqeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2312
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
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIwLTA4LTI0IGF0IDEwOjIxICswMjAwLCBHcmVnIEtIIHdyb3RlOg0KPiANCj4g
T24gTW9uLCBBdWcgMjQsIDIwMjAgYXQgMDQ6MDQ6MzdQTSArMDgwMCwgWWUgQmluIHdyb3RlOg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFllIEJpbiA8eWViaW4xMEBodWF3ZWkuY29tPg0KPiANCj4gSSBj
YW4ndCB0YWtlIHBhdGNoZXMgd2l0aG91dCBhbnkgY2hhbmdlbG9nIHRleHQsIHNvcnJ5Lg0KDQpT
dGlsbCB0YWtpbmcgcGF0Y2hlcyBmb3IgZnNsX3VkY19jb3JlLmMgPw0KSSBmaWd1cmVkIHRoaXMg
ZHJpdmVyIHdhcyBvYnNvbGV0ZSBhbmQgc2hvdWxkIGJlIG1vdmVkIHRvIG9uZSBvZiB0aGUgQ2hp
cGlkZWEgZHJpdmVycy4NCg0KIEpvY2tlDQo=
