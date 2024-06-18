Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E8590DEA0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 23:42:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tLA6ARGH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3gFy02Lsz3cT2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 07:42:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tLA6ARGH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3gp9xzgykdbkh3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3gFD2lkdz2xcw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 07:41:51 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dfe4f388d33so11178278276.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 14:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718746904; x=1719351704; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hTMwIVse9Tqfg6lD3BDUhww1E0hJCsQTGAtbBvKYeBQ=;
        b=tLA6ARGHnhqt4zL4nD9T3JZuyhfKEKE5FF8CVq4MRpk6YY29cR/lqwD5SFbLm9zmXx
         givBncDSw0OEijnnsrIMXU4HBJceOWbEdFicen4SOu1kJQy8K8mF3ESBTdH11Lvuvpbx
         sdwNF/UWKuekzRMZ2A9qngRfBYvkz1hbVZdFdjoqFGqXUYZ3IWZY6XrOUDqsjhu7CblE
         k4gN0hlKBgZL/mYlq6y1Lt16K5GretINxvFOLahiirwmrXb1ryV+wZy7d3sHCJlzcD+e
         3unBTZLLnX4Dl7kd2i9fgK8H3ZSW4UZJCBIbwiamEu7j8dZO7sBaUHUfOnVEvjm9lP+D
         RtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718746904; x=1719351704;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTMwIVse9Tqfg6lD3BDUhww1E0hJCsQTGAtbBvKYeBQ=;
        b=KsQEcjKFNK2pccb4+TaFyzibrHFPwJDsInO7/XtOrt41UA6SFpcCFCWwPy9kY7aqOV
         vC9ucIpJXFtSoJmVa/ei/RtW5vmZAE1vFz4yc6PB9o9QHzi8Urkh9DsOwVi4rP2CsO8D
         27eu2GyPdNxZ4cG8ks75J8tktKc2u6u7j9rZqjVIjeEoTJZ2cFTYLOatFznP1oqb3Q5n
         ntGnyY8wu/fBo4FYz7eeJI4v96pa2DBe4ECTuFwnBJ8VepSpE/bYISB+GjSIiu/OHU7Q
         TX9kyeNR5lDu1bIAH4fFI0Tcqlo+ldq0yYBl0SKGhxGjrqEORM5Y5yiaaQmy7nidQLVI
         6GVA==
X-Forwarded-Encrypted: i=1; AJvYcCWDX0rjsnu31GW6Us7YP9jAse1FqEt6xXFiCPPFaXnW5CkYsFLsbTthESJSu5j1YOFusqpOiaUBSqOgg6jrpfd1U6oyloLXO4EM3a1BFQ==
X-Gm-Message-State: AOJu0YyQYVNaofYsK1L11wVzFmXeRPqr9bJ32fjht4p7H2bw4FSHe6oZ
	l+iYwccg4QWZBYAxAPu+h7p8cO6eOyEFUeYdaoPc20ETCgBE2Zp8aTjs5HrCxGG0yhP5npPqcY7
	8xA==
X-Google-Smtp-Source: AGHT+IEl94B6cPOfd/EKE0+8juuGqXNbimkkhvSQIWkIC7nhtL6RuCNxJoDH3on4HivHNvWvDQFbNJTKAmY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1003:b0:e02:bd4f:def2 with SMTP id
 3f1490d57ef6-e02be20b2ccmr339129276.11.1718746904451; Tue, 18 Jun 2024
 14:41:44 -0700 (PDT)
Date: Tue, 18 Jun 2024 14:41:24 -0700
In-Reply-To: <20240503181734.1467938-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20240503181734.1467938-1-dmatlack@google.com>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <171874683295.1901599.10170158200177384059.b4-ty@google.com>
Subject: Re: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out
 while running
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 03 May 2024 11:17:31 -0700, David Matlack wrote:
> This series changes KVM to mark a vCPU as preempted/ready if-and-only-if
> it's scheduled out while running. i.e. Do not mark a vCPU
> preempted/ready if it's scheduled out during a non-KVM_RUN ioctl() or
> when userspace is doing KVM_RUN with immediate_exit=true.
> 
> This is a logical extension of commit 54aa83c90198 ("KVM: x86: do not
> set st->preempted when going back to user space"), which  stopped
> marking a vCPU as preempted when returning to userspace. But if userspace
> invokes a KVM vCPU ioctl() that gets preempted, the vCPU will be marked
> preempted/ready. This is arguably incorrect behavior since the vCPU was
> not actually preempted while the guest was running, it was preempted
> while doing something on behalf of userspace.
> 
> [...]

Applied to kvm-x86 generic, with minor changelog tweaks (me thinks you've been
away from upstream too long ;-) ).  Thanks!

[1/3] KVM: Introduce vcpu->wants_to_run
      https://github.com/kvm-x86/linux/commit/a6816314af57
[2/3] KVM: Ensure new code that references immediate_exit gets extra scrutiny
      https://github.com/kvm-x86/linux/commit/4b23e0c199b2
[3/3] KVM: Mark a vCPU as preempted/ready iff it's scheduled out while running
      https://github.com/kvm-x86/linux/commit/118964562969

--
https://github.com/kvm-x86/linux/tree/next
