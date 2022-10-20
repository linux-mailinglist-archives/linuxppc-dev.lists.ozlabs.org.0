Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FB1605A1B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 10:42:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtLgs0gfGz3ds5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 19:42:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fkPvFVDH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtLfx21jPz3c2N
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 19:41:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fkPvFVDH;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MtLfv5YqNz4wgv;
	Thu, 20 Oct 2022 19:41:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1666255288;
	bh=tBIwOCVBZ6KCp4snR0COiccRleX3skO27QTXTrf2QjA=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=fkPvFVDHKhDU2NXOZufXv5fc/FOeCm0TLQpWBqdDD2aFa9xTamhU+aHSOCR2dSJNT
	 YERcJWmyoaD03RRCCdMIn76iU9vEA50NQ1NTEro//WaphtPF+HKJC4iBWQq+PqcEKC
	 1IPNxNv1iBYVkzqkFFt38mDNxDRrl0GhoA0CE+PExqvd6sDvQisOPHwH4gkOsj8jbn
	 aX35Aru1isuXabm/PVGlS90yNLble7w8u162FjPPYNavRc5Oo36/XirikiwhD1Sn+3
	 YoY47ufaPJlhZf4sVUnoc2TvfAWXV7fNKqSjTG9KfdIEo1whVElBV5XBiXXzcvMiG/
	 YFKrdsAdWQp1Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Dan =?utf-8?Q?Hor=C3=A1k?=
 <dan@danny.cz>,
 linuxppc-dev@lists.ozlabs.org, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>
Subject: Re: warning from change_protection in 6.1 rc1
In-Reply-To: <CNQKASDK7PBJ.22OVEMUZQZIQG@bobo>
References: <20221019122106.a525f33bafeb74de59fd0d99@danny.cz>
 <CNQKASDK7PBJ.22OVEMUZQZIQG@bobo>
Date: Thu, 20 Oct 2022 19:41:23 +1100
Message-ID: <87h6zylwek.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

"Nicholas Piggin" <npiggin@gmail.com> writes:
> On Wed Oct 19, 2022 at 8:21 PM AEST, Dan Hor=C3=A1k wrote:
>> Hi,
>>
>> in my first boot with the 6.1 rc1 kernel I have received a couple of
>> warnings from change_protection on Talos II P9 system, see the details
>> below. Nothing like that was noticed in 6.0 or earlier.
>
> Thanks for the report. This is a false positive in a warning I added
> because page_savedwrite overloads the _PAGE_PRIVILEGED bit. The warning
> should be harmless and the code will do the right thing (and it will
> flush). I think this should do it as a minimal fix.
>
> I don't really like that we use that bit for this, I think it should not
> cause a hardware access issue like with KUAP because there are no RWX
> permissions, but having something like pte_user suddenly return false on
> these seems a bit fragile. I'd rather use another bit for this,
> something like _PAGE_SAO. But that shouldn't be done for this release...

There is an RFC to remove the savedwrite stuff entirely:

  https://lore.kernel.org/all/20220926152618.194810-1-david@redhat.com/

cheers

> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc=
/include/asm/book3s/64/tlbflush.h
> index 67655cd60545..4b9eab0995ec 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> @@ -178,9 +178,19 @@ static inline bool __pte_flags_need_flush(unsigned l=
ong oldval,
>=20=20
>  	/*
>  	 * We do not expect kernel mappings or non-PTEs or not-present PTEs.
> +	 * pte_savedwrite does use _PAGE_PRIVILEGED for user mappings, so
> +	 * have to filter that out.
>  	 */
> -	VM_WARN_ON_ONCE(oldval & _PAGE_PRIVILEGED);
> -	VM_WARN_ON_ONCE(newval & _PAGE_PRIVILEGED);
> +	if (!IS_ENABLED(CONFIG_NUMA_BALANCING) ||
> +			((oldval & (_PAGE_PRESENT | _PAGE_PTE | _PAGE_RWX)) !=3D
> +			 (_PAGE_PRESENT | _PAGE_PTE)))
> +		VM_WARN_ON_ONCE(oldval & _PAGE_PRIVILEGED);
> +
> +	if (!IS_ENABLED(CONFIG_NUMA_BALANCING) ||
> +			((newval & (_PAGE_PRESENT | _PAGE_PTE | _PAGE_RWX)) !=3D
> +			 (_PAGE_PRESENT | _PAGE_PTE)))
> +		VM_WARN_ON_ONCE(newval & _PAGE_PRIVILEGED);
> +
>  	VM_WARN_ON_ONCE(!(oldval & _PAGE_PTE));
>  	VM_WARN_ON_ONCE(!(newval & _PAGE_PTE));
>  	VM_WARN_ON_ONCE(!(oldval & _PAGE_PRESENT));
>>
>>
>> 	Thanks,
>>
>> 		Dan
>>
>> [   79.229100] ------------[ cut here ]------------
>> [   79.229109] WARNING: CPU: 61 PID: 2987 at arch/powerpc/include/asm/bo=
ok3s/64/tlbflush.h:183 change_protection+0xfd0/0x1610
>> [   79.229125] Modules linked in: nft_reject_inet nf_reject_ipv4 nf_reje=
ct_ipv6 nft_reject nft_objref nf_conntrack_tftp nft_ct kvm_hv kvm nfsv3 nfs=
_acl rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc =
fscache netfs nf_tables ebtable_nat ebtable_broute ip6table_nat ip6table_ma=
ngle ip6table_raw ip6table_security iptable_nat nf_nat nf_conntrack nf_defr=
ag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security bridge s=
tp llc ip_set nfnetlink rfkill ebtable_filter ebtables ip6table_filter ipta=
ble_filter binfmt_misc dm_crypt xfs snd_hda_codec_realtek snd_hda_codec_gen=
eric ledtrig_audio snd_hda_codec_hdmi ftdi_sio onboard_usb_hub snd_hda_inte=
l snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep snd_seq snd_seq_dev=
ice snd_pcm snd_timer ses enclosure ofpart snd soundcore scsi_transport_sas=
 at24 ipmi_powernv ipmi_devintf powernv_flash regmap_i2c opal_prd crct10dif=
_vpmsum i2c_opal ipmi_msghandler mtd rtc_opal amdgpu raid1 drm_ttm_helper t=
tm mfd_core gpu_sc
>>  hed vmx_crypto
>> [   79.229258]  crc32c_vpmsum drm_buddy nvme drm_display_helper nvme_cor=
e tg3 nvme_common aacraid cec ip6_tables ip_tables i2c_dev fuse
>> [   79.229283] CPU: 61 PID: 2987 Comm: lightdm-gtk-gre Not tainted 6.1.0=
-0.rc1.15.fc38.ppc64le #1
>> [   79.229289] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skib=
oot-bc106a0 PowerNV
>> [   79.229291] NIP:  c000000000495aa0 LR: c000000000495608 CTR: 00000000=
00000000
>> [   79.229295] REGS: c00020001766f690 TRAP: 0700   Not tainted  (6.1.0-0=
.rc1.15.fc38.ppc64le)
>> [   79.229299] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 442=
42420  XER: 00000156
>> [   79.229316] CFAR: c00000000049562c IRQMASK: 0=20
>>                GPR00: c000000000495608 c00020001766f930 c000000001dd7100=
 c00020001e4e3700=20
>>                GPR04: 0000000154440000 c00020004eac3920 84030a73002000c0=
 88030a73002000c0=20
>>                GPR08: 0000000000000040 0000000000000001 0000000000000040=
 0000000000000009=20
>>                GPR12: c00020001795f708 c0002007be1a9700 c0002000554b0000=
 0000000154440000=20
>>                GPR16: c01fffffffff9f40 fffffffffffffe7f c000000002acdbb8=
 c000000002a3aef0=20
>>                GPR20: c00020001766fac8 ff7fffffffffefbf 0801000000000080=
 c00c00080013ab28=20
>>                GPR24: 0000000000000004 c00c00080013ab00 0000000154600000=
 00000001549b0000=20
>>                GPR28: 88030a73002000c0 c000200054354510 000000000000000d=
 c00020004eac3920=20
>> [   79.229377] NIP [c000000000495aa0] change_protection+0xfd0/0x1610
>> [   79.229384] LR [c000000000495608] change_protection+0xb38/0x1610
>> [   79.229390] Call Trace:
>> [   79.229392] [c00020001766f930] [c000000000495608] change_protection+0=
xb38/0x1610 (unreliable)
>> [   79.229401] [c00020001766faa0] [c0000000004eda5c] change_prot_numa+0x=
7c/0x120
>> [   79.229408] [c00020001766fb70] [c0000000001ad5dc] task_numa_work+0x2c=
c/0x500
>> [   79.229414] [c00020001766fc70] [c000000000185bb4] task_work_run+0xf4/=
0x180
>> [   79.229421] [c00020001766fcc0] [c0000000000218c4] do_notify_resume+0x=
434/0x470
>> [   79.229429] [c00020001766fd80] [c00000000002c29c] interrupt_exit_user=
_prepare_main+0x1dc/0x2c0
>> [   79.229437] [c00020001766fde0] [c00000000002c618] interrupt_exit_user=
_prepare+0x58/0xb0
>> [   79.229444] [c00020001766fe10] [c00000000000c8f4] interrupt_return_sr=
r_user+0x8/0x138
>> [   79.229452] --- interrupt: 900 at 0x7fffa62b7cfc
>> [   79.229458] NIP:  00007fffa62b7cfc LR: 00007fffa62b7c48 CTR: 00000000=
00000639
>> [   79.229461] REGS: c00020001766fe80 TRAP: 0900   Not tainted  (6.1.0-0=
.rc1.15.fc38.ppc64le)
>> [   79.229464] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,R=
I,LE>  CR: 88444424  XER: 00000156
>> [   79.229484] CFAR: 0000000000000000 IRQMASK: 0=20
>>                GPR00: 00007fffa62b7c28 00007fffc324a3e0 00007fffa63f7a00=
 00007ffe53000000=20
>>                GPR04: 00007ffe532d7800 00007fff594d9610 00007fff594d8e90=
 00000000000000b8=20
>>                GPR08: 00007ffe532d7d20 00007fff594d7d30 00000000000000b9=
 0000000000000000=20
>>                GPR12: 00007fffa611bfd0 00007fffa6e58d00 0000000000000008=
 00007fffa5d97480=20
>>                GPR16: 0000000154958000 000000000000000b 0000000000000020=
 0001000000000000=20
>>                GPR20: 000000000000027f 0000000154907000 00000001543e9100=
 0000000000000000=20
>>                GPR24: 0000000000000004 00000000000004b0 0000000000000780=
 0000000000001e00=20
>>                GPR28: 000000000000032c 0000000000001e00 00007fff594d7810=
 00000001548d71a0=20
>> [   79.229545] NIP [00007fffa62b7cfc] 0x7fffa62b7cfc
>> [   79.229548] LR [00007fffa62b7c48] 0x7fffa62b7c48
>> [   79.229551] --- interrupt: 900
>> [   79.229553] Instruction dump:
>> [   79.229555] 0fe00000 60000000 60000000 60420000 0fe00000 60000000 600=
00000 60420000=20
>> [   79.229568] 0fe00000 60000000 60000000 60420000 <0fe00000> 60000000 6=
0000000 60420000=20
>> [   79.229580] ---[ end trace 0000000000000000 ]---
>> [  245.260381] ------------[ cut here ]------------
>> [  245.260388] WARNING: CPU: 4 PID: 4468 at arch/powerpc/include/asm/boo=
k3s/64/tlbflush.h:182 change_protection+0xfc0/0x1610
>> [  245.260405] Modules linked in: nft_reject_inet nf_reject_ipv4 nf_reje=
ct_ipv6 nft_reject nft_objref nf_conntrack_tftp nft_ct kvm_hv kvm nfsv3 nfs=
_acl rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc =
fscache netfs nf_tables ebtable_nat ebtable_broute ip6table_nat ip6table_ma=
ngle ip6table_raw ip6table_security iptable_nat nf_nat nf_conntrack nf_defr=
ag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security bridge s=
tp llc ip_set nfnetlink rfkill ebtable_filter ebtables ip6table_filter ipta=
ble_filter binfmt_misc dm_crypt xfs snd_hda_codec_realtek snd_hda_codec_gen=
eric ledtrig_audio snd_hda_codec_hdmi ftdi_sio onboard_usb_hub snd_hda_inte=
l snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep snd_seq snd_seq_dev=
ice snd_pcm snd_timer ses enclosure ofpart snd soundcore scsi_transport_sas=
 at24 ipmi_powernv ipmi_devintf powernv_flash regmap_i2c opal_prd crct10dif=
_vpmsum i2c_opal ipmi_msghandler mtd rtc_opal amdgpu raid1 drm_ttm_helper t=
tm mfd_core gpu_sc
>>  hed vmx_crypto
>> [  245.260542]  crc32c_vpmsum drm_buddy nvme drm_display_helper nvme_cor=
e tg3 nvme_common aacraid cec ip6_tables ip_tables i2c_dev fuse
>> [  245.260565] CPU: 4 PID: 4468 Comm: WebExtensions Tainted: G        W =
        -------  ---  6.1.0-0.rc1.15.fc38.ppc64le #1
>> [  245.260571] Hardware name: T2P9D01 REV 1.00 POWER9 0x4e1202 opal:skib=
oot-bc106a0 PowerNV
>> [  245.260574] NIP:  c000000000495a90 LR: c000000000495608 CTR: 00000000=
00000000
>> [  245.260578] REGS: c000000039adf3e0 TRAP: 0700   Tainted: G        W  =
       -------  ---   (6.1.0-0.rc1.15.fc38.ppc64le)
>> [  245.260582] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 484=
22244  XER: 0000007d
>> [  245.260600] CFAR: c000000000495624 IRQMASK: 0=20
>>                GPR00: c000000000495608 c000000039adf680 c000000001dd7100=
 c00000002c576900=20
>>                GPR04: 00002ce2ebc90000 c000000091a2e148 8803c8a6000000c0=
 8603c8a6000000c0=20
>>                GPR08: 0000000000000040 0000000000000001 0000000000000040=
 0000000000000009=20
>>                GPR12: 0000000000000005 c0000007bfdeba00 c00000007195b9d8=
 00002ce2ebc90000=20
>>                GPR16: c01fffffffff9f40 fffffffffffffe7f c000000002acdbb8=
 c000000002a3aef0=20
>>                GPR20: c000000039adf938 ff7fffffffffefbf 0401000000000080=
 c00c0000002468a8=20
>>                GPR24: 0000000000000000 c00c000000246880 00002ce2ebca0000=
 00002ce2ebca0000=20
>>                GPR28: 8603c8a6000000c0 c000000091a18af0 0000000000000000=
 c000000091a2e148=20
>> [  245.260660] NIP [c000000000495a90] change_protection+0xfc0/0x1610
>> [  245.260666] LR [c000000000495608] change_protection+0xb38/0x1610
>> [  245.260673] Call Trace:
>> [  245.260675] [c000000039adf680] [c000000000495608] change_protection+0=
xb38/0x1610 (unreliable)
>> [  245.260684] [c000000039adf7f0] [c000000000496214] mprotect_fixup+0x13=
4/0x3a0
>> [  245.260691] [c000000039adf8d0] [c0000000004967c0] do_mprotect_pkey+0x=
340/0x580
>> [  245.260699] [c000000039adfa20] [c000000000496a30] sys_mprotect+0x30/0=
x40
>> [  245.260706] [c000000039adfa40] [c00000000002d308] system_call_excepti=
on+0x178/0x320
>> [  245.260715] [c000000039adfe10] [c00000000000c170] system_call_vectore=
d_common+0xf0/0x280
>> [  245.260725] --- interrupt: 3000 at 0x7fff90f5d698
>> [  245.260731] NIP:  00007fff90f5d698 LR: 0000000000000000 CTR: 00000000=
00000000
>> [  245.260734] REGS: c000000039adfe80 TRAP: 3000   Tainted: G        W  =
       -------  ---   (6.1.0-0.rc1.15.fc38.ppc64le)
>> [  245.260737] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,R=
I,LE>  CR: 44244448  XER: 00000000
>> [  245.260758] IRQMASK: 0=20
>>                GPR00: 000000000000007d 00007fffc4e69ec0 00007fff91066e00=
 00002ce2ebc90000=20
>>                GPR04: 0000000000010000 0000000000000003 0000000000000000=
 0000000000000018=20
>>                GPR08: 000000000000057b 0000000000000000 0000000000000000=
 0000000000000000=20
>>                GPR12: 0000000000000000 00007fff9187c300 0000000000000000=
 0000000000000000=20
>>                GPR16: 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000=20
>>                GPR20: 0000000155b45178 0000000156140ec8 0000000155c1e300=
 0000000000000000=20
>>                GPR24: 0000000000000000 00007fffc4e6a080 00007fffc4e6a220=
 00007fffc4e69fc8=20
>>                GPR28: 00002ce2ebc90000 0000000000000004 000000000001ffb7=
 0000000000100000=20
>> [  245.260815] NIP [00007fff90f5d698] 0x7fff90f5d698
>> [  245.260818] LR [0000000000000000] 0x0
>> [  245.260821] --- interrupt: 3000
>> [  245.260823] Instruction dump:
>> [  245.260826] 3b180001 61290008 b1340020 4bfffc54 0fe00000 60000000 600=
00000 60420000=20
>> [  245.260838] 0fe00000 60000000 60000000 60420000 <0fe00000> 60000000 6=
0000000 60420000=20
>> [  245.260850] ---[ end trace 0000000000000000 ]---
