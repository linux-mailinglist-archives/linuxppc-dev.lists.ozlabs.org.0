Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE443A6998
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 17:06:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3ZXR4pqpz30Bq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 01:06:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=WFXINDqa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=WFXINDqa; 
 dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3ZWv75glz2yYH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 01:05:46 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id k40so21658758lfv.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 08:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G2ifPKFPXw+H1+XH/FElieTkSuvTHAXJjptrAzf+O/o=;
 b=WFXINDqaAXfBVeiL3HnMRcJ+t27wzLTnISKsyZAtOmblsbkkBS4MCZ46zTlpjK4JvE
 /Pf+CdFhiSbVJ/W6e+PMAKVo3D+wnSihIYddEJpNrYHpmPks3H0BOj3zjmhn+6Kz4PNb
 uMNIHC0LKBqWwfD7FT2jfCqBDQsPnct2KsDuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G2ifPKFPXw+H1+XH/FElieTkSuvTHAXJjptrAzf+O/o=;
 b=Y6t21zMfMv7iv3u1au1U0Np3dhXAhY2/CybUy456en8Ty7cUFUeESlg+UyfqTv0Uq9
 aNWF7OXUKZIi6yCeRp7tyrrq4IpmLn6wJ0uGPXcHLh0wuMwHraHcSHRvfvws6cW2qAoo
 +X+kBcwTrPm5+zKCJkVg40rmQG488YBjCwrTwJPqrx6jQGFRkv7yy0xeIzxg7oUqzVx4
 v7lueynKI9gPtMJM6Dp3u3EuuIKqjaxn71ptyiXosGHRMQn4whQEGyRp8BCKMNgr271r
 zpsOVRsidg03Gs2lzrrZRQG4MmCoV9lKSDjhhyljmnpDCiLx8wlfH4P/Rczxk0RL10ml
 ksAQ==
X-Gm-Message-State: AOAM530bvxKkjUxLYfzj+5PVQ1L6ChRkGpDaH2F4uR1hhveSwEVI+YLd
 3Yy81H4jg7vY77VvhhBhFYH/o7xbRK8lRhWT9OE=
X-Google-Smtp-Source: ABdhPJwZZsTNZHnjjLHMHCWTFMITRv/Z/dN1dBy4nJxrMNw9yqb5bdHSIJ69RLPplO0vGYX96Yvm/g==
X-Received: by 2002:a05:6512:507:: with SMTP id
 o7mr12629563lfb.453.1623683137200; 
 Mon, 14 Jun 2021 08:05:37 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id k23sm858977ljh.129.2021.06.14.08.05.36
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 08:05:37 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id h4so6793134lfu.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 08:05:36 -0700 (PDT)
X-Received: by 2002:a2e:a549:: with SMTP id e9mr2705701ljn.411.1623682703202; 
 Mon, 14 Jun 2021 07:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210607055131.156184-3-aneesh.kumar@linux.ibm.com>
 <20210614145536.GB28801@xsang-OptiPlex-9020>
In-Reply-To: <20210614145536.GB28801@xsang-OptiPlex-9020>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Jun 2021 07:58:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg+TcJtrwEUzoht2j0R3+jw=OCqckptdf4Q9vNgCPSpXA@mail.gmail.com>
Message-ID: <CAHk-=wg+TcJtrwEUzoht2j0R3+jw=OCqckptdf4Q9vNgCPSpXA@mail.gmail.com>
Subject: Re: [mm/mremap] ecf8443e51: vm-scalability.throughput -29.4%
 regression
To: kernel test robot <oliver.sang@intel.com>
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
Cc: Feng Tang <feng.tang@intel.com>, 0day robot <lkp@intel.com>,
 Linux-MM <linux-mm@kvack.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Kalesh Singh <kaleshsingh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Nick Piggin <npiggin@gmail.com>, lkp@lists.01.org,
 Zhengjun Xing <zhengjun.xing@linux.intel.com>, "Huang,
 Ying" <ying.huang@intel.com>, Joel Fernandes <joel@joelfernandes.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 14, 2021 at 7:39 AM kernel test robot <oliver.sang@intel.com> wrote:
>

> FYI, we noticed a -29.4% regression of vm-scalability.throughput due to commit:
> ecf8443e51a8 ("[PATCH v7 02/11] mm/mremap: Fix race between MOVE_PUD mremap and pageout")

Ouch.

I guess it's not a huge surprise, but that's a fairly large regression.

Probably because the pud lock is just one single lock ("No scalability
reason to split PUD locks yet").

What happens if pud_lockptr() were to do the same thing that pmd_lockptr() does?

                Linus
