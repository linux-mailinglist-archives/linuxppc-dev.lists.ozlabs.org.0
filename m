Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E25932345
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 11:46:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gNdby14H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNZ2z62fVz3cYZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 19:46:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gNdby14H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNZ2J5CkRz3cTw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 19:46:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 62470CE12A2;
	Tue, 16 Jul 2024 09:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA146C116B1;
	Tue, 16 Jul 2024 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721123156;
	bh=SqXgNm6FhzAJA14mBWUxDsVvY4d+YHMpCRQGynbdfDE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gNdby14HQ2ApZ0VAhsv66j6UvRn5Salr683iDSupG4UaBeZz3im4hmb7e8qgpkmF8
	 ZqLreb1UdfoR7cJHu4k1Umj3o18fFw+vlSVBn6dpVUaLH4GhcwjILYRKe68LDxB5fe
	 qkRE1k5avvu8yT+D/M3yf1ZClg6IQl6Xpzzw6VG74nZ1x7ADbWIJjbTXnee65e7c0c
	 ItzKSFgmm3+5+V9pV61+RHXrjqatLO/ofe96tkY+QqksRD2V0KB36GNhKkkSspT3Zx
	 c15TfackFDw9V/0UOa0m9nfvayW+mh54Gsr+qeQQoG3WVlpklIYGwP/RMN4jtIeEkt
	 YWiPHW4xxHGxg==
Date: Tue, 16 Jul 2024 18:45:51 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Update powerpc BPF JIT maintainers
Message-Id: <20240716184551.a16cfd72b3f31148b0e9170a@kernel.org>
In-Reply-To: <92e61201-2ee4-458d-988d-a476018a05dc@linux.ibm.com>
References: <fb6ef126771c70538067709af69d960da3560ce7.1720944897.git.naveen@kernel.org>
	<24fea21d9d4458973aadd6a02bb1bf558b8bd0b2.1720944897.git.naveen@kernel.org>
	<92e61201-2ee4-458d-988d-a476018a05dc@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Tue, 16 Jul 2024 12:36:11 +0530
Hari Bathini <hbathini@linux.ibm.com> wrote:

> 
> 
> On 14/07/24 2:04 pm, Naveen N Rao wrote:
> > Hari Bathini has been updating and maintaining the powerpc BPF JIT since
> > a while now. Christophe Leroy has been doing the same for 32-bit
> > powerpc. Add them as maintainers for the powerpc BPF JIT.
> > 
> > I am no longer actively looking into the powerpc BPF JIT. Change my role
> > to that of a reviewer so that I can help with the odd query.
> > 
> > Signed-off-by: Naveen N Rao <naveen@kernel.org>
> 
> Acked-by: Hari Bathini <hbathini@linux.ibm.com>

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

But this should go through powerpc tree or bpf tree.

Thank you,

> 
> > ---
> >   MAINTAINERS | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 05f14b67cd74..c7a931ee7a2e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3878,8 +3878,10 @@ S:	Odd Fixes
> >   F:	drivers/net/ethernet/netronome/nfp/bpf/
> >   
> >   BPF JIT for POWERPC (32-BIT AND 64-BIT)
> > -M:	Naveen N Rao <naveen@kernel.org>
> >   M:	Michael Ellerman <mpe@ellerman.id.au>
> > +M:	Hari Bathini <hbathini@linux.ibm.com>
> > +M:	Christophe Leroy <christophe.leroy@csgroup.eu>
> > +R:	Naveen N Rao <naveen@kernel.org>
> >   L:	bpf@vger.kernel.org
> >   S:	Supported
> >   F:	arch/powerpc/net/


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
