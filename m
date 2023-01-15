Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C96C566B069
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 11:45:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NvsHQ5YyPz3fCY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 21:45:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NvsGv5TMwz3bZV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jan 2023 21:44:39 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NvsGv1rFQz4wgv;
	Sun, 15 Jan 2023 21:44:39 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Kajol Jain <kjain@linux.ibm.com>
In-Reply-To: <20230106065157.182648-1-kjain@linux.ibm.com>
References: <20230106065157.182648-1-kjain@linux.ibm.com>
Subject: Re: [PATCH] powerpc/imc-pmu: Fix IMC PMU code of using mutex in IRQs disabled section
Message-Id: <167377944324.2279958.1537269901212932162.b4-ty@ellerman.id.au>
Date: Sun, 15 Jan 2023 21:44:03 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: atrajeev@linux.vnet.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 6 Jan 2023 12:21:57 +0530, Kajol Jain wrote:
> Current imc-pmu code triggers a WARNING with CONFIG_DEBUG_ATOMIC_SLEEP and
> CONFIG_PROVE_LOCKING enabled, while running a thread_imc event.
> 
> Command to trigger the warning:
> [command]# perf stat -e thread_imc/CPM_CS_FROM_L4_MEM_X_DPTEG/ sleep 5
> 
>  Performance counter stats for 'sleep 5':
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/imc-pmu: Fix IMC PMU code of using mutex in IRQs disabled section
      https://git.kernel.org/powerpc/c/76d588dddc459fefa1da96e0a081a397c5c8e216

cheers
