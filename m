Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0273F3D14
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Aug 2021 04:12:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gsf5M5fRvz3d8J
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Aug 2021 12:12:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IISxpUq6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.94.44;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=sdonthineni@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=IISxpUq6; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GsMmd6nG2z30Cj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Aug 2021 01:26:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSRHI4UNmIxkZZlNxMdmF/de+5Yi8Hi/OP/gSygU/vI3c+mXpU6kgenqRN7V86lQAEP9GLwC5fyy+SawdvSdvyOFgSaXy8XXCm/XN2824mUYqSPe3lMQEEF/Dvix3HEXaypket7ds3Bv7uoOcUsarGMaIw51yOS3DOKwjtvWT0dgUWLCF435IWkF8XixfHoPpUWzx87uew/ZS6l0rfEBx5pV7aTberJhpUfCuf0t+px2TAl6pTWKRTVRqqDy5weZewTdvfYBVu0EXqn6FrHNGfRsB26dF0nBZLPF068xhOhbAP+usY4aQWWcoWOza5Ulbx2WR3D0PU9Zm68W9ZplXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwjPogDO3TSbsa82gbCFuwOlaaer8naLrSo43m9KRuw=;
 b=eG4py7hW0IcCR8LgVCXK/u4F+ZY7yGH/tBKY3Q0Fotg5mZI+lAVN2ItKx3SSr02wJolCbUFfBjs990I8uKj9uHE3+wJJoVNxiwFO0GTe0AdPCo6NqwzdAKcsEBCmd8+6+2kg1GuH/gBMBCMw2p+m08vLd0vTBBJpXBZILZH5iidhJvMyXkIfuqDznOsGRBDQjREV31JywBXTcuOQrzqOm0G0m23tuwRXFyfS/oTGeC/2T5oiS2qJxNp2Tz2+8MW7XdzQTH5q4cP1nR0bSvJD8mA4KOFUo6Xq2BZMi6+B4cnR0FT9zFCG1T00arxvYXDfY0mCFsNwWU+I8JHxIPmGAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=russell.cc smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwjPogDO3TSbsa82gbCFuwOlaaer8naLrSo43m9KRuw=;
 b=IISxpUq6mdFEhrOMTm/m0t+icIIrVBexkPfaf56r7/K00CZuYepEDnie8TiYeqsQga3j0/mc7EkPq6Mq8a/9qDq8tqo9nVPQd/nx9z4QAjezBbMmmjyiP/dQloQMHRdpVuRqeqfNITJ81FECRk2On9MJYwnujtYQTQQLV6S1c10A2gUtRgoe+HaAPiB3ot+2IAAMK4LyV+ejhTE42H1P/FwhJUuQ1ImeqEMX8cfndS/pbvI5jFJ0syfEhva1kfMdo2OjiEgJmwAWUEpW9cRwMtkCr+59uarKU+y75b7ABZFzKehUlet4YekZRrhM1ESTjKqGrAMhd9wYA+fT3576zw==
Received: from BN9PR03CA0562.namprd03.prod.outlook.com (2603:10b6:408:138::27)
 by DM6PR12MB4370.namprd12.prod.outlook.com (2603:10b6:5:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Sat, 21 Aug
 2021 15:26:20 +0000
Received: from BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::9a) by BN9PR03CA0562.outlook.office365.com
 (2603:10b6:408:138::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Sat, 21 Aug 2021 15:26:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; russell.cc; dkim=none (message not signed)
 header.d=none;russell.cc; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT059.mail.protection.outlook.com (10.13.177.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Sat, 21 Aug 2021 15:26:19 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 21 Aug
 2021 15:26:19 +0000
Received: from [10.20.115.83] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 21 Aug
 2021 15:26:17 +0000
Subject: Re: [PATCH] PCI/AER: Continue AER recovery of device with
 NO_BUS_RESET set
To: Bjorn Helgaas <bhelgaas@google.com>
References: <20210821133058.31583-1-sdonthineni@nvidia.com>
From: Shanker R Donthineni <sdonthineni@nvidia.com>
Message-ID: <f8719589-e56a-25c1-b955-4abd67cf7490@nvidia.com>
Date: Sat, 21 Aug 2021 10:26:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210821133058.31583-1-sdonthineni@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c13ad4fc-55e3-4433-ae4e-08d964b806b3
X-MS-TrafficTypeDiagnostic: DM6PR12MB4370:
X-Microsoft-Antispam-PRVS: <DM6PR12MB437017EFF3C560E7E60DA2DDC7C29@DM6PR12MB4370.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pqdH+0qm0zQk6qkauCbc7r0woW9uftT4l/da0vnpqpyi93tJGJ4YlWDEgc6l5yCZeq9RewpNUmsl8Z4uDvG6hcGg4bgClVfy9L9Z+peMAKLM5bxr9pNvs3T9qRivNrCPd79cn/uQMOlsWC/kCK3wCkvvUJ7/Mdxs3XMjVuzqZaLYp76gZVbCAX8IuFn0NiAqL4C8LPCrtFCs+lu6GZLVIQhjECgqlcx9KTbOTdVufr3TD7sfRUClL7tp5MQ2KKjTYpG3OiVzdHrgBHC0k1xbCB2czrQxDCUDGG4EsnIu9CtAiZoRFkWn+3fV5bC1oKMSOB/JoTGco6EI3SYxGu6px8AtpBCmygTu8ueYtBuRjPDDAvy47/uCVDN953OcJD1KKVdtRC4VTnSo3yc4qlrCJ2ruMam5ft6JCIVwevy6SklrEwyJHPepNrtEh07kp1fjaLxUQ5zaQhHFQRJCyuann1jPzvJObFbIasJSCC/krh9KYLl3cl3Vn/FwB3dfAtvlftiOz/rphsnIzCdkfBWUDp19E9UhZ8EhYAmb1K4hQK06PHYJLUEbiid5GZP3hwcDMPOiTxeKhx9jgsMZipZ+2lUk5dctwN6/wGPFVHQEt38LYWHOA6STcabvnvj/1UD4yaFhqmJap3PJ9OcwWROsvM/ESit3wYOHMfx2fKefB+7J5ruWNNxDL7AMHhrW9JJEQKaVRJHn7X8nrilkxmOcUICP9f4P97g5TUup0REeZbyRL3ojSHRRIzkVkobGc7boS97Kjcm36aEA5X/rNTRhwA==
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(36840700001)(46966006)(31696002)(82310400003)(8676002)(47076005)(2906002)(478600001)(36756003)(426003)(316002)(70206006)(16576012)(336012)(70586007)(8936002)(36906005)(2616005)(54906003)(36860700001)(31686004)(26005)(16526019)(82740400003)(53546011)(83380400001)(5660300002)(4326008)(186003)(6916009)(86362001)(356005)(7636003)(21314003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2021 15:26:19.7325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c13ad4fc-55e3-4433-ae4e-08d964b806b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4370
X-Mailman-Approved-At: Sun, 22 Aug 2021 12:10:44 +1000
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, Oliver
 O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/21/21 8:30 AM, Shanker Donthineni wrote:
> External email: Use caution opening links or attachments
>
>
> In the current implementation, the AER FATAL and NONFTAL recovery will be
> terminated for the device that exhibits NO_BUS_RESET quirk. The non-zero

Correction, this problem happens only for AER_FATAL recovery case.

> return value from pci_bus_error_reset() is treated as an error condition
> in aer_root_reset() which leads to return PCI_ERS_RESULT_DISCONNECT.
>
>   aer_recover_work_func()
>     pcie_do_recovery()
>       report_frozen_detected()
>       if (aer_root_reset() == PCI_ERS_RESULT_DISCONNECT)
>          goto failed           # termimates here because of NO_BUS_RESET
>
>       ...
>       report_mmio_enabled()
>       report_resume()
>       pcie_clear_xxx_status()
>       ...
>       return 0
>   failed:
>       pci_uevent_ers(PCI_ERS_RESULT_DISCONNECT);
>
> The return value -ENOTTY from pci_bus_error_reset() indicates SBR was
> skipped but no real errors were encountered. This scenario could be
> considered as a non-error case so that the PCI device driver gets the
> opportunity to recover the device back to an operational state instead
> of keeping it in the DISCONNECT state.
>
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> ---
>  drivers/pci/pcie/aer.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 9784fdcf30061..8cf6bd6a3376d 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1414,8 +1414,12 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
>                         pci_info(dev, "not reset (no FLR support: %d)\n", rc);
>         } else {
>                 rc = pci_bus_error_reset(dev);
> -               pci_info(dev, "%s Port link has been reset (%d)\n",
> -                       pci_is_root_bus(dev->bus) ? "Root" : "Downstream", rc);
> +               pci_info(dev, "%s Port link has %sbeen reset (%d)\n",
> +                       pci_is_root_bus(dev->bus) ? "Root" : "Downstream",
> +                       rc == -ENOTTY ? "not " : "", rc);
> +
> +               if (rc == -ENOTTY)
> +                       rc = 0;
>         }
>
>         if ((host->native_aer || pcie_ports_native) && aer) {
> --
> 2.25.1
>

