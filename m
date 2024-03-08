Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A6875DD1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 06:44:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pfV34Dsv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrZqr4CG1z3vZQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 16:44:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pfV34Dsv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrZq76kN2z3bPV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 16:44:03 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e5d7f1f25fso381631b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Mar 2024 21:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709876642; x=1710481442; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pP3WC4SyW/Vzti9hv7dYhKLJSQ5hGnrzQR/QY37QH6U=;
        b=pfV34DsvmAEbMwbrwjD0VO8Bplu87jRjEAWtJ4KL/HLQdrBHx0s8UO8hiUuVx88Xbf
         /jlDv0dGYVI5j4gp30MVtZ9/K3LwzosGMbhtM4ncpcUd3Lvw1pWunCd6YC7K9dGp4BMb
         IhzmI/Ejq+IO2nN/oTECuwl15VbXNpjWD93DoqeFbUJo0cVYygnWRVEzRNgE3jXyN25u
         0ZzELRkqdKwaklRmLBFEdH+OlKf75n/zK0J0HpAsGWjiikRn1ClZgctOetFRCxb1mb9h
         2bIHLypseGk1C/zl/CLuD41bs16DkQndEtfBYeLnZgoulNkVUEpzbeh/TtMqAitg2Wc5
         ntRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709876642; x=1710481442;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pP3WC4SyW/Vzti9hv7dYhKLJSQ5hGnrzQR/QY37QH6U=;
        b=iBHZXz5mxiM1CKWkuRc7F0v5IE6LJMp2NV/923sfEt7jAheF2SCjIVQtWKRfs6zDX9
         aJ7jn1BBgsLC/bZ6OGnK53aE8wgeg6o1c0P87Mm/Q+Qby0xvn/PJCPBn/rsphYFn3pBi
         4a5YWackN0sCiHc1EJv+WV+ByHMwAgXFVGyqNJvWD5AzO0J7n7jSQXoDbz8K3lA6hbLa
         +GPUfVfTTjsj2zNeXRojdaJul5Bq/31DGnpVNsMXWwMODNy+/oAfmZ7CnZXxk70+Wctx
         yPRW9dzAHuXc4cDm00hgquE20ZUN0F4ldmu/1uxThJqPWQZHCitJYcZdPAI9ynJUvfUQ
         gq9w==
X-Forwarded-Encrypted: i=1; AJvYcCUpX3uIynlsGr9vLyBv7NkLZKrztb0YOojMBMJGW1kPCTqQsEQq/GeFHUIBszpqldLJMGLv5BWl5m1iX4WGDEtVJVWZzPccAVfCqxx2zQ==
X-Gm-Message-State: AOJu0YzukWJjSYh9LPiYq0SFuWtzbF9IKPXVBPTnGNdSOgF+VpKSCNWw
	hPXYYdN6CD+JP2xl8+JP4cGMTcq1oymgpWQ6t76B0Ro9o4CaODZ/FGXuz6IG/w==
X-Google-Smtp-Source: AGHT+IF4OBcYmj84dqXR/j7tUWistQOyDNgAnoteok0JgpLNMa/4XKXGz0eVlhJR+Ieyw9pe6cuoUw==
X-Received: by 2002:a05:6a00:815:b0:6e5:9a92:f99b with SMTP id m21-20020a056a00081500b006e59a92f99bmr19446806pfk.16.1709876641435;
        Thu, 07 Mar 2024 21:44:01 -0800 (PST)
Received: from thinkpad ([117.217.178.39])
        by smtp.gmail.com with ESMTPSA id e3-20020aa79803000000b006e5667793d4sm13354830pfl.66.2024.03.07.21.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 21:44:01 -0800 (PST)
Date: Fri, 8 Mar 2024 11:13:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v9 10/10] PCI: dwc: ep: Add Kernel-doc comments for APIs
Message-ID: <20240308054347.GE3789@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-10-29d433d99cda@linaro.org>
 <Zeo4dJGZYLnLfzjm@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zeo4dJGZYLnLfzjm@ryzen>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@
 lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 07, 2024 at 10:58:12PM +0100, Niklas Cassel wrote:
> On Mon, Mar 04, 2024 at 02:52:22PM +0530, Manivannan Sadhasivam wrote:
> > All of the APIs are missing the Kernel-doc comments. Hence, add them.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> For the functions that you added in this series, e.g.
> dw_pcie_ep_cleanup(), dw_pcie_ep_init_non_sticky_registers(),
> and dw_pcie_ep_linkdown(), I think that it would have been
> better if you actually added the kdoc in the same commit that
> added the respective function.
> 
> 
> For the existing functions that did not have a kdoc, I think
> it would have been better if you fixed this as patch 1/10 in
> this series. (Or 2/10, in case you keep the Fixes tag for the
> "PCI: dwc: ep: Fix DBI access failure for drivers requiring
> refclk from host" patch.)
> 
> Yes, I know that you rename some of these functions that
> lacked kdoc later in the series, but the whole kdoc description
> would be the same, the kdoc parameters would be the same, and the
> kdoc return value would be the same.
> 
> If you later rename a function, you would only need to change
> the kdoc function name (in addition to the function declaration
> itself).
> 

Makes sense! Will change it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
