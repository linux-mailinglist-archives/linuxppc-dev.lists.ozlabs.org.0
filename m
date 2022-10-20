Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC8B605807
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 09:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtJj64KK6z3dyX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 18:13:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dSrl/+mH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dSrl/+mH;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtJgq3S2vz3drf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 18:12:06 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id 67so19453336pfz.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 00:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZzZp76b+gHLTxeFfgL1H5RPoO5NQ4LmOfhPzFXsByI=;
        b=dSrl/+mH8ukCQSCdKJQplTwvqHO/l7TRrvLlsQv2OfQUv34jckf383xP4AWY2GAgg4
         9urlXfQM8vOzJ8AYzD4HucNFM+Mi9eUptPl7DZoUgQNia7N1t+ZuQiohfSfOUXBanFiX
         Xx6guOAyGWaoPaS1FtXOtKAPzDXAEuuoDV4Ig4eL5Q9x95riEi6CScDqsWdZOQv5BrCg
         nTRMJBJwuF1QnD9EqckkAbNXPTD8kqEcZM2eXBHB8nKkYAQl7QuulGfZMf+MicmzCxWT
         WVP1ycLEf4fz3WEi4ICDHVnDOaibmNdE0m8ibvf3/EReFwzI9taWnHzHoUKcHFdof9zp
         tQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mZzZp76b+gHLTxeFfgL1H5RPoO5NQ4LmOfhPzFXsByI=;
        b=2qeclfAlJYdvF1A6bI4nQLL+znJa2kApJBwD2ZSZfoReM8sj1czWTJsT1fYPulZV0W
         Xjp7vZTqHTO8aKsk0Ct9I1QFdOeq5L46LCPcKMX3rToHQuVawWkr6Cmp7YVTa5XzJL6K
         +cIaX8ETf6YwrzFEsLQOf1n9ZNoKFsbAQR7z7t+dauchjdJLSex3NwRFDgEmQgpezcJ+
         vTru3HNbBg3AzfP679TIFFUlf8/Zr3S11Eefi86UFI5BEo81guthyXVDKfa8VkruXlH+
         xQR5vf8s1V/n9zPh69JX8y6gft+gUJRYc2DJ+2d6NxeAOVCVoI8Q88vS7ftNA8rkrcxR
         diAA==
X-Gm-Message-State: ACrzQf1599opo6B1TCdgcF5sn8oLPCmKVrzgaowVdIBQ3irHSng5OKwE
	/2WDeLYavEb4YKoM7qKl1hJDO3HYr3U=
X-Google-Smtp-Source: AMsMyM4RfdNUGefuGRVYC2YKjSncrGwqgSbrrvOwT6abGERGlVyiRLIGXPiLvXC2K3jXHsAwIcxX/g==
X-Received: by 2002:a63:c5d:0:b0:460:17cc:73a6 with SMTP id 29-20020a630c5d000000b0046017cc73a6mr10567193pgm.332.1666249921625;
        Thu, 20 Oct 2022 00:12:01 -0700 (PDT)
Received: from localhost ([203.220.177.94])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902e5c500b001866049ddb1sm710381plf.161.2022.10.20.00.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 00:12:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Oct 2022 17:11:56 +1000
Message-Id: <CNQKASDK7PBJ.22OVEMUZQZIQG@bobo>
Subject: Re: warning from change_protection in 6.1 rc1
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Dan_Hor=C3=A1k?= <dan@danny.cz>,
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20221019122106.a525f33bafeb74de59fd0d99@danny.cz>
In-Reply-To: <20221019122106.a525f33bafeb74de59fd0d99@danny.cz>
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

On Wed Oct 19, 2022 at 8:21 PM AEST, Dan Hor=C3=A1k wrote:
> Hi,
>
> in my first boot with the 6.1 rc1 kernel I have received a couple of
> warnings from change_protection on Talos II P9 system, see the details
> below. Nothing like that was noticed in 6.0 or earlier.

Thanks for the report. This is a false positive in a warning I added
because page_savedwrite overloads the _PAGE_PRIVILEGED bit. The warning
should be harmless and the code will do the right thing (and it will
flush). I think this should do it as a minimal fix.

I don't really like that we use that bit for this, I think it should not
cause a hardware access issue like with KUAP because there are no RWX
permissions, but having something like pte_user suddenly return false on
these seems a bit fragile. I'd rather use another bit for this,
something like _PAGE_SAO. But that shouldn't be done for this release...

Thanks,
Nick


diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/i=
nclude/asm/book3s/64/tlbflush.h
index 67655cd60545..4b9eab0995ec 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -178,9 +178,19 @@ static inline bool __pte_flags_need_flush(unsigned lon=
g oldval,
=20
 	/*
 	 * We do not expect kernel mappings or non-PTEs or not-present PTEs.
+	 * pte_savedwrite does use _PAGE_PRIVILEGED for user mappings, so
+	 * have to filter that out.
 	 */
-	VM_WARN_ON_ONCE(oldval & _PAGE_PRIVILEGED);
-	VM_WARN_ON_ONCE(newval & _PAGE_PRIVILEGED);
+	if (!IS_ENABLED(CONFIG_NUMA_BALANCING) ||
+			((oldval & (_PAGE_PRESENT | _PAGE_PTE | _PAGE_RWX)) !=3D
+			 (_PAGE_PRESENT | _PAGE_PTE)))
+		VM_WARN_ON_ONCE(oldval & _PAGE_PRIVILEGED);
+
+	if (!IS_ENABLED(CONFIG_NUMA_BALANCING) ||
+			((newval & (_PAGE_PRESENT | _PAGE_PTE | _PAGE_RWX)) !=3D
+			 (_PAGE_PRESENT | _PAGE_PTE)))
+		VM_WARN_ON_ONCE(newval & _PAGE_PRIVILEGED);
+
 	VM_WARN_ON_ONCE(!(oldval & _PAGE_PTE));
 	VM_WARN_ON_ONCE(!(newval & _PAGE_PTE));
 	VM_WARN_ON_ONCE(!(oldval & _PAGE_PRESENT));
>
>
> 	Thanks,
>
> 		Dan
>
> [   79.229100] ------------[ cut here ]------------
> [   79.229109] WARNING: CPU: 61 PID: 2987 at arch/powerpc/include/asm/boo=
k3s/64/tlbflush.h:183 change_protection+0xfd0/0x1610
> [   79.229125] Modules linked in: nft_reject_inet nf_reject_ipv4 nf_rejec=
t_ipv6 nft_reject nft_objref nf_conntrack_tftp nft_ct kvm_hv kvm nfsv3 nfs_=
acl rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc f=
scache netfs nf_tables ebtable_nat ebtable_broute ip6table_nat ip6table_man=
gle ip6table_raw ip6table_security iptable_nat nf_nat nf_conntrack nf_defra=
g_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security bridge st=
p llc ip_set nfnetlink rfkill ebtable_filter ebtables ip6table_filter iptab=
le_filter binfmt_misc dm_crypt xfs snd_hda_codec_realtek snd_hda_codec_gene=
ric ledtrig_audio snd_hda_codec_hdmi ftdi_sio onboard_usb_hub snd_hda_intel=
 snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep snd_seq snd_seq_devi=
ce snd_pcm snd_timer ses enclosure ofpart snd soundcore scsi_transport_sas =
at24 ipmi_powernv ipmi_devintf powernv_flash regmap_i2c opal_prd crct10dif_=
vpmsum i2c_opal ipmi_msghandler mtd rtc_opal amdgpu raid1 drm_ttm_helper tt=
m mfd_core gpu_sc
>  hed vmx_crypto
> [   79.229258]  crc32c_vpmsum drm_buddy nvme drm_display_helper nvme_core=
 tg3 nvme_common aacraid cec ip6_tables ip_tables i2c_dev fuse
> [   79.229283] CPU: 61 PID: 2987 Comm: lightdm-gtk-gre Not tainted 6.1.0-=
0.rc1.15.fc38.ppc64le #1
> [   79.229289] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skibo=
ot-bc106a0 PowerNV
> [   79.229291] NIP:  c000000000495aa0 LR: c000000000495608 CTR: 000000000=
0000000
> [   79.229295] REGS: c00020001766f690 TRAP: 0700   Not tainted  (6.1.0-0.=
rc1.15.fc38.ppc64le)
> [   79.229299] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 4424=
2420  XER: 00000156
> [   79.229316] CFAR: c00000000049562c IRQMASK: 0=20
>                GPR00: c000000000495608 c00020001766f930 c000000001dd7100 =
c00020001e4e3700=20
>                GPR04: 0000000154440000 c00020004eac3920 84030a73002000c0 =
88030a73002000c0=20
>                GPR08: 0000000000000040 0000000000000001 0000000000000040 =
0000000000000009=20
>                GPR12: c00020001795f708 c0002007be1a9700 c0002000554b0000 =
0000000154440000=20
>                GPR16: c01fffffffff9f40 fffffffffffffe7f c000000002acdbb8 =
c000000002a3aef0=20
>                GPR20: c00020001766fac8 ff7fffffffffefbf 0801000000000080 =
c00c00080013ab28=20
>                GPR24: 0000000000000004 c00c00080013ab00 0000000154600000 =
00000001549b0000=20
>                GPR28: 88030a73002000c0 c000200054354510 000000000000000d =
c00020004eac3920=20
> [   79.229377] NIP [c000000000495aa0] change_protection+0xfd0/0x1610
> [   79.229384] LR [c000000000495608] change_protection+0xb38/0x1610
> [   79.229390] Call Trace:
> [   79.229392] [c00020001766f930] [c000000000495608] change_protection+0x=
b38/0x1610 (unreliable)
> [   79.229401] [c00020001766faa0] [c0000000004eda5c] change_prot_numa+0x7=
c/0x120
> [   79.229408] [c00020001766fb70] [c0000000001ad5dc] task_numa_work+0x2cc=
/0x500
> [   79.229414] [c00020001766fc70] [c000000000185bb4] task_work_run+0xf4/0=
x180
> [   79.229421] [c00020001766fcc0] [c0000000000218c4] do_notify_resume+0x4=
34/0x470
> [   79.229429] [c00020001766fd80] [c00000000002c29c] interrupt_exit_user_=
prepare_main+0x1dc/0x2c0
> [   79.229437] [c00020001766fde0] [c00000000002c618] interrupt_exit_user_=
prepare+0x58/0xb0
> [   79.229444] [c00020001766fe10] [c00000000000c8f4] interrupt_return_srr=
_user+0x8/0x138
> [   79.229452] --- interrupt: 900 at 0x7fffa62b7cfc
> [   79.229458] NIP:  00007fffa62b7cfc LR: 00007fffa62b7c48 CTR: 000000000=
0000639
> [   79.229461] REGS: c00020001766fe80 TRAP: 0900   Not tainted  (6.1.0-0.=
rc1.15.fc38.ppc64le)
> [   79.229464] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI=
,LE>  CR: 88444424  XER: 00000156
> [   79.229484] CFAR: 0000000000000000 IRQMASK: 0=20
>                GPR00: 00007fffa62b7c28 00007fffc324a3e0 00007fffa63f7a00 =
00007ffe53000000=20
>                GPR04: 00007ffe532d7800 00007fff594d9610 00007fff594d8e90 =
00000000000000b8=20
>                GPR08: 00007ffe532d7d20 00007fff594d7d30 00000000000000b9 =
0000000000000000=20
>                GPR12: 00007fffa611bfd0 00007fffa6e58d00 0000000000000008 =
00007fffa5d97480=20
>                GPR16: 0000000154958000 000000000000000b 0000000000000020 =
0001000000000000=20
>                GPR20: 000000000000027f 0000000154907000 00000001543e9100 =
0000000000000000=20
>                GPR24: 0000000000000004 00000000000004b0 0000000000000780 =
0000000000001e00=20
>                GPR28: 000000000000032c 0000000000001e00 00007fff594d7810 =
00000001548d71a0=20
> [   79.229545] NIP [00007fffa62b7cfc] 0x7fffa62b7cfc
> [   79.229548] LR [00007fffa62b7c48] 0x7fffa62b7c48
> [   79.229551] --- interrupt: 900
> [   79.229553] Instruction dump:
> [   79.229555] 0fe00000 60000000 60000000 60420000 0fe00000 60000000 6000=
0000 60420000=20
> [   79.229568] 0fe00000 60000000 60000000 60420000 <0fe00000> 60000000 60=
000000 60420000=20
> [   79.229580] ---[ end trace 0000000000000000 ]---
> [  245.260381] ------------[ cut here ]------------
> [  245.260388] WARNING: CPU: 4 PID: 4468 at arch/powerpc/include/asm/book=
3s/64/tlbflush.h:182 change_protection+0xfc0/0x1610
> [  245.260405] Modules linked in: nft_reject_inet nf_reject_ipv4 nf_rejec=
t_ipv6 nft_reject nft_objref nf_conntrack_tftp nft_ct kvm_hv kvm nfsv3 nfs_=
acl rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc f=
scache netfs nf_tables ebtable_nat ebtable_broute ip6table_nat ip6table_man=
gle ip6table_raw ip6table_security iptable_nat nf_nat nf_conntrack nf_defra=
g_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security bridge st=
p llc ip_set nfnetlink rfkill ebtable_filter ebtables ip6table_filter iptab=
le_filter binfmt_misc dm_crypt xfs snd_hda_codec_realtek snd_hda_codec_gene=
ric ledtrig_audio snd_hda_codec_hdmi ftdi_sio onboard_usb_hub snd_hda_intel=
 snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep snd_seq snd_seq_devi=
ce snd_pcm snd_timer ses enclosure ofpart snd soundcore scsi_transport_sas =
at24 ipmi_powernv ipmi_devintf powernv_flash regmap_i2c opal_prd crct10dif_=
vpmsum i2c_opal ipmi_msghandler mtd rtc_opal amdgpu raid1 drm_ttm_helper tt=
m mfd_core gpu_sc
>  hed vmx_crypto
> [  245.260542]  crc32c_vpmsum drm_buddy nvme drm_display_helper nvme_core=
 tg3 nvme_common aacraid cec ip6_tables ip_tables i2c_dev fuse
> [  245.260565] CPU: 4 PID: 4468 Comm: WebExtensions Tainted: G        W  =
       -------  ---  6.1.0-0.rc1.15.fc38.ppc64le #1
> [  245.260571] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skibo=
ot-bc106a0 PowerNV
> [  245.260574] NIP:  c000000000495a90 LR: c000000000495608 CTR: 000000000=
0000000
> [  245.260578] REGS: c000000039adf3e0 TRAP: 0700   Tainted: G        W   =
      -------  ---   (6.1.0-0.rc1.15.fc38.ppc64le)
> [  245.260582] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 4842=
2244  XER: 0000007d
> [  245.260600] CFAR: c000000000495624 IRQMASK: 0=20
>                GPR00: c000000000495608 c000000039adf680 c000000001dd7100 =
c00000002c576900=20
>                GPR04: 00002ce2ebc90000 c000000091a2e148 8803c8a6000000c0 =
8603c8a6000000c0=20
>                GPR08: 0000000000000040 0000000000000001 0000000000000040 =
0000000000000009=20
>                GPR12: 0000000000000005 c0000007bfdeba00 c00000007195b9d8 =
00002ce2ebc90000=20
>                GPR16: c01fffffffff9f40 fffffffffffffe7f c000000002acdbb8 =
c000000002a3aef0=20
>                GPR20: c000000039adf938 ff7fffffffffefbf 0401000000000080 =
c00c0000002468a8=20
>                GPR24: 0000000000000000 c00c000000246880 00002ce2ebca0000 =
00002ce2ebca0000=20
>                GPR28: 8603c8a6000000c0 c000000091a18af0 0000000000000000 =
c000000091a2e148=20
> [  245.260660] NIP [c000000000495a90] change_protection+0xfc0/0x1610
> [  245.260666] LR [c000000000495608] change_protection+0xb38/0x1610
> [  245.260673] Call Trace:
> [  245.260675] [c000000039adf680] [c000000000495608] change_protection+0x=
b38/0x1610 (unreliable)
> [  245.260684] [c000000039adf7f0] [c000000000496214] mprotect_fixup+0x134=
/0x3a0
> [  245.260691] [c000000039adf8d0] [c0000000004967c0] do_mprotect_pkey+0x3=
40/0x580
> [  245.260699] [c000000039adfa20] [c000000000496a30] sys_mprotect+0x30/0x=
40
> [  245.260706] [c000000039adfa40] [c00000000002d308] system_call_exceptio=
n+0x178/0x320
> [  245.260715] [c000000039adfe10] [c00000000000c170] system_call_vectored=
_common+0xf0/0x280
> [  245.260725] --- interrupt: 3000 at 0x7fff90f5d698
> [  245.260731] NIP:  00007fff90f5d698 LR: 0000000000000000 CTR: 000000000=
0000000
> [  245.260734] REGS: c000000039adfe80 TRAP: 3000   Tainted: G        W   =
      -------  ---   (6.1.0-0.rc1.15.fc38.ppc64le)
> [  245.260737] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI=
,LE>  CR: 44244448  XER: 00000000
> [  245.260758] IRQMASK: 0=20
>                GPR00: 000000000000007d 00007fffc4e69ec0 00007fff91066e00 =
00002ce2ebc90000=20
>                GPR04: 0000000000010000 0000000000000003 0000000000000000 =
0000000000000018=20
>                GPR08: 000000000000057b 0000000000000000 0000000000000000 =
0000000000000000=20
>                GPR12: 0000000000000000 00007fff9187c300 0000000000000000 =
0000000000000000=20
>                GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
>                GPR20: 0000000155b45178 0000000156140ec8 0000000155c1e300 =
0000000000000000=20
>                GPR24: 0000000000000000 00007fffc4e6a080 00007fffc4e6a220 =
00007fffc4e69fc8=20
>                GPR28: 00002ce2ebc90000 0000000000000004 000000000001ffb7 =
0000000000100000=20
> [  245.260815] NIP [00007fff90f5d698] 0x7fff90f5d698
> [  245.260818] LR [0000000000000000] 0x0
> [  245.260821] --- interrupt: 3000
> [  245.260823] Instruction dump:
> [  245.260826] 3b180001 61290008 b1340020 4bfffc54 0fe00000 60000000 6000=
0000 60420000=20
> [  245.260838] 0fe00000 60000000 60000000 60420000 <0fe00000> 60000000 60=
000000 60420000=20
> [  245.260850] ---[ end trace 0000000000000000 ]---

