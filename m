Return-Path: <linuxppc-dev+bounces-15399-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C9FD00952
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 02:49:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmnsD635Bz2yG7;
	Thu, 08 Jan 2026 12:49:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.208.6 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767836992;
	cv=pass; b=cIJ6gthmUHFCLG3ryCgUiTnc5lvg+sW8hsW52EBjdxuYgPnoCaTKrknVEc9z2KAiNiemRBDnRkyboMwzzOlSO0Ee9BwXPyc7PvtzLxCpWv8+l6Y8h0mczsNIo6yE7C9CGNj2sncm7HLn3Ca0kyYdwomrSgr0h1cCGIpfK0LVA03h5V+Hun6+66qZzWpQ01H8ydCI7nRPzRYIAg2j3lmhAnNaq3S7+Ut7rhoXc4fXylxFxwzg8R9k8x21WMqiCRKg1lJGNgVCVsQgFuTrEhqEOohZPflkAyduaBOKs8SypA79b7Wl64f8hFFjMHRg2V/tZ38Jw75jKtw2IHfvpWRY/w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767836992; c=relaxed/relaxed;
	bh=HPVozz00IxOKU2eE6FU6sjFvaDVAUIRlQfK+5T5RfO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GvRKu8ZoHRbunWFXS2nrS9TLlWmN0EJtex3M9dm+RfO8GTxtE13NrBI72pUbfd7Qs4ULTtdryyTT+usFGkcd6TdZIBrr/IG9Fl+cMLKeJhhahhABE7BP9AQdNMoOU9v/MqgR3N7CLTqtsuc6tM240skJA05wVbJpdxxRyVNqwchfWSptbPUTBdXY4vlmBtT5UWcAeOM+FC44qmfhzOUIMZICi8qdVq9jsQSOH4+Xay8iOYqKQyiXbB4fWeaJHfENx1M+18eJeTcXDPIng9Rs936z/LCrSfQcjHCqK0UZ43v9S1MJ6YJ4QK/reVtzco7c9SSzgPm3MUCYRQq1q3w1LA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VTZKPfns; dkim-atps=neutral; spf=pass (client-ip=40.107.208.6; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VTZKPfns;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.208.6; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011006.outbound.protection.outlook.com [40.107.208.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmnsC60FVz2yFq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 12:49:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcPFTl1GKrOHIWn1N0sHxqEW03mnwL5PnHs+G0XKNgR3I0Je+9eopR2NCsPm1ruB7sPX7sBn1qP658+qOFxEWYAInpt6v4m9EIYKM7mqn64NHjIPlvRwySkEgWoKmq5cTvNGvY5lGDBOR29hlFyNtDX4da4YKlkYloKu7N6cypdM3VtNkdQYSjdUe7cfwVA/TsT0sTBSWIigRJjtINUeVrxDXMjpq+6XKQaKLTav8Nm1NvOpOJO8idbaJApsGRWw1my6qzGJ2d2BM94jKA+7Jdn6dSeUGlbtL/HoeHi+N4PZ7StWphN45UeVA7oWCxGzgR2p0Rb6sWEjYv6zZqd5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPVozz00IxOKU2eE6FU6sjFvaDVAUIRlQfK+5T5RfO0=;
 b=vuuHq12bAXpVEMi1+SscCwNreJ3fiS7jnbdO/ydkWPdv9DKf7OxnwXOKspuqoxddaZ6bad/hk4hGQpNLUy7l9J3rqN2D8Z8TlbmWN5H9UCe95s330JqrEX10M69RkdK+Zrc9WnXH+hV1luuqKMKzG8bFvWCs06u1gjIm5JvpkpoIaaPTMhGd+wBt94o7P3BhZH1p3m5c4tLsK9qWnVDeWbP4nnHj6XPh4+7qNYGmybpewTB70uB45fT8aKzAtg81psAHYcP2zuN7M7QHpm+ykcTzfSPqbk9sv49YhqnKaNgTcfvDatJYX5pkZqWAB255JfN1zBWC7/+K7OzULnxNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPVozz00IxOKU2eE6FU6sjFvaDVAUIRlQfK+5T5RfO0=;
 b=VTZKPfnshCJzZFy4AJ1eUW2msmqD9fjI5cSdmQT7GNxDYw+MLjNs1BIoGUrtdSJEHjX3VW5fdUv4ar9eRbXv1meGeYpU7yq9TB8GxgduHFY7DoFvFfmB1VzfwOGqBqmvRciI9Dft4d1k3umGtLF7Nig/yQJN/whapEIb0mehJyAcub6io/jtON9ewV/rFzkzWekbnvLhb/a+rOIbA/Cu8+EpiG+8ONJRld7kfUX7eMQk4Kkw5gU/Y0DK/m+WY05h9R8bbpjO5FOfiNm23WC0zXykytbCYEtSKrgnooxp12cvK4INHy69Tvzsk1sORW2kl2ykEiXOV+e3iLXmyM178g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA0PR12MB8351.namprd12.prod.outlook.com (2603:10b6:208:40e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Thu, 8 Jan 2026 01:49:10 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9499.001; Thu, 8 Jan 2026
 01:49:10 +0000
Date: Thu, 8 Jan 2026 12:49:05 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org, 
	balbirs@nvidia.com, matthew.brost@intel.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, 
	lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	rcampbell@nvidia.com, mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org, 
	linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca, 
	Felix.Kuehling@amd.com
Subject: Re: [PATCH v2 00/11] Remove device private pages from physical
 address space
Message-ID: <3qduomzahrrn2s35xxfjem5nud77qhshr4vmg4kwmizyn3twp4@rqoinq7e4yqr>
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107120608.5ccd2cc7e4227d2e80028bd9@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107120608.5ccd2cc7e4227d2e80028bd9@linux-foundation.org>
X-ClientProxiedBy: SY5P282CA0006.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:208::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA0PR12MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed86ddb-0ae8-4d0e-2fc6-08de4e581dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CbtNk5aVL3xCd/F9jWTKIb2NoC+sQQWdfcBrdJlVpImi02d3qx94dztLNhVt?=
 =?us-ascii?Q?71WdpIjNGhHtIkRcQIO57dx2UgqdBpS2KxFA+ISZUU5mHQ5RdlVbhVDQ3ECD?=
 =?us-ascii?Q?LIV2RWb8uJykRUUgsnWKMn1VIQZDmhb5N+Y+qdH+v1/GSM9l9SnBikFX+9TB?=
 =?us-ascii?Q?jFyUzD0VXsiNlphRuEGWv5M0YV6i/3J0ve7whsrmMRUFqjoj0MVOFo5Sh/D9?=
 =?us-ascii?Q?7bp8F3F5O2d+hFiawLCP4cCyIe4sfz1jpwmutA2VS+lXHMZ71os3bxxIgmNR?=
 =?us-ascii?Q?7PQV/RtzryAhBqEhQxNPm+ztWtDEMOEwp0G6mZqmLleP+F3sU1iNd0HkFM45?=
 =?us-ascii?Q?yNT770EBUypjs6NwlJo6YL3Pn7R3Ak6XidBSsd74j42WJEN5lDSfHlkrsjAP?=
 =?us-ascii?Q?22xf8aCL2TCzkWNXgtqKNULn02erjnSMddlwJ9p3cLg3WDoNNEI/76v6BYkf?=
 =?us-ascii?Q?oGFgrxYAFbVyHtPAq86WBc9PFHLFMzNIP0VewKq1ZJPe9lT/lck8hHfcNJrB?=
 =?us-ascii?Q?eF4/RWaFW75TamM2zFatoKpn8W5Va17OjLeEZN3Samm1f+Ri2AWKXxrCAn2f?=
 =?us-ascii?Q?nC9oG3YdgjF6bw7Hc16C3F4LagcEPV9hWmFbZmOS62vVqLr2yLPTInJUagaf?=
 =?us-ascii?Q?Bb26+O6+wL7zjoNx6i3oa4wYy1Jy4+nOxF/p+Ro8bEHUS6JTWetQutOndsSw?=
 =?us-ascii?Q?cYiN9sl18ySSnFAZI/4BPDIOfyauH8OZW7jzv+phCNxWiFg+dNsVk2bi07KY?=
 =?us-ascii?Q?mIgB4U0mM9HAu9nyKLlieY5Pb+zQKuC287MKuEGRQ1UD1yqhI+WIng7seRXG?=
 =?us-ascii?Q?o4hj+qYQtV/TNRK/nYIDxZGGuYtTcC9zQB1b+i4JAhsG6yulIAQWZdHjVmyO?=
 =?us-ascii?Q?7nuDt1svSpSIxqQOZMGJuF97Qvh7CO5gxQEwOTCR9Uj7MAjpft4Idjk0D3la?=
 =?us-ascii?Q?LpczwntXgPK0JIFJcIAFIFofyklFPQD8+8+INWT+sRCe/jJXlbwcl0581oqk?=
 =?us-ascii?Q?j/1JmAKUuFRA7g0o8ECAc2LSbhr+D943rU2cEUwk+ZRatAhwXebHtN8ZNkc9?=
 =?us-ascii?Q?I4UIegbGyrnJ7gWI2dVCBSSq9ztCwtYvmFu8V5ohboNIUgv+pjTuP2o82Fiq?=
 =?us-ascii?Q?JCINo7y+2BLu+4yTZdEcqvdMy55vKaHZ2EnZYq7ZnGiYR7H5ksrNXoJv+Iez?=
 =?us-ascii?Q?irYcuyDSn8JFoVPWSgNBSHhLkagvbzRxzvuYxrYymR3lmm9hcQz5l18dpxoO?=
 =?us-ascii?Q?1IHVx+b4fc/YN9PTsa/aG6Ae8mYNTNMj8gxeaCUoG74ssh9gXNGB+Hf1+UE/?=
 =?us-ascii?Q?CZGXImEFTQePYqpOhnvDRSxIFFfsD/xbdTBxeZ90PrpOYoSG8qujgaUlDpDg?=
 =?us-ascii?Q?TxmP4WRSl/7AW6bzEgD+Mlqg1QsqKGbZyy0++uF+bYOGBhxq6maRclpc9+T8?=
 =?us-ascii?Q?9pb6Wcorq45zI05OYUSf+15lcTYoxsZxsrxCv4GSsNNYtDdVgeaD9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YjxkcZuxv0ejOLrSJ1+Rzvi42CXm3d6fUMG6+hl1yg2ZJZCDWdi7t8FMhwTV?=
 =?us-ascii?Q?rePEHkE484LzgZ8BK8xFgazlkojhXU7th4swvbIS6Jo2BOEeGM1xIblJG2fh?=
 =?us-ascii?Q?hFfkPFGt+nsNUBk4Rw1TwtXjk8HAhZsU7EF6gA00mQPenauNQCB+bOGJSWJp?=
 =?us-ascii?Q?Y0PADk4hbYFnaPwKabSuxVxVczxuhm/4HpJoXzzdcMfi5zX/KECkYWJ55EGY?=
 =?us-ascii?Q?H8V+Wgzr/IPT9J7mr29ftOGBu0sMm5XlQpItJkXDYgwgWsvoQJCff162cst6?=
 =?us-ascii?Q?jsttLfvDXcsjiaF4f5C8y9k3lAYVNzy1aFm0p/qPfx3pQJ4p/1nGHHGIGpBu?=
 =?us-ascii?Q?i3Aa2AytlBkAl86k3bE7w0dj2rFr8XkC3wlMMw2vVnkD9qgpuHe3TE5kHZ1o?=
 =?us-ascii?Q?7ZCJUpltfI3+bpxVGu2CbkYtjzKO03K6oBdzK7MeykvJQsoVG86FX+QBsW7/?=
 =?us-ascii?Q?pJaG8we2BT8GqR9dGbtXk74JwkB9by7Pxb6tHn46WstrrsqlyPtEmqkRo/Bf?=
 =?us-ascii?Q?4FdR9ZQj+M00niOxg/7pjawTqeDjEXL8mV+WSYAXRi/TZPHRNRhZb6AzB8Q3?=
 =?us-ascii?Q?BMxMGwHrCH02L38MZ2KgOqATSZzNCj+Udbu0d7pYqyQbDynAtdg+2ppupUCj?=
 =?us-ascii?Q?EeyhCb0cQtULO6WCGn4+Ofo9EXhlpU3wBF3SFlAiXofEUc4Y9t2h8+AXkllj?=
 =?us-ascii?Q?ZO6hI1y+rGttoGTYv3wdT7OUqVW+2ZTLwgAY3CJDGMsb0uWcs/LpTQsNPLgA?=
 =?us-ascii?Q?Kb5dWL04x91lalsMG0MDxAboDxp23il9sX0syMDcaaWS/Xu3ckXrsvXFyZgE?=
 =?us-ascii?Q?7tOJb1VN5I6DxjHLOfPujqTPZW4MfJjyCL+JIoR53LbeRsj2nva90Oo14QWU?=
 =?us-ascii?Q?D4p7Ip5ydcMDHkZVJHIZv5cIAOthR7lSZZIbGGi3Z1yT6oUuP2YHDv0XWgDf?=
 =?us-ascii?Q?Cgg/HrZl8J4unuHLSMS54nyKmHbkyI4OdtI9uw4NdA/HDlcWk98YcqFlrYYV?=
 =?us-ascii?Q?6OsoLOEfgPXn5+OdvrqoTGd2DRk4/+OBVjKIi5Ept6pkCKJ1uBDBYiboT71E?=
 =?us-ascii?Q?s10u+YnBhR/XSVDTAYssNgtt0GoxWfQIuiZtOCN+3oKIJG3WY79Ixxl6/di2?=
 =?us-ascii?Q?rPmL7gKxF2Dux6mL8+g5bSGa3IfNtVByCWbZ/k6+qDVI31/UKYWLGuNCMgdi?=
 =?us-ascii?Q?9ap9sVCMZodUXNZLSCZpJwXpX4a326R+ic3mnYTuC6YoFmbqUQqHyENxMR0J?=
 =?us-ascii?Q?sK54nRfsFqeyWNiZjhw9ynSPkdC0HmuDv0pUuoiyrNU1zATvFHHiciTtWQCc?=
 =?us-ascii?Q?qh5BtLHPithFBu4r53qtx7X2jVUGLMnimgRUvtKY73WS2hJkRqSy0xgbKkw0?=
 =?us-ascii?Q?iaJuOtT3di9G1aiIgAMkbdB3Xj1+DTb/zsXC5vfeEaLOopSXebW75jew3I4+?=
 =?us-ascii?Q?GNj1/agSJH0MGC436SGj6KQcH9WkFJQXx/JDmOl3LUhMVYxxVT6pXJjcW0ZF?=
 =?us-ascii?Q?vBgNrnzEVXMdIYokELSKGBqKNngVLYvjcpq86UgkOJURLpGX5ABcjFb39Yqs?=
 =?us-ascii?Q?6eYAFODzUiQ/ZYi6icMREZTlZlt5ynxMZspiiGQbyGey1WPAI5/9LXG/DIzt?=
 =?us-ascii?Q?rzmOrQ8NWPTRDB+FUk59oGDR10Nb3Cf2Z4ekDba5kgZgWx9T3pK80fBfvcwo?=
 =?us-ascii?Q?MMFNG1iJYwHRyx6US6iDFBj3j8u7ndR5Q+Z7xKhrsb92llPYA9GLnXDT1n6W?=
 =?us-ascii?Q?J+jE1rcZDw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed86ddb-0ae8-4d0e-2fc6-08de4e581dd5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 01:49:09.9414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Sj520SoTunQR+uSQkP/sqVROo6UKnO4gRLeZ1v2TrGBEvrP4Ve8KPufzB9uZb0MHL11uZPOtqRWg5M3c6PDkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8351
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2026-01-08 at 07:06 +1100, Andrew Morton <akpm@linux-foundation.org> wrote...
> On Wed,  7 Jan 2026 20:18:12 +1100 Jordan Niethe <jniethe@nvidia.com> wrote:
> 
> > Today, when creating these device private struct pages, the first step
> > is to use request_free_mem_region() to get a range of physical address
> > space large enough to represent the devices memory. This allocated
> > physical address range is then remapped as device private memory using
> > memremap_pages.
> 
> Welcome to Linux MM.  That's a heck of an opening salvo ;)
> 
> > Needing allocation of physical address space has some problems:
> > 
> >   1) There may be insufficient physical address space to represent the
> >      device memory. KASLR reducing the physical address space and VM
> >      configurations with limited physical address space increase the
> >      likelihood of hitting this especially as device memory increases. This
> >      has been observed to prevent device private from being initialized.  
> > 
> >   2) Attempting to add the device private pages to the linear map at
> >      addresses beyond the actual physical memory causes issues on
> >      architectures like aarch64  - meaning the feature does not work there [0].
> 
> Can you better help us understand the seriousness of these problems? 
> How much are our users really hurting from this?

Hopefully the rest of the thread helps address this.

> > Seeking opinions on using the mpfns like this or if a new type would be
> > preferred.
> 
> Whose opinions?  IOW, can you suggest who you'd like to see review this
> work?

I was going to see if I could find Lorenzo on IRC as I think it would be good to
get his opinion on the softleaf changes. And probably Felix's (and my) opinion
for the mpfn changes (I don't think Intel currently uses DEVICE_COHERENT which
this bit has the biggest impact on).

> > 
> > * NOTE: I will need help in testing the driver changes *
> > 
> 
> Again, please name names ;)  I'm not afraid to prod.

As noted in the other thread Intel Xe and AMD GPU are the biggest. Matthew has
already offered to help test Intel (thanks!) and Felix saw the v1 posting so
hoping he can help with testing there.

> I'm reluctant to add this to mm.git's development/testing branches at
> this time.  Your advice on when you think we're ready for that step
> would be valuable, thanks.

Will leave the readiness call to Jordan, but we were hoping to get
this in for the v6.20 merge window if at all possible. I realise
we're probably running late given we generally like to let stuff
settle in development/testing branches for a while prior to the
merge window, but it did have an early round of review last year
(https://lore.kernel.org/linux-mm/20251128044146.80050-1-jniethe@nvidia.com/)
and I reviewed it internally and it looked very reasonable.

I will take a look at this latest version later today.

 - Alistair

