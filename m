Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C911D1E2F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 20:56:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MkRp5GW1zDqF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 04:56:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=aMnRz9IN; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZzVmKyi4; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MkMD18tbzDqc5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 04:52:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589395964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=klz1aIlltTyMvpQo6wp2CnVfN50qcHTeSgtHjx0WeI8=;
 b=aMnRz9INnv+JdfcDSmXV2SQUFxAoeovMzFGrYgj7pNBOAEZWzpwrou6FzRX8B+Uku6f5x0
 b5Tx/Yh8HDNTewp78P7DkX+FQ455BwfrzMu5jhIcPpOsn4e+IxqDZprGtlNqyf1RPKlPH+
 wexqukKd1DwPcyAYD9hKSzos7xbcoBg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589395965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=klz1aIlltTyMvpQo6wp2CnVfN50qcHTeSgtHjx0WeI8=;
 b=ZzVmKyi4eoqOMsjEQh0UyLEk/U5aD6673idZvaZ9VuziqgtYKFlFnRMoJ49PMFbzzfPg4C
 dz4He3DSI61S5lVWQQRyZApr2oYqLNGFwOfIvpkGiD0TmPeBAx/9ejlp7qPtCbPlYi/yej
 zrsOVta8jkQf05eTya5qb03zwttcTM0=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-ZXS0ejXBP36Hh2YdpV4_9w-1; Wed, 13 May 2020 14:52:43 -0400
X-MC-Unique: ZXS0ejXBP36Hh2YdpV4_9w-1
Received: by mail-pf1-f198.google.com with SMTP id z19so480970pfk.15
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 11:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=klz1aIlltTyMvpQo6wp2CnVfN50qcHTeSgtHjx0WeI8=;
 b=DeM2e/j4cm8b5QcjK9mTIsQV868B7wnlf2ZSjx4D7QDSpLKu5zueKXvDb3T6pI0jI7
 xZVvYMoFCqbOaaGGszkkQWcGKeXoATOvYb5buT7ACvOjya8MpfzBS9p/Y0NMYR9H/xq1
 9Q2rD+oOZ0Tc2VGsCvszqOovICsIljYTE3RWWiRfHrEjgtpiE262D+3S8AAUHOdgMHrz
 qic0ozlmsK5b36JbKQMkHp5bup1P6jIATrWQILVIBjwIe64AVeveQhx874nOIx5cfBRH
 zA6yuuNJXnHuw33nTrsFwGXGK24GB6HcW4Vc9zEGH+ByLwATAtIgdLXCaC6fgnwbNp9E
 aAsQ==
X-Gm-Message-State: AGi0PuZGI6Ji+ume3Dj/CsYbX6QXKzBGQbccW97knHychXejEogOw0T3
 3PwcPVxpUXUxhkQAxk51imZSfh+lF9jvsZW/pzn4Sow54HIwek7FaN1YGV0QhxGSfN/usN607u8
 lbfZWsFXhVLbhDFTuHlHii2BKDA==
X-Received: by 2002:a17:90a:bc4a:: with SMTP id
 t10mr35609788pjv.104.1589395961877; 
 Wed, 13 May 2020 11:52:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypIuLKmGrGFPHM791kHZAFCmnHIYlCo9XywvYUHAqAM5Bb2fZsRB2lyt+YcuSxBVSz35z/ovow==
X-Received: by 2002:a17:90a:bc4a:: with SMTP id
 t10mr35609740pjv.104.1589395961483; 
 Wed, 13 May 2020 11:52:41 -0700 (PDT)
Received: from localhost ([122.177.166.225])
 by smtp.gmail.com with ESMTPSA id m18sm16270331pjl.14.2020.05.13.11.52.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 May 2020 11:52:40 -0700 (PDT)
From: Bhupesh Sharma <bhsharma@redhat.com>
To: linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v6 0/2] Append new variables to vmcoreinfo (TCR_EL1.T1SZ for
 arm64 and MAX_PHYSMEM_BITS for all archs)
Date: Thu, 14 May 2020 00:22:35 +0530
Message-Id: <1589395957-24628-1-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
 Amit Kachhap <amit.kachhap@arm.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Catalin Marinas <catalin.marinas@arm.com>,
 John Donnelly <john.p.donnelly@oracle.com>, scott.branden@broadcom.com,
 Boris Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 bhupesh.linux@gmail.com, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Steve Capper <steve.capper@arm.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 Dave Anderson <anderson@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Apologies for the delayed update. Its been quite some time since I
posted the last version (v5), but I have been really caught up in some
other critical issues.

Changes since v5:
----------------
- v5 can be viewed here:
  http://lists.infradead.org/pipermail/kexec/2019-November/024055.html
- Addressed review comments from James Morse and Boris.
- Added Tested-by received from John on v5 patchset.
- Rebased against arm64 (for-next/ptr-auth) branch which has Amit's
  patchset for ARMv8.3-A Pointer Authentication feature vmcoreinfo
  applied.

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
  [PATCH 2/2] appends 'MAX_PHYSMEM_BITS' to vmcoreinfo in core kernel code (all archs)

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
Cc: John Donnelly <john.p.donnelly@oracle.com>
Cc: scott.branden@broadcom.com
Cc: Amit Kachhap <amit.kachhap@arm.com>
Cc: x86@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: kexec@lists.infradead.org

Bhupesh Sharma (2):
  crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
  arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo

 Documentation/admin-guide/kdump/vmcoreinfo.rst | 16 ++++++++++++++++
 arch/arm64/include/asm/pgtable-hwdef.h         |  1 +
 arch/arm64/kernel/crash_core.c                 | 10 ++++++++++
 kernel/crash_core.c                            |  1 +
 4 files changed, 28 insertions(+)

-- 
2.7.4

