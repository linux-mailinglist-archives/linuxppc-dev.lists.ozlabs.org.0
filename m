Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2596AB01
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 16:53:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45p3Kt50D2zDqfP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 00:53:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="cJpVGUzw"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45p3Hr6yNGzDqcR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 00:51:20 +1000 (AEST)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D126217F9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563288677;
 bh=sonO2Wj/dB2WVkbnigGOIptZBiYzU9g2oAVvNNhm8N0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cJpVGUzwvpQrBfw5VxnjM7fZDMqN8buukyY5uNJV0ilBSNzK8xmxbSP8KeFgOPVGk
 CdhPYLcquPdpNPv9IfGMnbk93gK1YgS3rEW3NEieCmVZ/yyatbJnN9K/XZrO4tC0sv
 vpJ81lt0Z15VjbKndmSpPGS7eGfx6pNckGHuM6H8=
Received: by mail-oi1-f182.google.com with SMTP id m202so15777788oig.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 07:51:17 -0700 (PDT)
X-Gm-Message-State: APjAAAVODdrWMQWx9dxpKAl9r0rE6LCZPOKPDi0/buUVqGL0LMwxPuX7
 qHYVmVoPt1oX3/WlmjmDwtjVONGiUPQc/0qEQts=
X-Google-Smtp-Source: APXvYqznotTEvyaymhJh/wAMu0w2H5gcuDv5j22SZvycyNMyxsk7XBmOnJ7QXnjodYkrV1FF1kduEHzUtbpafqpVCNU=
X-Received: by 2002:aca:1b0c:: with SMTP id b12mr2605814oib.123.1563288676578; 
 Tue, 16 Jul 2019 07:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
 <20190712022018.27989-2-alex.shi@linux.alibaba.com>
In-Reply-To: <20190712022018.27989-2-alex.shi@linux.alibaba.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 16 Jul 2019 16:51:05 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcnMM=h9-MW4qg4OTxaY5eBQ=4tH=Gbd3tSuckFvSOPcw@mail.gmail.com>
Message-ID: <CAJKOXPcnMM=h9-MW4qg4OTxaY5eBQ=4tH=Gbd3tSuckFvSOPcw@mail.gmail.com>
Subject: Re: [PATCH 02/12] Documentation/arm: repointer docs to
 Documentation/arch/arm
To: Alex Shi <alex.shi@linux.alibaba.com>
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
Cc: linux-s390@vger.kernel.org, linux-fbdev@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-parisc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-serial@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
 linux-crypto@vger.kernel.org, kvm@vger.kernel.org, linux-input@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Jul 2019 at 04:20, Alex Shi <alex.shi@linux.alibaba.com> wrote:
>
> Since we move 'arm/arm64' docs to Documentation/arch/{arm,arm64} dir,
> redirect the doc pointer to them.
>
> Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> ---
>  Documentation/arch/arm/Samsung-S3C24XX/GPIO.txt    |  2 +-
>  .../arch/arm/Samsung-S3C24XX/Overview.txt          |  6 +++---
>  Documentation/arch/arm/Samsung/GPIO.txt            |  2 +-
>  Documentation/arch/arm/Samsung/Overview.txt        |  4 ++--
>  Documentation/devicetree/bindings/arm/xen.txt      |  2 +-
>  Documentation/devicetree/booting-without-of.txt    |  4 ++--
>  Documentation/translations/zh_CN/arm/Booting       |  4 ++--
>  .../translations/zh_CN/arm/kernel_user_helpers.txt |  4 ++--
>  MAINTAINERS                                        |  6 +++---

I assume it will go through doc tree, so for Samsung:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
