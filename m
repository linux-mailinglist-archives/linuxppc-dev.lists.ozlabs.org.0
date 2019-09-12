Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AADCB0ECB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 14:21:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TdDH1Q3RzF4MQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 22:21:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=synopsys.com
 (client-ip=198.182.47.102; helo=smtprelay-out1.synopsys.com;
 envelope-from=gustavo.pimentel@synopsys.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=synopsys.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="V5jvA56Y";
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=synopsys.onmicrosoft.com
 header.i=@synopsys.onmicrosoft.com header.b="E3Lqhr4V"; 
 dkim-atps=neutral
X-Greylist: delayed 527 seconds by postgrey-1.36 at bilbo;
 Thu, 12 Sep 2019 21:33:06 AEST
Received: from smtprelay-out1.synopsys.com (unknown [198.182.47.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Tc8L18H8zF48t
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 21:33:03 +1000 (AEST)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BB48AC1DBF;
 Thu, 12 Sep 2019 11:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1568287453; bh=qmE+PSGt3DTgcRqhZ/8UmzmCeE9CVyoIijZi+QF8HW8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=V5jvA56Yh9HKHQFufzlU7MOyI+FPrUvvibT1ki4dZPWb1+iOQLNmetRvZ9viPLjvF
 YYPzuNP9dvGlPlv9pmw5Qgd84nUEyZSFLJhZLg8yFk+4+3keZOTw/JAUP5zuL5paoB
 LmuGwxduCfNRz0EJo+gWkiTrAB/R1QoKkTU2T3/jysV6v/8XuEYJgMzk54A2XbZ5S4
 G5oRV4OpS6zv4XK5Mf5OX+iwPzF6JKwXoG2/JBp4eB6chM6UmjZeaHMmTnjmBE80Dw
 MV2UQAAvSfvAHew29bylftm0MKURCSTOkc704Oz0Sy2ILiWYlpxXMT0CRkeA+2wopy
 m2cm2DxuDsEUg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C915AA0083;
 Thu, 12 Sep 2019 11:24:05 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 12 Sep 2019 04:24:05 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 12 Sep 2019 04:24:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7IZPgUmBumpGh85QtZvrnhUgOnMJQx4LFlbO8lCxqrc8W0W2eQGB2UkFU/EYTVIjadx6VwAeVawF7OXB8nOoY3laEm/sSQGvxR3XaKAJv1Tm+bwmYjbfcVVFVQCFBeE27dBUjl9wahSrRoHnvCVThy9JLlMiqvSeNB+y23bulkaKo6n8OXFTw359Cq3MSJ2D9K6RlkEfg3Ii9ESU5qWHkbUeqVW8LLNr0IhbwaCXtSn3Ojy1pV0oWayOONe07GaZ5X0ye4LCwrB0BdvPLxccdGYjKJwA0zmqly1PIJtXpo1r1Pa1rQHQVXAnM/guoB72vZUrDiTwXvx0XkN9KmgtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmE+PSGt3DTgcRqhZ/8UmzmCeE9CVyoIijZi+QF8HW8=;
 b=N8iZYYpeQHiAvy6aiwP2CGZ7Tp+GNVgfYXMdEc1e99Q3FiPMkW0cPlrugyK/8Bbc10XylXRsuz/QJxVGEkfLHWcUlHFR/9Z4TMRpSKv46Jlfss3g+Z8C44llJjjx9o9p8U/vCuQpkeqvRGzavoIDRy01LrEBimgx9KoNwjAw0hEDWnUlvlPaOqPzYtG6J29jqjqRm4fPTXzu+P1HUhnH/1N9J2HNIgAWXLhJLGx+mBXMfpAJ8woe6Au3bLtvTWWJcV1Pc1Yf9Vdh6PqG2+xhnSzeCLOM2Xg2N5ZGiFb3EHpI0gFpmQxaL6kbmsXxbkK5zPn+Mrzen02v+gFpU6XnOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmE+PSGt3DTgcRqhZ/8UmzmCeE9CVyoIijZi+QF8HW8=;
 b=E3Lqhr4VapLL4xNZtFOfvgHDDF8c2QBZdG5hYLqI0stdRGiCAq2LNxRpm0P5LLt/YJfMxaMoVYzgfixNtvdZTfXbwraaOHMS29Bcyrnj42m0z9/R46xlf/CgDV455I/UR6r5plVGwKJnhklOyWfau92C7kQpPq0VRt65ad5OtJc=
Received: from DM6PR12MB4010.namprd12.prod.outlook.com (10.255.175.83) by
 DM6PR12MB3770.namprd12.prod.outlook.com (10.255.172.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Thu, 12 Sep 2019 11:24:04 +0000
Received: from DM6PR12MB4010.namprd12.prod.outlook.com
 ([fe80::dd4:2e5:e564:8684]) by DM6PR12MB4010.namprd12.prod.outlook.com
 ([fe80::dd4:2e5:e564:8684%5]) with mapi id 15.20.2263.016; Thu, 12 Sep 2019
 11:24:04 +0000
From: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
To: Andrew Murray <andrew.murray@arm.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: RE: [PATCH v3 08/11] PCI: layerscape: Modify the MSIX to the doorbell
 mode
Thread-Topic: [PATCH v3 08/11] PCI: layerscape: Modify the MSIX to the
 doorbell mode
Thread-Index: AQHVYT543jPAb7yXCk62zpUsNvGAlacYSeeAgA+pUvA=
Date: Thu, 12 Sep 2019 11:24:03 +0000
Message-ID: <DM6PR12MB40100CC1C0E64040652C3BFBDAB00@DM6PR12MB4010.namprd12.prod.outlook.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-9-xiaowei.bao@nxp.com>
 <20190902120147.GH9720@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190902120147.GH9720@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jWjNWemRHRjJiMXhoY0hCa1lYUmhYSEp2WVcxcGJtZGNNRGxrT0RRNVlq?=
 =?utf-8?B?WXRNekprTXkwMFlUUXdMVGcxWldVdE5tSTROR0poTWpsbE16VmlYRzF6WjNO?=
 =?utf-8?B?Y2JYTm5MV1F3T1RNNU1UWXhMV1ExTkdZdE1URmxPUzA1T0RobUxXWTRPVFJq?=
 =?utf-8?B?TWpjek9EQTBNbHhoYldVdGRHVnpkRnhrTURrek9URTJNaTFrTlRSbUxURXha?=
 =?utf-8?B?VGt0T1RnNFppMW1PRGswWXpJM016Z3dOREppYjJSNUxuUjRkQ0lnYzNvOUlq?=
 =?utf-8?B?STBOVGNpSUhROUlqRXpNakV5TnpZeE1EUXdPVGcxTVRZd01DSWdhRDBpVFRs?=
 =?utf-8?B?WFRTdGlZMkV6V0dwMmVHcENNWE5NTDAxeVRrbHVUVUpOUFNJZ2FXUTlJaUln?=
 =?utf-8?B?WW13OUlqQWlJR0p2UFNJeElpQmphVDBpWTBGQlFVRkZVa2hWTVZKVFVsVkdU?=
 =?utf-8?B?a05uVlVGQlFsRktRVUZFVVVkdlExUllSMjVXUVdaeVYyZGxVRmxoYW1GTEsz?=
 =?utf-8?B?UmhRalE1YUhGT2IyOVBRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVaEJRVUZCUTJ0RFFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVWQlFWRkJRa0ZCUVVFdlNHOXphVkZCUVVGQlFVRkJRVUZCUVVGQlFVRktO?=
 =?utf-8?B?RUZCUVVKdFFVZHJRV0puUW1oQlJ6UkJXWGRDYkVGR09FRmpRVUp6UVVkRlFX?=
 =?utf-8?B?Sm5RblZCUjJ0QlltZENia0ZHT0VGa2QwSm9RVWhSUVZwUlFubEJSekJCV1ZG?=
 =?utf-8?B?Q2VVRkhjMEZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUlVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?blFVRkJRVUZCYm1kQlFVRkhXVUZpZDBJeFFVYzBRVnBCUW5sQlNHdEJXSGRD?=
 =?utf-8?B?ZDBGSFJVRmpaMEl3UVVjMFFWcFJRbmxCU0UxQldIZENia0ZIV1VGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFWRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkRRVUZCUVVGQlEyVkJRVUZCV21kQ2RrRklWVUZpWjBKclFV?=
 =?utf-8?B?aEpRV1ZSUW1aQlNFRkJXVkZDZVVGSVVVRmlaMEpzUVVoSlFXTjNRbVpCU0Ux?=
 =?utf-8?B?QldWRkNkRUZJVFVGa1VVSjFRVWRqUVZoM1FtcEJSemhCWW1kQ2JVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUpCUVVGQlFVRkJRVUZCU1VGQlFVRkJRVW8wUVVGQlFtMUJSemhC?=
 =?utf-8?B?WkZGQ2RVRkhVVUZqWjBJMVFVWTRRV05CUW1oQlNFbEJaRUZDZFVGSFZVRmpa?=
 =?utf-8?B?MEo2UVVZNFFXTjNRbWhCUnpCQlkzZENNVUZITkVGYWQwSm1RVWhKUVZwUlFu?=
 =?utf-8?B?cEJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGRlFVRkJRVUZCUVVGQlFXZEJRVUZCUVVGdVow?=
 =?utf-8?B?RkJRVWRaUVdKM1FqRkJSelJCV2tGQ2VVRklhMEZZZDBKM1FVZEZRV05uUWpC?=
 =?utf-8?B?QlJ6UkJXbEZDZVVGSVRVRllkMEo2UVVjd1FXRlJRbXBCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJVVUZCUVVGQlFVRkJRVU5C?=
 =?utf-8?B?UVVGQlFVRkRaVUZCUVVGYVowSjJRVWhWUVdKblFtdEJTRWxCWlZGQ1prRklR?=
 =?utf-8?B?VUZaVVVKNVFVaFJRV0puUW14QlNFbEJZM2RDWmtGSVRVRmtRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUWtGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGSlFVRkJRVUZCU2pSQlFVRkNiVUZIT0VGa1VVSjFRVWRSUVdO?=
 =?utf-8?B?blFqVkJSamhCWTBGQ2FFRklTVUZrUVVKMVFVZFZRV05uUW5wQlJqaEJaRUZD?=
 =?utf-8?B?ZWtGSE1FRlpkMEZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVVkJRVUZCUVVGQlFVRkJaMEZCUVVGQlFXNW5RVUZCUjFsQlluZENN?=
 =?utf-8?B?VUZITkVGYVFVSjVRVWhyUVZoM1FuZEJSMFZCWTJkQ01FRkhORUZhVVVKNVFV?=
 =?utf-8?B?aE5RVmgzUWpGQlJ6QkJXWGRCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZSUVVGQlFVRkJRVUZCUTBGQlFVRkJRVU5sUVVG?=
 =?utf-8?B?QlFWcDNRakJCU0UxQldIZENkMEZJU1VGaWQwSnJRVWhWUVZsM1FqQkJSamhC?=
 =?utf-8?B?WkVGQ2VVRkhSVUZoVVVKMVFVZHJRV0puUW01QlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQ1FVRkJRVUZCUVVGQlFVbEJR?=
 =?utf-8?B?VUZCUVVGS05FRkJRVUo2UVVkRlFXSkJRbXhCU0UxQldIZENhRUZIVFVGWmQw?=
 =?utf-8?B?SjJRVWhWUVdKblFqQkJSamhCWTBGQ2MwRkhSVUZpWjBGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJSVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZuUVVGQlFVRkJibWRCUVVGSVRVRlpVVUp6UVVkVlFXTjNRbVpC?=
 =?utf-8?B?U0VWQlpGRkNka0ZJVVVGYVVVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVZGQlFVRkJRVUZCUVVGRFFVRkJRVUZCUTJWQlFVRkJZM2RDZFVGSVFV?=
 =?utf-8?B?RmpkMEptUVVkM1FXRlJRbXBCUjFWQlltZENla0ZIVlVGWWQwSXdRVWRWUVdO?=
 =?utf-8?B?blFuUkJSamhCVFZGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVSkJRVUZCUVVGQlFVRkJTVUZCUVVGQlFVbzBRVUZC?=
 =?utf-8?B?UW5wQlJ6UkJZMEZDZWtGR09FRmlRVUp3UVVkTlFWcFJRblZCU0UxQldsRkNa?=
 =?utf-8?B?a0ZJVVVGYVVVSjVRVWN3UVZoM1FucEJTRkZCWkZGQ2EwRkhWVUZpWjBJd1FV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZGUVVGQlFVRkJRVUZCUVdkQlFV?=
 =?utf-8?B?RkJRVUZ1WjBGQlFVaFpRVnAzUW1aQlIzTkJXbEZDTlVGSVkwRmlkMEo1UVVk?=
 =?utf-8?B?UlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlVVRkJRVUZC?=
 =?utf-8?Q?QUFBQUNBQUFBQUFBPSIvPjwvbWV0YT4=3D?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gustavo@synopsys.com; 
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9cb69658-5065-4a41-51ad-08d73773b7d7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR12MB3770; 
x-ms-traffictypediagnostic: DM6PR12MB3770:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB377099ABA908F9DE7EC79A91DAB00@DM6PR12MB3770.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(39850400004)(346002)(376002)(189003)(199004)(64756008)(110136005)(7736002)(54906003)(71190400001)(33656002)(5660300002)(478600001)(14454004)(256004)(53546011)(14444005)(4326008)(6506007)(229853002)(71200400001)(25786009)(81156014)(8676002)(81166006)(486006)(53936002)(74316002)(305945005)(26005)(86362001)(55016002)(66476007)(11346002)(476003)(3846002)(9686003)(66946007)(66446008)(7696005)(186003)(76176011)(2906002)(76116006)(6116002)(66066001)(8936002)(66556008)(6246003)(316002)(52536014)(6436002)(446003)(102836004)(7416002)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR12MB3770;
 H:DM6PR12MB4010.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0BuIHlVe3qaDfEDRIzSkaEEzGni7ptwuARVi/Xdpkpf7inBDLr3w/YuGHXQQ3UTdddUz/oVmYEoVD5iDjGIDEjU9yGZD6Jy88nH1XZcc2ia4wCdKTNwpDduC9RC6EbLA6O7B8SwNmgvmDdolnO/Dm1+yffe+mL6QZd1hOmT6cJOLwj1h713gfq+n4c9/Anv/08eH8XGTs4yB8Ci9HM+rzMagyK8r8fQZLdZt8nd1emT5s2Oop/hjGJHAOfGu7u4B/VQg/1wyX+7GYyCG79abJbfSWNhlldxUmMU1qz7khYcoEUrsnlOXteCMr2miOVE+rtOLKAgxB7f5EQLnUebYm8cl50Jeqlua7f2C3a3JIlE9vkwjeRfvjum0GNxdbjzdUmKDbzq+5zd1LWfYJz6RpnJfpzXJ2/afaOj+aWLopg4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb69658-5065-4a41-51ad-08d73773b7d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 11:24:03.9084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2g0LMgFgeiwdT+mDzUGRMvwruXyvKdguD04t2GdPAK9hayJ/2X3naYkH294WwWS51nsn5Hztec0PhuyvkDXbLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3770
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Thu, 12 Sep 2019 22:19:00 +1000
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "roy.zang@nxp.com" <roy.zang@nxp.com>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "zhiqiang.hou@nxp.com" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>,
 "minghuan.Lian@nxp.com" <minghuan.Lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <Gustavo.Pimentel@synopsys.com>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "mingkai.hu@nxp.com" <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNClNvcnJ5IGZvciB0aGUgZGVsYXkgSSB3YXMgaW4gcGFyZW50YWwgbGVhdmUgYW5kIEkn
bSBzdGlsbCB0cnlpbmcgbm90IHRvIA0KZHJvd24gaW4gdGhlIG1haWxpbmcgbGlzdCBlbWFpbHMu
Li4g8J+Yig0KDQpPbiBNb24sIFNlcCAyLCAyMDE5IGF0IDEzOjE6NDcsIEFuZHJldyBNdXJyYXkg
PGFuZHJldy5tdXJyYXlAYXJtLmNvbT4gDQp3cm90ZToNCg0KPiBPbiBNb24sIFNlcCAwMiwgMjAx
OSBhdCAxMToxNzoxM0FNICswODAwLCBYaWFvd2VpIEJhbyB3cm90ZToNCj4gPiBkd19wY2llX2Vw
X3JhaXNlX21zaXhfaXJxIHdhcyBuZXZlciBjYWxsZWQgaW4gdGhlIGV4aXNpdG5nIGRyaXZlcg0K
PiA+IGJlZm9yZSwgYmVjYXVzZSB0aGUgbHMxMDQ2YSBwbGF0Zm9ybSBkb24ndCBzdXBwb3J0IHRo
ZSBNU0lYIGZlYXR1cmUNCj4gPiBhbmQgbXNpeF9jYXBhYmxlIHdhcyBhbHdheXMgc2V0IHRvIGZh
bHNlLg0KPiA+IE5vdyB0aGF0IGFkZCB0aGUgbHMxMDg4YSBwbGF0Zm9ybSB3aXRoIE1TSVggc3Vw
cG9ydCwgYnV0IHRoZSBleGlzdGluZw0KPiA+IGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnEgZG9l
c24ndCB3b3JrLCBzbyB1c2UgdGhlIGRvb3JiZWxsIG1ldGhvZCB0bw0KPiA+IHN1cHBvcnQgdGhl
IE1TSVggZmVhdHVyZS4NCg0KSHVtLi4uIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBtc2l4IGltcGxl
bWVudGF0aW9uIGRpZCB3b3JrIG9uIG15IHVzZSBjYXNlLCANCmhvd2V2ZXIsIGF0IHRoZSB0aW1l
IHRoZSBzZXR1cCB1c2VkIGZvciBkZXZlbG9waW5nIGFuZCB0ZXN0aW5nIHRoZSANCmltcGxlbWVu
dGF0aW9uIG9ubHkgaGFkIG9uZSBQRiAoYnkgZGVmYXVsdCAwKS4gUGVyaGFwcyB0aGlzIGNvdWxk
IHdhcyBpcyANCmNhdXNpbmcgdGhlIGRpZmZlcmVudCBiZWhhdmlvciBiZXR3ZWVuIG91ciBzZXR1
cHMuDQoNCllvdSBoYXZlIG1vcmUgdGhhbiBvbmUgUEYsIHJpZ2h0Pw0KDQpJZiBJIHJlbWVtYmVy
IGNvcnJlY3RseSwgbXNpeCBmZWF0dXJlIHN1cHBvcnQgZW50ZXJlZCBvbiBrZXJuZWwgNC4xOSAN
CnZlcnNpb24gYW5kIGl0IHdvcmtlZCBxdWl0ZSB3ZWxsIGF0IHRoZSB0aW1lLCBidXQgSSBkaWRu
J3QgdGVzdCBzaW5jZSANCnRoZXJlIChJJ3ZlIHRvIG1hbmFnZSB0aW1lIHRvIGJlIGFibGUgdG8g
cmV0ZXN0IGl0IGFnYWluKSwgSSdtIGRpZG4ndCANCnNlZW4gYW55IHBhdGNoIHRoYXQgY291bGQg
aW50ZXJmZXJlIHdpdGggdGhpcy4NCg0KUmVnYXJkcywNCkd1c3Rhdm8NCg0KDQo+ID4gDQo+ID4g
U2lnbmVkLW9mZi1ieTogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+DQo+IA0KPiBS
ZXZpZXdlZC1ieTogQW5kcmV3IE11cnJheSA8YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiANCj4g
PiAtLS0NCj4gPiB2MjogDQo+ID4gIC0gTm8gY2hhbmdlDQo+ID4gdjM6DQo+ID4gIC0gTW9kaWZ5
IHRoZSBjb21taXQgbWVzc2FnZSBtYWtlIGl0IGNsZWFybHkuDQo+ID4gDQo+ID4gIGRyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMgfCAzICsrLQ0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMg
Yi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gaW5k
ZXggMWUwNzI4Ny4uNWYwY2I5OSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gKysrIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+IEBAIC03OSw3ICs3OSw4IEBAIHN0YXRp
YyBpbnQgbHNfcGNpZV9lcF9yYWlzZV9pcnEoc3RydWN0IGR3X3BjaWVfZXAgKmVwLCB1OCBmdW5j
X25vLA0KPiA+ICAJY2FzZSBQQ0lfRVBDX0lSUV9NU0k6DQo+ID4gIAkJcmV0dXJuIGR3X3BjaWVf
ZXBfcmFpc2VfbXNpX2lycShlcCwgZnVuY19ubywgaW50ZXJydXB0X251bSk7DQo+ID4gIAljYXNl
IFBDSV9FUENfSVJRX01TSVg6DQo+ID4gLQkJcmV0dXJuIGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9p
cnEoZXAsIGZ1bmNfbm8sIGludGVycnVwdF9udW0pOw0KPiA+ICsJCXJldHVybiBkd19wY2llX2Vw
X3JhaXNlX21zaXhfaXJxX2Rvb3JiZWxsKGVwLCBmdW5jX25vLA0KPiA+ICsJCQkJCQkJICBpbnRl
cnJ1cHRfbnVtKTsNCj4gPiAgCWRlZmF1bHQ6DQo+ID4gIAkJZGV2X2VycihwY2ktPmRldiwgIlVO
S05PV04gSVJRIHR5cGVcbiIpOw0KPiA+ICAJCXJldHVybiAtRUlOVkFMOw0KPiA+IC0tIA0KPiA+
IDIuOS41DQo+ID4gDQoNCg0K
