Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A902538830F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 01:20:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlBnB4sJsz30DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 09:20:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=altlinux.org (client-ip=194.107.17.57;
 helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 392 seconds by postgrey-1.36 at boromir;
 Wed, 19 May 2021 09:20:09 AEST
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FlBmn2hZlz2xvT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 09:20:09 +1000 (AEST)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 1223A72C8BA;
 Wed, 19 May 2021 02:13:32 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id E4BDE7CC8A6; Wed, 19 May 2021 02:13:31 +0300 (MSK)
Date: Wed, 19 May 2021 02:13:31 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Linux powerpc new system call instruction and ABI
Message-ID: <20210518231331.GA8464@altlinux.org>
References: <20200611081203.995112-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611081203.995112-1-npiggin@gmail.com>
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
Cc: musl@lists.openwall.com, linux-api@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, libc-dev@lists.llvm.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, Jun 11, 2020 at 06:12:01PM +1000, Nicholas Piggin wrote:
[...]
> - Error handling: The consensus among kernel, glibc, and musl is to move to
>   using negative return values in r3 rather than CR0[SO]=1 to indicate error,
>   which matches most other architectures, and is closer to a function call.

Apparently, the patchset merged by commit v5.9-rc1~100^2~164 was
incomplete: all functions defined in arch/powerpc/include/asm/ptrace.h and
arch/powerpc/include/asm/syscall.h that use ccr are broken when scv is used.
This includes syscall_get_error() and all its users including
PTRACE_GET_SYSCALL_INFO API, which in turn makes strace unusable
when scv is used.

See also https://bugzilla.redhat.com/1929836


-- 
ldv
