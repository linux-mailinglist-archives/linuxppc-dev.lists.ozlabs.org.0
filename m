Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F9E1A82C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:32:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491qHP0LskzDqLl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 01:32:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491q4g0cq0zDqfF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 01:23:14 +1000 (AEST)
Received: by mail-oi1-f194.google.com with SMTP id x21so4500553oic.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 08:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iP8Yme/yERTcpil3n55AnAW8LqUxlEwBY586w3E95nU=;
 b=AYV80KEL85sROJxIatP0GQAoMojLg4/zZdEg+FdcsyvQSi/iNnPUrQhjVJNV/lk1Ke
 3QWWtUGq0BckZ2+IcEzvYeh9mjUv/JQIn2QC5l/Ze7Wpj8k6OkhM+cgbyYLl8h+QF+Wp
 aGyyerwpPu0/OlTPLlqeMTYDxLEuRbABDS9uHhdkw89pIOPx+xha2bfQAvJOFnjLHgFz
 06WWSYk3araC+FU2+yDy41ZzNmn96oLgZzhM8RKfweo0m/K6j2dWzzNd5VN5oFc36Suw
 3dtWw7O9V+uVsZRPTNfSPoOmmA48NBM7xz0/dvKfAcURi+H4lwl8TkL/zf71hVkdE9VH
 bjAg==
X-Gm-Message-State: AGi0PuYpXRt+BkLU7Gv4xa8eiTMY3sLe4sjGpukzrTBzE97qPsD0ot6K
 CcWz9e6Eii5PVwAtqBknwA==
X-Google-Smtp-Source: APiQypLYJkYYKWXvpSOEoNFc0cMsCUBSl8xLkW9q0c1ypTr4XS04mdZTHyq74lAxBh4DcMxaGjA35w==
X-Received: by 2002:a05:6808:a8e:: with SMTP id
 q14mr13614601oij.63.1586877791941; 
 Tue, 14 Apr 2020 08:23:11 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a13sm6106021oog.32.2020.04.14.08.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 08:23:10 -0700 (PDT)
Received: (nullmailer pid 28919 invoked by uid 1000);
 Tue, 14 Apr 2020 15:23:07 -0000
Date: Tue, 14 Apr 2020 10:23:07 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v6 2/7] ASoC: dt-bindings: fsl_asrc: Add new property
 fsl,asrc-format
Message-ID: <20200414152307.GA28870@bogus>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <47fcf06689d1a086141ce4d80f7ea7af7958dc89.1585726761.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47fcf06689d1a086141ce4d80f7ea7af7958dc89.1585726761.git.shengjiu.wang@nxp.com>
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

On Wed,  1 Apr 2020 16:45:35 +0800, Shengjiu Wang wrote:
> In order to support new EASRC and simplify the code structure,
> We decide to share the common structure between them. This bring
> a problem that EASRC accept format directly from devicetree, but
> ASRC accept width from devicetree.
> 
> In order to align with new ESARC, we add new property fsl,asrc-format.
> The fsl,asrc-format can replace the fsl,asrc-width, then driver
> can accept format from devicetree, don't need to convert it to
> format through width.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
