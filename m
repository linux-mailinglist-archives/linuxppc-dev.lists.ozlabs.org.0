Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B476313C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 08:51:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jXzw0w5WzDqB5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 16:51:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Djoi1z+O"; 
 dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jXxg0pZVzDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 16:49:58 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id n9so10521093wrr.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2019 23:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Nb0pkc+k4Qz3CzHqObu3Bzh+hOHM655Cn2712+LoHC0=;
 b=Djoi1z+OJdSQcbc/LHWSmwd9/9O9pkUGvPL14F6N7LW+l0FNebr+OsMd06cuG1vmiq
 9pmmo5vgmdUxRkJ/ClYyBf8TXiMy45EGTo8PjW1nO5ACH5Nlswhavg1yZP2f1sB/6Jt+
 bLiVFFTFIwWIYSFgwBCk4pMUiUgXnPOn+YFGc2ujMYz+xBJkxJn9NuZV5Aw4R4Rdvrj4
 xsHkHQ8G3CD0OJjE+Cr+HjCIKVjIUAVeUOjGWWlAF/WrAEP9Ymvqb6I3xRcGp3nhdQp9
 0HQ2MXRlz4O1ffK9GMUfoJx+7rBFQJQ/e4EB2xbgCcw8VLKhe+FWoVe/B3h1EXh1PG1w
 TZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Nb0pkc+k4Qz3CzHqObu3Bzh+hOHM655Cn2712+LoHC0=;
 b=e6K2DjJGJzpWRLHr/aphNNEFVegEJlvLs0GLPUNCWcFsvL8aCdfTAcZaVBF1Ez6Zyb
 dbKgJG87STA6a/JrNhFae3hy/+6JLMkvQtmElaQP/lcUW5yaB6pbobPHmGK6hbNRrQ89
 ADdvaRgIBDDXq6P78xBoT4Yhrc0WYWcTpaOb2yJC1mVTU/0tns+SHBoLbQLs3x+ZN4dh
 uhsnugXR+6eTLdqBvJaW/W1JKlrUvkoHlGkdHDxSEgeolUtlZcNAXZELKPtsD/UpM2GQ
 ojwxStmheIYcbQYyc5Dnao4yetr2uB0opJvC7V/gHcQy7Jr5/jVm+In+uQBIBr/iF/WN
 9GZg==
X-Gm-Message-State: APjAAAXHuZuVef+Hc96N9bM3pbTx51foIrwdeBB8rkVIRq6iX6+FniU2
 ps7ewcYWKM7zkoa2Kwuuy/w=
X-Google-Smtp-Source: APXvYqxbWBP22Hj6gv+5vEr97/SBM8AtFOB6BACIXVuXsQzH0yNmZQ/xlOJZPUbpeE4pwgOrMQHNug==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr21977289wrm.218.1562654994345; 
 Mon, 08 Jul 2019 23:49:54 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id n3sm10904758wrt.31.2019.07.08.23.49.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 23:49:53 -0700 (PDT)
Date: Mon, 8 Jul 2019 23:49:52 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2] powerpc: slightly improve cache helpers
Message-ID: <20190709064952.GA40851@archlinux-threadripper>
References: <c6ff2faba7fbb56a7f5b5f08cd3453f89fc0aaf4.1557480165.git.christophe.leroy@c-s.fr>
 <45hnfp6SlLz9sP0@ozlabs.org>
 <20190708191416.GA21442@archlinux-threadripper>
 <a5864549-40c3-badd-8c41-d5b7bf3c4f3c@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5864549-40c3-badd-8c41-d5b7bf3c4f3c@c-s.fr>
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
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 09, 2019 at 07:04:43AM +0200, Christophe Leroy wrote:
> 
> 
> Le 08/07/2019 à 21:14, Nathan Chancellor a écrit :
> > On Mon, Jul 08, 2019 at 11:19:30AM +1000, Michael Ellerman wrote:
> > > On Fri, 2019-05-10 at 09:24:48 UTC, Christophe Leroy wrote:
> > > > Cache instructions (dcbz, dcbi, dcbf and dcbst) take two registers
> > > > that are summed to obtain the target address. Using 'Z' constraint
> > > > and '%y0' argument gives GCC the opportunity to use both registers
> > > > instead of only one with the second being forced to 0.
> > > > 
> > > > Suggested-by: Segher Boessenkool <segher@kernel.crashing.org>
> > > > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > > 
> > > Applied to powerpc next, thanks.
> > > 
> > > https://git.kernel.org/powerpc/c/6c5875843b87c3adea2beade9d1b8b3d4523900a
> > > 
> > > cheers
> > 
> > This patch causes a regression with clang:
> 
> Is that a Clang bug ?

No idea, it happens with clang-8 and clang-9 though (pretty sure there
were fixes for PowerPC in clang-8 so something before it probably won't
work but I haven't tried).

> 
> Do you have a disassembly of the code both with and without this patch in
> order to compare ?

I can give you whatever disassembly you want (or I can upload the raw
files if that is easier).

Cheers,
Nathan

> 
> Segher, any idea ?
> 
> Christophe
> 
> > 
> > https://travis-ci.com/ClangBuiltLinux/continuous-integration/jobs/213944668
> > 
> > I've attached my local bisect/build log.
> > 
> > Cheers,
> > Nathan
> > 
