Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 046A05BDA71
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 04:50:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWmHJ6byFz3c3J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 12:50:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lnIljFKp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=senozhatsky@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lnIljFKp;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWmGg0LMcz2ypD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 12:49:28 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id o70-20020a17090a0a4c00b00202f898fa86so1095124pjo.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 19:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=rI0IpfDVb05suW6mssP/QFC86Iigix9NLenW3JQ6Phs=;
        b=lnIljFKp1ED3j5wPYTN7mdVUfk7FiKkjAkcUsYSYUMCZpdQ5U8vkDdIo4K0hiw1RH3
         +GFslTzjK43l0+rnV0YItKzr73eqf7dBzWl3BzQNkwS39xy9TTbRZE0df01R7//5oEJr
         gCiIxE6Vh5vvSGpkucOrRiDvI3G32scMCweV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=rI0IpfDVb05suW6mssP/QFC86Iigix9NLenW3JQ6Phs=;
        b=x6krF5hGBCpCQ2tRLNHFMlrZOJaX0aLZQpMEboHJnZw2mR4HS1grq+nAFkgs3PeaG6
         y6bekcjhlqTJK6M/T/hlGfG4iT2XOkbTOdd2b5eT+kUUnhw4+VsFRAC000S68V3TpRE6
         vy0+ABm5S+lIZw3KxmONuHl4Fv+hGjhb6XDJwaB3bDYy3ic6Jvjy3ie1kqQEzO4famNE
         fA0zRC9KYQPdvsRMcchhVjItNYRSpjO4HKolQMnr3xlyj7H2AkrWveSK9L+L1ZSSKHmg
         8j9YH1jMMjiQkVEHyF01I3lS5y/YngQBh2EgFVnW66l0jUXbpEUstNUfHyVC/5kWreI5
         KFzQ==
X-Gm-Message-State: ACrzQf2HTfg/WZ9rqa7th80W1+7sd1QIB74g8u7/5JMjNwsmkOcN0k4o
	0+8iq6NcVXvOhVkF7Z8uc0wQRw==
X-Google-Smtp-Source: AMsMyM7S+Aze7xjQjfeMxV1IycjxiN9uStAZCOz26LYAWGHUeF519ICUTt9w2zkpb7un7hJ/v+di5Q==
X-Received: by 2002:a17:902:8e84:b0:178:57e4:805b with SMTP id bg4-20020a1709028e8400b0017857e4805bmr2741327plb.144.1663642166279;
        Mon, 19 Sep 2022 19:49:26 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:5744:3726:1f8b:92ad])
        by smtp.gmail.com with ESMTPSA id j6-20020a170903024600b00178a9b193cfsm119779plh.140.2022.09.19.19.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 19:49:25 -0700 (PDT)
Date: Tue, 20 Sep 2022 11:49:14 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 25/44] printk: Remove trace_.*_rcuidle() usage
Message-ID: <YykqKm5j5q9DEKk7@google.com>
References: <20220919095939.761690562@infradead.org>
 <20220919101522.021681292@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919101522.021681292@infradead.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, kasan-dev@googlegroups.com, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, linux-acpi@vger.kernel.org, mingo@redhat.com, linux-imx@nxp.com, linux-snps-arc@lists.infradead.org, virtualization@lists.linux-foundation.org, pmladek@suse.com, john.ogness@linutronix.de, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org, rostedt@goodmis.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-tegra@vger.kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, linux-alpha@vger.kernel.or
 g, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On (22/09/19 12:00), Peter Zijlstra wrote:
> The problem, per commit fc98c3c8c9dc ("printk: use rcuidle console
> tracepoint"), was printk usage from the cpuidle path where RCU was
> already disabled.
> 
> Per the patches earlier in this series, this is no longer the case.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Acked-by: Petr Mladek <pmladek@suse.com>

Acked-by: Sergey Senozhatsky <senozhatsky@chromium.org>
