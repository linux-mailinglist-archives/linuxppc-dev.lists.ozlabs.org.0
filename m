Return-Path: <linuxppc-dev+bounces-17281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFWaNsxioGk0jAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:12:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 249E71A8500
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:12:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMFL06Jy2z3bkq;
	Fri, 27 Feb 2026 02:11:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772118712;
	cv=none; b=dBFDpWLAe9SApifwDpU+gFfz86osE/zM17HPYX9/h0qW3MmPbI4Po3oyaj69L1nX7UZ6RsPw3uKuoU6YAs1gjDEp6RK2yUN0QG488KIq9Rus7nHcMGT0gGtXIE5xB5vvjjhP2rKeN61U4VhYZAyznMRAEoFI+JpjQ/SO91fz4f8/ISTaPs1sHRGNoEJPbK5aP/GvdrYYs2/O43Wu/YHmAy1/rPTVinGidikFo6jW8vYl5qXQXbp0hTumsTMJE+eq+NNmwRyNOV+9ee9Of8/W+dP8mp+sJXvr95Mn6c9SjZED5lMFK0uzQXEgL7pj4Fa3hOxY/9/8Avi+e5Kb+C+dEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772118712; c=relaxed/relaxed;
	bh=qP+8VdwzX18rY5bvgdY1sWuLjPIGZuDXB9vEoLM33a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k3Q0b6Cpxecp5MbLqal4zFT2zugFDK3XKpZhewLhuo+D++AnBe8Q60xItl4a1uj4cyomvM5JxOEa5BKrBLCzc7NI6gdqtr4C42Hy0u+QgqwTIxpvJeNA/pSr7+PJ0GI9w+i7S0wpw0oYV3Uj5ywe0ntCm5HTdyHMneFQBqx7CqXnuU395OVtiDpTFT1EiqOOxvoQDoZg71aZF4LD+BBhfDjqLHZTip+vEsGY2JVN6c9RWsX4VJkAXeP1d+qfH06fMj8w+/oTBDQfZDmTH804HBjjysDv2p6vL8N32Tcmo9JyfzxRbJmaadQ33XFVme26Ug5AX8SC56GkAhJbWl4TiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QR03zetW; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QR03zetW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMFKs2kGtz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 02:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=qP+8VdwzX18rY5bvgdY1sWuLjPIGZuDXB9vEoLM33a0=; b=QR03zetWTad5XyZ1Gw4pLwB3nJ
	bBW2z8/AfBzf6ywTsDIo41OiCTtpsjYjgepK9QsrzsI7cElVXtM7rURrehCLHg7n3dJp3pEEuguPs
	IV28EsbN9NXPibalVzcYNCMt7WUj5amt2cLL/uhfFZSbZasPO8mE2vPJU0F6TCesV+k682eK7OpEb
	0s0PEhS0Lb4d7H7xxKtb1UPzv/QjIpRm5y7UyO6jsg8yFhe2aE6J9EjqkFmDdqerweEN4NKLgisiM
	Kabaz6sDQQzQIMT6aHsvYmfsxULpzWH25hK5F1NxFrVLPKvob/3mX0qd2TgoR9ypObigmjPl/bDFb
	OUEtcJnA==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd1A-00000006Pxh-0z8F;
	Thu, 26 Feb 2026 15:11:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: cleanup the RAID5 XOR library
Date: Thu, 26 Feb 2026 07:10:12 -0800
Message-ID: <20260226151106.144735-1-hch@lst.de>
X-Mailer: git-send-email 2.47.3
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17281-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:herbert@gondor.apana.org.au,m:dan.j.williams@intel.com,m:clm@fb.com,m:dsterba@suse.com,m:arnd@arndb.de,m:song@kernel.org,m:yukuai@fnnas.com,m:linan122@huawei.com,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@li
 sts.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-raid@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[hch@lst.de,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,nod.at,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,arndb.de,fnnas.com,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	RCPT_COUNT_GT_50(0.00)[54];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,infradead.org:url,infradead.org:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 249E71A8500
X-Rspamd-Action: no action

Hi all,

the XOR library used for the RAID5 parity is a bit of a mess right now.
The main file sits in crypto/ despite not being cryptography and not
using the crypto API, with the generic implementations sitting in
include/asm-generic and the arch implementations sitting in an asm/
header in theory.  The latter doesn't work for many cases, so
architectures often build the code directly into the core kernel, or
create another module for the architecture code.

Changes this to a single module in lib/ that also contains the
architecture optimizations, similar to the library work Eric Biggers
has done for the CRC and crypto libraries later.  After that it changes
to better calling conventions that allow for smarter architecture
implementations (although none is contained here yet), and uses
static_call to avoid indirection function call overhead.

A git tree is also available here:

    git://git.infradead.org/users/hch/misc.git xor-improvements

Gitweb:

    https://git.infradead.org/?p=users/hch/misc.git;a=shortlog;h=refs/heads/xor-improvements

Diffstat:
 arch/arm64/include/asm/xor.h              |   73 --
 arch/loongarch/include/asm/xor.h          |   68 --
 arch/loongarch/include/asm/xor_simd.h     |   34 -
 arch/loongarch/lib/xor_simd_glue.c        |   72 --
 arch/powerpc/include/asm/xor.h            |   47 -
 arch/powerpc/include/asm/xor_altivec.h    |   22 
 arch/powerpc/lib/xor_vmx.h                |   22 
 arch/powerpc/lib/xor_vmx_glue.c           |   63 --
 arch/riscv/include/asm/xor.h              |   68 --
 arch/s390/include/asm/xor.h               |   21 
 arch/sparc/include/asm/xor.h              |    9 
 arch/sparc/include/asm/xor_64.h           |   79 ---
 arch/um/include/asm/xor.h                 |   24 
 arch/x86/include/asm/xor_64.h             |   28 -
 b/arch/alpha/Kconfig                      |    1 
 b/arch/arm/Kconfig                        |    1 
 b/arch/arm/lib/Makefile                   |    5 
 b/arch/arm64/Kconfig                      |    1 
 b/arch/arm64/lib/Makefile                 |    6 
 b/arch/loongarch/Kconfig                  |    1 
 b/arch/loongarch/lib/Makefile             |    2 
 b/arch/powerpc/Kconfig                    |    1 
 b/arch/powerpc/lib/Makefile               |    5 
 b/arch/riscv/Kconfig                      |    1 
 b/arch/riscv/lib/Makefile                 |    1 
 b/arch/s390/Kconfig                       |    1 
 b/arch/s390/lib/Makefile                  |    2 
 b/arch/sparc/Kconfig                      |    1 
 b/arch/sparc/include/asm/asm-prototypes.h |    1 
 b/arch/sparc/lib/Makefile                 |    2 
 b/arch/um/Kconfig                         |    1 
 b/arch/x86/Kconfig                        |    1 
 b/crypto/Kconfig                          |    2 
 b/crypto/Makefile                         |    1 
 b/crypto/async_tx/async_xor.c             |   16 
 b/fs/btrfs/raid56.c                       |   27 -
 b/include/asm-generic/Kbuild              |    1 
 b/include/linux/raid/xor.h                |   28 -
 b/lib/Kconfig                             |    1 
 b/lib/Makefile                            |    2 
 b/lib/raid/Kconfig                        |    7 
 b/lib/raid/Makefile                       |    2 
 b/lib/raid/xor/Makefile                   |   50 ++
 b/lib/raid/xor/alpha/xor.c                |   46 -
 b/lib/raid/xor/alpha/xor_arch.h           |   22 
 b/lib/raid/xor/arm/xor-neon-glue.c        |   19 
 b/lib/raid/xor/arm/xor-neon.c             |   22 
 b/lib/raid/xor/arm/xor.c                  |  105 ----
 b/lib/raid/xor/arm/xor_arch.h             |   22 
 b/lib/raid/xor/arm64/xor-neon-glue.c      |   26 +
 b/lib/raid/xor/arm64/xor-neon.c           |   94 +--
 b/lib/raid/xor/arm64/xor-neon.h           |    6 
 b/lib/raid/xor/arm64/xor_arch.h           |   21 
 b/lib/raid/xor/loongarch/xor_arch.h       |   33 +
 b/lib/raid/xor/loongarch/xor_simd_glue.c  |   37 +
 b/lib/raid/xor/powerpc/xor_arch.h         |   22 
 b/lib/raid/xor/powerpc/xor_vmx.c          |   40 -
 b/lib/raid/xor/powerpc/xor_vmx.h          |   10 
 b/lib/raid/xor/powerpc/xor_vmx_glue.c     |   28 +
 b/lib/raid/xor/riscv/xor-glue.c           |   25 +
 b/lib/raid/xor/riscv/xor_arch.h           |   17 
 b/lib/raid/xor/s390/xor.c                 |   15 
 b/lib/raid/xor/s390/xor_arch.h            |   13 
 b/lib/raid/xor/sparc/xor-niagara-glue.c   |   33 +
 b/lib/raid/xor/sparc/xor-niagara.S        |  346 --------------
 b/lib/raid/xor/sparc/xor-sparc32.c        |   32 -
 b/lib/raid/xor/sparc/xor-vis-glue.c       |   34 +
 b/lib/raid/xor/sparc/xor-vis.S            |  348 ++++++++++++++
 b/lib/raid/xor/sparc/xor_arch.h           |   35 +
 b/lib/raid/xor/um/xor_arch.h              |    9 
 b/lib/raid/xor/x86/xor-avx.c              |   52 --
 b/lib/raid/xor/x86/xor-mmx.c              |  120 +---
 b/lib/raid/xor/x86/xor-sse.c              |  105 +---
 b/lib/raid/xor/x86/xor_arch.h             |   36 +
 b/lib/raid/xor/xor-32regs-prefetch.c      |  267 ++++++++++
 b/lib/raid/xor/xor-32regs.c               |  217 ++++++++
 b/lib/raid/xor/xor-8regs-prefetch.c       |  146 +++++
 b/lib/raid/xor/xor-8regs.c                |  103 ++++
 b/lib/raid/xor/xor-core.c                 |  187 +++++++
 b/lib/raid/xor/xor_impl.h                 |   60 ++
 crypto/xor.c                              |  174 -------
 include/asm-generic/xor.h                 |  738 ------------------------------
 82 files changed, 2033 insertions(+), 2433 deletions(-)

