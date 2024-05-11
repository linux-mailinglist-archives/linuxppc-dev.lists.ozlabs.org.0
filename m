Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A5B8C3076
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2024 11:52:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=k56XE3N3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vc1J22F82z3cXk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2024 19:52:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=k56XE3N3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vc1HF4Cydz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2024 19:51:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1715421078;
	bh=0cJX+ofKilB0YeAddG2Rk34Tcb84daQhOHXhdzx0r3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k56XE3N3d4pgs8RXOwLSnRLB27sLWUfITEgcvrDMjZdmJPa/Ir6S6oi9PpE553jPt
	 sb7k+FxSLFp8Odclpb2t4vqVdgVnPhAwWUDBH9QwI80jAM7LA7gxjkMhJ80aDoR2yw
	 DUA3ugAMpnt1Nr9pHpMHzjCRdAMZeTMxIBsCjZb8=
Date: Sat, 11 May 2024 11:51:18 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v3 00/11] sysctl: treewide: constify ctl_table argument
 of sysctl handlers
Message-ID: <8d1daa64-3746-46a3-b696-127a70cdf7e7@t-8ch.de>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
 <20240424201234.3cc2b509@kernel.org>
 <202405080959.104A73A914@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202405080959.104A73A914@keescook>
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
Cc: Joel Granados <j.granados@samsung.com>, Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, linux-sctp@vger.kernel.org, lvs-devel@vger.kernel.org, coreteam@netfilter.org, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kees,

On 2024-05-08 10:11:35+0000, Kees Cook wrote:
> On Wed, Apr 24, 2024 at 08:12:34PM -0700, Jakub Kicinski wrote:
> > On Tue, 23 Apr 2024 09:54:35 +0200 Thomas Weißschuh wrote:
> > > The series was split from my larger series sysctl-const series [0].
> > > It only focusses on the proc_handlers but is an important step to be
> > > able to move all static definitions of ctl_table into .rodata.
> > 
> > Split this per subsystem, please.
> 
> I've done a few painful API transitions before, and I don't think the
> complexity of these changes needs a per-subsystem constification pass. I
> think this series is the right approach, but that patch 11 will need
> coordination with Linus. We regularly do system-wide prototype changes
> like this right at the end of the merge window before -rc1 comes out.

That sounds good.

> The requirements are pretty simple: it needs to be a obvious changes
> (this certainly is) and as close to 100% mechanical as possible. I think
> patch 11 easily qualifies. Linus should be able to run the same Coccinelle
> script and get nearly the same results, etc. And all the other changes
> need to have landed. This change also has no "silent failure" conditions:
> anything mismatched will immediately stand out.

Unfortunately coccinelle alone is not sufficient, as some helpers with
different prototypes are called by handlers and themselves are calling
handler and therefore need to change in the same commit.
But if I add a diff for those on top of the coccinelle script to the
changelog it should be obvious.

> So, have patches 1-10 go via their respective subsystems, and once all
> of those are in Linus's tree, send patch 11 as a stand-alone PR.

Ack, I'll do that with the cover letter information requested by Joel.

> (From patch 11, it looks like the seccomp read/write function changes
> could be split out? I'll do that now...)

Thanks!

Thomas
