Return-Path: <linuxppc-dev+bounces-2023-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1A899902E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:29:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVt2b3hz3cFG;
	Fri, 11 Oct 2024 05:26:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584774;
	cv=none; b=HZ1+jHmJnah1N8jyY7LuXXXJGEp6XCKl/n+KAzHu87MXNeYjePSSVnQeo5cgHCnN4qTP88cgT8Cez1IAtXTaLlQ8z9PimQoo63YCqlLIo8WxYXMBjgbScftORJrX9pa/xA3XrXt62snnh1jXuh+z+nIUiqz5WmrG6LbbgcTz9EiWykF++sywzAEbahThOSpUqQim5MnlTx00cpTmpVG8gPCtmdKKjEcq+UaGbt6A/QczNBmKBmT39hw2jYiy9inSDjkeDcEABnNaWmLLIQ4xXRG2BweNpENOdtQiAO5yFz1gIfZuhiW6UfsjooY6YSqQxVkO+ZAPBC7SAr62FEsUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584774; c=relaxed/relaxed;
	bh=UQkfEcPm4BCGA2NCPxYbIcRTjXNaFQKnzNzKtIM0PSc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IMnTBJ/zrsYqqtU4GPGHHsjEaGNA+JiGau7WQG9Y0sf8yecCtGEES6+DBFJEx/2ihnh20YDup+eRmwYPbUk4pJ/1oBOm5mCq7QMzLumOQP/Hx8jn5TL6UbOFvWkaJ8t+QElcefhwdPcJ/rLtjj6fgoRT0hNh7LQ3Ny4NhLLqajXyHC5u6fEMuDXQwpZA7nCsCpQBzEZ3YJBasQmLeJVL800VRxOX+uJ9NEX3QdAj8aMQ6aVTPqUeBXMCgY3BZuR2hueWdCE/+OoLA1bVZWek3F0C182hO1McvKhcq66/iBqy7xF1FYgjtpCnCXhF+XRxwfpbaJxNKtcyiuc9KVWWLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tQmBKlni; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3qhwizwykdnkn95ie7bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tQmBKlni;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3qhwizwykdnkn95ie7bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVs3Dhfz3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:13 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7c6b192a39bso1114724a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584772; x=1729189572; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQkfEcPm4BCGA2NCPxYbIcRTjXNaFQKnzNzKtIM0PSc=;
        b=tQmBKlniQ3c/zWcYefNdyWpaalUyx/7MkBMbNAa9dBcP4O38r4kixF2yRNPqZweMHI
         I6c5JIhjplG5e6VrglEmNfAEqZT46dXvt9o5JzkHDXkJYUKnakfOiyjEy77Ndn89Ftmz
         p/ebLvSRPlI/Y6NbYrQ39l3IzZelvYndMMAdpJUajehMLNCXBwTxacspxkbECeMgT2zH
         1Ipe0shbPmwTBXoNznpbKhDZfIDK7BsIZPVd9tceB7D+Tg9+/m3DY15Qm/XwMdPu33Xa
         D/QJIOQjEoXs7y32XBUG1piCEc8wuTFKJA73rIotxyESVt+A4A41fJyxByxvBJPdReQw
         OOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584772; x=1729189572;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UQkfEcPm4BCGA2NCPxYbIcRTjXNaFQKnzNzKtIM0PSc=;
        b=rIAWBZleJX8R+dSFRdqk6bFY9ZkQhN+13pSJmLgyagyBAmRsI1vU1gyDejsdSdf4Ua
         oqTK4rIHrrwqMQV7aXW0KgkOrvWslCGreSbvksvkPf9iT2zw+/OwQF6SW7svBNzL0QGJ
         3jOim3k+/AY70uI6+M+4HFMU4ygz7N1RA7DaycTuur4uKh9gNOJmEt1OG3UjdF7wLvIy
         6WCNRtAozA8RxClKChedFkHmUerf9BX+zZsiXw5W9fyfN8iTBXx8AP4yCrbWfElHpG2n
         L7vJaU/BXw8IgGe+rdI7K+S6/qpdyNJN5hcFDl30ZoB1b8HO888lWWx7NeWWmVdBfj4D
         Kx/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTn2OSRWikTq8di4c8lKEEv1Ac8n9WPz8AQCs2oBnmp+TMB85CvWvyJdQlm2YwwnnSosjzANOauEU84Vc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywp+h74FUljdrp9qJ84H15NY6d5b3XKbBwFPi71H7bgv7qRekuz
	JUCMsHmS/WKVj0pHoTWnaQVdfhSjeo678VaGoqpRM1+z2QdGzhaNOXKsdRUaWQpNkOnxVlAGnYz
	lVw==
X-Google-Smtp-Source: AGHT+IHq9hr54ORGaKAudrJMY0Hy9bRYjmUvRYz8zAm0RAj3x+bD9YD3f2uWGLgDblXeQYOnnP141duUJXA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:1d03:0:b0:7db:539:893c with SMTP id
 41be03b00d2f7-7ea535a65c6mr17a12.9.1728584770873; Thu, 10 Oct 2024 11:26:10
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:40 -0700
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
Message-ID: <20241010182427.1434605-39-seanjc@google.com>
Subject: [PATCH v13 38/85] KVM: x86/mmu: Put direct prefetched pages via kvm_release_page_clean()
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

Use kvm_release_page_clean() to put prefeteched pages instead of calling
put_page() directly.  This will allow de-duplicating the prefetch code
between indirect and direct MMUs.

Note, there's a small functional change as kvm_release_page_clean() marks
the page/folio as accessed.  While it's not strictly guaranteed that the
guest will access the page, KVM won't intercept guest accesses, i.e. won't
mark the page accessed if it _is_ accessed by the guest (unless A/D bits
are disabled, but running without A/D bits is effectively limited to
pre-HSW Intel CPUs).

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index e451e1b9a55a..62924f95a398 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2965,7 +2965,7 @@ static int direct_pte_prefetch_many(struct kvm_vcpu *=
vcpu,
 	for (i =3D 0; i < ret; i++, gfn++, start++) {
 		mmu_set_spte(vcpu, slot, start, access, gfn,
 			     page_to_pfn(pages[i]), NULL);
-		put_page(pages[i]);
+		kvm_release_page_clean(pages[i]);
 	}
=20
 	return 0;
--=20
2.47.0.rc1.288.g06298d1525-goog


