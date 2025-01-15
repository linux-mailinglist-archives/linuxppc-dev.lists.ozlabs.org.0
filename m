Return-Path: <linuxppc-dev+bounces-5269-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDFBA11668
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 02:15:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXp3F1D66z30f5;
	Wed, 15 Jan 2025 12:15:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::604" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736903753;
	cv=pass; b=h7U1A4+BG6xNEQPWgM9JNnLRKkY3IWEr1yvKo0X+EMiUjmSD098vbtlij3OVPfC3INQKXP0pA+ARCxXzpP6DJO/URnBZyzI8AB++wkcsses1//0fPOxt6H7VNVugVmPv7hSVJjHNK62qOoVy5vBogXzSwcS+cc68FPy2TTqXtZ8dhZJ0LTUS6/SzGvDBXwmgBLjodxwF/k/I+BuSGsh+5wUxlyyUxWFpe/aOHtJY12wUkLfVyCuJU27bdGj1XHkeJYYRR7eOE90PK5ckOvGqzwpcVjrz/wUhUOAHk86qhYyfgh56hQsbQUUgwo8fMu5Fx+3Kjvl7Pkr4ZPG929+L0A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736903753; c=relaxed/relaxed;
	bh=PHeyu4l8zB/I5cn8N0JWmPMi2I4WhSPnt3nn7RY/3+s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EbUkNu9qIC2woVz0GIR1frDA2IMrDEssE3gRxNJKH1uZFk488MegbPRigojOCxkgySzQZjONHoo2+x4hIuucbkSUbd/5K97vpOIZak6pUBIw/SfsMGknrM+aO44x2rUf5/S+KdEbUIkA9CYGXmG0IhnwDtv9LLsmXYzGKZU/ebEpSgw10ydl4OExU9tM0W/xUcGcIwKe+k3oNlU989q77JC7rF1qWVoyhaeLFymhRjmMQ2CnveyKb6nKkpPjkVuvZGVsjcBHlzIMJ7g+IDgaDAz+FOGEKO2u2DRGow5zZSblkv/hXFMoNMdP0Z0IJCWwBfL0BbzuRGxZge97GrNaTA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=TDdifK82; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::604; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=roy.zang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=TDdifK82;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::604; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=roy.zang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20604.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::604])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXp3C4W12z30T3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 12:15:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLh0jUk6DUcFiiW3IUQLdaoQvuDSt9pMx1uo9/6S21J1NG+DU3A7q85iq7WIiu5CSk8W76gAI/cb/onojQWC42JgySy5BiUg//d+TsC93x2jmLbDYDTOCCqPN8141LISX0I3Ig5INOfaBbXRa3oPMnYn76ttdPhMLvkh1khWDnmbSFSRTrhuiloamf/tIWutyCdFPAwb1Oqgur427eNKTgqpZoN2cYYpRIyKYdGeuxqqTuD/Y91AgcojIhdqdJuI1Fz0ZgMTm1awsLKUusr/v+zAHrC4IfCV24q+//rLwISE9xiSgXJWRa6VQ39AlgoAF4BMKoxou4AOrPdUJKX4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHeyu4l8zB/I5cn8N0JWmPMi2I4WhSPnt3nn7RY/3+s=;
 b=fntiIBlzyVZI5XM388yA/nq2yOM14njZzbEzZQxme5thEk/M6Gc3TqF6pnh9kEmg8pykJmeNU+5+DUyw0Jjbmot+BLnRmoiESXpvHK91JhjGzN3W6fAeXyoiHSEB7qLLmxzP+ETGjNuYhdLbPLAk7TwjXpYtix0K1+J/UghGAcyrX1Ga2Jfw4e3IC1thDHPeLgkMgsp5T/VWwK6ilp7iM+vYE/JFbpL44ANzHrrRtqBmpxyXEigHRC0PDNK61JUxIZRCy8lkojd8qiXDc4a93QjReHUah/nLpXsUL+kHqiseppR9IpklhjPN++23ZyihVZpP8M/3xzr2ddMwAP0jug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHeyu4l8zB/I5cn8N0JWmPMi2I4WhSPnt3nn7RY/3+s=;
 b=TDdifK824Jmk7LAjEu3QpLFP4JWMItd9Qg0tFMk4sesjLwVwceRNxXmcZOguzceoYsXzKDGgjMeJT8rRJDGqmmb0Jss8VwsvHeGV3jHOTDpJnVjRjonooVl8qlU8hK6CFt4mBcZeY63YS4Zm/bEEGEEMJTEG2AvRKoD9NG+ZH0JojRnAkSaoFf3P86Cq3auerwxm8I+yrR7FVtZktHhRprxa2rd1QPCIxLjWYtkqnCrJe0N7MdQFCCUbigq0JfwKhWWyDOqvjT6R2HwDjz7KqmNA+MwefML59yXI000WuFjASs4dIuTB9WX0iiVaMGlT5zkzok5wTTp2hZ6G2uSDmA==
Received: from AM6PR0402MB3528.eurprd04.prod.outlook.com (2603:10a6:209:7::25)
 by DB9PR04MB9332.eurprd04.prod.outlook.com (2603:10a6:10:36c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Wed, 15 Jan
 2025 01:15:29 +0000
Received: from AM6PR0402MB3528.eurprd04.prod.outlook.com
 ([fe80::e73b:96a6:ec15:9954]) by AM6PR0402MB3528.eurprd04.prod.outlook.com
 ([fe80::e73b:96a6:ec15:9954%3]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 01:15:29 +0000
From: Roy Zang <roy.zang@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vignesh Raghavendra
	<vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
	<kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob
 Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "M.H. Lian"
	<minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>
CC: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH 2/2] PCI: dwc: layerscape: Use
 syscon_regmap_lookup_by_phandle_args
Thread-Topic: [PATCH 2/2] PCI: dwc: layerscape: Use
 syscon_regmap_lookup_by_phandle_args
Thread-Index: AQHbZPdfYgAC+Yx5KUSk4/BIYBZWjbMXC3XA
Date: Wed, 15 Jan 2025 01:15:29 +0000
Message-ID:
 <AM6PR0402MB3528EBAA1BFC0A444C36F4198B192@AM6PR0402MB3528.eurprd04.prod.outlook.com>
References: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
 <20250112-syscon-phandle-args-pci-v1-2-fcb6ebcc0afc@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-pci-v1-2-fcb6ebcc0afc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR0402MB3528:EE_|DB9PR04MB9332:EE_
x-ms-office365-filtering-correlation-id: c6e24058-6495-406e-89ad-08dd350219e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VkxUd3JtY0RmMithUWVNSm9QQm5VbFFTdloxOTRNMld5blprSmFGWkJjMlJM?=
 =?utf-8?B?OUVicnZtZXN1K1MvMHI1M3ZKYjRid285S3dBbE1XTEZmZ3NwNUVRMkYvSFVj?=
 =?utf-8?B?aFM0eUFDSDgxcnZIUTMxNGtrck9QS3lmOWFUTmF4U1BtWHpteDBmbWhIeUJ1?=
 =?utf-8?B?bDN1VTBKbk9vRlJ4bkc4NVI5cytDVkdLWkN1ekxJV0xlWWE2YXlWTTdEQ0Jx?=
 =?utf-8?B?MTFmUXJzc1ZTcEUzSVVjSThhazY4OWREMWJGUVJUaVE2VGFVTFpLbWQzNUVq?=
 =?utf-8?B?WlkyMGpYNEVsYTY4TU5sMVlsUE9RbmxReGdSMzlFbDdzRHc0Y09oMWdjd0JR?=
 =?utf-8?B?WVFlTTQ4SmtHTXR1bnhWbmhPdkxvbkQwTXhPc0FvSmRsZmowK1QvM1YyUVRS?=
 =?utf-8?B?Yy9JcXNSQ3NvSHh1VVdzdXgwcUx3eUNONjl3cTh3TjF6UEMrK21UVnVYdloz?=
 =?utf-8?B?S2pOMDF0SUtDNmRXNFg2TzBzVUZvQjhFZ1JQY2RXcmNDait2YkUrZmdKUEtC?=
 =?utf-8?B?cEpuVGVHTXV0RC9pbXhJWDFkT3dTbE55Wm5URGsyWVJUTFhBZDA1ckNpUWV5?=
 =?utf-8?B?RW9vb1NvQ1dnclVONDBrS0JIM2ZlNGxEc0tSdlgxdkNSQ3ZlUXhFWEZPY0xo?=
 =?utf-8?B?cytCaldrakFrUVVlaG5odDBSMnozNHIvTk05bEpDOElXMjVWMm5qdkJid3gz?=
 =?utf-8?B?NTI5K1lpMHRNRHVvVEUzNlRSUTlBUEpMUEZ6U1Z1STJiN1JobjNtMzVPUUpl?=
 =?utf-8?B?Q1NwZVpMMmhUbENBSWJQUmxseHoyTGFZQkNieUwzUFVYZHpWUHRwenl5ZStS?=
 =?utf-8?B?ZmJuRWFaTWhqUXJ4WDRoNFhHMFFDbjNFUHE5UHltNkIydTV3Rm1GTXBEY21M?=
 =?utf-8?B?Zi9rY2ZaTWdsdys4bHhRZmFFQVlHN3BuNldYeFJSdFMyenhES1Rsc25ESHhr?=
 =?utf-8?B?YkJjQzJndjF3bkdSV1Fta2lBVUc4a3hXVXdNanBTYkQrVkcxSFV1SEFRRnM4?=
 =?utf-8?B?Rkd1WVlhSDlGWXJ3YzJrV2tmNUhmWnRlc1NtTWRRb210V1JsY2RTU1g2ME9n?=
 =?utf-8?B?QjBBUVpqMytjdFJmWmloRDlxWERVWEhHR2ZkbXUrWVpGWWtWWjBtM29LWldn?=
 =?utf-8?B?MzgxU2tWd2pmSU82S1NYdkE4d3MyVTB5VWJKU2RNc3F3TTdLMys5UVRIWUdK?=
 =?utf-8?B?ZUZWTk4rLzN2OFQxWHgwWXZKakxuMldvUEFnNWZhNE0rOW54Yml4M2s4MnEr?=
 =?utf-8?B?OG1PYVVyTFhJdmNjbjQzMUtPZFkveFdrV1lJb0h3cFJRNyt1ejRMaU9wVlc1?=
 =?utf-8?B?aUtTZ1BGc09FRFZwZXRyRTRHRVVFbTlDOHRwUUMxczVxR2pFbTF0RVBJTzdz?=
 =?utf-8?B?cTFweEFob0RVZm5nTk4rdnFIemloL0JGc1B0aysvWVEvUG11bTdFSVZUa05G?=
 =?utf-8?B?Q0MzOVBnSnBuR1FHbkZvQjZkTUZENlZmZU9CdGFIN3NSNkU0bHlNVlBXUG5L?=
 =?utf-8?B?bzhOaU1Nc3pmZGhmMHltMXRSWDZNakJqNDEyd1hmUC9sb2FldHBFWHRrVW8z?=
 =?utf-8?B?MHVOS25UcVBtcU0xTUxZRUtjdlhOaVpmTCsydUZKMmZjRXVnMjhXUmxjbUdO?=
 =?utf-8?B?RWZXOUQrK1lZbWVMai9mQXRtcWhwMDBudDlXL0QyakMrSzNOeklJekFDSTZj?=
 =?utf-8?B?RmdoSlJCMVUxbkYyekc3Z042RHdjRFh2MURCbW82TkI2SjVXay90ZXRMRnhh?=
 =?utf-8?B?ZER4VTh4S1FSWnR0QmN1cmQzaGcyTndTRmZoNVpPZnZ4OFNXNmlaVmQwVzNG?=
 =?utf-8?B?YXNWVlpPdXlaRHR6eE5nQTdvVzZKZFhFRTFoN05EWFIvdnBjZ2Rvc1NSdkRL?=
 =?utf-8?B?eUpHTUFUOTVyMUJMeDk3Ni9Vang2RmZhT1kveGdLaDhzcEpFS3VpcnVFdHRB?=
 =?utf-8?B?VXdTWnduZzJTTnN4S1pydE9ndjB6SlRIbEt5U0oxNWx3bktVQW9WdTVvNG1N?=
 =?utf-8?B?ODVwY0h3NjlBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR0402MB3528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?anVCVVFCcXNJd01pNW9nK2Nwcm41Z2xBTDZOVTRSck1jcVBXUU14eVdiZGV5?=
 =?utf-8?B?bFB1TDA0ajl5WXVzVXZyeVZUamV3L2xOT3lKdGJTbTU5YVUrQklVVkxMbitB?=
 =?utf-8?B?UXB3YUR0M0dIL1Z5ak9PUEluRk5TcGxiZ3lOOCtVT0YralJ3NFpIZ3JDUnNR?=
 =?utf-8?B?cElYNG93S09oT0lKczF0ZG9hRW1Ka2t6LzU3Z2JUclRJRnMrVnBOUkJ3dC9D?=
 =?utf-8?B?VlZRQmxPOGZjRkFUK0dBWEsvWmFwbm1UU3E1b1ZjZUNiNUZEcjYzNklpRXc2?=
 =?utf-8?B?MTNvZERMYkpXZzliUXNYa1F2bnc4UmVsV2NlYlRMSjZZL0paVnhmNG1wOWU0?=
 =?utf-8?B?NWpNSUtxVDNBVE93akJnT291UFhnL29GNWNqR3FVWHFjTTZWTm5yU2dmTkJo?=
 =?utf-8?B?RFlBZVNEUFBzZDdDbEozdituQlJ3elE5M3JxNys5TWdJTjRXc0NET09TSmlv?=
 =?utf-8?B?MDhIa3JIVkR3UFl3ZXZkRlIrQStGZFgwVzU1R0IvYlpyRlVEdUF0RkNYZVgw?=
 =?utf-8?B?bm5keVFUc2hTQk5iSm1SUjFBb2NGU3NJeWhQdHU5anE2V1FwZzNuRDlkdEJT?=
 =?utf-8?B?UG1lcU96eUY3Wm5rWEhGVlFnQ1kvLzd1MjRsU3lkNlhGNmdCdUhxSUdOdGRi?=
 =?utf-8?B?dHl1N2kzOFdvVWlTNzRlZTBja1N5WE53cUZ0RDkwVmdBNmNNUWVKbHVQMmp5?=
 =?utf-8?B?ZkR6bzFyQTM1QlFxRUxkaVZZdnNnZ0RBWmhmTlZVQ3N1TXFURmJQRlpyTWFX?=
 =?utf-8?B?T0pBcXZmdVZxVHNENVAxeHROcVhQenBQc1QrMzB6Qjc3RXJSUmtNTjVhazRr?=
 =?utf-8?B?Qm1mL1JSd000NTBHU2hwQVZ3dHhaV0owU0NsRGlaek94OU13RlhPZFNhOWVH?=
 =?utf-8?B?MmhZeGlmYmxMUlhINGg0VkUvTndjaVMyV2tTaDhidUYxWlZ6V2dIL25GZWFZ?=
 =?utf-8?B?MmlqZ1RuUkFRcUxOQis3SnRHQUxxNHAydmhkMHpzMWwveWVwSEhaRklUemNF?=
 =?utf-8?B?eE5RZjJtaUpjaHVnenExRXUyT1VtbXJBQmVnaXBxVHlvdnMvdGxXOWdZOGM1?=
 =?utf-8?B?QTFlUUE1c2UrZUdONjA0bDVQeGhEMUt3Ty9CTW01cEtoVk5SWk1Ecm9aZzEr?=
 =?utf-8?B?aW5CcEVaTDJPM3R0YkpDdzUyS3BMVkJoblJoSVdnTEk2ZGNqT0l2Y1VHdkJX?=
 =?utf-8?B?OTQvcFZWay9Wa3M3aUViUHB4NzlyMzZ6OHh5TnhPNWJ2T1QzdVAveVIxUHJI?=
 =?utf-8?B?Q3N1NnFKY1E3Sm80RHdxYVFpTjQ2SDBZRnE3WWFSQlYzNjkzbC9kTGxnN1po?=
 =?utf-8?B?NndreFltZDB0d2pIRGRreGh6YnVwTUlLMzErY09ienRmTjBROGRRTDZNbmxv?=
 =?utf-8?B?STVWSnJjSEs5aVEvam5UZ2hVM3p1ZEVURG5mYW5xNTJ0bDF6MFRsUkM2V1ZD?=
 =?utf-8?B?MVpVMzVTQ05renY4QmNuWThDUnF4MlFvQUVZTjhqR0RGNytOZWFqeTlVV0dh?=
 =?utf-8?B?ZXk0WUtVam9ZQlNwRkxuck9ZaE5ZMnZna0RQaFJ2aHl5VFEwT1pOYitIQVRI?=
 =?utf-8?B?MTYzRVdaOUFQYUx5L29HdmVlRTNEbk5XbFZqWWFkU0FEVjlQSUpreTJVRGVV?=
 =?utf-8?B?UFJ1QjNBTGJvK3FmSXV4UHl0M1NXaUxSTHpSa25UM1NwTHpNTmJSeXlXb1dj?=
 =?utf-8?B?am9IMFlITjBRT2IxZEdwWlJ3alZHbnZyUFNSZEZXR0pSeVFjM2g1ZHJyeEwy?=
 =?utf-8?B?YXFyTTRwdEJDRmRadGExemd2Nkp5RHFpclVhTjBraGVuTDlJUUtaSmVIamUr?=
 =?utf-8?B?dkZQTytheW5ER012b1ZzUTNCbVJRMlJRQ1dPMkpYdmxJVFgzNjllQytHbTc5?=
 =?utf-8?B?SVBrY2tRcSsvaU92ZE5pOWxZYnVlMFpNaGxGOEhiVWJQZzlYM2JLUjdWZGpI?=
 =?utf-8?B?cmFMbE5TQ3F2U3lhNUlXbnpSVjY3OUs0T1d3eUlnZ0x3OWdvdkh6ZTNrM0ZG?=
 =?utf-8?B?MkpWOUxXTFF4dDNzS3pnOEc2Z2VuSHpvTzJqOEpKSldSTFh1Y294UHB5aEFm?=
 =?utf-8?B?U2hpSjdtSmszOHBjUHNDMkhFWGJ4QzcybWhjRE5MMVp5ZHEvbHpyS0E0SWxi?=
 =?utf-8?Q?b6FE=3D?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_009E_01DB66B8.ABC79140"
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
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e24058-6495-406e-89ad-08dd350219e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 01:15:29.6707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D21S9+B2uR0v0gSCsUgTmKa0wY+q0ofi2CuvcOGsUVnrQLJ6F+CAPAWazadilXogboXjolj/w3huGTwbufo1FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9332
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

------=_NextPart_000_009E_01DB66B8.ABC79140
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pci/controller/dwc/pci-layerscape.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)


Acked-by: Roy Zang <Roy.Zang@nxp.com>

Roy

------=_NextPart_000_009E_01DB66B8.ABC79140
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIhUTCCBaIw
ggOKoAMCAQICCE4Rpu+H69FRMA0GCSqGSIb3DQEBCwUAMGUxIjAgBgNVBAMMGU5YUCBJbnRlcm5h
bCBQb2xpY3kgQ0EgRzIxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJ
RWluZGhvdmVuMQswCQYDVQQGEwJOTDAeFw0yMzA0MjEwNjQzNDVaFw0yODA0MTkwNjQzNDVaMIG2
MRwwGgYDVQQDDBNOWFAgRW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQ
IEIuVi4xEjAQBgNVBAcMCUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmS
JomT8ixkARkWA3diaTETMBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTEL
MAkGA1UEBhMCTkwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAWrnSkYP60A8wj4AO
kATDjnbdgLv6waFfyXE/hvatdWz2YYtb1YSRi5/wXW+Pz8rsTmSj7iusI+FcLP8WEaMVLn4sEIQY
NI8KJUCz21tsIArYs0hMKEUFeCq3mxTJfPqzdj9CExJBlZ5vWS4er8eJI8U8kZrt4CoY7De0FdJh
35Pi5QGzUFmFuaLgXfV1N5yukTzEhqz36kODoSRw+eDHH9YqbzefzEHK9d93TNiLaVlln42O0qaI
MmxK1aNcZx+nQkFsF/VrV9M9iLGA+Qb/MFmR20MJAU5kRGkJ2/QzgVQM3Nlmp/bF/3HWOJ2j2mpg
axvzxHNN+5rSNvkG2vSpAgMBAAGjggECMIH/MFIGCCsGAQUFBwEBBEYwRDBCBggrBgEFBQcwAoY2
aHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFBJbnRlcm5hbFBvbGljeUNBRzIuY2VyMB0G
A1UdDgQWBBRYlWDuTnTvZSKqve0ZqSt6jhedBzASBgNVHRMBAf8ECDAGAQH/AgEAMEUGA1UdHwQ+
MDwwOqA4oDaGNGh0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEludGVybmFsUG9saWN5Q0FH
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
iDAfBgNVHSMEGDAWgBRYlWDuTnTvZSKqve0ZqSt6jhedBzCCAUYGA1UdHwSCAT0wggE5MIIBNaCC
ATGgggEthoHIbGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1LENOPW5sYW1zcGtp
MDAwNSxDTj1DRFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29u
ZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0
P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnSGL2h0dHA6Ly9ud3cucGtpLm54
cC5jb20vY3JsL05YUEVudGVycHJpc2VDQTUuY3Jshi9odHRwOi8vd3d3LnBraS5ueHAuY29tL2Ny
bC9OWFBFbnRlcnByaXNlQ0E1LmNybDCCARAGCCsGAQUFBwEBBIIBAjCB/zCBuwYIKwYBBQUHMAKG
ga5sZGFwOi8vL0NOPU5YUCUyMEVudGVycHJpc2UlMjBDQSUyMDUsQ049QUlBLENOPVB1YmxpYyUy
MEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54
cCxEQz1jb20/Y0FDZXJ0aWZpY2F0ZT9iYXNlP29iamVjdENsYXNzPWNlcnRpZmljYXRpb25BdXRo
b3JpdHkwPwYIKwYBBQUHMAKGM2h0dHA6Ly9ud3cucGtpLm54cC5jb20vY2VydHMvTlhQLUVudGVy
cHJpc2UtQ0E1LmNlcjBRBgkrBgEEAYI3GQIERDBCoEAGCisGAQQBgjcZAgGgMgQwUy0xLTUtMjEt
MTkxNTIwNzAxMy0yNjE1MDQwMzY4LTMwNzY5Mjk0NTgtNjMxMTU5MA0GCSqGSIb3DQEBCwUAA4IB
AQA3/Dd1a+EHwL+AHpwSghyD5OCgILaIgL9W+OgJ2D5EKrOilETssP4FCTzZWMVKS1VWqglY1EiE
Dw30admpZ405aPcBa3Dmf5OnL9FMKL7Akty4U5VOotSeQVwrRazWHPt+GgDmqRtjq+k+wUFtIG+n
Bgo2OeTT3NxQ9PYv9HiIfuYybwHBooiO0v0b0zaVcI1MkajE4Yh4PjU3amwh6T5X4uKpQCJJAZmM
JF9OP+SSq9T7QP6qmtgRd6fVU6jMPHUrOvewel2l7mJKFdeuMw54+PPP7ZLzaxNyHTMSy9ni/6/m
yy3rgQ0z9p0rYpivBqEjJc40ZJqndU/jSchazSpbMIIIOjCCByKgAwIBAgITLQAMpBb3zugcBVYH
WgABAAykFjANBgkqhkiG9w0BAQsFADCBtjEcMBoGA1UEAwwTTlhQIEVudGVycHJpc2UgQ0EgNTEL
MAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5kaG92ZW4xFjAUBgNV
BAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJkiaJk/IsZAEZFgNu
eHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJBgNVBAYTAk5MMB4XDTI0MDgwNzE5MzgxMVoXDTI2
MDgwNzE5MzgxMVowgZoxEzARBgoJkiaJk/IsZAEZFgNjb20xEzARBgoJkiaJk/IsZAEZFgNueHAx
EzARBgoJkiaJk/IsZAEZFgN3YmkxDDAKBgNVBAsTA05YUDELMAkGA1UECxMCVVMxFjAUBgNVBAsT
DU1hbmFnZWQgVXNlcnMxEzARBgNVBAsTCkRldmVsb3BlcnMxETAPBgNVBAMTCG54YTIxNzAxMIIB
IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA55YyjGM+ltxo8NcfzL4FYuNVxTSHoMXQdjHo
ddnsJO77cR5GnfdlRXEOdJUysAKlGhpMxYekUrKBGfuoTXlXthcH/51P1apcmQBioE9kjwMf3qYM
wroBH1wWfKervMVKyVoULgWuN74/CeY7lN0zttUp9x3g1jMKVgKGap9Q2lDVbxFCMzWDieiPRMEM
G8FRcrGUSOKSkQl5j/X7n+VqAvXWZlqvhyzsOyXBFrXJvslOQGCXAAavQXNfrIDRRKy4PS+MSd26
6sEakJlhbOAsIeUcDyP1Rq7tbfuZ+BFrq2w5x0SifHa5ugFi3Z7LBTREB+lsvUtoaFnZX1tQ44v7
ZQIDAQABo4IEWTCCBFUwPAYJKwYBBAGCNxUHBC8wLQYlKwYBBAGCNxUIhYLAfoGO9FWG7YU4guuZ
S5qSVj+F5opuhLXhfgIBZAIBQTATBgNVHSUEDDAKBggrBgEFBQcDBDAOBgNVHQ8BAf8EBAMCBSAw
DAYDVR0TAQH/BAIwADAbBgkrBgEEAYI3FQoEDjAMMAoGCCsGAQUFBwMEMIGUBgkqhkiG9w0BCQ8E
gYYwgYMwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBLTALBglghkgBZQMEARYwCwYJYIZIAWUDBAEZ
MAsGCWCGSAFlAwQBAjALBglghkgBZQMEAQUwCgYIKoZIhvcNAwcwBwYFKw4DAgcwDgYIKoZIhvcN
AwICAgCAMA4GCCqGSIb3DQMEAgICADAdBgNVHQ4EFgQUa9VvfI2adDKzdXh2zk0AoaavdmIwHwYD
VR0jBBgwFoAUWJVg7k5072Uiqr3tGakreo4XnQcwggFGBgNVHR8EggE9MIIBOTCCATWgggExoIIB
LYaByGxkYXA6Ly8vQ049TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNSxDTj1ubGFtc3BraTAwMDUs
Q049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3Vy
YXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNl
P29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hi9odHRwOi8vbnd3LnBraS5ueHAuY29t
L2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybIYvaHR0cDovL3d3dy5wa2kubnhwLmNvbS9jcmwvTlhQ
RW50ZXJwcmlzZUNBNS5jcmwwggEQBggrBgEFBQcBAQSCAQIwgf8wgbsGCCsGAQUFBzAChoGubGRh
cDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1LENOPUFJQSxDTj1QdWJsaWMlMjBLZXkl
MjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXdiaSxEQz1ueHAsREM9
Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1jZXJ0aWZpY2F0aW9uQXV0aG9yaXR5
MD8GCCsGAQUFBzAChjNodHRwOi8vbnd3LnBraS5ueHAuY29tL2NlcnRzL05YUC1FbnRlcnByaXNl
LUNBNS5jZXIwPQYDVR0RBDYwNKAgBgorBgEEAYI3FAIDoBIMEHJveS56YW5nQG54cC5jb22BEHJv
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

------=_NextPart_000_009E_01DB66B8.ABC79140--

