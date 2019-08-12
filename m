Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 701338A3DB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 18:59:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466hrf1pDqzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 02:58:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pIOzlK+o"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466hmc4Y40zDqSn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 02:55:28 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id r3so11451407wrt.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 09:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=vj44gRBy7Pko0QV87SnpU0f39eDYWrx4v822lLczJLI=;
 b=pIOzlK+o9g7e3tz8hpTfcDLXZ7vxOPpgSYA0SeHbKb4dWYJ414ih59uANJjWMgjamm
 8+KZImlw+R2OZJ+x43CCP9J4hRveALpYnlxue2s8wZXhAEIhM2wCQbj7WKXMGEh29Pkl
 01udM2V8tTcT/m9lLMt+9Z/Y+5cMnKLiLzt+N0OAwPBp+GK2tKoyVj++s0hTjMVTk7H3
 IgUx3sRatM0XBdR8ZBhxngPMsjp7JQr2ZRUCiJf/hdaarRvXfYWik5OZx8Fpl6mQdHTb
 jh6W8Ga1NcDQhN2HhLnO7Ms4OOWNkG5dm6+kk5v7WqB1SZ/AjQa62g+iuAfTsWcpvc9i
 d3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=vj44gRBy7Pko0QV87SnpU0f39eDYWrx4v822lLczJLI=;
 b=qNgQ7c9dEWXfl1PEO1FPFUdyNldhqbt7qoz6f3PcsBi8kh6iKUSN1js2LQJPINwvQs
 aoJ3m6FzkaNW5bZQl99XX536Lzm8xkLdW7sYU2FUAwiZvpdbo9u6qCt6MbeWpvacFu/u
 sqOSnRurilsYRuRK/v7yIRcks3w9ywVsNUufOhn5QY0LtVPEIYw0mp9RdFcwqggCLCx7
 QISh1sNJ2zCXRtdgBF2MiEdSDHp2NBf6NhhWgksKg7zf0lkAdr8EDP3dFlOX+kyn/kbn
 qC4Hnfq859Z0Vm0KLd6Ogaanyqs0fdnss7+h5OszLb8FfKqTD6yn9/unXhkmWk3FXCpF
 hK4w==
X-Gm-Message-State: APjAAAUrDxH5FmD7euijToPlT7mVr23HH34+sv2R0zlK7Nq0HEvAR7bD
 J8pOrn6VxZVNnsXJSZbqKH0=
X-Google-Smtp-Source: APXvYqy2GJO9WC4FkkOW9kiEqG/CZcAka5TjICcxLAsR9ZdFv0jHIy5xOownE61O3d+VSB7SIadbLg==
X-Received: by 2002:adf:eccb:: with SMTP id s11mr9793177wro.351.1565628921084; 
 Mon, 12 Aug 2019 09:55:21 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id r17sm9360182wrg.93.2019.08.12.09.55.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 09:55:20 -0700 (PDT)
Date: Mon, 12 Aug 2019 09:55:18 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc: Avoid clang warnings around setjmp and longjmp
Message-ID: <20190812165518.GA6994@archlinux-threadripper>
References: <20190812023214.107817-1-natechancellor@gmail.com>
 <5da5478f-9320-43bd-0f5e-430db2ee9195@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5da5478f-9320-43bd-0f5e-430db2ee9195@c-s.fr>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 12, 2019 at 07:37:51AM +0200, Christophe Leroy wrote:
> 
> 
> Le 12/08/2019 à 04:32, Nathan Chancellor a écrit :
> > Commit aea447141c7e ("powerpc: Disable -Wbuiltin-requires-header when
> > setjmp is used") disabled -Wbuiltin-requires-header because of a warning
> > about the setjmp and longjmp declarations.
> > 
> > r367387 in clang added another diagnostic around this, complaining that
> > there is no jmp_buf declaration.
> > 
> [...]
> 
> > 
> > Cc: stable@vger.kernel.org # 4.19+
> > Link: https://github.com/ClangBuiltLinux/linux/issues/625
> > Link: https://github.com/llvm/llvm-project/commit/3be25e79477db2d31ac46493d97eca8c20592b07
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> > 
> [...]
> 
> > 
> >   arch/powerpc/kernel/Makefile | 5 +++--
> >   arch/powerpc/xmon/Makefile   | 5 +++--
> 
> What about scripts/recordmcount.c and scripts/sortextable.c which contains
> calls to setjmp() and longjmp() ?
> 
> And arch/um/ ?
> 
> Christophe

Hi Christophe,

It looks like all of those will be using the system's setjmp header,
which won't cause these warnings.

Cheers,
Nathan
