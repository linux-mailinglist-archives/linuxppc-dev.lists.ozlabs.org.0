Return-Path: <linuxppc-dev+bounces-13624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7FDC233B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 05:03:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyS5J47pJz2xnh;
	Fri, 31 Oct 2025 15:03:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761883412;
	cv=none; b=nJ/gNZ0NHCkbh/XQJqm9Q1WgdurP9bQNuk4RiTMBlMFJwRl2MaIFfLim86mkH823YUbkAMp78OYMKoll838vGg4vp7zsDJtaJMhvByrRWnVzm7weOC8z+4mr0+y1Yh7DAVhINmvUgvKBp5iFBgElQZm8UxiADzBrwlXe7XCkaUA0gGqomeVlkp84awqx4l81b0W76P4NNj5IzHaCGsICrzPbW2cW+OIun/C3umOFM5HKNjCoq5PDhgMc7RRNVNbAJ1FzM1u0dQqAbtfAESZpKKq0swN34ISZguhXKqxVXwjkHaqws/cLHjx+OsSh/+AlrMFcCbVupOTqSqUotjh9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761883412; c=relaxed/relaxed;
	bh=4zM0JrKkuHW0LwFSqMHjgtGldZvpduaKaVu/XjzRQWI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=VkXbXV5ondVloUwCqftEAgfZj1CV8pAOXd9uyP59iBKMMUWtIYpEQifedH/QvquWXQHu8IXODbwIQ0TjkGy2Yv4ZCxZsWn42N9OfDiNLQ0MZzD292B1y2a55HTj39RjRO8oh7UgN65SsYeQ93KkgyIBMbN8YBwoxwH8gOtuZl7QO3KmoKeEZrnt/4i8DJdgDiBLB4UgZNxiyT+WU4yNo6Wn9bck2I+mOxRMFWWyB83c5WFGA6Md2ZjHPonO8oNL9hWYNo2gI8EEd2vfmxuREiKesclQXkQREGZ25+V7Jnb8+xF9B8x18OPFf//BbWKxfbZAtczk5f5lzRZwAnbq1tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LfobRB18; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LfobRB18;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyS5H0rpDz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 15:03:30 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-28a5b8b12a1so19570965ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 21:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761883408; x=1762488208; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4zM0JrKkuHW0LwFSqMHjgtGldZvpduaKaVu/XjzRQWI=;
        b=LfobRB18qa6xywWZQrR4bnFwqoSGahelKQHuAnJMK6Jax0tSynH/c1Glk26I6c2oJa
         lBGcX0vbfflGrm8Y5jn0IVkMdMej6BXkVJ+VYc/3hGFsdhb0FQsmRVWC0/mfiy8RA6fY
         CiHXVsIgQEflrUt8hMzOEjeEhm5j4qDMv9PnZ94K5BEHylYhAvaRd/qZNkKHlTJoYB4l
         KQxFMJZkBjynwfA2hVW3L8rjjCLncdcATrc/X6J+JA7oRniAnGhpcb+BvK6INjr7AzIE
         LX7+63K9+n1JdMgmo975rXs5e8uw78a9YcvrvBCKKIOMBvVsXSz2kQEoV43VtMiWWIUO
         VSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761883408; x=1762488208;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4zM0JrKkuHW0LwFSqMHjgtGldZvpduaKaVu/XjzRQWI=;
        b=FZKMORhgfZPYCg3QdhDtQIX3iSe/UE+C+Dk9vRq6oSwTXGLxO9VB2euVIRDKrpv3m2
         ZumYbkGC/1ult+YLOEAvJcaeBMzVuR+rIGvraJBIo4cwhnilDxL6o0p66UmTuJQwsnba
         5XwfKvTGQMhGfBdYBHDdu3W4wpsvrZVS/kp8mAmvV6wNph2EHSNxxetIPr0FLpCtLeZ5
         0pHYcevqQgxixULHSYxcOJAez7Bs/5R724e92ij7jleQr2FljUwqqn8J+sZxmxGWefOs
         N+qoXJfSBRzyrxL5L5nzhOBF4jfuqJS/plkshpu8j5jVkpKSqtGq6FSIdVMaHMmavQtC
         p4XA==
X-Forwarded-Encrypted: i=1; AJvYcCUCu3f6784E+inUU6zoGPfJsRXTR6aUI/w2Bgcci3ccX1oTWsqdPgA/SbUWio6/sJrWncnibCh63z5JiUw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBPEhd/y20OACvgUNU0wjT1Ijgub9Wbk7zlP7YvmAxH6xFgiVW
	sNY68t0HJZqOMgz5yHniE50Ss0snVm7V5ejMWBQnDL3P2vqUqxIwP7kF
X-Gm-Gg: ASbGncugj1/cP/kkS/Sk7IaMAudmKa8vEz2Dxl8l3wCdV25HMY1EgagmPGyNPCLqk87
	85rj1NTYqcDUjOH/JfkqlWT7AqCqz2Sue1bokzNi14Jsuo2fjT2NoPRODToUiqTLq0UagT1iQS5
	voAAa6gyLHtIORl5PDWM7nbx+wqfMQUvsyPaJ1SBjKUwkoTirQu6E4im6SeF97MlZxFUAKfdvin
	gTiTeXCREnl7+SunVJntFU4G+DE1H4ctsXwajKIaGPeLBxkyhK0Auh9CX8KSNYF1q2E3EIktCNd
	MfdLQ71GGovSfootK6WrXZm/mLZMd6bOmnMWxTeKFW+ySCE6DD0nfEJ1A+gTvzVa00MPurOi8Ab
	Kn1AXb7QEbXTybB6EN7lZbzFdTAfsqsMX7d7GbvZR3NiSCdXCXP/QB1iK6Bj3ZNRUgTaMcRHBD1
	oXnl5J
X-Google-Smtp-Source: AGHT+IF+Otf3dvCLqA/29pPoqE6PfUKwkEb9dFD/+p/C4B6QO4blh+aAm5xxfJdj2Euz40d+9HoNFg==
X-Received: by 2002:a17:902:da8c:b0:27e:f018:d312 with SMTP id d9443c01a7336-2951a34cc1emr31612725ad.1.1761883407618;
        Thu, 30 Oct 2025 21:03:27 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952696eac3sm6139355ad.62.2025.10.30.21.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 21:03:26 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: Re: [PATCH v4] powerpc/kdump: Add support for crashkernel CMA reservation
In-Reply-To: <20251030100955.1453314-1-sourabhjain@linux.ibm.com>
Date: Fri, 31 Oct 2025 09:27:30 +0530
Message-ID: <87o6pn7mfp.ritesh.list@gmail.com>
References: <20251030100955.1453314-1-sourabhjain@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Precedence: list

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
> crashkernel= command line option") and commit ab475510e042 ("kdump:
> implement reserve_crashkernel_cma") added CMA support for kdump
> crashkernel reservation.
>
> Extend crashkernel CMA reservation support to powerpc.
>
> The following changes are made to enable CMA reservation on powerpc:
>
> - Parse and obtain the CMA reservation size along with other crashkernel
>   parameters
> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump
> - Include the CMA-reserved ranges in the usable memory ranges for the
>   kdump kernel to use.
> - Exclude the CMA-reserved ranges from the crash kernel memory to
>   prevent them from being exported through /proc/vmcore.
>
> With the introduction of the CMA crashkernel regions,
> crash_exclude_mem_range() needs to be called multiple times to exclude
> both crashk_res and crashk_cma_ranges from the crash memory ranges. To
> avoid repetitive logic for validating mem_ranges size and handling
> reallocation when required, this functionality is moved to a new wrapper
> function crash_exclude_mem_range_guarded().
>
> To ensure proper CMA reservation, reserve_crashkernel_cma() is called
> after pageblock_order is initialized.
>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Jiri Bohac <jbohac@suse.cz>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
> Changlog:
>
> v3 -> v4
>  - Removed repeated initialization to tmem in
>    crash_exclude_mem_range_guarded()
>  - Call crash_exclude_mem_range() with right crashk ranges
>
> ---
>  arch/powerpc/include/asm/kexec.h   |  2 ++
>  arch/powerpc/kernel/setup-common.c |  4 ++-
>  arch/powerpc/kexec/core.c          | 10 ++++++-
>  arch/powerpc/kexec/ranges.c        | 43 ++++++++++++++++++++++--------
>  4 files changed, 46 insertions(+), 13 deletions(-)


I am not much familiar with the crash kernel workings but was curious
about the following query related to this patch:

As I understand this patch allows for the remaining crash kernel
memory to come from CMA region. But do we limit the CMA region to be lower
than 4G? Is this patch dependent over your other patch series [1] which
supports high crashkernel reservation?

[1]: https://lore.kernel.org/linuxppc-dev/20251027151338.819957-1-sourabhjain@linux.ibm.com/


A minor comment: I guess we could reflect the support for ,cma for PPC
too in Documentation/admin-guide/kernel-parameters.txt like how it is
done for x86.


-ritesh

