Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDD2299724
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 20:38:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKlWK6PJ2zDqQk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 06:38:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SDJXLDzl; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKlTS4F2bzDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 06:36:57 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id x1so3860216oic.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 12:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3ysSlN5Tw+8xH995xyNFoH11OC8nwORbFcbyWXKMjO8=;
 b=SDJXLDzlnMI8DIH2tg3vO1PKE8jLEAH9s27+k4BhCidZM9U86NVwRiL0683f8BNb/a
 Q2KisblbWauLt9IVfRv/hBIE9frovPPefvOQMo9z0uBRxRw4gREVlLzTPYvnpph1sHNP
 lwDWtQei6XnbdcEUJeYsmDdOuNrY/D9B+lWqSxV15zJpyYMcSy1F57VIOtlk9NTlQypu
 EjEkER8Czy1ZiGKfRXoPUemtSyA8USjBFUSCqt535pd9Uog/FeGkT9lPuUeL8fRYONPn
 URk1P3tc/UassStbBGJsgW+lKTvHyNoNMzLDX3z6e6RVs7o0uE6ciFr7TDk/BZj97I1x
 tErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=3ysSlN5Tw+8xH995xyNFoH11OC8nwORbFcbyWXKMjO8=;
 b=CQl0xFWvwdu+dZ0UWX4H7Y9KerQ37MRyWM3U54UuDkXg8arexE+Nwq5zkUAFz9PZQ1
 bD115/33UfGqFTk1PBIdAqldEFFQUBCDCRXq5uFg8Q8l2C8Jd3ypop5zIW1UkoyZhbFH
 KWHq6UaWWRu/sUdrDG5o7GU/bCqJRO8KU1YCiqil25g86R6s02b4fncvmmU5AWvSeQ58
 e3LQrUKyDDMmLpKeVcfeZZB9t5lmMBYcmDKSXGXZzsEazCbOnFU/QjoY4qcAZrgd9FjL
 IgEqX18OaCee6BbXI0GoiTwFHoq14kqn8EAYr2r8aDg05vOsHwnJxknxgKPTEHEz7y9j
 vKbQ==
X-Gm-Message-State: AOAM532zx7f2rpHj5MGVliU+LobUAwJbIW/oLZuz0pYRCxGYXbwunDSA
 vnJwwfoDxEVCfPfoHxVHRGA=
X-Google-Smtp-Source: ABdhPJz1luWp8J+17T/HhdkmAS4b6ea/N4WBdQo5t6husfQr4I68I4ofC2QOPr/uQgMGCrMSfsCJog==
X-Received: by 2002:aca:b256:: with SMTP id b83mr11449268oif.116.1603741014350; 
 Mon, 26 Oct 2020 12:36:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id b17sm4769216oog.25.2020.10.26.12.36.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 26 Oct 2020 12:36:53 -0700 (PDT)
Date: Mon, 26 Oct 2020 12:36:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] treewide: Convert macro and uses of __section(foo) to
 __section("foo")
Message-ID: <20201026193652.GA77796@roeck-us.net>
References: <fe8abcc88cff676ead8ee48db1e993e63b0611c7.1603327264.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe8abcc88cff676ead8ee48db1e993e63b0611c7.1603327264.git.joe@perches.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 21, 2020 at 07:36:07PM -0700, Joe Perches wrote:
> Use a more generic form for __section that requires quotes to avoid
> complications with clang and gcc differences.
> 
> Remove the quote operator # from compiler_attributes.h __section macro.
> 
> Convert all unquoted __section(foo) uses to quoted __section("foo").
> Also convert __attribute__((section("foo"))) uses to __section("foo")
> even if the __attribute__ has multiple list entry forms.
> 
> Conversion done using a script:
> 
> Link: https://lore.kernel.org/lkml/75393e5ddc272dc7403de74d645e6c6e0f4e70eb.camel@perches.com/2-convert_section.pl
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@gooogle.com>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

s390 (all builds):

Error log:
error: section .boot.preserved.data differs between vmlinux and arch/s390/boot/compressed/vmlinux
make[2]: *** [arch/s390/boot/section_cmp.boot.preserved.data] Error 1
make[2]: *** Waiting for unfinished jobs....
error: section .boot.data differs between vmlinux and arch/s390/boot/compressed/vmlinux
make[2]: *** [arch/s390/boot/section_cmp.boot.data] Error 1
make[1]: *** [bzImage] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [__sub-make] Error 2

Reverting this patch fixes the problem.

Guenter
