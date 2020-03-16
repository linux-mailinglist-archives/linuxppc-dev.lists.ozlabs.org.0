Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 535421875D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 23:53:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hBRt4SNbzDqRh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 09:53:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=PGt/Pcs8; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hBPl1q33zDqWg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 09:51:48 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id u12so10572143pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 15:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NX0Wlea0R+1ZmGi4xMK0+FDmtBI/tqrLeKbfSQ7Asuo=;
 b=PGt/Pcs8qCHWG0HZAYcY4liJPhGxmPGT2SofhLVciazm2WCrV04GL5dX4GIaLyyoHe
 dbOgjLpBHV0G4APe6a7npTSAjkEuYSLe6NAuPG+6eCRK7IOwEmImaAuNQJn0DVDm6maF
 uotA5/rrJ7GWT5B+WSAeW301ZL78kgGsdPaFt9ZbyRpF0xqegp9Nwm9dICs1VTAGL00+
 ih/cpO8iq7phkb/bKTqjpFfwlJL4mMPu5K7r+eF5ghVq70zzaJX0OHWghftHVbulubyw
 3hyM8EphOhCSd1/quYzOuI/1Y+ZGxOC8E1r434ppacD05u44UA44q3QxIKD030XDYaHC
 k7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NX0Wlea0R+1ZmGi4xMK0+FDmtBI/tqrLeKbfSQ7Asuo=;
 b=ha/oRdigEI9tKQwz7zcu7ox2sWeMsnE6QSS75WwqaHnQOFub9meYSgNUHtwiu+iV7v
 6bJS3fQlOIT2W8GBYRkigbQE66m9+i1lKWLaqDwqqWjvX+3JDkL0OshyVo+S5Tx0GvHQ
 CRpvlGmiI4nbbyQtK99e50sMvdJjAy+ehkOrjrscSKwvBj/woUOHDuMP7l5Uymm05Oqf
 5W2/qnX/JCVjsxd6hL1w0aNAqbbWsdAJ5IP5H4fF6vU7cIU8OtsQogWFWkBpchK3bMvR
 I06dEY74ZjPOWWc2p4uxD4nbPJg97rDbjPg07yJUHJDudRBrDWUDE91vltD40h8nxr27
 Hxpw==
X-Gm-Message-State: ANhLgQ28om+wF2ms7iQitJpL8TkE/FrJoScUhYm3nBA9ixf241cNerm2
 PSzoBd22ipqMkQApc3WDFnqEYZiqwv/RQJVHdn74vA==
X-Google-Smtp-Source: ADFU+vv5Y28ixNFLFWNAzRJSTYVQJvMzfJGA6f5XuD7J4RDHOOk3bgVb55GFlwn8kKvWpGQW9XT8MUU6eLclIGt/498=
X-Received: by 2002:aa7:87ca:: with SMTP id i10mr1941704pfo.169.1584399104245; 
 Mon, 16 Mar 2020 15:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <b1177cdfc6af74a3e277bba5d9e708c4b3315ebe.1583575707.git.christophe.leroy@c-s.fr>
 <20200313033517.GA37606@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200313033517.GA37606@ubuntu-m2-xlarge-x86>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 Mar 2020 15:51:32 -0700
Message-ID: <CAKwvOdm6Z+ERUcGXPbuBKmnpBUNKfL8fPOdxK2g+a1gVRWqh-Q@mail.gmail.com>
Subject: Re: [PATCH] powerpc/32: Fix missing NULL pmd check in virt_to_kpte()
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello ppc friends, did this get picked up into -next yet?

On Thu, Mar 12, 2020 at 8:35 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Sat, Mar 07, 2020 at 10:09:15AM +0000, Christophe Leroy wrote:
> > Commit 2efc7c085f05 ("powerpc/32: drop get_pteptr()"),
> > replaced get_pteptr() by virt_to_kpte(). But virt_to_kpte() lacks a
> > NULL pmd check and returns an invalid non NULL pointer when there
> > is no page table.
> >
> > Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> > Fixes: 2efc7c085f05 ("powerpc/32: drop get_pteptr()")
> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > ---
> >  arch/powerpc/include/asm/pgtable.h | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> > index b80bfd41828d..b1f1d5339735 100644
> > --- a/arch/powerpc/include/asm/pgtable.h
> > +++ b/arch/powerpc/include/asm/pgtable.h
> > @@ -54,7 +54,9 @@ static inline pmd_t *pmd_ptr_k(unsigned long va)
> >
> >  static inline pte_t *virt_to_kpte(unsigned long vaddr)
> >  {
> > -     return pte_offset_kernel(pmd_ptr_k(vaddr), vaddr);
> > +     pmd_t *pmd = pmd_ptr_k(vaddr);
> > +
> > +     return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
> >  }
> >  #endif
> >
> > --
> > 2.25.0
> >
>
> With QEMU 4.2.0, I can confirm this fixes the panic:
>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>



-- 
Thanks,
~Nick Desaulniers
