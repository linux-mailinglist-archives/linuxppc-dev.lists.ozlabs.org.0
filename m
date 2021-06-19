Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 993A73AD6F1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 05:14:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6LWP2mY7z3c31
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 13:14:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WP5CJmHV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=aoo4=ln=gmail.com=npiggin@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WP5CJmHV; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6LVx4hYKz2yX8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 13:14:32 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4G6LVv5XW1z9sWk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 13:14:31 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G6LVv5CgJz9sWM; Sat, 19 Jun 2021 13:14:31 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WP5CJmHV; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4G6LVv2h3tz9sRf;
 Sat, 19 Jun 2021 13:14:29 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id z26so9183298pfj.5;
 Fri, 18 Jun 2021 20:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=mTHZNg7cpWdkls8v1WHN7PjayCDBfVBeex3S4NLrkGQ=;
 b=WP5CJmHVv/Q8dp3TEeFVAMyAQVAuAGI25zjRNLS6IAKLrOkAnMKIxCSBIgK4VABj+e
 k3+MGYsHrxWAsx7Rtg7Vz5BRlYvOxblAJonXlSIh9Xyx3Fn0iiU30tV1ZO9sA+jQJ2nz
 JAWeO0odh5wBV5r1Lh5mDz1lqjjeyasbkshN4L9MbDkEOXgNQm2XsJQvsOLgi1DWpqYu
 wDRQM/ujY4BO3lJTzR+p9E3xwLKj5punV/G+QaGGxFsWUynsizDGtDuwjE3MGmhyUt9l
 h9jw8o2fHRSK6qGQXujw7UC2KYjcFJnykoiovhpBW9U/39iW5JZNdAL15waR3MteUapr
 3isA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=mTHZNg7cpWdkls8v1WHN7PjayCDBfVBeex3S4NLrkGQ=;
 b=WCioz3KEzi4kssnNNCatZOdXv1q9Ub3HNLUimWulyofunW3hBmyM3RpSvv2vy5m0mY
 Pot+RWy9iR8nTVv/lbcgyyKj6rUbrcdZXRFWj/pRbox/5CfT2ZCLtkWfIK5JE7wzE1JL
 S4Gt6HXQa8ASEyoe/lqnWTRgWMTwJx/GCpI9zzo0pNSe2bBfAS5lPKJZ5M4j9uFEcDuJ
 HNl0GZCO6qnesRilQKJOclqtEZx+WmMBAoNq8sWDwpahN3LWFH87odqMJumTBefG1dM1
 454Mi4Be7Fr6wEf0HfBfQEfXhsGjgji72mcpt4EuTGmu5Jq0Cz4JTYtQbm65Vc7pulLh
 TInQ==
X-Gm-Message-State: AOAM5307/1Yn9OkmPs+uQO8EheLbuXrKY9ooThPBwfptD+L7MvXMqI4M
 7OXpfD4vVxPlHhFAO6qBsLp+e8C61yw=
X-Google-Smtp-Source: ABdhPJzqeAFnUMRJ3k0JsXhBlL0o3HdWb35IBhfy8VG6WcGgTj8yrSpia71+txp2W0B0D2c5qF/oKg==
X-Received: by 2002:a62:b40c:0:b029:2de:4a1e:a753 with SMTP id
 h12-20020a62b40c0000b02902de4a1ea753mr8141259pfn.64.1624072466128; 
 Fri, 18 Jun 2021 20:14:26 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id v4sm5546246pjh.54.2021.06.18.20.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:14:25 -0700 (PDT)
Date: Sat, 19 Jun 2021 13:14:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 8/9] powerpc/boot: Fixup device-tree on little endian
To: linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@ozlabs.org>
References: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
 <YMwXrPT8nc4YUdJ9@thinks.paulus.ozlabs.org>
In-Reply-To: <YMwXrPT8nc4YUdJ9@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1624072300.48m01kmzr0.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of June 18, 2021 1:49 pm:
> From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>=20
> This fixes the core devtree.c functions and the ns16550 UART backend.

Looks okay. Can sparse be run on arch/powerpc/boot? Would be nice to
get that working and endian annotations at some point.

> @@ -240,7 +249,6 @@ static int dt_xlate(void *node, int res, int reglen, =
unsigned long *addr,
>  		return 0;
> =20
>  	dt_get_reg_format(parent, &naddr, &nsize);
> -
>  	if (nsize > 2)
>  		return 0;
> =20

Unrelated hunk.

> @@ -278,7 +286,6 @@ static int dt_xlate(void *node, int res, int reglen, =
unsigned long *addr,
> =20
>  		offset =3D find_range(last_addr, prop_buf, prev_naddr,
>  		                    naddr, prev_nsize, buflen / 4);
> -
>  		if (offset < 0)
>  			return 0;
> =20

And there.

> diff --git a/arch/powerpc/boot/ns16550.c b/arch/powerpc/boot/ns16550.c
> index b0da4466d419..f16d2be1d0f3 100644
> --- a/arch/powerpc/boot/ns16550.c
> +++ b/arch/powerpc/boot/ns16550.c
> @@ -15,6 +15,7 @@
>  #include "stdio.h"
>  #include "io.h"
>  #include "ops.h"
> +#include "of.h"
> =20
>  #define UART_DLL	0	/* Out: Divisor Latch Low */
>  #define UART_DLM	1	/* Out: Divisor Latch High */
> @@ -58,16 +59,20 @@ int ns16550_console_init(void *devp, struct serial_co=
nsole_data *scdp)
>  	int n;
>  	u32 reg_offset;
> =20
> -	if (dt_get_virtual_reg(devp, (void **)&reg_base, 1) < 1)
> +	if (dt_get_virtual_reg(devp, (void **)&reg_base, 1) < 1) {
> +		printf("virt reg parse fail...\r\n");
>  		return -1;
> +	}

Leftover debug.  Otherwise,

Acked-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick
