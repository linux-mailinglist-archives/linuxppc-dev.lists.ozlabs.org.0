Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8032719F34
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 16:08:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX7Jj41h6z3fgC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 00:08:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=<UNKNOWN>)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX7HH3xrnz3bcF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 00:07:05 +1000 (AEST)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QX7F664D3z6D8W5;
	Thu,  1 Jun 2023 22:05:14 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 1 Jun
 2023 15:06:58 +0100
Date: Thu, 1 Jun 2023 15:06:58 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v4 22/23] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <20230601150658.000021d4@Huawei.com>
In-Reply-To: <20230523232214.55282-23-terry.bowman@amd.com>
References: <20230523232214.55282-1-terry.bowman@amd.com>
	<20230523232214.55282-23-terry.bowman@amd.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, rrichter@amd.com, vishal.l.verma@intel.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, bhelgaas@google.com, Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org, bwidawsk@kernel.org, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 May 2023 18:22:13 -0500
Terry Bowman <terry.bowman@amd.com> wrote:

> From: Robert Richter <rrichter@amd.com>
> 
> In Restricted CXL Device (RCD) mode a CXL device is exposed as an
> RCiEP, but CXL downstream and upstream ports are not enumerated and
> not visible in the PCIe hierarchy. Protocol and link errors are sent
> to an RCEC.
> 
> Restricted CXL host (RCH) downstream port-detected errors are signaled
> as internal AER errors, either Uncorrectable Internal Error (UIE) or
> Corrected Internal Errors (CIE). The error source is the id of the
> RCEC. A CXL handler must then inspect the error status in various CXL
> registers residing in the dport's component register space (CXL RAS
> capability) or the dport's RCRB (PCIe AER extended capability). [1]
> 
> Errors showing up in the RCEC's error handler must be handled and
> connected to the CXL subsystem. Implement this by forwarding the error
> to all CXL devices below the RCEC. Since the entire CXL device is
> controlled only using PCIe Configuration Space of device 0, function
> 0, only pass it there [2]. The error handling is limited to currently
> supported devices with the Memory Device class code set
> (PCI_CLASS_MEMORY_CXL, 502h), where the handler can be implemented in
> the existing cxl_pci driver. Support of CXL devices (e.g. a CXL.cache
> device) can be enabled later.
> 
> In addition to errors directed to the CXL endpoint device, a handler
> must also inspect the CXL RAS and PCIe AER capabilities of the CXL
> downstream port that is connected to the device.
> 
> Since CXL downstream port errors are signaled using internal errors,
> the handler requires those errors to be unmasked. This is subject of a
> follow-on patch.
> 
> The reason for choosing this implementation is that a CXL RCEC device
> is bound to the AER port driver, but the driver does not allow it to
> register a custom specific handler to support CXL. Connecting the RCEC
> hard-wired with a CXL handler does not work, as the CXL subsystem
> might not be present all the time. The alternative to add an
> implementation to the portdrv to allow the registration of a custom
> RCEC error handler isn't worth doing it as CXL would be its only user.
> Instead, just check for an CXL RCEC and pass it down to the connected
> CXL device's error handler. With this approach the code can entirely
> be implemented in the PCIe AER driver and is independent of the CXL
> subsystem. The CXL driver only provides the handler.
> 
> [1] CXL 3.0 spec, 12.2.1.1 RCH Downstream Port-detected Errors
> [2] CXL 3.0 spec, 8.1.3 PCIe DVSEC for CXL Devices
> 
> Co-developed-by: Terry Bowman <terry.bowman@amd.com>
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> Cc: "Oliver O'Halloran" <oohall@gmail.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-pci@vger.kernel.org
> ---
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

