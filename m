Return-Path: <linuxppc-dev+bounces-16504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBE+GU5ogGlA7wIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 10:03:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 533DDC9DE0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 10:03:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4LHY2lh3z30FF;
	Mon, 02 Feb 2026 20:03:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.95.100
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770022985;
	cv=none; b=Egz2WWgXPVBpy6HlCibPWX78Pf9mu2UIihzyy6QyBwq3qCdBgHajYYwVNeuKbqyu1tmPqq6x6MvC5q6aJe6H08Ez6JH3EkMSUDNuVvUlNtHrUWdmQtSQ78LHknBsdaJ/BxCVyh28o6SW1ijIM/dpUzAJ1Et5Mj7woa0CzfwO2MoA0kJ2Fo+PiO37oDVM50hKCeUq/sPjOuYFx1DNxbR6/DisrmDb61U6NfeW7YdQqgTbx9aGKRYKUWqElw8blY7MrR4upl7/nn67m0lhsIi8DVTDwFxzr8ZfBUFqFzNd93L5urTovUb4gx+DTPBTzYe/VJxUdROxVCb9fXpBajg2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770022985; c=relaxed/relaxed;
	bh=0UllBE3jmZlYJecYhUMudbpLYXvPpZgTknlJVHkLHwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aeb2wMyEO4FlYC0M5SvgSEqw8QhCG5CZoAA7GfjMk38//c6FtcPmxk4AepGQ72aYdgsiP+E7c9krsMGCASpOwr+gT7NCfxGaa8Susb4PDHuLPxP5Kc6AdDHXAvIfIeOhk2GKMjkGGpBHcwPnzwm5lO3jc+9/IOqN4+xplMW1eKE1h/m9Bt036MPXnVTQTPcd7HszAU4R21AAPGN+q58kkUYN5Tvh8kyav41udVB8nLgEuIcT54mJ0PdgO7EvvguyFrvYTwwyYTTz857wAhq8b17Pn7Mh6jrwcZ4SAtVb9rQvc/M9w7r0fBN9e3UfYZ2nLtOU6vo1r3PCsp9GBifcGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4LHW5FJdz30BR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 20:03:01 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 575B32C06A91;
	Mon,  2 Feb 2026 10:02:55 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 52CB51C1BC; Mon,  2 Feb 2026 10:02:55 +0100 (CET)
Date: Mon, 2 Feb 2026 10:02:55 +0100
From: Lukas Wunner <lukas@wunner.de>
To: LeoLiu-oc <LeoLiu-oc@zhaoxin.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, mahesh@linux.ibm.com,
	oohall@gmail.com, bhelgaas@google.com,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, CobeChen@zhaoxin.com,
	TonyWWang@zhaoxin.com, ErosZhang@zhaoxin.com,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: Re: [PATCH] PCI: dpc: Increase pciehp waiting time for DPC recovery
Message-ID: <aYBoP-B2E9fp_4YZ@wunner.de>
References: <20260123202140.GA84703@bhelgaas>
 <3af9f754-d282-485c-a3f2-49a230bfe143@zhaoxin.com>
 <aXydEn_lAbNROQKy@wunner.de>
 <1096398c-e883-4232-91f6-836fc508092d@zhaoxin.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1096398c-e883-4232-91f6-836fc508092d@zhaoxin.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.51 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16504-lists,linuxppc-dev=lfdr.de];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:LeoLiu-oc@zhaoxin.com,m:helgaas@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:bhelgaas@google.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:CobeChen@zhaoxin.com,m:TonyWWang@zhaoxin.com,m:ErosZhang@zhaoxin.com,m:anthony.l.nguyen@intel.com,m:przemyslaw.kitszel@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,gmail.com,google.com,lists.ozlabs.org,vger.kernel.org,zhaoxin.com,intel.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 533DDC9DE0
X-Rspamd-Action: no action

[cc += Tony, Przemek (ice driver maintainers), start of thread is here:
https://lore.kernel.org/all/20260123104034.429060-1-LeoLiu-oc@zhaoxin.com/
]

On Mon, Feb 02, 2026 at 02:00:55PM +0800, LeoLiu-oc wrote:
> The kernel version I am using is 6.18.6.
[...]
> The complete log of the kernel panic is as follows:
> 
> [  100.304077][  T843] list_del corruption, ffff8881418b79e8->next is LIST_POISON1 (dead000000000100)
> [  100.312989][  T843] ------------[ cut here ]------------
> [  100.318268][  T843] kernel BUG at lib/list_debug.c:56!
> [  100.323380][  T843] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> [  100.329250][  T843] CPU: 7 PID: 843 Comm: irq/27-pciehp Tainted: P    W  OE     ------- ----  6.6.0-32.7.v2505.ky11.x86_64 #1
> [  100.340793][  T843] Source Version: 71d5b964051132b7772acd935972fca11462bbfe
> [  100.359228][  T843] RIP: 0010:__list_del_entry_valid_or_report+0x7f/0xc0
> [  100.365877][  T843] Code: 66 4b a6 e8 c3 43 a9 ff 0f 0b 48 89 fe 48 c7 c7 10 67 4b a6 e8 b2 43 a9 ff 0f 0b 48 89 fe 48 c7 c7 40 67 4b a6 e8 a1 43 a9 ff <0f> 0b 48 89 fe 48 89 ca 48 c7 c7 78 67 4b a6 e8 8d 43 a9 ff 0f 0b
> [  100.385158][  T843] RSP: 0018:ffffc9000f70fc08 EFLAGS: 00010246
> [  100.391024][  T843] RAX: 000000000000004e RBX: ffff8881418b79e8 RCX: 0000000000000000
> [  100.398781][  T843] RDX: 0000000000000000 RSI: ffff8897df5a32c0 RDI: ffff8897df5a32c0
> [  100.406538][  T843] RBP: ffff8881257f9608 R08: 0000000000000000 R09: 0000000000000003
> [  100.414294][  T843] R10: ffffc9000f70fa90 R11: ffffffffa6fee508 R12: 0000000000000000
> [  100.422050][  T843] R13: ffff8881257f9608 R14: ffff888116507c28 R15: ffff888116507c28
> [  100.429807][  T843] FS:  0000000000000000(0000) GS:ffff8897df580000(0000) knlGS:0000000000000000
> [  100.438511][  T843] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  100.444891][  T843] CR2: 00007f9563bac1c0 CR3: 0000000c4be26004 CR4: 0000000000570ee0
> [  100.452647][  T843] PKRU: 55555554
> [  100.456017][  T843] Call Trace:
> [  100.459129][  T843]  <TASK>
> [  100.461898][  T843]  ice_flow_rem_entry_sync.constprop.0+0x1c/0x90 [ice]
> [  100.468663][  T843]  ice_flow_rem_entry+0x3d/0x60 [ice]
> [  100.473925][  T843]  ice_fdir_erase_flow_from_hw.constprop.0+0x9b/0x100 [ice]
> [  100.481078][  T843]  ice_fdir_rem_flow.constprop.0+0x32/0xb0 [ice]
> [  100.487284][  T843]  ice_vsi_manage_fdir+0x7b/0xb0 [ice]
> [  100.492629][  T843]  ice_deinit_features.part.0+0x46/0xc0 [ice]
> [  100.498571][  T843]  ice_remove+0xcf/0x220 [ice]
> [  100.503222][  T843]  pci_device_remove+0x3f/0xb0
> [  100.507798][  T843]  device_release_driver_internal+0x19d/0x220
> [  100.513667][  T843]  pci_stop_bus_device+0x6c/0x90
> [  100.518417][  T843]  pci_stop_and_remove_bus_device+0x12/0x20
> [  100.524110][  T843]  pciehp_unconfigure_device+0x9f/0x160
> [  100.529463][  T843]  pciehp_disable_slot+0x69/0x130
> [  100.534296][  T843]  pciehp_handle_presence_or_link_change+0xfc/0x210
> [  100.540678][  T843]  pciehp_ist+0x204/0x230
> [  100.544824][  T843]  ? __pfx_irq_thread_fn+0x10/0x10
> [  100.549747][  T843]  irq_thread_fn+0x20/0x60
> [  100.553978][  T843]  irq_thread+0xfb/0x1c0
> [  100.558038][  T843]  ? __pfx_irq_thread_dtor+0x10/0x10
> [  100.563130][  T843]  ? __pfx_irq_thread+0x10/0x10
> [  100.567791][  T843]  kthread+0xe5/0x120
> [  100.571594][  T843]  ? __pfx_kthread+0x10/0x10
> [  100.575997][  T843]  ret_from_fork+0x17a/0x1a0
> [  100.580403][  T843]  ? __pfx_kthread+0x10/0x10
> [  100.584805][  T843]  ret_from_fork_asm+0x1a/0x30
> [  100.589384][  T843]  </TASK>
> [  100.592237][  T843] Modules linked in: zxmem(OE) einj amdgpu amdxcp
> gpu_sched drm_exec drm_buddy nft_fib_inet nft_fib_ipv4 nft_fib_ipv6
> nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
> nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 zhaoxin_cputemp
> nf_defrag_ipv4 zhaoxin_rng snd_hda_codec_hdmi radeon rfkill
> snd_hda_intel snd_intel_dspcfg irdma i2c_algo_bit snd_intel_sdw_acpi
> ip_set i40e drm_suballoc_helper nf_tables drm_ttm_helper pcicfg(POE)
> snd_hda_codec ib_uverbs sunrpc ttm ib_core snd_hda_core
> drm_display_helper snd_hwdep kvm_intel snd_pcm cec vfat fat
> drm_kms_helper snd_timer kvm video ice snd psmouse soundcore wmi
> acpi_cpufreq pcspkr i2c_zhaoxin sg sch_fq_codel drm fuse backlight
> nfnetlink xfs sd_mod t10_pi sm2_zhaoxin_gmi crct10dif_pclmul
> crc32_pclmul ahci crc32c_intel libahci r8169 ghash_clmulni_intel libata
> sha512_ssse3 serio_raw realtek dm_mirror dm_region_hash dm_log
> dm_multipath dm_mod i2c_dev autofs4
> [  100.674508][  T843] ---[ end trace 0000000000000000 ]---
> [  100.709547][  T843] RIP: 0010:__list_del_entry_valid_or_report+0x7f/0xc0
> [  100.716197][  T843] Code: 66 4b a6 e8 c3 43 a9 ff 0f 0b 48 89 fe 48 c7 c7 10 67 4b a6 e8 b2 43 a9 ff 0f 0b 48 89 fe 48 c7 c7 40 67 4b a6 e8 a1 43 a9 ff <0f> 0b 48 89 fe 48 89 ca 48 c7 c7 78 67 4b a6 e8 8d 43 a9 ff 0f 0b
> [  100.735491][  T843] RSP: 0018:ffffc9000f70fc08 EFLAGS: 00010246
> [  100.741367][  T843] RAX: 000000000000004e RBX: ffff8881418b79e8 RCX: 0000000000000000
> [  100.749137][  T843] RDX: 0000000000000000 RSI: ffff8897df5a32c0 RDI: ffff8897df5a32c0
> [  100.756909][  T843] RBP: ffff8881257f9608 R08: 0000000000000000 R09: 0000000000000003
> [  100.764678][  T843] R10: ffffc9000f70fa90 R11: ffffffffa6fee508 R12: 0000000000000000
> [  100.772448][  T843] R13: ffff8881257f9608 R14: ffff888116507c28 R15: ffff888116507c28
> [  100.780218][  T843] FS:  0000000000000000(0000) GS:ffff8897df580000(0000) knlGS:0000000000000000
> [  100.788934][  T843] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  100.795329][  T843] CR2: 00007f9563bac1c0 CR3: 0000000c4be26004 CR4: 0000000000570ee0
> [  100.803099][  T843] PKRU: 55555554
> [  100.806483][  T843] Kernel panic - not syncing: Fatal exception
> [  100.812794][  T843] Kernel Offset: disabled
> [  100.821613][  T843] pstore: backend (erst) writing error (-28)
> [  100.827481][  T843] ---[ end Kernel panic - not syncing: Fatal exception ]---
> 
> The reason for this kernel panic is that the ice network card driver
> executed the ice_pci_err_detected() for a longer time than the maximum
> waiting time allowed by pciehp. After that, the pciehp_ist() will
> execute the ice network card driver's ice_remove() process. This results
> in the ice_pci_err_detected() having already deleted the list, while the
> ice_remove() is still attempting to delete a list that no longer exists.

This is a bug in the ice driver, not in the pciehp or dpc driver.
As such, it is not a good argument to support the extension of the
timeout.  I'm not against extending the timeout, but the argument
that it's necessary to avoid occurrence of a bug is not a good one.

You should first try to unbind the ice driver at runtime to see if
there is a general problem in the unbind code path:

echo abcd:ef:gh.i > /sys/bus/pci/drivers/shpchp/unbind

Replace abcd:ef:gh.i with the domain/bus/device/function of the Ethernet
card.  The dmesg excerpt you've provided unfortunately does not betray
the card's address.

Then try to rebind the driver via the "bind" sysfs attribute.

If this works, the next thing to debug is whether the driver has a
problem with surprise removal.  I'm not fully convinced that the
crash you're seeing is caused by concurrent execution of
ice_pci_err_detected() and ice_remove().  When pciehp unbinds the
driver during DPC recovery, the device is likely inaccessible.
It's possible that ice_remove() behaves differently for an
inaccessible device and that may cause the crash instead of the
concurrent execution of ice_pci_err_detected().

It would also be good to understand why DPC recovery of the Ethernet
card takes this long.  Does it take a long time to come out of reset?
Could the ice driver be changed to allow for faster recovery?

Thanks,

Lukas

