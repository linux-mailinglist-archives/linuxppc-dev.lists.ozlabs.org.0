Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3952248F78
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 22:11:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWMVh0Gq2zDqw2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 06:11:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=GgEG9rX0; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWMRh4zCRzDqsK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 06:08:32 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id x25so10516264pff.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 13:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=L5rgvljds/G/gY7M0g3ZdQCzMRXyD0pLsTTaDQidR0w=;
 b=GgEG9rX0CVa7+ePbq5nMU/CNYUi+2BFK3ShbA/WmzDeaqQmywgCc13epPFdB6FGzJj
 PvUunIk9PF/5CUEYbmg6f4sOwcmkbKu9OxYlJ6LaNwke2x+fD6sLSkFRzNClnnjeBX38
 8Rgdk2DtkxLnI2lh1JKe4qna0fjXUs9peD4gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L5rgvljds/G/gY7M0g3ZdQCzMRXyD0pLsTTaDQidR0w=;
 b=feGTxqSXERl0L3eCSE6YigSirkkf0N7bft4onwmib6AoJxANvHkUEmlOmwL7rnO4BU
 BvXkGmh9cZ9pM5X7XGkNOGD+n5HN1sikZ7Wi4KloEW7LgpvDHMPfiE3k/xEaD/DjhwoA
 P1hgWNlU/QebAE9ymflz6b2wDw2qSAkpPjkNPJW54ODnRlokkIl3agjnsj0LKtBqG+mJ
 G/35ZyCVFHDJKUADjXJHeayW1LQte/cnj/Cf071P/zKk47sCAX1OSmQdF2sYjub+qEpj
 2UjPXXSERq37rLemM/B3B+X8E8PSO1UOla2oSRuq+SGKyiZZ6ioXiIWswy+q7rUkT9gb
 EyiA==
X-Gm-Message-State: AOAM531F3oUO1QaEO3x1ENXj1r7toC6ajQl93uiqfvmaYKnaK1D0PDZW
 btgG/38TzRlGOP/ydY44sjYjtA==
X-Google-Smtp-Source: ABdhPJyBLGaxMiD9h5m7lNfe0Fp88P8FDv0Rv1bI+H6lZvwzTGY3m5NIOU4EVZdC+BdDYxt8ElPefQ==
X-Received: by 2002:a62:aa05:: with SMTP id e5mr16597138pff.159.1597781310313; 
 Tue, 18 Aug 2020 13:08:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m62sm738843pje.18.2020.08.18.13.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 13:08:29 -0700 (PDT)
Date: Tue, 18 Aug 2020 13:08:28 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/11] x86: make TASK_SIZE_MAX usable from assembly code
Message-ID: <202008181308.A4A6674@keescook>
References: <20200817073212.830069-1-hch@lst.de>
 <20200817073212.830069-9-hch@lst.de>
 <202008181244.BBDA7DAB@keescook> <20200818195539.GB32691@lst.de>
 <202008181258.CEC4B8B3@keescook> <20200818200016.GA681@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818200016.GA681@lst.de>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 18, 2020 at 10:00:16PM +0200, Christoph Hellwig wrote:
> On Tue, Aug 18, 2020 at 12:59:05PM -0700, Kees Cook wrote:
> > > I didn't see a problem bisecting, do you have something particular in
> > > mind?
> > 
> > Oh, I misunderstood this patch to be a fix for compilation. Is this just
> > a correctness fix?
> 
> It prepares for using the definition from assembly, which is done in
> the next patch.

Ah! Okay; thanks.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
