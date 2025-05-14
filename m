Return-Path: <linuxppc-dev+bounces-8582-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ED9AB716D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 18:32:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyJm2180cz2yx7;
	Thu, 15 May 2025 02:32:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747240354;
	cv=none; b=PMLIJByLrp3DWewGe+vRkY8FRHjDB3ZfPmOtnjNjf+z0y92I1T8AGMhYBEMWV8Ew8oUdWt4993rqartH3oo2GDeAdDLqHV3+ovP/bQ99rdii9mNBTM5buhYExSnY885/jlEFUhOjIw69NKlfnVb4eu7X0HQGfUNhH+Bf8fG7Z/AX2VVwhHz0q5YIvv3MYlpzVrTSrwxhYNbj60qqCzBoY1xDsvWTeUM9y18/kkuGBVhhsBmKOIBH7gVny4L0OJLSNyva4glGQaRDdOxoiryhU+XcCy4e6qNojnxrSU0HWuQHt9TsiUJEcsHWSbB0nfQz66qJGdGJMt/Hu2r2Ez4gaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747240354; c=relaxed/relaxed;
	bh=Fnmo2+MZcpJ2cvX+WFzBsbU3N8d4JXlGi4Htr9EmUTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nkD9Ofo9oKce8KZtXa15/92JoEwkksdszLPe0R45Ii9BOMIT9ZrGtj2AtprHen23nFNc/6w/xXbEv+KpqXIhaQUhUJnnPQ+lnDFnpaOm+kf6S9WhqJ/pOJCY//ikdeT4XPpr8RHwDGIe396/wH8hPrxUoNPta2nQOiNcEPKR5YWbGJoQm68alhqDvyAoKh28sdrwAUhdowTXxtOSnmY8E7CyWXVojmoWLSm/HG09xus1D34ZOr6P1kXc45kHt9jUhSLn+JzJEjhRehZDPt5pDJ/PAIlYd6GJlICBpO4k2MM5HEoNP6LkkBQR9dBjDNocDSyoCI9i3TyVg9i4Va40xQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JoiH5r8N; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JoiH5r8N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyJm05GmHz2yr6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 02:32:31 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a0b9c371d8so5993305f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 09:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747240348; x=1747845148; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fnmo2+MZcpJ2cvX+WFzBsbU3N8d4JXlGi4Htr9EmUTs=;
        b=JoiH5r8NgHEWlMB01Z3O2fgYsJbsF/Kb70VzByWE3AdKB3RoJaN6zawozrzso1CzvJ
         e2WF1CssS7SFDNxmGsTzhDK1VO7lKJ+/iFdvzQMgFZRuL1m/vsXYQd+2fyPPDEVGgkzE
         TUmQVcaETtAWPvQZZRYdaytFpujVBPt2SsFf2aqNMCOSqUghbNuECXey+hOShevSgNhZ
         hxmO0ET3faC4XuQneNkVDLhCOnF4cB5175E/+uMvByh9O+s7dvuqAouciipqgjsxDtlt
         A66/Wj4+2xg5d0uXVKAXXIjAxYS4ITHzI5/A45NeIHT0PYSMM7jBVP94oVRVqIFBz2lC
         gzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240348; x=1747845148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fnmo2+MZcpJ2cvX+WFzBsbU3N8d4JXlGi4Htr9EmUTs=;
        b=oPRfgc5bF/RTGEVd2vs8ihSTpYRppBMwTpJ7GrzW6POtxt+GthQ66cgd59vGJRFoPy
         xJL8n5oVqKaclFuB7aG5bXKxBGY8PMbu8POP/za13vtihzH1wK6Ji7ZSBeR64j+HsMyg
         leMJYjpkAt3a7A2OyYNq01qzqHhMHLXfnDPMmiNMNwDEq13FI87ZURWr+9Gmdbu3LpZb
         f4cGL+bTl2oF7REjRyB6iFOHRsLZx4xSesydDjUzp4fWfj/KIimbfNxDXGbGOmZ+tbnB
         0vUpmCbYApgoLj5PCowxHMrOnFsqPoHKAssCQTjQ7ZCgfLzwHEwZoVlt3yJ0fYB9ogxi
         YtGA==
X-Forwarded-Encrypted: i=1; AJvYcCXwXgd8lyqnwt6x9vCe2IwrcPxfn58sbHhn2nxhEyQnGUTMuG3V5QtrJ9Hl+npWtTSoxXQmh/PIBs87uU4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7GnafXmOoJr6ABnVqGRHYM5xsOjYI4n8IjSSzE4tr6QhS0Gky
	wz95TmoF6v0YehXLXKP+kiL1z1OV7sLTaIFes/JST9eIgsJzSujrS1tPjcyT4g==
X-Gm-Gg: ASbGncsz7jscBw/ExTa8y+JZb10SFpVIMe6yzt2QhnkFvqq63GfpaVTNGtsFFLGEZ3A
	NqOEa6fyZmgSElC3S+dbMZWuGVl4OlTBjYEcIsShutDd4lP33m0oZ911PULYR8c7RRW67wcPVps
	qSBatb4w0+0hssvndMabQkb0Nkv6bUm+Tp385Sl1LGd3y3jT6kX0bJ3kANuEA3meeXFiPodR+8k
	otel7KAcUTqBXWshQ2D2RQNdVMSNZ0yg507RMp2PgmvlU1mgBa5mG+ryXUZHVu29LcNitzBfh0A
	wQ9Gvr/EA+/3XNCvbxfmM5fI6KG84Usv/x1y1o9l6sUCPcuJK3Lkkzsg4VMVOexUXAiKEbg/qQR
	h6Jqx7+HTSL/WREqzeq+5q4gd6pGbfEN9jhDlhZ+yT3Ig
X-Google-Smtp-Source: AGHT+IFn3vXnS6jxMSTKpvWwf0YAtvDrlGdswD18OpUum5KMQooxsvMQxaV39lTehJR9+Ij2bnRE1g==
X-Received: by 2002:a05:6000:4205:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a3496900a9mr3428305f8f.7.1747240348003;
        Wed, 14 May 2025 09:32:28 -0700 (PDT)
Received: from thinkpad.c.hoisthospitality.com (112.8.30.213.rev.vodafone.pt. [213.30.8.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb8c92d9sm37650875e9.2.2025.05.14.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:32:27 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>,
	Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: dingwei@marvell.com,
	cassel@kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/5] PCI: Add support for resetting the slots in a platform specific way
Date: Wed, 14 May 2025 17:32:23 +0100
Message-ID: <174724032611.26337.10095399338390897616.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 08 May 2025 12:40:29 +0530, Manivannan Sadhasivam wrote:
> Currently, in the event of AER/DPC, PCI core will try to reset the slot and its
> subordinate devices by invoking bridge control reset and FLR. But in some
> cases like AER Fatal error, it might be necessary to reset the slots using the
> PCI host bridge drivers in a platform specific way (as indicated by the TODO in
> the pcie_do_recovery() function in drivers/pci/pcie/err.c). Otherwise, the PCI
> link won't be recovered successfully.
> 
> [...]

Applied, thanks!

[1/5] PCI/ERR: Remove misleading TODO regarding kernel panic
      commit: 0b56264b66b695aa76115ae68c1365dff80814e0
[2/5] PCI/ERR: Add support for resetting the slots in a platform specific way
      commit: e2889025d83fb38faac80d976f1789af3320ecb2
[3/5] PCI: host-common: Make the driver as a common library for host controller drivers
      commit: a811ffd43754dfcaccff497de1d8ee0bd30f8f2f
[4/5] PCI: host-common: Add link down handling for host bridges
      commit: f24509b96c33c1bdd9cc57bc4f8a58391e846c8c
[5/5] PCI: qcom: Add support for resetting the slot due to link down event
      commit: 40eba89968afc15302fa5aaef207fd9ccaf1ecb2

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

