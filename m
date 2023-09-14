Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E13C7A0577
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 15:22:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=L9qfJ7rG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmdKk6y7lz3cSf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 23:22:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=L9qfJ7rG;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmdJt1vjKz3c53
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 23:22:06 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RmdJn5pxbz4x5M; Thu, 14 Sep 2023 23:22:01 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1694697721;
	bh=5ggr/x8N+Yteallb6VVQSYgQULTkxEtTbD0+05vN38w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L9qfJ7rG6i+o1xw7fvEm2saVIv9clUnl1sxb42RNzLzOOky9IB5htklA970Ge6b6/
	 U+H7XfP6a8c3peExL5IvvZqD0HMsGsLN89U7lAs0vaJ7kslA0MTFLL9ciHtgtg079C
	 jJr/huJv5Mx0UMjogaAijypZkTRrkje/NgC0QH41ezkfumSaMT845QHCIUH8nIgQ9m
	 UBlSxInt6wHOYAXVLweq/06k+LoEjgqaGYjYdXrvmBmsCK1gd5FsE61QYP1UvczQya
	 ZHEcOnoZkYRRfoW9ZwVG7NjbQIOqP+bPQ4edlS4EFaJUmySxX5WXK8r8G3Jyilh2Tm
	 Y4nqGjYemvsDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RmdJn510yz4x5K;
	Thu, 14 Sep 2023 23:22:01 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Aditya Gupta <adityag@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
In-Reply-To: <20230911091409.415662-1-adityag@linux.ibm.com>
References: <20230911091409.415662-1-adityag@linux.ibm.com>
Date: Thu, 14 Sep 2023 23:22:01 +1000
Message-ID: <87v8cc7uva.fsf@mail.lhotse>
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
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, "Aneesh
 Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aditya Gupta <adityag@linux.ibm.com> writes:
> Presently, while reading a vmcore, makedumpfile uses
> `cur_cpu_spec.mmu_features` to decide whether the crashed system had
> RADIX MMU or not.
>
> Currently, makedumpfile fails to get the `cur_cpu_spec` symbol (unless
> a vmlinux is passed with the `-x` flag to makedumpfile), and hence
> assigns offsets and shifts (such as pgd_offset_l4) incorrecly considering
> MMU to be hash MMU.
>
> Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
> `cpu_spec` struct, to VMCOREINFO, so that the symbol address and offset
> is accessible to makedumpfile, without needing the vmlinux file

This looks fine.

Seems like cpu_features would be needed or at least pretty useful too?

cheers
