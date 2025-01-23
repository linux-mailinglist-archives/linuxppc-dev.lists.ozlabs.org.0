Return-Path: <linuxppc-dev+bounces-5535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C39CFA1ACB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 23:35:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfG491F9Rz302c;
	Fri, 24 Jan 2025 09:35:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737671737;
	cv=none; b=fzSP4IOYmqvm9nY88O9fIKRGcVZ/m5l3Tf/8d54WXnNVAS2LBzDDDIj3d6pgL8psd1gq9INngdBtfe0GsIlCf8dtKQhA3Y+2PoOwX0Z8zAa+Gdn3fc2oHbAhRgKH5/7jS55IydVa77f+opkp1QvBZF3+ylCQ6NocAyuaPr1gSdn47LYf1tL4RGM/MTG9+veYnFNp+IwgmCuGRh6apx97YWV2jzMqJOZD5EQayj8aHEih2ImF38D/OxtfdFajflDDDehE7w54+fi2MmfnLhT6ORdKps+tB99XteM4Sh00vOweA8WYiUn6beAJf9VYjMASLxT4Dq8yKKjvOUw+brTdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737671737; c=relaxed/relaxed;
	bh=4NON22ZYzhqXr0rIISMj6+tpbUex/Z2CUN618aY+bzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnbmkqy3oErrtOdIR8mckgggQWdiOR6+t7f+IT0WqeUm1nsIy60yg4X49cppF54eYYm+P2kgsP43LndGcWcakFXvwnBfKKeVtpQijqFF3GrlEiZlXESVPdLWmwqgVhRwfJCvF9Rr0lLLGhMmCNQKYD95rxt0hueQUT3OxNcdtt19xHgG2ELQRWsHUidZO/Uv21YgvxOhOQDTPVdllD53nxGyjj+krxqX+ltoh3UZGoJSug7FTGnfDza7YKJg13a0OgioclDKaa0CdgY8s+o+7R00K2PURYuAqMJzPcuUlLYc6w9qd8t8WXIA+hHfrhAVvgHRj6kSCY4Bk+/4UDVHgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfG482TpWz2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 09:35:36 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id D2EFC72C8CC;
	Fri, 24 Jan 2025 01:35:34 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id C30957CCB3A; Fri, 24 Jan 2025 00:35:34 +0200 (IST)
Date: Fri, 24 Jan 2025 00:35:34 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in
 syscall_set_return_value()
Message-ID: <20250123223534.GB22814@strace.io>
References: <20250113171054.GA589@strace.io>
 <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io>
 <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250123182815.GA20994@strace.io>
 <86079b5c-e124-489b-8136-05ae5700cb61@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86079b5c-e124-489b-8136-05ae5700cb61@csgroup.eu>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 23, 2025 at 11:07:21PM +0100, Christophe Leroy wrote:
[...]
> To add a bit more to the confusion, a task can be flagged with 
> TIF_NOERROR by calling force_successful_syscall_return(), in which case 
> even if gpr[3] contains a negative between -MAX_ERRNO and -1 the syscall 
> will be handled as successfull hence CCR[SO] won't be set. But it seems 
> this is not handled by syscall_set_return_value(). So what will happen 
> with time() when approaching year 2036 for instance ?

syscall_set_return_value() takes both "int error" and "long val"
arguments.  It doesn't and shouldn't take TIF_NOERROR into account.
With my patch applied, when it's called by PTRACE_SET_SYSCALL_INFO
from do_syscall_trace_leave(), it will properly update gpr[3] and ccr
regardless of TIF_NOERROR.  If tracer wants to set an error status for
a syscall that cannot return an error, it's up to the tracer to face the
consequences.  Tracers can do it now via PTRACE_SETREGS* anyway.


-- 
ldv

