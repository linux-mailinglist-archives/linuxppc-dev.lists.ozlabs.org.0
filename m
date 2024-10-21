Return-Path: <linuxppc-dev+bounces-2464-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF65E9A717A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 19:56:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXNKs0Kc2z2xqc;
	Tue, 22 Oct 2024 04:56:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729533408;
	cv=none; b=ZkO0JVkSnHlUS7FtN0JJQWUgF6+Zw5BriBiCCvoIsjGWfbpCHqNgfi2SfHTtFTDz3h+DBjQmZtYi0XuuE6mv7G0TBbqa/6WKeRYm9Vmn6rZUSvr9pJaKUBTOI2TGc6LnSdJhSAcvgu+gCyQquC141Fg96wuyxPeNCbU/l0XbNsI9AW/fYgmGdwFSv210CT37XdLHhvCllm7YfRLMapG+xQE7PpesReH6ECKeCOXytcSi8JSMpm8JGsgFBVF3o5ZckElWeuMXYM0XzoY9eT6E4AZhIUcif5JPQIuuF+0ZrrPP/2UNKDNnEY3V7c0FZSPmsUFaQ7RVljhiOoLDywGksw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729533408; c=relaxed/relaxed;
	bh=35DwyUNuxg0gqkdcJJCZqsB1ixcCDL22oUqwrmbOulI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyOvwcld0W9CNisFs+upFImsWTnPPiEqjfq0Mju2uwyJOxe0nKZ/E4qeH0ire6KaBEQOKXRHlo/cgPk67lhglIfteS1hT8Iu7C5crI47Y7N2zARVl9bYCLA9ZufRt3i53rQ2RC4rw9OljKdr3QTNasS4w48P70d8Q8k08VUgit+Hy/zzv4QASSOdLBzZQnkfBasAkVYKOPfXJc6mqXUEOFYeCqCSzon6Jhj5M2vm+xo7Pv+m2bYbY3fBoY0ssgK3QWJmTtTrPw1blgawvxsTiZTyeS2vPxQABoeBICvjCuKR9EeC3ArRW4yNpvUL20243n70TsmX+XB4cUt5XNaCyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sJQY/rj4; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sJQY/rj4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXNKn45Jkz2xjM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 04:56:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C0DCA4375B;
	Mon, 21 Oct 2024 17:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F2FC4CEC7;
	Mon, 21 Oct 2024 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729533402;
	bh=iOp6UPk7kp6624trt50V9GCSl7TCmUx91AXnl52vexs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJQY/rj4pTIO5uEWlo1heoszsTNmf9jrwjFBD0lIbKoaTFxHVpdjurFhvf6qbFqVx
	 3p4d5v2zCCp/LbxdIlTGmC11dWGlMVeXXfBDk8A9Aml+/MAtk2IETKhnM8m6cKxkey
	 BZF/dYUet13hmxhgQOUCWlo2mvzJlbvIRi1nLRTDg+g177wJbtfgI05mwIy3+AOG+C
	 2RdO3YmkeY7RM1WJnyPqFT2fPe/8kLv+1aQd4pfj1zTvRhlxt250RD3qNZbbCGpcse
	 fs5+AtO+kgnLwq3Dm+Zt8UDEsdLr8Tbrkjy5WAyah1cfbA8sbkBGsmyodZGLNuMspU
	 cTEE/rSNQw61A==
Date: Mon, 21 Oct 2024 17:56:40 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org, Hendrik Brueckner <brueckner@linux.ibm.com>
Subject: Re: [PATCH 07/15] s390/crc32: expose CRC32 functions through lib
Message-ID: <20241021175640.GA1370449@google.com>
References: <20241021002935.325878-1-ebiggers@kernel.org>
 <20241021002935.325878-8-ebiggers@kernel.org>
 <20241021104007.6950-E-hca@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021104007.6950-E-hca@linux.ibm.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 21, 2024 at 12:40:07PM +0200, Heiko Carstens wrote:
> What makes sure that all of the code is available automatically if the
> CPU supports the instructions like before? I can see that all CRC32
> related config options support also module build options.
> 
> Before this patch, this module and hence the fast crc32 variants were
> loaded automatically when required CPU features were present.
> Right now I don't how this is happening with this series.

There's just a direct symbol dependency now.  For example
ext4.ko -> crc32-s390.ko [crc32c_le_arch] -> crc32.ko [crc32c_le_base].
So, crc32-$arch.ko always gets loaded when there is a user of one of the CRC32
library functions, provided that it was enabled in the kconfig.

crc32-$arch then calls either the accelerated code or the base code depending on
the CPU features.  On most architectures including s390, I made this use a
static branch, so there is almost no overhead (much less overhead than the
indirect call that was needed before).

This is the same way that some of the crypto library code already works.

> > +static int __init crc32_s390_init(void)
> > +{
> > +	if (cpu_have_feature(S390_CPU_FEATURE_VXRS))
> > +		static_branch_enable(&have_vxrs);
> > +	return 0;
> > +}
> > +arch_initcall(crc32_s390_init);
> 
> I guess this should be changed to:
> 
> module_cpu_feature_match(S390_CPU_FEATURE_VXRS, ...);
> 
> Which would make at least the library functions available if cpu
> features are present. But this looks only like a partial solution of
> the above described problem.
> 
> But maybe I'm missing something.

This is not needed, as per the above.

- Eric

