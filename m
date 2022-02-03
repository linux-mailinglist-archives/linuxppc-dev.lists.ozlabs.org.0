Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFBB4A82B2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 11:50:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqFn02MJ8z3cPC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 21:50:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HaY3A8a7;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4EJKGBft;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HaY3A8a7; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4EJKGBft; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqFmG28CSz2xsY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 21:49:34 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 831C61F399;
 Thu,  3 Feb 2022 10:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643885369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a6gXtaxF4sUpqNbpvqW3e+eeQ67Q3V181j1MpX5xCXw=;
 b=HaY3A8a7CHu+p6SkQfzXFxoRVgaixyso1zTY8l10onfr+4M1WM6Keh9Ypvjdw1ey18+Cq8
 Pz48XGKgBpP8Ki2zWHuhHY1Gy46s/PE0MAZ4LbmxhJWmPuIQIKdMYbozDUo4+Q7MCpXRpB
 UgCTlfrM191QhW6/Am1jz3JKp4une/4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643885369;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a6gXtaxF4sUpqNbpvqW3e+eeQ67Q3V181j1MpX5xCXw=;
 b=4EJKGBft4bAsvWMXkRCyg9VCRvMq2sAKI0INSYlhae42A7n/QFT0juKBfObRurO+3478Iw
 wdlekzqTUvDT8pBQ==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 7AACFA3B85;
 Thu,  3 Feb 2022 10:49:27 +0000 (UTC)
Date: Thu, 3 Feb 2022 11:49:26 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v5 3/6] kexec_file: Don't opencode appended signature
 verification.
Message-ID: <20220203104926.GA3113@kunlun.suse.cz>
References: <cover.1641900831.git.msuchanek@suse.de>
 <7834eb187ef67cd88fc67f10e831130e3717d776.1641900831.git.msuchanek@suse.de>
 <YfBafIXgnLzf0QMb@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfBafIXgnLzf0QMb@bombadil.infradead.org>
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

thanks for the review.

On Tue, Jan 25, 2022 at 12:15:56PM -0800, Luis Chamberlain wrote:
> On Tue, Jan 11, 2022 at 12:37:45PM +0100, Michal Suchanek wrote:
> > diff --git a/include/linux/verification.h b/include/linux/verification.h
> > index a655923335ae..32db9287a7b0 100644
> > --- a/include/linux/verification.h
> > +++ b/include/linux/verification.h
> > @@ -60,5 +60,8 @@ extern int verify_pefile_signature(const void *pebuf, unsigned pelen,
> >  				   enum key_being_used_for usage);
> >  #endif
> >  
> > +int verify_appended_signature(const void *data, unsigned long *len,
> > +			      struct key *trusted_keys, const char *what);
> > +
> 
> Looks very non-module specific.

Which it is now that the same signature format is used for kernels.

> 
> > diff --git a/kernel/module_signing.c b/kernel/module_signing.c
> > index 8723ae70ea1f..30149969f21f 100644
> > --- a/kernel/module_signing.c
> > +++ b/kernel/module_signing.c
> > @@ -14,32 +14,38 @@
> >  #include <crypto/public_key.h>
> >  #include "module-internal.h"
> >  
> > -/*
> > - * Verify the signature on a module.
> > +/**
> > + * verify_appended_signature - Verify the signature on a module with the
> > + * signature marker stripped.
> > + * @data: The data to be verified
> > + * @len: Size of @data.
> > + * @trusted_keys: Keyring to use for verification
> > + * @what: Informational string for log messages
> >   */
> > -int mod_verify_sig(const void *mod, struct load_info *info)
> > +int verify_appended_signature(const void *data, unsigned long *len,
> > +			      struct key *trusted_keys, const char *what)
> >  {
> > -	struct module_signature ms;
> > -	size_t sig_len, modlen = info->len;
> > +	struct module_signature *ms;
> 
> There goes the abstraction, so why not make this clear where we re-use
> the struct module_signature for various things and call it as it is,
> verify_mod_appended_signature() or some such?

It sounds like the abstraction is actually improved by callers no longer
dealing with struct module_signature when verifying signature on a
kernel. That is the structure is misnamed but it is now hidden behind
an abstraction.

Or am I missing something?

Thanks

Michal
