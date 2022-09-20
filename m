Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC8D5BDAF0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 05:40:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWnPT2KJZz30hw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 13:40:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a1adS1EC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a1adS1EC;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWnNv20yrz2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 13:39:57 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id e18so1988026edj.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 20:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=G999qRJ3ZYDAwyPJfqHMd90vcXhx8IHao6Ql7QiFPDQ=;
        b=a1adS1ECR642XvCjjjLjLzQ6JfBYYWC6Zjk4Ayb0GPq1HNHS6cqyiHrOVDg6U66sl0
         oRwS5IaWQZ+A5oOC1m7PxvHbKpXhbG7+ITj7+GYBrhpBh9xKw8vK67u8q6EX1Xki8DUo
         CDP74oWnx9ZaM60n/aZKsxAgdaJUVTWMaF9yFWNxcQkdtfYRxgwyEspizTHzaFbOCzgV
         ow1iuQ8bKgJYPcLGUqqzxM7BgkoIsKCZhQGQhb9cCsywveib9s1aSgybsdN2E41GWeXS
         rALuCfC8AzbIeVWaRYMIHWZdHmEgrfViS3GY5sZGLUldXsqTqQIWHrw+E1895ArI8ghu
         cFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=G999qRJ3ZYDAwyPJfqHMd90vcXhx8IHao6Ql7QiFPDQ=;
        b=Z+JwjSVEHkK8+IBAadynyq8t4TVtjU9Wvu07s/N2k9KgBDT4aXoM2p4fymMbSTfnny
         OUsZ4xtTeG/NB5YsSU3WUdJZCLNDGCAmxhYKrOtZ8CEaHRd73/8O0HoJyNpqpwKc7jCb
         9RVshozykiz+pv0B8xQhuPPVzriTMStoVqMwXT1e9NQb3lI3m+VQ5XFpaynUXvxYDwjS
         osbgLb7xS0j3c01xlDfaDewgUAbBHrx6A0VTEiMb+nubDdvvp9YYDGOtZzbYU69Ni8PF
         smSOoWEUq/0F/MurJKb09wl8AsKyZiP8ICH3TSb4lOdxcoPXIECJ1m+QNI0FpldUZtG2
         jCUg==
X-Gm-Message-State: ACrzQf1xOlI/GcjAE0FOoCdmkXoGZdVZab7/ZKXZLiRVzOcUvOvshwtB
	tE1ISihbBS9Ob0gRMYhZ2xpU+is4BzznayaT2Qw=
X-Google-Smtp-Source: AMsMyM6UiGVnTD/J8ryFZQsJHTbdkIhpQZQxOdBwdC1toRqikXsXkHg47dV0ojfdIgLd8MUR/GxUavW0TPpgHSHF44M=
X-Received: by 2002:aa7:cb87:0:b0:43b:e650:6036 with SMTP id
 r7-20020aa7cb87000000b0043be6506036mr18386887edt.350.1663645189918; Mon, 19
 Sep 2022 20:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220822082120.8347-1-yangyicong@huawei.com> <20220822082120.8347-5-yangyicong@huawei.com>
 <302febae-508c-d73e-8676-d51752946645@arm.com>
In-Reply-To: <302febae-508c-d73e-8676-d51752946645@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 20 Sep 2022 15:39:38 +1200
Message-ID: <CAGsJ_4ywwFJFi+q3Ra5UE3twzS9eExtvuXgoGK-8u4c1ZdXCBw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Anshuman Khandual <anshuman.khandual@arm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 20, 2022 at 3:00 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
> On 8/22/22 13:51, Yicong Yang wrote:
> > +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> > +{
> > +     return true;
> > +}
>
> This needs to be conditional on systems, where there will be performance
> improvements, and should not just be enabled all the time on all systems.
> num_online_cpus() > X, which does not hold any cpu hotplug lock would be
> a good metric ?

for a small system, i don't see how this patch will help, e.g. cpus <= 4;
so we can actually disable tlb-batch on small systems.
just need to check if we will have any race condition since hotplug will
make the condition true and false dynamically.

Thanks
Barry
