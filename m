Return-Path: <linuxppc-dev+bounces-11986-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4708CB51648
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 13:59:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMK3Y24ZZz3cmg;
	Wed, 10 Sep 2025 21:59:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2412::62a" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757505545;
	cv=pass; b=azsp5xP+JIomwCYwIAgTg32gB5rMG+RKthTYicPSuD4eD2uQSuTezLL2oVtvAixMhQrPby/hRq+TttJO/DeMbOiqdAGM1CB1btsZ9bkPZ16scqw3OhTFrxIcW+cjf39Lr9hmtOABQYkMqz10Dhtq2+RX7binexbbU4EIM77vW1VnHYzGg6NP/tAitl5tIeEx5VJiSJQiqE4WBdbuQ6Ayc1GmS0pAoLU3LvEcoZi3IAoXc6/bU8gZlbtyBRh7uL4NBoQMSmmQWtjUx8JLwJ1brMcWYwgO/yZY5mW1LfvCqtFeFbJL/XtAXgGjXsIMHOryjuXLk0vMefcLwCQavycvyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757505545; c=relaxed/relaxed;
	bh=M2CRGJWbvgTRAKQCpQVq3CvW0DQ/ZyYML+xgjXHDleo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YcEOjlzNYCaSDMrGF2eJcwWWinR24IvjdY1AcIWQLg/x6yTILevcSiupRLThaVWg4cJ9g0Ju8vAltKgjkGAySW8uDo1twN/FyZXWCgKqGsZpLOzy+Sesr1El7c6kxfq2mvOce1iWmgmn1OS7NiE1y+fxFkmPR9Diq7ItPKRDhtR6QP15REW+upLWR1nc5TijYDbvfIV3RtCQf5FcrADA7bSl4/TQrEqg5BhEYC+99AySaUPGhshu+djssSFU+bUg94CtKLJh55UotNO45waC4w4XD5dzxaOJX3m3z/4lKWvfBPUk0BGVr99fdldgJuVUc9t6JEN/s9W8eEXRaKNdPA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DCGX5i1w; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2412::62a; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DCGX5i1w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::62a; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMK3W3xYwz3ckQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 21:59:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sn3V7oELjkrT+Ex+wYuTTfJd3WsUwYgnJmnkM+tItOpmbM+J8qovkAPHYt/A7PKdAxoWGlisZ5TesXjmIXvOHKWcNXtA1O3Hg9SA6mAhfrHEezRPKmMCSHIRBmSiBgsvZgxaw6V0hH4pbdO54/Yd5q5EIYBFKZuN7d/8WIw+zLxloBetM/UCcYtcIc6GW5rH0jBKwge7a0m4jPykaBH8Y8sKHehJQWlDdKdUNpkCp2evYTZ7lvgs+TsiTWScPuI24eLlp6TrdOL+hleedbJyK+OJ4SytpZZpW4FYO/j3zVP4FD60hiKyFc9ZB4/0Ery3tfckBgfq1QXuqElNvsjftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2CRGJWbvgTRAKQCpQVq3CvW0DQ/ZyYML+xgjXHDleo=;
 b=tB2vXc4aLG7Xvj/iBdZSvwn5l5BDP6C+4bz1pIRIWCRgMWFDDbhmT5qJwttomGtb8BHCznSs1U/3u4v6DHTHmWC/I6z+Xr6vluxXtIpc3nRzQiDjGvtecnGkPUr8uW7zs/hJWBGP80S7Nc1dUlCLFh9qUOu5jO987pSlHgXoT/P1w6NsT3FQBwOILLwl3So1eAjWPEjg3x9jiy8sN7xCZqAPkDZVJitbvd8ChCDhycviaJq9+sQzjix1CUYwDf9us224wMfxwnVp/LXMt9t30uAoOeFS7X2kQZFGh8Eg3ciqLaMSqi0Ur/Kgqry1mm4HqC3j/XfupYGVGiT8b2TLaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2CRGJWbvgTRAKQCpQVq3CvW0DQ/ZyYML+xgjXHDleo=;
 b=DCGX5i1wV1JzbNNAuAK46B1FTzUqbIWJJr1k/xRxSeDUhzU9om62gERPuNF9zaGeSw3Z47iVGhqjLYvnnpANarQksVzq5onyjKQEa/uqx4+QH9ptjWiYcpUBJuCKrMO21J8C5gZEzPW3uZshpwp8TsczXFauxzksXuc9pJwioRUTXudhdy6L2hUGfrzW6zFhm7ermfbnA+frN//qvdI/SL4Ye+KQ/MfEcYEEtrj13319OvercvtIa+jAK7pRYfUZPJwYgn+rUmDsHPM/wcOgja0mFu5Tjb6neURlaC8VFX+tVNuwHJvJyj+If2Ypv4p2rx/AJA7xTfLlNTPx9BllEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by CH3PR12MB8709.namprd12.prod.outlook.com (2603:10b6:610:17c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 11:58:41 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 11:58:40 +0000
Date: Wed, 10 Sep 2025 08:58:39 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>, iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>, kasan-dev@googlegroups.com,
	Keith Busch <kbusch@kernel.org>, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 03/16] dma-debug: refactor to use physical addresses
 for page mapping
Message-ID: <20250910115839.GT789684@nvidia.com>
References: <cover.1757423202.git.leonro@nvidia.com>
 <56d1a6769b68dfcbf8b26a75a7329aeb8e3c3b6a.1757423202.git.leonro@nvidia.com>
 <20250909193748.GG341237@unreal>
 <20250910052618.GH341237@unreal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910052618.GH341237@unreal>
X-ClientProxiedBy: YT4PR01CA0498.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::6) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|CH3PR12MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d1beeb-870b-4064-522c-08ddf0616235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FzIxhCTl/DFGFmaXIkSJW43QRlHeUwrObkzUBGOXZlpW5TknvixiA4gDQdO0?=
 =?us-ascii?Q?Y/Q2AqArhV3Ean+ESTnkZr/fvpBX2nkWxFKLLH4g5CA9C8G475Hr3gb3OOjv?=
 =?us-ascii?Q?6uJVbcwr9hyVssPYNNIHf4cHbHNfa1FcsJ0EkEfNXG98vrQPHF/sWCvG8QI/?=
 =?us-ascii?Q?COGsWCNfWUGpIWeBBcktY7eFttSjXnJa/fCDlR5M7SnWvVHjP09ct5kmeZoH?=
 =?us-ascii?Q?SAYNOPDNskcy46Em8ly9RRUNfqYG4XoPucVxFGwyPQt0cGYV/RAX2nuBRLnY?=
 =?us-ascii?Q?oDenFOddnolaVnUlfh0CImgVZFr/tUkfCle8aamRAftKGcs67gzyutBwvoDi?=
 =?us-ascii?Q?dNUaAWRksh0OpZeDtOzS+yUixVU6iF6zuAgdtdJ+/SJw1dzFDkGfm80wGCoH?=
 =?us-ascii?Q?pckzkDSveUd+iwi2lfDzjyPVQ9yj0CiH/xxWs9md9M1AQSc3NZiJU1hLjeKm?=
 =?us-ascii?Q?aAY8FuT7mkNTvmr+F8IaY1xbUkqwDE0/IWF1EmvaP2B2COuQ7wMj4RNUjEOc?=
 =?us-ascii?Q?O/AhbcPzLAMyP9dJTa4ojajfgOMtdCIXx/Rxry4yk0Rx2rZ2fjSA6M+C0jit?=
 =?us-ascii?Q?E4yYm3ZocgAEqqYDdafANBeHp39vXTx87t0jZIqiUkS+AeC6ISIHwD9hDxkj?=
 =?us-ascii?Q?3NKmejdUiaLbjH+sBCgqd206gGNFVcc0Zt98Oozys1GBZXwHRLMY812uQPYE?=
 =?us-ascii?Q?uyHrhpRnGAIYWFfAHefw01QVwryhLl4F/p2FxxZ5WJ2mJk8iLma6uzFa9nse?=
 =?us-ascii?Q?KDIQcCRrG9o4DskmRPMDf1PaNxx8TvwULUPJB0jwTMsE0RkZQnTZYU69eX3J?=
 =?us-ascii?Q?DTJiamg3E5I0LV9zQ7KUNLWj7+scC2fn2wUO2D+w6NK2kvcb0lvj02l6UkTc?=
 =?us-ascii?Q?X7jKgFI4/1/bAGQetuBuvx+ircaAenX1Iq6FMnRYQcgdor2MWhUDTqFKizIA?=
 =?us-ascii?Q?vJmD0Pht5I+lSm+VVTECa5eMOZE6H/UwUgnXBgFiR+SdXv8DEnEnO9a+9Ujl?=
 =?us-ascii?Q?fTzsLsC/NZI0DsiAFIBO+4w+7SMolqtyX9A00a9XgVJOp0yXxu2QqO44FHlF?=
 =?us-ascii?Q?F5kOApjBfLOwHK4UEafL48ADf1hzQpNZPMIk6R2fhwlKEIUMoSNqHn4cTPxl?=
 =?us-ascii?Q?znJlbuU5Ch+3Eejo3q7yZqrX3ozlPCo0nBxc8d/f9Cr9yddhddHSyXN4+eBq?=
 =?us-ascii?Q?1K8vM06RHw5aht/nrdIYWUbgLh/jYAL7eVKdCjw67lWNVVQn+anrn3l19WdD?=
 =?us-ascii?Q?BSnlzXwqrv/YfQoqXhsDx+EYQ9FcwydQzXtPK0D5bSt8yOGcjkm9NRk++zQ6?=
 =?us-ascii?Q?K5aUj8NJxT+OVBPsX2TS4htXjJaFpFkDZIIIo3/5K+GVBWGmqOwVOybPuki7?=
 =?us-ascii?Q?iI62pGuhOEA82Yro5WGvlkvleuez4YsUAy/C9hO+W3hCWvzy7fg3ZN0wgqkG?=
 =?us-ascii?Q?ptHYclhyF3Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9YO2VNtN7/AVkNY5N+N6bpbx5DVFYyJdxIshjK2kTpMeuaOdcSF5l7noHEF1?=
 =?us-ascii?Q?s+lB5UEncua+s5Drg3oPC44ZKgxdHC7EQ1mmSbi+XEq4qFKNNVBpiRWSIfc/?=
 =?us-ascii?Q?8ywQrj440x8YBHiXj4uZB0QE+J1KktuhiJc4bflyorZLYXXCNTQlvOTv371c?=
 =?us-ascii?Q?ASDGOoCEv3wTgUSySdjTbUQQGWvJC0NQpKSsq2qJNstew84LYBuDpBk3uV4o?=
 =?us-ascii?Q?vBenXfKllbuWTEDAUQSxwockvdu2HZ5HxpgplNGCWZ7znKBO2Us7KIHdhBAe?=
 =?us-ascii?Q?TCX53Fa2wFwLETR5Ho0D0sOXqpILTIZlgHisolBKChaVQ1AKIqqsvk1hmIgd?=
 =?us-ascii?Q?YE6/iB4CEGVROiDFPAO5TfADkkrbbKpGKD5A/XCbSSUrHrrkqIUnPM/LzYXQ?=
 =?us-ascii?Q?WGT0sXGTpAAVusd7OCVZF7nEWNxNPvf9OafKMixxZg+5lm9hMrGaDiXZ7U/0?=
 =?us-ascii?Q?bWiQu0xeLBXSVpmNEob1HkW8KfUJ1e3A8+quycFN8fJOn5cfpnSW3FEqOAjC?=
 =?us-ascii?Q?JgfkhIRa6APiEb2G4je21c6BWKbOX5cOHZDHFENP3jL5g+YoyyU1LJz0NoX8?=
 =?us-ascii?Q?mASc/SCKxHdg3dyOiFa2V+Xpjd+N2LutqqAwhQg4IORPN9sNWSwzKWeX8TPJ?=
 =?us-ascii?Q?OYNp+31ak76mDNFtIe0GgR/CPpX7wrNktItOo5t05HaCglof/SdPTIbMFvnQ?=
 =?us-ascii?Q?dIlVEWzu0f1mZZgQUsT1aBY9Hx24N4Kx5QcmLxuijEYIEebO87J8trQkpOC6?=
 =?us-ascii?Q?5HvTn80xxmbnBR4Z8s48Qux7dO4liJ+EP9gA8N10i8HYKFz6FU5y6aWdKBDu?=
 =?us-ascii?Q?F2nCo6aUF13uff4b9pX53OdttabCsWvQhcMi73AjQz70ijVhIZRi5rD81caI?=
 =?us-ascii?Q?qzAmnxy0fXs8ZFjYivEVLHNmcYoWZVTCFLm9h9ZlCYQajTaL3WZ2b4bBYqGY?=
 =?us-ascii?Q?mE3YlmZLwZtHu8pjWIHa8Vu9ugDe14ebg5WRs5a83zohvO7s4Sb4LfCpMic1?=
 =?us-ascii?Q?IpBv8kPo4agNFbf1H2TyXz5QyQaAkHqbPjJgR2bgQJ8ELYUjejyvmEhrmoEJ?=
 =?us-ascii?Q?cle6p7D1vIfzHtVjImdzimXsTUYCsAKTGPmt140QMNxPK7rxy96x1wl3+GfE?=
 =?us-ascii?Q?2QmAUir2xSQdsVPQXgP+rTTiGOpzo02zLXIOySsQlKBQPfcSP0MVBNdZmxpU?=
 =?us-ascii?Q?KY1LAWASYTztVwsHLEbLnBvuORa0/G0/n1GbQA1BBOj9PkqnwENbff4O7HYX?=
 =?us-ascii?Q?n/06d/f2gFt8Gr7mnZ6gme2FoyHeKWUKi0gX2Yeoawx+x9szqxzDkBmWGxM8?=
 =?us-ascii?Q?R24cd960+95kkj5RLQyuLq+qQSfIut3CnDpnavZuMCT8M7VanWjlKpxbVBmH?=
 =?us-ascii?Q?9ZdLMvbeCVO22byX6zJ/TqPCtJxTr4zQCRF5JSAHjnClMwsB+zPNa8RuDdCD?=
 =?us-ascii?Q?ozo2sXZqvbCbHoDATIse33PWDM4HV99uQGVFvcLv2sGGvcSNU4Qq3K73wuEo?=
 =?us-ascii?Q?rAyxsA9mNo4oh0K+wFkx6BNR032gCcNqav90jaUAoi5RrDp9pRWy4nuuK/ZR?=
 =?us-ascii?Q?TKRZ0lKjkgxNLtP0ngU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d1beeb-870b-4064-522c-08ddf0616235
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 11:58:40.8152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOBo5qiUePOEw1x7YNat0KXcE5eLDbKYD5g/dL+or0XOWmfL8YpjCGLIZSmZwreP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8709
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 10, 2025 at 08:26:18AM +0300, Leon Romanovsky wrote:
>  #define PageHighMem(__p) is_highmem_idx(page_zonenum(__p))
> -#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))
>  #define folio_test_highmem(__f)        is_highmem_idx(folio_zonenum(__f))
>  #else
>  PAGEFLAG_FALSE(HighMem, highmem)
>  #endif
> +#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))

Yeah, that's what I imagined, and I'd make it a static inline

static inline bool PhysHighMem(phys_addr_t phys)

These existing macros are old fashioned imho.

Jason

