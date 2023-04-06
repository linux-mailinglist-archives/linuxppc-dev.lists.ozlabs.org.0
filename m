Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C16D8BE0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 02:28:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsMmv5b1Qz3fZp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 10:28:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsMlw13f2z3ff6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 10:27:56 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PsMlv3PxVz4x91;
	Thu,  6 Apr 2023 10:27:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Jens Axboe <axboe@kernel.dk>
In-Reply-To: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
References: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
Subject: Re: [PATCH] powerpc: don't try to copy ppc for task with NULL pt_regs
Message-Id: <168074081763.3666874.7697892587390998192.b4-ty@ellerman.id.au>
Date: Thu, 06 Apr 2023 10:26:57 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 26 Mar 2023 16:15:57 -0600, Jens Axboe wrote:
> Powerpc sets up PF_KTHREAD and PF_IO_WORKER with a NULL pt_regs, which
> from my (arguably very short) checking is not commonly done for other
> archs. This is fine, except when PF_IO_WORKER's have been created and
> the task does something that causes a coredump to be generated. Then we
> get this crash:
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: don't try to copy ppc for task with NULL pt_regs
      https://git.kernel.org/powerpc/c/fd7276189450110ed835eb0a334e62d2f1c4e3be

cheers
