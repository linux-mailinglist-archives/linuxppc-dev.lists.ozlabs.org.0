Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6580F7CAF17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 18:26:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kiSnPKMN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8MtN6nH7z3cGk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 03:26:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kiSnPKMN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8MsW29wBz2yGW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 03:25:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8DBF3CE1711;
	Mon, 16 Oct 2023 16:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4E9C433C8;
	Mon, 16 Oct 2023 16:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697473515;
	bh=9/hvt23CkWCSd3t6m1C0dNGRoz/pDYrD0zUCEPxSYzc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kiSnPKMNWSc95QJN5Az/vICl/XNckWm+QRY8UKi+Q+sgo8Kd1v1mfRpTIZLxZLbUk
	 l5F8vNrg1UbMfoa4oRxpvtjO1rkGvCGVfIhxta/gcuOkdYZ/hE7oXDLHxlok/gn5yI
	 XTPh/f6xrE1xZ/5JuAKxAYsbR+DOPQzzrnr4+VX8dNMbEo3O/OlVESsC9mo2iFmV8Q
	 MciK2/Nq/ach9GVBOF97X9rCnLqxQEYsTczGmFw93BX1W4N1XGLr1gpydUVV7EofJR
	 wAtIZ6+TuoliVQwBK7n0klE/d7D4yWx2gw4Gl8tp57B4ZDVmQRHWMJGRCeHO6pIwnX
	 S8KWc+1PpKGHQ==
Date: Mon, 16 Oct 2023 11:25:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH 2/3] PCI: layerscape: add suspend/resume for ls1021a
Message-ID: <20231016162512.GA1212231@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZS1gmJiz8+PKIuwp@lizhi-Precision-Tower-5810>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, imx@lists.linux.dev, "moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 16, 2023 at 12:11:04PM -0400, Frank Li wrote:
> On Mon, Oct 16, 2023 at 10:22:11AM -0500, Bjorn Helgaas wrote:

> > Obviously Lorenzo *could* edit all your subject lines on your behalf,
> > but it makes everybody's life easier if people look at the existing
> > code and follow the style when making changes.
> 
> Understand, but simple mark 'a' and 'A' to me. I will update patches and
> take care for next time instead search whole docuemnt to guess which one
> violated. I know I make some mistakes at here. But I am working on many
> difference kernel subsystems, some require upper case, some require low
> case, someone doesn't care.

Right, that's why I always suggest following the example of the
surrounding code and history.  English is the only language I know,
but I speculate that this typographical detail probably doesn't make
sense in languages that don't have a similar upper/lowercase
distinction.

Thanks for persevering; we'd be having a lot more trouble if I tried
to send emails in your native language ;)

Bjorn
