Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A1F42FD87
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 23:36:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWKN21qc6z3c8f
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 08:36:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i/plbNWQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=i/plbNWQ; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWKMJ6vtrz2xXc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 08:35:56 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso2699718pjw.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 14:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fXK9I7sL2UAvUUHr680VS0N7hcJaT8a/qC/oAjWAekg=;
 b=i/plbNWQsfMbAtipP0bedfIRhU9GtT0vQBPBSqxQOXPLHpycgRU2/2eFgrucmm2h2H
 jyUzWsmXl3g4lj7XR6uQJW5kj6zHZDhfr5oLknCnvhs4hYYOrFP7YzLzzikPK/mnLAUp
 qzqAv/u7xWCe7UATWzGpSateqcXcucSLev7S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fXK9I7sL2UAvUUHr680VS0N7hcJaT8a/qC/oAjWAekg=;
 b=ADphitqyV2eFj1/IGcpq0sM2/EQZkMHZaB1tJsOLUMHEeFISktjcsPw8tg70jOX+t4
 BAGAdQPHWQqwODL4+F9djjPt3fwYKvTRWaPs6vnrlDaiSR6nKhR7oFEa6CvqVyTcK2L5
 wLv7e0poWiDIKntZOgVt7VTCcE6Uh29gDF4AXEzmnnULTzFptbgFPgX9iUpOz5J24P/Z
 m2k6Ulp2JzOaVpReWO6lrH3tzIXgrx11C8bzD3cZPUlwMbTXA1EOzEY75xM0f14n9m9A
 ahzBxpOy9GO9F6RqE1ZEIEP4coz6+zjjLYmahvtD3hgfS4YyZT4Ko3Iza5WBrMjQq/dE
 OvHQ==
X-Gm-Message-State: AOAM530pdIqzd6skULIp8fCmYWadYIiWkdcb6E1zgheJXw45BZqxMgLZ
 KI7VFn1OpIDbxSC/8sF+J5epzg==
X-Google-Smtp-Source: ABdhPJzGiIkXXBmy5DDoWMNsGgWcXqtw/xBNMBOjRI4bsAE2X+6lsLV+71+RhBCvt+ERtsGfcdpHpA==
X-Received: by 2002:a17:90b:1a86:: with SMTP id
 ng6mr16246857pjb.120.1634333745601; 
 Fri, 15 Oct 2021 14:35:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q10sm5538176pgn.31.2021.10.15.14.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 14:35:45 -0700 (PDT)
Date: Fri, 15 Oct 2021 14:35:44 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 13/13] lkdtm: Add a test for function descriptors
 protection
Message-ID: <202110151433.6270D717@keescook>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <08a3dfbc55e1c7a0a1917b22f0ca6cabd9895ab2.1634190022.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08a3dfbc55e1c7a0a1917b22f0ca6cabd9895ab2.1634190022.git.christophe.leroy@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 14, 2021 at 07:50:02AM +0200, Christophe Leroy wrote:
> Add WRITE_OPD to check that you can't modify function
> descriptors.
> 
> Gives the following result when function descriptors are
> not protected:
> 
> 	lkdtm: Performing direct entry WRITE_OPD
> 	lkdtm: attempting bad 16 bytes write at c00000000269b358
> 	lkdtm: FAIL: survived bad write
> 	lkdtm: do_nothing was hijacked!
> 
> Looks like a standard compiler barrier(); is not enough to force
> GCC to use the modified function descriptor. Add to add a fake empty
> inline assembly to force GCC to reload the function descriptor.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/misc/lkdtm/core.c  |  1 +
>  drivers/misc/lkdtm/lkdtm.h |  1 +
>  drivers/misc/lkdtm/perms.c | 22 ++++++++++++++++++++++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> index fe6fd34b8caf..de092aa03b5d 100644
> --- a/drivers/misc/lkdtm/core.c
> +++ b/drivers/misc/lkdtm/core.c
> @@ -148,6 +148,7 @@ static const struct crashtype crashtypes[] = {
>  	CRASHTYPE(WRITE_RO),
>  	CRASHTYPE(WRITE_RO_AFTER_INIT),
>  	CRASHTYPE(WRITE_KERN),
> +	CRASHTYPE(WRITE_OPD),
>  	CRASHTYPE(REFCOUNT_INC_OVERFLOW),
>  	CRASHTYPE(REFCOUNT_ADD_OVERFLOW),
>  	CRASHTYPE(REFCOUNT_INC_NOT_ZERO_OVERFLOW),
> diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
> index c212a253edde..188bd0fd6575 100644
> --- a/drivers/misc/lkdtm/lkdtm.h
> +++ b/drivers/misc/lkdtm/lkdtm.h
> @@ -105,6 +105,7 @@ void __init lkdtm_perms_init(void);
>  void lkdtm_WRITE_RO(void);
>  void lkdtm_WRITE_RO_AFTER_INIT(void);
>  void lkdtm_WRITE_KERN(void);
> +void lkdtm_WRITE_OPD(void);
>  void lkdtm_EXEC_DATA(void);
>  void lkdtm_EXEC_STACK(void);
>  void lkdtm_EXEC_KMALLOC(void);
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 96b3ebfcb8ed..3870bc82d40d 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -44,6 +44,11 @@ static noinline void do_overwritten(void)
>  	return;
>  }
>  
> +static noinline void do_almost_nothing(void)
> +{
> +	pr_info("do_nothing was hijacked!\n");
> +}
> +
>  static void *setup_function_descriptor(func_desc_t *fdesc, void *dst)
>  {
>  	memcpy(fdesc, do_nothing, sizeof(*fdesc));
> @@ -143,6 +148,23 @@ void lkdtm_WRITE_KERN(void)
>  	do_overwritten();
>  }
>  
> +void lkdtm_WRITE_OPD(void)
> +{
> +	size_t size = sizeof(func_desc_t);
> +	void (*func)(void) = do_nothing;
> +
> +	if (!have_function_descriptors()) {
> +		pr_info("Platform doesn't have function descriptors.\n");

This should be more explicit ('xfail'):

	pr_info("XFAIL: platform doesn't use function descriptors.\n");

> +		return;
> +	}
> +	pr_info("attempting bad %zu bytes write at %px\n", size, do_nothing);
> +	memcpy(do_nothing, do_almost_nothing, size);
> +	pr_err("FAIL: survived bad write\n");
> +
> +	asm("" : "=m"(func));

Since this is a descriptor, I assume no icache flush is needed. Are
function descriptors strictly dcache? (Is anything besides just a
barrier needed?)

> +	func();
> +}
> +
>  void lkdtm_EXEC_DATA(void)
>  {
>  	execute_location(data_area, CODE_WRITE);
> -- 
> 2.31.1
> 

-- 
Kees Cook
