Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 535555EF02C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 10:18:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdR7s1J3gz3c8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 18:18:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oYzJRQvS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oYzJRQvS;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdR7C64h9z3bdy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 18:17:41 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so651444pjh.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 01:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=uxKV0hmuNi7HP7JM+JV05JaLDwv4wJC8kpd8+KQjoIY=;
        b=oYzJRQvSo6u9Xs9THmztzkJaD4vqr4SD+N0djnhvGyVnbVBjIRn9/CHoxFeB8+JEe9
         QojU3w38taF6uFYOhKp4S7Dc8dJJVTY5i55eYdjq6kZakBLqQYwWSyjxEkEX8MRKBucH
         hv7uQO+rZX07SLqzJoDQcwUBYtZn141ptiFt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=uxKV0hmuNi7HP7JM+JV05JaLDwv4wJC8kpd8+KQjoIY=;
        b=NLx4WGwKw3LblVbDgnNYJuRRlm26CUNEV4snEOzV548iDvW8EB0KYork1zJwhfyQnp
         kkWZwUJs1l9Hcizawl+emOf3gJ78NnO4UZyR51kUgbth6+n8BG0a+lHo73AkbVUztegy
         K90icNk+N8PWJmZQzOUF18FfftduM3CGDLBIXM+wZGe6p6oPbzLbIY2iAbLwh1qrdvfs
         RiNZDnmHNJP1JAN9qj91iVaID3PCHVWhbqlDkBghNdwuvWW41Ro4bex7jFxuOVkazFOa
         8xWZ2FxApLSfe4qISnDFA+8GP9ozv5b6qjql4Q0M8ryp8+yqlUEoueJ+cm/wD6iRfugt
         v/FA==
X-Gm-Message-State: ACrzQf1HZyO0iu7ieuuf2wStxl5e3Uhvfbvtwd7HzpMMxEfGtzP37pOH
	ZiNSach+PajLzUJayxdu9MAy2Q==
X-Google-Smtp-Source: AMsMyM5yoAwH1Lbl8y4hHePaW6bZtsQ/MSFrp6Jcy1LA9hrzzFyz5A7Q7Y+noemhCpHrqWSfzhCrNw==
X-Received: by 2002:a17:90b:3144:b0:202:e2cd:2d2a with SMTP id ip4-20020a17090b314400b00202e2cd2d2amr2381272pjb.39.1664439458453;
        Thu, 29 Sep 2022 01:17:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y16-20020a17090322d000b0016d8d277c02sm5330020plg.25.2022.09.29.01.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 01:17:37 -0700 (PDT)
Date: Thu, 29 Sep 2022 01:17:37 -0700
From: Kees Cook <keescook@chromium.org>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [powerpc] Build failure include/linux/compiler_types.h
 __alloc_size__ (next-20220928)
Message-ID: <202209290116.AF9A13DF@keescook>
References: <E3F43AE3-E1AA-4992-9308-C0E790478445@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E3F43AE3-E1AA-4992-9308-C0E790478445@linux.ibm.com>
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 29, 2022 at 11:49:28AM +0530, Sachin Sant wrote:
> Linux-next  6.0.0-rc7-next-20220928 fails to build on powerpc with
> following error:
> 
> make -j 17 -s && make modules_install && make install
> In file included from <command-line>:
> ./include/linux/percpu.h: In function '__alloc_reserved_percpu':
> ././include/linux/compiler_types.h:279:30: error: expected declaration specifiers before '__alloc_size__'
>  #define __alloc_size(x, ...) __alloc_size__(x, ## __VA_ARGS__) __malloc
>                               ^~~~~~~~~~~~~~

Apologies for the breakage! This should be fixed by:

https://lore.kernel.org/lkml/20220929081642.1932200-1-keescook@chromium.org

-- 
Kees Cook
