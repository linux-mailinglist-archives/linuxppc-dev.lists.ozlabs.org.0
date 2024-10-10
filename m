Return-Path: <linuxppc-dev+bounces-1988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55552998FE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:25:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdTQ43Pkz3blG;
	Fri, 11 Oct 2024 05:24:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584698;
	cv=none; b=jwcEsyxnZH+IPRrSd8dFE2SFZPHUXEPW/fKa1wqPSoMb2puJt9gLcq5f+AQPhm+mmf12OAp32fi67DIZzrzb0kazSCwKshqm6l+ck/SUStU036kMe9nT5I12EftALEx+k36ymYl/QSYfTAclGjo2sEaF7e2xi3dAOHbh0URt0iyS5q8q7TCQ4gEkwT1Soeo6Dq/5a8V4TSByb1QNZhyqUU6UpUxf5TXGgYDQ936EZSpFzUtAG6k+Nq+WMK5ecsX4N+QpkKVVFDFXY1bR/82Xqf2xHQlNzxSdk40s1B2eOw4negZGKsTVer4XJKLH5oXqkKe16lU0JwGeQlSQ6afYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584698; c=relaxed/relaxed;
	bh=8PiI9IzFtQVAZLsCzTZ7ta7WGdR9XnSo4A5BSh1uxRg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Cf/IvK3CfbJ+Mf9a9Hiw238vsnF/ghbHzaWvJbYiJ5MFXrkBlfFuau70saWieqsu60+wTFOUSwLCJ5SGBNj2uJrm3k2dDC2Lv1uUfl1StHFmpwYnsG2odO5guGymYA5IKD3VPYa1qeEw7/YdJiZyTuYyAu4jhx2AWpNirDTgrttpzvTw/pO8nU0evIJ2J9TzYOuP+tJcB0ODNrw2/yjz1HUEw72GrKIiVT7zqlCBd00TrL6i/IAN+5aKNC8zyiU+/mpowsqEFuRJn9YeSvg0yh/Goomy515bUPBNPeP/LJBX1YN5l/hsCT2Zh33d52veB442M8iC5RNK4DC+jAoi4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OgBn0l6V; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=39hsizwykdi09vr40tx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OgBn0l6V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=39hsizwykdi09vr40tx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdTP5Bc1z2yNc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:24:57 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e2261adfdeso21172407b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584695; x=1729189495; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PiI9IzFtQVAZLsCzTZ7ta7WGdR9XnSo4A5BSh1uxRg=;
        b=OgBn0l6V2J9Dg+tEkmvmfCk6bhq81Mcexz9cP3uKhm4kAdwkNFn29ahPh+JfUSPPPc
         hQDWBOUZEXZx8331wpluzlpapDLYvTnQVwp7mfATIpgUVU4L9+sCL135Igm7yBwiRCGQ
         7pBt+Kz54WvzXwxCnSbbCwW50Khi3r8XISjNNnWAO+QxaLaZ5i2B/LCZbP7MzQeM7F1D
         yeE42axZgSYxjkMG6wP8onqvgHHdOCXI/t6Syti20N0EzmZTLhbCKJ7cSRKBWF3+zjyu
         q4aswYy1ROu3eTG7ZEIjn8IOZRTLmlxmempoxB/byEUHt6+FdJhk+svatPd8xzcc3HF7
         DRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584695; x=1729189495;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8PiI9IzFtQVAZLsCzTZ7ta7WGdR9XnSo4A5BSh1uxRg=;
        b=ChXtVXKvyaNBCSD8PGh6AesCb2V8XSN+bnux51Xugo68+/Pnbi83DkamhlCV9PcBNC
         koGxapnPJ3oShH1v1FYV0XdcJf8+qfy5F6HaZ/jFaZGdNW10qIg5pp5dVObQD1OHloCd
         GnWeodRhD6Tv0JL3NvqYFDKL0sVQ71ewJC5PATOTVElldp39LrTjkrPI8qiiDTwKyoYG
         kWJKZC8lYaLEjA96F2Xfm/F4iVDbB4qJcjwc3fOlGdNTAhLQQUi8aNHXE6nFuhFLIe6V
         fwpI7Mbhr+t1Nr2NrZZt4YcPp0KgyfjbJjwPYnQGaIUJ/Z+wi1JpSxHNG8vJg6PAZh9P
         cFqg==
X-Forwarded-Encrypted: i=1; AJvYcCVGHp7tCOOpKhPCyjNhaNYmFijXxnAUl5H8yfH9+BKZQ9dOiiMHw3gqy3MRjykRQlQP5F7/EsR2CZf4zHI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyrwo9xejsVQebI+7RxBpe+vas0MxN0LOrF5SgRPr1eZvO9fiWz
	67lPBJoOr2twSpIfXN7Z2eqDU6vybrv91WNdSfhNn86Ds9gaOj0Ygha/WKNEp7Qb/Q369vvbE37
	mvw==
X-Google-Smtp-Source: AGHT+IGz6mODxZTH5agCMYiGZey+8PwFJu50se4JqpXBNG0SwyKrN9TWGGQJqqmZYCdc2Fnc7eka1IGyLLE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a81:ad16:0:b0:6c1:298e:5a7 with SMTP id
 00721157ae682-6e3224662ffmr1632867b3.5.1728584694780; Thu, 10 Oct 2024
 11:24:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:05 -0700
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
Message-ID: <20241010182427.1434605-4-seanjc@google.com>
Subject: [PATCH v13 03/85] KVM: Add kvm_release_page_unused() API to put pages
 that KVM never consumes
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

Add an API to release an unused page, i.e. to put a page without marking
it accessed or dirty.  The API will be used when KVM faults-in a page but
bails before installing the guest mapping (and other similar flows).

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ee186a1fbaad..ab4485b2bddc 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1216,6 +1216,15 @@ unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t=
 gfn, bool *writable);
 unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
 unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t =
gfn,
 				      bool *writable);
+
+static inline void kvm_release_page_unused(struct page *page)
+{
+	if (!page)
+		return;
+
+	put_page(page);
+}
+
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


