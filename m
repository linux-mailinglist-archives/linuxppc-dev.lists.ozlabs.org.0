Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F231BA612
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 16:16:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499n056qyCzDqZj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 00:16:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=osEHPWYd; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499mw26lVVzDqDQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 00:13:22 +1000 (AEST)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6277F206D4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 14:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587996800;
 bh=Xg8u6B1gRKJJyhc2ghpbZWMsF25bOlRNgkDeAPMsyhQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=osEHPWYdXxkYQ78QupC0ZbxmDHM4nKIFYj+hceaPPcun89vocxPgKHy9Qq40zoUbk
 QrSGQhV62SZsNwG4VYijAjgIkna3Zq5CZv8uSHXvJpUm0nEf2beyNZ5DWzkUmgTNml
 Q4e1Vc2b+Xxgtf65Jn47m5wnj59udKDIW1tjL3uk=
Received: by mail-qt1-f178.google.com with SMTP id k12so14338310qtm.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 07:13:20 -0700 (PDT)
X-Gm-Message-State: AGi0PuZGkUlacK7uYFILMjLrjzrhT3trvunCPSBGXFsZCWLySRn2rnRX
 aS9wOw3Juf08B/d7/6cmYV2KNylvSPZ2cUL65Q==
X-Google-Smtp-Source: APiQypIvO+0zNT12ohswoL68dXvl6sO1zbOdn5h7ZevGpjPFRFXJndduPs3pSHS2ibmtQnJF8M8fsotgSW9W3De7vbk=
X-Received: by 2002:ac8:7cba:: with SMTP id z26mr23458821qtv.143.1587996798916; 
 Mon, 27 Apr 2020 07:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200420030538.101696-1-wenhu.wang@vivo.com>
In-Reply-To: <20200420030538.101696-1-wenhu.wang@vivo.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 27 Apr 2020 09:13:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK3fpM_tUjHvAMbNzf_nry_iORLXaQBFC8xDK+mxhHDRQ@mail.gmail.com>
Message-ID: <CAL_JsqK3fpM_tUjHvAMbNzf_nry_iORLXaQBFC8xDK+mxhHDRQ@mail.gmail.com>
Subject: Re: [PATCH v2,
 RESEND] misc: new driver sram_uapi for user level SRAM access
To: Wang Wenhu <wenhu.wang@vivo.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, kernel@vivo.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 19, 2020 at 10:06 PM Wang Wenhu <wenhu.wang@vivo.com> wrote:
>
> A generic User-Kernel interface that allows a misc device created
> by it to support file-operations of ioctl and mmap to access SRAM
> memory from user level. Different kinds of SRAM alloction and free
> APIs could be registered by specific SRAM hardware level driver to
> the available list and then be chosen by users to allocate and map
> SRAM memory from user level.
>
> It is extremely helpful for the user space applications that require
> high performance memory accesses, such as embedded networking devices
> that would process data in user space, and PowerPC e500 is a case.
>
> Signed-off-by: Wang Wenhu <wenhu.wang@vivo.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Scott Wood <oss@buserror.net>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
> Changes since v1: addressed comments from Arnd
>  * Changed the ioctl cmd definitions using _IO micros
>  * Export interfaces for HW-SRAM drivers to register apis to available list
>  * Modified allocation alignment to PAGE_SIZE
>  * Use phys_addr_t as type of SRAM resource size and offset
>  * Support compat_ioctl
>  * Misc device name:sram
>
> Note: From this on, the SRAM_UAPI driver is independent to any hardware
> drivers, so I would only commit the patch itself as v2, while the v1 of
> it was wrapped together with patches for Freescale L2-Cache-SRAM device.
> Then after, I'd create patches for Freescale L2-Cache-SRAM device as
> another series.

There's work to add SRAM support to dma-buf heaps[1]. Take a look and
see if that works for you.

Rob

[1] https://lore.kernel.org/lkml/20200424222740.16259-1-afd@ti.com/
