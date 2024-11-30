Return-Path: <linuxppc-dev+bounces-3621-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BC59DF2E4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2024 21:09:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y11Mw5s77z2xrC;
	Sun,  1 Dec 2024 07:09:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=207.171.188.206
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732997340;
	cv=none; b=OXikSBMpRgs01MBfHEzw2mvLHmBS5lE4XLOr2amihqKiX0dO7ESe83aJ5K2zMCAcsXMPbFYZnriO954gsmSOKNAV6UJMW0PxWhTAw/ttvvbFwFFgWnIhRysxYMdwxAIgbjJ6dxvpGTnffdBIVQhFCG/+8VMwdW5hYaB8xEERD29mYgxUiCl87DatJ/lsgD8ApewSgzf65iOigyPd3RIP3l6RzAkFLV/kLxTWZ9p3Ps4X01Nfz8AAEOqkCK8Fi3+BBB5L4LoBQ2vKbc8gVKx/4QFxcakcCMX9Ey31oYVyi7s5bq9PTHX/mmDsVQyMm9nJEM1c3HQp+WvTeG9OfojaFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732997340; c=relaxed/relaxed;
	bh=AhSV92xctZtOIuDX4XdK6Ka318O9z4zvPM7btw6h77c=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TYtfdke0pL5XKPrFLIUPeVcS934DrFmJSuGwV5NpxtSTqx0ThCYeFVoM/k10i1R4Z9N09qpQLs6Gr4x4Y5lIaMs6NhuBLWGQCMcOCrb3x+k0MYmfLydxAczAkEoasBd5J0oYrTUvZx5/ZggewI4At0qNoI12NEViTU2VsLd7lXwlaFllxKULAjF/F3VRtjeqANfbrE8E4QIpKjGMusdUMpbE7HOKTRLxgQA8xrIHPkIxwfVs3/RVnmhP6OO8g6E3kETM3HS6InXa6FvJ4M9p9RpahdegszbmiwazkEVPkiLd5xPWIz4JQ6trg96r9zFuG626BXqgF8ReGTBVX7jKWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=V5DRZmLR; dkim-atps=neutral; spf=pass (client-ip=207.171.188.206; helo=smtp-fw-9106.amazon.com; envelope-from=prvs=057a1cabc=farbere@amazon.com; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=V5DRZmLR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=207.171.188.206; helo=smtp-fw-9106.amazon.com; envelope-from=prvs=057a1cabc=farbere@amazon.com; receiver=lists.ozlabs.org)
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com [207.171.188.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y11Mt3v6yz2xfb
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Dec 2024 07:08:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1732997340; x=1764533340;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=AhSV92xctZtOIuDX4XdK6Ka318O9z4zvPM7btw6h77c=;
  b=V5DRZmLRO2V7Z7VcH8r580vwv7f7Svwb7nc2mkyH7tanaO+8nf7OE6Uo
   wp4pPQFTFiiSwRt7QkITprEQsqYYrTzyZeqj407gAaEjJod70j0d6lc+A
   D231o8UDS5BmTQeksVMNxYNk0PyclG4OeMLh+cBnF/Q1ggsBUrd6kMfvh
   Q=;
X-IronPort-AV: E=Sophos;i="6.12,199,1728950400"; 
   d="scan'208";a="779857217"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 20:08:48 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.10.100:15968]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.11.83:2525] with esmtp (Farcaster)
 id 6ac350d1-00ea-4165-8f54-56833500c432; Sat, 30 Nov 2024 20:08:45 +0000 (UTC)
X-Farcaster-Flow-ID: 6ac350d1-00ea-4165-8f54-56833500c432
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Sat, 30 Nov 2024 20:08:45 +0000
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19D018EUA004.ant.amazon.com (10.252.50.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Sat, 30 Nov 2024 20:08:44 +0000
Received: from EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d]) by
 EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d%3]) with mapi id
 15.02.1258.034; Sat, 30 Nov 2024 20:08:44 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Thomas Gleixner <tglx@linutronix.de>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"naveen@kernel.org" <naveen@kernel.org>, "maddy@linux.ibm.com"
	<maddy@linux.ibm.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "ebiederm@xmission.com" <ebiederm@xmission.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com"
	<bhe@redhat.com>, "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>,
	"sourabhjain@linux.ibm.com" <sourabhjain@linux.ibm.com>,
	"adityag@linux.ibm.com" <adityag@linux.ibm.com>, "songshuaishuai@tinylab.org"
	<songshuaishuai@tinylab.org>, "takakura@valinux.co.jp"
	<takakura@valinux.co.jp>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "kexec@lists.infradead.org"
	<kexec@lists.infradead.org>, Marc Zyngier <maz@kernel.org>
CC: "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: RE: [PATCH v4 1/2] kexec: Consolidate machine_kexec_mask_interrupts()
 implementation
Thread-Topic: [PATCH v4 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
Thread-Index: AdtDYtCFjQWQn9I6QGW+NnB/V7SCxQ==
Date: Sat, 30 Nov 2024 20:08:44 +0000
Message-ID: <cd8809e379dc4dd089350ec2d1f8c210@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.85.143.175]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
MIME-Version: 1.0
X-Spam-Status: No, score=-10.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11/29/2024 3:30 PM, Thomas Gleixner wrote:
>> Move the machine_kexec_mask_interrupts function to a common location in
>> kernel/kexec_core.c, removing duplicate implementations from architectur=
e
>> specific files (arch/arm, arch/arm64, arch/powerpc, and arch/riscv).
>
> Can you please move this into kernel/irq/kexec.c?
>
> It's pure interrupt core internal code and there is no point to make
> core internal functions visible to random other code just because.
Done (in v5 series)

>> +void machine_kexec_mask_interrupts(void)
>> +{
>> +     unsigned int i;
>> +     struct irq_desc *desc;
>
>         struct irq_desc *desc;
>         unsigned int i;
>
> please
Done (in v5 series)

>> +     for_each_irq_desc(i, desc) {
>> +             struct irq_chip *chip;
>> +             int check_eoi =3D 1;
>> +
>> +             chip =3D irq_desc_get_chip(desc);
>> +             if (!chip)
>> +                     continue;
>> +
>> +             if (IS_ENABLED(CONFIG_ARM64)) {
>
> This should not be CONFIG_ARM64. Add something like:
>
> config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
>         bool
>
> and select this from ARM64?
Done (in v5 series)

>> +                     /*
>> +                      * First try to remove the active state. If this f=
ails, try to EOI the
>> +                      * interrupt.
>
> This comment does not really explain what this is about. I know you
> copied it from the ARM64 implementation, but it should explain what this
> actually means. Something like:
>
>          First try to remove the active state from an interrupt which is
>          forwarded to a VM. If the interrupt is not forwarded, try to
>          EOI the interrupt.
>
> or something like that.
Done (in v5 series)

>> +                      */
>> +                     check_eoi =3D irq_set_irqchip_state(i, IRQCHIP_STA=
TE_ACTIVE, false);
>
> Looking deeper. This function actually cannot be called from this
> context. It does:
>
>           irq_get_desc_buslock(irq, &flags, 0);
>
> which means for any interrupt which has an actual buslock implementation
> it will end up in a sleepable function and deadlock in the worst case.
>
> Marc?
I will wait for Marc's response regarding this issue.
Regardless, if any changes are required, I believe it would be better
to address them in a separate patch, as this behavior existed before my
modification.

Thanks, Eliav

