Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2692179A1C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 22:39:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yBPh6s5PzDqLM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 06:39:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GKAMRd+s"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yBFx3RBlzDqJt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 06:32:53 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id v19so54663923wmj.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 13:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ee1tMJewpz3aSk+3Cf8f90eAN6SRg/eYiUnStRjgYLc=;
 b=GKAMRd+sTnkw9Z5FKHUDESOtOokR4c4LKf+jO5xxjeSjB57EumDZ/CxDxRuPx5o04c
 OOkO4iV+suXKl3yH0dFExABiXBZteawHydX44sNNpKwCoNqPkRrjAcNWaUL1JPwHiXDt
 i9ODh5Q9p+tG2eaVD37/+XAMw/WcEH36Yo9Z+UvpDZ7FUdKsKch/axOhYZPg57pKoeQS
 Hyb4Uzezdex64lvLHXl5cVC0f2v1lfQan8CB1xPFNR6buLIGB/bq7uby93buNGR9leQB
 E7IXah2txsckO3Ju25p+/cJv0doqIxdkhbzw3zM+4CkbAf4HdVfFDABA/5uKlCk03eHY
 uKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ee1tMJewpz3aSk+3Cf8f90eAN6SRg/eYiUnStRjgYLc=;
 b=Lw7FuEWgFj7WdyqsQqfZ+owrs2urerGRi63kDU9Ci2pfjp191QV27apAg2gMSHC8MJ
 AA0pU223EkEJILkbw7wJnEXXvIOqLPJYyYDLkCjC8BRJpMG+Br4LDq41HapqrqtryIC2
 T6vPwODlb/TM94Zr6/0cJ5Ubc4j4RI5CHHLfaR7bESloA0pke+7nUw3Zf7t/CgTE+KjT
 8BBrnPFrapqOIi71vnNtTvGwJP1euWl54x+iqc33RrimZYH3a18oapz4KkbbkxrgmUQM
 qOuKcvhD0bRLDVXgAgwszUXOyHY5w/R/XNT8EXaSRHtcwzVFbSgjT3deC2UG92cgrCeQ
 lHYQ==
X-Gm-Message-State: APjAAAXQVHuorJuKiQhdulIePKBnA+fCIIPLq/Dff3DMO8i/WCLlSxqm
 tuM5+aA0syNWbOTSqVW3gDk=
X-Google-Smtp-Source: APXvYqyo7SE3N8MZySPqPna98P9GkU1XLHH7+P2p4LKXp1/uIewGRNlsiTkEr1RxTwquxX5I1q0klQ==
X-Received: by 2002:a1c:a019:: with SMTP id j25mr100975707wme.95.1564432368772; 
 Mon, 29 Jul 2019 13:32:48 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id t24sm56680198wmj.14.2019.07.29.13.32.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:32:48 -0700 (PDT)
Date: Mon, 29 Jul 2019 13:32:46 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] powerpc: workaround clang codegen bug in dcbz
Message-ID: <20190729203246.GA117371@archlinux-threadripper>
References: <20190729202542.205309-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729202542.205309-1-ndesaulniers@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, kbuild test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2019 at 01:25:41PM -0700, Nick Desaulniers wrote:
> Commit 6c5875843b87 ("powerpc: slightly improve cache helpers") exposed
> what looks like a codegen bug in Clang's handling of `%y` output
> template with `Z` constraint. This is resulting in panics during boot
> for 32b powerpc builds w/ Clang, as reported by our CI.
> 
> Add back the original code that worked behind a preprocessor check for
> __clang__ until we can fix LLVM.
> 
> Further, it seems that clang allnoconfig builds are unhappy with `Z`, as
> reported by 0day bot. This is likely because Clang warns about inline
> asm constraints when the constraint requires inlining to be semantically
> valid.
> 
> Link: https://bugs.llvm.org/show_bug.cgi?id=42762
> Link: https://github.com/ClangBuiltLinux/linux/issues/593
> Link: https://lore.kernel.org/lkml/20190721075846.GA97701@archlinux-threadripper/
> Debugged-by: Nathan Chancellor <natechancellor@gmail.com>
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Alternatively, we could just revert 6c5875843b87. It seems that GCC
> generates the same code for these functions for out of line versions.
> But I'm not sure how the inlined code generated would be affected.

For the record:

https://godbolt.org/z/z57VU7

This seems consistent with what Michael found so I don't think a revert
is entirely unreasonable.

Either way:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
