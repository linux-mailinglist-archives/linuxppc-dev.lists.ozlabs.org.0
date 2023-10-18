Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8697C7CD8F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 12:17:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=A+53hsGm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9Rbf3Q2gz3cTc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 21:17:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=A+53hsGm;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9RZq50jwz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 21:16:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697624179;
	bh=MczObw+G4xIfimfbL65IT/uzpdr8unY/SOxvHjaqltM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=A+53hsGmVyQYZZh5fTNgAkvKCl4uqq0LlfPKxFdLRnkUdS990MgFkzAD2DjBBG/+Q
	 iR6t95IAePINUtlt5f7MPTjZsTbxoZc84zemN57VvwOvppCQUWAiTwL+dDCPCBzwNp
	 EExN23l5P9uQgXwRCGn/gRCPGCbMO+ybjEW+N0JzOCkRYpoB+Y9jXwxYHRlZ5QjpIu
	 r6RnQYtkK75SJmUNp3+jR8HHFvDOpWNLNFnYXsAkSTn6e8/QbiyAEr1NeTvVmFE4Fq
	 X/Zdt++Imc1OXNlm/zP/AbR2ft0iMH1XypX8p8WP9w7EJ3UcpQrGTjpNFxtf5O8D8l
	 NBLbv8iapuwcA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9RZp5lHmz4xF9;
	Wed, 18 Oct 2023 21:16:18 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Borkmann <daniel@iogearbox.net>, Muhammad Muzammil
 <m.muzzammilashraf@gmail.com>, martin.lau@linux.dev,
 yonghong.song@linux.dev, john.fastabend@gmail.com
Subject: Re: [PATCH] arch: powerpc: net: bpf_jit_comp32.c: Fixed 'instead' typo
In-Reply-To: <cc25e4b1-9079-1c45-b6d4-7f7f4701df0a@iogearbox.net>
References: <20231013053118.11221-1-m.muzzammilashraf@gmail.com>
 <cc25e4b1-9079-1c45-b6d4-7f7f4701df0a@iogearbox.net>
Date: Wed, 18 Oct 2023 21:16:18 +1100
Message-ID: <87cyxc6xsd.fsf@mail.lhotse>
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Borkmann <daniel@iogearbox.net> writes:
> On 10/13/23 7:31 AM, Muhammad Muzammil wrote:
>> Fixed 'instead' typo
>> 
>> Signed-off-by: Muhammad Muzammil <m.muzzammilashraf@gmail.com>
>
> Michael, I presume you'll pick it up?

Will do.

cheers
