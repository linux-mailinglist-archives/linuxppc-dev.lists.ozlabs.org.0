Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9BD49DFE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 11:55:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkyD73hx6z3cJl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 21:55:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QKs/rB31;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkyCT4gRZz2yLX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 21:54:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QKs/rB31; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JkyCS74VSz4xNm;
 Thu, 27 Jan 2022 21:54:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1643280885;
 bh=5lIaVIE45bKk0MuhVgUEHyZpIklqveSec/luVC/AxhQ=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=QKs/rB31RreZtBU21tuy5vImut9RZ/88u/OsWhz1NO9DBxPqQsc2i3L/K81ygbrVW
 Py0fDRwCI6/VHui5vRW61oQqiB4I620Sn6cZZ8K508dMnq0khAhVw1EpAhgBBWZNYc
 q9jZM73cwECdChuqejJGrTvv2iscbusCvOrZQHvmh5dShpUJLyPQxQYE+jmMackuHf
 L66S9nnD+rhaq2OdZ1y5yaPWQVw0MgvxRsUlPQ3I+vPbmRuBjYzksTBf1EpAH9iBPn
 Y/9OgoPZSP0fz/uZBc3JpIZ6lsDFAaRoQvQVOKdIYFSqq+HsF03LPG0sQ68vl2JvVm
 N6k9kXG8LLFAw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: ppc: hard lockup / hang in v5.17-rc1 under QEMU
In-Reply-To: <CANiq72n_FmDx=r-o9J8gYc6LpwRL5EGmhM6Xzwv27Xc7h1TNDw@mail.gmail.com>
References: <CANiq72n_FmDx=r-o9J8gYc6LpwRL5EGmhM6Xzwv27Xc7h1TNDw@mail.gmail.com>
Date: Thu, 27 Jan 2022 21:54:39 +1100
Message-ID: <871r0tmosw.fsf@mpe.ellerman.id.au>
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

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:
> Hi PPC folks,
>
> Our ppc64le CI deterministically triggers a hard lockup / hang under
> QEMU since v5.17-rc1 (upgrading from v5.16).
>
> Bisecting points to 0faf20a1ad16 ("powerpc/64s/interrupt: Don't enable
> MSR[EE] in irq handlers unless perf is in use").

Hi Miguel,

Thanks for the report.

Nick has posted one fix for the commit you identified:

  http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220124143930.3923442-1-npiggin@gmail.com/


It looks like your kernel-ppc64le-release.config does not have the
hardlockup detector enabled, so I suspect you're hitting the bug
described in that patch.

That fix will hit linux-next in the next day or so and should be in rc2.

cheers
