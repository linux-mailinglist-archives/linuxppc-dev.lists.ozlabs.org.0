Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC756FBD24
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 04:29:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFhtR2GMMz3fJr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 12:29:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=APc4ynfy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=APc4ynfy;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFhsc0BG8z3c7t
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 12:28:19 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-643557840e4so5726435b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 19:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683599297; x=1686191297;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RH7duWPqB4oDIidMbdO3CzyNtsIH+8Zk9AGEa5N9U+0=;
        b=APc4ynfyOiejIqH3T9tvyKqbflGMYdUTDX5/diG3OC34qzxDTIE3el6s+cJ+9s/sGl
         09mXHVelY/StqCZVBfXZN1JVyEE1kaaSF5MzHtShF94Mqv5XiPl6a4NwCz3Pv192wqJa
         mucd0VFsVL3YFZU0UnN3UgRWASRZC6VRJURq4XJGWcRsw4JMsrjsO5pWzkIbk6Xn0AM6
         jVVq3MMvbwrYx1EfEYhNLMR0RUguc0TY79B8swWiPbgIcm8czKNdTXAhK+AiyLmPRQk6
         Z5hekSUPaXczlu3Za9PWfzv8ezZlOYRl+r4IEn3LhtIom6nvBh1VRA/OeNku/bHscK8G
         3/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683599297; x=1686191297;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RH7duWPqB4oDIidMbdO3CzyNtsIH+8Zk9AGEa5N9U+0=;
        b=aBtLtPvO7Dkj2+G5WfZwTNxHIlPBR+RGfrDaWc/wtMALcUqo+v+Z4XWiOXvjO91wmH
         9Wl7G1U4PmJDyhAtGxV3exSO6tPizs4KwHqiQV7Rd4e+wn2KYbDGpYkJriTkEVd4vjsl
         oTWG3bnjjtsmWN1oop7Y1Yjh72pzTnjFBlOz3lYx737yNzDr2Ah9r0/uLU4jy8iQ8WNP
         jxOcZSk8Ij3XMsW3u/O7I62QfE/pN8p+hiLRrsOX0vazXrdDYNmuZbWiYBRfaxF+gAyV
         4vxwZWmehjQq6E6Tvse9FAUOi9+7OqOdjifpvmOOt/+yqKMDxfFzSJmjX4TwMIiYM4XB
         rVzw==
X-Gm-Message-State: AC+VfDzm8HAYX/oc9HCiL93is4e7A1nm0J7rUEceID+qIPyI6c9uS9Ln
	MMDFqBSN9m2+hhbXqV4K6dSlpE6KaGE=
X-Google-Smtp-Source: ACHHUZ6BJwgUIN0n+P/dmHGdda7ZR3hkK9M1gP79rHdfL++MYghVAfWADVzCQqDb6a1yIciObvb3+w==
X-Received: by 2002:a05:6a00:1383:b0:63b:599b:a2e6 with SMTP id t3-20020a056a00138300b0063b599ba2e6mr16926393pfg.27.1683599297367;
        Mon, 08 May 2023 19:28:17 -0700 (PDT)
Received: from localhost (58-6-235-78.tpgi.com.au. [58.6.235.78])
        by smtp.gmail.com with ESMTPSA id j22-20020aa78dd6000000b0063efe2f3ecdsm582551pfr.204.2023.05.08.19.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 19:28:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 May 2023 12:28:11 +1000
Message-Id: <CSHE51ANA8MD.3G9CYGHI75ZK9@wheely>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 08/12] powerpc: Annotate accesses to ipi message flags
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.14.0
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-9-rmclure@linux.ibm.com>
In-Reply-To: <20230508020120.218494-9-rmclure@linux.ibm.com>
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
Cc: arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon May 8, 2023 at 12:01 PM AEST, Rohan McLure wrote:
> IPI message flags are observed and consequently consumed in the
> smp_ipi_demux_relaxed function, which handles these message sources
> until it observes none more arriving. Mark the checked loop guard with
> READ_ONCE, to signal to KCSAN that the read is known to be volatile, and
> that non-determinism is expected.

smp_muxed_ipi_set_message() doesn't need a WRITE_ONCE()?

Thanks,
Nick

>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
>  arch/powerpc/kernel/smp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 6b90f10a6c81..00b74d66b771 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -348,7 +348,7 @@ irqreturn_t smp_ipi_demux_relaxed(void)
>  		if (all & IPI_MESSAGE(PPC_MSG_NMI_IPI))
>  			nmi_ipi_action(0, NULL);
>  #endif
> -	} while (info->messages);
> +	} while (READ_ONCE(info->messages));
> =20
>  	return IRQ_HANDLED;
>  }
> --=20
> 2.37.2

