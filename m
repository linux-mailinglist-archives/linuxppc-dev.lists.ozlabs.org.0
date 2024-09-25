Return-Path: <linuxppc-dev+bounces-1592-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B109867F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 23:06:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDTn32sD4z2yF1;
	Thu, 26 Sep 2024 07:06:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727298407;
	cv=none; b=RUjInNYIdtqU2ix7VE13NJ0a+urzfLX3Y0e5psYUOE/lMDXaZb/mo/UmhU2YaFnDG4ieEulxtjyELezKgx0aExgoD4nWKOMeqr2ytMOUUUGFjnq1X8eq8XV3vFCZZDZQL6UJ/rYEYfsmxVqd67FO5ccjk1abk9tIUjes5P9OQXCCZY/TsXCbu0BNggo5IjVG8ZHujN+x9EylBMw2RI1K5IJ+WvXp1Qlqa3TK6yLcj42cBIOQsNm6GB1ju8c+9pnqLJUYb76TWQHmwhEfVItI0708y8KrzB1cM4UsE8uJzg8FiOqOvG9014KEA2xst7/nKLiXF3Q5nyKWUlz61ssmgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727298407; c=relaxed/relaxed;
	bh=YBw9debRdj8ZXsLvKxnJvsjFaKwQGvqqVLYIvm1Ct54=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Vk/Dhu8DqyMPPftumz3c+19qoal+zyr6LsEC4pVAuZZgQS7AxR7rf5DL+U0NpCSFE9+Hte1JmSZrMqyUCa7IrJpZR+Yh29sMlSQoYU7Qrt8NpE9zCvLQR4Gs2IoqzS3CCPvmyLOthJ2hE+et3cnrbBPAdf22Xf+DArak8w5PoCmZpN4LckSMsbhZjWE7i6/2upRZKDEpYDQFGEhVKe83zoiiqxviz/ErSGiwHFDHTav9vsKL9o6MIm/DfJYXzKpgiEhY8V3vLeAtK/C/b2MF4L7GhtifJgC5jCTh+VUlLJqfnn1bgvK6N8HvDOLgZg1IXmR41umtKBHGS/JF+DRhgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ty4V85so; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ty4V85so;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDTn26Yl9z2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 07:06:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C0F7A4488D;
	Wed, 25 Sep 2024 21:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07B6C4CEC3;
	Wed, 25 Sep 2024 21:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727298402;
	bh=ov11DCW5fbfEkeXbc3N4tknYqvWLCe6U3JzkfrFWpkU=;
	h=From:To:Cc:Subject:Date:From;
	b=Ty4V85soYpqEM8sUDM/PovDueJXmKYgUPZM3jqIVSWscNGO92pmJEBZ1JtV6lKwJu
	 /VNXVBsrBStlI+XfgvZYiro5DKkIxm1ox9IPT+JTFsrByJ7QQm6NjYBoXUBQxPCXLS
	 dj5bSZq++t5pObMmZdgm5I9UMfcwcKwUA1wBFgahGj4alaWxqRSwAUTR4/2d034XBs
	 WfH5LoTr3+nivVv/e+fjWSSrGa4mL16ZuTIMzAQvCXJOw//669VS4xztlBK2UwzGsJ
	 AJOAs+o3b2GwT7zi/iHnQ4PcfCPCbxIqmRkrUIFZPDrXPvg7ncTbC16FbQwGAeeU/r
	 TTlUE0B/JK86A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Damien Le Moal <dlemoal@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Helge Deller <deller@gmx.de>,
	Kees Cook <kees@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 0/5] asm-generic: clean up asm/mman.h
Date: Wed, 25 Sep 2024 21:06:10 +0000
Message-Id: <20240925210615.2572360-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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

From: Arnd Bergmann <arnd@arndb.de>

While thinking about the changes to linux/mman.h in
https://lore.kernel.org/all/20240923141943.133551-1-vincenzo.frascino@arm.com/
I ended up trying to clean up the duplicate definitions in order to
better see what's in there, and then I found a clash between two MAP_* flags.

Here is my current state, lightly tested. Please have a look at
the last patch in particular.

     Arnd

Arnd Bergmann (5):
  asm-generic: cosmetic updates to uapi/asm/mman.h
  asm-generic: move MAP_* flags from mman-common.h to mman.h
  asm-generic: use asm-generic/mman-common.h on mips and xtensa
  asm-generic: use asm-generic/mman-common.h on parisc and alpha
  [RFC] mm: Remove MAP_UNINITIALIZED support

 Documentation/admin-guide/mm/nommu-mmap.rst | 10 +--
 arch/alpha/include/uapi/asm/mman.h          | 93 ++++++-------------
 arch/mips/include/uapi/asm/mman.h           | 95 +++-----------------
 arch/parisc/include/uapi/asm/mman.h         | 79 ++++-------------
 arch/powerpc/include/uapi/asm/mman.h        | 11 +++
 arch/sh/configs/rsk7264_defconfig           |  1 -
 arch/sparc/include/uapi/asm/mman.h          | 12 +++
 arch/xtensa/include/uapi/asm/mman.h         | 98 +++------------------
 fs/binfmt_elf_fdpic.c                       |  3 +-
 include/linux/mman.h                        |  4 -
 include/uapi/asm-generic/mman-common.h      | 31 +++----
 include/uapi/asm-generic/mman.h             | 17 ++++
 include/uapi/linux/mman.h                   |  5 ++
 mm/Kconfig                                  | 22 -----
 mm/nommu.c                                  |  4 +-
 15 files changed, 125 insertions(+), 360 deletions(-)

-- 
2.39.2

Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Kees Cook <kees@kernel.org>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com> 
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: linux-arch@vger.kernel.org


