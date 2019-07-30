Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D1A7A289
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 09:51:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yTJv0R0KzDqTP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 17:51:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.196; helo=mail-qk1-f196.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ySxh1Y4dzDqTT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 17:34:47 +1000 (AEST)
Received: by mail-qk1-f196.google.com with SMTP id s22so45928477qkj.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zr+6M31Gi9RIhd6WGjh1Vbf2RuBt7+NJdVFSHL2O2pg=;
 b=CZBgI+5BmKIheDYEkKGJe2DacuruVyndtc7vi3T4pXge2Yk/dJlGuBwFk2C+xdGdJL
 XRF03rWrSnplKqkNoIOKN28XzmDT4wWal8HkUOqWYoOd6M2bvUuGgzXCtYIYaRKKitmV
 Cr6PMcNnIHM/vHUrzAGJp/xlvbnJdt8jV+GBsa2AM6JDIs0xY3XW3qSLIs67vmJ9AKyQ
 ZRS5YteXLg6VigFGyM1ETUALnex43bA6cd0odYG4+iY1mZ5NG4Cr7UH+2bZaa8lcVmBs
 wz3EITDOuJ3sJDKBcvFF4JsFsYjFgHLInFtbcOCPFKDZaV5dlC1cX9OV+5S/jegd6i3C
 EkXA==
X-Gm-Message-State: APjAAAVZv1k+SCzJL5NFyyTu0sdD9q3KToRlCqyRnWClPDrjEbThme8u
 dIqzCRx7QuDyeVd+G3ifedBPvJu9hxaF5BYNwE0=
X-Google-Smtp-Source: APXvYqybWuHcjdBPufsxlBAq5PrDmFRv9hpZANXgyII0B0Cjj/Yb3Q0KornkEI4utqv4T45sDGzfGDmznwSLfL3qQig=
X-Received: by 2002:a37:76c5:: with SMTP id
 r188mr74856027qkc.394.1564472084625; 
 Tue, 30 Jul 2019 00:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190729202542.205309-1-ndesaulniers@google.com>
 <20190729203246.GA117371@archlinux-threadripper>
 <20190729215200.GN31406@gate.crashing.org>
In-Reply-To: <20190729215200.GN31406@gate.crashing.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 30 Jul 2019 09:34:28 +0200
Message-ID: <CAK8P3a1GQSyCj1L8fFG4Pah8dr5Lanw=1yuimX1o+53ARzOX+Q@mail.gmail.com>
Subject: Re: [PATCH] powerpc: workaround clang codegen bug in dcbz
To: Segher Boessenkool <segher@kernel.crashing.org>
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
Cc: kbuild test robot <lkp@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2019 at 11:52 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Mon, Jul 29, 2019 at 01:32:46PM -0700, Nathan Chancellor wrote:
> > For the record:
> >
> > https://godbolt.org/z/z57VU7
> >
> > This seems consistent with what Michael found so I don't think a revert
> > is entirely unreasonable.
>
> Try this:
>
>   https://godbolt.org/z/6_ZfVi
>
> This matters in non-trivial loops, for example.  But all current cases
> where such non-trivial loops are done with cache block instructions are
> actually written in real assembler already, using two registers.
> Because performance matters.  Not that I recommend writing code as
> critical as memset in C with inline asm :-)

Upon a second look, I think the issue is that the "Z" is an input argument
when it should be an output. clang decides that it can make a copy of the
input and pass that into the inline asm. This is not the most efficient
way, but it seems entirely correct according to the constraints.

Changing it to an output "=Z" constraint seems to make it work:

https://godbolt.org/z/FwEqHf

Clang still doesn't use the optimum form, but it passes the correct pointer.

       Arnd
