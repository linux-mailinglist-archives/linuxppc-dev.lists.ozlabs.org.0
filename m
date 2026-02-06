Return-Path: <linuxppc-dev+bounces-16664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAS6NKOthWkRFAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 10:00:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 936F4FBBE4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 10:00:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6p2R6xrVz2yFc;
	Fri, 06 Feb 2026 20:00:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.0.225.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770368415;
	cv=none; b=jJc3WRgYWaqJadjzH0HXaQY3JGqMUiTyP0sfGiObHzQ3PXfOT+Ozpr2bkN5Dn5pfPsKBT6zZ9+3+nl9RcyG1ESHtrS5PuPf+oAJppuIjd1daleiDUp14e2PFt8/EGce1qiw+qU3ZuWi4ye7zDnqXvRt6lz3vtNQhjVlTqfl/cXPpsb9ukopLw0+aKCXBrHIr9gMy5b8u0XINC30GUFg5q8ufkuBb713j/ageXnIN5DJtiMcFbrik3EGjm8N7k/CDqbpbE7cNRgUKFTmUXvSl1nfZPYZs30NGmBY/RiQOQyqTHj8L5EjX59wSXwZg8xx1A9WPzFvqlxNPSqvOnMC/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770368415; c=relaxed/relaxed;
	bh=AAa1YHHXlRxCyV34si3kL8ro5w9N8xOaXugxbc/BqSI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=nbsC/TMuD/y5eYwT3GSx5p8WBlJAgs5ZS/ybC+TW2y4biwIIb3OkhkgbG4kbhjhG7X5Y3oubfCc0zahjdmxyBiYFvQvlERdesCvUL23B+yo1JJEE5N8SZ8enEY+exXRb5XDLtKub4sv8ZAC4JHm0++vTeiMuYWGVLP+DhvyheLUBnQwNqJyWV7sQHf2CF9ujBcAxY4bErwbiDvgLG0AGyWyWHq8u9Xc5AyrKpBzrftEAEAdMb5APjDxTv78M6EL96E8aKyI+O3n/p5PTM3azofindDDAtyLZzHaKTRvpNkgmcJMiP50o7J7YjEZfP3k899qyJfusWGXVDqqMkSP1OA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass (client-ip=210.0.225.12; helo=mx1.zhaoxin.com; envelope-from=leoliu-oc@zhaoxin.com; receiver=lists.ozlabs.org) smtp.mailfrom=zhaoxin.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zhaoxin.com (client-ip=210.0.225.12; helo=mx1.zhaoxin.com; envelope-from=leoliu-oc@zhaoxin.com; receiver=lists.ozlabs.org)
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6p2P3Y2Sz2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 20:00:11 +1100 (AEDT)
X-ASG-Debug-ID: 1770368366-086e2353e000fa0001-v7v7hK
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx1.zhaoxin.com with ESMTP id bMLw7G7sq6T7V1cu (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 06 Feb 2026 16:59:26 +0800 (CST)
X-Barracuda-Envelope-From: LeoLiu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXSHMBX1.zhaoxin.com (10.28.252.163) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.59; Fri, 6 Feb
 2026 16:59:26 +0800
Received: from ZXSHMBX1.zhaoxin.com ([fe80::936:f2f9:9efa:3c85]) by
 ZXSHMBX1.zhaoxin.com ([fe80::936:f2f9:9efa:3c85%7]) with mapi id
 15.01.2507.059; Fri, 6 Feb 2026 16:59:26 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from [10.32.64.12] (10.32.64.12) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.59; Fri, 6 Feb
 2026 16:13:38 +0800
Message-ID: <018007dd-68d9-4e16-b605-15d9c77ea13f@zhaoxin.com>
Date: Fri, 6 Feb 2026 16:13:30 +0800
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
Subject: Re: [PATCH] PCI: dpc: Increase pciehp waiting time for DPC recovery
From: LeoLiu-oc <LeoLiu-oc@zhaoxin.com>
X-ASG-Orig-Subj: Re: [PATCH] PCI: dpc: Increase pciehp waiting time for DPC recovery
To: Lukas Wunner <lukas@wunner.de>
CC: Bjorn Helgaas <helgaas@kernel.org>, <mahesh@linux.ibm.com>,
	<oohall@gmail.com>, <bhelgaas@google.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<CobeChen@zhaoxin.com>, <TonyWWang@zhaoxin.com>, <ErosZhang@zhaoxin.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel
	<przemyslaw.kitszel@intel.com>
References: <20260123202140.GA84703@bhelgaas>
 <3af9f754-d282-485c-a3f2-49a230bfe143@zhaoxin.com>
 <aXydEn_lAbNROQKy@wunner.de>
 <1096398c-e883-4232-91f6-836fc508092d@zhaoxin.com>
 <aYBoP-B2E9fp_4YZ@wunner.de>
 <e4ac46d3-321f-4f9d-b327-0e16caabbb96@zhaoxin.com>
In-Reply-To: <e4ac46d3-321f-4f9d-b327-0e16caabbb96@zhaoxin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.32.64.12]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Moderation-Data: 2/6/2026 4:59:25 PM
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1770368366
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://mx2.zhaoxin.com:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 11235
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -1.52
X-Barracuda-Spam-Status: No, SCORE=-1.52 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=BSF_SC0_SA983
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.154119
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
	0.50 BSF_SC0_SA983          Custom Rule BSF_SC0_SA983
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.51 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16664-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[zhaoxin.com];
	FORGED_RECIPIENTS(0.00)[m:lukas@wunner.de,m:helgaas@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:bhelgaas@google.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:CobeChen@zhaoxin.com,m:TonyWWang@zhaoxin.com,m:ErosZhang@zhaoxin.com,m:anthony.l.nguyen@intel.com,m:przemyslaw.kitszel@intel.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,gmail.com,google.com,lists.ozlabs.org,vger.kernel.org,zhaoxin.com,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[LeoLiu-oc@zhaoxin.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[LeoLiu-oc@zhaoxin.com,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,zhaoxin.com:mid]
X-Rspamd-Queue-Id: 936F4FBBE4
X-Rspamd-Action: no action



=E5=9C=A8 2026/2/4 10:10, LeoLiu-oc =E5=86=99=E9=81=93:
>=20
>=20
> =E5=9C=A8 2026/2/2 17:02, Lukas Wunner =E5=86=99=E9=81=93:
>>
>>
>> [=E8=BF=99=E5=B0=81=E9=82=AE=E4=BB=B6=E6=9D=A5=E8=87=AA=E5=A4=96=E9=83=
=A8=E5=8F=91=E4=BB=B6=E4=BA=BA =E8=B0=A8=E9=98=B2=E9=A3=8E=E9=99=A9]
>>
>> [cc +=3D Tony, Przemek (ice driver maintainers), start of thread is here=
:
>> https://lore.kernel.org/all/20260123104034.429060-1-LeoLiu-oc@zhaoxin.co=
m/
>> ]
>>
>> On Mon, Feb 02, 2026 at 02:00:55PM +0800, LeoLiu-oc wrote:
>>> The kernel version I am using is 6.18.6.
>> [...]
>>> The complete log of the kernel panic is as follows:
>>>
>>> [  100.304077][  T843] list_del corruption, ffff8881418b79e8->next is L=
IST_POISON1 (dead000000000100)
>>> [  100.312989][  T843] ------------[ cut here ]------------
>>> [  100.318268][  T843] kernel BUG at lib/list_debug.c:56!
>>> [  100.323380][  T843] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
>>> [  100.329250][  T843] CPU: 7 PID: 843 Comm: irq/27-pciehp Tainted: P  =
  W  OE     ------- ----  6.6.0-32.7.v2505.ky11.x86_64 #1
>>> [  100.340793][  T843] Source Version: 71d5b964051132b7772acd935972fca1=
1462bbfe
>>> [  100.359228][  T843] RIP: 0010:__list_del_entry_valid_or_report+0x7f/=
0xc0
>>> [  100.365877][  T843] Code: 66 4b a6 e8 c3 43 a9 ff 0f 0b 48 89 fe 48 =
c7 c7 10 67 4b a6 e8 b2 43 a9 ff 0f 0b 48 89 fe 48 c7 c7 40 67 4b a6 e8 a1 =
43 a9 ff <0f> 0b 48 89 fe 48 89 ca 48 c7 c7 78 67 4b a6 e8 8d 43 a9 ff 0f 0=
b
>>> [  100.385158][  T843] RSP: 0018:ffffc9000f70fc08 EFLAGS: 00010246
>>> [  100.391024][  T843] RAX: 000000000000004e RBX: ffff8881418b79e8 RCX:=
 0000000000000000
>>> [  100.398781][  T843] RDX: 0000000000000000 RSI: ffff8897df5a32c0 RDI:=
 ffff8897df5a32c0
>>> [  100.406538][  T843] RBP: ffff8881257f9608 R08: 0000000000000000 R09:=
 0000000000000003
>>> [  100.414294][  T843] R10: ffffc9000f70fa90 R11: ffffffffa6fee508 R12:=
 0000000000000000
>>> [  100.422050][  T843] R13: ffff8881257f9608 R14: ffff888116507c28 R15:=
 ffff888116507c28
>>> [  100.429807][  T843] FS:  0000000000000000(0000) GS:ffff8897df580000(=
0000) knlGS:0000000000000000
>>> [  100.438511][  T843] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003=
3
>>> [  100.444891][  T843] CR2: 00007f9563bac1c0 CR3: 0000000c4be26004 CR4:=
 0000000000570ee0
>>> [  100.452647][  T843] PKRU: 55555554
>>> [  100.456017][  T843] Call Trace:
>>> [  100.459129][  T843]  <TASK>
>>> [  100.461898][  T843]  ice_flow_rem_entry_sync.constprop.0+0x1c/0x90 [=
ice]
>>> [  100.468663][  T843]  ice_flow_rem_entry+0x3d/0x60 [ice]
>>> [  100.473925][  T843]  ice_fdir_erase_flow_from_hw.constprop.0+0x9b/0x=
100 [ice]
>>> [  100.481078][  T843]  ice_fdir_rem_flow.constprop.0+0x32/0xb0 [ice]
>>> [  100.487284][  T843]  ice_vsi_manage_fdir+0x7b/0xb0 [ice]
>>> [  100.492629][  T843]  ice_deinit_features.part.0+0x46/0xc0 [ice]
>>> [  100.498571][  T843]  ice_remove+0xcf/0x220 [ice]
>>> [  100.503222][  T843]  pci_device_remove+0x3f/0xb0
>>> [  100.507798][  T843]  device_release_driver_internal+0x19d/0x220
>>> [  100.513667][  T843]  pci_stop_bus_device+0x6c/0x90
>>> [  100.518417][  T843]  pci_stop_and_remove_bus_device+0x12/0x20
>>> [  100.524110][  T843]  pciehp_unconfigure_device+0x9f/0x160
>>> [  100.529463][  T843]  pciehp_disable_slot+0x69/0x130
>>> [  100.534296][  T843]  pciehp_handle_presence_or_link_change+0xfc/0x21=
0
>>> [  100.540678][  T843]  pciehp_ist+0x204/0x230
>>> [  100.544824][  T843]  ? __pfx_irq_thread_fn+0x10/0x10
>>> [  100.549747][  T843]  irq_thread_fn+0x20/0x60
>>> [  100.553978][  T843]  irq_thread+0xfb/0x1c0
>>> [  100.558038][  T843]  ? __pfx_irq_thread_dtor+0x10/0x10
>>> [  100.563130][  T843]  ? __pfx_irq_thread+0x10/0x10
>>> [  100.567791][  T843]  kthread+0xe5/0x120
>>> [  100.571594][  T843]  ? __pfx_kthread+0x10/0x10
>>> [  100.575997][  T843]  ret_from_fork+0x17a/0x1a0
>>> [  100.580403][  T843]  ? __pfx_kthread+0x10/0x10
>>> [  100.584805][  T843]  ret_from_fork_asm+0x1a/0x30
>>> [  100.589384][  T843]  </TASK>
>>> [  100.592237][  T843] Modules linked in: zxmem(OE) einj amdgpu amdxcp
>>> gpu_sched drm_exec drm_buddy nft_fib_inet nft_fib_ipv4 nft_fib_ipv6
>>> nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
>>> nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 zhaoxin_cputemp
>>> nf_defrag_ipv4 zhaoxin_rng snd_hda_codec_hdmi radeon rfkill
>>> snd_hda_intel snd_intel_dspcfg irdma i2c_algo_bit snd_intel_sdw_acpi
>>> ip_set i40e drm_suballoc_helper nf_tables drm_ttm_helper pcicfg(POE)
>>> snd_hda_codec ib_uverbs sunrpc ttm ib_core snd_hda_core
>>> drm_display_helper snd_hwdep kvm_intel snd_pcm cec vfat fat
>>> drm_kms_helper snd_timer kvm video ice snd psmouse soundcore wmi
>>> acpi_cpufreq pcspkr i2c_zhaoxin sg sch_fq_codel drm fuse backlight
>>> nfnetlink xfs sd_mod t10_pi sm2_zhaoxin_gmi crct10dif_pclmul
>>> crc32_pclmul ahci crc32c_intel libahci r8169 ghash_clmulni_intel libata
>>> sha512_ssse3 serio_raw realtek dm_mirror dm_region_hash dm_log
>>> dm_multipath dm_mod i2c_dev autofs4
>>> [  100.674508][  T843] ---[ end trace 0000000000000000 ]---
>>> [  100.709547][  T843] RIP: 0010:__list_del_entry_valid_or_report+0x7f/=
0xc0
>>> [  100.716197][  T843] Code: 66 4b a6 e8 c3 43 a9 ff 0f 0b 48 89 fe 48 =
c7 c7 10 67 4b a6 e8 b2 43 a9 ff 0f 0b 48 89 fe 48 c7 c7 40 67 4b a6 e8 a1 =
43 a9 ff <0f> 0b 48 89 fe 48 89 ca 48 c7 c7 78 67 4b a6 e8 8d 43 a9 ff 0f 0=
b
>>> [  100.735491][  T843] RSP: 0018:ffffc9000f70fc08 EFLAGS: 00010246
>>> [  100.741367][  T843] RAX: 000000000000004e RBX: ffff8881418b79e8 RCX:=
 0000000000000000
>>> [  100.749137][  T843] RDX: 0000000000000000 RSI: ffff8897df5a32c0 RDI:=
 ffff8897df5a32c0
>>> [  100.756909][  T843] RBP: ffff8881257f9608 R08: 0000000000000000 R09:=
 0000000000000003
>>> [  100.764678][  T843] R10: ffffc9000f70fa90 R11: ffffffffa6fee508 R12:=
 0000000000000000
>>> [  100.772448][  T843] R13: ffff8881257f9608 R14: ffff888116507c28 R15:=
 ffff888116507c28
>>> [  100.780218][  T843] FS:  0000000000000000(0000) GS:ffff8897df580000(=
0000) knlGS:0000000000000000
>>> [  100.788934][  T843] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003=
3
>>> [  100.795329][  T843] CR2: 00007f9563bac1c0 CR3: 0000000c4be26004 CR4:=
 0000000000570ee0
>>> [  100.803099][  T843] PKRU: 55555554
>>> [  100.806483][  T843] Kernel panic - not syncing: Fatal exception
>>> [  100.812794][  T843] Kernel Offset: disabled
>>> [  100.821613][  T843] pstore: backend (erst) writing error (-28)
>>> [  100.827481][  T843] ---[ end Kernel panic - not syncing: Fatal excep=
tion ]---
>>>
>>> The reason for this kernel panic is that the ice network card driver
>>> executed the ice_pci_err_detected() for a longer time than the maximum
>>> waiting time allowed by pciehp. After that, the pciehp_ist() will
>>> execute the ice network card driver's ice_remove() process. This result=
s
>>> in the ice_pci_err_detected() having already deleted the list, while th=
e
>>> ice_remove() is still attempting to delete a list that no longer exists=
.
>>
>> This is a bug in the ice driver, not in the pciehp or dpc driver.
>> As such, it is not a good argument to support the extension of the
>> timeout.  I'm not against extending the timeout, but the argument
>> that it's necessary to avoid occurrence of a bug is not a good one.
>>
>> You should first try to unbind the ice driver at runtime to see if
>> there is a general problem in the unbind code path:
>>
>> echo abcd:ef:gh.i > /sys/bus/pci/drivers/shpchp/unbind
>>
>> Replace abcd:ef:gh.i with the domain/bus/device/function of the Ethernet
>> card.  The dmesg excerpt you've provided unfortunately does not betray
>> the card's address.
>>
>> Then try to rebind the driver via the "bind" sysfs attribute.
>>
Sorry, I didn't mean to ignore your question=EF=BC=8Cbecause these issues a=
re
not the cause of the kernel panic. I have previously conducted a test
where I first unbound the ice network card and then bound it. There was
no problem with that.

>> If this works, the next thing to debug is whether the driver has a
>> problem with surprise removal.  I'm not fully convinced that the
>> crash you're seeing is caused by concurrent execution of
>> ice_pci_err_detected() and ice_remove().  When pciehp unbinds the
>> driver during DPC recovery, the device is likely inaccessible.
>> It's possible that ice_remove() behaves differently for an
>> inaccessible device and that may cause the crash instead of the
>> concurrent execution of ice_pci_err_detected().
>>
I was able to turn off the power supply of the slot where the ice
network card is located and then enable the power supply through the
sysfs interface, without any issues.

For example,
echo 0 > /sys/bus/pci/slots/[slot number]/power
echo 1 > /sys/bus/pci/slots/[slot number]/power

It is also fine to perform DPC recovery separately for the slot where
the ice network card is located.

When the slot where the ice network card is located enables both DPC and
hotplug simultaneously, conducting the DPC recovery test will result in
issues, such as unavailability of the device and kernel panic.

I had previously confirmed through the code for deleting the list by
using the core dump method. The cause of the kernel panic was exactly as
I had described before: The reason for this kernel panic is that the ice
network card driver executed the ice_pci_err_detected() for a longer
time than the maximum waiting time allowed by pciehp. After that, the
pciehp_ist() will execute the ice network card driver's ice_remove()
process. This results in the ice_pci_err_detected() having already
deleted the list, while the ice_remove() is still attempting to delete a
list that no longer exists.

> The fundamental cause of this problem lies in the fact that the network
> driver took longer than the maximum time (4 seconds) set by pcie_ist()
> for the DPC to recover when executing ice_pci_err_detected(). This
> forced the execution of pciehp_disable_slot() which should not have been
> executed, while pcie_do_recovery() continued to execute. This situation
> led to a competition between the execution processes of
> pciehp_disable_slot() and pcie_do_recovery(), resulting in the
> unavailability of the device and the possibility of kernel crashes.
>=20
Add some information about this question, this might be a problem with a
series of PCIe devices, rather than just an issue with the ice network
card driver. Therefore, we should address the issue at the PCIe driver
architecture level to ensure that other PCIe devices do not encounter
such problems.

>> It would also be good to understand why DPC recovery of the Ethernet
>> card takes this long.  Does it take a long time to come out of reset?
>> Could the ice driver be changed to allow for faster recovery?
>>
> Based on the current situation, it is observed that the execution of
> ice_pci_err_detected() in the ice network card driver takes a very long
> time, which is intolerable for the synchronization protocol between the
> PCIe hotplug driver and the DPC recovery.
>=20
Based on the previous debugging results, the long execution time of the
ice network card driver for ice_pci_err_detected() is mainly influenced
by the irdma driver of the ice network card.

> Yours sincerely,
> LeoLiu-oc
>=20
>> Thanks,
>>
>> Lukas
>=20


