Return-Path: <linuxppc-dev+bounces-5992-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4D4A2D7EC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 19:01:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqzCs5j34z2yGs;
	Sun,  9 Feb 2025 05:00:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739037657;
	cv=none; b=h69kN8c1jOrpSKNcIiy2mK9f+/TKt3Wx/GX8MduzBF6OKyJK/REFMNODsq40fzLjRsw4bnQkkGdEtAZkW7wfffae9F2ObT1n++QkAe6WXHy6HQ2L4TfYDs3/tMjAB6DYD2+qxiBvOlCQaqmazI7Fhwgban2SLo71Go86rN8yeRJQlY8QJCFdkK7ks30lwpBPJRbON3dSn/cQLwWiVO3/uHKI6w8ubyLu+e8WIazuktzbG1JK55a4ShxYUSi95jl3tEsKnI+AVhUi2T/mcdJb/aS8SyvTi3d2piGXVjwq1ACIRPs4rr3sE5sltdvRLlRzRyMnZLl6fuI0rHqxbGtBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739037657; c=relaxed/relaxed;
	bh=GJ50So012NUKYlUWEsNDmQqC2zUcRpvTKx1dhgNUOYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2iXR+3fDzSjCFDRGguhkrFzNlT2u46l+Ps3MzTom4KN3I//Hh4cX6Xp6Z/9AmWadUoHgGYt+mP+WLsDkZb+RpjF7wcHv9xR6CdsZPzO8u988aSczaDoOqBSy3exQVYaWtsZ6we7R9hfGJ7pjmTQ0EU+RV3qcs6WXkUjRsdD+UeKwLEglDNbxjAUzvHyUt5A6Zj3FwcSE/3tNrtumC9xJezxmqfQfFYcAmU9QcdNyMGqxaoSjbwBZRxkldg6T56CMi0GPAeu0/k6xNAnj7D8pRubd58JiBk/AOx8lMzLb3Vvmbkfk/5WtRzAbvc9azQuo5gM14gSOzynWhaYx3tkPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BEIUyWTP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BEIUyWTP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqzCr6qVcz2y8p
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 05:00:55 +1100 (AEDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6f277a1ecfdso21981507b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Feb 2025 10:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739037654; x=1739642454; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ50So012NUKYlUWEsNDmQqC2zUcRpvTKx1dhgNUOYI=;
        b=BEIUyWTPcsvgIR7av3SxIWuXaxPGtXhQXqLAUDwggjmwgTYElZd2ulXfY31AlrwS7L
         EXMd1jSMcrimVopHWY1KMD6c/6I6F3EDgWSzA4BGCRkkXYg9wZA1NOQTM0Segh9G+scu
         bB5iJNLEmqgjiup6toKb7DIwhbPQvMID8555ZWA9T7J9DUAUcmTm3vlcWrGAD1mCNrix
         w+BgQaIRo3q7pz0m2Wi5wu8zJJGdX7fpcDcwlyKWOCcbGH3/YZN3OPl9f3zTQMLCLM7r
         qsQ8ZAnfnRb9is8/PJCC23V+7HjvPxhSWLym+BmUA3WxGkm7KHlJB9Zms2fMlec2FGuG
         xRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739037654; x=1739642454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJ50So012NUKYlUWEsNDmQqC2zUcRpvTKx1dhgNUOYI=;
        b=qtvZMOG8DRFJHMDlePwA5SzGIMuvXMZn6OTKN3HfaeE4Z4byxestcaDvmVMrVn7ZxB
         1G26QP5RMcCuE/ufrlRi0JAK1xgxZtrPLGaTXX78UA5nW3kpjPkgERhhKuTFR4akCw+n
         l/aQBE/36T+XaCZ85ZVZnnG0+aoNW6RPe2y8q+uRxIOVT7Hn4kEd/Bpntgk3WT/EA0o3
         TrKTeIcairGA823jLM7WzW5yM1kSpB1tY6JmEdUH5Kd6IQ0k3AkvVC+578n2cy4zG5iw
         GpOefuBK6B7+rj+9VMNMB6rgAdgcjnWK+rRr0tIklqc8cnQJ8aKOJINaSaaOAhbx2cRM
         zURA==
X-Forwarded-Encrypted: i=1; AJvYcCVWry1t+BvDLoHedXoo0xnqib1IbzUuRRmYLQBDIKgT1uBVqjwQ9elhu4YAKfHbu/EuffiI/3/GdtSV3IU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwtOzVmoFtee6lpzr487bf9ueaOoLaQSgdTlb7gq9bnqhZ1fw+r
	aaUSglDKdL+krkHZNADYbRLu2NAOODoyazJ+Nsb84l53N0KKdM3S
X-Gm-Gg: ASbGncvJk0dfRB6Lqq9s1pc9Bgm182reFJnHId9ZVIFfdUUHY1S0/JA0MJAJGBClE2x
	sKqtrhCJR3uHAjQT4NGcFDR/BATDJEORYvHqw1j1xhC2z7ct6HqZGEgqStX4SUCZdek3E+X1iHs
	1qmX0kHmu6hCS7EOF1K8bFOroGDChYX8h7IB8nB6O1De+oxjH8D6hndQytZypRS87yfsUW8ls2N
	EmhJHW555ujuTcT4oxD6ZOZa/58+YSI1zRr39b0lh/v7T4McyEKvh4YpoZXSO1vlkyEi7Y3tiDo
	rKoLkDuGdT2IRYOuBt4PVPUjm3GOkdurX1V28Z3j1NGxUFkDa74=
X-Google-Smtp-Source: AGHT+IFRlIpmB/OwyomFOIGum1C1obghY8tVh4HH+993/Q5NYcDDdMOhv5rQxRMHdGz7A/w4A5DwlQ==
X-Received: by 2002:a05:690c:7301:b0:6f9:a3c6:b2e4 with SMTP id 00721157ae682-6f9b2a216a1mr71260247b3.37.1739037653938;
        Sat, 08 Feb 2025 10:00:53 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99ffc0b73sm9596537b3.104.2025.02.08.10.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 10:00:52 -0800 (PST)
Date: Sat, 8 Feb 2025 13:00:50 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/3] bitmap: remove _check_eq_u32_array
Message-ID: <Z6eb0mO_U76CS83_@thinkpad>
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <20250207-bitmap-kunit-convert-v1-1-c520675343b6@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-bitmap-kunit-convert-v1-1-c520675343b6@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 07, 2025 at 03:14:02PM -0500, Tamir Duberstein wrote:
> This has been unused since commit 3aa56885e516 ("bitmap: replace
> bitmap_{from,to}_u32array") in 2018. Remove it to avoid the need to port
> it to KUnit in this series.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

OK, 7 years is enough to drop it. Adding in bitmap-for-next for
testing.

Thanks,
Yury

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
> -- 
> 2.48.1

