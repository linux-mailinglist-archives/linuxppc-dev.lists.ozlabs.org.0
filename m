Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13834274C61
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 00:45:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwxG10dxKzDqX6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 08:44:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwxCx1s0kzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 08:43:08 +1000 (AEST)
Received: by mail-ot1-f68.google.com with SMTP id q21so17176102ota.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 15:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ujRFzrNNNsh5z7M9S1n/AHFDhC/eiAX1cUWK4oCO5/o=;
 b=jlsgRVPAQVv7Ulp4Zcclri1kFIIbYWincleLOJJYEcFWeYrZFtSGGKUM4i0o9UfXdI
 PsdqDWspsTPkYyCPVPMmJwKZrCsDa8kWNKp711nAwGhJB5hZYwPbonfuAGYlewJYEdiP
 lJ9RHvcmZw19n1bQCxrt64l5lA22WeSlRT/Dokv88Mh4DcxuTck+lpnlCxWBBt5dbzo/
 w79YxxxKyzc62BFoyQIGJSdOWwwWcm55Aw/RkMnnFIiDYSLm6+5WLfA21MicFi2bFtFw
 cZsLszXU1tXORxn4Tp17/faebgh4tciUbaogzD93BrUjkl6rJOc6AnQ4FLGLF401kGn4
 jQhw==
X-Gm-Message-State: AOAM530OS6LBejGkpM+jgBEE5dBz6LAILdWQSw6PRkSf2gUob/ZtYoK8
 76gf9nSpZtIVxLwH+J1+yhIyvVuHEzM=
X-Google-Smtp-Source: ABdhPJxktqTrv7dJDX5VbNNd/g3CWdCtmmkoVnARlyl4FVdMQq72WG9TnkvbkiCY6xSvxNDQHiEzsg==
X-Received: by 2002:a9d:6a19:: with SMTP id g25mr4395920otn.267.1600814585228; 
 Tue, 22 Sep 2020 15:43:05 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
 [209.85.210.54])
 by smtp.gmail.com with ESMTPSA id o9sm8626342oop.1.2020.09.22.15.43.04
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 15:43:04 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id o6so17184732ota.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 15:43:04 -0700 (PDT)
X-Received: by 2002:a05:6830:196:: with SMTP id
 q22mr4056424ota.221.1600814584178; 
 Tue, 22 Sep 2020 15:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200920202625.11377-1-krzk@kernel.org>
In-Reply-To: <20200920202625.11377-1-krzk@kernel.org>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 22 Sep 2020 17:42:52 -0500
X-Gmail-Original-Message-ID: <CADRPPNTJ0GfZX6Ms43o1oP8hpA-jbZLJuM7gp8_XY97TtX+mog@mail.gmail.com>
Message-ID: <CADRPPNTJ0GfZX6Ms43o1oP8hpA-jbZLJuM7gp8_XY97TtX+mog@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qbman: Fix return value on success
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Roy Pledge <roy.pledge@nxp.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 20, 2020 at 3:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On error the function was meant to return -ERRNO.  This also fixes
> compile warning:
>
>   drivers/soc/fsl/qbman/bman.c:640:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
>
> Fixes: 0505d00c8dba ("soc/fsl/qbman: Cleanup buffer pools if BMan was initialized prior to bootup")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied for next.  Thanks.

> ---
>  drivers/soc/fsl/qbman/bman.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/fsl/qbman/bman.c b/drivers/soc/fsl/qbman/bman.c
> index f4fb527d8301..c5dd026fe889 100644
> --- a/drivers/soc/fsl/qbman/bman.c
> +++ b/drivers/soc/fsl/qbman/bman.c
> @@ -660,7 +660,7 @@ int bm_shutdown_pool(u32 bpid)
>         }
>  done:
>         put_affine_portal();
> -       return 0;
> +       return err;
>  }
>
>  struct gen_pool *bm_bpalloc;
> --
> 2.17.1
>
