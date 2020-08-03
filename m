Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A03239E6E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 06:47:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKlk20pjZzDqSy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 14:47:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jPM8pxVG; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKlhP6xSqzDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 14:46:13 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id j19so19200062pgm.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Aug 2020 21:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=M0EXqVvvU7EURtyvH7wo3HHy7rzmVEpMvCzVpEfbXzU=;
 b=jPM8pxVGUM8GhFZhyDDPpI8zElulFUNTrBdYW4M26LfHGm8vw70DVdUjPGrKXPjLyx
 spUHgt3qLYBAn60G/0sMxdYC69duUFqueI8XOO8fjvzMYG7IOaHhN8upFn35tkWkCvUy
 ReG9K6gvnSSY40epzKeUMxkDyvDHcSdgNjaqny356rh0ENLVmc7YDVCAfZliXCQxOdra
 fYlsLIEUsC3sxcKog+fNicds9rMv8xxgRe4Bx85BgnTJ9ZfbW4RdNSz6tgjjfyLQm5tY
 BdJkweF5PPldt1JfUMU61D3p6XPkMfi7K0bKjk6lifnxMHGTl3XKc0k5PHs/MRtjIxw8
 uvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M0EXqVvvU7EURtyvH7wo3HHy7rzmVEpMvCzVpEfbXzU=;
 b=B72Fd+zl88B4ZXsT7t2cTcVM37gZGzIUFDiLASl/VopBWXI1hvLVut1OCeg4J+GmH6
 U3tIkRd4UjOj02uIu9ZFGhamEvfWwNiiyazegQAYIQuTMK7kpuTq8gKkIeNT9o6dKeQB
 jQz8du9hY0UJWumWSDmODXgjfClzjupH9ksFTRD353UmwMVhWFSLFkcEOiX4gr/zeLt/
 68dtgvd529XoHoynO+oxu5sWZf/NvnubUf2hgIp7wXaOUT6LKn9SCD8ybQI2OkVN5/Kd
 PjFaVm2BiowfosjRIZBgjahbiy3hlRXOr2+n2SdawdjA9oC7LpsAlEU2rZPklq8RUCvy
 /ulg==
X-Gm-Message-State: AOAM533lmfnixAaUa23jw29lRC8q/6Fs9iS2yNao3OdMucgshHXVhUfE
 tORQwrvAgJhIJGc0P/C5knQ=
X-Google-Smtp-Source: ABdhPJxCqpM7enw7DF1yVc5p4f+M/FI+dz6bS4/vgHw0EOqflzTequz9Ed2B4z1fOyxMWCTLoGZ7xw==
X-Received: by 2002:a62:387:: with SMTP id 129mr14750803pfd.187.1596429970262; 
 Sun, 02 Aug 2020 21:46:10 -0700 (PDT)
Received: from Ryzen-9-3900X.localdomain ([89.46.114.147])
 by smtp.gmail.com with ESMTPSA id v77sm15947707pfc.137.2020.08.02.21.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 21:46:09 -0700 (PDT)
Date: Sun, 2 Aug 2020 21:46:09 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 15/16] powerpc/powernv/sriov: Make single PE mode a
 per-BAR setting
Message-ID: <20200803044609.GB195@Ryzen-9-3900X.localdomain>
References: <20200722065715.1432738-1-oohall@gmail.com>
 <20200722065715.1432738-15-oohall@gmail.com>
 <20200801061823.GA1203340@ubuntu-n2-xlarge-x86>
 <87r1sp19ag.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r1sp19ag.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>,
 clang-built-linux@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 02, 2020 at 11:12:23PM +1000, Michael Ellerman wrote:
> Nathan Chancellor <natechancellor@gmail.com> writes:
> > On Wed, Jul 22, 2020 at 04:57:14PM +1000, Oliver O'Halloran wrote:
> >> Using single PE BARs to map an SR-IOV BAR is really a choice about what
> >> strategy to use when mapping a BAR. It doesn't make much sense for this to
> >> be a global setting since a device might have one large BAR which needs to
> >> be mapped with single PE windows and another smaller BAR that can be mapped
> >> with a regular segmented window. Make the segmented vs single decision a
> >> per-BAR setting and clean up the logic that decides which mode to use.
> >> 
> >> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> >> ---
> >> v2: Dropped unused total_vfs variables in pnv_pci_ioda_fixup_iov_resources()
> >>     Dropped bar_no from pnv_pci_iov_resource_alignment()
> >>     Minor re-wording of comments.
> >> ---
> >>  arch/powerpc/platforms/powernv/pci-sriov.c | 131 ++++++++++-----------
> >>  arch/powerpc/platforms/powernv/pci.h       |  11 +-
> >>  2 files changed, 73 insertions(+), 69 deletions(-)
> >> 
> >> diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
> >> index ce8ad6851d73..76215d01405b 100644
> >> --- a/arch/powerpc/platforms/powernv/pci-sriov.c
> >> +++ b/arch/powerpc/platforms/powernv/pci-sriov.c
> >> @@ -260,42 +256,40 @@ void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
> >>  resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
> >>  						      int resno)
> >>  {
> >> -	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
> >>  	struct pnv_iov_data *iov = pnv_iov_get(pdev);
> >>  	resource_size_t align;
> >>  
> >> +	/*
> >> +	 * iov can be null if we have an SR-IOV device with IOV BAR that can't
> >> +	 * be placed in the m64 space (i.e. The BAR is 32bit or non-prefetch).
> >> +	 * In that case we don't allow VFs to be enabled since one of their
> >> +	 * BARs would not be placed in the correct PE.
> >> +	 */
> >> +	if (!iov)
> >> +		return align;
> >> +	if (!iov->vfs_expanded)
> >> +		return align;
> >> +
> >> +	align = pci_iov_resource_size(pdev, resno);
> 
> That's, oof.
> 
> > I am not sure if it has been reported yet but clang points out that
> > align is initialized after its use:
> >
> > arch/powerpc/platforms/powernv/pci-sriov.c:267:10: warning: variable 'align' is uninitialized when used here [-Wuninitialized]
> >                 return align;
> >                        ^~~~~
> > arch/powerpc/platforms/powernv/pci-sriov.c:258:23: note: initialize the variable 'align' to silence this warning
> >         resource_size_t align;
> >                              ^
> >                               = 0
> > 1 warning generated.
> 
> But I can't get gcc to warn about it?
> 
> It produces some code, so it's not like the whole function has been
> elided or something. I'm confused.
> 
> cheers

-Wmaybe-uninitialized was disabled in commit 78a5255ffb6a ("Stop the
ad-hoc games with -Wno-maybe-initialized") upstream so GCC won't warn on
stuff like this anymore.

I would assume the function should still be generated since those checks
are relevant, just the return value is bogus.

Cheers,
Nathan
