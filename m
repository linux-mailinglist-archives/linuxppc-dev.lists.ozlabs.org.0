Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FD524C878
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 01:22:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXgfP4fJTzDqss
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 09:22:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eqzf/OiA; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXgbc0ttLzDqlR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 09:19:55 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id q1so118037pjd.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 16:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1XFUxolbA7h1HeK5YbtlyNm7bbkj2GGYGOp3MuLqhZo=;
 b=eqzf/OiAqYuMkve9o3Rg2GzzA/6jLGZPEtPfhYoyr9342xlMhSngQCcxYLIDthFc44
 UUDoF359natqKdeAghtC2LYyTQPzIg2AfXD2MCDW8kgNUE8qyC5F3NyYAgket6AT8NZX
 C6dnA0DKIhRg+87oFAnmsOztdZ0eB8yymCaVRso8HDay52lsZUudDdwbNgj0QOSKX0+6
 N6FojIdcqDVo6XGYNKA7m5x7NbW41RWc8A1LXhyZZwLysgZr6fzzJY7dQpft6xUhMYb4
 F09zIOTv8fdcyWJU2Ln6l6J7/iegUOLhTxJf/aBepWLxKWQXt8bgGDxJfH/ZvRt4O9HF
 o+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1XFUxolbA7h1HeK5YbtlyNm7bbkj2GGYGOp3MuLqhZo=;
 b=jqgARwblqhcrtsuUe63XHCfihCkpjWOIe/5Njr8M7tugVs57ZOZC28IVD4tzbLJcYn
 EvRy86/N/pa9AXuyI0njUo2TTGqu9k2bMi1MXambPqwEAu3Jj5rcq9/X7ZWV7ziUj/IR
 Pu32wjjpRq2jAr12GMBIdzevKSsEKZlVUxzLLUhWfkPm8eVuNdROAEc1ykRAhvhK3dkD
 WqnMTVDogeMBYPKDI1oiEDySD6EeDsTDP2hKAbusCKGTpznnbxipk+C+z10EGZ/UQCuP
 e6IIy6lPpWxhhEOMEDgexk/Ai/JtrVP/byCkA5ckXgIOo9/bqMvVJwGnA7nQ4hVdV7Sm
 VcHg==
X-Gm-Message-State: AOAM532gGjWWQuZVxHM4EZuNJwdhXIinZ6hdnjEB82Gv2hoP1NRvjs9d
 H5ViuLKvmhboBmCJPER/FUg=
X-Google-Smtp-Source: ABdhPJw7ZMI0DJ+F4LF445yS7IqFpJ7Ao4uy9XqpsjpadMZlzLMoDBw9nkHIEjI8WBaRHIT9WnIzRg==
X-Received: by 2002:a17:90b:23c9:: with SMTP id
 md9mr86097pjb.173.1597965593711; 
 Thu, 20 Aug 2020 16:19:53 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id f195sm150711pfa.96.2020.08.20.16.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 16:19:53 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 tony.luck@intel.com, fenghua.yu@intel.com, schnelle@linux.ibm.com,
 gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, davem@davemloft.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 James.Bottomley@HansenPartnership.com, deller@gmx.de
Subject: [RFT][PATCH 0/7] Avoid overflow at boundary_size
Date: Thu, 20 Aug 2020 16:19:23 -0700
Message-Id: <20200820231923.23678-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: sfr@canb.auug.org.au, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We are expending the default DMA segmentation boundary to its
possible maximum value (ULONG_MAX) to indicate that a device
doesn't specify a boundary limit. So all dma_get_seg_boundary
callers should take a precaution with the return values since
it would easily get overflowed.

I scanned the entire kernel tree for all the existing callers
and found that most of callers may get overflowed in two ways:
either "+ 1" or passing it to ALIGN() that does "+ mask".

According to kernel defines:
    #define ALIGN_MASK(x, mask) (((x) + (mask)) & ~(mask))
    #define ALIGN(x, a)	ALIGN_MASK(x, (typeof(x))(a) - 1)

We can simplify the logic here:
  ALIGN(boundary + 1, 1 << shift) >> shift
= ALIGN_MASK(b + 1, (1 << s) - 1) >> s
= {[b + 1 + (1 << s) - 1] & ~[(1 << s) - 1]} >> s
= [b + 1 + (1 << s) - 1] >> s
= [b + (1 << s)] >> s
= (b >> s) + 1

So this series of patches fix the potential overflow with this
overflow-free shortcut.

As I don't think that I have these platforms, marking RFT.

Thanks
Nic

Nicolin Chen (7):
  powerpc/iommu: Avoid overflow at boundary_size
  alpha: Avoid overflow at boundary_size
  ia64/sba_iommu: Avoid overflow at boundary_size
  s390/pci_dma: Avoid overflow at boundary_size
  sparc: Avoid overflow at boundary_size
  x86/amd_gart: Avoid overflow at boundary_size
  parisc: Avoid overflow at boundary_size

 arch/alpha/kernel/pci_iommu.c    | 10 ++++------
 arch/ia64/hp/common/sba_iommu.c  |  4 ++--
 arch/powerpc/kernel/iommu.c      | 11 +++++------
 arch/s390/pci/pci_dma.c          |  4 ++--
 arch/sparc/kernel/iommu-common.c |  9 +++------
 arch/sparc/kernel/iommu.c        |  4 ++--
 arch/sparc/kernel/pci_sun4v.c    |  4 ++--
 arch/x86/kernel/amd_gart_64.c    |  4 ++--
 drivers/parisc/ccio-dma.c        |  4 ++--
 drivers/parisc/sba_iommu.c       |  4 ++--
 10 files changed, 26 insertions(+), 32 deletions(-)

-- 
2.17.1

