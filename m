Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 916F19335EC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 05:59:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rCWHpGpP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WP2Hr3vj8z3dTL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 13:59:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rCWHpGpP;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WP2H53jZ0z3cVq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 13:58:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1721188717;
	bh=OFZi07WYw07ktkZHKw95GSmV+6KfXxL/KNgObsOeLsY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rCWHpGpPad0oI7coqJLrWR+QgRjO50M5p2JxzGHr/Kboq7Dj2/pDTa+CAQwX8jNU0
	 9hC488vmPCzSABj4nzB7iEnyPtKi6M7fu8GIPaCZ2rpMz7miMi+7TISZ783r7VF/bK
	 TN+aM3JLVK5zN0sMdMWO+CkVOBMP9ltKU/JAM16yAU45fHICtrX/x7+JFONJW2/8kH
	 BohDNRRZo/iub2PcMQETkNXU8D5PR0AIkk8YxfmZkS67XmBoF8VGkDZ9Vid8RQhU/u
	 RWFFNTccZTSlNPcocGdN8PvWwy0ECWmZmimXPcExgxPhcSp1yIEi8V3Dx1neuR9bXh
	 hDDm0NKcGxU5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WP2H04yD3z4wbr;
	Wed, 17 Jul 2024 13:58:36 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masami Hiramatsu <mhiramat@kernel.org>, Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update email address of Naveen
In-Reply-To: <20240716190222.f3278a2ef0c6a35bd51cfd63@kernel.org>
References: <fb6ef126771c70538067709af69d960da3560ce7.1720944897.git.naveen@kernel.org>
 <20240716190222.f3278a2ef0c6a35bd51cfd63@kernel.org>
Date: Wed, 17 Jul 2024 13:58:35 +1000
Message-ID: <87sew8wtxw.fsf@mail.lhotse>
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Alexei Starovoitov <ast@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masami Hiramatsu (Google) <mhiramat@kernel.org> writes:
> Hi Naveen,
>
> On Sun, 14 Jul 2024 14:04:23 +0530
> Naveen N Rao <naveen@kernel.org> wrote:
>
>> I have switched to using my @kernel.org id for my contributions. Update
>> MAINTAINERS and mailmap to reflect the same.
>> 
>
> Looks good to me. 
>
> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>
> Would powerpc maintainer pick this?

Yeah I can take both.

cheers
