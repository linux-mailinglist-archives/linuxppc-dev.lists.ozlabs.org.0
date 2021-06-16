Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDDE3A9DC4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 16:40:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4nss5243z3c0b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 00:40:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=R27tZxcr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=R27tZxcr; 
 dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4nsN0Vhtz306Y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 00:40:06 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id z22so4154616ljh.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/d47Kg6am+HOwfA8CcwjrDqwgXXjZkM4fDSarrEXee4=;
 b=R27tZxcrYHmoWnqZc4hdloTm/orgeHcKmZqRdd2p+E85Nf/eCtU7FFxx9NDxcjYyP/
 KqfzRqFAArkfSHARlmb75ATHKGV8UDFHuTeylbe/fc0qfwC7ZmDokm6zN91pVwc2n2eL
 +wTrPpMu9V2fa8hEcnEMTUVo3eQmmHYc38Xb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/d47Kg6am+HOwfA8CcwjrDqwgXXjZkM4fDSarrEXee4=;
 b=p/ctN7ATuuh8bD4DWG3jRyk7heXGlyIASofylKFN/gX+Ckew3FZiPxlO8e408VYCN8
 nuuPdsbEBD5SRCAQ/Y7XwQXy45RzD/eGN4iFQZvAm2ov3wrZmZj+IOk3sjqQndPvCGwx
 TLl9NRXoSfy+RDdNg77KFM4jJh/m73aX949QitF4/Zjo4jb4c01tm20/XeblF6I6he27
 TBEoisp/Btb4u2bGfRFDa5RpmBGM7P0oAnS6tuS4K6om4sLiNFvIZXiLLSftHWNthijk
 3FTRgf2sImt7/EWBU7cjq3TkId0M20dqeyqe0eWhXENdzKaBACaBISR8t0GuyTCe3Pia
 crkw==
X-Gm-Message-State: AOAM5306emzRBu9/hUvlyu6QKzOwPFgD4iU3E7l7DOrQI6jj1ikknRxn
 0NOh6srpT8Kz2/L5MDH7gNuZuZ9SRS5Zr0sgWZg=
X-Google-Smtp-Source: ABdhPJz46zC5eRwjAdhmPqG9PwlaMArEqtbqmVJKjWyN7KggqvimgHtBXbmcvCDtJ2dU/Nd1y14Pkw==
X-Received: by 2002:a2e:b0e8:: with SMTP id h8mr178585ljl.42.1623854396209;
 Wed, 16 Jun 2021 07:39:56 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id a22sm299433ljm.13.2021.06.16.07.39.55
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 07:39:55 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id f30so4781307lfj.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 07:39:55 -0700 (PDT)
X-Received: by 2002:a05:6512:374b:: with SMTP id
 a11mr3796636lfs.377.1623854395196; 
 Wed, 16 Jun 2021 07:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210616045239.370802-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210616045239.370802-1-aneesh.kumar@linux.ibm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 16 Jun 2021 07:39:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiDE_K2bEG0DeD7TwWXoJgoNLo7kz45HLo9XCX49Gzgqw@mail.gmail.com>
Message-ID: <CAHk-=wiDE_K2bEG0DeD7TwWXoJgoNLo7kz45HLo9XCX49Gzgqw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] mrermap fixes
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 15, 2021 at 9:53 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> This patch series is split out series from [PATCH v7 00/11] Speedup mremap on ppc64
> (https://lore.kernel.org/linux-mm/20210607055131.156184-1-aneesh.kumar@linux.ibm.com)
> dropping ppc64 specific changes.

Both this and the followup powerpc enablement looks ok to me. Apart
from the obvious subject line bug ;)

Do we have robot confirmation that this version doesn't have any
performance regression?

              Linus
