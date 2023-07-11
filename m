Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C42274F74B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 19:34:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gcTtfGBx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0p0c19cxz3c1k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 03:34:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gcTtfGBx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=zhi.wang.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0nzf0th8z3bkD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 03:34:05 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fb91513b1bso1807098e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 10:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689096837; x=1689701637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUHcTmlGLboH99dkrgeb1BpfM9EbRmwDC30QGqF0lMU=;
        b=gcTtfGBxNI3W3KE0iLlTZvhBuYVZREko9DKFe5SFMuzEkYj5RC4xo1HARnTfb2MjdA
         702P1qnazlVcruisGS2fdboOKOEGWxmN+HH1YM+HlFRC19ljmmt+NqHYbJYzIDYKFKaG
         9CRU2vHqUbSLeXAISMlJhGdaf7iqJex3/f1PQu7t3TERmmWBcRg8WHXIVNIoW8uezqiU
         ryj1vDcWmcw4VC6H0rVf3pyYy88xNitYz9+1ihapUL6E8ZQbOI2kYB6aAfVanObwRd0i
         Iw6O+x+CZOlOOvSm2qxrxLTB4EvsPLIvA4mJNNZzCdpvAVpAwgiCSrenOV21dF319uDU
         G97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689096837; x=1689701637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NUHcTmlGLboH99dkrgeb1BpfM9EbRmwDC30QGqF0lMU=;
        b=Q4ZAsXYRoIFDG1uz5F+v87cK17ajYLFhvJnwwQEHecKB/GeWe/2/YPGTRhAp6NJ44M
         RWpSNnlbluVZzBUDQIaCr1Vh4VaOf/QQecKQhnrm93duGLo7alj1uq/WqbV63vgEGo96
         n9QPSksg/3DEF5BbRq3IKgvdpBinDTE7Eh4XQJI4X8kqWr0CRaW5QLnXfoNzFeQOx5Zh
         riWiIWLlIpK1YQmGt3f0esBnHigREWPzr1DD68lwkNQ2WU9KyBiL24INOh/GiGzfen/U
         AomuAqbBg93cLxS3KATZWToXxzQFh4Vy3j8tXfui/JTzEapxlz3fK8/xttLR3se6szC4
         hQIA==
X-Gm-Message-State: ABy/qLaDwb+zmJnJjNBhkzXhJ4mXpkMUMrHYlv+3ZVB82lrFGUxql3py
	3IVKFQPnRZLl84dZNdkx3Rw=
X-Google-Smtp-Source: APBJJlEnsxOu2vNeScCB8qNrjN1sUqZ3F7LSLMdaAWulAlUHhEHIJhQACgICw14ADBNVFNC8HuwDaQ==
X-Received: by 2002:ac2:4249:0:b0:4fb:9477:f713 with SMTP id m9-20020ac24249000000b004fb9477f713mr10116706lfl.6.1689096836503;
        Tue, 11 Jul 2023 10:33:56 -0700 (PDT)
Received: from localhost (88-115-161-74.elisa-laajakaista.fi. [88.115.161.74])
        by smtp.gmail.com with ESMTPSA id 15-20020ac2482f000000b004fb88fffd19sm394454lft.146.2023.07.11.10.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 10:33:56 -0700 (PDT)
Date: Tue, 11 Jul 2023 20:33:48 +0300
From: Zhi Wang <zhi.wang.linux@gmail.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 3/8] KVM: Make __kvm_follow_pfn not imply FOLL_GET
Message-ID: <20230711203348.00000fb8.zhi.wang.linux@gmail.com>
In-Reply-To: <CAD=HUj5cbzjrc0KD7xcibtRMRCzoJRJAzt7jTHSXUSpzyAYbdg@mail.gmail.com>
References: <20230704075054.3344915-1-stevensd@google.com>
	<20230704075054.3344915-4-stevensd@google.com>
	<20230705161914.00004070.zhi.wang.linux@gmail.com>
	<CAD=HUj5cbzjrc0KD7xcibtRMRCzoJRJAzt7jTHSXUSpzyAYbdg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 6 Jul 2023 15:49:39 +0900
David Stevens <stevensd@chromium.org> wrote:

> On Wed, Jul 5, 2023 at 10:19___PM Zhi Wang <zhi.wang.linux@gmail.com> wrote:
> >
> > On Tue,  4 Jul 2023 16:50:48 +0900
> > David Stevens <stevensd@chromium.org> wrote:
> >  
> > > From: David Stevens <stevensd@chromium.org>
> > >
> > > Make it so that __kvm_follow_pfn does not imply FOLL_GET. This allows
> > > callers to resolve a gfn when the associated pfn has a valid struct page
> > > that isn't being actively refcounted (e.g. tail pages of non-compound
> > > higher order pages). For a caller to safely omit FOLL_GET, all usages of
> > > the returned pfn must be guarded by a mmu notifier.
> > >
> > > This also adds a is_refcounted_page out parameter to kvm_follow_pfn that
> > > is set when the returned pfn has an associated struct page with a valid
> > > refcount. Callers that don't pass FOLL_GET should remember this value
> > > and use it to avoid places like kvm_is_ad_tracked_page that assume a
> > > non-zero refcount.
> > >
> > > Signed-off-by: David Stevens <stevensd@chromium.org>
> > > ---
> > >  include/linux/kvm_host.h | 10 ++++++
> > >  virt/kvm/kvm_main.c      | 67 +++++++++++++++++++++-------------------
> > >  virt/kvm/pfncache.c      |  2 +-
> > >  3 files changed, 47 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > index ef2763c2b12e..a45308c7d2d9 100644
> > > --- a/include/linux/kvm_host.h
> > > +++ b/include/linux/kvm_host.h
> > > @@ -1157,6 +1157,9 @@ unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t gfn,
> > >  void kvm_release_page_clean(struct page *page);
> > >  void kvm_release_page_dirty(struct page *page);
> > >
> > > +void kvm_set_page_accessed(struct page *page);
> > > +void kvm_set_page_dirty(struct page *page);
> > > +
> > >  struct kvm_follow_pfn {
> > >       const struct kvm_memory_slot *slot;
> > >       gfn_t gfn;
> > > @@ -1164,10 +1167,17 @@ struct kvm_follow_pfn {
> > >       bool atomic;
> > >       /* Allow a read fault to create a writeable mapping. */
> > >       bool allow_write_mapping;
> > > +     /*
> > > +      * Usage of the returned pfn will be guared by a mmu notifier. Must  
> >                                               ^guarded  
> > > +      * be true if FOLL_GET is not set.
> > > +      */
> > > +     bool guarded_by_mmu_notifier;
> > >  
> > It seems no one sets the guraded_by_mmu_notifier in this patch. Is
> > guarded_by_mmu_notifier always equal to !foll->FOLL_GET and set by the
> > caller of __kvm_follow_pfn()?  
> 
> Yes, this is the case.
> 
> > If yes, do we have to use FOLL_GET to resolve GFN associated with a tail page?
> > It seems gup can tolerate gup_flags without FOLL_GET, but it is more like a
> > temporary solution. I don't think it is a good idea to play tricks with
> > a temporary solution, more like we are abusing the toleration.  
> 
> I'm not sure I understand what you're getting at. This series never
> calls gup without FOLL_GET.
> 
> This series aims to provide kvm_follow_pfn as a unified API on top of
> gup+follow_pte. Since one of the major clients of this API uses an mmu
> notifier, it makes sense to support returning a pfn without taking a
> reference. And we indeed need to do that for certain types of memory.
> 

I am not having prob with taking a pfn without taking a ref. I am
questioning if using !FOLL_GET in struct kvm_follow_pfn to indicate taking
a pfn without a ref is a good idea or not, while there is another flag
actually showing it.

I can understand that using FOLL_XXX in kvm_follow_pfn saves some
translation between struct kvm_follow_pfn.{write, async, xxxx} and GUP
flags. However FOLL_XXX is for GUP. Using FOLL_XXX for reflecting the
requirements of GUP in the code path that going to call GUP is reasonable.

But using FOLL_XXX with purposes that are not related to GUP call really
feels off. Those flags can be changed in future because of GUP requirements.
Then people have to figure out what actually is happening with FOLL_GET here
as it is not actually tied to GUP calls.


> > Is a flag like guarded_by_mmu_notifier (perhaps a better name) enough to
> > indicate a tail page?  
> 
> What do you mean by to indicate a tail page? Do you mean to indicate
> that the returned pfn refers to non-refcounted page? That's specified
> by is_refcounted_page.
>

I figured out the reason why I got confused.

+	 * Otherwise, certain IO or PFNMAP mappings can be backed with valid
+	 * struct pages but be allocated without refcounting e.g., tail pages of
+	 * non-compound higher order allocations. If FOLL_GET is set and we
+	 * increment such a refcount, then when that pfn is eventually passed to
+	 * kvm_release_pfn_clean, its refcount would hit zero and be incorrectly
+	 * freed. Therefore don't allow those pages here when FOLL_GET is set.
 	 */ 

The above statements only explains the wrong behavior, but doesn't explain the
expected behavior. It would be better to explain that for manipulating mmu
notifier guard page (!FOLL_GET), we put back the reference taken by GUP.
FOLL_GET stuff really confused me a lot.

-	if (!kvm_try_get_pfn(pfn))
+	page = kvm_pfn_to_refcounted_page(pfn);
+	if (!page)
+		goto out;
+
+	if (get_page_unless_zero(page)) {
+		foll->is_refcounted_page = true;
+		if (!(foll->flags & FOLL_GET))
+			put_page(page);
+	} else if (foll->flags & FOLL_GET) {
 		r = -EFAULT;
+	}

> -David

