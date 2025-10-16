Return-Path: <linuxppc-dev+bounces-12934-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB8BE156E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Oct 2025 05:17:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnCn00jP7z30Vl;
	Thu, 16 Oct 2025 14:17:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.187.169.70
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760584643;
	cv=none; b=j+6l1AxtOIJbA73/SLTJC+hOOAGJOtg1hBBAf9xVCDyDvqv8U04QQ438rSZ81+9k3kR1ZEgPuBVSLT4yWZt2AM7byx1dQMckWlyHx3VixBh7oOGda0RwGvwqf2COPQHa1n2mtcde4XzU2lrUFPnuBZ9Ha13+8cY4nkeg58Qp2ftCd80GK41xDyMwvW9nPChSE/pAysWG2R9VzbsYRGlHepSf6v/HO4xQ0wbjL+KC5J9vtcqbc9nclJFl2izLrUiAwrDBn0TZTHQIBoPMv5R6w5/kg9j5W7PRljbyY2rRFblFdmQkkkfg4cVA093uW/QGqrrOfKKY5gPB4iOmOQb2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760584643; c=relaxed/relaxed;
	bh=AzPgqQwBQCWH/oKOjAD1F1P2ma3GIcajarVfNGzJ61U=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=HwNynCKDTHcY1nyd584bUABctHSbT4CCiAGs/Lf/I39Dne7eeROPP2p4U45Z1RZA6evRRNPzhPPUZaeRuVTmctpWFcpMRE08Bvb+kIOzUUrD938+ZQLx3HYdOToL6qXkQlcBJcuhRfUqXWlITWWh3Ck39lwmEK1TO64FrNesgndDQYjPVZPuRQ9H6p0T3i7K5WTl23Le+OGnx4oD64p5c/BoKA87k95p9SFsYexRH4icjt1HBhUWVuMhw8I8sHKdq4NZcq5HWyks47kJrYW2F59vFVkfk6Fn0YAZ+lQQVVcI1c3Zv+cZw6U5+1AEItJNKuhN+DpCnEG1myugKrUlFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass (client-ip=185.187.169.70; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org) smtp.mailfrom=hogyros.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hogyros.de (client-ip=185.187.169.70; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 507 seconds by postgrey-1.37 at boromir; Thu, 16 Oct 2025 14:17:22 AEDT
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnCmy5cx4z2ywC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 14:17:22 +1100 (AEDT)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id 2BE6C3F0F9;
	Thu, 16 Oct 2025 05:08:48 +0200 (CEST)
Message-ID: <f9a8c975-f5d3-4dd2-988e-4371a1433a60@hogyros.de>
Date: Thu, 16 Oct 2025 12:08:46 +0900
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
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
From: Simon Richter <Simon.Richter@hogyros.de>
Subject: BAR resizing broken in 6.18 (PPC only?)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

since switching to 6.18rc1, I get

xe 0030:03:00.0: enabling device (0140 -> 0142)
xe 0030:03:00.0: [drm] unbounded parent pci bridge, device won't support 
any PM support.
xe 0030:03:00.0: [drm] Attempting to resize bar from 256MiB -> 16384MiB
xe 0030:03:00.0: BAR 0 [mem 0x620c000000000-0x620c000ffffff 64bit]: 
releasing
xe 0030:03:00.0: BAR 2 [mem 0x6200000000000-0x620000fffffff 64bit pref]: 
releasing
pci 0030:02:01.0: bridge window [mem 0x6200000000000-0x620001fffffff 
64bit pref]: releasing
pci 0030:01:00.0: bridge window [mem 0x6200000000000-0x6203fbff0ffff 
64bit pref]: releasing
pci 0030:00:00.0: bridge window [mem 0x6200000000000-0x6203fbff0ffff 
64bit pref]: was not released (still contains assigned resources)
pci 0030:02:01.0: disabling bridge window [io  0x0000-0xffffffffffffffff 
disabled] to [bus 03] (unused)
pci 0030:02:02.0: disabling bridge window [io  0x0000-0xffffffffffffffff 
disabled] to [bus 04] (unused)
pci 0030:02:02.0: disabling bridge window [mem 
0x00000000-0xffffffffffffffff 64bit pref disabled] to [bus 04] (unused)
pci 0030:01:00.0: disabling bridge window [io  0x0000-0xffffffffffffffff 
disabled] to [bus 02-04] (unused)
pci 0030:00:00.0: Assigned bridge window [mem 
0x6200000000000-0x6203fbff0ffff 64bit pref] to [bus 01-04] cannot fit 
0x4000000000 required for 0030:01:00.0 bridging to [bus 02-04]
pci 0030:01:00.0: bridge window [mem size 0x3fc0000000 64bit pref] to 
[bus 02-04] requires relaxed alignment rules
pci 0030:00:00.0: disabling bridge window [io  0x0000-0xffffffffffffffff 
disabled] to [bus 01-04] (unused)
pci 0030:01:00.0: bridge window [mem size 0x3fc0000000 64bit pref]: 
can't assign; no space
pci 0030:01:00.0: bridge window [mem size 0x3fc0000000 64bit pref]: 
failed to assign
pci 0030:01:00.0: bridge window [mem size 0x3fc0000000 64bit pref]: 
can't assign; no space
pci 0030:01:00.0: bridge window [mem size 0x3fc0000000 64bit pref]: 
failed to assign
pci 0030:02:01.0: bridge window [mem size 0x400000000 64bit pref]: can't 
assign; no space
pci 0030:02:01.0: bridge window [mem size 0x400000000 64bit pref]: 
failed to assign
pci 0030:02:01.0: bridge window [mem size 0x400000000 64bit pref]: can't 
assign; no space
pci 0030:02:01.0: bridge window [mem size 0x400000000 64bit pref]: 
failed to assign
xe 0030:03:00.0: BAR 2 [mem size 0x400000000 64bit pref]: can't assign; 
no space
xe 0030:03:00.0: BAR 2 [mem size 0x400000000 64bit pref]: failed to assign
xe 0030:03:00.0: BAR 0 [mem 0x620c000000000-0x620c000ffffff 64bit]: assigned
xe 0030:03:00.0: BAR 0 [mem 0x620c000000000-0x620c000ffffff 64bit]: 
releasing
xe 0030:03:00.0: BAR 2 [mem size 0x400000000 64bit pref]: can't assign; 
no space
xe 0030:03:00.0: BAR 2 [mem size 0x400000000 64bit pref]: failed to assign
xe 0030:03:00.0: BAR 0 [mem 0x620c000000000-0x620c000ffffff 64bit]: assigned
pci 0030:00:00.0: PCI bridge to [bus 01-04]
pci 0030:00:00.0:   bridge window [mem 0x620c000000000-0x620c07fefffff]
pci 0030:00:00.0:   bridge window [mem 0x6200000000000-0x6203fbff0ffff 
64bit pref]
pci 0030:01:00.0: bridge window [mem 0x6200000000000-0x6203fbff0ffff 
64bit pref]: can't claim; address conflict with 0030:01:00.0 [mem 
0x6200020000000-0x62000207fffff 64bit pref]
pci 0030:01:00.0: PCI bridge to [bus 02-04]
pci 0030:01:00.0:   bridge window [mem 0x620c000000000-0x620c07fefffff]
pci 0030:02:01.0: bridge window [mem 0x6200000000000-0x620001fffffff 
64bit pref]: can't claim; no compatible bridge window
pci 0030:02:01.0: PCI bridge to [bus 03]
pci 0030:02:01.0:   bridge window [mem 0x620c000000000-0x620c0013fffff]
xe 0030:03:00.0: [drm] Failed to resize BAR2 to 16384M (-ENOSPC). 
Consider enabling 'Resizable BAR' support in your BIOS
xe 0030:03:00.0: BAR 2 [mem size 0x10000000 64bit pref]: can't assign; 
no space
xe 0030:03:00.0: BAR 2 [mem size 0x10000000 64bit pref]: failed to assign
xe 0030:03:00.0: BAR 2 [mem size 0x10000000 64bit pref]: can't assign; 
no space
xe 0030:03:00.0: BAR 2 [mem size 0x10000000 64bit pref]: failed to assign
xe 0030:03:00.0: [drm] Found battlemage (device ID e20b) discrete 
display version 14.01 stepping B0
xe 0030:03:00.0: [drm] *ERROR* pci resource is not valid

There's also a bug report[1] on the freedesktop GitLab, but this may be 
a more generic problem.

I'm unsure what other "assigned resources" would be below the root that 
are not covered by the bridge window of equal size on the upstream port 
of the GPU -- also it would be really cool if it reverted to the old 
state on failure instead of creating an invalid configuration.

Also, why do we change the BAR assignment while mem decoding is active?

    Simon

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6356

