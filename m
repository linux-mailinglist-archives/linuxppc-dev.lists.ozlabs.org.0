Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D46D274D4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 01:27:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwyCH08jmzDqXv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 09:27:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwy9S0rtnzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 09:26:02 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id n61so17244114ota.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 16:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SamQd9yumyVgToTjIG4vxblKvHqR/B5AoVapHfT4xTw=;
 b=kyEB4OCJUp85fjy4HAPe0sO7mc782dtNY5Nwpn/ME7osSXZB35EbG28RFTthn9Tkzo
 SPgOBy9ktSQBvvc2ZyD0EduelCeSs087tP+pOr0ULa/SS1TTNQrghbsB9oDiAF8rWtyC
 WgiVQelxgm+Vn3zQIVWaxbMFxtWglb0lAGScLQDVD7L0U42FEkR04/RO7ipaSAPnMQoz
 pwfzY667Y03WIy3n2qXwAkyaSA8xF7PqhQUrRPfTFLgk0yhciUy5ugZFJSLL/mFr7vPi
 niMdT6d7p7dgGX9SK5CCXfQQqExwiNqUtntmpDPtsDXlBOFWkISRNir42jMgUgpsizI8
 ctKA==
X-Gm-Message-State: AOAM532blamM2uPZsp+GwzNJx2PvLO7mVbAAT3lrXnaQkTSEWwC8j2e1
 ooeRuZNjNxOOotjOzPb0/B8rNV11yPvMjw==
X-Google-Smtp-Source: ABdhPJzBT93dypu3UQ8j1lGUKz6DOgfL/4LvhbhbL3SarpduJI3ieIy3sOvAOa6Md2t03IywPZ/GHQ==
X-Received: by 2002:a05:6830:164c:: with SMTP id
 h12mr4044107otr.48.1600817159997; 
 Tue, 22 Sep 2020 16:25:59 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com.
 [209.85.210.47])
 by smtp.gmail.com with ESMTPSA id 187sm7911482oie.42.2020.09.22.16.25.59
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 16:25:59 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id o8so17255954otl.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 16:25:59 -0700 (PDT)
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr4552241oti.63.1600817158862;
 Tue, 22 Sep 2020 16:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200804135644.58878-1-wanghai38@huawei.com>
In-Reply-To: <20200804135644.58878-1-wanghai38@huawei.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 22 Sep 2020 18:25:46 -0500
X-Gmail-Original-Message-ID: <CADRPPNSph1VrSgM-_p+in0GqzXi5AKrxCf4SamYmAfB3FOy0Eg@mail.gmail.com>
Message-ID: <CADRPPNSph1VrSgM-_p+in0GqzXi5AKrxCf4SamYmAfB3FOy0Eg@mail.gmail.com>
Subject: Re: [PATCH -next] soc: fsl: qe: Remove unnessesary check in
 ucc_set_tdm_rxtx_clk
To: Wang Hai <wanghai38@huawei.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 4, 2020 at 9:04 AM Wang Hai <wanghai38@huawei.com> wrote:
>
> Fix smatch warning:
>
> drivers/soc/fsl/qe/ucc.c:526
>  ucc_set_tdm_rxtx_clk() warn: unsigned 'tdm_num' is never less than zero.
>
> 'tdm_num' is u32 type, never less than zero.
>
> Signed-off-by: Wang Hai <wanghai38@huawei.com>

Applied for next.  Thanks.

> ---
>  drivers/soc/fsl/qe/ucc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/fsl/qe/ucc.c b/drivers/soc/fsl/qe/ucc.c
> index cac0fb7693a0..21dbcd787cd5 100644
> --- a/drivers/soc/fsl/qe/ucc.c
> +++ b/drivers/soc/fsl/qe/ucc.c
> @@ -523,7 +523,7 @@ int ucc_set_tdm_rxtx_clk(u32 tdm_num, enum qe_clock clock,
>
>         qe_mux_reg = &qe_immr->qmx;
>
> -       if (tdm_num > 7 || tdm_num < 0)
> +       if (tdm_num > 7)
>                 return -EINVAL;
>
>         /* The communications direction must be RX or TX */
> --
> 2.17.1
>
