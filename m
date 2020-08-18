Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9B7248EAC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 21:29:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWLb24cljzDqlr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 05:29:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=QyAICf9K; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWLXz14PpzDqkg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 05:28:01 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id y10so8117620plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 12:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OKHnQstXsjpvLQxUlisdTJtu9Dd8qDjYq5doku9nVeE=;
 b=QyAICf9KgEuQclheMs291Y2a3FseDYQnvIJBXSVKceC05GiYVUH/tD1F9dAAB5jkXy
 Me3o5mBj6v6tVYtlZzju1/QJkfKLhC8WNZX9tDDnxjAN8yhxm10fq7Jif8C/bBou8u+w
 jcMFSVqMPG6wDNRIQNDJc3hml8vNrisx1y6/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OKHnQstXsjpvLQxUlisdTJtu9Dd8qDjYq5doku9nVeE=;
 b=S8VRv/ngtUnbQh2ekYdBIf5wlheO5MoVEHoiHjgZilVXvXaU/ZM/K3cgHlpY4pESpd
 kiVIs+79dkbSxbhQKBnIIVrej7v40wlIdGdhrW09o1EjgcTlAWLymx1VFKzjFGPlnIbv
 n4qcNj+FnLCKwOeWGPd+Gqjc3wfwvi8g4LYL/L0jzYNrCG6MGQy7xXlSv3yzlTk8aXLd
 2h5rg100JWtoZmiE8Jn6vSdMzFqE7+D5hqRJr67WtbL7/lP8vn9G71eOF3TKXqi6bEGQ
 LZxeh8s6/xbJS59L7sl+icNM502al6OgjtRS2J9fgT/dzhU6QCcubdIkLupwzh6YSSK7
 QmAw==
X-Gm-Message-State: AOAM530skjHPmal+CahhQ0UGYQsvltEpioFy7LwG3PpPRC13ZW3Efn70
 3BASsVYD+p4Fz5sRU/YahG6F9w==
X-Google-Smtp-Source: ABdhPJxbgaFuRtRGjA2NiMRtgl4s0aHVu6/1aAGF8JszULXuHhAcX2HCnNgmwLKolI+rcXeKrqOhSg==
X-Received: by 2002:a17:90a:8904:: with SMTP id
 u4mr1182215pjn.87.1597778877709; 
 Tue, 18 Aug 2020 12:27:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y19sm24777979pfn.77.2020.08.18.12.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 12:27:56 -0700 (PDT)
Date: Tue, 18 Aug 2020 12:27:55 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/11] x86: move PAGE_OFFSET, TASK_SIZE & friends to
 page_{32,64}_types.h
Message-ID: <202008181227.C3A84957AD@keescook>
References: <20200817073212.830069-1-hch@lst.de>
 <20200817073212.830069-8-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817073212.830069-8-hch@lst.de>
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

On Mon, Aug 17, 2020 at 09:32:08AM +0200, Christoph Hellwig wrote:
> At least for 64-bit this moves them closer to some of the defines
> they are based on, and it prepares for using the TASK_SIZE_MAX
> definition from assembly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
