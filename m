Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AC8426BA2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 15:25:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQppp2r9bz3cMT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 00:25:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQpnW2N1rz2yKB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 00:24:31 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HQpnW2B9Zz4xqN; Sat,  9 Oct 2021 00:24:31 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQpnW1dlDz4xbZ;
 Sat,  9 Oct 2021 00:24:31 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
In-Reply-To: <163215558252.413351.8600189949820258982.stgit@jupiter>
References: <163215558252.413351.8600189949820258982.stgit@jupiter>
Subject: Re: [PATCH] pseries/eeh: fix the kdump kernel crash during
 eeh_pseries_init
Message-Id: <163369938495.3568929.12290439076854349761.b4-ty@ellerman.id.au>
Date: Sat, 09 Oct 2021 00:23:04 +1100
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 Wen Xiong <wenxiong@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 Sep 2021 22:03:26 +0530, Mahesh Salgaonkar wrote:
> On pseries lpar when an empty slot is assigned to partition OR on single
> lpar mode, kdump kernel crashes during issuing PHB reset. In the kdump
> scenario, we traverse all PHBs and issue reset using the pe_config_addr of
> first child device present under each PHB. However the code assumes that
> none of the PHB slot can be empty and uses list_first_entry() to get first
> child device under PHB. Since list_first_entry() expect list to be not
> empty, it returns invalid pci_dn entry and ends up accessing NULL phb
> pointer under pci_dn->phb causing kdump kernel crash.
> 
> [...]

Applied to powerpc/fixes.

[1/1] pseries/eeh: fix the kdump kernel crash during eeh_pseries_init
      https://git.kernel.org/powerpc/c/eb8257a12192f43ffd41bd90932c39dade958042

cheers
