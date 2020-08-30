Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03039256D97
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Aug 2020 14:14:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BfXLm0q3xzDqZ9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Aug 2020 22:14:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=luc.vanoostenryck@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UsFqJfCX; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BfXJP3zsczDqTD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 22:12:03 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id d26so4926851ejr.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 05:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qshWuo/PMDUT2LJmbVBMnw6b8Zf9zlNuTmEls1ekJ0U=;
 b=UsFqJfCX0P9KcqTkG3XSmY1iuH1x9+PnaSu9U6Nvjs7U+EWRLwOvUb5HJ9uHPkx2uc
 mN5Pt5hsv1IXTgEzHKqU7hXwsatu87CTl/FxsIfWfmRxjxe4KatgxXytg4OC/G36GbUu
 GGSMDgk8/+OHRuAatveS9SjHVLWS1LAa7xwUo0MQN5t6Hc7rmAxtewtb8DkAawb8ek+x
 2T/AvMyCvQ+NF79DFOBVCEkx+JEjTE7DXPZAGR8JS8zHjnUWptodtPW8I9TJIUg050io
 vpbUKkHBs6vTuRA7AxST1ivHK0GscrNxLNNBozlZ+LtOTn1ghlLYLqKerzDBHadHxFyY
 T4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qshWuo/PMDUT2LJmbVBMnw6b8Zf9zlNuTmEls1ekJ0U=;
 b=gjNlzERm6iUR7tEKsXa60Xnq7YZj/PFBT09MJE3ZYkCJi94ST0Ritg+rPVDiAxIjQ/
 OjMBom+XX+gh73MAzE2637TkJMt8xZe5B0fTjt1VFnjTpXvwTqRh8HczvfMb52AHIycd
 F6jrOqoXBKoFvdqdKAN2rgmPlD7aEJ/5ZfUf80tOGK9Zv553NHvQgMxMgydDr74/86IT
 nJUYVBEKgqLmRX8dvENlnhLme339/x4isJV2nln9XVFznivGKIihDuDl0uueVOeoj/57
 kBKajhXbUKxSlSJNYUszkfM7zuL1WGkOHtPETPp37rdYjm29naMQWw2/rUe34895F12C
 M8xg==
X-Gm-Message-State: AOAM5300H3YNVUPwusBQ+5LaroDORJY/a/q+QW22TvTgzdRC0X0Fi+I9
 QT3lqSe6spRiAWOddcNTqDA=
X-Google-Smtp-Source: ABdhPJxOJA5wZn5NrOfMFMOv1nhwV+b9MWXiMCq2DdY4+4H8iKGf7KEA59WSNTM7XyEIxhZtsuU0Qw==
X-Received: by 2002:a17:906:d182:: with SMTP id
 c2mr7289675ejz.378.1598789517357; 
 Sun, 30 Aug 2020 05:11:57 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:a7fb:e200:64d5:3b87:7078:3025])
 by smtp.gmail.com with ESMTPSA id bn14sm5115767ejb.115.2020.08.30.05.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 05:11:56 -0700 (PDT)
Date: Sun, 30 Aug 2020 14:11:54 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] fsldma: fsl_ioread64*() do not need lower_32_bits()
Message-ID: <20200830121154.zo54k5ywpdk2rw4m@ltop.local>
References: <20200829105116.GA246533@roeck-us.net>
 <20200829124538.7475-1-luc.vanoostenryck@gmail.com>
 <CAHk-=whH0ApHy0evN0q6AwQ+-a5RK56oMkYkkCJtTMnaq4FrNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whH0ApHy0evN0q6AwQ+-a5RK56oMkYkkCJtTMnaq4FrNQ@mail.gmail.com>
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
Cc: dma <dmaengine@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Guenter Roeck <linux@roeck-us.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 29, 2020 at 10:29:55AM -0700, Linus Torvalds wrote:
> On Sat, Aug 29, 2020 at 5:46 AM Luc Van Oostenryck
> <luc.vanoostenryck@gmail.com> wrote:
> >
> > But the pointer is already 32-bit, so simply cast the pointer to u32.
> 
> Yeah, that code was completely pointless. If the pointer had actually
> been 64-bit, the old code would have warned too.
> 
> The odd thing is that the fsl_iowrite64() functions make sense. It's
> only the fsl_ioread64() functions that seem to be written by somebody
> who is really confused.
> 
> That said, this patch only humors the confusion. The cast to 'u32' is
> completely pointless. In fact, it seems to be actively wrong, because
> it means that the later "fsl_addr + 1" is done entirely incorrectly -
> it now literally adds "1" to an integer value, while the iowrite()
> functions will add one to a "u32 __iomem *" pointer (so will do
> pointer arithmetic, and add 4).
> 
My bad. I had noticed the '+ 1' and so automatically assumed
'OK, pointer arithmetic now' without noticing that the cast was
done only after the addition. Grrr.

FWIW, the version you committed looks much better to me.

-- Luc
