Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C89503766E5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 16:11:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcC6x6NZdz306r
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 00:11:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcC6Y0Qk8z2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 00:11:16 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08408B16D;
 Fri,  7 May 2021 14:11:14 +0000 (UTC)
Date: Fri, 7 May 2021 16:11:03 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/perf: Simplify Makefile
Message-ID: <20210507141103.GA12700@kitsune.suse.cz>
References: <d37f61afca55b5b33787b643890e061ae1c18f5f.1620396045.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d37f61afca55b5b33787b643890e061ae1c18f5f.1620396045.git.christophe.leroy@csgroup.eu>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 07, 2021 at 02:01:09PM +0000, Christophe Leroy wrote:
> arch/powerpc/Kbuild decend into arch/powerpc/perf/ only when
> CONFIG_PERF_EVENTS is selected, so there is not need to take
> CONFIG_PERF_EVENTS into account in arch/powerpc/perf/Makefile.

So long as CONFIG_PERF_EVENTS stays boolean.
If it were tristate the result is less clear.

Reviewed-by: Michal Suchánek <msuchanek@suse.de>

Thanks

Michal
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/perf/Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
> index c02854dea2b2..2f46e31c7612 100644
> --- a/arch/powerpc/perf/Makefile
> +++ b/arch/powerpc/perf/Makefile
> @@ -1,9 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -obj-$(CONFIG_PERF_EVENTS)	+= callchain.o callchain_$(BITS).o perf_regs.o
> -ifdef CONFIG_COMPAT
> -obj-$(CONFIG_PERF_EVENTS)	+= callchain_32.o
> -endif
> +obj-y				+= callchain.o callchain_$(BITS).o perf_regs.o
> +obj-$(CONFIG_COMPAT)		+= callchain_32.o
>  
>  obj-$(CONFIG_PPC_PERF_CTRS)	+= core-book3s.o bhrb.o
>  obj64-$(CONFIG_PPC_PERF_CTRS)	+= ppc970-pmu.o power5-pmu.o \
> -- 
> 2.25.0
> 
