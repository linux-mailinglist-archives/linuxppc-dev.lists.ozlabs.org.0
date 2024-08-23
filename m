Return-Path: <linuxppc-dev+bounces-470-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4434B95D560
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 20:41:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr867088lz301N;
	Sat, 24 Aug 2024 04:41:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724438462;
	cv=none; b=Bw6MmFHWavm3MABKeBzec8vDVpO1HPeXtZ6yF3xKp9PMlFpmZmP3s2p29yXqApKTna/8AY7IKvPoMj0ucEXjpI7j3FdJI2Ax/+cuBJMi2kklPbLGME9FvTYd71sxCENwhQw3Rn2qDM4zZ7rnGiPGWILaNsYlbr9PIfKh5ZMcamDhdvipU3WWoRXomZH+XDOExDhGGCmtlxJDL7TZTjF9syHhLsNyFH3LM8KWnmOvsFMNvWGKPEYIM38lPxtXRH6XN2kXIc+MRqSUmtSrvU46pHQ1k6AblUpdxbTLiTQDGCchlHNR+RMIZS9Texd5hAsHlO7M+Nc+iuNbwGtVPlC1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724438462; c=relaxed/relaxed;
	bh=C3enDMuInf9LLnRgN1buD4CnoI1cx3jwYJ4LWhfhZX0=;
	h=Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=Z1HChJLWdJjUdo839r4vPaf71Q8RHJ6W/2q/VqJQL9nfHK0CtHqsPfxk/NG1YQ4LtnSbYO0n5NXEK6nlYpSwQphEbI07+BfC35t9CRL28Xvvn8g0oyfvETiPbqqQmIUDX9olQ/vDx8aQ7kzIbwlkq3WroFu/lVGbeSljj1qBG8y8sSHGfEVWro/Go44ov6WGd4+5A9vEObx9qVfhXQcbSDMswwS/o2YbSF+g116pDIrIGCpjrsYF3wbl+g7Fy6r5H7Y5mgsBdjr4EdMnHjENnftGwC70dKfMFbLHJMMweK9BzAsQTmPNYqedA/74zjoTj53Llm4OOfgc5ueq/7sQ3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr86618syz300B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 04:41:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01FE161343;
	Fri, 23 Aug 2024 18:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84C5C32786;
	Fri, 23 Aug 2024 18:40:54 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:40:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org,
	nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 06/30] arm64: context switch POR_EL0 register
Message-ID: <ZsjXtE7Kg0LQwNAL@arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-7-joey.gouly@arm.com>
 <20240823144531.GH32156@willie-the-truck>
 <Zsi7ovLOfuFdfuuz@arm.com>
 <20240823170835.GA1181@willie-the-truck>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823170835.GA1181@willie-the-truck>

On Fri, Aug 23, 2024 at 06:08:36PM +0100, Will Deacon wrote:
> On Fri, Aug 23, 2024 at 05:41:06PM +0100, Catalin Marinas wrote:
> > On Fri, Aug 23, 2024 at 03:45:32PM +0100, Will Deacon wrote:
> > > On Thu, Aug 22, 2024 at 04:10:49PM +0100, Joey Gouly wrote:
> > > > +static void permission_overlay_switch(struct task_struct *next)
> > > > +{
> > > > +	if (!system_supports_poe())
> > > > +		return;
> > > > +
> > > > +	current->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
> > > > +	if (current->thread.por_el0 != next->thread.por_el0) {
> > > > +		write_sysreg_s(next->thread.por_el0, SYS_POR_EL0);
> > > > +		/* ISB required for kernel uaccess routines when chaning POR_EL0 */
> > > 
> > > nit: typo "chaning".
> > > 
> > > But more substantially, is this just to prevent spurious faults in the
> > > context of a new thread using a stale value for POR_EL0?
> > 
> > Not just prevent faults but enforce the permissions from the new
> > thread's POR_EL0. The kernel may continue with a uaccess routine from
> > here, we can't tell.
> 
> Hmm, I wondered if that was the case. It's a bit weird though, because:
> 
>   - There's a window between switch_mm() and switch_to() where you might
>     reasonably expect to be able to execute uaccess routines

I don't think we can have any uaccess between these two switches (a
uaccess could fault, that's a pretty weird state between these two).

>   - kthread_use_mm() doesn't/can't look at this at all

No, but a kthread would have it's own, most permissive, POR_EL0.

>   - GUP obviously doesn't care
> 
> So what do we actually gain by having the uaccess routines honour this?

I guess where it matters is more like not accidentally faulting because
the previous thread had more restrictive permissions.

-- 
Catalin

