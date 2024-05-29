Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 59AC38D4101
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 00:01:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fPzXA+W3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqNWK5jztz87Xf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 07:56:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fPzXA+W3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3y6rxzgykdeqykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqNVZ27nFz7BLh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 07:55:50 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-6bfe9914116so73941a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 14:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717019748; x=1717624548; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0O8RdWVLc2UjPDSDGViR160MauFo82inRxl7GpP6bk=;
        b=fPzXA+W3+cmI18hpSXlbWT3QLNoZVwaVgAOaZy7aGf23fTI7OcbcONlNpKzniLnBLw
         M5aK8vAgjRABsWZd0fHfwA1GVXxTFT7yjuAB26Ig6Jqtg7AuvkaQSn4ZTcKQ5xpzM6du
         ZC+QUZEunCGuxmJatLeYsUCj7BDvRnHhYkLEaolPFVYZ7OpLMhJw/DqqCZtYFHBLSODe
         DxdxfeQ/B/wt+Jv6ZttRbwLhCu/QcpURUTrkks2EZiETMS+ElfgYAzgkB4RyWYhYi6r0
         MDDkUVX65QqHbCqgE7BncHr13vG6Lpa3bgrpiz6+YYQKGNboDmm939rQF9UXfn9bfLEg
         /SBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717019748; x=1717624548;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0O8RdWVLc2UjPDSDGViR160MauFo82inRxl7GpP6bk=;
        b=gMFvdunTbGY+u1MPSeLo+7Ol1FwwjD9/DayFOASHKKRifEfi30L9i8+qu7siduw9rK
         p+lad6/dGzcsO2sK31Jxl4UpsDV+LiI1zs57YrW7NNMq5TzpqmUzDeD5CG/Y9yDq/0N9
         lReBKJgD16crOevDS/rdHtunlN1RqeJRzYlpDNbht2/2HLNLopk8Uvo+UfHG9y18rz20
         EYv+vyt//O0558EoRyU6Chch7OnnYHsRFG03BLDIVnNav3vPSAVGcQuJGWNEpc69JF7l
         aGuk9pitNtOMrfZU0dAmzP1LYT3umBv/Y9c6rdKbxFEqJsApSSDZoWFfqa3WpSXYTirx
         C+LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVd3gWzzLbRms39ybh1rx0gJY0HVxn8RFg56J1Q4J+5JksFUss+qqBowMUbQCNEixGczgkK3PaO+YwjNlmfobyZhgZPZjbcpr+i9ixxg==
X-Gm-Message-State: AOJu0Yx+ks3wPkZoWeb3mAfzdwNXQAjyPJ+tpC32wjYitqw5V0lFm0Qu
	XhIw+ouxZ5btt2Ha11QKxno2+YIC8PlFhlXH0Sd2hsVk2YQ6oVdi0dn9+AcT7IkxtCIahM3AoOI
	gRQ==
X-Google-Smtp-Source: AGHT+IGx3SrykKCWRo4963j21qgI5u7l1D5l4vFz5cSTor42JO4rQICXW/WPSO9JICYG6TRZvTrpM8pyR8k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:308:b0:65c:f515:1590 with SMTP id
 41be03b00d2f7-6bfdaf2b2f6mr480a12.11.1717019747924; Wed, 29 May 2024 14:55:47
 -0700 (PDT)
Date: Wed, 29 May 2024 14:55:46 -0700
In-Reply-To: <20240529180510.2295118-5-jthoughton@google.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com> <20240529180510.2295118-5-jthoughton@google.com>
Message-ID: <ZlekYljG7KJwblUj@google.com>
Subject: Re: [PATCH v4 4/7] KVM: Move MMU lock acquisition for
 test/clear_young to architecture
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="us-ascii"
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

On Wed, May 29, 2024, James Houghton wrote:
> For implementation mmu_notifier_{test,clear}_young, the KVM memslot
> walker used to take the MMU lock for us. Now make the architectures
> take it themselves.

Hmm, *forcing* architectures to take mmu_lock is a step backwards.  Rather than
add all of this churn, what about adding CONFIG_KVM_MMU_NOTIFIER_LOCKLESS, e.g.

static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn,
							 unsigned long start,
							 unsigned long end,
							 gfn_handler_t handler)
{
	struct kvm *kvm = mmu_notifier_to_kvm(mn);
	const struct kvm_mmu_notifier_range range = {
		.start		= start,
		.end		= end,
		.handler	= handler,
		.on_lock	= (void *)kvm_null_fn,
		.flush_on_ret	= false,
		.may_block	= false,
		.lockless	= IS_ENABLED(CONFIG_KVM_MMU_NOTIFIER_LOCKLESS),
	};

	return __kvm_handle_hva_range(kvm, &range).ret;
}
