Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id BA6228D401A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 23:11:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qtqe9sx0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqMMc4FrZz7BD5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 07:04:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qtqe9sx0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqMLr0NZ9z79BT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 07:04:03 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-420107286ecso21645e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 14:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717016640; x=1717621440; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCBSe826+nKw2daLQ4TIlXiD2I054RSipXGDwuLppXE=;
        b=qtqe9sx03j3kgjYsRomeZo0o2QY0EKZsZOP5Y3EJUCduJJq3wqWLkHMKmWlv3M0UwG
         5QCWSpZS2/6g6ErfNPBDMc6S1rySMbh+GeUhWHfQ+JfMCDRt2cKL0hqyDXLQHFjUZ7BC
         LgEZY+VZX1fhlZJAyUATXQdnIVq8SzQN/SlwXmaexJLQf2QHTj8AbP9ZCd/4Fc7fnQbm
         lCRHvbcgjORhvaxmIBnj1SAO+fHn59sM+st13JylYcGPP0LatMSKDhL/bBIuOhlJ0B/+
         6CXOaVadbFSGlZMa9ULFGPJsnWNo5ViKpWJVCXQ7vQnxyjWucaFnD5Q7kReDSlGxZGry
         aq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717016640; x=1717621440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCBSe826+nKw2daLQ4TIlXiD2I054RSipXGDwuLppXE=;
        b=aX2Khg8dkd2NGKyV19iICM91CwzGlyYOTWnKaO56pzxZ1lEbYiKeQy6u1g5uAc/hf+
         QoOJwYnIHS8YrVnWVuDFVbn3YLAEQEDD64YuRUVeGssEdoNu3SWcgvW6vat5AomH+ZQI
         VZlS7yn1ISwMRpUQU0nYF3pmuJw8dVLfIBuj51WIzOphhUGGaG0FJOApo1tHkWa8p8PC
         CaFHzWg0FoKWOK1hCUgHzeWPHVlrr4JMqVLnJyu6Pb1fwaRwFZql66xYriIKAjaVqqpG
         UbSdB48+WVS0REY0AxxcnyE/LaZ4ETmPYFcK3YBVwiwsB0Xr8hNShjl/lb6if17RzBPh
         pV1A==
X-Forwarded-Encrypted: i=1; AJvYcCXjDhDgryCUJPeh1ol1AV4rVgL+q+/q+eYtqow4kWk4S2xj/74SwLEpBtcD33T0foN0TyYGGsEevl5arqx4AStqXzYKmKIVhcwGvwyhVg==
X-Gm-Message-State: AOJu0Yx2+2dPg+mCEaTJsAnk8Q5uoQwpJu0fEUOqfv/wtt7mBG9rTyko
	xV7xzSmK86cCDoFnFU0kdnxR+BbZf2qwtKtepJ2Kcm+u+f5/gnOcKKC0svcPR72R/W524twnG8R
	TEZpMvJR/rVpwJ7Q7AadQrpA3Rp0rLBbg6r9k
X-Google-Smtp-Source: AGHT+IHwVBgFo5das5shZb/z5hgC8KCkV+Jkj5w99z9LyfmWhmSM4ldtkdm2dxotNGGlvICz4N/Nu5ZLrwoOjjiw7Io=
X-Received: by 2002:a05:600c:3b85:b0:41b:4c6a:de7a with SMTP id
 5b1f17b1804b1-42127ec7dbdmr148185e9.3.1717016639372; Wed, 29 May 2024
 14:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com> <20240529180510.2295118-3-jthoughton@google.com>
In-Reply-To: <20240529180510.2295118-3-jthoughton@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 29 May 2024 15:03:21 -0600
Message-ID: <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.inf
 radead.org, linux-mm@kvack.org, Sean Christopherson <seanjc@google.com>, Ankit Agrawal <ankita@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2024 at 12:05=E2=80=AFPM James Houghton <jthoughton@google.=
com> wrote:
>
> Secondary MMUs are currently consulted for access/age information at
> eviction time, but before then, we don't get accurate age information.
> That is, pages that are mostly accessed through a secondary MMU (like
> guest memory, used by KVM) will always just proceed down to the oldest
> generation, and then at eviction time, if KVM reports the page to be
> young, the page will be activated/promoted back to the youngest
> generation.

Correct, and as I explained offline, this is the only reasonable
behavior if we can't locklessly walk secondary MMUs.

Just for the record, the (crude) analogy I used was:
Imagine a large room with many bills ($1, $5, $10, ...) on the floor,
but you are only allowed to pick up 10 of them (and put them in your
pocket). A smart move would be to survey the room *first and then*
pick up the largest ones. But if you are carrying a 500 lbs backpack,
you would just want to pick up whichever that's in front of you rather
than walk the entire room.

MGLRU should only scan (or lookaround) secondary MMUs if it can be
done lockless. Otherwise, it should just fall back to the existing
approach, which existed in previous versions but is removed in this
version.

> Do not do look around if there is a secondary MMU we have to interact
> with.
>
> The added feature bit (0x8), if disabled, will make MGLRU behave as if
> there are no secondary MMUs subscribed to MMU notifiers except at
> eviction time.
>
> Suggested-by: Yu Zhao <yuzhao@google.com>
> Signed-off-by: James Houghton <jthoughton@google.com>

This is not what I suggested, and it would have been done in the first
place if it hadn't regressed the non-lockless case.

NAK.
