Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3774C8BDA3D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 06:40:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYQZV5vTQz3ckN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 14:40:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.169; helo=mail-pf1-f169.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYQZ53M2jz3c1w
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 14:40:29 +1000 (AEST)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6f467fb2e66so2026493b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2024 21:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715056827; x=1715661627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGLcXpXfQB7UP2yJQ9aG+ammKIDK8VLtkTKX2sseVsw=;
        b=Mje1micQaUcY7ZiTQGMwX5veUh2luXT2fv2IDfmBJWpwDpUbueYGrvcGU34s0uUbOO
         vrRq7ICUdIkT1FHv4KAEnSZEfRKDREJi8GWW5vswSHAn6IGtJGfFIgtPMnFApoagBPfA
         7aAcEMXUhyyc1nX+p+778+tJEEKV7r79hQ2DvK/VTifx/ux/UUfoGBlbdkLucunn4x0L
         ADe+vbWn+rAwcIGKQbcdiaW8sUd8NpJvVZ/ppVswrixAkilI1YbCMacOLKE6Tswk+lDh
         4B+fi8UvNiVUS00ss7NzGhFKPF0gEMN+ICwGDqeALvvMox54c0ew179r4J9JfC/bwopd
         zQSA==
X-Forwarded-Encrypted: i=1; AJvYcCW8I2PcaoRXI7eeuyQMz3D5fd9ujBHa0swzODIilJY3IvkVrRPaxB9u89qXU2iwTHFnRLuiM2Nr7Oy62BH5afw73nR2ZhB+SrWk+LzJHw==
X-Gm-Message-State: AOJu0Ywhzal80xwjjqNoE+bXpCo6ZfganWDblYGxX6VZOgIVkcbEEJ2Y
	CRk6uTjYyQxBIpdUf411nFBrtQaHmG5FXg+62mDeqQKqeW9ze5IIM9n16k0qm5ra8Gpo8mwsRks
	NxQeMytsa6JB3ZO7ATON1Ugte3YQ=
X-Google-Smtp-Source: AGHT+IHiLizhGwF4eGXYOLN/AvZXFQ5be5OLPsFdc4WCc51CLXFzNfw6aTdsJYNpMwWQYv4+Dj4cvCa9ERL5Fjl2Yms=
X-Received: by 2002:a05:6a21:3994:b0:1ad:7e4e:428d with SMTP id
 ad20-20020a056a21399400b001ad7e4e428dmr17580223pzc.20.1715056827313; Mon, 06
 May 2024 21:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com> <20240506121906.76639-4-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240506121906.76639-4-atrajeev@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Mon, 6 May 2024 21:40:15 -0700
Message-ID: <CAM9d7ciKUQErzu1Y7FnWCryW15xUkyJLSt-Jez9h8TYgp-tLjw@mail.gmail.com>
Subject: Re: [PATCH V2 3/9] tools/perf: Fix a comment about multi_regs in
 extract_reg_offset function
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, acme@kernel.org, jolsa@kernel.org, akanksha@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 6, 2024 at 5:19=E2=80=AFAM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
> Fix a comment in function which explains how multi_regs field gets set
> for an instruction. In the example, "mov  %rsi, 8(%rbx,%rcx,4)", the
> comment mistakenly referred to "dst_multi_regs =3D 0". Correct it to use
> "src_multi_regs =3D 0"
>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung

> ---
>  tools/perf/util/annotate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> index f5b6b5e5e757..0f5e10654d09 100644
> --- a/tools/perf/util/annotate.c
> +++ b/tools/perf/util/annotate.c
> @@ -2093,7 +2093,7 @@ static int extract_reg_offset(struct arch *arch, co=
nst char *str,
>   *   mov  0x18, %r8      # src_reg1 =3D -1, src_mem =3D 0
>   *                       # dst_reg1 =3D r8, dst_mem =3D 0
>   *
> - *   mov  %rsi, 8(%rbx,%rcx,4)  # src_reg1 =3D rsi, src_mem =3D 0, dst_m=
ulti_regs =3D 0
> + *   mov  %rsi, 8(%rbx,%rcx,4)  # src_reg1 =3D rsi, src_mem =3D 0, src_m=
ulti_regs =3D 0
>   *                              # dst_reg1 =3D rbx, dst_reg2 =3D rcx, ds=
t_mem =3D 1
>   *                              # dst_multi_regs =3D 1, dst_offset =3D 8
>   */
> --
> 2.43.0
>
