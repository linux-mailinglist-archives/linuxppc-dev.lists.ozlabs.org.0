Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E92714F6F4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Feb 2020 07:57:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488lJT6F52zDqjQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Feb 2020 17:57:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=live.se
 (client-ip=40.92.69.46; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=baratija@live.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=live.se
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092069046.outbound.protection.outlook.com [40.92.69.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488hrd0pC9zDqfG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2020 16:06:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHYl1xUrDMKMh5flufigQy2JTuNqPNaOUGD9268fHcY0+E5UM5EA+8pL1CvsrGZQGg3AQZUagxVIoAiAJqZnM67NEhpI3+RyVo9FtyvFWxXbZFX1kCNLyZ0j01WMC7uPynZIM/KDtAtPkVxtl5/IH2Qh+4bwrysjyzVf1GPWkVpqNqwtiWJYWmAXBdstpOZo7+Np86nLQj3bpKK5JK4YQiw3ENlL9+pI/S3ph9Q4gHHMqSwV7G05wTlrvsyHQ5lqTFAU7S5SqvufIWY1Kv2aDtYiRF+7JQNLDtOs89Os6eyUIX1LhQh9irspGXJIgJe0Eil+tjQ3uOO8npnMY2GJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRczRqQTfG7ksATBQy4eudF0CxVxOLGYE9pepmE5jw4=;
 b=LM2hYF5/twD/nU1XOvtuqK03Chn1qlbZ+Z6ttSMTG5zp23gr6j09fgO0SlACwfJFsMKMv2HYpcuYMSMXhBZklvDnSslIDC3ZqhgehrWy92zM3UY9mbAKt4DqnhLPVCdie2FKtcZnr0/8Gy97/mxYJurnqjZwI6196/jWTV/CiH/x/AF5KSmBNufbZPw7tlf2BC8AV6Kkir2plG4giMMp1VaPnmzvosevQ8T1qWsvqm8Hbz6AlmirbVtd+Smq7msTzEOa43IyBSsnwZQNiycIdPLB6fZJNdpOtMPN3/7NM8iKpO5az5UIF2EyXcfiQT7BQZAqQKwtHTdlpG/JnPFVUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR02FT015.eop-EUR02.prod.protection.outlook.com
 (10.152.12.55) by VE1EUR02HT232.eop-EUR02.prod.protection.outlook.com
 (10.152.13.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.25; Sat, 1 Feb
 2020 05:06:17 +0000
Received: from HE1PR0901MB1419.eurprd09.prod.outlook.com (10.152.12.52) by
 VE1EUR02FT015.mail.protection.outlook.com (10.152.12.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.25 via Frontend Transport; Sat, 1 Feb 2020 05:06:17 +0000
Received: from HE1PR0901MB1419.eurprd09.prod.outlook.com
 ([fe80::8c0:2dc9:34cc:1dd7]) by HE1PR0901MB1419.eurprd09.prod.outlook.com
 ([fe80::8c0:2dc9:34cc:1dd7%3]) with mapi id 15.20.2686.028; Sat, 1 Feb 2020
 05:06:16 +0000
From: reinaldo rojas <baratija@live.se>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] drivers: char: hvc: add arm JTAG DCC console support
Thread-Topic: [PATCH] drivers: char: hvc: add arm JTAG DCC console support
Thread-Index: AQHV2L1U7z1P7kNZQ0OSge2TjSxcFQ==
Date: Sat, 1 Feb 2020 05:06:16 +0000
Message-ID: <HE1PR0901MB1419AA1D7967B7A2F6F5DF65D2060@HE1PR0901MB1419.eurprd09.prod.outlook.com>
Accept-Language: es-MX, en-US
Content-Language: es-MX
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:00CEEC9D9987AEE7DB0368281D850EC6DEE08955E263E80D7CEF846F924C8B16;
 UpperCasedChecksum:E3983C796355E8B0FCFFA154A376AB85D2E9212244352AE32F41E284EDD6C58E;
 SizeAsReceived:6794; Count:43
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [yslNJbwKFY5uK55hG6lOZwDm43AMeYpl]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 98bfe604-f194-4142-5950-08d7a6d47780
x-ms-traffictypediagnostic: VE1EUR02HT232:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1U6TcDIr08o/RGSz5A6xGVj01VimebWvSnk9nXGsZMVr+QElpfvaNI5pTK9ORSX4qk7s7LvndbiKKW5l873flVR5Nt3/B8CUcTK9o/24BnNruarPULweUXHhgO7aGZ/mmwzlumYoNrk3StGE5JYyo5ahgAXfKXe6XLZZ5vlf2EItFhxTAMG67Y+n+94JtGW6
x-ms-exchange-antispam-messagedata: eHPmbG4X6jKIWjdPID5ti7IqjGsBCbfhxGieho/8U9Mg2V9ZA5ZwOz/gEibOgnYTzxRKqg2UJQAiHkcbuZP3CP+rw0iIqAss3snerUbUOFnLrt+s3znqvRNNUTXH7syxIKHaXfBNxD7LACkyOp0Q3w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6745A739B4BD9D4B82093F0597827FD7@sct-15-20-2387-20-msonline-outlook-5b7ca.templateTenant>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bfe604-f194-4142-5950-08d7a6d47780
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2020 05:06:16.3032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT232
X-Mailman-Approved-At: Sat, 01 Feb 2020 17:55:53 +1100
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



Enviado desde mi iPad
