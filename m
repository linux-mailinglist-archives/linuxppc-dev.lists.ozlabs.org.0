Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67516337A17
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 17:53:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxFQL2ZrSz3dL4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 03:53:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.46; helo=mail-io1-f46.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxFQ15ZQLz30Hc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 03:53:28 +1100 (AEDT)
Received: by mail-io1-f46.google.com with SMTP id u8so22599321ior.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 08:53:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tLgGyS2Z81PUU2Dg5WInviB0T/N8U/MXgyafSYZmI3k=;
 b=IIqY8XcFgh++ztUI5OT5h0Gne1ba2lfo0rY1h9KlgmXBe05DdXMGuZwPe+0vDnwyC5
 3CPJFryR3IVqTCDDO8qfv9neQmRzM+mCKJtcGnlva/r/ZYQ9gRQoV8/8IPHiOf1cFqZc
 VT9BMwqUPwl/DrzUkS2Yuz3XuZYMJ3vbPtOx2he27oahw9iIGStDQo9Pdwfls+q4VzVS
 O9N8tZxM8+brIRcWH0GXbQ87iPwPzzbPFlZDGvLIXrq1GFnMrB4OK0Kw5JRV9I54dCEW
 Hb5r0t3RDfmdfVHkvXA5YwvqqgJS3nUUuX8AQk3k0oyUntOki2bzs2OxNllMtc3sd2Sx
 28fg==
X-Gm-Message-State: AOAM5314GjH0GZDmeX8QKw4YIW9QffY+SWIVtRAXiAAicPeh7gdrXuJi
 5xc7I899LsRRnxE/ekpq+g==
X-Google-Smtp-Source: ABdhPJzbjzdoGiRC6qqM0Soa2DSWMI4uf+CZ/mBOR47+32K0X7LbrDnT3NMXptXC+hVHug9D8mUT4A==
X-Received: by 2002:a05:6638:d47:: with SMTP id d7mr4575924jak.2.1615481605929; 
 Thu, 11 Mar 2021 08:53:25 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id x16sm1547383ilp.44.2021.03.11.08.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 08:53:24 -0800 (PST)
Received: (nullmailer pid 861179 invoked by uid 1000);
 Thu, 11 Mar 2021 16:53:22 -0000
Date: Thu, 11 Mar 2021 09:53:22 -0700
From: Rob Herring <robh@kernel.org>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/kexec_file: Restore FDT size estimation for
 kdump kernel
Message-ID: <20210311165322.GA860702@robh.at.kernel.org>
References: <20210220005204.1417200-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210220005204.1417200-1-bauerman@linux.ibm.com>
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
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Feb 2021 21:52:04 -0300, Thiago Jung Bauermann wrote:
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
> 
> Applies on top of next-20210219.
> 
> Changes since v1:
> 
> - Adjusted comment describing kexec_extra_fdt_size_ppc64() as suggested
>   by Lakshmi.
> 

Applied, thanks!
