Return-Path: <linuxppc-dev+bounces-7523-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6B8A7F8F7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 11:06:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZX0Z23l2Yz2yyT;
	Tue,  8 Apr 2025 19:06:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744103194;
	cv=none; b=jniFrJ+ZzqKGd/qHLSqk4n+Go78o+NZqaoVPHx9GRybeFn/TiWXbsm82Ld6MfdM7C/fwNY3k+C6FfIxyMCB49ErvVVOmu/KWSMYiN1OmG2Pe1lFAXy6Ku2chAQU5BGKVPQeKvh/GpLOg0ALphlThu7WekEKqMYMek4Bfd/tIL1BhjUByTca3373PWDmuccwnfPS7bPkgwCrfWZS7JSzZ3YJGNyXyiJOSo7UqnJ3LGanpmBhxH1RJsKB6JVH1R0mRFWfsaKlKB1yy4oUmhRusreKKUbG9DUVqmd9cAPw7WuqyTYhgGRE1bbPaweLQFU0g9TUyxQe2xAj2qa865Eilww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744103194; c=relaxed/relaxed;
	bh=DFEiuLmM22IxjeaKHsuzDoTYYTnkOH+zchTaV4Tw6IU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=A8TbdcxncTLJ9yZsBdiOS2nfPIb9o6arPvRzcPI60RLlNX83HEUKXYttwmrSytInTYAfBHpa2iEGbAJDC8WV8YKZOZi7rUvuPUgKATK3l1QlhRWluGGbTGyuMpIE3J1epFP6Z0UDbILyVDRvCwaL4q0feotzfjFPPmDu0FtX4MZYWqo4mp+nAZTbZ3R1JNESidDRGbm52Wmyh1ir/ce8xvzz4ZR7GcTZFIwQWj67501Rt47xUHD/qwwv3i1QZQQyEBdewFnW5D1G+vLmpWvus+t/AWxs7Vfnk7B9SUqH3T4QTU7OUbDtJ4Ds+Bt8ZSidTAFM7KYpigPSy53Y+uTFSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QKvdFlcH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QKvdFlcH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZX0Z10Fx3z2yy9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 19:06:31 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-736a72220edso5382991b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Apr 2025 02:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744103189; x=1744707989; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFEiuLmM22IxjeaKHsuzDoTYYTnkOH+zchTaV4Tw6IU=;
        b=QKvdFlcHABGmZ+VtuIjWoYIZjPhr/Hl9o0LE5aAUbuxvDASxnRlbRmjXqROqkEOfLQ
         u+S8Eb72ozP+Y5yNtxrVHaBc4/3/utzdfaBvG7K3J+IMoAQNuBeprgU79carI0ozSDWX
         iMHIQagMBxmwZd1879Wi0KPlL6HN8UvpUtJjfsPoZaByIqymXFw5LjTeah1AVaaV8fNz
         F4BqcfAJmFgcjYt9FQQM/xKCCdmroknHArnQBYCvAJOOS73xbARlk1y37jwKRO9027t3
         9VAsTfI7GQVV6/4ea8S0kZzZ1yq3XA0j5ukVVsGWay/KJOYc1PsBtfF2ooRmy5HTizlq
         kciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103189; x=1744707989;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFEiuLmM22IxjeaKHsuzDoTYYTnkOH+zchTaV4Tw6IU=;
        b=XDbCgGR+2HI+tQpaJKFhGezKtjpecYd1LLsBogoENvw0OyUXUl+rHbuFjZkNcS9xDQ
         UW8T0uRy9Ml4WgvxW5QT+36cJAcXjumw5UXCKCOwdt18NaD3burGbO2uJtmRnwahJy+z
         ncHV7ogv+k68MKtQl6QiIA2dgj+Heaf3+HxunK5tQtJTMnTaqNpUcGeK32dLhVqMFkRq
         EAzKkC4/b4FNGTp/bzTOdWEVvm3zr4CKb9McnJoLjnF+gNDVA1vI4nFqmS5aI0g8iuP9
         iNe0liS3nFF/A9+fEfAJhHUTVwEvemFDOZdmMy+CnJ/IHV3GnpHpIb4leaGawQQ9qs73
         SCgg==
X-Forwarded-Encrypted: i=1; AJvYcCXurTxiiiqvTB/29+w54hispSUf3TXKz7wHzC8kdEaxIiOkJ4p0tnTczJ0LLjH8p5L3F4lSxumuVj/ODmY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4/Y+1LAahmZx7zkb3y6+AzAQLcE13ROkIBU+K4skkogzipirO
	QGpBS8i2PnaI/mv6fIYOB5FIWYiYSFKCVFmk3VEtfm0qKCm6jwoB
X-Gm-Gg: ASbGncsz4xx63QIZC/8Sjb1quUxwvBzF1HvNqbsiNGgdp5i4AScSpW4OBHC1/i9aaTz
	GYaOCwoZWgjbV9fWAfO9U2GBeoC2KEQ/yzBz2PG1I4Qgtd5NowC0aEpKMBtTLvuh+zpIuNO5ygP
	sv6629jJfA6g5D3MpgsG5ulHV6iWGx0c73h51kPrAwzwjdpK30pzWvq4xMWXQFGXxUGp32vrBml
	gRxBEKZ5kUJDyDwS4YSmfV0uzSiUe9vvBjTm5RaJpm1fUoA0qjzsxzwBHmtKeu/F5jrGgj8dBUp
	9I/RgaMsPfFiyGzW7HpuzNYVuyrTtP8u7o4=
X-Google-Smtp-Source: AGHT+IFlBeG5MBXvHgIf5/McQR5STdJYm19SJjYbeN0o9QFwBL7DOP4OZiZjP1wUUt6QqbJOFI/GYQ==
X-Received: by 2002:a05:6a00:2410:b0:736:457b:9858 with SMTP id d2e1a72fcca58-73b6aa421bdmr16908928b3a.10.1744103188992;
        Tue, 08 Apr 2025 02:06:28 -0700 (PDT)
Received: from dw-tp ([171.76.81.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee619sm10331344b3a.52.2025.04.08.02.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:06:28 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, paulus@ozlabs.org
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH] powerpc: Add check to select PPC_RADIX_BROADCAST_TLBIE
In-Reply-To: <0ed6cb24-e8dc-4821-91a9-b638ca862878@csgroup.eu>
Date: Tue, 08 Apr 2025 14:31:40 +0530
Message-ID: <871pu3kowb.fsf@gmail.com>
References: <20250407084029.357710-1-maddy@linux.ibm.com> <874iyzzt27.fsf@gmail.com> <0ed6cb24-e8dc-4821-91a9-b638ca862878@csgroup.eu>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MALFORMED_FREEMAIL,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 07/04/2025 à 21:10, Ritesh Harjani (IBM) a écrit :
>> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
>> 
>>> Commit 3d45a3d0d2e6 ("powerpc: Define config option for processors with broadcast TLBIE")
>> 
>> We may need to add above to Fixes tag as well, no?
>> 
>>> added a config option PPC_RADIX_BROADCAST_TLBIE to support processors with
>>> broadcast TLBIE. Since this option is relevant only for RADIX_MMU, add
>>> a check as a dependency to enable PPC_RADIX_BROADCAST_TLBIE in both
>>> powernv and pseries configs. This fixes the unmet config dependency
>>> warning reported
>>>
>>>     WARNING: unmet direct dependencies detected for PPC_RADIX_BROADCAST_TLBIE
>>>       Depends on [n]: PPC_RADIX_MMU [=n]
>>>       Selected by [y]:
>>>       - PPC_PSERIES [=y] && PPC64 [=y] && PPC_BOOK3S [=y]
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202504051857.jRqxM60c-lkp@intel.com/
>>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> 
>> It's a bit strange that even though PPC_RADIX_BROADCAST_TLBIE adds
>> PPC_RADIX_MMU as a dependency where is it defined, we still have to add
>> an extra check for the same dependency to enable this for any platform.
>
> That's expected, see 

Yes. I had figured that out. 

> https://docs.kernel.org/kbuild/kconfig-language.html#menu-attributes :

Ok! Good to see we have this properly documented as well. Thanks for
pointing out the documentation link.

>
> select should be used with care. select will force a symbol to a value 
> without visiting the dependencies. By abusing select you are able to 
> select a symbol FOO even if FOO depends on BAR that is not set. In 
> general use select only for non-visible symbols (no prompts anywhere) 
> and for symbols with no dependencies. That will limit the usefulness but 
> on the other hand avoid the illegal configurations all over.
>
> Christophe
>

Make sense. Thanks! for adding the details.

-ritesh

