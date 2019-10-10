Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B425D2FF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 20:05:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pzXH3wR5zDqLp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 05:05:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alien8.de
 (client-ip=2a01:4f8:190:11c2::b:1457; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="nU1pP2YS"; 
 dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pzV072s4zDqKj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 05:03:36 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F0A6300D1C0EB70E9B309BA.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:6300:d1c0:eb70:e9b3:9ba])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9C0E51EC090E;
 Thu, 10 Oct 2019 20:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1570730613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=1UJ85wrxUTh6ZjmKP+WxNvKm5uhVcmHwuihzVVphUA0=;
 b=nU1pP2YSMQ1D+YbJ1lqIUj3fIbqXmRei9IrwE7casgVZ3bf6uvckQOYFEy6VxgMByJdLas
 gfLhF2deNPAW3vJXpynsBSp1uVNCkCK3TGs2a02YYiWnywAPZqOojj1vdVy9ucSV/QlrU6
 X6II6ljlFaBt+0oSrDlytkAJMAR1SFQ=
Date: Thu, 10 Oct 2019 20:03:31 +0200
From: Borislav Petkov <bp@alien8.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 00/29] vmlinux.lds.h: Refactor EXCEPTION_TABLE and NOTES
Message-ID: <20191010180331.GI7658@zn.tnic>
References: <20190926175602.33098-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, Sep 26, 2019 at 10:55:33AM -0700, Kees Cook wrote:
> This series works to move the linker sections for NOTES and
> EXCEPTION_TABLE into the RO_DATA area, where they belong on most
> (all?) architectures. The problem being addressed was the discovery
> by Rick Edgecombe that the exception table was accidentally marked
> executable while he was developing his execute-only-memory series. When
> permissions were flipped from readable-and-executable to only-executable,
> the exception table became unreadable, causing things to explode rather
> badly. :)
> 
> Roughly speaking, the steps are:
> 
> - regularize the linker names for PT_NOTE and PT_LOAD program headers
>   (to "note" and "text" respectively)
> - regularize restoration of linker section to program header assignment
>   (when PT_NOTE exists)
> - move NOTES into RO_DATA
> - finish macro naming conversions for RO_DATA and RW_DATA
> - move EXCEPTION_TABLE into RO_DATA on architectures where this is clear
> - clean up some x86-specific reporting of kernel memory resources
> - switch x86 linker fill byte from x90 (NOP) to 0xcc (INT3), just because
>   I finally realized what that trailing ": 0x9090" meant -- and we should
>   trap, not slide, if execution lands in section padding

Yap, nice patchset overall.

> Since these changes are treewide, I'd love to get architecture-maintainer
> Acks and either have this live in x86 -tip or in my own tree, however
> people think it should go.

Sure, I don't mind taking v2 through tip once I get ACKs from the
respective arch maintainers.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
