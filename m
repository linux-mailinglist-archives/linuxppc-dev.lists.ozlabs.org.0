Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 709FED4517
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 18:11:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qXy55QmnzDqc8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 03:11:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="k3VEdnK1";
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qXvr6lcbzDqZP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2019 03:09:28 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id h195so6359658pfe.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 09:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rz208JH/bAYgb34feMbXc7rOAmJSapYVvu3TBVmWgf0=;
 b=k3VEdnK1XLODdhPbFCe/vXjRUrVGk8LtbhfzFlecnP8Kmv9f4bYkCsfO3n/TqN0AdN
 qBPqcub0N0dKdLHi1OxIweb3/6eczWoee7LuePEuJPxxCrmCNRf0LI9uLqFq5rTIaXHw
 uP6X5tVwyIUzUKipWUOB9mLE9R+uA81t/qC+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rz208JH/bAYgb34feMbXc7rOAmJSapYVvu3TBVmWgf0=;
 b=LHswpMaIXvnOFDWLC4A6PIsbzOnzrDO5tdqLygTSNIscqyesJNWs0yKwBuNxz0RJ3b
 +vVru2d97Op2UCcrtmZAoJ+r8Ch8WSiHa/ERLjD96kb+UBn1LE6jQ2RxBmey9Pnsc6pf
 qi4GHQn1wk5Xv/U2HIrzHw24QM+Hmb725ZJeGKunzVyoxxKBadKEMT8SVAhJNesVNfMw
 GWWNX+j6B886PdSVAoLLw6ObbYfc5bUG/POFMtOUFex1o+qsUEdeJdvvrTgl4Xv8068g
 WdzwR9+5pvaqvRgOtRln5wN90N7dShX1gbhFEa4QhYQ1/SXkalaFG5L5fHftGWAQFWb8
 4BOA==
X-Gm-Message-State: APjAAAU1gtlFv6Pe6WZQb5/b9l+6YNo8aEQqLaL/ZrCsZSjgYn2tXN6g
 RSMLL0nLwF6c9S0l60BLf6OPYQ==
X-Google-Smtp-Source: APXvYqzRI04wjSOtKB/baIR7njDLMah96e9dDVUlsW+Ic2nxptL0dLB9zZ6sMSyGO7t7MBKia+2VpQ==
X-Received: by 2002:a63:b5b:: with SMTP id a27mr18354873pgl.262.1570810165767; 
 Fri, 11 Oct 2019 09:09:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d3sm8459551pgb.3.2019.10.11.09.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 09:09:24 -0700 (PDT)
Date: Fri, 11 Oct 2019 09:09:22 -0700
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 02/29] powerpc: Remove PT_NOTE workaround
Message-ID: <201910110908.040009F27@keescook>
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-3-keescook@chromium.org>
 <878sprx1br.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878sprx1br.fsf@mpe.ellerman.id.au>
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
Cc: linux-ia64@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Joel Stanley <joel@jms.id.au>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 11, 2019 at 05:07:04PM +1100, Michael Ellerman wrote:
> Kees Cook <keescook@chromium.org> writes:
> > In preparation for moving NOTES into RO_DATA, remove the PT_NOTE
> > workaround since the kernel requires at least gcc 4.6 now.
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  arch/powerpc/kernel/vmlinux.lds.S | 24 ++----------------------
> >  1 file changed, 2 insertions(+), 22 deletions(-)
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks!

> For the archives, Joel tried a similar patch a while back which caused
> some problems, see:
> 
>   https://lore.kernel.org/linuxppc-dev/20190321003253.22100-1-joel@jms.id.au/
> 
> and a v2:
> 
>   https://lore.kernel.org/linuxppc-dev/20190329064453.12761-1-joel@jms.id.au/
> 
> This is similar to his v2. The only outstanding comment on his v2 was
> from Segher:
>   (And I do not know if there are any tools that expect the notes in a phdr,
>   or even specifically the second phdr).
> 
> But this patch solves that by not changing the note.

Ah yes. Agreed: I'm retaining the note and dropping the workarounds.
FWIW, this builds happily for me in my tests.

-Kees

-- 
Kees Cook
