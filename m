Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4407E99DB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 11:09:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STQCK27yJz3d9s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 21:09:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.169; helo=mail-pl1-f169.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STQBq1Vg0z3cF1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 21:09:21 +1100 (AEDT)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ce1603f5cdso8561835ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 02:09:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699870156; x=1700474956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtssXOhT1IjkLH8DCwvrp9grDBN4NL0H2Di/o5vivrg=;
        b=s7iuiBV1tpApbj6WGzKjcxgh+X0A1YFWtc3rTRBbVDXltkSDNksUjjpO2JXU0XN9Sv
         mn+cSEnKh1J62MT8Ig9INxCpyQMoyK6iZbdZok1tYqayqd89yIblLqiRUt6MIovQjrPG
         co6KZ8YlSyg8wY3t3mDUKS3gjJSHUVeFS3/ZeoBHG+58lEaCYI8q94J/Mb7zIpuS7Brv
         YMst3ay3iPyfu42Vmj8QhOjP0A3KdnQWeHEC5lQntfQVPAzJrHG79GsCPsuilDf/CGeq
         Gg5HI9uT7+DWOWqXmIM5YHAoNfGt6KpTmhNqNGdq9IPLqpu/llysq2GI5ctXwn8WS2AA
         kixg==
X-Gm-Message-State: AOJu0YxlTGIzQuCRl3xNTTSHKKNgUIbI3MtNVz9t8aGmFm63jUsYv06V
	Mq9hLLM9m8RPTY27lgPcWf4=
X-Google-Smtp-Source: AGHT+IGj6vUeUwfKU7nKXujpx369C8OQBBOgD1h6Il4RG1NldEGkeXRi0upURBkbSxn6ENkTD/+7LA==
X-Received: by 2002:a17:902:e552:b0:1ca:a290:4c0c with SMTP id n18-20020a170902e55200b001caa2904c0cmr5440330plf.16.1699870155884;
        Mon, 13 Nov 2023 02:09:15 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id o6-20020a170902d4c600b001cc56354cc8sm3741846plg.62.2023.11.13.02.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 02:09:15 -0800 (PST)
Date: Mon, 13 Nov 2023 19:09:14 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 0/3] PCI: dwc: Improve code readability
Message-ID: <20231113100914.GB1583963@rocinante>
References: <20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com>
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
Cc: robh@kernel.org, mani@kernel.org, gustavo.pimentel@synopsys.com, lpieralisi@kernel.org, linux-pci@vger.kernel.org, roy.zang@nxp.com, linux-renesas-soc@vger.kernel.org, minghuan.Lian@nxp.com, jingoohan1@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, mingkai.hu@nxp.com, marek.vasut+renesas@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yoshihiro!

> This patch series is based on the latest pci.git / next branch.
[...]

Thank you for following up to tidy things up!  Much appreciated.

Now, while you are looking at things, can you also take care about the following:

  drivers/pci/controller/dwc/pcie-rcar-gen4.c:439:15: warning: cast to smaller integer type 'enum dw_pcie_device_mode' from 'const void *' [-Wvoid-pointer-to-enum-cast]

This requires adding structs for each data member of the of_device_id type.

Some examples from other drivers:

  - https://elixir.bootlin.com/linux/v6.6.1/source/drivers/pci/controller/dwc/pcie-tegra194.c#L2440
  - https://elixir.bootlin.com/linux/v6.6.1/source/drivers/pci/controller/dwc/pci-keystone.c#L1074

Thank you! :)

	Krzysztof
