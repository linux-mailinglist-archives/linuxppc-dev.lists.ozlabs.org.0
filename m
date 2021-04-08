Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB4235838B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 14:45:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGLbJ4GRGz3btv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 22:45:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.a=rsa-sha256 header.s=google header.b=JXlbvdv6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::62b;
 helo=mail-ej1-x62b.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.a=rsa-sha256 header.s=google header.b=JXlbvdv6; 
 dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGLZr1dLjz300J
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 22:45:21 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a25so2854297ejk.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Apr 2021 05:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UMuAklHy/tPt7YPBozpvIQsmWDAIa3a/la6+zoUVcdI=;
 b=JXlbvdv6BKxL2QLt+A6EZMYCjKur7zKVGHA+SPjjhttU3LjU5J8CTsvMPL70CwGYsq
 CUXz1jkKLkBNcttlxCmAirFDD+kjBSkQXhxTFfLF/zDE+suTqi1E02kHIf/SGivtkXXC
 r7MEDlKMlo41vpb3rOrLkq/HnnmBY745AuXsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UMuAklHy/tPt7YPBozpvIQsmWDAIa3a/la6+zoUVcdI=;
 b=rltO2/hwsgKE7ysqd42s2KfyFX3wYehHYKdnRRuGdVIaaKH6eidHd+kvqi7xdARoYt
 kdyP82V1jnWmQ2xkcMR/ndaBCZFBY1Cfp6yXhqVkyMDUoQR9lUgCJYwWGdK9TiilWQSl
 Xn0/1OJvTCeMRRwOhu5u1ssU5d8sJmpCNn3DwZpZIfCRPylfAl+RWcKnI92iGTq2xt8c
 9y0f/n8P4O5sN+pee2TXhd0tdz/n1+FQ1Ko+VGifxyCerrE1JObmA3INxyFy04cJnWxi
 WxeiIQcF1BegF3jb0hNmI4mpbzZjutQz1a5hqxOxiizMF5wedDEk/9NsNrOzopmub4Vy
 7aiA==
X-Gm-Message-State: AOAM531HicYycjXDoriiicBi0T8xTfOD08eISFQeprdXKUlschakiTJq
 Q5FaHU+bYx5KZ0j1sEnPcMyNHQ==
X-Google-Smtp-Source: ABdhPJwq7QZNDA3D6CGhNZXcz6mj8YzK/fNHfbq7NkBvOdUqzkgcZZF3Ehka2wUefbZcZbtsp6oq8w==
X-Received: by 2002:a17:906:1fd7:: with SMTP id
 e23mr400958ejt.528.1617885914623; 
 Thu, 08 Apr 2021 05:45:14 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
 by smtp.gmail.com with ESMTPSA id r4sm14262813ejd.125.2021.04.08.05.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 05:45:14 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] kernel.h: Split out panic and oops helpers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Joerg Roedel <jroedel@suse.de>,
 Wei Liu <wei.liu@kernel.org>, Michael Kelley <mikelley@microsoft.com>,
 Mike Rapoport <rppt@kernel.org>, Corey Minyard <cminyard@mvista.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Vlastimil Babka <vbabka@suse.cz>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-remoteproc@vger.kernel.org, linux-arch@vger.kernel.org,
 kexec@lists.infradead.org, rcu@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <03be4ed9-8e8d-e2c2-611d-ac09c61d84f9@rasmusvillemoes.dk>
Date: Thu, 8 Apr 2021 14:45:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Iurii Zaikin <yzaikin@google.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Arnd Bergmann <arnd@arndb.de>,
 Corey Minyard <minyard@acm.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 x86@kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, Joel Fernandes <joel@joelfernandes.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Eric Biederman <ebiederm@xmission.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/04/2021 15.31, Andy Shevchenko wrote:
> kernel.h is being used as a dump for all kinds of stuff for a long time.
> Here is the attempt to start cleaning it up by splitting out panic and
> oops helpers.

Yay.

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

> At the same time convert users in header and lib folder to use new header.
> Though for time being include new header back to kernel.h to avoid twisted
> indirected includes for existing users.

I think it would be good to have some place to note that "This #include
is just for backwards compatibility, it will go away RealSoonNow, so if
you rely on something from linux/panic.h, include that explicitly
yourself TYVM. And if you're looking for a janitorial task, write a
script to check that every file that uses some identifier defined in
panic.h actually includes that file. When all offenders are found and
dealt with, remove the #include and this note.".

> +
> +struct taint_flag {
> +	char c_true;	/* character printed when tainted */
> +	char c_false;	/* character printed when not tainted */
> +	bool module;	/* also show as a per-module taint flag */
> +};
> +
> +extern const struct taint_flag taint_flags[TAINT_FLAGS_COUNT];

While you're doing this, nothing outside of kernel/panic.c cares about
the definition of struct taint_flag or use the taint_flags array, so
could you make the definition private to that file and make the array
static? (Another patch, of course.)

> +enum lockdep_ok {
> +	LOCKDEP_STILL_OK,
> +	LOCKDEP_NOW_UNRELIABLE,
> +};
> +
> +extern const char *print_tainted(void);
> +extern void add_taint(unsigned flag, enum lockdep_ok);
> +extern int test_taint(unsigned flag);
> +extern unsigned long get_taint(void);

I know you're just moving code, but it would be a nice opportunity to
drop the redundant externs.

Rasmus
