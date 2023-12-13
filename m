Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFCE81191D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 17:21:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=xen0n.name header.i=@xen0n.name header.a=rsa-sha256 header.s=mail header.b=FdZA5oT7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr12D65C8z3cYM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 03:21:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xen0n.name header.i=@xen0n.name header.a=rsa-sha256 header.s=mail header.b=FdZA5oT7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xen0n.name (client-ip=115.28.160.31; helo=mailbox.box.xen0n.name; envelope-from=kernel@xen0n.name; receiver=lists.ozlabs.org)
X-Greylist: delayed 363 seconds by postgrey-1.37 at boromir; Thu, 14 Dec 2023 03:19:55 AEDT
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr10W06lwz3bvJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 03:19:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1702483992; bh=4XxyHnJEJKkc+5PvBy8tJ98Zzp6SReQrbmR5u3CSVkY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FdZA5oT75tJH3PJN0bxT2ijMm1wBFi9fAIDpRIiLKEJ8qcv7c86KrC4Caujnwy/Qz
	 h0yWOBpr5j9YQlGHX6bTEdnz+dQUQ431E11+MzKZsjI9OYJQRIedzGgmfPSOvFDP5W
	 xvNwB4vhFx3KjM5C9g2J1KLykNu0MN4NW1kORqlg=
Received: from [IPV6:240e:388:8d05:a200:783a:c9a8:595e:71d0] (unknown [IPv6:240e:388:8d05:a200:783a:c9a8:595e:71d0])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E250E600D1;
	Thu, 14 Dec 2023 00:13:11 +0800 (CST)
Message-ID: <cc762327-796a-481b-9d79-3751361daff8@xen0n.name>
Date: Thu, 14 Dec 2023 00:13:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/12] LoongArch: Implement
 ARCH_HAS_KERNEL_FPU_SUPPORT
To: Samuel Holland <samuel.holland@sifive.com>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@infradead.org>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-7-samuel.holland@sifive.com>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20231208055501.2916202-7-samuel.holland@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/8/23 13:54, Samuel Holland wrote:
> LoongArch already provides kernel_fpu_begin() and kernel_fpu_end() in
> asm/fpu.h, so it only needs to add kernel_fpu_available() and export
> the CFLAGS adjustments.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>   arch/loongarch/Kconfig           | 1 +
>   arch/loongarch/Makefile          | 5 ++++-
>   arch/loongarch/include/asm/fpu.h | 1 +
>   3 files changed, 6 insertions(+), 1 deletion(-)

This is all intuitive wrapping, so:

Acked-by: WANG Xuerui <git@xen0n.name>

Thanks!

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

