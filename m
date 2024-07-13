Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFFA930539
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2024 12:43:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FGAZR++f;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=D96QLQRM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLlRY2KT4z3cfg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2024 20:43:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FGAZR++f;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=D96QLQRM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLlQq50bwz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2024 20:42:26 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1720867335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nf78z+ot0DcB12FLGp27PqqquDVnJlnIDmODNL4yRjQ=;
	b=FGAZR++fLXkA41w42NmRuvHcAvq5zX3sjoB7pvVXp3YcXdOD13trrThDA0NA0dZUaoqhhF
	2oirRpWxDwwYP8iZzcMyoEsPu2T7BXe6lKaI3EqrZElS/+UlvmJV6l1F2+xFu8HrKy0D4m
	awmft0VxgEahAedrmUlfUGkiaH//WMMO5rjE46G8njvMheGpY5ASaPR3RaVWLIQN5T61R4
	vEnA5SY5PgAhPk77lVDqASPzP8gwS3QAdXX+B9DsJwM1J1Mkg3mAPa+Z4TMnh5OYsrffst
	506bJAT2icEKq5urMl+HuQqnwrVqot52KyxULJpqWJoJ9H3CyqNdj37dn/kKtg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1720867335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nf78z+ot0DcB12FLGp27PqqquDVnJlnIDmODNL4yRjQ=;
	b=D96QLQRMmwhgfBHjBjxFizYhXkYoDi0RIMdgG2S9uhHQQowec0c4Yt4SfdC6iMvVcwyn1Q
	uLviHfVJmbGjC9CQ==
To: Vignesh Balasubramanian <vigbalas@amd.com>,
 linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH v3 1/1] x86/elf: Add a new .note section containing
 xfeatures buffer layout info to x86 core files
In-Reply-To: <20240712094630.29757-2-vigbalas@amd.com>
References: <20240712094630.29757-1-vigbalas@amd.com>
 <20240712094630.29757-2-vigbalas@amd.com>
Date: Sat, 13 Jul 2024 12:42:14 +0200
Message-ID: <87plrhshdl.ffs@tglx>
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@FreeBSD.org, bpetkov@amd.com, x86@kernel.org, npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, ebiederm@xmission.com, naveen.n.rao@linux.ibm.com, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, binutils@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 12 2024 at 15:16, Vignesh Balasubramanian wrote:
> diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
> index 1fb83d477..cad37090b 100644
> --- a/arch/x86/include/asm/elf.h
> +++ b/arch/x86/include/asm/elf.h
> @@ -13,6 +13,15 @@
>  #include <asm/auxvec.h>
>  #include <asm/fsgsbase.h>
>  
> +struct xfeat_component {
> +	u32 type;
> +	u32 size;
> +	u32 offset;
> +	u32 flags;
> +} __packed;
> +
> +_Static_assert(sizeof(struct xfeat_component)%4 == 0, "xfeat_component is not aligned");

This struct is only used in xstate.c and asm/elf.h is not a UAPI
header. So what's the point of declaring it in the header instead of
xtsate.c?

If this needs to provided for user space consumption, then it want's to
be in a UAPI header, no?

Thanks,

        tglx
