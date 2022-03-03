Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B56444CBB77
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 11:33:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8S5B4zctz3cFF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 21:33:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FeJTHsta;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FeJTHsta; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8S4S5Y8Bz3bpY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 21:33:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78A1E612E1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 10:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD8D1C004E1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 10:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646303588;
 bh=vRabCWTn3zOOBKxcaRYk6NmqMo8GOZ6hCram3/0UDiQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FeJTHsta/G1cGtI0iVPsBcGEWTCgydlWsDDhjgkZUbCxsgV2maIp9oTwJ4vskKtz6
 nFH3X+wvWJjrBssRxvAPVKHx/wuzn/A9CtgR36JJ4Qyvhm3SzML1VK8aU72/r/qjwg
 RzmIbb2gwrGCMwdbcVp53rJ89k4NCM7qVuaTKVnH+O69348rvhRaO8xKI7HS+NiDCm
 fC9J79yKc1+CTsgVzYsCRBpAXDr0gDacALTC2n0L7cwq2X85hXqapehNOg+vG1Xcm4
 +/wRTsWBYq6fktf97/zeN+N4Nngj631cocXNvmR3VJNBtHipiJkeKgE7udcRexoNG7
 VFfUk6pLEOrLw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C576CC05FE2; Thu,  3 Mar 2022 10:33:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Thu, 03 Mar 2022 10:33:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215652-206035-9pMDU3fREQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215652-206035@https.bugzilla.kernel.org/>
References: <bug-215652-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215652

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
No I don't use an initrd. The kernel to boot the Talos is on a boot partiti=
on,
modules are loaded from root partition. Which worked in 5.16 and before. No=
w I
am getting this "could not insert 'radeon': Unknown symbol in module".

Though this may explain the 2nd error I got when building radeon statically
into the kernel. I'll add the firmware in-kernel and see if the error messa=
ge
changes and whether it actually works then.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
