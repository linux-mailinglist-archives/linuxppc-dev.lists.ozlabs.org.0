Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B8967FF3C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Jan 2023 13:53:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4WTL2JPHz3cZp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Jan 2023 23:53:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=k6rhWPlj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=40.92.52.50; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=set_pte_at@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=k6rhWPlj;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2050.outbound.protection.outlook.com [40.92.52.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P4WSL3dLBz2yNs
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Jan 2023 23:52:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lN1Y7rbHxvHcHQWQmbSLDN4xwrfMW7KIGSYhHIYVvWr42JQunGJhF7HY7KzZDyOhw+fjW7SR3DuAlGF5KFzYU1W4tNmgZw9BqKxI1oZr54WL2iv2I8qEax4QoCvZ3XGfmB/4VXSBu9PJwZGtgQLzgguuzqNozaSlyllaKxg0o0rifoOM5Rohh8rE4h9ii44/EdF/RM7mK12qKyrjC8MB4pBzIwprNg6TUmbZv2hkX25zO6WcLSVD8Faz5qgLb4a+8I6607UMD1pK20nF446Vt3y13oR4X70044ub0GBiJVfPQS+JHTyD9pLDphNM083AAUHF4JHVRnKHJzIHr4cxNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qETodQsnU3oSyAxOJa564KyaVIIt4mXDsM/O5ayyoMU=;
 b=Tn7husH8BfdFsX53iArLEdH9D2iBmrEZMmsNGGcdEXf2Ele2ig5N3cFbenroUex6mKJCUdSD4icqLVWRkqRWFBK6h6SwNP1q8Sb2h2azgIB/ejHYNzjVWDFdxzOhStnbvgYRcMoAjimp3m4brolATLydkjN6IOBNJCgaB1hpo2JLEMS9WegiohOKtkx4ePsT7ZYAejxbZeGp3Uo2GOmAvZ7R8X6aXBrYFurCQHXvIapwNimHihEIUzAWrmtbtdD61s/xr/P4bU4/MOfGDxjLX0yX+9d7oxy7CES6zmprlbYI4EVd641oKcRSco+LyxA78nfyAYgDxDH9Ep/eOoBZ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qETodQsnU3oSyAxOJa564KyaVIIt4mXDsM/O5ayyoMU=;
 b=k6rhWPljrSo3cXhD98aGm5Pqg1GRjJZOWzLSjsySB5V6+kaHIW4/iHqmJ/FBu7qMyLp8OfwjhzLQmaNmaAeUJsfg4LxncPE69NqFwPFsx9bVZfeLhtbWvRGNwf3poIkTyhNgu2ktRTys8CN0rrfN6pteBuK6Y3K814CJTd+jqugFhgatyujEi3cP51VFVw8ncUEO+S6TmmlXcPQR3UHgTPtOlLnBiwU+yXYEtkqLRZsT59UrT9v0zWX19DkObmZWS8cqZNez2/watkeZJQQKYMaei4y5LqMdP8RtXFElnWePAuc3d+YlaoBg+Mwg/1AdgBIcNbyWcHDrqE023SgWaQ==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TYCP286MB3470.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Sun, 29 Jan
 2023 12:52:28 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::82ce:8498:c0e9:4760]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::82ce:8498:c0e9:4760%9]) with mapi id 15.20.6043.033; Sun, 29 Jan 2023
 12:52:28 +0000
Date: Sun, 29 Jan 2023 20:52:23 +0800
From: Dawei Li <set_pte_at@outlook.com>
To: mpe@ellerman.id.au, npiggin@gmail.com
Subject: Re: [PATCH v2] powerpc: macio: Make remove callback of macio driver
 void returned
Message-ID:  <TYCP286MB2323CBCB5294E4700F70A12BCAD29@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB2323FA245F0C35C5D7486CC9CAC09@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB2323FA245F0C35C5D7486CC9CAC09@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-TMN: [B79uw/XDwj2/m8YyAWbZdGq7XlcHCEIX]
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID: <20230129125223.GA443864@wendao-VirtualBox>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TYCP286MB3470:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f76479-4c1a-4c54-8b38-08db01f7ad29
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	E5j4umYtgX7TKMT1CKbXRCHa/vNx4Sv3Z6Psnaaae0uC5OLRtcEMPl+hktux0C2LkZeUY5Dp+0rQ68W7iZndb8IKvL4LQxUhohWbyQNXQLTU+nm1kZ7rjaFanBrky5prRRnHIZrBczjXwChGz66dQ9EfGKs+eqmSeQNwo8ilEEhStrKWopJft7Q8YdbR8lK4LETIrJKB8C2ID/ZCVhsa7ye6oh0v3uxB7PD/vTOrVWOMdZXPEXurkOJmaxzbm3PjxyddBWLn9PgHA3K3XOz7A6SWWbYY3G+ISKQbzXa9uevBsqlvBoOm1iJO7pS6CFvbGu1L9Vn+Vpmx+UQhnHXYsRLCHBn9T4w2J6gFJhfqlyuJMSZNX1pcQyGQ1ia/CVuBAAAlxyI+sXhBzR0rlpI4h8w+nbDS6oVhqYfB3EQMkBil9Avu1Nny2IjTBSNoXV0Hu+6VU7uoHQS3gy6qi4YGkuMdBmno8byB58m210/ODQqCVXujRKYPZLluaoatmuOHdUdNSqAmbWtGA7kG5efRvmlWqVdYGNkT6c4okS/RlSwUf3kLucBlkcNajsvwsC3VyLhAjvrtsvtMNM5kUcvBK4faw3RVZzhFYLXv596m7/j4/YAi2J4XEbB0I9bs/OUr2T+BXclrEll/PWt3s/MA3Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?zZhiiX8e4vlxgIlQV5SH+o8aWXf4LF31ZqVrTouxMKu24WGSZ+RDwR+2qlCb?=
 =?us-ascii?Q?CYQS5r65+pz64klTWLjL65D12OubRXD7dO8eeijbEYIsZMrDMzpmsSUTX7Qv?=
 =?us-ascii?Q?1JPaRTLgX32MnLoOA+Z1AnORYtrB62GFPZLxpj+VJ+dA/Eupy82iwuJgRXBh?=
 =?us-ascii?Q?7a97Io6emfP4UDdR5FujmyGIsePLYg5f5GHKtmMGdRIJzvOTwXkzgaImnwKI?=
 =?us-ascii?Q?JiGmNEICij+X1QTdcP94m09gLwjYC925SR6ov7RYl3ylnRNOc6bqCtEAE2p9?=
 =?us-ascii?Q?QZ329rQIwkZ3tZjhzhFxv0KRIh1/YgdvjsMVrmNvQExUukZd7bqwmo9il7mV?=
 =?us-ascii?Q?15ykYza4lqaxYNnqL0+w/w16NpX6evcNcZNTyv9XEkpNTuGl3Oc7BiRRfG2h?=
 =?us-ascii?Q?V+aXNObRH2z5MUdJSJez0bfpLZkeMFy83wfu3nRPd/N0fxom0mJauc5j6GX+?=
 =?us-ascii?Q?P8qe7pdlKWmJDhcujdcai9+uRmvff7v9VtCDZUSFm5mOuvKU9obdG75xPuaU?=
 =?us-ascii?Q?GHXIOxAP13jSe8yUUvVkkwdPFobP5IQi3FfOIWNfmhgtxhvDopk16xI3xk2X?=
 =?us-ascii?Q?jFZscTA5xCqbbZilsL4FwdtqPzamI0pka/HBXJuqW8Opx2S4xSutxUKiIHke?=
 =?us-ascii?Q?TXVi4fRE36x4H/lLBoluObT4pA++BjF8gZvXX6VDICh1B51GR/8wJarhrzig?=
 =?us-ascii?Q?4MiQlTepiI0/RBRtF9RHEgxaGCY6c7LAgNk7I6m/iyLhP06Bl1tTsyH7ZNn4?=
 =?us-ascii?Q?puh0LvWlvMLhnaN4OYlmCFVKEaii9ulseGw+rOval2zPqpXqBeZBdRI2A6sv?=
 =?us-ascii?Q?qhvIbCa0j5IOa6wcOz0whs3ixCI3dSbIiKrUm+aNG+VKVRUVxGQ1YHPLiems?=
 =?us-ascii?Q?lqAR/Ih8EwnSJf+JmPreGsVzcjttQvakJfIG3V7lD900YAc6qS5rHcd/1MqI?=
 =?us-ascii?Q?/qZcHzfVTAAQZz88cW3uUtPjEAQF5yZN6xt2/aVTJPAo7/DBihfKKgtyhB1U?=
 =?us-ascii?Q?BJj5SyaZXIJQCDFu5gcEjyQdsBtzX6NQ2Fqxj1OxZ8CGp64AYQbB9hvUFn1C?=
 =?us-ascii?Q?zuqthyaU0/H8wslLd0HH5HQY7+AtD2r+to+I7DPaxXifldH9vggl6E6lkW0O?=
 =?us-ascii?Q?2mKhOvxals5U6aRbBE5JgtJw6oY+li04rty00DSrrYLSOQMRM63ItUfx1yux?=
 =?us-ascii?Q?2TcTN8FOox0xyJLwlNrjJEjrurd9mNeqpMasmothKQooFNCcu8QCux+GTRvb?=
 =?us-ascii?Q?toNuCX8eYPiicJ2Fn0d/nXh12UTQMmPu9kJAFPsj+Q=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f76479-4c1a-4c54-8b38-08db01f7ad29
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 12:52:28.2111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3470
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 15, 2023 at 09:17:23PM +0800, Dawei Li wrote:
> Commit fc7a6209d571 ("bus: Make remove callback return void") forces
> bus_type::remove be void-returned, it doesn't make much sense for any
> bus based driver implementing remove callbalk to return non-void to
> its caller.
> 
> This change is for macio bus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>

Gentle ping.

Thanks

> ---
> v1 -> v2
> - Revert unneeded changes.
> - Rebased on latest powerpc/next.
> 
> v1
> - https://lore.kernel.org/all/TYCP286MB2323FCDC7ECD87F8D97CB74BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/
> ---
>  arch/powerpc/include/asm/macio.h                | 2 +-
>  drivers/ata/pata_macio.c                        | 4 +---
>  drivers/macintosh/rack-meter.c                  | 4 +---
>  drivers/net/ethernet/apple/bmac.c               | 4 +---
>  drivers/net/ethernet/apple/mace.c               | 4 +---
>  drivers/net/wireless/intersil/orinoco/airport.c | 4 +---
>  drivers/scsi/mac53c94.c                         | 5 +----
>  drivers/scsi/mesh.c                             | 5 +----
>  drivers/tty/serial/pmac_zilog.c                 | 7 ++-----
>  sound/aoa/soundbus/i2sbus/core.c                | 4 +---
>  10 files changed, 11 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/macio.h b/arch/powerpc/include/asm/macio.h
> index ff5fd82d9ff0..cb9c386dacf8 100644
> --- a/arch/powerpc/include/asm/macio.h
> +++ b/arch/powerpc/include/asm/macio.h
> @@ -125,7 +125,7 @@ static inline struct pci_dev *macio_get_pci_dev(struct macio_dev *mdev)
>  struct macio_driver
>  {
>  	int	(*probe)(struct macio_dev* dev, const struct of_device_id *match);
> -	int	(*remove)(struct macio_dev* dev);
> +	void	(*remove)(struct macio_dev *dev);
>  
>  	int	(*suspend)(struct macio_dev* dev, pm_message_t state);
>  	int	(*resume)(struct macio_dev* dev);
> diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
> index 9ccaac9e2bc3..653106716a4b 100644
> --- a/drivers/ata/pata_macio.c
> +++ b/drivers/ata/pata_macio.c
> @@ -1187,7 +1187,7 @@ static int pata_macio_attach(struct macio_dev *mdev,
>  	return rc;
>  }
>  
> -static int pata_macio_detach(struct macio_dev *mdev)
> +static void pata_macio_detach(struct macio_dev *mdev)
>  {
>  	struct ata_host *host = macio_get_drvdata(mdev);
>  	struct pata_macio_priv *priv = host->private_data;
> @@ -1202,8 +1202,6 @@ static int pata_macio_detach(struct macio_dev *mdev)
>  	ata_host_detach(host);
>  
>  	unlock_media_bay(priv->mdev->media_bay);
> -
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/macintosh/rack-meter.c b/drivers/macintosh/rack-meter.c
> index c28893e41a8b..f2f83c4f3af5 100644
> --- a/drivers/macintosh/rack-meter.c
> +++ b/drivers/macintosh/rack-meter.c
> @@ -523,7 +523,7 @@ static int rackmeter_probe(struct macio_dev* mdev,
>  	return rc;
>  }
>  
> -static int rackmeter_remove(struct macio_dev* mdev)
> +static void rackmeter_remove(struct macio_dev *mdev)
>  {
>  	struct rackmeter *rm = dev_get_drvdata(&mdev->ofdev.dev);
>  
> @@ -558,8 +558,6 @@ static int rackmeter_remove(struct macio_dev* mdev)
>  
>  	/* Get rid of me */
>  	kfree(rm);
> -
> -	return 0;
>  }
>  
>  static int rackmeter_shutdown(struct macio_dev* mdev)
> diff --git a/drivers/net/ethernet/apple/bmac.c b/drivers/net/ethernet/apple/bmac.c
> index 9e653e2925f7..292b1f9cd9e7 100644
> --- a/drivers/net/ethernet/apple/bmac.c
> +++ b/drivers/net/ethernet/apple/bmac.c
> @@ -1591,7 +1591,7 @@ bmac_proc_info(char *buffer, char **start, off_t offset, int length)
>  }
>  #endif
>  
> -static int bmac_remove(struct macio_dev *mdev)
> +static void bmac_remove(struct macio_dev *mdev)
>  {
>  	struct net_device *dev = macio_get_drvdata(mdev);
>  	struct bmac_data *bp = netdev_priv(dev);
> @@ -1609,8 +1609,6 @@ static int bmac_remove(struct macio_dev *mdev)
>  	macio_release_resources(mdev);
>  
>  	free_netdev(dev);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id bmac_match[] =
> diff --git a/drivers/net/ethernet/apple/mace.c b/drivers/net/ethernet/apple/mace.c
> index fd1b008b7208..e6350971c707 100644
> --- a/drivers/net/ethernet/apple/mace.c
> +++ b/drivers/net/ethernet/apple/mace.c
> @@ -272,7 +272,7 @@ static int mace_probe(struct macio_dev *mdev, const struct of_device_id *match)
>  	return rc;
>  }
>  
> -static int mace_remove(struct macio_dev *mdev)
> +static void mace_remove(struct macio_dev *mdev)
>  {
>  	struct net_device *dev = macio_get_drvdata(mdev);
>  	struct mace_data *mp;
> @@ -296,8 +296,6 @@ static int mace_remove(struct macio_dev *mdev)
>  	free_netdev(dev);
>  
>  	macio_release_resources(mdev);
> -
> -	return 0;
>  }
>  
>  static void dbdma_reset(volatile struct dbdma_regs __iomem *dma)
> diff --git a/drivers/net/wireless/intersil/orinoco/airport.c b/drivers/net/wireless/intersil/orinoco/airport.c
> index a890bfa0d5cc..276a06cdd1f5 100644
> --- a/drivers/net/wireless/intersil/orinoco/airport.c
> +++ b/drivers/net/wireless/intersil/orinoco/airport.c
> @@ -85,7 +85,7 @@ airport_resume(struct macio_dev *mdev)
>  	return err;
>  }
>  
> -static int
> +static void
>  airport_detach(struct macio_dev *mdev)
>  {
>  	struct orinoco_private *priv = dev_get_drvdata(&mdev->ofdev.dev);
> @@ -111,8 +111,6 @@ airport_detach(struct macio_dev *mdev)
>  
>  	macio_set_drvdata(mdev, NULL);
>  	free_orinocodev(priv);
> -
> -	return 0;
>  }
>  
>  static int airport_hard_reset(struct orinoco_private *priv)
> diff --git a/drivers/scsi/mac53c94.c b/drivers/scsi/mac53c94.c
> index f75928f7773e..42648ca9b8ed 100644
> --- a/drivers/scsi/mac53c94.c
> +++ b/drivers/scsi/mac53c94.c
> @@ -508,7 +508,7 @@ static int mac53c94_probe(struct macio_dev *mdev, const struct of_device_id *mat
>  	return rc;
>  }
>  
> -static int mac53c94_remove(struct macio_dev *mdev)
> +static void mac53c94_remove(struct macio_dev *mdev)
>  {
>  	struct fsc_state *fp = (struct fsc_state *)macio_get_drvdata(mdev);
>  	struct Scsi_Host *host = fp->host;
> @@ -526,11 +526,8 @@ static int mac53c94_remove(struct macio_dev *mdev)
>  	scsi_host_put(host);
>  
>  	macio_release_resources(mdev);
> -
> -	return 0;
>  }
>  
> -
>  static struct of_device_id mac53c94_match[] = 
>  {
>  	{
> diff --git a/drivers/scsi/mesh.c b/drivers/scsi/mesh.c
> index 84b541a57b7b..cd2575b88c85 100644
> --- a/drivers/scsi/mesh.c
> +++ b/drivers/scsi/mesh.c
> @@ -1986,7 +1986,7 @@ static int mesh_probe(struct macio_dev *mdev, const struct of_device_id *match)
>  	return -ENODEV;
>  }
>  
> -static int mesh_remove(struct macio_dev *mdev)
> +static void mesh_remove(struct macio_dev *mdev)
>  {
>  	struct mesh_state *ms = (struct mesh_state *)macio_get_drvdata(mdev);
>  	struct Scsi_Host *mesh_host = ms->host;
> @@ -2013,11 +2013,8 @@ static int mesh_remove(struct macio_dev *mdev)
>  	macio_release_resources(mdev);
>  
>  	scsi_host_put(mesh_host);
> -
> -	return 0;
>  }
>  
> -
>  static struct of_device_id mesh_match[] = 
>  {
>  	{
> diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
> index 13668ffdb1e7..d4640479c338 100644
> --- a/drivers/tty/serial/pmac_zilog.c
> +++ b/drivers/tty/serial/pmac_zilog.c
> @@ -1507,12 +1507,12 @@ static int pmz_attach(struct macio_dev *mdev, const struct of_device_id *match)
>   * That one should not be called, macio isn't really a hotswap device,
>   * we don't expect one of those serial ports to go away...
>   */
> -static int pmz_detach(struct macio_dev *mdev)
> +static void pmz_detach(struct macio_dev *mdev)
>  {
>  	struct uart_pmac_port	*uap = dev_get_drvdata(&mdev->ofdev.dev);
>  	
>  	if (!uap)
> -		return -ENODEV;
> +		return;
>  
>  	uart_remove_one_port(&pmz_uart_reg, &uap->port);
>  
> @@ -1523,11 +1523,8 @@ static int pmz_detach(struct macio_dev *mdev)
>  	dev_set_drvdata(&mdev->ofdev.dev, NULL);
>  	uap->dev = NULL;
>  	uap->port.dev = NULL;
> -	
> -	return 0;
>  }
>  
> -
>  static int pmz_suspend(struct macio_dev *mdev, pm_message_t pm_state)
>  {
>  	struct uart_pmac_port *uap = dev_get_drvdata(&mdev->ofdev.dev);
> diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
> index 51ed2f34b276..35f39727994d 100644
> --- a/sound/aoa/soundbus/i2sbus/core.c
> +++ b/sound/aoa/soundbus/i2sbus/core.c
> @@ -364,15 +364,13 @@ static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id *match)
>  	return 0;
>  }
>  
> -static int i2sbus_remove(struct macio_dev* dev)
> +static void i2sbus_remove(struct macio_dev *dev)
>  {
>  	struct i2sbus_control *control = dev_get_drvdata(&dev->ofdev.dev);
>  	struct i2sbus_dev *i2sdev, *tmp;
>  
>  	list_for_each_entry_safe(i2sdev, tmp, &control->list, item)
>  		soundbus_remove_one(&i2sdev->sound);
> -
> -	return 0;
>  }
>  
>  #ifdef CONFIG_PM
> -- 
> 2.25.1
> 
