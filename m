Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CD180A5CD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 15:39:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Smv0x1Tj0z3dXc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 01:39:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Smv0S0QBNz2yRS
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Dec 2023 01:39:02 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Smv0G6ChVz6K5rY;
	Fri,  8 Dec 2023 22:38:54 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id A92FB140680;
	Fri,  8 Dec 2023 22:38:58 +0800 (CST)
Received: from localhost (10.126.175.81) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 8 Dec
 2023 14:38:58 +0000
Date: Fri, 8 Dec 2023 14:38:57 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 3/3] PCI/AER: Use explicit register sizes for struct
 members
Message-ID: <20231208143857.000061f4@Huawei.com>
In-Reply-To: <20231206224231.732765-4-helgaas@kernel.org>
References: <20231206224231.732765-1-helgaas@kernel.org>
	<20231206224231.732765-4-helgaas@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.175.81]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
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
Cc: Robert Richter <rrichter@amd.com>, Terry Bowman <terry.bowman@amd.com>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed,  6 Dec 2023 16:42:31 -0600
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> aer_irq() reads the AER Root Error Status and Error Source Identification
> (PCI_ERR_ROOT_STATUS and PCI_ERR_ROOT_ERR_SRC) registers directly into
> struct aer_err_source.  Both registers are 32 bits, so declare the members
> explicitly as "u32" instead of "unsigned int".
> 
> Similarly, aer_get_device_error_info() reads the AER Header Log
> (PCI_ERR_HEADER_LOG) registers, which are also 32 bits, into struct
> aer_header_log_regs.  Declare those members as "u32" as well.
> 
> No functional changes intended.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Another sensible cleanup. FWIW on such simple patches
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
