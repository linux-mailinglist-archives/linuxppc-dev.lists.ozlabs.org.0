Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80838303AE8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 11:58:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ3cZ1Nb1zDqyx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 21:58:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=lorenzo.pieralisi@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DQ3Z71pfrzDqgV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 21:56:13 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB1EBD6E;
 Tue, 26 Jan 2021 02:56:10 -0800 (PST)
Received: from e123427-lin.arm.com (unknown [10.57.43.61])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E284B3F66B;
 Tue, 26 Jan 2021 02:56:08 -0800 (PST)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: linux-kernel@vger.kernel.org, Michael Walle <michael@walle.cc>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] PCI: dwc: layerscape: convert to builtin_platform_driver()
Date: Tue, 26 Jan 2021 10:55:58 +0000
Message-Id: <161165853056.18662.6546479628438785039.b4-ty@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210120105246.23218-1-michael@walle.cc>
References: <20210120105246.23218-1-michael@walle.cc>
MIME-Version: 1.0
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
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Saravana Kannan <saravanak@google.com>, Roy Zang <roy.zang@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 20 Jan 2021 11:52:46 +0100, Michael Walle wrote:
> fw_devlink will defer the probe until all suppliers are ready. We can't
> use builtin_platform_driver_probe() because it doesn't retry after probe
> deferral. Convert it to builtin_platform_driver().

Applied to pci/dwc, thanks!

[1/1] PCI: dwc: layerscape: Convert to builtin_platform_driver()
      https://git.kernel.org/lpieralisi/pci/c/538157be1e

Thanks,
Lorenzo
