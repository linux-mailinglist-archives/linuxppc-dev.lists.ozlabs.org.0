Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DA3279193
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Sep 2020 22:01:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByjTj707ZzDqgn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Sep 2020 06:01:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=g9cLhrnR; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByjS359qqzDqdM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Sep 2020 05:59:47 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id b17so76887pji.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Sep 2020 12:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ggl98Rof0DqS698qrdY9hreKRXA7T3yDj8NdjFuxFs0=;
 b=g9cLhrnRgqES/eJBfO3BCZ6hOeD4DoeH2QwAFtDPEoKoLEBcMNbcUiBhw3l99z3HIP
 96ai0RhzG1Eb62LlVkF8a0W2GSzYQVEf6UCRyxons3F53BAdEp5Q0g+oYUGk5zeW9JL6
 OppLGwbMhjgRG3mdThm6083xezOmWzEmC4jPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ggl98Rof0DqS698qrdY9hreKRXA7T3yDj8NdjFuxFs0=;
 b=cf1uti1k0HGaK0k4TPIDh9RhA3rJEZyt2ZJb2CrU58OFQMc5OYa8XmBYsBcHNGasWd
 Yt4BHdeGuyy1FIlAGzLNMoRCIqAf7W+zCOXP90D+9rC68Z3/14BXy3ci86mwxyTGenSZ
 DXnR9T8Y9t764olV5JWgRCMsIO+9NBM4GY5l+QtsbqbOiF9xvSINzRqRrCXGVV3zqU9G
 kGMVCW1r1Ase3679yU2aJGUWatzVOXEcUpZb1dpZbzHY1Qqfnm8RhMaICzEiVDzo4EGW
 wCDOse0tjTZKPN6Ohs/LOXQV44rzp/BeioDPKNrWhd55FKkXNMxqiTzYqPyQgJoiHYNX
 isSA==
X-Gm-Message-State: AOAM531HTkmFnzNEQtCcEvEUnV/F1cArjZDm2yu4izMFbMCVIx7YgWDG
 a9g6jVxLvcKISiknIv/ow5kurA==
X-Google-Smtp-Source: ABdhPJy3KLTZE90Cp/pFBvJWB9BSZkzrKvyRZzuIpHlgJhtA8ikMd7V7mVN5rs4E/EFRJOIBEopblQ==
X-Received: by 2002:a17:90a:86c2:: with SMTP id y2mr193950pjv.3.1601063984152; 
 Fri, 25 Sep 2020 12:59:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l14sm3120361pfc.170.2020.09.25.12.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 12:59:43 -0700 (PDT)
Date: Fri, 25 Sep 2020 12:59:42 -0700
From: Kees Cook <keescook@chromium.org>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
Subject: Re: [PATCH v2 3/3] selftests/lkdtm: Enable selftest for SLB multihit
Message-ID: <202009251257.52EAF495@keescook>
References: <20200925103123.21102-1-ganeshgr@linux.ibm.com>
 <20200925103123.21102-4-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925103123.21102-4-ganeshgr@linux.ibm.com>
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
Cc: msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 25, 2020 at 04:01:23PM +0530, Ganesh Goudar wrote:
> Add PPC_SLB_MULTIHIT to lkdtm selftest framework.
> 
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
>  tools/testing/selftests/lkdtm/tests.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
> index 9d266e79c6a2..7eb3cf91c89e 100644
> --- a/tools/testing/selftests/lkdtm/tests.txt
> +++ b/tools/testing/selftests/lkdtm/tests.txt
> @@ -70,3 +70,4 @@ USERCOPY_KERNEL
>  USERCOPY_KERNEL_DS
>  STACKLEAK_ERASING OK: the rest of the thread stack is properly erased
>  CFI_FORWARD_PROTO
> +PPC_SLB_MULTIHIT Recovered

Please squash this into the lkdtm patch -- I'd like test implementation
and kselftest awareness to go in together.

-- 
Kees Cook
