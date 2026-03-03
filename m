Return-Path: <linuxppc-dev+bounces-17632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PhdNSJAp2kNgAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 21:10:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E511D1F6A41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 21:10:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQRjH30ryz3cGD;
	Wed, 04 Mar 2026 07:09:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10c::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772568579;
	cv=pass; b=S5AcJ+D9PxAk83LwUPTmWNgGb4N9oUcH9YAzFy2zIi5At/pQs7Do7+9pQDsweXHb6JDbAoKgDIS3Yl3ehpc5lgD9miHOpBt4xr8RjO4WZWzXhTX9uHZqHyzGJAP8JtAiIQjToXSGxOEa+C1jhQXFz4XmMGe93/ueLloRWzeUpinhil+11v1ncbMdwDnaIBTMwg0HBrYKW+UDYo8wESZ1LkhHoTJ/C76iA2sEcruzsFDXfs7YKbsTDGPJYq2wxH6ecpb9KmrpeHfKgz/aVt2d9CexoTXaS/6sxpMm+T84gFvETRfnhH9wBOFzqb9nqNTizgrs70AfEv1DOZDG5OEHGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772568579; c=relaxed/relaxed;
	bh=0/VHWhXnGBClQUIzaraUcabUFgCVEMWrKlPFqGY9d8c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dovdlvpp3fKnND/QWWzqmrrm6iQ2HoDx28iJveoVJ1XWMwLiERQgzLYgnQKtTP6O1aNIUtsuvukXMhg5z8B6P8jqk3NzywkBmYTaebmw8kXcZW51uxaz6yCn0GJSwYhD6l/1FSfDjR/NRJUmiEQRCuD5RA/FsdJksqE5ty4HtLMwTKnpBZRZ4heUb4HfM4916Du1SllN8yqYy/L3Q8w2GNKYJAE4xgWNEbaJU96zGGjK0OZX+ao4is/RG56SfIQS0GOXCHVAyt+MxZkmI4EH3iayvmbow6kspHDAIs8E9DgR9ew9PGlggOE7nxGJ0CvZ1GtIJ4bBLsqx0yJStkA4Lw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hE4BPRUj; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hE4BPRUj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazlp170130001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10c::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQRjG4ZgKz3cCJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 07:09:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ch9NCkBc7x+s5IqDHkTXseai4FZbbtrwaeRZRSfn3h2G4KfJX57ooH0uUkmH7ziMIHFiYZbpituPD3A2wTF4k0rEoccavuHJrMiEtgDMDP+4dgFBhZNE+LRj89Ex60VLEDKBX0M+TuXo3fTa7ibEVds41cVw+qB9xsjXgsvvHIWkuLLcr7TSSYEf2qvJwDupJTzz9mwmJ3odasbnz/zPsmsLaz1fM0VDux9u3eleTQH0lwBZcAu27EnBbw8KiosK7ubvTDjbr2aaNpb8Yf0+FuKZOi66qUScxdzLj0bB1r9+bJLK28nZPOrVI2TbsH+849PLTYUKCoYaE0913u7Iig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/VHWhXnGBClQUIzaraUcabUFgCVEMWrKlPFqGY9d8c=;
 b=yFx77kS+NZbjU/lnNoFQasFGA36L0hQZp1J4fuVmdDnSov1cFDFfaQdo8q69kw2PVkG7bxBHbt6jfFEIVmPvp8/saWvizjcjJw/Kp181BqKBWVYr4Q3my+nGKi8+K15zQDaujfUAUVzEGL5sWzVdjyOmQrbOmdeCd8qhggNp9Y31NoI5pkCZyRo70xqdsvz3b7NoOhDU2nnZLsemnM+cgfVi7j7DoooKItMb4zsthtTIz65WmtU59ri7HASgSUn6P6KIReZPD6EB2Ehk7mJ2fvv6obnKVWTF1eqUOzHq4j8d1ArGw+Ct3VoAIJgDSQabfNzpGnNMfd1Tu0uibj5eag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/VHWhXnGBClQUIzaraUcabUFgCVEMWrKlPFqGY9d8c=;
 b=hE4BPRUjgZ3zeXco87xkCNJq+hZS+HgxQu+95gO4F/5Izrhp1wMMUGIwgI7izsU2zHw9HMGdtQn4cG3K4ZaF5ZNt9PuzprI1E7sXhuTHGAec27h3zNXN+mYi3+vvQpWqO5qib9xoldwMDz/EUZ6ABvQKbQPmxqrccg1VqkraJhY2TpmlinbTjp/qJPJ89FTUdGlJ8k3FwTrv68CwqpnSt3xzg7Vqf7lgeS5GRgAnASPjx8yA2ATGFBp4Zvge53MbB3H/t03yPV882Z2Ob1/61FOBqgpGU2Bq71ET/kDN9K9nThg19EeJxXln1UExaCV91QaiNiW6H8m0NG8SI4rOUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 20:08:45 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 20:08:45 +0000
From: Yury Norov <ynorov@nvidia.com>
To: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Kees Cook <kees@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Russ Weight <russ.weight@linux.dev>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Suki K Poulose <suzuki.poulose@arm.com>,
	Tom Rix <trix@redhat.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Xu Yilun <yilun.xu@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH RESEND 0/5] bitmap: cleanup bitmaps printing
Date: Tue,  3 Mar 2026 15:08:36 -0500
Message-ID: <20260303200842.124996-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0746.namprd03.prod.outlook.com
 (2603:10b6:408:110::31) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca6503a-e86b-4e73-cb81-08de7960acb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|10070799003|376014|921020;
X-Microsoft-Antispam-Message-Info:
	sJ7aX3bjePPwEapk4Gi20xzTWSn+/8H0nztQVzs15dh9yi9fbONIA+cVXkaU9H0Vms9id6iID8DAYXMI6pq7pgWe6BJVVXUgcAket28ojSdUqAnMQvQNPBjzhfGFRofExKnvTgsxLMd9nzXqV8XjiZB6JQVHE6sHXmg/QU+VXN+ycgesAhGHcRAYDlyEmWW6YT5oHVy72vEjUD+ManMA9uJizd+j4yeWTZ3sk9q3/sZkVRc7wnWVXchOgig+IWK68MDHfUi2/NWJvmXawhzTwmM+bDGTv1/+omUZUDX0uF/qRcsgXh3I2/yl8ZyBSMpzvn5zzg0HuI0JRClwyG5sgu71EcN8JtqjL401N0eXT3FlitNlz11QVKfZkIAiA44gtHystHQoKGDkA9SVv5SjzTe4o99LSq6czg7HG8FFb5C6JsBoHI2uTc43Nk99SeKZIJbyhQMseb0rl0+Q+Fdlz4+uSASKIHP0B5U8kDeAZ7ye78PPsYDSFyrWpVpA1cfTx4CbxMfC/g0fbNeqHU7jAVRc9xT4wSd3WxfpPls5f9i3rS7EvrXZtbqNBVBhppDSSMYD3Jqpq/doUSYtfAwpGyxoHH4CKQ3CYEiTOz/vaZZATpVOEPfuyOwBqcXvUsZzds9xFrrFlXHy1lskIQaYnyANFp4TCo5PELOA89c6IckZ7iJjt8SYVwRaxcin8f/u/Eer/Le5gBuRjP1sosd1H02K6BklQXURGz04VAExWHI6YT/BHuCPKaoVd2z9UCIy7DpJ4rVhHYcQfzD6yWFbJU4JM1xT8TTax+WvbBHDgh0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(10070799003)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUpTSEZHalJBWUN4MlE3bXZsd1ZBazdjdGJrcnJoVkZSWW9OYzUxWncwazJN?=
 =?utf-8?B?dDA3V0lFcExhWHpNb1VRVUdqaDdvWi93cEZGNjFYSDJ6SytCOGRJLzNGY2Fh?=
 =?utf-8?B?bHRYUFNLMnhFUUJPZlgzSktlQTROTVplSXdIdGJPdUg5b0t3Y1dyeHhqSVdU?=
 =?utf-8?B?OEJ1NElYdHRvNjZBeXB4ZXBxcVF6WEFYL09xWDdlRndVTG5NMWxpUXRmTU1i?=
 =?utf-8?B?cnpLcll0VHVzM3JGTGd4NndXNjl0TU1QQjhKOTBIRmdPRWtidUNITUlhbmph?=
 =?utf-8?B?SXRGeG52aUN2TjJuZDYwYy9rc0owNjlWRGRFTGwvMWYzMUpLTHJXK1hNOGdh?=
 =?utf-8?B?aVJFQzhpNCtKbUFFYlc5UHJKVEZNY1E4R2tSTmZCdDIwdW8xWm0vU3JEcjZB?=
 =?utf-8?B?cUNNY2doaHU1NmE4aFJ6aUE0aHNUWXZtV3NXQXJJdjlUSW1tT09FZEg5NmU2?=
 =?utf-8?B?SXErSzkyVE9rMHB4aVIza0dBRnpRL0ZDQjlwLzl6L0RJZFBvRDZpeGFVb3l2?=
 =?utf-8?B?VmFsZ011UDFGeU5tVWp3L3MzL05DUGZveVdLUkxONUkzUFVLdkU2ZHBmTjFs?=
 =?utf-8?B?M2sxMm9IcC9YTkR2aW04YmE3bFlRbkJRZ2tvM21PYnpLaGtWQjlpU3k4TUU3?=
 =?utf-8?B?TEo1ZStsWnk4K0FIUSszN2t1VitsR2JEamFSdHU4Z0dwZ0ltQ2VSRVdudHVJ?=
 =?utf-8?B?Nzdjek9qRG9vOWZTM2FvaGJaRGpJRUVrandzQXlkeUN6TGVreFJBNmJweVVn?=
 =?utf-8?B?eDlLYzJzcm9SbUQ2eVJKR004bGtBUlVOYUtOdytPTm1vK0owYitCSGEvN0Iw?=
 =?utf-8?B?R2pDNWVwR2FmaEhNcWN1V0FwL1M4SnM5YmNZalBYMjA4bHY5b2tRaC9QajRl?=
 =?utf-8?B?T0FHUkgweFlzRE5qQ3Y0d0ZaclYySHhjU2VZdlVnN2lFQ1ZzYmoyQTRTUUN6?=
 =?utf-8?B?RDlZUVU2VkZacGkxS2FkMHpncVlpS2w3Qm4wWGdZOTNUZDdtaS9zdjlNb3pZ?=
 =?utf-8?B?QVV1VFk4SEhvT2JRUkNRcTFBRjY3Z3E0MmZaRkptNlE1UXFxM3dZUG9kSTJD?=
 =?utf-8?B?NlYxZGY3T3FZWVVkUjVaS0dra21Tc0ZpSVczMmhrVGt0bzlhSVczLzhyVmJQ?=
 =?utf-8?B?OGwyUXF0dlEvVFhEQzN0R1ZxaHZwVG5DMFFDNUY5WW52dHNLNldyd0JaNUxw?=
 =?utf-8?B?MG94VUp4Z3djY1FyUjk5VmdlM3AwYnBXeVZZS0NVRzFNRk1jQmZkYW4yZll2?=
 =?utf-8?B?d0dzbWp0ckEvTGNWVmZCUmVTN2wyWXV0cVdCNmRGYldDQkpkdlZ0c04zeWpz?=
 =?utf-8?B?VVc5OVVzV2drd2JGbDFrSXJ4Nnk1dmlhWnhCUXRiUk1mVnZwL0JiMVF0RXIy?=
 =?utf-8?B?OC9uSTJkR2xCL3FoSDVEbERIZkJ2S1JFTENScW9DaGRueWdkMTQwZm45aW1S?=
 =?utf-8?B?eVAwZi8va0hpUmllNUZiV0ZuNnh3cG5pNmtPbU5iMVdjZk9wVnE5TW1VeDlI?=
 =?utf-8?B?QmZ0eG5ITGVySWttRkV6aDF3VWNJTHZrUnJXVjBobFlZQm81UkVremJkUDlk?=
 =?utf-8?B?REsvc3dYbnlPMGMxMnVveGw0SUV3aGU5NnczZ2I5dXQ0UlhYQ1RYSTAxdUxZ?=
 =?utf-8?B?b1dtRDBSakNHWVZGZ3lzU0JJRExGS1RLV2FQZnJsWng2dFh4NHhvRWxOSnE0?=
 =?utf-8?B?c1ZpTnRlVVRoQ3Y0bnhqbTN2OTdwWG13NXp2MGUxbUpuRkdzSzd5eWdkN29G?=
 =?utf-8?B?ejF2UklVSUplTzJpWWt4QUdoQ3p6eEVydFNZUU94NXZhSzhrM3czS1dEcTVD?=
 =?utf-8?B?WGdOZVRBUCtXdm5vSnVGZjBKVVNmMktpZG5RdEg4S2MvcmYxYnNpWmNrb0oy?=
 =?utf-8?B?Rjhub0UwMENEbDhhUVMvQVIxUG9VNTBJYTNvazhLUFV3UmVmT1Z1ZERRWTVx?=
 =?utf-8?B?clJzSmw2aDJhQThjME9CeVRVcGxKWFNMbjcwNldRQmNvWWZlVG1Zd3JNTGx6?=
 =?utf-8?B?ZFF3YXBRTVpMNi9RdnJsQ2dZUXFvMnJSWGJWSWV0S3JHRGRVZGpSV2JBUWxj?=
 =?utf-8?B?RGJnTXV6ZFRwN1JiYlpST0RaL21BdlU3cm10VmpLUVc5M0Y1OUJ4bTk0S3ZM?=
 =?utf-8?B?NC9pZUJhUVpYaFpWMlVyREVTVEVVczhoSTlwUHl1Z0dzeEdpQlJQZ3BvcVJ0?=
 =?utf-8?B?c21Ub1hWYktQdDN3SExTMDViakg1d2JQdlNrNVhrbzRCR0Nrd0tzSkloU1BN?=
 =?utf-8?B?bkloWDNvQTZpTEkwMFo2ay9Mc21oK1p5T1Vueno2SDJzaWRoVGpqQTlUYlp2?=
 =?utf-8?B?eFNsMG5TdnBsRVVCZjhQMWJwc1ZvcVJkOWVMSndOT1AvY2hRYVVWVy85RUQ3?=
 =?utf-8?Q?s8RAJ9Hqv25fI/llcGesIJaQVIgMohgcu/JCc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca6503a-e86b-4e73-cb81-08de7960acb2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 20:08:45.5942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OXHWcPdoepvfO7oAqFy/D/uSE6Ska9sfLHhXkaLF4UoCQ9RMC6xd4ZRErDjqwjmW38lc1cFLJX0l4JUVI8PVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: E511D1F6A41
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:daniel.lezcano@kernel.org,m:mingo@kernel.org,m:james.clark@linaro.org,m:kees@kernel.org,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:russ.weight@linux.dev,m:sshegde@linux.ibm.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:linux@weissschuh.net,m:yilun.xu@intel.com,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:ynorov@nvidia.com,m:kuba@kernel.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,infradead.org,linux.intel.com,linaro.org,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,linux.dev,redhat.com,weissschuh.net,intel.com,lists.linaro.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17632-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Bitmap API has a bitmap_print_to_pagebuf() function that is intended to
print bitmap into a human readable format, making sure that the output
string will not get big enough to cross the current page limit.

Some drivers use this function immediately before passing the result to
scnprintf() with no modification. This is useless because scnprintf(),
and helpers based on it like seq_pritf() and sysfs_emit(), take care of
not overflowing the buffer by itself, and perfectly print bitmaps with
"%*pb[l]".

This is a resend of non-networking part of [1]. Patches #3,5 switch from
plain scnprintf() to sysfs_emit(), as pointed out by Thomas Weißschuh.

[1] https://lore.kernel.org/all/20260219181407.290201-1-ynorov@nvidia.com/

The networking part, for reference:

https://lore.kernel.org/all/20260303185507.111841-1-ynorov@nvidia.com/

Each patch can be applied individually per corresponding subsystem.

Yury Norov (5):
  powerpc/xive: simplify xive_spapr_debug_show()
  thermal: intel: switch cpumask_get() to using
    cpumask_print_to_pagebuf()
  coresight: don't use bitmap_print_to_pagebuf()
  lib/prime_numbers: drop temporary buffer in dump_primes()
  fpga: m10bmc-sec: switch show_canceled_csk() to using sysfs_emit()

 arch/powerpc/sysdev/xive/spapr.c              | 12 ++-----
 drivers/fpga/intel-m10-bmc-sec-update.c       |  3 +-
 .../hwtracing/coresight/coresight-cti-sysfs.c | 32 ++++++++-----------
 drivers/thermal/intel/intel_powerclamp.c      |  3 +-
 lib/math/tests/prime_numbers_kunit.c          |  6 ++--
 5 files changed, 21 insertions(+), 35 deletions(-)

-- 
2.43.0


