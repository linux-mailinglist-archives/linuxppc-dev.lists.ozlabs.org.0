Return-Path: <linuxppc-dev+bounces-6676-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C90FA4D5B4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 09:05:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6SsY61vcz30Vw;
	Tue,  4 Mar 2025 19:05:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2406:e500:4440:2::72e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741074081;
	cv=pass; b=AdiNeFBbSaCzxf4MI1IO0+Grs6B/HJglvKjrJThj9+D5oI0wFHfz7OHQabNu3+k8Hbs1VlqCfgyL/DUADSC/vjSLJUdBV4q55hveZX+ufLuHhNfruXJ3b6bO9sSMbxk12sXgB4U6WhBj9xHBmaeMt59GyVcwTK3LfQeJHyEydFnbASmn1GrV8nYv1TaOXbBYiIhlpjDLFbakYQ+MC1W9B4NMuBdH69CZkylu4ZdfMP6iV2acUVgd/G+JTi5JzuUZ1eFQGT0XK4rFtqq0KAeGhfze8Ouq5LTywsuYI4GdZjB2mOPGQ2B9dWhUqhLOghtIrJcql07uumRabDJQVT0ySg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741074081; c=relaxed/relaxed;
	bh=Crv9CQ4Ux9sMJKasrKodGTKeVvSHxTIJp+VaSJowfdI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GRZv9rO7lP6DDXsBwEoBnwxT1Q+9/eAAk/0dz51pc/MLG0q9Bnr08MPuhCEUCze7Kczs1fggPrv6cNTKnYQYgky55dyb1cXqrvbFI+ziY167U+W5iV+gKlpqq3Ns8/Ve03cnWQImVhQfQ/XpnpaGevfeIa6mKtPnAxa9ByXTvIY5s5+8Fen28DR/M+4o4ZdmSBr8+Ys3X6iwbsLpSMFbN6pFZWbsU08Ahp3DUKQCGTvC6mlb8AVibIycyY9Ifo+XH9AMEfTuGjkKjIw9NmrWxGwn99lZFzREjJbEo0HGM6LzHe/fOm1ODdSo1N/E0zyEgQutElXbUjYkz0jniuElXg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=enflame-tech.com; dkim=pass (1024-bit key; unprotected) header.d=Enflame.partner.onmschina.cn header.i=@Enflame.partner.onmschina.cn header.a=rsa-sha256 header.s=selector1-Enflame-partner-onmschina-cn header.b=Raa+L0IP; dkim-atps=neutral; spf=pass (client-ip=2406:e500:4440:2::72e; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=dio.sun@enflame-tech.com; receiver=lists.ozlabs.org) smtp.mailfrom=enflame-tech.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=enflame-tech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=Enflame.partner.onmschina.cn header.i=@Enflame.partner.onmschina.cn header.a=rsa-sha256 header.s=selector1-Enflame-partner-onmschina-cn header.b=Raa+L0IP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=enflame-tech.com (client-ip=2406:e500:4440:2::72e; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=dio.sun@enflame-tech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2024 seconds by postgrey-1.37 at boromir; Tue, 04 Mar 2025 18:41:17 AEDT
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2072e.outbound.protection.partner.outlook.cn [IPv6:2406:e500:4440:2::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6SKn2LK0z30VZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 18:41:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmwmqHZk6PPD+KS3e1ivy1Zu4E/Lga7053bBCVFxRsYFeCbHygGTU/Cjb2l/jV4LM9NvxhD71pVST0nieI7qn/9W/uDnTGmn+WT0VbrlkAqzsUHIrvgYMtWBydEvci0ZC3gG1gUP24S6oQmG5fGvcQXKH1YezWsGMcoLRZfi/SsPWdlyyXT4EZX+RP28UPhavrHYx0lcAnCyccG8515lUS4QSoZna2QGAG2pgDnmaC948gO9kDbDqnm2oozBOIFlgqguWptD2uui18gegz1J9i7G76hhHzIfmNzQqmWv4GGM6TRDGFjLddxHnLApcM9NY8LTMROPD4Ge95RSgFCO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Crv9CQ4Ux9sMJKasrKodGTKeVvSHxTIJp+VaSJowfdI=;
 b=DwPNT5jfX0tKtigZoOcKnRWa1ZvRdweAhjHnSom7kKP510N/PMm+xJE/4bQbpp5uDohyuYiilps0IJWHd/2/c1GKS4X9ufk1CmHzWj4X5LVT08lzsOkMwQjNTKXkiXZrBNcuxFt3VQkYkxDo3tZ4cnfzQk5s3qaKGowCFxeW1XdwCxOZvMJvGtcygVpe3+iH7CrZr3YCNVWC5Fa1K8IP5zwzhl7o5wCEcE8NKYdTaaxyH9Ybr5Yl2X6aPRkZ9xkDutP5e/g8xPndPKT1i6GXt8WLTE/kqJ2p1ymsAGqZNZ00BrpSe9KlYS86ih19E+DNS3FfRWuBuGRUlCn0kXesug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=enflame-tech.com; dmarc=pass action=none
 header.from=enflame-tech.com; dkim=pass header.d=enflame-tech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Enflame.partner.onmschina.cn; s=selector1-Enflame-partner-onmschina-cn;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Crv9CQ4Ux9sMJKasrKodGTKeVvSHxTIJp+VaSJowfdI=;
 b=Raa+L0IPMI5MUapjQ3nzfhFP8jI+MKHrT3aaNuUDbVEMr+hziu6ej7qg8R+Tbea/4rRs7f00YU2A2TjedLm3KPtCVfCYwy8HjgiUMMBGqQWAISm9Tarmet75R/mBV9uhGV/tWRS3TIOA8xPWakRn1QMdBT3G1yLbJ4pFJegYNGg=
Received: from BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:14::23) by BJXPR01MB0839.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.11; Tue, 4 Mar
 2025 07:07:05 +0000
Received: from BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn
 ([fe80::5b17:45cb:d82e:e7b9]) by
 BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn ([fe80::5b17:45cb:d82e:e7b9%6])
 with mapi id 15.20.8489.028; Tue, 4 Mar 2025 07:07:05 +0000
From: =?gb2312?B?y+/A+7HzX0Rpbw==?= <dio.sun@enflame-tech.com>
To: "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "oohall@gmail.com"
	<oohall@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: =?gb2312?B?wt6wsl9Bbg==?= <an.luo@enflame-tech.com>,
	=?gb2312?B?uvq7tF9GZXJuYW5kbw==?= <fernando.hu@enflame-tech.com>,
	=?gb2312?B?zuLwqe6jX0JpbGw=?= <bill.wu@enflame-tech.com>,
	=?gb2312?B?zfX2zl9YaW4=?= <xin.wang@enflame-tech.com>
Subject: [PATCH] AER: PCIE CTO recovery handle fix
Thread-Topic: [PATCH] AER: PCIE CTO recovery handle fix
Thread-Index: AduM0OzqFOcTufgFSYi2gnnVja5sWw==
Date: Tue, 4 Mar 2025 07:07:05 +0000
Message-ID:
 <BJXPR01MB0614C01A9523786117B1F1CBCEC8A@BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=enflame-tech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJXPR01MB0614:EE_|BJXPR01MB0839:EE_
x-ms-office365-filtering-correlation-id: 0cc6d9d8-3a93-4b91-5979-08dd5aeb2b96
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018|4053099003;
x-microsoft-antispam-message-info:
 U+IbM/Jpfaz3k1AvqHODlJGb4V5DJXxhQVmZ7Ezf26QHLNzAVZuSv16hiuraGKERf/JKetm2+3VRY5OEB8as78SlkW2q0sb985FMpadveC0VRgSGy13PKEV3mKfLni7ObYug4nEeBODCOr8ZAqrRFtq/Znq2GTFJIoDD1ny6zqgJemYN5qbJwJ1AO7+4iXIiPimeUyhe4Qf7/H5qqBb+xValYDLvIYZnXqERKHIsMLoSQtYvpdfFR06hO+sg/TUWRKfI1IyT2E+97t7Xo62ggXCCVqnNhaTrmBBbO4WonGglWv6alzyweuhaMOe+dr+vMQKMq3QWKuzQWzOIKHxkr6FkBCMURjLcMzXWAHWxu76t12PjqXAr1qr1cBACgml76NZCHNMfRJFYa+m2LOEdZqs0cbNCNXkFsmohnXcyGsq7+GuKVQgGGFsohSPANP/jxZEcl4htXorhBpPi/drjaMPbX4w50hab5tMxueB3B2FqIBmismbnpEforzixOv9CDJwodNIKa3wTYFD+Uamhoi1EuiEOH8S3nsTraWsTl/ttGXknGRtIGtpHmBPW7sEbGeBsmifCL2Oja8g+/t6cZQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018)(4053099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?KzFScVBhREtma1FBRlZBemx6NzVPSzhuRnFvditKcGxQLzQ4NjRLUWxRdDRJ?=
 =?gb2312?B?S3MveWd4ZTNQZWxncStOdU93SnRVL0xncVpiRDhXL2M0Mjd2aGpaVmFnTmNL?=
 =?gb2312?B?c2JXdGkzTTJqcXRldEFWWndYUTBCM0hpRUh6LzVyczdPTWFlaWZoeWVjV1Fs?=
 =?gb2312?B?eWx1MFRHNmIyNFJrK1M4OGNoRkZMUWJWTmhqdytKVTZjWEo3UzNOWjBsdUVm?=
 =?gb2312?B?SVdwRCtObzJjcjE0RWdhVDhWTnZXcmpSMEVRQkFXMkxPL2VacmNOZXNiUTVV?=
 =?gb2312?B?TEt6QVFjTE0wUlZMK1lOOXRmVzEybTVaY3RVdlFJR3ppVzZlOFdzY3ZvMG1n?=
 =?gb2312?B?YkNCbXg0RWUwUU5jbWx6UE9maHpnSUVjbHE2NVdkOGxVMnVWYWhlc01Pd1Fi?=
 =?gb2312?B?TDk3T09xWHFveWJTZnUxOUptTWpzYjlHaWZHOVM4bWVPTVVvZHpINFAzZ3BX?=
 =?gb2312?B?RFBVY3R2UWkxeTV6MlBjMU5Qa3JGSVdXdERQRUpXRkMyZm05eWdoUlpYRDAx?=
 =?gb2312?B?aStNUzgwT0xMNGZ1UzU3REgrby9EYjB5cThqU0JCVVEwUmxGclFHMHRqemtq?=
 =?gb2312?B?OUxsTGhlL0YxZG9qTXB6TWFvcWFna3pEZFJNVUNqUTZuUEJBaVZUdG1hTzJk?=
 =?gb2312?B?MVQzK3c2SUdwMWZxeW10MzBQS1VzWUluWkorNk0vazRhNnRVZVl2Zm1BYk9w?=
 =?gb2312?B?bktUWllJWGZkbFN5Q3YyNHFrN0w2K2lMTXYrR2Jtb1VTZXI3T2hBMGppbmRF?=
 =?gb2312?B?VkhGNjNyZjdyZ0h3SnlZME84VnJvbGJRc1BZZkljY3pMR3RJbUhDS2RCZXRX?=
 =?gb2312?B?M1JHRnpUY0pJeE5PTDMyRjJTNlQybStSZVg5NFIrTm5VY1NOenNacGZXL09n?=
 =?gb2312?B?VllTUlJEK1dVM0pFSy9FVkd1WS9TNkl5elRGTlY2YXVVRzI3UHJFQ1pUa0lT?=
 =?gb2312?B?RjQ2Q3pOMmdVdGM4WDBIaE1hQWMrdERQNFpadnNORzVQK2FlZkZCdnZrUlBL?=
 =?gb2312?B?TlFMa2JJZDZzVFZ0VzhNYnZkZjBTYUwvR1hCN0czSFFXVXdqNStlUWswdWUz?=
 =?gb2312?B?UDhRV2ZRUGp0ZTFtd2daWjR3RE5SMmFGWkE5NkFEZjE5bWxMcUs4NkMrTEhU?=
 =?gb2312?B?dkc0bTFWeUY3aTUrMEZSQmthNnhvdG1maUh5T25XLzM2NTZnVnlPUXRYTUZv?=
 =?gb2312?B?dTNZbkk3U0xqcVBpNFRaT3pLbXF5b0J4RFB4bktZVmllN2dxZ2lmVVR5WUpw?=
 =?gb2312?B?WXBIUmlkYXpUY2xoRi9rMkl6TkkxTVppZUU3dEYzblZuL0F6Q1p4aHJib0NK?=
 =?gb2312?B?VUhyaHVwK3B4Y3d6L2hUV3NQMW9wOXZzMnR0SndINlV1UkpxMkFNQ3JCeWh4?=
 =?gb2312?B?dExTNE5YdmsxVElXKzQ4cDhqSzlVa3d4MEFXbWZWQ1UvaWVhdERUVnFMYUlN?=
 =?gb2312?B?T0VVZ2ltd3gwb0U1bzBxd0dnZ2dpZVhtcXprdG1STGNOMVNEcmk5ZytSYWhi?=
 =?gb2312?B?M2o3V2wza2ZOdlJhZHBXNWtBL0FjcG5SSEJNcEQvS3ZrQWdHMGthYjJJRDdM?=
 =?gb2312?B?Tk5PUWhqbkJnc0doVXFEL2xScDdyNUIzN1RicnM4VUJacFJ3a24rSVdCcVY1?=
 =?gb2312?B?aWRYLytaQ2tRYUw4dEhtK05TZ2hURmlSOFFxNGxtSC9ZRnhSdFQwQ2piUTU2?=
 =?gb2312?B?QVI2V2o1YkZjK1JHSlBxOUplZ3VjS3dJcXIvdFQvQ3p5djhyOHhDakVuZEpn?=
 =?gb2312?B?TjN0TlZRRkhHYTdFTkh1V09RSkt5N1pUdU5ha1NLMDErK1JUbzBHUHV6VHNF?=
 =?gb2312?B?WG52Vmo0cStYNU9VSEdWQzFTVDV4UTkzOXNBekxuU1R6RnB3WWNJaDRaMzQ4?=
 =?gb2312?B?Z0RnNHVpa2ZseXZMc2RmMU0zU2RhSHV0c2gvZFFlS3dGeG53MDlGZWwwK3pq?=
 =?gb2312?B?MGxjZi9Jb1NUakVKVEhqYmVTYnhkQUdUL1drSFIydi9FTGg5S1laaUpJY2Jo?=
 =?gb2312?B?VkJkT3VySTRCRndkMnZBL0VxbXFCY1VtR2FoYlEra1hQMEU1QUo3ZHNjdCt2?=
 =?gb2312?B?YkZHNjc3S0JYTDNDaFJkRDZ2dE5PVHFXbUljYTJiR0N5QWhoME9RWDY2RjVw?=
 =?gb2312?Q?sovXvFtrNYA4jEQbp0xZAaWQ0?=
Content-Type: multipart/mixed;
	boundary="_002_BJXPR01MB0614C01A9523786117B1F1CBCEC8ABJXPR01MB0614CHNP_"
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: enflame-tech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc6d9d8-3a93-4b91-5979-08dd5aeb2b96
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 07:07:05.1547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 39d6d270-c813-4e78-90db-1de0de08f579
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hrQlK+uEmGpSwK4sVzsbdrgIlgkCu20h9sRQAQEvRfLMi+QApQsuQF++ZH9y+rfVS5bXXqGuv+kf9wb0425070AiWujvVQK9HZfaueZ1/rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0839
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--_002_BJXPR01MB0614C01A9523786117B1F1CBCEC8ABJXPR01MB0614CHNP_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

W0VYVEVSTkFMIEVNQUlMXQ0KDQpGcm9tIDVmYzdiMWE5ZTBmMGJjZmExNDA2OGM2MzU4MDE5ZWQx
ZTNmZmM2YzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQpGcm9tOiAiZGlvLnN1biIgPGRpby5z
dW5AZW5mbGFtZS10ZWNoLmNvbT4NCkRhdGU6IFdlZCwgMjYgRmViIDIwMjUgMDg6NTQ6NDkgKzAw
MDANClN1YmplY3Q6IFtQQVRDSF0gQUVSOiBQQ0lFIENUTyByZWNvdmVyeSBoYW5kbGUgZml4DQoN
CiAtIE5vbi1mYXRhbCBQQ0llIENUTyBpcyByZXBvcnR0ZWQgdG8gUENJRSBSQyBhbmQgaXQgd2ls
bCBiZSBjb252ZXJ0dGVkIHRvDQogICBBZHZOb25GYXRhbEVyciBhdXRvbWF0aWNhbGx5DQogLSBh
Y2NvcmRpbmcgdG8gUENJRSBTUEVDIDYuMi4zLjIuNC40IFJlcXVlc3RlciB3aXRoIENvbXBsZXRp
b24gVGltZW91dCgNCiAgIElmIHRoZSBzZXZlcml0eSBvZiB0aGUgQ1RPIGlzIG5vbi1mYXRhbCwg
YW5kIHRoZSBSZXF1ZXN0ZXIgZWxlY3RzIHRvDQogICBhdHRlbXB0IHJlY292ZXJ5IGJ5IGlzc3Vp
bmcgYSBuZXcgcmVxdWVzdCwgdGhlIFJlcXVlc3RlciBtdXN0DQogICBmaXJzdCBoYW5kbGUgdGhl
IGN1cnJlY250IGVycm9yIGNhc2UgYXMgYW4gQWR2aXNvcnkgTm9uLUZhdGFsIEVycm9yLikuDQog
LSBDdXJyZW50IEtlcm5lbCBjb2RlIGRvZXMgbm90aGluZyB3aGVuIHJlY2VpdmluZyBhbiBBZHZO
b25GYXRhbEVycigNCiAgIENvcnJlY3RhYmxlIEVycm9yKSBhbmQgdGhlIGRldmljZSBkcml2ZXIg
aGFzIG5vIGNoYW5jZSB0byBoYW5kbGUgdGhpcw0KICAgZXJyb3IuDQogLSBVbmRlciB0aGlzIHNp
dHVhdGlvbiwgc29tZXRpbWVzIHN5c3RlbSB3aWxsIGhhbmcgd2hlbiBtb3JlDQogICBBZHZOb25G
YXRhbEVyciBjb21pbmcuDQoNClNpZ25lZC1vZmYtYnk6IGRpby5zdW4gPGRpby5zdW5AZW5mbGFt
ZS10ZWNoLmNvbT4NCi0tLQ0KZHJpdmVycy9wY2kvcGNpZS9hZXIuYyB8IDE2ICsrKysrKysrKysr
KysrKy0NCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvcGNpZS9hZXIuYyBiL2RyaXZlcnMvcGNpL3BjaWUv
YWVyLmMNCmluZGV4IDUwODQ3NGUxNzE4My4uNWRkYzk5MGM2ZjQyIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9wY2kvcGNpZS9hZXIuYw0KKysrIGIvZHJpdmVycy9wY2kvcGNpZS9hZXIuYw0KQEAgLTEx
NTQsNyArMTE1NCwyMSBAQCBzdGF0aWMgdm9pZCBhZXJfcmVjb3Zlcl93b3JrX2Z1bmMoc3RydWN0
IHdvcmtfc3RydWN0ICp3b3JrKQ0KICAgICAgICAgICAgICAgIGdoZXNfZXN0YXR1c19wb29sX3Jl
Z2lvbl9mcmVlKCh1bnNpZ25lZCBsb25nKWVudHJ5LnJlZ3MsDQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihzdHJ1Y3QgYWVyX2NhcGFiaWxpdHlfcmVn
cykpOw0KDQotICAgICAgICAgICAgICAgaWYgKGVudHJ5LnNldmVyaXR5ID09IEFFUl9OT05GQVRB
TCkNCisgICAgICAgICAgICAgICBpZiAoZW50cnkuc2V2ZXJpdHkgPT0gQUVSX0NPUlJFQ1RBQkxF
KSB7DQorICAgICAgICAgICAgICAgICAgICAgICBpZiAoZW50cnkucmVncy0+Y29yX3N0YXR1cyAm
IFBDSV9FUlJfQ09SX0FEVl9ORkFUKSB7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBjaV9lcnIocGRldiwgIiUwNHg6JTAyeDolMDJ4OiV4IGFkdmlzb3J5IG5vbi1mYXRhbCBlcnJv
clxuIiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVu
dHJ5LmRvbWFpbiwgZW50cnkuYnVzLCBQQ0lfU0xPVChlbnRyeS5kZXZmbiksDQorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfRlVOQyhlbnRyeS5kZXZm
bikpOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoZW50cnkucmVncy0+dW5j
b3Jfc3RhdHVzICYgUENJX0VSUl9VTkNfQ09NUF9USU1FKSB7DQorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGNpX2VycihwZGV2LCAiJTA0eDolMDJ4OiUwMng6JXggY29t
cGxldGlvbiB0aW1lb3V0XG4iLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBlbnRyeS5kb21haW4sIGVudHJ5LmJ1cywNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX1NMT1QoZW50
cnkuZGV2Zm4pLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQQ0lfRlVOQyhlbnRyeS5kZXZmbikpOw0KKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBjaWVfZG9fcmVjb3ZlcnkocGRldiwgcGNpX2NoYW5uZWxfaW9f
ZnJvemVuLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGFlcl9yb290X3Jlc2V0KTsNCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfQ0KKyAgICAgICAgICAgICAgICAgICAgICAgfQ0KKyAgICAgICAg
ICAgICAgIH0gZWxzZSBpZiAoZW50cnkuc2V2ZXJpdHkgPT0gQUVSX05PTkZBVEFMKQ0KICAgICAg
ICAgICAgICAgICAgICAgICAgcGNpZV9kb19yZWNvdmVyeShwZGV2LCBwY2lfY2hhbm5lbF9pb19u
b3JtYWwsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFlcl9yb290
X3Jlc2V0KTsNCiAgICAgICAgICAgICAgICBlbHNlIGlmIChlbnRyeS5zZXZlcml0eSA9PSBBRVJf
RkFUQUwpDQotLQ0KMi4zNy4zDQoNCg==

--_002_BJXPR01MB0614C01A9523786117B1F1CBCEC8ABJXPR01MB0614CHNP_
Content-Type: application/octet-stream;
	name="0001-AER-PCIE-CTO-recovery-handle-fix.patch"
Content-Description: 0001-AER-PCIE-CTO-recovery-handle-fix.patch
Content-Disposition: attachment;
	filename="0001-AER-PCIE-CTO-recovery-handle-fix.patch"; size=2116;
	creation-date="Tue, 04 Mar 2025 07:06:36 GMT";
	modification-date="Tue, 04 Mar 2025 07:07:05 GMT"
Content-Transfer-Encoding: base64

RnJvbSA1ZmM3YjFhOWUwZjBiY2ZhMTQwNjhjNjM1ODAxOWVkMWUzZmZjNmM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiZGlvLnN1biIgPGRpby5zdW5AZW5mbGFtZS10ZWNoLmNvbT4K
RGF0ZTogV2VkLCAyNiBGZWIgMjAyNSAwODo1NDo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIEFF
UjogUENJRSBDVE8gcmVjb3ZlcnkgaGFuZGxlIGZpeAoKIC0gTm9uLWZhdGFsIFBDSWUgQ1RPIGlz
IHJlcG9ydHRlZCB0byBQQ0lFIFJDIGFuZCBpdCB3aWxsIGJlIGNvbnZlcnR0ZWQgdG8KICAgQWR2
Tm9uRmF0YWxFcnIgYXV0b21hdGljYWxseQogLSBhY2NvcmRpbmcgdG8gUENJRSBTUEVDIDYuMi4z
LjIuNC40IFJlcXVlc3RlciB3aXRoIENvbXBsZXRpb24gVGltZW91dCgKICAgSWYgdGhlIHNldmVy
aXR5IG9mIHRoZSBDVE8gaXMgbm9uLWZhdGFsLCBhbmQgdGhlIFJlcXVlc3RlciBlbGVjdHMgdG8K
ICAgYXR0ZW1wdCByZWNvdmVyeSBieSBpc3N1aW5nIGEgbmV3IHJlcXVlc3QsIHRoZSBSZXF1ZXN0
ZXIgbXVzdAogICBmaXJzdCBoYW5kbGUgdGhlIGN1cnJlY250IGVycm9yIGNhc2UgYXMgYW4gQWR2
aXNvcnkgTm9uLUZhdGFsIEVycm9yLikuCiAtIEN1cnJlbnQgS2VybmVsIGNvZGUgZG9lcyBub3Ro
aW5nIHdoZW4gcmVjZWl2aW5nIGFuIEFkdk5vbkZhdGFsRXJyKAogICBDb3JyZWN0YWJsZSBFcnJv
cikgYW5kIHRoZSBkZXZpY2UgZHJpdmVyIGhhcyBubyBjaGFuY2UgdG8gaGFuZGxlIHRoaXMKICAg
ZXJyb3IuCiAtIFVuZGVyIHRoaXMgc2l0dWF0aW9uLCBzb21ldGltZXMgc3lzdGVtIHdpbGwgaGFu
ZyB3aGVuIG1vcmUKICAgQWR2Tm9uRmF0YWxFcnIgY29taW5nLgoKU2lnbmVkLW9mZi1ieTogZGlv
LnN1biA8ZGlvLnN1bkBlbmZsYW1lLXRlY2guY29tPgotLS0KIGRyaXZlcnMvcGNpL3BjaWUvYWVy
LmMgfCAxNiArKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3BjaWUvYWVyLmMgYi9k
cml2ZXJzL3BjaS9wY2llL2Flci5jCmluZGV4IDUwODQ3NGUxNzE4My4uNWRkYzk5MGM2ZjQyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3BjaS9wY2llL2Flci5jCisrKyBiL2RyaXZlcnMvcGNpL3BjaWUv
YWVyLmMKQEAgLTExNTQsNyArMTE1NCwyMSBAQCBzdGF0aWMgdm9pZCBhZXJfcmVjb3Zlcl93b3Jr
X2Z1bmMoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCQlnaGVzX2VzdGF0dXNfcG9vbF9yZWdp
b25fZnJlZSgodW5zaWduZWQgbG9uZyllbnRyeS5yZWdzLAogCQkJCQkgICAgc2l6ZW9mKHN0cnVj
dCBhZXJfY2FwYWJpbGl0eV9yZWdzKSk7CiAKLQkJaWYgKGVudHJ5LnNldmVyaXR5ID09IEFFUl9O
T05GQVRBTCkKKwkJaWYgKGVudHJ5LnNldmVyaXR5ID09IEFFUl9DT1JSRUNUQUJMRSkgeworCQkJ
aWYgKGVudHJ5LnJlZ3MtPmNvcl9zdGF0dXMgJiBQQ0lfRVJSX0NPUl9BRFZfTkZBVCkgeworCQkJ
CXBjaV9lcnIocGRldiwgIiUwNHg6JTAyeDolMDJ4OiV4IGFkdmlzb3J5IG5vbi1mYXRhbCBlcnJv
clxuIiwKKwkJCQkJCWVudHJ5LmRvbWFpbiwgZW50cnkuYnVzLCBQQ0lfU0xPVChlbnRyeS5kZXZm
biksCisJCQkJCQlQQ0lfRlVOQyhlbnRyeS5kZXZmbikpOworCQkJCWlmIChlbnRyeS5yZWdzLT51
bmNvcl9zdGF0dXMgJiBQQ0lfRVJSX1VOQ19DT01QX1RJTUUpIHsKKwkJCQkJcGNpX2VycihwZGV2
LCAiJTA0eDolMDJ4OiUwMng6JXggY29tcGxldGlvbiB0aW1lb3V0XG4iLAorCQkJCQkJCWVudHJ5
LmRvbWFpbiwgZW50cnkuYnVzLAorCQkJCQkJCVBDSV9TTE9UKGVudHJ5LmRldmZuKSwKKwkJCQkJ
CQlQQ0lfRlVOQyhlbnRyeS5kZXZmbikpOworCQkJCQlwY2llX2RvX3JlY292ZXJ5KHBkZXYsIHBj
aV9jaGFubmVsX2lvX2Zyb3plbiwKKwkJCQkJCQkJCSBhZXJfcm9vdF9yZXNldCk7CisJCQkJfQor
CQkJfQorCQl9IGVsc2UgaWYgKGVudHJ5LnNldmVyaXR5ID09IEFFUl9OT05GQVRBTCkKIAkJCXBj
aWVfZG9fcmVjb3ZlcnkocGRldiwgcGNpX2NoYW5uZWxfaW9fbm9ybWFsLAogCQkJCQkgYWVyX3Jv
b3RfcmVzZXQpOwogCQllbHNlIGlmIChlbnRyeS5zZXZlcml0eSA9PSBBRVJfRkFUQUwpCi0tIAoy
LjM3LjMKCg==

--_002_BJXPR01MB0614C01A9523786117B1F1CBCEC8ABJXPR01MB0614CHNP_--

