Return-Path: <linuxppc-dev+bounces-5639-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C34A20E44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 17:17:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj9Rm19lRz3055;
	Wed, 29 Jan 2025 03:17:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738081060;
	cv=none; b=UzefE5f3AejfzdSTqHKqfOEdsjYsBY6Sj/Go4qpSMQshOTbdbAUsfwEtfdWYNO5u9tQCB/use6OesivKzfOCZOV2JvxwMLReJYhLC6DXRe1lCIzJLXy2/QqkLibxlIqBaSAk/6BulOkNVmjD7/REU0Se8IyzkYmqxYSt/0hcBdbVNYprB2lMmwdis7Iz59oeTCRQO2ZXHf5h3C0wzRK88HMfefm4aM630VM4RBQYL2OPTAS7JdIgfm0mXVHzzg6k0ZWGUeI9yx7GmGB1DQ1qkAsF5v+AHnY1fxdAdgfwywtDsUqcLQzbXIxnTn8E4qkICjD1YPiAq2O7HhN7bxIrDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738081060; c=relaxed/relaxed;
	bh=08STJYfEXnSO2dRgpD+txqf8RQCLhu0SM8yhTx6WhqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkQwrKKaOS00KBW1CJfwZFTme78piWksYIvB22jBS+BgX/dSFXRrmYVRYXn5/C9wL6C+cdL+stm/q1gBEcgCluLybVEAbHwp7kZbriyx5R690i1HBcuw4PIobsiD1dkBsHfNbD9/dGBWNyvhNqm/nvAfk8mLOFFMjUzUpSNYiYqMzXmmI5D/hhO18xpPvOxl6/LChQE9Hw5/ueYzrZHpWErywrT9h3v6rZObZtO++K9UjsPwPuPW9Bglx5B9MiPx8RxQPQg408qjuG23V2V1+XimaX4YcdDK98s/JLWqSjyek0dXgxJc2VPiRwBHvABmshIbVbFpnw/qN8vaZ+cCxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj9Rl33fsz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 03:17:39 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id CC0E572C90D;
	Tue, 28 Jan 2025 19:17:37 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id B9EE97CCB3A; Tue, 28 Jan 2025 18:17:37 +0200 (IST)
Date: Tue, 28 Jan 2025 18:17:37 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Oleg Nesterov <oleg@redhat.com>, linux-snps-arc@lists.infradead.org,
	Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>,
	Andreas Larsson <andreas@gaisler.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
	WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	strace-devel@lists.strace.io, linux-arch@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mike Frysinger <vapier@gentoo.org>,
	Davide Berardi <berardi.dav@gmail.com>,
	Renzo Davoli <renzo@cs.unibo.it>, linux-um@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stafford Horne <shorne@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Johannes Berg <johannes@sipsolutions.net>,
	Alexey Gladkov <legion@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 2/6] syscall.h: add syscall_set_arguments() and
 syscall_set_return_value()
Message-ID: <20250128161737.GD11869@strace.io>
References: <20250128091626.GB8601@strace.io>
 <df7441ae-e478-4a40-aaa7-461d9b589e06@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df7441ae-e478-4a40-aaa7-461d9b589e06@csgroup.eu>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 28, 2025 at 04:04:34PM +0100, Christophe Leroy wrote:
> Le 28/01/2025 à 10:16, Dmitry V. Levin a écrit :
> > These functions are going to be needed on all HAVE_ARCH_TRACEHOOK
> > architectures to implement PTRACE_SET_SYSCALL_INFO API.
> 
> The subject is misleading. syscall_set_return_value() already exists on 
> most architectures and was not addressed by commit 7962c2eddbfe.
> 
> Maybe it would be better to handle syscall_set_return_value() in a 
> separate commit.

syscall_set_return_value() is being added only on hexagon.
I didn't think it worth a separate commit, but it's certainly possible
to split this commit into two.


-- 
ldv

