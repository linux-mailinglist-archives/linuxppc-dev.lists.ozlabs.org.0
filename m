Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 052BF78E55A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 06:12:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbnnQ6B3Rz3dmq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 14:12:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbncV013wz3c3D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 14:04:58 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbncL4sDmz4x3G;
	Thu, 31 Aug 2023 14:04:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230823055317.751786-4-mpe@ellerman.id.au>
References: <20230823055317.751786-1-mpe@ellerman.id.au> <20230823055317.751786-4-mpe@ellerman.id.au>
Subject: Re: (subset) [PATCH v2 4/4] powerpc/pseries: Rework lppaca_shared_proc() to avoid DEBUG_PREEMPT
Message-Id: <169345455029.11824.10985056549717167842.b4-ty@ellerman.id.au>
Date: Thu, 31 Aug 2023 14:02:30 +1000
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
Cc: ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 23 Aug 2023 15:53:17 +1000, Michael Ellerman wrote:
> lppaca_shared_proc() takes a pointer to the lppaca which is typically
> accessed through get_lppaca().  With DEBUG_PREEMPT enabled, this leads
> to checking if preemption is enabled, for example:
> 
>   BUG: using smp_processor_id() in preemptible [00000000] code: grep/10693
>   caller is lparcfg_data+0x408/0x19a0
>   CPU: 4 PID: 10693 Comm: grep Not tainted 6.5.0-rc3 #2
>   Call Trace:
>     dump_stack_lvl+0x154/0x200 (unreliable)
>     check_preemption_disabled+0x214/0x220
>     lparcfg_data+0x408/0x19a0
>     ...
> 
> [...]

Applied to powerpc/next.

[4/4] powerpc/pseries: Rework lppaca_shared_proc() to avoid DEBUG_PREEMPT
      https://git.kernel.org/powerpc/c/eac030b22ea12cdfcbb2e941c21c03964403c63f

cheers
