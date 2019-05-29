Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 391652D582
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 08:29:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DLRP1chKzDqP0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 16:29:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+6b2e7d6ba9248c696ca2+5757+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="quZbL2cv"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DLQ80W2wzDq5W
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 16:28:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=13JV4V4SogibwHhPoYROLAGqH0iKpEvSIoc3Rnqr3kg=; b=quZbL2cvfTRj4ptBkClYlllAT
 EWqbPDFMD4beEL0HvoLGUz+Dzfpdlhgp1iQ4/FtdGEMPElJ1t6Xnep/T3AToV8sFd5GRzVhP+meY/
 8f84J6gZVzqpehfMaWNKee2Oocx8qGj+QNrJE0UNWEXlWZndXLITO+tQ9Hn/nfaYVrdfWiY42Rcu0
 fmobdIEWzwiYN9J8CuWOJgbBSCNdMJbKrY9TbIwj+qFromwHAUTysi04EMQSbfgHBRATXYCi3wMs3
 ZsHMXCDQmReXmsfFKNRUAMV4eZ00qE1+2Axn0H54Fc1tHlpysPBBYf+xqd6Glp5v47C7EKsPFn54k
 ETad8jvgw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hVs4o-0002j7-BQ; Wed, 29 May 2019 06:28:42 +0000
Date: Tue, 28 May 2019 23:28:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH v4 2/2] powerpc: Fix compile issue with force DAWR
Message-ID: <20190529062842.GA4787@infradead.org>
References: <20190529020115.14201-1-mikey@neuling.org>
 <20190529020115.14201-2-mikey@neuling.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190529020115.14201-2-mikey@neuling.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Mathieu Malaterre <malat@debian.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +config PPC_DAWR
> +	bool
> +	default n

"default n" is the default default.  No need to write this line.

> +++ b/arch/powerpc/kernel/dawr.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// DAWR infrastructure
> +//
> +// Copyright 2019, Michael Neuling, IBM Corporation.

Normal top of file header should be /* */, //-style comments are only
for the actual SPDX heder line.

> +	/* Send error to user if they hypervisor won't allow us to write DAWR */
> +	if ((!dawr_force_enable) &&
> +	    (firmware_has_feature(FW_FEATURE_LPAR)) &&
> +	    (set_dawr(&null_brk) != H_SUCCESS))

None of the three inner brace sets here are required, and the code
becomes much easier to read without them.

> +		return -1;

What about returning a proper error code?

> +static int __init dawr_force_setup(void)
> +{
> +	dawr_force_enable = false;

This variable already is initialized to alse by default, so this line
is not required.

> +	if (PVR_VER(mfspr(SPRN_PVR)) == PVR_POWER9) {
> +		/* Turn DAWR off by default, but allow admin to turn it on */
> +		dawr_force_enable = false;

.. and neither is this one.
