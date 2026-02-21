Return-Path: <linuxppc-dev+bounces-17000-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ee2nM2kmmmnfZAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17000-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Feb 2026 22:40:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E41016DF33
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Feb 2026 22:40:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJLC95w7Yz2xNT;
	Sun, 22 Feb 2026 08:40:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771692285;
	cv=none; b=UQKzgufBaXB/N0IJnG6ZshDThjLDTF6PZEHoFbI2nDCDZ+tOQcBcTJGHCDKX3SOpYq69IyQr4P93q3qNjEsP/nOWOkPUTfFGT75npXniM0B3+7RvBUKvFUNclL+wbUNT2qhpg/NH6wuknjBG3nVBM5vdXdq1eXbaqi0bGDosCH+rQxFsoVrMc+luZT8N0RyL20nScIRuOamrOaGM7ZLAvevbbe5dh20bP3ucRM1jcahI0I80C4L1+mf+u4cKGl+qrnlHj5LuEYNPvgioSl5Fq3nueRV6uSS67h++Lp71ko+pJYgy+iZQv/yxK0YgdXxACVEzcQe9DNKbRzZNKwvT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771692285; c=relaxed/relaxed;
	bh=eE2b6J8MoKoJciV+vNZFu4wv1hIVgksS6b0uGzsvRYo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ga/vBoaJTtt7XYaz48549m6c4p5n22jhHh21ZEtNuH8bXle/5nRwVbJ+tL1qFnx4TNGzL9ApDdiYbdTN2FV6/uS2yxs6NG9G5YoBKKeCXPCZ4elCb+UFpH37o7fE0oyN1qIbmhGLwAEK+w3jcXLlgYNYUdtmUuplZzAUA5wedxcT7zk9SztrCQxp7tNlWz/0Dy7li+1Z8S+oK24DCJRFgnUuRxhyoSxN6tMAlJJZmAoBISUTOB4RNCHsTBCxE0WmSEN8AIbKXlhJXSEy5pEglTC+UTSSJswElRfWlVyn8o0Y6m4MLcp/RW1pf2b6rwQllO2v6r0kbansMsTQ+I13Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=gaohan@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=gaohan@iscas.ac.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 474 seconds by postgrey-1.37 at boromir; Sun, 22 Feb 2026 03:44:43 AEDT
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJCdR4CBtz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Feb 2026 03:44:43 +1100 (AEDT)
Received: from smtpclient.apple (unknown [58.38.117.196])
	by APP-03 (Coremail) with SMTP id rQCowABnTOMQ35lplLf9CA--.17993S2;
	Sun, 22 Feb 2026 00:36:33 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Subject: Re: [PATCHv2 2/2] sparc/pci: Initialize msi_addr_mask for OF-created
 PCI devices
From: Han Gao <gaohan@iscas.ac.cn>
In-Reply-To: <20260220070239.1693303-3-nilay@linux.ibm.com>
Date: Sun, 22 Feb 2026 00:36:22 +0800
Cc: Han Gao <gaohan@iscas.ac.cn>,
 linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org,
 sparclinux@vger.kernel.org,
 wangruikang@iscas.ac.cn,
 tglx@kernel.org,
 maddy@linux.ibm.com,
 mpe@ellerman.id.au,
 npiggin@gmail.com,
 chleroy@kernel.org,
 gjoyce@ibm.com,
 helgaas@kernel.org,
 davem@davemloft.net,
 andreas@gaisler.com,
 "Han Gao (Revy)" <rabenda.cn@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <47EB6E53-3E20-4E95-A329-928E5BDDFB81@iscas.ac.cn>
References: <20260220070239.1693303-1-nilay@linux.ibm.com>
 <20260220070239.1693303-3-nilay@linux.ibm.com>
To: Nilay Shroff <nilay@linux.ibm.com>
X-Mailer: Apple Mail (2.3864.400.21)
X-CM-TRANSID:rQCowABnTOMQ35lplLf9CA--.17993S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1fXr18CFWkJr1UWFWDtwb_yoW8CF4Upr
	Z7CFn3trWUt347Ga9xAr1UZFyjgan8u3s3Wr98K34IqryI9r10vrnrWrWjkw4jqrsYka1F
	va9YvrWjqw1DWaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_JwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUeq2_UUUUU=
X-Originating-IP: [58.38.117.196]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBgwFDGmZySEWPgAAsz
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17000-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[gaohan@iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:gaohan@iscas.ac.cn,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:sparclinux@vger.kernel.org,m:wangruikang@iscas.ac.cn,m:tglx@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gjoyce@ibm.com,m:helgaas@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:rabenda.cn@gmail.com,m:nilay@linux.ibm.com,m:rabendacn@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[iscas.ac.cn,lists.ozlabs.org,vger.kernel.org,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,ibm.com,davemloft.net,gaisler.com];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaohan@iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	APPLE_MAILER_COMMON(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 8E41016DF33
X-Rspamd-Action: no action

Tested and passed on SPARC Enterprise T5220.=20

Without this patch, the e1000e would use intx.

Tested-by: Han Gao <gaohan@iscas.ac.cn <mailto:gaohan@iscas.ac.cn>> # on =
SPARC Enterprise T5220

> On Feb 20, 2026, at 15:02, Nilay Shroff <nilay@linux.ibm.com> wrote:
>=20
> Recent changes replaced the use of no_64bit_msi with msi_addr_mask,
> which is now expected to be initialized to DMA_BIT_MASK(64) during PCI
> device setup. On SPARC systems, this initialization was inadvertently
> missed for devices instantiated from device tree nodes, leaving
> msi_addr_mask unset for OF-created pci_dev instances. As a result,
> MSI address validation fails during probe, causing affected devices
> to fail initialization.
>=20
> Initialize pdev->msi_addr_mask to DMA_BIT_MASK(64) in
> of_create_pci_dev() so that MSI address validation succeeds and PCI
> device probing works as expected.
>=20
> Fixes: 386ced19e9a3 ("PCI/MSI: Convert the boolean no_64bit_msi flag =
to a DMA address mask")
> Signed-off-by: Nilay Shroff <nilay@linux.ibm.com>
> ---
> arch/sparc/kernel/pci.c | 7 +++++++
> 1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
> index b290107170e9..a4815d544781 100644
> --- a/arch/sparc/kernel/pci.c
> +++ b/arch/sparc/kernel/pci.c
> @@ -355,6 +355,13 @@ static struct pci_dev *of_create_pci_dev(struct =
pci_pbm_info *pbm,
> dev->error_state =3D pci_channel_io_normal;
> dev->dma_mask =3D 0xffffffff;
>=20
> + /*
> + * Assume 64-bit addresses for MSI initially. Will be changed to =
32-bit
> + * if MSI (rather than MSI-X) capability does not have
> + * PCI_MSI_FLAGS_64BIT. Can also be overridden by driver.
> + */
> + dev->msi_addr_mask =3D DMA_BIT_MASK(64);
> +
> if (of_node_name_eq(node, "pci")) {
> /* a PCI-PCI bridge */
> dev->hdr_type =3D PCI_HEADER_TYPE_BRIDGE;
> --=20
> 2.52.0
>=20
>=20


