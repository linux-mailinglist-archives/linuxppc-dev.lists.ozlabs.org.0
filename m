Return-Path: <linuxppc-dev+bounces-15368-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6A2CFCCF3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:19:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMtH5gHBz2yZ6;
	Wed, 07 Jan 2026 20:19:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.56.71 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767777559;
	cv=pass; b=XcZ8/Okvknn1TfpeFw1pp2yDGQ79C/DLl+zULtlYe4gAg+RRQyJDKIeK86cWt/bZqxI38dqItdvO/lAkMsyJAVyKlQNbEs/P9vRuOA2+pDJRYfX50bWRSF4cUf/2n2cf7CvcHyVKf4+x99fsGUnR4KF4q89uYJwXDS0W/A3+vUgvxMhsqeuKwyiPOlTX5o2maNEs3hDXhcyvUJL/lDIPM/uYlJZlzxTB0eyksScV3cbsS/7SV+O8EyYiBVBlDIEPAEckNSKfnQion3T+adS4Z2uJ1KhsxICBADlj6oj4xF8gQ9aPu9c4Iu/U6Kue4oN+Gknd/KrhGJprUbetqcLMMg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767777559; c=relaxed/relaxed;
	bh=yOz521J3yjFKdqj1ccDxEWT7+6idlIuUFWZA9NmhEZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KgP7NY8FcQ7gHYFpSEVViD9bWMPFEL9l6nY5zXQFfpmdQLvvNkMJFfSfF/ts50vdB0+xdFRWyVxhfIZMSb+ODpDuzor5WfrH1eMpLKRJ4DmKTbwnUK0sRnOLRcgjuWVMIdoRPrHJhB5T5Yg9Z/tSx5KoGMfxYKcMGBkpwaZOlwnejTSD4nYn9PLmI+YMwK8VIkeaHrzb9YQV3aV3iwsd1sEy95uLR+R5E9srjzoMa0XFmMN4BrOzUZwn4J28XzvQ5EPFtF0wAj5RXRglLUd6p/Bbjw6DFjyNw4bDxxu7Pol1nQHysr+GZtQHfPwlAorZtl/Fi0HpsYIA8Le0UImjIA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PSImS1mU; dkim-atps=neutral; spf=pass (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PSImS1mU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMtH15C1z2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:19:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2OcPNxYHWg/WA8oiAoMwELD/9LDWxDziIx92AJ9jFkPKsSg/Uehkyw1P6UueNsobP0okvGRA+2qKQoAYSst/f1IjqFuPwH83WxTwYuufgC2DMxwrkSyLkk7E6/jk5hK/+RanErnFXd0l7Jnr+Dqvostys+JYFJXHGXuw7z+IwTwkY3qxzJw6O9ic786EzAUMn4eaD9fD+bEWTex9v9WNyh8odbv9EYgj8LLbqIAnpIXOTtFyR1Fy+6E8gScJH2zXr5PiuwNmyDzV+dGp9Q4WHPvSykcSyQ8p4s8cQEVo/oHbnZNjgDstu5v9HxkGDcYg/8xvUEw2YESp9wzObSrYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOz521J3yjFKdqj1ccDxEWT7+6idlIuUFWZA9NmhEZE=;
 b=iJHhxhP6X3JreHmf7ZB+lsiJCpvCmitl1aOgBCxdzJ4cPtNHtM2ilmOXbOQ2AFUHyYo1rFzwt1eoF3yYugfmfM8tWGqpFjJreVECZEwLCvZ8DI00XhuOKDJ5Jp19CDpfqXNJYtvYLNF76xHMiry2ZlhgsxqKVLirxOoSg+vDF612rqTVAhMWWCCK/e5EnQe4q/QPq79OH0SP6276FbS+KQhlTZZrg0PPm/iDGLKH20L5m5XESO0pAYHC7kbX4USnmXKqTR6e+tF1Uygsbn0tHjQMEmK491tgVrlW5W7giyGS9TLMBTFdQ1qzJKUhptnZnXGGh86k9wxBp4UCtHd1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOz521J3yjFKdqj1ccDxEWT7+6idlIuUFWZA9NmhEZE=;
 b=PSImS1mUsmMQYPM1uhgMjvnINs2zBnNevm4PW6edb+FcTMUyz3mxP0qe/CGLeQHiVP3dxFkQLCfzGq1JUXVwDFJFTvlMLbpG2gSdnKRKLUrp8CbX5pjcDKCSRdvhtrzwr0C4IG7LJwmU/0lb+chWsKSk9sD/DlFIS34T0ZTAOHilEh5uoYUMVADa6vyMfR6J9tWl+Cz1D4MbC5q4xZPHBXh9TCTRVaPUeFsT02xWoPsM51XmXolvdcHSuKLmae/6dDiAab8JXy7uXrkMG6y3k7fDPcYbhWUG46frrrDuFcLA9NHPRKTsVaVUOhr7lCfveiqq64gO2OQQ2lQleOAvlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:18:51 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:18:51 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com
Subject: [PATCH v2 05/11] mm/page_vma_mapped: Add flags to page_vma_mapped_walk::pfn to track device private pages
Date: Wed,  7 Jan 2026 20:18:17 +1100
Message-Id: <20260107091823.68974-6-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107091823.68974-1-jniethe@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: 89e9ff4c-9835-4fa6-c5d0-08de4dcdc552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZLv6dzTozkzclCd0tZqZd6o/dvgROKdbXTbmTvx1Xu3/Y5Out9ngwuiJDtkY?=
 =?us-ascii?Q?W3kglAhRhVXw49/Z664ZcNfWKqn1OXd3vYhUuUyq7439BwwWKanJsl+mk6di?=
 =?us-ascii?Q?vTiP+pE1y9DBGqg7lZ2iK9tZxa8MtrsJl/UTUMsIjaAbjXKh2gonCGCisb/c?=
 =?us-ascii?Q?agz8yXbE0TdW8HyHFIaf51XgwHaO/vg0L1j30AuEVNA3RboZw+jH3BRoT8nO?=
 =?us-ascii?Q?Hhno72wV0aikKGGgXWX546bsLO96skuDh5BeGF0HsnkAeG0DniqK4BvABlkd?=
 =?us-ascii?Q?JB45mVXwrGDAJc6njZRMHpFZ12c1D/HtuPOVFqf5OB2s3RmAxc39B90V58rY?=
 =?us-ascii?Q?wvPvwkSfrPZ+EZZW7OCQsXMWokPDGTyY5gctqdyTg/AYIZGMqeDs12KqNT3n?=
 =?us-ascii?Q?hqgc+OnTE3G45rD96PxspIY5AZA8064Sry1HwWNrAkHE0i7pIMILTN2RNZgV?=
 =?us-ascii?Q?i2/cgf9FMlpC+97KefLROnbfcjnTMJYbptkcJN8CZBoSFONkZBFMFNZHEVBl?=
 =?us-ascii?Q?k5ehfE73gVBKCdlQOutUecljku55H+tohQ2641qxA2YwBTtbmHYVw+OI7SX3?=
 =?us-ascii?Q?4o6YEMinPYpFVK3uXh0ugg4OAxhF0Zse7BU34Y5O80UggT+PlEgWTuuaZygQ?=
 =?us-ascii?Q?N5q6UMBn0ui/bvWgnbuIZs13fabLdxWML4uN84Y/xRxrVozgBS/V2cC6nX2S?=
 =?us-ascii?Q?nWhGsD0Fcf7umO7jRyWMuReKSD78uRoQvJc3v7jCgTSL7B2UhQVthRQierSG?=
 =?us-ascii?Q?CyaOwGy5bex0re9ftt5sPRfBl5eyr2HXN3nE8Y2Ys+9fTSVhlbVQAyNGb83S?=
 =?us-ascii?Q?XDT1j0oXt792ydzAc3EsAukDNZZTzI8giFUUgpTrwweIVuxXB+wdztHK5G9S?=
 =?us-ascii?Q?YifWNkgjZf6w8JZPR4DE+RDYowfCuU6A9i6x+oC4Oat9wr4buj0t51IK5xNu?=
 =?us-ascii?Q?4EMwa2np5PbWbXfPgztJdfaReof494jZkpWAV9iAPPrLkUSA8e6hXYVJjr9r?=
 =?us-ascii?Q?yOyl7u1/A+0jdXQ3+l+hVKaouJ4JaN0TkZD8DgXJOyz2aISo/AdxoiRphO9Q?=
 =?us-ascii?Q?n2NcFWyiu3zn12/9/VPWYqNuV6Eb5ZlgcFihtz1IKlLfADdSCqkrO9fSaH3d?=
 =?us-ascii?Q?0vNKvvUprZGRAl2Qos0ZFScC8Y/yej56OlSq60TOzI+01FYakCgbUV4hZQoC?=
 =?us-ascii?Q?9NCUlN8PEDXoDjVSiMsfIJ/+fL9LHT/cSIJvDAd4hUr2m/QtnoFa6kVwXco6?=
 =?us-ascii?Q?WQ2Puj6jpXaVOguIw1jx5eWaT5gB1sLNGll7yXXdYSl46YYjX3lvsNj860g3?=
 =?us-ascii?Q?s3jouLc34cPYBXMMnZr5zDoSm9aNnboXb+u1kIiEhRCnn1GzPPqZHoHvNP0j?=
 =?us-ascii?Q?KF0aQ4TxzeH9h5UhyvYsPyQTgxgr2RSfNHGspeZ3uajGIhSDxWvgBT6ZuHlD?=
 =?us-ascii?Q?XbyBhZQemk+aW+aaNwOulN/RG37E+VIa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SmMnw27oScToLdDUE3AHcz979GpSYIWIjEHlJGumEESYw3hA8psooNG/rPo2?=
 =?us-ascii?Q?cuUUFzvMrikpcjwZrPuMfOhksSRidnbH+Rou5BfO5L61Hi7AJ+RrQqEVcikW?=
 =?us-ascii?Q?GNywIYmOnKYARXiZgB7MOJERDeHojcYNzx5DHI2zhk7dDd6aVTDLrYTYY9NX?=
 =?us-ascii?Q?xJ+X7kFHylb92Q9fhOrx8YOccFw7WWm9vPgwF/fDxjpSw9pGC9GgUQDfPluu?=
 =?us-ascii?Q?q9E9Z9wTPXko264JpIuOwcaG83DgOa4hfmWaSld8A7zrPzRspXhKmonNzseH?=
 =?us-ascii?Q?S9SnaIKWdS47JaHM2SxkuNrAmm9ed0iKv7eIIKgiWek455sVjAINZRw5S2lr?=
 =?us-ascii?Q?rwj9sZQc5Y5izaQnk+Au3iNr8A5i5pH2d+iKKwl/RILf5a09H7J2tRANbVUg?=
 =?us-ascii?Q?Cg7pCPzE/+LVxhisL4grRwWo5sQHldNdqlmzmJQMWBRTuydwviKJ7S+pQJzp?=
 =?us-ascii?Q?jE5omHsYQ/hnTQKGloQZuH7Pkx14Acj7LrRBrufjiceSz5aovUTWF5fKdNrM?=
 =?us-ascii?Q?Dh83gb2vRQ5wE3fRcDAORFCJ4A+tp1MTp9F0SEmxAfcGLr4mI3Pf/Bsh9uWA?=
 =?us-ascii?Q?0j7P9ZKLbyUIR4ISFmnqt06hsPfTWtiMN7NH7Jr2lKk9ZypDsTgYW4uYy8+K?=
 =?us-ascii?Q?y0V3Iv46MyLOPYEKaLKziyldOeNRQkvxNkm20jztSlGpVd632kddIHlq8Ane?=
 =?us-ascii?Q?xIJ+PfRT8cD7h/WKcGyy/TjsHon3CGHS5bkD+Rhsj64o4PWXOI/usblLHsI0?=
 =?us-ascii?Q?c2bKHTzTa+sa9qBa8pNylApCuDbdzdyzHPkrwM0YDZNdjrWab9XOGC/ihCke?=
 =?us-ascii?Q?1/L8j0kg+djfO2XQW+ZYVly4Pioqef0prWm/+L9QY8wJd7LbHcaNam2RJGM5?=
 =?us-ascii?Q?CvAkw2LdWdKD1nx6KwqY4Oz0ez5BvZp/KmfSXuLhhPagcqMrR/8OwQvOEeiy?=
 =?us-ascii?Q?bU16eezYOiMzvZk/sbyVVGibXWFeYkbzMODbF+SW/TcOQ1E0IsZORt/IWUbP?=
 =?us-ascii?Q?kwYJht8sqnVGo34fLSyNy6YtG0e9Ammc0248WxtcaknRIwFQ6LweamXLWUx+?=
 =?us-ascii?Q?lIbkO3Dw3g9jJHnzqrXvTDdnXGBcpgkdt6j90ufxOgpYWetmKwU55AZkKcIn?=
 =?us-ascii?Q?dbJMPQpnUPh0G1SqbTbbCfHcnCmjhv6uRfwcGy0ZrIeZZbK1FHGHzR4bX5SY?=
 =?us-ascii?Q?LClPG4kGGYkTc2c/Kj/Nlf0ftyjlZJZ6xRUSRB0PBM+w3BxQzOREHyslvykS?=
 =?us-ascii?Q?92rUWVjPMl5Q0fmrNMYiVQqQ3UyZG2/k+jPj5KBXZ15UESnCPY36SpIwgIZv?=
 =?us-ascii?Q?hPLEWgmcgcFnCE46q0pEP7OAHOkfZE36v0Zclt0YQNEGXR8Pg8YIWcLXdxU0?=
 =?us-ascii?Q?K8LGhXrN0QtOP7SpYudW92+k0nErXK8C+OwP07kzt7LP9MYAyKHvPXY5H+Xe?=
 =?us-ascii?Q?PunxyqJOyYv7Bv2b8HPos8r7mEXoP12oUPf/m0InLMOOZtBNp7t2TA6PImyw?=
 =?us-ascii?Q?+R30La5Ewmpj65UJqXcBJIZ89gKUEn4TS/cTSXNptu8k9FbpHsMbLBSObmwL?=
 =?us-ascii?Q?AZBkTe8GVm9WZa+DHL04RMBbr48qhxB/hwtNBBmecZNxmhPlg3pJ02WRDT/X?=
 =?us-ascii?Q?WA5MF/AZH/CI2KD7pZ5iB0AJXAP2rBS84o/aDk6VU1NK5L/vwhu3ax5UMvDi?=
 =?us-ascii?Q?9X4J3EGXbpb8kAzyLVMkY6xGH9BSmHdP2+5T9qVaYvdc3oKQbO0XbPMalJ29?=
 =?us-ascii?Q?rm7R0U5tmg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e9ff4c-9835-4fa6-c5d0-08de4dcdc552
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:18:51.0888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fVjwFoYQhERN8+z/aQlIw/DLR4/996KvXsHtZ5IoDYw3b9PNaJnD/sQJ9sAykcI2lgaRiKyOchPw8S0+GTtXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal PFN and must be handled separately.

Prepare for this by modifying page_vma_mapped_walk::pfn to contain flags
as well as a PFN. Introduce a PVMW_PFN_DEVICE_PRIVATE flag to indicate
that a page_vma_mapped_walk::pfn contains a PFN for a device private
page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - Update for HMM huge page support
v2:
  - Move adding device_private param to check_pmd() until final patch
---
 include/linux/rmap.h | 30 +++++++++++++++++++++++++++++-
 mm/page_vma_mapped.c | 13 +++++++------
 mm/rmap.c            |  4 ++--
 mm/vmscan.c          |  2 +-
 4 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index daa92a58585d..57c63b6a8f65 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -939,9 +939,37 @@ struct page_vma_mapped_walk {
 	unsigned int flags;
 };
 
+/* pfn is a device private offset */
+#define PVMW_PFN_DEVICE_PRIVATE	(1UL << 0)
+#define PVMW_PFN_SHIFT		1
+
+static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
+{
+	return (pfn << PVMW_PFN_SHIFT);
+}
+
+static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
+{
+	if (folio_is_device_private(folio))
+		return page_vma_walk_pfn(folio_pfn(folio)) |
+		       PVMW_PFN_DEVICE_PRIVATE;
+
+	return page_vma_walk_pfn(folio_pfn(folio));
+}
+
+static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
+{
+	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
+}
+
+static inline struct folio *page_vma_walk_pfn_to_folio(unsigned long pvmw_pfn)
+{
+	return page_folio(page_vma_walk_pfn_to_page(pvmw_pfn));
+}
+
 #define DEFINE_FOLIO_VMA_WALK(name, _folio, _vma, _address, _flags)	\
 	struct page_vma_mapped_walk name = {				\
-		.pfn = folio_pfn(_folio),				\
+		.pfn = folio_page_vma_walk_pfn(_folio),			\
 		.nr_pages = folio_nr_pages(_folio),			\
 		.pgoff = folio_pgoff(_folio),				\
 		.vma = _vma,						\
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index b38a1d00c971..96c525785d78 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -129,9 +129,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 		pfn = softleaf_to_pfn(entry);
 	}
 
-	if ((pfn + pte_nr - 1) < pvmw->pfn)
+	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
 		return false;
-	if (pfn > (pvmw->pfn + pvmw->nr_pages - 1))
+	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
 		return false;
 	return true;
 }
@@ -139,9 +139,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
 /* Returns true if the two ranges overlap.  Careful to not overflow. */
 static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
 {
-	if ((pfn + HPAGE_PMD_NR - 1) < pvmw->pfn)
+	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
 		return false;
-	if (pfn > pvmw->pfn + pvmw->nr_pages - 1)
+	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
 		return false;
 	return true;
 }
@@ -254,7 +254,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 				entry = softleaf_from_pmd(pmde);
 
 				if (!softleaf_is_migration(entry) ||
-				    !check_pmd(softleaf_to_pfn(entry), pvmw))
+				    !check_pmd(softleaf_to_pfn(entry),
+					       pvmw))
 					return not_found(pvmw);
 				return true;
 			}
@@ -350,7 +351,7 @@ unsigned long page_mapped_in_vma(const struct page *page,
 {
 	const struct folio *folio = page_folio(page);
 	struct page_vma_mapped_walk pvmw = {
-		.pfn = page_to_pfn(page),
+		.pfn = folio_page_vma_walk_pfn(folio),
 		.nr_pages = 1,
 		.vma = vma,
 		.flags = PVMW_SYNC,
diff --git a/mm/rmap.c b/mm/rmap.c
index f955f02d570e..79a2478b4aa9 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1112,7 +1112,7 @@ static bool mapping_wrprotect_range_one(struct folio *folio,
 {
 	struct wrprotect_file_state *state = (struct wrprotect_file_state *)arg;
 	struct page_vma_mapped_walk pvmw = {
-		.pfn		= state->pfn,
+		.pfn		= page_vma_walk_pfn(state->pfn),
 		.nr_pages	= state->nr_pages,
 		.pgoff		= state->pgoff,
 		.vma		= vma,
@@ -1190,7 +1190,7 @@ int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgoff_t pgoff,
 		      struct vm_area_struct *vma)
 {
 	struct page_vma_mapped_walk pvmw = {
-		.pfn		= pfn,
+		.pfn		= page_vma_walk_pfn(pfn),
 		.nr_pages	= nr_pages,
 		.pgoff		= pgoff,
 		.vma		= vma,
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 670fe9fae5ba..be5682d345b5 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4203,7 +4203,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	pte_t *pte = pvmw->pte;
 	unsigned long addr = pvmw->address;
 	struct vm_area_struct *vma = pvmw->vma;
-	struct folio *folio = pfn_folio(pvmw->pfn);
+	struct folio *folio = page_vma_walk_pfn_to_folio(pvmw->pfn);
 	struct mem_cgroup *memcg = folio_memcg(folio);
 	struct pglist_data *pgdat = folio_pgdat(folio);
 	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
-- 
2.34.1


