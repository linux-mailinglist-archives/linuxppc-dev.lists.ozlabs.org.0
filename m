Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAE3D7C87
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 18:57:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t1mw1wC3zDr3D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 03:57:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alien8.de
 (client-ip=5.9.137.197; helo=mail.skyhub.de; envelope-from=bp@alien8.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="UhqyUbUZ"; 
 dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t1jz58NXzDr3D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 03:54:27 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F157800C5C9C957E5FD72EA.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f15:7800:c5c9:c957:e5fd:72ea])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 48D971EC0C9F;
 Tue, 15 Oct 2019 18:54:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1571158463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=rnMDMAxve5tu5ORyg7bCimEqvhkoKSIi/WDG5Ckj2mw=;
 b=UhqyUbUZxF1aKEZWmjOecjXQ40If2V00t93Kg4amOFs1vb1YblTprErgXmjYAMMbFs1i2U
 rBG4AYHzxbTMLCTcsNJJf17cTI1+Sh6IITzgESuitrr3eMc1W3eIWHwig8gGPLDTSj8piu
 pPldqgdkCAB3vxJ1gR+l+JfeKn/aG08=
Date: Tue, 15 Oct 2019 18:54:13 +0200
From: Borislav Petkov <bp@alien8.de>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 01/29] powerpc: Rename "notes" PT_NOTE to "note"
Message-ID: <20191015165412.GD596@zn.tnic>
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-2-keescook@chromium.org>
 <20191011082519.GI9749@gate.crashing.org>
 <201910110910.48270FC97@keescook>
 <20191011162552.GK9749@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191011162552.GK9749@gate.crashing.org>
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
 Michal Simek <monstr@monstr.eu>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-ia64@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, linux-alpha@vger.kernel.org,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 11, 2019 at 11:25:52AM -0500, Segher Boessenkool wrote:
> Names *matter*, internal names doubly so.  So why replace a good name with
> a worse name?  Because it is slightly less work for you?

So if we agree on the name "notes" and we decide to rename the other
arches, this should all be done in a separate patchset anyway, and ontop
of this one. And I believe Kees wouldn't mind doing it ontop since he's
gotten his hands dirty already. :-P

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
