Return-Path: <linuxppc-dev+bounces-2061-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBDB99907E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:33:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXS3QSfz3cTX;
	Fri, 11 Oct 2024 05:27:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584856;
	cv=none; b=ST4wSZ18w3/EoiJ8y8w82zDlKlT1sw0qLLDD+G9Nf45b6K0TX1C4nl4t5eU3EFTQwXcTFTk2x9aZCay/Jms14MdmBrkYOpZrTJ7hXbW22VAx7GQPlupeFG4TliNUkrE77oCIJEnVvIJR6AShzWjycwPHutG04Pseplbut4FwWQaQfDHuVyhjSeOBO4ef9bJ5cFTaZ+Epj1W99DQEiS9BFqDkV2xeBlTA7rcvt7RMzVZTKHqPbyxSB0TQcpK0cVMUHW2GWl/pPFODtYXRnO+DwLtCa8Y/hVC+Adrwa7jwLK/J1SLSvHGCvMrUsPRT1vIhVJ6JSa4Y27bT874WLmCcWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584856; c=relaxed/relaxed;
	bh=fQZoDf0NIFdWK0Ory3IxzF5D2dmoMJWboRGGHV/nWyI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N9HMiuNPUjIJ1lKt/CaH2iSyx2+5BNhtOTW4gSDqawMgGFrzxfW/ncjwXKj1dpJUJ8DyD3901q/89ZIwWDnBkCBkmioTS6blfwAB/9U0vZ0d6L6gFc4+W/58RKhc8dTUA9hgjGBO6prXAQ5cO8fqfQnhjs56zVoxT5uEYZWMdCGrxB8ylUXA+OQ1VNim20G/z2oM53wbHdVkN4t4FQ4DbfDd2n425hdQH+/IBwJilC+qHG+jEPRrU4dyVUvuNyUFGZ3q5QbeX04VBYR+UMO0L0J7rZemR/X0RxxP3dUNWU0zlNAuF7+cL+puCB7BtELeC6F/yJDHPfXpo+DzoDiwKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cKENOt8N; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3lrwizwykdc4cokxtmqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cKENOt8N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3lrwizwykdc4cokxtmqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXR4v4Dz3cSv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:35 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e28d223794so23915687b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584854; x=1729189654; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQZoDf0NIFdWK0Ory3IxzF5D2dmoMJWboRGGHV/nWyI=;
        b=cKENOt8NR+P6qXfZBXfgzQIqGjCTI4Gyo2o3ChG/daIwiWfwzrPlzVnstmjdrmDGk/
         r5GA5dNtaGk6bcAyepqBJNO0rckyyjy5CgGAgEX8t2NRm6YE8WxwHaWR6Uy7pMGyMe27
         CuPbZ8LHSAObWus74iTvIE+exzBym0w6ivu5qHmdeN+iVoJDuMPIw+OrggGtZky2KPm7
         Ngmmsq50b/LPeoizgPMzmuuLcVTRIuE3SdnqjPOAA30hhfB3Izm8iCozfsN6mxgJFGsE
         jN6Yf6lAsG1iXDZsCUs7kckDEVWQ3vIdSo3bFBcDnTNXFDcBsFcMeV+EqBkrq/BVaF21
         tUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584854; x=1729189654;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQZoDf0NIFdWK0Ory3IxzF5D2dmoMJWboRGGHV/nWyI=;
        b=lcAkDF5TC5kBNymaTRfKQcCLAnisPKmfW4tlL1Zh009EWBTUDTYt9Hgw2G89TjUYgr
         WaotSF+ZC47mKydDo+dKncbB3h3LTwIDJylQqIB44paVpvXfELgqi7DEXsEBowR9qZ3/
         mI7/ODc4Bm1dmZBwM9al7MRxaPotawm+O9DnN6U6fZmIqAydQn48oW9cadb6aO/1HtIA
         vbd0BiSn04tXAysZelaGz1KJDTGFHJDIBAC9KNanYX1SER/aoFDkARzDXvZfKTZuGIWs
         7cKMCIoLhLMpQtrZtI7+15gIhJZJCenSlhceC+aGeiWt/5wY511E6QqifiY9BgIG1q9Q
         eBKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBKRL8EwJj4mRFCDopyAYCj7Utyvdb1f/oWWQNARbLnK5shYgmMesTCnVNj9pETOucbC2MdDoKMrfw+Zk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyyrN9WH2FpqarqumWkrmXxSlXPbR3snmWuXZPGAdAplUlAZppZ
	O5DWc/cIo/p3S38kMPGbR6piKRcLBuIYBUSULqpPIySxYg1W5vtZ+AFkD9OgYxNM3avCnngtjn5
	Yfw==
X-Google-Smtp-Source: AGHT+IGkMjnJcd2oWHVLgC5xfQJb4mHLQjnUvb6XgW9ZV8VH9lzrMuhcRfl3e0TBTVqXdJBO9V/Z2ttoh2Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:4091:b0:64a:e220:bfb5 with SMTP id
 00721157ae682-6e32213fbacmr192077b3.1.1728584853563; Thu, 10 Oct 2024
 11:27:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:18 -0700
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
Message-ID: <20241010182427.1434605-77-seanjc@google.com>
Subject: [PATCH v13 76/85] KVM: Add support for read-only usage of gfn_to_page()
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

Rework gfn_to_page() to support read-only accesses so that it can be used
by arm64 to get MTE tags out of guest memory.

Opportunistically rewrite the comment to be even more stern about using
gfn_to_page(), as there are very few scenarios where requiring a struct
page is actually the right thing to do (though there are such scenarios).
Add a FIXME to call out that KVM probably should be pinning pages, not
just getting pages.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  7 ++++++-
 virt/kvm/kvm_main.c      | 15 ++++++++-------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9f7682ece4a1..af928b59b2ab 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1213,7 +1213,12 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 		       struct page **pages, int nr_pages);
=20
-struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn);
+struct page *__gfn_to_page(struct kvm *kvm, gfn_t gfn, bool write);
+static inline struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
+{
+	return __gfn_to_page(kvm, gfn, true);
+}
+
 unsigned long gfn_to_hva(struct kvm *kvm, gfn_t gfn);
 unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t gfn, bool *writable);
 unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1782242a4800..8f8b2cd01189 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3138,25 +3138,26 @@ int kvm_prefetch_pages(struct kvm_memory_slot *slot=
, gfn_t gfn,
 EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
=20
 /*
- * Do not use this helper unless you are absolutely certain the gfn _must_=
 be
- * backed by 'struct page'.  A valid example is if the backing memslot is
- * controlled by KVM.  Note, if the returned page is valid, it's refcount =
has
- * been elevated by gfn_to_pfn().
+ * Don't use this API unless you are absolutely, positively certain that K=
VM
+ * needs to get a struct page, e.g. to pin the page for firmware DMA.
+ *
+ * FIXME: Users of this API likely need to FOLL_PIN the page, not just ele=
vate
+ *	  its refcount.
  */
-struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
+struct page *__gfn_to_page(struct kvm *kvm, gfn_t gfn, bool write)
 {
 	struct page *refcounted_page =3D NULL;
 	struct kvm_follow_pfn kfp =3D {
 		.slot =3D gfn_to_memslot(kvm, gfn),
 		.gfn =3D gfn,
-		.flags =3D FOLL_WRITE,
+		.flags =3D write ? FOLL_WRITE : 0,
 		.refcounted_page =3D &refcounted_page,
 	};
=20
 	(void)kvm_follow_pfn(&kfp);
 	return refcounted_page;
 }
-EXPORT_SYMBOL_GPL(gfn_to_page);
+EXPORT_SYMBOL_GPL(__gfn_to_page);
=20
 int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *=
map,
 		   bool writable)
--=20
2.47.0.rc1.288.g06298d1525-goog


