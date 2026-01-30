Return-Path: <linuxppc-dev+bounces-16433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDFFNVeNfGkBNwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:52:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B82B9957
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 11:52:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2Xr907GDz3c40;
	Fri, 30 Jan 2026 21:51:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c007::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769770296;
	cv=pass; b=OFGhZ0xKzDA/bDsV3tlPle0u/cGieXIj3zc14kOWNkKM5ISyQISi4qq2kkdW6eObEpErnXe5ukGJAYtEtWoKqGJmaZhsRbWZsnX13QY0e9hOl9JroprUrtyb6biqq0Mv++vay8fgMOzONlMCiTdc8CKb7CdfJcAvrNzmMdNZl0z6bfwccLDxQuzn8ku5ekshoY28Y3BAF6AANfOK/h2OBcyA8tcLecIDII231+tCfda6l+3ia6xvepBl5QWgbt2PqwlfO5HRH+ixqC9QjEw3ln/7JfT7ID+ntg1dT43QviI9JKzHR4pQPMTN3RALoS8VB+jB0U4bhPZ+zP+Y8aRdCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769770296; c=relaxed/relaxed;
	bh=6KVUnngYFaJYOup9A96XJHa+cqRo0HNWCHKjm2hPPsY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AZo875OHnEcGzxmjQmULTba+0ovC9LB5sgPCC1K190L1f+2v4ZbRJt3syzIuvEd0Q734gL7g2GnqL11W8ct+gPriJL7+wK7nyG48Dzl2jeYwLjKVmetFWkG5QIYN46abVWF0AL/t3sPlfTOGsedZcWNDKK+bgkuLhh6zE0SE/P8tIUPVpj/6qrq8+7QbHds3T8Zp5YObiI+d3bia/DAczV2AFhklGQlp8IhmZgKZ6SsitE9vGzIbwSjtM7EXRNqTMTb7Ot+B7TAAqWTAAfj1ZJVWXsGqBF0/+YSZcenSwRIinT3xBqOpFuGqHMWw7wwR6aa+6lokSMqkG2CVz06iDA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YPEoSiRN; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YPEoSiRN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c007::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2Xr831Btz3bmM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 21:51:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDMOXkug1CBjBjq3qL4Z/v6DanJCO43bi3mFS/n7zTutrCrZsqSyefuAwfDGveSr08YUtjmhtqIpGogq6JW/P9CtF2Jp5duPGAOLL/o4uO+Yuw/ZIlxqvs14y/UnpZB1O7QxGg2GJj9RfS91xWBJcQwOWw7oum9+V1aBepR0vrwmaPEKU1jO4sNVKBL66Plq+XjWWRHr/UYUnDLDa+sgYOUlUclFxNOMEMx0c7taWLgpcbXZhjGi2Wads3jBNClt9wN5CMZTzjCupFR6qbdSuW16hbiA4hFV6QdGGdNQvCwFC/vRvDjJUFDnOM+Jrcez3H1KPVgsExkX6U8iZEpWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KVUnngYFaJYOup9A96XJHa+cqRo0HNWCHKjm2hPPsY=;
 b=pOzPemfjWxwEHZlMtycx7mBdY8ZpvA4Ub1dlEHCbqmAjXmmPHohqTgdDELSpEBgGqxZN2BZq7obCmk44VUfDF+S/JaRHK706kxNwXHB/1rQpRSKIabGWv2a/i0yh4dha6QGyDnVIMmWKufahI6IZ9vQ2FzgPWftt7jNycO9+pppBq1GZva1nPkNioWLSTuPHqqbLJjPUicpr1deydD7FxYEkDk+dqXsGMY36hdY/vb/HzNkjSY+4GeVsX/zI+0gd6e0bi45SSLc6sMJ1i3hHSj9wI173rqxnKP3vKzIXd6qJu+mW9kGy/QlwpCU8B52G0H8x6cCMx9odTLkl94Rzqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KVUnngYFaJYOup9A96XJHa+cqRo0HNWCHKjm2hPPsY=;
 b=YPEoSiRNvTH2zLL0ZuMNc7BnyujFph7VjU/tKAehy9Uc7CCkqsociYC3Rh7sZ7M4hneXr/DYfELZlurkcrl/dHeR2csTLxn4X0hJ/gqxWd8uu/2QS+q5mObUrpvE6X+U3DXwp5ZmjfiL4UxO1ll9fMWJ1p/VQ0ubzioh6cULrpk+zI1gyvQcNx04L3NuwsJzAl0/wK0mEpCJLOlc6lxPKU+NoMJgapHk74JJst/c0lqxTsNP/R73osxvuqBftB5RTNpMkKcflVqNtXRH6hE8g4hul2bwPnXyVHBBQJe/arOGn7p2uLhkT7ZCGxy5YFltC4yWCe9PtgPLCCHTwhTxcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 CYYPR12MB8730.namprd12.prod.outlook.com (2603:10b6:930:c1::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 10:51:20 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 10:51:20 +0000
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
	Felix.Kuehling@amd.com,
	jniethe@nvidia.com,
	jhubbard@nvidia.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au
Subject: [PATCH v4 05/13] mm/page_vma_mapped: Add flag to page_vma_mapped_walk::flags to track device private pages
Date: Fri, 30 Jan 2026 21:50:51 +1100
Message-Id: <20260130105059.51841-6-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130105059.51841-1-jniethe@nvidia.com>
References: <20260130105059.51841-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::11) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|CYYPR12MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e8cb54-b223-42d7-4bfe-08de5fed805a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xX9hMxUjbGRXdUHZKtKlDPiYS1WCq3de94TQ9uq4ADwjacN5/Ff+c+Vv0tfG?=
 =?us-ascii?Q?mhQ4egXee3ba6LhyhYv15r68JLpTghqQnFNPwHG4KTmZbzp6/K5bOXNJZDxs?=
 =?us-ascii?Q?XahiQz88by+urwNMb9pUZZqkO8Pgr+UXvU02LSPeagtDuVk07ztyrjLV3/Zz?=
 =?us-ascii?Q?xY3TGgZM0vZ1BcsLFuGh7vLdrVCegHMgqq+qCUN5b8QWh9X523z82DQZ8a1/?=
 =?us-ascii?Q?X2zNhLSEjDT5HrZCAsEc9w8Br7oC9VfHneHfXoRCzu6NyQVmC2DOzon3FIVU?=
 =?us-ascii?Q?MR7h42+WZaozdEUgcPthXuN1kMqAaaMEHM9nzX+S5RxU6IQdYsHsl4DtE/JC?=
 =?us-ascii?Q?SpX1ZJPPgd3Fovp5YzlmURh5iydCLla4ro8R969YcXQPr+SxjsH1IsSDAJ5S?=
 =?us-ascii?Q?MeC/D/QBNah/cKhasECHeoMl6IIPk0oYoroE9lSYv6cMTUVLKrvZQMDmCbmn?=
 =?us-ascii?Q?7gLM2zPv7mtYiO/yfs2B8NfzsY4wx8Qr90HpNb8M/fEwIvW0SO1L3l4uXY2c?=
 =?us-ascii?Q?kU9TE4RdLE+11vWdyaqoYQw1u6V5T/nL/cGoXPCG8ZVW0BFl+3B/gTsV2Z6s?=
 =?us-ascii?Q?rIlEQjHLgOuzJOMTvNt4i9Xz3Co2tWH7XRSS4KmdTpItwX89r8I6AJ7BTLIZ?=
 =?us-ascii?Q?5BxtMYRnPfrmiISW4Gmctg2Nve/nsVPPEzUd8zApYw/72mM/KEzLnm4ToJFt?=
 =?us-ascii?Q?Qb8/zevXEO4ep9LYkiL1+EsZNya7U0PNuWgxSVMbH7Ny9S5pmgUp+Dp8XSvR?=
 =?us-ascii?Q?x9+ToNZG35uiGB97i4xTz5xmesnae/630n8kswm59m/gXQhXqt+FXqKmz/v2?=
 =?us-ascii?Q?juDlqDt8V1Lhku7ZTeizBNI8eK0ntwEC2mcc8vrSbdKIzEOsYJgrZya8K5TM?=
 =?us-ascii?Q?8g5n7cZyqvpJc9ppQCW3IXaXvvRnj5zBhzPqHTLcVvHWbRZMMGt1kDvut/xx?=
 =?us-ascii?Q?iZuRc+2vcWpvIgpRCVvWvPRhlbQFEm7SAwFn6cXHylFxYkL50Wu2dtwlYIut?=
 =?us-ascii?Q?neRDhh2Xo04FtHmp7iRmL5i7o7qRePDjLyel3oDaakzl99G2JEI1FURmHvwI?=
 =?us-ascii?Q?wE7w0Bs8uaVIyB+0INaCJPzaM6Yjg7YKxtQvEhxe89QQNVs3920usNwA74HD?=
 =?us-ascii?Q?RHLEbzNenKZRmiMZ4OYO2Ik6IRhigCUsAW6l5t7HxMvGBKIR4K3EnoIl7ra8?=
 =?us-ascii?Q?NCQCoKpF5XFzDbUqsQjXGl23FcvgUnG3q5U0Vsgf8VYNmhp+ZcRF13oEjXNh?=
 =?us-ascii?Q?frcJ9kDTz0CFaOVxTrlk9aWYogAYvVl1VyljQiL1OIN3zkihkyetrKk/i+0l?=
 =?us-ascii?Q?cweXCEtL2zKsc6bbJhXcFpwTKR85l87h+tHESZ4H1A/4GIOaafr+iS0nCD0p?=
 =?us-ascii?Q?FGy7e2DLc4wwlgkwVZvBb9hc5l73CHfFimz189z7vria0+HnrZlPi1n1G4/p?=
 =?us-ascii?Q?lYsnq/XwxkRBJFQd07qLcrks22nwasU/Dl7IXLP980Xq8HU86WmxeDLVUP25?=
 =?us-ascii?Q?hgG7dQFivskalLl9ZHz9YdjjWZ3QtM1uDmKMrakChgvzpAiy8pmDpkHB3P0s?=
 =?us-ascii?Q?2Wt04FEAludRKBD2Hkc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4gyikMbvfMb32wMOKv2cVlRf/ZjaQMO2LIuSYyXhR8O2JY/6w5P45JGfQ7Iz?=
 =?us-ascii?Q?jaBhnIOgNzNXrWvZekINNqwhRkVU+REjKGjmyTQ0lrzNuQ1fRaoVaD8BGegO?=
 =?us-ascii?Q?61xf4ZBRd8oj/Zz7Tc3T28iVFdCQTKDumwb2+T4ML79qtIZJlPQoLPS4iRWU?=
 =?us-ascii?Q?8fmd10Q3yfU2sRyl+e0IwHa3bmvnHFconZBTF1jjb/+VoyDeCG1SU4IjhxAb?=
 =?us-ascii?Q?eI97EeOD+QMyfQqWxucepK+Wat34Kdu7N/gGn6aLBKg9d/hOoiC363M06aJ0?=
 =?us-ascii?Q?peC8KEw+PrMUumL1Cy5tfMi+uLHy4pZcgHXY2XBBasPnZZXOq4mfcMQ9UzQb?=
 =?us-ascii?Q?aiMPYFeALBV/5wBd53NoEZoWDv4bFn5gwioL029s27R0V15JTNAZ+WhO9H10?=
 =?us-ascii?Q?yvnZKoezxHsO3SFULofVVBNJpZ6aU6VM77Wu3DN1Xufz3pdqinO2AMRfwNRD?=
 =?us-ascii?Q?HOsrYZ3sbYI4U2x0jW7UZSBDGusKKY9c+0iur90xoVuFI0vdVMEgvPab3bhH?=
 =?us-ascii?Q?sDLo8ERa5KoUKfznboROht+BGv6X72f8h6OwmB/LovWCO6aVEH0EQdh8nNzi?=
 =?us-ascii?Q?xQNBUEANw8GpLqBr9CPky6j4CMbK2RbXqf/UlOKGLFRKBZ9Z2mum2QwU/HPa?=
 =?us-ascii?Q?q1ylYsg/3ARSkXLhvPPsKIqmtjsgMZXcdk31UB73oF95EKC22nhICvS0IEgm?=
 =?us-ascii?Q?xzHY0IDvYXzZgSr3UghlAivEK0OWFR/NaFNKpHqXwMISE0QuUaNLMfPdD2Xw?=
 =?us-ascii?Q?mF4jvdV1Sp0wD8no8W5ojFQS6/7jR79VLbgiT15N99ROyV7FRr3xY94VJsUq?=
 =?us-ascii?Q?aYS8tBrTaxB6vozH7L78QD9TZuF2fYKDNg1PJyjpOTDCzh5OVKl+TdGgHD8S?=
 =?us-ascii?Q?Y/PPlng7D6tZwfeMcliPMDP6pXEHaYh3zLndrJe1TgPYgy5GD015LLh6LGtx?=
 =?us-ascii?Q?SH3TGcnSiSY4xvG5tEx/cuCvp6moKJz26Uiia78JFyl6GVVloa4fO74RrNMP?=
 =?us-ascii?Q?+U84MfFDqToxQS7T46yhO2B3DdvEtvHElUi5lqIBEhE12EWbnzqAE4L0tU86?=
 =?us-ascii?Q?1uAVN+YbnYyyLhhmxi2CjM/JSMYYtUymmK0IZRthdhE7+MVOBHHczzEnBuls?=
 =?us-ascii?Q?Xw9Lb33iLvjKw8Nlwxu2IbTsOW9OKit46q9PtMbZOVSVrglQxwqzPXVnu0/d?=
 =?us-ascii?Q?SiH+p2sOiM4hEFIKCBeyC9dvjUJoSczERn+stxp8POEzDj3vDwuWuxsfOLTD?=
 =?us-ascii?Q?PDw48P/DpbcjhiB5hqSmV2bblIt0SB0AjL8/qEJrM0CZrOHGRX62aZjKJh1k?=
 =?us-ascii?Q?FzT4ZGN4x5j4rFoZVJF5mOvO3E+Fb/6B5TaEwpRHHxGJKi821ZXJ/qnTrlpo?=
 =?us-ascii?Q?JALj6dunltIMaaw5IfrwpVPvT8h8uW/SKosHMZf1gvBfkZgyrbopivtd/CIE?=
 =?us-ascii?Q?NYHv8Hbi2offKYftLWGu/5+sLLtvpQgU32Iql5D2ZETQNKQogyfDge9tghcE?=
 =?us-ascii?Q?SojrKT+bj1dZF+FE8+Qj+8myttFuO0GZ+sMZeKi19KabeI6iWSMtyo1yAMXT?=
 =?us-ascii?Q?EIbyuLPOkhhnwS0ZFNE8uDV7RAdHYTHtPXEB15Fu3DBK+iN0Jydl65yhVZ8w?=
 =?us-ascii?Q?lB54XR8cRgzOA7jxwYiiU0EJJXgYY1SGtGcke+gNk/mCMMXVaksCp/9Gkgkj?=
 =?us-ascii?Q?wnVVeWY4m1T7cGi94r/lSAobcd1qQc6ok6HWL7D3fWNTq6ELg/VMttaEYah9?=
 =?us-ascii?Q?EqYJ5Ll7vw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e8cb54-b223-42d7-4bfe-08de5fed805a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:51:19.9949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIqSQcDdH3vWS81NFv6EOkl0qk0EdAifNnjPy3IvekdlZBqhlUfCsyODGHAvcjL2Ci7e5ySv2FX/uy+x+zM4JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8730
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16433-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: E4B82B9957
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal PFN and must be handled separately.

Prepare for this by adding a PVMW_DEVICE_PRIVATE flag to
page_vma_mapped_walk::flags. This indicates that
page_vma_mapped_walk::pfn contains a device private offset rather than a
normal pfn.

Once the device private pages are removed from the physical address
space this flag will be used to ensure a device private offset is
returned.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - Update for HMM huge page support
v2:
  - Move adding device_private param to check_pmd() until final patch
v3:
  - Track device private offset in pvmw::flags instead of pvmw::pfn
v4:
  - No change
---
 include/linux/rmap.h | 24 ++++++++++++++++++++++--
 mm/page_vma_mapped.c |  4 ++--
 mm/rmap.c            |  4 ++--
 mm/vmscan.c          |  2 +-
 4 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index daa92a58585d..1b03297f13dc 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -921,6 +921,8 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 #define PVMW_SYNC		(1 << 0)
 /* Look for migration entries rather than present PTEs */
 #define PVMW_MIGRATION		(1 << 1)
+/* pvmw::pfn is a device private offset */
+#define PVMW_DEVICE_PRIVATE	(1 << 2)
 
 /* Result flags */
 
@@ -939,14 +941,32 @@ struct page_vma_mapped_walk {
 	unsigned int flags;
 };
 
+static inline unsigned long page_vma_walk_flags(const struct folio *folio,
+						unsigned long flags)
+{
+	if (folio_is_device_private(folio))
+		return flags | PVMW_DEVICE_PRIVATE;
+	return flags;
+}
+
+static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
+{
+	return folio_pfn(folio);
+}
+
+static inline struct folio *page_vma_walk_pfn_to_folio(struct page_vma_mapped_walk *pvmw)
+{
+	return pfn_folio(pvmw->pfn);
+}
+
 #define DEFINE_FOLIO_VMA_WALK(name, _folio, _vma, _address, _flags)	\
 	struct page_vma_mapped_walk name = {				\
-		.pfn = folio_pfn(_folio),				\
+		.pfn = folio_page_vma_walk_pfn(_folio),			\
 		.nr_pages = folio_nr_pages(_folio),			\
 		.pgoff = folio_pgoff(_folio),				\
 		.vma = _vma,						\
 		.address = _address,					\
-		.flags = _flags,					\
+		.flags = page_vma_walk_flags(_folio, _flags),		\
 	}
 
 static inline void page_vma_mapped_walk_done(struct page_vma_mapped_walk *pvmw)
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index b38a1d00c971..039a2d71e92f 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -350,10 +350,10 @@ unsigned long page_mapped_in_vma(const struct page *page,
 {
 	const struct folio *folio = page_folio(page);
 	struct page_vma_mapped_walk pvmw = {
-		.pfn = page_to_pfn(page),
+		.pfn = folio_page_vma_walk_pfn(folio),
 		.nr_pages = 1,
 		.vma = vma,
-		.flags = PVMW_SYNC,
+		.flags = page_vma_walk_flags(folio, PVMW_SYNC),
 	};
 
 	pvmw.address = vma_address(vma, page_pgoff(folio, page), 1);
diff --git a/mm/rmap.c b/mm/rmap.c
index 7b9879ef442d..7fa976b7fb5a 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1871,7 +1871,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 	 * if page table locking is skipped: use TTU_SYNC to wait for that.
 	 */
 	if (flags & TTU_SYNC)
-		pvmw.flags = PVMW_SYNC;
+		pvmw.flags = page_vma_walk_flags(folio, PVMW_SYNC);
 
 	/*
 	 * For THP, we have to assume the worse case ie pmd for invalidation.
@@ -2298,7 +2298,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 	 * if page table locking is skipped: use TTU_SYNC to wait for that.
 	 */
 	if (flags & TTU_SYNC)
-		pvmw.flags = PVMW_SYNC;
+		pvmw.flags = page_vma_walk_flags(folio, PVMW_SYNC);
 
 	/*
 	 * For THP, we have to assume the worse case ie pmd for invalidation.
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 614ccf39fe3f..101e1a16d75d 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4203,7 +4203,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	pte_t *pte = pvmw->pte;
 	unsigned long addr = pvmw->address;
 	struct vm_area_struct *vma = pvmw->vma;
-	struct folio *folio = pfn_folio(pvmw->pfn);
+	struct folio *folio = page_vma_walk_pfn_to_folio(pvmw);
 	struct mem_cgroup *memcg = folio_memcg(folio);
 	struct pglist_data *pgdat = folio_pgdat(folio);
 	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
-- 
2.34.1


