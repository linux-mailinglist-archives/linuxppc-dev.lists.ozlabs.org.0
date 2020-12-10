Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D052D5C2E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 14:46:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsFYz4jY9zDr1S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 00:46:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBY023DWzDqlD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXz0BSbz9sXh; Thu, 10 Dec 2020 22:30:09 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201207010519.15597-1-jniethe5@gmail.com>
References: <20201207010519.15597-1-jniethe5@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/book3s64/kexec: Clear CIABR on kexec
Message-Id: <160756607502.1313423.5654230421520010449.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:09 +1100 (AEDT)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 7 Dec 2020 12:05:18 +1100, Jordan Niethe wrote:
> The value in CIABR persists across kexec which can lead to unintended
> results when the new kernel hits the old kernel's breakpoint. For
> example:
> 
> 0:mon> bi $loadavg_proc_show
> 0:mon> b
>    type            address
> 1 inst   c000000000519060  loadavg_proc_show+0x0/0x130
> 0:mon> x
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/book3s64/kexec: Clear CIABR on kexec
      https://git.kernel.org/powerpc/c/4bb3219837a3dcf58bce96c27db6e0cd48f3d9b2
[2/2] powerpc/powernv/idle: Restore CIABR after idle for Power9
      https://git.kernel.org/powerpc/c/250ad7a45b1e58d580decfb935fc063c4cf56f91

cheers
