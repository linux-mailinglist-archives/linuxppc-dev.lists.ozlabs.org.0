Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A5280D10D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 17:19:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FiucfIPo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Spn4k2H6Wz30Ql
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 03:19:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FiucfIPo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+30fb44a5c54f4ddee986+7414+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Spn3x6DtDz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 03:18:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MPLySSIA+ntdrvXPY6WLPHcSeoOpRBMJKsLFdEaHpkU=; b=FiucfIPo+cO11SUxoMH1rJdvqv
	wfEC5yblDCMXDQY0OixUw0haAM61OP7SSA+pSzbjWuXecVi10RyVfeyqeXMWZTJMJZPMW8UyiE+2t
	g+svd17tDKounF/vNcRa5yoyPjucT8XLCCZHwrXjUSfmzvhY1vpFNOoT7PvEuwde+WUSmxCEc7p0W
	1ul+M4tqKhhUj05i/GCzaLechyYXXE9C2thbHs8lQwUjgWOUkHceRkV3o+/DWL9yx1/GW852FAwWG
	KrNQQTP3w4OIETUwxzlphh61g0cIqWK5xeXd6eOjjmlarE2bnEbyzACmkdhG3zoz3cwFtTRQv51bT
	rmQymT4g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rCizL-005k47-1J;
	Mon, 11 Dec 2023 16:18:35 +0000
Date: Mon, 11 Dec 2023 08:18:35 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH 11/12] selftests/fpu: Move FP code to a separate
 translation unit
Message-ID: <ZXc2W1Rl+S/UWAK3@infradead.org>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-12-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208055501.2916202-12-samuel.holland@sifive.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>  obj-$(CONFIG_TEST_FPU) += test_fpu.o
> -CFLAGS_test_fpu.o += $(FPU_CFLAGS)
> +test_fpu-y := test_fpu_glue.o test_fpu_impl.o
> +CFLAGS_test_fpu_impl.o += $(FPU_CFLAGS)

Btw, I really wonder if having a

modname-fpu += foo.o

syntax in kbuild wouldn't be preferable to this.  Of coure that requires
someone who understands kbuild inside out.

> +int test_fpu(void);

This needs to go into a header.

And I think I underatand your way to enforce the use of a separate
compilation unit in the riscv patch now.

Can we just make that generic, e.g. have a <linux/fpu.h> that wraps
<asm/fpu.h> that does the guard based on a
-D_LINUX_FPU_COMPILATION_UNIT=1 on the command line so that all the
code becomes fully portable?  Any legacy arch specific fpu users not
using <linux/fpu.h> would not be affected by it, although it would be
great to eventually migrate them to the common scheme.

