Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D373764AB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 13:47:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fc7wH5Xbsz307T
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 21:47:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=N/lqcnc7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N/lqcnc7; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fc7vr0w5pz2xfN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 21:46:45 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id h11so7627949pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 May 2021 04:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uR1cJZI3x3ph+ewlJwOwS07YkruOTk4an/PdVhtMkr8=;
 b=N/lqcnc7KQMPu+KrJo3SjocMaNEwCApyjgxnyQLW873BudWttiMLSpO4CUBq681LQL
 XBfOq5qyPexcbixQ6C3LY8k/dekbWv61aTSda52k3Jss+rBrxKEPxGKiiu0oci8iS+I3
 GfZ9D/GFQP157QsHBB7aYo1uT6L+ieQ09Iz5YldWpSOK4U3kRz39eqAaq56woDaBzEwW
 b22Lka5d7x5/A4PXygCls6CxhDGUo22iUBxMdctxDw2rszPIUw2bHJx56F4H7roRFrBS
 ULEr5IlntuCT5oNvY3yS4WlONi1CkH2oZO/boJi3YE+AvhgS4cITmZgJdFmTij450yCJ
 LjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uR1cJZI3x3ph+ewlJwOwS07YkruOTk4an/PdVhtMkr8=;
 b=e6cALQhyOiy/5U26jHZBsbPGCYUakfZe7I5Tw3tn7kFu8LtLP6N7BKmoYBARxFi9Eh
 p/JmhJxNXvOi9JZAWp4ad3elr86Q2NCOMwIe0ZdQoaSqacKFM4nGOoDyJihsGfV/9tXJ
 wtNjX94/wYDXP6l7+1v2KKOON/NB1EPxO2DChgYjLjca9Q0MdlKf2YGIHyapswGuE3uy
 Gw4JLZ09uod7EMSaw9NT3MZJeIJxaxVimQLvQLrn047CWIiZ+T92CkK8Mvpm4+1UJrCE
 rOYGTQ7w2QHX7dvNXnZAIt94skNDXusGVPDTm/UsMKEzo/djZmYjwjLi4YoPRj8O5KAK
 1yDA==
X-Gm-Message-State: AOAM531DvOhat8PCJhIXYooyoUp9ezYbnLgcbZZLY3QLHWMClQhzV6az
 XlB9dIV7CiBRdD2Exu2J4td66dndHuBsn2CQ5vU=
X-Google-Smtp-Source: ABdhPJyz37HmRfpOxF5mQuByQ13JMKLXTuCkq3L0IM/6cmbTE6aB/KmPmgneubUc0gs1GQQ1xr8QHMWXkkWhAUYArAo=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr9429849pgg.74.1620388002532; 
 Fri, 07 May 2021 04:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
 <20210507004047.4454-4-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20210507004047.4454-4-chris.packham@alliedtelesis.co.nz>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 7 May 2021 14:46:26 +0300
Message-ID: <CAHp75VcEzgKjOD6WQ1=YAwK_hhZr=XtcmXZL8rK78gb7iXDbDg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: mpc: implement erratum A-004447 workaround
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 7, 2021 at 3:40 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
> The P2040/P2041 has an erratum where the normal i2c recovery mechanism
> does not work. Implement the alternative recovery mechanism documented
> in the P2040 Chip Errata Rev Q.

Thanks.

> +static int i2c_mpc_wait_sr(struct mpc_i2c *i2c, int mask)
> +{
> +       int ret;
> +       u8 val;
> +
> +       ret = readb_poll_timeout(i2c->base + MPC_I2C_SR, val,
> +                                val & mask, 0, 100);
> +
> +       return ret;
> +}

So, now you may shrink it even further, i.e.

       void __iomem *sr = i2c->base + MPC_I2C_SR;
       u8 val;

       return readb_poll_timeout(sr, val, val & mask, 0, 100);

-- 
With Best Regards,
Andy Shevchenko
