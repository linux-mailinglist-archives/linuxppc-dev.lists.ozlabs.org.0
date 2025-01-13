Return-Path: <linuxppc-dev+bounces-5154-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C354A0B9CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 15:40:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWw0Q6gkRz30TY;
	Tue, 14 Jan 2025 01:40:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736779222;
	cv=none; b=oGv2vxIRVWlQamryrrspiDxolZ85KluUN7TgXpnCFoMGNgv/B3BU7352NahI544IcN6CXD7j09vge3tO5c9iGlMfWN0TuZjDl+gDvlv9OcXaWaMNLAh+bpXL4BvlOeimtrhKwiL9rxDPcNwcSIuW/SOqPP0+OKV/QsHiPN/2jSXxoXgG+63ArFtQ2a7bWt/j15jU0a0Lu2QolPQ1Vxq5XG5u/VXIBRRM1XEtR6IBe8upmmly2fFfDhDwF/PWqn8rCsMgQaTdxnzF5n9E1459VR2XyLNuNuve16AGvK9AQZ7lREpP1y5zY2a4UkT+Zs9XNmx78vjufxRtj1OIfDddhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736779222; c=relaxed/relaxed;
	bh=+82re+Z1LrZRRopK/GGcdBsiN/kNdJCfofV49mEVpns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VOHvVeq/lng9W2egIKXQ2iJqQjgUjkf22vulkyOgTyWrDb0fWyRIsZJoZrv6Y4ak7CPfFSxFlWGcoDp7JGlva6J7jSN2NYQ99tUioS2BgficvWv+jF/slm406FavBEeoP3I8jX8jbIr3QOlP26EJIddjYYz9niDmug/xkgb+bBbER8v2Hu4Dzl+f0QTHfFSbmLAoiz6md/qdpBAGUce9+1bFS3VpfMOmAbgaXCrFBTxOUdN04seIexbWnB73+S/X5qoCRw2oO2kmaDhCinu1MtCh9BXyOs8+5seJIlbPVtmcOZq/oXlywboJk8XaQ3Ol2tl73mWbYkTJ4zrRemS1DQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nlM6IauN; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nlM6IauN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWw0P673Rz30Ss
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 01:40:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30E705C53CD;
	Mon, 13 Jan 2025 14:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8E7C4CED6;
	Mon, 13 Jan 2025 14:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736779213;
	bh=LXLnwsUoapd7rB4MXtppWJ/94xPhiTZNAMTipBuP1bM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nlM6IauN5qYlDDo4U7ZhhsBv5Ok1CYmeBYJAmeDupHgXGneA26VqJJSTqSRAKJ9Pv
	 RiPP/OuRNq1MX+RWrq1yTWckWwvvLbPelYQbf4Fehf8urTpzFqTgk99izZ+LEncos/
	 CBgg6qY0/kfUmKQEDrMah+NwNJDngF1laqmmZbULZ1IPTGC269FfXZ/Lr7aKInCVT8
	 v997u48DODE2Sd7fn0NS4qB5ConucOopQD/p5uq0btvPHIme9y9CiVPkzh5OK/Xj+7
	 jBAu/EAEOB1yvFAvUZcJ41gEeWGcwMg7tkqvexy4VVp+hCGiiN2R52TKhdy+nE2uH9
	 ZlG6I9UvtmFmw==
From: Christian Brauner <brauner@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] select: Fix unbalanced user_access_end()
Date: Mon, 13 Jan 2025 15:39:56 +0100
Message-ID: <20250113-sitzreihen-dezernat-86551af2a480@brauner>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <a7139e28d767a13e667ee3c79599a8047222ef36.1736751221.git.christophe.leroy@csgroup.eu>
References: <a7139e28d767a13e667ee3c79599a8047222ef36.1736751221.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=brauner@kernel.org; h=from:subject:message-id; bh=LXLnwsUoapd7rB4MXtppWJ/94xPhiTZNAMTipBuP1bM=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaS3qp5gyGz4k7n9RtSLbwu4Q8Nq1K7ONS75vXnOJS31F HcphdWHO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDaEi1MAJrJ9B8N/T8slD2264hU27rFs j7XdOE1t5uas49fy1b8yFfwXZbfaw/BXKuMfa4ld7eOD8W1bGTviM5oPHW+2uNS+eMXbDyqhbem 8AA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 13 Jan 2025 09:37:24 +0100, Christophe Leroy wrote:
> While working on implementing user access validation on powerpc
> I got the following warnings on a pmac32_defconfig build:
> 
> 	  CC      fs/select.o
> 	fs/select.o: warning: objtool: sys_pselect6+0x1bc: redundant UACCESS disable
> 	fs/select.o: warning: objtool: sys_pselect6_time32+0x1bc: redundant UACCESS disable
> 
> [...]

Applied to the vfs-6.14.misc branch of the vfs/vfs.git tree.
Patches in the vfs-6.14.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs-6.14.misc

[1/1] select: Fix unbalanced user_access_end()
      https://git.kernel.org/vfs/vfs/c/83e724bcabc5

