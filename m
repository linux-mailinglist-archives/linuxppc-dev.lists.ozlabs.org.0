Return-Path: <linuxppc-dev+bounces-16469-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HdTG3I4fWlMQwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16469-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 00:02:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5669BF4B4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 00:02:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2s2y3ylxz30GV;
	Sat, 31 Jan 2026 10:02:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c205::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769806182;
	cv=pass; b=SA6sixmLEL+s9z/QkOtbIZXPLqUsK94l0jSrwHJTVl3qoZj9tYvbBldaFN5I1EnOXE1jY5mplOzQ+TZSRmYToXN8GG8emozxzE1WnlFe6i/5rACv6/PHBpSOu23l8NvhVM8N3+xUQKa5Ve5u5cNPq43B1eGpyf0UTqk4F1bsTIyAgRdEV2XdXRqaYrBQhpNvjcP3I0ZruOm4Z4PiOlwHCUFZ62M+Gi5cthKArnEHTmTX9QM9+69nFqHLUd+HYpv0fuk8AsBehAq/BtMvofQB8xac9/2tq+grfQts1rMDCY0tUdlRXX8lI/XHHNzRAojtcBBsf1qFmu6vPiqPWk3zQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769806182; c=relaxed/relaxed;
	bh=9aP068dduGP4xwaiNVyZr+0XbUOTsSPMvw7hCOD1n5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PXFtOTLp3FgZgmhwaQqSo/FR9mbiWZx9eJLLIhVQqu76UUdrE2bOfWkni2LiA9b5K1/0eo2f1H9RmE89ZZ3M3MZsl43KqHFsS0mJp+INa1O1fm85tju5qZUKF4RiqOZpNd8dNIu1mIzmEvcLt9jxps0lCyrJ7/wfXfSPznKQygo5D20ApGh3NOray2LSZ7TX9DrTyDYC6GvkNMcDhSktiLlj1WhNCKkcm82W46IE+UV+zzN1i7tt4aFMOr10DOhU6MRMcGmITsbCh5sM08tyn/1SqCJIWBtauzPS6gb5NQ9mhJlO/VaqPzc/QihP01TVDMtlALvc9+Z6EHOUynTZ1Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass (client-ip=2a01:111:f403:c205::3; helo=lo2p265cu024.outbound.protection.outlook.com; envelope-from=atomlin@atomlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=atomlin.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=atomlin.com (client-ip=2a01:111:f403:c205::3; helo=lo2p265cu024.outbound.protection.outlook.com; envelope-from=atomlin@atomlin.com; receiver=lists.ozlabs.org)
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c205::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2p6G0Mvbz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 07:49:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t97pDYjD6tPsTOaSkXw9o0UngJOaCC13AlBSCLbwsZYJYtm4gE7J9tXlAHiIfFV7asUBa3Mvzx1ENHu7h6gWsf2ybRwkxYJ/g+dOSuch3D16nVT8GU7L9MirWifnhUgpH5CA5c7MZE984dMfD3nBxnjUL+R/OtnVFaoPvu9L3qQ8H7tt+T0HM8UOJPJcSz4cjE5ed8lPPi6qM7IdyQ2bsq4dGlmqJMD655hYtqEiVffNAbk1315XPqhPugEwq1EX8TNQqeGlwx6dHDDpcGDj4g71WSDbJaVgsus1NchzviQk128Vgy3O2/Eec3xmuQMhrDMp4PJFHzmvcL3kdPj6cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aP068dduGP4xwaiNVyZr+0XbUOTsSPMvw7hCOD1n5M=;
 b=Th1brfgopP9pMXfZRwQjDpHVDtiJUoGKHxoYX4Us+sZQiGin8GIfImhe9Sq4kdjZj8IXhV5HfVIOkn9ibT8mnM0LGnEBr/HkKcjkqOauwr7YVxvMPgs4svnRB85mJRsfUbBZ1ad34k9JWOFfhjhn8B5KOA0zH9/xEPy1G/cBuY29AA+kixHxfQ1Dzr+se9Irdw93Rar0ahTSMdjvY80B1rSOkPasUPGvK/WwLOR+AXwGYgrArjzSJib0ZKUH0UyO+ZAPIljTKOMO1AdDS4sA2+UH+c7lYmKQqAWDz3ihGRueKEi6kPTzTq0MZYwqovBA5++H3aDVBwlSRiX0LevHbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by CWXP123MB3559.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:7e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 20:49:20 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf%2]) with mapi id 15.20.9564.008; Fri, 30 Jan 2026
 20:49:20 +0000
Date: Fri, 30 Jan 2026 15:49:16 -0500
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
Subject: Re: [PATCH v4 03/17] ima: efi: Drop unnecessary check for
 CONFIG_MODULE_SIG/CONFIG_KEXEC_SIG
Message-ID: <wc76ddmauqsvjxcdnhq3fhp3i6fb4eaprjq3lysyee3matghky@aniguxw2sadc>
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
 <20260113-module-hashes-v4-3-0b932db9b56b@weissschuh.net>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dpnq7vx6qy47k53q"
Content-Disposition: inline
In-Reply-To: <20260113-module-hashes-v4-3-0b932db9b56b@weissschuh.net>
X-ClientProxiedBy: BL1PR13CA0156.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::11) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|CWXP123MB3559:EE_
X-MS-Office365-Filtering-Correlation-Id: 94bb1c18-5a25-4960-9bbe-08de60410aa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHBqTE50WTBnU0gyb1ZSdmtBSjJKMGlZeVRoMUo1V1RLMmorcmVNOWNZNXhx?=
 =?utf-8?B?YllnYUtYbnRnaGl1V2Y4ZGFqZU9XcXJ2YmdWRnNJbVM4SGdaejJaWFl0ck84?=
 =?utf-8?B?NUdhVUROT3pTVFVodWN4QjN2VVhYd3ZNQXF6U1RocGRRME9pN0NPRndmRnZp?=
 =?utf-8?B?Q1ZKTUtpTXBUakFaN3BlZnNQd0YyZE9jQk9kR2ZTaTZ2dWdkZmVKbUU1bjh3?=
 =?utf-8?B?QkJSUy9ZU0ZKT2JrSTBNR3phN0t0VENxOGJvc1ZPYXFRa1A1bjgvTVVTZnlR?=
 =?utf-8?B?VkpIT0FxTkoxbHF5OVNHZEd4SG9NWkNiVW1RUWU0MTdxckZnN0JkaUlsM09n?=
 =?utf-8?B?VFFXY3V5YmVmQ3lQQnRUVloxb3hUNEFqSkpUSWJmUlVjQ2V4UEloNnRjbVY3?=
 =?utf-8?B?cGc2SHovQUJBMXNOd0hQZWtYYzAwMk1YalZTU3FDTHNIMFcxTUFQbkxTNmdt?=
 =?utf-8?B?b25SNEhzbURLSWM0TkRPR25Ca2EvenpEZG9PYXJ4V3Z6ZktJYkNqdkdIeWhB?=
 =?utf-8?B?REVJcEdYVWZtczdqOENyWUp6Y212cWwyR3BvWXV2MTNCTFA4MW5rWFBCZmg1?=
 =?utf-8?B?YVNPQWRaTHV6NDQzRDY5UWFtam5sejl3UjdWRC9hRFJ2Wk5mM2NLWUt1R2FN?=
 =?utf-8?B?RjNJaDRHK1pTSXk3S3lRbGwvcWpwTFljOHkrQU4yQ2hFRTFJQm53VWg3ZjNo?=
 =?utf-8?B?SWg2Qi9rdTJnZk9UK0lWK3ZoSVVnY0x3OGVDNEhxQXIzVHdlOEsyUmVUaWFP?=
 =?utf-8?B?WUJPK1FlM0d5Vll3Mk9PVWIvQzlQZFpaZW96bmVaZWxzTnBHTlEwTFg4YlE2?=
 =?utf-8?B?ZzFuLzNLVkNqYXdVMHFMeUI2ditPM3VVbCtHVFBFSC9QL3FldnByL21kanhZ?=
 =?utf-8?B?NmlxSkxNcEphU3FQSzZSY2NSSEdQaUxhNGVRbjNWenB6a3RTN1N4cUQzZ3k3?=
 =?utf-8?B?WTYyTTdwSzU5Q0wxSC9ENERkeWlrOS9BR2ZEcmdKb1YweWVpZi9yR2UrYU5D?=
 =?utf-8?B?bXlQTXRkY2pMU25GeGRjb3FQam9aMmxZM3FoMGI2YUFNRXhzZXZwTUlzR1pP?=
 =?utf-8?B?a0hrTnhYNEZBR2ZRMGJPRWJsVG4zOGpleUVYaFJDZUhTNVpVc1NxbHk3UjZD?=
 =?utf-8?B?QmdnRG9XaUNGd2E2d3dVT3FXZnJsRFMxcEQ3RklWVG9KVkdmVjhpMFR5dysw?=
 =?utf-8?B?OWp2NUFRTElTRUxRSTgzbk1BN0w4dlZyRHJweW9zZ3J2K04zL3Y2U0RFM3Zw?=
 =?utf-8?B?UlZ5aTExRm5RK3doTS8wdXhDU0hieHBXamJyeitjTHpIeFhaYVcyNXpUYitJ?=
 =?utf-8?B?aEwxUzhIRlozVnEyZHpRSUc2WnpZcEVMVHp4Ym03SHh2bTlDUzMrUndpQVg5?=
 =?utf-8?B?V2IwK0w5aWYzcktGV1lKQUZQbFgwRXQ2cEtSU0phdzZpTnhTN1QxRTBCQzd3?=
 =?utf-8?B?SDczZGYxU3Y4UzNOUXo4aXJ0NW9yR0tmMngrSzRDVjVBZGh4amdzWG5FQ3I1?=
 =?utf-8?B?eGNWZlZ5eUJtRDhLQ1llcm9zK0d1KzhMTnNEN3hib2dhTnk3blNNM1oxY0s1?=
 =?utf-8?B?L3RRcHovb0czdmNmMVRKM09BeWNjRUJscUI2Q1FTb014K3RUMlRDYUhscUhD?=
 =?utf-8?B?bVp0c3RlRDFQUzRXcms4U2htZ1RUQ2pKekFpWW5BVzdYVzJ2QVhTTkhEV2I0?=
 =?utf-8?B?V3RDdlQzc2Q1cUY1c2VmNXd0L0hCVW54a2szUENPUE9SOWp0WktsLy8xU2ov?=
 =?utf-8?B?MGY5VkluMjRTTStUcE96bHRvb0RvRmFuYWV5TVo3R1lRK09zZk9UZHpoRDdh?=
 =?utf-8?B?LzBkK0R4Wnh6L0RZSlArZnlwbW5aeEEyc3Rsc2VZc1BSZER3SmIzTlZVUUM0?=
 =?utf-8?B?MjhMaGtyazM2elVLMk0zeDh0bnZhY1haUzBPWVRFdXlwV0s3MUl2Uk5qUFZa?=
 =?utf-8?B?VzdiNmQ1SkJmbUFrN1hOMHozZnoyL2tWWDYyWExEWThxdjRvcCtJWXo1ZTdX?=
 =?utf-8?B?ZVQ3RTlQSkQzWjZsZkxFbjJsZkRGcjRJa1JtM3JvcWxKZXkwRHJuVVl5UUV3?=
 =?utf-8?B?QzFrSEUzYi9QZnJyck10WkdWNDBIekVhWEoxM3djYVFyR3p5cGZTeDNvaSto?=
 =?utf-8?Q?mrHM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW1QTjI5YU1JeThHVjEzN1E2QVVJR2NYL3V4MitLbzJBYi9jdE5UZnArUGdv?=
 =?utf-8?B?OUZZZTIrSDRVODNTTy9KU3RiVXExT25jV2tMemFRSFlweElIZXJ2dDQva1d0?=
 =?utf-8?B?VkpVbDVOU2VJWVhDMXZtVTNpOTNqaVlBb1Y3MlJVTndIc2FQaXNxa3RUMDVU?=
 =?utf-8?B?anJwMlRnN0lOWjUyMWp4NXV3OFhFb0lDK1ZuYldFVmNYMUlLazhmRFE0cTYw?=
 =?utf-8?B?TkdsTm5IdXYrSy91VnhVV0k5TkxrdC9sdTlWYW4ySmxyUHBvSW15NS9Wb29C?=
 =?utf-8?B?bWN3SHo1NUdWaEI3SEI0a1ZnVDRjOXJoZ1JhUDVUbzNwRWY3a3dNZ1Y0MWsy?=
 =?utf-8?B?di9IcEFzelUzL2NUSHlVVnVjRndua1RaZUJBQzVzeGFLbjUrNWNNRnlwYTdP?=
 =?utf-8?B?WThKdmdXQkpTYnlCMm1mbVJ3QU14Tlh5ZzR4Z3BQMjRpajl1QVg2WmR1OFkr?=
 =?utf-8?B?QUhMeE93WWJUb1RvU0VzWThLQWZBVE02amFnN3FSTFdwUXpRUVFpZjQvZm5G?=
 =?utf-8?B?OVVRQUhoKzByRXpTWGsxNnk0bVFuSk13VDJkcFNLN1d4YVN5aWpsS1lOM2Zi?=
 =?utf-8?B?NnRNZGJOZU56MlF0T0cyb280YnJwNElMU01MUGJ3UWZyZGhTTk5QQldPYytt?=
 =?utf-8?B?UHhLbVRxbFRUT2xFZFVnbDczWmJGRXpycjNKZ1Jvc0JZeENORzVYeHgzMVJN?=
 =?utf-8?B?MktZYS9NcG8yY2dsNmZuMGt4SGNJU0RSamNMTVU0U21JbGpnS2hKRWRIaVJE?=
 =?utf-8?B?VDJHVHR4bG5rYzNwd2lKRnZoMEs5cHpvTklKY1psMHU1SDVDQ0lpYXVVR0tj?=
 =?utf-8?B?WU5HZWIySGJsbVIyYzFteTA3SjlzWE8rRHdmMHIxbFJ0dEsvaVRHZzdXWTdR?=
 =?utf-8?B?bTJqVlY2ZUFFTm8rckZWVG96b1dUMXVybXhhNENPR2Yrb29saks4M3RZWngy?=
 =?utf-8?B?ZFQxbmtXTXMxNlZRKzQ0Kzc1UnY5cjI2T1I5R2ZJV21CcjlvVFlVNWZaRjdY?=
 =?utf-8?B?Njh5QWhhcnlnTXJJTHdTeXVISC8wWUwreDBPUUlXNm1ydjhvQlB4WTdGSjN6?=
 =?utf-8?B?TWN5U3VJR1k0d0dVSmdVWVpZb08rNnRzQzdrUmxWUzIvZW5WVlFiV05BcG52?=
 =?utf-8?B?Sy9Da2JzdElUaEFkUmh0U0hHMXoxbmNIREpjRTRVMmVpS2dvaEJSNDhibTd4?=
 =?utf-8?B?SlR1dUZHN0VrRDA0cVN5MzlsaGs1M3d2WDNCWGo5b3FMdDBvc0dtcDF2R0hF?=
 =?utf-8?B?dldSbHh0SmR2cS9sRkIxUDhHVy95cjYzZFYvNW9aek9MaDcxZXU2OWIvdVJt?=
 =?utf-8?B?d3A1dENEcWxtM1U1YlFBOEcrYWRlejNaSXh6SmwySUxsdkpDeUgvSTk3WDhh?=
 =?utf-8?B?eVY0dXFEV0JHQXVPT0FnNjFCU1hCODByREp2aEptNzdLd2ZleFBLSWlOTE54?=
 =?utf-8?B?Z1VEZFVSSUVwaEswQ3BGTmY1TWp5YmhwUXZVc3Z3ZUJ3MGJRaCtsdnlvWTFT?=
 =?utf-8?B?U3ZNUitGSEtHMDVVd0VhNWhrSHkwZ0dOeXdXdEYyK1UySkdidHBuVjZVYko0?=
 =?utf-8?B?bjQyeUI3UlJIR2JWQXNUd1NmKzBIbHJ3ZHZjTHpySWdOcDBqR2NPdjZaalo4?=
 =?utf-8?B?MUlScU44OERnaDd1TmdmK2pUVU9RWFM3aEJIVDhHWHNRVFlUL1Q0SVErSEND?=
 =?utf-8?B?eXlvQmg2OHJLOC9ydVR3OGZycUdHaXRyVEx2Ym5yNzJZM1dZVEc2bVpYVjRw?=
 =?utf-8?B?TE1tcmRIOVFKSENEZ2RtSmorcVNyYW9YMThOejRiVjdaSEZhbVZZQXpOQWpG?=
 =?utf-8?B?QkhMakx3dXIrc0pTRUgrLytGaWR0MXk3a0hwYjU4Lys4WXEyU0hnZWNCN0o2?=
 =?utf-8?B?Ukk2N1lINWVVdWpWQ01mZWsrV28rc1hFeHZCRyt4MkNYQnBpZGc2cFBWanN2?=
 =?utf-8?B?U0k0SytjQ21CNWhKUDdJZXdZQmo4NmdCU3lKWXFwM2NXNDUxRHlaTzdJK1ZB?=
 =?utf-8?B?VHFyZUp6YUdoSzczbTRjTGR4Y0FTT0JCY2R2RjdrL3pMRDY0b0FNYnlqRVVW?=
 =?utf-8?B?eDR6MFhyeFoyb1dpMWZ3ckM5WTAzMGpta280MWtaRVN1eGh2MWVwdW9aOXdQ?=
 =?utf-8?B?ZUFJVk5sR29uYzdicHVOd1Y3U2tBbS9yQmhrZnh0bW5oY3hzODYxdk9xT3pj?=
 =?utf-8?B?bzkySlg3OG9ncSt0NHg4WTdjRTA1cm8zMXJrN0VQT2dMbmdBbnBKdk1ubE81?=
 =?utf-8?B?TmJMUGkrMU9zWGlmNWR3M29ZS3dCRjVEQTJuTmZnRzY3RllmTmRNS1p1U21X?=
 =?utf-8?B?ai94RE85dGM2MWQ3U0pRTGFPSEFxV2NReEtqdFhUbEErMFNCQXRhUT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94bb1c18-5a25-4960-9bbe-08de60410aa4
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 20:49:20.2246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /87hG3tvewI29i9WpZcLidBMOuXFG2p+n2xyz4lzruheUjlv3BrBUARGJUJjSo5Stp72BLDP1seyAucpN5rowA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3559
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[atomlin.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[atomlin@atomlin.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16469-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[atomlin.com:email]
X-Rspamd-Queue-Id: B5669BF4B4
X-Rspamd-Action: no action

--dpnq7vx6qy47k53q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 03/17] ima: efi: Drop unnecessary check for
 CONFIG_MODULE_SIG/CONFIG_KEXEC_SIG
MIME-Version: 1.0

On Tue, Jan 13, 2026 at 01:28:47PM +0100, Thomas Wei=C3=9Fschuh wrote:
> When configuration settings are disabled the guarded functions are
> defined as empty stubs, so the check is unnecessary.
> The specific configuration option for set_module_sig_enforced() is
> about to change and removing the checks avoids some later churn.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  security/integrity/ima/ima_efi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/security/integrity/ima/ima_efi.c b/security/integrity/ima/im=
a_efi.c
> index 138029bfcce1..a35dd166ad47 100644
> --- a/security/integrity/ima/ima_efi.c
> +++ b/security/integrity/ima/ima_efi.c
> @@ -68,10 +68,8 @@ static const char * const sb_arch_rules[] =3D {
>  const char * const *arch_get_ima_policy(void)
>  {
>  	if (IS_ENABLED(CONFIG_IMA_ARCH_POLICY) && arch_ima_get_secureboot()) {
> -		if (IS_ENABLED(CONFIG_MODULE_SIG))
> -			set_module_sig_enforced();
> -		if (IS_ENABLED(CONFIG_KEXEC_SIG))
> -			set_kexec_sig_enforced();
> +		set_module_sig_enforced();
> +		set_kexec_sig_enforced();
>  		return sb_arch_rules;
>  	}
>  	return NULL;
>=20
> --=20
> 2.52.0
>=20

Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>

--=20
Aaron Tomlin

--dpnq7vx6qy47k53q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEeQaE6/qKljiNHm6b4t6WWBnMd9YFAml9GUwACgkQ4t6WWBnM
d9YIIw/+Momf62cUcT0rK4YMy/S2GyRCKlyE8abLCHHW5/usHqLvdZR0Qw4RaIrU
FjGqVGvPAKbwoT80goPPY6mLs1LvmH2EpQLp1SXfqmXF2bPPF/YAr+vUIM2/a/Ob
BUyLuPDN3U0Jadu52ShYSVhQUt4LTbiw3VCEJMe5gf8ViLQE2MaURDpE7G2EjKoH
cGOmvvt9Ap6IZSdbqbZr3zLmZSwBlVvXxNJIhohzuI2z8XpKPr9hln0QAxy16rUq
R9/dMtOv9Ho2ycEFm0gDr+RBUkMvSIQiN7DIwYrlIJKgvMqhJVg7JaNNakaL9aAP
rQ9scv0dB64fynvAp10n5uGuf/fcYtx9d3tAdoIajWs/FFgeYW6q0exW6sruQG4O
cZ/A2Le8UnvhYxgQwcWwxwtT8IRrhRLkFkbImfI2jt21utJ18TFeLprg8Nu1t70M
CiMLqJw/TcigiYX0UrLSWPOEcVT2SQHlXe1Gszl9HoJEoyqx6Ff3O/E8UduxdFeI
JWHPA85ogkm3jrW8W+pY+886qC/kNhb+YXN17YHWJMdyV01H4aZNbx6zixqZTwm0
yIdeXgKymiFoqrK6r4hKCCgKELNazMPzhDW/f//92Oa5NipSdKy7z/1ZsmUGd6A7
ZYQKEw+T3JLa01OMv44dRUdwRq8iyptvW/ODN+QZajsHQ1GJpZo=
=3T3v
-----END PGP SIGNATURE-----

--dpnq7vx6qy47k53q--

