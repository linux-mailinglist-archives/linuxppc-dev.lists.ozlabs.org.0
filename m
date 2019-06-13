Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA544E04
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 23:02:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Px4k1jT0zDrJw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 07:01:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.194; helo=mail-qk1-f194.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Px2342hvzDr0q
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 06:59:35 +1000 (AEST)
Received: by mail-qk1-f194.google.com with SMTP id i125so315696qkd.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 13:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8gS1dRlTY9NF+DtZtqCgP0hW6HfTe3z8OAdjlpLy23g=;
 b=XVHwYAvqWvdo2Idd6tnDxrid55Sxm+ZD0kQFKyJTMCF6B6ouTFv5dPTXuglWbGw3oD
 MRRgv8l8xwJlue++HOeWPrK21VepWcVnPERM1EBHcKp2+3yawnV8ZTFD3ibJIJBLMwla
 aw3aGeCb+xJ8B0ikcN9J30JcEJEgeuS2GYzz4ipXhFPkr6q5MUzO1E7AUeHwB/iBt3b/
 muchEMhuI6atp2ndI9YlLztilS0z0Q5MghU8Gs1N7K+tjyE/zJ4biizxH8LPneYdK1g5
 yfNoLLZkLurP0ekDClCPUwtbhl27pCrNzSEaTk5skKah1tRGdPkIh77FD7WPjVHUaZHS
 HG4g==
X-Gm-Message-State: APjAAAXyTNAQBdJRI8FVBmdg5wte+QVLww6M4E0InZ9mjWqpDQP52Rmg
 V9HhPIEvN06xELNOEzhyDQ==
X-Google-Smtp-Source: APXvYqwDgSwF2dSbUU9DX5FRctIU1tJHSsxmp68E6P2oHV84xkfNE37T6Ih+B8DDpnB0ICrYTBnkTA==
X-Received: by 2002:a37:a48e:: with SMTP id n136mr233325qke.223.1560459572884; 
 Thu, 13 Jun 2019 13:59:32 -0700 (PDT)
Received: from localhost ([64.188.179.243])
 by smtp.gmail.com with ESMTPSA id a11sm431020qkn.26.2019.06.13.13.59.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 13:59:31 -0700 (PDT)
Date: Thu, 13 Jun 2019 14:59:30 -0600
From: Rob Herring <robh@kernel.org>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: pci: layerscape-pci: add compatible
 strings "fsl,ls1028a-pcie"
Message-ID: <20190613205930.GA9003@bogus>
References: <20190515072747.39941-1-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190515072747.39941-1-xiaowei.bao@nxp.com>
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
Cc: mark.rutland@arm.com, roy.zang@nxp.com, lorenzo.pieralisi@arm.com,
 Xiaowei Bao <xiaowei.bao@nxp.com>, arnd@arndb.de, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, minghuan.Lian@nxp.com,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, pombredanne@nexb.com,
 bhelgaas@google.com, leoyang.li@nxp.com, shawnguo@kernel.org,
 shawn.lin@rock-chips.com, mingkai.hu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 May 2019 15:27:45 +0800, Xiaowei Bao wrote:
> Add the PCIe compatible string for LS1028A
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
>  .../devicetree/bindings/pci/layerscape-pci.txt     |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
