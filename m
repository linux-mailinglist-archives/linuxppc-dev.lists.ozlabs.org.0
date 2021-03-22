Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805C1344D36
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 18:26:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F41cf02CKz30Lt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 04:26:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=lorenzo.pieralisi@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F41cJ0TDQz301N
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 04:25:49 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A738C113E;
 Mon, 22 Mar 2021 10:25:45 -0700 (PDT)
Received: from e123427-lin.arm.com (unknown [10.57.49.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3233B3F719;
 Mon, 22 Mar 2021 10:25:43 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Bjorn Helgaas <helgaas@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
Subject: Re: [PATCH] PCI: layerscape: Correct syntax by changing comma to
 semicolon
Date: Mon, 22 Mar 2021 17:25:36 +0000
Message-Id: <161643390998.3356.13620693007705866206.b4-ty@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210311033745.1547044-1-kw@linux.com>
References: <20210311033745.1547044-1-kw@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Minghuan Lian <minghuan.Lian@nxp.com>, linux-pci@vger.kernel.org,
 Zheng Yongjun <zhengyongjun3@huawei.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Mar 2021 03:37:45 +0000, Krzysztof Wilczyński wrote:
> Replace command with a semicolon to correct syntax and to prevent
> potential unspecified behaviour and/or unintended side effects.
> 
> Related:
>   https://lore.kernel.org/linux-pci/20201216131944.14990-1-zhengyongjun3@huawei.com/

Applied to pci/layerscape, thanks!

[1/1] PCI: layerscape: Correct syntax by changing comma to semicolon
      https://git.kernel.org/lpieralisi/pci/c/1b7996a528

Thanks,
Lorenzo
