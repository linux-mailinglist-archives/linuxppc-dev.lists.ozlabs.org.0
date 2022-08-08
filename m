Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEA258CC4A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 18:43:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1hpP1pXHz3bxC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 02:43:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zwj8Pfj/;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=z8nffUQp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zwj8Pfj/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=z8nffUQp;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1hnk4fjrz2xKj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 02:42:34 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id EBB9033957;
	Mon,  8 Aug 2022 16:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1659976950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eCEQGHVmNw/cgwCaF0zGm8frJ7CvTePwYOpj6ZdhHkU=;
	b=zwj8Pfj/JakzPXURLrlS0ReAMfvX/5uASA/CF5HNZdC5sGir/BjvPZXAcV7AdGk+yC32/n
	cvXBDjpZDCtNU9XAgmrvGW+51yXpNj29GHZS9Ml42at9pUxASVaAw1aCqHSF9al+fSS26T
	0F0rYNXyeatXdSnA51/6pkrB4S0akuQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1659976950;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eCEQGHVmNw/cgwCaF0zGm8frJ7CvTePwYOpj6ZdhHkU=;
	b=z8nffUQp/r84zWBn1rgTRX5povHS/YFZA55vtYHlDAQKli35GGtnLfE0orehHRiv8XVZ2O
	nUrICPZT6Or4hUCQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 96D3A2C143;
	Mon,  8 Aug 2022 16:42:30 +0000 (UTC)
Date: Mon, 8 Aug 2022 18:42:29 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3a 1/2] lib: generic accessor functions for arch keystore
Message-ID: <20220808164229.GM17705@kitsune.suse.cz>
References: <20220808154345.11240-1-gjoyce@linux.vnet.ibm.com>
 <20220808154345.11240-2-gjoyce@linux.vnet.ibm.com>
 <1d4338cc-d7ec-383f-b201-222140a813bd@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d4338cc-d7ec-383f-b201-222140a813bd@csgroup.eu>
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>, "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, "gjoyce@linux.vnet.ibm.com" <gjoyce@linux.vnet.ibm.com>, "nayna@linux.ibm.com" <nayna@linux.ibm.com>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, "jonathan.derrick@linux.dev" <jonathan.derrick@linux.dev>, "brking@linux.vnet.ibm.com" <brking@linux.vnet.ibm.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 08, 2022 at 04:31:06PM +0000, Christophe Leroy wrote:
> 
> 
> Le 08/08/2022 � 17:43, gjoyce@linux.vnet.ibm.com a �crit�:
> > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > 
> > Generic kernel subsystems may rely on platform specific persistent
> > KeyStore to store objects containing sensitive key material. In such case,
> > they need to access architecture specific functions to perform read/write
> > operations on these variables.
> > 
> > Define the generic variable read/write prototypes to be implemented by
> > architecture specific versions. The default(weak) implementations of
> > these prototypes return -EOPNOTSUPP unless overridden by architecture
> > versions.
> > 
> > Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > ---
> >   include/linux/arch_vars.h | 23 +++++++++++++++++++++++
> >   lib/Makefile              |  2 +-
> >   lib/arch_vars.c           | 25 +++++++++++++++++++++++++
> >   3 files changed, 49 insertions(+), 1 deletion(-)
> >   create mode 100644 include/linux/arch_vars.h
> >   create mode 100644 lib/arch_vars.c
> > 
> > diff --git a/include/linux/arch_vars.h b/include/linux/arch_vars.h
> > new file mode 100644
> > index 000000000000..9c280ff9432e
> > --- /dev/null
> > +++ b/include/linux/arch_vars.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Platform variable opearations.
> 
> Is it platform specific or architecture specific ?
> 
> > + *
> > + * Copyright (C) 2022 IBM Corporation
> > + *
> > + * These are the accessor functions (read/write) for architecture specific
> > + * variables. Specific architectures can provide overrides.
> 
> "variables" is a very generic word which I think doesn't match what you 
> want to do.
> 
> For me "variables" are local variables and global variables in a C file. 
> Here it seems to be something completely different hence the name is 
> really meaningfull and misleading.
> 
> > + *
> > + */
> > +
> > +#include <linux/kernel.h>
> > +
> > +enum arch_variable_type {
> 
> arch_variable_type ? What's that ? variable types are char, short, long, 
> long long, etc ...
> 
> > +	ARCH_VAR_OPAL_KEY      = 0,     /* SED Opal Authentication Key */
> > +	ARCH_VAR_OTHER         = 1,     /* Other type of variable */
> > +	ARCH_VAR_MAX           = 1,     /* Maximum type value */
> > +};
> 
> Why the hell do you need an enum for two values only ?
> 
> > +
> > +int arch_read_variable(enum arch_variable_type type, char *varname,
> > +		       void *varbuf, u_int *varlen);
> > +int arch_write_variable(enum arch_variable_type type, char *varname,
> > +			void *varbuf, u_int varlen);
> > diff --git a/lib/Makefile b/lib/Makefile
> > index f99bf61f8bbc..b90c4cb0dbbb 100644
> > --- a/lib/Makefile
> > +++ b/lib/Makefile
> > @@ -48,7 +48,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
> >   	 bsearch.o find_bit.o llist.o memweight.o kfifo.o \
> >   	 percpu-refcount.o rhashtable.o \
> >   	 once.o refcount.o usercopy.o errseq.o bucket_locks.o \
> > -	 generic-radix-tree.o
> > +	 generic-radix-tree.o arch_vars.o
> >   obj-$(CONFIG_STRING_SELFTEST) += test_string.o
> >   obj-y += string_helpers.o
> >   obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o
> > diff --git a/lib/arch_vars.c b/lib/arch_vars.c
> > new file mode 100644
> > index 000000000000..e6f16d7d09c1
> > --- /dev/null
> > +++ b/lib/arch_vars.c
> 
> The name is meaningless, too generic.
> 
> 
> > @@ -0,0 +1,25 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Platform variable operations.
> 
> platform versus architecture ?
> 
> > + *
> > + * Copyright (C) 2022 IBM Corporation
> > + *
> > + * These are the accessor functions (read/write) for architecture specific
> > + * variables. Specific architectures can provide overrides.
> > + *
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/arch_vars.h>
> > +
> > +int __weak arch_read_variable(enum arch_variable_type type, char *varname,
> > +			      void *varbuf, u_int *varlen)
> 
> Sorry, to read a variable, I use READ_ONCE or I read it directly.

This is supposed to be used for things like the EFI variables and the
already existing powernv secure variables.

Nonetheless, without adding the plumbing for the existing
implementations it is not clear what it's doing, and the interface is
agruably meaningless.

Hence I would either suggest to provide the plumbing necessary for
existing (secure) variable implementations to make use of the interface,
or use private implementations like all the existing platforms do
without exposing the values in any generic way, and leave that to
somebody who is comfortable with designing a working general inteface
for this.

Thanks

Michal
