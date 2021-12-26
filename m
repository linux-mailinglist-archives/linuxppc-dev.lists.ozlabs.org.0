Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BAF47F5E6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 09:31:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMDXz6vPyz3dfK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 19:31:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMDWh2647z3cGq
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Dec 2021 19:30:23 +1100 (AEDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JMDRG17z7zZdj1;
 Sun, 26 Dec 2021 16:26:34 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 26 Dec 2021 16:29:48 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 26 Dec 2021 16:29:47 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <x86@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/3] mm: support huge vmalloc mapping on arm64/x86
Date: Sun, 26 Dec 2021 16:39:09 +0800
Message-ID: <20211226083912.166512-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

huge vmalloc mappings is supported on PPC[1], but this feature should
be not only used on PPC, it could be used on arch support HAVE_ARCH_HUGE_VMAP
and PMD sized vmap mappings. this patchset is to enable this feature
on arm64/x86.

The first patch is to let user to control huge vmalloc mapping default
behavior and then enable this feature on arm64/x86.

The PPC is enabled by default(it selects HUGE_VMALLOC_DEFAULT_ENABLED),
but arm64/x86 should use hugevmalloc=on to enable this feature.

NOTE:
1) nohugevmalloc parameter is still supported, the first patch is in
   case of archs don't want to this feature enabled by default.
2) if people don't like this, we could drop the first patch.

[1] https://lore.kernel.org/linux-mm/20210317062402.533919-1-npiggin@gmail.com/

Kefeng Wang (3):
  mm: vmalloc: Let user to control huge vmalloc default behavior
  arm64: Support huge vmalloc mappings
  x86: Support huge vmalloc mappings

 .../admin-guide/kernel-parameters.txt          | 14 +++++++++++++-
 arch/arm64/Kconfig                             |  1 +
 arch/powerpc/Kconfig                           |  1 +
 arch/x86/Kconfig                               |  1 +
 mm/Kconfig                                     |  7 +++++++
 mm/vmalloc.c                                   | 18 +++++++++++++++++-
 6 files changed, 40 insertions(+), 2 deletions(-)

-- 
2.26.2

