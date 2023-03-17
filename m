Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C85776BF83C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 07:07:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdrB25HWfz3fH2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 17:07:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tT2m/l/V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=lpieralisi@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tT2m/l/V;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdVDp3gcvz3bjb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 03:38:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8457E60A51;
	Fri, 17 Mar 2023 16:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B856C433EF;
	Fri, 17 Mar 2023 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679071093;
	bh=eqZUPeBX8BKdMjF5mwS63K8f+ED3apV6bCXS9iPYiZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tT2m/l/VZVW04GVsyt5LF3puq+zDlTtYsG+nbi0sgboS9phZAzuwK5Yllo5HjlUqR
	 fhrXMmSmXFZYNcnaJ9CHstgvjuyg0MthA4ejRXCllBXCKmiTpjM+cSQHLujbWJovpQ
	 PBnyIBbyTBxLjFVs6RMb8j6r6/3pM0dyFpeUr0+ApoITg7IIoK4daOS5e8rAO9/dLI
	 WS1pf7eYAfw0549GJa5H6E0+/9qbgh1pGjV+2Y8ARZABdijlHq0qRcQSxJ4p4NiQ+m
	 IUotYlMrhTKglYPy1bvLfGF3ppVkNGdigDOlopoEDjwYtpUrdA1idBW6JNLH1bAQLW
	 YXuju28VYx8NQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: helgaas@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/1] PCI: layerscape: Add EP mode support for ls1028a
Date: Fri, 17 Mar 2023 17:38:05 +0100
Message-Id: <167907106433.509815.4523416530064745117.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230209151050.233973-1-Frank.Li@nxp.com>
References: <20230209151050.233973-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 18 Mar 2023 17:05:29 +1100
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
Cc: kw@linux.com, imx@lists.linux.dev, alok.a.tiwari@oracle.com, Lorenzo Pieralisi <lpieralisi@kernel.org>, frank.li@nxp.com, linux-kernel@vger.kernel.org, minghuan.lian@nxp.com, mingkai.hu@nxp.com, linux-pci@vger.kernel.org, bhelgaas@google.com, roy.zang@nxp.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 09 Feb 2023 10:10:50 -0500, Frank Li wrote:
> Add PCIe EP mode support for ls1028a.
> 
> 

Applied to controller/layerscape, thanks!

[1/1] PCI: layerscape: Add EP mode support for ls1028a
      https://git.kernel.org/pci/pci/c/be567c6cbc08

Thanks,
Lorenzo
