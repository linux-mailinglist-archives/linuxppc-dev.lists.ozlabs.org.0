Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C54E7C41E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 22:52:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=AdzDbcK3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4p470Ctmz3cF1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 07:52:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=AdzDbcK3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=ndesaulniers@google.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4p3B50pgz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 07:51:17 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso5755005f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 13:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696971070; x=1697575870; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMvNgoqd6YMY6PytxtLuyuPyCuqVe/N25XtwaEAPuzs=;
        b=AdzDbcK3AEXsxkGHzPo3eaoGTgT7/G5Dpu4hUY9TPucv/Trq3DWvyw77+xLL2J3aS/
         oMbueQHSaqOEt/Yvlj8GCj2AFyRjFSCOowR6NgwI1CzSonyRyRKbQ9Wfe0AXWLc4UC/b
         luId94QKDeHEomvulTTMh2C1FEKh+Ky6pK3PF+v7oTqW0Df1+ulMZio5m95WOTyPiBPr
         bwNy/jFsBKPIW6+ijBMgwgARoDdOWDGm1pbt5h1g+tgpMg/apJ8Y09QIFKWn7hOPPcLh
         X4t+tKK3HfZMcZgoxWJydcC1IngFRzHpTIG5Cz56q6FqWpuzukVB0ByA00J7dVHqWDOt
         MM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696971070; x=1697575870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMvNgoqd6YMY6PytxtLuyuPyCuqVe/N25XtwaEAPuzs=;
        b=NccRIY6htg3QS7AKNT5/gV2rdN8EJxdfhRH9ukD4YuwEQZ/4SoQdLhni9zdKL2yXmu
         LUx5dLqJiNqB44OeJ9IqA/nua1dnB58fuRnCp1T1ffBv+hImXxbtltrS5MMgvSOGwnNP
         WxFnQik3PjG7LfRLAFToJV6iJDrjr47nGynj7rHNHs+h8rlA3As2MpWuGIT/v5Agv2yJ
         LoV50I9Hj9B4OgTxPvc3BVvgzhcqR7oK6yLk0nu/iUU6DquCQhSCTFIHe9YFal4udvw9
         hskamxupzd+Yiyqp7Y69XHtJ+aro+FzIz+y9N7moN5hVirN4j5hMB2QEzScYHrB5+nPn
         ZZxw==
X-Gm-Message-State: AOJu0YxNLpKftY4JBcySmDqfqQf+ygIKn/4G/Z2CZ/bO1nmCD9J+Xk20
	kxP0G1DLsdaCp9yV9eeop1oxIxz0l6BG8fb3f7a4pg==
X-Google-Smtp-Source: AGHT+IFD5aFZr73w4wpXqWke4TyoAYdTiGQEP1nzTNLXm0gTwIHlIeUCxqfh3wqRsquyDHBiotWE1pLg+3EkY78tg1Q=
X-Received: by 2002:adf:e788:0:b0:31c:70b0:426b with SMTP id
 n8-20020adfe788000000b0031c70b0426bmr17483743wrm.63.1696971070288; Tue, 10
 Oct 2023 13:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231010-ibmvfc-fix-bitfields-type-v1-1-37e95b5a60e5@kernel.org>
In-Reply-To: <20231010-ibmvfc-fix-bitfields-type-v1-1-37e95b5a60e5@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 10 Oct 2023 13:50:55 -0700
Message-ID: <CAKwvOdksaN1j_y4sVGZYudt3920zE8oXfwy7=x9FdBXiaK_ZUA@mail.gmail.com>
Subject: Re: [PATCH] scsi: ibmvfc: Use 'unsigned int' for single-bit bitfields
 in 'struct ibmvfc_host'
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: tyreld@linux.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, trix@redhat.com, jejb@linux.ibm.com, llvm@lists.linux.dev, patches@lists.linux.dev, brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 10, 2023 at 1:32=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Clang warns (or errors with CONFIG_WERROR=3Dy) several times along the
> lines of:
>
>   drivers/scsi/ibmvscsi/ibmvfc.c:650:17: warning: implicit truncation fro=
m 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bi=
t-bitfield-constant-conversion]
>     650 |                 vhost->reinit =3D 1;
>         |                               ^ ~
>
> A single-bit signed integer bitfield only has possible values of -1 and
> 0, not 0 and 1 like an unsigned one would. No context appears to check
> the actual value of these bitfields, just whether or not it is zero.
> However, it is easy enough to change the type of the fields to 'unsigned
> int', which keeps the same size in memory and resolves the warning.
>
> Fixes: 5144905884e2 ("scsi: ibmvfc: Use a bitfield for boolean flags")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/scsi/ibmvscsi/ibmvfc.h | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/scsi/ibmvscsi/ibmvfc.h b/drivers/scsi/ibmvscsi/ibmvf=
c.h
> index 331ecf8254be..745ad5ac7251 100644
> --- a/drivers/scsi/ibmvscsi/ibmvfc.h
> +++ b/drivers/scsi/ibmvscsi/ibmvfc.h
> @@ -892,15 +892,15 @@ struct ibmvfc_host {
>         int init_retries;
>         int discovery_threads;
>         int abort_threads;
> -       int client_migrated:1;
> -       int reinit:1;
> -       int delay_init:1;
> -       int logged_in:1;
> -       int mq_enabled:1;
> -       int using_channels:1;
> -       int do_enquiry:1;
> -       int aborting_passthru:1;
> -       int scan_complete:1;
> +       unsigned int client_migrated:1;
> +       unsigned int reinit:1;
> +       unsigned int delay_init:1;
> +       unsigned int logged_in:1;
> +       unsigned int mq_enabled:1;
> +       unsigned int using_channels:1;
> +       unsigned int do_enquiry:1;
> +       unsigned int aborting_passthru:1;
> +       unsigned int scan_complete:1;
>         int scan_timeout;
>         int events_to_log;
>  #define IBMVFC_AE_LINKUP       0x0001
>
> ---
> base-commit: b6f2e063017b92491976a40c32a0e4b3c13e7d2f
> change-id: 20231010-ibmvfc-fix-bitfields-type-971a07c64ec6
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>


--=20
Thanks,
~Nick Desaulniers
