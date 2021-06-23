Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6AB3B1A4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 14:38:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G92qc1Pr5z3bvh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 22:38:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=uged.al header.i=@uged.al header.a=rsa-sha256 header.s=google header.b=jRPAywv+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ugedal.com (client-ip=2607:f8b0:4864:20::82a;
 helo=mail-qt1-x82a.google.com; envelope-from=odin@ugedal.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=uged.al header.i=@uged.al header.a=rsa-sha256
 header.s=google header.b=jRPAywv+; dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G92q81dVYz2xv2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 22:37:54 +1000 (AEST)
Received: by mail-qt1-x82a.google.com with SMTP id d5so1906438qtd.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 05:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uged.al; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DYY3t3SZgKirD6WxlYWUH57bb/cmzEpXCDfMeGqIxB0=;
 b=jRPAywv++23eP8EZrfe64KwnWB0RZH6bmg/TiQrpelroLBrMV2AUKaOgRhX38drGH4
 eIo8hnx5oAzmdNlOTHGIenSigaQTr51XyV0HOtc9Rb3Hr2oUzl0dZTUm40pGDkJ+f4hq
 osfpXkQ14Nv5GPBvKlp6SRMpKb8BeRHNgoOUhBj6jEYtfO9RdP1xXTweQAVtaCOdEvZz
 knFxk0nDKOdKbXSpfbejNi/LJC7NWs4OQXX2nMrFfvnNexVyfgiNJvJDdhA/IOxoebCA
 jBiWMB2N+CYhXqGcoRB1h7rMPpMCXf5UN8BDlcTSbU4CPIz6AqCTyci8dzA8uEwVUBtb
 ZULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DYY3t3SZgKirD6WxlYWUH57bb/cmzEpXCDfMeGqIxB0=;
 b=DQJtAMke/Cs3CxMQ2Xql10baPIwyR1M3QBwUgiPJ/femvKfPC7vLQXFestel7orVmY
 kuO1TOXbwbO1ay/ljDk7v2uPGdCDMqxDdJV0BLG5TxWfNa0Lch3m5sBYJQv2GnPGOpql
 F5G59Luxudqub73BCLyWlLFJ5gKjGGPjtUda0IIht6e8S9KU77ItWiWRcTOZLO5dOfAv
 hYYQXHnG3FYuHOfOIYLwUGdo3ChnX9QfneP6RVXeviURcOUh+WeZJjF+vrm8uwd4mh0J
 09SdCdw+T2k5Nm84yHSJ4QUi6LsXl1sKi+lACXgxdMlP3t8Ri68x/tby0gZ6Shb0q/+c
 2baw==
X-Gm-Message-State: AOAM531m2TuIvG4xJLzuPF9NiDu8WCWj8mOLockQgjuGwg4h39zt8BMn
 bCocJZo6tHvcsWTneGQPeHV5JaWgqLUZFmNV/wFoyw==
X-Google-Smtp-Source: ABdhPJzHiVxHtJBXIV2e3WuOFpZtkhGeX9maJOCWyu6LgNeVZDMhh8BAS/Kk7GKlMKaMboAmWuLe99C+qzcmVc3muyk=
X-Received: by 2002:a05:622a:15c1:: with SMTP id
 d1mr3823991qty.138.1624451870847; 
 Wed, 23 Jun 2021 05:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book>
 <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
 <20210623071935.GA29143@vingu-book>
 <CCB4222F-000A-44E8-8D61-F69893704688@linux.vnet.ibm.com>
 <6C676AB3-5D06-471A-8715-60AABEBBE392@linux.vnet.ibm.com>
 <20210623120835.GB29143@vingu-book>
 <CAFpoUr01xb9ZJF9mb2nmZDpUHXFH3VSbY3AU8-1owV-_7wVTPg@mail.gmail.com>
 <CAKfTPtB++3y4VnbKE_n=bgsqCfqXuF0KUsdB_cFhi9xAnMRubw@mail.gmail.com>
In-Reply-To: <CAKfTPtB++3y4VnbKE_n=bgsqCfqXuF0KUsdB_cFhi9xAnMRubw@mail.gmail.com>
From: Odin Ugedal <odin@uged.al>
Date: Wed, 23 Jun 2021 14:37:14 +0200
Message-ID: <CAFpoUr3bHzrwvumw6R=2JVbKa_wmtT9cMf-mdDHxY0Png-N9Jw@mail.gmail.com>
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
To: Vincent Guittot <vincent.guittot@linaro.org>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Odin Ugedal <odin@uged.al>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ons. 23. jun. 2021 kl. 14:22 skrev Vincent Guittot <vincent.guittot@linaro.org>:
>
> In theory it should not because _sum should be always larger or equal
> to _avg * divider. Otherwise, it means that we have something wrong
> somewhere else

Yeah, that might be the case. Still trying to wrap my head around
this. I might be wrong, but isn't there a possibility
that avg->period_contrib is increasing in PELTs accumulate_sum,
without _sum is increasing. This makes the pelt divider increase,
making the statement "_sum should be always larger or equal to _avg *"
false? Or am I missing something obvious here?

Still unable to reproduce what Sachin is reporting tho.

Odin
