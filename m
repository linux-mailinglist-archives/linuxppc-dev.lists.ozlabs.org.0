Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5697B120E98
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 16:55:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47c5Tb4MD5zDqLR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 02:55:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47c5RT0QkdzDqGZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 02:53:54 +1100 (AEDT)
Received: by mail-oi1-f195.google.com with SMTP id l136so3684320oig.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 07:53:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/9D5bT/6tP3rVi8f9x2mTx0nceNBLJn6Pnm6PW8Q2Io=;
 b=K7esFM+cbNUyctPbBG2nSNIKrCYHLK0EP2n4tZ8zfz9Mqkkt9WASyg3iU8imMpKD3+
 BmFtTAwxSlONVCl+Pufzz5eb+8HnAHabjLhQep2975IlwtNisIpgF2iea7zdP0UwlCYT
 OHo5bRp6QJQhc2D5nlMB6zAH2BP2UGnemWwEZZjNnmm23zx713RO7qTS4c19jB4rSIen
 667lmdaJddjXjnsFMaU225BjOInqiTRtkhjHrpKWqnvHvnhhLmQAIX5XjqFoSNU003e/
 4jTD179ks9OO2GzHqIICuRpH97nSm+/SOJ/8qxANOBWZZPPzDgW0FqWxzwH539OuNWmj
 XyMA==
X-Gm-Message-State: APjAAAW9+/LlS/lXLdqWipRNLoE7VKu/Pvd0gvfh1y/n8vj8MYmQCiCu
 QkELenlwTRdbyYPjTjTiaw==
X-Google-Smtp-Source: APXvYqyjwLNiOdATGwneeb/VvNya7K52309SCLgJd3wlYpmyowMytvhPIlCjsXsVJ32JPzuOA6Vxbw==
X-Received: by 2002:aca:5f87:: with SMTP id t129mr10180489oib.36.1576511631553; 
 Mon, 16 Dec 2019 07:53:51 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e65sm6962874otb.62.2019.12.16.07.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 07:53:51 -0800 (PST)
Date: Mon, 16 Dec 2019 09:53:50 -0600
From: Rob Herring <robh@kernel.org>
To: Biwen Li <biwen.li@nxp.com>
Subject: Re: [v5 3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Message-ID: <20191216155350.GA10941@bogus>
References: <20191203122818.21941-1-biwen.li@nxp.com>
 <20191203122818.21941-3-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203122818.21941-3-biwen.li@nxp.com>
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
 Biwen Li <biwen.li@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org,
 ran.wang_1@nxp.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue,  3 Dec 2019 20:28:18 +0800, Biwen Li wrote:
> The 'fsl,ippdexpcr1-alt-addr' property is used to handle an errata A-008646
> on LS1021A
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v5:
> 	- none
> 
> Change in v4:
> 	- rename property name
> 	  fsl,ippdexpcr-alt-addr -> fsl,ippdexpcr1-alt-addr
> 
> Change in v3:
>   	- rename property name
> 	  fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr
> 
> Change in v2:
>   	- update desc of the property
> 	  'fsl,rcpm-scfg'
> 
>  .../devicetree/bindings/soc/fsl/rcpm.txt      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
