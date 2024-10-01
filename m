Return-Path: <linuxppc-dev+bounces-1710-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F94E98BC13
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 14:29:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHy1P34h9z2yGf;
	Tue,  1 Oct 2024 22:29:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727785768;
	cv=none; b=N2NqTy1RS/OGiX4qVUUrf1kreOlj0f+GF/px24q5HBVOe4Judi7NXLIlRjujCBSCfRkf8uJsgf8IShiFMIP1J+TLWwvtyjeyp5TY0OGrWtTz2q03cgdu4KJ/eNI3JZ4fFArTvD5ngiWxqORJWpg8iwe0VtA+FZawWshi/S35pxd4yKFwTc/eANUdICqT2eGLIIXf+qsX1MReRvax5pspsw8LhmJzROiGz7YporFO+I/EJCeMu9Kik2i4g4y1mZSkTdstFXCV7FicqSRvD3XMPMOTD9n9Zc2Jdc4mzgXz+Iyl2046sRu+aCpGDZhRMgQlu3Qp0jz9o3WI/sXLlSWbjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727785768; c=relaxed/relaxed;
	bh=IOL1yB3GdxoMW1HTyqHgDC/1e+UI3UkC8AeJmj3ulG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDre2IuFFx9SM0Fk0qUCg20EoYPO9xPlcL+6+MrcwPETM5iII3hPZVd7pD+xq5V8EaedtPslC9jXqa0iy6frGV1oyYHZhAf8sAzRHRjwkeyVfaJuwvKoO9iF3gYQKHQqweyvWaOiYpuDXroQC262Gj2M6uVArbCArNhV28i7CGSfNOSj4ezPbbY6057sGtlFDGfhJXFdTuFsUSJljtH1NdQ/qn66wB8Ixi3SNn562IQPfUrwZAVXold8TojWYExVCb4hfJwINVeN08PemYnXuZUehJyaLl/52YyMkmG9hi/TuQHK3LAd1yrpvs58LwsgSRdYoJ5BX3qAUBgL6HVgTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=w5jF6FpU; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=w5jF6FpU;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHy1M6scrz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 22:29:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1727785762;
	bh=IOL1yB3GdxoMW1HTyqHgDC/1e+UI3UkC8AeJmj3ulG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w5jF6FpUeD3Uv/SmBaCCk/0yfLWZrC/7JGscAdQiE0972b/QHeOY+2OyCJO0+xJi5
	 ew2UEKsWUss/rnbSqxDVA7pyW2VkvBiFRXZOXUSOADY/gLy0tZlIQkvZ5ASAA3HS30
	 LksshMlG8Ykge8YPVzPRPbsTMLan783zWSsFyys2gum4x8UFa2jxKbb8tW5GB3gETO
	 ibxrxaE+QZbAFtFx3FDeg98taWQaXCJqAOlBP5ZwCk9mCqJ0pMxO7vNl9wjTAoCpsQ
	 eYZuAxNXvhVEEoFTtWuXVL616rz/hfpFE+UwG5gxI6ekqEfygvh6Xj1wGi74mYhRSs
	 6FEbvaUvVh0wA==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4XHy1G1q3Dz4x4c; Tue,  1 Oct 2024 22:29:22 +1000 (AEST)
Date: Tue, 1 Oct 2024 22:29:18 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Michal Suchanek <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] powerpc/sstep: Unexport analyze_instr,
 emulate_vsx_load, emulate_vsx_store
Message-ID: <ZvvrHpD-v4CuDqsm@cleo.paulus.ozlabs.org>
References: <8ecdbd907a8a92cbf9c7308df13f9d19f5ba5621.1727777273.git.msuchanek@suse.de>
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
In-Reply-To: <8ecdbd907a8a92cbf9c7308df13f9d19f5ba5621.1727777273.git.msuchanek@suse.de>
X-Spam-Status: No, score=-0.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 01, 2024 at 12:08:47PM +0200, Michal Suchanek wrote:
> There is no modular user of analyze_instr, and the latter two are only
> used by sstep itself.

As far as I can see, analyze_instr is still used in
arch/powerpc/kvm/emulate_loadstore.c, and that can be included in a
module, e.g., when CONFIG_KVM_BOOK3S_64 = m.  Or am I missing
something?

Paul.

