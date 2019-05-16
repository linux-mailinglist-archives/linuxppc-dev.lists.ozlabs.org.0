Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 240EE1FECD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 07:30:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454KkY56gkzDqY5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 15:30:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="K3yURH+N"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Kj53kFXzDqXM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 15:28:57 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id z16so946038pgv.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 22:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=P6Om30hL1lPYEC7LolkN41RsDPGpD0LCsRqwi5B5jWE=;
 b=K3yURH+NDfUWMqTOpua/7r5NCvFuqC9PK7/CLdehE8H9uPl3b4hdV6wANMC9dMh7Kt
 ewSjowvpr/e6nfdwlyRpAC5O7AyLsuuiu4rx2rQ5nhtfi4hYizA4ChwCcmFizAwm7owY
 BYmUC9ZZfXqOf2Cc6WEkvMwFhAWf1x22kK7Ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=P6Om30hL1lPYEC7LolkN41RsDPGpD0LCsRqwi5B5jWE=;
 b=VkiuhV7EbkCgrcBRwWyvr0htexj3oN6KiQ1H265m3OUgQZ888VamWwBs3SQ0svzWH2
 ROA+9VHPrtUo1TueN5evidUKjbtoEu1vDZXGRwSY/NpHWeZDTL9pFT3FSGfo1TdpfQ48
 OeCENxw66iRT8jm0fu/xEZ4PJ3s5Rm0s0HIfWEP8abGG2x4Q7mrtz+fZz0xMB/pGaGn6
 7lj4DkJhMvTkzeyngxZfac28+KrpFrSN0LwPHYgggxzWkqNZIOw3HlRIEiyUr5T0pG6m
 NzpXoLOK5FGrppE+KpF0P7OkvUrYAkhsRBjSaYWcnyB37isWBlfV7TVnoCxQ0EBaQGE/
 smHQ==
X-Gm-Message-State: APjAAAXfSkNTdhghMLJ5LsiYapYKCO/vkssLYX2NINS0GCwPgNHToWOm
 Re7e+vjYBl1aJMcaWkNFHVCj+w==
X-Google-Smtp-Source: APXvYqwum0SV0hydhMO+lnKZbSz1Jasre9WxPrR7OGSKbB3tCJgemnT7WtKvnf64qYIKSp6N8hBJRw==
X-Received: by 2002:a63:6ac1:: with SMTP id f184mr49177523pgc.25.1557984533903; 
 Wed, 15 May 2019 22:28:53 -0700 (PDT)
Received: from localhost (dip-220-235-49-186.wa.westnet.com.au.
 [220.235.49.186])
 by smtp.gmail.com with ESMTPSA id w12sm4259997pgp.51.2019.05.15.22.28.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 22:28:52 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH] crypto: vmx - fix copy-paste error in CTR mode
In-Reply-To: <20190516025603.GB23200@sol.localdomain>
References: <87imvkwqdh.fsf@dja-thinkpad.axtens.net>
 <2c8b042f-c7df-cb8b-3fcd-15d6bb274d08@linux.vnet.ibm.com>
 <8736mmvafj.fsf@concordia.ellerman.id.au>
 <20190506155315.GA661@sol.localdomain>
 <20190513005901.tsop4lz26vusr6o4@gondor.apana.org.au>
 <87pnomtwgh.fsf@concordia.ellerman.id.au>
 <877eat0wi0.fsf@dja-thinkpad.axtens.net>
 <20190515035336.y42wzhs3wzqdpwzn@gondor.apana.org.au>
 <874l5w1axv.fsf@dja-thinkpad.axtens.net>
 <871s0z171b.fsf@dja-thinkpad.axtens.net>
 <20190516025603.GB23200@sol.localdomain>
Date: Thu, 16 May 2019 15:28:48 +1000
Message-ID: <87y337ynlb.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: leo.barbosa@canonical.com, nayna@linux.ibm.com,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Stephan Mueller <smueller@chronox.de>, Nayna <nayna@linux.vnet.ibm.com>,
 omosnacek@gmail.com, marcelo.cerri@canonical.com, pfsmorigo@gmail.com,
 linux-crypto@vger.kernel.org, leitao@debian.org,
 George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Eric Biggers <ebiggers@kernel.org> writes:

> On Thu, May 16, 2019 at 12:12:48PM +1000, Daniel Axtens wrote:
>> 
>> I'm also seeing issues with ghash with the extended tests:
>> 
>> [    7.582926] alg: hash: p8_ghash test failed (wrong result) on test vector 0, cfg="random: use_final src_divs=[<reimport>9.72%@+39832, <reimport>18.2%@+65504, <reimport,nosimd>45.57%@alignmask+18, <reimport,nosimd>15.6%@+65496, 6.83%@+65514, <reimport,nosimd>1.2%@+25, <reim"
>> 
>> It seems to happen when one of the source divisions has nosimd and the
>> final result uses the simd finaliser, so that's interesting.
>> 
>
> The bug is that p8_ghash uses different shash_descs for the SIMD and no-SIMD
> cases.  So if you start out doing the hash in SIMD context but then switch to
> no-SIMD context or vice versa, the digest will be wrong.  Note that there can be
> an ->export() and ->import() in between, so it's not quite as obscure a case as
> one might think.

Ah cool, I was just in the process of figuring this out for myself -
always lovely to have my theory confirmed!

> To fix it I think you'll need to make p8_ghash use 'struct ghash_desc_ctx' just
> like ghash-generic so that the two code paths can share the same shash_desc.
> That's similar to what the various SHA hash algorithms do.

This is very helpful, thank you. I guess I will do that then.

Regards,
Daniel

>
> - Eric
