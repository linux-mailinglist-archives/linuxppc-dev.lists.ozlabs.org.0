Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2869F024
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 18:28:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HvSr6R8rzDqvx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 02:28:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.194; helo=mail-oi1-f194.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HvQk4TvxzDqlD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 02:26:51 +1000 (AEST)
Received: by mail-oi1-f194.google.com with SMTP id h21so15429196oie.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 09:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4HSp7GpMjayluxWHO7ugEoqBf1XE55/uOIFDoDgJv6Q=;
 b=YztKv1iGgVRg9NepNU/6sdnRwCpqxzf0yhpWnjs3CPRzuC1pls7qlvR1/WUV3jaAZo
 YeJchtndvc+QqsFWrNOLjWYXyjGdKWmbMA+vsHf8bErnYR1Aqa8eiQP5tsBgxpUD3AGx
 SH0k8IukUEfcCe96kL0ZWIk2Ypyist5YoGw7GM1/UrlNYaPxJZTfGU9t2yICwof6q9Re
 bjkQB+xtkmhT+RRlDmOqx1xMFu6U1eEGAiYzy94K9ZezTQDFVw2fKuujYneSQQiSWG2b
 35z5piWFky98Z76kQmgZzbmHIhpkK+wL0U+Mpw6pG28fqkUcD4q1QVZgn75D58QVGs/W
 ImcQ==
X-Gm-Message-State: APjAAAW3o29efA6u0iCFH+Nm/1R8jjYuPxm6++zeHIuUHvbbnVBzRMG8
 9daN2c7K8ZEaJA1/sal3Pg==
X-Google-Smtp-Source: APXvYqz+FEVhEUY3wCiucFQEMMkHkhySFHT9ozYmvRgI1VOAn+6/u4QwVBFFW28kEOM0vAnYZbB4fA==
X-Received: by 2002:aca:5652:: with SMTP id k79mr1967173oib.175.1566923209074; 
 Tue, 27 Aug 2019 09:26:49 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c3sm5232759otm.70.2019.08.27.09.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 09:26:48 -0700 (PDT)
Date: Tue, 27 Aug 2019 11:26:47 -0500
From: Rob Herring <robh@kernel.org>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCH 08/10] dt-bindings: PCI: Add the pf-offset property
Message-ID: <20190827162647.GA21347@bogus>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
 <20190815083716.4715-8-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815083716.4715-8-xiaowei.bao@nxp.com>
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
 Xiaowei Bao <xiaowei.bao@nxp.com>, arnd@arndb.de, gregkh@linuxfoundation.org,
 jingoohan1@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, minghuan.Lian@nxp.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, gustavo.pimentel@synopsys.com,
 bhelgaas@google.com, kishon@ti.com, shawnguo@kernel.org, mingkai.hu@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 15 Aug 2019 16:37:14 +0800, Xiaowei Bao wrote:
> Add the pf-offset property for multiple PF.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
>  Documentation/devicetree/bindings/pci/designware-pcie.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
