Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8008736C8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 13:41:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=JUv8NE9P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqX9z4Sbcz3vY7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 23:41:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=JUv8NE9P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:2815::801; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=set_pte_at@outlook.com; receiver=lists.ozlabs.org)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn20801.outbound.protection.outlook.com [IPv6:2a01:111:f403:2815::801])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqX994NfGz3cML
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 23:41:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iahnpr9nu8xXlAgDMRjcJbf/tpW4u1N42cN9Pub+sy2UAtpbMaCfPqcczpQSqs1zO16kYIv44UJvOlio7BQgNXTd3ouixMfiUnD8hFi45yHCmhiNBCo2JERcuDRWHjDgqwDXpDDeMnTfV+r/qHiSnweRAnmGjRX/bLs6pfShndVV53zx32PF+S9w6S6HvzpQAlXNM6rNQw4BtaWjcCyT6crWHqcXNRCenwSwKK1gOgacPtJqiuq5C//jlB2ODJU5ZdPwN6yTsTBsem3h+O4v2Jf+KQDu/wr1UeGqAVPbCmW08eP6AhjbzcOldlRLX/QWG7iTTgzu6BxxWjvLUOov7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noGfxLvPbxnLpweiggOKmItIhD1pkDaIxw+XTK+txfs=;
 b=B+kZ2riVHA4zNthp4Zd3f9zpKQDcPfF0dittCohn34uhACNERnk0kxUVtIZct4+v3t5PFURcG65ZfeB8zFPjYAKLKSmCtXIBsfsigFQxteOslBWRRbrjsT4Ahj2gb107Q+K78pCV1NAbRIb5dJxvwn+AnuFVWoYmprCBSub640Hp6WuDGrDkEGVsBZiDeXOrVzGlql+wt3WbnJumkoadQO1TrHkWHIzIkFkPnABmKNrDgn64KcIboDQ15Ehpps/OoSG79VH0RaQaK4DsAd6rojJ9sQfPIwrt1VR0wpNUqwFCe779zdKkuIh6qFEF2C1lEgIW9NTWQ+6vurEudefmng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noGfxLvPbxnLpweiggOKmItIhD1pkDaIxw+XTK+txfs=;
 b=JUv8NE9PAr63q9zXlRzBBSX78JZDrAA1GuvqKtVMvmlkkwe4oePg5egBVwSMdIaOUl1dJKo2wxrDV/F0UkSdc27DYjB/53kxOLh9KBsicmCt1wOwvw/I+FcbNCpbL2n9wyaRAY4RY8S3K5vDX8osZafqdR6KtNF0cDDXQ+DJzZlWGmASVWUCH2XZmsZf9nyT7ToM5wHn9zEwqgSEq0ZdTOxGMugn52aH5tBDLiLtlfe2UnlyeRrggJ4lZEcb3EuLSv7W+VScVxl8qmBiViJf/di2DNkcaimGwZEG4Zv3YkoIqKEYSGHDrDu5SdYHjtNP1LAdrviz9xSw9XedGN+W9Q==
Received: from TYTP286MB3564.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:39d::8)
 by TYCP286MB2880.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:307::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 12:40:40 +0000
Received: from TYTP286MB3564.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8e48:6e1:f641:32b1]) by TYTP286MB3564.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8e48:6e1:f641:32b1%7]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 12:40:40 +0000
Date: Wed, 6 Mar 2024 20:40:37 +0800
From: Dawei Li <set_pte_at@outlook.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc: macio: Make remove callback of macio driver
 void returned
Message-ID:  <TYTP286MB356472357994D5EA49E2F5E3CA212@TYTP286MB3564.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB232391520CB471E7C8D6EA84CAD19@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
 <3dc29701-239f-4a3b-b571-b9732975bd73@csgroup.eu>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3dc29701-239f-4a3b-b571-b9732975bd73@csgroup.eu>
X-TMN: [Nh3sQUEUbpxaXXOwSoNdFxws6+REaLee]
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To TYTP286MB3564.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:39d::8)
X-Microsoft-Original-Message-ID: <20240306124037.GA2466@wendao-VirtualBox>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYTP286MB3564:EE_|TYCP286MB2880:EE_
X-MS-Office365-Filtering-Correlation-Id: e92084cb-eb20-4297-f73d-08dc3ddaa149
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mNc3gDI7HEWYdy9uSOU+QAsWz8a8yzdnHZUuW0hgIEFIhZdB1s9jv26Oq0ZqmY5ZLARFZwg04jDk1WGNH8NkJEld29lX9gd5eLAAVOuWNNG7fdCxIrVgT3/JCZst3sipPGfokCSOM7jaZMfGJKQlr1NzLkp32am3M8boXDQwgjZz49dnO62sDWrhlWfpkhM7h00NL4kw+lGuK9Xm93TLWY8WEEId5u4iXH+LDIzFyaz8YHr1L4yt1sIr8SutLJVsz9DJJStLYuDZJW5T/nve5zh3ocTXqzUG1AWfB63WQj2V3wlQ8IEh//ShvaJVPwBPsIoZYcUZ/zvBNTBSunLX0cJZ5gitHmg2kFJ/hqFMtPmQ/ibbYzAYSeB6l6DQyTECnhKFGmmanHFaLqwHm4hMU9cBB6qzwBjVF6xjhzh6zoXoMb2SIpQ/O+4RkpgYynMQ2MPePT0C5c9JKUQoSby4LydssNGeDYAEfTrlTiOCqM+SHO4oxzGOyDcTMc12NDj+3CTO2VxbRpZZ/2zv4gQ6np4tDXdMNI7uJ7LWlT12rLfTIodgsoSzwgsIr8kQoi+N2tJkj4dH8Yj7rvf3w7SD9ruQvxMs8HInTgoqSsJwa6g=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?iso-8859-1?Q?T3Bo20pNCVM2OdvWX1Y++BEykzr2r0JSnpquix8IRRlylEZKyKslXMz3Dh?=
 =?iso-8859-1?Q?l7ZqGjwcL+MYCZACLmjxL+XKAQ/XoviitNZNqVUvrXP69maYJ5ldANjjUp?=
 =?iso-8859-1?Q?++4YADg+7Cqf6JPDiIjon8rOA5pHUphKaSPkx9GPZh/rLs38yipE8fkoor?=
 =?iso-8859-1?Q?zJJdbdlJkSkekolM4LJ5BO+gSxs2iTsP3kyFZpSStHaDQCx0E8BTNv5ACj?=
 =?iso-8859-1?Q?F1YN9WKsYlxSjmaXo7VIrBq5DnHbiPCSmGfkg9UOA+5j+wZNkX7w8t6pT2?=
 =?iso-8859-1?Q?crWl4/3XgurxpygHqt9y2zczfAnp9NZRIr45V9b+C8Ih39VOQtmbhzq7Gh?=
 =?iso-8859-1?Q?fRNvFrUZAWU2wVflo06HLS5Qpk/xhwkMI5/3rWi/oMgioa3z5X8mf73BsK?=
 =?iso-8859-1?Q?kbxHAY0vRL/JEROEiO2UDoIxykU88cGOHanNqszWD6uofEmkcrGAM8m4PB?=
 =?iso-8859-1?Q?7otg6a1vGrNarOcbS76vvtNVaNjo09Cl7Qw7pL+AZLPxyIH/EqAUqR89Bf?=
 =?iso-8859-1?Q?HQl0vOfS2zReuq9/FsdCQZeK6zXoIs0u7lo7iFYQ+bR4WkjUE6Mq8Aab6g?=
 =?iso-8859-1?Q?pGShwur+nivRhHVxNEhQXawbd1z8vyrN5quEFYKM3csatteI47HFVNql/q?=
 =?iso-8859-1?Q?7mHHcdariX+awiuQ4BAPE4B77uAJQtX648PON79sl+w1ut4/9kpKX8shQV?=
 =?iso-8859-1?Q?gban8X7jSh8Keeut+VnR3ulE3lfk1lPbmIFeSr3lKxHEm4PETSTM2ZZK+v?=
 =?iso-8859-1?Q?fqtCHBul6Grdv4JPE+0NuB/cMrcsEVcvKDwm30hwBKgYxLNqZ+jWWDPvYn?=
 =?iso-8859-1?Q?SuF0/CE+J54+FQsqeM6iASN2DLhQ/UFW3RqalQNc89tCSGbjCnqh+uhklN?=
 =?iso-8859-1?Q?rUglgKqfTMqxK4paxyTABCqdfdifbqZ3cYBen0RuGRdJZn34zPO6jZDbXF?=
 =?iso-8859-1?Q?/qsZijOAPafP/I3vXmWeCOpOFMX/UOeAdyUxaeYstd0Hx9ZHX7fIh9msRL?=
 =?iso-8859-1?Q?CJ9XuSctLnYpI0utaadlrciAtyFULAYTIiEXG+DxB2fwqCRvfgae3YV1dd?=
 =?iso-8859-1?Q?mHJ9G3WW8FynLgqU99AEXGSLXVkJFjNbbVfFIiVvZoWGTbU6jYHTHHFtML?=
 =?iso-8859-1?Q?YmhEKlebmYaQav4vv5uTtfC++eO+BreSW2q2oaTYB6KahwgAleswsMtA34?=
 =?iso-8859-1?Q?b08Bii8M4pDE3o7LjS2H/t6YND1T5Pwi7pBsEVMkTFJbR7cb/YaoBxSSgR?=
 =?iso-8859-1?Q?YkgcLS2e5+Wbwa1p78NkwRvmE7q3GbFdtp2gym+V0=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e92084cb-eb20-4297-f73d-08dc3ddaa149
X-MS-Exchange-CrossTenant-AuthSource: TYTP286MB3564.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 12:40:40.2608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2880
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Tue, Feb 20, 2024 at 04:12:17PM +0000, Christophe Leroy wrote:
> Hi Michael,
> 
> ping ?
> 
> Le 01/02/2023 à 15:36, Dawei Li a écrit :
> > Commit fc7a6209d571 ("bus: Make remove callback return void") forces
> > bus_type::remove be void-returned, it doesn't make much sense for any
> > bus based driver implementing remove callbalk to return non-void to
> > its caller.
> > 
> > This change is for macio bus based drivers.
> > 
> > Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> 
> This patch is Acked , any special reason for not applying it ?
> 
> Note that it now conflicts with commit 1535d5962d79 ("wifi: remove 
> orphaned orinoco driver") but resolution is trivial, just drop the 
> changes to that file.

Thanks for picking it up, hardly believe that it's been one year.

Michael,

I will respin V4 if it's needed.

Thanks,

   Dawei

> 
> Christophe
> 
> > ---
> > v2 -> v3
> > - Rebased on latest powerpc/next.
> > - cc' to relevant subsysem lists.
> > 
> > v1 -> v2
> > - Revert unneeded changes.
> > - Rebased on latest powerpc/next.
> > 
> > v1
> > - https://lore.kernel.org/all/TYCP286MB2323FCDC7ECD87F8D97CB74BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/
> > ---
> >   arch/powerpc/include/asm/macio.h                | 2 +-
> >   drivers/ata/pata_macio.c                        | 4 +---
> >   drivers/macintosh/rack-meter.c                  | 4 +---
> >   drivers/net/ethernet/apple/bmac.c               | 4 +---
> >   drivers/net/ethernet/apple/mace.c               | 4 +---
> >   drivers/net/wireless/intersil/orinoco/airport.c | 4 +---
> >   drivers/scsi/mac53c94.c                         | 5 +----
> >   drivers/scsi/mesh.c                             | 5 +----
> >   drivers/tty/serial/pmac_zilog.c                 | 7 ++-----
> >   sound/aoa/soundbus/i2sbus/core.c                | 4 +---
> >   10 files changed, 11 insertions(+), 32 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/macio.h b/arch/powerpc/include/asm/macio.h
> > index ff5fd82d9ff0..cb9c386dacf8 100644
> > --- a/arch/powerpc/include/asm/macio.h
> > +++ b/arch/powerpc/include/asm/macio.h
> > @@ -125,7 +125,7 @@ static inline struct pci_dev *macio_get_pci_dev(struct macio_dev *mdev)
> >   struct macio_driver
> >   {
> >   	int	(*probe)(struct macio_dev* dev, const struct of_device_id *match);
> > -	int	(*remove)(struct macio_dev* dev);
> > +	void	(*remove)(struct macio_dev *dev);
> >   
> >   	int	(*suspend)(struct macio_dev* dev, pm_message_t state);
> >   	int	(*resume)(struct macio_dev* dev);
> > diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
> > index 9ccaac9e2bc3..653106716a4b 100644
> > --- a/drivers/ata/pata_macio.c
> > +++ b/drivers/ata/pata_macio.c
> > @@ -1187,7 +1187,7 @@ static int pata_macio_attach(struct macio_dev *mdev,
> >   	return rc;
> >   }
> >   
> > -static int pata_macio_detach(struct macio_dev *mdev)
> > +static void pata_macio_detach(struct macio_dev *mdev)
> >   {
> >   	struct ata_host *host = macio_get_drvdata(mdev);
> >   	struct pata_macio_priv *priv = host->private_data;
> > @@ -1202,8 +1202,6 @@ static int pata_macio_detach(struct macio_dev *mdev)
> >   	ata_host_detach(host);
> >   
> >   	unlock_media_bay(priv->mdev->media_bay);
> > -
> > -	return 0;
> >   }
> >   
> >   #ifdef CONFIG_PM_SLEEP
> > diff --git a/drivers/macintosh/rack-meter.c b/drivers/macintosh/rack-meter.c
> > index c28893e41a8b..f2f83c4f3af5 100644
> > --- a/drivers/macintosh/rack-meter.c
> > +++ b/drivers/macintosh/rack-meter.c
> > @@ -523,7 +523,7 @@ static int rackmeter_probe(struct macio_dev* mdev,
> >   	return rc;
> >   }
> >   
> > -static int rackmeter_remove(struct macio_dev* mdev)
> > +static void rackmeter_remove(struct macio_dev *mdev)
> >   {
> >   	struct rackmeter *rm = dev_get_drvdata(&mdev->ofdev.dev);
> >   
> > @@ -558,8 +558,6 @@ static int rackmeter_remove(struct macio_dev* mdev)
> >   
> >   	/* Get rid of me */
> >   	kfree(rm);
> > -
> > -	return 0;
> >   }
> >   
> >   static int rackmeter_shutdown(struct macio_dev* mdev)
> > diff --git a/drivers/net/ethernet/apple/bmac.c b/drivers/net/ethernet/apple/bmac.c
> > index 9e653e2925f7..292b1f9cd9e7 100644
> > --- a/drivers/net/ethernet/apple/bmac.c
> > +++ b/drivers/net/ethernet/apple/bmac.c
> > @@ -1591,7 +1591,7 @@ bmac_proc_info(char *buffer, char **start, off_t offset, int length)
> >   }
> >   #endif
> >   
> > -static int bmac_remove(struct macio_dev *mdev)
> > +static void bmac_remove(struct macio_dev *mdev)
> >   {
> >   	struct net_device *dev = macio_get_drvdata(mdev);
> >   	struct bmac_data *bp = netdev_priv(dev);
> > @@ -1609,8 +1609,6 @@ static int bmac_remove(struct macio_dev *mdev)
> >   	macio_release_resources(mdev);
> >   
> >   	free_netdev(dev);
> > -
> > -	return 0;
> >   }
> >   
> >   static const struct of_device_id bmac_match[] =
> > diff --git a/drivers/net/ethernet/apple/mace.c b/drivers/net/ethernet/apple/mace.c
> > index fd1b008b7208..e6350971c707 100644
> > --- a/drivers/net/ethernet/apple/mace.c
> > +++ b/drivers/net/ethernet/apple/mace.c
> > @@ -272,7 +272,7 @@ static int mace_probe(struct macio_dev *mdev, const struct of_device_id *match)
> >   	return rc;
> >   }
> >   
> > -static int mace_remove(struct macio_dev *mdev)
> > +static void mace_remove(struct macio_dev *mdev)
> >   {
> >   	struct net_device *dev = macio_get_drvdata(mdev);
> >   	struct mace_data *mp;
> > @@ -296,8 +296,6 @@ static int mace_remove(struct macio_dev *mdev)
> >   	free_netdev(dev);
> >   
> >   	macio_release_resources(mdev);
> > -
> > -	return 0;
> >   }
> >   
> >   static void dbdma_reset(volatile struct dbdma_regs __iomem *dma)
> > diff --git a/drivers/net/wireless/intersil/orinoco/airport.c b/drivers/net/wireless/intersil/orinoco/airport.c
> > index a890bfa0d5cc..276a06cdd1f5 100644
> > --- a/drivers/net/wireless/intersil/orinoco/airport.c
> > +++ b/drivers/net/wireless/intersil/orinoco/airport.c
> > @@ -85,7 +85,7 @@ airport_resume(struct macio_dev *mdev)
> >   	return err;
> >   }
> >   
> > -static int
> > +static void
> >   airport_detach(struct macio_dev *mdev)
> >   {
> >   	struct orinoco_private *priv = dev_get_drvdata(&mdev->ofdev.dev);
> > @@ -111,8 +111,6 @@ airport_detach(struct macio_dev *mdev)
> >   
> >   	macio_set_drvdata(mdev, NULL);
> >   	free_orinocodev(priv);
> > -
> > -	return 0;
> >   }
> >   
> >   static int airport_hard_reset(struct orinoco_private *priv)
> > diff --git a/drivers/scsi/mac53c94.c b/drivers/scsi/mac53c94.c
> > index f75928f7773e..42648ca9b8ed 100644
> > --- a/drivers/scsi/mac53c94.c
> > +++ b/drivers/scsi/mac53c94.c
> > @@ -508,7 +508,7 @@ static int mac53c94_probe(struct macio_dev *mdev, const struct of_device_id *mat
> >   	return rc;
> >   }
> >   
> > -static int mac53c94_remove(struct macio_dev *mdev)
> > +static void mac53c94_remove(struct macio_dev *mdev)
> >   {
> >   	struct fsc_state *fp = (struct fsc_state *)macio_get_drvdata(mdev);
> >   	struct Scsi_Host *host = fp->host;
> > @@ -526,11 +526,8 @@ static int mac53c94_remove(struct macio_dev *mdev)
> >   	scsi_host_put(host);
> >   
> >   	macio_release_resources(mdev);
> > -
> > -	return 0;
> >   }
> >   
> > -
> >   static struct of_device_id mac53c94_match[] =
> >   {
> >   	{
> > diff --git a/drivers/scsi/mesh.c b/drivers/scsi/mesh.c
> > index 84b541a57b7b..cd2575b88c85 100644
> > --- a/drivers/scsi/mesh.c
> > +++ b/drivers/scsi/mesh.c
> > @@ -1986,7 +1986,7 @@ static int mesh_probe(struct macio_dev *mdev, const struct of_device_id *match)
> >   	return -ENODEV;
> >   }
> >   
> > -static int mesh_remove(struct macio_dev *mdev)
> > +static void mesh_remove(struct macio_dev *mdev)
> >   {
> >   	struct mesh_state *ms = (struct mesh_state *)macio_get_drvdata(mdev);
> >   	struct Scsi_Host *mesh_host = ms->host;
> > @@ -2013,11 +2013,8 @@ static int mesh_remove(struct macio_dev *mdev)
> >   	macio_release_resources(mdev);
> >   
> >   	scsi_host_put(mesh_host);
> > -
> > -	return 0;
> >   }
> >   
> > -
> >   static struct of_device_id mesh_match[] =
> >   {
> >   	{
> > diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
> > index 13668ffdb1e7..d4640479c338 100644
> > --- a/drivers/tty/serial/pmac_zilog.c
> > +++ b/drivers/tty/serial/pmac_zilog.c
> > @@ -1507,12 +1507,12 @@ static int pmz_attach(struct macio_dev *mdev, const struct of_device_id *match)
> >    * That one should not be called, macio isn't really a hotswap device,
> >    * we don't expect one of those serial ports to go away...
> >    */
> > -static int pmz_detach(struct macio_dev *mdev)
> > +static void pmz_detach(struct macio_dev *mdev)
> >   {
> >   	struct uart_pmac_port	*uap = dev_get_drvdata(&mdev->ofdev.dev);
> >   	
> >   	if (!uap)
> > -		return -ENODEV;
> > +		return;
> >   
> >   	uart_remove_one_port(&pmz_uart_reg, &uap->port);
> >   
> > @@ -1523,11 +1523,8 @@ static int pmz_detach(struct macio_dev *mdev)
> >   	dev_set_drvdata(&mdev->ofdev.dev, NULL);
> >   	uap->dev = NULL;
> >   	uap->port.dev = NULL;
> > -	
> > -	return 0;
> >   }
> >   
> > -
> >   static int pmz_suspend(struct macio_dev *mdev, pm_message_t pm_state)
> >   {
> >   	struct uart_pmac_port *uap = dev_get_drvdata(&mdev->ofdev.dev);
> > diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
> > index 51ed2f34b276..35f39727994d 100644
> > --- a/sound/aoa/soundbus/i2sbus/core.c
> > +++ b/sound/aoa/soundbus/i2sbus/core.c
> > @@ -364,15 +364,13 @@ static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id *match)
> >   	return 0;
> >   }
> >   
> > -static int i2sbus_remove(struct macio_dev* dev)
> > +static void i2sbus_remove(struct macio_dev *dev)
> >   {
> >   	struct i2sbus_control *control = dev_get_drvdata(&dev->ofdev.dev);
> >   	struct i2sbus_dev *i2sdev, *tmp;
> >   
> >   	list_for_each_entry_safe(i2sdev, tmp, &control->list, item)
> >   		soundbus_remove_one(&i2sdev->sound);
> > -
> > -	return 0;
> >   }
> >   
> >   #ifdef CONFIG_PM
