Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4EA46604F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 10:25:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4Vtp5m4Vz3cCQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 20:25:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4J4VtP099Nz2xBL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 20:25:31 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 543BE139F;
 Thu,  2 Dec 2021 01:25:29 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.65.131])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 364903F7D7;
 Thu,  2 Dec 2021 01:25:28 -0800 (PST)
Date: Thu, 2 Dec 2021 09:25:20 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: unmap memory regions in /memreserve node
Message-ID: <YaiRAD40xCK7u3Hl@FVFF77S0Q05N>
References: <20211124133347.3861391-1-calvinzhang.cool@gmail.com>
 <YaapE8oys5zQEdD5@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaapE8oys5zQEdD5@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Frank Rowand <frowand.list@gmail.com>,
 Calvin Zhang <calvinzhang.cool@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 30, 2021 at 04:43:31PM -0600, Rob Herring wrote:
> +linuxppc-dev
> 
> On Wed, Nov 24, 2021 at 09:33:47PM +0800, Calvin Zhang wrote:
> > Reserved memory regions in /memreserve node aren't and shouldn't
> > be referenced elsewhere. So mark them no-map to skip direct mapping
> > for them.
> 
> I suspect this has a high chance of breaking some platform. There's no 
> rule a region can't be accessed.

The subtlety is that the region shouldn't be explicitly accessed (e.g.
modified), but the OS is permitted to have the region mapped. In ePAPR this is
described as:

   This requirement is necessary because the client program is permitted to map
   memory with storage attributes specified as not Write Through Required, not
   Caching Inhibited, and Memory Coherence Required (i.e., WIMG = 0b001x), and
   VLE=0 where supported. The client program may use large virtual pages that
   contain reserved memory. However, the client program may not modify reserved
   memory, so the boot program may perform accesses to reserved memory as Write
   Through Required where conflicting values for this storage attribute are
   architecturally permissible.

Historically arm64 relied upon this for spin-table to work, and I *think* we
might not need that any more I agree that there's a high chance this will break
something (especially on 16K or 64K page size kernels), so I'd prefer to leave
it as-is.

If someone requires no-map behaviour, they should use a /reserved-memory entry
with a no-map property, which will work today and document their requirement
explicitly.

Thanks,
Mark.

> > Signed-off-by: Calvin Zhang <calvinzhang.cool@gmail.com>
> > ---
> >  drivers/of/fdt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index bdca35284ceb..9e88cc8445f6 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -638,7 +638,7 @@ void __init early_init_fdt_scan_reserved_mem(void)
> >  		fdt_get_mem_rsv(initial_boot_params, n, &base, &size);
> >  		if (!size)
> >  			break;
> > -		early_init_dt_reserve_memory_arch(base, size, false);
> > +		early_init_dt_reserve_memory_arch(base, size, true);
> >  	}
> >  
> >  	fdt_scan_reserved_mem();
> > -- 
> > 2.30.2
> > 
> > 
