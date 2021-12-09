Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B7846F61D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 22:41:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J96tn2ttdz3cNH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 08:41:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ga0D7v81;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ga0D7v81; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J96t21hyFz2ypL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 08:41:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2F9B9B8250C
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 21:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04FFEC004DD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 21:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639086069;
 bh=qMu2EqfDCLKw2QIbpWk+ftnyFM0rf9CAzVzJtmW3E5A=;
 h=From:To:Subject:Date:From;
 b=ga0D7v81lnZBxgbZz2eNCFX/ji4xXl+kDN3cSSCVhLtRXvKiEHuan2RtigjrLJhxh
 0iXDFRYvdN54PEJ7qM+BIY0wNetPPavX6XywTuiRm711yzM1uQ9lQMIC2t5o/VaDrO
 awVB3yHiHVpKpguulGZIFFfyA4Pr2aMpRO26CMWZ/dwGWxSGd/qQ+Bv8pThRR/8Fm8
 3t6XHf7BJLeSFc1Ah/cCa4Y0flmoVDlyGxC3d3EbY3oirsXpI//yMhBLMCKdGkzxfS
 jXCf5v/mmpECX+QTLF4n3O+ynPmgtqpdEXudZMtrZlV/y8e6o3lms0wQOzwxGXjQb6
 wTILfPc14wxwg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D551760F4F; Thu,  9 Dec 2021 21:41:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215285] New: power9 le: amdgpu: *ERROR* hw_init of IP block
 <psp> failed -22
Date: Thu, 09 Dec 2021 21:41:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sid@aeam.us
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215285-206035@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D215285

            Bug ID: 215285
           Summary: power9 le: amdgpu: *ERROR* hw_init of IP block <psp>
                    failed -22
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.15.6
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: sid@aeam.us
        Regression: No

POWER9 blackbird system from Talos. GPU is 6600XT. This seems to be a flip =
flop
regression: https://gitlab.freedesktop.org/drm/amd/-/issues/1519

[   54.313046] [drm] Found VCN firmware Version ENC: 1.16 DEC: 2 VEP: 0
Revision: 1
[   54.313054] amdgpu 0000:03:00.0: amdgpu: Will use PSP to load VCN firmwa=
re
[   54.314153] amdgpu 0000:03:00.0: enabling bus mastering
[   54.570938] [drm:psp_hw_start [amdgpu]] *ERROR* PSP create ring failed!
[   54.571061] [drm:psp_hw_init [amdgpu]] *ERROR* PSP firmware loading fail=
ed
[   54.571175] [drm:amdgpu_device_fw_loading [amdgpu]] *ERROR* hw_init of IP
block <psp> failed -22
[   54.571277] amdgpu 0000:03:00.0: amdgpu: amdgpu_device_ip_init failed
[   54.571279] amdgpu 0000:03:00.0: amdgpu: Fatal error during GPU init
[   54.571282] amdgpu 0000:03:00.0: amdgpu: amdgpu: finishing device.
[   54.572789] amdgpu: probe of 0000:03:00.0 failed with error -22

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
