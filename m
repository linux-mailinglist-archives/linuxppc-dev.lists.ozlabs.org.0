Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D727C248ED9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 21:42:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWLsv3CKRzDqkq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 05:42:43 +1000 (AEST)
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
 header.s=google header.b=DGsd0rtA; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWLpM0mBRzDqp7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 05:39:38 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id u20so10478323pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 12:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+piZ95CVdXuEkGHEl46eIFq4d8k/PB4mXonDrPOqmKY=;
 b=DGsd0rtAn+EKPFELhI752sDGcE5zFP+lMM8VmIoSeKoi6jMm45lvXfr9ws3MF5gc9l
 ve83Lz6XbS7dssqMUq/Lj8oMpn26ngBCwqg5X60YndlWLYNUsBegqrWnarq5zy/QGoxV
 hEAeArB2aRBW8ao8Fs7gzHlcJiD2QfQeaGNvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+piZ95CVdXuEkGHEl46eIFq4d8k/PB4mXonDrPOqmKY=;
 b=qDW7kCfwsT1/bu3Qx8gnKJ33ZJs8GjTFFxp58GOvpthLxranom3jS5+vm9mUWsWcOG
 4Ol/x3u6DxJLq7Tvs8iAG1IKgbmWMSs6gonqnYqoXIUw1wE9lJVYoneqJc0JOoEXd7kx
 0zF0fiX6xZQIJ0zaqyvTsuWT4/a0yHy79yuG9zK4YUNVQa24JasGGaOWCetj89iX68zh
 9Bwf4mDvietiQ7dQL1sDuTdtNTLNy6lS7GyvxvdZ21Z+Oyt9H/e2rvMZUxkg4HygUe3Y
 tpf/hPi1a0uZc09lIGjBszmF0kbLsly3fQ6MLCOKgAPHRYIfQChRzANlFpxPNgDX+ICL
 qZBg==
X-Gm-Message-State: AOAM533xRUoPAa6k2y5BUm0mCP0u3cK3Ds7kRolEAE9xc0C83oDQebV8
 quSsZ5wfBG3lETvrZ2YCWw5/7Q==
X-Google-Smtp-Source: ABdhPJxnDPhmwuColVON9fsNG6lMLA9e0FK5CJwZp+zherGpkgz5W95vJkHLhp5Y28PAYw30OH1SVQ==
X-Received: by 2002:a63:d1f:: with SMTP id c31mr13717358pgl.27.1597779576171; 
 Tue, 18 Aug 2020 12:39:36 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c27sm22083011pgn.86.2020.08.18.12.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 12:39:35 -0700 (PDT)
Date: Tue, 18 Aug 2020 12:39:34 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/11] fs: don't allow splice read/write without explicit
 ops
Message-ID: <202008181239.E51B80265@keescook>
References: <20200817073212.830069-1-hch@lst.de>
 <20200817073212.830069-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817073212.830069-4-hch@lst.de>
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

On Mon, Aug 17, 2020 at 09:32:04AM +0200, Christoph Hellwig wrote:
> default_file_splice_write is the last piece of generic code that uses
> set_fs to make the uaccess routines operate on kernel pointers.  It
> implements a "fallback loop" for splicing from files that do not actually
> provide a proper splice_read method.  The usual file systems and other
> high bandwith instances all provide a ->splice_read, so this just removes
> support for various device drivers and procfs/debugfs files.  If splice
> support for any of those turns out to be important it can be added back
> by switching them to the iter ops and using generic_file_splice_read.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This seems a bit disruptive? I feel like this is going to make fuzzers
really noisy (e.g. trinity likes to splice random stuff out of /sys and
/proc).

Conceptually, though:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
