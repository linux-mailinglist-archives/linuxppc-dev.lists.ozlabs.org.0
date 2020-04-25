Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA2B1B83D7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 07:41:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498Kfp2M2NzDr7g
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 15:41:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=libc.org
Received: from brightrain.aerifal.cx (216-12-86-13.cv.mvl.ntelos.net
 [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498Kd52cXkzDqPW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 15:40:23 +1000 (AEST)
Date: Sat, 25 Apr 2020 01:40:19 -0400
From: Rich Felker <dalias@libc.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] New powerpc vdso calling convention
Message-ID: <20200425054019.GI11469@brightrain.aerifal.cx>
References: <1587790194.w180xsw5be.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587790194.w180xsw5be.astroid@bobo.none>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: libc-alpha@sourceware.org, musl@lists.openwall.com, binutils@sourceware.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 25, 2020 at 03:22:27PM +1000, Nicholas Piggin wrote:
> As noted in the 'scv' thread, powerpc's vdso calling convention does not 
> match the C ELF ABI calling convention (or the proposed scv convention).
> I think we could implement a new ABI by basically duplicating function
> entry points with different names.
> 
> The ELF v2 ABI convention would suit it well, because the caller already
> requires the function address for ctr, so having it in r12 will 
> eliminate the need for address calculation, which suits the vdso data 
> page access.
> 
> Is there a need for ELF v1 specific calls as well, or could those just be 
> deprecated and remain on existing functions or required to use the ELF 
> v2 calls using asm wrappers?

musl doesn't use ELFv1, but my expectation would be for the kernel to
provide an ELFv1 VDSO to an ELFv1 process. (I'm pretty sure the kernel
has to be aware of this property of the process-image (executable
file) since it affects how signals work.)

> Is there a good reason for the system call fallback to go in the vdso 
> function rather than have the caller handle it?

Originally it was deemed the vdso's responsibility to do fallback, but
MIPS broke this contract so musl always makes a syscall itself if the
vdso function returns -ENOSYS. I believe it honors other errors. We
could change it to fallback on all errors if needed. I'm not sure what
glibc does here.

Rich
