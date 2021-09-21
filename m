Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AE5413A76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 21:01:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDW4j47dfz2yQD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 05:01:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c9uP+rap;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=c9uP+rap; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDW410MyFz2xYN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 05:01:18 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id 145so387806pfz.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 12:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uUvwtgDvS9z+MmLCsIbndyuppV43gHnzlz5qvL6KeNg=;
 b=c9uP+rap/UfN7fREE6h8u3lsZij8/9nesp5oAq6rWx9xNnYvzMF9PP463fCmsUqDar
 kEwNNzzupFjl3iVssQImb8bF3h2/B/8MlMGNIDKsuMe9bchBPSyFkLc+uuhUiy9QTIMI
 6UVxssDsqkegyngHCgoDjyvtGGXIsR18yy7Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uUvwtgDvS9z+MmLCsIbndyuppV43gHnzlz5qvL6KeNg=;
 b=acMSgLwFnqV7/f1CBz0hojO+BVMDIjG+uQVvGU1YccSRN2xB1Cd/d03M5IUXqkuFRG
 iNeM64Ga7D/yKBKkaw4SMPWNizEqSz+Zz4o22V39JwJ63+0bqLtlA1EzJdvQMVBMMPSY
 E4VqNGpF84iqfjstx+C3x2Ld+4Fk0QV5YBLeYfRAKVo15KhEohGrTeDYzOVIy5W10U7B
 sgKWyptpeWcg1Fq0deOwkLnmIDWLOK/UtwHM4wIicUQkNMmTVjixa0+QLgzjM+XOB52J
 DwkII0PkDrBfbOtyCPunLQaNkLsBHT5Y+crvtVKOFJagYlZ9dSdsvDEevLWwuNGfS9Vi
 4BlA==
X-Gm-Message-State: AOAM531y3DZTUGrNYc0EmukRNhh2j11ats5C7ksZf58V2FILbY1G7mTv
 i/LPikR5XWyK8Xlgc5XuLMM+EA==
X-Google-Smtp-Source: ABdhPJyhkEtFnUnBg+9qtMK4KmQYa6j/evLKD74iespv+jzZ07EoQOA7rlY7bUrm0t6g+7REwX8YJw==
X-Received: by 2002:a63:2cce:: with SMTP id s197mr3869655pgs.45.1632250874538; 
 Tue, 21 Sep 2021 12:01:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t6sm3451285pjr.36.2021.09.21.12.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 12:01:13 -0700 (PDT)
Date: Tue, 21 Sep 2021 12:01:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH] mm: Remove HARDENED_USERCOPY_FALLBACK
Message-ID: <202109211200.14E421C@keescook>
References: <20210921061149.1091163-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921061149.1091163-1-steve@sk2.org>
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
Cc: Andrew Morton <akpm@linux-foundation.org>, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-hardening@vger.kernel.org, David Rientjes <rientjes@google.com>,
 Christoph Lameter <cl@linux.com>, linuxppc-dev@lists.ozlabs.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>,
 "Serge E . Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 21, 2021 at 08:11:49AM +0200, Stephen Kitt wrote:
> This has served its purpose and is no longer used. All usercopy
> violations appear to have been handled by now, any remaining
> instances (or new bugs) will cause copies to be rejected.
> 
> This isn't a direct revert of commit 2d891fbc3bb6 ("usercopy: Allow
> strict enforcement of whitelists"); since usercopy_fallback is
> effectively 0, the fallback handling is removed too.
> 
> This also removes the usercopy_fallback module parameter on
> slab_common.
> 
> Link: https://github.com/KSPP/linux/issues/153
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Suggested-by: Kees Cook <keescook@chromium.org>

Thanks for doing this!

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
