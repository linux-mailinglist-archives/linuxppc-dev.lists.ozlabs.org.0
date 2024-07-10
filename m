Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D69092D794
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 19:38:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=QKfJQT/a;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=BF6C2aVr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WK4ph13xHz3cZm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 03:38:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=QKfJQT/a;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=BF6C2aVr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 5267 seconds by postgrey-1.37 at boromir; Thu, 11 Jul 2024 03:38:11 AEST
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WK4nv23c1z3c5t
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 03:38:09 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46AG6FaD017510;
	Wed, 10 Jul 2024 16:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=x0zqLkBuYnX3U+S
	Si0ga1ykpOfpwOsevLFJopO/a0wk=; b=QKfJQT/ahG0sSbUH4/3PT+35GzzGSRv
	LA/FykiIphTVZeZrv7rui2coz3Fq7R8hf+iHRYhQ9biZI+V9rDRLpdlMxdOdkjTT
	CEtFn+YQwPWIt4CGHThMr4cMHpNcOATmSZ62bGj04twp9/FwxSTE+SCayGTQjT+Z
	jHNVBccGLQ17SA1Gg7fDgFNASy8m13DT/dXZ0HZR9YMVGK5tNdqTSSLJjcess+Be
	Srb/P2z54gD7odTCwXhn9sLNP35LoTlrv+HDTaI+3IeUk/LrkqjI4wBfjgbCM877
	fB9kX69CQtPlMsznKfRgFeSLiGNUGF6bBzyyByqVOnJBbywlgpQ1TmA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 406wybqr8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2024 16:09:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46AFKiCs022685;
	Wed, 10 Jul 2024 16:09:41 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 409vv1a08a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2024 16:09:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtFntako50WZIIQBy8e4Ly+NSRfN+8TS89QF4BJ2XocNjBTzGjj3hGbmP1BvEx1D+XyYWDhemrlebX/gx37zmBg6WYANPGN8ECJMLS4AO81qYH73mJroVXsDhQ4S78iS+aNuJPHxiHyPMVBanqfYdCSdcIwrdR6PO9T/BWRKychYBc72MePMIOUGvwM9StCSmPUEUN6P2qOAIXG4YebBQJF+x2p39hIibyjMkhp+lFYCbmGCdFTFNjvkf18+AVKX/RBGe21AJRXHUb6slXXp6lPThXmun/h8aya2ssIx2VhPriD/TceEVJm3o7z7Db3sJA595A+1CoBFebvRx4fEgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0zqLkBuYnX3U+SSi0ga1ykpOfpwOsevLFJopO/a0wk=;
 b=kEkpRuuaPRz25iwepELp0mkjMNM0zUygR+dq9WdIy98NXXYcqSvriGF5HqEObj1Mw3FvtdR+6BoiFHl3xePWYy8/+WfFqwIJ8n32k4ef+PGDOchtqIrkbWZ/309jbmNnNZildMrzM8wkPbvS426ANom6THHP3g1LOf5WhyGPbrpVdV+RwOdNNLfS/49QnVm8PpkYmskCcQzEwqs5KMnPE9nJU7blYxwxa90zsyDcxb+h+VW5GIgnzqyAyLQZtY/npUhygjd36PPJPLsNRE/r7w0xBD5iBOlfSaXKAzuOd30WAaKdjoHM3lWy/pG6rTje9q4ZSGwCcP9JrK7oFTLNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0zqLkBuYnX3U+SSi0ga1ykpOfpwOsevLFJopO/a0wk=;
 b=BF6C2aVrZJn5nIS/Ory+SmmTX4VLGFww+iGpEQQxEYfKCMUO8/46vRQtuiamAppjyYLx2H9mH/Il3E+Ub9Qpff8lA4vfdD/2fxFatc3OF2KG07flbTfkSuUW+8Rgq6FDx/AuN+AjgOPUKHPb/MeI4D3hjnvyAM4X1aCUnqAfdXc=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by CY5PR10MB6192.namprd10.prod.outlook.com (2603:10b6:930:30::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 16:09:38 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 16:09:38 +0000
Date: Wed, 10 Jul 2024 12:09:35 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Subject: Re: [PATCH v3 16/16] mm/mmap: Move may_expand_vm() check in
 mmap_region()
Message-ID: <zu7c7h7apzzo3amki5vz32v77bnkj46h54k4662tn5naciv5i6@d4uo4rdaoxlk>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	LEROY Christophe <christophe.leroy2@cs-soprasteria.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>, 
	"sidhartha.kumar@oracle.com" <sidhartha.kumar@oracle.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Bert Karwatzki <spasswolf@web.de>, Jiri Olsa <olsajiri@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Dmitry Safonov <dima@arista.com>
References: <20240704182718.2653918-1-Liam.Howlett@oracle.com>
 <20240704182718.2653918-17-Liam.Howlett@oracle.com>
 <8fbb424d-a781-4e61-af7a-904e281eba8c@lucifer.local>
 <e5ldsusdn3som7wn2rw76wtrhnlrxk3vkyk3iyimh6qv3ptvwu@24zfmamllev6>
 <0998f05b-9d5f-4b24-9030-22421e1dd859@lucifer.local>
 <874j8x5t4e.fsf@mail.lhotse>
 <92ce2025-51c3-423a-902e-dbd19d5d7850@lucifer.local>
 <7161cef3-49e4-4057-8a66-ec1ad6eb3f9e@cs-soprasteria.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7161cef3-49e4-4057-8a66-ec1ad6eb3f9e@cs-soprasteria.com>
User-Agent: NeoMutt/20231103
X-ClientProxiedBy: YT1PR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::27) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|CY5PR10MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: e51d558d-f0e0-48c5-7126-08dca0fab300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?MMwGlya1hF+HZK2k1eLFNd7JEcWsPuW3zbbDZWXSNw3jpTJ/8g6h+Sz9ZsWw?=
 =?us-ascii?Q?BRDB04Evy+rfv6MUtS7//oJ6Iaf8FqFEhtutrSRGAwRYY0Kln87CCYIst349?=
 =?us-ascii?Q?35ikq4Ior0WhlRlqKi1BIkGuA7CKTSFbAtYlmtumC5aB09ANU/cnXojlGndP?=
 =?us-ascii?Q?I3V6RIqsuTv9/HV0djBJ3czrCmKXCkaR1iPiiwFy937kbCuxfOBEbAVfpVmr?=
 =?us-ascii?Q?jySGyWmtHkq+0Fq2so1Ry9W/b+nCGQGBIUYyJaGoSmtXiUlL6qQIKJJcMYmF?=
 =?us-ascii?Q?0OU5skSqflko+rTvv8Sw20M7RTWEEp110XMkw6/T7amQ/kpwbwfLLRNRUVuu?=
 =?us-ascii?Q?ZZGvHy4YeRo9u9vLPZz0NBQMUHbucqwqybrLnvE1etyH4zjsJ9JS8nhoni8g?=
 =?us-ascii?Q?Kpu0KUqQKA2fsdbBacKmvcnoe0fSwr8UO0/iP7th/AfPy6PhldLJ2252/gDh?=
 =?us-ascii?Q?kky9Z8sr+3uqSwbL1W3kYeZI+HF1uLCEh0FTIdxXG9LLNg+EPDs9ho90MaFS?=
 =?us-ascii?Q?g83N4rt7x+O9AWxjEyCd/8OHuX/G3opykmPC1QGiQ5WqFRZR5WXg1IeuIGl3?=
 =?us-ascii?Q?H5LXvAFtTSGHnEat5YCABXZ5BY/AP7BAtCNllRL46URsYn5GrveZMh19PGCx?=
 =?us-ascii?Q?FAIkR00ANsXpLCzGwbzS1ihFw6laqwR7h4UDtfxgb24fX3BGYn3AUZiA7j2G?=
 =?us-ascii?Q?m0+83si7DXVjoIyHB8p03iTzn+japAhbO/RZs+BwxxDOr0UKt2X5cb6rQmZd?=
 =?us-ascii?Q?OEX2LAVcmdsvjeyzdwYHzePeGeGEajKbbbh4IfX0P+H82p4kfEW+ginikhoA?=
 =?us-ascii?Q?OWsXW92GytkSmjWaw+y7fbHdoLUi1o08dN+gCxtvqorRmyzcc8IL8cs8Mkmh?=
 =?us-ascii?Q?a/DcqWC+JZMDn+EQSPZoi7ecxR4AOo6xApku4c+9kXZlBsfJL4MzRm4GtGwj?=
 =?us-ascii?Q?7dD4sXs1/tZwuTSGqZM0eVHpuSSZdAqfN1lxEx5Wp+T726nBA7YJr0K9PwU+?=
 =?us-ascii?Q?66tf30y4BL7nPx7WEad9jO5Qu2oIgtonEvApEDt6KM2ldsqukOGpIj0BBYf4?=
 =?us-ascii?Q?toKU63/vJfEbz1Yh5uUtBwL+XEUWBC46ng8GwlcjCXgPMR3Xl6PbmvccrI3o?=
 =?us-ascii?Q?HcsrRIGyGnervARMBkUFZzvvox7khLNKZ04Vn5ckdw4Q1FSnu8kQtTXXFSsd?=
 =?us-ascii?Q?rPDcBMxfOE2TRywXy2eizzxQILFTO0Q6lCOvj1G5qpTs2H20OaG+vzJhmmc+?=
 =?us-ascii?Q?DPdXefsO2LQ1MzmGs5r06y4VgzyxbTz7aGhe+mmIoXMXwKfK0zx87WMs9KvR?=
 =?us-ascii?Q?LoL41ggZkoF8781Fe86l14UH?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?rcEZ6WS8aU65nWsCnSNpc508XRe6//xF2C3kG5sMKb+mQNGbmcGvlMXmkDFE?=
 =?us-ascii?Q?MqJ9YdBrF73PhRvTM1YaavHSkr2ZCOjXp6IqYgYKs1schBMQ+4gs8RQEdX+9?=
 =?us-ascii?Q?d+PJVXX0L+GpyGRApf5bzREANmcJmLZfTDAiwZbvSq8y8KssVYSFR1dfua9E?=
 =?us-ascii?Q?HQK1e3FhoTMJRGqnOY917ibxLgc8/PwSSKeWf8orx7GchUZQJnMqxMZh6cpv?=
 =?us-ascii?Q?ogObWVwUitNmKiLztNqcE5YZ5YqnsEC+/qK7of55GndBElOwiKzmo8gbUpHT?=
 =?us-ascii?Q?KYyTVyAshCye9bobEQ7IMPhMi8QTAgfCr84RzeqZXHhvIFxGI3SNypqK5Y25?=
 =?us-ascii?Q?2KoxUoQ/W4RkWpgVpPEAHie+O9GRWxkdCb3wiWbp9u+eEQmVZLxehQ4ZpsEX?=
 =?us-ascii?Q?iRvC9I5CkIsjrPNyOMQInBxLfg1gJkJtFvCSwP7l/74y0iOG/yKqtUFaaa6l?=
 =?us-ascii?Q?0F995+c4GW6bke5srLX7MiR8Yk9KS933lAWyTOKzONM/XV3g+nbKHlcAoK26?=
 =?us-ascii?Q?zwOxL7rdz57b8mXFxmbtJPqdgwAd59MNAFKKmwKQ4pQuI4JR77/vDAzYc1FW?=
 =?us-ascii?Q?K0PUpzDsOLr27uwJYKj8NSCKVnfyFpcjlE0T32jKC/HrbQwToAbQFt8x5gFc?=
 =?us-ascii?Q?0/qDEMChuXKafuZKf9vZ2CXUGXsVRXaS+Umf6Hrbx95UxR+5n4qVGG7XZENG?=
 =?us-ascii?Q?GlTuDNNhPxPxjHUrRicmsj0X/naLgugDyNPWKKmeine6hE63HPWlxjNnEYFf?=
 =?us-ascii?Q?0cV6evQvsnvFZ6EtUoWU7T6nJzQ5SIFdezZhdVTqb+cfNEMYm1NtfrJ1Kj1P?=
 =?us-ascii?Q?fF7slMj7cjfr8tmUSMljHuKztoXXYvKicPMeSRlMn58L516zNcqjX9yHU/BR?=
 =?us-ascii?Q?Zbay83LW0R0LR3mI47SGHoiwyAwwQHDrg8omEUnORd7UVx8mPcV1vejtjLDh?=
 =?us-ascii?Q?M0B708XWz8FpiLqkSli4ir0pS+euQzCb+ZbL81HhhbAIkxSazGFlIHf5O/bP?=
 =?us-ascii?Q?lBG9JibRIritYoz6WzDVca9P1lfgF2eQEZDUUN7T39wtxij78G0eP+RoeiFa?=
 =?us-ascii?Q?lsreT2DSgCYAvQdXvx8Kwx34E1Vgl7wzj3o8xvn0tIT7gJInJPO41+hsZNeM?=
 =?us-ascii?Q?O9liZuQqzM1T0atWrUMxtKWAGemJSN52mqdQMYXfm2DKRx4WWutmKbNmv7l7?=
 =?us-ascii?Q?O0hDxwaCBZ/zThHb0X+pmEkG/Z2cvtVWdjuVtV3xIItfflEP4xgfjoMofYeM?=
 =?us-ascii?Q?BbWC982NL4FvAU2gjSip15SVutJdlp6ArgEkr2hKvKRQJ4Wewm1UJDN38QjH?=
 =?us-ascii?Q?vPZNePSttkdcKJIujMrOusAUeIBWJtEb8KSko8zg9ysFYDTshSDsUGAx0Y6v?=
 =?us-ascii?Q?/Xq6Prxa1FM0mTtDNmvKzg0nG/h1FD6gi8bT0yxaJr8mSLeGtjHTJTAJ1QHV?=
 =?us-ascii?Q?9RWNLdPdCkBv688R/RIO8v/0xkSKHp159Lg8DuL7howzR+ueO9t8DMm/V/Km?=
 =?us-ascii?Q?Xq+Iyn1shwTYip6vVLuS2RXZ4/Yq37EunHw4aFB0d4xiT/ZpO4F5QiBoe+g8?=
 =?us-ascii?Q?6MZ96U3KvAqjUroJoLvDteHsV8uxYJerEefNrLNl9k3RlmZ/ldYQHkXl3cQ9?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	AVwJ+1IQtfi+6QMiyV0d5Tq9PzullxvZJGT240bDNvkxldlWAUa8Ukrt7KIBDNqIbkuLHiAqTIs/dZvwviav3uFoX6/7Zm2OoCWjFUqvZZHbSJkRNhfCoB7L7jTnlxM7BxBDx4dwY6B4ga6uJ2d0LJWecvJQcO8oTGmZUSx51KwCRqjO6OJLj1h4G7kYDpbJQzBl1SHsSCfvVuVi0o6NSWbX0OkdJyShaRsIvmN9wL6GVT4QtneQK+MQhumkW+SB4LtEeUvxZQUfOc577jis+yHS/ce3MqoThocbJofcQ43qzb7wad0oTTECdFDqlo3VtZUSqJwL99BOjuDdtDlsunBNKOF4dRAGFiL5C2ORPL2i702cWjYBuMR/uaZ8pf+qyDcEmxLgKn2q98Tio1DsDAaS567R3PZdre6HGDcemY/a019ihbGijtjDbS3fhle5b8ivuu0pnTLQHgpvXO9saCuT63KWGqLYiJXFjF0Ft90AyzjmwZG6Xtv5yZnpUrXubeIawdUTTY9yRy6pnY3iRprXaZaLcjtTesY8aYJthDaH+TedooAaQlhQbat1MfpHIcKxvFYS71uTP8jhnnHbxpqgGnNqV1kpBEer1ciRlbE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51d558d-f0e0-48c5-7126-08dca0fab300
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 16:09:38.7285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5TMoDHM2eaq2TPX3/5zUtkV8v8z+5IzYh1UMZJO/MDZv6U+ANzxYo6dm93OdqTweBg1zaIEJzUdeZngAbWfPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6192
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_11,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407100112
X-Proofpoint-GUID: OntKTjLKlWBgf42LvWzsl5EaxL0HSfPv
X-Proofpoint-ORIG-GUID: OntKTjLKlWBgf42LvWzsl5EaxL0HSfPv
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
Cc: "Paul E . McKenney" <paulmck@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dmitry Safonov <dima@arista.com>, Kees Cook <kees@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Jiri Olsa <olsajiri@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Bert Karwatzki <spasswolf@web.de>, Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, "sidhartha.kumar@oracle.com" <sidhartha.kumar@oracle.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* LEROY Christophe <christophe.leroy2@cs-soprasteria.com> [240710 08:59]:
> 
...
> >>>>
> >>>> Assuming the removal of the vdso does not cause the application to seg
> >>>> fault, then the user visible change is that any vdso call after a failed
> >>>> mmap(MAP_FIXED) call would result in a seg fault.  The only reason it
> >>>> would fail is if the mapping process was attempting to map a large
> >>>> enough area over the vdso (which is accounted and in the vma tree,
> >>>> afaict) and ran out of memory. Note that this situation could arise
> >>>> already since we could run out of memory (not accounting) after the
> >>>> arch_unmap() call within the kernel.
> >>>>
> >>>> The code today can suffer the same fate, but not by the accounting
> >>>> failure.  It can happen due to failure to allocate a new vma,
> >>>> do_vmi_munmap() failure after the arch_unmap() call, or any of the other
> >>>> failure scenarios later in the mmap_region() function.
> >>>>
> >>>> At the very least, this requires an expanded change log.
> >>>
...

> >>> I mean why are they unmapping the VDSO, why is that valid, why does it need
> >>> that field to be set to NULL, is it possible to signify that in some other
> >>> way etc.?
> >>
> >> It was originally for CRIU. So a niche workload on a niche architecture.
> >>
> >> But from the commit that added it, it sounds like CRIU was using mremap,
> >> which should be handled these days by vdso_mremap(). So it could be that
> >> arch_unmap() is not actually needed for CRIU anymore.
> > 
> > Oh that's interesting!
> > 
> >>
> >> Then I guess we have to decide if removing our arch_unmap() would be an
> >> ABI break, regardless of whether CRIU needs it or not.
> > 
> > Seems to me like an internal implementation detail that should hopefully
> > not result in anything that should have visible ABI impact?
> > 
> > I guess this is something we ought to assess. It would be useful to
> > eliminate hooks where we can so we can better control VMA behaviour without
> > having to worry about an arch being able to do arbitrary things at
> > unexpected times, especially pertinent where we change the order of things.
> > 
> 
> I see you are talking about arch_unmap(). I didn't follow the entire 
> discussion but we have some related stuff here: 
> https://github.com/linuxppc/issues/issues/241
> 
> If I remember correctly arch_unmap() should have gone away we Dmitry's 
> series 
> https://lore.kernel.org/lkml/20210611180242.711399-1-dima@arista.com/#r 
> but it hasn't been applied yet.
> 

That is good news!

To review, ppc is the only arch using this now and it sounds like you
want to remove it too.

Considering the age of that thread and the possibility of conflict with
my series, can I drop the entire arch_unmap() function instead of
modifying the handling in core mm?  I'm going to assume that's okay and
start working on this for v4 (because there hasn't been a public reply
for v4 since 2023/10/11).

This would mean less arch-specific hooks and that's always a good idea.

Thanks,
Liam

