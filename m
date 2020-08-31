Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D522582FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 22:48:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgMjt3T2vzDqFp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 06:48:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZkZqEI05; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgMVd39DdzDqRx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 06:38:48 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id mm21so491416pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 13:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=IwVRkCMCyZnv4TAjRBRmsSZkvVEHDfWBL3BIyYi4zQo=;
 b=ZkZqEI05NuuUmHp4uq5a9dsrbwy6wdRKCA6iPyNirvHNYsQVEQqt6/lvse4QXcTqv2
 3mJ1pK85ab2S9FLesU7vnJPgRPLpltd14LU7nZlzQx3sQAZgkcVa+sBCkKawqacB1437
 b+9+HKTj8Bhj2BcACUf2G8k8rjyMCHPBsFUayVjGCPKiSuU3VdSX/AK3nzAUmLgYekB+
 0n7keCtBO+JccJGJanwqSwRo70x6sH2B+iEoaUSPCdeeSiSwkKtkyAex8kV0D0W0hY0s
 LZUJCW89ct/rL13iuPmo0Qg+ugXIe6iwZCeXUVA5RHMFZrGt2KQUK7HO1RotW/sE7agp
 6EFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IwVRkCMCyZnv4TAjRBRmsSZkvVEHDfWBL3BIyYi4zQo=;
 b=R2plCsMW1OjvPVc1eew5L/0zpd76FozA8uePUD/SViwM7vW4UwIZiMcjD8VPvQF3RS
 icKRz0GrbzL/cb0ahO7xNBg/xUv446QhC8dJAGpb2CHFA64m/ULUJHl9gsDWorXOLVkP
 0ryxiIi7rR6lF2r5B6II4EuO7A7yJCCtjUvgCbk7AVf0tOi0QamDHfZaSJ4HUAU1EKtv
 ZgVat9eM1Jo4mzb0tMiQPMXC532yxd5WABLoLJAXLl7kQt2KHVuYw6mXtZliISUrRZOO
 gL9lOvWHkEGxy4zMGYUTg+5eb+VvPqIFg9UlM/RJHiylrmJ+iV6xM/WgSSasWQHuJctL
 k+aQ==
X-Gm-Message-State: AOAM533rtttTGo4gccEYAe78+dreLyt2tL29IiKylteb4rvpSMUrbceX
 PbgzyzliZaXvykXj1VJSSXw=
X-Google-Smtp-Source: ABdhPJxZWUFmKJnOqKQskXfTYVdxoI7lzl+mkXQEUEnR18yGX2dCIBolzAzimegoss/mYS3BHiIAsg==
X-Received: by 2002:a17:902:b18e:: with SMTP id
 s14mr2351578plr.160.1598906323230; 
 Mon, 31 Aug 2020 13:38:43 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a26sm116850pfn.93.2020.08.31.13.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 13:38:42 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 tony.luck@intel.com, fenghua.yu@intel.com, schnelle@linux.ibm.com,
 gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, davem@davemloft.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 James.Bottomley@HansenPartnership.com, deller@gmx.de
Subject: [RESEND][PATCH 0/7] Avoid overflow at boundary_size
Date: Mon, 31 Aug 2020 13:38:04 -0700
Message-Id: <20200831203811.8494-1-nicoleotsuka@gmail.com>
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

==== For this resend ====
The original series have not been acked at any patch. So I am
resending them, being suggested by Niklas.

==== Coverletter ====
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

As I don't have these platforms, testings/comments are welcome.

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

