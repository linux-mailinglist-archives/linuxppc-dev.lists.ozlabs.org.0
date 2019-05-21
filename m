Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FD8246E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 06:34:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457NG76D86zDqNZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 14:34:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="n4hFcBI7"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Ppy3lDs/"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457NDn4npFzDqHR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 14:33:28 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 1168068D;
 Tue, 21 May 2019 00:33:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 21 May 2019 00:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 AlWrfBTrcpPv2MHnZ7Kz+KHi+IVsVLeNo9zFDUGz76Y=; b=n4hFcBI7t383uVyf
 rn6SAFOdBocVIvP2WYVx9mCubIyxB52Fsxt6YEBCpVuomjIZbvKpXxwtm2jigzHG
 7hoJmQm8fzT37fif6X/aKk9Bb/VZxaNn6tBoCqPfE3WV2GCpLQE/R3ULig/iHe7a
 SYZMEDuEqGoW4SYYOQKVA4f+nv+mdUc7l8NnHwES6OOeYkAwChvON11E2+pVmBIe
 rP1oGN5lqS9Ge5kpJtoPDN6I4IUABmdYRLgBy+v3Ek6/g7MpkEU+1uza35hgzWpn
 oaTX60NkF1VAO5nL8YYlaAeQwjWue0WobbecPq9wKHB1KPFRyMbsJtAT9BOmtHvA
 HQ4HOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=AlWrfBTrcpPv2MHnZ7Kz+KHi+IVsVLeNo9zFDUGz7
 6Y=; b=Ppy3lDs/uAXuwh6Bfhz2pMFRedUu6AdzAc+Uyn2tBzLL0/wIYhLd8WshG
 FyjdQNKYqsei7uqFdcRNYOpeRwQ6MICh/qM/27gS+YCp2u8do03efOrZuPjC1vDV
 F2ebVYbGrlAvTkUsNIS5ry9wS0TKtPl3YDN90xGOeMNbGyfKunBIqYWnrhRDhZln
 LizlfsSpbRZCCX9Ygl9gaIBJlqa/1OxJ634FMy08YdgyZY2t9LkvHuvwDiXqV1nL
 5rgYYP0jYKoSL21ZvvholK+xDdDoWXTlQxv7Dg3Qgs50bA39Cc3gizTEJwpLsX69
 Bd/1BgzEezuG7WfqLsuDe0pRu+sKQ==
X-ME-Sender: <xms:k3_jXDg75Llg6VcPCl5wWvcnNSHfaYWJN5wYY_8z4eSQeZMwsw583A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddtledgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfffjghftggfggfgsehtjeertddt
 reejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhush
 hsvghllhdrtggtqeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvddv
 rdelledrkedvrddutdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruh
 hsshgvlhhlrdgttgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:k3_jXEkafT24d5MddrYm-5I2xa8VYHejmOeUC9W7NnP4fQFvTTyXfA>
 <xmx:k3_jXANHDl4rw_mFtE2sgFaPs8Wkl9LqweSfOSFwayKMcC6INLjTrw>
 <xmx:k3_jXHF_YDP0pcKsWRH0_D_ld2mg37PygOwtC2W9q9_kBzaHv7XOXw>
 <xmx:lH_jXBd6lIprkHfLs2QimfROtqsr62W8b2oHghmEtxyugbpnrIzEvg>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id A7D778005B;
 Tue, 21 May 2019 00:33:20 -0400 (EDT)
Message-ID: <6a90db30c8543d547ab8543fbdba02f7fe6a4898.camel@russell.cc>
Subject: Re: [RFC PATCH] powerpc/mm: Implement STRICT_MODULE_RWX
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Date: Tue, 21 May 2019 14:33:17 +1000
In-Reply-To: <df502ffe07caa38c46b0144fc824fff447f4105b.1557901092.git.christophe.leroy@c-s.fr>
References: <df502ffe07caa38c46b0144fc824fff447f4105b.1557901092.git.christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-05-15 at 06:20 +0000, Christophe Leroy wrote:

Confirming this works on hash and radix book3s64.

> +
> +	// only operate on VM areas for now
> +	area = find_vm_area((void *)addr);
> +	if (!area || end > (unsigned long)area->addr + area->size ||
> +	    !(area->flags & VM_ALLOC))
> +		return -EINVAL;

https://lore.kernel.org/patchwork/project/lkml/list/?series=391470

With this patch, the above series causes crashes on (at least) Hash,
since it adds another user of change_page_rw() and change_page_nx()
that for reasons I don't understand yet, we can't handle.  I can work
around this with:

	if (area->flags & VM_FLUSH_RESET_PERMS)
		return 0;

so this is broken on at least one platform as of 5.2-rc1.  We're going
to look into this more to see if there's anything else we have to do as
a result of this series before the next merge window, or if just
working around it like this is good enough.

- Russell

