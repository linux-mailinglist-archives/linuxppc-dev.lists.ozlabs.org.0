Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 530377F5555
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 01:27:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YPC8I2Y5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbJpd1CFwz3dKy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 11:27:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YPC8I2Y5;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbJnm1130z2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 11:26:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700699192;
	bh=x4ZQqedJYLGPYSK+d7G5PNiQr9d+Gw8ba+LcRhYj45A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YPC8I2Y51EwzLJV2d79l8abHDqwqoEm3vGEo2qWzyoLyBcQ5JdMhbBqj4iXNalv+R
	 7oUNbrvjHmDzljIQGxEKhzff4EXfvuO8dUquzjPYSqhzwxjuMSf11xmT6OxyvNZwya
	 61tfvYtMPH4+L53N59qS8/NxVg5VqFGRhWO99nmTG2k5sHQnWwKubKrzS0whjuzfKO
	 arebV4JFb2GWg8Zo3dymdohx/UqOAc82d7JPz1cpzXSNo1RZemk28J04xolONPAC2C
	 CSq8nYUWK+Wv/zKrQ18bo6T5l0xisx96lkzML/VjoMp1Xi1PCKmI6x1PzuClkJhU80
	 nqxpcRcm9zwtw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SbJnh0btLz4x5n;
	Thu, 23 Nov 2023 11:26:31 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] powerpc: Use ARRAY_SIZE for array length
In-Reply-To: <20231122090312.114679-1-jiapeng.chong@linux.alibaba.com>
References: <20231122090312.114679-1-jiapeng.chong@linux.alibaba.com>
Date: Thu, 23 Nov 2023 11:26:31 +1100
Message-ID: <874jhds4aw.fsf@mail.lhotse>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jiapeng Chong <jiapeng.chong@linux.alibaba.com> writes:
> Use of macro ARRAY_SIZE to calculate array size minimizes
> the redundant code and improves code reusability.
>
> ./arch/powerpc/xmon/ppc-opc.c:957:67-68: WARNING: Use ARRAY_SIZE.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7612
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  arch/powerpc/xmon/ppc-opc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

This code is copied from binutils, we don't take cleanup patches to it.

See also the at least three times this has already been submitted :)

https://lore.kernel.org/all/4ed43222-17b0-8355-f836-adabb453e432@csgroup.eu/
https://lore.kernel.org/linuxppc-dev/20181004171036.GA1907@embeddedor.com/
https://lore.kernel.org/linuxppc-dev/874lfxjnzl.fsf@concordia.ellerman.id.au/

cheers
