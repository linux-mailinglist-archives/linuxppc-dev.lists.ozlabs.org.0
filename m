Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEF767EE1D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 20:24:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3SFh1Ktzz3fK4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 06:24:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LIT8Frfl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LIT8Frfl;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3SDj4Smsz3fCW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:24:03 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id e8-20020a17090a9a8800b0022c387f0f93so4544488pjp.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W2ttKujJthD1r1Z4ZbanCKPljAQjrJZL0v7kGBHOnxQ=;
        b=LIT8FrflzvmNjKlokavj8t9qklGf2z+fC5ZXmVTg/V1WPzhjXoIxMLl3TGOd9P1czB
         0P6t8CHdT3hPjs2p2eC2FRuQZZNuA72Uo5CW4xKyEWE3u69ZSA9phUlewzcVNiluTUFv
         N1GZJ1p9tvn3GosvLI7w5vR5yA3G9r1uI5w7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2ttKujJthD1r1Z4ZbanCKPljAQjrJZL0v7kGBHOnxQ=;
        b=VCsqYNF55jjvLRHlkJkJd1YTJa6p8iCCRhpa+gpwQqrGXIZ9WMxPT1HCCCJeh1v3WN
         s1pjUR4zoiL50wsNOOpAIug3ML+basOXEQGtROfHen0LmAUHRBzIcTILPze+Tx/wx6yA
         rc+E16mRopVD/vGtFHwc1wbuuoJTgQ/x9vbfuGPwnXwK8CBv+r98iQZKSIjatNxMHWNP
         /44HXOq7lWr6DS2BkB1RsaoT9OrEuQM+DVbEwqwjEWRxW2o82dCzivWRrAOcWkeLl6Yq
         Ksn1CS+pMo+dYlT417EZnHyN7gj4MSgUmP8+hJv44oB6tf1aRSpybr49Rur+g+K2JPXh
         ohdw==
X-Gm-Message-State: AO0yUKVbQwvavuWiqL/wOe5sM0q7+rWo0+RKZqCVZulat0hEP3JCnJdS
	5e4/mhecARUnRbTR+pQC+Q0gqw==
X-Google-Smtp-Source: AK7set9Y1R4fNYl5iiJNjPVCiIEga/WC7wAX+mM99tGpF1Yw6uDJ7Etw+186f9uQO1JeU43343EDGA==
X-Received: by 2002:a17:90b:1c0d:b0:22c:10e2:9e3f with SMTP id oc13-20020a17090b1c0d00b0022c10e29e3fmr10343020pjb.0.1674847438428;
        Fri, 27 Jan 2023 11:23:58 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g8-20020a17090a708800b00213202d77d9sm3034456pjk.43.2023.01.27.11.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 11:23:58 -0800 (PST)
Date: Fri, 27 Jan 2023 11:23:57 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: Replace one-element arrays with flexible
 arrays
Message-ID: <202301271120.B83DA0B3@keescook>
References: <20230127085023.271674-1-ajd@linux.ibm.com>
 <87357wp1h7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87357wp1h7.fsf@linux.ibm.com>
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
Cc: Leonardo Bras <leobras.c@gmail.com>, linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 27, 2023 at 07:10:28AM -0600, Nathan Lynch wrote:
> Andrew Donnellan <ajd@linux.ibm.com> writes:
> > Using a one-element array as a fake flexible array is deprecated.
> >
> > Replace the one-element flexible arrays in rtas-types.h with C99 standard
> > flexible array members instead.
> >
> > This helps us move towards enabling -fstrict-flex-arrays=3 in future.
> >
> > Found using scripts/coccinelle/misc/flexible_array.cocci.
> >
> > Cc: Nathan Lynch <nathanl@linux.ibm.com>
> > Cc: Leonardo Bras <leobras.c@gmail.com>
> > Cc: linux-hardening@vger.kernel.org
> > Link: https://github.com/KSPP/linux/issues/21
> > Link: https://github.com/KSPP/linux/issues/79
> > Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/rtas-types.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/rtas-types.h b/arch/powerpc/include/asm/rtas-types.h
> > index 8df6235d64d1..40ec03a05c0b 100644
> > --- a/arch/powerpc/include/asm/rtas-types.h
> > +++ b/arch/powerpc/include/asm/rtas-types.h
> > @@ -44,7 +44,7 @@ struct rtas_error_log {
> >  	 */
> >  	u8		byte3;			/* General event or error*/
> >  	__be32		extended_log_length;	/* length in bytes */
> > -	unsigned char	buffer[1];		/* Start of extended log */
> > +	unsigned char	buffer[];		/* Start of extended log */
> >  						/* Variable length.      */
> >  };
> >  
> > @@ -85,7 +85,7 @@ struct rtas_ext_event_log_v6 {
> >  					/* that defines the format for	*/
> >  					/* the vendor specific log type	*/
> >  	/* Byte 16-end of log */
> > -	u8 vendor_log[1];		/* Start of vendor specific log	*/
> > +	u8 vendor_log[];		/* Start of vendor specific log	*/
> >  					/* Variable length.		*/
> >  };
> 
> I see at least one place that consults the size of one of these structs,
> in get_pseries_errorlog():
> 
> 	/* Check that we understand the format */
> 	if (ext_log_length < sizeof(struct rtas_ext_event_log_v6) || ...
> 
> Don't all such sites need to be audited/adjusted for changes like this?

Yeah, I'd expect a binary comparison[1] before/after to catch things like
this. E.g. the following C files mention those structs:

arch/powerpc/platforms/pseries/io_event_irq.c
arch/powerpc/platforms/pseries/ras.c
arch/powerpc/kernel/rtasd.c
arch/powerpc/kernel/rtas.c

-Kees

[1] https://outflux.net/blog/archives/2022/06/24/finding-binary-differences/

-- 
Kees Cook
