Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 658BB71716A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 01:14:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QW7XD44rZz3f4W
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 09:14:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BLVFh3yv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BLVFh3yv;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QW7WM14j0z3bkm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 09:14:04 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b01d3bb571so28143895ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 16:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685488443; x=1688080443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=43Cq77dQ/zrfTfrqcrXS896rxBWu+H66vhJzdZh3Sqc=;
        b=BLVFh3yvPyicLXpSoYexp1GKEKWOlDKQDZ4xh5mvvsx3cq9vBGHAHLxRBi71hqUwjn
         A2KdWY6tZrilu91mEhn7hvbzT9QzAtMsj4cd39VddEtYVYOGZuE5w7DoIt0IgLMM5u6X
         UArp59DRz5yvC8N7UTyMCyq4XD+P47b6+A6Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685488443; x=1688080443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43Cq77dQ/zrfTfrqcrXS896rxBWu+H66vhJzdZh3Sqc=;
        b=czC+sBItTN4Bg42wgaAvT5tR262Vt/EgXx4MH7f3kiYxIrdEHVwEn9DT4OclKHx4F7
         Ifu+gqQqJolPUy9zjcnvNT8T98yL0tysvoEX49IuCrejCm4Urtinve+i+ZJNT5G9pfvz
         vf4c5oNl/afPMwvzV30mLwYB2A8509XtVezTFcA1E2t0z3ehWApsEvPRPUv2C57GBnl1
         WYKwe05PJuLyEAUF8fRE1zq1ZxQBs7LF8j19QkukuTNE0dxKY1t7c3Ssykbl6JKsxL6l
         WD0DcBLGSGgi2OQ6iq4jofrBuEqasbrtFHv4YFx1kjklU7fJ+s8yvhm5qRvOsPU8z4Uy
         Pfqg==
X-Gm-Message-State: AC+VfDzjW/u22VcLJRxnFdhQudtOnPvZeMO+u5l0v1K1AzXJRjBre94r
	HQo/32dnJ+dS1pQNlOHALw4dJQ==
X-Google-Smtp-Source: ACHHUZ65FWUItcUf79HFJFx/RNnYWxTpv8uDabV3FhL81dPYe9ilgTGRoNtG+QxQx+Q9YoS1u+jcwg==
X-Received: by 2002:a17:902:dac2:b0:1ac:859a:5b5a with SMTP id q2-20020a170902dac200b001ac859a5b5amr4166825plx.0.1685488442697;
        Tue, 30 May 2023 16:14:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001a9bfd4c5dfsm10739003pll.147.2023.05.30.16.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 16:14:02 -0700 (PDT)
Date: Tue, 30 May 2023 16:14:01 -0700
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH 1/1] arch:hexagon/powerpc: use KSYM_NAME_LEN in array size
Message-ID: <202305301611.34F0A680A2@keescook>
References: <20230529052821.58175-1-maninder1.s@samsung.com>
 <CGME20230529052832epcas5p4fa1b8cf25d9810d32bd2ccf012086fb3@epcms5p1>
 <CANiq72ncDr68qeahrHuQ63dj1Va3=Us6ZSjGRkr6Zp8j+=yH_Q@mail.gmail.com>
 <20230529105707epcms5p1418eac680ebe1736196706b0db80dd39@epcms5p1>
 <CANiq72n_eso7_pgna8ukmEnuCQPsKYPr0NU-Ss9Nwv0VzX=etg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72n_eso7_pgna8ukmEnuCQPsKYPr0NU-Ss9Nwv0VzX=etg@mail.gmail.com>
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
Cc: "nathanl@linux.ibm.com" <nathanl@linux.ibm.com>, "bcain@quicinc.com" <bcain@quicinc.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>, "pmladek@suse.com" <pmladek@suse.com>, "ustavoars@kernel.org" <ustavoars@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "ojeda@kernel.org" <ojeda@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, maninder1.s@samsung.com, Onkarnath <onkarnath.1@samsung.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 29, 2023 at 04:50:45PM +0200, Miguel Ojeda wrote:
> Kees: what is the current stance on `[static N]` parameters? Something like:
> 
>     const char *kallsyms_lookup(unsigned long addr,
>                                 unsigned long *symbolsize,
>                                 unsigned long *offset,
>     -                           char **modname, char *namebuf);
>     +                           char **modname, char namebuf[static KSYM_NAME_LEN]);
> 
> makes the compiler complain about cases like these (even if trivial):
> 
>     arch/powerpc/xmon/xmon.c:1711:10: error: array argument is too small;
>         contains 128 elements, callee requires at least 512
> [-Werror,-Warray-bounds]
>             name = kallsyms_lookup(pc, &size, &offset, NULL, tmpstr);
>                  ^                                           ~~~~~~
>     ./include/linux/kallsyms.h:86:29: note: callee declares array
> parameter as static here
>             char **modname, char namebuf[static KSYM_NAME_LEN]);
>                                  ^      ~~~~~~~~~~~~~~~~~~~~~~

Wouldn't that be a good thing? (I.e. complain about the size mismatch?)

> But I only see 2 files in the kernel using `[static N]` (from 2020 and
> 2021). Should something else be used instead (e.g. `__counted_by`),
> even if constexpr-sized?.

Yeah, it seems pretty uncommon. I'd say traditionally arrays aren't
based too often, rather structs containing them.

But ultimately, yeah, everything could gain __counted_by and friends in
the future.

-- 
Kees Cook
