Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B9C7E953B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 03:49:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STDRd4552z3clb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 13:49:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STDR84Rxhz2ytV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 13:49:24 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4STDR40Lsbz4xW4;
	Mon, 13 Nov 2023 13:49:20 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
References: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
Subject: Re: (subset) [PATCH 0/7] powerpc/rtas: Trivial, coding style, and kernel-doc fixes
Message-Id: <169984352204.1887074.2730540650986613097.b4-ty@ellerman.id.au>
Date: Mon, 13 Nov 2023 13:45:22 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 06 Nov 2023 07:42:52 -0600, Nathan Lynch wrote:
> * Fix recently introduced kernel-doc warnings.
> * Make minor coding style adjustments for readability.
> * Remove rtas_service_present() and an old call_rtas() declaration.
> * Move a pseries-specific function prototype to pseries code.
> 

Patches 1-2 applied to powerpc/fixes.

[1/7] powerpc/pseries/rtas-work-area: Fix rtas_work_area_reserve_arena() kernel-doc
      https://git.kernel.org/powerpc/c/65083333d3d16b282674aeef5cce5c72226c05e0
[2/7] powerpc/rtas: Fix ppc_rtas_rmo_buf_show() kernel-doc
      https://git.kernel.org/powerpc/c/644b6025bcaff59737270d812c70302f5a8d4a8f

cheers
