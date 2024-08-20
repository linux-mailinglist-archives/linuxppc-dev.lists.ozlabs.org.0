Return-Path: <linuxppc-dev+bounces-221-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DD39584AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 12:35:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp5St6WhGz2xKg;
	Tue, 20 Aug 2024 20:35:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::62d" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=hvEWAtLX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2613::62d; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp5St2nYGz2xFt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 20:35:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOYIMCM/CdGbDn2xmJtBur+e44v8tatCnu1epTqpzFpywXNZY0NEwrZHsLcQSnbSxUIpXuvbw8q0UuhdvNc+try9a60nBngYAwS20hHa1H9mcgNDLwsP1851zR1vFX4Y4Elw51i4n/vHnh4lbKaFwGNnUYft6H3PnFphM0dtjnSXmDLzM4pkuS9boFs3d2iUv9dCZEAN49hYbOEs0rbX4Gea86quO7WofGmGFCntsFMQnqsWuHNsPnkilkhTGoha8qlfDnA5Qdcy7mQI+ZTX1vD/NfASszr6Qql6CrhAc/GgXHsgeFj2mmyKCeog5iAwGMANjqWKAJFI6DCutT1V6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNNWw4DuXPMJ4vTv7AZsYYJXdRznZsYrVYW4HvzQp1E=;
 b=jCn8tboNgHGLZPrNLlir7N8r4/Veo845FBc3ip6nRp0qEU3tNJqiJD9UyUTJh7CtxSKVDO5zx2ju/4whpKxWhmeROpOnASegHr65TqyOG6TvW9aiB2S2jl7l3h5bLLv8qsvJCVc4nStbLs7yx7HuXThXq5jfKulTIYLXIZ5LSQM0f0GzUmAocj7/8OT2b/fY1WPK92JnR6gFcnZf9VjfZ1jVQPclfeikC92VHOj8EFujmH3idQ0eYNsf5SeWJ36DZ6DqYujNU3IQKHbYLZZTBApS9pe8J7mkvdLshvN6RP+VpYF5HgeFpaebkV/HzZbgcpJrXBRTN6iyRrjp0RuQpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNNWw4DuXPMJ4vTv7AZsYYJXdRznZsYrVYW4HvzQp1E=;
 b=hvEWAtLXLx+0LkMmxUr8w45AxUC6jUILOMrOjd6MLgd220+JHv0G1YQkOUExeM3+3fPps+fHOaew9ZWFv69CdP8n/HBp/nI5QPAdZb3h491g6rWZs+Z3naD8F+VgJ/OxPuFg4Jumsy3kLbh8fCTeRgjXrDTZXZtsyUEF80XR2e8WIB92LcAoHdTddAE816bui+wWfYGUbm5kxzUZaRM8XArF4sSmjBHCAbY333637FbW2Ad4FdPsm6lCOjtKPBo1Go3fVOoBfwIYsjvN8WKZy/V8T73HGYk4uTnSe9r0QafOqlxugYCFuMQm7oURrZE0mqUylAbo8VpE1dRGd9KRnA==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by AM7PR07MB6643.eurprd07.prod.outlook.com (2603:10a6:20b:1ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 10:34:47 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 10:34:46 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: "Amori, Alberto" <Alberto.Amori@duagon.com>, "helgaas@kernel.org"
	<helgaas@kernel.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: Question about AER in latest kernels (text format)
Thread-Topic: Question about AER in latest kernels (text format)
Thread-Index: Adry1iiMmzIfH6wMR2SKLqe5Prk8SQAFmmoA
Date: Tue, 20 Aug 2024 10:34:46 +0000
Message-ID: <cd4c1c76-5457-4da2-9d95-2a52d44db378@cs-soprasteria.com>
References:
 <GVAP278MB0119BBB30DC2065981D978B5968D2@GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To:
 <GVAP278MB0119BBB30DC2065981D978B5968D2@GVAP278MB0119.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|AM7PR07MB6643:EE_
x-ms-office365-filtering-correlation-id: cadb1352-ace2-452e-61c9-08dcc103b670
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UkJxb2JMVnYyRmZvZHdPNEtTenJUdnVxakFUTThhOThTcnljUHZFdkJHbGpp?=
 =?utf-8?B?TkxxdU9JUnpqcU9rUUsrSlNJbTMvNG9hcFFaQ2hiYnFHTXZmV2xGUlRuc0Fm?=
 =?utf-8?B?RkJlR1hudGN5SmRJYWNUUm9vbzlSR2FMS3lXZ3lHVjZNYVhlSjQ2T0VEQzkv?=
 =?utf-8?B?Y0xuMUdLWE5rOHZ6OGcrdHVXME5Hc2xoSkk1Q2wwdG9tZXZVb3BaTmU5dVZH?=
 =?utf-8?B?THpnQlVZYU04WEJvaGJ1YTc5Y05KVlhRQXJnMkQySW5halpXdlp4K1VtYjJa?=
 =?utf-8?B?d01uZE9kN1RnbFVmWjhxMHFJZDhrMFpuRlFrdjY2ZWdDaFRDeVdhdldkbk4z?=
 =?utf-8?B?OE41OEp5djRFWkpqNGZHdnU3bDV3OHl4T0d3M1UvS2NpWVlxa01VU1lWVzdI?=
 =?utf-8?B?YWovdHZuT3ZPNXdjdmJseWs1UmRZdkF5VHdNZEVaQXpMNm9WQWFKRGR4bTFJ?=
 =?utf-8?B?VUxZSE43MnJhZnFPbTRGREhkTnFFdEN6ViswU0hoRFBFWE8xUVNpS3ZXT3Bp?=
 =?utf-8?B?SXhGTURBN0c0MnYzbVgvaXhoYWVXUTZicSt0YjFiV2R4STFJanVrOG4rUGhu?=
 =?utf-8?B?QmRXQzFpNEIra1VnNkxuK05VK2V1Vitnekt0b3dEKzB4MGUvL25XQmo3RkJp?=
 =?utf-8?B?ZWxQdVNoVVgzdHRYSmlpTWVCMWFKV29tZk8ra3YzaEFFZkdjYmhkTUkxZUtp?=
 =?utf-8?B?Zy8ybEt1dDVNekdpbjd4QjZyWUxRMEpTaXhJYWNRWWt1Z0pjcnJPR0VCMnho?=
 =?utf-8?B?TDdTWmZBZFltRXZENGR4MW9odGN4aGJFQW5vb3VNL1JMR3FlcjV0TERLV2ph?=
 =?utf-8?B?UndlMFZEMVJRQmtVaHpXWW1iTm9DSytWY1NJcjBnc0pQWFI3ME9lWENQbmtI?=
 =?utf-8?B?eE5RMHJuRkJENHhZRUc5R3EwbWRFYkNEb1JIa1pkaDU0Z1kzOTlsLzZLNjhC?=
 =?utf-8?B?anhxUHcrOE9kckdsaTYwcjFlc1FWMDlzZjJIQ1hQSXhhUTVBVUtKa1JteFND?=
 =?utf-8?B?Sk0vQ3c2RWJUMmhuZUg5U3d3NkRHem0rSWJ3OEd1Q3hBcGZGQURqaE9wcFcz?=
 =?utf-8?B?RTM2UHFqNjVoVlBkOEcwSlFoVHk3cXNwNEVjMVJhWVFkTXYzNmRsbG4rejJO?=
 =?utf-8?B?WkdXVS8vbzhKS25heW1ndEJSRG1vZ0s5TzBoL1dQRnhYQmhlVE5sR2llTldV?=
 =?utf-8?B?RUxyYlkybEI5OUs5MEZlUGNCY3cxU0tEeDY4T3ZqUjN5YzVuM0V5dVdqRlEw?=
 =?utf-8?B?NUUrYStMQWw4TzZENkdSRnVsamxxSGtlQTljZWRTd3ZOS3RkQVdjVEVYVlVL?=
 =?utf-8?B?akNBaWFvbi8wNGZGMnBLbm9uM3VuUGZnM3Z1bHE4eHRGQm8waEo1b1NNaHFu?=
 =?utf-8?B?OUZXZVE2QmhndElYajVacGpRdWFIZG1jb1hxSEt3ZDlwUW00ZUhsQ05uTnpS?=
 =?utf-8?B?VHZzVGhIS2pHWkFVblh2MEUxTkdiR3doeTBKYlcwMTV0ZUJSWnIxVmZjZkgy?=
 =?utf-8?B?a21lUUhZV3JRK0ZTNlNWQUwwUHcxaW82KzR0SVRlQzNXem5WT3BJY1diQnQ5?=
 =?utf-8?B?OHdxNWJ0N29WMWhwU1V0OGFQSjhsWTlSdS9Kd0FFUjVqWUsyWUZQMCszM3FZ?=
 =?utf-8?B?RHBLZklGZ2VIaWNmMFpiVW0zWE1iZEhqYmFMeC9YM3NybE15VHNncFB1cDJU?=
 =?utf-8?B?bkRLcUd0TS9TbkRZNnl3Sjg2MDBXaGk4czdvS29QUkZnMC9KeFN2YnR5Y2N4?=
 =?utf-8?B?SWZONjhJK1MydWVxdWw1Z0RxK25kQjJxdVFXWk9NREx4V24wNFdyTkRIdWZ2?=
 =?utf-8?B?bjNOMDhrSnlJL0pJZWpmcEUxNGVOWDVlYldGQnFINWJpTlZrR0hiZXhWREh0?=
 =?utf-8?B?Q3dsajl4UFlsWWpxeUdtTGRMSmRMZDlOMkJkNnd0VEdhNmc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGZ5TFNCczVyNXU5QlNISHlaUWZ0a0JGcFAzU1NJdHlFbmlCZlVGLzVaa3d0?=
 =?utf-8?B?TjdHbnpUaWJaQjMyemJucTR3MHFtbzQveFluMStVSm1KckYvdkFiWS84cFhy?=
 =?utf-8?B?UlBNY09NTk1ZNko3Zk4wSURib24yaGduRlpCMkprdDByNTFVcnlNK2JLUTRE?=
 =?utf-8?B?RldyQ21MNHZWMXkxTDJrOHpHZWcrZEJSeUVqUDhDdUtGWkp4czkwSnY4NG5M?=
 =?utf-8?B?ODRocHZWRXVqeXhsMzR3bGNORTdJamhLaXdOMEEydXRoeUVrc092dWVncnYx?=
 =?utf-8?B?MFJxZFBhbzJzMW9Tc3RnUzJjbzdiWUhaaFFQSWc3NFhhMnVHVUo1bCt4MC90?=
 =?utf-8?B?NksrTStxUUlrcGNVUXY2d1dFZkZDU2lROHVyZGFnODNnOHQyQkdRa21TTFdn?=
 =?utf-8?B?a3dlRDNpbjVlT2NTaHFmT3dDWGsxbUI2ZnFkT0lQVlZhZGtCeFBjR3hDK3h1?=
 =?utf-8?B?MzVoK0pNdFhQYWdMaHppU3N5cERIdmIxb3ZOSkdFY2k3bWF4eXF5aUpobEUw?=
 =?utf-8?B?cjdtMml6RlZhbGJjZGNzUXZIaE5XRjlxUFdZQ0szVHEwWkZZV0J1QmZZb3VC?=
 =?utf-8?B?R3JEL0cyYmRqTXExYTAwY3E2YWx4ZUNQK08zNndZTU1iUlYzZUF6Wks4YVU2?=
 =?utf-8?B?U0FpdHM0dHdVRGRsMXpacGhEVDN5MU0rR2VESTRpUE92Rzd6RURZd0k5TFJH?=
 =?utf-8?B?L1hiWlloSjdXdEUvL3kzdDZESmNueDJvVkUzeGc2cUZ3QUhKbm5WWVZHbVV1?=
 =?utf-8?B?Q0dSMDVkM3gwOEkrN2RvZm1mU3RKZi9DazAxWERLaVpxNmpWYTBxc2hOTDF5?=
 =?utf-8?B?Z0dGQ3N0dTkyNjJ3UGtJWk9zNy9FekFROW56QnlSMWZIaTBqWlZVWm1JbkJH?=
 =?utf-8?B?TmJ5K3MvSDFwUG10VkJKWno3NUdGd3NpU3V2NmJ3TkxrRmh2a29tMEFFUHVW?=
 =?utf-8?B?MHVKL3B6Q0xsSmZaa3k0M29HZUl6TDVaK2hnVjNvMTM2blJPUkllb0FHdVkv?=
 =?utf-8?B?aklQR0xQOHF1YVVLdkI2ZVBFanMrZzlHNUwxYXhmVkN3RTk3OWp3SkR1ekM5?=
 =?utf-8?B?N1pmeEx2ekhzZzRwZVNEM1hrU2hCNVdLVWdMY0padnRmcVIzMXRtVUs5T1pl?=
 =?utf-8?B?cHNrNDJVQ3NrcmNUS0hscmtLTGJDUDMxQTQ5cCtmMEV6Uk5xVmgrWWhadE4z?=
 =?utf-8?B?a242bDgrMG1vbnEyYjREZEFZVGd3WDQxMVBQcWVnbGhLZWF6c01lT3hLUFJ2?=
 =?utf-8?B?S3RaUEJPdzM3VXJ1U2lXVG9ZUmZNSVJRSllhakVMbnozNEQwY1hmVytxWmJh?=
 =?utf-8?B?bUF2WUtkOWFJakE4SnVza29VTW1MWlV2ZHNJQS9wOEVRWCtDejkwMzBKZFhV?=
 =?utf-8?B?ZDAxRHMxNDVvejNBdldrSkFGY09FK1V0ZVZQUkdxeDhjQVlZM1ZhbEhZdmhs?=
 =?utf-8?B?WHJUaDFJSWsyVTBEeTczbkllcGk0VTlpQVArdUdiejBtWWp2M2pRU3JRWW9J?=
 =?utf-8?B?YnV4K2pMWkE3VElzYVJTMHJMZ1BNdEFjQTJBWWVGWVBoaGwzVExZdFhHUmxa?=
 =?utf-8?B?ckdhOTRUNE5vZ0orQXljQWtTd0x5Rm9XLys3MUxIY3dJWG5oMmhmcDJtSDF1?=
 =?utf-8?B?WDcwNnVRckFZam83cnRNblpSTjRlN0tYdkhmK0MrRm1CL3hEQk52bTFyOHZu?=
 =?utf-8?B?MUxDaGJaZW94WWlsejlUTGdoSjZ1bkVOQ2VBc0xBNjFHVEVjU01tZGlXNEU1?=
 =?utf-8?B?MHhsU1BjUnNJUmQvQm1VSFlpU1l2RFFoc1E2RExTVEhzeXdFZlNlaHd1SFNy?=
 =?utf-8?B?akM1d1J4WDBWUkRpOE4waG1FbTJBZlpJSVREcXVKRHFPeXhDTGtBcnYxUjRW?=
 =?utf-8?B?N2sxekI2Y1NFOC95MTJUZVZRUGEwZE5LYnZEaHZHRFBzSHhQN01OajYvdlhx?=
 =?utf-8?B?WUM2aU96dW4zWW9nU3l5NDFrUWd2VXFuaGt3dXg0MFp2MnpDenVBaUMwUWVT?=
 =?utf-8?B?L0ZENTRlQmJhVWg0OEM0ZEwrd2FNaVpzOWNQSjlyMjNrdW0zSUhSLzRlU29F?=
 =?utf-8?B?NnI3NXpMR0NYeXRxZkNveVV6aGEzbEFtQkxnZXBCRHFGSEdQNS9XL2pObU9G?=
 =?utf-8?B?d0l3L0tlRlpDVkwxdE1QaS9pWkdwT1FybXcxWmp0T0NubDZIRzhEM3k0Nkpp?=
 =?utf-8?Q?GlyZ6KaLaSzzi87tuKt1614=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B609877248CE3A43BC57076B32BEC511@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cadb1352-ace2-452e-61c9-08dcc103b670
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 10:34:46.9304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQ0eobQT/MjYccbMDMg3tEohSPZro21V1V5e43ct1MG9q+ZiMiIxk9woOPr78PKI9gXKD94W7j2+y7HMIvfQx97WDI9lwv6+VhJOvhV0zUMziLEM1i7cOziTl4FrO+sT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6643
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 88.124.70.171
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: AM7PR07MB6643.eurprd07.prod.outlook.com

SGksDQoNCkxlIDIwLzA4LzIwMjQgw6AgMDk6NTQsIEFtb3JpLCBBbGJlcnRvIGEgw6ljcml0wqA6
DQo+IA0KPiBJIGd1ZXNzIHRoYXQgd2l0aCB0aGUgbmV3IGtlcm5lbHMgdGhlIEFFUiBpcyBpbXBs
aWNpdGx5IGVuYWJsZWQgd2hlbiBpbnN0YWxsaW5nIHRoZSBkZXZpY2UgKGUuZy4gd2hlbiBwY2lf
ZGV2aWNlX2FkZCBpcyBjYWxsZWQpLCBidXQgY2FuIHlvdSBjb25maXJtIHRoaXM/DQo+IE9yIG1h
eWJlIHRoZSBjYWxsIG9mIHBjaV9lbmFibGVfcGNpZV9lcnJvcl9yZXBvcnRpbmcoKSB3YXMgc3Vw
ZXJmbHVvdXMgYWxzbyBpbiB0aGUga2VybmVscyA8IDYuNj8NCg0KQXMgZmFyIGFzIEkgY2FuIHNl
ZSBpdCBpcyBub3QgbmVlZGVkIGFueW1vcmUgc2luY2UgdjYuMCBmb2xsb3dpbmcgY29tbWl0IA0K
ZjI2ZTU4YmY2ZjU0ICgiUENJL0FFUjogRW5hYmxlIGVycm9yIHJlcG9ydGluZyB3aGVuIEFFUiBp
cyBuYXRpdmUiKQ0KDQpUaGVuIHRoZSBjYWxsIGhhcyBiZWVuIHJlbW92ZWQgZnJvbSBhbGwgZHJp
dmVycyBvbmUgYnkgb25lLCBzZWUgZm9yIA0KaW5zdGFuY2UgY29tbWl0IGJjNGZkZGMzYjMwNiAo
ImlhdmY6IFJlbW92ZSByZWR1bmRhbnQgDQpwY2lfZW5hYmxlX3BjaWVfZXJyb3JfcmVwb3J0aW5n
KCkiKQ0KDQpDaHJpc3RvcGhlDQo=

