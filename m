Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB767CCF6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 23:41:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=avm.de header.i=@avm.de header.a=rsa-sha256 header.s=mail header.b=H3xiTCRT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S96qv0Cjyz3cTZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 08:41:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=avm.de header.i=@avm.de header.a=rsa-sha256 header.s=mail header.b=H3xiTCRT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=avm.de (client-ip=2001:bf0:244:244::119; helo=mail.avm.de; envelope-from=n.schier@avm.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 175 seconds by postgrey-1.37 at boromir; Tue, 17 Oct 2023 23:12:45 AEDT
Received: from mail.avm.de (mail.avm.de [IPv6:2001:bf0:244:244::119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8tCd5gytz30fk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 23:12:45 +1100 (AEDT)
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 17 Oct 2023 14:09:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1697544572; bh=KD3DEtP5d6DCBHOitoR8vzNgmhwKZ20ThM66mmXaQDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H3xiTCRTfXo07q+mWSyekXKERZRHw8/lwaQcPG8H37jzuclELv0P1eZcewRqi9xfm
	 4FjwkD5E/CAI7Jsf1jt27JdGi4xolHrKm534XM7mLulgUbh3foeFQbVeHZrkGEgsx3
	 6NcIgfurfJnD3rsiwm/mEe1Iw8nhHG8j82oJD9DM=
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id CFCFB81EAD;
	Tue, 17 Oct 2023 14:09:31 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id B9EFA1819D1; Tue, 17 Oct 2023 14:09:31 +0200 (CEST)
Date: Tue, 17 Oct 2023 14:09:31 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 1/4] kbuild: remove ARCH_POSTLINK from module builds
Message-ID: <ZS55e3ZyzoNDchD+@buildd.core.avm.de>
Mail-Followup-To: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
References: <20231017103742.130927-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231017103742.130927-1-masahiroy@kernel.org>
Organization: AVM GmbH
X-purgate-ID: 149429::1697544571-C3E340EE-41584499/0/0
X-purgate-type: clean
X-purgate-size: 585
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-Mailman-Approved-At: Wed, 18 Oct 2023 08:39:55 +1100
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
Cc: x86@kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, "H. Peter Anvin" <hpa@zytor.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 17, 2023 at 07:37:39PM +0900, Masahiro Yamada wrote:
> The '%.ko' rule in arch/*/Makefile.postlink does nothing but call the
> 'true' command.
> 
> Remove the meaningless code.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/mips/Makefile.postlink    | 3 ---
>  arch/powerpc/Makefile.postlink | 3 ---
>  arch/riscv/Makefile.postlink   | 3 ---
>  arch/x86/Makefile.postlink     | 3 ---
>  scripts/Makefile.modfinal      | 5 +----
>  5 files changed, 1 insertion(+), 16 deletions(-)

Reviewed-by: Nicolas Schier <n.schier@avm.de>
