Return-Path: <linuxppc-dev+bounces-12808-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 240B1BD74FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 06:48:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm1tp5Wkwz2ytg;
	Tue, 14 Oct 2025 15:48:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.165 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760417298;
	cv=pass; b=DgM8bvot9AhiXmUMHKPbsD8ngL0gbBvyGYdobUJCbd0EzdzKxH9UqLHbhQO2emyvW6ESS0lbOp8iuD4ufAUB4C/pUGQnv2FRzm0IV7GuQHDVAuhflg2HXuDkD1UrMxFZwumk7Dq2tceaxu4QR0CZ6bj+0vUB5h+vr1+irhjJtdRyq+vXMy7t5KqIix7BI4/uNPYGmG30tiyz/aD+33MjnX/J3/trxApOSiLCR/urqoRQOSKV0JgGisl+uuW6dBm1y/xSUD9QkPhfQkkjxhsQW8BinHB14W7voN5Ch10LL5sKpHWTxp8CgVBFKXUdsJFA1ubdnQ5weR7tvS5ecac1AQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760417298; c=relaxed/relaxed;
	bh=RTil2rnrnvQW2sDsnN7+BrGkDRqr21KY/AtiboooUOU=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=DzuewT/6gBO4ePhWsXTEpSVPSeRmwZJluvy41I62No+MCpJqatAmzFHj0+I7M4oDdVRmxjdgwdeS/YxtadfHNBFiXNlro735VD3qsVLixY+R731Vj+JXK03YydmZuaOtlRRfZ7fssOXPfb1Msw9BqyLuHMeP3H9sjJcT09wVgSzBtZdQ+4icpr7ul1JURRN7djWvs5lhgDB8Tge9286frnlbN+iK5a8NOx9WdAIr9DPUSrQybX27wuWVk29yqlTw4QOf2gDIO8WyfjPTNeQM+TbPGzMUJGecRoNFpf1ZikkZtHwNYOfp05Oobt1UEZex8CszZY+b/W2+pyitz9NQtQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=HPB7K0bK; dkim-atps=neutral; spf=pass (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=HPB7K0bK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cm1tl56P4z2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 15:48:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760417283; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=IYO7jX7C1fyTMxN6CKWPYke6RZlDgWa6UkZz1gIfKvMeoYyw0h+drIVbQUNX172moU
    w/VZ0t9TOHNFVVhfYBhg0id7Znwp544pp1eFV+m0L0MWYFvljDLfOWJr7m+f/FZID8pi
    yCqKUuKa4FtwK3/4Wz+veMBD0VBV7u/2mtj0iqE+4BHOT75NwT2n7Sd/B0boVbuC3hNQ
    5azDU/l7FL0tS3puofHg8ovgoGTBeFeiD0NJPVMuXKfi2GgPhtuSxrkxyNmCMVxrt/EY
    cUymlGKmycfIJGTACrJQsSSi317ngCY9jKmuxW78JYFDkMKIwH5PxSaetsUC7uPmybYB
    B6Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760417283;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=RTil2rnrnvQW2sDsnN7+BrGkDRqr21KY/AtiboooUOU=;
    b=CP0qoTzxxwZUXAVU63o4e3JF7zqgUL/lOz16prxpoIduG9Zxi06hT9hGVcNYXLaF1J
    yvVvcYGI4uYckfsKyV3l+41YhupPz8dYavuXXsNRS8Q3omCIFLDoKv1mP3NlN/oAEQD9
    3L1OgqAJ04Jv7Z7kB9fpB0a3XJ8cN8MKFYyIa4gMOgow7Dl6Lgk6RS7tXeOgPbaNFJoB
    BPFvNrYWfNLLnOVp2JgzuuCb7Bht4GxzJT1Cd3/TBFNSzV13DuWH+MjrYFFUKAi6/MwA
    lmfjdoWgJm855JxzBPCtE33HnK1oSbE648OqKy+jQwmTjHC3dy81Efy6ZEAtMICux+GA
    Xn5g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760417283;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=RTil2rnrnvQW2sDsnN7+BrGkDRqr21KY/AtiboooUOU=;
    b=HPB7K0bK45/F0V2eqHMmabPUMe4t4310R6QB1DDxHe7YNTtIC8hZuREDoMsGX4yjgB
    Qujj09cOka2VzGUqsTBEa34vObPBC90q9km8iWVMR0ai8WOj+q5q2fCq4pAgA1AHN1SV
    dUGi58LCjMT4bXImU1S2HNfHA55MMYyFWZw0xMuVIgyjpTKofxihBzbqT/BfBFG/AQzt
    NG3wRNDJMIr/KtXUiNzxtcDaIcqGFYdT+NOiQdqSwTGN7rA8mHEByLFoQHFy+JoxO/qI
    5NPh4f9GjfYGH3B5qYZYFsTuz2ACz+E4W4qRPWdx2HrpYRF/9kE7qLCUxGp8aMb4qwLL
    +j3g==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIS+kgQ=="
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 53.4.2 DYNA|AUTH)
    with ESMTPSA id e2886619E4m2QV8
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 14 Oct 2025 06:48:02 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary="------------tCJzXFfxlu4DNEr97CKxlExq"
Message-ID: <a2ee06b1-28a5-4cb1-9940-b225f9e6d6ee@xenosoft.de>
Date: Tue, 14 Oct 2025 06:48:01 +0200
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
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <mg2ahzgcwgm6h5mtgs4tsel3yrphrfqgfcjydfxgzgxq5h7kot@jtealdt6vvcz>
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------tCJzXFfxlu4DNEr97CKxlExq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13 October 2025 at 05:58 pm, Manivannan Sadhasivam wrote:
> Either the Root Port could be triggering these AER messages due to ASPM issue or
> due to the endpoint connected downstream.
>
> If possible, please share the whole dmesg log instead of the snippet so that we
> can be sure from where the AER messages are coming from.
>
> You can also add the below quirk and check:
>
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_FSL, 0x0451, quirk_disable_aspm_all);
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

--------------tCJzXFfxlu4DNEr97CKxlExq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 13 October 2025 at 05:58 pm,
      Manivannan Sadhasivam wrote:<span style="white-space: pre-wrap">
</span></div>
    <blockquote type="cite"
cite="mid:mg2ahzgcwgm6h5mtgs4tsel3yrphrfqgfcjydfxgzgxq5h7kot@jtealdt6vvcz">
      <pre wrap="" class="moz-quote-pre">Either the Root Port could be triggering these AER messages due to ASPM issue or
due to the endpoint connected downstream.

If possible, please share the whole dmesg log instead of the snippet so that we
can be sure from where the AER messages are coming from.

You can also add the below quirk and check:

DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_FSL, 0x0451, quirk_disable_aspm_all);

But it would be better to get the whole dmesg.

- Mani
</pre>
    </blockquote>
    Hello Mani,<br>
    <br>
    Thanks for your help.<br>
    <br>
    The kernel doesn't compile with PCI_VENDOR_ID_FSL but it compiles
    with PCI_VENDOR_ID_FREESCALE.<br>
    <br>
    I tried it with the following patch:<br>
    <br>
    diff -rupN a/drivers/pci/quirks.c b/drivers/pci/quirks.c<br>
    --- a/drivers/pci/quirks.c    2025-10-12 22:42:36.000000000 +0200<br>
    +++ b/drivers/pci/quirks.c    2025-10-13 17:59:51.473097708 +0200<br>
    @@ -2525,6 +2525,16 @@ static void quirk_disable_aspm_l0s_l1(st<br>
      */<br>
     DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080,
    quirk_disable_aspm_l0s_l1);<br>
     <br>
    +<br>
    +static void quirk_disable_aspm_all(struct pci_dev *dev)<br>
    +{<br>
    +       pci_info(dev, "Disabling ASPM\n");<br>
    +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);<br>
    +}<br>
    +<br>
    +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, PCI_ANY_ID,
    quirk_disable_aspm_all);<br>
    +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_FREESCALE, PCI_ANY_ID,
    quirk_disable_aspm_all);<br>
    +<br>
     /*<br>
      * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe
    Retrain<br>
      * Link bit cleared after starting the link retrain process to
    allow this<br>
    <br>
    ---<br>
    <br>
    Unfortunately it doesn't solve the issue with pcieport 0001:00:00.0.<br>
    <br>
    Here is the dmesg of the RC1 of kernel 6.18 with this patch applied:
    <a class="moz-txt-link-freetext" href="https://github.com/user-attachments/files/22896410/dmesg_fsl_ppc.txt">https://github.com/user-attachments/files/22896410/dmesg_fsl_ppc.txt</a><br>
    <br>
    Cyrus Plus block diagram:
    <a class="moz-txt-link-freetext" href="https://github.com/chzigotzky/kernels/issues/17#issuecomment-3400086860">https://github.com/chzigotzky/kernels/issues/17#issuecomment-3400086860</a><br>
    <br>
    Thanks,<br>
    Christian<br>
    <br>
  </body>
</html>

--------------tCJzXFfxlu4DNEr97CKxlExq--

