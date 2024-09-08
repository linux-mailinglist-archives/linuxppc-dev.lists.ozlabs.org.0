Return-Path: <linuxppc-dev+bounces-1153-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 178E79707B2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2024 15:11:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X1r1y51f9z2xdX;
	Sun,  8 Sep 2024 23:11:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725801062;
	cv=none; b=mUBorAzOzSBiYLt0quT7gpz31tVW3wliW94v5xPTxFn6HlOyz7gQAdRJ+6oVmghhXUhFzr3qWa1mQ1WJUoO+F/v1MX5bURMyOGbnPAwXeZt+UFdjw7KoGCQuEADufYRBMnSTIMpRzjkWmjKgZ4wGfJ9+0AWaSsurliYM+slqsEVDsAQb0ArD208IZDjlubWKpEEfSAJk7SyGyRbhAxGyrnow/eYZdx0B2WLl00qmr4iYnNwm/jYOjmGZG75gPbrJhlO3aW23E+JP0Qe/4cvass7d8sMnYKKROeP6h6TywqKGmYnxu84fgCHptr/K0yOGYMQalv9HXSVkDhWrgQhhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725801062; c=relaxed/relaxed;
	bh=5ousToG74H2ohJ+2uPbxULWRCWMdovVQZm/v8GRh4+U=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:In-Reply-To:
	 References:Mime-Version:Content-Type; b=WPxtTwtIK9DkYZZ2jHTQxJwfTqx1avntlUm6VucDgFV+X99Z0weYNZm49jUxcVeniYZBGsQ5afyysgSew+M38ELbnu5eqYdeeAL540zE6ozTdIroW1kPpY+vw9jHAXrHIVm4xVgAEYBsG2H5v8sTNa5HHg1E9IteTuWAMtClxdDZBSpaKh1Ba61E7965Y8nWbNW8SRHfOS50Odt1pedMU0U4KWJOH2OcEbwniNT4g5EMyv84zw8NIH6eGOaEKJI11xagGIY4OfCdIghy7At0tuhE34BtUOLikE3V3X6XLTpnlmP5qkBe/D9FpR+XALxdMPvSszGIq+C38SgV7RWBmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OrWxzYhI; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OrWxzYhI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X1r1y2d5cz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Sep 2024 23:11:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AEF985C431F;
	Sun,  8 Sep 2024 13:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4759DC4CEC3;
	Sun,  8 Sep 2024 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725801058;
	bh=ClQHgLl08GO0wEsncxoNvrRCt8I4NxKUSd02bjrpk80=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OrWxzYhIemP+snTm+2pkJRFzdFnZqJ3ITEB57Y7JJTCwFhwQQe63FOz8I/OjdFid5
	 YDv00bTcJjN4xYetsAaGpt6bYfKhlZqUWjkMgYqZVrFBfNcGzDuE5qX28qH/wCX55n
	 mSo0aC1dKoMyEWa6kYMKVlM+3++pzGuUu/oCQXKMGiQYutCsGERd/twjxXRHBrXKUE
	 FUIIb0zfGn7oHTW0UTrkRAM4pFirKWwweUAyuFsr+Lz3lJo9FmBWRI19//3rJs0/Zg
	 VqCmkJ02uxuJnlz5wueKHt7x13hVZWDpBkpDe1rC6BUm2lt6Xk4s0aAVOBjV9AGwmx
	 bHHY9fF6MLYsg==
Date: Sun, 8 Sep 2024 22:10:53 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Michael Ellerman <patch-notifications@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, Abhishek Dubey <adubey@linux.ibm.com>,
 naveen@kernel.org, hbathini@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, mhiramat@kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v4 RESEND] powerpc: Replace kretprobe code with rethook
 on powerpc
Message-Id: <20240908221053.ad2ed73bf42db9273aac419c@kernel.org>
In-Reply-To: <172562357215.467568.2172858907419105155.b4-ty@ellerman.id.au>
References: <20240830113131.7597-1-adubey@linux.ibm.com>
	<172562357215.467568.2172858907419105155.b4-ty@ellerman.id.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 06 Sep 2024 21:52:52 +1000
Michael Ellerman <patch-notifications@ellerman.id.au> wrote:

> On Fri, 30 Aug 2024 07:31:31 -0400, Abhishek Dubey wrote:
> > This is an adaptation of commit f3a112c0c40d ("x86,rethook,kprobes:
> > Replace kretprobe with rethook on x86") to powerpc.
> > 
> > Rethook follows the existing kretprobe implementation, but separates
> > it from kprobes so that it can be used by fprobe (ftrace-based
> > function entry/exit probes). As such, this patch also enables fprobe
> > to work on powerpc. The only other change compared to the existing
> > kretprobe implementation is doing the return address fixup in
> > arch_rethook_fixup_return().
> > 
> > [...]
> 
> Applied to powerpc/next.
> 
> [1/1] powerpc: Replace kretprobe code with rethook on powerpc
>       https://git.kernel.org/powerpc/c/19f1bc3fb55452739dd3d56cfd06c29ecdbe3e9f

Thanks, and sorry for late reply, but I don't have any objection.

> 
> cheers


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

