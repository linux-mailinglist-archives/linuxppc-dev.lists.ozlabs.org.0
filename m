Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53851172322
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 17:22:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SydB5RDdzDr2N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 03:22:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=YDIG629t; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SyWG65t1zDr1Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 03:17:46 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id h8so1700801pgs.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 08:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vtq0s3tQnCqURKTOAldGkoKbYrI0rQodXXv9xIVTT3Y=;
 b=YDIG629tX7x9Pmb6sOmczh6ju+bZ3q+dGbK7sBRcVdlqc0F739Ir2LJfcrSO7KrD8p
 calXeJ+GMbO9XewuL7HizNgGs/JA+ljTxX/tVQ9yMZ5GWuvmuwGMBVduj+CIScUSXBtj
 UyGuooe9zEJNdNmNz1GrIjjcFKI0T/Zrkmnkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vtq0s3tQnCqURKTOAldGkoKbYrI0rQodXXv9xIVTT3Y=;
 b=FMKBxqg19MDkkKphoWOaHwykCAcfqGPEXWhVEgxftwx/GD0nEh8GK6VlkBDi+8x39C
 nbnw/SgXC4AvV5N3E3+JW138sjk4N/gNWc6nvBeJ4A2UHOPQG+T5Ki7y0HDm26qer7f4
 ZBBypJIrF3V93EiYj0FVnUePTX+ud+NAK1mbtrRCfR3z0fh941Bj0gR1J7z6KkNEviaZ
 sh9ASfzRlJBA906IcnxsfNqlnzVg1V8UMIFIK5SXiOIa9GbV8LJyLJ4ZXma+lDRtOLGI
 unfFFG11gLfNx9k7b/1C7Du8RKtjooJiW9OFLcrmWPlnI1k+DK7jQwcz0JUSuTFlrzgM
 pisg==
X-Gm-Message-State: APjAAAVc56BB9alP1mBW/MZuBAXmw7baVfA09QIEmpBlfMIgx38teku7
 /1GwNFkXQ8Se48aKOg4zS7ZRdA==
X-Google-Smtp-Source: APXvYqwJAwotmy024gEz2pgQK+lDCNvJc7X5WXUKZHZ3LEAhFZZwS2O/ca0qkaW45CWAD2FYKcCGrw==
X-Received: by 2002:aa7:9f90:: with SMTP id z16mr4879847pfr.161.1582820262963; 
 Thu, 27 Feb 2020 08:17:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z30sm7726657pff.131.2020.02.27.08.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 08:17:42 -0800 (PST)
Date: Thu, 27 Feb 2020 08:17:41 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] selftest/lkdtm: Use local .gitignore
Message-ID: <202002270817.1C32C98@keescook>
References: <e4ba4f716599d1d66c8bc60489f4b05764ea8470.1582812034.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4ba4f716599d1d66c8bc60489f4b05764ea8470.1582812034.git.christophe.leroy@c-s.fr>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 27, 2020 at 02:07:10PM +0000, Christophe Leroy wrote:
> Commit 68ca0fd272da ("selftest/lkdtm: Don't pollute 'git status'")
> introduced patterns for git to ignore files generated in
> tools/testing/selftests/lkdtm/
> 
> Use local .gitignore file instead of using the root one.
> 
> Fixes: 68ca0fd272da ("selftest/lkdtm: Don't pollute 'git status'")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Yeah, that's better. Thanks!

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  .gitignore                               | 4 ----
>  tools/testing/selftests/lkdtm/.gitignore | 2 ++
>  2 files changed, 2 insertions(+), 4 deletions(-)
>  create mode 100644 tools/testing/selftests/lkdtm/.gitignore
> 
> diff --git a/.gitignore b/.gitignore
> index bb05dce58f8e..b849a72d69d5 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -100,10 +100,6 @@ modules.order
>  /include/ksym/
>  /arch/*/include/generated/
>  
> -# Generated lkdtm tests
> -/tools/testing/selftests/lkdtm/*.sh
> -!/tools/testing/selftests/lkdtm/run.sh
> -
>  # stgit generated dirs
>  patches-*
>  
> diff --git a/tools/testing/selftests/lkdtm/.gitignore b/tools/testing/selftests/lkdtm/.gitignore
> new file mode 100644
> index 000000000000..f26212605b6b
> --- /dev/null
> +++ b/tools/testing/selftests/lkdtm/.gitignore
> @@ -0,0 +1,2 @@
> +*.sh
> +!run.sh
> -- 
> 2.25.0
> 

-- 
Kees Cook
