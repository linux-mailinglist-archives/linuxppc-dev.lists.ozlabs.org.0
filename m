Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FF663BDD2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 11:22:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLz0w2pV4z3bV1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 21:22:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=js9W76sj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=js9W76sj;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLz023Yhnz30R1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 21:21:38 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso826970pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 02:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mO31TbOrnHBuUCOwMlCzXyzY1kkd0rpqj99hKevQb4U=;
        b=js9W76sjZ0vjJu4Qjf3+PogqPa0axxy9bTjPerfhvqXhE9iaxOBjZwGaGJ1x5Q5FD0
         iTIv3T3mP62U4mI18GjAnQuAZGO7RkOqGBIzkjhFH1/beerPXSe1nliMsv/kpMCpMCkR
         6ncWkhTY2OFpvFoLMc8vseFzo6ZBUhQdM4gk5NGfM7A/OoXnTfAw5VK6DAD0zc8GGAuQ
         VQ4EXxuzFFN3VKcQXGJTu3MvsRPYlBvZgjpMpwNqrpnkMAayJhdhdL1E5G+G3YY3E+Ef
         d9meeErHFxC3jy6VoG3jDilKP2/duTS2oVK81vDREbAVFQLKf2h83cwSDManzTlqrzA+
         m/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mO31TbOrnHBuUCOwMlCzXyzY1kkd0rpqj99hKevQb4U=;
        b=0zGO7Oy/wqAs97gageV5PjahJDWC78fL/O8USpPTC+UWa2RImglNOvt8WQuu1dXNts
         zYC43P1ple4vAHIfrqF5pyKUMFcrBbGWc7kYCs+wnroY4zRmgdy9i2B8GiP2HC1UV9do
         eEnuRy4KEztLGgDJfpcV182chXgwpIAT+tYdXoMqe+b0KHpH8B1DbIeIQMg6Lk7GJwGE
         u+ipEdH7u+/CcgIVGYwiyYvWfm599oR9711IGLWFXf6SpIbKUjQCvOeeMZyOXtViE90h
         tIwAt9tkRYhPWSRo2AHJ0lYUXO3W2rozfZMBKEsB2N0jKcNj3TqrTFcnuvXq6NkEbgNG
         HDDQ==
X-Gm-Message-State: ANoB5pktsCrNXLTpJMD476E1rnE8m2NL62rMkd3++hhpBwSvMCUqGWWN
	nUtM5SktzsqN8EZMWWtPkh4=
X-Google-Smtp-Source: AA0mqf6Cad6V8nI/WRWpwAS2QSvvIRzLyeO8gRZ5/p59t2/0EJLi1cJ8AIFIWYVL62hG57dPrj/YiA==
X-Received: by 2002:a17:903:3052:b0:189:651c:f023 with SMTP id u18-20020a170903305200b00189651cf023mr21618808pla.78.1669717295284;
        Tue, 29 Nov 2022 02:21:35 -0800 (PST)
Received: from localhost (193-116-112-94.tpgi.com.au. [193.116.112.94])
        by smtp.gmail.com with ESMTPSA id x189-20020a6231c6000000b0056cee8af3a6sm9545262pfx.54.2022.11.29.02.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 02:21:34 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Nov 2022 20:21:31 +1000
Message-Id: <COOPDQ4YOYHQ.3UY8J9FKBECJ2@bobo>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v4 7/7] powerpc/64: Sanitise user registers on interrupt
 in pseries, POWERNV
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.13.0
References: <20221129044354.1836018-1-rmclure@linux.ibm.com>
 <20221129044354.1836018-7-rmclure@linux.ibm.com>
In-Reply-To: <20221129044354.1836018-7-rmclure@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Nov 29, 2022 at 2:43 PM AEST, Rohan McLure wrote:
> Cause pseries and POWERNV platforms to default to zeroising all potential=
ly
> user-defined registers when entering the kernel by means of any interrupt
> source, reducing user-influence of the kernel and the likelihood or
> producing speculation gadgets.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
=20
Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> Resubmitting patches as their own series after v6 partially merged:
> Link: https://lore.kernel.org/all/166488988686.779920.1379487010269641628=
3.b4-ty@ellerman.id.au/t/
> v4: Default on POWERNV as well.
> ---
>  arch/powerpc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 280c797e0f30..2ab114a02f62 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -534,7 +534,7 @@ config HOTPLUG_CPU
>  config INTERRUPT_SANITIZE_REGISTERS
>  	bool "Clear gprs on interrupt arrival"
>  	depends on PPC64 && ARCH_HAS_SYSCALL_WRAPPER
> -	default PPC_BOOK3E_64
> +	default PPC_BOOK3E_64 || PPC_PSERIES || PPC_POWERNV
>  	help
>  	  Reduce the influence of user register state on interrupt handlers and
>  	  syscalls through clearing user state from registers before handling
> --=20
> 2.37.2

