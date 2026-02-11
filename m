Return-Path: <linuxppc-dev+bounces-16793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJgWIUn6i2njeAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 04:40:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96180121094
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 04:40:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9kjc6NMjz2xlk;
	Wed, 11 Feb 2026 14:40:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770781252;
	cv=none; b=Zwc4cWwhxx/LJGCkpAsDLZA98cAJsyuGz81V9tMySbBY7H4LD3mBZ8dTazYBCBYixz0jWvWoHD8tUYF0QGeNqqWis7pG7t2e5OC5xVZtkMY3BQO8VxFD2zdTCPyqNeylRSvBVe99GdhRfJm4Aeu/jUYmxFwpdanxZ9xJ7ANLKKHuGWIQPIVAVrxsMKuoF0XP4Rq37C5NMnvzmOnTvsERNOVJzHhJHzYfyiyTxfRayH8etgmcMlXdEB8Pew8nrJkRKCwOa8We6wiWqgsiSZ97rhcTjZft0OJe8Ks5/pLm//4BX2Ph46FC5UEBG+YRpn8+8wefmTwH0HgD7XnSFaVTBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770781252; c=relaxed/relaxed;
	bh=B7DOpjMHcDmq5D3vVdYPupJ9INvt1gOBUArAP89WU/Y=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=Uah2F2EjNa1mroHolWKKjnOYVQNcxxkXziJINpdJtlO/acWUR+H5+L34r8GFZbHewfdSFNl4634gJL7K989bCpyselVoR1Hp6sNXgnjpnGyUjexUiLIXuJeQLoz6tQTvrWoO/+x6bTYDCEVpvszg2L/emcp5oBGqDSgIYKn90TO9U7KWp0/nlHqHzGkaXf2eLaEQH1kTCM1/gDhMFpFWSWEpv74hevHB0ZmQvpPyMPEA0FDhSP6nBBmPxtg6XqLXZyZMRvdTpPkCmSTLMdD6eduvJ6yD24+UzR38KfHe3Dq2wU6b2Fqc+TOO3i0EomoOo6+cOdScjX0rZLFUfKkzgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m91kbfvq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m91kbfvq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9kjb2mHmz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 14:40:50 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2aaf91bbcd9so18362395ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 19:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770781248; x=1771386048; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B7DOpjMHcDmq5D3vVdYPupJ9INvt1gOBUArAP89WU/Y=;
        b=m91kbfvqL9s9RhUbh84tXdqG4twJQa7MVIIEMdYwx28t0cfFwgoD3f/o3to+GCsf2S
         NsH1KKBHHzhviF0SawyjYSqMsEIG2SQBUvjRFk7izyz5Uy/LnOf1M8wIBnsKnXyatgeB
         8ghoIbP2oytci800xPjUExg7JaMExQPGxXDdf2v18D7Ha0FK9me5vX8x2Ao2UIZMViVj
         diq35DLrjdbh9M3gCNC+jRS2E8+XS7tz1gcw5Svl86AWe64gf6pAVUlwLtgCKNeC5jX4
         W5EaLArOt7kysxDb0mVM4AxBHP33WbiCQJmszFJQJNP/m6/lHxxAy/yPdxcUUGXhenGB
         pXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770781248; x=1771386048;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7DOpjMHcDmq5D3vVdYPupJ9INvt1gOBUArAP89WU/Y=;
        b=FT5/blqKzMHMGStTxcxXNhW0Vx9h6ZYOnOQ47oyUuYcmXmXVSivMGWz2Hq1E80Vlsr
         OdMpcnzPp7Kkgjnkdqc8uzgntGCt5MmR6gw5lqKmVpKLEFm2++KHpbUtTGSOEZjE9foB
         OJhIgIKT31wUXz70pVSE8ILOnQlz9EZ8ElsCRi31FxRcrO8MigO0rXjUQGebN2fCJ5tZ
         BPkLkJkwrbNHidWYfraG1wWNWCQ/V4QlesNv1IaNQp1kILLG2Q8XTkPC98WG1p4LX/GB
         0L1Z4vL+XHsKAqG2elOv0jpllQEUIp2YfXu1FzxQYUyW5QM7J6ppUIhuGq6WZUjxq8GE
         YZYA==
X-Forwarded-Encrypted: i=1; AJvYcCW9ZgCX13di/hMCxXPhnuO/LwczHf0pjTIVjjE11Kmn7fgu2y33qnKKAQ8fLShr9icFw/ncndg5tsE3R6E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzxVvz+/3Udi6xZlyoqYvvcFqPiqx2NIGZr5gngvcVL3mJRMoka
	mCjVm3fXyOslXZxGa8MlydJvDVdg9qxg0SYQIRKCrImLsEC4oqb/05fB
X-Gm-Gg: AZuq6aJ9DlX3pARVpkERlOXRBsHLRQvS25nNq3Fv4Cxl+aggxpyFW/4sY1bM1NsdMH9
	C8otR0e9GW03Msjbp+2MDcawSeNt8e+TCiGDF4yLy0RHsg9pVzGHFpUTiVoH6XLAzMxp+L7Em3P
	iP3NxpUeuAHXxVd3dydI27L2Hw++6kLr6UhPEB5N55P0owxzZiz44iKGndYhNy9NBsPbFWrmeF8
	DWt8C1SkfCPZPXidYtqXVRgUvyezkBMNzgIWojym7CQwpefDuvnVDdXsJ5RLKKAhZJOrqUBHMsu
	H5hgE7aT+6KwoB6ywFTAYPMsVeFqWa52tikJrzyrHB/OWx0DUbSdME+YJSn9haHe5JHzeku9NAb
	BwOd9+du+CD27IC5FLILohRQbqUSxfhU/344mQWeLdKJtdn9Wz3CyxUoToCzGymWq1FaoD/bR6V
	kcrw9En5JE2iPBMWA2x4tLdctEjn4=
X-Received: by 2002:a17:903:298e:b0:2aa:e7f3:faf9 with SMTP id d9443c01a7336-2ab27f37d22mr13647925ad.31.1770781248440;
        Tue, 10 Feb 2026 19:40:48 -0800 (PST)
Received: from dw-tp ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3bd3b2sm507040b3a.22.2026.02.10.19.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:40:47 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Shivang Upadhyay <shivangu@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/crash: sort crash memory ranges before preparing elfcorehdr
In-Reply-To: <20260210120803.433978-1-sourabhjain@linux.ibm.com>
Date: Wed, 11 Feb 2026 09:05:20 +0530
Message-ID: <875x840x6v.ritesh.list@gmail.com>
References: <20260210120803.433978-1-sourabhjain@linux.ibm.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sourabhjain@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:ruanjinjie@huawei.com,m:hbathini@linux.ibm.com,m:maddy@linux.ibm.com,m:mahesh@linux.ibm.com,m:mpe@ellerman.id.au,m:shivangu@linux.ibm.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16793-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,ellerman.id.au:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 96180121094
X-Rspamd-Action: no action

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> During a memory hot-remove event, the elfcorehdr is rebuilt to exclude
> the removed memory. While updating the crash memory ranges for this
> operation, the crash memory ranges array can become unsorted. This
> happens because remove_mem_range() may split a memory range into two
> parts and append the higher-address part as a separate range at the end
> of the array.
>
> So far, no issues have been observed due to the unsorted crash memory
> ranges. However, this could lead to problems once crash memory range
> removal is handled by generic code, as introduced in the upcoming
> patches in this series.

Do you have the link of the discussion, to where you have pointed about,
what sort of problems this unsorted memory ranges might bring up with
the new patch series?


>
> Currently, powerpc uses a platform-specific function,
> remove_mem_range(), to exclude hot-removed memory from the crash memory
> ranges. This function performs the same task as the generic
> crash_exclude_mem_range() in crash_core.c. The generic helper also
> ensures that the crash memory ranges remain sorted. So remove the
> redundant powerpc-specific implementation and instead call
> crash_exclude_mem_range_guarded() (which internally calls
> crash_exclude_mem_range()) to exclude the hot-removed memory ranges.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>
> Requesting this patch to part of the below patch series.
> https://lore.kernel.org/all/20260209095931.2813152-1-ruanjinjie@huawei.com/
>
> ---
>  arch/powerpc/include/asm/kexec_ranges.h |  4 +-
>  arch/powerpc/kexec/crash.c              |  5 +-
>  arch/powerpc/kexec/ranges.c             | 87 +------------------------
>  3 files changed, 7 insertions(+), 89 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
> index 14055896cbcb..ad95e3792d10 100644
> --- a/arch/powerpc/include/asm/kexec_ranges.h
> +++ b/arch/powerpc/include/asm/kexec_ranges.h
> @@ -7,7 +7,9 @@
>  void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
>  struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
>  int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
> -int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
> +int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
> +				    unsigned long long mstart,
> +				    unsigned long long mend);
>  int get_exclude_memory_ranges(struct crash_mem **mem_ranges);
>  int get_reserved_memory_ranges(struct crash_mem **mem_ranges);
>  int get_crash_memory_ranges(struct crash_mem **mem_ranges);
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index a325c1c02f96..31462e8415ff 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -431,7 +431,7 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
>  	struct crash_mem *cmem = NULL;
>  	struct kexec_segment *ksegment;
>  	void *ptr, *mem, *elfbuf = NULL;
> -	unsigned long elfsz, memsz, base_addr, size;
> +	unsigned long elfsz, memsz, base_addr, size, end;
>  
>  	ksegment = &image->segment[image->elfcorehdr_index];
>  	mem = (void *) ksegment->mem;
> @@ -450,7 +450,8 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
>  	if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
>  		base_addr = PFN_PHYS(mn->start_pfn);
>  		size = mn->nr_pages * PAGE_SIZE;
> -		ret = remove_mem_range(&cmem, base_addr, size);
> +		end = base_addr - size - 1;


end should be "base_addr + size - 1", isn't it?


> +		ret = crash_exclude_mem_range_guarded(&cmem, base_addr, end);
>  		if (ret) {
>  			pr_err("Failed to remove hot-unplugged memory from crash memory ranges\n");
>  			goto out;

-ritesh

