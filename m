Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 740C541B84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 07:18:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NwB65yGHzDqwM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 15:18:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alien8.de
 (client-ip=2a01:4f8:190:11c2::b:1457; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="rneOP3I/"; 
 dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nw8V2NDczDqlR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 15:16:39 +1000 (AEST)
Received: from zn.tnic (p200300EC2F0A6800EC6A653BF86B372A.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:6800:ec6a:653b:f86b:372a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BA42D1EC0997;
 Wed, 12 Jun 2019 07:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1560316591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=uZvUrReB+RHLzSd6kF/1jCDl/jkPW47i90g2lP+OZWI=;
 b=rneOP3I/FIcX/zUChYjTMNqLmHOhJ9uhQISz3P+01lalYd8uNCQcDcblA+dzdoRgiLRlzz
 DF6tlZQzEX3JOpUeN5oXSy45m3PJqlH7D/Vuz7dsX+ZgGRJB1IJmgDnx3BvoXK3lDQfFIj
 +JvMJTzNX1N/CKAPKQpaI/76LsvEzBk=
Date: Wed, 12 Jun 2019 07:16:24 +0200
From: Borislav Petkov <bp@alien8.de>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v8 2/7] x86/dma: use IS_ENABLED() to simplify the code
Message-ID: <20190612051624.GF32652@zn.tnic>
References: <20190530034831.4184-1-thunder.leizhen@huawei.com>
 <20190530034831.4184-3-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190530034831.4184-3-thunder.leizhen@huawei.com>
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
Cc: linux-ia64 <linux-ia64@vger.kernel.org>,
 Sebastian Ott <sebott@linux.ibm.com>, linux-doc <linux-doc@vger.kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 Joerg Roedel <joro@8bytes.org>, x86 <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Will Deacon <will.deacon@arm.com>, John Garry <john.garry@huawei.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Tony Luck <tony.luck@intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 iommu <iommu@lists.linux-foundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 30, 2019 at 11:48:26AM +0800, Zhen Lei wrote:
> This patch removes the ifdefs around CONFIG_IOMMU_DEFAULT_PASSTHROUGH to
> improve readablity.

Avoid having "This patch" or "This commit" in the commit message. It is
tautologically useless.

Also, do

$ git grep 'This patch' Documentation/process

for more details.

> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  arch/x86/kernel/pci-dma.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
> index dcd272dbd0a9330..9f2b19c35a060df 100644
> --- a/arch/x86/kernel/pci-dma.c
> +++ b/arch/x86/kernel/pci-dma.c
> @@ -43,11 +43,8 @@
>   * It is also possible to disable by default in kernel config, and enable with
>   * iommu=nopt at boot time.
>   */
> -#ifdef CONFIG_IOMMU_DEFAULT_PASSTHROUGH
> -int iommu_pass_through __read_mostly = 1;
> -#else
> -int iommu_pass_through __read_mostly;
> -#endif
> +int iommu_pass_through __read_mostly =
> +			IS_ENABLED(CONFIG_IOMMU_DEFAULT_PASSTHROUGH);

Let that line stick out.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
