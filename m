Return-Path: <linuxppc-dev+bounces-2064-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFF3999085
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:33:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXb1YZHz3cV1;
	Fri, 11 Oct 2024 05:27:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584863;
	cv=none; b=iiifUsHFanlhXYLC0m6QnIXbZhEpcFZiUzWhdIazkPYNUU16YyhZGl9rkQEf3n8t7pDCj1K5UoMmGetJq6tZRcv5rn4/7g8ciNthL74JBA+8pte8MRACY4cNla+VBAIqwAmy6i+8PmO2fee3mQVY3SO08kKyYIA+E+aznJcjA4OfrcF4dY5TpXd+Uye27ghy+VHLB64RCo2weS5ygyiDDWXnsNTA2W6puOmwvTFbycAeUw0aZrzynVE6FtM9oV8xe0C+mI2ei+yecGIcOajEIz5zEB5HrJaAYAv8A34n5OKUlzXX+kyJjpJPQV3REASfnSoCbTQYBFwGf7Kt+oR/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584863; c=relaxed/relaxed;
	bh=Q1MnEbvSXNK1DBYHKiiPeGTlNBdM3PqCgrnaMRmX38Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZCvqBLIBhtJqg9U42Rujm5GCnteqmsI3ZYUvR5gyfWuY3H9X8nuHprRjr3y6KQQalY9OYZ/J6PJy60VFeb2d8+VsWZGwiDS+dBBuT7gNNbj52Ox6Va+RE1atm2M6pEIxj58qCiiM3htOpvNC6nrRhTQ4ub/dS0uESqKPLJv0nR2VvGVn3yj/R3BXPy0ICPyd1W8g5z0McEU6l0bI27C9taqbhzQQlWosnfG/cIBpxYKSXjW5D1rZ0jQTN0gFeSEv9O+59jpKrmOtBIIzbjGycZKdgEfaQzTahYNTtP1+qX5eZw/ahSmg0BpIaHNkKNMhuwNlVxaS6zNFZJiv3pMdKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JGkeeIrf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3mxwizwykddqiuqdzsweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JGkeeIrf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3mxwizwykddqiuqdzsweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXZ1Nb0z3blH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:42 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e28fea2adb6so1488994276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584860; x=1729189660; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1MnEbvSXNK1DBYHKiiPeGTlNBdM3PqCgrnaMRmX38Y=;
        b=JGkeeIrf3jX+He5OLyZBTyl8tSTthrCYPEvflOn4phkg7AhyPi29Rx0MzJg4pMIBEX
         VQz/de+Xob4CdIfmrqVNu3IRzdA369eZ72lrKbCYu5ZXckgpvJTrG8fK5qLdl5oI86vi
         bdH54Y8hwR8UKTFtK3K6v0xSDPfhc8eyHAuka2S7qExqMsOFxIZZ8waJFIm4uaZg//Ha
         IwiLOflN3Iuj+ZIeZN1zHGr7mQWpA9g6giLv+9ZXXv3jbHJV1gBvQAoKNvp2U1J6f/m9
         J5EA9Aof+JIQQGlERyQXt+Y/gUI1V+wYuckHEyCkzWeKM2x6myzzAXNcD0qVLuXtWWr6
         O8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584860; x=1729189660;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q1MnEbvSXNK1DBYHKiiPeGTlNBdM3PqCgrnaMRmX38Y=;
        b=FFxRzSngdPa+Vt2yBgO5nN3Jj3p/cESR5tMNDc/VJhEZIzHhO9s4wRfAhaXY6v2NWS
         rnEQhBK/4AI9+zkV1/b3Eb8GgucumTrTAj2vmdXEk+tYSkReFcmDr3WEhp+jgWacDAVb
         P9xEc3ZDpADjm695mZGUdGlc+DVw3q64XaLDJa6DPwT01gHI5f0gPiR+Vy2CuzWXUURR
         GfBUKbKnp6E5NdIWT277fTWPG4qhc2iT2j6lW8w+igwQ67ZYjpH/KHT+uW/XUT9blQkL
         LtFRVH1DSk+P5h5Lu2rw3v4zhI39huR0BMoRcAFsi4oDp75H2ZMiM9gawMTW1GMQ0E2L
         tp1g==
X-Forwarded-Encrypted: i=1; AJvYcCV3iMoQBGFrIl3xF2Y8TRSRa1xtFBVtAQr2RlvqaPKgP96iYl0206sIPbBEOWi2zG86FmZuKtrAj9M3hqw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwvsVfklQrV4qmg57xob9PE/AbkP7BM9CL2jxOFgRIR/CN6WsgD
	MlR9TskiIc/RtU4oJnIepK1aFbGcfJLufvtWP0I6bWmts1xqqsmBvC5nHz4gKwDvTA8y9cDilgA
	+Lw==
X-Google-Smtp-Source: AGHT+IGvHgo281GUU728l2kpqfRNdoQ8M4AtWxtMdwK+Sbd/Nmo7aGxeBXrCmxWS+HWzNnhFIgaVqhxkocM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:f20e:0:b0:e11:5da7:337 with SMTP id
 3f1490d57ef6-e28fe3505c2mr129032276.3.1728584859805; Thu, 10 Oct 2024
 11:27:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:21 -0700
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
Message-ID: <20241010182427.1434605-80-seanjc@google.com>
Subject: [PATCH v13 79/85] KVM: Drop gfn_to_pfn() APIs now that all users are gone
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

Drop gfn_to_pfn() and all its variants now that all users are gone.

No functional change intended.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 11 --------
 virt/kvm/kvm_main.c      | 59 ----------------------------------------
 2 files changed, 70 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index af928b59b2ab..4a1eaa40a215 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1274,14 +1274,6 @@ static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_v=
cpu *vcpu, gfn_t gfn,
 				 write ? FOLL_WRITE : 0, writable, refcounted_page);
 }
=20
-kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
-kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
-		      bool *writable);
-kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn=
);
-kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t g=
fn,
-			       bool interruptible, bool no_wait,
-			       bool write_fault, bool *writable);
-
 void kvm_release_pfn_clean(kvm_pfn_t pfn);
 void kvm_release_pfn_dirty(kvm_pfn_t pfn);
 void kvm_set_pfn_dirty(kvm_pfn_t pfn);
@@ -1356,9 +1348,6 @@ unsigned long kvm_host_page_size(struct kvm_vcpu *vcp=
u, gfn_t gfn);
 void mark_page_dirty_in_slot(struct kvm *kvm, const struct kvm_memory_slot=
 *memslot, gfn_t gfn);
 void mark_page_dirty(struct kvm *kvm, gfn_t gfn);
=20
-
-kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
-
 int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *=
map,
 		   bool writable);
 void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8f8b2cd01189..b2c8d429442d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3039,65 +3039,6 @@ static kvm_pfn_t kvm_follow_pfn(struct kvm_follow_pf=
n *kfp)
 	return hva_to_pfn(kfp);
 }
=20
-kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t g=
fn,
-			       bool interruptible, bool no_wait,
-			       bool write_fault, bool *writable)
-{
-	struct kvm_follow_pfn kfp =3D {
-		.slot =3D slot,
-		.gfn =3D gfn,
-		.map_writable =3D writable,
-	};
-
-	if (write_fault)
-		kfp.flags |=3D FOLL_WRITE;
-	if (no_wait)
-		kfp.flags |=3D FOLL_NOWAIT;
-	if (interruptible)
-		kfp.flags |=3D FOLL_INTERRUPTIBLE;
-
-	return kvm_follow_pfn(&kfp);
-}
-EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
-
-kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
-		      bool *writable)
-{
-	struct kvm_follow_pfn kfp =3D {
-		.slot =3D gfn_to_memslot(kvm, gfn),
-		.gfn =3D gfn,
-		.flags =3D write_fault ? FOLL_WRITE : 0,
-		.map_writable =3D writable,
-	};
-
-	return kvm_follow_pfn(&kfp);
-}
-EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
-
-kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn=
)
-{
-	struct kvm_follow_pfn kfp =3D {
-		.slot =3D slot,
-		.gfn =3D gfn,
-		.flags =3D FOLL_WRITE,
-	};
-
-	return kvm_follow_pfn(&kfp);
-}
-EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
-
-kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn)
-{
-	return gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn);
-}
-EXPORT_SYMBOL_GPL(gfn_to_pfn);
-
-kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn)
-{
-	return gfn_to_pfn_memslot(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn);
-}
-EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
-
 kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
 			    unsigned int foll, bool *writable,
 			    struct page **refcounted_page)
--=20
2.47.0.rc1.288.g06298d1525-goog


