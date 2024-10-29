Return-Path: <linuxppc-dev+bounces-2656-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7685C9B3FF6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 02:56:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XctfL5sQlz2yR3;
	Tue, 29 Oct 2024 12:56:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730167002;
	cv=none; b=UDEuVdsZcNZj3vBZOKjb24Un3FSjRNkgTd5/U6B+b2mzXovcRVCRqVWV5a0HnfFlRX95docgxHjuz6wIHRvA3Nmz75VWAanaPgQV/6ST6jErRNJMNA9vZ7bHIjA+DAL/DrA1D1y0MhgK5XiWAeiwfvDHC5HhEUXuTVNUhgsRZfiL8O8LK2+mlDJXXkHmv4zw5+8HzN58OCnet08iREL5fYeo1+0YDNwliACBh7fslSE4cL5i3Mm/ZosWiF3jta9863LMYrhzYSit6DDLHpc+rzut0Git1qbVBhCRm88zcm/0xc2sUYuEn1tPucSx6SBay61kpBXgpdV1UTa6Di47aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730167002; c=relaxed/relaxed;
	bh=FhNIn2MB02U+n3fXiM70GYgiQhr33dCi6lEO/UR0cn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QqX5KN1DyU0qML7MEb9aLTilkfdNdr54rakTcfX9dRrZOx8IEddB1bremMBGHsfWrYtXi+J90uT3yrdRfdOCMW3Q1R1OyiF0ff65Kw8AWmcMvCw6yfHD/H1wnccsYR9Ul0JBdhFJjuenA6+ZHjiZvNDOmAH00WUn5YVqSxhs5X0AzbB933njBLQZgKdKL9KrS3VkOcN1+9o7TRZgd97yZUbLbrM+uYeq5jee50CiBulw3QUD8KZbc88OFzyQ6gRwLCr11D4zRhCkHktkdfmDQ/p7VmIk9r4qMfH0mif4UWLprEuo7cLpSgdQ7rhy0oaNm+9HfWNANmX4UpvKAUl8GA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vFesjoki; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vFesjoki;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XctfK5dSWz2xy7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 12:56:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A3615C5874;
	Tue, 29 Oct 2024 01:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760DEC4CEC3;
	Tue, 29 Oct 2024 01:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730166997;
	bh=41qgNbkuNB++x016Enkhu+Sr9GqznlHTZ+ppdrv2jKE=;
	h=From:To:Cc:Subject:Date:From;
	b=vFesjokirzD3CSXnjSe11UM1tanp4jC3NfrJDQESb30+0izAuFGUrILJbWRKKSZDt
	 mdV7FgWd0cgom4o3SzOMSnthSO26pvVkq+x8yjqvT9wVgSL620mM7FZcfJu3daPqq5
	 reaz1ybMB07J7L0YCrKyU9nWc4xpAtTvCLeqfcues/SUSPh4YiBaTA81Sd11hDeoZr
	 DR/hPaGuSKL6mL3ju3Zhh7gfaooa7RrRXqvX6e9cCNWpUsbuz3aHCLE/psI2yENi9R
	 ekz/O30HFcBWuLsLR2Q8Nbekio25IhD38oL3yWHQfXk5foy2LaE627ehKUw35i2gqX
	 3+AXxFqIepeTA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>
Subject: [PATCH v3 0/6] x86/uaccess: avoid barrier_nospec()
Date: Mon, 28 Oct 2024 18:56:13 -0700
Message-ID: <cover.1730166635.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.47.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

v3:

- rebase on Linus' patch (v6.12-rc5)

- remove putuser(), copy_to_user(), clear_user() changes: as Linus
  points out, they don't produce a value that could be used in a
  dependent load to leak anything.

- convert 32-bit versions of copy_from_user(), get_user() and
  __get_user() and converge code.


Josh Poimboeuf (6):
  x86/uaccess: Avoid barrier_nospec() in 64-bit copy_from_user()
  x86/uaccess: Avoid barrier_nospec() in 64-bit __get_user()
  x86/uaccess: Avoid barrier_nospec() in 32-bit copy_from_user()
  x86/uaccess: Convert 32-bit get_user() to unconditional pointer
    masking
  x86/uaccess: Avoid barrier_nospec() in 32-bit __get_user()
  x86/uaccess: Converge [__]get_user() implementations

 arch/powerpc/include/asm/uaccess.h |  2 +
 arch/x86/include/asm/uaccess.h     | 34 ++++++++++++
 arch/x86/include/asm/uaccess_32.h  |  1 +
 arch/x86/include/asm/uaccess_64.h  | 30 +----------
 arch/x86/lib/getuser.S             | 85 ++++++++----------------------
 include/linux/uaccess.h            |  6 ---
 6 files changed, 61 insertions(+), 97 deletions(-)

-- 
2.47.0


