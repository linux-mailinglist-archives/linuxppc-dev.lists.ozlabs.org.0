Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 66C418D4112
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 00:06:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=u7jqO97t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqNc80DVWz882P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 08:00:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=u7jqO97t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3xkvxzgykdd8tfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqNbP4j8kz87lK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 07:59:59 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-701b7ef17fcso265973b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 15:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717019997; x=1717624797; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VygQSYtgJkxGCNbSiB1TmlrjiVcPo9FASZn5iwrGyKo=;
        b=u7jqO97towFbOD4HG5OjSrKRMYUGAmWhCuOdZcHDPVbRvbk57Dg1s3/dspGkNKB+Mq
         1u90s2szotAo3zR6U/1CYxQ6H22viYZEPUyuAUQ99MUfrW+k+2ZoQdI0NhLhE/HUEkzR
         oHLP7g0jt64UH0clfv7Xcp6pURSzkMzerV0pQ0XTTZ0H2ED7rSLWT4OEdjEBpSZUS+4v
         frFnA4B7qfl7Jeu6bFAregfXQ9SPksZ36Gyu0hsI6IirmKYtfzDYnvQCcgmTZ2I0ahjQ
         LtCr0ta5swTFb2CrzsdMURR2QVC7xZjXWO8iUbyVWztY6zS+5LBYTBmYDyejQk8PGzff
         V0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717019997; x=1717624797;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VygQSYtgJkxGCNbSiB1TmlrjiVcPo9FASZn5iwrGyKo=;
        b=F9h/Yar4bTXRUh5YYAaXZHPYO8jq0EeGOVrC1ZQxwPMP4UL47XZK1B1UVKPcSr1XZ5
         Uomi2F4IuMhaAW6x8aS+2umUvUreXT6ITxxYYw3fyNp32Wuh6CyJ+jbwgrPDeJuae4Y7
         ZvzYtMYa7++2GZETIX96Z+iFqisw37T0QItRPHEHtpqUFwzWbNuL+e0clRTjZFkKPL5x
         sYnTD2jaOAWlryLH37IP008902zXmXuDSUvSsPzRCxYeJy/cBhSIzRTm0TUn9umpuJRy
         nYem6GePOOnHSSXQ96SLIulItnbXf+VYZaMAU7o+xbmBirU7sLbn17cGR8KzL3YTL+k3
         7BCA==
X-Forwarded-Encrypted: i=1; AJvYcCXp4k9xthmoEOBxcj4RVtach5M/kjcK3fu2gKgtiW48tM3XqsOuSHUTQxV99y+V+SaDPOhid6hWjuPGjpJf8DHX0H5cjWe6pudLqLV2OQ==
X-Gm-Message-State: AOJu0YzdHCarahAN6LY9c4ZNW8Xs5IZN/ab8lPTqvtTDJkKyCby83wsH
	mmJc0KKuSuLbX8hy6DIEo51+gHhJq50YuV5tYUwx+EY9OQxDKcwLK8udpKL2NUGz151UYnJX35T
	5Sg==
X-Google-Smtp-Source: AGHT+IErfD3/6U7Yg0vFWmN+JznLDOE9vgR2lO1JhTGk52Ll6iOJE5uAx2O1dqENYjCcQTLMPcB8oRdC9wY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8607:b0:702:1e25:a47c with SMTP id
 d2e1a72fcca58-70231a8676amr343b3a.1.1717019996755; Wed, 29 May 2024 14:59:56
 -0700 (PDT)
Date: Wed, 29 May 2024 14:59:55 -0700
In-Reply-To: <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
Message-ID: <ZlelW93_T6P-ZuSZ@google.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
From: Sean Christopherson <seanjc@google.com>
To: Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.com>, Palmer Dabbelt <palmer@
 dabbelt.com>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Ankit Agrawal <ankita@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2024, Yu Zhao wrote:
> On Wed, May 29, 2024 at 12:05=E2=80=AFPM James Houghton <jthoughton@googl=
e.com> wrote:
> >
> > Secondary MMUs are currently consulted for access/age information at
> > eviction time, but before then, we don't get accurate age information.
> > That is, pages that are mostly accessed through a secondary MMU (like
> > guest memory, used by KVM) will always just proceed down to the oldest
> > generation, and then at eviction time, if KVM reports the page to be
> > young, the page will be activated/promoted back to the youngest
> > generation.
>=20
> Correct, and as I explained offline, this is the only reasonable
> behavior if we can't locklessly walk secondary MMUs.
>=20
> Just for the record, the (crude) analogy I used was:
> Imagine a large room with many bills ($1, $5, $10, ...) on the floor,
> but you are only allowed to pick up 10 of them (and put them in your
> pocket). A smart move would be to survey the room *first and then*
> pick up the largest ones. But if you are carrying a 500 lbs backpack,
> you would just want to pick up whichever that's in front of you rather
> than walk the entire room.
>=20
> MGLRU should only scan (or lookaround) secondary MMUs if it can be
> done lockless. Otherwise, it should just fall back to the existing
> approach, which existed in previous versions but is removed in this
> version.

IIUC, by "existing approach" you mean completely ignore secondary MMUs that=
 don't
implement a lockless walk?
