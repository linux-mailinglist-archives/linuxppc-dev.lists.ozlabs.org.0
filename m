Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A49D41BE7F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 22:19:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452sbp5NMTzDqLJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 06:19:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bugzilla.kernel.org
 (client-ip=198.145.29.98; helo=mail.wl.linuxfoundation.org;
 envelope-from=bugzilla-daemon@bugzilla.kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452sZR5HQWzDqBX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 06:18:07 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 764662845C
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 20:18:04 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 6B0B02843C; Mon, 13 May 2019 20:18:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=2.0 tests=BAYES_00,HEXHASH_WORD,
 NO_RECEIVED,NO_RELAYS autolearn=no version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 203597] New: kernel 4.9.175 fails to boot on a PowerMac G4 3,6
 at early stage
Date: Mon, 13 May 2019 20:18:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-203597-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D203597

            Bug ID: 203597
           Summary: kernel 4.9.175 fails to boot on a PowerMac G4 3,6 at
                    early stage
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 4.9.175
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 282743
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D282743&action=3Dedit
kernel .config (PowerMac G4 MDD)

Trying out older kernels on the G4 MDD I noticed recent 4.9.x freeze the
machine. Only message displayed in black letters on a white screen:

done
found display   : /pco@f0000000/ATY,AlteracParent@10/ATY,Alterac_B@1,
opening...


It's a hard freeze, RCU_CPU_STALL_TIMEOUT does not kick in.

Tried other stable kernels, which all worked:
4.19.37
4.14.114=20
4.4.179

So I suppose it's only a 4.9.x issue. Last working 4.9.x kernel I had in
service was 4.9.161. First one I spotted freezing was 4.9.171. A bisect gav=
e me
the following commit:

1c38a84d45862be06ac418618981631eddbda741 is the first bad commit
commit 1c38a84d45862be06ac418618981631eddbda741
Author: Michael Neuling <mikey@neuling.org>
Date:   Thu Apr 11 21:45:59 2019 +1000

    powerpc: Avoid code patching freed init sections

    commit 51c3c62b58b357e8d35e4cc32f7b4ec907426fe3 upstream.

    This stops us from doing code patching in init sections after they've
    been freed.

    In this chain:
      kvm_guest_init() ->
        kvm_use_magic_page() ->
          fault_in_pages_readable() ->
             __get_user() ->
               __get_user_nocheck() ->
                 barrier_nospec();

    We have a code patching location at barrier_nospec() and
    kvm_guest_init() is an init function. This whole chain gets inlined,
    so when we free the init section (hence kvm_guest_init()), this code
    goes away and hence should no longer be patched.

    We seen this as userspace memory corruption when using a memory
    checker while doing partition migration testing on powervm (this
    starts the code patching post migration via
    /sys/kernel/mobility/migration). In theory, it could also happen when
    using /sys/kernel/debug/powerpc/barrier_nospec.

    Cc: stable@vger.kernel.org # 4.13+
    Signed-off-by: Michael Neuling <mikey@neuling.org>
    Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
    Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
