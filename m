Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9016DEB72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 07:52:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxBh50dgqz3bnM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 15:52:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=frI2z76Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxBgB6Q46z3bhZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 15:52:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=frI2z76Q;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PxBg814h6z4xDn;
	Wed, 12 Apr 2023 15:52:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681278724;
	bh=jqtJJylomYzYVkCC66q6zDwuo6aVxIv4ryKs0Q31Tkw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=frI2z76QxUdVGt9vzxq4XlF8uIotArtGilXmy4Yiw8TO9qGru44k0P9sUscx6dYta
	 6bw/iiIXrmh7BO+CxEEmfkdPJFXeMQmvDVeWGzfNcuM1LNApk5hChKNhblcZ4Potc8
	 DwUdvWd0xL/zjaJhYelrU1Q2HcuCtDYwXyyn7VK2Po1+ybtVBHy58g0maVIKFYhTY9
	 IQZBAnSE9vDm4/nGjVFO+W3+sF8IEdupCmqw9SMyGlmO6PGIQmjqJrncKfqDZE/4F3
	 miVoHKYSz0H1/39qk1WWoYYJwFt6CqbTC10JJqwJXxGl7HfF8vpCvMrNbd5Vb8kxHT
	 IwP/U1veucJHQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie
 <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm tree with the powerpc tree
In-Reply-To: <20230412112213.59365041@canb.auug.org.au>
References: <20230412112213.59365041@canb.auug.org.au>
Date: Wed, 12 Apr 2023 15:51:57 +1000
Message-ID: <87ttxlir5u.fsf@mpe.ellerman.id.au>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the drm tree got a conflict in:
>
>   drivers/gpu/drm/amd/display/Kconfig
>
> between commit:
>
>   78f0929884d4 ("powerpc/64: Always build with 128-bit long double")
>
> from the powerpc tree and commit:
>
>   4652ae7a51b7 ("drm/amd/display: Rename DCN config to FP")
>
> from the drm tree.

> I fixed it up (I used the powerpc version - with "(PPC64 && ALTIVEC)")
> and can carry the fix as necessary.

Thanks, that's the right resolution.

Not much we can do to avoid that conflict, we'll just have to tell Linus
about it at pull request time.

cheers
