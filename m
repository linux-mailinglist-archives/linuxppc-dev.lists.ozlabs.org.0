Return-Path: <linuxppc-dev+bounces-1987-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D7A998FDF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:25:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdTN4Bqrz3bkd;
	Fri, 11 Oct 2024 05:24:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584696;
	cv=none; b=POHONm2LKpJT39EqlPYajpRg7Uv+CFAHlGFMoNesXxTAjiJR6gzw68J4ugqTHlVVMLKI8N6gNK94Sb9E1F+DzKmYXAujC1rdSgNtk+7Skg6yegdpZv3z5WN2zMNCTeaYlkGy3ZkQ/zoeNxe4uDFIAdZqvV0Y2Eemf96R6tiER4qQ9nRrvTHCl0LlXZ77uDJO8dJ31psFLzZ/rtdGaR2GrQjZ0atz0ZBtqT+MkphtVgnwXG4qlfLoSUGfgmx0hvy5LK8a8PwY4EVgR7Enm8yPFBG1CiT3LNBZFqGRDDwZWLqEGj+cDLUABZE/tAQOLWDfIlrG55OgCylNHoQ7N7byqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584696; c=relaxed/relaxed;
	bh=yUMe47Ku2d+lU53n+UV6eA4G9zH9pOaBnB7PUsg7n0E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F+Wv8TRppEQmJvd394Sgzd4KYuKUINpJlJgmjbG3RxiBzbgQmfLgvfJEhfMf6RMuVQbufuURDGz558sAkT8bannCSgpD8Qa6QidP1hNbsMabEiUn+pAwZp8QCY4+Pyq03/UhH6oIoGP4og4cEFnPsKnehxezeasFsmdLZcYIhc+kefe0u4FF4rP9TbCAErftS0AkrYnuGI+s8jNtuHGQGIxrRA1US1DZ24+1wSmHRPH2IONwIIoc8HcGvks+83+gVJHqUPGg5ofN80GOkLsBLwVDJiplgA+YdQXUGjz7elgbDriKbRqcriclcooS0HyjBOGDrNIyfeyJoqiUKlOROw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=x9jAxnYm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=39bsizwykdis7tp2yrv33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=x9jAxnYm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=39bsizwykdis7tp2yrv33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdTM4tzhz2yNc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:24:55 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-20c94c1f692so4778105ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584693; x=1729189493; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUMe47Ku2d+lU53n+UV6eA4G9zH9pOaBnB7PUsg7n0E=;
        b=x9jAxnYmIJ2RPUnUqbFnjU52Hx7OQ4aT6MR27Mm/sCHrxwYgxhP69oCT5MDUdsvFOP
         xSermcvY42chBd1LzrBvKn1pvvw6JHRZWuxdMtzi0lLvk2hpJqBxKlyO5N/vlFPH2sFp
         1dAQGs9kLJwmBpSVdszM4zyQw2N9SURjVD5T2tc3SAu/OuX809CS+4T3xNNEgiBYUQvO
         A+74ltMRr8KB2x36kUiQ6nWLGYwHxA+LxxG5o675vafpII6WK7hfwgduJAmIufXSQx86
         x77lBnYpXOFGeJOjzsI59kjslZcFEq3bITW4uo2HydUzN5BfVsnjwObXHEL8jXb6fZnp
         fDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584693; x=1729189493;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yUMe47Ku2d+lU53n+UV6eA4G9zH9pOaBnB7PUsg7n0E=;
        b=gMg/xv8mGUsfGqJVGeBwrkulP++b7PedpjLteKp2lSFRILNUMWn42eNaOcpZKWjEMm
         JoTtMQk20ry+gzGcQ7RhkQEVApjx4CRAAIAt9CUYOU1mpoCixsw1zLdkUwN2NkACSG6t
         Y30+WOOb2trt6ZOmIRKAFyo7JYgTJXoMcTQYwtfiwblPjl/q+/n5bFNCDfS2rNrc4+Bj
         4qPY1pNDNRIq9quTPS9GBP+2K//ooxSqA5drNN92nlZ/6Rs38y0Wjl8cLNJhwMrLVGuU
         UxpDpzkftXeqSvdye+eQs5Ud/HGRINlWKTqExerycKxBbvSh0UpabBeBLtlrm08s+Gxb
         53Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUGuUtBV08ZhvtvEuSuhOmeCvPZsGwTXni0Cu7/cN/+X/zqWvH1v43ArEeoInuu850ImYOWHV4iYs4RtkU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyrbNahJvcTm5kGGp5Amb8izb5jxNg/gkSaKmpJVSk8Y+TM78bH
	hMJ6NLwQEQLf/ucxlORcPtPc4c+LLC+8hMK8ev1ElrtADgjwhF3oMLO7qqwW4J5H31AAAv3eYsc
	XLg==
X-Google-Smtp-Source: AGHT+IHgBvu4/6UpOEaDnS659CK1Rn1/E5r8mTk00ZsUtMRUIXJafj8Ignnkw5WxXqtPYIrr50vXY4UIGHU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:ff02:b0:205:58ee:1567 with SMTP id
 d9443c01a7336-20c80362278mr43175ad.0.1728584692824; Thu, 10 Oct 2024 11:24:52
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:04 -0700
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
Message-ID: <20241010182427.1434605-3-seanjc@google.com>
Subject: [PATCH v13 02/85] KVM: Allow calling kvm_release_page_{clean,dirty}()
 on a NULL page pointer
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

Allow passing a NULL @page to kvm_release_page_{clean,dirty}(), there's no
tangible benefit to forcing the callers to pre-check @page, and it ends up
generating a lot of duplicate boilerplate code.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4b659a649dfa..2032292df0b0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3179,7 +3179,7 @@ static void kvm_set_page_accessed(struct page *page)
=20
 void kvm_release_page_clean(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
=20
 	kvm_set_page_accessed(page);
@@ -3204,7 +3204,7 @@ EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
=20
 void kvm_release_page_dirty(struct page *page)
 {
-	if (WARN_ON(!page))
+	if (!page)
 		return;
=20
 	kvm_set_page_dirty(page);
--=20
2.47.0.rc1.288.g06298d1525-goog


