Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E71216CDC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 14:32:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1MKJ5S0vzDqtV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 22:32:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=hf0p=as=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1MH35my4zDqnZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 22:30:55 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 208197] OF: /pci@f2000000/mac-io@17/gpio@50/...: could not find
 phandle
Date: Tue, 07 Jul 2020 12:30:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208197-206035-dZBY0taqKG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208197-206035@https.bugzilla.kernel.org/>
References: <bug-208197-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208197

--- Comment #6 from Erhard F. (erhard_f@mailbox.org) ---
Also I took some time to revert individual commits from the bisect.log:

388bcc6ecc609fca1b4920de7dc3806c98ec535e drivers: base: Fix NULL pointer
exception in __platform_driver_probe() if a driver developer is foolish
48ebea5026d692c5ab0a7d303f0fe1f8ba046e0f firmware_loader: move
fw_fallback_config to a private kernel symbol namespace
c78c31b374a68be79cb4a03ef5b6c187f034e903 Revert "Revert "driver core: Set
fw_devlink to "permissive" behavior by default""
c8be6af9ef16cf44d690fc227a0d2dd7a526ef05 Merge v5.7-rc5 into driver-core-ne=
xt
eb7fbc9fb1185a7f89adeb2de724c2c96ff608e9 driver core: Add missing '\n' in l=
og
messages
42926ac3cd50937346c23c0005817264af4357a7 driver core: Move code to the right
part of the file
baf1d9c182935e88aab08701b0a0b22871117fe0 driver/base/soc: Use kobj_to_dev()=
 API
5f5377eaddfc24e5d7562e588d0ff84f9264d7c1 driver core: Look for waiting
consumers only for a fwnode's primary device
96fa72ffb2155dba9ba8c5d282a1ff19ed32f177 Merge 5.7-rc3 into driver-core-next
716a7a25969003d82ab738179c3f1068a120ed11 driver core: fw_devlink: Add suppo=
rt
for batching fwnode parsing
fbc35b45f9f6a971341b9462c6e94c257e779fb5 Add documentation on meaning of
-EPROBE_DEFER
45bb08de65b418959313593f527c619e102c2d57 driver core: platform: remove
redundant assignment to variable ret
93d2e4322aa74c1ad1e8c2160608eb9a960d69ff of: platform: Batch fwnode parsing
when adding all top level devices
69b07ee33eb12a505d55e3e716fc7452496b9041 debugfs: Use the correct style for
SPDX License Identifier
fefcfc968723caf93318613a08e1f3ad07a6154f driver core: Remove check in
driver_deferred_probe_force_trigger()
0f605db5bdd42edfbfcac36acaf8f72cfe9ce774 kernfs: Change kernfs_node lockdep
name to "kn->active"
c82c83c330654c5639960ebc3dabbae53c43f79e driver core: platform: Fix spelling
errors in platform.c
114dbb4fa7c4053a51964d112e2851e818e085c6 drivers property: When no children=
 in
primary, try secondary
55623260bb33e2ab849af76edf2253bc04cb241f test_firmware: remove unnecessary
test_fw_mutex in test_dev_config_show_xxx
2cd38fd15e4ebcfe917a443734820269f8b5ba2b driver core: Remove unnecessary
is_fwnode_dev variable in device_add()
ab7c1e163b525316a870a494dd4ea196e7a6c455 firmware: Drop unused pages field =
from
struct firmware
f7d8f3f092d001f8d91552d2697643e727694942 Merge 5.7-rc7 into driver-core-next


Reverting Merge 5.7-rc7 into driver-core-next via:
git revert f7d8f3f092d001f8d91552d2697643e727694942 -m2

while leaving the other commits still in made the "could not find phandle"
disappear. I guess the relevant commit is somewhere in this merge.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
