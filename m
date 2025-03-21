Return-Path: <linuxppc-dev+bounces-7277-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72396A6C26E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 19:33:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK9zz3d8hz30TZ;
	Sat, 22 Mar 2025 05:33:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742581983;
	cv=none; b=V/mIp1JJnGYunkyHj9PZlSmeQvZ8k9ocN8wLfKJjQiuUiyokaj6yW9pX/GciVNAlljHRfZjXEesse28oifRoRoFp4iB7C8I7YGvkc8mezyYpV5SmHoB71RYoiD0wmaPlcbQdv6mBukifjEtN6jpUa/1ZakoNMYKj/eGnvx8jUaLRue2A2boG80HfxqgjdWJhs6ZBEkquqZtqDTcSt5x+1trpZaABXsTXj0c4TpvxFpkmI5iwjFv55dzwjW/ImE5z7foxyAvoicwI9P+5Sw9UkwdvFdwXbC2HcX5QMYYVo0d3mP+ZEoV50v1UNqdHDbQKeghiJQNl26zZae9GrW6dgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742581983; c=relaxed/relaxed;
	bh=HYYSOKUxEGqctY3EfhN9A2yhuGU3c7aUKlXkZitVseM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1xSRU0ntkhTQ2kUNzQU8QHRfSHxYjT9b/8hrTj9sT7TcNNSbymzfBFtKezi7VdcYmMF3JuS6gfPNdMdrjwRn0WPtV8wnTKKTis0ZhMMK9kicCYhXoMTuN7/ipuNue5hkETV7+Bd93OsoPIKx8TIV+chEAlX/Pyp0sjj5Un0709phDV8/htSciWyv9T/pkqQa/cA0NQFVWtaBXF/dXdO2g6bbOY9O0/5C6SU3AKTV+RFzr11tSDcNsKpXjhmLUyA6qgw7r+KpwB22jcHfm0eQsibwdqLOQMQSi905sXA/qBmZr/An2jvbJzkK9Ln9rLMNkp4qs1qeKcJA9v5iIPJcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d8NaL9gJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d8NaL9gJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK9zy1GZsz30Ql
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 05:33:00 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22349bb8605so55766855ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 11:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742581979; x=1743186779; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HYYSOKUxEGqctY3EfhN9A2yhuGU3c7aUKlXkZitVseM=;
        b=d8NaL9gJQ5Efw5shi8zvhrMhBDDAK1cba0mDgzS/Dc3uw3t4AhirK2yA+YVACtYSr7
         Xx5XwlO7KbXq2zGqBH8VCXqk3Q8EjwITFNi9ypjZOhCoBv6318vfmI+6W2pznKJMftsU
         HK6aSJAZWLtkpaYoIqxDcASi0YSdTVUlbZ7uiv62RB36mODcY2U+HOw5uvqtV+erW6bj
         caFQA2avecIsa7+16mSTXCZJasCc0oUJaMI1nrg1j38RMsPvE5+yyOGMHoQOSsvuidIs
         FA5Kqbb6VKk6VY2OdiiLG6VO6Dxe8QNVHU4kTl62O8JApPc6BZqhA4duEu1rRfa8Fbmh
         FFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742581979; x=1743186779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYYSOKUxEGqctY3EfhN9A2yhuGU3c7aUKlXkZitVseM=;
        b=d3oMdTJ/rfsTCVTcxJggGJTb0qSloX2Rl57YEX0VDtWqNvrgLBnaX6zM3vVhDM806y
         1yVZYZR99Lj/609TaW94UL+OAws4pvfHMBfszD1vpS7GJfRYRjNlZB/Cyl/cklUbU5AX
         KadHHIAD5fT9iK5VfxNxS01ukx5g7DyQw1SwAvAuTFjv19twWV5o71nn1KzpAypPfRrU
         C9w4GaceRaVlT0X/w4/GPZmsWhWX10wdoctVDpEVuATHoMP6hPeo2uHRofL5kaEVDtmV
         B5zymZOmMmMVZWCUlWUpE0LRWtuUUtdHg255txF9rB3N0JnXwkoam9jm2hYt1aCNtTOe
         0GVg==
X-Forwarded-Encrypted: i=1; AJvYcCVa4gaUMI9+6Ej7ENQop/0ZyoB8e3dg1nEhtVJOvCOsj10rf4yLkGGVMimOcvFp2q1blG2xkBFKMK9FUm0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxcW2nZi/308H6ZqEF9p/UIdNaAUqzWtlllXHrPP4PRMkGHIzsY
	zcbwhoMpzRoH0C3Ko8yeYtEgbpg6A8Yrk/LcmwILxRS3BQ9zpIg2
X-Gm-Gg: ASbGncvapiSX4oUijzHO6sBtrqgn7xsNrgna5foLh93mreX5+S3dytBoHEDuxzzx3n7
	m0nebanABrIj2/4D3ZO371ZRZMrhU3I/Os890YN41rUuCV9hjUXv9ggSU6DI7jpLw8KAlQ/gpnu
	kca8vlzlfxPpdtlQt7p3ZoTLXLJQNrpqlcD9qjake0uxNTLcuIePvoSnBdP34O1cXRzCgaMhJ6J
	1ed2jYTwodtzHBtc7PnOBbCNSp/UMyrOUttgB5b9Bx+xnUSrjGMbA3RLTKuQ5IKZCMcbxSAMKBG
	GRTt8i7Qtt2Bt1GJuxJPnqWaDbn/dNpYgylJzJCAmTvX
X-Google-Smtp-Source: AGHT+IG4Y4KdKGYoy70io/r8gYLZiFwsgOksUI+QUCeOo40CKssKjfePE5RVgUBb4ckPKQzflnN8DQ==
X-Received: by 2002:a05:6a21:394b:b0:1f5:769a:a4be with SMTP id adf61e73a8af0-1fe4347101emr8883211637.36.1742581978798;
        Fri, 21 Mar 2025 11:32:58 -0700 (PDT)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73906123ea2sm2382632b3a.108.2025.03.21.11.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 11:32:58 -0700 (PDT)
Date: Fri, 21 Mar 2025 14:32:55 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: David Gow <davidgow@google.com>, John Hubbard <jhubbard@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	Brad Figg <bfigg@nvidia.com>, David Hildenbrand <david@redhat.com>,
	Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: distro support for CONFIG_KUNIT: [PATCH 0/3] bitmap: convert
 self-test to KUnit
Message-ID: <Z92w13L8v1MvPC8_@thinkpad>
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <Z6eaDuXnT_rjVSNS@thinkpad>
 <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
 <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com>
 <Z6pfomw-3LuWoQQo@thinkpad>
 <CABVgOS=KZrM2dWyp1HzVS0zh7vquLxmTY2T2Ti53DQADrW+sJg@mail.gmail.com>
 <CAJ-ks9mevv68v1Mh0GdGd9Y2EEp3_kdV6FygOiAenYG0=e4=Tw@mail.gmail.com>
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
In-Reply-To: <CAJ-ks9mevv68v1Mh0GdGd9Y2EEp3_kdV6FygOiAenYG0=e4=Tw@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Mar 21, 2025 at 12:53:36PM -0400, Tamir Duberstein wrote:
> Hi all, now that the printf and scanf series have been taken via kees'
> tree[0] and sent in for v6.15-rc1[1], I wonder if we'd like to revisit
> this discussion.
> 
> As I understand it, the primary objections to moving bitmap to KUnit were:
> - Unclear benefits.
> - Source churn.
> - Extra dependencies for benchmarks.
> 
> Hopefully David's enumeration of the benefits of KUnit was compelling.
> Regarding source churn: it is inevitable, but I did pay attention to
> this and minimized the diff where possible.
> 
> The last point is trickiest, because KUnit doesn't have first-class
> benchmark support, but nor is there a blessed benchmark facility in
> the kernel generally. I'd prefer not to tie this series to distros
> enabling KUNIT_CONFIG by default, which will take $time.
> 
> I think the most sensible thing we can do - if we accept that KUnit
> has benefits to offer - is to split test_bitmap.c into
> benchmark_bitmap.c and bitmap_kunit.c.
> 
> Please let me know your thoughts.

Sure, no problem.

I asked you to answer to 4 very simple and specific questions. You
didn't answer any of them. David sent a lengthy email that doesn't
address them, either.

None of you guys submitted anything to bitmaps - neither in library,
nor in tests. Your opinion about what is good for bitmap development
and what's not is purely theoretical.

Real contributors never concerned about current testing model.

I think that you don't care about bitmaps. If bitmaps testing will get
broken one day, or more complicated, you will not come to help. If I'm
wrong and you are willing to contribute, you're warmly welcome! I always
encourage people to increase testing coverage.

If you'd like to add new cases to existing tests - I'll be happy. If
you'd like to add completely new tests based on KUNITs or whatever
else - I'll be happy just as well.

Thanks,
Yury

