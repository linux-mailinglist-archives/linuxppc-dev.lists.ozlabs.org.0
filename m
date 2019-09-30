Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FCAC2623
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 20:59:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hsBv49M8zDqPT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 04:59:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.196; helo=mail-oi1-f196.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hs961wcbzDq6k
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 04:57:45 +1000 (AEST)
Received: by mail-oi1-f196.google.com with SMTP id k9so12095633oib.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 11:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BHeCpN2463mRdVd4Een2eG9NLKq6PLofbIreirL6ULM=;
 b=OFEg88zSAazP+ioR5bkI8Tq+zSO3e4OTVQaAKmxFOlpoxSHtooa4MRLK62qBcICYU2
 9+B+AalVOYyZwE/VnEIdAAfiZRB6yUVAA5SJshNC+Kwcvz7LoODI6zTQ8Ggv58cT7iq7
 mNKD8EccQqhYQ2BLH92B4H4qbKT78HZ43UsPBc0cEyVQyNd0OYGKXhGcsK71m9CQmTDH
 EDubVnWajperHsPi0GCHOw5KFJo6Tyj5xMW3SJU/q6lzJPrfnIgO1SCL0qLjtqL8kqFv
 wRDF8x+W01JFDfdNEEOP7fr6icNZKuUlFsiu7uRWpBrn2IrqNlJcpXDDF4GcpwcmLuwx
 n48w==
X-Gm-Message-State: APjAAAXAZYvib7uVngmOzWx4bbSCQG4m5upiuZEc7Y3bWBJIY3PBCouK
 vd0HParKUk3QWmtZTTpLEOZK7mw=
X-Google-Smtp-Source: APXvYqwwR+as++oOAeBfzG/uIVrhnm3yF5hx+JyUgYRKMiH7ZEmlrV6X71etrsLz0P1tGpDCcgNPZQ==
X-Received: by 2002:aca:d846:: with SMTP id p67mr550811oig.144.1569869862328; 
 Mon, 30 Sep 2019 11:57:42 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b5sm4531019oia.20.2019.09.30.11.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 11:57:41 -0700 (PDT)
Date: Mon, 30 Sep 2019 13:57:41 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V2 1/2] ASoC: fsl_mqs: add DT binding documentation
Message-ID: <20190930185741.GA18160@bogus>
References: <65e1f035aea2951aacda54aa3a751bc244f72f6a.1568367274.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65e1f035aea2951aacda54aa3a751bc244f72f6a.1568367274.git.shengjiu.wang@nxp.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 13 Sep 2019 17:42:13 +0800, Shengjiu Wang wrote:
> Add the DT binding documentation for NXP MQS driver
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> Changes in v2
> -refine the comments for properties
> 
>  .../devicetree/bindings/sound/fsl,mqs.txt     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,mqs.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
