Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A707B166ADF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 00:19:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NrCZ5xrQzDqCV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 10:19:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Z/Zpxrbe; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Nr9w6vFTzDqXK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 10:18:28 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id t6so40112plj.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 15:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qiIWn/AwNao12jLnO57Zy1eSMfhg2OcOJSkC6NTyoL4=;
 b=Z/ZpxrbeGyYr1O90OCAFhyo23J1bsbTFVT00brNeeTuwwwK96lwnqkLFD1L9OKp7Jr
 psjnCPGENnn4mnePs4ZwzgNh8eDSn+diPoIPMGegJueuimr7kxsidVFZopT24RcG5xDK
 SC/zMlsdynQs1IWQOwGc2ldMpWPCirlqrqHmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qiIWn/AwNao12jLnO57Zy1eSMfhg2OcOJSkC6NTyoL4=;
 b=flELod9yC3w51leHZKnsx/8TUHfF0hcM1Uebqc4wPy5QUMww7XhxwCy1YdVjTF9Ett
 epzUk8P1aKq3uHg7IzydYtuqG7Lq2Ete+4hHu8fUAFXM0XhCdAmSnncmAY4ePHjEBANE
 JU6aIIsfrYVv7Q1CylfKD7R/JK3nGN2Hxm7eKSsiGiU93zPNjYIATuHiNzSsS4yVHlfd
 f2Ri/pulTzAREMCMRx36SSKMBg8LE6Xh2tRd07wFxZZUkEJb10iFVC2NYTli0yl4eCSj
 tglHjm6zQM5lINdjljTYjpMkLodAEW+ZKdK6LvnzeGuzjEk+/ZO1zXlFDYRwjkk1DJrX
 cglA==
X-Gm-Message-State: APjAAAU+y1I7/bawZoHxnY5IlS5Lh6vy3lry8elMJsfj1MKhGRjc4yqT
 Qkr8okU9VTffpIUQKKVY3mxI2w==
X-Google-Smtp-Source: APXvYqzhEIa1OtXP4MAIV3zoNmbsVPWGunyaLyvhOtt9UX6ZeNPh9zWaBFlyVTh2FozX8mEGqu5nLQ==
X-Received: by 2002:a17:90a:d807:: with SMTP id
 a7mr6562607pjv.15.1582240705082; 
 Thu, 20 Feb 2020 15:18:25 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l69sm375799pgd.1.2020.02.20.15.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 15:18:24 -0800 (PST)
Date: Thu, 20 Feb 2020 15:18:23 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] selftest/lkdtm: Don't pollute 'git status'
Message-ID: <202002201518.AFD4C0C9FA@keescook>
References: <668b6ff463849ceee01f726fbf3e7110687575ec.1580976576.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <668b6ff463849ceee01f726fbf3e7110687575ec.1580976576.git.christophe.leroy@c-s.fr>
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
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 06, 2020 at 08:11:39AM +0000, Christophe Leroy wrote:
> Commit 46d1a0f03d66 ("selftests/lkdtm: Add tests for LKDTM targets")
> added generation of lkdtm test scripts.
> 
> Ignore those generated scripts when performing 'git status'
> 
> Fixes: 46d1a0f03d66 ("selftests/lkdtm: Add tests for LKDTM targets")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Ah! Yes, a very good idea. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  .gitignore | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/.gitignore b/.gitignore
> index b849a72d69d5..bb05dce58f8e 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -100,6 +100,10 @@ modules.order
>  /include/ksym/
>  /arch/*/include/generated/
>  
> +# Generated lkdtm tests
> +/tools/testing/selftests/lkdtm/*.sh
> +!/tools/testing/selftests/lkdtm/run.sh
> +
>  # stgit generated dirs
>  patches-*
>  
> -- 
> 2.25.0
> 

-- 
Kees Cook
