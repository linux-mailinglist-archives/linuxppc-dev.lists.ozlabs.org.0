Return-Path: <linuxppc-dev+bounces-7662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9714A89F7C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Apr 2025 15:33:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcQ8p38Y2z30Pl;
	Tue, 15 Apr 2025 23:33:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744724010;
	cv=none; b=bDGEbyBWvdRMKAe7U3R2nlgCZsgBObdXmmKeix+MGxXylBQPx9+yMevbLsUOv58e3oNK0SGu8EE6R3cOhHlbL32bVPsAzQSYDz6WoppQz6fzHEPSaYwFkqoYG//TAMBPsbL7A02fqKIpxD0Nye/4rESEt5l0XZjXZ4RMGE3ah7iNYQe2M6GbwXgsBlNKgJE/lWglUo2A5nGkUaOz5qAL9eHz16DLck5Z20UDFRnh8mEF/yCK9/TyWyStIwnimC04WRe3MU2lptAhAjUP3w+kYerX1dmISNUNeQ1+INFmgpeWEdn8x7RBp/uANQv6m46hgCZUWWdMBqZ0GiJqWrUkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744724010; c=relaxed/relaxed;
	bh=6kb+FJnw86VvRtE36N+d+X7ug1k6Yvpc1Ae1wFjKr7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKbjHPKMQzSX1YBx2p3F7hs0LvMxW4xpfQtEy8SPoPpoGBtM7v1BZ2tU4JQzpOE/nBSH95YZmTvsayhYhtaJ2NU+lcxb2MRPkWr2ULhcFv6pXizEHuWNlaRjwfkgkRNR86eqmvEK/y8LNBiUdjFAxXaY/N4YsXcfwRWBexFBuns2ZHg6cCF+uWZ3lEjBXjFRXsApj5lcMm5nwXl7Mwmah/UbfEBUiNiFOvD/r5SwfPZpBsLm9E7Ev79zJ8E4UoCS1V8aaUCSZG/XR26EeKslP1xgTO9zdhWGcs5Swvz/pAe3xMc4QB7lhOVi0GAdyRN82XMZbX9cfYaOlMP5X5L05w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kWSxVT6J; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kWSxVT6J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcQ8m6403z2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 23:33:27 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22423adf751so50745185ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 06:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724004; x=1745328804; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6kb+FJnw86VvRtE36N+d+X7ug1k6Yvpc1Ae1wFjKr7M=;
        b=kWSxVT6JYfI0cV63LIhuy3ZWv+jUd1K3J/Psomxk/lb8QgYDGN9Xf+aVSZcM/gHNjB
         dO4uJRyerAA8L9MbFF6ZqusVuvTJFTABhw+uzAde59RbDDbeo0PgM990jxOekDc3UqIx
         +9F8wn/ASV6I/S3FJYm56nNPT+UmukTkugTbLO84V2IK8Oi30N0xHNVR19Fojx6HIWpp
         0SW4PYqIK8UJrOqBNYRfQFAzb4D89dbL6L/M1jHKcpjDbkcnB5kqwLWw4yIu7QzvK9oC
         8IfMIoYFMNOIQ0vBuDrK/8FyxY7aRcZ6AiOxXS3EWU/KJ7y8mzRUzc5r6MmsnqeAr6Tf
         M53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724004; x=1745328804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kb+FJnw86VvRtE36N+d+X7ug1k6Yvpc1Ae1wFjKr7M=;
        b=tlODMVvD+DpcsP3lcWCZNPg94CxzITl5AjZ0saCtcGiDMXxATwKtlwneCc9pD46d8P
         xBh5qu9d3dMV0Laq+d8EARfHpUfYLB/2mZRMXmhCBYhYYZCmksTkb4kRnFc5gnomv/qf
         N3F5ntjo3vIl8HoASDbC9Iupo01ziRtl8plzdsAf0Buh/je61WxdMeIW+6F95mySGFeg
         ycv5tZ1AyDhGrkF3PPdsR9gKsOpraWndGt/33dwyg/tELrwDu0RlapwUxAdXh9S+tF1v
         3GNvRwjUhizWGuDPiVt5OdhpuIPhfnddEgOqQ7pRE89ThXXi4HxvllW1hPUy3KpbNm0w
         xJzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrT8kAm1GOEOkurGvSX1BOfGmWOLWxcc+KDKolPWyOlR7zWMPJXSg5m6EunD/1X91cImquuSUBrO3vP7k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxVIl+tvuHgQmeGeXO8M2hLXlvNbPSYylb6vm6ZoAqvDC4NL1L2
	oRwH26K5tZk/u+wSERARZXch887U14jQBVRxzmO95Z2e1xEmlLmmqH2DbyRmNg==
X-Gm-Gg: ASbGncvU+G35o64sGfWZ3yxMEexttlOJocxvLdOBcr0KwUNIa7FiYTsxjmG3CawxhCq
	XTLSImK+99eG/eqsOAlaE00pRL4lX4cPSqkpkF3rIKvL0r1LrCQTSHLMcknx97JX7uM3bne4+0Z
	eYsBBHKrloBN8dGOT0vZ5+d/Par7NYxFQWiR5r73hbqv+PJxb0F1OLMIMAHThGIa4KnTS5mx5Uz
	6rFpBja8mNEaWW+lefq2Am2puVV5aqpwiEFDwykvYOPzUak4CLs1inmWc3x3FUgbBObLi0IOgpY
	dqfQ3cVwV1bUs2jqSVRhsY8BiVCRkDfRBu7WJFeoqoYKjxh02w==
X-Google-Smtp-Source: AGHT+IH6VniJgzO2ge6ikLonScHc+/MusL7v3em7u0V8pMku3ZWCkwH976lsW0jgobFIzeciiAD5CQ==
X-Received: by 2002:a17:902:f705:b0:220:e9ac:e746 with SMTP id d9443c01a7336-22bea4fdc7amr267687405ad.53.1744724004231;
        Tue, 15 Apr 2025 06:33:24 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb6876sm117199985ad.181.2025.04.15.06.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:33:23 -0700 (PDT)
Date: Tue, 15 Apr 2025 19:03:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczy??ski <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, dingwei@marvell.com, cassel@kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] PCI/ERR: Add support for resetting the slot in a
 platforms specific way
Message-ID: <3dokyirkf47lqxgx5k2ybij5b5an6qnceifsub3mcmjvzp3kdb@sm7f2jxxepdc>
References: <20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org>
 <20250404-pcie-reset-slot-v1-2-98952918bf90@linaro.org>
 <Z--cY5Uf6JyTYL9y@wunner.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z--cY5Uf6JyTYL9y@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 04, 2025 at 10:46:27AM +0200, Lukas Wunner wrote:
> On Fri, Apr 04, 2025 at 01:52:22PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > When the PCI error handling requires resetting the slot, reset it using the
> > host bridge specific 'reset_slot' callback if available before calling the
> > 'slot_reset' callback of the PCI drivers.
> > 
> > The 'reset_slot' callback is responsible for resetting the given slot
> > referenced by the 'pci_dev' pointer in a platform specific way and bring it
> > back to the working state if possible. If any error occurs during the slot
> > reset operation, relevant errno should be returned.
> [...]
> > --- a/drivers/pci/pcie/err.c
> > +++ b/drivers/pci/pcie/err.c
> > @@ -234,11 +234,16 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
> >  	}
> >  
> >  	if (status == PCI_ERS_RESULT_NEED_RESET) {
> > -		/*
> > -		 * TODO: Should call platform-specific
> > -		 * functions to reset slot before calling
> > -		 * drivers' slot_reset callbacks?
> > -		 */
> > +		if (host->reset_slot) {
> > +			ret = host->reset_slot(host, bridge);
> > +			if (ret) {
> > +				pci_err(bridge, "failed to reset slot: %d\n",
> > +					ret);
> > +				status = PCI_ERS_RESULT_DISCONNECT;
> > +				goto failed;
> > +			}
> > +		}
> > +
> 
> This feels like something that should be plumbed into
> pcibios_reset_secondary_bus(), rather than pcie_do_recovery().
> 

I did consider that, but didn't go for it since there was no platform reset code
present in that function. But I will try to use it as I don't have a strong
preference to do reset slot in pcie_do_recovery().

> Note that in the DPC case, pcie_do_recovery() doesn't issue a reset
> itself.  The reset has already happened, it was automatically done
> by the hardware and all the kernel needs to do is bring up the link
> again.  Do you really need any special handling for that in the
> host controller driver?
> 

I haven't tested DPC, so I'm not sure if reset slot is needed or not.

> Only in the AER case do you want to issue a reset on the secondary bus
> and if there's any platform-specific support needed for that, it needs
> to go into pcibios_reset_secondary_bus().
> 

Ok. I'm trying out this right now and will see if it satisfies my requirement
(for both AER fatal and Link Down recovery).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

