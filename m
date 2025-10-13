Return-Path: <linuxppc-dev+bounces-12796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C06BD3ACD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 16:50:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clgJV3LyGz30Vl;
	Tue, 14 Oct 2025 01:50:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.52 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760367050;
	cv=pass; b=G6RQCWc9vo0kmg06x0DqSXKIJ2l8FVGT0/qnW6g3l3wkHupNxS7HTfiLFqqw6UW302dwPjAbYS3hNXKWhnKfPy8GwOyGEOA76q2t3kl0CGoI40IMd6Ulrkl5YJLCND14MO2Qeae+bE2qWb8R9lOsFiNMpASWhbj5y9oxIxzY8hgwGqZ5WnxTbwz7+2rCsMZ3Z5mODZgqaRy65zF7zx3ArPjbcsSH8MgLzYcqG/UPUufcU0TLrCKXa/QgPpXXspYRNtcVm0kYBhOxAEgynn66Lxele7Ah0/9WS39x3y1oIw6BjB/XcAzDZi5mDB8OFy3rQqxSapuKN/rvsFcTbFs70Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760367050; c=relaxed/relaxed;
	bh=XZNOQWLvzBZ1kzkSz/b7ufcRpOTiV3AKvaULngWCBdY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LzmqHJDH/iZFD4uCNkMZ39AdZFcZnCU3vwlUqqZsuI4zRP1TOv/JSxFei3wAUptw0mb4YrCEyPCVL/OS1nJLmF2VcGwsdQJr2ZolYz0MDPCQIfepFXeOQs/WQ0nbPf8Dxnp5lQgak957QZBRuz+lJg0EnUIPd2j3aW31nR9H9UD8GLpY0oCKTZCPVTOr4xXGeqYOEUoRCn83FVnQsVtlxDV+TPJqDOE6/3786MZeUYWvm+AzaYhWH2GTF7EkGD1YOYUJgKX+NMhsDC7bQ82NIrYQUnSN2v4cSTEoYAQzMlDELOBpwXnOPzMyPOLB7AgSiZ8ccSN7RXz64+KQJpRFjg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=nJwGHJDK; dkim-atps=neutral; spf=pass (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=nJwGHJDK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clgJR5KZ2z30V1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 01:50:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760367034; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=quL2bNz82NHMBcEMb3CAyFMhSLOo6WKJnqAt9pYPhNfiQfBho026+YCzafA9Za6b8J
    ytV8rq97ahBomBTHu/u46LE89Cws3qHqpP0IDX1VnEG9HaDtXrmuVS5Uer+QyQ7YZqfj
    fvaVdEXf/5ozgIlobZ/vaGfOMArHGNdxh7Bpoqc+LJHluu7KHWA9zqONDHxTv8MHL4We
    yswqjUx4mWHF/+r2x7+5Kv7QQfWYLMP2hJgC1ADJavEM7G963DoDTveUKQZ+fNAd7h/H
    XzRzs7cGnsEq9MW5H59GMuuWqxaC4s2xTgFpc795r2zdsHbvk5FZPCjhmCrACZFxfoz6
    FI/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760367034;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=XZNOQWLvzBZ1kzkSz/b7ufcRpOTiV3AKvaULngWCBdY=;
    b=k6vKgcib9N1QX+4jM24U5FIr4hJFPHMQz8SUUUrKFeQiWyodOWNd8j4tKg4Yy3NqTx
    VrcppEMbc5fRGbOnRMvHwGICRRLuRDTi2ZfG9HrKXvit3WOtL2XeLZC6qNZBgqHhB9aF
    tQvaPt6dovs1+zEVhtSZrHbznroq0a9wy0TgfWWulcz04cQIfNtuZ4Lh0ZOdACx4cnW5
    lkpPQe2qtO1oz2bIMttYAZnemVkG4bxAIK8Ky43mVNKyepu+xAQWiTilfJwSixydnHMs
    hbItX64Q0oC255qvb4kKMptwX/8lmjITJxQ40+p6tWkuWu8QCRrdZ6xBmOZpJAsGBFVn
    doFg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760367034;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=XZNOQWLvzBZ1kzkSz/b7ufcRpOTiV3AKvaULngWCBdY=;
    b=nJwGHJDKgr8OVZA1QIatz+VRfVv8R+1aif97R29lLIbJkFHnyxW7ILclsqqDsYUgDe
    DPsuDrL4GSsaoITgznutois2ryXE8/FaUdn8AmOsrBLlSklqSDEUbgi3wbtIGw+eAH46
    B+Scclm9sGZuyD/cIYIbnOislgmGpriNFp5RkU4H8Z0oCIRexAMYp3p+iKW24DzaSYSu
    sl4KkDuxJ2eO+IZEgFxAPaKfiY3Xo6Lm35/V0ctDG8BtMmC23cTvxcgL073MNl6YYjN9
    Gi8EXsOYQAkATomMWWbe6192v/Vr/S8wqHavsbSku9laqlyr8LiW4CVQG4fgHR4vZsyu
    Wl3g==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIS+m7hvg"
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 53.4.2 DYNA|AUTH)
    with ESMTPSA id e2886619DEoVPNv
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 13 Oct 2025 16:50:31 +0200 (CEST)
Message-ID: <3fba6283-c8e8-48aa-9f84-0217c4835fb8@xenosoft.de>
Date: Mon, 13 Oct 2025 16:50:31 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org
References: <2E40B1CD-5EDA-4208-8914-D1FC02FE8185@xenosoft.de>
 <7FB0AB81-AD0F-420D-B2CB-F81C5E47ADF3@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <7FB0AB81-AD0F-420D-B2CB-F81C5E47ADF3@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 13 October 2025 at 07:23 am, Christian Zigotzky wrote:
> Better for testing (All AMD graphics cards):
>
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 214ed060ca1b..e006b0560b39 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -2525,6 +2525,15 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
> */
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
>
> +
> +static void quirk_disable_aspm_all(struct pci_dev *dev)
> +{
> +       pci_info(dev, "Disabling ASPM\n");
> +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
> +}
> +
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, PCI_ANY_ID, quirk_disable_aspm_all);
> +
> /*
> * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
> * Link bit cleared after starting the link retrain process to allow this
This patch has solved the boot issue but I get the following error 
messages again and again:

[  186.765644] pcieport 0001:00:00.0: AER: Correctable error message 
received from 0001:00:00.0 (no details found
[  187.789034] pcieport 0001:00:00.0: AER: Correctable error message 
received from 0001:00:00.0
[  187.789052] pcieport 0001:00:00.0: PCIe Bus Error: 
severity=Correctable, type=Data Link Layer, (Transmitter ID)
[  187.789058] pcieport 0001:00:00.0:   device [1957:0451] error 
status/mask=00001000/00002000
[  187.789066] pcieport 0001:00:00.0:    [12] Timeout
[  187.789120] pcieport 0001:00:00.0: AER: Correctable error message 
received from 0001:00:00.0 (no details found
[  187.789169] pcieport 0001:00:00.0: AER: Correctable error message 
received from 0001:00:00.0 (no details found
[  187.789218] pcieport 0001:00:00.0: AER: Correctable error message 
received from 0001:00:00.0 (no details found
[  188.812514] pcieport 0001:00:00.0: AER: Correctable error message 
received from 0001:00:00.0

I don't get these messages with the revert patch. [1]

-- Christian

[1] https://github.com/chzigotzky/kernels/blob/main/patches/e5500/pci.patch



