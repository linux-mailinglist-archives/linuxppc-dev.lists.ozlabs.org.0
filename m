Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A02F79F801
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 04:29:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lKq8i0Oo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmLqV0SMGz3dmY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:29:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lKq8i0Oo;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmLmz0sqFz3dWq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 12:26:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1694658416;
	bh=xlSTiurgLaBQNpc+vQK3oWsZWhS8BblwTkgUV7ZsG1g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lKq8i0OoDT58sd0z3lTD7epUzKU/LoG7/siGug5Tqo0G5Z6+MGn+ydajR/7DNZM5h
	 xCXjwMW9w0za5cN9EkyJfMdFRTKNyXKTYxLwOJJx5ZDjpwlgjw/fSi3dkKTrvJR/44
	 Y38/MtamXO43LySywo5AdmKkc5sboDpfJucvrCnEDbUOY1nf19du9628bTKkf9SKt7
	 fEkV3uuIa8r3QMxslPdjZLR4kYtZe73zC/DzWsTvwqetMBSnAWBNHy9i8TDjV595XF
	 OOSF2hm23VWE6buknC6WSbc3un6yoXRDK6y3c/a/Zuye0e5bWr4FTjd3F23BQh05rN
	 e4UWz4t/JKf9w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RmLmw2mRxz4wxg;
	Thu, 14 Sep 2023 12:26:56 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, linux-bcachefs@vger.kernel.org
Subject: Re: [PATCH] powerpc: Export kvm_guest static key, for bcachefs six
 locks
In-Reply-To: <20230914000115.1035594-1-kent.overstreet@linux.dev>
References: <20230914000115.1035594-1-kent.overstreet@linux.dev>
Date: Thu, 14 Sep 2023 12:26:53 +1000
Message-ID: <87a5tp8p76.fsf@mail.lhotse>
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
Cc: Kent Overstreet <kent.overstreet@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kent Overstreet <kent.overstreet@linux.dev> writes:
> bcachefs's six locks need kvm_guest, via
>  ower_on_cpu() ->  vcpu_is_preempted() -> is_kvm_guest()
>
> Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/firmware.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

I'm happy for you to take this via your tree.

cheers

> diff --git a/arch/powerpc/kernel/firmware.c b/arch/powerpc/kernel/firmware.c
> index 20328f72f9f2..8987eee33dc8 100644
> --- a/arch/powerpc/kernel/firmware.c
> +++ b/arch/powerpc/kernel/firmware.c
> @@ -23,6 +23,8 @@ EXPORT_SYMBOL_GPL(powerpc_firmware_features);
>  
>  #if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_KVM_GUEST)
>  DEFINE_STATIC_KEY_FALSE(kvm_guest);
> +EXPORT_SYMBOL_GPL(kvm_guest);
> +
>  int __init check_kvm_guest(void)
>  {
>  	struct device_node *hyper_node;
> -- 
> 2.40.1
