Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE2B1E857
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 08:37:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453lGx16yvzDqPN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 16:37:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="QIWLQFjn"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453lFJ0cb4zDqHG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 16:36:19 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id p15so835863pll.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 23:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=UdH4Z2FP6ofwR9nmZmA2PbVfNSkzCa/ZtLAUNHYg2n4=;
 b=QIWLQFjnqpk4Xnic82J0fYlLmGbzPw9uVrqn9kAErbtMoOpXurlqK4YloMHjH8JXp3
 WMyVGXK5HaiO527nawczPIryeTdVC4p6Ndtr9A7zsdqnxTVgZrua2kwGcoLaNQRrAUU2
 A2TSpgl1jEHoiRJTum0DB89TBg/GFR9SZEBlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=UdH4Z2FP6ofwR9nmZmA2PbVfNSkzCa/ZtLAUNHYg2n4=;
 b=GNfAs5Ac4pF9wGmTM5PtfGPIRZhqPIEeeXs7GnSFjrSqfbcwQxynhOiGihWCThkr+c
 6jQFzr33hYtxX5PWsGV40tNVRvUAHmmbJL05OlNxMaKRjcNMoGsfnkRbPl/yBZNQY5Jb
 ZN3ZAT3NEMniTMAO/9voyrA/+A7e41Xs4kVkdetcNuSJPFNUWw9xBNYNYCE6pTnb51/i
 onrXdIDGjkztVHcuq68Uih7yIN7kA3IV3ny/RZ9iHb4qCo0lkGit5dzVc+E1mXv8Syri
 ah3eJimVNvY2apO4hNx/yva/ysQguTkn5drnTV5onwzALiArijHZSK4qPYFIIYWW9rre
 FapQ==
X-Gm-Message-State: APjAAAWQUkweXO1j5AGEQFaJF52lIWY5gRBjrbaJYuTwTsIImSEZamMC
 GwW3OQnjkjo8x5MeB9gZsznSe4UzH2I=
X-Google-Smtp-Source: APXvYqyFBD8u2dpQZB+7bh4IaAaLADdl8Bqt38YwjGPvbGw/4MmYLbTs6g1LhmNcBAfyzJe0xzzy2Q==
X-Received: by 2002:a17:902:7e4f:: with SMTP id
 a15mr42572574pln.205.1557902177541; 
 Tue, 14 May 2019 23:36:17 -0700 (PDT)
Received: from localhost (dip-220-235-49-186.wa.westnet.com.au.
 [220.235.49.186])
 by smtp.gmail.com with ESMTPSA id r9sm2222306pfc.173.2019.05.14.23.36.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 23:36:16 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: vmx - fix copy-paste error in CTR mode
In-Reply-To: <20190515035336.y42wzhs3wzqdpwzn@gondor.apana.org.au>
References: <20190315043433.GC1671@sol.localdomain>
 <8736nou2x5.fsf@dja-thinkpad.axtens.net>
 <20190410070234.GA12406@sol.localdomain>
 <87imvkwqdh.fsf@dja-thinkpad.axtens.net>
 <2c8b042f-c7df-cb8b-3fcd-15d6bb274d08@linux.vnet.ibm.com>
 <8736mmvafj.fsf@concordia.ellerman.id.au>
 <20190506155315.GA661@sol.localdomain>
 <20190513005901.tsop4lz26vusr6o4@gondor.apana.org.au>
 <87pnomtwgh.fsf@concordia.ellerman.id.au>
 <877eat0wi0.fsf@dja-thinkpad.axtens.net>
 <20190515035336.y42wzhs3wzqdpwzn@gondor.apana.org.au>
Date: Wed, 15 May 2019 16:36:12 +1000
Message-ID: <874l5w1axv.fsf@dja-thinkpad.axtens.net>
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
 Stephan Mueller <smueller@chronox.de>, Nayna <nayna@linux.vnet.ibm.com>,
 omosnacek@gmail.com, Eric Biggers <ebiggers@kernel.org>,
 marcelo.cerri@canonical.com, pfsmorigo@gmail.com, linux-crypto@vger.kernel.org,
 leitao@debian.org, George Wilson <gcwilson@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Herbert Xu <herbert@gondor.apana.org.au> writes:

> On Wed, May 15, 2019 at 03:35:51AM +1000, Daniel Axtens wrote:
>>
>> By all means disable vmx ctr if I don't get an answer to you in a
>> timeframe you are comfortable with, but I am going to at least try to
>> have a look.
>
> I'm happy to give you guys more time.  How much time do you think
> you will need?
>
Give me till the end of the week: if I haven't solved it by then I will
probably have to give up and go on to other things anyway.

(FWIW, it seems to happen when encoding greater than 4 but less than 8
AES blocks - in particular with both 7 and 5 blocks encoded I can see it
go wrong from block 4 onwards. No idea why yet, and the asm is pretty
dense, but that's where I'm at at the moment.)

Regards,
Daniel

> Thanks,
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
