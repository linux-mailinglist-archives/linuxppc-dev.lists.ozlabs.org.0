Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C40B78EE0A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 16:19:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468T8x0KfmzDr7f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 00:19:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=hansenpartnership.com (client-ip=66.63.167.143;
 helo=bedivere.hansenpartnership.com;
 envelope-from=james.bottomley@hansenpartnership.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=HansenPartnership.com
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [66.63.167.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468T3B55LbzDr94
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 00:14:12 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 8AEBC8EE1FB;
 Thu, 15 Aug 2019 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1565861165;
 bh=ChiJO460CwqJr6bCz/k4RtKNXSI3O1ZZt8g3+Id8X0Q=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=txS1ipMiR7CUHSlUoHY7Yr340RD45sludbWwlFZbAST/wJTgB93X+NH4hXMHmM+sf
 fNgzpuZSnLQC7esRTxpsajyQxQCp08OzyfabL7vdCWupMwcui8U+xdDnveqEPNhWv9
 Z8o5cDslbreqbUwKWCvykOv3uCBIKZbKtc9/CFHc=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id xdeaREgeheqG; Thu, 15 Aug 2019 02:26:04 -0700 (PDT)
Received: from [192.168.1.74] (host31-48-63-146.range31-48.btcentralplus.com
 [31.48.63.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 68D8F8EE0BF;
 Thu, 15 Aug 2019 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1565861164;
 bh=ChiJO460CwqJr6bCz/k4RtKNXSI3O1ZZt8g3+Id8X0Q=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=OlWfXIG7zOd1sAz8WOHgBIsq+CjD6O6sa7mniwoVsb5xfY6YsyfecX180meWmNBEE
 AScnlELkp6geKt+seKwyCwqWGyxc9X+k5anMN1Vuga1ATt8Sq1gJxaFt33pFzZ4vBU
 rFECwrGGAhoFxx6qCn0IkP2mtfuU8za0Eta3XNl4=
Message-ID: <1565861152.2963.7.camel@HansenPartnership.com>
Subject: Re: [PATCH 7/8] parisc: don't set ARCH_NO_COHERENT_DMA_MMAP
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org, Marek
 Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 15 Aug 2019 10:25:52 +0100
In-Reply-To: <20190808160005.10325-8-hch@lst.de>
References: <20190808160005.10325-1-hch@lst.de>
 <20190808160005.10325-8-hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
 Vladimir Murzin <vladimir.murzin@arm.com>, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-08-08 at 19:00 +0300, Christoph Hellwig wrote:
> parisc is the only architecture that sets ARCH_NO_COHERENT_DMA_MMAP
> when an MMU is enabled.  AFAIK this is because parisc CPUs use VIVT
> caches,

We're actually VIPT but the same principle applies.

>  which means exporting normally cachable memory to userspace is
> relatively dangrous due to cache aliasing.
> 
> But normally cachable memory is only allocated by dma_alloc_coherent
> on parisc when using the sba_iommu or ccio_iommu drivers, so just
> remove the .mmap implementation for them so that we don't have to set
> ARCH_NO_COHERENT_DMA_MMAP, which I plan to get rid of.

So I don't think this is quite right.  We have three architectural
variants essentially (hidden behind about 12 cpu types):

   1. pa70xx: These can't turn off page caching, so they were the non
      coherent problem case
   2. pa71xx: These can manufacture coherent memory simply by turning off
      the cache on a per page basis
   3. pa8xxx: these have a full cache flush coherence mechanism.

(I might have this slightly wrong: I vaguely remember the pa71xxlc
variants have some weird cache quirks for DMA as well)

So I think pa70xx we can't mmap.  pa71xx we can provided we mark the
page as uncached ... which should already have happened in the allocate
and pa8xxx which can always mmap dma memory without any special tricks.

James

