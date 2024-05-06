Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C94B8BC8FF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 10:03:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=poyFDBnG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXv740ykKz3cTb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 18:03:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=poyFDBnG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b5; helo=out-181.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXv6J6g60z30T9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 18:03:04 +1000 (AEST)
Date: Mon, 6 May 2024 10:02:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1714982561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FwG4XQ33pOhbqQSbU9r2mTNxiLfRkP6NBq9+hsdstEk=;
	b=poyFDBnGSsOIIsDzWCoe1Iy82rwwkFMdZNFN2daz+E2KLnuUZ21x7zxq3vVz/RDIDg/M3O
	CmTkkB7sTwlIYn5ByOQtaw/djuVf5jABJl9n0FIvBjwTqBAsGSMi1KF1Z2GyB8dcCS6pnJ
	y4d4AcuwWiHpptu0WePH4Bc2Zi0Reyk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v9 01/31] doc: update unittests doc
Message-ID: <20240506-c50ad09a466d9931632cadad@orel>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240504122841.1177683-2-npiggin@gmail.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 04, 2024 at 10:28:07PM GMT, Nicholas Piggin wrote:
> This adds a few minor fixes.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  docs/unittests.txt | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index 3192a60ec..7cf2c55ad 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -15,8 +15,8 @@ unittests.cfg format
>  
>  # is the comment symbol, all following contents of the line is ignored.
>  
> -Each unit test is defined with a [unit-test-name] line, followed by
> -a set of parameters that control how the test case is run. The name is
> +Each unit test is defined with a [unit-test-name] line, followed by a
> +set of parameters that control how the test case is run. The name is
>  arbitrary and appears in the status reporting output.
>  
>  Parameters appear on their own lines under the test name, and have a
> @@ -62,8 +62,8 @@ groups
>  groups = <group_name1> <group_name2> ...
>  
>  Used to group the test cases for the `run_tests.sh -g ...` run group
> -option. Adding a test to the nodefault group will cause it to not be
> -run by default.
> +option. The group name is arbitrary, aside from the nodefault group
> +which makes the test to not be run by default.
>  
>  accel
>  -----
> @@ -82,8 +82,10 @@ Optional timeout in seconds, after which the test will be killed and fail.
>  
>  check
>  -----
> -check = <path>=<<value>
> +check = <path>=<value>
>  
>  Check a file for a particular value before running a test. The check line
>  can contain multiple files to check separated by a space, but each check
>  parameter needs to be of the form <path>=<value>
> +
> +The path and value can not contain space, =, or shell wildcard characters.
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
