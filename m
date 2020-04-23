Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C49E1B612C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 18:45:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497NSp0RfVzDr5Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 02:44:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mrzi5atR; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497NGf0tdqzDqwB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 02:36:09 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id g19so7136937otk.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 09:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZD5R6FmUjPmeYL4MRpYo2rDAvGPliTwTgGLA+RltUqk=;
 b=mrzi5atRRI2q3lMqAA6n6OfEcnerfPoNonIqtPU1b5IDS8I6RB9CnvWYjRv1+FNgQ+
 1hQAvaydH0SIwTKWkrXj0QXhUfIK7hJCMjAWxzcrsLndr1hHEojvwqlL9RE+KQf41Ohw
 C54/gWvcQ7WhARr0DpWrTGZf+WKCLWpHAtHfJYQtCSO90ZL8EyJHMWx/MXBKVpftxaos
 cwYgQwfkrRlpKd9+NJJoijx7ki+uV2tKrs1W3OBSTKJwxyzxREaiRBOWIiV2NdB25J7n
 FR1p6b7X6MfsupFfkyZngdbfHyxhf9Q9zT22p4VrdGFWefKKNostT25EZM/L95tn/vFa
 NFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZD5R6FmUjPmeYL4MRpYo2rDAvGPliTwTgGLA+RltUqk=;
 b=atMqFToTcnhSNn1A4Lkys+SUI7dcjd3Z61JoAndcyn1N7rND0gxYihk86EX1WWm28u
 5Ru6uhjiZu2Ci9/YEq7nPzM+xuarBz1dX95HkjKy28s4FE+qqfJVWsn7plJu04yGvpKJ
 3rtzgW5vLk3Co2aFVRihxOxPjqM/qOQVrNREcTqRTJphRVsR3gxJTHuwhnme4hbRktCi
 c7zOAizcdjzHCoYlmrWzI42QT7QyhfmpxQ22thrzxrSrJPK3H1b9UenhwnzfZo15lqpo
 UPI/GyL8tGd9hEbcqX8oy7iANMW/71dgHb32OK8vubFX9Dwilk/sFz0FpaXpNCt8HDrQ
 OVCg==
X-Gm-Message-State: AGi0PuZl4yN6aN1AREs33hsIQPa91jDYI42v8EIaGZOrci03NeKpjFVH
 QgYxhixV3U4vFDoz6Hx0Okw=
X-Google-Smtp-Source: APiQypJHtf6Ck2oO+M4egmth4Lj3DPdzF5M8EvzupgTfw7XGpdJcG37znh+DX6bhvgIOm+iyOdEuew==
X-Received: by 2002:aca:f254:: with SMTP id q81mr3723853oih.12.1587659764320; 
 Thu, 23 Apr 2020 09:36:04 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id b19sm791382oii.1.2020.04.23.09.36.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Apr 2020 09:36:03 -0700 (PDT)
Date: Thu, 23 Apr 2020 09:36:02 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] lib/mpi: Fix building for powerpc with clang
Message-ID: <20200423163602.GA18872@ubuntu-s3-xlarge-x86>
References: <20200413195041.24064-1-natechancellor@gmail.com>
 <20200414135731.GA8766@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414135731.GA8766@gondor.apana.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: kbuild test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 11:57:31PM +1000, Herbert Xu wrote:
> On Mon, Apr 13, 2020 at 12:50:42PM -0700, Nathan Chancellor wrote:
> > 0day reports over and over on an powerpc randconfig with clang:
> > 
> > lib/mpi/generic_mpih-mul1.c:37:13: error: invalid use of a cast in a
> > inline asm context requiring an l-value: remove the cast or build with
> > -fheinous-gnu-extensions
> > 
> > Remove the superfluous casts, which have been done previously for x86
> > and arm32 in commit dea632cadd12 ("lib/mpi: fix build with clang") and
> > commit 7b7c1df2883d ("lib/mpi/longlong.h: fix building with 32-bit
> > x86").
> > 
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Link: https://github.com/ClangBuiltLinux/linux/issues/991
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

Might be better for you to take this instead. 0day just tripped over
this again.

Cheers,
Nathan
