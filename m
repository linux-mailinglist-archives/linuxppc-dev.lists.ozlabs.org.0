Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C69D2EE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 18:50:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pxsv6b1gzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 03:50:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="izpAwLJ1";
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pxpC6n3zzDqQc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 03:47:31 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id w8so3061136plq.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 09:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e1YZSnr+tf37urRS0Z3ujXsrRMc5cw+9H7NAi1i2jVA=;
 b=izpAwLJ1ZfINeJ1IGvzXfqW7v0EVcZgsTyN1EOshDrEdBCIUSqkIleCU5BZWm63bPM
 eZKMQCfAts2ypPUa2YAeUCHOY9OigZ+1dV2iaRJWF3dFNdzuaPxx+X7j5M9nVPDl6n5z
 T3tK6luCqjuU0Ibyy5rvMfcc7jZy+Z/gsIufM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e1YZSnr+tf37urRS0Z3ujXsrRMc5cw+9H7NAi1i2jVA=;
 b=k/3eQIusnx5K5yK2F6FKhK8eoio9Y3IFWkTEdvSg7FTbsdMDFnOrbqMH2KfGpTeX+6
 HIPuMwZi97NgcNgTNGE+W4UDZcHR9ylYPtx32ZbjE12ctmDq5NnQugw52PUvblVr3jHX
 kJtqpKwQmFPxGEz1e6eYihgq/ZSmvXtAziMtKVsB35PF78swPjTNSTrpqOzjA1UJ8yLM
 AXKRYQAQDv5VaQleLEIB/nI8Wb5TmKi8ch+aqkP+kV4HEXpeFKahVi/v7AxUekMHpwPD
 HkTRJ4G7bqb0CqJy561fFvFyug2i+irV8fMDej26AyVxU4c84324ZmhRDkjqXFXkYK6i
 DtJQ==
X-Gm-Message-State: APjAAAWxvlf5wT3n71l7rDNyKcmrvEmbL0uq9d2TOxEZvGR1Skfef+WK
 gop8YhFh0Rk6SFHmr3R+e+9kPQ==
X-Google-Smtp-Source: APXvYqzOHOGfFvHHv3LUcDdUgo528S5MG4NnAaB5IQ1fyDZOtJwryOAp83caQNAMb12Fx3S0UUC80Q==
X-Received: by 2002:a17:902:8f92:: with SMTP id
 z18mr9844183plo.230.1570726048308; 
 Thu, 10 Oct 2019 09:47:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h68sm8085569pfb.149.2019.10.10.09.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 09:47:27 -0700 (PDT)
Date: Thu, 10 Oct 2019 09:47:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 14/29] vmlinux.lds.h: Allow EXCEPTION_TABLE to live in
 RO_DATA
Message-ID: <201910100947.AC066B160@keescook>
References: <20190926175602.33098-1-keescook@chromium.org>
 <20190926175602.33098-15-keescook@chromium.org>
 <20191010152516.GG7658@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010152516.GG7658@zn.tnic>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ingo Molnar <mingo@redhat.com>, linux-parisc@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 10, 2019 at 05:25:16PM +0200, Borislav Petkov wrote:
> On Thu, Sep 26, 2019 at 10:55:47AM -0700, Kees Cook wrote:
> > Many architectures have an EXCEPTION_TABLE that needs only to be
> > read-only. As such, it should live in RO_DATA. This creates a macro to
> > identify this case for the architectures that can move EXCEPTION_TABLE
> > into RO_DATA.
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  include/asm-generic/vmlinux.lds.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> > index d57a28786bb8..35a6cba39d9f 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -69,6 +69,17 @@
> >  #define NOTES_HEADERS_RESTORE
> >  #endif
> >  
> > +/*
> > + * Some architectures have non-executable read-only exception tables.
> > + * They can be added to the RO_DATA segment by specifying their desired
> > + * alignment.
> > + */
> > +#ifdef RO_DATA_EXCEPTION_TABLE_ALIGN
> > +#define RO_DATA_EXCEPTION_TABLE	EXCEPTION_TABLE(RO_DATA_EXCEPTION_TABLE_ALIGN)
> > +#else
> > +#define RO_DATA_EXCEPTION_TABLE
> > +#endif
> > +
> >  /* Align . to a 8 byte boundary equals to maximum function alignment. */
> >  #define ALIGN_FUNCTION()  . = ALIGN(8)
> >  
> > @@ -508,6 +519,7 @@
> >  		__stop___modver = .;					\
> >  	}								\
> >  									\
> > +	RO_DATA_EXCEPTION_TABLE						\
> >  	NOTES								\
> >  									\
> >  	. = ALIGN((align));						\
> > -- 
> 
> I think you can drop the "DATA" from the names as it is kinda clear
> where the exception table lands:
> 
> RO_EXCEPTION_TABLE_ALIGN
> RO_EXCEPTION_TABLE
> 
> The "read-only" part is the important one.

Excellent point; I was not loving the how long the name was either. :)

-- 
Kees Cook
