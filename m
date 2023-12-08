Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D0880A5C7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 15:38:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Smtzs1hs0z3dTN
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 01:38:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 105 seconds by postgrey-1.37 at boromir; Sat, 09 Dec 2023 01:38:07 AEDT
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmtzM73Qhz2yRS
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Dec 2023 01:38:07 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SmtzD3yjTz67XhB;
	Fri,  8 Dec 2023 22:38:00 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 5CBDF140D37;
	Fri,  8 Dec 2023 22:38:04 +0800 (CST)
Received: from localhost (10.126.175.81) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 8 Dec
 2023 14:38:03 +0000
Date: Fri, 8 Dec 2023 14:38:02 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 2/3] PCI/AER: Decode Requester ID when no error info
 found
Message-ID: <20231208143802.00007c3e@Huawei.com>
In-Reply-To: <20231206224231.732765-3-helgaas@kernel.org>
References: <20231206224231.732765-1-helgaas@kernel.org>
	<20231206224231.732765-3-helgaas@kernel.org>
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

On Wed,  6 Dec 2023 16:42:30 -0600
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> When a device with AER detects an error, it logs error information in its
> own AER Error Status registers.  It may send an Error Message to the Root
> Port (RCEC in the case of an RCiEP), which logs the fact that an Error
> Message was received (Root Error Status) and the Requester ID of the
> message source (Error Source Identification).
> 
> aer_print_port_info() prints the Requester ID from the Root Port Error
> Source in the usual Linux "bb:dd.f" format, but when find_source_device()
> finds no error details in the hierarchy below the Root Port, it printed the
> raw Requester ID without decoding it.
> 
> Decode the Requester ID in the usual Linux format so it matches other
> messages.
> 
> Sample message changes:
> 
>   - pcieport 0000:00:1c.5: AER: Correctable error received: 0000:00:1c.5
>   - pcieport 0000:00:1c.5: AER: can't find device of ID00e5
>   + pcieport 0000:00:1c.5: AER: Correctable error message received from 0000:00:1c.5
>   + pcieport 0000:00:1c.5: AER: found no error details for 0000:00:1c.5
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

