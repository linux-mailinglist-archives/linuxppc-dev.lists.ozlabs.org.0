Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DED63A7381
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 03:52:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3rtC6qS1z3c7J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 11:52:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Euy4kMNQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Euy4kMNQ; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3rsl0f4Tz2xtj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 11:52:10 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id c18so25375819qkc.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 18:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oWnRdMbzlZ6uCg7kHZeS+mvPo3u6fozJ1gqjgHsyntI=;
 b=Euy4kMNQAlanaDv3HRhIEsHzxm91ku2c5m4d+B6e+Fn3yuOlPYPBOy/4jYmPapq+FH
 sEySXpcOGBuK2bxv79MRMRn2RXEGF7t5Ia2zw4PbIefMgbfsbYH6kRu+xDujLPlxr/n3
 Hl6P5pFW4mSXu6mEk2MZXkI+jDwsFtYwF2Zgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oWnRdMbzlZ6uCg7kHZeS+mvPo3u6fozJ1gqjgHsyntI=;
 b=MK7K/DiEyd76VWPn0G/ijIieap2J10EJH4u3J4O+ki2D95m1fV+tqw+qZNFm3wHiCq
 eRCbE88uebTV+LSVZzLGYgT+rHW9Eo5+j3jC7C/qDmNVeU9VWTcSNlNNvzsmAIJP8N9J
 5EIyr2Z/i9hNv+BtvgHT81ywqxWeD20hzgybfge3uGRYp3nV1FDb/wod80H1PHNiRgfV
 Cq44pnKdxLL3Me8fDRK9+UOtU6bdFABsz0cGKCX+M5B+fuuNWbagkqBux1duLN8UW4yE
 KcP5Cu9EHmMijQz+PmB3SMWsxAvitrrmH/v3JMLzaOSxvAcBPZT0uHYiZhuchfePpTyI
 4+yw==
X-Gm-Message-State: AOAM531QKYA8djisKWldGOP6Jf179IJrRaDCTHQP2JsZSDgRzpSqey1w
 dxmmyV2/7SU2YkgcWhlEK+eBRvp37SjWmWOzQjY=
X-Google-Smtp-Source: ABdhPJylWwTMT1km2sa1BNaT0ATeITR5ItXM/dCgRFMmqLyJFBk85MzUpVFQfZT5ilFgEOotQH+KnaCtXRPVb0QGNFY=
X-Received: by 2002:a37:9b03:: with SMTP id d3mr18571270qke.273.1623721926602; 
 Mon, 14 Jun 2021 18:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210612003128.372238-1-leoyang.li@nxp.com>
In-Reply-To: <20210612003128.372238-1-leoyang.li@nxp.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 15 Jun 2021 01:51:54 +0000
Message-ID: <CACPK8XfUiiBM=KQiqSJ5uSUpOHLTp_wxhNyEw-gYkTBsZjbZVg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: fsl: properly remove remnant of MXC support
To: Li Yang <leoyang.li@nxp.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, ran.wang_1@nxp.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 12 Jun 2021 at 00:31, Li Yang <leoyang.li@nxp.com> wrote:
>
> Commit a390bef7db1f ("usb: gadget: fsl_mxc_udc: Remove the driver")
> didn't remove all the MXC related stuff which can cause build problem
> for LS1021 when enabled again in Kconfig.  This patch remove all the
> remnants.
>
> Signed-off-by: Li Yang <leoyang.li@nxp.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Will you re-submit the kconfig change once this is merged?

Cheers,

Joel
