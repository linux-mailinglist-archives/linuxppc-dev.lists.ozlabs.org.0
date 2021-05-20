Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B42438ACB8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 13:45:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm7GX0yDDz3070
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 21:45:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=altlinux.org (client-ip=194.107.17.57;
 helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org;
 receiver=<UNKNOWN>)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Fm7GC62Vxz2ykH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 21:45:23 +1000 (AEST)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 22E2372C8B8;
 Thu, 20 May 2021 14:45:22 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 134867CC8A6; Thu, 20 May 2021 14:45:22 +0300 (MSK)
Date: Thu, 20 May 2021 14:45:22 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/64s/syscall: Fix ptrace syscall info with
 scv syscalls
Message-ID: <20210520114521.GC1198@altlinux.org>
References: <20210520111931.2597127-1-npiggin@gmail.com>
 <20210520111931.2597127-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520111931.2597127-2-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 09:19:31PM +1000, Nicholas Piggin wrote:
> The scv implementation missed updating syscall return value and error
> value get/set functions to deal with the changed register ABI. This
> broke ptrace PTRACE_GET_SYSCALL_INFO as well as some kernel auditing
> and tracing functions.
> 
> Fix. tools/testing/selftests/ptrace/get_syscall_info now passes when
> scv is used.
> 
> Fixes: 7fa95f9adaee ("powerpc/64s: system call support for scv/rfscv instructions")
> Reported-by: "Dmitry V. Levin" <ldv@altlinux.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Thanks, feel free to add
Reviewed-by: Dmitry V. Levin <ldv@altlinux.org>

Also consider adding
Cc: stable@vger.kernel.org # 5.9+


-- 
ldv
