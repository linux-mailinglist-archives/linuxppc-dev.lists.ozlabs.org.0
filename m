Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0221710A607
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 22:32:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MxvT74NFzDqkx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 08:32:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.65; helo=mail-io1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mwcm06DxzDqPN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 07:34:47 +1100 (AEDT)
Received: by mail-io1-f65.google.com with SMTP id p12so14821000iog.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 12:34:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eCiyINJIqZQ9+c/j9O3wV96E5XzkXxVGgIEzTJ6ccpU=;
 b=cPkNI+weP8gWC6JmSbYZigV7en69JYu70cprwJqdzzpoQ+uEjs5Pz0B5KPh2HUxsLY
 8X5kXzyaY1S409KyZwIDzEimuZcb288JQY7nX5tnQpbTVEhfLINSCLwOAYagzb0uoZ99
 LOTJWB6TC9g7kTCR1pUe97bLy0AjWGvGHAw5ZRuBWc9xhvHZuCoxYv5pVRxeznR2o0Zo
 mJgnO3ZzUMo9AmQLh0Z2VPPiJSyy+I47CmOUaWfKNEGe9DOJ4CVHo3XuT1AQLMA8AxWT
 bcnoDkpgZ/9RLrWwQJUwvhRToWG8GXNJw/KHNkNrrvlkDGUWCK42yqM0SytZ3yHoZJqK
 AGCA==
X-Gm-Message-State: APjAAAUudNiTTXyz4AEmekK/h4gaV4R0ORSFmcveYQHiufrZ4udG/vzO
 mGs9FjOAuZg8iap8tXSTkw==
X-Google-Smtp-Source: APXvYqyNLRbXmRMw2om5THIIvUDL/2IP2aEwIaLwJGNOkUm6TYCHlgggxCi3KYF+cIwCDLGz2FM3sA==
X-Received: by 2002:a6b:f317:: with SMTP id m23mr17361728ioh.303.1574800484514; 
 Tue, 26 Nov 2019 12:34:44 -0800 (PST)
Received: from localhost ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id k22sm2923474iot.34.2019.11.26.12.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 12:34:43 -0800 (PST)
Date: Tue, 26 Nov 2019 13:34:42 -0700
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v3] libfdt: define INT32_MAX and UINT32_MAX in libfdt_env.h
Message-ID: <20191126203442.GA20537@bogus>
References: <20191113071202.11287-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113071202.11287-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 13, 2019 at 04:12:02PM +0900, Masahiro Yamada wrote:
> The DTC v1.5.1 added references to (U)INT32_MAX.
> 
> This is no problem for user-space programs since <stdint.h> defines
> (U)INT32_MAX along with (u)int32_t.
> 
> For the kernel space, libfdt_env.h needs to be adjusted before we
> pull in the changes.
> 
> In the kernel, we usually use s/u32 instead of (u)int32_t for the
> fixed-width types.
> 
> Accordingly, we already have S/U32_MAX for their max values.
> So, we should not add (U)INT32_MAX to <linux/limits.h> any more.
> 
> Instead, add them to the in-kernel libfdt_env.h to compile the
> latest libfdt.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> My initial plan was to change this in a series of 3 patches
> since it is clean, and reduces the code.
> 
> [1/3] https://lore.kernel.org/patchwork/patch/1147095/
> [2/3] https://lore.kernel.org/patchwork/patch/1147096/
> [3/3] https://lore.kernel.org/patchwork/patch/1147097/
> 
> 1/3 is stuck in the license bikeshed.
> 
> For 2/3, I have not been able to get Ack from Russell.
> 
> So, I chose a straight-forward fixup.
> 
> 
> Changes in v3:
>  - Resend as a single patch
> 
>  arch/arm/boot/compressed/libfdt_env.h | 4 +++-
>  arch/powerpc/boot/libfdt_env.h        | 2 ++
>  include/linux/libfdt_env.h            | 3 +++
>  3 files changed, 8 insertions(+), 1 deletion(-)

Applied.

Rob
