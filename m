Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4BC93440B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 23:44:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qskNN5cY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPTwc0Wltz3cSd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 07:44:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qskNN5cY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPTvw3C0Pz3cSL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 07:43:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5DB7F61759;
	Wed, 17 Jul 2024 21:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2EF9C2BD10;
	Wed, 17 Jul 2024 21:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721252616;
	bh=OhMZ6JPmmRAQB96lc3+j/NAdZCbcu4mgi9Yk+fU7hYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qskNN5cY8/32q5xajK5X8srmhh3M7uxeR+f4O3QVFaSl0Y/cMDT8nRmEjQ5XYjF/M
	 y2CS5Iipf6I67QhYQSsSeKIEniw7ezKHgu5s8oxRko/auO5sDtTzxC9UyNW25OFt1g
	 dMySQg64gb/DJHfRYVs2OrR3W7DIneq6Ni26b9p2UlLfSOLPAOyzOt9f/13iOBCVUW
	 I/wl1VPUD9OoJ3N2Xa4EslsNb17LL+E9lAPKyFdAuoB07TaKMNtKhSyBKl2XtiKoSB
	 g+ShumMYnHCRxN/k0PsSygRhShOCx+h117HqtJfwANB6ZbLu7f7ffuWLLldjNrmu4w
	 Gvt4z+yVyZeYQ==
Date: Thu, 18 Jul 2024 06:43:31 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update email address of Naveen
Message-Id: <20240718064331.834e1359f9c3f285f2dd7eb5@kernel.org>
In-Reply-To: <87sew8wtxw.fsf@mail.lhotse>
References: <fb6ef126771c70538067709af69d960da3560ce7.1720944897.git.naveen@kernel.org>
	<20240716190222.f3278a2ef0c6a35bd51cfd63@kernel.org>
	<87sew8wtxw.fsf@mail.lhotse>
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
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 Jul 2024 13:58:35 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> Masami Hiramatsu (Google) <mhiramat@kernel.org> writes:
> > Hi Naveen,
> >
> > On Sun, 14 Jul 2024 14:04:23 +0530
> > Naveen N Rao <naveen@kernel.org> wrote:
> >
> >> I have switched to using my @kernel.org id for my contributions. Update
> >> MAINTAINERS and mailmap to reflect the same.
> >> 
> >
> > Looks good to me. 
> >
> > Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> >
> > Would powerpc maintainer pick this?
> 
> Yeah I can take both.

Thank you for pick them up!

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
