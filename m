Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B80248ECD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 21:36:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWLl11l0PzDqnl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 05:36:45 +1000 (AEST)
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
 header.s=google header.b=ZSp9xat0; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWLgH4ChSzDqnr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 05:33:30 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id y206so10442079pfb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 12:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MjCq1W/1ioetJhu5FHe+zUUPMY/5mkoypyjvkRYOOfI=;
 b=ZSp9xat0/L8E2JVKpikkiQOwo0KeBmvsVfi9JDqEgHeRPRqFmz600t++sn4j3SFFY3
 ndk5omuHlIeXZrNCWrkauqAodAEhIoDLZbD8a8lERELeNddkhRwwm/2YDnNCQrECafWm
 6jDrYIP1mV/4iOszVnpmhjBo268Q0ew3+tDbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MjCq1W/1ioetJhu5FHe+zUUPMY/5mkoypyjvkRYOOfI=;
 b=K97mjv9EhjDE/9LKy7ZedNcYrPMLiIw+eG54SGiX/lf/4oFbm+ihSsRjPJr6jucZXV
 eUfMs4JRtI6LQGkt8hbBNr9AX6/y886B+mhL0Hvt7Ej680Dbemtmiw8Aa9Eo1e10ingt
 DAcHLN22xdsJe2qbJ51kREzeDT5ElPIan/J4O/mitJq5iySypCxdTwQXN2J13VlEkjWD
 Q0NboE/Ill7dVp9g8QWETTjQI0WCquydQ+29eA140pyxAzzIVD/l4z6+h6rzuU79Javv
 /9yjzjmU1RuMxpjANyMfOO7cE/+pw73sP1QaRRVlO60xue0L7KLBr2gB/E9K6kO/bDdN
 zfSw==
X-Gm-Message-State: AOAM530citViqkwpf5YoDJF9y4Bl175NT57mzhj6lo7PQIbY9kZMh338
 ExcSzBK04KWgiaaY5pbkJ4Z5kw==
X-Google-Smtp-Source: ABdhPJyzAIpq3Hy05Z4M9rRxg2PdfbbOqwxy85fIgRk/eDuHmAJ2FVfGWVokgW9E7diZdhjU8k0T+g==
X-Received: by 2002:a63:7707:: with SMTP id s7mr14086242pgc.407.1597779207531; 
 Tue, 18 Aug 2020 12:33:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l8sm683551pjb.14.2020.08.18.12.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 12:33:26 -0700 (PDT)
Date: Tue, 18 Aug 2020 12:33:25 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/11] mem: remove duplicate ops for /dev/zero and
 /dev/null
Message-ID: <202008181233.1506BFFD3F@keescook>
References: <20200817073212.830069-1-hch@lst.de>
 <20200817073212.830069-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817073212.830069-2-hch@lst.de>
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

On Mon, Aug 17, 2020 at 09:32:02AM +0200, Christoph Hellwig wrote:
> There is no good reason to implement both the traditional ->read and
> ->write as well as the iter based ops.  So implement just the iter
> based ones.
> 
> Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
