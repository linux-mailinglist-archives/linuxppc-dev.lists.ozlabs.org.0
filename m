Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D626A5EDECE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 16:30:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MczRg6GXTz3c3G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 00:30:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pzz12vX6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pzz12vX6;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MczR51XKJz3bgh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 00:29:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 37DABB820EA;
	Wed, 28 Sep 2022 14:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BA8C433D6;
	Wed, 28 Sep 2022 14:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664375386;
	bh=NvYYUDLfAjxdA/iwJ1vyrtGlywwQCEeN0x89z9OfnVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzz12vX6lqvg6aQimf5HoW3xH1ofmh74gPNlm8/NiT9z5n+4mbOCRx/IDcwz2YNgv
	 9I5uf3X4Op9k2CONfL2LdGo/nyhfn9npy03DaU0taIbRDIMbOCBaOWfB+JLCCsSRzH
	 t+NXdcXqMfB3+NQJTtoJbkRlu7NJSyo1xC8baTPzEBa2NxwFchVAda4tBmz9ap2Pfx
	 Lo2q2pF6qGKDZ4hbDL6u7e1WYHUhIvLl7oe0yEsJIZm7Vk/YT/X5eRl5jVyoSsf+Eb
	 UZ6OpqKla1K/JqFmpa2jjjz0xDps3CUJ0MYK23LQaR3/AS32+smHQ+n4WZ4EiUoE9O
	 20zjQHbafC+uA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id B3CDC405F0; Wed, 28 Sep 2022 11:29:44 -0300 (-03)
Date: Wed, 28 Sep 2022 11:29:44 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 2/3] tools/perf/tests: Fix branch stack sampling test
 to include sanity check for branch filter
Message-ID: <YzRaWCpWkEMV3HqS@kernel.org>
References: <20220921145255.20972-1-atrajeev@linux.vnet.ibm.com>
 <20220921145255.20972-2-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921145255.20972-2-atrajeev@linux.vnet.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Wed, Sep 21, 2022 at 08:22:54PM +0530, Athira Rajeev escreveu:
> commit b55878c90ab9 ("perf test: Add test for branch stack sampling")
> added test for branch stack sampling. There is a sanity check in the
> beginning to skip the test if the hardware doesn't support branch stack
> sampling.
> 
> Snippet
> <<>>
> skip the test if the hardware doesn't support branch stack sampling
> perf record -b -o- -B true > /dev/null 2>&1 || exit 2
> <<>>
> 
> But the testcase also uses branch sample types: save_type, any. if any
> platform doesn't support the branch filters used in the test, the testcase
> will fail. In powerpc, currently mutliple branch filters are not supported
> and hence this test fails in powerpc. Fix the sanity check to look at
> the support for branch filters used in this test before proceeding with
>> the test.

Applied the tools/perf/ part

- Arnaldo
 
> Fixes: b55878c90ab9 ("perf test: Add test for branch stack sampling")
> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  tools/perf/tests/shell/test_brstack.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/tests/shell/test_brstack.sh b/tools/perf/tests/shell/test_brstack.sh
> index c644f94a6500..ec801cffae6b 100755
> --- a/tools/perf/tests/shell/test_brstack.sh
> +++ b/tools/perf/tests/shell/test_brstack.sh
> @@ -12,7 +12,8 @@ if ! [ -x "$(command -v cc)" ]; then
>  fi
>  
>  # skip the test if the hardware doesn't support branch stack sampling
> -perf record -b -o- -B true > /dev/null 2>&1 || exit 2
> +# and if the architecture doesn't support filter types: any,save_type,u
> +perf record -b -o- -B --branch-filter any,save_type,u true > /dev/null 2>&1 || exit 2
>  
>  TMPDIR=$(mktemp -d /tmp/__perf_test.program.XXXXX)
>  
> -- 
> 2.31.1

-- 

- Arnaldo
