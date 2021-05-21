Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E03838C0A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 09:23:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmdPH1b7nz3bvb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 17:23:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zxBkF2Rp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zxBkF2Rp; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmdNn6Znvz2xMw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 17:22:48 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id z130so10539960wmg.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 00:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ue4q25tfYI5RxLcBXPlMjiSrTwgCV0DfcVN25afL2bA=;
 b=zxBkF2RpmykF6ze5xWEoQ0Sr0EVVAWgufL4N4uYCEfvvr/9dBYRwNyhiILH7xolYIM
 mUMpEc0xXBJpplnd2Ws45Umks7zwOxUWKpLSks7U3bsdswos3yo/TMqCb97EECv4oO9i
 nPR3MbzV+M8Ol9Hmhi9U7j556tKkgEURhOKEJ/ZmzIh4muKbO6krDSxmt3Mv2RYCjfFw
 SNhb3NzpB5FQ50Ylct/Z3K/asq2FOTFjZf9FGqtQMB038gZT8Vu7p5RSiGdzGms2OD8X
 yPYCJ7kZe/aC4GAdyvCUeySQ3fymFp3DS+oe58blNwY5pF5JgI3E7v419huXJyQo0bbH
 XGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ue4q25tfYI5RxLcBXPlMjiSrTwgCV0DfcVN25afL2bA=;
 b=lYifJSxCN2X7pTJqdIJisjepWxYYlx4/oBsKTtRbiTSxvLeMspZwSZX+BUamHpLXVP
 uXELgJ9wF3uq19DHzvzOKYTRhVMgg28/JDUX00mT9UE0af75exb3Ox/NkEydUMAvRmp4
 H0rAh4G4hIphoRK61ecStDzcXDU32gN6K1bdLn7SgIRZaGxWdCVQmbWfOsxGCijxq59L
 5rflrAEnzLHfkuJSetTWiwQbsQ6O0MTzspr3LM3t/vkVnlVlXYNyXPJbksjpzZE92fZ/
 BAmA9SeIEDErsQKDo1LusmifR/6w4IK0D8he5xLnjXdzsEU3Ab68S+ku/faCs+fCSBZK
 NLsA==
X-Gm-Message-State: AOAM533+XDq2JqVGEsGECpK6rWkC4UcZ0xzdQi/uErDC77FK3tJRkInd
 zvG9iIgSJj0710S1oaCpjfJ4ZA==
X-Google-Smtp-Source: ABdhPJzAs4JWDKxcLcuodJXaj7alnXNl7eWaJK+ZI+9Sb3ggP4ft8Mue6yj3TwDmFJ/1VFJt4AdOjA==
X-Received: by 2002:a1c:2985:: with SMTP id p127mr7390963wmp.165.1621581759653; 
 Fri, 21 May 2021 00:22:39 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id c15sm1041514wro.21.2021.05.21.00.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 00:22:39 -0700 (PDT)
Date: Fri, 21 May 2021 08:22:36 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/16] Rid W=1 warnings from Char
Message-ID: <20210521072236.GX2549456@dell>
References: <20210520121347.3467794-1-lee.jones@linaro.org>
 <CAK8P3a0VujuG8eU_CEVSvzbk4nAJz8fStedM5eMUrLAr9EJxDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a0VujuG8eU_CEVSvzbk4nAJz8fStedM5eMUrLAr9EJxDQ@mail.gmail.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, David Airlie <airlied@linux.ie>,
 Clemens Ladisch <clemens@ladisch.de>,
 "C. Scott Ananian" <cananian@alumni.princeton.edu>,
 Paul Mackerras <paulus@samba.org>, Kylene Hall <kjhall@us.ibm.com>,
 Jerome Glisse <j.glisse@gmail.com>, Peter Huewe <peterhuewe@gmx.de>,
 Michael Neuling <mikey@neuling.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Dave Safford <safford@watson.ibm.com>, Harald Welte <laforge@gnumonks.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kanoj Sarcar <kanoj@sgi.com>,
 David Woodhouse <dwmw2@infradead.org>, Bob Picco <robert.picco@hp.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 Thirupathaiah Annapureddy <thiruan@microsoft.com>,
 "cs.c" <support.linux@omnikey.com>, Lijun Pan <ljp@linux.ibm.com>,
 Reiner Sailer <sailer@watson.ibm.com>, Matt Mackall <mpm@selenic.com>,
 van Doorn <leendert@watson.ibm.com>, Theodore Ts'o <tytso@mit.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Fulghum <paulkf@microgate.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 20 May 2021, Arnd Bergmann wrote:

> On Thu, May 20, 2021 at 2:13 PM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> >
> > Lee Jones (16):
> >   char: pcmcia: cm4000_cs: Remove unused variable 'tmp'
> >   char: pcmcia: cm4040_cs: Remove unused variable 'uc'
> >   char: random: Include header containing our prototypes
> >   char: pcmcia: synclink_cs: Fix a bunch of kernel-doc issues
> >   char: pcmcia: synclink_cs: Fix a bunch of kernel-doc issues
> >   char: applicom: Remove 3 unused variables 'ret' and 2 instances of
> >     'byte_reset_it'
> >   char: tpm: tpm1-cmd: Fix a couple of misnamed functions
> >   char: tpm: tpm_ftpm_tee: Fix a couple of kernel-doc misdemeanours
> >   char: agp: backend: Demote some non-conformant kernel-doc headers
> >   char: agp: frontend: Include header file containing our prototypes
> >   char: agp: via-agp: Remove unused variable 'current_size'
> >   char: hpet: Remove unused variable 'm'
> >   char: agp: generic: Place braces around optimised out function in if()
> >   char: agp: uninorth-agp: Remove unused variable 'size'
> >   char: hw_random: pseries-rng: Demote non-conformant kernel-doc header
> >   char: mem: Provide local prototype for non-static function
> 
> Thanks a lot!
> 
> I've looked all the patches now and commented on patches 6 and 16.
> With my comments addressed
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd.

Would it be possible for the remaining 14 patches to be taken in
please?  I will work on the 2 Arnd commented on in due course and
resubmit them independently.

TIA.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
