Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8291D2A08
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 10:28:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N4Rr1KJzzDqY3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 18:28:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N4Q26xGKzDq5k
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 18:26:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fu7feKMv; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49N4Q21Pn8z8tXY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 18:26:34 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49N4Q20hlgz9sVB; Thu, 14 May 2020 18:26:34 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fu7feKMv; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49N4Q1509Rz9sV8;
 Thu, 14 May 2020 18:26:31 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id z5so2074041ejb.3;
 Thu, 14 May 2020 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jufVtTkqzjG5wknNXjAh1CuzXFB4tMF7Jj37bbGj/aw=;
 b=fu7feKMvCDPAFVDDo9TzIBisEn2oZrGNSXGTI7XbfRp1w6FlSOFEaJE8ECDdTZfIAW
 Owt+xBJDoLqk5TSnxYLWkIT0mGCpT+RugfiT+uovnJJRaWXtIC/e08ZANhrsUTA/ulSp
 kDJxLJwY9NPpqvbkF3HYjNHQH1L0U9ygAUP78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jufVtTkqzjG5wknNXjAh1CuzXFB4tMF7Jj37bbGj/aw=;
 b=AE/XS5O41X/MhGzEswyxTqYY2/ShrLRrcYpcaGpQakY7rh4AhUDE7TsDVrWMIe704H
 C+L54Ei5UhTDpA7VUrzzoXK6pd5dVRe74AXLSM/YlcDRTiU8QQJIv3AdAujPaWa+8lFU
 0RgDJL24izdu7KmGEhsTGVhQMhmo2Vs2GK6S/BeQO9/rr29UGrI/QDl0AcsAvRX72Wqj
 emKyKDFvP3Y9w2kiIKOhE9xyPclfaTpSYJGdlZ40rjfJTHxyBCEj3++/Kf7hZa6l1QuP
 vjnkrupd/f15JjhiHi0+bpCyWhoocdTLUBPvoc7vvhG5mH4DzEIS/mL7sxOE3Siw7/wf
 K04w==
X-Gm-Message-State: AOAM533aDIVf5u6Has8jnDQkOz6ehqkhgW4U2tr1rq+uUkg9CWUaP+To
 2j4bmCUFlcphSKAo/Fjr1D+gSEfDF6/wwuGHuh3dMg==
X-Google-Smtp-Source: ABdhPJwYjxYguLaWNcG7YoN5S5XZfmiDS999PDebfV2SMqYBJYvDsFzXf8CLbTZc9EmI81s6ayrqnAl4/NFjQYxbtzg=
X-Received: by 2002:a17:906:a857:: with SMTP id
 dx23mr2853882ejb.52.1589444787430; 
 Thu, 14 May 2020 01:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
 <20200509050204.GB1464954@thinks.paulus.ozlabs.org>
 <1589010661.v7yharjogg.astroid@bobo.none>
In-Reply-To: <1589010661.v7yharjogg.astroid@bobo.none>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 14 May 2020 08:26:15 +0000
Message-ID: <CACPK8XdGSc++=6MMh_zmhczwep53M_Y7H-WqtatCvB4F8DWyVQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] powerpc/radix: Fix compilation for radix with
 CONFIG_SMP=n
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>, Michael Neuling <mikey@neuling.org>,
 Benjamin Herrenschmidt <benh@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 9 May 2020 at 07:52, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Excerpts from Paul Mackerras's message of May 9, 2020 3:02 pm:
> > This fixes the compile errors we currently get with CONFIG_SMP=n and
> > CONFIG_PPC_RADIX_MMU=y.
>
> Did I already fix this, or does it keep getting broken?! :(
>
> Anyway fine by me if it's required.

You're right, your fix was merged in 5.7-rc1.

Cheers,

Joel
