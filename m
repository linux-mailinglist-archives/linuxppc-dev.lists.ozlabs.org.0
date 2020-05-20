Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 018851DB147
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 13:16:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rqvh0DnlzDqWR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 21:16:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RqXP0hcqzDqf6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 21:00:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 49RqXM20DJz9sV0; Wed, 20 May 2020 21:00:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49RqXM0Kqrz9sVK; Wed, 20 May 2020 21:00:02 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200428123152.73566-1-mpe@ellerman.id.au>
References: <20200428123152.73566-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Drop unneeded cast in task_pt_regs()
Message-Id: <158997213947.943180.12884905809307879150.b4-ty@ellerman.id.au>
Date: Wed, 20 May 2020 21:00:02 +1000 (AEST)
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

On Tue, 28 Apr 2020 22:31:52 +1000, Michael Ellerman wrote:
> There's no need to cast in task_pt_regs() as tsk->thread.regs should
> already be a struct pt_regs. If someone's using task_pt_regs() on
> something that's not a task but happens to have a thread.regs then
> we'll deal with them later.

Applied to powerpc/next.

[1/1] powerpc: Drop unneeded cast in task_pt_regs()
      https://git.kernel.org/powerpc/c/24ac99e97fa7b8f0db9b48413a76def9cf73295c

cheers
