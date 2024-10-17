Return-Path: <linuxppc-dev+bounces-2355-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE9A9A301D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 23:55:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XV1q86HLxz2yRd;
	Fri, 18 Oct 2024 08:55:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729202132;
	cv=none; b=eLsDhOm236NOcN9Qg1YIpbpLZvIhxW13Keo/ar4+5NSuJP5xecvXQ1r/wCur0VhLFwfFoUCjbKDbs3pnll3BOaiFFOP3OKIEDa2aDrISrUsnvKoDe3tWk6iB5Ce401+x4qq7uec2H9wlhTmf9IHpf8nqVgb+Ka1BToLXVYicXSktg7XP8HgVX0yH4X+8GWm6bkQCtK7XMDiBBvQQTLhyeiaijCIzzedcutYfFfLZkuHVEYganY7ylzdDEJon123YQE83xPqDfNEWkbvh0KkktsvYvlAkLp8kP1p+YgRFNb4jfaM2MiV4QJ+DsOgigCfUEUr/OHYiN1p4l58FTlfSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729202132; c=relaxed/relaxed;
	bh=Ag9uoeMigV2eYzpfd8PzWekBsjgCy9pji/7yoq+SVL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oI968hjVg7KgDcKDo+leA6UHbBeOagRlewVqXTsU1wix5WxRHFQVQytzRnY3B5L8U9DwdXdxVcWAa8AZBOu0JuD3Z5/j39hLNJ7yJuqjMSG0qq5P5i0NBA2GalTMMQCESDBKRyXb9Oe6KdEgyVvmJvxXc83NAcyG8byyWkgdro07jo3bQwSOVxYq1qemRFWtp8oL0bG7G3Wn38gs44S8keE2TsAWQlZnfDIcF0UwKalgSIgvnUIsGMIaKaIKqyb7X2RSQXEUcbx71UYM/JoRfTjHQsN86/1eO6keuqKWizyLo9lIXk8b0yey4nlZ2B/4Xo7tXRxkYr9THwX+m+2Xmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lfsR/Xnj; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lfsR/Xnj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XV1q71hh4z2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 08:55:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DC494A42524;
	Thu, 17 Oct 2024 21:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D9EC4CEC3;
	Thu, 17 Oct 2024 21:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729202127;
	bh=8F0Ljgplti2+uRIqCwdVcXpYWSHleghZp/ebylrCnso=;
	h=From:To:Cc:Subject:Date:From;
	b=lfsR/XnjX6ZX0cmyfo8vm1CWXUqXqAJejirvPxQnFSkZ2RbVumeYEntkzeyabaVLi
	 hushdvp+1LaVtafe/vp1JOMJpgy0wazXxJKyjtnizi2+jtV4bsUd8j3e9CQQfI8zF7
	 Qgl2Rxb91K/kcL0az/7/PUMpIWJmrmdao5bglHkDC2kZATxkxrtJJYSLe/88Js4JIp
	 CFoEAOi6I0NXpgqISG6mza+K89f1MSvF6l3da8x7hG11MhzY0Yo6wOAxTXmQHKjk1y
	 FifiaJ/INYkdok80ovt+H2IHlIcg3iDipkpOQ3Usc5LVr76lkGlRszR8yhUsBJJcB+
	 B8e01r501BKwg==
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
Subject: [PATCH v2 0/6] x86/uaccess: Avoid barrier_nospec()
Date: Thu, 17 Oct 2024 14:55:19 -0700
Message-ID: <cover.1729201904.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

At least for now, continue to assume mask_user_address() is safe on AMD
when combined with STAC/CLAC -- as get_user(), put_user() and
masked_user_access_begin() already do today.

v2:
- Separate copy_to_user() and clear_user() changes out into separate patches
- Add masking to __get_user() and __put_user()

v1:
https://lore.kernel.org/b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org

Josh Poimboeuf (6):
  x86/uaccess: Avoid barrier_nospec() in copy_from_user()
  x86/uaccess: Avoid barrier_nospec() in __get_user()
  x86/uaccess: Rearrange putuser.S
  x86/uaccess: Add user pointer masking to __put_user()
  x86/uaccess: Add user pointer masking to copy_to_user()
  x86/uaccess: Add user pointer masking to clear_user()

 arch/powerpc/include/asm/uaccess.h |  2 +
 arch/x86/include/asm/uaccess_64.h  | 10 ++--
 arch/x86/lib/getuser.S             | 27 +++++++--
 arch/x86/lib/putuser.S             | 92 ++++++++++++++++++------------
 include/linux/uaccess.h            |  6 --
 5 files changed, 86 insertions(+), 51 deletions(-)

-- 
2.47.0


