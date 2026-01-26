Return-Path: <linuxppc-dev+bounces-16289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADbTBdQ3d2lZdQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jan 2026 10:45:56 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3305D862AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jan 2026 10:45:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f03Z571Rvz2yGM;
	Mon, 26 Jan 2026 20:45:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c202::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769420749;
	cv=pass; b=UdEXTh5oEByTHINM0PjvfBwbsXpc+T8QpPgg/77LctSHF8Soiob0FUFDqWGHKtCptcIkhgoDm26DVZSIwK4f61irya0byNfGHwsQgiUxjT5v16MrpM6L6I3lR1e86pFRCS0D26nBEfIyDx3olaHOv7RpfahaV6ONGtaLLWhQX8d7kBi6Gog7SvAOdpD5cQTp6tVhGjdSPArxA7yvGqaJPDclD7oJ3xB3FJo7QKTPXTipUYC18yWiDZgvXlcGotex+yFCmsVN5bnnkIx+m+zWRtsJDQGvqOyHUA3qlH2vpde+qB7W9A1QL3lYu1krN8kN8GpLTZ7YUUdQ6N5lOyOJPw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769420749; c=relaxed/relaxed;
	bh=zXvjTzuyEAS/HbO+tryupLk/KSBW0iIsUPELPkIl5fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j3zkLGNttNCjXmVdE4E0J8gMwb+/cDjIuuycM7/tuSP7cOCpuOBYuBhSmFJ4Xb1K3oXg58m8jLZ+zg+Kx49VGPfv7HOUntIQ/g8uu3moU3oB05GVO2kMlT+/h1fcXjrLE98prvnV90TP9yurraH/+Ft6bYp7YGNbDhLNVkItunWTgaGeI9VJCW83h33n+RfKAIzm1KkefMjBo57S8x+VbVXWk9apfgODkUcbjPacMBBDxo+SNL8ejFqtctUncITjCTqRwdzzaryILuRowQOrCD+V6L0BItaFU9R2j3HdGnetkOVIzmnE8tAbjkDUE1nX1ICIiUofR4y9zMc+S1/mnQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=V3QjWuJw; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=V3QjWuJw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c202::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f03Z41R43z2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jan 2026 20:45:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8HVpSeDkwnnixhZemJNvEBr5ni71CxZDvsIoQ1FAwlmtkLql4QMoyt3lzqLPTwWMkUfCNbRv85jg+A+uWMbTp6attNEDeJrGPl9zSq0J0Xs/1RXhIDlcLdggHXIZ+fhuPB+CC8yVIW2SBxVvBJApYziPk0KKKLH0YrFVuQv7ompnEn2DtBINbdU6T108YDwODfH69GJojlmLbl15iURZUzYaN1qmaPJehZXI05177bYxKLqtqAKK6cVoXlbzCCaoMlToxR/RUMuY5RTpFsRG2ahNeGB2wtsNMJGNglXkG/HYnC4JyJ3ph+ZmH76bSqPDjnH8OI1BOoxZaPJ2Tufmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXvjTzuyEAS/HbO+tryupLk/KSBW0iIsUPELPkIl5fg=;
 b=Fem/7PM3eIC95d5lRinVxSAXL28YRGgVoUA4wbdrms7b6uCZniilHt0TgGprqdr/m7ISfrW0B2WQvxmbpCPR0EPOE5zMH2TCfsQTMB2YmtoiyBzLmxywTkm2Mwb1XheCsZ1m7ALcnXLa9eQUh+Nhpu62u0osgz9OWY+k3DiOe9psN3YyUdTG23qf3bbKmgt0AHHRS1NpwLXsVI0ayFbpkWvwbNp0yhol66UaD4GDfrrMocMkEEP0x2I/+ek/xRAtzvJ8vHVQRC+5eu6ujHDFSqDVoha8Z7hycsE/sGpww4AsS83frUGgRBm38WaHZu1m70XINUB9C6L5Oc9HHwHKjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXvjTzuyEAS/HbO+tryupLk/KSBW0iIsUPELPkIl5fg=;
 b=V3QjWuJwOJ5UfySjR/3gvyGNxY1zvgKxm2afeRMOsDNc7wSQ029tl67vKqWOauBU/keiIAjHFyRth53azPXBBv0XeBMlU/s8MEzVCtRakFheBYUuShGnuYqP90UiIHZ/b72l+QK+PryUP3kW36y/Nrm9Ba1nSfIJcOnH1tCmec0vBUNbEejQAF+dHSal+P8a60MbfjMzpvnc0JEwOl11+MG/jYt3Vuo4V+3zCnbSHK5+imyCjrCbuQP3m2TvZlG9SUoyQzS8V401soFuHrsb+n8okM7Yh2/E+zj6pMbwUO6mziteD4UtipmjNRmWJV9IGVn22MMqHMiWqxVGQV7OzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by AM7PR04MB6983.eurprd04.prod.outlook.com (2603:10a6:20b:102::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 09:45:19 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9542.009; Mon, 26 Jan 2026
 09:45:19 +0000
Date: Mon, 26 Jan 2026 11:45:14 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, stuart.yoder@freescale.com, 
	agraf@suse.de, German.Rivera@freescale.com, gregkh@linuxfoundation.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Su Hui <suhui@nfschina.com>, Christophe Leroy <chleroy@kernel.org>
Subject: Re: [PATCH v3] bus: fsl-mc: fix an error handling in
 fsl_mc_device_add()
Message-ID: <qjdn2rpln73nqozpkgd2z4haxym75mdtjbtnovip5j4fv4ao7m@f27hlfyi7flr>
References: <20260124102054.1613093-1-lihaoxiang@isrc.iscas.ac.cn>
 <aXSjPNWzsEPhYhv6@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXSjPNWzsEPhYhv6@stanley.mountain>
X-ClientProxiedBy: AM8P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::22) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|AM7PR04MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: f05c3a6c-98bd-45cb-3528-08de5cbf9e31
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?C/0pFVisGBPktrduaS1jmh+sA6ehR7SxwTgXBdnuzy554vE5wjfIeVktmMc9?=
 =?us-ascii?Q?1V65gvqxuQEKAogdEYvgknVE4Y3I1mPadkO8mBR7R44YzcZqgo2E5ytAiJVE?=
 =?us-ascii?Q?ksNXOIbjiOfQpBHD0Eta16aefE9tloKH7+GP/dZjK3c8qwKav1tkgdhty/Fj?=
 =?us-ascii?Q?UsGcW0dFjxC92yzIjYQAVDYzZelt1hj5EoicGmNFHKqR2c4n2QQiSpy0cd06?=
 =?us-ascii?Q?2hsc5gTT7VukrQfui99dK/NeQdYDn4DKuRiyD2anNacWxaETwKjbDf7dFnnr?=
 =?us-ascii?Q?ziNv3gE2P4SQaFNaDw7ZXmz3o/QRJwHRjAs5PavE+sPEVPM47IxgNGu8nGMF?=
 =?us-ascii?Q?SI5khYfUwGPukcm9s7mr4ofWW4GvmNakhNEk96qJKicN0DLsecc3fVtyG+Qp?=
 =?us-ascii?Q?Wk5qv4mBAnWjoiFuIT2C19n0DNLx6L3g6ntOsZp0PyLZf9SLDwCLZHmjmE6E?=
 =?us-ascii?Q?zkGCJPmMSB2OW5GBB/P1fpWYQiW+RlFCpktR4cPRUzIYMdjXErxCtW64cpIM?=
 =?us-ascii?Q?Ba19A/NNYdDn3jKv6eU25RByQG6yxEhxPimBE/VxhBGDSNsBBU+vzi/7BS1w?=
 =?us-ascii?Q?Lg4eBxnaVS6Ur83JvdNe/vHLz/HnCri+k3yfL9TCqsx53dwhe36d/Zxhnv9F?=
 =?us-ascii?Q?4aNPPlcS+b4n+Jk19zajzT2GIYWRLQuqicNEwch1ZO9lHvdJeHZpLuK3QVxC?=
 =?us-ascii?Q?CIfATnNVIQukec6Ai+kvsTHgP8/mw5FczF+cP64o4QkdqglBrPpdm/m3KLXo?=
 =?us-ascii?Q?hBIWDZLzzpNDrc4Xeh6bvhS0vNM26UpEvFqvSQgNxseU+yZz/qYVXN4Gdtzc?=
 =?us-ascii?Q?FYMGrT2Y2yw6hhYiud4yfVfrSQEiYBuQRTk1vL2hvraoq+GfAmgce2RAky1f?=
 =?us-ascii?Q?KcDsKVth1QgYi5RIxYKHCnD2ZXbGwDcxp44PYLeLOSIO09X0Gr5U5e1efjtS?=
 =?us-ascii?Q?SV1pRdV1w+0Dd5z5WzYLZK9V8VfcP3ZW5aBSjnpV/dfz8Qrx9hBt2ivdata3?=
 =?us-ascii?Q?GMcXi7MFI5ypH+vMGaLhyTz2neIkofXehhg9HA9SGywX/2mGwZrxoZg66zHy?=
 =?us-ascii?Q?ZkVydUc/GPerfsWzP9aFse54cadaSoLQazLaUORkGCElupsF5gSqRyi4n/ui?=
 =?us-ascii?Q?4WhlXOKvpc6lkXGQbu8fG4rmIIvDZohJ06n/pgPAQWOYNWWymbBRN6Sf6v0Y?=
 =?us-ascii?Q?Z5yp7iG3RD/Tn7TufXcQkzpeYqHt3JiXk/5aviiUNwa4QgCKd9ZLRw/raWnV?=
 =?us-ascii?Q?24YxSLti1KEMcOPjBwCYSsPNd72tJy82HIKA2+z9WW6rAsbirYI8LkYx7aAI?=
 =?us-ascii?Q?BNHBfsSF19iDU+2/Ab52Vv69QVxwd7oaZjOEN7LplLwY+rOJS41q2+iGukDS?=
 =?us-ascii?Q?QMVHM5tgfNBoyW+xSCVUXkUsxWkx/eIdf2FgniyqK7gB6ISc+SZu/H71Uvor?=
 =?us-ascii?Q?VRxYeEJjREjQUy8aSuxR9AX/bnt5Ib3SfSur7RQvLrECfStbSOUku7YmOHTx?=
 =?us-ascii?Q?jmIW0sRG53zlgpIO6N9yA+Hh1YcyFBfsYU1YlxbQ8jSQAUWe9dG773UAf9Cr?=
 =?us-ascii?Q?hOoX8TS893hNLzdG5GGBuvfhVrHFrTvV1ayM3Fdu?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?nVfptoscgDKjGGvFtU4s1iICTUI2P0msWQD/K3L6jKprlGGW62jP97Fs5GCo?=
 =?us-ascii?Q?MFWPNE0QioMskReYEQ37lltt93++k/yv1RmC3azsryShRE56Hq6GkN/WLkj2?=
 =?us-ascii?Q?tUxUvTeUhofgKS51Fw6nla25jQGDpzrd1XIYrpF3U9JgPEELlB+toDrYGTcF?=
 =?us-ascii?Q?AN/3jeeKOMaxUN7drj5UiopoiF0b88V/UL0fY31VzTuCYy/jCRYsGtlshBfx?=
 =?us-ascii?Q?Sk6aFbyUqTRMwHLHoZiFSIggU83y+YMCVbBdSmVfh6ITFZe/e+QW8PWjOEjx?=
 =?us-ascii?Q?e6PsVo1L+niIJJHGC0zHB1QG/+bH4ajOtfUyK73oUNVRadhAHNwe9wL45oHE?=
 =?us-ascii?Q?rkyAOS7hW7soh6Ram03517K4ih20n+q7ht3ulWoC9nJ+6PdjYnDYVhi2K8dm?=
 =?us-ascii?Q?CPoWu2+Xl1g4kC3J/IVWXPeN5Sm6tFkBmm1dJEde29mLuLaJSJTg8TjJOode?=
 =?us-ascii?Q?uvnQOuHokx1/YYBEn7kC4gZhWuSejzq5uyuoyuskZ3xjnm0P+cYULrN8X3ld?=
 =?us-ascii?Q?cXjQUCy2J1+tg3powFDDP+S8lnhKxPfBshyVRv+Dt9F6j03XQa02xOf4EVbD?=
 =?us-ascii?Q?1PpEuBvWCJbGuImiLTjaV6vLY5EcFZ4bTiq7DuTAcY3z4SKVxPXkZ+tMyUNJ?=
 =?us-ascii?Q?i+uhmnBf9nVVGLaYgD31sEJdfwKowMwelJTSjgqa8bMaAeXo85Uh4WwCvTb2?=
 =?us-ascii?Q?OjNwUEe9u5sLUGpaxpoZVKoBPaUe7HrpWJ3emrtH33X2UqYblT4sEgHxee1P?=
 =?us-ascii?Q?0uQzoxy5qpT84JJ/DR1Ml/wBdgkx1dJN0J9BPnJxc9o+C9c8vc+Q5KbeobW0?=
 =?us-ascii?Q?rFlUiX3uYviq2pxHzNPGjL0jGX1MQtxEcBcOKFCF15TFZkqG5XelFooGg110?=
 =?us-ascii?Q?yVRp7eSPbenwGWSzZflQh9h1DOfpUDsg7VUmpr6FTA/tPddCv028UBPyr7tj?=
 =?us-ascii?Q?escTzsipqfm7HZaUcEQFxznZWQ4jYRPv+cAjZJzugZS/pDrEvTqcpy6WfqME?=
 =?us-ascii?Q?w2GpJWwVeVM0ztBa6mWbRmSsZdhkQ1cNZySOdTLBDWO82XK87uG/yrRMr2/s?=
 =?us-ascii?Q?xoH0QhfD/HP6MyOrMe/uHNLoNnfVTVo+K39DU9aEzZesOgQIb3fwze5mxAsv?=
 =?us-ascii?Q?S7FtETx2jZVT2jd+abZat/LHsTQodiQdgxkHaM7IedeN5LBrIqvnr0rW1Ql/?=
 =?us-ascii?Q?p52veeZVejze3UZVB4FkKa+AKFAvVzb6nrUreDM400ZZTQK30ZPkMAgN41CN?=
 =?us-ascii?Q?qdY4tsT3LGzdkmQqPm0xJjmrSX4mFfOPSSfosFVUdLbYRdiEg6ItYVxdEH8x?=
 =?us-ascii?Q?suERobZXYXVTesKKH0L8dG5MHBmSKLy3LmDZwJd5aap1mw4FfyqLXf+hixYq?=
 =?us-ascii?Q?hmVAiZZ64f9qBHOLD+GIi012Z65AicxbtP8qxK+338xTXFpBUU30gHBPQKTg?=
 =?us-ascii?Q?xCoUZ3t6yhROE5A7NsoWqP0AEQzJQNrmgjdz+p9LOdF8GZHKagCTJg7wRfrR?=
 =?us-ascii?Q?FvmMXHdU9Kh8UaE8d10QCXqa6ma0yG32oQ+jOR72bQ+xaeht27xhJhGwg265?=
 =?us-ascii?Q?Sl4N+kL11VNZhIszQyrLBfoiCRjU7/gKFefe5Qa5uoLjSZ9+KFoCHJRxdXDZ?=
 =?us-ascii?Q?RQPRUIH/ZOZJfdGZcvDtSg/m0xJpxQ8fU4JdiY8aeoHIx0+M/ZtlX3rqT4kD?=
 =?us-ascii?Q?n+xq2C0dDn6anekAM/zJ1vdqR3d7lSpwCRIjAH8ZN0MTLP9MdKgCNi4DmGga?=
 =?us-ascii?Q?D5jdbBZNeg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05c3a6c-98bd-45cb-3528-08de5cbf9e31
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 09:45:19.7711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tn+NoREN6TbX+YHEPHG5kaRW7UFrTVzN9miaAbwAaI0CxMVB/5Py27bgFrTFPIXnYuTzDMZ7/ECJC7SDO6oofQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6983
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dan.carpenter@linaro.org,m:lihaoxiang@isrc.iscas.ac.cn,m:stuart.yoder@freescale.com,m:agraf@suse.de,m:German.Rivera@freescale.com,m:gregkh@linuxfoundation.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:suhui@nfschina.com,m:chleroy@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ioana.ciornei@nxp.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16289-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ioana.ciornei@nxp.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 3305D862AB
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 01:47:24PM +0300, Dan Carpenter wrote:
> On Sat, Jan 24, 2026 at 06:20:54PM +0800, Haoxiang Li wrote:
> > In fsl_mc_device_add(), device_initialize() is called first.
> > put_device() should be called to drop the reference if error
> > occurs. And other resources would be released via put_device
> > -> fsl_mc_device_release. So remove redundant kfree() in
> > error handling path.
> > 
> 
> It is true that we shouldn't free things directly after calling
> device_initialize().  I don't know the impact of this bug in
> real life.  Is it a leak?
> 
> > Fixes: bbf9d17d9875 ("staging: fsl-mc: Freescale Management Complex (fsl-mc) bus driver")
> > Cc: stable@vger.kernel.org
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/all/b767348e-d89c-416e-acea-1ebbff3bea20@stanley.mountain/
> 
> Heh.  What was I even talking about when I wrote this???
> 
> In my head I remember the code as looking like this:
> https://lore.kernel.org/all/20251222074958.992911-1-lihaoxiang@isrc.iscas.ac.cn/
> But that's not the version of the code that I copy and pasted into my
> email.
> 
> The release function looks like this:
> 
> drivers/bus/fsl-mc/fsl-mc-bus.c
>    757  static void fsl_mc_device_release(struct device *dev)
>    758  {
>    759          struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
>    760  
>    761          kfree(mc_dev->regions);
>    762  
>    763          if (is_fsl_mc_bus_dprc(mc_dev))
>    764                  kfree(to_fsl_mc_bus(mc_dev));
>    765          else
>    766                  kfree(mc_dev);
>    767  }
> 
> The problem is that if this function call fails:
> 
> 	mc_dev->dev.type = fsl_mc_get_device_type(obj_desc->type);
> 
> Then the is_fsl_mc_bus_dprc() check might not work.  In the current
> code the to_fsl_mc_bus() pointer math is a no-op because mc_dev is
> the first struct member of mc_bus.  So it works for now, but it
> feels wrong.
> 
> The fsl_mc_get_device_type() function can't really fail in real
> life.
> 

I agree, the fsl_mc_get_device_type() function will not fail in real
life circumstances. And let's say that it fails, then we most certainly
are not handling a DPRC device, aka a bus device as checked by the
is_fsl_mc_bus_dprc() function. This means that fsl_mc_device_release()
will execute the 'kfree(mc_dev)' from the else branch as it was also in
the initial code under the error_cleanup_dev label.

Ioana

