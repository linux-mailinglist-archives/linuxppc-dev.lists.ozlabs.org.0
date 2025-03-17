Return-Path: <linuxppc-dev+bounces-7112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D66A647D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 10:43:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGVQf0z6xz2ygd;
	Mon, 17 Mar 2025 20:43:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260d::612" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742204602;
	cv=pass; b=gVWC5kVX15E0YFqtgPbACcBC6kDGwVOh0HLbXR9oPHnlPXkK8w/i8axmfk34ZuPV/NT5H9cpWsJyO75eh9J5snHnb5uk6XlKk4Vsfis9njTeUzORWX5v0dqXiCReXLCEofV/1enHnh1/ZSy8GXMqJAMq7TCq5ck4yWk6TnLzCRb8xWde7eez0UT8Nws1bRotlfRqUUlWKL8Q5BJthoyAnccwyRlZvosm3Aq+c8suB6GDQN2y+CXNhhq3zignrZEAMEqRcPxv6WqSgjmjFKZ6WwiRjRplxqn8t6YAWdhgZkN2ubrVnUL2HW96AUCdE9py2ZjRB1vmpFTZK2hupemwTg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742204602; c=relaxed/relaxed;
	bh=n6Chb4BEKFiohxMu56XswWBYmWZryunrkL08HUjfJmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ditKMtKgXMF+7YUqWRjJywVGkFbNUO5LrMaWdPSMBxa+3mLKKNFge6WVeoaYfhTH6AW0560Jo/Qjq06+Zq3xbfHEiPR2Aom7rI1RnqT15gK1624Mx+xdbt4KmMf+edQKzisf4pxU/OL36MOk1RNB+ut8hwVM+fHHDSSMt52QIXyNbd580TaYg9zxz7dF7+3ShStQaO5lkS9tp+vqyojhaaQ5wIfI12aSGosnLjuMm1QykKvqQjxZakaO4P2SJuxbeKcbKXeF7kUjM6RyBzF8luFA8iU4YK+sYGHRQjlN88eQVt43sLXYXgVQFx3XdlcH2bnoS8Eom1z+X08tpWDRUQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=P0yLGz4m; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260d::612; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=P0yLGz4m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260d::612; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20612.outbound.protection.outlook.com [IPv6:2a01:111:f403:260d::612])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGVQd1G5bz2ygK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 20:43:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cY/dXggouxNVwOT1bu2TI/cwuJfAyRW4FQ3drmLfp/272oJqtH/oa6uy3SmrKtigPRPiP7TJZZ1zq2lidAmaEJeI/5PjJM9kpEfKEYK3gJqEsAu1AUDmPLsK7wYH95OMhS7AwlbLAJh9IcmhK/ANX/KuIh8veuFsSbJsHG1Tt/Eaz+K3s015I7K/tT+oF0kx1wNnIgB8wOxCjYR8JyOHEdULx/CYIa6kEgNXsUrh/hmbTD5f5b5TM6BhHUgxOrXwMArFu+ZBrgbOJc0Sdghi3I6IZFFZtePRqnvSoBaeY5/hVkByq7Rz2notAi7a1wG2cdcfGaiEmmigTJL3PeYMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6Chb4BEKFiohxMu56XswWBYmWZryunrkL08HUjfJmE=;
 b=jvsVKFG//LPZJWBY4+Kr+vrg4aULoj4r4VLry3K2iXyd2aPd7+JfQrfSCr4m1TpARfwn7FM6p2r0F8Gp7wIfQ2SEvB4HOyag4wUoavFgHd6BD+vh/s4BQK+/68Ox955n53R85jmio5Dep2hMVuGM5HJrm+mOARhqadaAuwvamMck3a7w6YecTgKHQvk4eYmDzDWrPzfLnVjjESFtibE1oH5EBv5jSGThzouyoKwVu3/N8uL2+UbDTKSK0MsGSAxVi2Qv8ng5vCsOI4jZuZtN63QppKQTqRhWGoq1oGnNKdoxA5gzAfcp9qCCo3tdK45k8sQk/qXN/XurNOtxum+P3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6Chb4BEKFiohxMu56XswWBYmWZryunrkL08HUjfJmE=;
 b=P0yLGz4m4IEs3lyowi3Bs5+GhE4yJxu0Wg+Igj8CXGooa9T8ni9LnmDGex13kW1zLpjxvt995qgGUr1llR24A62dOMHv0jMRpnLpFd+0uR5E7iBznbcWCVB5T3POHup1UYPx9AQFgIPLrZVNHILz4E3w3WmT6s/l/VOz+BcHE74usNiLo2ro+H7C+jkm+j8S0DkizJ4ob9G2beRAb+tGQwvdPt3O2c0YV6/luTlu3LuMXQIUuI02PA6xKXRWyI+eSK+YWfNFMOObEhDORvL1rw6O+0iR0EJV+rWbjsIrSM4+JZQR2QoIdfF6rMrsOJkWqkELQq/Ejbn7/tIcVTKDKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DBBPR04MB8060.eurprd04.prod.outlook.com (2603:10a6:10:1e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 09:43:03 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 09:43:03 +0000
Date: Mon, 17 Mar 2025 11:42:59 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 net-next 03/14] net: enetc: move generic MAC filterng
 interfaces to enetc-core
Message-ID: <20250317094259.b6mwygvr75lxgkwh@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-4-wei.fang@nxp.com>
 <20250311053830.1516523-4-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311053830.1516523-4-wei.fang@nxp.com>
 <20250311053830.1516523-4-wei.fang@nxp.com>
X-ClientProxiedBy: VI1P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::36) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DBBPR04MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: 32938dbd-f18f-4324-162f-08dd65381c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AYNL2RIeYmeiaE8LNOPOJ1FVBpIktGKEIe1iVDGT5cfJ8W97etArmrXcrjuQ?=
 =?us-ascii?Q?RauNnxwo8kZMKKXBPDqGFntRxRvNIum+bl8CqpOfzEbZm/uhHjfS2KkHwNJg?=
 =?us-ascii?Q?/FsqS3KddkElD2tCvOv+ky2j4n4K9YeSgloi52jgSkhq1ERv/jxoIF3GWS7Y?=
 =?us-ascii?Q?LM68notIef92MiEKpnoKWUK9LkRlFocH3DblLU7G0wKsJMX42n91nVNFvXU1?=
 =?us-ascii?Q?Nkt20ekxDXDIzLJogwjmuALEtiUcAgSSGdjZYx2UrXvvx+Rn0VD9ATPNsjSX?=
 =?us-ascii?Q?3xl8fYtCNQ/mtkEEv/8dWCseSXkPYIZqRCaEFL9hqP7+7rkiUxs4yhjfebhm?=
 =?us-ascii?Q?5njOarpAoVCcnGbfDQM8z5pUAhx6h1jsJcnas1r7EJfzabCEMt2A8kBICiOb?=
 =?us-ascii?Q?Cze7VaAsp9xxEhQyXJSjsz4gcySNz5ucWmyyeJ1BFfSX022Ecm0xxb7pbzqg?=
 =?us-ascii?Q?eaL1Z7gRmsIbyh+XbozMYoOMsGAl4ZgJoaTvkkhwYAs6YxSwSwcgirlkQrEu?=
 =?us-ascii?Q?KSOa1I0SU/nS4X4Dz0lBizwsmavnAgfBlrUx/Q8oM4mn4xgrIV6Fbd/YTO+z?=
 =?us-ascii?Q?ejW/8I5QKHnS/HTwjTM4n5JqTF6ppGXq6u055pOsZGT64AM5pDmsqfibmhCN?=
 =?us-ascii?Q?7B4R1Ts8XQO9brRR+zovkljL35XzC/mEqDIvibcuPwmkOpP+twroC3dZIBga?=
 =?us-ascii?Q?eqivV/yyjXZ+Ehvdy7dORSoHQn6G3Yv26t1bLvyJxoLRG58pFuEic9Q6c0O0?=
 =?us-ascii?Q?9uXT3xre6WlnYT3zWbClLX8J5bFqe0iGtSNXQ++HKxRyGg3bZ6KB57htduDU?=
 =?us-ascii?Q?QJIuOs3dd7ChZVzQp3z75yP4+jAkYMDvHpzNEcDQp1Bf44MYKHYag0h6jomr?=
 =?us-ascii?Q?wvXUKrdjAx5y8WbIThxpEHXWi+a8CVu6IocXAOVw+glQx+l562mIz0wRKiSz?=
 =?us-ascii?Q?TNu1YXKgtfTwFeuyR5LA4ReaLbytmZH59Mpa//2HlsEjbaqcc7LiQD6D5qIX?=
 =?us-ascii?Q?bfJdkLLg9/fzLeoJJC23fn7NTsgKR0yqaDspnhNiBbKU+QzAzjSahUnV2a6k?=
 =?us-ascii?Q?87EdxpeOQDg/gBCKXv/4g5EEiPq6s4Rq4rzp8ptSGe1gqUhLe49aVvzbek7b?=
 =?us-ascii?Q?/i40Mo9GxS2DKusuJsNAOys61/iNTU+vf9w7io8hUWcAMbM4YcuVdDsrOHOZ?=
 =?us-ascii?Q?zBOPuxuO3nuvKTsRns3/XJeo73VH2niuCh+8JgBOvr/CUTZe4Ecq5eU4jvTw?=
 =?us-ascii?Q?mzdJ99QoSlNfTJmpW4jbsPLfCS1QqGQI5Xft8Hokc4F1Bda4Uupxz0GhlgBn?=
 =?us-ascii?Q?O0lgMFbWXSrNPseH8ZWk9Xp1YHglhWgj5hnE2cb5rNe7ScEu1H7IspPUqPP8?=
 =?us-ascii?Q?4TzP4znOfbMLmPnq+z6WHO0dcxUR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e69cWLOo7VN1suVvA9bYL2YF0rCDtDAVIiYISnrXQ9unmwle5u3FItP7i0sh?=
 =?us-ascii?Q?AjZO+zSyOQ/f85DD6FmeDj0TQppvt3HsWwrPR6QAdKadZz1ivlOt5Ej1AVOA?=
 =?us-ascii?Q?1rEDa4dZyPcrlKb9P5Vk6JBjEdpU70z6eRvJOwIoMePuVIy+ZOt8f5FLsS+v?=
 =?us-ascii?Q?XnZTAPgA8j8qnyLasiKfwGPn8RNzjGXk3YaFYtcl7xh5NTi/y4oNty7bnXGK?=
 =?us-ascii?Q?WXy2XK1fFPE5rSlXPb3ShfhC164SUT/F/KfqsBsoczCD+SQMJZ0pszgT/7+g?=
 =?us-ascii?Q?zim79PmlS2TeQj03zs/k5lsKHzkQt/CKntiXa1qR5iUR6phsgI/bfXaNf44+?=
 =?us-ascii?Q?HxWQRJ091DsAnfwOPOXkS/0Bp3YGsVgHBUG9ChLD3z8MJAJ+TFRKOoya6OIh?=
 =?us-ascii?Q?VCeu3UFaMIEiQv5/k2u1nLNp3rN/Q/2SOu1dk2NG4APadP46FjBA+gkc3/jz?=
 =?us-ascii?Q?oZq1Ns6KJvCbVg6/D3jeu1XvYgWNpYEfaCMZu6thstMXLE+bVRJu6B2dXlUW?=
 =?us-ascii?Q?1yji5Rkxv5JmvvmNy22tfLC4l/FI+JayYAsKA/iBA9rD7SJ3pDQVTeC+yx+r?=
 =?us-ascii?Q?dZoJ8aeLPADSPxjonY1W/b/3U45e78wLp4ExIpnrcuyq9MGsgeztTkQk5W1L?=
 =?us-ascii?Q?nPWmmmgpxH5VF2v2CUidgz7W69vhyb2BQyyJniUyg3my7YSJarUfVH8Ww1Lu?=
 =?us-ascii?Q?X3Uf4wsbfdXRHAjycIHzfTZluxt54SD6oksyCJ1huMhFj4QGU1aWqW29hODs?=
 =?us-ascii?Q?msu04/HIaznbT79e8KQszBi61lDmKnoWlefHiIK1glnyqz8bhORwsJoRk4Bm?=
 =?us-ascii?Q?zqkxwLB8ZW4/eDxiBUbso5SRLM+ocXFzr4QehmQ4BKxVAOZlsqGBdCpaSDa8?=
 =?us-ascii?Q?HgUb+Yknh7S5Wz6lq/N8LQrlgGWUV3y+ppcWVT81sogOIAJF9Lm9Ualmw/ac?=
 =?us-ascii?Q?6mkOWtxnidkC4A1zO2gmsgoam3Mwx+8JRJjizJ0uze63rksdvsaJTAXpaUJY?=
 =?us-ascii?Q?51yOv3oPbmVcI/b+mbPBexh0YXFFzMkxj0EbOrGG+4gZoy0E0iVors5pr677?=
 =?us-ascii?Q?OybQQaVsfjtv1vFOef6V2nCn/DNcaXG7lZIFCRmNqXyFEgOZHgL6jPPbTuFT?=
 =?us-ascii?Q?7W7qqIrUuH3Pq3w+JsbWrVEEYZB5rVwVlCYDjBBo07HfPOGp8GKy6dI5WyWZ?=
 =?us-ascii?Q?Z+Uj5pZCmXs1n/H/Qy5H6FjYv2SpqbzhjPUj9L3qBlcGKzMxOLiyH/8vrp7B?=
 =?us-ascii?Q?U++ykKVZ1/Er80wapFJDkj+jV36Fi5MsV/EzddNIR8rvLOahx/4blMm1Jc5E?=
 =?us-ascii?Q?Oul5V2ENoRpE1k8wqYySeSMMAzLxxS4NTYZEg8De5c1M0HjH025S5SF5Gmvg?=
 =?us-ascii?Q?Ok2ip/4on2po1qAfouJcYNOo96YeII6+xjIU+2bxy6fhCv+PsITix5bJigTY?=
 =?us-ascii?Q?3JmgmkNqAnk2yToUdjv7INS7Sie+7vCQMwL4A2Icqfafm+jFP/8i7bQfAVTT?=
 =?us-ascii?Q?XbnQZOE2KcBpHzRh3VhNusoedsiefiVlfb3yqsUQUYyCFgiSWsyD4Udxnm0K?=
 =?us-ascii?Q?fMOc+7Q851wdj99Ybl7VITrGp/oGQSTylvJ8QifS7/Bji299XL9v83i9vPQy?=
 =?us-ascii?Q?6w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32938dbd-f18f-4324-162f-08dd65381c8a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 09:43:03.0387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YsVdy8OapEo3M1lA4WGjEKrkUc6OpqPfmmaozkU8MBJGOBYx+mBAqOVPPYw1YR7h9z+o/l5DeGKkAoxGmrGE7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8060
X-Spam-Status: No, score=-0.3 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

title: s/filterng/filtering/

On Tue, Mar 11, 2025 at 01:38:19PM +0800, Wei Fang wrote:
> Although only ENETC PF can access the MAC address filter table, the table
> entries can specify MAC address filtering for one or more SIs based on
> SI_BITMAP, which means that the table also supports MAC address filtering
> for VFs.
> 
> Currently, only the ENETC v1 PF driver supports MAC address filtering. In
> order to add the MAC address filtering support for the ENETC v4 PF driver
> and VF driver in the future, the relevant generic interfaces are moved to
> the enetc-core driver. At the same time, the struct enetc_mac_filter is
> moved from enetc_pf to enetc_si, because enetc_si is a structure shared by
> PF and VFs. This lays the basis for i.MX95 ENETC PF and VFs to support
> MAC address filtering.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---

For this series I don't see any VF implementation of ndo_set_rx_mode().
I don't think you have to move struct enetc_mac_filter from struct enetc_pf
to struct enetc_si, so please don't do that until there is a justification
for it that is contained in the same patch set, and the two can be
evaluated together.

Moving enetc_add_mac_addr_ht_filter() and enetc_reset_mac_addr_filter()
to enetc.c seems fine.

