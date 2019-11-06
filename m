Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D87DF12AD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 10:48:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477MDk5g3GzF3ZR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 20:48:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=synopsys.com (client-ip=149.117.87.133;
 helo=smtprelay-out1.synopsys.com; envelope-from=gustavo.pimentel@synopsys.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=synopsys.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="UBpvOhQi";
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=synopsys.onmicrosoft.com
 header.i=@synopsys.onmicrosoft.com header.b="o36QoXdk"; 
 dkim-atps=neutral
X-Greylist: delayed 389 seconds by postgrey-1.36 at bilbo;
 Wed, 06 Nov 2019 20:47:05 AEDT
Received: from smtprelay-out1.synopsys.com (us03-smtprelay2.synopsys.com
 [149.117.87.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477MBd6xYczF5gl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 20:47:03 +1100 (AEDT)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 76F66C0929;
 Wed,  6 Nov 2019 09:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573033231; bh=3S2AY2zTbjmuuiLGrvm+bOWd56q9rQflwNYyp7F6mIU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=UBpvOhQi8U8V6E/KEPqAzL66uhZEhH6GDtmASOu/USJrEDqRiLcJ6srNMeg8y8l4+
 OF11sPIOivyMMjTCRgUlLF6w6jkwzrMtAXpHLYZXrP0OL3Ls2G2gp9UHCs7fjtiY6v
 JxmQovSsUvOkeLrmQJJlG/6dYEcwxugND0S/qMkFDJVNIDJJxlcd7w2/COC4PUjXnM
 ROWnZJ1JdgSWnWSsfxEovbf02dB2o+XZ1Ny6mBBzl9fW2UxQuqyUyQBCXGYlylAPzV
 qqOHbHWdA5lOrnR7sZr04GPU6lgfS0QemPQTTEuqHk94eWivjfQnB/Itj8U0rtJ/cx
 RTsFTq7MEHuJQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id EE217A006E;
 Wed,  6 Nov 2019 09:40:25 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 6 Nov 2019 01:40:19 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 6 Nov 2019 01:40:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5kHeMWotq7UGKSYYEsCP82+M2+A5rMBQ6X2ADMlUYTXX/fEh1J/DKnjZdAw8yDmTc8NFEFuMUHHJq6ExUtfhvN71qxIdodksSpfOEQQPEauBBHA5ep5P20Ee0uiqZBPrRz/lq+SCx9tO8HUbVss9Upa4bf0TnkDDNJUi2nx0jckd+ibY44131rl7hF3GK0Ae5yMN9Usya4sDSf5h0G5ukhs9/ZVlOm5wRbbYUYUlbPAfM8j+PmCIiLRG4koi1Kp0rKlFj5ZmwIrARO/4f3GNekNN0O/sogaLkVJJD99Y8sFwnTde7vfxpMTRtWMct1gFyEl+5JentKEHZ88IrnlQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3S2AY2zTbjmuuiLGrvm+bOWd56q9rQflwNYyp7F6mIU=;
 b=dmO0SdQYQ568tp2PYCNQCsE2/+h6ybx9ENNGZ072sFCpMFduVMIC29ubFAYVCulbW0TdQwaY1+d9UF5wierVrp9aKILyDBUIggY3akXpiMLLgyeUsq2v8DKHrw1KS5kYs8nBTHm1hWsM+/gbl3UaAUb/F9fh+cJmXVXn17K8PgT85hgBL4ddfVVPCRgiMntfSojXrTQ99QypJcOcNxl0eXmVWOf/rwk81zQFhg39F+wHWgbfQLFmWXGoTY8Js9jWIzR+Ed6r/htyDTVyp6IHkYbJgzNfUi0uJ3oL1PCtyVT9ww/R3RzlSxq+X/0wDpGpXT/02qyfrhOuqXVdMbeT9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3S2AY2zTbjmuuiLGrvm+bOWd56q9rQflwNYyp7F6mIU=;
 b=o36QoXdkU9jE/FmvT8eMpUCmXW8mOFNZAEtIa0EyDDX1cfTRMI7AZuA7zVJt53opA6XvtsnEKglJbkMV9ERAwDRb/WaV2cZ6JLfxs2waBqAGD/9IHNBLI3PvKnX7vh21oisCkdx7rEj2MIMPAyKN8VfHia3yB3J1gkROrkELtXY=
Received: from DM6PR12MB4010.namprd12.prod.outlook.com (10.255.175.83) by
 DM6PR12MB3451.namprd12.prod.outlook.com (20.178.198.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Wed, 6 Nov 2019 09:40:16 +0000
Received: from DM6PR12MB4010.namprd12.prod.outlook.com
 ([fe80::89b8:dea4:cfcb:a241]) by DM6PR12MB4010.namprd12.prod.outlook.com
 ([fe80::89b8:dea4:cfcb:a241%7]) with mapi id 15.20.2430.020; Wed, 6 Nov 2019
 09:40:16 +0000
From: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
To: Kishon Vijay Abraham I <kishon@ti.com>,
 Andrew Murray <andrew.murray@arm.com>, Xiaowei Bao <xiaowei.bao@nxp.com>,
 "gustavo.pimentel@synopsys.com" <Gustavo.Pimentel@synopsys.com>
Subject: RE: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the doorbell
 way
Thread-Topic: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the
 doorbell way
Thread-Index: AQHVWN1ueZMQ3jP9eUqIIf7Rzdza5KcIw+QAgACqiwCABZWDgIACm0IAgGy1riA=
Date: Wed, 6 Nov 2019 09:40:15 +0000
Message-ID: <DM6PR12MB40107A9B97A8DAF32A4C651EDA790@DM6PR12MB4010.namprd12.prod.outlook.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-7-xiaowei.bao@nxp.com>
 <20190823135816.GH14582@e119886-lin.cambridge.arm.com>
 <AM5PR04MB3299E50BA5D7579D41B8B4F9F5A70@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190827132504.GL14582@e119886-lin.cambridge.arm.com>
 <e64a484c-7cf5-5f65-400c-47128ab45e52@ti.com>
In-Reply-To: <e64a484c-7cf5-5f65-400c-47128ab45e52@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jWjNWemRHRjJiMXhoY0hCa1lYUmhYSEp2WVcxcGJtZGNNRGxrT0RRNVlq?=
 =?utf-8?B?WXRNekprTXkwMFlUUXdMVGcxWldVdE5tSTROR0poTWpsbE16VmlYRzF6WjNO?=
 =?utf-8?B?Y2JYTm5MVFprTVRneVlUaGhMVEF3TnprdE1URmxZUzA1T0RrekxXRTBOR05q?=
 =?utf-8?B?T0dVNVkyWXdObHhoYldVdGRHVnpkRncyWkRFNE1tRTRZaTB3TURjNUxURXha?=
 =?utf-8?B?V0V0T1RnNU15MWhORFJqWXpobE9XTm1NRFppYjJSNUxuUjRkQ0lnYzNvOUlq?=
 =?utf-8?B?TTJNamNpSUhROUlqRXpNakUzTlRBMk9ERXpNREF4TlRNd05TSWdhRDBpVUZZ?=
 =?utf-8?B?MWNVZFVOMGwyVnpsdlZ6SkJiRTFwZEd4RGJVMDJhV1J6UFNJZ2FXUTlJaUln?=
 =?utf-8?B?WW13OUlqQWlJR0p2UFNJeElpQmphVDBpWTBGQlFVRkZVa2hWTVZKVFVsVkdU?=
 =?utf-8?B?a05uVlVGQlFsRktRVUZDU21WQk1IZG9jRlJXUVZKaGNVMVRTM0pyVDNwcVJu?=
 =?utf-8?B?RnZlRWx4ZFZFM1QwMVBRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVaEJRVUZCUTJ0RFFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVWQlFWRkJRa0ZCUVVGRlIwbFplbEZCUVVGQlFVRkJRVUZCUVVGQlFVRktO?=
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
x-ms-office365-filtering-correlation-id: 7e31cbd2-8a6f-4a90-6c04-08d7629d5493
x-ms-traffictypediagnostic: DM6PR12MB3451:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3451B1F9F3EE6E435952A4CBDA790@DM6PR12MB3451.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(396003)(366004)(346002)(376002)(13464003)(199004)(189003)(99286004)(81156014)(8676002)(81166006)(316002)(2501003)(2906002)(8936002)(54906003)(110136005)(3846002)(6116002)(25786009)(478600001)(14454004)(26005)(33656002)(66066001)(102836004)(6506007)(486006)(53546011)(86362001)(476003)(446003)(11346002)(7736002)(229853002)(71200400001)(71190400001)(256004)(14444005)(7696005)(186003)(6636002)(305945005)(74316002)(76176011)(7416002)(76116006)(64756008)(66946007)(66476007)(66556008)(5660300002)(52536014)(66446008)(9686003)(6436002)(4326008)(55016002)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR12MB3451;
 H:DM6PR12MB4010.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6W3cjf6ADO9MGhyXBk1LJyr0lTf6e8vcbTGhSNmilIgUy8hkGdVT1nXizK9cY73HUIaLefIaBdPDmLG0ieGvWUesJsRQ1V44YFbOhNGF3WzDG3HfN2k+P52Knci8esuP5lLKkhVYR8SUljRVZWc0NoJ708amuFTUQa5Mg3Apbp6gn+hhv2MMlOudC1bRT4cTnd2Di8lpvXBHGSGVUg+fn4Whj/yNezn/Sa4BS8Al3jZ3PvvblhJvbpYgukMAU7waulEUNfeZQ1FQS8/12xXb1N2P0+MT8sQJ6xX0IsS1EJnQ9peBQ+n4etqXixaz/P1RYJKkESOpOgJ3/djl3CNI6BEqT5sMq/Kl5wLjVIdZKyEzbsunGct93uQR3PM4QaCfI3Y+Fy4NlCJHw++v8wIivgX2DbSu6O+dSygT+ekmnBvKlDpuLflWYt1tBteXK3sy
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e31cbd2-8a6f-4a90-6c04-08d7629d5493
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 09:40:16.3830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z8Uru0T4xg1w6bcTly+FpZpq8/3tMiovEvM8N1tOTXpYObpVPeK6xiADKE30YnXILuWTFEYvU4UCQK/azmIg1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3451
X-OriginatorOrg: synopsys.com
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Roy
 Zang <roy.zang@nxp.com>, "lorenzo.pieralisi@arm.co" <lorenzo.pieralisi@arm.co>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgNjoxMzoxOCwgS2lzaG9uIFZpamF5IEFicmFoYW0gSSA8
a2lzaG9uQHRpLmNvbT4gDQp3cm90ZToNCg0KSGksIHRoaXMgZW1haWwgc2xpcCBhd2F5IGZyb20g
bXkgYXR0ZW50aW9uLi4uDQoNCj4gR3VzdGF2bywNCj4gDQo+IE9uIDI3LzA4LzE5IDY6NTUgUE0s
IEFuZHJldyBNdXJyYXkgd3JvdGU6DQo+ID4gT24gU2F0LCBBdWcgMjQsIDIwMTkgYXQgMTI6MDg6
NDBBTSArMDAwMCwgWGlhb3dlaSBCYW8gd3JvdGU6DQo+ID4+DQo+ID4+DQo+ID4+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4gRnJvbTogQW5kcmV3IE11cnJheSA8YW5kcmV3Lm11
cnJheUBhcm0uY29tPg0KPiA+Pj4gU2VudDogMjAxOeW5tDjmnIgyM+aXpSAyMTo1OA0KPiA+Pj4g
VG86IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiA+Pj4gQ2M6IGJoZWxnYWFz
QGdvb2dsZS5jb207IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207DQo+
ID4+PiBzaGF3bmd1b0BrZXJuZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IGtp
c2hvbkB0aS5jb207DQo+ID4+PiBsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY287IGFybmRAYXJuZGIu
ZGU7IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBNLmguDQo+ID4+PiBMaWFuIDxtaW5naHVh
bi5saWFuQG54cC5jb20+OyBNaW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+OyBSb3kNCj4g
Pj4+IFphbmcgPHJveS56YW5nQG54cC5jb20+OyBqaW5nb29oYW4xQGdtYWlsLmNvbTsNCj4gPj4+
IGd1c3Rhdm8ucGltZW50ZWxAc3lub3BzeXMuY29tOyBsaW51eC1wY2lAdmdlci5rZXJuZWwub3Jn
Ow0KPiA+Pj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7DQo+ID4+PiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxp
bnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+ID4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYy
IDA3LzEwXSBQQ0k6IGxheWVyc2NhcGU6IE1vZGlmeSB0aGUgTVNJWCB0byB0aGUNCj4gPj4+IGRv
b3JiZWxsIHdheQ0KPiA+Pj4NCj4gPj4+IE9uIFRodSwgQXVnIDIyLCAyMDE5IGF0IDA3OjIyOjM5
UE0gKzA4MDAsIFhpYW93ZWkgQmFvIHdyb3RlOg0KPiA+Pj4+IFRoZSBsYXllcnNjYXBlIHBsYXRm
b3JtIHVzZSB0aGUgZG9vcmJlbGwgd2F5IHRvIHRyaWdnZXIgTVNJWCBpbnRlcnJ1cHQNCj4gPj4+
PiBpbiBFUCBtb2RlLg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gSSBoYXZlIG5vIHByb2JsZW1zIHdp
dGggdGhpcyBwYXRjaCwgaG93ZXZlci4uLg0KPiA+Pj4NCj4gPj4+IEFyZSB5b3UgYWJsZSB0byBh
ZGQgdG8gdGhpcyBtZXNzYWdlIGEgcmVhc29uIGZvciB3aHkgeW91IGFyZSBtYWtpbmcgdGhpcw0K
PiA+Pj4gY2hhbmdlPyBEaWQgZHdfcGNpZV9lcF9yYWlzZV9tc2l4X2lycSBub3Qgd29yayB3aGVu
IGZ1bmNfbm8gIT0gMD8gT3IgZGlkDQo+ID4+PiBpdCB3b3JrIHlldCBkd19wY2llX2VwX3JhaXNl
X21zaXhfaXJxX2Rvb3JiZWxsIGlzIG1vcmUgZWZmaWNpZW50Pw0KPiA+Pg0KPiA+PiBUaGUgZmFj
dCBpcyB0aGF0LCB0aGlzIGRyaXZlciBpcyB2ZXJpZmllZCBpbiBsczEwNDZhIHBsYXRmb3JtIG9m
IE5YUCBiZWZvcmUsIGFuZCBsczEwNDZhIGRvbid0DQo+ID4+IHN1cHBvcnQgTVNJWCBmZWF0dXJl
LCBzbyBJIHNldCB0aGUgbXNpeF9jYXBhYmxlIG9mIHBjaV9lcGNfZmVhdHVyZXMgc3RydWN0IGlz
IGZhbHNlLA0KPiA+PiBidXQgaW4gb3RoZXIgcGxhdGZvcm0sIGUuZy4gbHMxMDg4YSwgaXQgc3Vw
cG9ydCB0aGUgTVNJWCBmZWF0dXJlLCBJIHZlcmlmaWVkIHRoZSBNU0lYDQo+ID4+IGZlYXR1cmUg
aW4gbHMxMDg4YSwgaXQgaXMgbm90IE9LLCBzbyBJIGNoYW5nZWQgdG8gYW5vdGhlciB3YXkuIFRo
YW5rcy4NCj4gPiANCj4gPiBSaWdodCwgc28gdGhlIGV4aXN0aW5nIHBjaS1sYXllcnNjYXBlLWVw
LmMgZHJpdmVyIG5ldmVyIHN1cHBvcnRlZCBNU0lYIHlldCBpdA0KPiA+IGVycm9uZW91c2x5IGhh
ZCBhIHN3aXRjaCBjYXNlIHN0YXRlbWVudCB0byBjYWxsIGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9p
cnEgd2hpY2gNCj4gPiB3b3VsZCBuZXZlciBnZXQgdXNlZC4NCj4gPiANCj4gPiBOb3cgdGhhdCB3
ZSdyZSBhZGRpbmcgYSBwbGF0Zm9ybSB3aXRoIE1TSVggc3VwcG9ydCB0aGUgZXhpc3RpbmcNCj4g
PiBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJxIGRvZXNuJ3Qgd29yayAoZm9yIHRoaXMgcGxhdGZv
cm0pIHNvIHdlIGFyZSBhZGRpbmcgYQ0KPiA+IGRpZmZlcmVudCBtZXRob2QuDQo+IA0KPiBHdXN0
YXZvLCBjYW4geW91IGNvbmZpcm0gZHdfcGNpZV9lcF9yYWlzZV9tc2l4X2lycSgpIHdvcmtzIGZv
ciBkZXNpZ253YXJlIGFzIGl0DQo+IGRpZG4ndCB3b3JrIGZvciBib3RoIG1lIGFuZCBYaWFvd2Vp
Pw0KDQpXaGVuIEkgaW1wbGVtZW50ZWQgdGhlIGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnEoKSwg
dGhlIGltcGxlbWVudGF0aW9uIA0Kd2FzIHdvcmtpbmcgcXVpdGUgZmluZSBvbiBEZXNpZ25XYXJl
IHNvbHV0aW9uLiBPdGhlcndpc2UsIEkgd291bGRuJ3QgDQpzdWJtaXQgaXQgdG8gdGhlIGtlcm5l
bC4NCkZyb20gd2hhdCBJIGhhdmUgc2VlbiBhbmQgaWYgSSByZWNhbGwgd2VsbCwgWGlhb3dlaSBp
bXBsZW1lbnRhdGlvbiB3YXMgDQpkb25lIGhhdmluZyBQRidzIGNvbmZpZ3VyYXRlZCBvbiBoaXMg
c29sdXRpb24sIHdoaWNoIGlzIGEgY29uZmlndXJhdGlvbiANCnRoYXQgSSBkb24ndCBoYXZlIGlu
IG15IHNvbHV0aW9uLCBJIGJlbGlldmUgdGhpcyBjb3VsZCBiZSB0aGUgbWlzc2luZyANCnBpZWNl
IHRoYXQgZGlmZmVycyBiZXR3ZWVuIG91ciAyIGltcGxlbWVudGF0aW9ucy4NCg0KU2luY2UgcGF0
Y2ggc3VibWlzc2lvbiBpbnRvIHRoZSBrZXJuZWwgcmVsYXRlZCB0byBtc2l4IGZlYXR1cmUgb24g
cGNpdGVzdCANCnRvb2wsIEkgZGlkbid0IHRvdWNoIG9yIHJlLXRlc3RlZCB0aGUgbXNpeCBmZWF0
dXJlIGJ5IGxhY2sgb2YgdGltZSAob3RoZXIgDQpwcm9qZWN0cyByZXF1aXJlcyBteSBmdWxsIGF0
dGVudGlvbiBmb3Igbm93KS4gSG93ZXZlciBpcyBvbiBteSByb2FkbWFwIHRvIA0KY2FtZSBiYWNr
IHRvIGFkZCBzb21lIG90aGVyIGZlYXR1cmVzIG9uIERlc2lnbldhcmUgZURNQSBkcml2ZXIgYW5k
IEkgY2FuIA0KZG8gYXQgdGhhdCB0aW1lIHNvbWUgdGVzdHMgdG8gc2VlIGlmIHRoZSANCmR3X3Bj
aWVfZXBfcmFpc2VfbXNpeF9pcnFfZG9vcmJlbGwoKSBpcyBjb21wYXRpYmxlIG9yIG5vdCB3aXRo
IG15IA0Kc29sdXRpb24uIElmIHNvLCBJIGNhbiBkbyBzb21lIHBhdGNoIHRvIHNpbXBsaWZ5IGFu
ZCB1c2UgdGhlIA0KZHdfcGNpZV9lcF9yYWlzZV9tc2l4X2lycV9kb29yYmVsbCgpIGlmIGl0IHN0
aWxsIHdvcmtzIGFzIGV4cGVjdGVkIGxpa2UgDQpvbiBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJx
KCkuIEFncmVlPw0KDQpHdXN0YXZvDQoNCj4gDQo+IFRoYW5rcw0KPiBLaXNob24NCg0KDQo=
