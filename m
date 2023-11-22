Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD38C7F3D37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 06:17:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PxDe4lZh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZqJJ5VMbz3dK3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 16:17:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PxDe4lZh;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZqHT2ZGJz2yjD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 16:17:09 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SZqHS5nznz4xQZ; Wed, 22 Nov 2023 16:17:08 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700630228;
	bh=TCYKc2HGVsybDUdZJckf8t5FSQftw5Rjcll+8CYTEmo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PxDe4lZhwi0ogRmrgnxSXD3Po6RKP4PQIE4Ky5NCk2UtjtGX1xpd9WW3FNLk6+1O8
	 hddsoQoCCfL9c4zug8+6ioHnMlcdH+zDI8PY9uXXhnRypx7ApiOO6WDP1XnC19YiAH
	 l7kqt9Y59nLCZkHE9Kgo0FxJlnQh54ZP037o1JCp6a4c9rQjX6bCUByVIQ3jE7+XD7
	 nZ1yYs2/PWapSjDbPeEwac/bAmyudRDFc53wUkMTtrMMmTXlktp4oLtqhjrxG8dG7a
	 upWaCmegFFa7wXPHbhi6zi9m+PW9obOCZpC/ZZwz/qUKIT6wDd6te6CBAlo5/Xg8Vi
	 5P5vW1EfelRYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZqHS50Q8z4xNG;
	Wed, 22 Nov 2023 16:17:08 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, Sourabh Jain
 <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v5 1/3] powerpc: make fadump resilient with memory
 add/remove events
In-Reply-To: <2c0f9f9d-8cc1-4bd4-8f7f-d284140ffa43@linux.ibm.com>
References: <20231029124548.12198-1-sourabhjain@linux.ibm.com>
 <20231029124548.12198-2-sourabhjain@linux.ibm.com>
 <871qcr1v8v.fsf@linux.ibm.com>
 <1472a35a-5de9-4684-b4de-9dffebdedfbb@linux.ibm.com>
 <2c0f9f9d-8cc1-4bd4-8f7f-d284140ffa43@linux.ibm.com>
Date: Wed, 22 Nov 2023 16:17:08 +1100
Message-ID: <87fs0yjrjf.fsf@mail.lhotse>
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
Cc: Aditya Gupta <adityag@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K V <aneesh.kumar@linux.ibm.com> writes:
...
>
> I am not sure whether we need to add all the complexity to enable supporting different fadump kernel
> version. Is that even a possible use case with fadump? Can't we always assume that with fadump the
> crash kernel and fadump kernel will be same version?

How sure are we of that?

Don't we go through grub when we boot into the 2nd kernel. And so
couldn't it choose to boot a different kernel, for whatever reason.

I don't think we need to support different pt_reg / cpumask sizes, but
requiring the exact same kernel version is too strict I think.

But maybe I'm wrong. Would be good to hear what distro folks think.

cheers
