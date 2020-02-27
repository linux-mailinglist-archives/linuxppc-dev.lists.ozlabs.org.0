Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C02172ADD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 23:08:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T6J96vYVzDr0R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 09:08:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T6GH15CWzDqvD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 09:07:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pQakjTO9; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48T6GF6kFZz9sPk;
 Fri, 28 Feb 2020 09:07:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582841222;
 bh=UPdHkhQ2wE3MV+Rb8y/DrIlO42XJmnPWVNFsHh/Jdgc=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=pQakjTO9dtScDc23cMzK3fbXIPrmBimHJNZANPYt3oMnzl3wX/p06Nv2WjGihUONs
 TIJ7XAU71DA6m0Zrrdm7Xi1Ibqi98u/U5+9zRgGSGc1ugpY0QvgUy26QOJt619xT5T
 D7ruYs6OFkKXFhimAUbI0sIXMV+xJyY9f2qB6DDrYIfc7/z5RZVONmQUMSvtdQPc58
 xWGVFw+9EUDxvZhz2ZHarijIMfDQZDd5ofdjSMoR0tBt7AhDPOFmjiaH3jNZwn30xX
 n2xPpaWSoUblR/fwK7othw/9aO8+f36kSe9pRIv+zJINWg3b7DbKm5aHC8fvi9edcW
 +tUvvjLkPwPtQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Bug 206203] kmemleak reports various leaks in
 drivers/of/unittest.c
In-Reply-To: <bug-206203-206035-Iux2rayMYJ@https.bugzilla.kernel.org/>
References: <bug-206203-206035@https.bugzilla.kernel.org/>
 <bug-206203-206035-Iux2rayMYJ@https.bugzilla.kernel.org/>
Date: Fri, 28 Feb 2020 09:06:57 +1100
Message-ID: <87sgiv1y7y.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

bugzilla-daemon@bugzilla.kernel.org writes:
> https://bugzilla.kernel.org/show_bug.cgi?id=206203
>
> --- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
> Created attachment 287671
>   --> https://bugzilla.kernel.org/attachment.cgi?id=287671&action=edit
> kmemleak output (kernel 5.6-rc3, PowerMac G5 11,2)
>
> Same on a PowerMac G5 11,2 (kernel 5.6-rc3).

Can you attach the /sys/kernel/debug/kmemleak output please.

cheers
