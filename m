Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3158C248ECF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 21:38:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWLmy5BPbzDqmY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 05:38:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=l2ujWwd6; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWLhK30KpzDqYd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 05:34:25 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id e4so10717pjd.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 12:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Tc2Y/7wRUGR7GO4HI5D5o1JOg/02jGLqqiMyiLuhQfs=;
 b=l2ujWwd6BMG71uJ+lE/u8hWi1z2UCA7KAWMpdnE1WzCwTe07wkyg50hoJQMVi/k5vS
 10b1jlIwnAAB1jWtkPfeKBvqJMoyZBbScKD9sht7QrmX7W7SSdxi+jcaauUGkGBX0fzB
 CHA2p5bBmBuY5K3LiVDClVPuHglS30NtSusnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tc2Y/7wRUGR7GO4HI5D5o1JOg/02jGLqqiMyiLuhQfs=;
 b=hsDaXPl1+UYjUPSHZuwbBNDftrlrzS/+B3mRyYkoMF3LmCh5VwrfJIcfS8SlycJq6h
 gPFNDSUiISwxhgkp/yvgpWtNi6fZkuqTvwEU7lrswWCPKqooVuWkD/qcZeMlAnY3RatL
 AIf0gyuVkDk6C8lo6JmUVK/BdcBQLFVvWu1w7tUAya+O7BTe7fRP9avvTrBVOC531NaH
 cx73P+1PgSEOPZ51d2nuZzviU5Gu0AGEg5LlElCuwMD8LSTPkMaLEsw85oK2E+OKYO51
 at00CO/IipA6aDWaU4yAgtHQ2ZnWvnCuBUMxh02TsJz9JY+GxwBVwL3dyfzXErpp++Oo
 gLbg==
X-Gm-Message-State: AOAM530SG/y0mfDsOXoUl3vUnYzupisSVPf168sBLeaaAiY98u5h8BLI
 7OOnSPzMKxYyz9KVtLTTV1U6NQ==
X-Google-Smtp-Source: ABdhPJyRtGUPEH8hQB3PYbEreefecpWhQ0b3Q4RWm7821VkslhtwepOtRIsUHn68CV2l8iU1xIwP+A==
X-Received: by 2002:a17:902:9f8a:: with SMTP id
 g10mr16598513plq.158.1597779263268; 
 Tue, 18 Aug 2020 12:34:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id k21sm22549273pgl.0.2020.08.18.12.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 12:34:22 -0700 (PDT)
Date: Tue, 18 Aug 2020 12:34:21 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/11] fs: don't allow kernel reads and writes without
 iter ops
Message-ID: <202008181234.B1D9572C@keescook>
References: <20200817073212.830069-1-hch@lst.de>
 <20200817073212.830069-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817073212.830069-3-hch@lst.de>
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

On Mon, Aug 17, 2020 at 09:32:03AM +0200, Christoph Hellwig wrote:
> Don't allow calling ->read or ->write with set_fs as a preparation for
> killing off set_fs.  All the instances that we use kernel_read/write on
> are using the iter ops already.
> 
> If a file has both the regular ->read/->write methods and the iter
> variants those could have different semantics for messed up enough
> drivers.  Also fails the kernel access to them in that case.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
