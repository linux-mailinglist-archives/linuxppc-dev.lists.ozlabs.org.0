Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FDB38283D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 11:24:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkDH40nDtz2yxL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 19:24:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SdXc0TZ8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SdXc0TZ8; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkDGX5kCrz2xZs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 19:24:04 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id CF0CC611BF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 09:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621243441;
 bh=8jxszQIoolKE+WQ9Lmh0xUlTK71xEroc9KgzsNS2zLg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SdXc0TZ8Qde5X6a91xrvCjVzQJNC3/EPFcamhza53omaOAZ0/gBbNF8pbRkXowVYS
 nezNdg0EpuXhrMZJs7oe+tgkEBk5NG2sRXfulyEtXzZaqwJs8t2rIIvvQm3gyCzSQ7
 tJBA16snrqPsG95u+Zep5NVbenj/gxB4RpxRZWbleUkbWoVeoUas11CyA4EfSRgw9N
 ss325pY7ZekVbmKN6Q9oxSMdcz2iWEDT9U5ulvX2ayspbfwIHB1wfgsS8F1cRmh9GT
 rQAwUdPlLkoFw/c7dih49VOSWjh6ztpeT1G5GQMbPpNeNPbZgHyEs5Wj7eLqHfCflB
 d60ptPuIwc5ZA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B697861104; Mon, 17 May 2021 09:24:01 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206733] i2c i2c-3: i2c-powermac: modalias failure on
 /uni-n@f8000000/i2c@f8001000/cereal@1c0
Date: Mon, 17 May 2021 09:24:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: newchief@king.net.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206733-206035-F8UnXb0lXP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206733-206035@https.bugzilla.kernel.org/>
References: <bug-206733-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206733

Paul Osmialowski (newchief@king.net.pl) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |newchief@king.net.pl

--- Comment #4 from Paul Osmialowski (newchief@king.net.pl) ---
I've just updated to 5.10.27-gentoo on some old iBook G4, and of course I've
spotted this `i2c-powermac: modalias failure on
/uni-n@f8000000/i2c@f8001000/cereal@1c0` message. It is not worrying now af=
ter
I've found Ben's comment. I've also spotted one more error message (Flag
mismatch) that seems new to me, can you also make a judgement if it is also
harmless?:

[...]
[    4.515861] hid-generic 0003:17EF:602E.0001: input,hidraw0: USB HID v1.11
Mouse [USB Optical Mouse] on usb-0001:10:1b.0-1/input0
[    4.660923] input: PowerMac Beep as
/devices/pci0001:10/0001:10:17.0/input/input3
[    4.665549] genirq: Flags mismatch irq 21. 00000001 (i2sbus: i2s-a (tx))=
 vs.
00000001 (PMac Output)
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
