Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC25D34BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 01:59:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q7NR4860zDqS4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 10:59:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="Db/oz2S5";
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q7Lb5jV5zDqL8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 10:57:41 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id e10so685963pgd.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 16:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JDPAnamTFIBp8EbgTewpJ7Tw/YLIi8XdRk99n5ihTZ0=;
 b=Db/oz2S5lstBws+DqElygyxc81UBHBsr+H3aP9d7X1Exv8x5nrqyE8LlbCfAHNDI33
 C0Lez0UyqONC9IaOea8gT8nPL1/x5uCEuR2jRaabo/Im85fb5YQ8dXKHBhHzlSwEU26t
 LMRAjaDuj9AVfrjyE4E00p9tS9qPnDSjC8rv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JDPAnamTFIBp8EbgTewpJ7Tw/YLIi8XdRk99n5ihTZ0=;
 b=LbvH1YlVtmLyPqo2wyTzivRdi8CEwFaaJ6u+nsODqooKCjh7ZwB0b89B+VN60rWlB6
 GtGISyphDY5eW79GaV8xdZzI64O/NCAse20gC/TwIcUa/kcNGQWYPIXONXruvYf/YS7U
 4fxuWyvHADosi1gQd+TW+p4Dn9SHdtJ45jQCx2C+5CyXChfUQQv52h2KxJ59Pr2jddya
 DwhKFqGfiydbLUBNkLFMw/MGe71iDz2O2KAOTvXjmcBbChUWRa0+Z1JX66k89Ttsuwrz
 yogXihYG15w1U0vTpJBs7KFT3TS6HWNjuKZue5ooOUNHpad+TwugCBwF3OqWS7ved+F6
 pN7g==
X-Gm-Message-State: APjAAAUaeV490o2cDDv9MqxG5RY3QmsuTCLVqfjUASK3GFkv4UH+QPdy
 ynVQ0kOuVV49jEXexQa9XyDvZQ==
X-Google-Smtp-Source: APXvYqxc417dQnyKwr23xDZjX8PoZldCbCNE524Aqa25++NjX1n3K1nM+hIHdvRdzpYCGpdnTHOJmw==
X-Received: by 2002:a17:90a:cc12:: with SMTP id
 b18mr13644961pju.141.1570751858072; 
 Thu, 10 Oct 2019 16:57:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b4sm5035339pju.16.2019.10.10.16.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 16:57:37 -0700 (PDT)
Date: Thu, 10 Oct 2019 16:57:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 00/29] vmlinux.lds.h: Refactor EXCEPTION_TABLE and NOTES
Message-ID: <201910101657.234CB71E53@keescook>
References: <20190926175602.33098-1-keescook@chromium.org>
 <20191010180331.GI7658@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010180331.GI7658@zn.tnic>
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
 Michal Simek <monstr@monstr.eu>, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ingo Molnar <mingo@redhat.com>, linux-parisc@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 10, 2019 at 08:03:31PM +0200, Borislav Petkov wrote:
> On Thu, Sep 26, 2019 at 10:55:33AM -0700, Kees Cook wrote:
> > This series works to move the linker sections for NOTES and
> > EXCEPTION_TABLE into the RO_DATA area, where they belong on most
> > (all?) architectures. The problem being addressed was the discovery
> > by Rick Edgecombe that the exception table was accidentally marked
> > executable while he was developing his execute-only-memory series. When
> > permissions were flipped from readable-and-executable to only-executable,
> > the exception table became unreadable, causing things to explode rather
> > badly. :)
> > 
> > Roughly speaking, the steps are:
> > 
> > - regularize the linker names for PT_NOTE and PT_LOAD program headers
> >   (to "note" and "text" respectively)
> > - regularize restoration of linker section to program header assignment
> >   (when PT_NOTE exists)
> > - move NOTES into RO_DATA
> > - finish macro naming conversions for RO_DATA and RW_DATA
> > - move EXCEPTION_TABLE into RO_DATA on architectures where this is clear
> > - clean up some x86-specific reporting of kernel memory resources
> > - switch x86 linker fill byte from x90 (NOP) to 0xcc (INT3), just because
> >   I finally realized what that trailing ": 0x9090" meant -- and we should
> >   trap, not slide, if execution lands in section padding
> 
> Yap, nice patchset overall.

Thanks!

> > Since these changes are treewide, I'd love to get architecture-maintainer
> > Acks and either have this live in x86 -tip or in my own tree, however
> > people think it should go.
> 
> Sure, I don't mind taking v2 through tip once I get ACKs from the
> respective arch maintainers.

Okay, excellent. I've only had acks from arm64, but I'll call it out
again in v2. Thanks for the review!

-- 
Kees Cook
