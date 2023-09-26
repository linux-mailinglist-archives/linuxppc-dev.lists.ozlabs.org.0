Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 194497AEE4B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 16:01:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=YpNPVnNQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rw1dB6mTVz3cCM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 00:01:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=YpNPVnNQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1e::618; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on0618.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rw1cD3YHRz3bsP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 00:00:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWb8qQneDuuqSDxsgUo3+RopZrDM9r4QKsKyITXvR2XmEJ/az03eaylRcmyeQYAW5IU8Bza2hE4wr0+g+kcs7Za0VUKfICnusGQvM6qet6Zk6G4WDDXOX0xxwfo35naebMomxwqSMvZpCwTjK0+dudxV8HsHSSATbtczh/vgCpyl0oZLVSZnXFi/u6bFfkFUL9BckMuQdbAbicdHRLZ6b+YUTfkRgArZ6tOx8xYsmJqc8oVNoWVK3l7dS0MkJkJoz/YODPIB/w2Gm9Oz5PEt78X+LMd4AC390ptmfPU1NTSRlgxTtJCMIrTgyzkdUg6YundGf8E5SnB+6jc/zyKGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yn43rfHET6DXaSDlUmpGZixca78ritdYAzW44QgFm4c=;
 b=crhMdKwZX6nrCQ6jOk1PTzSaFvBsO7YWr7aTRS1wiRChiHPRStkGmrNCiVJGqWIOGxSxQq/mu4URIifmQR+6dR7diieLX3lzef9bEw19Fj3JYNojX754irAUHslDQohde4q9Cu7eJCD3u0CZtbGquL6YEzwOHF6q6C005YwnI11sAWWiB56zlLWEQsghQz3Ew+/Dgiek6he/de5aqqWLf6iDm8iPcZpJK7k+rnKG0wzvIy/Yz1rjJTzmUwTlBIa8hQQoeS7qPLrIe+phlk8s5r3qF6UwtdOwja5wDVqk9fOxvNXCDBA/avZlzWVzfX9lb5XGIlk91WNdeCjjRCXWsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yn43rfHET6DXaSDlUmpGZixca78ritdYAzW44QgFm4c=;
 b=YpNPVnNQHv2Q0NlZwTW0b5/59+ApnPi24ZquYyHtdTytJ6KfTtYgAWy8rOBcuUDHw4CipVDDiT4nWT/qQXCJKofKSJ6F1TrwvxgxouHqOzeEFxVh292KreudWvA7q0HC4FRx212wM94MpSWmgldbVF9IGMgXkuC1VD+u9sGapDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM9PR04MB8923.eurprd04.prod.outlook.com (2603:10a6:20b:40a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 14:00:29 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 14:00:29 +0000
Date: Tue, 26 Sep 2023 10:00:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Message-ID: <ZRLj8nHJrXB1DkkO@lizhi-Precision-Tower-5810>
References: <20230922042836.3311689-1-Frank.Li@nxp.com>
 <ZRKH5CTucrT5BFwC@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRKH5CTucrT5BFwC@infradead.org>
X-ClientProxiedBy: BY5PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:180::21) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM9PR04MB8923:EE_
X-MS-Office365-Filtering-Correlation-Id: bdd9632a-704a-4d9e-aba3-08dbbe98f0ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IGUgPTBSj5bANXhEicKQTcoC9JliBJ3CUQLEdxlFEewT64dD/TRgXV9jlWpOnQpyr84D/o5Z2gZ1ZwY9IknZQfJRvPxZHM1nk6S3IeanOc0uozPgDig9Bl65GVt+JV6aDK46n2AoTx8ha/ZbCLUYTEXPFe6/KoweqmVOovqM7hHZUGA6PFqelxCd+6CjIlIdftfeoMwE9pk73N5t7PCSyhY1rfoOpSnNkVCQ6M+HoXZNPDReXeNCH3FirN6RjOUzMKDOTFpjAdvXYRa1gEk/NLdRljxwn7gbWDhatp8+mWyAadursJH3Dvi8QfDjjKgI+9n8x/94KFWeCFAQpEUq1x7HHk9jyfxKhM+04dmEASbzh7KtUaz5088MFWiLyDsHh+tzoBrR5hNcBlu9uoyldATkmVsPyQDloVm/MKA7tG8Smu9/uh4H9YQ4/i7FkvY4YFylxvLOJVxbv8aiBoU4du0dGEFuAIV/xe7vr6b9yTa9Z71wSZI1QqrWemnVPJ+45z+FxMw/iuHPQV0vnB86+Rb7pQ1GJElaO/BVff1SJFZmckxYrdv38QmtCBmAnKX8rALmmsEu+gLEjcsbu6wvo9hymHSA02ZZz2zqYp/qZYIRo4Rl3FSR5BOCPqHkEURK
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(1800799009)(451199024)(186009)(7416002)(4326008)(4744005)(2906002)(5660300002)(316002)(41300700001)(6916009)(8676002)(8936002)(66946007)(66476007)(86362001)(66556008)(6666004)(52116002)(6506007)(9686003)(6486002)(6512007)(26005)(38100700002)(38350700002)(33716001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?M49ymGOOQwP2cwMW1GZV8o29L3yoIPXUdCmVM+i4ngvNVkI/fzRPLunZUi+o?=
 =?us-ascii?Q?1vKRD/0yeWd0Gi31Szi1a8ixbrrUgFRikiKJ9Q3ocXCC2AyeDvkfAlHjiOw+?=
 =?us-ascii?Q?udop1Svj0tSzoqCypvHniEdyMymkQ6ct44Lp2c3h3ljBzf4rJtTjUTy3QAoa?=
 =?us-ascii?Q?02U5scc1SzneMnL6Kn6NLQ1pJmtiUSiw6bgls2I4sASTnYuvrNnqsn5oxU+J?=
 =?us-ascii?Q?1H+jId4brTRKu8OB3aUAogcpZuVHTfhmsbRkutE3ju/whzmOk8xn5O10wfyF?=
 =?us-ascii?Q?/A5wQosKjwSnd/2CM0Tk7uMk1RHBe6x0cwEBXtHiD9Gccm2c75g4a2MVDCrC?=
 =?us-ascii?Q?3nXeoCvsyWuHnuHO7/gWMNaSC6mp0uno+w2H4dlqr4s7M4+T6H2bZF+yYDJP?=
 =?us-ascii?Q?fzrT6HqXxGCwoExfMnn2ItN53cuAE7l1TdpmtHuHRIMFlCazRdvy/tJg3UMu?=
 =?us-ascii?Q?IWwG1ATrwEif2IXC9hj0GCeCLNszLon8DtOKKdeyAzqoAodnF2hKEe1UEnj7?=
 =?us-ascii?Q?NIjlHo0ExsaVpkunKnNk5vNZ9GGGowU54+ROPmcXLTwvvABdnNrUBJ/oaeQM?=
 =?us-ascii?Q?2Zna8PJRyD6V5e4LcwHwCm5fxeO0GhBXIr/eBVLqvAOmBG7hs+WXwz+l0xpH?=
 =?us-ascii?Q?i4hDwQ1UcEeVdfL039TLbhGLNs8Gly+Mq7v+9T5vHa6upEM0E727iF2aWa+B?=
 =?us-ascii?Q?gD0EmsNz7GaZfAXVd2NoKF6YJrdOWcfOdQq2mQOvOvsAsiu1Y+i1yqJwqXMq?=
 =?us-ascii?Q?oioxP+p6PkJGCAV1iDu7gCwEzSYcXrdNSbQUjUD1v+NV5Vu2EaeZKu8cZ3OX?=
 =?us-ascii?Q?tFK9WEqNcRu7U57L1VaLs3V/JA+4Au3pj7G1Sg11pGaIddXJsKeGpX1xkMl8?=
 =?us-ascii?Q?JGIQweMCYM8w802zCUv+3OvfOubUhC1jDay9jpJfVXJjY83OQ2omJvJni1T1?=
 =?us-ascii?Q?IMlDffpLak022oIVPP8W3+OY+X5vXzmGZpPRKoQLvEIy7lA4AgHFN8QIhxu8?=
 =?us-ascii?Q?hCz0+tRfKUyBB9S1/55PfNDhEMIb36MdET/DnAWHqYW1WkJ2hozf8YmGRZSv?=
 =?us-ascii?Q?huR7l2X388Vb2DYvkn4tV/lDThtAx75AoseyNYjcY9HnbLlfA9xi6E/WoBLC?=
 =?us-ascii?Q?At4NXYViVx18KDwHEzbsNVSUaSVnEAVr6mbeKthdzUwNJsDARSylyC6so4Mq?=
 =?us-ascii?Q?5s3UYZJRahPUJMFDbx3albJhLDAg6/msrzQlecNbHpQTMaT+YuyeBlriR3rr?=
 =?us-ascii?Q?tcbcAnJK2CXysV06hRN3jw+nSGhCX9bziLshwcvIWXRoQxEz1nHdUrZ7zVSh?=
 =?us-ascii?Q?r3OIDHdKE2s6wcAZfLWBlJojlrxuSD5M2VquQIINvLq3aFGracoHVNE/tuBC?=
 =?us-ascii?Q?sB4C31ET76m8RjKs+mT1YvINE7aINohctYsPzmD3/j4MdMEzYRWWixgZHHiy?=
 =?us-ascii?Q?HZMZVwmG5mCaewjm7cqOkKAKKLE97zgCwZGyCL6eJOvrAWyJbOFOU9Zqbb65?=
 =?us-ascii?Q?HQfKAEuub6WuSE9rlJKPGphd7aaqRnYg223ScMn60IVIPWIKLITl2gkXm539?=
 =?us-ascii?Q?V82p2/HrBRyHai3Ivmg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd9632a-704a-4d9e-aba3-08dbbe98f0ca
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 14:00:28.8704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNYGWIaWW8PwVJbOmNBlRL5i3oo9uWkGearFF2JLuNg/75Hdp5rRH8SR36EEpoq6hUL3r5ZXz7DzpIwXweZ0Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8923
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, christophe.jaillet@wanadoo.fr, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 26, 2023 at 12:27:32AM -0700, Christoph Hellwig wrote:
> > +	/* set 64-bit DMA mask and coherent DMA mask */
> > +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> 
> The comment is a bit silly :)
> 
> > +	if (ret)
> > +		return ret;
> 
> Also no need to check the return value when setting a 64-bit mask,
> but I guess it desn't hurt here.
> 

You are right, let me remove check.
