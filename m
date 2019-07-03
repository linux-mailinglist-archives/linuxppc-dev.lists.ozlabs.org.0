Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE635DD44
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 06:06:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dnbx5F9KzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 14:06:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dnZ04SyHzDqRc
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 14:04:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tc798DR9"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45dnZ03PpBz8swt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 14:04:56 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45dnZ03DJFz9sBp; Wed,  3 Jul 2019 14:04:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tc798DR9"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45dnYz5RnXz9s4V
 for <linuxppc-dev@ozlabs.org>; Wed,  3 Jul 2019 14:04:55 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id r1so508335pfq.12
 for <linuxppc-dev@ozlabs.org>; Tue, 02 Jul 2019 21:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=tylYDS6kDRxuvNQuW4yVmheFFIrPCY1pJ+1IZjAYM7Y=;
 b=Tc798DR9qGpH1dWSzACd2ATsW5T56VPrRfPptW75wayXd8malwsWEwm8jl7251+Zdf
 uMaHuGwSSLqwejfwHP29SxLv/12xeLpwcJ74vCrInsrHL+Rkrw/NnNWl/O4stwBU5hDm
 re3SW6CF7yRH5sKC/I0U6YXmEz8K9xY0dB+wgZco5MO1uaWfBgKuVbFdm92CIWhfn6y6
 15H+e7FJYNdcaDu+vxJg6e6uYCL5C8SVjNic+dOwMgU/R2AHheUbTMhhIv4HRnY7itzE
 /uVxihw/03Hkx6K5ghJ2X0uniSLXGyr9lCReey7ai9N+gFoYA96yFYz/RIDDklfFb1r3
 2jdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=tylYDS6kDRxuvNQuW4yVmheFFIrPCY1pJ+1IZjAYM7Y=;
 b=h1uo5EmtnBuyBcOJlCRMxe0onmFRuybOaiD+p4bxeH0unv/+R62470SFNmU1y5EsS1
 AU8aaV9awsT1JBnpTHXtEhJQUK0sIcPvWkRSx71q17XIpAz3i3+9BmJs9Q/wYlZMc/pr
 OpVUNp3fiCzd2C8XtCZWNJFlXvSCoABgaN4yRDrwLHs77AWtkI2h9FTQJyHvOXKMTvij
 G8bHZXZ9nPVRbOyqIo9oZNnc2zKuEkTjikUp4Bfl43KUEphJT3kanJvShveYwWrqYFun
 q1febEOpxiIasS+GSWbnHZQbp3zU+34piVigmv54Z+ZdAAQOX38Imp80Sv7Vjgw1pYtH
 z1wg==
X-Gm-Message-State: APjAAAVD46njZrUffSMRaNUUPfXdqbipomPXpOih/20K+YchpmuFkAlj
 1is2Z96yeDo2kZcwOxmga/M=
X-Google-Smtp-Source: APXvYqwxEEmtP7h4uErRIoTEmpS4m1WqFEb3++nXZQdYIXbjaIHll6wJXaW22IT1jJbxeSdoNtyDvg==
X-Received: by 2002:a63:c508:: with SMTP id f8mr3628727pgd.48.1562126692024;
 Tue, 02 Jul 2019 21:04:52 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id h26sm780990pfq.64.2019.07.02.21.04.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 21:04:51 -0700 (PDT)
Message-ID: <8a779e216bb088b33b022cd026bdb647e05aa338.camel@gmail.com>
Subject: Re: [PATCH v3 03/16] pseries/fadump: move out platform specific
 support from generic code
From: Oliver O'Halloran <oohall@gmail.com>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
 <linuxppc-dev@ozlabs.org>
Date: Wed, 03 Jul 2019 14:04:46 +1000
In-Reply-To: <156149556436.9094.15834897273683011518.stgit@hbathini.in.ibm.com>
References: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
 <156149556436.9094.15834897273683011518.stgit@hbathini.in.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Stewart Smith <stewart@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-26 at 02:16 +0530, Hari Bathini wrote:
> Introduce callbacks for platform specific operations like register,
> unregister, invalidate & such, and move pseries specific code into
> platform code.

Please don't move around large blocks of code *and* change the code in
a single patch. It makes reviewing the changes extremely tedious since
the changes are mixed in with hundreds of lines of nothing.

> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/fadump.h            |   75 ----
>  arch/powerpc/kernel/fadump-common.h          |   38 ++
>  arch/powerpc/kernel/fadump.c                 |  500 ++-----------------------
>  arch/powerpc/platforms/pseries/Makefile      |    1 
>  arch/powerpc/platforms/pseries/rtas-fadump.c |  529 ++++++++++++++++++++++++++
>  arch/powerpc/platforms/pseries/rtas-fadump.h |   96 +++++
>  6 files changed, 700 insertions(+), 539 deletions(-)
>  create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.c
>  create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.h
> 

> +static struct fadump_ops pseries_fadump_ops = {
> +	.init_fadump_mem_struct	= pseries_init_fadump_mem_struct,
> +	.register_fadump	= pseries_register_fadump,

I realise you are just translating the existing interface, but why is
init_fadump_mem_struct() done as a seperate step and not as a part of
the registration function? The struct doesn't seem to be necessary
until the actual registration happens.

> +	.unregister_fadump	= pseries_unregister_fadump,
> +	.invalidate_fadump	= pseries_invalidate_fadump,
> +	.process_fadump		= pseries_process_fadump,
> +	.fadump_region_show	= pseries_fadump_region_show,

> +	.crash_fadump		= pseries_crash_fadump,

Rename this to fadump_trigger or something, it's not clear what it
does.



