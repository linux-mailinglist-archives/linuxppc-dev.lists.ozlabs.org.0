Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 804C54D7500
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Mar 2022 12:33:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KGcx62X9bz30NC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Mar 2022 22:33:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gf7WQjIW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Gf7WQjIW; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KGcwQ27V8z2xTd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Mar 2022 22:32:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64B2660FE2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Mar 2022 11:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC27BC340EC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Mar 2022 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647171153;
 bh=+ofc1IVZjLrtgGD4+Y2isiMhXqfVbd66Ssl2WcC1XGg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Gf7WQjIWSCa+huVDOLdr2OYSG9LoBswxtQeUSiaafNBLhqxiCxhl9Dkx3DGVWOwjG
 2xzzaNeFerlRVFGJvB9VVgc0+m5dI5/1iz+Oywtt1+EeqaA7f2UTlXkMyXehKygFtK
 RKxzLF39umhMMay3m6s8FRjF8BZ3AeIiU9CwS4gC4S9dnwlqs4UwbeVnR3rSw99cqz
 SeHw0ItqajSZoKXJsAKrHzC5PXg6Hd73f+YUaxGDMm0y9SOY3Tl+jVW4DQ+3Avt7X1
 Qth9kuHpqix5HNSfkPc7auAXDbqFESmQxt9iyS5/DWbPUG3TetiaoxA5pBufza3Spa
 jmLUnf9P9VOAQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id ABF20C05FCE; Sun, 13 Mar 2022 11:32:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] [bisected] "Kernel panic - not syncing: corrupted stack
 end detected inside scheduler" at building via distcc on a G5
Date: Sun, 13 Mar 2022 11:32:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-213837-206035-q4TqIgHMEU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213837-206035@https.bugzilla.kernel.org/>
References: <bug-213837-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213837

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #298933|0                           |1
        is obsolete|                            |
 Attachment #298961|0                           |1
        is obsolete|                            |

--- Comment #18 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300561
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300561&action=3Dedit
System.map (5.17-rc7 + patch, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
