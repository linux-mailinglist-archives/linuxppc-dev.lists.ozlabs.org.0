Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A755122E6E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:49:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFX5871qVzDqRL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 17:49:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFWb15pBFzDqpr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:26:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BFWb14KLgz9sTj; Mon, 27 Jul 2020 17:26:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
In-Reply-To: <20200725081231.39076-1-oohall@gmail.com>
References: <20200725081231.39076-1-oohall@gmail.com>
Subject: Re: [PATCH v3 01/14] powerpc/eeh: Remove eeh_dev_phb_init_dynamic()
Message-Id: <159583478673.602200.11886445248182540490.b4-ty@ellerman.id.au>
Date: Mon, 27 Jul 2020 17:26:52 +1000 (AEST)
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

On Sat, 25 Jul 2020 18:12:18 +1000, Oliver O'Halloran wrote:
> This function is a one line wrapper around eeh_phb_pe_create() and despite
> the name it doesn't create any eeh_dev structures. Replace it with direct
> calls to eeh_phb_pe_create() since that does what it says on the tin
> and removes a layer of indirection.

Applied to powerpc/next.

[01/14] powerpc/eeh: Remove eeh_dev_phb_init_dynamic()
        https://git.kernel.org/powerpc/c/475028efc708880e16e61cc4cbbc00af784cb39b
[02/14] powerpc/eeh: Remove eeh_dev.c
        https://git.kernel.org/powerpc/c/d74ee8e9d12e2071014ecec96a1ce2744f77639d
[03/14] powerpc/eeh: Move vf_index out of pci_dn and into eeh_dev
        https://git.kernel.org/powerpc/c/dffa91539e80355402c0716a91af17fc8ddd1abf
[04/14] powerpc/pseries: Stop using pdn->pe_number
        https://git.kernel.org/powerpc/c/c408ce9075b8e1533f30fd3a113b75fb745f722f
[05/14] powerpc/eeh: Kill off eeh_ops->get_pe_addr()
        https://git.kernel.org/powerpc/c/a40db934312cb2a4bef16b3edc962bc8c7f6462f
[06/14] powerpc/eeh: Remove VF config space restoration
        https://git.kernel.org/powerpc/c/21b43bd59c7838825b94eea288333affb53dd399
[07/14] powerpc/eeh: Pass eeh_dev to eeh_ops->restore_config()
        https://git.kernel.org/powerpc/c/0c2c76523c04ac184c7d7bbb8756f603375b7fc4
[08/14] powerpc/eeh: Pass eeh_dev to eeh_ops->resume_notify()
        https://git.kernel.org/powerpc/c/8225d543dc0170e5b61af8559af07ec4f26f0bd6
[09/14] powerpc/eeh: Pass eeh_dev to eeh_ops->{read|write}_config()
        https://git.kernel.org/powerpc/c/17d2a4870467bc8e8966304c08980571da943558
[10/14] powerpc/eeh: Remove spurious use of pci_dn in eeh_dump_dev_log
        https://git.kernel.org/powerpc/c/1a303d8844d082ef58ff5fc3005b99621a3263ba
[11/14] powerpc/eeh: Remove class code field from edev
        https://git.kernel.org/powerpc/c/768a42845b9ecdb28ba1991e17088b7eeb23a3eb
[12/14] powerpc/eeh: Rename eeh_{add_to|remove_from}_parent_pe()
        https://git.kernel.org/powerpc/c/d923ab7a96fcc2b46aac9b2fc38ffdca72436fd1
[13/14] powerpc/eeh: Drop pdn use in eeh_pe_tree_insert()
        https://git.kernel.org/powerpc/c/31595ae5aece519be5faa2e2013278ce45894d26
[14/14] powerpc/eeh: Move PE tree setup into the platform
        https://git.kernel.org/powerpc/c/a131bfc69bc868083a6c7f9b5dad1331902a3534

cheers
