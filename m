Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D80EB2AC81F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 23:12:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVQGq37NDzDqcl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 09:12:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.65; helo=mail-oo1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com
 [209.85.161.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVQDt72q5zDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 09:11:09 +1100 (AEDT)
Received: by mail-oo1-f65.google.com with SMTP id f8so2090003oou.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Nov 2020 14:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tHsQKqje+5SSSlblxDfRlRnDl/CnwOY9m4Ekj3B6MZ4=;
 b=k4P7eabsMaK4imbQvbIeHkLaPyifDro1rkSnlz0vFTKNt5cYiSkMV4hkbNOOr/f6oM
 E+C0F+t2zE6d9Pq7nnlzUdpSCwf1vNSNQIYslbUuroHip+PbkFqyX4M7g//qTkkwxqvj
 /GFp05hdQmP1D17y53w1t0XytY9myym9VtMKmYbh8li/2QpkHVkUW7iwns2euA9tZnvn
 IuQ5onLHAVeGEQow4EbxYxNPw9od72yECPEVb/QgBsXnKUGzx4j1i+z2QuKhoTp3BdQL
 6XBeT+IXS1drRd1gEZ3IDKPGMdZhzdKNI+PTl4t/Cq19+i3eBkLnfbmpe0w8V+U6W9Jt
 DTYw==
X-Gm-Message-State: AOAM5324rUbB1I/ROJVJMBOJiRYE1Z/o4uuBz1vFMYCVHYrEFdRBF3oO
 umEmLGJ+Hwlhm+vyQa6fsg==
X-Google-Smtp-Source: ABdhPJxZyTP1ZiN3mZ/6w5swgtWDmTaAwMXb7VFdiEbOAmrWb3IDVkYsELX1q0VNiyfw5GQrBarfQA==
X-Received: by 2002:a4a:9644:: with SMTP id r4mr11611906ooi.12.1604959867554; 
 Mon, 09 Nov 2020 14:11:07 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y15sm2813684otq.79.2020.11.09.14.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 14:11:06 -0800 (PST)
Received: (nullmailer pid 1846191 invoked by uid 1000);
 Mon, 09 Nov 2020 22:11:06 -0000
Date: Mon, 9 Nov 2020 16:11:06 -0600
From: Rob Herring <robh@kernel.org>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: misc: convert fsl, dpaa2-console
 from txt to YAML
Message-ID: <20201109221106.GA1846114@bogus>
References: <20201109104635.21116-1-laurentiu.tudor@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109104635.21116-1-laurentiu.tudor@nxp.com>
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
Cc: devicetree@vger.kernel.org, corbet@lwn.net, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 robh+dt@kernel.org, ioana.ciornei@nxp.com,
 Ionut-robert Aron <ionut-robert.aron@nxp.com>, kuba@kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 09 Nov 2020 12:46:34 +0200, Laurentiu Tudor wrote:
> From: Ionut-robert Aron <ionut-robert.aron@nxp.com>
> 
> Convert fsl,dpaa2-console to YAML in order to automate the
> verification process of dts files.
> 
> Signed-off-by: Ionut-robert Aron <ionut-robert.aron@nxp.com>
> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> ---
> Changes in v2:
>  - add missing additionalProperties
> 
>  .../bindings/misc/fsl,dpaa2-console.txt       | 11 --------
>  .../bindings/misc/fsl,dpaa2-console.yaml      | 25 +++++++++++++++++++
>  2 files changed, 25 insertions(+), 11 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
> 

Applied, thanks!
