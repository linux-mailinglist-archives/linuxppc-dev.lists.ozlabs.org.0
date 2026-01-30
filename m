Return-Path: <linuxppc-dev+bounces-16470-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePBpCnw4fWlMQwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16470-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 00:02:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339DBF4C3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 00:02:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2s355T7Rz3bf4;
	Sat, 31 Jan 2026 10:02:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c205::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769806458;
	cv=pass; b=CQcE3TOse08XoXmMts/sLfX1073Vj4Nw4VbR+hUmiDSLeUJhCxQoOlGC8wVrWoPwPrd5bwebVmAuNln/W6Gfdx/r35wN9ALIjCgQ50knlImBZGoJy+EY80UmiCC+lFnJ4DKWZZ1mLwYSauLMCrx/gwYzoCKEH0fmdSKm9oTxwdqYt2pMz50KZY8+pJBBSKsO3tr1URLKFEo3MzUlukStF05kJ6azsSNIKB/SEgVacxNx1DiEHe3AKFGqOVea2ngvIZne2Avys/3T0Ld+LYZmTqKWUpZTswGg1W1G+dw+pzvWUzql71H4gh133GGObgtmnUvHgvECj/5pATNkgoxU4w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769806458; c=relaxed/relaxed;
	bh=ApVpf7Q7+UTmpROYcd0mJHlIdoKc9eVu5WBQukrd1lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=niqDdelo/YyFitSTRX10Ek1hq/7CJzglhQytNyY+3/zvJYTnGOti6iA7l3e1/lkCsJmnUmPGcNmMNE3eRm3Z38wMUR/fStMvCn7ykvsWKYP6qg81Wx1y88KUGZsb4Qy/fcds3bVHNh9UEsxjWvGNVRGy2KKaxHFBn4hgAN9HC2w+3Uqlmq53SthkWcYO7woAqLh6aJnXeMUBnKDbTZPTp7g32HZ5t9WQB9U8U6qFosRB07H0HwnTb2jOa2Ne8kftxs5oT+96Ey2mD9pW7Vv8DV6RFqDQADpAL2NY5DtsaLS8MtBwc3A+UKneZM+PlORQDqEOztAP69bDb8zdTRLGFA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass (client-ip=2a01:111:f403:c205::1; helo=lo3p265cu004.outbound.protection.outlook.com; envelope-from=atomlin@atomlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=atomlin.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=atomlin.com (client-ip=2a01:111:f403:c205::1; helo=lo3p265cu004.outbound.protection.outlook.com; envelope-from=atomlin@atomlin.com; receiver=lists.ozlabs.org)
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c205::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2pCY3v2Fz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 07:54:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ph5FlvB77CAau7bz47j3bwyenlvxyvOnq+1/4p06B01u2KXGKeQeiKn1JNKf/6lTYkkKxl8r4cI/OJOt++ZJat+EoU1nf+RWoKAf0K2cTtQc/y6SEltJJ2mxYkGn6UmYLAydZCV2RzX5J51oVMi1cRgRCxxGqU71dF970uNPJRcxBEInD4BrAfwuWMVaiXUvYFbddUHbyomY+VcTho3x99uG6O60SVeJPcnfGoIX4Q2VYFA0MXQqeQg5shpIopjXcn4XC752WMbiP0sk/T2Y4ixXPs2Yo944MbawLuGUsdhvYIjTDDZlyIyyRprEPL4n+wStaeijDy/IahO9slImXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApVpf7Q7+UTmpROYcd0mJHlIdoKc9eVu5WBQukrd1lo=;
 b=MGnCLca1IMFfLO8eWCQqociN62e75TeBVbJV+F7q91RHlYlyqVimotIcCdSuAQWQUwkUAWclKj/nEFt8GG/4SO+xGruR2Tb1vCCVhE0zaakcWz5l9nu+djmUFYrzyJk94AtLoap1bCClBStMep63yp0AJ8JTNk7RHPpIhim4hPbj8tApDMnq0jjfGdMKJiAD4PVhOhrctHtRlUXZmS9Om8x0knh/ggQdR+kL7tnidV+X6jD/w1MD0oblcOjzLBbPDXoCTfcj814Dqz6wgdVyuuFFJM2r4F5CEZw+c/iEuCPB7leFFZcYz3CRjHn7mmdvP1VJLZVH5vldPHN/wxbxXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by CWLP123MB2915.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:49::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Fri, 30 Jan
 2026 20:53:53 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf%2]) with mapi id 15.20.9564.008; Fri, 30 Jan 2026
 20:53:53 +0000
Date: Fri, 30 Jan 2026 15:53:50 -0500
From: Aaron Tomlin <atomlin@atomlin.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Daniel Gomez <da.gomez@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>, Xiu Jianfeng <xiujianfeng@huawei.com>, 
	Fabian =?utf-8?Q?Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, Arnout Engelen <arnout@bzzt.net>, 
	Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>, 
	Christian Heusel <christian@heusel.eu>, =?utf-8?B?Q8OianU=?= Mihai-Drosi <mcaju95@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 04/17] module: Make mod_verify_sig() static
Message-ID: <onewjvorgipuigc5dixodgbtadm3rifjlvr6u2tqjhb63eqet2@fjddrouuyvor>
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
 <20260113-module-hashes-v4-4-0b932db9b56b@weissschuh.net>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bjvfu4cynz2vnrly"
Content-Disposition: inline
In-Reply-To: <20260113-module-hashes-v4-4-0b932db9b56b@weissschuh.net>
X-ClientProxiedBy: MN2PR18CA0019.namprd18.prod.outlook.com
 (2603:10b6:208:23c::24) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|CWLP123MB2915:EE_
X-MS-Office365-Filtering-Correlation-Id: 57da8096-564f-45e7-3cbf-08de6041ada4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007|27256017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SitjbUhvanlKUkZvY3ErcFZKVTdtckJoNGNhU2M3dU5OeHVtci83ajhDZzVq?=
 =?utf-8?B?WGFXcDlMb2FxazlVRUZhVWpMcUFnTzBKNHRPMFVlQ0tLME14QXR2Y0dNWWVJ?=
 =?utf-8?B?NU1JY290TXJkb2d5TnhXZDZha0dYTExmc0lyVEdnS0NaUUpDbjJxWXBwVkRw?=
 =?utf-8?B?YUFTMjNVZjdKZFcvcHRlbkdQVFhWc0ZuU1NjOXVvekFpeWNsMElocUE3OXBj?=
 =?utf-8?B?dHVna3RzK3ZtUkZqeFhqRzVsV0UzQk90WTd3T3E2SGN5VWdsUEtDdmlkTzhy?=
 =?utf-8?B?eGxLY3ZxeGd4b3dIRVFHYi9JNm5PWVhUUGNvQ0tJdkVQY0ZwRTE5UmtMa0V6?=
 =?utf-8?B?ZXRaa1NPZHNjN2h3TGs5Vkc5V0EwTksyTG8yK1VmSFFrQ2daT0dGQzNQRDZz?=
 =?utf-8?B?UHVmUGxFVjhON1ZBWXBRR1FrSmtRRDNCcTloSWVNTXZmTWFnWXJtb1kvVmJT?=
 =?utf-8?B?TXRVUGF2SSsrV0JrS0dvNU0zSWhoVmhEV3VEUWFEcVgzL3ZIYTFhN2FUa3Ir?=
 =?utf-8?B?Q3JPYW9INEcySE0vbUttTHNpeXZoTW1oUmp4UGQ0UUd4bHNRREM1UUo2c21i?=
 =?utf-8?B?ckZocUhCZGRuZVdTdmZRMGFCM3RUbmpCQnI4Yk5adThnOXhtY3hFS3RnMUEy?=
 =?utf-8?B?ZDdaUWxybUVrSFhSWmpCSE0zU01pMHZqbUVXeDRFRkxuSnRlWW1OMFFYOGNj?=
 =?utf-8?B?cXhOZXFrRUNkSmh4cTQxc2krNmVuSnZibXkwMnIzZVlWNVNMaTlpMXNxaStW?=
 =?utf-8?B?bTlFS2daNHFwQ1YvZWdrTTVGSHFYRHh6dHRuRE96MlUzZGlTcW5sNmlhT3dG?=
 =?utf-8?B?Qm5nWHNuU0hoSnVKeTV5R1lqTUpBQUVCT0RzS3pxME1DZWVsS3dsQ3BPdS9M?=
 =?utf-8?B?dzFPcEVhT2ZlVU1odWJsazhNODRTeXJrU01zR0hUMGFqc1BwNnBreVBMakkv?=
 =?utf-8?B?RE8wc0gvVDBvTnlWWEVHZUxJbW94K1l0Mmd5aFRIcnFrTnJISFo2NEJBVGZ4?=
 =?utf-8?B?TjJHdmhqN09SQlRWK2dyWjFOK09aUDdCQS9mVXVCSU0xREcxemF1cjd6Q1E1?=
 =?utf-8?B?Z0Z0UkxwSVJzamp6Mk5Ba0tYYmRKYXNWcEJncERwQmh4UUJ6NFJHb2RKMXEv?=
 =?utf-8?B?bWZyVjN6bmplQnNsZXhQai9IV2VUc3FOa1BMUEk5N1pDNVpTdHhPRjkrQXlD?=
 =?utf-8?B?NEZUUk4wOTBobFdpYld3NVhmMnZIa0QzeTE4SmVBMXo4SHpUUDNEZ2YxUU8v?=
 =?utf-8?B?U0xKcW9HbG5ST1lsZ1E0K0wySHJwUGNraHBEaUpVa3hOS1hxVFVqVHpjTWxS?=
 =?utf-8?B?Q0d2OXhIeUhYUjMzRk5nL1VsM2JqQjlPdWhvZ3YxaUdUU1g0TVVnSHVZV3N0?=
 =?utf-8?B?bHlWeFJFT1pQYlhEYnZFbmtyc0hPbWZxZExPRWxkTk9QSlFXU3kzNmcwUi9F?=
 =?utf-8?B?cllCQ29PMnB5QTJpbk9NSmRVd0xDdldVK1VBaTZ1RlhIZFV5ejlTcS95dHZa?=
 =?utf-8?B?QmFBY3QyUE0zcGtRdFg1MjdvQWRaUWc3Y1ZaSmZGTC9NZmJseGVBYkxvK3ZK?=
 =?utf-8?B?dk9tbGZuSWZybmE5Y1h1clFRTmpKZVcrTGhPWFRQbnVIZnlaa3NtellyZVJ0?=
 =?utf-8?B?YlNWSWlyVWRRTFowU2ZFRVNiK0FXVVc2YlNjUDY4V09YUGtqOTBFNGh5L2FG?=
 =?utf-8?B?YTBxdjFITXRzMmliaTY3dmZ1QWZEYzM4UFlKV2hsRDNHanNkaSsvZjB2b2Zo?=
 =?utf-8?B?cGlKVnoxZVBtbjl4aTdkWkFzeFVMUUl2aHNiUmlOQTIyS2dCTTNPUzNzT0pL?=
 =?utf-8?B?cTR0bWozQ1NZeXh0L2Z2QndwYlJack5aeVBDVjcrRlc3dStJcEQ4ZTFPUExs?=
 =?utf-8?B?OXZvY3V2OWx5emRJQWhxaGcxY2c2bmtvR3V6VDFCWDNOa29ocDl2TUYyNG9B?=
 =?utf-8?B?QVU0eFBOQ1dqL1pyd0prME1PNHNQVGRnZUEvNVcvM3pxeHI4RndtazdFZGRB?=
 =?utf-8?B?anNwdi9TUTE1dnV1UlhUMzRZK3BJUW5KY2JyY1puaGFEeDFwR1E0ZFlWMkJV?=
 =?utf-8?B?R3huRllRMGQ3Nm82TEJMcU1tMy9ucGNxbTQwSWRKRE1XS0JhaUhZOWQrc3Qz?=
 =?utf-8?B?dkg1TncrWlFmOTR0R2UxbGtqd0VWR3o4eUlKRE42U0xnQUltOWplOEZBM0RX?=
 =?utf-8?Q?Zb1wWXuIaIKQ9qSCssGUfZ4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXR5ZzI2Z0VzdDlmVGJ3NGl3SlJSYkMyTENUVjZFRGVIZTROK1NteEpIL3dS?=
 =?utf-8?B?UFV5V2tZSHNqdE1PQUdnZUNYVDhRN1hrclVFakpZTkJkZVk3YzQ0N3JnWHNF?=
 =?utf-8?B?U01tZ1M5Q2p4OWZacDlrTk1BRW1yYkUzUEcrc1o3SnVpbG4zMkdQQnpOaERj?=
 =?utf-8?B?QWw2QUVKMkl4YUZYV1hQQnNQeXRkQktPaitkWjJFaytwR3gxWjJXSU1iMnBU?=
 =?utf-8?B?S1pvV1FlVmNLcHgxUmtsSFdiOE5ydHU2b3d5SHBtTldQZjJWenJJSzRwOFB1?=
 =?utf-8?B?cTBLR0VHNVRmZ2ZyRWNrcjBpUVY5YmsxQmptaytnV2xkUU1nRU8wQlkxVHc0?=
 =?utf-8?B?RGNaM3pQSDdaV3l6MXFzeDhEVkNyanYvYnNLV3FOV1lGeGtwdEIvajdLNjdt?=
 =?utf-8?B?VHFlbm9rRVJYU0pCSEZoa2x4alIzMDhTVmJMcVFiRDNUMHNwSmJ0V1FlLzFL?=
 =?utf-8?B?V2NOMHRxc0k0RXBrR3l1NUcvblErVE13eTd2TEN3TzJkK3pPVS9ZSE5zZHRo?=
 =?utf-8?B?VVdVVVhza2M5bmYxV2pYR2hNcG5jOUlTK1dyNG51VHdhcXJQeWVOMkZvRzAz?=
 =?utf-8?B?K2QzMnNSYS9xa2NybTkrVEFoS3JqbHh2cVE4S1VLZHJ4OW1OVlQyUkdxSnI3?=
 =?utf-8?B?aHlKYXBWN3V4WU9ldkZtKzFTRVM1QjVDWFdzTEJObXNDVFI5YWRCdVNWdHQw?=
 =?utf-8?B?dlV4cEZnb05qdGN2U29MZ0JSQ3huUUhJcldnL2VpZlFYeFU0TU5NWTd0ZTZF?=
 =?utf-8?B?UlJvVSt5UjI1SmNiRHFMdDhsL0oxRituWFZUVlY1SnZGR0R6b0lqY3VZaExy?=
 =?utf-8?B?a1FueERZM2xuRmUrcDNnRHM1dGNJb0JjSDNTZFF6V2VjMnZSc21xM08xV090?=
 =?utf-8?B?MnM1SDlUUEFhNFgzRnNHQUlIK1VZMmc5T3YwOUhDeXRaRXFFSXlONi85bmZX?=
 =?utf-8?B?a1FyN3RHZlZoL1dyVzN6T0VZaUJraFJsaEJvaVJYN2Zqc0NudlRXM0pGRllC?=
 =?utf-8?B?WlJla04rclZSV0dtdm1Qb0pBOE5vK0FBalU3WjBEaU8raldqeVlrbEVaNi83?=
 =?utf-8?B?ZEF5WlovZVNQQXVCNkF1RlAxQmtKd1JrVDYwalE1NGR2V2M1SGpiSjhiWHVU?=
 =?utf-8?B?clgyQitRN25FUnJPZkowMU1WZ0p5Ym4waDVWZVd6TnVQWmZHZDI4UUxxc2pF?=
 =?utf-8?B?Y1ZITmNJN29XQVJLU1VLRlZTdDJPc2lnalJZK2xPY3IycDJIYWRrUGQ3eXI5?=
 =?utf-8?B?TTN4NXNuQ1dsRjdXbWJKY3k0cEZtazgvUnZrZkFXVlJJRjdxWFlsVnRHOEpV?=
 =?utf-8?B?NDlPb2hlS1JwelU3WGdkdk84ekFNM1pNSzg4SWpza2pXQjZSUlhYUVA0L2pL?=
 =?utf-8?B?cDlXeDVDdENYTlVFSXVmdDZLcFUzUHNwRjJPWFBuVzZUblpaYkh2VVo3ZXdI?=
 =?utf-8?B?RFd2V3pMOWQ0OGdhOXFxaXBGaXkzazVzLzdubTBiazNFWGJ0UDJieDFEaEdR?=
 =?utf-8?B?MW9EenNOdlBRK2xxMDh6MHhwWWplL2dXU2FicHZmR3BGQlRqUDR3YXhaSU4x?=
 =?utf-8?B?WlNrNGNIZjhQeE1rNU1aN1gyN2hIVmlvcVRqWVZXNTJEYXF2VC9PbFVPU25J?=
 =?utf-8?B?Rm9xVVNJOFhXUmM2cVhZc08zdFZlYlNsRlBtT0p0d0hBNnJtL01lYmNBNCtS?=
 =?utf-8?B?dW1GSlUrT3lPbHd1TW44eTFpOUZFRUhQUjNaSnBSazVrY3VEM2pZYXlrTFZw?=
 =?utf-8?B?NkFuZjNybFVRamJDbFc3ZmxoRnF5dzBJdC8yeWxOQUVvdnQ5U0JWQS85VEdP?=
 =?utf-8?B?bXM0Vnp5V3o2S2pBcHYwNG9RUEE1QW9yaExKNWZzZmVHV3FsL2VETmsweUdx?=
 =?utf-8?B?amdpVlNSMkI2dDUzLzRuNERDQjl4dlJidHRTOXU5Z01vdUtpUll1NEdxTi9T?=
 =?utf-8?B?cGYwYlVrWksyU1hMY0hraTZid2pVV2dQcnFSblN5KzFETFhVM3RFTWo3QTZV?=
 =?utf-8?B?dW1MblBvQ1hadkhlcTI5T2M3TThtVlA5bVV2bTRlMk9tTU56QlJQVFpHRDVt?=
 =?utf-8?B?ZDBCWEs5Qy9FQ1JKcGw4TXl2c1pJVlVFbC80Y0pBRloxYnE0MFNGTW5ES1Bh?=
 =?utf-8?B?RjNHSXlhMDNFWEw2Nlh5TDNVRUE3UmpnamMzUGlMd2Z3MkVOQ09rMlZqbmhr?=
 =?utf-8?B?YU5mdkJxdGh4ckJrM0s1TGdXcXlEQXVzU0VVQm5JRkhZcGY5dkwyU2hWUW1Y?=
 =?utf-8?B?VEVqOHQvMEptOWlJOVBHOTdQODR6U3JsU2FCN1N2WGZFVWg1UEpkQUE0TTZq?=
 =?utf-8?B?RjZTSndQbmMvbFBocU9pYk5VVG5LTUpoVkpWbWo4Mm1jb1lIWmJwQT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57da8096-564f-45e7-3cbf-08de6041ada4
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 20:53:53.7232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJ7uVn2QhOq9bm2afKPs6f1ft31Sb2uYQ7l0lno0xQ11wMyNUQp0IDRtDsOCQk0SnltmxhjTvHmI4hUE1uA2zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB2915
X-Spam-Status: No, score=0.0 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.61 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[atomlin.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[atomlin@atomlin.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16470-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_RECIPIENTS(0.00)[m:linux@weissschuh.net,m:nathan@kernel.org,m:arnd@arndb.de,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:samitolvanen@google.com,m:da.gomez@samsung.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:naveen@kernel.org,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:nicolas.schier@linux.dev,m:da.gomez@kernel.org,m:chleroy@kernel.org,m:nsc@kernel.org,m:nicolas.bouchinet@oss.cyber.gouv.fr,m:xiujianfeng@huawei.com,m:f.gruenbichler@proxmox.com,m:arnout@bzzt.net,m:mattia@mapreri.org,m:kpcyrd@archlinux.org,m:christian@heusel.eu,m:mcaju95@gmail.com,m:bigeasy@linutronix.de,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-integrity@vger.kerne
 l.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atomlin@atomlin.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,suse.com,google.com,samsung.com,paul-moore.com,namei.org,hallyn.com,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,huawei.com,oracle.com,linux.dev,oss.cyber.gouv.fr,proxmox.com,bzzt.net,mapreri.org,archlinux.org,heusel.eu,linutronix.de,vger.kernel.org,lists.ozlabs.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[atomlin.com:email,weissschuh.net:email]
X-Rspamd-Queue-Id: 3339DBF4C3
X-Rspamd-Action: no action

--bjvfu4cynz2vnrly
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 04/17] module: Make mod_verify_sig() static
MIME-Version: 1.0

On Tue, Jan 13, 2026 at 01:28:48PM +0100, Thomas Wei=C3=9Fschuh wrote:
> It is not used outside of signing.c.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  kernel/module/internal.h | 1 -
>  kernel/module/signing.c  | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/kernel/module/internal.h b/kernel/module/internal.h
> index 618202578b42..e68fbcd60c35 100644
> --- a/kernel/module/internal.h
> +++ b/kernel/module/internal.h
> @@ -119,7 +119,6 @@ struct module_use {
>  	struct module *source, *target;
>  };
> =20
> -int mod_verify_sig(const void *mod, struct load_info *info);
>  int try_to_force_load(struct module *mod, const char *reason);
>  bool find_symbol(struct find_symbol_arg *fsa);
>  struct module *find_module_all(const char *name, size_t len, bool even_u=
nformed);
> diff --git a/kernel/module/signing.c b/kernel/module/signing.c
> index a2ff4242e623..fe3f51ac6199 100644
> --- a/kernel/module/signing.c
> +++ b/kernel/module/signing.c
> @@ -40,7 +40,7 @@ void set_module_sig_enforced(void)
>  /*
>   * Verify the signature on a module.
>   */
> -int mod_verify_sig(const void *mod, struct load_info *info)
> +static int mod_verify_sig(const void *mod, struct load_info *info)
>  {
>  	struct module_signature ms;
>  	size_t sig_len, modlen =3D info->len;
>=20
> --=20
> 2.52.0
>=20

Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>

--=20
Aaron Tomlin

--bjvfu4cynz2vnrly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEeQaE6/qKljiNHm6b4t6WWBnMd9YFAml9Gl4ACgkQ4t6WWBnM
d9YkKg/9FyvUR4wvoza3ogjiS/G1nd0gOL7sRTJYudjcwBsrBYqUUVBVetAtrYjM
YZGIraTlKmntwTiMbdqFzVy6yrG0whAuOt8EqhXqUmt4gGtozqlDvm+CrZDMgDue
DOvguUKvrCB7XA7J1dpV3TUH2TSRaNhwKPtG/xgFLKBmtjim+BQ66HXQTuntd5n8
PAZUjIIXjzuj7/7tUWYTLFBfAcNChl09CknjArzE/69/2qDyk/pDSqLwv9XZ94Yz
XIsRnBqyoukxIUeMKRkifw2enw43JZFI//1GpEvStlYW2lDlBGpKMQFudxGdjwO5
P9eao/RENUFU8x0UD5mm4VX2JFoc+3Z5jCBMf7oFJEtsUMJUOldjRjBzCUyQ0s6f
3mg5xT8EawtZwo/aekuioLQssG8Gu463uOcdq9ql4wa39+LIEV9bnSdk8A/vYyUy
QkFw5PA2MDVWd5i/dN22zHJd6Wle0EEib51W0+jbE/svgpmpMReDC4mNUxDcbXH0
cxtjAg6HK6vhLYeTDt0FVlIt+BgMqtOLuWg/btdzAhB5pdC48KHifhIwjxcMWOFn
Tzz34pOWT8EnONAprD9qC19qMhx0i11jxh5TcIuDhg7WrOly6gZAh+tsw4CREM/a
gBsGTOtbt/bGQR8dhzd2Wr1KwfAqdTAxLM/J2E4gMghlKoPwow0=
=4HZ5
-----END PGP SIGNATURE-----

--bjvfu4cynz2vnrly--

