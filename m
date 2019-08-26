Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F11F79D91A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 00:27:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HRSx4sfWzDqng
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 08:27:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=changbin.du@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a0zMmyWB"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HRQv1R9fzDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 08:25:25 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id e11so11428147pga.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 15:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NdrKt952AuvDe+QMynjr4iuarcTkuNP/kAs8J0u4A+s=;
 b=a0zMmyWBK90UYJtyoqynyxpcCWQ63iFelFOAu2wf9q+P7tEGrAMDTLQ7ns9kTHCAvV
 zOtTYGjAxNvaMG4PH070aBsaBC17H9ftkGmoEi1jbpZFGywLt3QZL7gqqDvhtYn2QJAj
 HSQU1nyy/xAx7EGwqSnb5+oUhOiY0vilM355IeRksUhMIXlBU+ac4G4LkEY6hh/lQJqH
 TCnArxvquzzcbANPftPtDewlrkSUrPpD/afdr91bwf897Kd0DnHeETaJ3blnDHKXuHRK
 pv4PbuZrnheVZVo5X1lDBWaTzlVchp+wBfR+mBKzN+vI9AKQDusQD89Py284sXkk9381
 0sVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NdrKt952AuvDe+QMynjr4iuarcTkuNP/kAs8J0u4A+s=;
 b=Ls+hoYlT/INJ/xGLO9CSML0j7ax6vNeU8axS2kBVa3+Xf3h/4+7wAGgA4kUQUopMJa
 6j9i1gpZcohELIexGEN1l4e6I36SZhF/pZnuv6bAuULKpw1O1W7zZjHQuaBSms2X9ijn
 44HiDWUdwkKZ100uOTSeNcjcUvQ47u9A8a7D+E/yFjaBTqSYbHzz4lUs8ZClq4HxP6nR
 1JUuYb1jHyABMz+a2dnCGVmvE/OaRFSeq5zJezMPlpZi/eFRAXyzM5FZqrJNfWMx3Vwx
 iZakawmWGux8Rmc10DpHm9ZfbhUBMDhrTE0AWAU76UfiB74xkjIk2RVcqjyiv+4jhoyd
 0Oaw==
X-Gm-Message-State: APjAAAXTSnpUtzciKvdONjTOffusq1Y3ohBwSGddQzqLVM53I2Y7JFjk
 nVXcnT97qf2oX3rZ2nSDMJM=
X-Google-Smtp-Source: APXvYqy681ZUL1/GOI1ZqNuttC4tPBoxw38R2Hiki+GEnFDGGEOPoegEj5VFS0OPFx5JUD/3pSIIpA==
X-Received: by 2002:a65:6108:: with SMTP id z8mr8200381pgu.289.1566858322037; 
 Mon, 26 Aug 2019 15:25:22 -0700 (PDT)
Received: from mail.google.com ([149.28.153.17])
 by smtp.gmail.com with ESMTPSA id t6sm449041pjy.18.2019.08.26.15.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 15:25:21 -0700 (PDT)
Date: Tue, 27 Aug 2019 06:25:12 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 03/11] asm-generic: add generic dwarf definition
Message-ID: <20190826222510.6m2k3puwflnr52b7@mail.google.com>
References: <20190825132330.5015-1-changbin.du@gmail.com>
 <20190825132330.5015-4-changbin.du@gmail.com>
 <20190826074215.GL2369@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826074215.GL2369@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20180716
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-mips@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Changbin Du <changbin.du@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Peter,

On Mon, Aug 26, 2019 at 09:42:15AM +0200, Peter Zijlstra wrote:
> On Sun, Aug 25, 2019 at 09:23:22PM +0800, Changbin Du wrote:
> > Add generic DWARF constant definitions. We will use it later.
> > 
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > ---
> >  include/asm-generic/dwarf.h | 199 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 199 insertions(+)
> >  create mode 100644 include/asm-generic/dwarf.h
> > 
> > diff --git a/include/asm-generic/dwarf.h b/include/asm-generic/dwarf.h
> > new file mode 100644
> > index 000000000000..c705633c2a8f
> > --- /dev/null
> > +++ b/include/asm-generic/dwarf.h
> > @@ -0,0 +1,199 @@
> > +/* SPDX-License-Identifier: GPL-2.0
> > + *
> > + * Architecture independent definitions of DWARF.
> > + *
> > + * Copyright (C) 2019 Changbin Du <changbin.du@gmail.com>
> 
> You're claiming copyright on dwarf definitions? ;-)
> 
> I'm thinking only Oracle was daft enough to think stuff like that was
> copyrightable.
> 
ok, let me remove copyright line. I think SPDX claim is okay, right?

> Also; I think it would be very good to not use/depend on DWARF for this.
>
It only includes the DWARF expersion opcodes, not all of dwarf stuffs.

> You really don't need all of DWARF; I'm thikning you only need a few
> types; for location we already have regs_get_kernel_argument() which
> has all the logic to find the n-th argument.
> 
regs_get_kernel_argument() can handle most cases, but if the size of one paramater
exceeds 64bit (it is rare in kernel), we must recalculate the locations. So I think
dwarf location descriptor is the most accurate one.

-- 
Cheers,
Changbin Du
