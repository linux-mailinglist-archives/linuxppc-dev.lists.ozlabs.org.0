Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B905BFD3C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 05:44:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Dm3B6V7HzF66g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 15:44:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="KGrd5zOZ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Dm1939NpzF4HS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 15:42:36 +1100 (AEDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85FFB20730
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 04:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573792954;
 bh=g3rlB32/6gd8dD5fY3MmF2bhvO5L4Q8Y+YT4GjFr3wQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KGrd5zOZNBxWzcSvrPXyvSbFC3vxoGQoxybEK02Kveb4aW4JhvHNhVZ8hWxpFpRsY
 nMc+/3ukHPjrlhfLtZM4uxDLglMA/kI06ihg4EoH25/6ElqmesHF4JwyKppZ1mic7B
 H4tNC+rKqauChwU3xSHJPphJwawp0FskLwe2C62Q=
Received: by mail-qv1-f46.google.com with SMTP id s18so3344461qvr.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:42:34 -0800 (PST)
X-Gm-Message-State: APjAAAUUAs4VmHKArylf60RvPCVTGA3iv+Zg1zM4+K2HEjs4bqRa8Req
 s4ofVD51l7WNjde/ZKSFCTNPa88s59LS3lDikiM=
X-Google-Smtp-Source: APXvYqzhjv5G4OmRuommd+stX/u8tXaIf+kgtocwlFijjGY3iPO27FpXOJ5UgCEDdEl/zBvDultfDqkQncbaw+8Q4dM=
X-Received: by 2002:ad4:462d:: with SMTP id x13mr11789533qvv.105.1573792953648; 
 Thu, 14 Nov 2019 20:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-46-linux@rasmusvillemoes.dk>
In-Reply-To: <20191108130123.6839-46-linux@rasmusvillemoes.dk>
From: Timur Tabi <timur@kernel.org>
Date: Thu, 14 Nov 2019 22:41:55 -0600
X-Gmail-Original-Message-ID: <CAOZdJXUibQ6RM8O4CfkYBdGsg+LMcE2ZoZEQ4txn2yvquUWwCA@mail.gmail.com>
Message-ID: <CAOZdJXUibQ6RM8O4CfkYBdGsg+LMcE2ZoZEQ4txn2yvquUWwCA@mail.gmail.com>
Subject: Re: [PATCH v4 45/47] net/wan/fsl_ucc_hdlc: reject muram offsets above
 64K
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
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
Cc: netdev <netdev@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 8, 2019 at 7:04 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:

> diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
> index 8d13586bb774..f029eaa7cfc0 100644
> --- a/drivers/net/wan/fsl_ucc_hdlc.c
> +++ b/drivers/net/wan/fsl_ucc_hdlc.c
> @@ -245,6 +245,11 @@ static int uhdlc_init(struct ucc_hdlc_private *priv)
>                 ret = -ENOMEM;
>                 goto free_riptr;
>         }
> +       if (riptr != (u16)riptr || tiptr != (u16)tiptr) {

"riptr/tiptr > U16_MAX" is clearer.
