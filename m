Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D0A30D0BF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 02:27:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVkYj5kWzzDwhR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:27:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk
 (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk;
 envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256
 header.s=pandora-2019 header.b=g+zlPNAW; 
 dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVNpw0cx2zDr9C
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 23:07:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ff/wpjr28khgZASsQau1yxjR8C0J+5ugrzPgigwTWJ0=; b=g+zlPNAWAiJW5GOWEjHNIVmqA
 0i1nsvoEBElLib6NPI+ewFmTSmVP7JGSQ7ZLly3jTDpFtnIDio9CEcaBiQSFwcgmPHoMvRYCbwGWt
 PkjTmE1MYLjA2QUDOjN2Mn234zZSJtnzMrVt+Kc4GD8aK1RdS6EgeyWWIM9ttIO1LsqlzqeuKm1bX
 hC3JYtKbNMb2qpSdXuDo/qCblleoKhE5dft21RMev3iDIm67Fs0AiDx4do2YnTx+1m42FvFdXA9/n
 hFly2dtJBy7Hrr+SaHO+q+VcPF9VPjlgiUyfr22h++1gaon0GMT8fIpHV/Ua3BRHpputjXSfiebb7
 f+YrLjvrA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38196)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1l6uSd-0004KH-MO; Tue, 02 Feb 2021 12:07:11 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1l6uSa-00030y-Hf; Tue, 02 Feb 2021 12:07:08 +0000
Date: Tue, 2 Feb 2021 12:07:08 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Ding Tianhong <dingtianhong@huawei.com>
Subject: Re: [PATCH v12 01/14] ARM: mm: add missing pud_page define to
 2-level page tables
Message-ID: <20210202120708.GM1463@shell.armlinux.org.uk>
References: <20210202110515.3575274-1-npiggin@gmail.com>
 <20210202110515.3575274-2-npiggin@gmail.com>
 <20210202111319.GL1463@shell.armlinux.org.uk>
 <d1f661f2-f473-1dd8-94cc-fe76714249b5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1f661f2-f473-1dd8-94cc-fe76714249b5@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 02, 2021 at 07:47:04PM +0800, Ding Tianhong wrote:
> On 2021/2/2 19:13, Russell King - ARM Linux admin wrote:
> > On Tue, Feb 02, 2021 at 09:05:02PM +1000, Nicholas Piggin wrote:
> >> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
> >> index c02f24400369..d63a5bb6bd0c 100644
> >> --- a/arch/arm/include/asm/pgtable.h
> >> +++ b/arch/arm/include/asm/pgtable.h
> >> @@ -166,6 +166,9 @@ extern struct page *empty_zero_page;
> >>  
> >>  extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
> >>  
> >> +#define pud_page(pud)		pmd_page(__pmd(pud_val(pud)))
> >> +#define pud_write(pud)		pmd_write(__pmd(pud_val(pud)))
> > 
> > As there is no PUD, does it really make sense to return a valid
> > struct page (which will be the PTE page) for pud_page(), which is
> > several tables above?
> > 
> --- a/arch/arm/include/asm/pgtable-2level.h
> +++ b/arch/arm/include/asm/pgtable-2level.h
> 
> +static inline int pud_none(pud_t pud)
> +{
> +          return 0;
> +}
> 
> I think it could be fix like this.

We already have that.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
