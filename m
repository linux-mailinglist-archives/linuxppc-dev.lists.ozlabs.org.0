Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EF47932BE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 01:57:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=kjEvzwHI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgMr44ztfz3c7Q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 09:57:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=kjEvzwHI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3mmd3zaykdl0vhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgMq94FTxz309t
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Sep 2023 09:56:35 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d7c676651c7so713692276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Sep 2023 16:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693958193; x=1694562993; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BTMdUX0G2lv2+kU2WiYySTJObpffzgV002stI1a1W7I=;
        b=kjEvzwHIqkqfx7NYa5Z809IHs5HswKKhc0KWc5TMiSfUR3vdGm/nkhm6OmeAgWyH9p
         /Rt86UW3glDuTaELTkc+iHXWG9xyRdLhi0MHCie4YG7wdzP70C1/A/rn1+8rW0fekjQY
         j3QMNl3QBlTZuUhOw2qYAw3+7dZ8F2lQ34HPT1RJ/l8JZAw87gk9shIvQVSIAcLy8cTR
         +J6l8c0pjWQPhK0gBDZr1pliN3Rv4ssEsWK2UtX9i13Le6k4HoVBGId4CQ20q5O+EBKx
         7FXmZ0DdlGQdivI+HwuA6gNSaZyuAxNZGXTliUjefd+smUUN1LhiFuRKK/lqda04Ozbi
         3W9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693958193; x=1694562993;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTMdUX0G2lv2+kU2WiYySTJObpffzgV002stI1a1W7I=;
        b=ADJ+OXiyu26JYH/Viijg4cTAG1hlSDi33Q/AhzDe4Zr1rBTmStRwaH9JfGLDmy9Vs3
         AO6+rLOHDFKKoYl/O4ChwvAg/dL0elNn6+7hTOaJ9JOrUy/0Nvoe3/tto60lSCTWkQvG
         jwlU5FJv42QCAxcUxysFYllrr7vZSleAO8XfvLyyc4FJGuqo0FMuLljk+smojpHnrRQB
         fkL2DBgewCvEp6ldTSmKF4LIzlEw0QgaNVTGsWsm8O9eBGrOYlSkihd2mikcRgzvLEzY
         V/qsdU7CViqSNwmp9CXoWOR6p7qNCc4z3qY/rvUoxp8iYCrwKg0AKrhldP8peA5gIU5H
         Iqng==
X-Gm-Message-State: AOJu0Yy69Us5r6rgaNduhRY7qzgpdj53hkJRrPKDUNtLYZx8YlEStJMw
	Gk/vp87Q2tYBPw9SZo2cJD9yXhX2a7A=
X-Google-Smtp-Source: AGHT+IGHRLIyxOEOlqNogao+wtJt3d7D+zZNTRSCijTepfZz1QuZZsrU81NGe3dzgdfi+rQuqyfdUQCuPic=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:4211:0:b0:d7e:c4af:22d2 with SMTP id
 p17-20020a254211000000b00d7ec4af22d2mr293199yba.4.1693958192804; Tue, 05 Sep
 2023 16:56:32 -0700 (PDT)
Date: Tue, 5 Sep 2023 16:56:31 -0700
In-Reply-To: <20230901082025.20548-2-vbabka@suse.cz>
Mime-Version: 1.0
References: <20230901082025.20548-2-vbabka@suse.cz>
Message-ID: <ZPfAL0D95AwXD9tg@google.com>
Subject: Re: [PATCH gmem FIXUP] mm, compaction: make testing
 mapping_unmovable() safe
From: Sean Christopherson <seanjc@google.com>
To: Vlastimil Babka <vbabka@suse.cz>
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-mips@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, anup@brainfault.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, michael.roth@amd.com, ackerleytng@google.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, maz@kernel.org, linux-fsdevel@vger.kernel.org, liam.merwick@oracle.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 01, 2023, Vlastimil Babka wrote:
> As Kirill pointed out, mapping can be removed under us due to
> truncation. Test it under folio lock as already done for the async
> compaction / dirty folio case. To prevent locking every folio with
> mapping to do the test, do it only for unevictable folios, as we can
> expect the unmovable mapping folios are also unevictable - it is the
> case for guest memfd folios.

Rather than expect/assume that unmovable mappings are always unevictable, how about
requiring that?  E.g. either through a VM_WARN_ON in mapping_set_unmovable(), or by
simply having that helper forcefully set AS_UNEVICTABLE as well.
