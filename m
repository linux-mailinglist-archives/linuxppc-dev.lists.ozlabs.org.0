Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B11B4D2762
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 12:42:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pnj63QxkzDqNC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 21:42:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alien8.de
 (client-ip=5.9.137.197; helo=mail.skyhub.de; envelope-from=bp@alien8.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="Qb/8B0z/"; 
 dkim-atps=neutral
X-Greylist: delayed 430 seconds by postgrey-1.36 at bilbo;
 Thu, 10 Oct 2019 21:40:34 AEDT
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pnfq02JDzDr2F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2019 21:40:34 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F0A6300C5CFCA1B921AC096.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:6300:c5cf:ca1b:921a:c096])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F36DC1EC090E;
 Thu, 10 Oct 2019 12:40:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1570704032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=CEt4dlsSD6hLNCfpcBv+TItcwaLdbCGmBJwVp0jE52Y=;
 b=Qb/8B0z/8SHuyj10Uu0bnOSkx6C22IC6RH8jC7QFaxkqw3hi2Xw+pMlrCA8MA+lzrMYIcU
 R9HfBVqfZVc3xwG2eY/U2uTDi6H7SnrRP5zX3UjEj5WLx2T+amIhaiF/8q5v2OnnNYowCN
 wASThpmynIcqAkL6VETz3CqvLHX0uuc=
Date: Thu, 10 Oct 2019 12:40:29 +0200
From: Borislav Petkov <bp@alien8.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 08/29] vmlinux.lds.h: Provide EMIT_PT_NOTE to indicate
 export of .notes
Message-ID: <20191010104029.GE7658@zn.tnic>
References: <20190926175602.33098-1-keescook@chromium.org>
 <20190926175602.33098-9-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190926175602.33098-9-keescook@chromium.org>
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

On Thu, Sep 26, 2019 at 10:55:41AM -0700, Kees Cook wrote:
> In preparation for moving NOTES into RO_DATA, this provides a mechanism

s/this provides/provide/ - imperative tone. Check all your commit
messages pls.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
