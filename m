Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6526726C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 06:40:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tjMW0NkQzDq7c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 14:40:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QS7Cijxu"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tcts6kJyzDqM1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 11:18:59 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id ay6so21314890plb.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 18:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=VLY6zNgao+urRQCywoCPsLTvrsiBRXb1QM/KtCiYO18=;
 b=QS7CijxuRLbpK5ZYiw2eOWAfiP0GCY4DPnUPxEeNe5+hZum3spVQO40KfuJ+8EUm9n
 /0xNnEdHz7aOrdWbLa6U7wOziXLXEAQqDigkmgramEKlj7w6tSQu2lRRpy72bUATq1O3
 9NRFefVtdlQuK2I7ko/lYg4al5zPC/oDBlyeI57WdisEru1DuklS1pTx8lPloVso+8+Z
 9noK+j8X9AiFM6JAT8oQXBFd++NBrNT1/sUK6H0HbAd0W6wPOQQMPjTmZBmp9Kg7UCzY
 pzqzTr4pf2L87ab9s5LLYohZ8hb+nH2x0SsPn6GIBxMcUKr1UgEeEP/ON3aRmYt4Y3tA
 RWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=VLY6zNgao+urRQCywoCPsLTvrsiBRXb1QM/KtCiYO18=;
 b=bBZwYsN0el2E9/WjtpEP4C7xtReKLhAZrrNvjqwX5XzR1F5Un4a80LkLQ9r75rqbyX
 CMThoxNIvaG/hr+TeV8LeN7/fVkv67d43hImTaOD41unbhdTSNLkgU3JrkY3/cANKl3x
 0716ThWe/BdNYw+67AnIe1TOrYPHOztDbV1lCLstqMUiavQa01O7pws0fGikBnmE+ZM4
 nNvlnif/2WZ+XTisqdIww/Hfyw7Evsxr3vpNlXWCTJtHIWwfodIWlHnaYLQiTiRJRV2F
 peGqgbcPveAWcpSN8qEoGBds/ZACMgM200I3zM7rH5LRIFicE2qbVLgbbp+sQdiXShJk
 Yemg==
X-Gm-Message-State: APjAAAWQyREECPOZXxuaTnudZ1O7IOBoJvi3FWn0tYn5kjdUdJkbL8Pg
 /1GjMzsItwC2ZH6ZzuONlD1Q+WMvKXk=
X-Google-Smtp-Source: APXvYqxjzRJ06BYLxqUpQxAMq67UQfe19PLKBJb/C/9wrm+lQSlbb1tlEU4ngxw9NQSq521d/mn2mw==
X-Received: by 2002:a17:902:ba8b:: with SMTP id
 k11mr83032876pls.107.1563931136663; 
 Tue, 23 Jul 2019 18:18:56 -0700 (PDT)
Received: from localhost ([220.240.251.33])
 by smtp.gmail.com with ESMTPSA id f15sm51452537pje.17.2019.07.23.18.18.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 18:18:55 -0700 (PDT)
Date: Wed, 24 Jul 2019 11:18:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 1/4] powerpc/64s/radix: Fix memory hotplug section
 page table creation
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20190722174700.11483-1-npiggin@gmail.com>
 <20190722174700.11483-2-npiggin@gmail.com>
 <87tvbd58fo.fsf@concordia.ellerman.id.au>
In-Reply-To: <87tvbd58fo.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1563930677.kqx4l5hxsv.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman's on July 23, 2019 8:52 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> create_physical_mapping expects physical addresses, but creating and
>> splitting these mappings after boot is supplying virtual (effective)
>> addresses. This can be hit by booting with limited memory then probing
>> new physical memory sections.
>>
>> Cc: Reza Arbab <arbab@linux.vnet.ibm.com>
>> Fixes: 6cc27341b21a8 ("powerpc/mm: add radix__create_section_mapping()")
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> This is not catastrophic because create_physical_mapping() just uses
> start/end to construct virtual addresses anyway, and __va(__va(x)) =3D=3D=
 __va(x) ?

A bit more subtle, it calls __map_kernel_page with the pa as well.
pfn_pte ends up masking the top 0xc bits out with PTE_RPN_MASK,
which is what saves us.

Hmm, so we really should also have a VM_BUG_ON in pfn_pte if it's
given a pfn with the top PAGE_SHIFT bit or PTE_RPN_MASK bits set.
I'll add that as a patch 5.
=20
> Although we do pass those through as region_start/end which then go to
> memblock_alloc_try_nid(). But I guess that doesn't happen after boot,
> which is the case you're talking about.
>=20
> So I think looks good, change log could use a bit more detail though :)

Thanks for taking a look. I'll resend after a bit more testing and
some changelog improvement.

Thanks,
Nick
=
