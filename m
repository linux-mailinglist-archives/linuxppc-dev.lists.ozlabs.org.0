Return-Path: <linuxppc-dev+bounces-1454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F22A97C43B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 08:23:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8QSN4dmtz2y8R;
	Thu, 19 Sep 2024 16:23:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726726996;
	cv=none; b=EspmJ3VkiMw9SQ09A7ldurw1MYSP6f+aNi2Y/0y1Q6SPORy9EP/MigIfXDKCupOK2IGE3ULMsIWUgx/EJyy5wRmEFTMoXLnPgS1JM7KzQ8Tadz3KDaXRMXwCq74ddWH4cB2LY3Ia+DTa0sNhPiRO7VBqaOkkT88+SDrCgRoMIj48zgZuIJpqpqSlyKsqDjD+2220cQyZyJ9Ag46w4kWkCyto9EtY21IT6pbEtFqXPeTTCQfVo3iLeoPekDhFkM3mZt2bPgu1MJdyk29P6irNXBMXK4Rz+Dd6eujadrjCwdv9JCwmDLx4mA5xide1TN9rr3dTewakHYH+uaGTWKpPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726726996; c=relaxed/relaxed;
	bh=lMB28cCoh+EtgWHGA1hGa1Xqf23n12o3JH476WnchVA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=chVkoly2O/e993YcUNsKraszA03fedyuBEI7sg6y2NKoylH07Hva8Y7RJT8gqvuNveHZySoVO8TxlWLyggQQZ4dadGlA2D9Jht5uF1irpmWJ9VJ8sC9VVX1037w5b19iOPsVlTTuC4NUAVN37DLj0H/0XVZoCFpf2rruzDipDvZ8LoRBUkxx7dKStNHyeWMj5pqbrtoSBx9p1czH1IH7tnlPfKGD5GuJHkEOz0YeSX/wMlds5wXed/LzrJDOZ2a3A31lZ3LQVzyj/wIwp3AGHDy7ciXJYfAfpbbD3zhJuF+mc15p07/artIpCJyPPHhLfCNZXC1pl0ne3idYAxumkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P0wS2Xzu; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P0wS2Xzu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8QSM5Z42z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 16:23:15 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2068a7c9286so5681595ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 23:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726726990; x=1727331790; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMB28cCoh+EtgWHGA1hGa1Xqf23n12o3JH476WnchVA=;
        b=P0wS2Xzu815KfhV8q/J5cEvRh+NHUJa9ucBnCrc+4qUqCJSUJX7AsAgNJddQ8szGz1
         CJRYzWdaxoR3Qpq2pxOCuUuSlZC1syMK7OQEVycQThDczoAZ9LAlel6oB4ROTRgmI+2M
         Jw8x49SC+IFo8zEr/ZxWAS/LXPjFOX7bDJ1ThZ8502qIiUh3l9tkM7BLoOHCccIZ1NsJ
         23Z0kfbxmMxvcINQ0plklV3HikGGjQn1iqQoArI0q40bIU0s41ojkCUcatN1n0ApYA02
         tmrC8eX4Sw+Rd3X0KPqKXcuxfnL5k0Re3rbJDRJD0Bi8aEOanDmQuJ8DOTZC+dWvaRAI
         6qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726726990; x=1727331790;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMB28cCoh+EtgWHGA1hGa1Xqf23n12o3JH476WnchVA=;
        b=QSyj4B2ltLHIBF880WHCKzzFyBXvMUC5Y8hLhuPm0iH2uLANoUrNUS4rspkfs0EZvi
         pQD0OMD5Cksp4wq4ZUy2Qp7HVGWwyuGYa8UasZFdELrxZZRmC/PTzNExYSdhjrRfiHCf
         orcooUuIPlcggmYFdaj3bfUSkeG5Cb22T2XeAN1EaGmpsu6m/8My2hZnFomZyKpPNuJg
         +b6K2/VcOz/nJS9Xr/sZuahthMMPCsHo7H57b3hIq+NH0o17AIwxHboVWN2vMFTvExpm
         IF+7qBR/ik+s2hDnqmWaL7o4TkQ/Be0Jsx3Rq7FkvRc9TwKheHXYwcjFm3ccO6uV8kut
         VMJg==
X-Forwarded-Encrypted: i=1; AJvYcCXe5lS9XcK61Lg1bc9L8SoaXc84Dqx1zranOYTGHv0SaVAnxx8nud86jZevu0QBkbP8JUVuZoXCT0o/cFg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxgwrPVd7ir+R2Ksiq6+xs9Fl/Og1f/tYZUeSCt34igsc+DYwni
	YTYadEcxccXTRnMU4XErEMvqGWKQydiu8Zt9RN3G0pYC3F907dXV
X-Google-Smtp-Source: AGHT+IFU4vkqxFNSe4Eq83apMu7w+OxEO+qEiDjIV8fsRkhk1oJexJP9mvnlYzqaic6d160YK6bbqQ==
X-Received: by 2002:a17:902:e84a:b0:1fb:57e7:5bb4 with SMTP id d9443c01a7336-20782a69aa5mr302633235ad.37.1726726990257;
        Wed, 18 Sep 2024 23:23:10 -0700 (PDT)
Received: from dw-tp ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946fcad2sm73406885ad.211.2024.09.18.23.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 23:23:09 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, 
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.vnet.ibm.com>, Pavithra Prakash <pavrampu@linux.vnet.ibm.com>, Nirjhar Roy <nirjhar@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, kasan-dev@googlegroups.com, Disha Goel <disgoel@linux.ibm.com>, Alexander Potapenko <glider@google.com>
Subject: Re: [RFC v2 02/13] powerpc: mm: Fix kfence page fault reporting
In-Reply-To: <65664ab8-4250-47c2-be50-d56c112a17fb@csgroup.eu>
Date: Thu, 19 Sep 2024 11:17:16 +0530
Message-ID: <87ldzotct7.fsf@gmail.com>
References: <cover.1726571179.git.ritesh.list@gmail.com> <87095ffca1e3b932c495942defc598907bf955f6.1726571179.git.ritesh.list@gmail.com> <65664ab8-4250-47c2-be50-d56c112a17fb@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 19/09/2024 à 04:56, Ritesh Harjani (IBM) a écrit :
>> copy_from_kernel_nofault() can be called when doing read of /proc/kcore.
>> /proc/kcore can have some unmapped kfence objects which when read via
>> copy_from_kernel_nofault() can cause page faults. Since *_nofault()
>> functions define their own fixup table for handling fault, use that
>> instead of asking kfence to handle such faults.
>> 
>> Hence we search the exception tables for the nip which generated the
>> fault. If there is an entry then we let the fixup table handler handle the
>> page fault by returning an error from within ___do_page_fault().
>
> Searching the exception table is a heavy operation and all has been done 
> in the past to minimise the number of times it is called, see for 
> instance commit cbd7e6ca0210 ("powerpc/fault: Avoid heavy 
> search_exception_tables() verification")

This should not cause latency in user page fault paths. We call
search_exception_tables() only when there is a page fault for kernel
address (which isn't that common right) which otherwise kfence will handle.

>
> Also, by trying to hide false positives you also hide real ones. For 

I believe these should be false negatives. If kernel functions provides an
exception table to handle such a fault, then shouldn't it be handled via
fixup table provided rather then via kfence?

> instance if csum_partial_copy_generic() is using a kfence protected 
> area, it will now go undetected.

I can go and look into usages of csum_partial_copy_generic(). But can
you please expand more here on what you meant? 

... so if a fault occurs for above case, this patch will just let the
fixup table handle that fault rather than kfence reporting it and
returning 0.


The issue we see here is when unmapped kfence addresses get accessed via
*_nofault() variants which causes kfence to report a false negative
(this happens when we use read /proc/kcore or tools like perf read that)

This is because as per my understanding copy_from_kernel_nofault()
should return -EFAULT from it's fixup table if a fault occurs...
whereas with kfence it will report the warning and will return 0 after
kfence handled the fault.

I see other archs too calling fixup_table() in their fault handling
routine before allowing kfence to handle the fault. 

>
> IIUC, here your problem is limited to copy_from_kernel_nofault(). You 
> should handle the root cause, not its effects. For that, you could 
> perform additional verifications in copy_from_kernel_nofault_allowed().

Sorry, why make copy_from_kernel_nofault() as a special case for powerpc?
I don't see any other arch making copy_from_kernel_nofault() as a
special case. Shouldn't Kernel faults be handled via fixup_table(), if
it is supplied, before kfence handling it?
(maybe I am missing something)


-ritesh

