Return-Path: <linuxppc-dev+bounces-5060-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1343CA09FF9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 02:25:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVLRZ5T1pz3d2c;
	Sat, 11 Jan 2025 12:24:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736558698;
	cv=none; b=B6P8u/uIFbTe/HZI2ddEteS8aC/VCfF10ai06xcZYDYVLuK/t372iCG92FSli2qBsdjN8HsWQwxxnPdhkfE5UcRu3VSv2AYFwxIfcu3vehjWoYJa5ufPvbTe8qpBoVva2SLtBuN7JFr2jwfQVpzgxkbxRSU5pobyAJgIGMYCh7c/dtEddjdGTxXkFZocKxZTVueSj5kcvsyJP5ByhS1gQnr/SQrTPnBLYy8F816j/UEL0CHI+G2b3dE66FmKrvwQF9Lc1KSFRnOvmr2lpwlNUiamh+agyGZxqECXoiNlHDYJ7X6rkKZi1qPwElm/sSR7VN0QNjJkK7qRn62K8aafuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736558698; c=relaxed/relaxed;
	bh=Wth181Oju/yKYvdF4NH88lRCMZbnQWr4S1ULRikLXgA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MrsVOU4toGBYvJjUaMX2toA3knpeScvEgE97sBRqd+QHrtS/0DOxZppX19woiFRF+hUQCk+CSBwMrfEAE9pcA8EbzwOsvpk+xPZJYV/FJa4FeJUaCaft23I1/zU7ANC9rDZtD/5ZxX9IbKBDWQ11nqjGCMHPoYNvWc1w/VGiPr1N56ZACfj17bMSzRuH4crXmfLV/NT3OhBw2NsqmSYlf8j4gfbcr/LWxJny0RO0h89/nBwOgYxLBCkVyQCRiQmYexclvzhSFntTY3O4UrQy/WCUj5DxnS8RHgveoYGiRWK9nsplBy9TJ35ETPaF/zFk5nNm6yxuMooxTGQIMXszWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QfW8n55U; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3zmibzwykdd8tfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QfW8n55U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3zmibzwykdd8tfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVLRY2Bdrz3cnt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 12:24:55 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2efa0eb9dacso4852748a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736558692; x=1737163492; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wth181Oju/yKYvdF4NH88lRCMZbnQWr4S1ULRikLXgA=;
        b=QfW8n55UweEzHU5MD797H+6p9UOAb9voBrf1CvKljXAcmQT0e2gjEOfiP5M+l8wn/V
         4MNM7tRYvTrYh0PhISsLAjKM6HUwMNsevdlQoch1rfpLnnippHSViBVSb64By2oKz1SR
         oprY93nmig3dzu/vKbjCyyCtxe64vqV9ADKrvaLJiAkqohVIOKTOlOA/QgvMwfveskIR
         av8fMbSy0t0X4OhfQSX1NHYgMfEtG2Oe0XzixAt+mRs29nN1JG6MUyfOau7MgcfINpKd
         cHKzq8N9yG9VE3JKJs+KcFHWk0/+BDLfIxsBw+L1WUxpvmYl4S4W5+/OcnlLJKNp5U7f
         j/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736558692; x=1737163492;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wth181Oju/yKYvdF4NH88lRCMZbnQWr4S1ULRikLXgA=;
        b=CyPvAIvvbzW5t2QAvwIUI2hrGkaXeIUqdKTF9mpoLdTegkYynYTz8BIjQ014T/7Svv
         /9VA+EjPGTRUBG1Te0E5KkEBrzAyaIWyTPiADYGSHHcDnI6E81mxBRGtVnq6gnlCW9Hw
         TTM0DPUqGAHFZi7xHKf0LzrANbg+VIhvHDMXEVGHdCV4gjGI6Ze/rINbgAv+O35PUuFp
         Aqhb9aqyfLcJY68r3/qpaZC/brXAnmefkSwhDhFkaQ7IHHdv9oss0tuM0fq0jVXQ44eN
         +ywx7MGceoC7fJZAhd1KRJZfKoNGQ7ve1s55Sh42BSCEwKHPoHIZ2ymgrf2Mg+5CM769
         Z5ug==
X-Forwarded-Encrypted: i=1; AJvYcCWfZ7ZdPBnaJ5cUsjdninHlrhQXFYy5Ko1fL9iexNyXnMoa1QJauLlUtLqXG1/uPUtq1ZFgDjvxImGpAkg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwXoWlXhfGDbHSTVZ0PEKhorXRZMlwQJVIcVnoit6c8BcwaiMVy
	GgWswOPx48HxSqmCGotTidG+HyLMCwOjFR9qPc4dbjtXeVQJQOmDEX/VA8kz4KcKOJ0dFI3iz9p
	KDQ==
X-Google-Smtp-Source: AGHT+IEfMuWFVKhsS9utsiRr0qZN46F4y7a5kx/arb7GLt+tjCHLQTHDuOdaekKI3i56eThn0gAXDuFPjYQ=
X-Received: from pfef19.prod.google.com ([2002:a05:6a00:2293:b0:725:e39e:1055])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:230a:b0:725:ef4b:de30
 with SMTP id d2e1a72fcca58-72d21f4b537mr18483242b3a.14.1736558692541; Fri, 10
 Jan 2025 17:24:52 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 10 Jan 2025 17:24:45 -0800
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
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111012450.1262638-1-seanjc@google.com>
Subject: [PATCH 0/5] KVM: Add a kvm_run flag to signal need for completion
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add a flag to kvm_run, KVM_RUN_NEEDS_COMPLETION, that is set by KVM to
inform userspace that KVM_RUN needs to be re-invoked prior to state
save/restore.  The current approach of relying on KVM developers to
update documentation, and on VMM developers to read said documentation,
is brittle and error prone.

Note, this series is *very* lightly tested (borderline RFC).

Sean Christopherson (5):
  KVM: x86: Document that KVM_EXIT_HYPERCALL requires completion
  KVM: Clear vcpu->run->flags at start of KVM_RUN for all architectures
  KVM: Add a common kvm_run flag to communicate an exit needs completion
  KVM: selftests: Provide separate helper for KVM_RUN with
    immediate_exit
  KVM: selftests: Rely on KVM_RUN_NEEDS_COMPLETION to complete userspace
    exits

 Documentation/virt/kvm/api.rst                | 77 ++++++++++++-------
 arch/arm64/kvm/arm.c                          |  1 -
 arch/arm64/kvm/handle_exit.c                  |  2 +-
 arch/powerpc/kvm/book3s_emulate.c             |  1 +
 arch/powerpc/kvm/book3s_hv.c                  |  5 +-
 arch/powerpc/kvm/book3s_pr.c                  |  2 +
 arch/powerpc/kvm/booke.c                      |  1 +
 arch/x86/include/uapi/asm/kvm.h               |  7 +-
 arch/x86/kvm/x86.c                            |  3 +-
 include/uapi/linux/kvm.h                      |  3 +
 .../testing/selftests/kvm/include/kvm_util.h  | 13 +++-
 tools/testing/selftests/kvm/lib/kvm_util.c    |  6 +-
 .../testing/selftests/kvm/lib/ucall_common.c  |  2 +-
 .../testing/selftests/kvm/lib/x86/processor.c |  8 +-
 .../kvm/x86/nested_exceptions_test.c          |  3 +-
 .../kvm/x86/triple_fault_event_test.c         |  3 +-
 virt/kvm/kvm_main.c                           |  4 +
 17 files changed, 90 insertions(+), 51 deletions(-)


base-commit: 10b2c8a67c4b8ec15f9d07d177f63b563418e948
-- 
2.47.1.613.gc27f4b7a9f-goog


