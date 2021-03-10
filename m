Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB6C3333A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 04:10:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwHBP33vPz3cWQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 14:10:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dcCRe4ah;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dcCRe4ah; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwH9w5Y8zz3bPV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 14:09:40 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3B2E64FED
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 03:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615345778;
 bh=hHi9H5kl4wpnWvG7xJWgx+rlR2fSM4M2CJlmcTqk4Lc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dcCRe4ahcLl+ilOI4Q2TmKUnNWQT709Ih1Ly31MOW62sbSIo2eqTOGJibYu64f86g
 9GE3K/HEKMJMs/DHsf0S+j9cJqY/h6n7Po9UmmGNLjB37Y0WS43B7ScWFUQmOyu+mw
 5lD0H1XelHCgY/HA/6+ZU4HIrDuih50Iz6J+Kfh/gUVj9n6ppOkNoKzwiGf+efP+k0
 cc3ycUWZi/OpppwwL+6FjndLw+7G/U773wFxHHv6cVF6RtJ69933jg2dZCpwv3MJs4
 2JEBKNrWL2Ntj37r//WTRSf7HVI5kfqPNgbrtmSzMJ32sNmAU9RYVNttTsPYw6+jxy
 KShrx5/XUKIiQ==
Received: by mail-ej1-f52.google.com with SMTP id bm21so34614680ejb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 19:09:37 -0800 (PST)
X-Gm-Message-State: AOAM531QH0NaLdFw+/jTPLJpM9UgYfa+DrcmEH2jTPaTmpQLKueF8rX3
 D6xQh0YqGqDn4z7lY7PsjFzdU6H+0LdstRgvtQ==
X-Google-Smtp-Source: ABdhPJwE7Ujo2AxBz//6JFloBR3AHEXYZ0s2yT2uFYTIgO188foiD1hEWo4q88NF+iArryuCRjHmqLZRu8yeZDKzYg4=
X-Received: by 2002:a17:906:d153:: with SMTP id
 br19mr1192083ejb.360.1615345776316; 
 Tue, 09 Mar 2021 19:09:36 -0800 (PST)
MIME-Version: 1.0
References: <20210220005204.1417200-1-bauerman@linux.ibm.com>
 <CAL_JsqJatxTwSbM8a0PB2ievO_fRFeYJ8ZtBN0pRfnEjSXyUkg@mail.gmail.com>
 <7d0c6062-ca73-f183-110d-f5b75ae91d10@linux.microsoft.com>
In-Reply-To: <7d0c6062-ca73-f183-110d-f5b75ae91d10@linux.microsoft.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 9 Mar 2021 20:09:25 -0700
X-Gmail-Original-Message-ID: <CAL_JsqK2M_Wfyd0MJK-0Qk7k=CspQZy6_FL6FTWkURmA_ZcARg@mail.gmail.com>
Message-ID: <CAL_JsqK2M_Wfyd0MJK-0Qk7k=CspQZy6_FL6FTWkURmA_ZcARg@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/kexec_file: Restore FDT size estimation for
 kdump kernel
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kexec@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 9, 2021 at 7:31 PM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> On 3/9/21 6:08 PM, Rob Herring wrote:
>
> Hi Rob,
>
> > On Fri, Feb 19, 2021 at 6:52 PM Thiago Jung Bauermann
> > <bauerman@linux.ibm.com> wrote:
> >>
> >> Commit 2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump
> >> kernel") fixed how elf64_load() estimates the FDT size needed by the
> >> crashdump kernel.
> >>
> >> At the same time, commit 130b2d59cec0 ("powerpc: Use common
> >> of_kexec_alloc_and_setup_fdt()") changed the same code to use the generic
> >> function of_kexec_alloc_and_setup_fdt() to calculate the FDT size. That
> >> change made the code overestimate it a bit by counting twice the space
> >> required for the kernel command line and /chosen properties.
> >>
> >> Therefore change kexec_fdt_totalsize_ppc64() to calculate just the extra
> >> space needed by the kdump kernel, and change the function name so that it
> >> better reflects what the function is now doing.
> >>
> >> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> >> Reviewed-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> >> ---
> >>   arch/powerpc/include/asm/kexec.h  |  2 +-
> >>   arch/powerpc/kexec/elf_64.c       |  2 +-
> >>   arch/powerpc/kexec/file_load_64.c | 26 ++++++++------------------
> >>   3 files changed, 10 insertions(+), 20 deletions(-)
> >
> > I ended up delaying the referenced series til 5.13, but have applied
> > it now. Can I get an ack from the powerpc maintainers on this one?
> > I'll fixup the commit log to make sense given the commit id's aren't
> > valid.
>
> I checked the change applied in linux-next branch and also Device Tree's
> for-next branch - it looks like v1 of Thiago's patch has been applied.
> Could you please pick up the v2 patch?

Huh? This patch (v2) hasn't been applied to any tree AFAICT.

Rob
