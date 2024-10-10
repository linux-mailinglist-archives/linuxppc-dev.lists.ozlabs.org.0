Return-Path: <linuxppc-dev+bounces-2005-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0C1999006
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:27:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdV937n2z3bwX;
	Fri, 11 Oct 2024 05:25:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584737;
	cv=none; b=Sd7YWs4JDebGbOUpwe2HqYsLoi2WrprHC891JqvHVFIVDWmmtVGL5y+D35DRJ4TgW8jRTuVjn0Du3ewMQ8oE37qf/dpHgwCvhiaomc5qohgMhGhTdBXhdfC7IxSnjIYrTuz+WQvK8PGjHpJLsaHfc2GZCQ7VD/w1R3bE07t8NVNelWWSxtQnTezFDV8CeHNDkpiQO9ZoiYnrs8lOexn8bNKGcc4GitufVLSXpVSz3o1dbUzbKRBN5bNw0zkFtITzIqA2Oa85STKzmVWou6bOKWFvQDqql2kd67KJhFXScaFVG8hK5gB1DM/xxewix3kv8ERPAbKRmWXyTRUwjUlDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584737; c=relaxed/relaxed;
	bh=LNPEWcjaz+dEwpcBQF1ZcKP3HAxUc/LzxURpjzN7wyY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AfPhnUYSwLeSOhEwlgCai6nDmP+Ir4xf5DQstqbPxZglX4Q8J2GsUNPprl+E0eAqz+cpfTkoCzgJsPvTf9gmMoe8Pxn5DCxEjHZyZC2C4ufJvX+/Hv9OqhdIwVSCsU3YL57tLyfcCeV1FltMttuVQt1t/uYhrUyTaogvBlgdiVskXm8ToBlEDwKaycxgqzQ3ggWQOMW6oq3JNJ08qLalJXo4wcm3R2/cF0AS7jf0yL81euh0J/Lllh7BaJGQnrYRkRCqDtCPB9Qx/G3N/oLj82UD29LUBRWabwPe6WrPfQtzI2zuqqyk1fVJSXYsi9wWosE7pEeBIy7dtr8fz8pL0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pkaBShEt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3hxwizwykdlyoawjfyckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pkaBShEt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3hxwizwykdlyoawjfyckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdV85RdRz3blc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:36 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2e28d7928d8so1637410a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584735; x=1729189535; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNPEWcjaz+dEwpcBQF1ZcKP3HAxUc/LzxURpjzN7wyY=;
        b=pkaBShEt7yiHOK+hEWEiqyQUi31X1H9piYB0B95F3mc2s55TwSErTKBG3Ud6E47Slv
         8fcuNVrGVgYrlBRv2oOSwUD4DCeYyF9wwSe8urExlc71gGfyYz1ABh933a9xu7Cf72c+
         xJhmsoaT3M9OAuglPsVyq+Ia9L8FZyIxE4hRTf58TmOjIPlaQe3OMK6Pw8aY/i0dPGAo
         /vDDFTmenETrKEJ5ky0EA5cRKGb3xZaz/oKOIaenTjroBaEACC0jcdPrr5iH53s6Z/vy
         tuntUCWANSczrVTYHJGR/4HojOHJwRoOVIKbliqiXTEqCZ6J3WMtqDib0rK0IiMWbLOc
         gkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584735; x=1729189535;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LNPEWcjaz+dEwpcBQF1ZcKP3HAxUc/LzxURpjzN7wyY=;
        b=VfsQEVkpBKPbctU26t8AFfjSMPMDYc/UvqoeOt/+EXI2yMtUne0IR4uqGq79Q+Fdpg
         CDAzboZTd0UTK6mq00sJ2VWvrzlV2ahes3uFOx8FIDUDS8QlJX9DkTePA8ifc6SxDJV4
         D5fOJvY5yIn+VPwEwOP/JozAaGDvZaxojVQW8BrEFgKmaka/6z37tj4ZpkEN8whnjtR1
         jhKg++ESiXm/jt4/ikx7jfmvDdLmukjUln9Af3lpLG6+kH/gnHnylszKmvRvWRqN9bXy
         1z4I/s9or9OMw4Qnd5EQCV+BcfxI1ZXxa/gd7USdqsE4px1X651kx+mMkdg56XRur7b3
         09HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXngMms14GGPGUPli9k0yWvsXjnFC6bwPVKmc5+Do6B79p3J6LCm7d6M/NnDf64PyVhZfIjvyOPZNleeTg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwYOn9WzKA1Bg7LySOVlQmFfGT5nrcdQm2RHVx7tuFTHYKwUs21
	POcByaM9dRCvMfVd7BLZwZOkYUtFbH8JtkPzLUj3Ei4JpXfbrtS8BDeGn7cgLvYOLMuy5z0uGhW
	C2w==
X-Google-Smtp-Source: AGHT+IEnZEGZphhdHlQgb0iOcJfNRdGKMtxwSRuFd5MkDGpZIOhDcg8ohYIeF4ySSwO5bqKUu8yK4lYjZ+4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:8595:b0:2e2:d600:3862 with SMTP id
 98e67ed59e1d1-2e2f0d9dbfemr89a91.8.1728584735013; Thu, 10 Oct 2024 11:25:35
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:22 -0700
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
Message-ID: <20241010182427.1434605-21-seanjc@google.com>
Subject: [PATCH v13 20/85] KVM: Remove pointless sanity check on @map param to kvm_vcpu_(un)map()
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

Drop kvm_vcpu_{,un}map()'s useless checks on @map being non-NULL.  The map
is 100% kernel controlled, any caller that passes a NULL pointer is broken
and needs to be fixed, i.e. a crash due to a NULL pointer dereference is
desirable (though obviously not as desirable as not having a bug in the
first place).

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 52629ac26119..c7691bc40389 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3071,9 +3071,6 @@ int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, st=
ruct kvm_host_map *map)
 	void *hva =3D NULL;
 	struct page *page =3D KVM_UNMAPPED_PAGE;
=20
-	if (!map)
-		return -EINVAL;
-
 	pfn =3D gfn_to_pfn(vcpu->kvm, gfn);
 	if (is_error_noslot_pfn(pfn))
 		return -EINVAL;
@@ -3101,9 +3098,6 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_map);
=20
 void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool =
dirty)
 {
-	if (!map)
-		return;
-
 	if (!map->hva)
 		return;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


