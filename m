Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F03DD0BC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 08:43:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdT3Y0240z3bn2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 16:43:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lxYQjRPo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c;
 helo=mail-wm1-x32c.google.com; envelope-from=adobriyan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lxYQjRPo; dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdT332lhlz2yxL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 16:42:54 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso3279189wmq.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Aug 2021 23:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BLpYFCEhMxHCYOJofpDOBnsrLOpomdik6GbpkfmrbEo=;
 b=lxYQjRPo7UXjm1H9eY2abYSOBagbxy3grS+nrpt94yVfDuQQDLFjSmpCYReTly+NMm
 Fb6o6xPlrEvvPdY8iATiegFaJBfJZcLKN7qmg41+a3vxxiKSeci7BsXBn9ENnmruEGlq
 3zuZW8DQwMUpuVkUruZBRpZSZqEM315zhCaBaLmzhoFJ1kHytRaJSbTwRaQRr8hpPXxY
 +lGpN3+bZA6IDCwCs4eiFX/kT9Vwtc1kxR1HgqqYtjjrSTUQejSXSasuw5Xs9eHBNwYf
 6p/J4vr35PGVCXSyjTmyr4Sk494k8jwZpGauPdepm+RZ5xQdV1raeOuly+kut0V0IRAS
 xGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BLpYFCEhMxHCYOJofpDOBnsrLOpomdik6GbpkfmrbEo=;
 b=re0gNdpH1S1CJgVqhHx7QQ79D6xx9gaEvGTGTUdSnBF1sxhA/q6e3mgurI6OkMV4Sl
 g9Nufa3yc5F2QqItrGP84Gn7OxKZ+q+KBD19ePUn9/hjvnf6/TzBNLne3YTlfieKwyON
 +s0bDwNwA2j6ziY2ywi7/PhYFQFleomykTjwBciwDLbfXdah7SPQUyeoT2ECthckVVSa
 Mg7pUBIt1FNMava7fWUsddwz3BRHUFcZENoZC1gT+JvGjvcn6hl0GllIsNYQ0W/B5obF
 p6vyAa/dAla7fDNJOcOW0KfASopWUYI4AJfaTOkS2zKt22jViXyiOhqe+NHqO3XKU5pC
 hiTQ==
X-Gm-Message-State: AOAM531EOcHLXtVVayylpkdLSRXgUMF8xOEEHoOACgP+uoiIEbZGHn3S
 fZ7ghbaqrq+11jAMbrwkLg==
X-Google-Smtp-Source: ABdhPJxo16iUjyVIeQ9xmvVvuQlDGuzxRLyLiI++9qUbTiA6r1gF/Vs2kZ1oNCsICDMajf7DIB0MlQ==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr10525990wml.84.1627886568347; 
 Sun, 01 Aug 2021 23:42:48 -0700 (PDT)
Received: from localhost.localdomain ([46.53.248.142])
 by smtp.gmail.com with ESMTPSA id k186sm11178355wme.45.2021.08.01.23.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 23:42:47 -0700 (PDT)
Date: Mon, 2 Aug 2021 09:42:45 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 3/3] isystem: delete global -isystem compile option
Message-ID: <YQeT5QRXc3CzK9nL@localhost.localdomain>
References: <20210801201336.2224111-1-adobriyan@gmail.com>
 <20210801201336.2224111-3-adobriyan@gmail.com>
 <20210801213247.GM1583@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210801213247.GM1583@gate.crashing.org>
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, masahiroy@kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 01, 2021 at 04:32:47PM -0500, Segher Boessenkool wrote:
> On Sun, Aug 01, 2021 at 11:13:36PM +0300, Alexey Dobriyan wrote:
> > In theory, it enables "leakage" of userspace headers into kernel which
> > may present licensing problem.
> 
> > -NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
> > +NOSTDINC_FLAGS += -nostdinc
> 
> This is removing the compiler's own include files.  These are required
> for all kinds of basic features, and required to be compliant to the C
> standard at all.

No they are not required. Kernel uses its own bool, uintptr_t and
static_assert, memset(), CHAR_BIT. noreturn, alignas newest C standard
are next.

This version changelog didn't mention but kernel would use
-ffreestanding too if not other problems with the flag.

> These are not "userspace headers", that is what
> -nostdinc takes care of already.

They are userspace headers in the sense they are external to the project
just like userspace programs are external to the kernel.

> In the case of GCC all these headers are GPL-with-runtime-exception, so
> claiming this can cause licensing problems is fearmongering.

I agree licensing problem doesn't really exist.
It would take gcc drop-in replacement with authors insane enough to not
license standard headers properly.

> I strongly advise against doing this.

Kernel chose to be self-contained. -isystem removal makes sense then.
It will be used for intrinsics where necessary.
