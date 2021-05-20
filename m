Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 670BF389B9C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 05:06:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlvlV32Yqz2ywx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 13:06:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=altlinux.org (client-ip=194.107.17.57;
 helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org;
 receiver=<UNKNOWN>)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Flvl90sPcz2xZP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 13:06:13 +1000 (AEST)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id A429572C8BA;
 Thu, 20 May 2021 06:06:11 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 9778A7CC8A6; Thu, 20 May 2021 06:06:11 +0300 (MSK)
Date: Thu, 20 May 2021 06:06:11 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
Message-ID: <20210520030611.GB27081@altlinux.org>
References: <20210519132656.GA17204@altlinux.org>
 <1621464056.o9t21cquw8.astroid@bobo.none>
 <20210519232726.GA24134@altlinux.org>
 <1621478238.xha1ow4ujh.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621478238.xha1ow4ujh.astroid@bobo.none>
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
Cc: libc-alpha@sourceware.org, Matheus Castanho <msc@linux.ibm.com>,
 musl@lists.openwall.com, linux-api@vger.kernel.org, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 12:40:36PM +1000, Nicholas Piggin wrote:
[...]
> > Looks like struct pt_regs.trap already contains the information that could
> > be used to tell 'sc' from 'scv': if (pt_regs.trap & ~0xf) == 0x3000, then
> > it's scv.  Is my reading of arch/powerpc/include/asm/ptrace.h correct?
> 
> Hmm, I think it is. Certainly in the kernel regs struct it is, I had in 
> my mind that we put it to 0xc00 when populating the user struct for
> compatibility, but it seems not. So I guess this would work.

OK, can we state that (pt_regs.trap & ~0xf) == 0x3000 is a part of the scv
ABI, so it's not going to change and could be relied upon by userspace?
Could this be documented in Documentation/powerpc/syscall64-abi.rst,
please?


-- 
ldv
