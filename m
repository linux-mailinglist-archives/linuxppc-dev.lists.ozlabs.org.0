Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F4169737590
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 22:02:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g8Wha6YZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlyGl6PP9z3bXX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 06:02:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g8Wha6YZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlyFt5fmkz30PR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 06:01:52 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6b58439a892so1934188a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 13:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687291309; x=1689883309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4F3qXm8x1AVi+0TrKGx40m/sFxYrt6Lj9IeE/BrpeU=;
        b=g8Wha6YZBIQ4F35wQ8P6Y0c98+3LfOEjAen8YviDIN/VpMlvLwu/TwEQtEhwi2wLbk
         4/b97qENpIhbKycIE1G3aUVCeb+vz/rCN/gI0l10ch7iG8C6c3ywB5bQ5tQe6ryGYXul
         5XkEWnvnLWIaJ1vsJQRh6tPgKWpuL7AyPHBFZQZGhCATWoDKR1D2YRUNFvvEx6dCnM6X
         zMyQcs2OOhmWkXYBbd2Z3eHBKxjZIMZIeFLBGw0YYdvfY15fMS5Ra2rC/awJj+k/fir6
         OMXeho7/p64d1/Gcc6dtEtZlx65PVhnR78rxvmM8tH1fn8015FZgY0Ml6WWkfDm6BXzA
         dR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687291309; x=1689883309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4F3qXm8x1AVi+0TrKGx40m/sFxYrt6Lj9IeE/BrpeU=;
        b=ZIaIFwjnWW5+KtbcTG2PL8Z5/XQFa3zdtIcSZuhdm5RhO7g5yZtqGS5K8EMB1Lotx+
         bAMhmcaEVU7wRLj0Eo5KPAKIPeZyFmxIRO8XoHYB4vKTAbKs5O3DH1okXCZYpWkQo57+
         g3n4JNiTndXpJD2CeM1syabDRjq+uAq06p2DSGV1+YzSFye249sjl7cbsWlovrFT/w8v
         3AdwE6z5JBbFFVQotJw64BJBFb+rUMuLuF+wtLqnPZh3C8yDJhUXgvE+FBw0iMWCgc56
         5kNDnGdRcb+ZhvbknyVl/qQ6E/Dq8h8tf2Tiv8XQWY7IBx/MY02T6Iunnbc2ErsLCvKs
         Ye7A==
X-Gm-Message-State: AC+VfDyKz/mIm0TgZkHP2YcUSxMZGoGC4GewEs07XX/HM2mNEJ9QxtZB
	KuIpQvflZLd7Flz5CAyq1hWTw69Cfu435IqE0b4=
X-Google-Smtp-Source: ACHHUZ4Hj3uSYs4sk8lvmBdlBVPXrs6qDttIob0+AqgPuiIWdgPfm9A1hihEUgTK87y6a2gHhIBkt791vtKGzbzprm8=
X-Received: by 2002:a05:6358:f0e:b0:12b:ed05:18bb with SMTP id
 b14-20020a0563580f0e00b0012bed0518bbmr8612256rwj.27.1687291309110; Tue, 20
 Jun 2023 13:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-5-vishal.moola@gmail.com> <ZIxXw9ERkYv+ipdd@nvidia.com>
In-Reply-To: <ZIxXw9ERkYv+ipdd@nvidia.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Tue, 20 Jun 2023 13:01:39 -0700
Message-ID: <CAOzc2pwMW64O0m4Zu4zVFTY+qCJRK7V+7niN_t1m7pLaJrtb2A@mail.gmail.com>
Subject: Re: [PATCH v4 04/34] pgtable: Create struct ptdesc
To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 5:38=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Mon, Jun 12, 2023 at 02:03:53PM -0700, Vishal Moola (Oracle) wrote:
> > Currently, page table information is stored within struct page. As part
> > of simplifying struct page, create struct ptdesc for page table
> > information.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  include/linux/pgtable.h | 51 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index c5a51481bbb9..330de96ebfd6 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -975,6 +975,57 @@ static inline void ptep_modify_prot_commit(struct =
vm_area_struct *vma,
> >  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
> >  #endif /* CONFIG_MMU */
> >
> > +
> > +/**
> > + * struct ptdesc - Memory descriptor for page tables.
> > + * @__page_flags: Same as page flags. Unused for page tables.
> > + * @pt_list: List of used page tables. Used for s390 and x86.
> > + * @_pt_pad_1: Padding that aliases with page's compound head.
> > + * @pmd_huge_pte: Protected by ptdesc->ptl, used for THPs.
> > + * @_pt_s390_gaddr: Aliases with page's mapping. Used for s390 gmap on=
ly.
> > + * @pt_mm: Used for x86 pgds.
> > + * @pt_frag_refcount: For fragmented page table tracking. Powerpc and =
s390 only.
> > + * @ptl: Lock for the page table.
> > + *
> > + * This struct overlays struct page for now. Do not modify without a g=
ood
> > + * understanding of the issues.
> > + */
> > +struct ptdesc {
> > +     unsigned long __page_flags;
> > +
> > +     union {
> > +             struct list_head pt_list;
> > +             struct {
> > +                     unsigned long _pt_pad_1;
> > +                     pgtable_t pmd_huge_pte;
> > +             };
> > +     };
> > +     unsigned long _pt_s390_gaddr;
> > +
> > +     union {
> > +             struct mm_struct *pt_mm;
> > +             atomic_t pt_frag_refcount;
> > +     };
> > +
> > +#if ALLOC_SPLIT_PTLOCKS
> > +     spinlock_t *ptl;
> > +#else
> > +     spinlock_t ptl;
> > +#endif
> > +};
>
> I think you should include the memcg here too? It needs to be valid
> for a ptdesc, even if we don't currently deref it through the ptdesc
> type.

Yes, thanks for catching that! I'll add it to v5.

> Also, do you see a way to someday put a 'struct rcu_head' into here?

Eventually, when they're being dynamically allocated independent of
struct page. Although at that point I'm not sure if we'll need one.

> Thanks,
> Jason
