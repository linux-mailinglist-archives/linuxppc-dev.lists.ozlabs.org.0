Return-Path: <linuxppc-dev+bounces-12592-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DACBA5978
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Sep 2025 08:02:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cYcLk6TgJz30V1;
	Sat, 27 Sep 2025 16:02:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758952974;
	cv=none; b=IsjQ0chTsskf/pT4TYkAx7jSwyckhb1nPj66AsduPVCnUDZ72iJ1pAqJT7JjOiwie2VAP9Wd8V34NNJfZrGuuQ1Vcccp6IsIu2X8cc26GZ5qQxznK2SvnXr6/tzZLb/uneTBiSyFoqQi3C+GtyZPNkBBpuAsbwfkzW6/rieG9nMMeNVdcWw2cFWeKweLuuxDKaqPB8ZHVq15X7H1+Rsuh0EuKMPteCZGQzEf5z8932jBsmdkYZYy5K0FduFJwD56wXBNObn9hjmcxGQx22EcgeC38A4TG3WId8/QX8f2DTPJwM9Uytafd0auZiwTJiKki9K3RIO7Ms7rI0zUPPJBsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758952974; c=relaxed/relaxed;
	bh=EZz9pdPxtkQCQg0LwPC7a9M9+XqgI2y1Onp5LAdJY54=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AMAsqGGBKhCdvJ08Q4fkQcLhfJaFnN09Sipgy0GojMlHKDBiRfclKVJ7IafLFkepgMAsCCr++8TfkVopsrGclOVfN2cFBuyS9pF7zcbwUoyjnwc+BeTlv+M8UHqESIFfSYpQ6RjosiKq118FTRDizscPQzDy0uQXUkUMCP0vWe0qcnTFtedvRScVFZzl0SSjbjeDK2Z38RjicMiHkSaDpyZo9N6luXc1zlmjeNhkEQBVNbYk6DeqqliodLQc3yw7KD6Vs06u420EC0qT7rrl+eVk/YhjlNCdYGZbGXCt/sps5yeSUOnmvhOMhKdDPdH8cllQGr9daq94+IbsLfNXdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0m1vS4Mk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3cx7xaaykdlaiuqdzsweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0m1vS4Mk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3cx7xaaykdlaiuqdzsweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cYcLj2Krlz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Sep 2025 16:02:52 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3306543e5abso3266758a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Sep 2025 23:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758952969; x=1759557769; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EZz9pdPxtkQCQg0LwPC7a9M9+XqgI2y1Onp5LAdJY54=;
        b=0m1vS4MkurPxw3LHAnHKnHyw8M+n2ARpgPb7HOhJ9G24WFBj5kd8xlRZ2DP1Kes8z1
         EBg2kpGd/k7gxzCPhrvBqxYhupbuQcKex9CXhKeBwEsQaAgH2ricEaW5V3KtMomeG1+A
         9ooVVp1lgj39NEzbQJlqNtflUnVGq8ut6/JglIPMRJ+gdzBBsJP72CTXksHI3xVBEjXY
         pOEFo5S4H+Wz3N/bGlc3sCUl4A1MidOO6HyjY4S5lZxvczOT085hck+PnS7C0YZvPgz7
         kLIILuzRgG3ZlLPaDWyBXYnbqndh9qhLTIrEV8SIcradBbi7+/YNC3eGml8EZDozothz
         xGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758952969; x=1759557769;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZz9pdPxtkQCQg0LwPC7a9M9+XqgI2y1Onp5LAdJY54=;
        b=GrkhIdHetLitZ0NkAC1sstwCEgWevafDufAvybZeLmUp/iwcjrCeEGw0eTXh4fMppO
         a+r38NsrJlg2nLcS4WxMxe5YFdq2Elm08sAgtDhNZDAihZFf1zpiF6FUVQ4Y+U6XVfdY
         VfwnMHzDneKtCzjNQVYykB8fsbf0U6IOi8GB5hlJhQm64Tq3FhnKTiO1BlJu8HdZATXf
         QhsawQqm0LCFC6brcImmz2laDAVNahmr0e4GpehNXHGk3Uh+4Klt6MdeXnpoobPpFez9
         UpWAX1NvouMHggcJxQ20BFokP/Awxk6V27Ye8DYzZHJsv2jXBtwBHVv36nc5BQiLDVg6
         TbXA==
X-Gm-Message-State: AOJu0YxuKHdwNhAtOYQAMjIrKEr0GTe0L4aKnwL67jjbSkX2jzvAGjlQ
	vrKho1GLsKsgU4bZsHfG2CqV0xFdv2PtwpL5FCJkYamZtnnkX7JojZURRhqUCsJNTZwBsaYtQ5K
	LO8OdOg==
X-Google-Smtp-Source: AGHT+IG+O2/UkKI29OQKSSuWam69+x9DRDtxFfKKLWwebRfAoiKlUD2jq0l73MqVAHzrMbEcLiUIcTj1iZg=
X-Received: from pjst22.prod.google.com ([2002:a17:90b:196:b0:330:7be2:9bdc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b43:b0:32e:72bd:6d5a
 with SMTP id 98e67ed59e1d1-33454f56a18mr9327831a91.1.1758952969598; Fri, 26
 Sep 2025 23:02:49 -0700 (PDT)
Date: Fri, 26 Sep 2025 23:02:32 -0700
In-Reply-To: <20250919003303.1355064-1-seanjc@google.com>
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
Mime-Version: 1.0
References: <20250919003303.1355064-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
Message-ID: <175895291958.2931667.5042104101547847294.b4-ty@google.com>
Subject: Re: [PATCH v2 0/5] KVM: Export KVM-internal symbols for sub-modules only
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 18 Sep 2025 17:32:58 -0700, Sean Christopherson wrote:
> Use the newfangled EXPORT_SYMBOL_FOR_MODULES() along with some macro
> shenanigans to export KVM-internal symbols if and only if KVM has one or
> more sub-modules, and only for those sub-modules, e.g. x86's kvm-amd.ko
> and/or kvm-intel.ko.
> 
> Patch 5 gives KVM x86 the full treatment.  If anyone wants to tackle PPC,
> it should be doable to restrict KVM PPC's exports as well.
> 
> [...]

Quite belatedly (forgot to send the "thanks"), applied to kvm-x86 exports.

[1/5] KVM: s390/vfio-ap: Use kvm_is_gpa_in_memslot() instead of open coded equivalent
      https://github.com/kvm-x86/linux/commit/66d1a7ac946c
[2/5] KVM: Export KVM-internal symbols for sub-modules only
      https://github.com/kvm-x86/linux/commit/d66078b8c990
[3/5] KVM: x86: Move kvm_intr_is_single_vcpu() to lapic.c
      https://github.com/kvm-x86/linux/commit/16e53ef18450
[4/5] KVM: x86: Drop pointless exports of kvm_arch_xxx() hooks
      https://github.com/kvm-x86/linux/commit/26caf4d04e01
[5/5] KVM: x86: Export KVM-internal symbols for sub-modules only
      https://github.com/kvm-x86/linux/commit/aca2a0fa7796

--
https://github.com/kvm-x86/linux/tree/next

