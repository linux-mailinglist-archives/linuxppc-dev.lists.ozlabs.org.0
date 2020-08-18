Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D03C248EE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 21:44:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWLw45PdGzDqbc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 05:44:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=DYnvUd31; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWLqM4g0lzDqkq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 05:40:31 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 128so10224828pgd.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ch3OV58IkPdZykabiTW5C4mVF3OzlaCKDtp5K191NwI=;
 b=DYnvUd31Yol0xDsMTII443AXD5SBZUHRBPBVSKFnIfKxZq5cSp3Bc8ihWc7X9kOoer
 7YDPAJt6p40V7jNKuO+C2ZaQryG9rD13tlWTVI20PKG6f1fpvlxWiKoBvHQpXsv8E/02
 XACxvcZsnlIs6M370bs+/dJJCxnJ/K0R1dBCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ch3OV58IkPdZykabiTW5C4mVF3OzlaCKDtp5K191NwI=;
 b=Dy9QVcjTzRuAP5GwdmGdUi5WaMAaqsS1rr3gtUmiXV7jLD59upBhFBAAzn1fn/axwN
 f0Wu/mgHT7M7zAefMilGTiwHPNII6GjOzLFXRIaCYyTJfCdy2fGFmHu6z/USLPCW7/53
 2Ct++i5EiSJq2PNyzUezU9Smg3R13Go9+SVf1HzJqxT6gR8GbfY2i/hPsQjTO3qiC7LH
 3crVx7bsfgIuaEKbhnxXbo9uccHcU9gQZVRleoTS3B5d0cTLqfOfz0asIG33nvIbKtPT
 8bXZ4776z+rquchRkLAbm/Ee1gjbTYxAveKF/3v864b/KIjBi0LCOv/XUvBJNPrGo0MM
 bjdw==
X-Gm-Message-State: AOAM533WYQ1l7fTt05nTwUYBJX5A4V2aCRebfTtjceZE8cPZqNWeVbEa
 bLM8/gp0hGx9wOjFfyy1Ki1frg==
X-Google-Smtp-Source: ABdhPJzFD2QepABnrJdmhmbyKfy6j0eIjoXbjXujD4lPLNrelLvSz1BFbjW5ovNHdN12KmA5WLvucQ==
X-Received: by 2002:aa7:9d85:: with SMTP id f5mr16545592pfq.218.1597779629499; 
 Tue, 18 Aug 2020 12:40:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id mr21sm620205pjb.57.2020.08.18.12.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 12:40:28 -0700 (PDT)
Date: Tue, 18 Aug 2020 12:40:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/11] uaccess: add infrastructure for kernel builds with
 set_fs()
Message-ID: <202008181240.0B31CD9@keescook>
References: <20200817073212.830069-1-hch@lst.de>
 <20200817073212.830069-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817073212.830069-5-hch@lst.de>
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

On Mon, Aug 17, 2020 at 09:32:05AM +0200, Christoph Hellwig wrote:
> Add a CONFIG_SET_FS option that is selected by architecturess that
> implement set_fs, which is all of them initially.  If the option is not
> set stubs for routines related to overriding the address space are
> provided so that architectures can start to opt out of providing set_fs.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
