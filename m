Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2483AF23D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 19:44:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7xkG4tG2z2yhF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 03:44:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hTKeytdG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hTKeytdG; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7xjr3gwrz2yRX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:44:29 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id q23so15948447ljh.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 10:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aj/0Z18KSrpkQcWAKnHj05+GfR0DaIVfgC0ovqanE2c=;
 b=hTKeytdGalobGnv1mLXz9178COoRqwCgEE/ubFc97TESs4l1ETbGTi/LXWwSHW8ii7
 cU1NcxgBwnSNSSWUGI+0LSLO/eA4skHJOAyy2fZxvgaDUE2kKpXUeFq7V5b34HYKHOnI
 TsfOqqXpxOjB45tPERHc8HZ9x/0x2urKpZmdDFjmOHnTIzDvOBwe/rgvABgjv5qaLR/O
 ByzDEPcf5lYiYqzPcNPzyCnIwtBSE6IaFn0tItgAEDTNFbtKqHPSF2zRWCYSRAJfI1ut
 6seNasjRSFy7UCNfh8Ov01ynyt41Sclnq4cMIJyoVCx9rvyy9NrYgMxQtwhLOKhMEat+
 cJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aj/0Z18KSrpkQcWAKnHj05+GfR0DaIVfgC0ovqanE2c=;
 b=MS/TTxGsxbk81Wy063XNJZxMTdyFfYYHxSkJlLbmRq42hr0YQYNyOdIYzE8iVQaz0H
 oUfcYYRgwblnFLLNmk07Qizen851w0n0L3+TdETy9cW0Axct7J5Ub+IG6yKu+u3Fzh9B
 d74bkfJ48QD0ukSVPqVhHx0LNIyX379T6objJ1JFTdYWLxzEWo7HrDpl9lFn2qocn3hg
 3FWzCjk04/eKax6J6D1GHq7p2y81Xem/G1Dpe+SxLGfKC5Mp1qA74dw5mrYuqUd0CFaM
 8YS87a0WnnDNYW+x37zr9EzSFKVYv5L0DSJ3QQQDvEyyFMCUoXe49u9e+fin8y0utUT+
 JIPg==
X-Gm-Message-State: AOAM532ZQNXhwxkYLGSh41l+FBySlKoQuFl7zOHcZWjPQEis1rzFN9LJ
 cS5BW2yRIwjVwZ8cjpo69neszf9nAVIZ3dPhE2AaWQ==
X-Google-Smtp-Source: ABdhPJwdQKs2XYfO12j9GxWLhfQ9o6XvL9JaTlE9K2yEhyTXPKP7lTIi01KFE2ZPpN2bcp+AVRGr823u8lFAqVeQG58=
X-Received: by 2002:a2e:858a:: with SMTP id b10mr22329066lji.445.1624297464450; 
 Mon, 21 Jun 2021 10:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <9D4A658A-5F77-4C33-904A-126E6052B205@linux.vnet.ibm.com>
 <CAFpoUr3g5t3Z0BtW4-jnYomc3cdY=V5=Zt94-C+fHOjGWa107w@mail.gmail.com>
 <CAKfTPtC=aXasuSNvn+A3152-4xoOTWROhJpZAVq6RLh1Hacpng@mail.gmail.com>
 <CAFpoUr2o2PVPOx+AvatjjUvqPTyNKE3C6oXejyU3HVMmtCnzvQ@mail.gmail.com>
 <6D1F875D-58E9-4A55-B0C3-21D5F31EDB76@linux.vnet.ibm.com>
 <CAFpoUr0iWFTq2grtnX_EH6KnZLZQCg1o6_yv1gfDK8WdbHmUCA@mail.gmail.com>
 <CAFpoUr3Wy9raHx+Dc0S8TB_Xi=E+Epsh_pA3DEFZP4eKf7s07A@mail.gmail.com>
 <20210621162243.GA29874@vingu-book>
 <CAKfTPtACzzoGhDFW0bTGgZRPB=3LR6kSwuUOrcKDFTAJ7BhTFQ@mail.gmail.com>
 <14EEE4A4-B2B1-4D0C-B2F6-BDB7C11B05DE@linux.vnet.ibm.com>
In-Reply-To: <14EEE4A4-B2B1-4D0C-B2F6-BDB7C11B05DE@linux.vnet.ibm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 21 Jun 2021 19:44:13 +0200
Message-ID: <CAKfTPtCwqpHUxFdk0Q4dwL19Zn0_EhX7gQ8dwf=rsWHyxZVAVw@mail.gmail.com>
Subject: Re: [powerpc][5.13.0-rc7] Kernel warning (kernel/sched/fair.c:401)
 while running LTP tests
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Odin Ugedal <odin@uged.al>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 21 Jun 2021 at 19:32, Sachin Sant <sachinp@linux.vnet.ibm.com> wrote:
>
> >>> Any thoughts Vincent?
> >>
> >>
> >> I would prefer that we use the reason of adding the cfs in the list instead.
> >>
> >> Something like the below should also fixed the problem. It is based on a
> >> proposal I made to Rik sometimes ago when he tried to flatten the rq:
> >> https://lore.kernel.org/lkml/20190906191237.27006-6-riel@surriel.com/
> >>
> >> This will ensure that a cfs is added in the list whenever one of its  child
> >> is still in the list.
> >
> > Could you confirm that this patch fixes the problem for you too ?
> >
> Thanks for the fix.
>
> The patch fixes the reported problem. The test ran to completion without
> any failure.
>
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Thanks

>
> -Sachin
>
