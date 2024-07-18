Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8D193472A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 06:33:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OK96QppL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPg0b1F6bz3cf8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 14:33:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OK96QppL;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPfzs3dWbz3cPf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 14:32:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1721277141;
	bh=nZ8Os7OjJ+T31mYxH8zBOPqMWZ2Rhz1IZxjZyJjTNQY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OK96QppLpdw3gwSvIOppK3dtb0PZapVJyY7jE6TH1R2uEgKf+GCvjX4kXkisOGaRN
	 pjSnU95yKIhayJ+5rwdhlUklkfO5afMZHq9w2aJVDStjhHoPQOA6t2/eO0S6MFJ5yE
	 iSdMv0jLOLfIKb8vhSSpcp/jmGqa/wkm9EwxJf3zWkeMMqB7MFLGZ2/t+XVYKhJYPS
	 dHz36/VraOUwwCiPPyWpq7AKoo0TTwR72gCbH7pgMOadJfPIqLz2iSIWEGdJn9z7zv
	 kL9DvLJaAGxZ9F4cJIbxDsljPiq2r6GsOGCPJjbqElkBnL5Wp3Ij+fPjRlqP0qI55v
	 v8eihWXHOSyUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WPfzS6f49z4w2D;
	Thu, 18 Jul 2024 14:32:20 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Borkmann
 <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii
 Nakryiko <andrii@kernel.org>
Subject: Re: linux-next: duplicate patch in the powerpc tree
In-Reply-To: <20240718095428.56145ce1@canb.auug.org.au>
References: <20240718095428.56145ce1@canb.auug.org.au>
Date: Thu, 18 Jul 2024 14:32:19 +1000
Message-ID: <87plrbwca4.fsf@mail.lhotse>
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
Cc: Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> The following commit is also in the bpf tree as a different commit
> (but the same patch):
>
>   358492fc426f ("MAINTAINERS: Update email address of Naveen")
>
> This is commit
>
>   afcc8e1ef7bb ("MAINTAINERS: Update email address of Naveen")
>
> in the bpf tree.
>
> Note also that commit
>
>   e8061392ee09 ("MAINTAINERS: Update powerpc BPF JIT maintainers")
>
> from the powerpc tree is almost identical to commit
>
>   c638b130e83e ("MAINTAINERS: Update powerpc BPF JIT maintainers")
>
> from the bpf tree.

I'll drop them from my tree.

cheers
