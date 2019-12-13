Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E97B11ECF9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 22:36:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZPBR69WtzDrKb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 08:36:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZP7h01trzDrJV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 08:34:23 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id 77so730418oty.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 13:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CnL0ppP0hu7PBsUqVprgfTmViSxAVBY2hM4t+lEup30=;
 b=kVLFo5cxaUGeCAEjWBvQg4m6s6hhzQfVAhLgvHyqXOrAyI12PkXMV7Mity49i/6Tdd
 JrCWuPTfA/UGn4Sk2gMh5NPEVGUKJBokwdAjex8GKLDMBQ2ilfB5N7y8Vea4mjRCeuLs
 dcxzHPQSBrDwyws9s88NQsPzdgafX175O0wKo/vIYm4cw3BTeUgnf4g03vvyW3qEjdph
 MyqPFNai9XKsqersFXd5qF8m4cIqPBNZihMKIdPWRKUAFAVuv4QJcdvAPY64Wk3+tZ57
 xzHRYncFmUpmZUX0GjP8RH1OV8i/+4MhU2WtyfbKQZwTFRCKRRY7yoFv5uJio3eQFN9o
 iRqw==
X-Gm-Message-State: APjAAAUkE5hgSYTtzpV6tTZd4BkXXI28g0kXvlaCK6HVF61RhPs57N27
 162nOhu+LljkMsZ935ql+A==
X-Google-Smtp-Source: APXvYqxtLmwCSQzcGbNdN9x9BipFNkJ2YdICwPsaYd45wZnOrdGRLQWzOOV9fMbVNvAU4hoYVvYkLw==
X-Received: by 2002:a9d:6181:: with SMTP id g1mr17366399otk.104.1576272860189; 
 Fri, 13 Dec 2019 13:34:20 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a16sm3798678otd.64.2019.12.13.13.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 13:34:19 -0800 (PST)
Date: Fri, 13 Dec 2019 15:34:18 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/devicetrees: Change 'gpios' to 'cs-gpios' on
 fsl,spi nodes
Message-ID: <20191213213418.GA17361@bogus>
References: <7556683b57d8ce100855857f03d1cd3d2903d045.1574943062.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7556683b57d8ce100855857f03d1cd3d2903d045.1574943062.git.christophe.leroy@c-s.fr>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 28, 2019 at 12:16:35PM +0000, Christophe Leroy wrote:
> Since commit 0f0581b24bd0 ("spi: fsl: Convert to use CS GPIO
> descriptors"), the prefered way to define chipselect GPIOs is using
> 'cs-gpios' property instead of the legacy 'gpios' property.

This will break using a new dtb on a kernel without the above commit. Or 
with any OS that never made the change.

I'm fine with the doc change, but you should keep 'gpios' as deprecated.

> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  Documentation/devicetree/bindings/spi/fsl-spi.txt | 8 ++++----
>  arch/powerpc/boot/dts/mgcoge.dts                  | 2 +-
>  arch/powerpc/boot/dts/mpc832x_rdb.dts             | 2 +-
>  arch/powerpc/boot/dts/mpc8610_hpcd.dts            | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
