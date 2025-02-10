Return-Path: <linuxppc-dev+bounces-6016-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF14A2E3B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 06:37:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yrtcn16rjz2yyC;
	Mon, 10 Feb 2025 16:37:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=136.143.188.112 arc.chain=zohomail.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739165833;
	cv=pass; b=YpnC40ClEi5WekWZ+tMIxqLrg4hJiBSClFgwvCvamJHQjuG+Fmd/rZDI2lNLqjbprPRlaiI1jQhGT0qItQPJhzDGmjEl7eN0DTf3LTGk2/peN26+049FqOBLov7A9dr/gnjYiD9oKlEan7nexs2O9P6xvKQJDuVsxBpd2VowR/xMKQ/rOXRGiq2YW2ytuBZafQkFiLWusgCm0v/mZ4VUfSCfxRHgQpG7Mn/WJ9MeanCJWEU86AhIfKy7OOfV5GtpKicLfVrHYlYr1bk4nagFo4LkEYDedZPu7pnNXejA5a7a+grKkE596G/yLxCBXNYLMZz/836JqDBwOolWr38gEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739165833; c=relaxed/relaxed;
	bh=LZKYeceqEF9quM6A8CMj12KwUl60fxWcDy6hwWwYScQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cVED1pVahQhUXGR66M1rST9LBcPo1AYK+TaHJzJrMn7wE9WXD+s/SZ3VyhKsqmc36S7cZEjC4yQXQykXGyTk0pNn7A0nyWKbQ/NZxBSbwCGB8wu9gU9KbIgxhoPOdtIj7/YX/gkb3UiHUIEw1s9Deu73yda/6Cxq6xDUJ9WZDiWTRIZfdM70UZfcysNTv1iPhFjP4N13EQxxRP8haepx1IxS+RALWa+f54YzGzFIRRjMc52UYca3cCol+kSK2JMWBVJluYNtZiPw4Zq3cWPtFr2ZenDXr4UBPqtyrBAPklvJo5J9KnlUWDhdifUbD3v2q+2GH/KAV7J85cDqqEOj+w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=collabora.com; dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Nk8l3Yxd; dkim-atps=neutral; spf=pass (client-ip=136.143.188.112; helo=sender4-pp-f112.zoho.com; envelope-from=usama.anjum@collabora.com; receiver=lists.ozlabs.org) smtp.mailfrom=collabora.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=Usama.Anjum@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Nk8l3Yxd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=136.143.188.112; helo=sender4-pp-f112.zoho.com; envelope-from=usama.anjum@collabora.com; receiver=lists.ozlabs.org)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yrtcm02Csz2yvl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 16:37:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1739164906; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WKmHX2b6i1OdXX89VJx3mXatPfyAW9fmZWnWbHWD+xapjDMY/0ZlWWJw9360xlc5pip1arTzhNZCJ3KE9UZgTiTD8Ddbq4yTj3AK9ZkeiUx+D1sU2ErfSXoVxUFnsJhfVAoxcb6wD4gP3i58nYnB5UhUJtx8ED9ul0FpcaiPPNg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739164906; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LZKYeceqEF9quM6A8CMj12KwUl60fxWcDy6hwWwYScQ=; 
	b=U0NHTZ783VuZXXd9HjHbxJRsFlAbc99aAOSnQyFXZnYvZ5/vlhue/xP/vQHp60ARAr5Ypk449mMqnzAWyqQDEnlkh4jrXS4JwVgFzfh0MZxDxZZaom8Ep2MEBwW9ezto/tN3Gjcgv6sROimpaFfjc6G3KY63I4VKxjWTv7vmxfM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=Usama.Anjum@collabora.com;
	dmarc=pass header.from=<Usama.Anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739164906;
	s=zohomail; d=collabora.com; i=Usama.Anjum@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Cc:Cc:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LZKYeceqEF9quM6A8CMj12KwUl60fxWcDy6hwWwYScQ=;
	b=Nk8l3Yxd7gQHDLc+DnKZhXLIy1UPWk7RB4/KnqK37lO0x8JQpQm1VdcOfgZQZ73e
	sENxy1P25yej0hZVQkKxapJx5gCVWQ3938NyE1ma/FyQrjRRozwWTtsbC06Ai36v4Lf
	TClCBHw6h+FgfFKkuRyK04nquVqVq0Ghad4nqP0A=
Received: by mx.zohomail.com with SMTPS id 1739164903782624.1070733407311;
	Sun, 9 Feb 2025 21:21:43 -0800 (PST)
Message-ID: <3145dde7-0a34-4929-9ad3-45de91850580@collabora.com>
Date: Mon, 10 Feb 2025 10:22:19 +0500
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Usama.Anjum@collabora.com, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/3] bitmap: remove _check_eq_u32_array
To: Tamir Duberstein <tamird@gmail.com>, David Gow <davidgow@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Shuah Khan <shuah@kernel.org>,
 Kees Cook <kees@kernel.org>
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <20250207-bitmap-kunit-convert-v1-1-c520675343b6@gmail.com>
Content-Language: en-US
From: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
In-Reply-To: <20250207-bitmap-kunit-convert-v1-1-c520675343b6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2/8/25 1:14 AM, Tamir Duberstein wrote:
> This has been unused since commit 3aa56885e516 ("bitmap: replace
> bitmap_{from,to}_u32array") in 2018. Remove it to avoid the need to port
> it to KUnit in this series.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  lib/test_bitmap.c | 28 ----------------------------
>  1 file changed, 28 deletions(-)
> 
> diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
> index 65a75d58ed9e..c83829ef557f 100644
> --- a/lib/test_bitmap.c
> +++ b/lib/test_bitmap.c
> @@ -100,34 +100,6 @@ __check_eq_pbl(const char *srcfile, unsigned int line,
>  	return true;
>  }
>  
> -static bool __init
> -__check_eq_u32_array(const char *srcfile, unsigned int line,
> -		     const u32 *exp_arr, unsigned int exp_len,
> -		     const u32 *arr, unsigned int len) __used;
> -static bool __init
> -__check_eq_u32_array(const char *srcfile, unsigned int line,
> -		     const u32 *exp_arr, unsigned int exp_len,
> -		     const u32 *arr, unsigned int len)
> -{
> -	if (exp_len != len) {
> -		pr_warn("[%s:%u] array length differ: expected %u, got %u\n",
> -			srcfile, line,
> -			exp_len, len);
> -		return false;
> -	}
> -
> -	if (memcmp(exp_arr, arr, len*sizeof(*arr))) {
> -		pr_warn("[%s:%u] array contents differ\n", srcfile, line);
> -		print_hex_dump(KERN_WARNING, "  exp:  ", DUMP_PREFIX_OFFSET,
> -			       32, 4, exp_arr, exp_len*sizeof(*exp_arr), false);
> -		print_hex_dump(KERN_WARNING, "  got:  ", DUMP_PREFIX_OFFSET,
> -			       32, 4, arr, len*sizeof(*arr), false);
> -		return false;
> -	}
> -
> -	return true;
> -}
> -
>  static bool __init __check_eq_clump8(const char *srcfile, unsigned int line,
>  				    const unsigned int offset,
>  				    const unsigned int size,
> 


-- 
BR,
Muhammad Usama Anjum

