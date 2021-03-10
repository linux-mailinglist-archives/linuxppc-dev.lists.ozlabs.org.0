Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D795D33388F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 10:17:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwRLq6HFtz3d7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 20:17:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GuiCwOSj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=GuiCwOSj; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwRLS57JSz30Ng
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 20:17:35 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DwRLL1cfpz9sS8;
 Wed, 10 Mar 2021 20:17:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1615367850;
 bh=SxpQfrsAj8eOaludMCh7g4ZvWzABuwNmJO7ZW/Saw4E=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GuiCwOSjDOw4RdkiKTL8kS1JTjBXdx3iAkMSCfMN5D87ZPQ6XmJZkjF4Rp40Q1/dW
 nsQ+qROimFS21068jarTiJ9ZFj3G5M6rx/H0GebUmLd9uDqSlmbIEVDOVIi+C+IlVu
 yNnDFFJLb9pfwSgEw6onikmO0snwjmHt9yXfJrXiImkhOh9x/Wz9Umi3UcOb6KfpvG
 B7t/SSZG9N1tFpRh3dc1WAA9/sjXmaAMiKyUv8Pv2mtZZ7+gLiycF381uVLwO+MKvx
 NzFlmcYqOt0CyHtmsOK+/aqJyG67WgYh1N0ITMn9Wd4DlbhHAAzEc1dtRRC1FzrS4c
 pXUbJKS+mVsjw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mm: Add cond_resched() while removing hpte
 mappings
In-Reply-To: <20210310075938.361656-1-vaibhav@linux.ibm.com>
References: <20210310075938.361656-1-vaibhav@linux.ibm.com>
Date: Wed, 10 Mar 2021 20:17:25 +1100
Message-ID: <87im5zmkpm.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:
> While removing large number of mappings from hash page tables for
> large memory systems as soft-lockup is reported because of the time
> spent inside htap_remove_mapping() like one below:
>
>  watchdog: BUG: soft lockup - CPU#8 stuck for 23s!
>  <snip>
>  NIP plpar_hcall+0x38/0x58
>  LR  pSeries_lpar_hpte_invalidate+0x68/0xb0
>  Call Trace:
>   0x1fffffffffff000 (unreliable)
>   pSeries_lpar_hpte_removebolted+0x9c/0x230
>   hash__remove_section_mapping+0xec/0x1c0
>   remove_section_mapping+0x28/0x3c
>   arch_remove_memory+0xfc/0x150
>   devm_memremap_pages_release+0x180/0x2f0
>   devm_action_release+0x30/0x50
>   release_nodes+0x28c/0x300
>   device_release_driver_internal+0x16c/0x280
>   unbind_store+0x124/0x170
>   drv_attr_store+0x44/0x60
>   sysfs_kf_write+0x64/0x90
>   kernfs_fop_write+0x1b0/0x290
>   __vfs_write+0x3c/0x70
>   vfs_write+0xd4/0x270
>   ksys_write+0xdc/0x130
>   system_call+0x5c/0x70
>
> Fix this by adding a cond_resched() to the loop in
> htap_remove_mapping() that issues hcall to remove hpte mapping. This
> should prevent the soft-lockup from being reported.

Can/should we also/instead be using H_BLOCK_REMOVE?

cheers
