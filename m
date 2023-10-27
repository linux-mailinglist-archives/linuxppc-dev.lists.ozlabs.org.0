Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A37B7D9501
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:17:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ECsiud9L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGz9Z0w5Zz3vm4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:17:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ECsiud9L;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzT0pKMz3cQq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401301;
	bh=jtuCWNKuE/h7zD2BeBm3DoEXh/mgySFqwyRN11JrCB0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ECsiud9L4hpYSVBuhqqg+PWooHWULZGIoQRUwr5//eEDwnO6Pncwp3gV8iHlXu99w
	 mpchcTlkkrMeiX+UXhquvTZKzHiW7QVJxkfjjebQ28rP464hoyEKw0BltCSj8elq6m
	 6RhJvnOFv7CE3hBqwsfL+tLMCQ3FDh6NKCwgStvh/mYXizaaFlq60b+x9iLVCiImsb
	 17YbMcNbby9awVq4fk6+cnfErbuZTiMamUzuOkNkbqDoq+MHSNxctHjGWTTqgLh6ij
	 aDLNJVZnrtP3MJIKPhZ8u0Dj38PQPuq0Du7TS2mVYn3HW8Qqgtt06Jn/HbHjVoDSTE
	 0XEcrTS/I8QBA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzS6kLTz4xWn;
	Fri, 27 Oct 2023 21:08:20 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: martin.lau@linux.dev, yonghong.song@linux.dev, john.fastabend@gmail.com, Muhammad Muzammil <m.muzzammilashraf@gmail.com>
In-Reply-To: <20231013053118.11221-1-m.muzzammilashraf@gmail.com>
References: <20231013053118.11221-1-m.muzzammilashraf@gmail.com>
Subject: Re: [PATCH] arch: powerpc: net: bpf_jit_comp32.c: Fixed 'instead' typo
Message-Id: <169840079668.2701453.302685477788337592.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:59:56 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 13 Oct 2023 10:31:18 +0500, Muhammad Muzammil wrote:
> Fixed 'instead' typo
> 
> 

Applied to powerpc/next.

[1/1] arch: powerpc: net: bpf_jit_comp32.c: Fixed 'instead' typo
      https://git.kernel.org/powerpc/c/4b47b0fa4b15e0de916e7dd93cd787fdab208ff2

cheers
