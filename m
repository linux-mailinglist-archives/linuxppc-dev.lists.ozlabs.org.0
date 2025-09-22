Return-Path: <linuxppc-dev+bounces-12506-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB52BB9184B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 15:51:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVkzW6CMTz2yxN;
	Mon, 22 Sep 2025 23:51:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758549079;
	cv=pass; b=dgIkNzi/UUwPUvXBcZtYa5wDI3Ow02dxeI3HqMwlOef03ObxlQ4VEzGEj6sToloKlvRY6Jtsa3ZmsRJyj6xapferszvpVbmYspv5AyaYYibaiS0fgSC64D48oKTWHaAfapsKvpcWHTXhoHVu0dlHOp+99hEQdcsP76wq2SJ9q1AazBJzvhe0nYEhpNFitjEP3dHSGzV42CW1+0F2Wkogg3so6C7BS/1W1yspSK9MiufcM+X0rvlQvbnZPnDC6URPHR9M5EX02GbTW/TReDW66l3Qqxz8tpq9ZMacGLkYmt9ZS2YcV5pUx3NafVnyQIqRC5uYuZUIVOqEXilsmqKDXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758549079; c=relaxed/relaxed;
	bh=5Dzs1CFNieqJPIjw9N4ItQfiTY1jRXR3oUqOQmWstcA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=glYd1CDXEREdq8B4idyp84bzVLs70DgGV9Zz5n5aeabpQETvEiWonntqBj610TMDE9WP0yO8YSq3jPDT+mHrQZluJs8AxJBSLf2RhCs6BWX+892cLJQ0WaGLD4fKcfACatWgWa6+1WBJd/gZNivfae86m4u3yk+VjUzmyXAKx+RAg6qbS/C2YnGTWEe3a2BF4OF3xqrJlZgim9r3M6CfwKHWyBnTgYP3cg1+W1SEQrK6SscES1OXXTHXXhqKrf+yGakH4R4mIKJyeQIP9FBSeA8FbTHNfurK+MfINJbqU5Vqs90JQ71MQcqvYLL2Nel1zmr6gv3/L8sW/RGUcInAdg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=nTWTxCPl; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=alexander.sverdlin@siemens.com; receiver=lists.ozlabs.org) smtp.mailfrom=siemens.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=nTWTxCPl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=siemens.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=alexander.sverdlin@siemens.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVkzS54WWz2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 23:51:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqcIIFs3LQTVH4jdVMQkY3lxDLTkbPKAqkMcvpkpIKUluE3UDYGvcNNWyHoF+WXwfMv/ZLZ106HgQvzea7UGk/E8nt1ntA/f+yVfud2eHHiTWqpSprMLajqEw0pKr31Y1Vmq8SkxprQWyFW5FL811+NITmxvJO2GlfZV6I5iX4LNUmcAUTlbFDYkuCtvPK7eDEikBvr4sTXopEeb76fn44vgBcAfOb+GOHHjv1FQCU13KIDNLmcdnADKlAKBmqpFlyNSqykUC85PjWTQTjU3jpqtXGR1bnACo+x6jAzKEEjHlvnGBEPk4UERTcAoTA59rR36bm3zlbOM0pNRYwwW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Dzs1CFNieqJPIjw9N4ItQfiTY1jRXR3oUqOQmWstcA=;
 b=Gi4vJpzksYIw+7FrkFGk76E9uS66m1o6e/baXkBkj8kt+OwhLF3gO1IYei/mUAiB/+E/Nta1d2+V/tIA0/wvrth9CjazA8Mvf+25R1JD65ioREiMfpmeQvor/+7YJ8Z5J9hhAo/tvBgGV1/Z9nbttICcW/ndef2zAUT9jrr4NFGRcK/Fma/aq56VxCbq72AXtKIfSOAZKHzVK6RbMk/rU6xSr8Ncgk+310APQWpsX70dNeMFP00ubn8u0oa1p7S/ZNUgHr8BXg6Lg0tBvRd4Tymt0dJFQjVUdMfCeP30v2MieL8Wmd9O9XVe1z2pCfAZ2CR9BqmseVv4jKMPpyrSAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Dzs1CFNieqJPIjw9N4ItQfiTY1jRXR3oUqOQmWstcA=;
 b=nTWTxCPlZgHsW3KqNBg9w02rDKb1pvNCRRkONq31758tNwT2QO+FzBQxUeeMVCYeippuFCVMDiBmgRPVmVJdEbcO3VIyZyLhsC0wzVrI0thfxgIKOzYkDi3aNGzh6Xm34GOQOIhXQUeF1K5L0MBHnPb7m1plX5IHWirFhFvUWA+Km0u0CiKHhhDngO8RybbN6irCxKo2tdYCI70k3Vprzo+krhFlVUvZ366TxyLmumCEeQL18MMnhUzDDuf01jkzIaCJl3NefOwzdLkNA36FXvgVaClUJhWGfsLxEzqlFYkPBzyWCh+2tZFFlPS3YfW26wSodOUFZQ77OzZsXMQQ4w==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GV2PR10MB6933.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 13:50:50 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 13:50:49 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>
CC: "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, "Marko, Peter" <Peter.Marko@siemens.com>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>
Subject: Re: [PATCH] powerpc/Makefile: use $(objtree) for crtsavres.o
Thread-Topic: [PATCH] powerpc/Makefile: use $(objtree) for crtsavres.o
Thread-Index: AQHcKV8Mhaq81KLZDUqiuO5QUGM5IrSfMTgAgAAL1YA=
Date: Mon, 22 Sep 2025 13:50:49 +0000
Message-ID: <3222e5620c518eba6340bb381ea0f9b22859d234.camel@siemens.com>
References: <20250919121417.1601020-1-alexander.sverdlin@siemens.com>
	 <2fa11e77-0844-4432-8514-0d1e1b2222c9@csgroup.eu>
In-Reply-To: <2fa11e77-0844-4432-8514-0d1e1b2222c9@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GV2PR10MB6933:EE_
x-ms-office365-filtering-correlation-id: aff72180-cda1-4365-339e-08ddf9df09b1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VHdOZlpZbGl5L1Z4dWRkUDZUOXFKUmFDeVhoOTFhMzFTN1A5V0RUL0krR3NB?=
 =?utf-8?B?Mno2Mm1obno3Y0VobUdNanJTenowMkRBYWppUThPRlJNbEhabW9FRk10dHFY?=
 =?utf-8?B?eC9vVHBGOVhQT3JXQjZPMW4wWXJreFhnSTFZSXlDVkkzVU04QURLMW9mRlds?=
 =?utf-8?B?d010NXVxdzFWSUdYVE5NTnpYWFFOR0dxRlpjRjR5ZW9EZHc0ZDczemdWdkRQ?=
 =?utf-8?B?UGNoR1lPMUdHa3B1YUJzM1VzT1dFTVNrT2dESlBKeXA0SUM4MFVzQlFTN2g3?=
 =?utf-8?B?ZGUwM283MFNaZFgyQVBQbktuY0dCbmttb1pXZm9ybGM4eXphVURMMDlXOXJk?=
 =?utf-8?B?MHJoQjJRUy93VVNNOXBrdEc5U2lvOUtFVmtIUm90THAvOWZOL0o0dnE0YmRR?=
 =?utf-8?B?eFNuZVZ1Y1RRMG9yekozeVlzTkhvQ3BmakVSNUtCVTNEbVFXMDM5NDdEaU5Q?=
 =?utf-8?B?VlRRSFV5UnNPN1pSRElvZWJyYzFsaFplRDZCVVQ4RTFxWHhPMit0SDFVaFly?=
 =?utf-8?B?WW11cDBscWpVWlRCeStUak5zSzJhY0RXT1p3bmluZVNlWDV6QWhPN21Zak9W?=
 =?utf-8?B?a1pSaEpDNHM4SXhiYVIxdS95T1p6VzNxZFg0ZXMvSFV2YmpNWFpxR2xia0gw?=
 =?utf-8?B?dkRLbE9GZkhoL21DODRINnIrTDJYeUVXMGFmb0Q4WkVQRDJFV3JtbDFtVlRP?=
 =?utf-8?B?WVBIaHNXNlZ5RDlQOXhORVZUNjJINEoxSFd0ZEJtN2RMY1Y0bmVYTkNoVlhG?=
 =?utf-8?B?dERuOTVIaGk0R1BMOHRlRlYxZy9MRHFoQzdXRHNlS0EvcFQyTmRzWlRXNkI5?=
 =?utf-8?B?bnl5aFpiK3MvYzhKSkl4dndtSHltTlZMS08wNGdJU0hXYUh0by92OXh2NTJm?=
 =?utf-8?B?WHYvOTEyaTdYQkE4Y3NXWXVuZEkzR01wUnZJYm5ORFh6UlFraG9lMURPM3RH?=
 =?utf-8?B?dHU2L0QxUGpQclRXa0ZnZ05CeVQ0Z243M2UxMzhBVVIzTTF4cy9nclZ2V2Nm?=
 =?utf-8?B?Z3l6Z2M0c29WMDNNckt5Zk1rRkUvcnJROUh4cjYvZGtjZmh2WXNBWE1nVk9a?=
 =?utf-8?B?QTBkb2hlaktSSTRsdVRXbXJVaVp2d21HajFSTCtGNHZxOFYreGVENnBUS1JO?=
 =?utf-8?B?a0pJTk1UVkJYak00YUNUczlrSUp5VVlJTnRNRHRsbHBuMlUxaEdNcDdjN0pG?=
 =?utf-8?B?bzRwVEtXd2Z3TUdmSjM2LzFlQlYrWXE3TndIbndTdld1VTZFdjBseEozSExr?=
 =?utf-8?B?SlRhUzNOb25kdmV5OXgvT1BhUXhRMVluUU4rK0VnekNwUFFxVlhwSXcvV1Fs?=
 =?utf-8?B?Q21Ka042bGJMYWZvSGNxSGlkd0NRUThWSjMzNXY3R2s2MXhSVFY1SWl2Sy9m?=
 =?utf-8?B?dVl6NXd2NGRiTloyWHRuM3VETnc3Q3hJdkdCcmV3QUg3K2t5UnFCTlV0a1R4?=
 =?utf-8?B?SkJoK2diekU1clZzK1hYbGdGcHluN3J1NmZrdExBZkZBdTFGMVNORjlEQnFR?=
 =?utf-8?B?czQwQWdwc1JoRFNYeG5oRnR3MDA4Z0lBa1IzR2ZjTDB5WXdQZ3kraXVtSm5U?=
 =?utf-8?B?ZnZPRFhFRTRVRHpMa3ZZWVdkZ2VlZHAxTThuT2QyMjhkRlJDRzNTNTBNbmxH?=
 =?utf-8?B?OE42dlR2WWZXakcvUjNNMWdGSkYwc2VhVGViU0w4Q3pwZDJzMFA3N3hsMGFV?=
 =?utf-8?B?YzVub2UvRXRaMFdTZ3hrekxFZk1FbU1lOXNqY3BUT3VpYkI4aU1DVEhEbSs0?=
 =?utf-8?B?b1NHT09tUWhSZVd0L0RjeUVHejdRS2hSTG5WTnVUQXhTeHpGSTROd0NoVUNx?=
 =?utf-8?B?b1Uvc1B0Q1ZLYjhUTXhMWWtlZTdtYlU1RXZxR0VwYmpCNWxId1o5NXAwbFpI?=
 =?utf-8?B?aGtJUGhrMFB3eURFN0pJK3Q4QTIwdzZiLzRrTWUvN3kvRzVFNzFabEJWUEQv?=
 =?utf-8?Q?pcz3sph+opE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MkhDQnNpeDVNSFhCeVBtL0NvT2VOYkNBeWZsTVNrdU1rdzZ0TkJHN295YXpr?=
 =?utf-8?B?emhMVmY4My80OXZRRUQxcEkwZW4xdmI5WlZRdlJpT0lzK2NmTWYxdGo3OW0r?=
 =?utf-8?B?aEtxVlJRbXRzaEpMTzg4eXlLVXVHWVU4UnZQRWNERjA2MXJIbno4ZUJ3WTlB?=
 =?utf-8?B?TE9MT2lCdkQwdmY1RVhIMnd2aVpNZHpaT3dqL1NzVWVIUDJUcm5VeHFMWGtB?=
 =?utf-8?B?MG5kdW9pODdudE5ENnkxMlpKMjlFQkZMMHR6UnJ0cWRWZWdFTm53aUtwV1N3?=
 =?utf-8?B?N0d0UjRxS2dOSEdLeXY2NXJPOTFmc1AwanE5OGxMTXRUNGhEWmRqWFkzTjUw?=
 =?utf-8?B?d2pIZ3NVS0pMVU1hTGJHeFA0VkNvNmJaWUxZUjNPY1I5emVLOHV2N1c2TGlW?=
 =?utf-8?B?dDBzajBheTlsMzRaWHpMMUNqUXRpY0NrbXh2K0JrWWI3b09VWk83K2JRV0FI?=
 =?utf-8?B?NzZvOS85d1JXMis4eXV6TUhhK3pxR01GZmgzcUN0Wm1BYitESCtTUlJjdS90?=
 =?utf-8?B?YVliWmxlengycC9HL3hmdHplTGhOUStmODJVV2o2Z25LTEhZTGJKUzNyZlll?=
 =?utf-8?B?M2UzK1h0dUVjVjhhcUV3UzUxUFBiR0EvRHRuWHgyNWpySjg0YlF6c2dadncv?=
 =?utf-8?B?eTAyTWswdkp6MklMOGlJUDM2eWpIMXZTL1hGMmwwcEpiZXJGN0JHcEZEWE9r?=
 =?utf-8?B?eGpJaUVVOWUrTm5rSTk0Z3hhUEZzZEs1QjkvV3IyUUgxcWhUR0syK1BRQStH?=
 =?utf-8?B?dHM3VGtPYmxSdmRaazlndFZEbGp4QnF1QVhNSHhxYnBmc3VZc294dDRnYmo0?=
 =?utf-8?B?MGo4czZQSVJ1OWQwaFkwWXdWcXRVS2ZlcEpZdlZGcWNHRzdwbzJRZ3VGcUZP?=
 =?utf-8?B?OWYrb3Fhbkw3cldQcXJ3RmY3QU5CeVhPVTBNY3lERE5VcHl3TS9OcUdKRS9s?=
 =?utf-8?B?TnN6MjVrdHdRWVVSNSsycHgrSnMzeUEvTkJUdWxuWFUzQW9zeTV4SUNRRUdX?=
 =?utf-8?B?SGVPdUpNbEt1SkFNc2tlZ3IvYi94N0UyWGRvblVzcU00UE0wU29VdjFMQ3ZD?=
 =?utf-8?B?L21MVFpzVHgyellUZmxNRGFsbUVPLzd4QjFmRm5qS2kvNENZNWI4dDU3UC9i?=
 =?utf-8?B?Mm9NNlJJMUJHUVJEdUNqcyt2YzdSVnZoaU5iYVZmUnZpNWl5bC9tL1M0SVN1?=
 =?utf-8?B?bkJnWm43bzVEeWx6eWduV3VzdzFMeWJuQk5hTlcyUm81YVVseHhHcCtXOHh1?=
 =?utf-8?B?TDcrUVZ0Z2xWRGx1akpmNFMvSEltdDRIblVYZlNTWnFaOXVyMVJpWlZnaFph?=
 =?utf-8?B?ajFOanhFSjYvL24wTFduMmpFQmNMN1pGNVZnWURnOHhLeG1IZFdCVWJsczNB?=
 =?utf-8?B?ODROWlNKRWE3blBLcEM1YWJkdnBDaGs0WEVrcEw2SXZmRWRhSVV1UUFha1FB?=
 =?utf-8?B?NGJSMGwybDFpRm12TWhLMDhYSWxHMGxFbEIzRzZYM3Z5SlBhbEJtUURzZjV1?=
 =?utf-8?B?b3p0VEdkbEdQODM5bWZJakRFcGpzbzVmZnY1YUkycXEzcUVzUDdqejNtVmx6?=
 =?utf-8?B?VU9YODJRLzhGdnJyQ01XdlZmNEFrbnZ3RnBONnBwUHpxUXNnMDMvbVNpb2ZV?=
 =?utf-8?B?OXZwb0d5YXozN21MNDNxMHhpWitZbmhmTnhrT2x1ckQzRW5uQ1pUNTF2V2tP?=
 =?utf-8?B?VG44dTV2OGRxOC9WOThsbitUSmxkS2dxYmpzOVFsOFN6T2VFaUdLSkpPNGF3?=
 =?utf-8?B?eHUrY3VoY09YRXRRazR1NytIc3dmZFh1cUVZUHZabjJ0MFJ2Um50b1E2c1pj?=
 =?utf-8?B?OFpzQ21LdVNBWW1ZWDFUV1hCUTFnZGJPTE9oRndZWGdwaU0ycmc4cWhkb1Rz?=
 =?utf-8?B?ajRLOVZHYlpVb0J3YkVQV2xTTlpoSUpBMjZwOVJSeStidDczVjhiWHQvV2JM?=
 =?utf-8?B?WDdxcEpTUEx0WVhZSk41aDA3RDRBN1IrM3FSZUtGcXd0M0o3d2tNdjNUMW00?=
 =?utf-8?B?QTArTCtXTTRkM0ZzUXVSb2V0YU9odTIrUDNQQlhWRHdVdjNGQkh1VWsvWFZZ?=
 =?utf-8?B?RnJ6RmhTL25JUTFrS2FwUVhoaEZISWpMdEVUTE1PSDlNbEV2RExIZ05DQ0VU?=
 =?utf-8?B?Si9lZjhNVUxhcTFOQytZcVlBMy9RdUF2N0lCcHhwQmI5YTRsUVpldGxvVHg5?=
 =?utf-8?Q?ZRD/vQahj4uH5JhKZ4QpKPw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10D5FA3C7BC16F4A9AE9146585B2251C@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
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
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aff72180-cda1-4365-339e-08ddf9df09b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 13:50:49.1583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j0tw+c3UUhB6dvn8kwRDqECJQBVBB01WvPZA/8B0sqH5Up5qwC3gt08hVxMbBGdjnwmESxFC6Y+HQrwve8MKt3BZyV+vlQZDaibAPAsVGn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6933
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgQ2hyaXN0b3BoZSwNCg0KT24gTW9uLCAyMDI1LTA5LTIyIGF0IDE1OjA4ICswMjAwLCBDaHJp
c3RvcGhlIExlcm95IHdyb3RlOg0KPiBMZSAxOS8wOS8yMDI1IMOgIDE0OjE0LCBBLiBTdmVyZGxp
biBhIMOpY3JpdMKgOg0KPiA+IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJp
ZXJzIGRlIGFsZXhhbmRlci5zdmVyZGxpbkBzaWVtZW5zLmNvbS4gRMOpY291dnJleiBwb3VycXVv
aSBjZWNpIGVzdCBpbXBvcnRhbnQgw6AgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklk
ZW50aWZpY2F0aW9uwqBdDQo+ID4gDQo+ID4gRnJvbTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4
YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+DQo+ID4gDQo+ID4gLi4uIG90aGVyd2lzZSBpdCBj
b3VsZCBiZSBwcm9ibGVtYXRpYyB0byBidWlsZCBleHRlcm5hbCBtb2R1bGVzOg0KPiA+IA0KPiA+
IG1ha2VbMl06IEVudGVyaW5nIGRpcmVjdG9yeSAnLi4uL2tlcm5lbC1tb2R1bGUtaGVsbG8td29y
bGQnDQo+ID4gPiDCoMKgIENDIFtNXcKgIGhlbGxvLXdvcmxkLm8NCj4gPiA+IMKgwqAgTU9EUE9T
VCBNb2R1bGUuc3ltdmVycw0KPiA+ID4gwqDCoCBDQyBbTV3CoCBoZWxsby13b3JsZC5tb2Qubw0K
PiA+ID4gwqDCoCBDQyBbTV3CoCAubW9kdWxlLWNvbW1vbi5vDQo+ID4gPiDCoMKgIExEIFtNXcKg
IGhlbGxvLXdvcmxkLmtvDQo+ID4gPiBwb3dlcnBjLXBva3ktbGludXgtbGQuYmZkOiBjYW5ub3Qg
ZmluZCBhcmNoL3Bvd2VycGMvbGliL2NydHNhdnJlcy5vOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0
b3J5DQo+ID4gDQo+ID4gRml4ZXM6IGRhM2RlNmRmMzNmNSAoIltQT1dFUlBDXSBGaXggLU9zIGtl
cm5lbCBidWlsZHMgd2l0aCBuZXdlciBnY2MgdmVyc2lvbnMiKQ0KPiA+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnDQo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4
YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+DQo+IA0KPiBUaGlzIGNoYW5nZSBpcyBhbHJlYWR5
IGRvbmUgaXQgc2VlbXMsIHNlZSANCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L2xpbnV4cHBjLWRldi9wYXRjaC8yMDI1MDIxOC1idWlsZGZpeC1leHRtb2QtcG93ZXJwYy12
Mi0xLTFlNzhmY2YxMmI1NkBlZmZpY2lvcy5jb20vDQoNCnRoYW5rcyBmb3IgdGhlIGxpbmshIE15
IGJhZCwgSSBkaWRuJ3QgbG9vayBpbnRvIGxpbnV4LW5leHQhIFNvcnJ5IGZvciB0aGUgbm9pc2Uh
DQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20N
Cg==

