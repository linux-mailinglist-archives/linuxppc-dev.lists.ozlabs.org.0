Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B651EDF5C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 21:13:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xmVx5g8VzDqLh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 06:12:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=cs5n=yo=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xmSq20RszDqD4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 06:11:06 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 199561] sungem: RX MAC fifo overflow smac[03910440]
Date: Mon, 21 Oct 2019 19:11:03 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Network
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_network@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc rep_platform cf_kernel_version
Message-ID: <bug-199561-206035-wD5NoJCSo4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199561-206035@https.bugzilla.kernel.org/>
References: <bug-199561-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D199561

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |linuxppc-dev@lists.ozlabs.o
                   |                            |rg
           Hardware|PPC-64                      |PPC-32
     Kernel Version|4.19.19                     |5.4-rc4

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
On 5.4-rc4 I am getting now:

[   43.822417] sungem_phy: PHY ID: 2060e1, addr: 0
[   43.831184] gem 0002:20:0f.0 enP2p32s15f0: Found BCM5421 PHY
[   47.502223] gem 0002:20:0f.0 enP2p32s15f0: Link is up at 1000 Mbps,
full-duplex
[   47.502697] gem 0002:20:0f.0 enP2p32s15f0: Pause is enabled (rxfifo: 102=
40
off: 7168 on: 5632)
[   47.503173] IPv6: ADDRCONF(NETDEV_CHANGE): enP2p32s15f0: link becomes re=
ady
[...]
[  423.097905] gem 0002:20:0f.0 enP2p32s15f0: Memory squeeze, deferring pac=
ket
[  423.125951] gem 0002:20:0f.0 enP2p32s15f0: Memory squeeze, deferring pac=
ket
[  423.148828] gem 0002:20:0f.0 enP2p32s15f0: Memory squeeze, deferring pac=
ket
[  423.156830] gem 0002:20:0f.0 enP2p32s15f0: RX MAC fifo overflow
smac[00910440]
[  423.243823] gem 0002:20:0f.0 enP2p32s15f0: Memory squeeze, deferring pac=
ket

--=20
You are receiving this mail because:
You are on the CC list for the bug.=
