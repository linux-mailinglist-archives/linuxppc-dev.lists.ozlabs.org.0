Return-Path: <linuxppc-dev+bounces-1998-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60463998FF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:26:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdTt2Rgqz3bkG;
	Fri, 11 Oct 2024 05:25:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584722;
	cv=none; b=Am4/8hX8KyUpih8nX+15Q8POGyrfmt1lz7Emv8OgzPDZcBg+vCT4e+H5wdUsFSuKMRprGm0D/0fN979R2XcT0TNYzqsjXTuL0yD3SqPI+CtCFJl9dMNtg52NyZ1RT7y60mZTJlvyV45VRuNqrcYNtYLc37M6b0HB9Q6j+paCrm76TURyGK7yGsz1mYVLkLRmXjp8K/LNrldRoL1ITD6F3unhI+fZtAx8ditOdL8FUoTnJw0ogAi5b41jW9XmWixAdJyT24bhZrYFznAP4OaJNhaqmwhB10dztNwEqTQW/UlV5O8yyLTj+UCLb2kCjdPioyJHFnXiEKm90RxEJD9K1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584722; c=relaxed/relaxed;
	bh=F0+KYw/6HzWsmGATvSxbQuKdqCcRS3waqcwxHrAen8Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OPBNKDhV+PsjpuLvs4pOFhZwxgiAyuE7W50j6fMsaNZTsaQ3ucsrv+YsPPEvVRoIHH6ogz1IMEpJQcqdRSgpVjIJX4qWBgcf7pavZm74MZ0A4Jg927qe1lPgWGMBUvjn6C8djcruQg6TDJ68PFnFCB1Dh82agX1QIHiVBGEwTvvavzAGLAHVxtBkhLlqFULm8sBSoGB0Pci9xofleUJ6Hb1+w2FjLyDOubvEJaaqnU0MaFFrJeUyfbmo7MVlh2qF6oVwcmZp7NFkiY9MqLLue+dttojWJbStNiL+UC3nEugqgts0bj4a8tVN2VrsZiKYsnTBLPYRsynkJ5LPQyBS9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UP1ENL6R; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3dxwizwykdkyykgtpimuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UP1ENL6R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3dxwizwykdkyykgtpimuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdTs27Qnz3brt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:21 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e3245ed6b8so23826807b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584719; x=1729189519; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0+KYw/6HzWsmGATvSxbQuKdqCcRS3waqcwxHrAen8Y=;
        b=UP1ENL6R/dG8nmn5hkc7RXWtWU1FqNxxW5+vs6KOcU1tppPMApwiFsvcH4YlLAbTvC
         h4coiY9xfT+wbMizLNQh5Dxl4Cpu9sNBbfbAPQ4JYY9fdMnLCMWwoEwjhsN+yU4OA9jH
         vrkuF29nLgyJNXhtDbZWB6g2aTKQS6r13D8tUlT8hYFa93DzUDN7PZJtsMXKXxOf1dFj
         WTL41Vww7o8qY5csHM6kCrir43EURbDf3hZb/NmN9hH4HRDDZ/vNaagj8J2MGxPqoRQb
         DxfkRwpiSwzp7w3RxpqArOxjYvkp3H5jZCPK6HNd23wSMYzrzY3I7XyOjE1KhXW32myG
         xhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584719; x=1729189519;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F0+KYw/6HzWsmGATvSxbQuKdqCcRS3waqcwxHrAen8Y=;
        b=Ehdwn3aTE1+X3wYKQKJigNtCGAnTBmPDhuebQYzwK0PE9nGP73H/kg+dVOY2kYaymQ
         su3HsW6OYz8P2EH4utIHEULhgEG3De9auXtHS3xb+cfvWcOQ7NEOLZNj2hFyXekE/Vye
         bAh5tQk54ridbkiayycxpsSRxxjOiyhmlbXvdNn2/NF8qG+jNMwksEx+DSgwo4Sw4ES2
         EE7C8G5dbPfSov9ylNcuAEkuxc6ETqSQ2lYATfOnwgzOofRJZbdzgcfEnEkRtFkAKjr1
         sMwka7f0furNMpLx4rPQm3enA0Hw4Y/u0PnIFApgZsuxZsiuMc7dj62wXutBE5E7N1yI
         bUkA==
X-Forwarded-Encrypted: i=1; AJvYcCUwc12hM3jkAbKtnf4Pjslg97o9fp30CJSAo6hAgOWrdalJ2c/M4tsWF8f/+q8OA46ls5CzhrOQJTrHkjI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1rVcDKthsJ9qgGlBqfw7K98qKOvSUE1IQEDMz05yOkTxsa6tO
	BX9SjDSqDRErBLixDK3R7ho3XpxdccO6xtY6nFxowt0l3lNLdSZnNW2Yn0IaRoYd4srbFIT2M5B
	Hkw==
X-Google-Smtp-Source: AGHT+IEeBu92qjGJ6/8zutZUBi8WOanw4UupdtztXpUfLE+vAeLHZHNkVuFOksmpHMU427MoGYN+Q9YZlwU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:3204:b0:62c:f976:a763 with SMTP id
 00721157ae682-6e322185b22mr897567b3.1.1728584719334; Thu, 10 Oct 2024
 11:25:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:15 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-14-seanjc@google.com>
Subject: [PATCH v13 13/85] KVM: Annotate that all paths in hva_to_pfn() might sleep
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Now that hva_to_pfn() no longer supports being called in atomic context,
move the might_sleep() annotation from hva_to_pfn_slow() to hva_to_pfn().

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 0bc077213d3e..17acc75990a5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2804,8 +2804,6 @@ static int hva_to_pfn_slow(unsigned long addr, bool *=
async, bool write_fault,
 	struct page *page;
 	int npages;
=20
-	might_sleep();
-
 	if (writable)
 		*writable =3D write_fault;
=20
@@ -2939,6 +2937,8 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interru=
ptible, bool *async,
 	kvm_pfn_t pfn;
 	int npages, r;
=20
+	might_sleep();
+
 	if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
 		return pfn;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


