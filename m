Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3F92708BA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 00:04:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtSYJ6WrKzDqf5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 08:04:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=F3F4STQx; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtST06KmjzDq9B
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 08:00:52 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id o20so4285334pfp.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 15:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JxUdFoGAxFplTWGtoXNZgS71eI4uX7HGfO5ucGAc8lo=;
 b=F3F4STQx9TEbezd5dpqkh+1WgHncbTN/t8oI9gLXFGTIZBF4umVMyWZs6/5SC4DPNe
 BdEswkxGJNvw8UKNxsjmhcgGCOWOfL+FnYmzid7dcH3dg8ENtuW1e1zau+x+4ZWOfwET
 oYzijV7/xANP6xFwAgQjhsqbAUPQauG787ODk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JxUdFoGAxFplTWGtoXNZgS71eI4uX7HGfO5ucGAc8lo=;
 b=Tj9qFmAflmsbbmaQcGBAjOEZi/1MfeaIoOeE21T1jLwUfE2VuuK56cLvyvEV7CIg1P
 zQK05NjOFBRyPjBpDA2bryEZtOIqrcL0Bd0xBf7lHHDtMvcQOsbfW/EVBRHlxoF7KbX8
 CzmKw/FK1edpu7yIjRLYlSmDs2Ujr31WDYN9Qw/P3BuEjxx9ygFQDi3b7fot8pN7QgkG
 7mVHQI94ioYIGj0qkYsCwDBA+yrayi0ZzoG2N+NqdoluPlKcUDUumH3hdqTBY0g9cGwq
 15raswNTILIEO8mfqBMuChrXUxAw5SO7olOdnvkpFMM9HYoKKKPkWK2KY9S2hSEvLnE+
 x36Q==
X-Gm-Message-State: AOAM533z/MBSbFuhFhlr04KjBn/nsDDAf62V+Pfs3nWMiC/AEHuzpX+J
 8jNyHQEUKKOA3u5JVXQomDIYkA==
X-Google-Smtp-Source: ABdhPJw0uH7wi+N0H7/B8Z1EuUZoi1IOCarbau2BnWaa5f2mRZZbuRvvXpA7+ce1jDkK2XKWqANrBA==
X-Received: by 2002:a63:5b5c:: with SMTP id l28mr1381997pgm.243.1600466449680; 
 Fri, 18 Sep 2020 15:00:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id v204sm4236125pfc.10.2020.09.18.15.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 15:00:48 -0700 (PDT)
Date: Fri, 18 Sep 2020 15:00:48 -0700
From: Kees Cook <keescook@chromium.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH 14/15] selftests/clone3: Avoid OS-defined clone_args
Message-ID: <202009181500.9A560349@keescook>
References: <20200912110820.597135-1-keescook@chromium.org>
 <20200912110820.597135-15-keescook@chromium.org>
 <20200915162528.x7admy45pdqsoke4@wittgenstein>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200915162528.x7admy45pdqsoke4@wittgenstein>
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

On Tue, Sep 15, 2020 at 06:25:28PM +0200, Christian Brauner wrote:
> On Sat, Sep 12, 2020 at 04:08:19AM -0700, Kees Cook wrote:
> > As the UAPI headers start to appear in distros, we need to avoid
> > outdated versions of struct clone_args to be able to test modern
> > features. Additionally pull in the syscall numbers correctly.
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> 
> Hm, with this patch applied I'm getting:
> 
> gcc -g -I../../../../usr/include/    clone3_set_tid.c /home/brauner/src/git/linux/linux/tools/testing/selftests/kselftest_harness.h /home/brauner/src/git/linux/linux/tools/testing/selftests/kselftest.h -lcap -o /home/brauner/src/git/linux/linux/tools/testing/selftests/clone3/clone3_set_tid
> In file included from clone3_set_tid.c:24:
> clone3_selftests.h:37:8: error: redefinition of ‘struct clone_args’
>    37 | struct clone_args {
>       |        ^~~~~~~~~~
> In file included from clone3_set_tid.c:12:
> /usr/include/linux/sched.h:92:8: note: originally defined here
>    92 | struct clone_args {
>       |        ^~~~~~~~~~
> make: *** [../lib.mk:140: /home/brauner/src/git/linux/linux/tools/testing/selftests/clone3/clone3_set_tid] Error 1

Hm, weird.

> One trick to avoid this could be:
> 
> #ifndef CLONE_ARGS_SIZE_VER0
> #define CLONE_ARGS_SIZE_VER0 64 /* sizeof first published struct */
> #endif
> 
> #ifndef CLONE_ARGS_SIZE_VER1
> #define CLONE_ARGS_SIZE_VER1 80 /* sizeof second published struct */
> #endif
> 
> #ifndef CLONE_ARGS_SIZE_VER2
> #define CLONE_ARGS_SIZE_VER2 88 /* sizeof third published struct */
> #endif
> 
> struct __clone_args {
> 	__aligned_u64 flags;
> 	__aligned_u64 pidfd;
> 	__aligned_u64 child_tid;
> 	__aligned_u64 parent_tid;
> 	__aligned_u64 exit_signal;
> 	__aligned_u64 stack;
> 	__aligned_u64 stack_size;
> 	__aligned_u64 tls;
> 	__aligned_u64 set_tid;
> 	__aligned_u64 set_tid_size;
> 	__aligned_u64 cgroup;
> };
> 
> static pid_t sys_clone3(struct __clone_args *args, size_t size)
> {
> 	return syscall(__NR_clone3, args, size);
> }

Yeah, that has fewer down sides. I'll rework it.

-- 
Kees Cook
