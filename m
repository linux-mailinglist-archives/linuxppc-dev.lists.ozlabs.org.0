Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D11249845E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 21:28:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DHkv5CK3zDqS2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 05:28:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DHj54Z5pzDr02
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 05:26:49 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id k18so3171432otr.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 12:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=10waZ0/ZkKGq42Av7UyfIsQLjaV5XyZlPq4+UDb3efY=;
 b=phLEc4FENN5Jst//0Kljpz1hmaCxwwlHPciMaPgGA0If+La+w+eg20JgNPTr42R2+4
 xRlLS1VXHDYhYnfkZUMzFAIRLFbHxMJako6TxvMX6TIRMa0EjP6uR4puUNOI6kqfZSUY
 ItbqE2s1Dnt6iS2y7Uq1noc6slLMS2dkLQ3IHTqoebJw+H7RR2ThpqOitfqw9aQN4bYx
 96RhFpBOrkidLy7PvvbcDrM47xDaC8DRePdDbwV1bsbjdTU+OF6zQvJ4sFMwSFUB3qD0
 0Kc6pmRieYNMXqaQzhwWg2XRvDj2s7Xj0DMWrV6ypJTL5HEgolMlJynO7NIvKdgQKKtd
 9hRw==
X-Gm-Message-State: APjAAAUpPZGWRm9kQfdUEor2Gg7zda7ZtZlcBuNeWUO3J6qhyykmm0dy
 CqoRZkUhlA/jQhK9PiCQJA==
X-Google-Smtp-Source: APXvYqxLs6MFhoQAEH6ogwkzbZqevbuPU9pesTaxbtwOpkRdDuv+cpoUh2/qMzsEYRLg7/dteh3tjg==
X-Received: by 2002:a9d:7b4e:: with SMTP id f14mr1554439oto.193.1566415606656; 
 Wed, 21 Aug 2019 12:26:46 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z16sm3139424oic.10.2019.08.21.12.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 12:26:46 -0700 (PDT)
Date: Wed, 21 Aug 2019 14:26:45 -0500
From: Rob Herring <robh@kernel.org>
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: Re: [PATCHv3 1/3] dt-bindings: pci: layerscape-pci: add compatible
 strings "fsl,ls1028a-pcie"
Message-ID: <20190821192645.GA22618@bogus>
References: <20190806061553.19934-1-xiaowei.bao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806061553.19934-1-xiaowei.bao@nxp.com>
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
Cc: mark.rutland@arm.com, kstewart@linuxfoundation.org,
 linux-pci@vger.kernel.org, shawn.lin@rock-chips.com, minghuan.Lian@nxp.com,
 shawnguo@kernel.org, lorenzo.pieralisi@arm.com, kishon@ti.com,
 mingkai.hu@nxp.com, devicetree@vger.kernel.org, arnd@arndb.de,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, robh+dt@kernel.org, bhelgaas@google.com,
 linux-arm-kernel@lists.infradead.org, roy.zang@nxp.com,
 Xiaowei Bao <xiaowei.bao@nxp.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, pombredanne@nexb.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue,  6 Aug 2019 14:15:51 +0800, Xiaowei Bao wrote:
> Add the PCIe compatible string for LS1028A
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> v2:
>  - no change.
> v3:
>  - no change.
> 
>  Documentation/devicetree/bindings/pci/layerscape-pci.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
