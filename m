Return-Path: <linuxppc-dev+bounces-8140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5094AA0A81
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 13:47:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zmz8S0Wdhz30TG;
	Tue, 29 Apr 2025 21:47:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::620" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745927271;
	cv=pass; b=XsUBH44ERxVahraFUUQCBh8WDIK4HqZO6YHFzdzhdIAOgvMKOueqXF47Zoq8vvvTA9QsTCMAqc+Q2VQ3pBkxbgHS8XpxJuDdQOIQFiJr46fXcPPZUgCW4sl1gb1ZHu7Xa4BodshI/VwsUvT0j/Hwd3QdShUS53hvROarq/6Hid6knlYtOyksSOfLOZj3DN3wph2IJbPqTkW2jGQt0P3kSRMvv5Ka4u3BbIwMn4idqsw6v7JQoHvbjX7sHaRGo1YLytuWDJyO3GKPSPkAiX9aSBE/yqnrw5/fpu2hEvXC3vVSEj7l7KCNkfWleib1zyrt8TsHpc3PIhw+/8uqGC9BnA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745927271; c=relaxed/relaxed;
	bh=NTyHfCIoLrz1R8JE+xQMwJfnRArb2IOFbz1pnXSIwgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JE7z0amQBx68cxEa8RxW+/n+znv5XJqrR+T6Uh/DjcusviF6idUrnVhwspiHOzA8rxw/W/cu38edPBBDRk/MseRHPNb3Y4D+GI8aXicJ62JSWf5GQQKsBD8+XDV4LylGcw7HAbNiRC/r5nnoySZPxACN6eHWYDfJ/iJteaHxY8ZmJXKTZN/rGu0spTh2c8c4QxB7s6AVYAweQ6bQnewp8th9WSVw9RiuF355QUIlkTpSdM6TCcx0BX85CpCq4cKyzP2k4V1TasqEip+39yl24WRenLv6iJRWXj8v5qSL7h6rfH3kTAD6I9EehT6uCQak4/0LFJqk+rBFphLn+p2kjA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Y4oVEPQc; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::620; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Y4oVEPQc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::620; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20620.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::620])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zmz8Q5SbRz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 21:47:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wty8SSpfYZdrAI4/cEZbJVy7G+uGa+4H7YjFJ5oexQ+qaScQxscwuTPZ7kHSk/XXmRHzJaxIyEBzSUcO5E1VyuC+eZ+nim73iQLxkvbka7Tl7516QsGwqomlwiOqQivFNz0HlqSVtbFyUURlbxcOQqvhj8wAAgyQ7r5ovurN69kWU23xF+ubUcCd6OqY6Fby3hiu2oogcQxrGC5v00mpp2/FwzCeoGc0bdieTiLGEn7oslXWxInjYlciFlUAc282IwBqtvt7vDHNsr/lUr1GOWpncNzo5jVT077gV98rMFy/cqqDufKVVz/dL0xrexrAsSq+7iBmy2nk4ljxBzz7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTyHfCIoLrz1R8JE+xQMwJfnRArb2IOFbz1pnXSIwgE=;
 b=mcm6ARtmwHDVhIbENC58qO7CfB5ZKn8V88DYaDoADmPopfRegY1XB7cqcouTuShQ0OZ9S9AAt5fgQhC1Z2SprZhH/8GHk68yYA4jtFCYg/9aqSd0iMCML7kao03UpiM7R+nCFOajhLT6i9mxsl96Z1J0hCl8o+PJi7t//Db+5C8Be6qwnOZEtOpJhb/BXfBPvE/nluAx9LT3MYqVBb1lEpZ1Vmw8NhlnqD1+FQ/NRogvsgAt5uMFwR67sTCvQxLRqv/Xyeu5/7mgNKx6tduaN27nZd0/1zNIAsl9tgITgHTxh5hp0Wec2gwphZEmFeRvF3EjNGc7H/UvXVbH3j1wkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTyHfCIoLrz1R8JE+xQMwJfnRArb2IOFbz1pnXSIwgE=;
 b=Y4oVEPQcXFpTiFcUCzl0QpBuYH9W8HeMlek10Ne1eE7iUjjOpBz7GL9ioKrly7JD4TqePEDPD9W0n0+VSailx/Y2nARvgd42p+DopgemVPgNLyb+QbXQy569xiySQ+DBb83qRLrkJHgjurmPXrcan+xon/fa+OfPZ1BtqSwDCYIuglGrKPWE8HZh+ScjT6lNH65O49FpED9zCsG0YG315fxz/b+64qe5HmwVHm+X2O4JAEP30HkBYJ9guFzuZ49jGQ93XQXmyVruCeJ2DRTxkvRtRstlc2i09oFCCen9VGJejEjeCYhJnaQA7j2af0D00m2atu2GmWDzzuFjglPMMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AM8PR04MB7379.eurprd04.prod.outlook.com (2603:10a6:20b:1c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 11:47:29 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%6]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 11:47:29 +0000
Date: Tue, 29 Apr 2025 14:47:26 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Thorsten Blum <thorsten.blum@linux.dev>, christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] bus: fsl-mc: Use strscpy() instead of
 strscpy_pad()
Message-ID: <kko4akbacnugkdughit5ty6vpzg4wjiif3rh4w75hd67v34nre@ngpqhwjb5l4p>
References: <20250429104149.66334-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429104149.66334-1-thorsten.blum@linux.dev>
X-ClientProxiedBy: AS4PR10CA0024.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::16) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AM8PR04MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 334decda-593a-48d1-364d-08dd87139ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ru4lldNbiMf03s3CeniyNDYZXxTZCQIDGdKGQhrFZ18D+YizUAw1hRNoRJqt?=
 =?us-ascii?Q?lxkenGQABbhNMcPwIivJwvG4zxGQWg9os3KSW+SPatRlQhUv3spaVKTWV81W?=
 =?us-ascii?Q?bx3dZAVqwdo33nlLQ/8Ssqr29GXJubWkQ5powyESKGtfMS+ZTYVg2QYUcxHf?=
 =?us-ascii?Q?JhSA2X5nFGv+5xDLrCRhAfBbWEnQgusv8ekm8LYSyTpgMvzMAboUv/3Aqz68?=
 =?us-ascii?Q?Iuu4REHupboAfZnB5jF2zdyKjhXb8HQ1xEznq3lgDJS08Q3pmfVDuWqWEfnr?=
 =?us-ascii?Q?LFtVvsal3hWuIpoqmRclklmBGzP+leGLxp0RZspTdV+eg3yyYE4wBmeZxD59?=
 =?us-ascii?Q?MUViFnwWf0pJFrwWPYjp+CC3z/d+9YadLbA894mvusxS+wO4TQFmCo1ufxWH?=
 =?us-ascii?Q?/oNxPENhhRcrqGpm9k6g+51o50tkizya/qKhTRX8XKCfuHN0+8hkVSirQFny?=
 =?us-ascii?Q?V/DFElKo+cnztioPAakiYrtONxRfB9hD/7UMX+niHCLouUz0gBXfyTByHgWi?=
 =?us-ascii?Q?FJPfXfwvLMtUaIFB+I/NDKKcktQgDVjMzJvKERMirWyYQX+2yRCk+V/gDlBF?=
 =?us-ascii?Q?txEQaueRFRwcMjY2vpMb4bRD7lyya5B2T3c8CvkXFG3nfCpnDvJ0uB/hEooi?=
 =?us-ascii?Q?1A4UwW/qUaLmB+WWzCP0VgCWKdlJYcRNNAmjK3tghtwtmJUt+DDNuXbISTjs?=
 =?us-ascii?Q?RVvnw7AqTz9pg3p+71CiHblCe9vvr6Ksjc7h5Zz/wcjot6sMuNlxb4rkpn9N?=
 =?us-ascii?Q?VZ6D3BaKKU5Ska12Z1E8wPzn+aZrjWqdWWEIzSYg1gbGhPScCE+AdP6qWi2j?=
 =?us-ascii?Q?qtHZ2WImcndDvAAFQjckf5Yef+TbnSS6QiE83/BVMZgWyVHwTJGPsZuoGPMx?=
 =?us-ascii?Q?fmwgpkhJD9LKYskpKaiW5spOG28NCOOziayquZO18XsO0dSVRhLUNAq4lG4M?=
 =?us-ascii?Q?mXVHWeORxn+dWe3B43awZ5jbR/WH+hBhS+wAyCGPfd3jCqCAmKWYeJy1Gis4?=
 =?us-ascii?Q?SHsAUEGOHfoXuCI8sw73gwqmDmklK0nafHGxa7E6e/MIu8g8RY2AHXfSoIZM?=
 =?us-ascii?Q?ezfJE/YmwyEjLJPCnixE0K+Zg0gK+D1+kZ1p8N9aR5xD2QeIlzz+aMegrzuJ?=
 =?us-ascii?Q?QASHK7nO90y9IbD5M1ZfqbRYBbEiZYP/SAQF3Y4mbRYVZPsxBecg9UrQRjSU?=
 =?us-ascii?Q?vdzEiX1Kg+amcEU8xDmtVhMtecZZ87r9qtwe7ZK0gVp9sEhRsjBe6yWfJAR6?=
 =?us-ascii?Q?Jn8V4LR/wsvrVPkXKFceSbSQ4brelyGM0pzvplZVCspE+VXLQOjYiMTthEtH?=
 =?us-ascii?Q?v/K/GD8xsnvaXSaLtrXzAQ+Y0T/+MNCjRwQthS5GY0maQOtXQByTolu9JOQp?=
 =?us-ascii?Q?W5USo6NdG9S9b5qdm9eRIWY9nVTFfcOROabvCqWh9t8/bT47+a2hZiViaSYc?=
 =?us-ascii?Q?JIlEPUEbrXo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?txKI14GJnij+dDI1XjASRwccZmca/xHTQMZKQQfwr8TT7aM228jqGFWBF186?=
 =?us-ascii?Q?NzkEN4LIuzvVUcJgZCzzk6DSUVXHQq6O0JS0vSAz7LGzuTtahyQ8OXY4QMAf?=
 =?us-ascii?Q?V7GomzuNTzrkHPCScYfpZi2kia1CRKRATgaCi8326Ji+EiKFbPEiyueTTW8H?=
 =?us-ascii?Q?aQ6zo4I1ucFrlmcWoQ15xg59CRbFnpHiG3TkDW185NrxPc0hsncdFnr1r6HS?=
 =?us-ascii?Q?nDIL8CuZLSi2pw6jEwpU4/n3qkbTXGEgPD8idgQ9kZ7/qnEHoKGOEjD7CpQX?=
 =?us-ascii?Q?mnIe1Rcg+RPJsq0okKyPW8SEJYB5rTdXnqDemp36FMCkJ1UIsmUDm/KhgG9m?=
 =?us-ascii?Q?JB9JXThwvbnijtltsOwv9ZvbmSSqXW6nO93hX4A/YgCmzeiEEzBNBt0igAcb?=
 =?us-ascii?Q?2dx0hKbcfXsW6RqJhGZANi2ucfpSUl9t34Nm70Pi5TUMjyxixtVGbtdb94Hk?=
 =?us-ascii?Q?NMTCAypsRA7CN/9fHOl+6D3llLora6lKs+VYkaF8+aLziOReonRKIOqmqJod?=
 =?us-ascii?Q?PMyyIivG9iw+lZmTfY9cCwTgronL4bbTbM/N3o/v5+LdE/Z9GWa90I/ycjS+?=
 =?us-ascii?Q?s5YIJuEJ6z08g+xc4VsFyTo1yKwUR8fw4zuXFYS6rdqoVyGvLCbtcLEaIgOK?=
 =?us-ascii?Q?yelE9dsy2Zlg+gWFppmLpKuQdM4zBdBB92sVMenl21VKszTGIH1VdT1AA8Dg?=
 =?us-ascii?Q?qNIJoNQe13MTuySGYpEdGoUR5m4C14MQ6EtQQFqbftGt1Q/GvwlJtA/Z3kRH?=
 =?us-ascii?Q?jcIHdg+7bl5pTaEUXD1XBeyDS/iGq8mP9iFviCCiGQSh4zi4qLE683KSDcOz?=
 =?us-ascii?Q?nUWJD7KI45CIdRHopAQs1lF1IoH01sdGQpE+GUYrHPsx/KiB/r2+YtxVk98e?=
 =?us-ascii?Q?+DeC93UdPSQ9h3+6VEcrQuecEz3xLlpY3ziBSLAPqexGQs4xDjK50G2Y4F8g?=
 =?us-ascii?Q?upVX50hyaA0F6WXx3ogSnlz9y+zv43jFLgQObCvWYTCcUNR6AuKHJdJF/jy4?=
 =?us-ascii?Q?pkOsJFisJXAJUXccu4E94aJdJyaBuj+dKKp/potvQ6g9q94y8towMfMxOHLW?=
 =?us-ascii?Q?+AKL23RzX6+urElfp6Y1dYUoXZCUMwcrDdu2JkTsdyTyfqYAYve5gTWXiEQC?=
 =?us-ascii?Q?knkQm/yvX3gsc6f682ti8ezXzKsechnOu7/04x1LV2jPRdxg+tTrwXH9nImi?=
 =?us-ascii?Q?iCfjUUXlONa3fjAMYFqur1+ONRpcj+/9fH7/4Kk/SLqgctHN+FsL4tcN90Hu?=
 =?us-ascii?Q?lCZg9q9Pr866AV58w7t2IPtViEwsrSTUGCKA0y+aUP1sxxJOwWpeTe5F6jhz?=
 =?us-ascii?Q?9WkCtRWUR6G0nyqe/1EHR40y0iuGpW+cMAz/PR8a4gIVGTG4/OvvXFA679Tr?=
 =?us-ascii?Q?9arZGX6n+uDgH2nRJl48jPU44YoG3OaHENUiEvcqa+TI3dKG5z6FrmbiqUkg?=
 =?us-ascii?Q?iiTS4Jcl+fA9zMpj6tDWDfP5Ls7ATbeVYvarFg3zUrXRskiI68VTI/29ftDn?=
 =?us-ascii?Q?TZhwMLkaosDwp6rkbCLcwF9TqGrE8GJDeedvVc9esGRfOiP2oIGBDM6wxfJM?=
 =?us-ascii?Q?pX1X94t+2KkMz6ZkZLEH+gizieIKKtPJyYIxFI9N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334decda-593a-48d1-364d-08dd87139ea5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 11:47:29.3655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXNpueGSrE7ShfRnkX0mB7wG6PP+M0ubwtGKR2aplJs79lWz5Hofv9PObhFt8ldPJeTQzWTwAJZytm/fPg75Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7379
X-Spam-Status: No, score=-0.3 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 29, 2025 at 12:41:48PM +0200, Thorsten Blum wrote:
> Both destination buffers are already zero-initialized, making strscpy()
> sufficient for safely copying 'obj_type'. The additional NUL-padding
> performed by strscpy_pad() is unnecessary.
> 
> If the destination buffer has a fixed length, strscpy() automatically
> determines its size using sizeof() when the argument is omitted. This
> makes the explicit size arguments unnecessary.
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Christophe, could you also pick-up this patch when you have a chance?

Thank you,
Ioana

