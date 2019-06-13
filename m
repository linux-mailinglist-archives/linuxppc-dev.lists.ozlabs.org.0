Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0372D44FCE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 01:05:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PzqF4JCbzDrPT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 09:05:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.194; helo=mail-qt1-f194.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PznK4FtSzDrNw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 09:03:49 +1000 (AEST)
Received: by mail-qt1-f194.google.com with SMTP id n11so389907qtl.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 16:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Any9+xhgAdf8Tj2YQiAeCpNAF5TdMk3cjHofJsaCPp8=;
 b=K9ZCDqtOI29nGY9Zm37MbJ/8U1BxERgg10MzCYwtrJrKyfyYpzFjgHWLQoYjJpRwrs
 87CjBRTBMH7Y94W8zbEJHCkQyUNJyfhm5/JeFS3CLGCIMMlOrol7yPOZYQuE/PT0bO01
 lhkOIak7/ues1qrzCWVyqkc3qa5kPOveRxxFPbtz0w0Rpj0T7nq5DdU05VnlHoWxPy2Z
 YfoyLC/ra/wufeD3E24aXkd7Pa/AeCymdqXUVRb+Z2iLIK9rY16aa805Ooyimb2x839q
 yxARvavnvHL89RKVUts6d7/V3UN1i+DAIOJ7ySxQhBEMTRxpsEFIQT0Jksx3+uAYNjh4
 70Yw==
X-Gm-Message-State: APjAAAXnxQPuaSlJ01cP3w7xO54hxe9VirKxsw2ZM/Lex4EIxUpGXf0V
 g03m6M1gjt4GuS+mhzq0mA==
X-Google-Smtp-Source: APXvYqwP6BVE4QQ6PLKz0SdGsY6PHtqwDv2ToI4H2dca/xQK2tVqH95A1g32hz8XmVu9TPpzIdEW+A==
X-Received: by 2002:ac8:4919:: with SMTP id e25mr9443342qtq.214.1560467026455; 
 Thu, 13 Jun 2019 16:03:46 -0700 (PDT)
Received: from localhost ([64.188.179.243])
 by smtp.gmail.com with ESMTPSA id i17sm508437qkl.71.2019.06.13.16.03.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 16:03:45 -0700 (PDT)
Date: Thu, 13 Jun 2019 17:03:44 -0600
From: Rob Herring <robh@kernel.org>
To: Ran Wang <ran.wang_1@nxp.com>
Subject: Re: [PATCH v4 2/3] Documentation: dt: binding: fsl: Add
 'little-endian' and update Chassis define
Message-ID: <20190613230344.GA6005@bogus>
References: <20190520095238.29210-1-ran.wang_1@nxp.com>
 <20190520095238.29210-2-ran.wang_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520095238.29210-2-ran.wang_1@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Len Brown <len.brown@intel.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Pavel Machek <pavel@ucw.cz>, Ran Wang <ran.wang_1@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 May 2019 17:52:37 +0800, Ran Wang wrote:
> By default, QorIQ SoC's RCPM register block is Big Endian. But
> there are some exceptions, such as LS1088A and LS2088A, are Little
> Endian. So add this optional property to help identify them.
> 
> Actually LS2021A and other Layerscapes won't totally follow Chassis
> 2.1, so separate them from powerpc SoC.
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v4:
> 	- Adjust indectation of 'ls1021a, ls1012a, ls1043a, ls1046a'.
> 
> Change in v3:
> 	- None.
> 
> Change in v2:
> 	- None.
> 
>  Documentation/devicetree/bindings/soc/fsl/rcpm.txt |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
