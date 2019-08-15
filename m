Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EADAE8F723
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 00:42:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468hKG6L36zDq9R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 08:42:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468hHK3jqvzDrB4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 08:40:25 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id o101so7900137ota.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 15:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5N0BrmR1Tjy4UAxxe/8xM6uCYUxnCI+4Zt+Yt4/wBa0=;
 b=II31cxqE8y1NKxqbaFQD2nRAiLj7zfp2xClP/BXjl6Tcz8UFFDcMn0lmw3mGCZVIog
 rFAOStDHVrAnGN0DhbyfoegyyPnpbg2V1n6IeiTjTneaRdqteNhAKaxXfM+XjZ0dcas0
 5iTWUPgb2lJ3lABz1HDfHhNk7+o/GdOE51RzOg8VFpIoykYrR4plaOIGguKKgts0BW+T
 jDBT7ABTo0KPNGBjg5qWJSfHSmFvljCh8ChiiGhQr6Kfkp6272YRy9hxsqrPN0SSCnUu
 u3WKN9bAlawNgqKsvTRsvqhn56oOX5HigKW3beP5SnYvcByfQFN1c5O7CdhHrvO4e8B0
 mahg==
X-Gm-Message-State: APjAAAWxgd177xQiFwB0lwG7FsEp04ac5bTXZxCjBq3ktpODXll/ljpb
 5vcieuvKw2efw10gpvEkpmWdlS2Zw7s=
X-Google-Smtp-Source: APXvYqwgIKBBKYEEzyhJ1l4jgP7FXm5eUK9Xo6Wy/c6Hp6B2rg0dCqhgAKO7ZoQiBaKI2RMvuDa56Q==
X-Received: by 2002:a9d:65ca:: with SMTP id z10mr4886677oth.167.1565908822492; 
 Thu, 15 Aug 2019 15:40:22 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com.
 [209.85.167.173])
 by smtp.gmail.com with ESMTPSA id g7sm1478076otp.20.2019.08.15.15.40.21
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2019 15:40:21 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id k22so3417974oiw.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 15:40:21 -0700 (PDT)
X-Received: by 2002:a54:4191:: with SMTP id 17mr2851640oiy.175.1565908820908; 
 Thu, 15 Aug 2019 15:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190814072649.8237-1-yinbo.zhu@nxp.com>
 <20190814072649.8237-2-yinbo.zhu@nxp.com>
In-Reply-To: <20190814072649.8237-2-yinbo.zhu@nxp.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Thu, 15 Aug 2019 17:40:09 -0500
X-Gmail-Original-Message-ID: <CADRPPNSW4A0gkbzcPD=y-J_YHSnbAgP7p=RQnS6i0U-Ze=L6qA@mail.gmail.com>
Message-ID: <CADRPPNSW4A0gkbzcPD=y-J_YHSnbAgP7p=RQnS6i0U-Ze=L6qA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] soc: fsl: guts: Add definition for LS1028A
To: Yinbo Zhu <yinbo.zhu@nxp.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Catalin Horghidan <catalin.horghidan@nxp.com>, linux-mmc@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rajesh Bhagat <rajesh.bhagat@nxp.com>,
 Alison Wang <alison.wang@nxp.com>, Ashish Kumar <Ashish.Kumar@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Amit Jain <amit.jain_1@nxp.com>,
 Alex Marginean <alexandru.marginean@nxp.com>,
 lkml <linux-kernel@vger.kernel.org>,
 Rajat Srivastava <rajat.srivastava@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>,
 Jiafei Pan <jiafei.pan@nxp.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Xiaobo Xie <xiaobo.xie@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 14, 2019 at 2:26 AM Yinbo Zhu <yinbo.zhu@nxp.com> wrote:
>
> Adding compatible string "ls1028a-dcfg" to initialize guts driver
> for ls1028 and SoC die attribute definition for LS1028A
>
> Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>

Applied for next.

> ---
>  drivers/soc/fsl/guts.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
> index 1ef8068c8dd3..34810f9bb2ee 100644
> --- a/drivers/soc/fsl/guts.c
> +++ b/drivers/soc/fsl/guts.c
> @@ -102,6 +102,11 @@ static const struct fsl_soc_die_attr fsl_soc_die[] = {
>           .svr          = 0x87360000,
>           .mask         = 0xff3f0000,
>         },
> +       /* Die: LS1028A, SoC: LS1028A */
> +       { .die          = "LS1028A",
> +         .svr          = 0x870b0000,
> +         .mask         = 0xff3f0000,
> +       },
>         { },
>  };
>
> @@ -224,6 +229,7 @@ static const struct of_device_id fsl_guts_of_match[] = {
>         { .compatible = "fsl,ls1012a-dcfg", },
>         { .compatible = "fsl,ls1046a-dcfg", },
>         { .compatible = "fsl,lx2160a-dcfg", },
> +       { .compatible = "fsl,ls1028a-dcfg", },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, fsl_guts_of_match);
> --
> 2.17.1
>
