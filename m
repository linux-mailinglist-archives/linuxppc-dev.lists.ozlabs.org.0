Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E42A760509
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 04:05:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iOnhfsXU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R90jv3qc1z300f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 12:05:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iOnhfsXU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R90hy6M4Hz2yGC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 12:04:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F242C61389
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 02:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38181C433C9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 02:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690250686;
	bh=9IooG7aeiZdprXzU7DWpXNV5T4yJ5Ky9gaYZ0gg76Ms=;
	h=From:To:Subject:Date:From;
	b=iOnhfsXUBD64xEwb0+aLyIn+0lX7S0Bl/IWjAGUT05/R5xS6/6tO2ymKmhVncUrac
	 v8FiUkLoPaFeHJVjwbCmk3eUZ2MEk7gHtZtdWzodTH2rj4lDtEPboy18PS1YVeX2n2
	 aY5AoDqLECA64Pubniy6YjjZc4x0eQF2duTZDWa5h/iVjvG97BeAP/co/vD9BzW3i8
	 oGaknTICU9q2Cmwap7NQyNexXCYN0UEzYP865Rk8yYcJ8uxi2FbqHU6nw/J0Wd6ZTL
	 mYyy2ZyRuzroDTm+0M3HGtJ8xGHakkgoIyqaxyTckBkgSxr4U3cq3Q9aivk7ZpFuIX
	 xf8DWFxZ0zp/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 16B18C4332E; Tue, 25 Jul 2023 02:04:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 217702] New: makedumpfile can not open /proc/vmcore
Date: Tue, 25 Jul 2023 02:04:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: piliu@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217702-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D217702

            Bug ID: 217702
           Summary: makedumpfile can not open /proc/vmcore
           Product: Platform Specific/Hardware
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: piliu@redhat.com
        Regression: No

This bug should be introduced by the
commit 606787fed7268feb256957872586370b56af697a
Author: Nicholas Piggin <npiggin@gmail.com>
Date:   Tue Jun 6 19:38:32 2023 +1000

    powerpc/64s: Remove support for ELFv1 little endian userspace

    ELFv2 was introduced together with little-endian. ELFv1 with LE has
    never been a thing. The GNU toolchain can create such a beast, but
    anyone doing that is a maniac who needs to be stopped so I consider
    this patch a feature.

    Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    Link: https://msgid.link/20230606093832.199712-5-npiggin@gmail.com


And can be workaround by the following draft patch:

diff --git a/arch/powerpc/kexec/file_load_64.c
b/arch/powerpc/kexec/file_load_64.c
index 110d28bede2a..6af49c90c4b2 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -782,6 +782,18 @@ static void update_backup_region_phdr(struct kimage
*image, Elf64_Ehdr *ehdr)
        }
 }

+/**
+ * 64le only supports ELFv2 64-bit binaries (64be supports v1 and v2).
+ */
+static inline void update_elfcorehdr_eflags(Elf64_Ehdr *ehdr)
+{
+#if defined(CONFIG_PPC64) && defined(CONFIG_CPU_LITTLE_ENDIAN)
+       ehdr->e_flags =3D 0x2;
+#endif
+}
+
+
+
 /**
  * load_elfcorehdr_segment - Setup crash memory ranges and initialize
elfcorehdr
  *                           segment needed to load kdump kernel.
@@ -810,6 +822,7 @@ static int load_elfcorehdr_segment(struct kimage *image,
struct kexec_buf *kbuf)

        /* Fix the offset for backup region in the ELF header */
        update_backup_region_phdr(image, headers);
+       update_elfcorehdr_eflags(headers);

        kbuf->buffer =3D headers;
        kbuf->mem =3D KEXEC_BUF_MEM_UNKNOWN;

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
