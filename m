Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B7358724B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 22:25:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxV421ZXCz300x
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 06:25:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aYz/EljH;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=b2F5pSaS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aYz/EljH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=b2F5pSaS;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxV3L0mbtz2xHC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 06:24:45 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 51FE91FA5E;
	Mon,  1 Aug 2022 20:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1659385443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7dmq4djzkOFR69RK7c8s+fuWDxrZrVFcqjlq0EfVNQ=;
	b=aYz/EljHWSiJAfHsWfC1bCTaisxCjY935FQtanU9jleQldNznciMMANHQBY77g75v0HdVe
	3d3e8swYNxSo2wjqXzjCKkLCMPmOWdDMftv2dpH0HoKDoRaaNTlY1cqUiJfm5z31ZM+QG7
	e96tf4LEe6fXiPiVopzxyhcTU4IVEn8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1659385443;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7dmq4djzkOFR69RK7c8s+fuWDxrZrVFcqjlq0EfVNQ=;
	b=b2F5pSaSfLAC3bfALL7ErTvTg2ZIRyWeohxi7oQ8PALeotaHL13CssPH+b50WBRQklpzZc
	VJWKMzr3tsOllpBg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 960442C141;
	Mon,  1 Aug 2022 20:24:02 +0000 (UTC)
Date: Mon, 1 Aug 2022 22:24:01 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 1/2] lib: generic accessor functions for arch keystore
Message-ID: <20220801202401.GZ17705@kitsune.suse.cz>
References: <20220801123426.585801-1-gjoyce@linux.vnet.ibm.com>
 <20220801123426.585801-2-gjoyce@linux.vnet.ibm.com>
 <20220801134018.GY17705@kitsune.suse.cz>
 <61ebf904-8ce1-eeac-888a-4040711e7903@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61ebf904-8ce1-eeac-888a-4040711e7903@linux.vnet.ibm.com>
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
Cc: axboe@kernel.dk, Christophe Leroy <christophe.leroy@c-s.fr>, gjoyce@linux.vnet.ibm.com, nayna@linux.ibm.com, Nick Piggin <npiggin@gmail.com>, linux-block@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 01, 2022 at 03:45:45PM -0400, Nayna wrote:
> 
> On 8/1/22 09:40, Michal Suchánek wrote:
> > Hello,
> > 
> > On Mon, Aug 01, 2022 at 07:34:25AM -0500, gjoyce@linux.vnet.ibm.com wrote:
> > > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > 
> > > Generic kernel subsystems may rely on platform specific persistent
> > > KeyStore to store objects containing sensitive key material. In such case,
> > > they need to access architecture specific functions to perform read/write
> > > operations on these variables.
> > > 
> > > Define the generic variable read/write prototypes to be implemented by
> > > architecture specific versions. The default(weak) implementations of
> > > these prototypes return -EOPNOTSUPP unless overridden by architecture
> > > versions.
> > > 
> > > Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > > ---
> > >   include/linux/arch_vars.h | 23 +++++++++++++++++++++++
> > >   lib/Makefile              |  2 +-
> > >   lib/arch_vars.c           | 25 +++++++++++++++++++++++++
> > >   3 files changed, 49 insertions(+), 1 deletion(-)
> > >   create mode 100644 include/linux/arch_vars.h
> > >   create mode 100644 lib/arch_vars.c
> > > 
> > > diff --git a/include/linux/arch_vars.h b/include/linux/arch_vars.h
> > > new file mode 100644
> > > index 000000000000..9c280ff9432e
> > > --- /dev/null
> > > +++ b/include/linux/arch_vars.h
> > > @@ -0,0 +1,23 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Platform variable opearations.
> > > + *
> > > + * Copyright (C) 2022 IBM Corporation
> > > + *
> > > + * These are the accessor functions (read/write) for architecture specific
> > > + * variables. Specific architectures can provide overrides.
> > > + *
> > > + */
> > > +
> > > +#include <linux/kernel.h>
> > > +
> > > +enum arch_variable_type {
> > > +	ARCH_VAR_OPAL_KEY      = 0,     /* SED Opal Authentication Key */
> > > +	ARCH_VAR_OTHER         = 1,     /* Other type of variable */
> > > +	ARCH_VAR_MAX           = 1,     /* Maximum type value */
> > > +};
> > > +
> > > +int arch_read_variable(enum arch_variable_type type, char *varname,
> > > +		       void *varbuf, u_int *varlen);
> > > +int arch_write_variable(enum arch_variable_type type, char *varname,
> > > +			void *varbuf, u_int varlen);
> > > diff --git a/lib/Makefile b/lib/Makefile
> > > index f99bf61f8bbc..b90c4cb0dbbb 100644
> > > --- a/lib/Makefile
> > > +++ b/lib/Makefile
> > > @@ -48,7 +48,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
> > >   	 bsearch.o find_bit.o llist.o memweight.o kfifo.o \
> > >   	 percpu-refcount.o rhashtable.o \
> > >   	 once.o refcount.o usercopy.o errseq.o bucket_locks.o \
> > > -	 generic-radix-tree.o
> > > +	 generic-radix-tree.o arch_vars.o
> > >   obj-$(CONFIG_STRING_SELFTEST) += test_string.o
> > >   obj-y += string_helpers.o
> > >   obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o
> > > diff --git a/lib/arch_vars.c b/lib/arch_vars.c
> > > new file mode 100644
> > > index 000000000000..e6f16d7d09c1
> > > --- /dev/null
> > > +++ b/lib/arch_vars.c
> > > @@ -0,0 +1,25 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Platform variable operations.
> > > + *
> > > + * Copyright (C) 2022 IBM Corporation
> > > + *
> > > + * These are the accessor functions (read/write) for architecture specific
> > > + * variables. Specific architectures can provide overrides.
> > > + *
> > > + */
> > > +
> > > +#include <linux/kernel.h>
> > > +#include <linux/arch_vars.h>
> > > +
> > > +int __weak arch_read_variable(enum arch_variable_type type, char *varname,
> > > +			      void *varbuf, u_int *varlen)
> > > +{
> > > +	return -EOPNOTSUPP;
> > > +}
> > > +
> > > +int __weak arch_write_variable(enum arch_variable_type type, char *varname,
> > > +			       void *varbuf, u_int varlen)
> > > +{
> > > +	return -EOPNOTSUPP;
> > > +}
> > > -- 
> > Doesn't EFI already have some variables?
> > 
> > And even powernv?
> > 
> > Shouldn't this generalize the already existing variables?
> > 
> > Or move to powerpc and at least generalize the powerpc ones?
> 
> Yes, EFI and PowerNV do have variables, but I am not exactly clear about
> your reference to them in this context. What do you mean by generalize
> already existing variables ?
> 
> This interface is actually generalizing calls to access platform specific
> keystores. It is explained in cover letter that this patch is defining
> generic interface and these are default implementations which needs to be
> overridden by arch specific versions.  For PowerVM PLPAR Platform KeyStore,
> the arch specific version is implemented in Patch 2.
For powervm, not powernv.

If it's not generic enough to cover even powerpc-specific keystores does
such generalization even need to exist?
> 
> Access to EFI variables should be implemented by EFI arch specific interface
> and PowerNV will have to do the same if it needs to.

If such generic interface is desirable it should cover the existing
architectures I think. Otherwise how can you tell if it's usable there?

Thanks

Michal
