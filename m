Return-Path: <linuxppc-dev+bounces-16503-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KKWEglJgGnC5gIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16503-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 07:49:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A690C8F3C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 07:49:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4HKd4p9Wz30FF;
	Mon, 02 Feb 2026 17:49:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=61.152.208.219
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770014981;
	cv=none; b=Gc2Zf7An8Y8U+563s3+KYFEyKxOwc5cUqewtadfzDC10JjeTmF65fzL3dUgKdIDzP51vGo9DLcx0kAOEcb+OZoYoA3735/Pk6e6GFrBc99lQZ8NZqc8UUIkDm30T/9twf8SzJwMKC0ulPmaphC+X5EN3BIoI6eT22SnpT2Sy9XQaWfaDLg8ZZSTE39g7G+vNamWrHW+GUm6Dr1eBQWkK7DaCjoq7RL62lxRqzfZ5olXaoptsJB3CbJUXwSK43Bq7DElsLCXJ160nnJPEdFhxPklk//RRE55913NVSQ0b8jyl0BzmfIYXXuwt7cGXlCRurfcIZMUlnb16xOOrdRhP0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770014981; c=relaxed/relaxed;
	bh=HuXza5IKqH+jfDdU/iMuuGVJC1wMTwNjXTJPG8GkI7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nHHiexOO5sUpflUZjKVA3l8FQWfl7Fn8bU24qKVnACsYjTfr+reFbIZtMN7eadPLDajDHiZvb9M0h6TS1D4M8pdc3vceHRVs/XREhE3Rgb7TpaXTaD+RbxZNlX43L6TJmrsJT8xc9Em8Avub6z9yCqnOl/A2PdrkDA84QWrxuIpYCD8ZxEWOiJ+y8jyH+rHB/ZzZQ/MtQZEgTYSoSS3WZFPdNXMZXlIWtpdHhxyZjwhuuG+28lUN4EjV8q0YMLyp4MsAU3UPPDpeFN0RxRXH/WBsyQBQXn8WpucOKu5HnLpvasGk36B5OfwtKwX8PV9AHy123OvnEIYCaoGUghLCFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass (client-ip=61.152.208.219; helo=mx2.zhaoxin.com; envelope-from=leoliu-oc@zhaoxin.com; receiver=lists.ozlabs.org) smtp.mailfrom=zhaoxin.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zhaoxin.com (client-ip=61.152.208.219; helo=mx2.zhaoxin.com; envelope-from=leoliu-oc@zhaoxin.com; receiver=lists.ozlabs.org)
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [61.152.208.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4HKB4Zmfz30BR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 17:49:16 +1100 (AEDT)
X-ASG-Debug-ID: 1770011779-1eb14e7c0446370001-v7v7hK
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id fSw72eFTANyS85Gi (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 02 Feb 2026 13:56:19 +0800 (CST)
X-Barracuda-Envelope-From: LeoLiu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXSHMBX1.zhaoxin.com (10.28.252.163) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.59; Mon, 2 Feb
 2026 13:56:18 +0800
Received: from ZXSHMBX1.zhaoxin.com ([fe80::936:f2f9:9efa:3c85]) by
 ZXSHMBX1.zhaoxin.com ([fe80::936:f2f9:9efa:3c85%7]) with mapi id
 15.01.2507.059; Mon, 2 Feb 2026 13:56:18 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from [10.32.64.5] (10.32.64.5) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.59; Mon, 2 Feb
 2026 13:55:30 +0800
Message-ID: <075992c3-6a98-4854-9c4d-59abef7f1d5a@zhaoxin.com>
Date: Mon, 2 Feb 2026 13:55:24 +0800
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
To: Bjorn Helgaas <helgaas@kernel.org>
X-ASG-Orig-Subj: Re: [PATCH] PCI: dpc: Increase pciehp waiting time for DPC recovery
CC: <mahesh@linux.ibm.com>, <oohall@gmail.com>, <bhelgaas@google.com>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <CobeChen@zhaoxin.com>,
	<TonyWWang@zhaoxin.com>, <ErosZhang@zhaoxin.com>, Lukas Wunner
	<lukas@wunner.de>
References: <20260128194835.GA429644@bhelgaas>
From: LeoLiu-oc <LeoLiu-oc@zhaoxin.com>
In-Reply-To: <20260128194835.GA429644@bhelgaas>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.32.64.5]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Moderation-Data: 2/2/2026 1:56:17 PM
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1770011779
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 13155
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.153920
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
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
	TAGGED_FROM(0.00)[bounces-16503-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,gmail.com,google.com,lists.ozlabs.org,vger.kernel.org,zhaoxin.com,wunner.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[zhaoxin.com];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:bhelgaas@google.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:CobeChen@zhaoxin.com,m:TonyWWang@zhaoxin.com,m:ErosZhang@zhaoxin.com,m:lukas@wunner.de,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[LeoLiu-oc@zhaoxin.com,linuxppc-dev@lists.ozlabs.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
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
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zhaoxin.com:mid]
X-Rspamd-Queue-Id: 4A690C8F3C
X-Rspamd-Action: no action



=E5=9C=A8 2026/1/29 3:48, Bjorn Helgaas =E5=86=99=E9=81=93:
>=20
>=20
> [=E8=BF=99=E5=B0=81=E9=82=AE=E4=BB=B6=E6=9D=A5=E8=87=AA=E5=A4=96=E9=83=A8=
=E5=8F=91=E4=BB=B6=E4=BA=BA =E8=B0=A8=E9=98=B2=E9=A3=8E=E9=99=A9]
>=20
> On Wed, Jan 28, 2026 at 06:07:51PM +0800, LeoLiu-oc wrote:
>> =E5=9C=A8 2026/1/24 4:21, Bjorn Helgaas =E5=86=99=E9=81=93:
>>> [=E8=BF=99=E5=B0=81=E9=82=AE=E4=BB=B6=E6=9D=A5=E8=87=AA=E5=A4=96=E9=83=
=A8=E5=8F=91=E4=BB=B6=E4=BA=BA =E8=B0=A8=E9=98=B2=E9=A3=8E=E9=99=A9]
>>> On Fri, Jan 23, 2026 at 06:40:34PM +0800, LeoLiu-oc wrote:
>>>> Commit a97396c6eb13 ("PCI: pciehp: Ignore Link Down/Up caused by DPC")
>>>> amended PCIe hotplug to not bring down the slot upon Data Link Layer S=
tate
>>>> Changed events caused by Downstream Port Containment.
>>>>
>>>> However, PCIe hotplug (pciehp) waits up to 4 seconds before assuming t=
hat
>>>> DPC recovery has failed and disabling the slot. This timeout period is
>>>> insufficient for some PCIe devices.
>>>> For example, the E810 dual-port network card driver needs to take over
>>>> 10 seconds to execute its err_detected() callback.
>>>> Since this exceeds the maximum wait time allowed for DPC recovery by t=
he
>>>> hotplug IRQ threads, a race condition occurs between the hotplug threa=
d and
>>>> the dpc_handler() thread.
>=20
>>> Include the name of the E810 driver so we can easily find the
>>> .err_detected() callback in question.  Actually, including the *name*
>>> of that callback would be a very direct way of doing this :)
>=20
Ok, your advice is very good. I'll follow your suggestion.

> AFAICS there is no ".err_detected()" callback.  I assume you mean the
> ".error_detected()" callback in struct pci_error_handlers.  Sorry to
> be pedantic, but it makes things a lot harder to review if we don't
> refer to the actual names in the code.
>=20
Yes,.err_detected() described above refers to the ice_pci_err_detected
function of the ice network driver.I will modify this part in the commit
of the next version.

> And my guess is that E810 means the Intel E810 NIC, probably claimed
> by the "ice" driver, which would mean ice_pci_err_detected() is the
> callback in question?
>=20
Yes, the "E810" device driver described above refers to the "ice" driver.

Commit a97396c6eb13 ("PCI: pciehp: Ignore Link Down/Up caused by DPC")
amended PCIe hotplug to not bring down the slot upon Data Link Layer State
Changed events caused by Downstream Port Containment.
Commit c3be50f7547c ("PCI: pciehp: Ignore Presence Detect Changed caused
by DPC") sought to ignore Presence Detect Changed events occurring as a sid=
e
effect of Downstream Port Containment.
These commits await recovery from DPC and then clears events which
occurred in the meantime.

However, pciehp_ist() waits up to 4 seconds before assuming that DPC
recovery has failed and disabling the slot. This timeout period is
insufficient for some PCIe devices. For example, the ice network card
driver execution exceeded the maximum waiting time for DPC recovery,
causing the pciehp_disable_slot function to be executed which is not
needed. From the user's point of view, you will see that the ice network
card may not be usable and could even cause more serious errors, such as
a kernel panic. kernel panic is caused by a race between
pciep_disable_slot() and pcie_do_recovery().
For example, the following log is encountered in hardware testing:

[  100.304077][  T843] list_del corruption, ffff8881418b79e8->next is
LIST_POISON1 (dead000000000100)
[  100.312989][  T843] ------------[ cut here ]------------
[  100.318268][  T843] kernel BUG at lib/list_debug.c:56!
[  100.323380][  T843] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[  100.329250][  T843] CPU: 7 PID: 843 Comm: irq/27-pciehp Tainted: P
    W  OE     ------- ----  6.6.0-32.7.v2505.ky11.x86_64 #1
[  100.340793][  T843] Source Version:
71d5b964051132b7772acd935972fca11462bbfe
[  100.359228][  T843] RIP: 0010:__list_del_entry_valid_or_report+0x7f/0xc0
[  100.365877][  T843] Code: 66 4b a6 e8 c3 43 a9 ff 0f 0b 48 89 fe 48
c7 c7 10 67 4b a6 e8 b2 43 a9 ff 0f 0b 48 89 fe 48 c7 c7 40 67 4b a6 e8
a1 43 a9 ff <0f> 0b 48 89 fe 48 89 ca 48 c7 c7 78 67 4b a6 e8 8d 43 a9
ff 0f 0b
[  100.385158][  T843] RSP: 0018:ffffc9000f70fc08 EFLAGS: 00010246
[  100.391024][  T843] RAX: 000000000000004e RBX: ffff8881418b79e8 RCX:
0000000000000000
[  100.398781][  T843] RDX: 0000000000000000 RSI: ffff8897df5a32c0 RDI:
ffff8897df5a32c0
[  100.406538][  T843] RBP: ffff8881257f9608 R08: 0000000000000000 R09:
0000000000000003
[  100.414294][  T843] R10: ffffc9000f70fa90 R11: ffffffffa6fee508 R12:
0000000000000000
[  100.422050][  T843] R13: ffff8881257f9608 R14: ffff888116507c28 R15:
ffff888116507c28
[  100.429807][  T843] FS:  0000000000000000(0000)
GS:ffff8897df580000(0000) knlGS:0000000000000000
[  100.438511][  T843] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  100.444891][  T843] CR2: 00007f9563bac1c0 CR3: 0000000c4be26004 CR4:
0000000000570ee0
[  100.452647][  T843] PKRU: 55555554
[  100.456017][  T843] Call Trace:
[  100.459129][  T843]  <TASK>
[  100.461898][  T843]  ice_flow_rem_entry_sync.constprop.0+0x1c/0x90 [ice]
[  100.468663][  T843]  ice_flow_rem_entry+0x3d/0x60 [ice]
[  100.473925][  T843]
ice_fdir_erase_flow_from_hw.constprop.0+0x9b/0x100 [ice]
[  100.481078][  T843]  ice_fdir_rem_flow.constprop.0+0x32/0xb0 [ice]
[  100.487284][  T843]  ice_vsi_manage_fdir+0x7b/0xb0 [ice]
[  100.492629][  T843]  ice_deinit_features.part.0+0x46/0xc0 [ice]
[  100.498571][  T843]  ice_remove+0xcf/0x220 [ice]
[  100.503222][  T843]  pci_device_remove+0x3f/0xb0
[  100.507798][  T843]  device_release_driver_internal+0x19d/0x220
[  100.513667][  T843]  pci_stop_bus_device+0x6c/0x90
[  100.518417][  T843]  pci_stop_and_remove_bus_device+0x12/0x20
[  100.524110][  T843]  pciehp_unconfigure_device+0x9f/0x160
[  100.529463][  T843]  pciehp_disable_slot+0x69/0x130
[  100.534296][  T843]  pciehp_handle_presence_or_link_change+0xfc/0x210
[  100.540678][  T843]  pciehp_ist+0x204/0x230
[  100.544824][  T843]  ? __pfx_irq_thread_fn+0x10/0x10
[  100.549747][  T843]  irq_thread_fn+0x20/0x60
[  100.553978][  T843]  irq_thread+0xfb/0x1c0
[  100.558038][  T843]  ? __pfx_irq_thread_dtor+0x10/0x10
[  100.563130][  T843]  ? __pfx_irq_thread+0x10/0x10
[  100.567791][  T843]  kthread+0xe5/0x120
[  100.571594][  T843]  ? __pfx_kthread+0x10/0x10
[  100.575997][  T843]  ret_from_fork+0x17a/0x1a0
[  100.580403][  T843]  ? __pfx_kthread+0x10/0x10
[  100.584805][  T843]  ret_from_fork_asm+0x1a/0x30
[  100.589384][  T843]  </TASK>
[  100.592237][  T843] Modules linked in: zxmem(OE) einj amdgpu amdxcp
gpu_sched drm_exec drm_buddy nft_fib_inet nft_fib_ipv4 nft_fib_ipv6
nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 zhaoxin_cputemp
nf_defrag_ipv4 zhaoxin_rng snd_hda_codec_hdmi radeon rfkill
snd_hda_intel snd_intel_dspcfg irdma i2c_algo_bit snd_intel_sdw_acpi
ip_set i40e drm_suballoc_helper nf_tables drm_ttm_helper pcicfg(POE)
snd_hda_codec ib_uverbs sunrpc ttm ib_core snd_hda_core
drm_display_helper snd_hwdep kvm_intel snd_pcm cec vfat fat
drm_kms_helper snd_timer kvm video ice snd psmouse soundcore wmi
acpi_cpufreq pcspkr i2c_zhaoxin sg sch_fq_codel drm fuse backlight
nfnetlink xfs sd_mod t10_pi sm2_zhaoxin_gmi crct10dif_pclmul
crc32_pclmul ahci crc32c_intel libahci r8169 ghash_clmulni_intel libata
sha512_ssse3 serio_raw realtek dm_mirror dm_region_hash dm_log
dm_multipath dm_mod i2c_dev autofs4
[  100.674508][  T843] ---[ end trace 0000000000000000 ]---
[  100.709547][  T843] RIP: 0010:__list_del_entry_valid_or_report+0x7f/0xc0
[  100.716197][  T843] Code: 66 4b a6 e8 c3 43 a9 ff 0f 0b 48 89 fe 48
c7 c7 10 67 4b a6 e8 b2 43 a9 ff 0f 0b 48 89 fe 48 c7 c7 40 67 4b a6 e8
a1 43 a9 ff <0f> 0b 48 89 fe 48 89 ca 48 c7 c7 78 67 4b a6 e8 8d 43 a9
ff 0f 0b
[  100.735491][  T843] RSP: 0018:ffffc9000f70fc08 EFLAGS: 00010246
[  100.741367][  T843] RAX: 000000000000004e RBX: ffff8881418b79e8 RCX:
0000000000000000
[  100.749137][  T843] RDX: 0000000000000000 RSI: ffff8897df5a32c0 RDI:
ffff8897df5a32c0
[  100.756909][  T843] RBP: ffff8881257f9608 R08: 0000000000000000 R09:
0000000000000003
[  100.764678][  T843] R10: ffffc9000f70fa90 R11: ffffffffa6fee508 R12:
0000000000000000
[  100.772448][  T843] R13: ffff8881257f9608 R14: ffff888116507c28 R15:
ffff888116507c28
[  100.780218][  T843] FS:  0000000000000000(0000)
GS:ffff8897df580000(0000) knlGS:0000000000000000
[  100.788934][  T843] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  100.795329][  T843] CR2: 00007f9563bac1c0 CR3: 0000000c4be26004 CR4:
0000000000570ee0
[  100.803099][  T843] PKRU: 55555554
[  100.806483][  T843] Kernel panic - not syncing: Fatal exception
[  100.812794][  T843] Kernel Offset: disabled
[  100.821613][  T843] pstore: backend (erst) writing error (-28)
[  100.827481][  T843] ---[ end Kernel panic - not syncing: Fatal
exception ]---


>>> I guess the problem this fixes is that there was a PCIe error that
>>> triggered DPC, and the E810 .err_detected() works but takes longer
>>> than expected, which results in pciehp disabling the slot when it
>>> doesn't need to?  So the user basically sees a dead E810 device?
>>
>> Yes, this patch is to solve this problem.
>>
Without this patch, we would observe that the ice network card is in an
unavailable state and a kernel panic.

>>> It seems unfortunate that we have this dependency on the time allowed
>>> for .err_detected() to execute.  It's nice if adding arbitrary delay
>>> doesn't break things, but maybe we can't always achieve that.
>>>
>> I think this is a feasible solution. For some PCIE devices, executing
>> the .err_detect() within 4 seconds will not have any impact, for a few
>> PCIE devices, it might increase the execution time of pciehp_ist().
>> Without this patch, PCIE devices may not be usable and could even cause
>> more serious errors, such as a kernel panic. For example, the following
>> log is encountered in hardware testing:
>>
>> list_del corruption, ffff8881418b79e8->next is LIST_POISON1
>> (dead000000000100)
>> ------------[ cut here ]------------
>> kernel BUG at lib/list_debug.c:56!
>> invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
>> ...
>> Kernel panic - not syncing: Fatal exception
>=20
> This is an interesting panic and looks like it might have been hard to
> debug.
>=20
> Do you have any idea what exactly caused this and how it's related to
> the timeout in pci_dpc_recovered()?  Is there a race where pciehp
> disables the slot and removes the driver, but eventually
> ice_pci_err_detected() completes and we're running some ice driver
> code while it's being removed or something?
>=20
The reason for this kernel panic is that the ice network card driver
executed the ice_pci_err_detected() for a longer time than the maximum
waiting time allowed by pciehp. After that, the pciehp_ist() will
execute the ice network card driver's ice_remove() process. This results
in the ice_pci_err_detected() having already deleted the list, while the
ice_remove() is still attempting to delete a list that no longer exists.

> Simply increasing the timeout doesn't feel like a very robust way of
> solving the problem.  What happens when some other device needs 17
> seconds?
>=20
The situation you described is indeed possible. Yes, we cannot guarantee
that all PCIe devices will complete the DPC recovery process within 16
seconds.

> But if increasing the timeout is the best we can do, maybe a warning
> message in pci_dpc_recovered() when we time out would at least be a
> hint that we might be heading for trouble?
>=20
This is indeed a very good suggestion. Here is another alternative.

@@ -100,6 +100,7 @@ static bool dpc_completed(struct pci_dev *pdev)
 bool pci_dpc_recovered(struct pci_dev *pdev)
 {
 	struct pci_host_bridge *host;
+	u16 status;

 	if (!pdev->dpc_cap)
 		return false;
@@ -120,6 +121,12 @@ bool pci_dpc_recovered(struct pci_dev *pdev)
 	wait_event_timeout(dpc_completed_waitqueue, dpc_completed(pdev),
 			   msecs_to_jiffies(4000));

+	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_STATUS, &status);
+	if ((!PCI_POSSIBLE_ERROR(status)) && (status &
PCI_EXP_DPC_STATUS_TRIGGER)){
+		pci_warn(pdev, "The execution of device driver's error_detected()
took too long\n");
+		return true;
+	}
+
 	return test_and_clear_bit(PCI_DPC_RECOVERED, &pdev->priv_flags);

>>> I see that pci_dpc_recovered() is called from pciehp_ist().  Are we
>>> prepared for long delays there?
>>
>> This patch may affect the hotplug IRQ threads execution time triggered
>> by DPC, but it has no effect for normal HotPlug operation, e.g.
>> Attention Button Pressed or Power Fault Detected. If you have better
>> modification suggestions, I will update to the next version.
>=20
>>>> +++ b/drivers/pci/pcie/dpc.c
>>>> @@ -121,7 +121,7 @@ bool pci_dpc_recovered(struct pci_dev *pdev)
>>>>        * but reports indicate that DPC completes within 4 seconds.
>>>>        */
>>>>       wait_event_timeout(dpc_completed_waitqueue, dpc_completed(pdev),
>>>> -                        msecs_to_jiffies(4000));
>>>> +                        msecs_to_jiffies(16000));


