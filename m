Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB13F80E8F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 11:19:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=opux/Xgf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqF3M2b0Qz3c4t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 21:19:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=opux/Xgf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=lpieralisi@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqF2V74Nkz2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Dec 2023 21:18:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D0980CE190A;
	Tue, 12 Dec 2023 10:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E53C433C7;
	Tue, 12 Dec 2023 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702376335;
	bh=BDA09IhOdJW1cajZlzV19+AKYjAHgvythLG7ITpYD98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=opux/XgfjUHFZVdwwdF32fgT8kROdV23JLpSodnxXNW1p9Ts2iGOQvYSKzLcpvGvx
	 G2vB9h093GLyD1BSff6rqzZWok2ekTyi0z9QqE+vVFZJKI2erjVidH3ri/MrB9Qng+
	 ap6y2Vqm/q2f1W0q2y/Wyb2ML5IX83HpvAnb3TvjfTDTraqKCpjLIOxIzZYUK3tU4q
	 +AKtQnX/JfXUyBXgKJDThmSQZS+b18SqxrG2TfCLKxR0vidNMQTsz6mv89AZrWRXoO
	 k0ngUxsjIqqO+g/UkpsRmNY9dRd3gVH/TNyJ9r0KAwGjabnzjHFXwk4WWEmLdf98Eu
	 COTdTV31JHAKA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 0/4] PCI: layerscape: Add suspend/resume support for ls1043 and ls1021
Date: Tue, 12 Dec 2023 11:18:47 +0100
Message-Id: <170237631077.45230.13455897797263324456.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204160829.2498703-1-Frank.Li@nxp.com>
References: <20231204160829.2498703-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 04 Dec 2023 11:08:25 -0500, Frank Li wrote:
> Add suspend/resume support for ls1043 and ls1021.
> 
> Change log see each patch
> 
> Frank Li (4):
>   PCI: layerscape: Add function pointer for exit_from_l2()
>   PCI: layerscape: Add suspend/resume for ls1021a
>   PCI: layerscape(ep): Rename pf_* as pf_lut_*
>   PCI: layerscape: Add suspend/resume for ls1043a
> 
> [...]

Applied to controller/layerscape, thanks!

[1/4] PCI: layerscape: Add function pointer for exit_from_l2()
      https://git.kernel.org/pci/pci/c/123971a193d9
[2/4] PCI: layerscape: Add suspend/resume for ls1021a
      https://git.kernel.org/pci/pci/c/6f8a41ba2623
[3/4] PCI: layerscape(ep): Rename pf_* as pf_lut_*
      https://git.kernel.org/pci/pci/c/762ef94b45d9
[4/4] PCI: layerscape: Add suspend/resume for ls1043a
      https://git.kernel.org/pci/pci/c/27b3bcbf8a79

Thanks,
Lorenzo
