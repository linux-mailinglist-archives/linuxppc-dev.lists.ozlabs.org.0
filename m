Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1032C522D8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 09:44:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kyn3X0LzYz3cDT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 17:44:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I7ZjeBL4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I7ZjeBL4; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kyn2p5m97z2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 17:43:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5D57617CC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 07:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F1D4C385DB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 07:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652255006;
 bh=LPyVDwmhUn7CVpnYkCFdmxIeWpHljURfLOJSZjj8kfU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=I7ZjeBL4xtFzFXmbVLScmYXieoeOvr8cmIpK0VH+zUXX4NxxEPX6sEwukMQNOzO2S
 YIKH0NBrjQsKbhHEts6lquBxn6MHVyPFYuQMb6Hb3nZ2zXGH2C3W/yiGRJGK+vWw9a
 zXrt5NZEXkQhiVh8Q/vO3sNRzqG038PNWVFQR46Xjuj1pP3/Lo0wEbzrt7OXh9TXkI
 knV4nuuoPm0NGDj3p4KZJ8XuCXKcnuCyWcYXgPLYm/jVU3l4XVqlG8HQ4UBPhTkleK
 9KFZpSRA7IQedRf3BMI37zOzSC+kdMCtvT1jKTL+HQDbtVuvITS9oOPQgWOCJIlxWN
 Ciu5gsPX7sKDg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 10A16C05FD0; Wed, 11 May 2022 07:43:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Wed, 11 May 2022 07:43:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-215389-206035-RCFwICvZOX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #300774|0                           |1
        is obsolete|                            |

--- Comment #16 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300929
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300929&action=3Dedit
dmesg (5.18-rc6, CONFIG_LOWMEM_SIZE=3D0x28000000, PowerMac G4 DP)

(In reply to Christophe Leroy from comment #14)
> Do you mean it still happens with the default values, or it also happens
> with the reduced CONFIG_LOWMEM_SIZE ?
Turns out the memory corruption also happens with the reduced
CONFIG_LOWMEM_SIZE=3D0x28000000.

Tested again on v5.18-rc6, both with CONFIG_LOWMEM_SIZE=3D0x28000000 and wi=
thout.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
