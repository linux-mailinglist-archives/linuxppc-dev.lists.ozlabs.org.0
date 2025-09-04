Return-Path: <linuxppc-dev+bounces-11743-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1DAB44002
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 17:09:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHjZP5dTHz301n;
	Fri,  5 Sep 2025 01:09:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756998589;
	cv=none; b=J/WCRRqgE3TYNvVNc+eet9U5AgzFeEp79B/UhgOLKDSv6iiGc7mA8f7H59QOOnMvPF9XOtBndweNx2Xu+opPmbT7yGC3vBhrAdHOfnypYdUS5iGcvOKNQo5F6iOkjteVroyXwdPTrZOCJPZjX1B+pKL1bWBuSOk0/0bR9AT2uMsFyplhrAGyJO/WVRoxF9u0bkZh/jL7x8CGlLUM8OwHILJVqb/4UaeOtnjKQJzJgcV9yuulB54jOdDMfKBHps5OHJYD+lZmO8Rlq08rP+KpoebT5nhVQgI7uKjmek0Od4JR863WkwFCKCH5Gv1FK2vP8zifu73qY4rjMK+2J7PivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756998589; c=relaxed/relaxed;
	bh=lv/2ylIKdLpm7zvJ5Qqymg8oqoGFvzNGNW7NHAl8UGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mXMN4CrsgB7WJYSPq66sIiy26VGJ+UyvQ4GmfGv0yXyUg9+Mdjy8KkCfEMRmVr+PVplrxsYoclViKUpPh6mh49Ag0Rxy6oOe6xI0SG0r0/bdLGEH79Bkz+ZBCQpAh1gTdLIT0yIIdIzteEo5vjCzsOBGuf8k5NFswpcMyBgoFr7hhi5tp0sh3xKl2cC3w+aXXTjONwjjFfdBwQC/s1UZRDzZzY2rfFZp1lCDSQJYgBB/jUk67mNzptS0LJnjx7vc2Ekp2ZvWl2X5RpxaCFiUM1c68x3d5x7QxXllpU553MxJPUnL0WtLYCGa3zkkbiX8eTzHWKKXxfGYYBXX5AuAhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yt2a7Vh9; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yt2a7Vh9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHjZP163rz2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 01:09:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 213F7442E3;
	Thu,  4 Sep 2025 15:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05C6C4CEF0;
	Thu,  4 Sep 2025 15:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756998587;
	bh=PLDQPQbJUUggbx4A+lxi4mlI5cau9Im7SIvtDQOngi4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Yt2a7Vh9WwZr6Kk9GlSPB3iYnUjz9Z4rbp583WTcVYwWlo726mIvj42kZPVV6T83j
	 SC2DpNZfSX+WQs/U1dP6ZolD838uZPNHFMGAHG7H8QM63G08Bgjn0Jii9LWw0bGVhG
	 Mu0iskxKyg/EldYyp7cCmVYq2vsASGEDX+d+NkG+JjDaRZ3q6j0ZDTWsXOpRLmP0Ya
	 V455s0I/MJ3Lm3op+m+fFtz5nkCP/A3ZedrygQ6uw+H2Ra+qWsMNa231jQwi91JHV2
	 VwHsGVxxRQz/B5WVdjSEQLVSHrLKS//6aQewvDRbrVunGIxhXifIPmw3dnhGzKmqdC
	 I9WhLUONVtpeg==
Date: Thu, 4 Sep 2025 10:09:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, Martin Mares <mj@ucw.cz>,
	Terry Bowman <terry.bowman@amd.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>
Subject: Re: [PATCH] PCI/AER: Print TLP Log for errors introduced since PCIe
 r1.1
Message-ID: <20250904150945.GA1262642@bhelgaas>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLkuvb5v4LuVJuyU@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 04, 2025 at 08:16:29AM +0200, Lukas Wunner wrote:
> On Mon, Sep 01, 2025 at 09:44:52AM +0200, Lukas Wunner wrote:
> > +++ b/include/uapi/linux/pci_regs.h
> > @@ -776,6 +776,13 @@
> >  #define  PCI_ERR_UNC_MCBTLP	0x00800000	/* MC blocked TLP */
> >  #define  PCI_ERR_UNC_ATOMEG	0x01000000	/* Atomic egress blocked */
> >  #define  PCI_ERR_UNC_TLPPRE	0x02000000	/* TLP prefix blocked */
> > +#define  PCI_ERR_UNC_POISON_BLK	0x04000000	/* Poisoned TLP Egress Blocked */
> > +#define  PCI_ERR_UNC_DMWR_BLK	0x08000000	/* DMWr Request Egress Blocked */
> > +#define  PCI_ERR_UNC_IDE_CHECK	0x10000000	/* IDE Check Failed */
> > +#define  PCI_ERR_UNC_MISR_IDE	0x20000000	/* Misrouted IDE TLP */
> > +#define  PCI_ERR_UNC_PCRC_CHECK	0x40000000	/* PCRC Check Failed */
> > +#define  PCI_ERR_UNC_XLAT_BLK	0x80000000	/* TLP Translation Egress Blocked */
> > +
> >  #define PCI_ERR_UNCOR_MASK	0x08	/* Uncorrectable Error Mask */
> >  	/* Same bits as above */
> 
> I've realized that I inadvertently introduced a gratuitous blank line here.
> Bjorn, you may want to remove that from commit dab104c81cba on pci/aer.
> My apologies for the inconvenience!

No problem, fixed!

