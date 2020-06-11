Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCEE1F7066
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 00:40:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jf2D1F9KzDqtK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 08:40:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3cllixgwkdf0i89n5pgid9mnbjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=KDmaFm8v; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jf0S6Z4mzDqrm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 08:38:44 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id y3so8355263ybf.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 15:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:message-id:date:subject:from:to;
 bh=vH1Jdl9UovulKp0PaaP+MmxVuSnD40skakQX91jUExE=;
 b=KDmaFm8vzCYT3oKJnfCXZq3hPMg+faO19e1YoSYNlIHIs0esE/+dqXfaTifXdemE9k
 KfEgE7d3yEidopuhWYozLHpqzOizTKa1yLAuvNmGlcgkArMpOkmQnrDD1Yh69iSLqdra
 JXf2ByohY57OdyYbHcvGLM7nOAG3jk1VOd4sejlGvSpGbzCXunaq/ZtaAqT8NsfzoZED
 3BcHVr3Np069USL5mYahnaNkgl1Za/wgaSC3iGYYD92VTwFMnYU10aeyPb/qjByW+aKs
 HU+jkn41kb+Q07j8pPxB0QiuGRG0umFJYERp4iZwEeDiQqJv4pJyjGMHe6lwKbsBQ5pZ
 qB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:message-id:date:subject:from:to;
 bh=vH1Jdl9UovulKp0PaaP+MmxVuSnD40skakQX91jUExE=;
 b=nGJJ8lqaHDdkyOWO+1otzFzR69MnX3AfGwieYZ7GJ/LD6g4FCej3gFjpBL2meN1Cy3
 wAzQj4J5KE2BlCHSQo0N6duMS6ao7RTjVURO4xxlZrRv/XtEJZpn5wfvDi/QgGwrRdxf
 rysUuAmkNMUsl66SRoiEXZUVtJ7sOSZ1T8wz+4eL8VJ6oFL72Ycs92DzKGiBZPbrHDBe
 rgWY26EX4Kd8R9Yt+8SJcS26MhqBegTKNjh9gQkE7hDMKhfQzqkVOeSR/YY1YYCkVlY2
 qz+myeJmjRhymzHOkRkhsDslxR1/ElzHfrEcdaf0Gen/I89yvYbJF1JQDNk858LxGwUF
 TCUA==
X-Gm-Message-State: AOAM531K8IKQZNV8gHfWIXH+D9Sclj3Amo2+aJrSkCgHnpoQ8bW2sHJz
 DdhJVaC55f2gV/iPM5Y8bdr6eaJx5gLyZGQyK1k=
X-Google-Smtp-Source: ABdhPJyGVqLpmgZRZWU1edJu5iII4R7xxKzufvO+ZIrC8263xKyKyVQ90aQe9dJ4fcLE+PoPNsWq0TD8mfL77U0sFB4=
MIME-Version: 1.0
X-Received: by 2002:a25:d110:: with SMTP id i16mr15548576ybg.155.1591915120701; 
 Thu, 11 Jun 2020 15:38:40 -0700 (PDT)
Message-ID: <00000000000048bfef05a7d69f21@google.com>
Date: Thu, 11 Jun 2020 22:38:40 +0000
Subject: 
From: <ndesaulniers@google.com>
To: patch-notifications@ellerman.id.au, christophe.leroy@c-s.fr, 
 segher@kernel.crashing.org, benh@kernel.crashing.org, paulus@samba.org, 
 npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Date: Thu, 11 Jun 2020 15:38:38 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
	christophe.leroy@c-s.fr, segher@kernel.crashing.org
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>, npiggin@gmail.com,
	segher@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH v4 1/2] powerpc/uaccess: Implement unsafe_put_user()
  using 'asm goto'
Message-ID: <20200611223838.GA60089@google.com>
References:  
<23e680624680a9a5405f4b88740d2596d4b17c26.1587143308.git.christophe.leroy@c-s.fr>
  <49YBKY13Szz9sT4@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49YBKY13Szz9sT4@ozlabs.org>

On Fri, May 29, 2020 at 02:24:16PM +1000, Michael Ellerman wrote:
> On Fri, 2020-04-17 at 17:08:51 UTC, Christophe Leroy wrote:
> > unsafe_put_user() is designed to take benefit of 'asm goto'.
> >
> > Instead of using the standard __put_user() approach and branch
> > based on the returned error, use 'asm goto' and make the
> > exception code branch directly to the error label. There is
> > no code anymore in the fixup section.
> >
> > This change significantly simplifies functions using
> > unsafe_put_user()
> ...
> >
> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>

> Applied to powerpc topic/uaccess-ppc, thanks.

> https://git.kernel.org/powerpc/c/334710b1496af8a0960e70121f850e209c20958f

> cheers

Hello!  It seems this patch broke our ppc32 builds, and we had to
disable them [0]. :(

 From what I can tell, though Michael mentioned this was merged on May
29, but our CI of -next was green for ppc32 until June 4, then mainline
went red June 6.  So this patch only got 2 days of soak time before the
merge window opened.

A general issue with the -next workflow seems to be that patches get
different amounts of soak time.  For higher risk patches like this one,
can I please ask that they be help back a release if close to the merge
window?

Segher, Cristophe, I suspect Clang is missing support for the %L and %U
output templates [1]. I've implemented support for some of these before
in Clang via the documentation at [2], but these seem to be machine
specific? Can you please point me to documentation/unit tests/source for
these so that I can figure out what they should be doing, and look into
implementing them in Clang?

(Apologies for the tone off this email; I had typed up a nice fuller
report with links, but it seemed that mutt wrote out an empty postponed
file, and I kind of just want to put my laptop in the garbage right now.
I suspect our internal SMTP tool will also mess up some headers, but
lets see (Also, too lazy+angry right now to solve).)

[0] https://github.com/ClangBuiltLinux/continuous-integration/pull/279
[1] https://bugs.llvm.org/show_bug.cgi?id=46186
[2]  
https://gcc.gnu.org/onlinedocs/gccint/Output-Template.html#Output-Template
