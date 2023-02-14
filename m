Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3326963DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 13:48:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGLbY6x6kz3cKv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 23:48:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XNPocGj7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XNPocGj7;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGLZf18GCz3cFt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 23:47:21 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so20257353pjq.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 04:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=//PUD5f7GplM89519c0hmn3dKQI620mHmk1UnlP9FPs=;
        b=XNPocGj7eiVthaKGOlegbMgkhofmsHsGcNdlNwjpQdYwAny3M5QEpXJe0VmLiF6xxr
         /rXwTQZkegRR11PvKJL3YEULFvw+FtKn3U4QtH9lGtG50xveeknTG2ZbxXqm3p4icUWo
         Tb3ApuzTX+rBRTCJTUIlAuPNNjlLQhkwLwiExWPwX4E9QX0822kRSzwimJPPUCS+oUrK
         hHgE7W0ChecHAsJYcyX/wAY4y+F5w8me7BbUw8tIDJqjj83BeWfp48J5HOLzoUL2RRjI
         WkgLqIqDw7b2/ZDO9q+xBrbmrUY7gZZ90kwKcRSdbgbIUYy2olrnv8r7g1Tg0mVTRlqB
         JBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//PUD5f7GplM89519c0hmn3dKQI620mHmk1UnlP9FPs=;
        b=OcyAqXzFGVoEPEjK5D3Dfd88sge+eE25p6fqFou5lz35Aze6gzI392s3btEdOdlgE/
         pVamAkx0j4alanhHtNl7JliCH6qlqYkN6rznYrywvncJeB1qNccYTSfNx/x6fZhr8dVr
         77OO4V+jW2fzx+x7TZw74XtxiWmCFliqHyQEF9WMaCocUfV/kCgvgwqR5wHkZKaiUtXv
         45lBS/qyTE5ZhKv2/Z3Vv8OoV8wc6vt8uKt8rXOSrSD+aHhX1BwwdDUTJfNLwMRy6usD
         WOTlgO7v3WWHdSvehp1smZpV3E79CE2rpoPpGR0aVDuC1FayL+TKElLSXy9PdQh9o9wI
         IAZw==
X-Gm-Message-State: AO0yUKWbjyZgHVMsVMc48KPEj6AZqr2Pz43Cg7t62u0ChrXnasWF38+C
	rWvQcSEFo10ELhPwH1RB7e2Ws/qTvGmEg7CNFG4=
X-Google-Smtp-Source: AK7set+2pnH1CKd+RN83wqleMusbpFy3FlkYCo/TdXhpVa1RoyC5/XuwIYKjr9SCKABLrHl8FZUY+III+SgNUgOF72M=
X-Received: by 2002:a17:90a:ac18:b0:233:c5e8:7213 with SMTP id
 o24-20020a17090aac1800b00233c5e87213mr2422754pjq.93.1676378838445; Tue, 14
 Feb 2023 04:47:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1676358308.git.jpoimboe@kernel.org> <ad801544cab7c26a0f3bbf7cfefb67303f4cd866.1676358308.git.jpoimboe@kernel.org>
In-Reply-To: <ad801544cab7c26a0f3bbf7cfefb67303f4cd866.1676358308.git.jpoimboe@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Feb 2023 04:47:06 -0800
Message-ID: <CAMo8BfJsxu0Q1a0KOq2giBCESZE-Y10nqTOT43XQje0FtM7ixQ@mail.gmail.com>
Subject: Re: [PATCH v2 20/24] xtensa/cpu: Mark cpu_die() __noreturn
To: Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 13, 2023 at 11:07 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> cpu_die() doesn't return.  Annotate it as such.  By extension this also
> makes arch_cpu_idle_dead() noreturn.
>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/xtensa/include/asm/smp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
