Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A24E54655F1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 19:55:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J47Zs3LzJz3bN8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 05:55:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hPT+ALqX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=hPT+ALqX; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J47Z669B3z2ynt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 05:55:08 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id p18so18404616plf.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 10:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1ExD0+swPLV06IbML+nCZJEqWUERlwvAbaLR0RlV1zc=;
 b=hPT+ALqXUH21V1OTdW/CVBcm8UuReC0RQCOoVzZAuEuSo7UXydXVha4iByMVdYpzPp
 a52o4jnAAwZQTe8/ecpvLke2XmvpALeHXtUVJX6bh+izeRwW5h6xVxfIdohu6zmKH5cX
 l8mKvxHnOxlgMu8ipJKZFKooxAwMuoRwm/N3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1ExD0+swPLV06IbML+nCZJEqWUERlwvAbaLR0RlV1zc=;
 b=10k6HAC1X6MabdBWJ/QhJQXB+pbeA2Z5GiaRjm2stL4Bv2HlxCaNPm6aho1hadpLXK
 h+KvnXwxBuWEp26fkYd/EciD3XmEfMjvo5THXFIE/jXg/M7u8zCZ2NcQdIo2o2WiUzaM
 0K2jmVah4h48flD/8lzPuCuOPjBd0Bqcr9swgoryCVur9xRLungyi7GTiKupVYEs26Fs
 N9Xj3EQTJhjx4sYgmzgB1J6GDf4LYF9KISTNVcev3cpJoZUEcphm6BbUQ3/L7FckXOjm
 hCPOWKYlIDeHOr3hYLXm1ue4Jhtuz3ZYAF8NKEtp9huPWPVYMufnOq9aQ6lCJ+ouk/Fb
 lihQ==
X-Gm-Message-State: AOAM531bSS0okjJunZ14USObof80OQiA0cmYrpyPsKg6Dq3pSGpgGwc+
 BKyCTLjGvWkGpqWixHpo1bfwJw==
X-Google-Smtp-Source: ABdhPJxdJgDipzr13GjjKK+mcG6VZupIMvd7jkwDOMulpxoCb5Q+dZ8GKmNt/zAr2B85xjLqNTUxLQ==
X-Received: by 2002:a17:90a:e40f:: with SMTP id hv15mr32741pjb.5.1638384906215; 
 Wed, 01 Dec 2021 10:55:06 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id f4sm575538pfj.61.2021.12.01.10.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 10:55:05 -0800 (PST)
Date: Wed, 1 Dec 2021 10:55:05 -0800
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/signal32: Use struct_group() to zero spe regs
Message-ID: <202112011054.B56B09FEF@keescook>
References: <20211118203604.1288379-1-keescook@chromium.org>
 <1e312cbd-cd52-ddce-f839-db765173c526@csgroup.eu>
 <87ilwkrbhz.fsf@mpe.ellerman.id.au>
 <202111221247.B385EA2A8@keescook>
 <8735nmquti.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8735nmquti.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 24, 2021 at 11:08:25AM +1100, Michael Ellerman wrote:
> Kees Cook <keescook@chromium.org> writes:
> > On Mon, Nov 22, 2021 at 04:43:36PM +1100, Michael Ellerman wrote:
> >> LEROY Christophe <christophe.leroy@csgroup.eu> writes:
> >> > Le 18/11/2021 à 21:36, Kees Cook a écrit :
> >> >> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> >> >> field bounds checking for memset(), avoid intentionally writing across
> >> >> neighboring fields.
> >> >> 
> >> >> Add a struct_group() for the spe registers so that memset() can correctly reason
> >> >> about the size:
> >> >> 
> >> >>     In function 'fortify_memset_chk',
> >> >>         inlined from 'restore_user_regs.part.0' at arch/powerpc/kernel/signal_32.c:539:3:
> >> >>     >> include/linux/fortify-string.h:195:4: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
> >> >>       195 |    __write_overflow_field();
> >> >>           |    ^~~~~~~~~~~~~~~~~~~~~~~~
> >> >> 
> >> >> Reported-by: kernel test robot <lkp@intel.com>
> >> >> Signed-off-by: Kees Cook <keescook@chromium.org>
> >> >
> >> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> 
> >> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> >
> > Thanks! Should I take this via my tree, or do you want to take it via
> > ppc?
> 
> I don't mind. If it's easier for you to take it as part of an existing
> series then do that, otherwise I can pick it up.

Most of the other patches are going via other maintainers, so I'd love
it if ppc could snag this one too. :)

Thanks!

-Kees

-- 
Kees Cook
