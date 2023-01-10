Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED451663647
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 01:31:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrWvR6fbXz3fBV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 11:31:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
X-Greylist: delayed 473 seconds by postgrey-1.36 at boromir; Tue, 10 Jan 2023 11:30:44 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrWtr5b82z2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 11:30:44 +1100 (AEDT)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4NrWjY4SgXz1qybm;
	Tue, 10 Jan 2023 01:22:40 +0100 (CET)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.84])
	by mail.m-online.net (Postfix) with ESMTP id 4NrWjX0vSpz1qqlR;
	Tue, 10 Jan 2023 01:22:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan3.mail.m-online.net [192.168.6.84]) (amavisd-new, port 10024)
	with ESMTP id DiUuhnXlaHJ9; Tue, 10 Jan 2023 01:22:38 +0100 (CET)
X-Auth-Info: L9w5ayo6JQGgDusGnhVePL9x9OVfSDH16AZsAok4PJK/NjVMEjPpDaJpsfV403G4
Received: from igel.home (aftr-62-216-205-85.dynamic.mnet-online.de [62.216.205.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 10 Jan 2023 01:22:38 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id 71E832C132D; Tue, 10 Jan 2023 01:22:38 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
	<20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
	<CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
	<20230109222337.GM25951__25255.3859770828$1673303520$gmane$org@gate.crashing.org>
X-Yow: Is this going to involve RAW human ecstasy?
Date: Tue, 10 Jan 2023 01:22:38 +0100
In-Reply-To: <20230109222337.GM25951__25255.3859770828$1673303520$gmane$org@gate.crashing.org>
	(Segher Boessenkool's message of "Mon, 9 Jan 2023 16:23:37 -0600")
Message-ID: <87cz7n2q7l.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kernel test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org, trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Jan 09 2023, Segher Boessenkool wrote:

> It is required by POSIX (for the c99 command, anyway).  It *also* is
> required to be supported when producing object files (so when no linking
> is done).
>
> It is a GCC flag, and documented just fine:
> https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html#index-s

Most assembler flags are unrelated to the flags passed to the compiler
driver, and -s is no exception.  POSIX has nothing to say about the
sub-commands of the compiler anyway.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
