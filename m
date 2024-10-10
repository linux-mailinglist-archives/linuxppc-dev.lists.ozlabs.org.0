Return-Path: <linuxppc-dev+bounces-2070-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FE4999091
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:34:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXq4gpGz3cW2;
	Fri, 11 Oct 2024 05:27:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::54a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584875;
	cv=none; b=aEMNLNAsPddO72klcSry+1eEKRfrPzZvq64j9Ks244dUZdIGu5HIUm1/c5G1f27OsYw2rS7vNIyz6dGTPl83f0dl43P8xR8v/Zq4/+vDe+rWx05sYgkQj6zWO5rFhDY6htkwpoJ3GTQpl/p+U+osdd5C9u0m7JMMqA9aowrjFWd2NfwifxeKW4tlT3ealwtVescnteo5Feph3pZ3is5mm+XHDIzg0NtFmB6UaHFEhlLCHzkyfDU0RqLw98rnri/s4orI1Xvaep7uSf8YP7lCoGzXdOlLkgW+/wAWRhL2VyXaw5CkPUuHg1XWVpzMb/pkO5ExXYh08TYoCsTcL+cJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584875; c=relaxed/relaxed;
	bh=nwXbeHTlA0ocP8s6EMi2R3V8WkxZqKgY3fo4QQ/WBXk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AEz9VtA30Sqh1Exd11vLkSESY7IiMFzhdsaB/251t2ehXQcRVBMsBSxOxBTrgjoISrr+GXFXd+scyIMTHwQEMcJqRAk6g6tAoCO0LNpko7Hcf8URTN7RsSkyi8henZm4PTEKwj7/YlXWRgxwrbciWA9xL0nJk1pGu9N66fkgocQGseF/ons7aUCEqkXoZsppKNh5Wm+JT7DJWZwpi0j6jr/5e/Z/zgyc1VLKNkKAOcZJ2iOlk67oLTnaDlxrmeHvCg0BtARAl2oDqA17fOYSnguPzjh6qjcqsyXH1VI7RRzbgX+W4WGxvUkMcjrFfKVg9VkVVsXYYvFvyKJjbKpDUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jbGS6MU0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3qbwizwykdeevhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jbGS6MU0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3qbwizwykdeevhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXp5Mc9z3cVf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:54 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7c6a9c1a9b8so928987a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584873; x=1729189673; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwXbeHTlA0ocP8s6EMi2R3V8WkxZqKgY3fo4QQ/WBXk=;
        b=jbGS6MU02Ay2NJEW+ZaIfhdDCvNjB8k0ghYW+0NW2cpwAeJj7Gg7sj06RQie6tnmJM
         6nIu/CagFtpETzP0F6YeB3ix5p4qXAiXbMQSVsOynizbpEUZJ0cgbiRJXjCVm9JOUI6n
         PdbBQUa2/u6aHf7P7hU1OUD/lY9+5GqKuubbpBSc6WFzplR6399L229oKqAQqLGDcMpa
         QlA4DszVfbOMqB4Fr2KFBD/Wcqb6bNkRbfF7G9LFFyKaf27/WBJTANtiizGgUVyIqiBy
         h8kkm3nOqnJVe4fqg/7ETZi9oxFhhNJo+dpg7XWUK3+999hklnCaEkJCujVis3z4Kpqx
         9R7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584873; x=1729189673;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nwXbeHTlA0ocP8s6EMi2R3V8WkxZqKgY3fo4QQ/WBXk=;
        b=MNUe3lF1MxVqZuNACawqdeEO4d8qKxywKKeusqWtoeACvVDt8z5YTU1aUp6Lahx781
         IiqT7C0tqEHxnG09yxv/+7sX6vkmEqIlm0nqED+xgvyy5GPQ60Q+IW/gw7UxKfasMAb0
         j3CwtHVXP2mWk2akW0QsLQw1VjRblOw6tWeIRMYzT88APjICBnlFJ92f687WhOrOYGiS
         +RnPzb1dE/pg+ScUFAT8OfDn/emVsqhCOIb1ALcsMGOPAoJTvkpMrS54lwvJATyByWg1
         t8BhEBL6usRmenelJi+Dm2C/XQLcg7q6YuXUesdA3V66T98i6DsftWPB4f4cWAWU9xmP
         UTQA==
X-Forwarded-Encrypted: i=1; AJvYcCVFHBjKZ1pu+3MJSUBa4/yhyp2/gdbgBhoCg21TXhmMw83d4FItABiZcY/NO2aIldTskAWF/CbUR76hwu8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyOXCMMdIaI88RAOGQfUKWQvnh08rn02QdO4QSRrhUm0k6NaLUZ
	QN30iGekn3rYIpBr6M6Ag2e7p93gCYbwj0sJkvmVEf3g53MjNbVQF1WzXIeY4V+o330z5Du3Vv6
	iSQ==
X-Google-Smtp-Source: AGHT+IHZp/jcJ6VF/U4r8Ds8cBqCm7oOG+WyWj8b167iLxGpwwfpynwEnbVm0Ou2T4AqluEw0PW/YyS/yKE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:e715:0:b0:7d5:d088:57d4 with SMTP id
 41be03b00d2f7-7ea535b6b4fmr26a12.9.1728584872016; Thu, 10 Oct 2024 11:27:52
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:27 -0700
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
Message-ID: <20241010182427.1434605-86-seanjc@google.com>
Subject: [PATCH v13 85/85] KVM: Don't grab reference on VM_MIXEDMAP pfns that
 have a "struct page"
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

Now that KVM no longer relies on an ugly heuristic to find its struct page
references, i.e. now that KVM can't get false positives on VM_MIXEDMAP
pfns, remove KVM's hack to elevate the refcount for pfns that happen to
have a valid struct page.  In addition to removing a long-standing wart
in KVM, this allows KVM to map non-refcounted struct page memory into the
guest, e.g. for exposing GPU TTM buffers to KVM guests.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  3 --
 virt/kvm/kvm_main.c      | 75 ++--------------------------------------
 2 files changed, 2 insertions(+), 76 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d045f8310a48..02f0206fd2dc 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1730,9 +1730,6 @@ void kvm_arch_sync_events(struct kvm *kvm);
=20
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu);
=20
-struct page *kvm_pfn_to_refcounted_page(kvm_pfn_t pfn);
-bool kvm_is_zone_device_page(struct page *page);
-
 struct kvm_irq_ack_notifier {
 	struct hlist_node link;
 	unsigned gsi;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 396ca14f18f3..b1b10dc408a0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -160,52 +160,6 @@ __weak void kvm_arch_guest_memory_reclaimed(struct kvm=
 *kvm)
 {
 }
=20
-bool kvm_is_zone_device_page(struct page *page)
-{
-	/*
-	 * The metadata used by is_zone_device_page() to determine whether or
-	 * not a page is ZONE_DEVICE is guaranteed to be valid if and only if
-	 * the device has been pinned, e.g. by get_user_pages().  WARN if the
-	 * page_count() is zero to help detect bad usage of this helper.
-	 */
-	if (WARN_ON_ONCE(!page_count(page)))
-		return false;
-
-	return is_zone_device_page(page);
-}
-
-/*
- * Returns a 'struct page' if the pfn is "valid" and backed by a refcounte=
d
- * page, NULL otherwise.  Note, the list of refcounted PG_reserved page ty=
pes
- * is likely incomplete, it has been compiled purely through people wantin=
g to
- * back guest with a certain type of memory and encountering issues.
- */
-struct page *kvm_pfn_to_refcounted_page(kvm_pfn_t pfn)
-{
-	struct page *page;
-
-	if (!pfn_valid(pfn))
-		return NULL;
-
-	page =3D pfn_to_page(pfn);
-	if (!PageReserved(page))
-		return page;
-
-	/* The ZERO_PAGE(s) is marked PG_reserved, but is refcounted. */
-	if (is_zero_pfn(pfn))
-		return page;
-
-	/*
-	 * ZONE_DEVICE pages currently set PG_reserved, but from a refcounting
-	 * perspective they are "normal" pages, albeit with slightly different
-	 * usage rules.
-	 */
-	if (kvm_is_zone_device_page(page))
-		return page;
-
-	return NULL;
-}
-
 /*
  * Switches to specified vcpu, until a matching vcpu_put()
  */
@@ -2804,35 +2758,10 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_=
pfn *kfp, struct page *page,
 	if (kfp->map_writable)
 		*kfp->map_writable =3D writable;
=20
-	/*
-	 * FIXME: Remove this once KVM no longer blindly calls put_page() on
-	 *	  every pfn that points at a struct page.
-	 *
-	 * Get a reference for follow_pte() pfns if they happen to point at a
-	 * struct page, as KVM will ultimately call kvm_release_pfn_clean() on
-	 * the returned pfn, i.e. KVM expects to have a reference.
-	 *
-	 * Certain IO or PFNMAP mappings can be backed with valid struct pages,
-	 * but be allocated without refcounting, e.g. tail pages of
-	 * non-compound higher order allocations.  Grabbing and putting a
-	 * reference to such pages would cause KVM to prematurely free a page
-	 * it doesn't own (KVM gets and puts the one and only reference).
-	 * Don't allow those pages until the FIXME is resolved.
-	 *
-	 * Don't grab a reference for pins, callers that pin pages are required
-	 * to check refcounted_page, i.e. must not blindly release the pfn.
-	 */
-	if (map) {
+	if (map)
 		pfn =3D map->pfn;
-
-		if (!kfp->pin) {
-			page =3D kvm_pfn_to_refcounted_page(pfn);
-			if (page && !get_page_unless_zero(page))
-				return KVM_PFN_ERR_FAULT;
-		}
-	} else {
+	else
 		pfn =3D page_to_pfn(page);
-	}
=20
 	*kfp->refcounted_page =3D page;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


