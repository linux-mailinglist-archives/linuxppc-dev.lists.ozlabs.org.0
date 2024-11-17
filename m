Return-Path: <linuxppc-dev+bounces-3380-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B61A9D03AD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:27:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqjD3P6Tz3bmY;
	Sun, 17 Nov 2024 23:25:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846336;
	cv=none; b=nd6OVyg2A8X/ZougPkfrQPuxjOsyuN1JgirrR+OJYovvX2+ybpiucy+Ny7DAufp8OX+kLpO8qwJ1g3lUrG6TWPXmz4ERwSPWkupJJAeywy6s/7FNxY5ORIAv0jWFRPg7y4xJV9sTwGB3zDBSSNs6XGH9AGtTQaH6l+UJkXY/flLKdSv9yVQc2RctIGSmnoHSSPtmqIfEOK2kZTAYSPwno9KNYzVgMVQBH/A1bAhLN2xe1FzFOKL30dapqOcFXAZjflSdrODQbMvEg/2fsLLvdbod9e3cncBrt+sxZWl5APdxt10OCbYMzrLvr2svf0UFl9Hqwkn8HrZAHs0ln+8CxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846336; c=relaxed/relaxed;
	bh=vLaiN/SgefW4+vRAcoSW4dgqTRvnxKSEvntNMp09X7w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GNWzPAGVUgMw3DShMGd1sSp8cmb6Q8G8mVDXLRsLGKa6LBaUhtjeWGoYUErxBHGtMGf9+InYVinFsXX9FSbhV4v3UJlOZwR4ve3u2e5sgd/YdMhdV0n6MrEDb0VNK5lQhQC9G34cSIQFDtNdxs9EMMapq6Erb4hhsFjo3VeGLnpOiCB78XaSk1+6+nOVSUndS+URGROxz9chCXS5G/HmiaA/9VX9NrLMo+Z4WhfCxkgR8C0fylgJhNS3DVZfFQdFblFmh/IW3f8hHWDOXWWbkwD1U78svFzZloIzQvO62K3ae/w/hE9TAkLj0QgjYajtCGExc5ZMEEHOhmA2/eNi0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DHcNzTre; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DHcNzTre;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqjB48ccz3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846331;
	bh=vLaiN/SgefW4+vRAcoSW4dgqTRvnxKSEvntNMp09X7w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DHcNzTre1EsoU/Frfruqv3q971A8wwjZCP3jsGporF2fF5ctlvTHrVSJp1rqYi2JB
	 DPX6Mmi9+Yha4rKpVv0TBcu1J7ZR5bVPOrgCkTpn4jhHuCK99wUm0OI3Jvdk+nA2os
	 It+jEwfyAsIqfijCzfqFVL9+0emAcgUL5w8GDFFpsVFo6OlSixgmK6F4f/VnRDVpRk
	 ZoaC9j39H0scmVlv/xc8Os1yETmnI9JwOX+G3zWTSJ+GS11P1msoaxR8i7F+nQv1ig
	 56C6KanWIiNjwq0vmRJVUwG05ogc6EachzYbl8XTUIwG3KOc+s0hoTH8teK+PQ4dXY
	 cxBQH6zLMxiLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqj73Vywz4xf7;
	Sun, 17 Nov 2024 23:25:31 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michal Suchanek <msuchanek@suse.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Paul Mackerras <paulus@ozlabs.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20241001130356.14664-1-msuchanek@suse.de>
References: <ZvvrHpD-v4CuDqsm@cleo.paulus.ozlabs.org> <20241001130356.14664-1-msuchanek@suse.de>
Subject: Re: [PATCH] powerpc/sstep: make emulate_vsx_load and emulate_vsx_store static
Message-Id: <173184539750.890800.667845250874814001.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 01 Oct 2024 15:03:49 +0200, Michal Suchanek wrote:
> These functions are not used outside of sstep.c
> 
> 

Applied to powerpc/next.

[1/1] powerpc/sstep: make emulate_vsx_load and emulate_vsx_store static
      https://git.kernel.org/powerpc/c/a26c4dbb3d9c1821cb0fc11cb2dbc32d5bf3463b

cheers

