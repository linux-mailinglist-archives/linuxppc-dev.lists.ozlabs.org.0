Return-Path: <linuxppc-dev+bounces-16134-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MANOC1/wcWlKZwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16134-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 10:39:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C10764A8F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 10:39:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxbcq4fnJz2ySb;
	Thu, 22 Jan 2026 20:39:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769074779;
	cv=pass; b=k93qGWmmdyrUGYdgplgOXqABg8fyXN5awFFe5DTcSxArlaXcP9P//3kVkdLe3d+Xhw3tJN1C6MGKV49ycKn2WqAIXXjZjqhkKkphMZYybENC3GF9hQKsuxpZNM4VN5vDxf972aFge4bg68j+3m2bt+Eglb4TQaW5OuuCTRKuiu/ljgQ3Ep5LJn5wUqYySxDehiap4euw1YabLgEQd72HbCmpmJPiGPum6HJDgi6H79M4xdzNLe1NR6LUTk11cZhq2i36r0F6fWsGNXSbb/snUKU+jmuYbUj2Hxk+q64LIygfNScxl6b3Xlhy936nffeQ77T11AqKQyYhNucUhWHaxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769074779; c=relaxed/relaxed;
	bh=vV5utJbXRyCHvulNbzL+DEZer5R2FpBRyfcTT+6vJ+s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XO79I+ppO0k4LR3aacEwwk/rcWAtzYKYsYnJ/93I5zIKJbiggd32jxavlLRt2NaP4AfPreNbQGqWbZZ64U7MPZcpfhgdYR9Gky9fRXM9OdPZKONmf14Xy/8nkRVaHsyL+8Jz2yzb1lg8FF8K3e0foiJ4vEChvY/UpYwX76LKg8cYDG4bufX9X33Dsds5CLuvu/snTjXYPH7tDLI2ZB+fWSP4TTCSDIDM8GEjTWxWY5UlFPP6Srxg2Or00TL9coc+A4Y6lVxzC/opGMn8+SuWl7fsmd2EHeBXNgW1wydmYyeDYQb9F4ui4F59JsdOXjHckLLJ51MbHJG9Y1i0Cyjrpg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=b+tAGICD; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=alexander.sverdlin@siemens.com; receiver=lists.ozlabs.org) smtp.mailfrom=siemens.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=b+tAGICD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=siemens.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=alexander.sverdlin@siemens.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxbcn1GW0z2xS5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 20:39:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WaHxIoUXCHWdw4Bpq715YK7gJV4UQbgTpX13E6X6A4x/J5+m3oPsxNMMHjhIiq+6CS/zDn+IkPB7ioqPdQyvoKQg5tFE+8wVtXlwkIpjQDLjhbBrbjZ4mogSVk89o42BvxGPTQbAB1iHT7FzmW+l8fvP3IO2q+BwYnD3QuTBb1m/Us5euKuukDX2gyJ1RQp8qe1IyxKlxFlLj98TTvsPDt04gNq0RnfTaxFqx2l6knVQtOq+uqfhPdD5eEyUEfy0ltMKmc1k1HB2KW6dVvAZ+z2aS0TGZ+Tk4xA51YC3j/dDM4eKoqQhvjC05UjI/ltw2fm1JhipkJtq5djV7r3RJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vV5utJbXRyCHvulNbzL+DEZer5R2FpBRyfcTT+6vJ+s=;
 b=G1dijDFIn2VMYfAjWBryYcEyxQw6sEiPEjfx5uaIKbaa04/85W2OB6icA15Ef9SjUej6tHVKq16AbydtADV315q4NRPY1CHSHQUICuLKXHRrPW9klmU2q6QApXdOPevylqMacX73Rw0rczTKTbXFmh9hVS5jKRiWc4slqDD1nKJ6JLKPvxjTFlq30w5PeTa8opF9X+0rj7BXn/ifm4TMjlfaTpLO0C8dVPZw8gOxsOA9rUAZh+iL+7G2nrZwrCc8K+Ph/jk/n3PubVqa14LMzoaw5uUGw817PO5sMEacMHki4ZRP/T66RW+lE8WpVMCBGdjyjSQyQHxTfn/kJxJ06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV5utJbXRyCHvulNbzL+DEZer5R2FpBRyfcTT+6vJ+s=;
 b=b+tAGICDzsHXzHls7SVIeKsUwuB/A0Kx3vZIdzEV/fW6ZIQfMMZ/osQ9kdsw/EPS+4EaQsSIXBj1m4Cyr4YwZL+dC+iZw6UpK30xyQFMyiUIjyC+ZruEgH0XwETdQHHsOKG4W6WNhj77gJhDfslnBRWfGN1fyiJfqQfl5LhbrKYk4Fv42HT1OVkoo7zcKW0Lcis8MaoVTP6z6Jlr6xqwAtOUXrZonDVH4Wo+tZD2KkLbOuLK2P3N38vm6h4u8BEHYvSgvfRl6qNw85+tiMr7kFgvEQ1UCJ99V5eojO7zJP6dILQ0SlG2LiW6LdR99GT7IowqxR3clC9MzAtkIDzjgA==
Received: from DU0PR10MB6876.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:465::11)
 by AS8PR10MB7425.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 09:39:10 +0000
Received: from DU0PR10MB6876.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc98:3108:537e:4b14]) by DU0PR10MB6876.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc98:3108:537e:4b14%3]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 09:39:10 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "thomas.weissschuh@linutronix.de" <thomas.weissschuh@linutronix.de>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "luto@kernel.org" <luto@kernel.org>,
	"chleroy@kernel.org" <chleroy@kernel.org>, "maddy@linux.ibm.com"
	<maddy@linux.ibm.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "vincenzo.frascino@arm.com"
	<vincenzo.frascino@arm.com>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] powerpc/vdso: Provide clock_getres_time64()
Thread-Topic: [PATCH] powerpc/vdso: Provide clock_getres_time64()
Thread-Index: AQHci4L1Nn+g7BoVqk+B6EKSr0cEhw==
Date: Thu, 22 Jan 2026 09:39:09 +0000
Message-ID: <f45316f65a46da638b3c6aa69effd8980e6677b9.camel@siemens.com>
References: <20260114-vdso-powerpc-align-v1-1-acf09373d568@linutronix.de>
In-Reply-To: <20260114-vdso-powerpc-align-v1-1-acf09373d568@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB6876:EE_|AS8PR10MB7425:EE_
x-ms-office365-filtering-correlation-id: fd5c84d1-41a6-4fbb-6a95-08de599a1857
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TjdTL3lsd1cxN3FrYVJJQ0RRWVg3RVZ1ZTl4c21pbWt1SitBU2VYNmtkSlFN?=
 =?utf-8?B?ZnN2OWxYVjcxamQvaFBnUE56SUF6cXpOQzkrR2FDZmZFNlVoYUI0ci9yMEUr?=
 =?utf-8?B?TEtwRVNSR0NmQkUyODltdGVDMHEzK2VUcE9jQ2Q5V0dPN21sTG9oU2d5ODJ1?=
 =?utf-8?B?Qm02RW40WW8zdU53N21RM3RPRXptN3dOM1d4TEt0cmluRVZXT21GMEVsRmdM?=
 =?utf-8?B?MnZ3YTVERGZkejVoSW9veFVOMmYvT2d2OGhnN3IvRUg3aHdHOHoyUG51NGVw?=
 =?utf-8?B?RlMxUGVEZ3hWZFp3UlRPamVjNmlla0xUQkRKVkRGcTZXRWxmdHNIR3prTWMz?=
 =?utf-8?B?SFlXaWxWalNMN2VEWEd1Ry9ReEpVMkYvcTREOStLY3paUVVMd0R4WGZUNERy?=
 =?utf-8?B?WG5VSUV4cFpNNkNMOXFpWUYxYzhaS2hyc1dRV0pHc3dyQUhtS2JOWmZjZDJr?=
 =?utf-8?B?dGgvN3ZQRHJKOU1LdFdQcE02a004cytOQVJvOTBVcVhrcHMzSEVvUmNvNTNa?=
 =?utf-8?B?RnBLNzJXai9xaEdKcmR5UUdoT3dRUHlGVUxGUSttSDdRaVBrNTVJaEZuSWps?=
 =?utf-8?B?S2JwSWNMeXlIalNQTjRYWkRZUHlHaXVJb3IxMit5ZWQyYjdGRGM0Y0QvcXhZ?=
 =?utf-8?B?VW1IajFqK1NySlF4SkQ4ODZ4Ri9UM2d5SktUV3djclRUbzYzYXJEM1hTNENM?=
 =?utf-8?B?M3B0WTdNa0RTRkFNVzNzcnh1MHJWTThjT1hsVmhQWVZFSHlUbEdMZEFWQWs5?=
 =?utf-8?B?N3Z2UkFheko3dTBrUVlwbVpKanZUeVczeStVL0xxL0cyaGhUb29UOGNZWFpt?=
 =?utf-8?B?d3JTdkhCa3ZmcWNXeVBoTENaeXFvblpuNElSNkxmL0wxakJUT2ZOUnNqTzJx?=
 =?utf-8?B?a21nd3N1UVZIdmFUNHcxYm40enNZWHp4VFVyM09YSktsNmVUam9BSmsybjNV?=
 =?utf-8?B?NDJKdHR2bHhkYmRmQytILzhOQzc2b1l6alNYdUZrcmNCN0hoT1BGeTdYU2Fu?=
 =?utf-8?B?VWF3R0RJKzVTQTlKS3RMd2htYk5vcU9nMUE1dDRYTERvQTJHSUVhVytZMzdz?=
 =?utf-8?B?UU1xQ1ZKZ1puYTRXVnVoSmdHUjdjRGtPeU4yZEZqSHVJK2tReFl6Y2ZFS2xJ?=
 =?utf-8?B?NXVqbXBjRC9iNFYyR3lmWFgyQitzR3h5bmxEMzdJQjVXWklEU2NZc2F0c3dj?=
 =?utf-8?B?WVJPbVNwWkNiMHJYWXdyQ1FCSGdXTjNrdUpqUHJzS1lwVFRYekpqdm1DaW5V?=
 =?utf-8?B?ZVpOM0lzbVJZVUN4YmdKSno1czJjODhqODkvcU1YbzZPaEp5ZDZiTUx1S0ZR?=
 =?utf-8?B?M1VMMitsRE1tRis0d3Y4dFlQWHFsdnlyckgxcjJRdWk1NVhESmhXQnJOZU5M?=
 =?utf-8?B?TU5iQ3pPMTBpQ2JOS0Uxa2xnNys1OGFSemJ0dk1KYWZYL1BHdGsxQTZOdldy?=
 =?utf-8?B?Qlc4QkdLOGN2RGsrYnVkNVl5V1V2ZXlMODk5ayt4TjRNeFZNbGRrYVNlRzRK?=
 =?utf-8?B?bGc1QTh2ZG9oTjRaajUzT3lnVkpXLytoNWNNSXU1MW42eTR3UHo1aSt1aE1n?=
 =?utf-8?B?aDRLUTFWSTgrdGRMS0ZYMmRhZTIwVjVMU1RsVWZYZWhSbXRBODkzc1pmQTdh?=
 =?utf-8?B?MTlwSFZrY0swSUpXMDIwckdFZjN4NHV3cE5NYUhXOVNhK3NWRFhYRUZOK3Az?=
 =?utf-8?B?b2NZWTFmQ1QyMWttdUNJNFdYUDY3cUJMWi9SaW0rNE9reE1kSHN6ZUVtV0sv?=
 =?utf-8?B?OXBFdE5SSDBFMTFoK2tHbXY2aHVhMWRuSDhzVGJoNVl6bzgxYWNtTmRzWTZp?=
 =?utf-8?B?RFNhREJweDhvWVVzYUR4a0djVXorWStrc2pISGhMejJaUkNwRmppVlpQY1hT?=
 =?utf-8?B?SkpyazU3UjBnbm9GRFdTOEgwanF6STQyK0JvbkNrTlhrUmEvTVd5S3VhUldY?=
 =?utf-8?B?alA1bEZobk5uL0hRd3pUdWdpQ09kd0d0djdQMjdjMXVJRmxldFJKN3FHUk1X?=
 =?utf-8?B?czdJUEhkVlVKd2l2aUtFazA3cFhyRCtCeUJuV2tuL0ZKNDJFOEd1NUx0bmo3?=
 =?utf-8?B?Y2tic0VVQjAraTVTQUVRcW5Tbis1VDNYYUsvMkZBVkh1YkI2Sk1aR0RNWlRK?=
 =?utf-8?Q?1a6lNuGWlonlFdY4Pkji3TsAS?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6876.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXJ4TnFCazNvb0FEdk1HMXdOUHlFSzlmU0lGR0Z4N3pMOThnMDZFRmhrYkIx?=
 =?utf-8?B?Q3VoMGFpbFZqbHl2RzViK0c1TnEwSVRYMEplVVduK2tMeVVCZkVwdDl6cE1Q?=
 =?utf-8?B?MEQzemJ4RUpxeDZXY2FuLytESEFNbGl4dE41WTVnVGNGK3h0dEkxdWRXRXdT?=
 =?utf-8?B?Vkg1dDlmMXFTb0UzZUtQMGJocmZZbmoxN1BtTXgvc1BGelpZUS9OdGZuZThX?=
 =?utf-8?B?Y05neUUyK0F4Sjd2K0swNHRwMGZ6VFFOODlHV09VWjYydDU1eUJQZEpnaW5Z?=
 =?utf-8?B?ZmVXMFllc0pPT2s0bVJPLzFDdzlVZE0xUnZ0SmdTNTlNbGlTZVNrRVh4azVp?=
 =?utf-8?B?NUplbEVaS1lEWTd2NmRqUmFsTG8yTUlPcFlQSUJlVFJyNHduMUR1MUJNSTNW?=
 =?utf-8?B?aTNKK0VBRGdqZ3cxU2I4S09BaWpydjJLWGpwN0tTdXBUZDJNaWFqcmJwMEpX?=
 =?utf-8?B?YVJWbG9iYTU3M0NhcmxSVktqNWpKRytha2loQndkcnBkL2RxYURsVkljS2h4?=
 =?utf-8?B?ZWFqY09GRWFSaWhxcXB0dUZoaGl0QnZ5dUVzKzlQY1BJMitsVlU2Z2ZXS2Vh?=
 =?utf-8?B?OUc3VWY3YmsycTIxaUdFcWtUaHcvUDJTOEhEKzlZN2FBMFgvTGVxSmpObEtH?=
 =?utf-8?B?ZUI3Mmg0eTB4MXFzZktxQlBHeStxMTZSSFpFUXdhL0tvOHNLWWZnODJ1S1FP?=
 =?utf-8?B?UjdsbHlDTmJhejFsUm15SmZPTGp1a0wxV1pIbDZjeTBGZ3RYVnhIZlBDR0tv?=
 =?utf-8?B?bTlOSTNtK1RCUTFSdjc2aXcvUDZHK2Z5STFIZHJ6RisxNmlaQWJVWWxJdmRF?=
 =?utf-8?B?VTdhdWhDdTREQzVQL3B4UEFhK2FvVEdKaFlEbkN6elQ0V0RCWXR1SE9OLzVX?=
 =?utf-8?B?Wnh2K3dZUUVCYklyQU5aOEhxS0N1QzBjMnFkOFBYQzVIVVdNVnVzcmVlYVB4?=
 =?utf-8?B?YmRHYlArekVYQlFpa0tKNWR1dVJTUDMweHQxY1FkcjMzeE9nZ1crVjJWZmti?=
 =?utf-8?B?L2cxdFpxNmFrOXNrOXVKbGFTdTUvTTcwVTU2VWhFUlBKeW5BWnFWOUdaMHpI?=
 =?utf-8?B?V0xNNHl1a2xFemlhNlBzTmpGTlJPdnZFSUt3anFHNEZWVS9ZL3JQOVRtYTl4?=
 =?utf-8?B?V0dnTVNkb21OYjVrVXZ5Q3ZiamtkZWFDUXJ6M1BoNDZBTWhCcXFBM1B6Qk5k?=
 =?utf-8?B?WlJmSnZuOGd4eGR3MlhGTGFveXBxOGQyU1FHK2lsbHpOU1k3UEJjMGdvd0dW?=
 =?utf-8?B?K1FoRmxxcnFwSDdHRGp2RzVFOERGS3Rqc1ZNSlVlTWpmNEZ0bVphSGZ0SVZj?=
 =?utf-8?B?Z1hycDYwSUxpQXlMSzNqNTh3bDgrUHRaZUtpZ0ZnOUJLSDBvWGN2VzY4Q29S?=
 =?utf-8?B?S0VrbE5IVzErazczcDlFN21vTmdicFRrQklsMW4wZkZkNWtaK0E1YnJYaGpW?=
 =?utf-8?B?aHFTNFJvcVhORkgzbzNRMlovU05tKzRCQW9GdkFoR3V2WlMvMmxpTzRmV1Vx?=
 =?utf-8?B?Q3l3TjFaTmJXUXh5U3pJRndpTXBwdjdWUks5UVZWcVFBVVIzN2RqNUkvM0tz?=
 =?utf-8?B?L2g1MitjdVhzUTZoL0Jsc3RtN0JrdS9nNkwwd3J2UVdkSVVzdllZdlVMMThI?=
 =?utf-8?B?eVZrZElpUEt3NnlEYUZ5SGNlVnpNRWZhb3hRSFpQeWNUR0lqV2lYbkxybW1O?=
 =?utf-8?B?bXpmQTY0RFp0K3BzbEd6dVhpYmxVaGh5UWtTRGl4cEl0eWx6Zk40RVlldGdG?=
 =?utf-8?B?VWVwdjBCLzZGVjBlSGltRWtOSmpyV1FWUEFRWW82NitiWWloZXJLRFF2RXNG?=
 =?utf-8?B?a3BrWlBHTnJlTG9mRVRjdkpZb2pTd3F3WmZTalUxTjkyeWFjWXIyMjBxQWZL?=
 =?utf-8?B?aWRnT3FkVkgzb3dYaFR6MXJ2THhmYy9Nbm5WRnFzeGY4QjY3eG5NV2pBOGlU?=
 =?utf-8?B?MTNIZUZ1L0ZJaVIxOVZnRGt2alYyNjRuMGtxM1h2bFdLYzZTQnU0R1l5cnBa?=
 =?utf-8?B?YTk2bVduMmkyamZYMWdXMUV5MVV5N3lZV3pURkpXR25abnVyWUloeGQrSDdx?=
 =?utf-8?B?Q2FFaFlha0NWVHlxOE03Y3hXbEVJa0FFNUUyanZRV0Z5MGtaTk5xSVlHeTUw?=
 =?utf-8?B?WEYzOGhXUC96YWRWd1ZBek9sYXZYUzlYL0tOMGx1c3prSXdzOTRVeEVOUzM3?=
 =?utf-8?B?bGVhRGtvdUo1Q2I1cVhEU3c4UVppTkdTSWNQb1Z2WHZobGQ1czFtc2M2c2R6?=
 =?utf-8?B?cWlBeVNLMHJiVjdGeGMweVNaNjJqaWVjb05kemFLOXVEcVVxMUhna3cvYURT?=
 =?utf-8?B?UU1JZ2FNdDcraU9VK1RtK3AycUY3MmRWSmFNc2Q4L0s2YmVxY3dWNmdsL3FN?=
 =?utf-8?Q?YjY5tWX1925HdJpE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <692FD81CC2805F438ED6F2D0679077AB@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6876.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5c84d1-41a6-4fbb-6a95-08de599a1857
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 09:39:10.0844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jAuPyS616ZJsJUUMabvS09VlfyxxQh+sCKKLjOs0a7hFT/SKNSxflEho5VOm6TDxxbgild4CI7chCoFGAUZCsHL7fiP/lYX/CB0Sfixtiig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7425
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.11 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[siemens.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[siemens.com:s=selector2];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16134-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:npiggin@gmail.com,m:luto@kernel.org,m:chleroy@kernel.org,m:maddy@linux.ibm.com,m:tglx@kernel.org,m:mpe@ellerman.id.au,m:vincenzo.frascino@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linutronix.de,gmail.com,kernel.org,linux.ibm.com,ellerman.id.au,arm.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alexander.sverdlin@siemens.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.sverdlin@siemens.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[siemens.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,siemens.com:dkim,siemens.com:url,siemens.com:mid]
X-Rspamd-Queue-Id: 3C10764A8F
X-Rspamd-Action: no action

SGkgVGhvbWFzLCBDaHJpc3RvcGhlLA0KDQpPbiBXZWQsIDIwMjYtMDEtMTQgYXQgMDg6MjYgKzAx
MDAsIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOg0KPiBGb3IgY29uc2lzdGVuY3kgd2l0aCBfX3Zk
c29fY2xvY2tfZ2V0dGltZTY0KCkgdGhlcmUgc2hvdWxkIGFsc28gYmUgYQ0KPiA2NC1iaXQgdmFy
aWFudCBvZiBjbG9ja19nZXRyZXMoKS4gVGhpcyB3aWxsIGFsbG93IHRoZSBleHRlbnNpb24gb2YN
Cj4gQ09ORklHX0NPTVBBVF8zMkJJVF9USU1FIHRvIHRoZSB2RFNPIGFuZCBmaW5hbGx5IHRoZSBy
ZW1vdmFsIG9mIDMyLWJpdA0KPiB0aW1lIHR5cGVzIGZyb20gdGhlIGtlcm5lbCBhbmQgVUFQSS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1
aEBsaW51dHJvbml4LmRlPg0KDQpJJ3ZlIGJpc2VjdGVkIHRoaXMgcGF0Y2ggdG8gY2F1c2UgdGhl
IGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIG9uIG15IHNpZGU6DQoNCiAgTERTICAgICBhcmNoL3Bv
d2VycGMva2VybmVsL3Zkc28vdmRzbzMyLmxkcw0KICBWRFNPMzJBIGFyY2gvcG93ZXJwYy9rZXJu
ZWwvdmRzby9zaWd0cmFtcDMyLTMyLm8NCiAgVkRTTzMyQSBhcmNoL3Bvd2VycGMva2VybmVsL3Zk
c28vZ2V0dGltZW9mZGF5LTMyLm8NCiAgVkRTTzMyQSBhcmNoL3Bvd2VycGMva2VybmVsL3Zkc28v
ZGF0YXBhZ2UtMzIubw0KICBWRFNPMzJBIGFyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby9jYWNoZWZs
dXNoLTMyLm8NCiAgVkRTTzMyQSBhcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vbm90ZS0zMi5vDQog
IFZEU08zMkEgYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL2dldGNwdS0zMi5vDQogIFZEU08zMkEg
YXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL2dldHJhbmRvbS0zMi5vDQogIFZEU08zMkEgYXJjaC9w
b3dlcnBjL2tlcm5lbC92ZHNvL3ZnZXRyYW5kb20tY2hhY2hhLTMyLm8NCiAgVkRTTzMyQyBhcmNo
L3Bvd2VycGMva2VybmVsL3Zkc28vdmdldHRpbWVvZmRheS0zMi5vDQogIFZEU08zMkMgYXJjaC9w
b3dlcnBjL2tlcm5lbC92ZHNvL3ZnZXRyYW5kb20tMzIubw0KICBWRFNPMzJBIGFyY2gvcG93ZXJw
Yy9rZXJuZWwvdmRzby9jcnRzYXZyZXMtMzIubw0KICBWRFNPMzJMIGFyY2gvcG93ZXJwYy9rZXJu
ZWwvdmRzby92ZHNvMzIuc28uZGJnDQphcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vdmRzbzMyLnNv
LmRiZzogZHluYW1pYyByZWxvY2F0aW9ucyBhcmUgbm90IHN1cHBvcnRlZA0KbWFrZVsyXTogKioq
IFthcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vTWFrZWZpbGU6Nzk6IGFyY2gvcG93ZXJwYy9rZXJu
ZWwvdmRzby92ZHNvMzIuc28uZGJnXSBFcnJvciAxDQptYWtlWzFdOiAqKiogW2FyY2gvcG93ZXJw
Yy9NYWtlZmlsZTozODg6IHZkc29fcHJlcGFyZV0gRXJyb3IgMg0KDQpEb2VzIGl0IHJpbmcgYW55
IGJlbGxzPyBXaGF0IGNvdWxkIEkgdHJ5L3Rlc3Q/DQoNCkknbSB1c2luZyBnY2MtMTUuMi4wIGFu
ZCBiaW51dGlscyAyLjQ1LjEuDQoNCj4gLS0tDQo+IEJhc2VkIG9uIHRpcC90aW1lcnMvdmRzby4N
Cj4gDQo+IFRoaXMgd2FzIG1pc3NlZCBpbiB0aGUgb3JpZ2luYWwgdmRzb19nZXRyZXNfdGltZTY0
KCkgc2VyaWVzIGFzIHBvd2VycGMNCj4gZG9lcyBub3QgdXNlIGluY2x1ZGUvdmRzby9nZXR0aW1l
LmguDQo+IC0tLQ0KPiAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5
LmggfCAgMiArKw0KPiAgYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL2dldHRpbWVvZmRheS5TICAg
ICAgfCAxMiArKysrKysrKysrKysNCj4gIGFyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby92ZHNvMzIu
bGRzLlMgICAgICAgIHwgIDEgKw0KPiAgYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL3ZnZXR0aW1l
b2ZkYXkuYyAgICAgfCAgNiArKysrKysNCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS92ZHNvL2dl
dHRpbWVvZmRheS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5
LmgNCj4gaW5kZXggYWIzZGYxMmM4ZDk0Li44ZWEzOTdlMjZhZDAgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oDQo+ICsrKyBiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oDQo+IEBAIC0xMzUsNiArMTM1
LDggQEAgaW50IF9fY19rZXJuZWxfY2xvY2tfZ2V0dGltZTY0KGNsb2NraWRfdCBjbG9jaywgc3Ry
dWN0IF9fa2VybmVsX3RpbWVzcGVjICp0cywNCj4gIAkJCSAgICAgICBjb25zdCBzdHJ1Y3QgdmRz
b190aW1lX2RhdGEgKnZkKTsNCj4gIGludCBfX2Nfa2VybmVsX2Nsb2NrX2dldHJlcyhjbG9ja2lk
X3QgY2xvY2tfaWQsIHN0cnVjdCBvbGRfdGltZXNwZWMzMiAqcmVzLA0KPiAgCQkJICAgIGNvbnN0
IHN0cnVjdCB2ZHNvX3RpbWVfZGF0YSAqdmQpOw0KPiAraW50IF9fY19rZXJuZWxfY2xvY2tfZ2V0
cmVzX3RpbWU2NChjbG9ja2lkX3QgY2xvY2tfaWQsIHN0cnVjdCBfX2tlcm5lbF90aW1lc3BlYyAq
cmVzLA0KPiArCQkJCSAgIGNvbnN0IHN0cnVjdCB2ZHNvX3RpbWVfZGF0YSAqdmQpOw0KPiAgI2Vu
ZGlmDQo+ICBpbnQgX19jX2tlcm5lbF9nZXR0aW1lb2ZkYXkoc3RydWN0IF9fa2VybmVsX29sZF90
aW1ldmFsICp0diwgc3RydWN0IHRpbWV6b25lICp0eiwNCj4gIAkJCSAgICBjb25zdCBzdHJ1Y3Qg
dmRzb190aW1lX2RhdGEgKnZkKTsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwv
dmRzby9nZXR0aW1lb2ZkYXkuUyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby9nZXR0aW1lb2Zk
YXkuUw0KPiBpbmRleCA3OWM5NjcyMTI0NDQuLjFjOGU1MTY5MWJmOCAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL2dldHRpbWVvZmRheS5TDQo+ICsrKyBiL2FyY2gvcG93
ZXJwYy9rZXJuZWwvdmRzby9nZXR0aW1lb2ZkYXkuUw0KPiBAQCAtMTAzLDYgKzEwMywxOCBAQCBW
X0ZVTkNUSU9OX0JFR0lOKF9fa2VybmVsX2Nsb2NrX2dldHJlcykNCj4gIAljdmRzb19jYWxsIF9f
Y19rZXJuZWxfY2xvY2tfZ2V0cmVzDQo+ICBWX0ZVTkNUSU9OX0VORChfX2tlcm5lbF9jbG9ja19n
ZXRyZXMpDQo+ICANCj4gKy8qDQo+ICsgKiBFeGFjdCBwcm90b3R5cGUgb2YgY2xvY2tfZ2V0cmVz
X3RpbWU2NCgpDQo+ICsgKg0KPiArICogaW50IF9fa2VybmVsX2Nsb2NrX2dldHJlcyhjbG9ja2lk
X3QgY2xvY2tfaWQsIHN0cnVjdCBfX3RpbWVzcGVjNjQgKnJlcyk7DQo+ICsgKg0KPiArICovDQo+
ICsjaWZuZGVmIF9fcG93ZXJwYzY0X18NCj4gK1ZfRlVOQ1RJT05fQkVHSU4oX19rZXJuZWxfY2xv
Y2tfZ2V0cmVzX3RpbWU2NCkNCj4gKwljdmRzb19jYWxsIF9fY19rZXJuZWxfY2xvY2tfZ2V0cmVz
X3RpbWU2NA0KPiArVl9GVU5DVElPTl9FTkQoX19rZXJuZWxfY2xvY2tfZ2V0cmVzX3RpbWU2NCkN
Cj4gKyNlbmRpZg0KPiArDQo+ICANCj4gIC8qDQo+ICAgKiBFeGFjdCBwcm90b3R5cGUgb2YgdGlt
ZSgpDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vdmRzbzMyLmxkcy5T
IGIvYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL3Zkc28zMi5sZHMuUw0KPiBpbmRleCA3MmExMDEy
YjhhMjAuLjNmMzg0YTI1MjZhZSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC92
ZHNvL3Zkc28zMi5sZHMuUw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vdmRzbzMy
Lmxkcy5TDQo+IEBAIC0xMjQsNiArMTI0LDcgQEAgVkVSU0lPTg0KPiAgCQlfX2tlcm5lbF9jbG9j
a19nZXR0aW1lOw0KPiAgCQlfX2tlcm5lbF9jbG9ja19nZXR0aW1lNjQ7DQo+ICAJCV9fa2VybmVs
X2Nsb2NrX2dldHJlczsNCj4gKwkJX19rZXJuZWxfY2xvY2tfZ2V0cmVzX3RpbWU2NDsNCj4gIAkJ
X19rZXJuZWxfdGltZTsNCj4gIAkJX19rZXJuZWxfZ2V0X3RiZnJlcTsNCj4gIAkJX19rZXJuZWxf
c3luY19kaWNhY2hlOw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL3Zn
ZXR0aW1lb2ZkYXkuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby92Z2V0dGltZW9mZGF5LmMN
Cj4gaW5kZXggNmY1MTY3ZDgxYWY1Li4zYzE5NGUxYWI1NjIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gv
cG93ZXJwYy9rZXJuZWwvdmRzby92Z2V0dGltZW9mZGF5LmMNCj4gKysrIGIvYXJjaC9wb3dlcnBj
L2tlcm5lbC92ZHNvL3ZnZXR0aW1lb2ZkYXkuYw0KPiBAQCAtMzUsNiArMzUsMTIgQEAgaW50IF9f
Y19rZXJuZWxfY2xvY2tfZ2V0cmVzKGNsb2NraWRfdCBjbG9ja19pZCwgc3RydWN0IG9sZF90aW1l
c3BlYzMyICpyZXMsDQo+ICB7DQo+ICAJcmV0dXJuIF9fY3Zkc29fY2xvY2tfZ2V0cmVzX3RpbWUz
Ml9kYXRhKHZkLCBjbG9ja19pZCwgcmVzKTsNCj4gIH0NCj4gKw0KPiAraW50IF9fY19rZXJuZWxf
Y2xvY2tfZ2V0cmVzX3RpbWU2NChjbG9ja2lkX3QgY2xvY2tfaWQsIHN0cnVjdCBfX2tlcm5lbF90
aW1lc3BlYyAqcmVzLA0KPiArCQkJCSAgIGNvbnN0IHN0cnVjdCB2ZHNvX3RpbWVfZGF0YSAqdmQp
DQo+ICt7DQo+ICsJcmV0dXJuIF9fY3Zkc29fY2xvY2tfZ2V0cmVzX2RhdGEodmQsIGNsb2NrX2lk
LCByZXMpOw0KPiArfQ0KPiAgI2VuZGlmDQo+ICANCj4gIGludCBfX2Nfa2VybmVsX2dldHRpbWVv
ZmRheShzdHJ1Y3QgX19rZXJuZWxfb2xkX3RpbWV2YWwgKnR2LCBzdHJ1Y3QgdGltZXpvbmUgKnR6
LA0KPiANCj4gLS0tDQo+IGJhc2UtY29tbWl0OiAwZTU1ZTc2MzY2OTcwNzdhYmNlYjIzMDFkN2Qy
NzE4ZDc1YzM0Mzg5DQo+IGNoYW5nZS1pZDogMjAyNjAxMTMtdmRzby1wb3dlcnBjLWFsaWduLWU4
ZTkzNjY0ZGEyYg0KPiANCj4gQmVzdCByZWdhcmRzLA0KDQotLSANCkFsZXhhbmRlciBTdmVyZGxp
bg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

