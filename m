Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A189927587
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 13:54:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fHVydoH/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFFRp0DyJz3fS4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 21:54:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fHVydoH/;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFFR50ScQz3cZx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 21:53:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720094015;
	bh=Uk9degHg/Z1P6m2/0OM79LElxTX1OBh3M5kqaL4bWSE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fHVydoH/PVY7laXT4hMSD557OSb5R8yAcRpLMi5ulEWFVjqaVntnyKvov/ojV1e61
	 iSzIkDKnubhZrKc2fmC+xQHTBDmZTDROKRzY6zQVnvKmGru/PmP7wfYogPBavu3rNf
	 68o4HMp/oaLFc/tkbmpZfq4ht86Mj9yzlS6C4TjajGp4w5eytEWbfBEKYPVYx8B7gp
	 n0wtRAgm53AMWikl/4RrvAiYegQAvJ2CYNyNjU9P0fnZQPFvvATzWcoF8kvn1bNSjP
	 P3py82HVp0HBqcL2Ia8VXiEKEFzvOri7h6FrHp8NfEGEhW13z2fA8PYjbc/Qxe6GB1
	 mcWsr36DlxVAA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WFFR22Qlhz4wx6;
	Thu,  4 Jul 2024 21:53:33 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
In-Reply-To: <ccf14173-9818-44ef-8610-db2900c67ae8@xenosoft.de>
References: <3ab66fab-c3f2-4bed-a04d-a10c57dcdd9b@xenosoft.de>
 <86zfqzhgys.wl-maz@kernel.org>
 <ccf14173-9818-44ef-8610-db2900c67ae8@xenosoft.de>
Date: Thu, 04 Jul 2024 21:53:32 +1000
Message-ID: <874j95jrur.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: apatel@ventanamicro.com, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> On 02.07.24 18:54, Marc Zyngier wrote:
>> On Sun, 30 Jun 2024 11:21:55 +0100,
>> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>>> Hello,
>>>
>>> There is an issue with the identification of ATA drives with our
>>> P.A. Semi Nemo boards [1] after the
>>> commit "of/irq: Factor out parsing of interrupt-map parent
>>> phandle+args from of_irq_parse_raw()" [2].
...
>>
>> --- a/drivers/of/irq.c
>> +++ b/drivers/of/irq.c
>> @@ -282,8 +282,10 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
>>   
>>   			oldimap = imap;
>>   			imap = of_irq_parse_imap_parent(oldimap, imaplen, out_irq);
>> -			if (!imap)
>> -				goto fail;
>> +			if (!imap) {
>> +				match = 0;
>> +				break;
>> +			}
>>   
>>   			match &= of_device_is_available(out_irq->np);
>>   			if (match)
>>
>>
> We tested this patch yesterday and it solves the boot problem.

Hi Christian,

Instead of that patch, can you try the one below. AFAICS the device tree
fixups done in early boot mean the interrupt-map is not needed, and also
has the wrong content, so if we can remove it entirely that might avoid
the problems in the parsing code.

I don't know if your firmware actually implements those methods, I
couldn't find anything online to confirm or deny it. Seems the only
option is to test it.

cheers


diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index fbb68fc28ed3..28fe082ede57 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -3138,6 +3138,14 @@ static void __init fixup_device_tree_pasemi(void)
 
 	prom_setprop(iob, name, "interrupt-controller", &val, 0);
 
+	prom_printf("nemo: deleting interrupt-map properties\n");
+	rc = call_prom("interpret", 1, 1,
+		      " s\" /pxp@0,e0000000\" find-device"
+		      " s\" interrupt-map\" delete-property"
+		      " s\" interrupt-map-mask\" delete-property"
+		      " device-end");
+	prom_printf("nemo: interpret returned %d\n", rc);
+
 	pci_name = "/pxp@0,e0000000/pci@11";
 	node = call_prom("finddevice", 1, 1, ADDR(pci_name));
 	parent = ADDR(iob);
