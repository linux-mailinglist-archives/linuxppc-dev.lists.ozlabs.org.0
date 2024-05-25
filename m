Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 364658CEDE9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 06:51:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=uLGOzZwJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VmTlr2bYDz79PZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 14:42:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=uLGOzZwJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=46.235.227.194; helo=madrid.collaboradmins.com; envelope-from=usama.anjum@collabora.com; receiver=lists.ozlabs.org)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VmTl566qZz3g5X
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2024 14:41:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716611566;
	bh=mla9/6MWVvFTkGR018Hqe//h65qdGPgHc26QyuTvYVI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=uLGOzZwJziYYaReuCZP41kdo/7KY1AqmQoffffhNZ/c2oeTog0OBD+2U+2gUDVeJp
	 LJTvzHVnCC2Sk9zwokxKWpWGvNUdNXak+uVoD8XHA1SAL5Fgg9DKJeSVXkgWQgRfKW
	 wJiGULnndLJTwK+lnU2hOXwCbNKGYWW/KBgldCiwY/NnJw8waTDDT2WLKXIRjXcqQO
	 S1M17y5E0rErqYsRHKZhOueljqWywQkLO8ygo99IlJFqBCbV4I8W3o3bCqgJwUjaLs
	 P7BQll0ZUDwY3wjmKob60wfKa1zexxjA+9401Gm2ue4eLd7woAH86b8/aCFspSkGCy
	 FChlupYiiFs9w==
Received: from [100.113.15.66] (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 34D483782085;
	Sat, 25 May 2024 04:32:45 +0000 (UTC)
Message-ID: <94964224-1796-4610-a42d-3aacb4d47341@collabora.com>
Date: Fri, 24 May 2024 21:32:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/openat2: Fix build warnings on ppc64
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 skhan@linuxfoundation.org
References: <20240521030325.58095-1-mpe@ellerman.id.au>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20240521030325.58095-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Muhammad Usama Anjum <usama.anjum@collabora.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I was looking at if we can add this flag for ppc64 for all selftests
somewhere. But there isn't any suitable place other than in KHDR_INCLUDES.
But there is a series already trying to add _GNU_SOURCE to it. Once that
gets accepted, we may add this flag there by removing the definitions from
individual files. But until then the current solution seems fine:

Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

On 5/20/24 8:03 PM, Michael Ellerman wrote:
> Fix warnings like:
> 
>   openat2_test.c: In function ‘test_openat2_flags’:
>   openat2_test.c:303:73: warning: format ‘%llX’ expects argument of type
>   ‘long long unsigned int’, but argument 5 has type ‘__u64’ {aka ‘long
>   unsigned int’} [-Wformat=]
> 
> By switching to unsigned long long for u64 for ppc64 builds.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  tools/testing/selftests/openat2/openat2_test.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/openat2/openat2_test.c b/tools/testing/selftests/openat2/openat2_test.c
> index 9024754530b2..5790ab446527 100644
> --- a/tools/testing/selftests/openat2/openat2_test.c
> +++ b/tools/testing/selftests/openat2/openat2_test.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #define _GNU_SOURCE
> +#define __SANE_USERSPACE_TYPES__ // Use ll64
>  #include <fcntl.h>
>  #include <sched.h>
>  #include <sys/stat.h>

-- 
BR,
Muhammad Usama Anjum
