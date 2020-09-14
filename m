Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA80C269650
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 22:22:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqyTS69GPzDqQX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 06:22:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=oF8La/id; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqyRF0YMdzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 06:20:39 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d6so519697pfn.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 13:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qEpgx25Jil12k55o2aeOued7nizFpjWJtIRv7RIrrgA=;
 b=oF8La/idpVXp4VfUhwPPRt9IR/o1RPig2nmeyh8YrhsmHCRvroMtluVJ4o5U4K8AFY
 VbIWbH4IFHNJ2TFc1OFb1H1xtGH98TXoNvfhyYpAj/BvKsAp8ayWj8ANKhK3ots4YK+n
 3o6kijVtSkUUK+lTSVOjqNR35ksbqN8yyS7c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qEpgx25Jil12k55o2aeOued7nizFpjWJtIRv7RIrrgA=;
 b=sKkoH89lSTFq5SjMEy2bQcpXRRemFFPmZcuUotky5t9PM+4Z7e8nzHsvwbjyctav3o
 FWLpYoQAu7pOHaihwXe6qxMf3KP8eIGKFPYgieJ2ACIpmGLCtWVwAo8LucIh10lpnC67
 JZdRheMCiWdsuEd6YUPfqFv6YnocV3Ngd3P+R2Q7OvFy9ZfcxGD3gudE54bFtB9+Rcfk
 1RaMGvKhgN0siX3dd/13nVfzPAKt5Xh9uF6i6k8PWAXmtZDoS+WUGKJiotQSZ5RY/aGv
 okJwXldj48gvlhSsuawwGMd2Gnb4hCUoKmpGwaqjZzpc9Okav7GGQzeJUnzpYJ0YQtxz
 rN+g==
X-Gm-Message-State: AOAM532ZT477+YWwvzA/P9EiCTEZqkW5qiCMA2d47ag5t4ukIiga6gzO
 w8NZ05z3pPiSXiT3Z87GocxqEg==
X-Google-Smtp-Source: ABdhPJwzC+6nA3eNHS7MaPMnpM3EiFR22Z/iXFg5GeiL+THEWa6N+D4e+5+NMXy6erXWVC35l1hZ8Q==
X-Received: by 2002:a63:471b:: with SMTP id u27mr12121165pga.139.1600114835739; 
 Mon, 14 Sep 2020 13:20:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u6sm10068865pjy.37.2020.09.14.13.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 13:20:34 -0700 (PDT)
Date: Mon, 14 Sep 2020 13:20:34 -0700
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 13/15] selftests/seccomp: powerpc: Set syscall return
 during ptrace syscall exit
Message-ID: <202009141319.FC017B0DB@keescook>
References: <20200912110820.597135-1-keescook@chromium.org>
 <20200912110820.597135-14-keescook@chromium.org>
 <87zh5sq59a.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zh5sq59a.fsf@mpe.ellerman.id.au>
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Will Drewry <wad@chromium.org>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 14, 2020 at 03:47:13PM +1000, Michael Ellerman wrote:
> Kees Cook <keescook@chromium.org> writes:
> > Some archs (like ppc) only support changing the return code during
> > syscall exit when ptrace is used. As the syscall number might not
> > be available anymore during syscall exit, it needs to be saved
> > during syscall enter. Adjust the ptrace tests to do this.
> 
> I'm not that across all the fixture stuff, but if I'm reading it right
> you're now calling change_syscall() on both entry and exit for all
> arches.

Correct.

> That should work, but it no longer tests changing the return code on
> entry on the arches that support it, which seems like a backward step?

That's a good point. I wouldn't be in a position to notice a regression
for the other architectures. I will refactor this one...

-- 
Kees Cook
