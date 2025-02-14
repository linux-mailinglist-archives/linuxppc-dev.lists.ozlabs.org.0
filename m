Return-Path: <linuxppc-dev+bounces-6202-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6977A366FD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 21:37:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvkPS6HQhz2yYJ;
	Sat, 15 Feb 2025 07:37:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739565436;
	cv=none; b=BGmIv5iYmRCUAUw252wMAHJgULnolRfkEysZzw7UD1vd5N4aM+yzHr6cLRTZlgxGgzI4AMkFfHFMEqbDvgGquSBtYa/UKD0IDYRK8ac2sLpLu5ET/A3nyOKrrdAQD0WeeMm3gI4ezkzwlRLiN26g7wEN8R73Ppv/v6RGeC59MKT+GC60uaeZz3cn55u3AwIyOiAm1Abx89Ty/e3u+qEcUfzGImSBOjjMiKXe6WkhwDvRAssTjwQ8MihAslt/rWSvYPT8hBzdEanN/WTBMlIKT+Mo/oKOv4DtXiNvRQYA7o2jyAhYBk25NYnstwd1rJgMnHVsZKpu22yL4zt56zqPsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739565436; c=relaxed/relaxed;
	bh=uB62k1mjkzaZvDUA6Ksm6VdxNsaub1DVxfgkG/1Y7SY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KLIXgw+Ga9YqxZb4W4GvJg+6j1y6Rwv8CXEPq7Crd9Flb2b/C9xwUF2hGcjGQNkqZM+3vzI11UaJbLA9Jy28akkoWoeDBcYlunqfmhKx+Pp0E/Q/6QB+zWTq0CZPxCOsEHbl2855/b1pu0J7naxtAvb97s4wIWWrsA+8Do1i+YknPsQ1ObIYIHUSFP1eF6VgfYl652pb7cWYi63FObZTcgV1za3zvhWsUePLhlC2N0ru32Cbgi/L1Mwx8SjIYj5qHqRtL7bWSu7wc2nkXHXG6NjAnyvtGgMU8AO5BtmW6oQDVY3+yZHW9OG07N1sfSd/+ijGsVVixPs6GXXe7loLWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hMdBlqwG; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hMdBlqwG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvkPR5fwQz2yXs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 07:37:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADF695C596E;
	Fri, 14 Feb 2025 20:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CB2C4CED1;
	Fri, 14 Feb 2025 20:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739565432;
	bh=/LU7fG6fgTEGf5K0K6dF6/L6VDooN37auBZ/6PWAfYU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hMdBlqwGc2H7N1TnwmMXRJNYx0EIanM22MVTDYCeJeX3jw7QlBu6+XuTTgpBrdEIO
	 51F1leCo+ow8sLbKMoFmAsx26twOKBpYcbhtLngAxHMQgQDUNzwoACUJTx8AaqKpUc
	 ocoRt7DK/PQ+T85TnRKutoXYL0JMLHjqzRYQnFwA6KhjMK4j6XMAVkOQQfmvf3ybhg
	 vwB+nZ4E5XxNBAesc4x0fBj5bD+38hy85Mu4WERGSaNhtxt4XheGjw6kpo/I4bg8zJ
	 B7QC1rV8MXrSwUTf66UxopOaM02v36cFMxhUdZAcbTtvRwzfapEtxcizzgw1d1nYVT
	 D4U3M0tfHIPIg==
Date: Fri, 14 Feb 2025 14:37:10 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] PCI: Descope pci_printk() to aer_printk()
Message-ID: <20250214203710.GA162892@bhelgaas>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91014487-c584-af8c-9810-48291a16b643@linux.intel.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 14, 2025 at 01:56:47PM +0200, Ilpo Järvinen wrote:
> On Thu, 13 Feb 2025, Bjorn Helgaas wrote:
> > On Mon, Dec 16, 2024 at 06:10:12PM +0200, Ilpo Järvinen wrote:
> > > include/linux/pci.h provides low-level pci_printk() interface that is
> > > only used by AER because it needs to print the same message with
> > > different levels depending on the error severity. No other PCI code
> > > uses that functionality and calls pci_<level>() logging functions
> > > directly with the appropriate level.
> > > 
> > > Descope pci_printk() into AER as aer_printk().
> > > 
> > > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > 
> > I applied this patch by itself on pci/aer for v6.15.
> > 
> > We also have some work-in-progress on rate limiting errors, which
> > might conflict, but this is simple and shouldn't be hard to reconcile.

> > > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > > index db9b47ce3eef..02d23e795915 100644
> > > --- a/include/linux/pci.h
> > > +++ b/include/linux/pci.h
> > > @@ -2685,9 +2685,6 @@ void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type);
> > >  
> > >  #include <linux/dma-mapping.h>
> > >  
> > > -#define pci_printk(level, pdev, fmt, arg...) \
> > > -	dev_printk(level, &(pdev)->dev, fmt, ##arg)
> 
> Both shpchp and aer do use pci_printk() before this series (it seems LKP 
> has also catched it already).
> 
> If you split this series into different branches, this removal of 
> pci_printk() has to be postponed until the next kernel release (fine for 
> me if that's what you want to do, just remove this part from this patch 
> and perhaps adjust the commit message to say it's to prepare for removal 
> of the pci_printk()).

OK.  I dropped the pci_printk() removal for now.  I'm anticipating
more AER changes this cycle, so I'm trying to keep those isolated.

Bjorn

