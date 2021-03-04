Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6556132DBB0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 22:21:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ds3hC2ybXz3dCt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 08:21:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=DSssbEI4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.94; helo=alln-iport-7.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=DSssbEI4; dkim-atps=neutral
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ds3gl1R5Dz3cPv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 08:20:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=10914; q=dns/txt;
 s=iport; t=1614892851; x=1616102451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8JtlaLJV5siybC4sBTIu5DDiXD+4jEH6yTlOhUTotYQ=;
 b=DSssbEI4UUBVmnNB3+MYgWJLte1Ww41hb+6z6AQQC7sg3NKqGa5f7RxZ
 dZIE3+yefKUndSk3LvYE0kOjfecAeubaeBkxa3xt7IVkB3YhoTU/Pdbkc
 uBRK/slkCnBVVp5J0G0cORpb7WXgHrrb1P4jO+0Ayl893w7j8+UEDiDgr Q=;
X-IronPort-AV: E=Sophos;i="5.81,223,1610409600"; d="scan'208";a="655736910"
Received: from alln-core-8.cisco.com ([173.36.13.141])
 by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 04 Mar 2021 21:20:44 +0000
Received: from zorba ([10.24.1.42])
 by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 124LKgTA003999
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 4 Mar 2021 21:20:43 GMT
Date: Thu, 4 Mar 2021 13:20:42 -0800
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/5] CMDLINE: add generic builtin command line
Message-ID: <20210304212042.GJ109100@zorba>
References: <20210304044803.812204-1-danielwa@cisco.com>
 <da33aa9e-ffd8-b012-0f2d-c9ad05f32b8f@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da33aa9e-ffd8-b012-0f2d-c9ad05f32b8f@csgroup.eu>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.1.42, [10.24.1.42]
X-Outbound-Node: alln-core-8.cisco.com
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
Cc: ob Herring <robh@kernel.org>, Ruslan Bilovol <rbilovol@cisco.com>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, xe-linux-external@cisco.com,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 04, 2021 at 08:00:49AM +0100, Christophe Leroy wrote:
> 
> 
> Le 04/03/2021 à 05:47, Daniel Walker a écrit :
> > This code allows architectures to use a generic builtin command line.
> > The state of the builtin command line options across architecture is
> > diverse. On x86 and mips they have pretty much the same code and the
> > code prepends the builtin command line onto the boot loader provided
> > one. On powerpc there is only a builtin override and nothing else.
> 
> This is not exact. powerpc has:
> CONFIG_FROM_BOOTLOADER
> CONFIG_EXTEND
> CONFIG_FORCE
 
I don't currently have ppc64 to test on, but CONFIG_FROM_BOOTLOADER should likely
stay, but the other two can come from the generic code.


> > 
> > The code in this commit unifies the code into a generic
> > header file under the CONFIG_GENERIC_CMDLINE option. When this
> > option is enabled the architecture can call the cmdline_add_builtin()
> > to add the builtin command line.
> > 
> > Cc: xe-linux-external@cisco.com
> > Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> > Signed-off-by: Daniel Walker <danielwa@cisco.com>
> > ---
> >   include/linux/cmdline.h | 75 +++++++++++++++++++++++++++++++++++++++++
> >   init/Kconfig            | 68 +++++++++++++++++++++++++++++++++++++
> >   2 files changed, 143 insertions(+)
> >   create mode 100644 include/linux/cmdline.h
> > 
> > diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
> > new file mode 100644
> > index 000000000000..f44011d1a9ee
> > --- /dev/null
> > +++ b/include/linux/cmdline.h
> > @@ -0,0 +1,75 @@
> 
> Missing the SPDX Licence Identifier
> 
> > +#ifndef _LINUX_CMDLINE_H
> > +#define _LINUX_CMDLINE_H
> > +
> > +/*
> > + *
> > + * Copyright (C) 2006,2021. Cisco Systems, Inc.
> > + *
> > + * Generic Append/Prepend cmdline support.
> > + */
> > +
> > +#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_CMDLINE_BOOL)
> 
> I think it would be better if we can avoid the CONFIG_CMDLINE_BOOL.
> By making the CMDLINEs default to "" at all time, I think we can about that BOOL.

Wouldn't it be annoying if you have to deleted all the characters from two text
boxes vs. just disabling a single option ? What if you leave a space
accidentally , woops.

> > +
> > +#ifndef CONFIG_CMDLINE_OVERRIDE
> > +/*
> > + * This function will append or prepend a builtin command line to the command
> 
> As far as I understand, it doesn't "append _or_ prepend" but it does "append _and_ prepend"

I think the end results is accurately , no need to get pedantic.

> > + * line provided by the bootloader. Kconfig options can be used to alter
> > + * the behavior of this builtin command line.
> > + * @dest: The destination of the final appended/prepended string
> > + * @src: The starting string or NULL if there isn't one.
> > + * @tmp: temporary space used for prepending
> > + * @length: the maximum length of the strings above.
> 
> Missing some parameters here, but I think we should avoid those 'strlcpy'
> and 'strlcat', see later comment.
> 
> > + */
> > +static inline void
> > +__cmdline_add_builtin(char *dest, const char *src, char *tmp, unsigned long length,
> > +		size_t (*strlcpy)(char *dest, const char *src, size_t size),
> > +		size_t (*strlcat)(char *dest, const char *src, size_t count)
> 
> Don't use names that overide names of existing functions.
> 
> 'count' is __kernel_size_t not size_t
 
It's type checking all the parameters at compile time, it doesn't complain about
this that I've seen.


> > +		)
> > +{
> > +	if (src != dest && src != NULL) {
> > +		strlcpy(dest, " ", length);
> 
> Why do you need a space up front in that case ? Why not just copy the source to the destination ?

There may not be a space between them, it doesn't cost anything to have one.

> > +		strlcat(dest, src, length);
> > +	}
> > +
> > +	if (sizeof(CONFIG_CMDLINE_APPEND) > 1)
> > +		strlcat(dest, " " CONFIG_CMDLINE_APPEND, length);
> > +
> > +	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) {
> > +		strlcpy(tmp, CONFIG_CMDLINE_PREPEND " ", length);
> > +		strlcat(tmp, dest, length);
> > +		strlcpy(dest, tmp, length);
> 
> Could we use memmove(), or implement strmove() and avoid the temporary buffer at all ?

I don't really want to make drastic alteration like this, unless there is a
better reason for it. Most of this hasn't change inside Cisco's tree for almost a decade.

> > +	}
> > +}
> > +
> > +#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) 			\
> 
> It is misleading to call parameters 'strlcpy' or 'strlcat', it hides that they are overriden.

I can change the names, it's not a big deal.

> > +{ 												\
> > +	if (sizeof(CONFIG_CMDLINE_PREPEND) > 1) { 						\
> > +		static label char cmdline_tmp_space[length]; 					\
> 
> Let the architecture define the temporary space when using the custom
> variant instead of just asking the architecture to provide the name of the
> section to use. powerpc already have prom_scratch for that.
 
How would it use this space exactly ? Is it large enough ? How is it managed?


> > +		__cmdline_add_builtin(dest, src, cmdline_tmp_space, length, strlcpy, strlcat); 	\
> > +	} else if (sizeof(CONFIG_CMDLINE_APPEND) > 1) { 					\
> > +		__cmdline_add_builtin(dest, src, NULL, length, strlcpy, strlcat); 		\
> > +	} 											\
> 
> Ah, so if I understand correctly, the user can set both
> CONFIG_CMDLINE_PREPEND and CONFIG_CMDLINE_APPEND but one of them is silently
> ignored.
 
Nothing should be ignored. Either one set gets you into the function, just one
has to create a variable.

> Then I think we should just offer the user to set one, name it
> CONFIG_CMDLINE then ask him to choose between FORCE, APPEND or PREPEND.

No, this doesn't work for Cisco. We need to functionality of this solution,
nothing less..

> > +}
> > +#define cmdline_add_builtin(dest, src, length)	                           \
> > +	cmdline_add_builtin_custom(dest, src, length, __initdata, &strlcpy, &strlcat)
> > +#else
> > +#define cmdline_add_builtin(dest, src, length)				   \
> > +{								  	   \
> > +	strlcpy(dest, CONFIG_CMDLINE_PREPEND " " CONFIG_CMDLINE_APPEND,    \
> > +		length);		   				   \
> > +}
> > +#endif /* !CONFIG_CMDLINE_OVERRIDE */
> > +
> > +#else
> > +#define cmdline_add_builtin_custom(dest, src, length, label, strlcpy, strlcat) { \
> > +	if (src != NULL) 							 \
> > +		strlcpy(dest, src, length);	 				 \
> > +}
> > +
> > +#define cmdline_add_builtin(dest, src, length) { 				\
> > +	cmdline_add_builtin_custom(dest, src, length, strlcpy, strlcat); 	\
> > +}
> > +#endif /* CONFIG_GENERIC_CMDLINE */
> 
> I'd rather avoid all those macros and use static inline functions instead.
 
The last two in the off case might be able to be converted.

> For the strlcpy() and strlcat(), use another name, for instance
> cmdline_strlcpy and cmdline_strlcat. Then at the begining of the file,
> define them as strlcpy ad strlcat unless they are already defined to
> something else (by the architecture before including cmdline.h).
 

Your duplicating your comments.


> > +
> > +
> > +#endif /* _LINUX_CMDLINE_H */
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 29ad68325028..28363ab07cd4 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -2032,6 +2032,74 @@ config PROFILING
> >   config TRACEPOINTS
> >   	bool
> > +config GENERIC_CMDLINE
> > +	bool
> > +
> > +if GENERIC_CMDLINE
> > +
> > +config CMDLINE_BOOL
> > +	bool "Built-in kernel command line"
> 
> We don't need the CMDLINE_BOOL, just have CMDLINE always "" by default.
 
I think it's more usable as explained above.


> > +	help
> > +	  Allow for specifying boot arguments to the kernel at
> > +	  build time.  On some systems (e.g. embedded ones), it is
> > +	  necessary or convenient to provide some or all of the
> > +	  kernel boot arguments with the kernel itself (that is,
> > +	  to not rely on the boot loader to provide them.)
> > +
> > +	  To compile command line arguments into the kernel,
> > +	  set this option to 'Y', then fill in the
> > +	  the boot arguments in CONFIG_CMDLINE.
> > +
> > +	  Systems with fully functional boot loaders (i.e. non-embedded)
> > +	  should leave this option set to 'N'.
> > +
> > +config CMDLINE_APPEND
> 
> As far as I understand, the generic code will only take CMDLINE_APPEND into
> account if CMDLINE_PREPEND doesn't exist, otherwise it will silently ignore
> it.

No, that's not how that works.

> Only offer one string: CONFIG_CMDLINE, and make the use choose between APPEND, EXTEND or OVERRIDE

No. That's not how this works.

> > +	string "Built-in kernel command string append"
> > +	depends on CMDLINE_BOOL
> > +	default ""
> > +	help
> > +	  Enter arguments here that should be compiled into the kernel
> > +	  image and used at boot time.  If the boot loader provides a
> > +	  command line at boot time, this string is appended to it to
> > +	  form the full kernel command line, when the system boots.
> > +
> > +	  However, you can use the CONFIG_CMDLINE_OVERRIDE option to
> > +	  change this behavior.
> > +
> > +	  In most cases, the command line (whether built-in or provided
> > +	  by the boot loader) should specify the device for the root
> > +	  file system.
> > +
> > +config CMDLINE_PREPEND
> > +	string "Built-in kernel command string prepend"
> > +	depends on CMDLINE_BOOL
> > +	default ""
> > +	help
> > +	  Enter arguments here that should be compiled into the kernel
> > +	  image and used at boot time.  If the boot loader provides a
> > +	  command line at boot time, this string is prepended to it to
> > +	  form the full kernel command line, when the system boots.
> > +
> > +	  However, you can use the CONFIG_CMDLINE_OVERRIDE option to
> > +	  change this behavior.
> > +
> > +	  In most cases, the command line (whether built-in or provided
> > +	  by the boot loader) should specify the device for the root
> > +	  file system.
> > +
> > +config CMDLINE_OVERRIDE
> > +	bool "Built-in command line overrides boot loader arguments"
> > +	depends on CMDLINE_BOOL
> > +	help
> > +	  Set this option to 'Y' to have the kernel ignore the boot loader
> > +	  command line, and use ONLY the built-in command line. In this case
> > +	  append and prepend strings are concatenated to form the full
> > +	  command line.
> > +
> > +	  This is used to work around broken boot loaders.  This should
> > +	  be set to 'N' under normal conditions.
> > +endif
> > +
> >   endmenu		# General setup
> >   source "arch/Kconfig"
> > 
> 
> Christophe


Most of your comments are the kind of things this code went thru on it's first
implementation, and were discarded for a reason during usage and testing.

Daniel

