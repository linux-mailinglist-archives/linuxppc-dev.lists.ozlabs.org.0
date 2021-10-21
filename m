Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A065A436753
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 18:10:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZsrt0SmWz3cCJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 03:10:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aYS4Hl3T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=aYS4Hl3T; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZsrC3b6Xz2xtc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 03:09:46 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id m14so1052911pfc.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 09:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9F/2GwBSv+wmck4DeHeGUmQJiNkhxnagoawd2JRdH8I=;
 b=aYS4Hl3TAQ6+l8a1NwGwRJW1wfXBykLV8Ng2Ki4cDwOzEV2Bq494FF2RnGdoqzmZru
 h2CA0xmwYI0j1RnrpSzOjCuwxghZRlujRdtN5MJu5Q9ompbrEvzpNz2/MLcIa3J/XVHT
 6ENhFUr4+Cm8aLnVavjthSt3hxefaRSnx2rFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9F/2GwBSv+wmck4DeHeGUmQJiNkhxnagoawd2JRdH8I=;
 b=Jl6Ub2nLDXY4XAsiWd8qcKtrIR80EBgIWZqT3Z1fGAO3ATUVPrxIdRnRVXNxSn18oz
 kDe/WnCrOhZqmgAM9/D153NfTuwy6T2UR9ddEO21K5rSG6coSKO9W8t1B/2v6yfLc/ZD
 mYslKfF/xep0nvnfFQ4koHQ9nQr1tp7IjNaE2frKsrF+FEeVlHRszXD8kf6QzfhY/OEv
 Xu5Ucbla+cEponLSPWk8JYrA1AYXYr3leedXMHF0dK+rmHFdjOPqpMMw8YxXIRvyNOuh
 olS/dNxxFrqFPgnE+3UtR4fLqjYs3KL3Cv6wsFC5tC+9ohPOyo9AU4D5p5oxZMVbfA1A
 Dh+A==
X-Gm-Message-State: AOAM5316raRRs6amIbD9/1ac/h67C8tjdXfxL6dwsGcx0P8xKFZRrZwX
 EQ94tWrGjOYlrCKP20f9WBwoMw==
X-Google-Smtp-Source: ABdhPJxzbAc2D1JMb8+9E7mH1eq28U/EyWOkUl6R9VQiQguRGvwbTILm2E62IEg+CGS2JEIWYVT7XQ==
X-Received: by 2002:a05:6a00:140e:b0:444:b077:51ef with SMTP id
 l14-20020a056a00140e00b00444b07751efmr6469571pfu.61.1634832583972; 
 Thu, 21 Oct 2021 09:09:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x20sm6226101pjp.48.2021.10.21.09.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:09:43 -0700 (PDT)
Date: Thu, 21 Oct 2021 09:09:42 -0700
From: Kees Cook <keescook@chromium.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH 07/20] signal/powerpc: On swapcontext failure force SIGSEGV
Message-ID: <202110210909.895B8A5A58@keescook>
References: <87y26nmwkb.fsf@disp2133>
 <20211020174406.17889-7-ebiederm@xmission.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020174406.17889-7-ebiederm@xmission.com>
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 20, 2021 at 12:43:53PM -0500, Eric W. Biederman wrote:
> If the register state may be partial and corrupted instead of calling
> do_exit, call force_sigsegv(SIGSEGV).  Which properly kills the
> process with SIGSEGV and does not let any more userspace code execute,
> instead of just killing one thread of the process and potentially
> confusing everything.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> History-tree: git://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git
> Fixes: 756f1ae8a44e ("PPC32: Rework signal code and add a swapcontext system call.")
> Fixes: 04879b04bf50 ("[PATCH] ppc64: VMX (Altivec) support & signal32 rework, from Ben Herrenschmidt")
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>

This looks right to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
