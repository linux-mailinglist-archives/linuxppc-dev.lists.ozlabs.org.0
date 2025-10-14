Return-Path: <linuxppc-dev+bounces-12809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B417CBD7544
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 06:55:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm22w1cjVz2ytg;
	Tue, 14 Oct 2025 15:55:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.82 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760417720;
	cv=pass; b=k0FHAy/PYw4E/qLmQPcI7aplDieFwwhKRlg4DZ4dWkqPpRQ4A3oqMX3BGJP/5rTsW+aWf/Q7+LQPTdxXFTDSq3P9n+7/qVtyDvNLOopX5un51ewfuypbNkjPAyzovXG/VtfwHM5Qow5BG+HOJ8hhXWFAWJTdOjh+YekSJVIYQAapef1XBr0Q85554zllF3UfMTSkXPYAfyPv7wsVfkZRqKXHELfsiG89yGS1Kv/Hyy84Hk16ZF+giLlZ5E2KOyruSmsESslgxklxezo0fydFruU0kOnoWmZ/UZoJpLaq37PWKDijL7UrDBaGu4a0egenEUauZrQv9cU3hmwf25C1xQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760417720; c=relaxed/relaxed;
	bh=hV8ZC/V0/OWSHfrniV/9zBloFxclLSNdoEiXRi/9DhY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kyTulu8n/Leh+mQSG/YJwyM0q8t6gWw9eBvCnkahd8CUK3S2003Cvc84msFNzTAD26CP1F4bHCFOFBjQcZ4eHiP5z+w3rNEtBYw/91G9kLk8wgYmJP/ajKO5NaOGEwJyeqaOG1o9h/j2tY7LP/6hJVBDAGlnBhUOhRVWevfFNqIqPGruGVWejWmJ7Tb52PZc+4geERFm4cw+13MzoEmauQvDNxAzUcMCmap2vvdWa2vHLh+yNNEpKf6Rp2/JASCDc/vk7FN+cCuExMQT41dPoWZp70NesVO9EniTEppZaALyrZAVjw2p1JCGK8lLw+5lYyh9aOgu9VUTCxaMW6GErA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=TrpDSf/6; dkim-atps=neutral; spf=pass (client-ip=85.215.255.82; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=TrpDSf/6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.82; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cm22s4nfLz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 15:55:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760417707; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bbH6fXZIG3uRo/kY9a/ZoobMnmYOpuRDGr1KnINfIAWkngjd+3ZCjbqNyJAN5hd5I5
    ME3CcG8DcxlG+7hh9RPBPoIfk/K88kce6+XNxuDkfqyTsun5GHVs636zFpldsp6/Dv0D
    tYjkZVEwBDWusKWVy/mskZ8XiY6C6fHXsUPOMHkDRmrxe4n116WuaBy9bcfYhqiAq5oG
    7nKjL230tk+S3hrNSQomRxoyWtAq1UDbMPo7yhC7OIn0ZLOhupXg5QHgIoS6h8HMkPn3
    9Z1uPvHm03kAjP/FM4jc8EaGkAMXO3EmR+cOiknMUZ1/EmFVOhHdMVzEWrYp6qSr8QKI
    qoIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760417707;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=hV8ZC/V0/OWSHfrniV/9zBloFxclLSNdoEiXRi/9DhY=;
    b=kjh9APTo1XwZqBL1CwVyxffA6i7Oh5nqtqCqF0Qd+nIfvHAmWv+fyGpitST/ekH6WW
    cfVaseBQOXNN+Rx//0EIckVoNzo148RkQ8TumWGypDggu9KD/PsKwnXLdUf4BZpQQNRX
    LtvPJe9cp/CdCtO76BIDJhNhq9oyb3rZGrqx5h6uKOzXklV5F2qoe74m1aCT5ooIFIX8
    p4lOo7xGxOEInWKb3pN9Alj+ERyzgUR6OnaBo5EL8Jy4GKWgikpE4Fq7SOq+jGvXcVEy
    I4E2XHn9BgbFqX3wq6MMMBEyernSIQtqTvY3l2m3ipmOslqXehvEGXLZv/djyN3W77Fr
    Oyaw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760417707;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=hV8ZC/V0/OWSHfrniV/9zBloFxclLSNdoEiXRi/9DhY=;
    b=TrpDSf/6p/EEppeogIKAr0/s1DiJxomU9xs8jLgKiMbC5PTr1T96zpFnbzkwXlWdGD
    MTsDS+kCyP+s4ry8NjQ5xrsfE7v3I0YcOILifuYx4fubImMG11VYB6/TDLa13m23sf1G
    O30QRusdaeafhSLqMUqQRlXMfF0RMrv1AYBfGgcdkoU3SZnyk1URkaGbGDuE0h0pryFq
    JGRW4VFBIdUaPifcfQTu7p/YAVHFD4TIs5jq62xy0EKd0NAfl4ONviSX5dVBkWUyQMrQ
    LeA01IwlObDQDqI21Zl4DGnde5sXvgeXBDU4ERAwSLY30QX5bnRfE3rxrHQ9IJ+NDVYQ
    0yWw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIS+kgQ=="
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 53.4.2 DYNA|AUTH)
    with ESMTPSA id e2886619E4t7QVS
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 14 Oct 2025 06:55:07 +0200 (CEST)
Message-ID: <00fe408b-db39-4a9f-b996-0fad73724759@xenosoft.de>
Date: Tue, 14 Oct 2025 06:55:07 +0200
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
 <3fba6283-c8e8-48aa-9f84-0217c4835fb8@xenosoft.de>
 <mg2ahzgcwgm6h5mtgs4tsel3yrphrfqgfcjydfxgzgxq5h7kot@jtealdt6vvcz>
 <a2ee06b1-28a5-4cb1-9940-b225f9e6d6ee@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <a2ee06b1-28a5-4cb1-9940-b225f9e6d6ee@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 13 October 2025 at 05:58 pm, Manivannan Sadhasivam wrote:
 > Either the Root Port could be triggering these AER messages due to 
ASPM issue or
 > due to the endpoint connected downstream.
 >
 > If possible, please share the whole dmesg log instead of the snippet 
so that we
 > can be sure from where the AER messages are coming from.
 >
 > You can also add the below quirk and check:
 >
 > DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_FSL, 0x0451, 
quirk_disable_aspm_all);
 >
 > But it would be better to get the whole dmesg.
 >
 > - Mani

Hello Mani,

Thanks for your help.

The kernel doesn't compile with PCI_VENDOR_ID_FSL but it compiles with 
PCI_VENDOR_ID_FREESCALE.

I tried it with the following patch:

diff -rupN a/drivers/pci/quirks.c b/drivers/pci/quirks.c
--- a/drivers/pci/quirks.c    2025-10-12 22:42:36.000000000 +0200
+++ b/drivers/pci/quirks.c    2025-10-13 17:59:51.473097708 +0200
@@ -2525,6 +2525,16 @@ static void quirk_disable_aspm_l0s_l1(st
   */
  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, 
quirk_disable_aspm_l0s_l1);

+
+static void quirk_disable_aspm_all(struct pci_dev *dev)
+{
+       pci_info(dev, "Disabling ASPM\n");
+       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
+}
+
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, PCI_ANY_ID, 
quirk_disable_aspm_all);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_FREESCALE, PCI_ANY_ID, 
quirk_disable_aspm_all);
+
  /*
   * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
   * Link bit cleared after starting the link retrain process to allow this

---

Unfortunately it doesn't solve the issue with pcieport 0001:00:00.0.

Here is the dmesg of the RC1 of kernel 6.18 with this patch applied: 
https://github.com/user-attachments/files/22896410/dmesg_fsl_ppc.txt

Cyrus Plus block diagram: 
https://github.com/chzigotzky/kernels/issues/17#issuecomment-3400086860

Thanks,
Christian



