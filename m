Return-Path: <linuxppc-dev+bounces-7687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1FCA90565
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 16:05:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd2qC157cz2xxr;
	Thu, 17 Apr 2025 00:05:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=37.157.195.192
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744812326;
	cv=none; b=CwjXMc2cHkD8L/TPoC9w6svAHnpPxfBIGnXfWxVKTi/1mbi2hlgZw96FGeEoSQDu92AZ9+Yokt8a3sHF1HLGjqPyq/6BoDOppA5QAsrUjbSIkccUCToQl3r6b05xKSZSkGVx+RplLmC2lQWhUB088RFHvYfKW7km/LAJKLxvzK1j6BgQ/QwCNr6GGFXLWlbqZA9TfujkU6OtM3WkndUtRGpX9/4Hk66tsBK/3/unK6dZ3IFJlpcu/A80YmW10Pr/VTSvw2S+O+SfiGeuY2ka1W+wZMAu8amaeCvi0UO8IBM3LAvqs7jbKMMli9cxrdEq8ZyFLSKGmVfvJIUzEycA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744812326; c=relaxed/relaxed;
	bh=pB0dS7/T+jbGwEXc/fOdvPOwksDu4Aq6hFM5wtUwUXc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=F3LCk5ldxEDvTgW5jNoTEIFC4yZJbvq3TDTtyy9vA+2dwFm4mjYcEAilgHY5MHj+NuiyMdrA9pVCY1afxlgqDa/9fY6m3LN4I0qdSko6KXUbiKmHpYbrvnhukZi8pnZJRfZ0BfYlZPOOgdzvu1Ka6sSNSMYRlXBbNQ+pPG2y9W7Q0E+ZTY+pzAi44iNH8EyoPEbn9RtgvU6dIB58FW/kwysOmtORypcdOA+7KPICIA4MttgELSyrmQLhLoMHyZsbQDkxaBSvdpjDTKxrgweEplN9xc5sTJR1ikSqU66eJsJ2EcYLUSdLhdNZGAe4wCV2aMHspeN8xdSSYDzWMl/+Iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=danny.cz; spf=pass (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=lists.ozlabs.org) smtp.mailfrom=danny.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=danny.cz
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=danny.cz (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=lists.ozlabs.org)
Received: from redcrew.org (redcrew.org [37.157.195.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd2q853V5z2xlP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 00:05:22 +1000 (AEST)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
	by redcrew.org (Postfix) with ESMTP id 31E086B;
	Wed, 16 Apr 2025 16:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 redcrew.org 31E086B
Received: from talos.danny.cz (talos [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
	by server.danny.cz (Postfix) with SMTP id 032B915E001;
	Wed, 16 Apr 2025 16:05:17 +0200 (CEST)
Date: Wed, 16 Apr 2025 16:05:17 +0200
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: early soft lockup in 6.15-rc2 on PowerNV
Message-Id: <20250416160517.4176a26c7e1d253ddb184007@danny.cz>
In-Reply-To: <87ecxsh08k.fsf@gmail.com>
References: <20250416104552.1b2c63939d42a9bc20f2ef8d@danny.cz>
	<87ecxsh08k.fsf@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; powerpc64le-redhat-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.0 required=3.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Ritesh,

On Wed, 16 Apr 2025 15:55:15 +0530
Ritesh Harjani (IBM) <ritesh.list@gmail.com> wrote:

> Dan Horák <dan@danny.cz> writes:
> 
> > Hi,
> >
> > after updating to Fedora built 6.15-rc2 kernel from 6.14 I am getting a
> > soft lockup early in the boot and NVME related timeout/crash later
> > (could it be related?). I am first checking if this is a known issue
> > as I have not started bisecting yet.
> >
> > [    2.866399] Memory: 63016960K/67108864K available (25152K kernel code, 4416K rwdata, 24000K rodata, 9792K init, 1796K bss, 476160K reserved, 3356672K cma-reserved)
> > [    2.874121] devtmpfs: initialized
> > [   24.037685] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:1]
> > [   24.037690] CPU#0 Utilization every 4s during lockup:
> > [   24.037692] 	#1: 101% system,	  0% softirq,	  0% hardirq,	  0% idle
> > [   24.037697] 	#2: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
> > [   24.037701] 	#3: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
> > [   24.037704] 	#4: 101% system,	  0% softirq,	  0% hardirq,	  0% idle
> > [   24.037707] 	#5: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
> > [   24.037711] Modules linked in:
> > [   24.037716] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.15.0-0.rc2.22.fc43.ppc64le #1 VOLUNTARY 
> > [   24.037722] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
> > [   24.037725] NIP:  c00000000308a72c LR: c00000000308a7d0 CTR: c0000000018012c0
> > [   24.037729] REGS: c000200006637a50 TRAP: 0900   Not tainted  (6.15.0-0.rc2.22.fc43.ppc64le)
> > [   24.037733] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 48000828  XER: 00000000
> > [   24.037750] CFAR: 0000000000000000 IRQMASK: 0 
> > [   24.037750] GPR00: c00000000308a7d0 c000200006637cf0 c0000000025baa00 0000000000000040 
> > [   24.037750] GPR04: c0002007ff390b00 0000000000010000 0000000000000000 c0002007ff3a0b00 
> > [   24.037750] GPR08: 00000000002007ff 000000000012d092 0000000000000000 0000000000000000 
> > [   24.037750] GPR12: 0000000000000000 c000000003fb0000 c000000000011320 0000000000000000 
> > [   24.037750] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> > [   24.037750] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> > [   24.037750] GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> > [   24.037750] GPR28: 0000000000000000 c000000003f10be0 c0000000019efaf8 0000000000037940 
> > [   24.037806] NIP [c00000000308a72c] memory_dev_init+0xb4/0x194
> > [   24.037815] LR [c00000000308a7d0] memory_dev_init+0x158/0x194
> > [   24.037820] Call Trace:
> > [   24.037822] [c000200006637cf0] [c00000000308a7d0] memory_dev_init+0x158/0x194 (unreliable)
> > [   24.037830] [c000200006637d70] [c000000003089bd0] driver_init+0x74/0xa0
> > [   24.037836] [c000200006637d90] [c00000000300f628] kernel_init_freeable+0x204/0x288
> > [   24.037843] [c000200006637df0] [c000000000011344] kernel_init+0x2c/0x1b8
> > [   24.037849] [c000200006637e50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
> > [   24.037855] --- interrupt: 0 at 0x0
> > [   24.037858] Code: 7c651b78 40820010 3fa20195 3bbd61e0 48000080 3c62ff89 389e00c8 3863e510 4bf7a625 60000000 39290001 7c284840 <41800088> 792aaac2 7c2a2840 4080ffec 
> > [   48.045039] watchdog: BUG: soft lockup - CPU#0 stuck for 44s! [swapper/0:1]
> > [   48.045043] CPU#0 Utilization every 4s during lockup:
> > [   48.045045] 	#1: 101% system,	  0% softirq,	  0% hardirq,	  0% idle
> > [   48.045049] 	#2: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
> > [   48.045053] 	#3: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
> > [   48.045056] 	#4: 101% system,	  0% softirq,	  0% hardirq,	  0% idle
> > [   48.045059] 	#5: 100% system,	  0% softirq,	  0% hardirq,	  0% idle
> > [   48.045063] Modules linked in:
> > [   48.045067] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G             L     ------  ---  6.15.0-0.rc2.22.fc43.ppc64le #1 VOLUNTARY 
> > [   48.045073] Tainted: [L]=SOFTLOCKUP
> > [   48.045075] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
> > [   48.045077] NIP:  c00000000308a72c LR: c00000000308a7d0 CTR: c0000000018012c0
> > [   48.045081] REGS: c000200006637a50 TRAP: 0900   Tainted: G             L     ------  ---   (6.15.0-0.rc2.22.fc43.ppc64le)
> > [   48.045085] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 48000828  XER: 00000000
> > [   48.045100] CFAR: 0000000000000000 IRQMASK: 0 
> > [   48.045100] GPR00: c00000000308a7d0 c000200006637cf0 c0000000025baa00 0000000000000040 
> > [   48.045100] GPR04: c0002007ff390b00 0000000000010000 0000000000000000 c0002007ff3a0b00 
> > [   48.045100] GPR08: 00000000002007ff 00000000000a65fd 0000000000000000 0000000000000000 
> > [   48.045100] GPR12: 0000000000000000 c000000003fb0000 c000000000011320 0000000000000000 
> > [   48.045100] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> > [   48.045100] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> > [   48.045100] GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> > [   48.045100] GPR28: 0000000000000000 c000000003f10be0 c0000000019efaf8 000000000007f880 
> > [   48.045155] NIP [c00000000308a72c] memory_dev_init+0xb4/0x194
> > [   48.045161] LR [c00000000308a7d0] memory_dev_init+0x158/0x194
> > [   48.045166] Call Trace:
> > [   48.045167] [c000200006637cf0] [c00000000308a7d0] memory_dev_init+0x158/0x194 (unreliable)
> > [   48.045175] [c000200006637d70] [c000000003089bd0] driver_init+0x74/0xa0
> > [   48.045181] [c000200006637d90] [c00000000300f628] kernel_init_freeable+0x204/0x288
> > [   48.045187] [c000200006637df0] [c000000000011344] kernel_init+0x2c/0x1b8
> > [   48.045193] [c000200006637e50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
> > [   48.045199] --- interrupt: 0 at 0x0
> 
> The above looks similar to
> https://lore.kernel.org/all/20250410125110.1232329-1-gshan@redhat.com/
> 
> Maybe you can give this patch a try for above softlockup.

yes, it was it, the mentioned patch fixes the soft-lockup, so feel free
to add

Tested-by: Dan Horák <dan@danny.cz>


The NVME issue seems to be unrelated, I will keep looking ...


		Dan

