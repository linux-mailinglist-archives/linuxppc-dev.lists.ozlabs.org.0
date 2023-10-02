Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1567B5CA3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 23:46:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=philpotter-co-uk.20230601.gappssmtp.com header.i=@philpotter-co-uk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kpgVsyL1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzvfR1sQhz3cD1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 08:46:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=philpotter-co-uk.20230601.gappssmtp.com header.i=@philpotter-co-uk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=kpgVsyL1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=philpotter.co.uk (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=phil@philpotter.co.uk; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzvdZ0MyJz3cB6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 08:45:35 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-406618d080eso2485515e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Oct 2023 14:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20230601.gappssmtp.com; s=20230601; t=1696283130; x=1696887930; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dA79LkNYU7asBXwt/uQxW8bheOGwedQNE5Z+nFIVT0=;
        b=kpgVsyL1FZz7pVKhAFtPCp5Z2QC0Fhte+EN+1xHjMAeEp7mOsLYo6zOWAA3PNBOHmz
         gKBznB2FwlaxSVnL/SvpieJn+agfLlcItTBmFBw3/TJkpNnAydDkVOsp15r8+VgtBbeJ
         9CxUfKHjE+2nZsZ2oZGSaKgaIEGheHrJZoCavXc2gY4DaN+hk8k3UX5p0TMPn/M9myjn
         vyBWncHiZtYORWAUw165aHCTLLgkDGpXLAzYzxj5zP7Ah6uDIORVs7ns/yhm8bUToSJA
         3VgC3pWIQTqlx+pWqsVJOJ4vZawp4X9n+Yt2RDd2dQaX9p2GZ8hbLBG6kP0FsPcXjnLg
         TY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696283130; x=1696887930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dA79LkNYU7asBXwt/uQxW8bheOGwedQNE5Z+nFIVT0=;
        b=vnWweO5OEw82OZAH4Ua0Xb5LWuLCgjvLAPfOuVjM3qqdZE4cqwyH/4wWczC5Kxeprq
         rlgOWRACzdU/RBZv1zQtzjuYVq7KhH0nMbdH/LT11qXu7IAfFM2H7N/g854lMVhcmGKd
         Gt+yUfE4grnLWZhKnnlvwaR01G1Q9UTp+V6VoJUV8Js6dEnP0dIRKG7jAZejCawUZ7hN
         ro/k4EqVC/3Gwx2ZSeSDjb4X7lTaAEKqhwe8+1jKrFlKzQpAVMcWV+95DUE62ZWeLDYM
         7s4Bxsf6kqBhSwTQGkJwmvZ89SS5pAEQ0irN+gGrj9nfM/IxcYyZ9hoEFgaWWj6zld/b
         ufMQ==
X-Gm-Message-State: AOJu0Yzv+qO+T43V64Ual9lqHlgE22mdM2PLrl3BL/EAP8OvAiUdGvc4
	GOeWwtOEQaXyIQZymZmXl6A31Q==
X-Google-Smtp-Source: AGHT+IFQqDHrxS5nLVVcz3uYz3zBoh8PRAUblObfkXMiu+127hGE3d4cKV4jcsCeAwYclm/ssvuz7g==
X-Received: by 2002:a1c:6a05:0:b0:404:757e:c5ba with SMTP id f5-20020a1c6a05000000b00404757ec5bamr10282866wmc.26.1696283130281;
        Mon, 02 Oct 2023 14:45:30 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id a11-20020a05600c2d4b00b004065daba6casm7974630wmg.46.2023.10.02.14.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 14:45:29 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: devnull+j.granados.samsung.com@kernel.org
Subject: Re: [PATCH v2 01/15] cdrom: Remove now superfluous sentinel element from ctl_table array
Date: Mon,  2 Oct 2023 22:45:28 +0100
Message-ID: <20231002214528.15529-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-1-02dd0d46f71e@samsung.com>
References: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-1-02dd0d46f71e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: j.granados@samsung.com, Jason@zx2c4.com, rafael@kernel.org, joonas.lahtinen@linux.intel.com, clemens@ladisch.de, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, phil@philpotter.co.uk, song@kernel.org, edumazet@google.com, kys@microsoft.com, jirislaby@kernel.org, russell.h.weight@intel.com, wei.liu@kernel.org, sstabellini@kernel.org, minyard@acm.org, leon@kernel.org, linux-rdma@vger.kernel.org, airlied@gmail.com, steve.wahl@hpe.com, decui@microsoft.com, willy@infradead.org, jgg@ziepe.ca, linux-serial@vger.kernel.org, dgilbert@interlog.com, kuba@kernel.org, pabeni@redhat.com, intel-gfx@lists.freedesktop.org, keescook@chromium.org, arnd@arndb.de, haiyangz@microsoft.com, josh@joshtriplett.org, jani.nikula@linux.intel.com, linux-raid@vger.kernel.org, rodrigo.vivi@intel.com, xen-devel@lists.xenproject.org, openipmi-developer@lists.sourceforge.net, jgross@suse.com, tvrtko.ursulin@linux.intel.com, tytso@mit.edu, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, gregk
 h@linuxfoundation.org, dsahern@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, sudipm.mukherjee@gmail.com, oleksandr_tyshchenko@epam.com, mcgrof@kernel.org, robinmholt@gmail.com, daniel@ffwll.ch, netdev@vger.kernel.org, jejb@linux.ibm.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> From: Joel Granados <j.granados@samsung.com>
>
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which
> will reduce the overall build time size of the kernel and run time
> memory bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
>
> Remove sentinel element from cdrom_table
>
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  drivers/cdrom/cdrom.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index cc2839805983..a5e07270e0d4 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -3655,7 +3655,6 @@ static struct ctl_table cdrom_table[] = {
>  		.mode		= 0644,
>  		.proc_handler	= cdrom_sysctl_handler
>  	},
> -	{ }
>  };
>  static struct ctl_table_header *cdrom_sysctl_header;
>
>
> -- 
> 2.30.2


Hi Joel,

Looks good to me, many thanks. I'll send on for inclusion.

Reviewed-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
