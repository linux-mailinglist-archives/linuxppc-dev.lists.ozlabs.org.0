Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9E1248F4A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 22:01:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWMHz5xdczDqrj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 06:01:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=gq7q0z5o; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWMCn6ZB5zDqZ3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 05:58:13 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id k18so10482801pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 12:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tTVXJslCMG4FZPrEp9hH9OHTkHq0Rxca4OvEPGr6tWc=;
 b=gq7q0z5om3draMDAHbZA5EsU+9Cxa31kwlRDV0/Er1pW+z1qfEcyt1fBlTqBfcrzuQ
 aFdjiDgKpuWSVPZi9X+X5YfGML+Y2qGMfARgkWItiaJiRkKsVFP8BsTtVqxj/gyq+xRr
 nIdAL1x5QDk6qj8TgrGE+NDlIYgLUWG02KDuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tTVXJslCMG4FZPrEp9hH9OHTkHq0Rxca4OvEPGr6tWc=;
 b=cRyhaCgh7IJ0SnxuYk328M/RBJMVZ5jZ0TVIn3KnegDeJxRUJTemI4mNghPugGWTjQ
 Q4BIPFA4+/OD7vi+LF7qCywKabCzXae7Rva67xFPGPY4aqrKncQB6cq4mWqdVt2lDm1t
 GjYJ8Y8FdZx3Kccsu8MVa+T6qfwIpu9znHeD2CEjPfDN/ColWAQRSyTzIo5Hps+CznlT
 kV4WWEN87nOfvqCWABnsoA/nb/eHPCZTK6WgUxK81QszPHRHbvmpJebozbtnBcTPJIbb
 FIsyxD2NnNLs+Wvd4JmrBOObqDCZc0KceF4xw/UF1AmU5qBCyt3Q5yi97Y998xNbJWON
 4j0A==
X-Gm-Message-State: AOAM5310ZUoHN/ISUtujGx2uTwAQpo7qm5MJzUzTXzBZeeCIGzCXUj6v
 iLi8Yfs4Pc5ZVFaD/Ah1Le7ezQ==
X-Google-Smtp-Source: ABdhPJzDuczrA0WCZ4sUiY1oiLdPBuW8K0ScYn5uoF33E0VkFPD//MrtFx8TGA3olMNvjK57e1u3JQ==
X-Received: by 2002:a62:d149:: with SMTP id t9mr16393509pfl.59.1597780689592; 
 Tue, 18 Aug 2020 12:58:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a13sm24551207pfo.49.2020.08.18.12.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 12:58:08 -0700 (PDT)
Date: Tue, 18 Aug 2020 12:58:07 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/11] fs: don't allow splice read/write without explicit
 ops
Message-ID: <202008181256.CABD56782@keescook>
References: <20200817073212.830069-1-hch@lst.de>
 <20200817073212.830069-4-hch@lst.de>
 <202008181239.E51B80265@keescook> <20200818195446.GA32691@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818195446.GA32691@lst.de>
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

On Tue, Aug 18, 2020 at 09:54:46PM +0200, Christoph Hellwig wrote:
> On Tue, Aug 18, 2020 at 12:39:34PM -0700, Kees Cook wrote:
> > On Mon, Aug 17, 2020 at 09:32:04AM +0200, Christoph Hellwig wrote:
> > > default_file_splice_write is the last piece of generic code that uses
> > > set_fs to make the uaccess routines operate on kernel pointers.  It
> > > implements a "fallback loop" for splicing from files that do not actually
> > > provide a proper splice_read method.  The usual file systems and other
> > > high bandwith instances all provide a ->splice_read, so this just removes
> > > support for various device drivers and procfs/debugfs files.  If splice
> > > support for any of those turns out to be important it can be added back
> > > by switching them to the iter ops and using generic_file_splice_read.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > 
> > This seems a bit disruptive? I feel like this is going to make fuzzers
> > really noisy (e.g. trinity likes to splice random stuff out of /sys and
> > /proc).
> 
> Noisy in the sence of triggering the pr_debug or because they can't
> handle -EINVAL?

Well, maybe both? I doubt much _expects_ to be using splice, so I'm fine
with that, but it seems weird not to have a fall-back, especially if
something would like to splice a file out of there. But, I'm not opposed
to the change, it just seems like it might cause pain down the road.

-- 
Kees Cook
