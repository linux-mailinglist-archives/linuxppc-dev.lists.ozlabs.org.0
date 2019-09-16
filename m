Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44338B3890
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 12:47:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46X2xN6wbyzF4RV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 20:47:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=synopsys.com
 (client-ip=198.182.47.102; helo=smtprelay-out1.synopsys.com;
 envelope-from=gustavo.pimentel@synopsys.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=synopsys.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="NJHOd8mP";
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=synopsys.onmicrosoft.com
 header.i=@synopsys.onmicrosoft.com header.b="MG6MtuID"; 
 dkim-atps=neutral
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.47.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46X0RJ2wL6zF1PF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 18:54:17 +1000 (AEST)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6DFEEC038B;
 Mon, 16 Sep 2019 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1568624053; bh=gX/ZiUImwkBe6cp1SWt5vkl2O0uTfyJ3h/zqySiepuo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=NJHOd8mPaubOatai1pbNTTYHuhacl/wfwQSs0kUABhQ5PBJla/FQT/5R/CGklB3XD
 6L7dxrbqLjQWwaHdYsT8AqQIi0f3Fq4y8uAtXnNTqMYnrhSMrIJX1UTvOSXxjRmAOG
 m6/cKW0+OclgtHR6b69A8B9Kzxn3sUBSs0Yb7isIJ1sXgSSpavhcAelS0K91EC/aOT
 ZwDRFckgb/oqI55sOc1x+oTYD8xswQWZcT1aZlRGRldBZZbbQXuUgw+4neTMf9/6N7
 r4IWeis4TLC2FAB9wOFHXbDiRLdZIA/6D/DZ84KvmLl/GajGOrmhGoB2YGbKJrW6cR
 y8RP/PrtaF4ow==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C4BDDA006F;
 Mon, 16 Sep 2019 08:54:10 +0000 (UTC)
Received: from US01WEHTC2.internal.synopsys.com (10.12.239.237) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 16 Sep 2019 01:54:10 -0700
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 16 Sep 2019 01:54:09 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 16 Sep 2019 01:54:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mo17Ggau8+SH7ZEI32SBvri2Qyu39tuQAysXSIXg+rQ9P4Kd9LUVKicX21eXT5ZpjX2rN83blbyo5vB/q7HU5r4tD0IcwPcqGNuETz9cYxQmdVHJRKDhFEEamUDixfi6bu3UXQpwm9RvYcykjcwwNnfsJt/H0I88pzQRv/SgwdqWOlFt/K68XgZWgYjejrAx7Cn+BY8/1DtGiL4kuU+4T8QpQtvHEN44JClcp2gMvaPaP/AhVekUUQ9FG7EqzS1Ck19pyun82uQZIJkLjdUtNMlJHV3CGK+YXJbWJBbR1KFnZEzcghNjvCSFBnq4Q0WITde4aJO9B3RKKfdhmJ7V7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX/ZiUImwkBe6cp1SWt5vkl2O0uTfyJ3h/zqySiepuo=;
 b=Tg65QFrcI1s0aB/NDF7x/z1EI4yLSID5AhCz7TTPcr7hTA1rEFVR38AsHoTijvWLqMbdtPaqvpiK8qzUBxQIb09wIe4Ux/eIqc7Mm7WKxG0sSvMequ3IKQvKB7pMrQddSiy8Ww94PeXWkmWA49kV5IdockMoGlDxT2nz2/V/A8oJ6VNpkB0yEOfhcZZtrQPbxMoejWy0YS6CzuyOrJKzf22J9mku9IbhGCzA/IH56jc3ABRN/9gkGLzNCHTDy+fyvPOuZSctdTwRQZknNozVGDsf1xCvrES5lnVSjuyNCuFdW0FFwZJqjudcy1qortjKEWZQe3wCUFj+IzHgkORREw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX/ZiUImwkBe6cp1SWt5vkl2O0uTfyJ3h/zqySiepuo=;
 b=MG6MtuIDBNB1lH/nANEYqQpR4OXFxQqHNKxCxDDQwnRvOmQuWiSbJrEgWQSLtYWh5/mVrnEk26jdOfyS+65Qbj9MIx9wmIpKxHhwcxMvrkFUp5b1Rz3Izp/etjuig1jasalMJgwBPny0Mo7LXRvRtLxkNzSfFiCJs+CFY5iqCiM=
Received: from DM6PR12MB4010.namprd12.prod.outlook.com (10.255.175.83) by
 DM6PR12MB3193.namprd12.prod.outlook.com (20.179.105.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.26; Mon, 16 Sep 2019 08:54:08 +0000
Received: from DM6PR12MB4010.namprd12.prod.outlook.com
 ([fe80::dd4:2e5:e564:8684]) by DM6PR12MB4010.namprd12.prod.outlook.com
 ([fe80::dd4:2e5:e564:8684%5]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 08:54:08 +0000
From: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v3 08/11] PCI: layerscape: Modify the MSIX to the doorbell
 mode
Thread-Topic: [PATCH v3 08/11] PCI: layerscape: Modify the MSIX to the
 doorbell mode
Thread-Index: AQHVYT543jPAb7yXCk62zpUsNvGAlacYSeeAgA+pUvCAAtgqAIADSgOA
Date: Mon, 16 Sep 2019 08:54:08 +0000
Message-ID: <DM6PR12MB4010DE94A68B6BA4E132DF8CDA8C0@DM6PR12MB4010.namprd12.prod.outlook.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-9-xiaowei.bao@nxp.com>
 <20190902120147.GH9720@e119886-lin.cambridge.arm.com>
 <DM6PR12MB40100CC1C0E64040652C3BFBDAB00@DM6PR12MB4010.namprd12.prod.outlook.com>
 <AM5PR04MB32994FAF102AD4F760792808F5B20@AM5PR04MB3299.eurprd04.prod.outlook.com>
In-Reply-To: <AM5PR04MB32994FAF102AD4F760792808F5B20@AM5PR04MB3299.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jWjNWemRHRjJiMXhoY0hCa1lYUmhYSEp2WVcxcGJtZGNNRGxrT0RRNVlq?=
 =?utf-8?B?WXRNekprTXkwMFlUUXdMVGcxWldVdE5tSTROR0poTWpsbE16VmlYRzF6WjNO?=
 =?utf-8?B?Y2JYTm5MVGc1TURWbE5qQXdMV1E0TldZdE1URmxPUzA1T0RobUxXWTRPVFJq?=
 =?utf-8?B?TWpjek9EQTBNbHhoYldVdGRHVnpkRnc0T1RBMVpUWXdNaTFrT0RWbUxURXha?=
 =?utf-8?B?VGt0T1RnNFppMW1PRGswWXpJM016Z3dOREppYjJSNUxuUjRkQ0lnYzNvOUlq?=
 =?utf-8?B?TTRNalVpSUhROUlqRXpNakV6TURrM05qUTFNems1T0RjMk1TSWdhRDBpY1ha?=
 =?utf-8?B?aWFFTkZkMFZDYmt4V04zTmxTR05ITWtoS1ZXRktVVTVSUFNJZ2FXUTlJaUln?=
 =?utf-8?B?WW13OUlqQWlJR0p2UFNJeElpQmphVDBpWTBGQlFVRkZVa2hWTVZKVFVsVkdU?=
 =?utf-8?B?a05uVlVGQlFsRktRVUZEY0hWR01VeGlSM3BXUVdaMFZtWnJlVUpyYjFCc0t6?=
 =?utf-8?B?RldLMVJKUjFObksxVlBRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08f044fb-a109-416e-f1f3-08d73a836fae
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3193; 
x-ms-traffictypediagnostic: DM6PR12MB3193:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3193D18CE6DE2A437A165F69DA8C0@DM6PR12MB3193.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(396003)(39860400002)(346002)(136003)(13464003)(189003)(199004)(478600001)(8676002)(74316002)(6436002)(229853002)(53936002)(55016002)(7736002)(305945005)(3846002)(486006)(2906002)(6116002)(6246003)(14444005)(256004)(81166006)(8936002)(446003)(11346002)(476003)(52536014)(25786009)(76116006)(4326008)(186003)(81156014)(9686003)(54906003)(14454004)(71200400001)(71190400001)(110136005)(316002)(66066001)(7696005)(7416002)(86362001)(33656002)(5660300002)(66446008)(64756008)(66556008)(66476007)(26005)(6506007)(76176011)(102836004)(99286004)(53546011)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR12MB3193;
 H:DM6PR12MB4010.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DHZ83GQdSJRyhRRWskdA+P60qn2skFQq/vlc3MH5Am02MhWvmNcUwpJkMGu29iUy92TsPDgvXBLzfpsOYkLvN4YACutV4SI8XFAASraiwXlSwyRVqs+xVeXDz9Bc1H6nXHtYRI9pUYbb5Pih210CVwAuX/r+ERx9GnKB+ainojPlzVEu+XrVzwGfQ/iAgYgrzzO5S/ArhXLRId+7lE5gm3qP9pPprL2Sgk6/XuCINIpFZRU1cVd9E3bwshwCmyAsXQvNgJ+mJJF5aWSt2ssNj14iKJL8Wd5nV5biliZlGEt3ivR+DLL9qF//Wp09I/AEysta1py2pN52qzc/GpuVW15My3nx7J3jnhFpTRJ4+E4WfxQ0QKk8XktXJnSYXJNiUfp23HMoTRwQbX2plsNiZmZvWYqdGuhPR32ylov84ck=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f044fb-a109-416e-f1f3-08d73a836fae
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 08:54:08.3188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a4o19bAPOiW2Jj0Wy4CoDI11WxHXRfZwnq8sZSrR3XdqawgQCxskjiO3MeRbBzl+6Y7RwLTUXqZGWWDWpdRkGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3193
X-OriginatorOrg: synopsys.com
X-Mailman-Approved-At: Mon, 16 Sep 2019 20:45:10 +1000
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Roy Zang <roy.zang@nxp.com>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "Z.q. Hou" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gU2F0LCBTZXAgMTQsIDIwMTkgYXQgNzozNzo1NCwgWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFv
QG54cC5jb20+IHdyb3RlOg0KDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+IEZyb206IEd1c3Rhdm8gUGltZW50ZWwgPEd1c3Rhdm8uUGltZW50ZWxAc3lub3BzeXMu
Y29tPg0KPiA+IFNlbnQ6IDIwMTnlubQ55pyIMTLml6UgMTk6MjQNCj4gPiBUbzogQW5kcmV3IE11
cnJheSA8YW5kcmV3Lm11cnJheUBhcm0uY29tPjsgWGlhb3dlaSBCYW8NCj4gPiA8eGlhb3dlaS5i
YW9AbnhwLmNvbT4NCj4gPiBDYzogcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJt
LmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvDQo+ID4gTGkgPGxlb3lhbmcubGlAbnhwLmNv
bT47IGtpc2hvbkB0aS5jb207IGxvcmVuem8ucGllcmFsaXNpQGFybS5jb207IE0uaC4NCj4gPiBM
aWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+OyBNaW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5j
b20+OyBSb3kNCj4gPiBaYW5nIDxyb3kuemFuZ0BueHAuY29tPjsgamluZ29vaGFuMUBnbWFpbC5j
b207DQo+ID4gZ3VzdGF2by5waW1lbnRlbEBzeW5vcHN5cy5jb207IGxpbnV4LXBjaUB2Z2VyLmtl
cm5lbC5vcmc7DQo+ID4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7DQo+ID4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
OyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsNCj4gPiBhcm5kQGFybmRiLmRlOyBncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZzsgWi5xLiBIb3UNCj4gPiA8emhpcWlhbmcuaG91QG54cC5j
b20+DQo+ID4gU3ViamVjdDogUkU6IFtQQVRDSCB2MyAwOC8xMV0gUENJOiBsYXllcnNjYXBlOiBN
b2RpZnkgdGhlIE1TSVggdG8gdGhlDQo+ID4gZG9vcmJlbGwgbW9kZQ0KPiA+IA0KPiA+IEhpLA0K
PiA+IA0KPiA+IFNvcnJ5IGZvciB0aGUgZGVsYXkgSSB3YXMgaW4gcGFyZW50YWwgbGVhdmUgYW5k
IEknbSBzdGlsbCB0cnlpbmcgbm90IHRvIGRyb3duIGluDQo+ID4gdGhlIG1haWxpbmcgbGlzdCBl
bWFpbHMuLi4g8J+Yig0KPiA+IA0KPiA+IE9uIE1vbiwgU2VwIDIsIDIwMTkgYXQgMTM6MTo0Nywg
QW5kcmV3IE11cnJheSA8YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiA+IHdyb3RlOg0KPiA+IA0K
PiA+ID4gT24gTW9uLCBTZXAgMDIsIDIwMTkgYXQgMTE6MTc6MTNBTSArMDgwMCwgWGlhb3dlaSBC
YW8gd3JvdGU6DQo+ID4gPiA+IGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnEgd2FzIG5ldmVyIGNh
bGxlZCBpbiB0aGUgZXhpc2l0bmcgZHJpdmVyDQo+ID4gPiA+IGJlZm9yZSwgYmVjYXVzZSB0aGUg
bHMxMDQ2YSBwbGF0Zm9ybSBkb24ndCBzdXBwb3J0IHRoZSBNU0lYIGZlYXR1cmUNCj4gPiA+ID4g
YW5kIG1zaXhfY2FwYWJsZSB3YXMgYWx3YXlzIHNldCB0byBmYWxzZS4NCj4gPiA+ID4gTm93IHRo
YXQgYWRkIHRoZSBsczEwODhhIHBsYXRmb3JtIHdpdGggTVNJWCBzdXBwb3J0LCBidXQgdGhlDQo+
ID4gPiA+IGV4aXN0aW5nIGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnEgZG9lc24ndCB3b3JrLCBz
byB1c2UgdGhlIGRvb3JiZWxsDQo+ID4gPiA+IG1ldGhvZCB0byBzdXBwb3J0IHRoZSBNU0lYIGZl
YXR1cmUuDQo+ID4gDQo+ID4gSHVtLi4uIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBtc2l4IGltcGxl
bWVudGF0aW9uIGRpZCB3b3JrIG9uIG15IHVzZSBjYXNlLA0KPiA+IGhvd2V2ZXIsIGF0IHRoZSB0
aW1lIHRoZSBzZXR1cCB1c2VkIGZvciBkZXZlbG9waW5nIGFuZCB0ZXN0aW5nIHRoZQ0KPiA+IGlt
cGxlbWVudGF0aW9uIG9ubHkgaGFkIG9uZSBQRiAoYnkgZGVmYXVsdCAwKS4gUGVyaGFwcyB0aGlz
IGNvdWxkIHdhcyBpcw0KPiA+IGNhdXNpbmcgdGhlIGRpZmZlcmVudCBiZWhhdmlvciBiZXR3ZWVu
IG91ciBzZXR1cHMuDQo+ID4gDQo+ID4gWW91IGhhdmUgbW9yZSB0aGFuIG9uZSBQRiwgcmlnaHQ/
DQo+IA0KPiBZZXMsIEkgaGF2ZSB0d28gUEZzLg0KDQpQcm9iYWJseSB0aGF0J3MgdGhlIHJlYXNv
biB3aHkgbXkgTVNJLVggcmFpc2UgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24gDQpkaWRuJ3Qgd29y
ayBvbiB5b3VyIGNhc2UuDQoNCj4gDQo+IFRoYW5rcw0KPiBYaWFvd2VpDQo+IA0KPiA+IA0KPiA+
IElmIEkgcmVtZW1iZXIgY29ycmVjdGx5LCBtc2l4IGZlYXR1cmUgc3VwcG9ydCBlbnRlcmVkIG9u
IGtlcm5lbCA0LjE5IHZlcnNpb24NCj4gPiBhbmQgaXQgd29ya2VkIHF1aXRlIHdlbGwgYXQgdGhl
IHRpbWUsIGJ1dCBJIGRpZG4ndCB0ZXN0IHNpbmNlIHRoZXJlIChJJ3ZlIHRvDQo+ID4gbWFuYWdl
IHRpbWUgdG8gYmUgYWJsZSB0byByZXRlc3QgaXQgYWdhaW4pLCBJJ20gZGlkbid0IHNlZW4gYW55
IHBhdGNoIHRoYXQNCj4gPiBjb3VsZCBpbnRlcmZlcmUgd2l0aCB0aGlzLg0KPiA+IA0KPiA+IFJl
Z2FyZHMsDQo+ID4gR3VzdGF2bw0KPiA+IA0KPiA+IA0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gPiA+DQo+ID4gPiBS
ZXZpZXdlZC1ieTogQW5kcmV3IE11cnJheSA8YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiA+ID4N
Cj4gPiA+ID4gLS0tDQo+ID4gPiA+IHYyOg0KPiA+ID4gPiAgLSBObyBjaGFuZ2UNCj4gPiA+ID4g
djM6DQo+ID4gPiA+ICAtIE1vZGlmeSB0aGUgY29tbWl0IG1lc3NhZ2UgbWFrZSBpdCBjbGVhcmx5
Lg0KPiA+ID4gPg0KPiA+ID4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVy
c2NhcGUtZXAuYyB8IDMgKystDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gPiA+IGIvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+ID4gPiBpbmRleCAx
ZTA3Mjg3Li41ZjBjYjk5IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMNCj4gPiA+ID4gQEAgLTc5LDcgKzc5LDgg
QEAgc3RhdGljIGludCBsc19wY2llX2VwX3JhaXNlX2lycShzdHJ1Y3QgZHdfcGNpZV9lcA0KPiA+
ICplcCwgdTggZnVuY19ubywNCj4gPiA+ID4gIAljYXNlIFBDSV9FUENfSVJRX01TSToNCj4gPiA+
ID4gIAkJcmV0dXJuIGR3X3BjaWVfZXBfcmFpc2VfbXNpX2lycShlcCwgZnVuY19ubywgaW50ZXJy
dXB0X251bSk7DQo+ID4gPiA+ICAJY2FzZSBQQ0lfRVBDX0lSUV9NU0lYOg0KPiA+ID4gPiAtCQly
ZXR1cm4gZHdfcGNpZV9lcF9yYWlzZV9tc2l4X2lycShlcCwgZnVuY19ubywgaW50ZXJydXB0X251
bSk7DQo+ID4gPiA+ICsJCXJldHVybiBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJxX2Rvb3JiZWxs
KGVwLCBmdW5jX25vLA0KPiA+ID4gPiArCQkJCQkJCSAgaW50ZXJydXB0X251bSk7DQo+ID4gPiA+
ICAJZGVmYXVsdDoNCj4gPiA+ID4gIAkJZGV2X2VycihwY2ktPmRldiwgIlVOS05PV04gSVJRIHR5
cGVcbiIpOw0KPiA+ID4gPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiA+ID4gLS0NCj4gPiA+ID4g
Mi45LjUNCj4gPiA+ID4NCj4gPiANCg0KDQo=
