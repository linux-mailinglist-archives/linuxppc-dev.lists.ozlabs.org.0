Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D154514A12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 14:57:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqXZk2t5rz3bpY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 22:57:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nqD5nGAh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqXZ932Xnz2xnR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 22:57:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nqD5nGAh; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KqXZ929xBz4xdK;
 Fri, 29 Apr 2022 22:57:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651237025;
 bh=kF5kxtXKm89CTYrZus2RZJAXzodZQm5CG7vrxqPf34c=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=nqD5nGAhYqExsWUVgx8Ktmka0iZJpjsGyisbyKLmUSMfj7/RZSqFQvdVuLQEmkzly
 HUsAaraA0tAG2Z+i6xKhngW28jEXzrzqDlwrCpA3Jfm5rbXguk9ENjr6IVj1ar/28X
 XFnPNvMk401yyI47Np1BdNmTW8epOIfd3hMjXUObLa/AkOxBgjlhlneaeHTFk6QeHe
 /uZVgyg92nJZ7mYcxwd0TgN7wj1bjfBc+8MY8nW20FnXjgklBSjQqzt8T/YIv76EKo
 WMZSIixWmINCSru89In2WaM9W5+Yf60e41ik0NT77lcDzMflomh8Yur4eDOAI324zx
 oWCI1wLu1Vi1w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: L2 SRAM on PowerPC e500 and Caching-inhibited bit
In-Reply-To: <20220425182515.4dm37qbzjzpggce3@pali>
References: <20220425182515.4dm37qbzjzpggce3@pali>
Date: Fri, 29 Apr 2022 22:57:03 +1000
Message-ID: <874k2c9heo.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Pali Roh=C3=A1r <pali@kernel.org> writes:
> Hello!
>
> I started playing with PowerPC e500 architecture, it is something really
> new for me and I suspect that I found a bug in U-Boot code which
> configures L2 cache as initial SRAM (L2 with locked lines).
>
> U-Boot code for the first half of L2 cache sets Caching-inhibited
> (MAS2_I) in TLB and for second half of L2 cache it unsets this bit.
> And I think that this is a bug as it seems strange if one half of L2
> should be mapped differently than second half.
>
> I wrote about it email to U-Boot mailing list:
> https://lore.kernel.org/u-boot/20220413092633.gmz4rqpiha4rwecb@pali/
>
> I discussed about it on U-Boot IRC channel and developers suggested me
> to write on Linux PowerPC mailing list as there could be more skilled
> people.
>
> Michael, or anybody else, could you help me with this? Do you know if L2
> SRAM entry in TLB for e500v2 / BookE architecture should have MAS2_I bit
> set or not?

Sorry I don't know those sort of low-level details for Freescale
machines.

Hopefully some former Freescale person will remember and reply here.

It's also possible that Linux ignores what U-Boot did and sets it up
itself, have you looked at the Linux code?

cheers
