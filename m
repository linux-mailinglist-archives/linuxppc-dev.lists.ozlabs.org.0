Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9B25BF06E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 00:44:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXGn63dfnz3c6m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 08:44:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C8Pluupf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C8Pluupf;
	dkim-atps=neutral
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXGmX3VG6z2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 08:43:39 +1000 (AEST)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1278a61bd57so6498845fac.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 15:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=UreT1JFCWLwfJPYC+Sa2QhjvGuzvBwnaZ7R243GgYBI=;
        b=C8Pluupfoou+Dwog6ZapihxJf/eRoO0iYADDCtKbVAwT0ypAq784j8Ir/H6UrOmah4
         ArIFGR3h8xhtpxerjL1VPkl9lAyjRul+HG9Y9wo/jQ1K08A17CHbSH3i9YIwCrri7kMS
         2lrZgGlJTgyEjTi40N6mnkxusIfDX7NKzVAAe5tevO5Dk6l64OOw6C41ZwRs7jD7dVBu
         0rLbXgaBG1VobX7uGcsqfrt0M+ZwnrU9A5LqzdJfCZBWZe2R7Bgye0EpWhLjKTxsjvqd
         YEa5wvZiSanMeRknQrQsTwFv00wfacNX0pQdTkkvw6hNCaPu21CB9T89leZoECxi/3o7
         RM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=UreT1JFCWLwfJPYC+Sa2QhjvGuzvBwnaZ7R243GgYBI=;
        b=P9PpDOqg5I9uePP7AzQ8HzJJVrfPh8U15u5MXAO+CBQXfHNJO9etxsDdrQVqr9JKvH
         xLvJWTXBcchFmBUw3A7KWg+/7CnPqzG/PGtOIsJqY90JdZxE78u/kF1SCdN1ETGxKewa
         kxRpBZF6RZwSWdJiCz/h0xgGmXxipvBt/Ii6F4vC3tUjKErVBjeImju2/FAMHB61K/6+
         d2dWFJft6wibfWWObV8ZDu5Fyro3SmkT1Eba28vl+MENjqr+XSpnyHmj/lus5VkIH88y
         CuHdEDQ6fkDV6vUXrCz0X6VNFUt4TXeHVWlohBE5E6oqHXC7ttMDtP4Q+nQ4ezmI/GCP
         6Gcg==
X-Gm-Message-State: ACrzQf1ohFhSV5sgNoHfFfarFJyCm5s3jSRjTywjQg3Z4qTx+ynQXvQV
	SXmf9HPVUM2YYAV38SPR52w=
X-Google-Smtp-Source: AMsMyM6kfmQfPNwBUXbkl3FQCfaOIXPlbr+N/kHTbA6GXWkd3ix3i4AgpZpcTWdqwtuHvVCQvTfnzQ==
X-Received: by 2002:a05:6870:f29f:b0:12c:be38:cec6 with SMTP id u31-20020a056870f29f00b0012cbe38cec6mr3406034oap.109.1663713815908;
        Tue, 20 Sep 2022 15:43:35 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id 187-20020aca06c4000000b0033e8629b323sm484430oig.35.2022.09.20.15.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 15:43:35 -0700 (PDT)
Date: Tue, 20 Sep 2022 15:41:23 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] powerpc/64: don't refer nr_cpu_ids in asm code when it's
 undefined
Message-ID: <YypBk2gtlVCUBNXx@yury-laptop>
References: <20220920152935.1569605-1-yury.norov@gmail.com>
 <20220921082006.2235b7d2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921082006.2235b7d2@canb.auug.org.au>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org, Alan Modra <amodra@au1.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 21, 2022 at 08:20:06AM +1000, Stephen Rothwell wrote:
> Hi Yury,
> 
> On Tue, 20 Sep 2022 08:29:35 -0700 Yury Norov <yury.norov@gmail.com> wrote:
> >
> 
> > diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
> > index cf2c08902c05..7cb97881635e 100644
> > --- a/arch/powerpc/kernel/head_64.S
> > +++ b/arch/powerpc/kernel/head_64.S
> > @@ -400,7 +400,11 @@ generic_secondary_common_init:
> >  #else
> >  	LOAD_REG_ADDR(r8, paca_ptrs)	/* Load paca_ptrs pointe	 */
> >  	ld	r8,0(r8)		/* Get base vaddr of array	 */
> > +#if (NR_CPUS == 1) || defined(CONFIG_FORCE_NR_CPUS)
> > +	LOAD_REG_IMMEDIATE(r7, NR_CPUS)
> > +#else
> >  	LOAD_REG_ADDR(r7, nr_cpu_ids)	/* Load nr_cpu_ids address       */
> > +#endif
> >  	lwz	r7,0(r7)		/* also the max paca allocated 	 */
> >  	li	r5,0			/* logical cpu id                */
> >  1:
> > -- 
> > 2.34.1
> > 
> 
> I don't know PPC assembly very well, but should the #endif be one line
> lower so that the constant is not dereferenced in the non-#else case? 

Looks like you're right. Thanks, I'll send a v2.
