Return-Path: <linuxppc-dev+bounces-3161-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CEE9C800A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 02:34:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpjPn34X3z2y3Z;
	Thu, 14 Nov 2024 12:34:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731548093;
	cv=none; b=ccLc/giv4RIv9yk6ucNFs6/NmrHz5ExtIF0VaBuuaMd3Mmab+Gs06joZpUae97RnO3yXPsPpw4DmhyHzhLUDLF9kXAhAx7SAM/7MTp2hGjV17hY/GFD93CnkdLAxSkb3BRJIqSvNsegoQwNjQ0Oi0odwVKDsBOuknyoruaCuncfYChuR5fovr4z7LZ3rXiKfcMMNtRBl9Wb47vDfGwb98nb7S9MchFBfTX89gZf1DlovIX3unkYqSsDBq3f610+57EummmNYpmYzbQaPN6+K3veRJyMnsJEGSD5w+bjTAnGAzWMPPeFDrDHfX/c8nSJnb5PFSk4ejPC6Uw5G8G/W+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731548093; c=relaxed/relaxed;
	bh=XePRSe12+tUbovwm+3QKmvMeZZPE4Vjl3ztgCivD9+g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Go9YEppksWsb8If5mAoSZj4BnmpbKp10hhzO6yGqWB8oqyD/GBk7uM71wbyuVp83fbQpTE1T55DAk/OXwFwO/nTT1fat+X/jMl4zJBuBWKI5CrYSRfcGsfO/VKm7UHcIyYlIxh4oGsWNlUp7rN8AVXZombA318DXfsTLUYmvuE7P9GzEq/8L9EZpLIyEJTI7O2TKb4jAOFT4CiKs2rLFxSVPfspkPuJa15PoZrt0lstiqi+lNTNbTU+IF4wB36NTwPkxZofljGHdeMGBN5aGTcdv9d+A+07O1sERkqg46JgXvHPFAj13YO6NOU1IMoby57m2hFWfdQLAIIkeniiwOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WJAG5wET; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WJAG5wET;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpjPl2MSxz2xjH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 12:34:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731548083;
	bh=XePRSe12+tUbovwm+3QKmvMeZZPE4Vjl3ztgCivD9+g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WJAG5wETwD7gPDu7kNNN363h9DIdReyGhf7TQDrKVwpt0P69bLaHjVLJ6GH4v5jhl
	 XMI51C409ULCNLvvvl8I1LJj+l8xDPMembZsox5dtrg0w0UjRU1mLvASyA/ueEZ1db
	 Ts0PzXSs9pENeEHLqSug7D/RtQPnCX/4fMcJHqk8zuFBXNWUPqKcOLNMaTT0Yry+co
	 VpuSCHFVOYXvxLe/QaiP0hPI/Wrmv09sga23jyurBLep5ILTHzCZt+/oDr0OyJqEu/
	 g9pMVSu+AUtMb8d5xDm5VeqMhRZFlFvRaCxGhxNEXZYJrLL0EFg5H4rnQaPFmAC1vW
	 RZKRmHBoXT9xA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XpjPb4z4wz4x04;
	Thu, 14 Nov 2024 12:34:43 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Masahiro Yamada
 <masahiroy@kernel.org>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: manual merge of the powerpc tree with the kbuild tree
In-Reply-To: <20241113095228.4ac96776@canb.auug.org.au>
References: <20241113095228.4ac96776@canb.auug.org.au>
Date: Thu, 14 Nov 2024 12:34:45 +1100
Message-ID: <87bjyivbre.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the powerpc tree got a conflict in:
>
>   arch/powerpc/Makefile
>
> between commit:
>
>   de51342c5157 ("kbuild: add $(objtree)/ prefix to some in-kernel build artifacts")
>
> from the kbuild tree and commit:
>
>   bee08a9e6ab0 ("powerpc: Adjust adding stack protector flags to KBUILD_CLAGS for clang")
>
> from the powerpc tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Ack.

cheers

