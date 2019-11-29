Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ECB10DA5E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 21:02:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PlmD5HvvzDrFn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 07:02:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="E2DCNqRg"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Plhq0tfdzDrDN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 06:59:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575057575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PGjdyVBK0NO+k94paV7/u4ZDFA/aVBH6mgmJUwldOho=;
 b=E2DCNqRgJke9oeZv/AHDEeIDY5CZkWA9TBv1pWY5sqh4VeHGyq/oje9uzJmpOlXTiNWfge
 s5GTpm7qDoeZu0wctyXiuO508l1Aw48P0CBuv/wOeL6AvAKqhstJMAYrC8YQcXwrOd315d
 hzDLElX/yK+Y04ezWPLgnUdfvc7H6cM=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-EruhfdrAMemSUoFbexIHpQ-1; Fri, 29 Nov 2019 14:59:32 -0500
Received: by mail-pg1-f198.google.com with SMTP id l13so4406168pgt.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 11:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XYOfM9R2XBKHHSS98VDt4f7vGAptvryNwXrf29d+FoM=;
 b=J/qD20nhh8JWl7RvZv9Gp6XN4axWVx5DGaVSvYYCNSyHD8D3e/6QU2PEDNUDMdPMIv
 fVSxFv4bzC7Oun68eDEv0/I16UdOm7tCk7e0713ivDkFOScQJmEsZJ9wUCh/MjZWmgI1
 J06cXy9Gx5nVaGSw4PMLPhFopjkI5r9SwDcF0ejVq6ZkOO/d1wXTlaWwGWGdPcXsyfOH
 6eVzhLdAxWs0VWqUhhqfAMf/bQu3hhh8LZmTvDQF1ZKSF0mTuNqqQn8alZXAn1/4hO+o
 fvfM0zORkr+mUo/ruJQdJwENuNP8G9oL21jrblzxgQ3n8oxArX5bwQ/mOQojaKxB+sA4
 EceQ==
X-Gm-Message-State: APjAAAXBw5ILNXMcbnDe1rwoIJ2qBVi0+gB6fGjwUDRJNV26lMb4EGrt
 5ZPCH0/TQNMNailEybEsmNSXt6hXRakSr7I3QAR4mm5FQDgSvYztdfqvQ5HmpKjuQbWxnxRugT9
 kIhAz99f3yTbEHkVuWMQQbyXBKg==
X-Received: by 2002:a17:902:8306:: with SMTP id
 bd6mr16507180plb.44.1575057571080; 
 Fri, 29 Nov 2019 11:59:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqyljUzyA3KtTRKkGnKvsWK+K41PljOh/OKc7B2V7ONz/6y4bL+GDxj1bPx+laskD1hlt3BGRA==
X-Received: by 2002:a17:902:8306:: with SMTP id
 bd6mr16507151plb.44.1575057570720; 
 Fri, 29 Nov 2019 11:59:30 -0800 (PST)
Received: from localhost ([122.177.85.74])
 by smtp.gmail.com with ESMTPSA id s7sm10138820pfe.22.2019.11.29.11.59.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Nov 2019 11:59:29 -0800 (PST)
From: Bhupesh Sharma <bhsharma@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v5 0/5] Append new variables to vmcoreinfo
 (TCR_EL1.T1SZ for arm64 and MAX_PHYSMEM_BITS for all archs)
Date: Sat, 30 Nov 2019 01:29:14 +0530
Message-Id: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
X-MC-Unique: EruhfdrAMemSUoFbexIHpQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 bhsharma@redhat.com, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Dave Anderson <anderson@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, bhupesh.linux@gmail.com,
 linux-arm-kernel@lists.infradead.org, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Steve Capper <steve.capper@arm.com>, kexec@lists.infradead.org,
 James Morse <james.morse@arm.com>, Boris Petkov <bp@alien8.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

- Resending the v5 version as Will Deacon reported that the patchset was
  split into two seperate threads while sending out. It was an issue
  with my 'msmtp' settings which seems to be now fixed. Please ignore
  all previous v5 versions.

Changes since v4:
----------------
- v4 can be seen here:
  http://lists.infradead.org/pipermail/kexec/2019-November/023961.html
- Addressed comments from Dave and added patches for documenting
  new variables appended to vmcoreinfo documentation.
- Added testing report shared by Akashi for PATCH 2/5.

Changes since v3:
----------------
- v3 can be seen here:
  http://lists.infradead.org/pipermail/kexec/2019-March/022590.html
- Addressed comments from James and exported TCR_EL1.T1SZ in vmcoreinfo
  instead of PTRS_PER_PGD.
- Added a new patch (via [PATCH 3/3]), which fixes a simple typo in
  'Documentation/arm64/memory.rst'

Changes since v2:
----------------
- v2 can be seen here:
  http://lists.infradead.org/pipermail/kexec/2019-March/022531.html
- Protected 'MAX_PHYSMEM_BITS' vmcoreinfo variable under CONFIG_SPARSEMEM
  ifdef sections, as suggested by Kazu.
- Updated vmcoreinfo documentation to add description about
  'MAX_PHYSMEM_BITS' variable (via [PATCH 3/3]).

Changes since v1:
----------------
- v1 was sent out as a single patch which can be seen here:
  http://lists.infradead.org/pipermail/kexec/2019-February/022411.html

- v2 breaks the single patch into two independent patches:
  [PATCH 1/2] appends 'PTRS_PER_PGD' to vmcoreinfo for arm64 arch, whereas
  [PATCH 2/2] appends 'MAX_PHYSMEM_BITS' to vmcoreinfo in core kernel code =
(all archs)

This patchset primarily fixes the regression reported in user-space
utilities like 'makedumpfile' and 'crash-utility' on arm64 architecture
with the availability of 52-bit address space feature in underlying
kernel. These regressions have been reported both on CPUs which don't
support ARMv8.2 extensions (i.e. LVA, LPA) and are running newer kernels
and also on prototype platforms (like ARMv8 FVP simulator model) which
support ARMv8.2 extensions and are running newer kernels.

The reason for these regressions is that right now user-space tools
have no direct access to these values (since these are not exported
from the kernel) and hence need to rely on a best-guess method of
determining value of 'vabits_actual' and 'MAX_PHYSMEM_BITS' supported
by underlying kernel.

Exporting these values via vmcoreinfo will help user-land in such cases.
In addition, as per suggestion from makedumpfile maintainer (Kazu),
it makes more sense to append 'MAX_PHYSMEM_BITS' to
vmcoreinfo in the core code itself rather than in arm64 arch-specific
code, so that the user-space code for other archs can also benefit from
this addition to the vmcoreinfo and use it as a standard way of
determining 'SECTIONS_SHIFT' value in user-land.

Cc: Boris Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: James Morse <james.morse@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Dave Anderson <anderson@redhat.com>
Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Cc: x86@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: kexec@lists.infradead.org

Bhupesh Sharma (5):
  crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
  arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
  Documentation/arm64: Fix a simple typo in memory.rst
  Documentation/vmcoreinfo: Add documentation for 'MAX_PHYSMEM_BITS'
  Documentation/vmcoreinfo: Add documentation for 'TCR_EL1.T1SZ'

 Documentation/admin-guide/kdump/vmcoreinfo.rst | 11 +++++++++++
 Documentation/arm64/memory.rst                 |  2 +-
 arch/arm64/include/asm/pgtable-hwdef.h         |  1 +
 arch/arm64/kernel/crash_core.c                 |  9 +++++++++
 kernel/crash_core.c                            |  1 +
 5 files changed, 23 insertions(+), 1 deletion(-)

--=20
2.7.4

