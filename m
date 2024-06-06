Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B2E8FF015
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 17:12:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw79M3qmyz3fm9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 01:12:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 299 seconds by postgrey-1.37 at boromir; Fri, 07 Jun 2024 01:11:59 AEST
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw78v5LDlz3fSs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 01:11:59 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vw73S6W3Xz6K5sn;
	Thu,  6 Jun 2024 23:07:16 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F1991402C7;
	Thu,  6 Jun 2024 23:11:56 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 6 Jun
 2024 16:11:55 +0100
Date: Thu, 6 Jun 2024 16:11:54 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: Re: [PATCH v4 3/3] PCI/AER: Clear UNCOR_STATUS bits that might be
 ANFE
Message-ID: <20240606161154.00002605@Huawei.com>
In-Reply-To: <20240509084833.2147767-4-zhenzhong.duan@intel.com>
References: <20240509084833.2147767-1-zhenzhong.duan@intel.com>
	<20240509084833.2147767-4-zhenzhong.duan@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
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
Cc: linmiaohe@huawei.com, alison.schofield@intel.com, rafael@kernel.org, sathyanarayanan.kuppuswamy@intel.com, linux-pci@vger.kernel.org, erwin.tsaur@intel.com, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com, ira.weiny@intel.com, dave@stgolabs.net, dave.jiang@intel.com, vishal.l.verma@intel.com, Smita.KoralahalliChannabasappa@amd.com, linux-acpi@vger.kernel.org, helgaas@kernel.org, lenb@kernel.org, chao.p.peng@intel.com, rrichter@amd.com, yudong.wang@intel.com, bp@alien8.de, qingshun.wang@linux.intel.com, bhelgaas@google.com, dan.j.williams@intel.com, linux-edac@vger.kernel.org, tony.luck@intel.com, feiting.wanyan@intel.com, adam.c.preble@intel.com, mahesh@linux.ibm.com, lukas@wunner.de, james.morse@arm.com, linuxppc-dev@lists.ozlabs.org, shiju.jose@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu,  9 May 2024 16:48:33 +0800
Zhenzhong Duan <zhenzhong.duan@intel.com> wrote:

> When processing an ANFE, ideally both correctable error(CE) status and
> uncorrectable error(UE) status should be cleared. However, there is no
> way to fully identify the UE associated with ANFE. Even worse, Non-Fatal
> Error(NFE) may set the same UE status bit as ANFE. Treating an ANFE as
> NFE will bring some issues, i.e., breaking softwore probing; treating
> NFE as ANFE will make us ignoring some UEs which need active recover
> operation. To avoid clearing UEs that are not ANFE by accident, the
> most conservative route is taken here: If any of the NFE Detected bits
> is set in Device Status, do not touch UE status, they should be cleared
> later by the UE handler. Otherwise, a specific set of UEs that may be
> raised as ANFE according to the PCIe specification will be cleared if
> their corresponding severity is Non-Fatal.
> 
> For instance, previously when kernel receives an ANFE with Poisoned TLP
> in OS native AER mode, only status of CE will be reported and cleared:
> 
>   AER: Correctable error message received from 0000:b7:02.0
>   PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)
>     device [8086:0db0] error status/mask=00002000/00000000
>      [13] NonFatalErr
> 
> If the kernel receives a Malformed TLP after that, two UEs will be
> reported, which is unexpected. Malformed TLP Header is lost since
> the previous ANFE gated the TLP header logs:
> 
>   PCIe Bus Error: severity="Uncorrectable (Fatal), type=Transaction Layer, (Receiver ID)
>     device [8086:0db0] error status/mask=00041000/00180020
>      [12] TLP                    (First)
>      [18] MalfTLP
> 
> Now, for the same scenario, both CE status and related UE status will be
> reported and cleared after ANFE:
> 
>   AER: Correctable error message received from 0000:b7:02.0
>   PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)
>     device [8086:0db0] error status/mask=00002000/00000000
>      [13] NonFatalErr
>     Uncorrectable errors that may cause Advisory Non-Fatal:
>      [18] TLP
> 
> Tested-by: Yudong Wang <yudong.wang@intel.com>
> Co-developed-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
> Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This is nasty enough though that it would benefit from more review
if possible.  

Thanks for all the detailed explanations in the patch descriptions,
that made it less painful than it might have been.

Jonathan


