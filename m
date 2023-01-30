Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE5C681387
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 15:40:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P59nv5SVjz3c9r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 01:40:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=QN9/nfeK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=40.92.107.91; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=set_pte_at@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=QN9/nfeK;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01olkn2091.outbound.protection.outlook.com [40.92.107.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P59mw2vqGz3bYW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 01:39:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWhI4Uf5uH/9rHeMmMlXlSExq/WrrHILWzFEoA6Xy+3N/Y+Li5unoZFIVAyLseaVEZCiIDQnD2+5BIbPjUTyv9CrePcHrRF/90kRcO/6b9bu7RkkhedAEfgDnSIzgX3ZLKZl9XROGZ5hOuWgLalmLOQo4zBqxuFvCInnip3e3GoqyfEEaooM6P4dstQ/SuYosQtGhBs/g28cZ8lJR9X+mRJxISTDJiMfoJi351UOrv4UGqKNve6elgdvKNsJA1QpiVO8kft5HYrrY9yLLo91frcpN1cFVnYkonaRnvP7BIzv9cCNfcfIe6UfSKPYCafJmPnh74Il/3NTwVTR8VKcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeMLtdKS7l4svY/92vs/ghe1tScsOpL+kgrmvys0OsU=;
 b=GF706xO2tFKvkbveJ9rvOyRc21Hn30S/DnH20BGpVRibxPGj62bgcJEa+22J6F6rAq30E2wJGrkjetE3a72QifpYZwoR+1GFhpMPMm9AUj8HUij56T0zmfm31PWICIshdJJAuLeNX65BGRRipLp0kOdqcwyCGQnKpxxkiIIvUNCwUbhPyFi1ecCOfkxJBCRioZpgVZ7A79V4LkwvcsLe5X8WVJ/Nba3zVHrgR52eOmcMpOsFUG2w/1+m2h75o44+4ixMyh5Iajj78jwueLXB6JS0GqCSILpBXyeAwsvStywxBgY6VrLjCnYNsiXx0WR2afxmxw3uuVNy/f0KmvSBAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeMLtdKS7l4svY/92vs/ghe1tScsOpL+kgrmvys0OsU=;
 b=QN9/nfeKNQq8/3yPAgyrcu7EEJK0UCFdw2Qwu3q+2X46xXglsYBJCAScTFow03lYaHJNO7m23IQY6Ftqbk2qYn/yiU49Onp/l6UbiF/E8sKkQHZ5PhbrJ23i2JfX1yJ3r0Z10+DYj3Sw7H+toTndevYovzd7FcuSGTNsIDUVDHEq6NcGW09cSbxD2MMQCLpXUIw9wGSkRVa/8Izp6XwlDIK+PzoihBZRyWXtLqKxtWUvou0zbd4qlZmnVogQsTE0Bt2p1JQx64Zz6kJRxSAdjnds7PLmGlIQpAAqGzklejGAlATRhZ8nxTskH0FcAbzPBwfBF9kL7+oZUvD18kMxxA==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TY3P286MB3513.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 14:39:06 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::82ce:8498:c0e9:4760]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::82ce:8498:c0e9:4760%9]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 14:39:06 +0000
Date: Mon, 30 Jan 2023 22:39:03 +0800
From: Dawei Li <set_pte_at@outlook.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: macio: Make remove callback of macio driver
 void returned
Message-ID:  <TYCP286MB2323A8880DE1D1EDFCF58F05CAD39@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
References: <TYCP286MB2323FA245F0C35C5D7486CC9CAC09@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
 <87sffssk5g.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sffssk5g.fsf@mpe.ellerman.id.au>
X-TMN: [08x5AsdShh7yieTERUdEwOEcuZaOF758]
X-ClientProxiedBy: TY2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:404:42::25) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID: <20230130143903.GA54208@wendao-VirtualBox>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TY3P286MB3513:EE_
X-MS-Office365-Filtering-Correlation-Id: 265e8c20-47a7-44c4-d0ab-08db02cfbd1d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+1z1Tt2Vaku7XAL6cTxptickbYZ5pcc+3VYnxEkRasqNWQBIIUiUijsaCsm5bposohywsp+Kvfr/24fa7Q7XEiaE2nFZ9hRd5iYQhpAYhf1CMTsOACiKRnBr7H2YL+8ig1Az4ejl96aUeGHEZy6krKzbWKd+MKRI94pMmilRfjR9eyI8WJoZnc+/1pEos8wu7Nwtj17G8JNI+3COSEDr8tEB89FgwguAJxUg+t5+RmVcflSsdBdNj/jZFrWGiYLvlPurcwP/bOnFQcmYDfh528Y5BZ/ykyM9VYWIfjoRTyffsV/ywd8L1PTwFAy2cRN7NOz3X1wMslT3CG3TDp08+jNx0Ne5kV8i9rDvw34jYmv4D/4ekyoaDD46KEoRDf/HnZa1nN4Z5cxdU/3yrtl7crQ0BoXTVc8JSnETaCrvPMUF9dYJS7YOuisYVzUfPQpmExWEQablS2NAwQKMvSFuEVlyFmNBIgxw+u4BYTNJWjU8Md278amz+jHmWESTquxkFtHZ4IvSLaKDuByWuP6dItiaWuGVNnZVnq8ijd4LyXu5Pw/9Gmq0TBXpkEfT+9rJB/CkZzOQFoJ1V5SoGFOojDwkGXe90vvqDr1PVfF6DWn3Hdb53GsCRVSDj4gc905bmhj49xVJTOwCa6Cg6jE3Cw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ZLXEzZ1ufmT80KiR8PMjrnJccn5gsphaH1p5Ug2mflJ24oCt0tmlFtsjXRQo?=
 =?us-ascii?Q?+ZQ7zz4zx+S82QlazAojaZxu3Q6scHARnTiYEjtINBX/pwvVZ3J7AYAEUiDL?=
 =?us-ascii?Q?uiC3uthSx0tFSMGt0PqVESKWGaTV5v1JR1vDa88GORBRpYvrmCZ4QO8G73QV?=
 =?us-ascii?Q?srmqF8E9SUGjUiBzG8MkAGW+iib4XgbIsTalktPXf2XIAdxHWonNMX2OW/Hf?=
 =?us-ascii?Q?ncRsvKJ58Bc3iEJtql4svwpkDgFyxWsxqx/j0sQ5g1bdvHAyKQGHw8beOoK7?=
 =?us-ascii?Q?VUKeULqLSmH8fKang5vrpzmWfWv1/Xtyjsph9tlVGonDmM3aIicSzJtc4Env?=
 =?us-ascii?Q?kHaHc+lvILlNoUvKIlXAIn/2wdVwKU99THLJ04yHbDohw7wC4nb3SwT8kDMB?=
 =?us-ascii?Q?v2XiqFsdAVetzPgc94hu2IYwnId+ZhSCJ8/XqZ38xPD7mZ7yZVT5hA9gcLvW?=
 =?us-ascii?Q?DIRlojMVIIwAgerJuBPl2pidC30fPi7WmfKg60pDW+hpQ2s5mcfjeDwelsBp?=
 =?us-ascii?Q?7lA8w+UZ7XPHOECYYyQSoTj22UJ0ZD5KdVvCx08BvIuguMgql75IuGNxOrWN?=
 =?us-ascii?Q?AFUR00VbqGUOCSFgi58TM4/6KRIBv307THz7wjlTxhG5QdYIcMhV46zyFhIz?=
 =?us-ascii?Q?JNJtLguEDXQKPcQp8ECGsiSbRTQFo5pQLmUN2MYpC2F/1TPRJUtwF+ae2rrm?=
 =?us-ascii?Q?i3+F4JcNt8S0d/xjgUKGnE8LOHMA2191OifeGw0Ivp5qTGX0LADQseZuEE8/?=
 =?us-ascii?Q?0X2IHCeuM7OEOeW7OAIuI9sexitDkxlTn1KwVk10w3gp1iO4PX6PfDwm6mnX?=
 =?us-ascii?Q?fvwXjpG93vKrwF+lwBAuEjpggChyv7Tci5LicspxlkGXQb5flqG4N6xJqqEK?=
 =?us-ascii?Q?761OHL0yv0SI6tq4buHp2OQp2Q6eGst9nVg3hZlIda8YG2cyZ7QENYpWSurr?=
 =?us-ascii?Q?9P0xYrkA9oEgO2g2K5wnoui/uXkZJIHjpsJoRA8Nwow/CeXLJZxVtXgVpYKd?=
 =?us-ascii?Q?Qo031GD1PIGNZ8hafOKURlUZYgm03SKslQ6DQww7ezI7M20LRy8qs21IGfDA?=
 =?us-ascii?Q?VerkA5Gcw1hWDCif3nwQrJRO6GrZfo2Y9nOGA2YKeYbIAs6smkvxO6+qqXiQ?=
 =?us-ascii?Q?nWDTYrVpWJhJ+yQY27vbvACLHHaBGeFHAUY0/iQkzKN+4FzAzB6CwPCAgTbo?=
 =?us-ascii?Q?MBlaJE+zbqMODqNZgmezpkIMnlRz9UzH524iTVWLVa8yqop0G0nPZTh/fbSI?=
 =?us-ascii?Q?cTbwAx2gyeusS0ibQ+rURhdmmcZCgkFAFuTp5DEmsg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265e8c20-47a7-44c4-d0ab-08db02cfbd1d
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 14:39:05.9890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB3513
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Thanks for reviewing,

On Mon, Jan 30, 2023 at 03:47:55PM +1100, Michael Ellerman wrote:
> Dawei Li <set_pte_at@outlook.com> writes:
> > Commit fc7a6209d571 ("bus: Make remove callback return void") forces
> > bus_type::remove be void-returned, it doesn't make much sense for any
> > bus based driver implementing remove callbalk to return non-void to
> > its caller.
> >
> > This change is for macio bus based drivers.
> >
> > Signed-off-by: Dawei Li <set_pte_at@outlook.com>
> > ---
> > v1 -> v2
> > - Revert unneeded changes.
> > - Rebased on latest powerpc/next.
> >
> > v1
> > - https://lore.kernel.org/all/TYCP286MB2323FCDC7ECD87F8D97CB74BCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/
> > ---
> >  arch/powerpc/include/asm/macio.h                | 2 +-
> >  drivers/ata/pata_macio.c                        | 4 +---
> >  drivers/macintosh/rack-meter.c                  | 4 +---
> >  drivers/net/ethernet/apple/bmac.c               | 4 +---
> >  drivers/net/ethernet/apple/mace.c               | 4 +---
> >  drivers/net/wireless/intersil/orinoco/airport.c | 4 +---
> >  drivers/scsi/mac53c94.c                         | 5 +----
> >  drivers/scsi/mesh.c                             | 5 +----
> >  drivers/tty/serial/pmac_zilog.c                 | 7 ++-----
> >  sound/aoa/soundbus/i2sbus/core.c                | 4 +---
> >  10 files changed, 11 insertions(+), 32 deletions(-)
> 
> I realise the patch has to be merged via a single subsystem, and powerpc
> is probably the most appropriate, but please Cc the relevant lists for
> the drivers touched.

Copy that. Relevant lists will be cc'ed in v3.

Thanks,
        Dawei 
> 
> AFAICS neither this version or v1 was Cc'ed to relevant lists, eg.
> netdev, linux-wireless, linux-scsi, alsa-devel etc.
> 
> cheers
