Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 612BC8CEDEA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 06:51:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=LQUHY/SU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VmTmc6Jn3z79gl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 14:42:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=LQUHY/SU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=46.235.227.194; helo=madrid.collaboradmins.com; envelope-from=usama.anjum@collabora.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 525 seconds by postgrey-1.37 at boromir; Sat, 25 May 2024 14:41:37 AEST
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VmTl560mkz3g4r
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2024 14:41:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716611582;
	bh=VdZ3ZkVDoMmOUPpYGpxwg0tdv3KvlTxSUGRQXFANGLA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=LQUHY/SUh+v6SkttUeAbv2lyIGF2c8PC82u9hZ0d34n1qUhEYyuTfWcLusrsk87eV
	 TgumHvVVRCQeL8glSF0geZSTOCmAs/eyqNgimJFMk/ngjv5IbPqH5UbsDCQINgoZAM
	 gvtVf8odHwfozFmtIJaKICOtf+XfvfAnqg8P2//MSGd7Dpm9x9lxTohUayB8et8NxM
	 z678v0i2n2PH9okYSneaqB0F2Zv5QHYScxj3e87HnuaXNdW1HyWGqbkkydSBk+qn44
	 DA5Ckk2sQTkc+do0VPX9RJgcZZHwQuC06At3IIGrZtDHXTK1CiRGyFP+NpCiSsHXRo
	 UKh8ROJfEJLvw==
Received: from [100.113.15.66] (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A827637820A4;
	Sat, 25 May 2024 04:33:00 +0000 (UTC)
Message-ID: <c6a02989-b50b-4cb3-891e-a45be9391731@collabora.com>
Date: Fri, 24 May 2024 21:32:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Fix build warnings on ppc64
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 skhan@linuxfoundation.org
References: <20240521030219.57439-1-mpe@ellerman.id.au>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20240521030219.57439-1-mpe@ellerman.id.au>
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Muhammad Usama Anjum <usama.anjum@collabora.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/20/24 8:02 PM, Michael Ellerman wrote:
> Fix warnings like:
> 
>   In file included from uffd-unit-tests.c:8:
>   uffd-unit-tests.c: In function ‘uffd_poison_handle_fault’:
>   uffd-common.h:45:33: warning: format ‘%llu’ expects argument of type
>   ‘long long unsigned int’, but argument 3 has type ‘__u64’ {aka ‘long
>   unsigned int’} [-Wformat=]
> 
> By switching to unsigned long long for u64 for ppc64 builds.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  tools/testing/selftests/mm/gup_test.c    | 1 +
>  tools/testing/selftests/mm/uffd-common.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/gup_test.c b/tools/testing/selftests/mm/gup_test.c
> index bd335cf9bc0e..bdeaac67ff9a 100644
> --- a/tools/testing/selftests/mm/gup_test.c
> +++ b/tools/testing/selftests/mm/gup_test.c
> @@ -1,3 +1,4 @@
> +#define __SANE_USERSPACE_TYPES__ // Use ll64
>  #include <fcntl.h>
>  #include <errno.h>
>  #include <stdio.h>
> diff --git a/tools/testing/selftests/mm/uffd-common.h b/tools/testing/selftests/mm/uffd-common.h
> index cc5629c3d2aa..a70ae10b5f62 100644
> --- a/tools/testing/selftests/mm/uffd-common.h
> +++ b/tools/testing/selftests/mm/uffd-common.h
> @@ -8,6 +8,7 @@
>  #define __UFFD_COMMON_H__
>  
>  #define _GNU_SOURCE
> +#define __SANE_USERSPACE_TYPES__ // Use ll64
>  #include <stdio.h>
>  #include <errno.h>
>  #include <unistd.h>

-- 
BR,
Muhammad Usama Anjum
