Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5F93332F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 03:08:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwFqc0ctxz3cJq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 13:08:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=plKwgxGi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=plKwgxGi; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwFqB21Xfz2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 13:08:22 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D39DD64FF4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 02:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615342099;
 bh=bQ55CC6tmr8YhH0VQIaUBJ8fMpBAeOsrBFxLNLe1qoM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=plKwgxGiotlX9H8juB66WOn2abcYfjQ4ZPEpIQi8fAbLvPuGkEdcwbPhplPCy69Mx
 2Wy5tsBwrvXtt9MmIiorA/2JmNY1WCcRSb+t8pdfAQRrBkOSb/+ey88fU6qLY35kNh
 hZ8BXethbJv35OQnadWvbRvLj+hc5kNP6aa3v9R0N36xurZ3df/8LPOq+nhhN3qb06
 SQ59T/KHUqsUSP1gyCUz16wYW7M0DJrw0/BEkaOnUSMt3MCSJtfyj4hJuMh0FE7xgp
 yVN7Dsl2aSXJeNY+VQwCRZG1Yf3BK6RnRsGYktTHP5TecjlPRunyWjzhMiheLF7WTu
 Id+kqwMwc3JrA==
Received: by mail-ej1-f52.google.com with SMTP id e19so34214983ejt.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 18:08:18 -0800 (PST)
X-Gm-Message-State: AOAM532qTQXlVTAhvXrt6u+xY8iDgPRK+JMdhBgCp7+MmqVY7r81tW5F
 265IhbAlLCpe8Y7rD/4RUyAgDHNV3wNQsrs95w==
X-Google-Smtp-Source: ABdhPJw9ajIWGdjNsTd246RLhKFda1I86Dm8k6yu75mEgWnrYmIED2kbAucwe1ggAH3lTiRQqSOo9MvgD8hj9Z/DSpI=
X-Received: by 2002:a17:906:1d44:: with SMTP id
 o4mr967756ejh.130.1615342097419; 
 Tue, 09 Mar 2021 18:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20210220005204.1417200-1-bauerman@linux.ibm.com>
In-Reply-To: <20210220005204.1417200-1-bauerman@linux.ibm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 9 Mar 2021 19:08:05 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJatxTwSbM8a0PB2ievO_fRFeYJ8ZtBN0pRfnEjSXyUkg@mail.gmail.com>
Message-ID: <CAL_JsqJatxTwSbM8a0PB2ievO_fRFeYJ8ZtBN0pRfnEjSXyUkg@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/kexec_file: Restore FDT size estimation for
 kdump kernel
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
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
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 19, 2021 at 6:52 PM Thiago Jung Bauermann
<bauerman@linux.ibm.com> wrote:
>
> Commit 2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump
> kernel") fixed how elf64_load() estimates the FDT size needed by the
> crashdump kernel.
>
> At the same time, commit 130b2d59cec0 ("powerpc: Use common
> of_kexec_alloc_and_setup_fdt()") changed the same code to use the generic
> function of_kexec_alloc_and_setup_fdt() to calculate the FDT size. That
> change made the code overestimate it a bit by counting twice the space
> required for the kernel command line and /chosen properties.
>
> Therefore change kexec_fdt_totalsize_ppc64() to calculate just the extra
> space needed by the kdump kernel, and change the function name so that it
> better reflects what the function is now doing.
>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Reviewed-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> ---
>  arch/powerpc/include/asm/kexec.h  |  2 +-
>  arch/powerpc/kexec/elf_64.c       |  2 +-
>  arch/powerpc/kexec/file_load_64.c | 26 ++++++++------------------
>  3 files changed, 10 insertions(+), 20 deletions(-)

I ended up delaying the referenced series til 5.13, but have applied
it now. Can I get an ack from the powerpc maintainers on this one?
I'll fixup the commit log to make sense given the commit id's aren't
valid.

Rob
