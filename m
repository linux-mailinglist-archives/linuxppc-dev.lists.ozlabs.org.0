Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F44120BBFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:56:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49trLx2HPdzDr7H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:56:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=VIGOIHNE; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49trGM0ddCzDqCB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:52:42 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id g67so4618523pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q757IDXyRukGvX5SZOHlJdoHJ/1n6S14vTGyo4zvXBQ=;
 b=VIGOIHNEEU9j/QBCfkBjGdBcqAkDVMSPH2V6E9pYYKa7w0oI1NtGdugkcB6s2J7djs
 DSZ85QWa+gMBeGdBreMiRKvPJcdHicHe0ZZZe3JPNlhdZodj/p1tvl8Xip3Cc2IPrr+s
 lsiie+VLCThaSSaloZS5eYhO67RiKTuNXrYns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q757IDXyRukGvX5SZOHlJdoHJ/1n6S14vTGyo4zvXBQ=;
 b=kYFyF1zWMCaIrLm/4rsBQn+HIHXDA2wWfvNhb/4eygi1m6AqJYQkDoHDd4TXLybokF
 /NLdUVV/PSwGTLjO8EDx7WZ0H/JL6AcVcLwOaKKuVGRj84ZTnEPfVCLevpH6LGK0WSi+
 64ldv/fQzjVYsecfyNU+ZZplkFtD+QsJ6GZqdYqU6fz9SZ+UAW/NZsIn+3dOSClFQRKv
 8QvaeHLJwLyxs85uZn9YBjhtd+d850N7eTzKZEXk0VyaJGU67fPNPb6jFCkYJLNwyFJe
 rEsqQbJpbJgmt8mWa/XtGB+Zb1vCmNXY54129/JuvCr6emvR3j/yJvlUBmML4Rb7wtZd
 GuqQ==
X-Gm-Message-State: AOAM533BJBK+8lKDRMs74ErWngef7x9HjMnlzx8SXEtUL10x0qEK4jCx
 sLS9eu2/o1h1zbl92DGZXWtlHA==
X-Google-Smtp-Source: ABdhPJxjew6vuVd8xK7z4Or0D8mu7tCMflIKF0q/SKBZ2je3Uo1yszhe7quUG/VVVAWRTDES/M5wNg==
X-Received: by 2002:a62:ea0b:: with SMTP id t11mr4824646pfh.276.1593208359728; 
 Fri, 26 Jun 2020 14:52:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o16sm23597011pgg.57.2020.06.26.14.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 14:52:38 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:52:37 -0700
From: Kees Cook <keescook@chromium.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 00/12] kunit: create a centralized executor to
 dispatch all KUnit tests
Message-ID: <202006261442.5C245709@keescook>
References: <20200626210917.358969-1-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626210917.358969-1-brendanhiggins@google.com>
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
Cc: linux-doc@vger.kernel.org, catalin.marinas@arm.com, jcmvbkbc@gmail.com,
 will@kernel.org, paulus@samba.org, linux-kselftest@vger.kernel.org,
 frowand.list@gmail.com, anton.ivanov@cambridgegreys.com,
 linux-arch@vger.kernel.org, richard@nod.at, rppt@linux.ibm.com,
 yzaikin@google.com, linux-xtensa@linux-xtensa.org, arnd@arndb.de,
 jdike@addtoit.com, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 davidgow@google.com, skhan@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com,
 chris@zankel.net, monstr@monstr.eu, sboyd@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 alan.maguire@oracle.com, akpm@linux-foundation.org, logang@deltatee.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 26, 2020 at 02:09:05PM -0700, Brendan Higgins wrote:
> This patchset adds a centralized executor to dispatch tests rather than
> relying on late_initcall to schedule each test suite separately along
> with a couple of new features that depend on it.

So, the new section looks fine to me (modulo the INIT_DATA change). The
plumbing to start the tests, though, I think is redundant. Why not just
add a sysctl that starts all known tests?

That way you don't need the plumbing into init/main.c, and you can have
a mode where builtin tests can be started on a fully booted system too.

i.e. boot with "sysctl.kernel.kunit=start" or when fully booted with
"echo start > /proc/sys/kernel/kunit"

And instead of the kunit-specific halt/reboot stuff, how about moving
/proc/sysrq-trigger into /proc/sys instead? Then you (or anything) could
do:

sysctl.kernel.kunit=start sysctl.kernel.sysrq-trigger=b

-- 
Kees Cook
