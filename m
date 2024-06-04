Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 822468FA6F6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 02:23:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=T1rlt0WU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtWY259X9z3dFH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 10:23:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=T1rlt0WU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3a15ezgykdnooa6jf8ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtWXJ1nVWz3clH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 10:23:10 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-627eb3fb46cso82394107b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 17:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717460588; x=1718065388; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRuXM8qP8LdDvX6fn1r8scesSI9q9pU2JyFDr4cXXhA=;
        b=T1rlt0WUAazu+bGviD6zmA5HxNfUb6ntnzVIBfc77GoI/qu13oBslM3zgQ6LHo9xS1
         +8bwbhOzutIFXypGnrF5Qq9dZdSc7E+Spwk6BKtW7Mw0PqKZvKCrvi+fFq9vf0yyF8U5
         WlHXoCsVsDJT8R1qHFlhDpYP87k9PaWumcB67KWjePd0JUcAWvDOOPFTmWPyC4DSL9dm
         hw+O7iAz0SMC09wJH63jX6Une7kC5ulAqhrmPJuVU6Cr480ZouOqUSx5C22b55+xIpfK
         eDEWUNczqlJgTpmhtK1l8u+Xs6U4r/HiuKX35ICDFzL+iiS6Lz06YP5aWSFJh6rbdTqH
         paNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717460588; x=1718065388;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HRuXM8qP8LdDvX6fn1r8scesSI9q9pU2JyFDr4cXXhA=;
        b=VPbAYmeVBkN3xjhoi2deHhLqBpLGqXrLGoL82SdrNP4iF/oVEZITPPDGtqfVxVeO3T
         VaU09U0OKmAiaK11Xo106jr+vlzRc/lQVnIfsWfKPJpez9oqKc9G1JZ3mv6WqiklM5To
         RH62LqgU+tCxfogMuXOpPEJ6UT0FyidF9PQwjGDJ9Vd2qj6fXmArxu+OIa9izIkx7Lh1
         k1uJ5Q4Pnm1eF4XW186eQkWcPWyOqZXECjlok7SSkeNbnZiB7PMzbKC6TiIXc2EFIGNq
         uRaz+rf7NbwX5AHeZLcr5jLTJzHLeuYBqMNij30ebl5M5G2zx7vlvpi7Aj6cepVIkv3z
         ATgg==
X-Forwarded-Encrypted: i=1; AJvYcCUMT4k53GzvY1yMhuc2GrUjUtHsVGEUF7R55qgqEsb5Mq+H27rvnP63uN4GRk0wG+KN6/H1CHVEiMjkA1iXE5r9j0THksF5obQkifOUlQ==
X-Gm-Message-State: AOJu0YxwNO04X0QvWn42DUYxjM119J9HPgXCs5vsV7rL2zneTF1PMJPN
	CgoawnX3KZD59blujFgOO0JAQ+reUKa6yLVG7iWkd6/lHJUtV5ZdMbV7KLwjLrif1TQ5ubiNWf+
	b/Q==
X-Google-Smtp-Source: AGHT+IEk24C6d/QoiBbCyIExMW7OdPZLjaBEK4ZPTTj/IX3O1NfqjnOFuoealUEhXp84xV+hhBOGjvPTh7s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:707:b0:dfa:ba40:6f43 with SMTP id
 3f1490d57ef6-dfaba407295mr112473276.2.1717460587664; Mon, 03 Jun 2024
 17:23:07 -0700 (PDT)
Date: Mon, 3 Jun 2024 17:23:06 -0700
In-Reply-To: <CADrL8HU734C_OQhzszWJWMXEXLN6HkBo4yweN2fX4BbOegXrFA@mail.gmail.com>
Mime-Version: 1.0
References: <20240529180510.2295118-3-jthoughton@google.com>
 <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com> <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
 <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com>
 <Zl5LqcusZ88QOGQY@google.com> <CADrL8HU734C_OQhzszWJWMXEXLN6HkBo4yweN2fX4BbOegXrFA@mail.gmail.com>
Message-ID: <Zl5eat0sh7rrspUG@google.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.com>, Palmer Dabbelt <palmer@dabbelt.com
 >, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Ankit Agrawal <ankita@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 03, 2024, James Houghton wrote:
> On Mon, Jun 3, 2024 at 4:03=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> > But before we do that, I think we need to perform due dilegence (or pro=
vide data)
> > showing that having KVM take mmu_lock for write in the "fast only" API =
provides
> > better total behavior.  I.e. that the additional accuracy is indeed wor=
th the cost.
>=20
> That sounds good to me. I'll drop the Kconfig. I'm not really sure
> what to do about the self-test, but that's not really all that
> important.

Enable it only on architectures+setups that are guaranteed to implement the
fast-only API?  E.g. on x86, it darn well better be active if the TDP MMU i=
s
enabled.  If the test fails because that doesn't hold true, then we _want_ =
the
failure.
