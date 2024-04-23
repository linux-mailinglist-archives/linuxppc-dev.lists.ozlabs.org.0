Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 167858AE110
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 11:33:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PB45pmdK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNxkx5267z3dKH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 19:33:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PB45pmdK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNxkB10mcz3cds
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 19:33:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 64BDFCE0B86;
	Tue, 23 Apr 2024 09:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BA1C116B1;
	Tue, 23 Apr 2024 09:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713864782;
	bh=wsUmgqvDZJN/e9reBbhNgk7SNk5EqxeH/8Bjswytoz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PB45pmdKhegAatE9P0YGTf3bfcdjIpWIRseRVrVd7giXt3MxwRmPOFCvDQF9fgABn
	 5Yg13EOS2LKs0QR/YOmSklY6bcJf0dOXqKdrYFcbh0xl1tNX0wb4IAfQLPNmGZ5dgZ
	 zCn9Ea9x2uq8YXF9qNqSVDAjrMefmQdRhqjkSoaoNoyuix+bDrFIEPPql15mOLHiKI
	 5bnWq+wg6S27dCBLdkhzsFem0tLyXLUv94mE9zcm0Ya1rh0dWT0fm8EuCfybohC/eT
	 fdLjmLglb9G7K9xBaiSIb3S9xQJGCUN0kwQyIewz2oAFHXYlpZuVrHpKiQTCI2VJB4
	 ktdozmUhKlxeA==
Date: Tue, 23 Apr 2024 14:55:21 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Benjamin Gray <bgray@linux.ibm.com>
Subject: Re: [PATCH v3 5/5] powerpc/code-patching: Add boot selftest for data
 patching
Message-ID: <yct5zr7cqsfy3skmoazhaaxcjvsfgsuap2ggardurqjtiob3z2@ubsimrmcepcl>
References: <20240325055302.876434-1-bgray@linux.ibm.com>
 <20240325055302.876434-6-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325055302.876434-6-bgray@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 25, 2024 at 04:53:02PM +1100, Benjamin Gray wrote:
> Extend the code patching selftests with some basic coverage of the new
> data patching variants too.
> 
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> 
> ---
> 
> v3: * New in v3
> ---
>  arch/powerpc/lib/test-code-patching.c | 36 +++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/powerpc/lib/test-code-patching.c b/arch/powerpc/lib/test-code-patching.c
> index c44823292f73..e96c48fcd4db 100644
> --- a/arch/powerpc/lib/test-code-patching.c
> +++ b/arch/powerpc/lib/test-code-patching.c
> @@ -347,6 +347,41 @@ static void __init test_prefixed_patching(void)
>  	check(!memcmp(iptr, expected, sizeof(expected)));
>  }
>  
> +static void __init test_data_patching(void)
> +{
> +	void *buf;
> +	u32 *addr32;
> +
> +	buf = vzalloc(PAGE_SIZE);
> +	check(buf);
> +	if (!buf)
> +		return;
> +
> +	addr32 = buf + 128;
> +
> +	addr32[1] = 0xA0A1A2A3;
> +	addr32[2] = 0xB0B1B2B3;
> +
> +	patch_uint(&addr32[1], 0xC0C1C2C3);
> +
> +	check(addr32[0] == 0);
> +	check(addr32[1] == 0xC0C1C2C3);
> +	check(addr32[2] == 0xB0B1B2B3);
> +	check(addr32[3] == 0);
> +
> +	patch_ulong(&addr32[1], 0xD0D1D2D3);
> +
> +	check(addr32[0] == 0);
> +	*(unsigned long *)(&addr32[1]) = 0xD0D1D2D3;

Should that have been a check() instead?

- Naveen

> +
> +	if (!IS_ENABLED(CONFIG_PPC64))
> +		check(addr32[2] == 0xB0B1B2B3);
> +
> +	check(addr32[3] == 0);
> +
> +	vfree(buf);
> +}
> +
>  static int __init test_code_patching(void)
>  {
>  	pr_info("Running code patching self-tests ...\n");
> @@ -356,6 +391,7 @@ static int __init test_code_patching(void)
>  	test_create_function_call();
>  	test_translate_branch();
>  	test_prefixed_patching();
> +	test_data_patching();
>  
>  	return 0;
>  }
> -- 
> 2.44.0
> 
