Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A18759CC0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 19:48:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ArpFLxX4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5jwk0gbRz3cGl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 03:48:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ArpFLxX4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3vyg4zaykdba8uq3zsw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5jvl232vz3c1m
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 03:47:46 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c361777c7f7so1771337276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 10:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689788864; x=1692380864;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZrpSlfvy8CWa29HQgq0qreuIOXt/Wldn9lf0s+IQ19g=;
        b=ArpFLxX4pd+nE6yhxk4kfQsyY2cBj0283wyB2UFD4pQNpbkrc+ZAbqxw+z+OgClanI
         8Bmj2Z7j2c1NhNgCvBdv83cjgOHHCOOMDHYftHtZeAL3vo412/Xbeep/S+CdApdBGNVE
         aduoGH7mk12lxFjmYh58eVW/1Ksc0OT9NLaSC1w5eMBSYs+0sTNoL7N0w3aZ0n2P+aH0
         VnFxLOrHPJ9r2ezOXOfj0cBYblwBN0Ye2w9Cgtba6HWxXo2yyLAo7PNbRfr5GAzKlZhF
         ic8thdmStV5nJQreXCY0jlMVC8WTwDKkeNH3l7/QHaf5X+Z1Dsac59JBXIEJlOoDRy4l
         I3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689788864; x=1692380864;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZrpSlfvy8CWa29HQgq0qreuIOXt/Wldn9lf0s+IQ19g=;
        b=ZIWH1o0Y+iUq66BRcNZ5CYsxJ/ekH54WA7yspWA7Yxc1PrH7ohgYdu3gkQHTomQJNl
         XkyOVJiuyQFbu1KJTv+tlOr9lnNjHp2TDR8YiHbChxCQzjvd9UefHZwRjKz5gdQ506PO
         bqjEL5a944UvZaQy0/aoPfnjchbSAaZmPGSiq+iu5CtcEZS4tzID+VBzTD+Ov9mNLDkK
         AWd6YmqFLgYWjk/2Y1O7S6ya5i3Wu1jU/cX9iKz32RBWvVeqtv9duq6qheuTj8DQUMWC
         OP4xqv7pYYXtzV3bM78ZSDFTyBhc9GeZn5wrAXxcg0ye9sqDlqGp+S6FEbomYlkuQlLy
         Bp2w==
X-Gm-Message-State: ABy/qLbj/APY+RfvVNRDZDxsIHzbV3oLcRDbEZ/PV5xaCxyedUZik1Dz
	lstTaNPR3eJlynzsR5Y/TYYpyNL4fwg=
X-Google-Smtp-Source: APBJJlFlYUVvIIObTojpJ8UchQ4CwQtQGAVrCh++KpJ7LgJpdZRIA9xQwbGLQUVWTMKWnIrBZUJv99cvfhs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:f509:0:b0:ca3:3341:6315 with SMTP id
 a9-20020a25f509000000b00ca333416315mr42238ybe.0.1689788863726; Wed, 19 Jul
 2023 10:47:43 -0700 (PDT)
Date: Wed, 19 Jul 2023 10:47:41 -0700
In-Reply-To: <CAGtprH9a2jX-hdww9GPuMrO9noNeXkoqE8oejtVn2vD0AZa3zA@mail.gmail.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <CAGtprH9a2jX-hdww9GPuMrO9noNeXkoqE8oejtVn2vD0AZa3zA@mail.gmail.com>
Message-ID: <ZLghvU4QzE0PtfNG@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver
  Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 19, 2023, Vishal Annapurve wrote:
> On Tue, Jul 18, 2023 at 4:49=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > ...
> > +static int kvm_gmem_error_page(struct address_space *mapping, struct p=
age *page)
> > +{
> > +       struct list_head *gmem_list =3D &mapping->private_list;
> > +       struct kvm_memory_slot *slot;
> > +       struct kvm_gmem *gmem;
> > +       unsigned long index;
> > +       pgoff_t start, end;
> > +       gfn_t gfn;
> > +
> > +       filemap_invalidate_lock_shared(mapping);
> > +
> > +       start =3D page->index;
> > +       end =3D start + thp_nr_pages(page);
> > +
> > +       list_for_each_entry(gmem, gmem_list, entry) {
> > +               xa_for_each_range(&gmem->bindings, index, slot, start, =
end - 1) {
> > +                       for (gfn =3D start; gfn < end; gfn++) {
> > +                               if (WARN_ON_ONCE(gfn < slot->base_gfn |=
|
> > +                                               gfn >=3D slot->base_gfn=
 + slot->npages))
> > +                                       continue;
> > +
> > +                               /*
> > +                                * FIXME: Tell userspace that the *priv=
ate*
> > +                                * memory encountered an error.
> > +                                */
> > +                               send_sig_mceerr(BUS_MCEERR_AR,
> > +                                               (void __user *)gfn_to_h=
va_memslot(slot, gfn),
> > +                                               PAGE_SHIFT, current);
>=20
> Does it make sense to replicate what happens with MCE handling on
> tmpfs backed guest memory:
> 1) Unmap gpa from guest
> 2) On the next guest EPT fault, exit to userspace to handle/log the
> mce error for the gpa.

Hmm, yes, that would be much better.  Ah, and kvm_gmem_get_pfn() needs to c=
heck
folio_test_hwpoison() and potentially PageHWPoison().  E.g. if the folio is=
 huge,
KVM needs to restrict the mapping to order-0 (target page isn't poisoned), =
or
return KVM_PFN_ERR_HWPOISON (taget page IS poisoned).

Alternatively, KVM could punch a hole in kvm_gmem_error_page(), but I don't=
 think
we want to do that because that would prevent forwarding the #MC to the gue=
st.
