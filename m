Return-Path: <linuxppc-dev+bounces-13644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA7AC24ADF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 12:04:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cydQz4ZnBz2xnh;
	Fri, 31 Oct 2025 22:04:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761908667;
	cv=none; b=TQSkFyk0SSMT8qd4AiNqphWm1R+1WS9/xcTUO9Op7ZhuTywQZk0TeqBF+g1n2EN0f7RA8Fr39MvbUhlOlsjyKNJK178uY56aFAwQz8FC0dfp9WmI+HQdtmAR8lW0JfxpHXfgiCKxb1bLIXiX/Zlx04HNAzVWJ/JDMRz0RYUHVVkX3OuJIuFODemBVUQP6CSg7ut4zQT4RZ6nO5ZQKNdRZrknbFA0FMZOB4qT4+Ava2fu7YWO93E0unkOXgfQCXHAYGWIAKIFPBb4oe1wd4toHdXPFzHVwxyDx7VoI1hf0Z2qcIqmA+UZ/xwUJOpTkCG2vrI7mTtC1G6M07WVGnHamA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761908667; c=relaxed/relaxed;
	bh=htPoc3I82i1LGjzj+uG5Lg6XVID7SZQAimFmMTgIOQ4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=ePjJUtNuMWGsDfkyfZjPSue4Y/iSvVdPsu/pUWJdWtMMPs7CDHTl1i4AVVVgzw5Us2PIXUOiwX/gcSWefqmoi9QjqziYFqsHhmM0quUVjHk2dJ7hYPMjLA9rGc35v2jLTyIISbvWYkZZYeE7x8G3l+jSrGdTlYufC8QvtpBQ6FW5DZFSuitvGdu7HiP6BhOsugi5eIIe+ZHy3Nxoul/sG0OtXuK3dANoz0YLyhfrmqecq4cv9sy2U81v9938A4MJbtZVH9yENHFzMCKcE3j1T/xj8TequVefDCrWdjYIa8RDctx45VHhymkcjQGM3qZ9WhXNp77z28D9AdOIF2ZSOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DBZxHut6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DBZxHut6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cydQy246pz2xR2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 22:04:25 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-292fd52d527so22206595ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 04:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761908662; x=1762513462; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=htPoc3I82i1LGjzj+uG5Lg6XVID7SZQAimFmMTgIOQ4=;
        b=DBZxHut63qfKjtI6iz0rjgjn4ZJm0GGwQ0TEnUPA1JmzkuUY6ET0U4tVjqbBTZMNVY
         k8id+YvnGfGCngoCNPKS+jTS1gykPK/xcaqwvkVwrxueVoxNYLpPqPGyxbJfQdBMvxIV
         6YgA3FIHzBHe/hB+4RbWuQCcH7lqfjMVBEW5HUHs4pDvh5voOvso2TAlZjjRtakBlliD
         2cU9RLu9O3aCyFqgimgdDMzfx7LsRgtSVFswqQcg7ZFX7HBTnmnrFKUw0xbBoGgNNMPo
         tqWK/H5yREAzrpj3McFXGoClQvMl4vC3iqWtX5puO/DMirZPTrTHJdXBx9N6cp8oXi1x
         9Kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761908662; x=1762513462;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=htPoc3I82i1LGjzj+uG5Lg6XVID7SZQAimFmMTgIOQ4=;
        b=IAtrInBSBfWXvzx8XuYmyePj7N5Y5O2dQhlpLujvlhANJC9kdsmUzUGPtnqhoRjunN
         8usJtmoL94WJFE/nEHzlOb3cH418x9HGa2vLgPTmMX5bNuGN2P6oAeTqc8l9/es7uKhl
         h5EenoPRAucjPkMIUnznfq7pM6ho2xB+rsN04Zc3qLmkhM9b7vtI7xpNaFdG1ACeP/Lj
         J/QJSotuv/shBLVKITyMwVXgh2TCxF7gNH+talA/iyBF/VTgts+fP+rfRqZ/J3RsvLog
         d/5FunUs+qPLVCfWyxiF/lEtszFlZy2ktXGZTtl8FYIFP5XdG+jZYROW1y8W2So6OMMn
         otUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfp/CxU2lqJfwzTgZZjrtyBbKBgni0ejkhw4+sgk0jq5BLBhVpHIFN2+F4P4Iaq2rGO/5E2FmxhKgZBZw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+MNXOn72S/y00NGU9ZjloUFi+lIt/httVvfLNX8ZmnPQMhxcl
	JfhG+hxr9Hk5qHXiYmtzRKVSACSubaZxSoRxlikEdZjrZPxriUW4AWy7
X-Gm-Gg: ASbGncts8v+Zp6qwrv3gpW6Z0OXlWY4YpExTVXmamDX6Kgzy+s1kcsrW0OK9KWL3/aR
	qpthpZvzNy6YXf4f3Y4q6FB+92f2jOvQIUdI9gtP3kLkF76sHh6zoTWUfjGAED2TiDzcPb5Ypug
	CKorUCIasrHsdAU/KDKqW8H07zPrWKfjKOvbrKfIdhlEFzO5AWjjKAiQLrMFRbITxKzlki+o856
	wQYaqI+FfCvoHZexoDQ8KddUHOw2WcF+dgLh/P4KPMHO5VJ79fW/+XQkmyh4qKX4VmS3fwLL4dT
	nVSzbXQ3a8vSd3VOHl5atfOReNK7kgpnzff+cXFq92dcxfTAj6OF6J728O1jGemkthvkkPZCn6V
	AyJGJ0bRR515BBwp02u7Ppy1bChPIrECoi78gOH/eNL+vTOYZPqcqP8wrF7Ty3xeg0SeHBQUAmV
	BslGja
X-Google-Smtp-Source: AGHT+IFITmAbxbh+8GunJ2bzmuuY2hrsfnYGWjpi/NwgdROKHgByq06eCbdKVuIS3vTNNJ8JXa3uFg==
X-Received: by 2002:a17:903:37cd:b0:273:3f62:6eca with SMTP id d9443c01a7336-2951a3eac4emr48404645ad.18.1761908661524;
        Fri, 31 Oct 2025 04:04:21 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952696f277sm19600195ad.55.2025.10.31.04.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:04:20 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: Re: [PATCH v4] powerpc/kdump: Add support for crashkernel CMA reservation
In-Reply-To: <c6ce9b94-1126-49fd-869b-76a7e386a7d1@linux.ibm.com>
Date: Fri, 31 Oct 2025 16:31:41 +0530
Message-ID: <87ldkr72sq.ritesh.list@gmail.com>
References: <20251030100955.1453314-1-sourabhjain@linux.ibm.com> <87o6pn7mfp.ritesh.list@gmail.com> <c6ce9b94-1126-49fd-869b-76a7e386a7d1@linux.ibm.com>
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

> Hi Ritesh,
>
> On 31/10/25 09:27, Ritesh Harjani (IBM) wrote:
>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>
>>> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
>>> crashkernel= command line option") and commit ab475510e042 ("kdump:
>>> implement reserve_crashkernel_cma") added CMA support for kdump
>>> crashkernel reservation.
>>>
>>> Extend crashkernel CMA reservation support to powerpc.
>>>
>>> The following changes are made to enable CMA reservation on powerpc:
>>>
>>> - Parse and obtain the CMA reservation size along with other crashkernel
>>>    parameters
>>> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump
>>> - Include the CMA-reserved ranges in the usable memory ranges for the
>>>    kdump kernel to use.
>>> - Exclude the CMA-reserved ranges from the crash kernel memory to
>>>    prevent them from being exported through /proc/vmcore.
>>>
>>> With the introduction of the CMA crashkernel regions,
>>> crash_exclude_mem_range() needs to be called multiple times to exclude
>>> both crashk_res and crashk_cma_ranges from the crash memory ranges. To
>>> avoid repetitive logic for validating mem_ranges size and handling
>>> reallocation when required, this functionality is moved to a new wrapper
>>> function crash_exclude_mem_range_guarded().
>>>
>>> To ensure proper CMA reservation, reserve_crashkernel_cma() is called
>>> after pageblock_order is initialized.
>>>
>>> Cc: Baoquan he <bhe@redhat.com>
>>> Cc: Jiri Bohac <jbohac@suse.cz>
>>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
>>> Cc: linuxppc-dev@lists.ozlabs.org
>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> ---
>>> Changlog:
>>>
>>> v3 -> v4
>>>   - Removed repeated initialization to tmem in
>>>     crash_exclude_mem_range_guarded()
>>>   - Call crash_exclude_mem_range() with right crashk ranges
>>>
>>> ---
>>>   arch/powerpc/include/asm/kexec.h   |  2 ++
>>>   arch/powerpc/kernel/setup-common.c |  4 ++-
>>>   arch/powerpc/kexec/core.c          | 10 ++++++-
>>>   arch/powerpc/kexec/ranges.c        | 43 ++++++++++++++++++++++--------
>>>   4 files changed, 46 insertions(+), 13 deletions(-)
>>
>> I am not much familiar with the crash kernel workings but was curious
>> about the following query related to this patch:
>>
>> As I understand this patch allows for the remaining crash kernel
>> memory to come from CMA region. But do we limit the CMA region to be lower
>> than 4G?
>
> No we are not and we don't need to.
>
>> Is this patch dependent over your other patch series [1] which
>> supports high crashkernel reservation?
>>
>> [1]: https://lore.kernel.org/linuxppc-dev/20251027151338.819957-1-sourabhjain@linux.ibm.com/
>
> No, this is an independent patch.
>

Say, if we are in Hash mode and if the CMA reservations have come from
higher addresses. Will that work with kdump kernel when it boots with Hash
mmu? Because memory region beyond RMA is not accessible in Hash correct?

-ritesh

>>
>>
>> A minor comment: I guess we could reflect the support for ,cma for PPC
>> too in Documentation/admin-guide/kernel-parameters.txt like how it is
>> done for x86.
>
> Yes we should. I will make the change in the next version.
>
> Thanks for the review.
>
> - Sourabh Jain

