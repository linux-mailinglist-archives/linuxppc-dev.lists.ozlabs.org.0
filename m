Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5367F3B6D08
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 05:35:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDVVg1gJhz3bZy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 13:35:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tENbx2YG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.237.78; helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=wesley.sheng@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tENbx2YG; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDVV61kRLz302B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 13:35:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPToyWc0zOd5yvSaldLiSQJQJ15pmfxy10k+sbjsVMZ7SGzEgtiEsiiLVGKl1TYCvfx5HU94Dv9wmUR1qQvD57QPZaXi6++ASkK8Uqv+VGAzWngl0Hbf/UbVVICHQs1JeWyFMNWTY6fvCev2QIaa/pfI8/JTToYtM3Cdq0GYjFAxB3KzUEew5+26Io+iXIp6G3G+xWr/Lzm6UaXeoIE0Y90jktZVPoUHjoP3QorFJeyF4YZeZXWYrvq0b0fWUdW5k3sfZWdaTAB6v+Vk5d3xb00SM3G2h0awt6I7npVhhXpKqHtXH/EWqQeDFFWdRXdo6rlYmh+S4z0tNJxU954CkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8et/drsZ/8ewsfmdZr4C0iLIiJPRcBPd+4bhBdwpnIw=;
 b=YsK1XuBdeRoeyLP7Kb/+mEtm0bpMvGIPNNISQeAyPOU/QbPZmqsRSKb8j/RgxdSp5TledAYcJWEW5Xvz0hTLvZNYXJbS0XLYQw9BDIkVJPpy0lvi7dUkyqj0BXghHe67d2S+lLn4ajHXnfVCcGpX68TAvyVEKsMtDAZjzzNNIYw3o3zHqy1EoPm4sa2lIYZ/TmQ7eenKWnREzT8RUdZ1Y7YIl6T85B6jR8yeevaAhFhy3q2tFUO3YQiq33OSfz/66tcZKdO8JuwIUjtHAZEVnQFokfKa5eTEgF2SozM80Ik1ITZJDkFczymTagUPAzZeNpDblX6kay6/hoehQSmO8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8et/drsZ/8ewsfmdZr4C0iLIiJPRcBPd+4bhBdwpnIw=;
 b=tENbx2YGBi1ymrtHu4iLhOEsOKvPSA8nTu9IIEq4YMVRn/2HLgMsctPG9cOdabB6Toq685r6t37rV8fwAOnNWiNQtfg4cTCbsJA1pdvdNN31EHWI9V4Qj6UIKShkIO8hhZPi3/9NS32mHBDwrCxrCmPnR9OZTCpuQGgKSOcwjrs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5357.namprd12.prod.outlook.com (2603:10b6:5:39b::24)
 by DM8PR12MB5415.namprd12.prod.outlook.com (2603:10b6:8:25::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.20; Tue, 29 Jun 2021 03:34:49 +0000
Received: from DM4PR12MB5357.namprd12.prod.outlook.com
 ([fe80::9d97:11b:bb35:d2e6]) by DM4PR12MB5357.namprd12.prod.outlook.com
 ([fe80::9d97:11b:bb35:d2e6%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 03:34:49 +0000
Date: Tue, 29 Jun 2021 11:34:37 +0800
From: Wesley Sheng <wesley.sheng@amd.com>
To: Oliver O'Halloran <oohall@gmail.com>, linasvepstas@gmail.com,
 ruscur@russell.cc, bhelgaas@google.com, corbet@lwn.net,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: PCI: pci-error-recovery: rearrange the
 general sequence
Message-ID: <20210629033437.GB1492@buildhost>
References: <20210618060446.7969-1-wesley.sheng@amd.com>
 <CAOSf1CHaLCAsnB42Je+ynJ6xv-M8qmScbfOLSHVze7D4fEh66Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSf1CHaLCAsnB42Je+ynJ6xv-M8qmScbfOLSHVze7D4fEh66Q@mail.gmail.com>
X-Originating-IP: [165.204.134.244]
X-ClientProxiedBy: HK2PR02CA0148.apcprd02.prod.outlook.com
 (2603:1096:202:16::32) To DM4PR12MB5357.namprd12.prod.outlook.com
 (2603:10b6:5:39b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from buildhost (165.204.134.244) by
 HK2PR02CA0148.apcprd02.prod.outlook.com (2603:1096:202:16::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 03:34:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7367617e-588d-4295-a7a9-08d93aaed908
X-MS-TrafficTypeDiagnostic: DM8PR12MB5415:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB5415677AE4EDF810EDCCEC6E95029@DM8PR12MB5415.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sF7fUv40fNnppXkNiw3HGJEuZcv2bX9Y0xNzyYUtf5tkzTx9UzhGOqQU1EQP/iOswYI3gsZ7fJEF/ZVI4wJsfL1YHuhpQwPj00f7RHqe50dbUSmW/SypdQg3NVui3JP6l4k9dN8CoPEhhVM+0qZfPPt3fiT1x+humi65o6BdYkhO0SGLEGU4j4NTSpqT01uqMXe/GeqBVNYCehapcsojTOtOrIbg2+Z0+ME/zXV23oNBuhwvatxaWV4GmJyYWsEgjEbsx0urOovPA9pcB8FUTPMSIemBgeqd585hI3fQbmvEkeQA4AHZgHNI/fbgm5fuspIMXKWpZORWtUH141z29sLnzt2MYcTEUUebWGwUHyuxfOIkTAVh+MZQ9A51YtDdQhpeKmL3mnztGHH3ynAkITiSGmVfHXxkCIyOB1+/TX14veY5RSqPnfqRByB9JlF7SJ27lCqFrISHKHCPE+qgYUqdXwFEecy6mknYh1AwxHh+hnYLoFAJmqxeOJCRrAibFl2TJNdaGwrDef1++alBR0O/ldb5FbuOv3XtzfD7L6nCZn5SB1MtrgYiHMz40GSrm6HKFnWCDh1y1iAJiA2m8wVenRxqrY1ik+Gi7Fi/ZT2bji3dPVRiP4zxG7vnIyWGam2IfE9UlTK26YNonZE8lmj/X1jeKKZb+NnnIG1ONdtgu0isn+KJQPfDgjomf0SeaH2hgbj/q/GzeUdHDEI2yQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5357.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(316002)(53546011)(66946007)(52116002)(86362001)(66556008)(5660300002)(2906002)(9576002)(33656002)(83380400001)(44832011)(26005)(7416002)(66476007)(478600001)(186003)(33716001)(8936002)(1076003)(8676002)(16526019)(38350700002)(6496006)(9686003)(38100700002)(956004)(6666004)(55016002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JeT6kvfg2oX7l7p/Qe1amfRY2U451W+o+Uz2n51ABR/hxex2/pFInnKMKkWG?=
 =?us-ascii?Q?so0keRqvZG09vETxiPzmtpxE+arFrkVxKDwEZeHTXb4EJDhTFOOntFCRSZR4?=
 =?us-ascii?Q?iJasG7pVCLnXo/72EHO3PMA1NP255k/cBhfF4NQWX/2K0Q3o3peH+fMF9U3V?=
 =?us-ascii?Q?MAC8MXLUo/n6TqXYBJ4ooMuH56nJVoI9t8qRaKy/Uk1X/KNwclZ5TYKrkb5Q?=
 =?us-ascii?Q?RuJSK6KBRW5mA2t+T8DVM/uYqRCrCP/L2moMxHKKC8X9dV7uMjoqK8iQpAQ8?=
 =?us-ascii?Q?BJMFchbuzsEuG8DT+hV3wdR6cu/TGhe46TAy866sn1+p5n+0dUr4a3eu4K73?=
 =?us-ascii?Q?8w7I0chh+ITobg6MMmJPgc+mpd5E5qkZ8Z47MFsr70JBrte0NtId5lZ2YROq?=
 =?us-ascii?Q?yO9h/4fCbMDZAWiPTmlJblGOo8O9FrY4qEzS5xTG0vZJMk2vIkHwyn3VY0QC?=
 =?us-ascii?Q?rGttA2itHwMf0NZDWrX7pKskJPULgZKF+tP4ck4cJmEZWMLoKDRKhLmWao/I?=
 =?us-ascii?Q?i6yJxVyCyTV2szi94zBmu9DPK/XTRerOHDpjagNOXgpOX+vkr8359TdgT1Em?=
 =?us-ascii?Q?/2uLpW2S3Zv6Z/LVeCA/H3Lg02+xiEayCXINfjBuy38KKaC5eVc2aH+G/kF/?=
 =?us-ascii?Q?XBizSIUGBbjwo/XygHUGJj7dFa5bX5+4tTGw+R4Y2WhOrinrOS357PGVgJPx?=
 =?us-ascii?Q?rHTbUsITjdxXj/1J0hnkutLwcteVZ0k0EyO01ytqrrrixF360kRC+v9OBB7A?=
 =?us-ascii?Q?yLOpBlSQzjBJnd+QuqbjpY3sht49bs6S2j/qMDZdeTrT40sVgOF564YLr+Vo?=
 =?us-ascii?Q?lQyIIOf4fC74Bmsx45b2mGyV901bzWdbBmIuN0PY/Mn8GjtWECRW4f2lHVau?=
 =?us-ascii?Q?WOTA7QwmwdJUUidJHcTkWmvuxQnglmgN0sPckfCgtbIuG9itwRioX+XDNdKE?=
 =?us-ascii?Q?LJc/Q4CJ4yCU/CbxyETUYoToSOWZPrhnmPOSyEAtF55zFc+orb1p4LML6F+x?=
 =?us-ascii?Q?a7JkJGYkfwwdhS6vH3DQaSEgpt/pWiydsF1WRINgH2+0dY5LPqpAu0RqBqQH?=
 =?us-ascii?Q?l1RgeUUYLJzKejROUVZafqZGgPCCgp7BRannn5xoQ/qHV5EXPwHVwpa/BpTU?=
 =?us-ascii?Q?ljtAyD0bYC99gZ/8dXW2QCC97fThAVewoKKtQprWu/lUTpt7VBYaI36+oG8G?=
 =?us-ascii?Q?SAfQRt73zoKy/lgm+VAaYQH+4p7X7476DARZc67ddd3qdYH4VL7BUH8uDBbZ?=
 =?us-ascii?Q?g7QtTX0oY7Hkio7ATbrqIX99V8WvZF8Ho0OarIeDpLSBYPKZvVHTTD+f2FYM?=
 =?us-ascii?Q?d6+Rg3mE/JZylWdQva3TKurY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7367617e-588d-4295-a7a9-08d93aaed908
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5357.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 03:34:49.1281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqNcb/AKvTeUtpEGw/GUoAAS8ZClav+S3is9n4Q7W/o7PYIPrsK5bPQGqiMhVwlXy50jOTEVyqAN9cIa0ft4Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5415
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
Cc: wesley.sheng@amd.com, wesleyshenggit@sina.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 18, 2021 at 05:21:32PM +1000, Oliver O'Halloran wrote:
> On Fri, Jun 18, 2021 at 4:05 PM Wesley Sheng <wesley.sheng@amd.com> wrote:
> >
> > Reset_link() callback function was called before mmio_enabled() in
> > pcie_do_recovery() function actually, so rearrange the general
> > sequence betwen step 2 and step 3 accordingly.
> 
> I don't think this is true in all cases. If pcie_do_recovery() is
> called with state==pci_channel_io_normal (i.e. non-fatal AER) the link
> won't be reset. EEH (ppc PCI error recovery thing) also uses
> .mmio_enabled() as described.

Yes, in case of non-fatal AER, reset_link() callback (aer_root_reset() for 
AER and dpc_reset_link() for DPC) will not be invoked. And if 
.error_detected() return PCI_ERS_RESULT_CAN_RECOVER, .mmio_enabled() be
called followed.

But if pcie_do_recovery() is called with state == pci_channel_io_frozen,
reset_link() callback is called after .error_detected() but before
.mmio_enabled(). So I thought Step 2: MMIO Enabled and Step 3: Link Reset
should rearrange their sequence.
