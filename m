Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE32765297
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 13:37:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=la4Lmi/D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBTJv5f0Yz3dCP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 21:37:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=la4Lmi/D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBS0R0LlXz3cJC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 20:38:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1F9461E23;
	Thu, 27 Jul 2023 10:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2484BC433C7;
	Thu, 27 Jul 2023 10:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690454292;
	bh=wh4ycVHyDy/meMpcFy2ujkA7FnfZIbKiF964oBpVy5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=la4Lmi/DhdfArnUIJ/DbZ78SFqaneHcZNAsl7vyC6Bp1sh+e4HQI8e4jBnieO39j6
	 Rmq90io/GLqGoqqH4KkgjJEuKDDwP558rmmvSt0FVF7KhEbTHcezlFb9UppkdHYSda
	 jhi/dMRwdDkMKonZJKiGKFXJNLOHTIEijgJrGqqlhNsPV0MkiTVFgniC59vxFaHMe+
	 /PgQ2nYibh/PpeGMNXJPhBkYhxE3bGCCuiviuqMrlry/Jp24MyFm3S6udZz5sJhaZ+
	 s1t/etXhC/mU8K1VZK7pw57PG4j5iKPd/L4jWewp3rgGuvPk9cYY28p/tSjAv5ikoK
	 B2c9Xn3Ycs/Lg==
Date: Thu, 27 Jul 2023 12:37:58 +0200
From: Christian Brauner <brauner@kernel.org>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v4 3/5] arch: Register fchmodat2, usually as syscall 452
Message-ID: <20230727-fangen-olympiade-85fcbdaf03d7@brauner>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
 <nbtxxotfsotuiepm7r4tegc4hy5qxe4dfjuqq7rm6qkkevooxh@4hacgjwit4or>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <nbtxxotfsotuiepm7r4tegc4hy5qxe4dfjuqq7rm6qkkevooxh@4hacgjwit4or>
X-Mailman-Approved-At: Thu, 27 Jul 2023 21:35:36 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, Palmer Dabbelt <palmer@sifive.com>, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, fweimer@redhat.com, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, jhogan@kernel.org, mattst88@gmail.com, linux-mips@vger.kernel.org, gor@linux.ibm.com, fenghua.yu@intel.com, tycho@tycho.ws, Arnd Bergmann <arnd@arndb.de>, glebfm@altlinux.org, linuxppc-dev@lists.ozlabs.org, acme@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, James.Bottomley@
 hansenpartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, peterz@infradead.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, Alexey Gladkov <legion@kernel.org>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 26, 2023 at 02:43:41AM +1000, Aleksa Sarai wrote:
> On 2023-07-11, Alexey Gladkov <legion@kernel.org> wrote:
> > From: Palmer Dabbelt <palmer@sifive.com>
> > 
> > This registers the new fchmodat2 syscall in most places as nuber 452,
> > with alpha being the exception where it's 562.  I found all these sites
> > by grepping for fspick, which I assume has found me everything.
> 
> Shouldn't this patch be squashed with the patch that adds the syscall?
> At least, that's how I've usually seen it done...

Depends. Iirc, someone said they'd prefer for doing it in one patch
in some circumstances on some system call we added years ago. But otoh,
having the syscall wiring done separately makes it easy for arch
maintainers to ack only the wiring up part. Both ways are valid imho.
(cachestat() did it for x86 and then all the others separately. So
really it seems a bit all over the place depending on the scenario.)
