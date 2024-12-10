Return-Path: <linuxppc-dev+bounces-3923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 713369EB863
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 18:34:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y75Sq5YfYz2ynR;
	Wed, 11 Dec 2024 04:34:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733852059;
	cv=none; b=T14XATZS8cTjnLSqPROuoe5X09NS7lQNJIAYUQ2Jp6oHC0RI4tInggmrt7+yxTIR8s7/zQhxYMTn5+L1/vKejcunI44W3iXNoXrkbPDtR1+33itUc3J2xvZ0dK0a5jL6BLz7SMHNY6srN+F5aOgapQPac8Rn++lweV2HE1MQjKdmbfGPPe4j0ovrofiWvIgMCeXu5i10Drz1LuRc7tT+fzQJlldeQDR5U7/Ta3GypdUc3QRIXcpPLTuybJJcHB4GvOMTn1AtyJwDtLy12bkCE80jj8vRETzQjZHt3gc23AWSu6Jf8H1jB+00cGbv+qNlZATqQE+d7aOTqyRwljVuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733852059; c=relaxed/relaxed;
	bh=RArVkKSCeMH/NY6o3gQIWtxTREQOsCr1U+SuNtxbEwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AG1pR3xeHEpV6MmzgADiQdM4H/7MKv1szekwcHBV5Sy+rWJQstpFsxlgysz9CMVFTtvmIxfG0cy4RkRPNjbcbmQ1atMgizZweSV3BIeXkbsKGGl0xiqe7XerJofTXjLtm86WaeKN2tWiKQmDSP+xJC2IEHuIyI8S70doyZNiBh0gfP5uFYbfW9s/9vjo79l+SB7AYl1tgPIfECpHXvxox3DaSdIcszClSowHTIFKuuomSEIgu+H7hHcX3QdM2p+PhfcPw7lvS6qv9QF5t5r/fCRwUWDwS/OZFVHtaVMWaY5FR1N4nIwDGJ7iaSi/Rdj4CoBQzPHLKIGxMsRmRh85Iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Wpakav1i; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=kaleshsingh@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Wpakav1i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=kaleshsingh@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y75Sp0FFrz2ykf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 04:34:16 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2155c25e9a4so137345ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 09:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733852054; x=1734456854; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RArVkKSCeMH/NY6o3gQIWtxTREQOsCr1U+SuNtxbEwg=;
        b=Wpakav1i64mCi4y1g+7HI9GGZ3o48JHJSzIK/rHtzMPmw02hHmw3h473v/hBNHzqON
         VDOc0UmB9m/+KbLnRWuv8GBBOzn6xbK3edEtsr7OZJtQLhMRynz271SCRMRcsHrv3CU7
         jIOs4iFHN3JV1qt1jcA/N4xA5OPoqVhdZuNEuxpF3qi9DrPQSHFSJgOl1hL4U9e3l/zj
         Xyp9CufDlyQca4B4GrcGP30LabcSMcVXhEWfo+NQndBc34980h59du8yd/gS8vu+tNyp
         SnPSd3+HWktW+cUvRprBRQQQEAddU2UWz6hKkBvy1fWrWqxuHDvfQ+uykub+m7aFbgUH
         f1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733852054; x=1734456854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RArVkKSCeMH/NY6o3gQIWtxTREQOsCr1U+SuNtxbEwg=;
        b=ReLkhvRxa5yqPxzfbKIVkrvX5Aq8UuIJ0waXbTrkZOqqpx2Zmh9QX+Cix7r75EWV6m
         hvgsHt6memy+Z3chp/u0lyaOci3uamovPWJpfTckClYh9ccKkPISRnBafv6WPYDYXO7k
         5U1LqkHzMfVIIfm5/lFDlYtFCQni5Q72ivlqBYNkimBcAMJjLgtKqVIqr5j/kjncdUCN
         4EtVaGeUpbMXYjn2BS93G5iaJRH5upaEwqP1aEAhtrw0ew/RM7G3XUEZZSlU0yzL5QKq
         kTq2QmPuYBjoRAnbUgf4CySr+Q9T1ME6k+FdYxv0dptJkU74EY2BGy7j8J0cMdpmKFGv
         7fuA==
X-Forwarded-Encrypted: i=1; AJvYcCWk7tzdhszfwn24M/47H88fVbWMUuUINgBbIe5EbqRWjht4/KPRqllelM0QSjWXVE26Mf43VXmDCOmUc3I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzogxuH8WF+yVdSyFiBvu3NdZdiDApcbfUmDS3BBQ3rRZ6poQAe
	4rkqFyRDtzys6aKXtNRjI9tp9FMI1aoIav//i9G89m1EGx4btJPpWN3WNfqLxV1FrdIy51NAeg6
	c0PVwuPdnRaUd5dfHo5lANjmvzOCEDjhYNivN
X-Gm-Gg: ASbGncux7wtjl3yYkup+v6P6F6Rnl94wZ4O1PMwz/87H6Q0BFr3m6E4g84erNSn4oCM
	6zkGg+bGuFji8lX0IWLTXUjsdOLNVxvtgF8VIreiPkpiBw7GTU79arn0oIm4s5/vO
X-Google-Smtp-Source: AGHT+IEDudBnir5+jttzQm+7tNnzRHUlcioRTO8j0Dis2V+coMoC8sfWSozH23fEnrYfZy4bwgZvjEwIXStM7LatHiM=
X-Received: by 2002:a17:903:4403:b0:215:9d29:1aba with SMTP id
 d9443c01a7336-21674cbdb12mr2775015ad.1.1733852054062; Tue, 10 Dec 2024
 09:34:14 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
 <20241210024119.2488608-18-kaleshsingh@google.com> <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
In-Reply-To: <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Tue, 10 Dec 2024 09:34:01 -0800
Message-ID: <CAC_TJvdReRHzBSgg2iqOw3Kw6BBOtwGE=8nB2Hsw-nsmkxN0+g@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 17/17] mm: Respect mmap hint before THP
 alignment if allocation is possible
To: Yang Shi <shy828301@gmail.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 9, 2024 at 7:37=E2=80=AFPM Yang Shi <shy828301@gmail.com> wrote=
:
>
> On Mon, Dec 9, 2024 at 6:45=E2=80=AFPM Kalesh Singh <kaleshsingh@google.c=
om> wrote:
> >
> > Commit 249608ee4713 ("mm: respect mmap hint address when aligning for T=
HP")
> > fallsback to PAGE_SIZE alignment instead of THP alignment
> > for anonymous mapping as long as a hint address is provided by the user
> > -- even if we weren't able to allocate the unmapped area at the hint
> > address in the end.
> >
> > This was done to address the immediate regression in anonymous mappings
> > where the hint address were being ignored in some cases; due to commit
> > efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries").
> >
> > It was later pointed out that this issue also existed for file-backed
> > mappings from file systems that use thp_get_unmapped_area() for their
> > .get_unmapped_area() file operation.
> >
> > The same fix was not applied for file-backed mappings since it would
> > mean any mmap requests that provide a hint address would be only
> > PAGE_SIZE-aligned regardless of whether allocation was successful at
> > the hint address or not.
> >
> > Instead, use arch_mmap_hint() to first attempt allocation at the hint
> > address and fallback to THP alignment if that fails.
>
> Thanks for taking time to try to fix this.
>
> >
> > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > ---
> >  mm/huge_memory.c | 15 ++++++++-------
> >  mm/mmap.c        |  1 -
> >  2 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 137abeda8602..f070c89dafc9 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -1097,6 +1097,14 @@ static unsigned long __thp_get_unmapped_area(str=
uct file *filp,
> >         loff_t off_align =3D round_up(off, size);
> >         unsigned long len_pad, ret, off_sub;
> >
> > +       /*
> > +        * If allocation at the address hint succeeds; respect the hint=
 and
> > +        * don't try to align to THP boundary.
> > +        */
> > +       addr =3D arch_mmap_hint(filp, addr, len, off, flags);
> > +       if (addr)
> > +               return addr;
> > +

Hi Yang,

Thanks for the comments.

>
> IIUC, arch_mmap_hint() will be called in arch_get_unmapped_area() and
> arch_get_unmapped_area_topdown() again. So we will actually look up
> maple tree twice. It sounds like the second hint address search is
> pointless. You should be able to set addr to 0 before calling
> mm_get_unmapped_area_vmflags() in order to skip the second hint
> address search.

You are right that it would call into arch_mmap_hint() twice but it
only attempts the lookup once since on the second attempt addr =3D=3D 0.

Thanks,
Kalesh
>
> >         if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
> >                 return 0;
> >
> > @@ -1117,13 +1125,6 @@ static unsigned long __thp_get_unmapped_area(str=
uct file *filp,
> >         if (IS_ERR_VALUE(ret))
> >                 return 0;
> >
> > -       /*
> > -        * Do not try to align to THP boundary if allocation at the add=
ress
> > -        * hint succeeds.
> > -        */
> > -       if (ret =3D=3D addr)
> > -               return addr;
> > -
> >         off_sub =3D (off - ret) & (size - 1);
> >
> >         if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 59bf7d127aa1..6bfeec80152a 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -807,7 +807,6 @@ __get_unmapped_area(struct file *file, unsigned lon=
g addr, unsigned long len,
> >         if (get_area) {
> >                 addr =3D get_area(file, addr, len, pgoff, flags);
> >         } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
> > -                  && !addr /* no hint */
> >                    && IS_ALIGNED(len, PMD_SIZE)) {
> >                 /* Ensures that larger anonymous mappings are THP align=
ed. */
> >                 addr =3D thp_get_unmapped_area_vmflags(file, addr, len,
> > --
> > 2.47.0.338.g60cca15819-goog
> >
> >

