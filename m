Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1636040EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 12:30:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Msn6d6Ngrz3dvy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 21:30:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=danny.cz (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=<UNKNOWN>)
X-Greylist: delayed 489 seconds by postgrey-1.36 at boromir; Wed, 19 Oct 2022 21:29:30 AEDT
Received: from redcrew.org (redcrew.org [37.157.195.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Msn626yTpz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 21:29:30 +1100 (AEDT)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
	by redcrew.org (Postfix) with ESMTP id 499E6C4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 12:21:07 +0200 (CEST)
Received: from talos.danny.cz (unknown [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
	by server.danny.cz (Postfix) with SMTP id 340B21EAC1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 12:21:07 +0200 (CEST)
Date: Wed, 19 Oct 2022 12:21:06 +0200
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: linuxppc-dev@lists.ozlabs.org
Subject: warning from change_protection in 6.1 rc1
Message-Id: <20221019122106.a525f33bafeb74de59fd0d99@danny.cz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; powerpc64le-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

in my first boot with the 6.1 rc1 kernel I have received a couple of
warnings from change_protection on Talos II P9 system, see the details
below. Nothing like that was noticed in 6.0 or earlier.


	Thanks,

		Dan

[   79.229100] ------------[ cut here ]------------
[   79.229109] WARNING: CPU: 61 PID: 2987 at arch/powerpc/include/asm/book3s/64/tlbflush.h:183 change_protection+0xfd0/0x1610
[   79.229125] Modules linked in: nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_objref nf_conntrack_tftp nft_ct kvm_hv kvm nfsv3 nfs_acl rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc fscache netfs nf_tables ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security bridge stp llc ip_set nfnetlink rfkill ebtable_filter ebtables ip6table_filter iptable_filter binfmt_misc dm_crypt xfs snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi ftdi_sio onboard_usb_hub snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep snd_seq snd_seq_device snd_pcm snd_timer ses enclosure ofpart snd soundcore scsi_transport_sas at24 ipmi_powernv ipmi_devintf powernv_flash regmap_i2c opal_prd crct10dif_vpmsum i2c_opal ipmi_msghandler mtd rtc_opal amdgpu raid1 drm_ttm_helper ttm mfd_core gpu_sc
 hed vmx_crypto
[   79.229258]  crc32c_vpmsum drm_buddy nvme drm_display_helper nvme_core tg3 nvme_common aacraid cec ip6_tables ip_tables i2c_dev fuse
[   79.229283] CPU: 61 PID: 2987 Comm: lightdm-gtk-gre Not tainted 6.1.0-0.rc1.15.fc38.ppc64le #1
[   79.229289] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
[   79.229291] NIP:  c000000000495aa0 LR: c000000000495608 CTR: 0000000000000000
[   79.229295] REGS: c00020001766f690 TRAP: 0700   Not tainted  (6.1.0-0.rc1.15.fc38.ppc64le)
[   79.229299] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44242420  XER: 00000156
[   79.229316] CFAR: c00000000049562c IRQMASK: 0 
               GPR00: c000000000495608 c00020001766f930 c000000001dd7100 c00020001e4e3700 
               GPR04: 0000000154440000 c00020004eac3920 84030a73002000c0 88030a73002000c0 
               GPR08: 0000000000000040 0000000000000001 0000000000000040 0000000000000009 
               GPR12: c00020001795f708 c0002007be1a9700 c0002000554b0000 0000000154440000 
               GPR16: c01fffffffff9f40 fffffffffffffe7f c000000002acdbb8 c000000002a3aef0 
               GPR20: c00020001766fac8 ff7fffffffffefbf 0801000000000080 c00c00080013ab28 
               GPR24: 0000000000000004 c00c00080013ab00 0000000154600000 00000001549b0000 
               GPR28: 88030a73002000c0 c000200054354510 000000000000000d c00020004eac3920 
[   79.229377] NIP [c000000000495aa0] change_protection+0xfd0/0x1610
[   79.229384] LR [c000000000495608] change_protection+0xb38/0x1610
[   79.229390] Call Trace:
[   79.229392] [c00020001766f930] [c000000000495608] change_protection+0xb38/0x1610 (unreliable)
[   79.229401] [c00020001766faa0] [c0000000004eda5c] change_prot_numa+0x7c/0x120
[   79.229408] [c00020001766fb70] [c0000000001ad5dc] task_numa_work+0x2cc/0x500
[   79.229414] [c00020001766fc70] [c000000000185bb4] task_work_run+0xf4/0x180
[   79.229421] [c00020001766fcc0] [c0000000000218c4] do_notify_resume+0x434/0x470
[   79.229429] [c00020001766fd80] [c00000000002c29c] interrupt_exit_user_prepare_main+0x1dc/0x2c0
[   79.229437] [c00020001766fde0] [c00000000002c618] interrupt_exit_user_prepare+0x58/0xb0
[   79.229444] [c00020001766fe10] [c00000000000c8f4] interrupt_return_srr_user+0x8/0x138
[   79.229452] --- interrupt: 900 at 0x7fffa62b7cfc
[   79.229458] NIP:  00007fffa62b7cfc LR: 00007fffa62b7c48 CTR: 0000000000000639
[   79.229461] REGS: c00020001766fe80 TRAP: 0900   Not tainted  (6.1.0-0.rc1.15.fc38.ppc64le)
[   79.229464] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 88444424  XER: 00000156
[   79.229484] CFAR: 0000000000000000 IRQMASK: 0 
               GPR00: 00007fffa62b7c28 00007fffc324a3e0 00007fffa63f7a00 00007ffe53000000 
               GPR04: 00007ffe532d7800 00007fff594d9610 00007fff594d8e90 00000000000000b8 
               GPR08: 00007ffe532d7d20 00007fff594d7d30 00000000000000b9 0000000000000000 
               GPR12: 00007fffa611bfd0 00007fffa6e58d00 0000000000000008 00007fffa5d97480 
               GPR16: 0000000154958000 000000000000000b 0000000000000020 0001000000000000 
               GPR20: 000000000000027f 0000000154907000 00000001543e9100 0000000000000000 
               GPR24: 0000000000000004 00000000000004b0 0000000000000780 0000000000001e00 
               GPR28: 000000000000032c 0000000000001e00 00007fff594d7810 00000001548d71a0 
[   79.229545] NIP [00007fffa62b7cfc] 0x7fffa62b7cfc
[   79.229548] LR [00007fffa62b7c48] 0x7fffa62b7c48
[   79.229551] --- interrupt: 900
[   79.229553] Instruction dump:
[   79.229555] 0fe00000 60000000 60000000 60420000 0fe00000 60000000 60000000 60420000 
[   79.229568] 0fe00000 60000000 60000000 60420000 <0fe00000> 60000000 60000000 60420000 
[   79.229580] ---[ end trace 0000000000000000 ]---
[  245.260381] ------------[ cut here ]------------
[  245.260388] WARNING: CPU: 4 PID: 4468 at arch/powerpc/include/asm/book3s/64/tlbflush.h:182 change_protection+0xfc0/0x1610
[  245.260405] Modules linked in: nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_objref nf_conntrack_tftp nft_ct kvm_hv kvm nfsv3 nfs_acl rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc fscache netfs nf_tables ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security bridge stp llc ip_set nfnetlink rfkill ebtable_filter ebtables ip6table_filter iptable_filter binfmt_misc dm_crypt xfs snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi ftdi_sio onboard_usb_hub snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep snd_seq snd_seq_device snd_pcm snd_timer ses enclosure ofpart snd soundcore scsi_transport_sas at24 ipmi_powernv ipmi_devintf powernv_flash regmap_i2c opal_prd crct10dif_vpmsum i2c_opal ipmi_msghandler mtd rtc_opal amdgpu raid1 drm_ttm_helper ttm mfd_core gpu_sc
 hed vmx_crypto
[  245.260542]  crc32c_vpmsum drm_buddy nvme drm_display_helper nvme_core tg3 nvme_common aacraid cec ip6_tables ip_tables i2c_dev fuse
[  245.260565] CPU: 4 PID: 4468 Comm: WebExtensions Tainted: G        W         -------  ---  6.1.0-0.rc1.15.fc38.ppc64le #1
[  245.260571] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
[  245.260574] NIP:  c000000000495a90 LR: c000000000495608 CTR: 0000000000000000
[  245.260578] REGS: c000000039adf3e0 TRAP: 0700   Tainted: G        W         -------  ---   (6.1.0-0.rc1.15.fc38.ppc64le)
[  245.260582] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 48422244  XER: 0000007d
[  245.260600] CFAR: c000000000495624 IRQMASK: 0 
               GPR00: c000000000495608 c000000039adf680 c000000001dd7100 c00000002c576900 
               GPR04: 00002ce2ebc90000 c000000091a2e148 8803c8a6000000c0 8603c8a6000000c0 
               GPR08: 0000000000000040 0000000000000001 0000000000000040 0000000000000009 
               GPR12: 0000000000000005 c0000007bfdeba00 c00000007195b9d8 00002ce2ebc90000 
               GPR16: c01fffffffff9f40 fffffffffffffe7f c000000002acdbb8 c000000002a3aef0 
               GPR20: c000000039adf938 ff7fffffffffefbf 0401000000000080 c00c0000002468a8 
               GPR24: 0000000000000000 c00c000000246880 00002ce2ebca0000 00002ce2ebca0000 
               GPR28: 8603c8a6000000c0 c000000091a18af0 0000000000000000 c000000091a2e148 
[  245.260660] NIP [c000000000495a90] change_protection+0xfc0/0x1610
[  245.260666] LR [c000000000495608] change_protection+0xb38/0x1610
[  245.260673] Call Trace:
[  245.260675] [c000000039adf680] [c000000000495608] change_protection+0xb38/0x1610 (unreliable)
[  245.260684] [c000000039adf7f0] [c000000000496214] mprotect_fixup+0x134/0x3a0
[  245.260691] [c000000039adf8d0] [c0000000004967c0] do_mprotect_pkey+0x340/0x580
[  245.260699] [c000000039adfa20] [c000000000496a30] sys_mprotect+0x30/0x40
[  245.260706] [c000000039adfa40] [c00000000002d308] system_call_exception+0x178/0x320
[  245.260715] [c000000039adfe10] [c00000000000c170] system_call_vectored_common+0xf0/0x280
[  245.260725] --- interrupt: 3000 at 0x7fff90f5d698
[  245.260731] NIP:  00007fff90f5d698 LR: 0000000000000000 CTR: 0000000000000000
[  245.260734] REGS: c000000039adfe80 TRAP: 3000   Tainted: G        W         -------  ---   (6.1.0-0.rc1.15.fc38.ppc64le)
[  245.260737] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44244448  XER: 00000000
[  245.260758] IRQMASK: 0 
               GPR00: 000000000000007d 00007fffc4e69ec0 00007fff91066e00 00002ce2ebc90000 
               GPR04: 0000000000010000 0000000000000003 0000000000000000 0000000000000018 
               GPR08: 000000000000057b 0000000000000000 0000000000000000 0000000000000000 
               GPR12: 0000000000000000 00007fff9187c300 0000000000000000 0000000000000000 
               GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
               GPR20: 0000000155b45178 0000000156140ec8 0000000155c1e300 0000000000000000 
               GPR24: 0000000000000000 00007fffc4e6a080 00007fffc4e6a220 00007fffc4e69fc8 
               GPR28: 00002ce2ebc90000 0000000000000004 000000000001ffb7 0000000000100000 
[  245.260815] NIP [00007fff90f5d698] 0x7fff90f5d698
[  245.260818] LR [0000000000000000] 0x0
[  245.260821] --- interrupt: 3000
[  245.260823] Instruction dump:
[  245.260826] 3b180001 61290008 b1340020 4bfffc54 0fe00000 60000000 60000000 60420000 
[  245.260838] 0fe00000 60000000 60000000 60420000 <0fe00000> 60000000 60000000 60420000 
[  245.260850] ---[ end trace 0000000000000000 ]---
