Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB441786F2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 01:19:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XDyf3QQXzDqYS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 11:19:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XDwq69qQzDqQ9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 11:17:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bRUY6toI; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48XDwq2GFRz9sQt;
 Wed,  4 Mar 2020 11:17:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583281067;
 bh=0gG9z5CDBiXtmXaIxYa0LyR+e4XlY+OayNWFzpiYOuQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bRUY6toIxxNAHgj9QI58MhmnkxVbhV3P/OZhfZlw4m5dX5i4IuyiArxg7loBuB7GX
 84LkFoJPwxepK/CizlCDHMbI+UQaM+YwXdGOuQxQwfIFrhY6Q0tOEsSbDoMugk+pZD
 u5BIxKb7ru3VGvxPGygtSLAaMoo6Q0dcoJ+TxL4PmAc60zzed40KAOAutFNqxGLAWI
 mNQ6IioY92ezKq/+GssCHC5ByLn9KHEDOC+NAcc/mmVAfxTiJv8UJAwYdNsGwoNxOv
 QSPQtv/YvWtcqkCsceB20t9FEE3eeremHL+IkvLTgLfCN6vwvNhKnZVmfgR3AqytuY
 6+evvG0u0cpAA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v3 14/18] docs: powerpc: convert vcpudispatch_stats.txt to
 ReST
In-Reply-To: <b85d594912818721b84b3c9a0aafa472d6d4af44.1583243826.git.mchehab+huawei@kernel.org>
References: <cover.1583243826.git.mchehab+huawei@kernel.org>
 <b85d594912818721b84b3c9a0aafa472d6d4af44.1583243826.git.mchehab+huawei@kernel.org>
Date: Wed, 04 Mar 2020 11:17:46 +1100
Message-ID: <87pndtq8gl.fsf@mpe.ellerman.id.au>
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
Cc: linux-doc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> - Add a SPDX header;
> - Use standard markup for document title;
> - Adjust identation on lists and add blank lines where
>   needed;
> - Add it to the powerpc index.rst file.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/powerpc/index.rst                 |  1 +
>  ...ispatch_stats.txt => vcpudispatch_stats.rst} | 17 ++++++++++++-----
>  2 files changed, 13 insertions(+), 5 deletions(-)
>  rename Documentation/powerpc/{vcpudispatch_stats.txt => vcpudispatch_stats.rst} (94%)

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

I'm going to assume this will go via the docs tree, unless you tell me otherwise.

cheers
