Return-Path: <linuxppc-dev+bounces-2014-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A012899901A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:28:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVX3fr3z3c3D;
	Fri, 11 Oct 2024 05:25:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584756;
	cv=none; b=n7ugMpBBV/Dv6YgP4DUwKHZ182z7wcO0pUFMyd6KCUsl4npmnb4MuV+p4Y3DyLuD5NZ7c9AvRonwXTzMyw76zT3J52ADssd1nFR3CUZTpJ6kQE6xdoedd2pBBSm2FdlhUkfpoX209YcRX3JhjEzOKiBvRoDos+u78WuonxeFS0qdamicPeC6QatuWlzIdDpzp5khiAVacg6OQbdp1Ln/6d2omwdpRbbF6/eT6pFr+ka6kWB4C5Xd8AYH3xzXcdskDdp+Gw6TjdLDozWPzOWPM1owuoYQf+1o508ohXla7jaYdtUkm6/Dy6xWc0SbwGGsT76OfhIFOYyfsG4ktrqUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584756; c=relaxed/relaxed;
	bh=nXVCtJlFVF227JmXan6PsTRYgw7//koA3Av9lMmMw70=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aSK18oq6Sz12uTlTcP2xlRiTMGxfxaNhPzhVzAbiGJDIe9rrtgLLivWgHsq76bMvleDpaCZwUJbsDsaorTcYGsOWehWHVFs4fkiXdv6lsttl3MNPAEzhMua4htirdkYX6Ng7jc4hiyM6uUT9vXq4loyqE9hKrYzP3u5ohFzniKeerJLw/eo9O6Ez/CnQ1CUh823FDRY7CVdK3LVs5Isad/JtQUtP64J0sD9rCKK4Jb0lRvx+GQ2ID/NsDdjESTnAyGvTR1TukjssoC4+VzlxA68XgDS+Ot06p7qLa2LND1b2y8PZsJWgu/Ja3PH4n1zRiOuZCc/ihPf88fHtNJDNPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K/dPEsUN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3mrwizwykdmg6so1xqu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K/dPEsUN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3mrwizwykdmg6so1xqu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVW3Yr8z3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:55 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0353b731b8so1674282276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584753; x=1729189553; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXVCtJlFVF227JmXan6PsTRYgw7//koA3Av9lMmMw70=;
        b=K/dPEsUNgb4JTIPrOybjx5NWxWjpbcAUhUizgy7kCdXma5Q+TUKEi2IhDvMP3n4MOg
         dlJ0BwNKyipsTYmzv6ZDFIBUrqWVmhFoJL6MLG/3sNsyHL1GpcCZtHXqDkYokB6H3Pv/
         Hy+r3qmomvtD+mFSOQXKG0X0BasHltkPPAeNx5s1kI6rF6FrAsOCSgtpOCP0B7LUSJw4
         olVVSsajV2/mtCviZqEFteGY+5HPxThnr1NeiroT1W+JXrFRkYisPArYsk1uUYdfXxRt
         CtVr9HXzVGU7kEqTNHveZFg9GCLwzjOH/Ed6x5yiP6EcdDYrfKqNYpnA/eKeqTx0/TFf
         IfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584753; x=1729189553;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nXVCtJlFVF227JmXan6PsTRYgw7//koA3Av9lMmMw70=;
        b=SJN0N1MvW3APo4ARorQq+pknZxW6AUTgNbvzMODtUlWLf81GEDsWNdfduJ/qmf8Gh3
         ndJqb24v6/XkTvaTtz6C7MpNKMkp2SPUhTaIW5KANi3F9/eVbESwfAXWqikfwGww/4Cm
         Bcedadzk4u2WowghNuXU684jXMGxEHcJDv+BVrsYFn3/FUZ7ePFd9j88R3HoyFhF/wOr
         3jEvB7tcnBL8jD4c/OLyzDI4elXokWy4mfz42jN/hKPt9Imqn1vg9eCpMlfdQ18fLIXw
         TekVdoj+Qz4nkH5h76hEtsvsMVn5QQLnK9TUQkOyG3gJPzDmSC+qnqCesXaL/qjWNIOt
         Catg==
X-Forwarded-Encrypted: i=1; AJvYcCUWFcCQq2x84ALnHl9tcxtv8ALqOV1WDzIE10hUQ1FNPYSOShrWiV5manuQcFdlo6254ApekWYpSsvWHA8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyCcNeh6FWB/bbyTwb+H2T93yz5kKgLY6qVceBfryv4UtIHx7UV
	Y2FhtWQMWeDr+TDs9jU+lkRgtkU9l7TcMdUVdnqetUPkBleCgJCHQmF0QIgFszFReELdY0XNu04
	9Ug==
X-Google-Smtp-Source: AGHT+IFqzRS1xOg2oJDncuDOdOtR7gITdwbfvBFuJ4xWEWgDQEplutdiZUKmbH0mIVak18Oaak6LM032atM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:b205:0:b0:e25:17cb:352e with SMTP id
 3f1490d57ef6-e28fe43f3f5mr4095276.9.1728584753336; Thu, 10 Oct 2024 11:25:53
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:31 -0700
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
Message-ID: <20241010182427.1434605-30-seanjc@google.com>
Subject: [PATCH v13 29/85] KVM: pfncache: Precisely track refcounted pages
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

Track refcounted struct page memory using kvm_follow_pfn.refcounted_page
instead of relying on kvm_release_pfn_clean() to correctly detect that the
pfn is associated with a struct page.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/pfncache.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index 067daf9ad6ef..728d2c1b488a 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -159,11 +159,14 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_c=
ache *gpc)
 	kvm_pfn_t new_pfn =3D KVM_PFN_ERR_FAULT;
 	void *new_khva =3D NULL;
 	unsigned long mmu_seq;
+	struct page *page;
+
 	struct kvm_follow_pfn kfp =3D {
 		.slot =3D gpc->memslot,
 		.gfn =3D gpa_to_gfn(gpc->gpa),
 		.flags =3D FOLL_WRITE,
 		.hva =3D gpc->uhva,
+		.refcounted_page =3D &page,
 	};
=20
 	lockdep_assert_held(&gpc->refresh_lock);
@@ -198,7 +201,7 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cac=
he *gpc)
 			if (new_khva !=3D old_khva)
 				gpc_unmap(new_pfn, new_khva);
=20
-			kvm_release_pfn_clean(new_pfn);
+			kvm_release_page_unused(page);
=20
 			cond_resched();
 		}
@@ -218,7 +221,7 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_cac=
he *gpc)
 			new_khva =3D gpc_map(new_pfn);
=20
 		if (!new_khva) {
-			kvm_release_pfn_clean(new_pfn);
+			kvm_release_page_unused(page);
 			goto out_error;
 		}
=20
@@ -236,11 +239,11 @@ static kvm_pfn_t hva_to_pfn_retry(struct gfn_to_pfn_c=
ache *gpc)
 	gpc->khva =3D new_khva + offset_in_page(gpc->uhva);
=20
 	/*
-	 * Put the reference to the _new_ pfn.  The pfn is now tracked by the
+	 * Put the reference to the _new_ page.  The page is now tracked by the
 	 * cache and can be safely migrated, swapped, etc... as the cache will
 	 * invalidate any mappings in response to relevant mmu_notifier events.
 	 */
-	kvm_release_pfn_clean(new_pfn);
+	kvm_release_page_clean(page);
=20
 	return 0;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


