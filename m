Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 902D174FA81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 00:00:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=e/OHUuoB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0vvW3YxDz3c30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 08:00:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=e/OHUuoB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=34nctzaykdguvhdqmfjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0vtZ1k9Mz307d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 08:00:04 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-57704a25be9so1460977b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 15:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689112801; x=1691704801;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ccVD+v/KXcHhv0uWZezqc41e6QVd7uWNQyLzMUxhDwI=;
        b=e/OHUuoBBcGsOIwFM1ihGsxpoWFlVjzLMAWcIxlED6fy/pQq7H8OwqSGXEvry5gTmX
         4n4LJm3GrKYhp1rDcb2yZjoYmKujuDdwTE/pTr0qBWVQ3Mv7FqTUboTB8BJqLnZ++eP3
         +Z5AMrB4uV2t/Yv3OGB4AzzvzxiLBamqfxXJJchimaePAXxst2FicMRdYA3ExEYktE31
         eN5Wkg4N5lrPnQj1QCrAi02P4cVVslhw60TH3+m1+hFgH21D8rCn0hHB6zVsMmcWGVZt
         f1BVBLr3QqPY8xNPlcA8vnOEbH04GpDVqoNu17fMR6IWcB/HZElSHY1LVXPIBa+K7LMT
         zAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689112801; x=1691704801;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccVD+v/KXcHhv0uWZezqc41e6QVd7uWNQyLzMUxhDwI=;
        b=VsC/1a4WE68HXOHhB8f2qUUdN5JGC2Oo9O8gJiWyAshJ5vE+Itj+6O9YBzZBJp0IcX
         wYOV3QaM8UEr2fid346qZ95dqoKwu67pSNj74nbxbG5ap/fYVLj6Oj2LeP13vkfMEXnr
         SriC9iX5U4wItW858fmHk1gufGWJZeERF65+xBrDkk/TPWTY7Cs+GPFiN+wE1QYpxEFZ
         7EJT3NkbMgOn8x7XjOjsAzRzNU/sWI2fqyK4x54UIdtNE7NT0z/hI/caTLbr4z7E0Ibn
         ghTmkLQZY5yVAaIN6xzxbtJFv6KpgfRdtvV83zYz1WPrpSP9YLjeKqx+URPstFdi1r9x
         27jg==
X-Gm-Message-State: ABy/qLbZy8/XNYO1zZgedSMzatDbQIXvvrQzi5OqC1wRz8XY8N5yJSRS
	TjX4mrkPhi29Zv/EI/u8qscvCRlIf18=
X-Google-Smtp-Source: APBJJlGIAl79q11h5ZhsnevB6cH0mxnTImxDoBGf6sOpWk2D0KKk/yU+n2H4PPFE466tsXaDVFr5sq8QXGg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ae4b:0:b0:56c:ed45:442c with SMTP id
 g11-20020a81ae4b000000b0056ced45442cmr1839ywk.5.1689112800813; Tue, 11 Jul
 2023 15:00:00 -0700 (PDT)
Date: Tue, 11 Jul 2023 14:59:59 -0700
In-Reply-To: <20230711203348.00000fb8.zhi.wang.linux@gmail.com>
Mime-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-4-stevensd@google.com>
 <20230705161914.00004070.zhi.wang.linux@gmail.com> <CAD=HUj5cbzjrc0KD7xcibtRMRCzoJRJAzt7jTHSXUSpzyAYbdg@mail.gmail.com>
 <20230711203348.00000fb8.zhi.wang.linux@gmail.com>
Message-ID: <ZK3Q34WNLjGVQQw+@google.com>
Subject: Re: [PATCH v7 3/8] KVM: Make __kvm_follow_pfn not imply FOLL_GET
From: Sean Christopherson <seanjc@google.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, David Stevens <stevensd@chromium.org>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023, Zhi Wang wrote:
> On Thu, 6 Jul 2023 15:49:39 +0900
> David Stevens <stevensd@chromium.org> wrote:
> 
> > On Wed, Jul 5, 2023 at 10:19___PM Zhi Wang <zhi.wang.linux@gmail.com> wrote:
> > >
> > > On Tue,  4 Jul 2023 16:50:48 +0900
> > > David Stevens <stevensd@chromium.org> wrote:
> > > If yes, do we have to use FOLL_GET to resolve GFN associated with a tail page?
> > > It seems gup can tolerate gup_flags without FOLL_GET, but it is more like a
> > > temporary solution. I don't think it is a good idea to play tricks with
> > > a temporary solution, more like we are abusing the toleration.  
> > 
> > I'm not sure I understand what you're getting at. This series never
> > calls gup without FOLL_GET.
> > 
> > This series aims to provide kvm_follow_pfn as a unified API on top of
> > gup+follow_pte. Since one of the major clients of this API uses an mmu
> > notifier, it makes sense to support returning a pfn without taking a
> > reference. And we indeed need to do that for certain types of memory.
> > 
> 
> I am not having prob with taking a pfn without taking a ref. I am
> questioning if using !FOLL_GET in struct kvm_follow_pfn to indicate taking
> a pfn without a ref is a good idea or not, while there is another flag
> actually showing it.
> 
> I can understand that using FOLL_XXX in kvm_follow_pfn saves some
> translation between struct kvm_follow_pfn.{write, async, xxxx} and GUP
> flags. However FOLL_XXX is for GUP. Using FOLL_XXX for reflecting the
> requirements of GUP in the code path that going to call GUP is reasonable.
> 
> But using FOLL_XXX with purposes that are not related to GUP call really
> feels off.

I agree, assuming you're talking specifically about the logic in hva_to_pfn_remapped()
that handles non-refcounted pages, i.e. this

	if (get_page_unless_zero(page)) {
		foll->is_refcounted_page = true;
		if (!(foll->flags & FOLL_GET))
			put_page(page);
	} else if (foll->flags & FOLL_GET) {
		r = -EFAULT;
	}

should be

	if (get_page_unless_zero(page)) {
		foll->is_refcounted_page = true;
		if (!(foll->flags & FOLL_GET))
			put_page(page);
	else if (!foll->guarded_by_mmu_notifier)
		r = -EFAULT;

because it's not the desire to grab a reference that makes getting non-refcounted
pfns "safe", it's whether or not the caller is plugged into the MMU notifiers.

Though that highlights that checking guarded_by_mmu_notifier should be done for
*all* non-refcounted pfns, not just non-refcounted struct page memory.

As for the other usage of FOLL_GET in this series (using it to conditionally do
put_page()), IMO that's very much related to the GUP call.  Invoking put_page()
is a hack to workaround the fact that GUP doesn't provide a way to get the pfn
without grabbing a reference to the page.  In an ideal world, KVM would NOT pass
FOLL_GET to the various GUP helpers, i.e. FOLL_GET would be passed as-is and KVM
wouldn't "need" to kinda sorta overload FOLL_GET to manually drop the reference.

I do think it's worth providing a helper to consolidate and document that hacky
code, e.g. add a kvm_follow_refcounted_pfn() helper.

All in all, I think the below (completely untested) is what we want?

David (and others), I am planning on doing a full review of this series "soon",
but it will likely be a few weeks until that happens.  I jumped in on this
specific thread because this caught my eye and I really don't want to throw out
*all* of the FOLL_GET usage.

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 5b5afd70f239..90d424990e0a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2481,6 +2481,25 @@ static inline int check_user_page_hwpoison(unsigned long addr)
        return rc == -EHWPOISON;
 }
 
+static kvm_pfn_t kvm_follow_refcounted_pfn(struct kvm_follow_pfn *foll,
+                                          struct page *page)
+{
+       kvm_pfn_t pfn = page_to_pfn(page);
+
+       foll->is_refcounted_page = true;
+
+       /*
+        * FIXME: Ideally, KVM wouldn't pass FOLL_GET to gup() when the caller
+        * doesn't want to grab a reference, but gup() doesn't support getting
+        * just the pfn, i.e. FOLL_GET is effectively mandatory.  If that ever
+        * changes, drop this and simply don't pass FOLL_GET to gup().
+        */
+       if (!(foll->flags & FOLL_GET))
+               put_page(page);
+
+       return pfn;
+}
+
 /*
  * The fast path to get the writable pfn which will be stored in @pfn,
  * true indicates success, otherwise false is returned.  It's also the
@@ -2500,11 +2519,9 @@ static bool hva_to_pfn_fast(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn)
                return false;
 
        if (get_user_page_fast_only(foll->hva, FOLL_WRITE, page)) {
-               *pfn = page_to_pfn(page[0]);
                foll->writable = foll->allow_write_mapping;
-               foll->is_refcounted_page = true;
-               if (!(foll->flags & FOLL_GET))
-                       put_page(page[0]);
+
+               *pfn = kvm_follow_refcounted_pfn(foll, page[0]);
                return true;
        }
 
@@ -2528,7 +2545,6 @@ static int hva_to_pfn_slow(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn)
                return npages;
 
        foll->writable = (foll->flags & FOLL_WRITE) && foll->allow_write_mapping;
-       foll->is_refcounted_page = true;
 
        /* map read fault as writable if possible */
        if (unlikely(!foll->writable) && foll->allow_write_mapping) {
@@ -2540,9 +2556,8 @@ static int hva_to_pfn_slow(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn)
                        page = wpage;
                }
        }
-       *pfn = page_to_pfn(page);
-       if (!(foll->flags & FOLL_GET))
-               put_page(page);
+
+       *pfn = kvm_follow_refcounted_pfn(foll, page);
        return npages;
 }
 
@@ -2610,17 +2625,16 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma, struct kvm_follow_pfn
        if (!page)
                goto out;
 
-       if (get_page_unless_zero(page)) {
-               foll->is_refcounted_page = true;
-               if (!(foll->flags & FOLL_GET))
-                       put_page(page);
-       } else if (foll->flags & FOLL_GET) {
-               r = -EFAULT;
-       }
-
+       if (get_page_unless_zero(page))
+               WARN_ON_ONCE(kvm_follow_refcounted_pfn(foll, page) != pfn);
 out:
        pte_unmap_unlock(ptep, ptl);
-       *p_pfn = pfn;
+
+       if (!foll->is_refcounted_page && !foll->guarded_by_mmu_notifier &&
+           !allow_unsafe_mappings)
+               r = -EFAULT;
+       else
+               *p_pfn = pfn;
 
        return r;
 }

