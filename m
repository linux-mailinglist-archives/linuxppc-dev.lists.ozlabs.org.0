Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643A67ED62A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 22:41:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=matoro.tk header.i=@matoro.tk header.a=rsa-sha256 header.s=20230917 header.b=Yd71bm3F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVxRz20Fnz3dK0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 08:41:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=matoro.tk header.i=@matoro.tk header.a=rsa-sha256 header.s=20230917 header.b=Yd71bm3F;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVtR41gSKz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 06:25:04 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SVtQt0XLBz4xW7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 06:24:54 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SVtQt0F7Nz4xkb; Thu, 16 Nov 2023 06:24:54 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=matoro.tk header.i=@matoro.tk header.a=rsa-sha256 header.s=20230917 header.b=Yd71bm3F;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=matoro.tk (client-ip=2600:1700:4b10:9d80::2; helo=matoro.tk; envelope-from=matoro_mailinglist_kernel@matoro.tk; receiver=ozlabs.org)
X-Greylist: delayed 915 seconds by postgrey-1.37 at gandalf; Thu, 16 Nov 2023 06:24:51 AEDT
Received: from matoro.tk (unknown [IPv6:2600:1700:4b10:9d80::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SVtQq6zS0z4xW7
	for <linuxppc-dev@ozlabs.org>; Thu, 16 Nov 2023 06:24:51 +1100 (AEDT)
DKIM-Signature: a=rsa-sha256; bh=scTWPdh+Xr0dakDshO4hmH/K639BIG+hiSqTX1sEJE0=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20230917; t=1700075246; v=1; x=1700507246;
 b=Yd71bm3FwsAGTqyAhYBR5hrP4lkP/qIVi+6XJgKUSJhKYv44VA5Ig8PcmO0QgOs4wR3NgVSJ
 6nIQQ4/vDC9eVTguw+yTkV++AJsfy0pY+4bTUoew/oFQuxcLz2HR4f6jFvOim8XITLeEyXwZZye
 LZPjrevBaxPFiVyzt2BdEFFqNF8zdWmXU1xaZ9juHlBSUoxnrDHv30CD4uxnTGrlNFSzHIk/45v
 QuSF8Tygsn1gblTuepMDx3oQlJL55ert1BjWqwASlVLZuM43a72RSTFwA+bCZpd+Kt28wM6BjX2
 XfS165+sl51zjoS+JAqBAKnzKjsfwZ42YQ6rzV4zaQqJUHSBTNMV1COF8W9Cs4CVLZ4XEkBipcx
 IGA3Eit/mCExYL1HGzow0KVrV1judAcTMzFsuyhEOHS3tzE9bxZePA4VIqpN8udVGQP1SMgZ/Di
 2WVOdUR+a4/X0z9B2QeEjiESfrRQ2nUBzXpSat6wxCvUASXUE6tnRxrdJnsbUo3itTpzldE6YVO
 qso42+0MeswI9zboWQYnXrrJQFXiu8/3HW5l+lxbAoXIeMKJ+kiaHTtsBwlMtMuzrf3TThdM5Tu
 lsnID9LEOxXh5hfYeZ0tTeWu03Isfz5kSuDjTUhi4kUR8nwau8U0GG0K7THgBxlP3AC1l9j7iOL
 PSP1W+kbvO8=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id d5aa818a; Wed, 15 Nov
 2023 14:07:26 -0500
MIME-Version: 1.0
Date: Wed, 15 Nov 2023 14:07:26 -0500
From: matoro <matoro_mailinglist_kernel@matoro.tk>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powernv/opal-prd: Silence memcpy() run-time false
 positive warnings
In-Reply-To: <87r0o4d1kp.fsf@mail.lhotse>
References: <168870663097.1448934.17365533203887616941.stgit@jupiter>
 <CACPK8XdP5keaUsP3cNY601P=uhDU_jj47rhies5QOojbU5ZSAw@mail.gmail.com>
 <87r0o4d1kp.fsf@mail.lhotse>
Message-ID: <422e5ac024b35573a9babb723b2f08e9@matoro.tk>
X-Sender: matoro_mailinglist_kernel@matoro.tk
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 16 Nov 2023 08:39:29 +1100
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>, Joel Stanley <joel@jms.id.au>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-08-15 06:47, Michael Ellerman wrote:
> Joel Stanley <joel@jms.id.au> writes:
>> On Fri, 7 Jul 2023 at 05:11, Mahesh Salgaonkar <mahesh@linux.ibm.com> 
>> wrote:
>>> 
>>> opal_prd_msg_notifier extracts the opal prd message size from the message
>>> header and uses it for allocating opal_prd_msg_queue_item that includes
>>> the correct message size to be copied. However, while running under
>>> CONFIG_FORTIFY_SOURCE=y, it triggers following run-time warning:
>>> 
>>> [ 6458.234352] memcpy: detected field-spanning write (size 32) of single 
>>> field "&item->msg" at arch/powerpc/platforms/powernv/opal-prd.c:355 (size 
>>> 4)
>>> [ 6458.234390] WARNING: CPU: 9 PID: 660 at 
>>> arch/powerpc/platforms/powernv/opal-prd.c:355 
>>> opal_prd_msg_notifier+0x174/0x188 [opal_prd]
>>> [...]
>>> [ 6458.234709] NIP [c00800000e0c0e6c] opal_prd_msg_notifier+0x174/0x188 
>>> [opal_prd]
>>> [ 6458.234723] LR [c00800000e0c0e68] opal_prd_msg_notifier+0x170/0x188 
>>> [opal_prd]
>>> [ 6458.234736] Call Trace:
>>> [ 6458.234742] [c0000002acb23c10] [c00800000e0c0e68] 
>>> opal_prd_msg_notifier+0x170/0x188 [opal_prd] (unreliable)
>>> [ 6458.234759] [c0000002acb23ca0] [c00000000019ccc0] 
>>> notifier_call_chain+0xc0/0x1b0
>>> [ 6458.234774] [c0000002acb23d00] [c00000000019ceac] 
>>> atomic_notifier_call_chain+0x2c/0x40
>>> [ 6458.234788] [c0000002acb23d20] [c0000000000d69b4] 
>>> opal_message_notify+0xf4/0x2c0
>>> [...]
>>> 
>>> Split the copy to avoid false positive run-time warning.
>>> 
>>> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> 
>> I hit this on a box running the Ubuntu 6.2.0-27-generic kernel.
>> 
>> Do we plan on merging this fix?
> 
> I thought it was papering over the issue rather than fixing the root
> cause.
> 
> I'll send a new version, as soon as I can work out how to trigger that
> code path.
> 
> cheers

Hi, I see this was still not accepted.  I was able to trigger this simply by 
starting the opal-prd userspace daemon.
Restarting the service does not re-trigger the warning, however.

[Wed Nov 15 14:01:06 2023] i2c_dev: i2c /dev entries driver
[Wed Nov 15 14:01:07 2023] ------------[ cut here ]------------
[Wed Nov 15 14:01:07 2023] memcpy: detected field-spanning write (size 32) of 
single field "&item->msg" at arch/powerpc/platforms/powernv/opal-prd.c:355 
(size 4)
[Wed Nov 15 14:01:07 2023] WARNING: CPU: 5 PID: 379 at 
arch/powerpc/platforms/powernv/opal-prd.c:355 0xc008000000640b1c
[Wed Nov 15 14:01:07 2023] Modules linked in: i2c_dev loop vhost_net vhost 
vhost_iotlb tap kvm_hv kvm bridge rpcsec_gss_krb5 auth_rpcgss tun nfsv4 
dns_resolver nfs lockd grace sunrpc fscache netfs cfg80211 rfkill 8021q garp 
mrp stp llc nft_masq nft_chain_nat nft_reject_inet nf_reject_ipv4 
nf_reject_ipv6 nft_reject nft_ct binfmt_misc nbd wireguard 
libcurve25519_generic ip6_udp_tunnel udp_tunnel nft_nat nf_tables nfnetlink 
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 at24 ast i2c_algo_bit 
drm_shmem_helper joydev ftdi_sio crct10dif_vpmsum onboard_usb_hub ofpart 
drm_kms_helper ipmi_powernv rtc_opal ipmi_devintf powernv_flash 
ipmi_msghandler mtd opal_prd i2c_opal vmx_crypto nvme crc32c_vpmsum tg3 
nvme_core ixgbe nvme_common mdio
[Wed Nov 15 14:01:07 2023] CPU: 5 PID: 379 Comm: kopald Not tainted 
6.5.9-gentoo-dist #1
[Wed Nov 15 14:01:07 2023] Hardware name: T2P9S01 REV 1.01 POWER9 0x4e1203 
opal:skiboot-9858186 PowerNV
[Wed Nov 15 14:01:07 2023] NIP:  c008000000640b1c LR: c008000000640b18 CTR: 
0000000000000000
[Wed Nov 15 14:01:07 2023] REGS: c00000000e2339b0 TRAP: 0700   Not tainted  
(6.5.9-gentoo-dist)
[Wed Nov 15 14:01:07 2023] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 
44002222  XER: 00000000
[Wed Nov 15 14:01:07 2023] CFAR: c000000000152b10 IRQMASK: 1
                            GPR00: c008000000640b18 c00000000e233c50 
c008000000668100 0000000000000086
                            GPR04: 00000000ffff7fff c00000000e233a10 
c00000000e233a08 0000001ef74d0000
                            GPR08: 0000000000000027 c000001ef9626d10 
0000000000000001 0000000044002222
                            GPR12: 20646c6569662065 c000001fff7fb400 
c0000000001900e8 c00000000e919540
                            GPR16: 0000000000000000 0000000000000000 
0000000000000000 0000000000000000
                            GPR20: 0000000000000000 0000000000000000 
0000000000000000 0000000000000000
                            GPR24: c00000000e959de0 0000000000000006 
0000000000000000 c008000000660290
                            GPR28: c000000007498410 0000000000000020 
c00000000e959de8 c000000007498400
[Wed Nov 15 14:01:07 2023] NIP [c008000000640b1c] 0xc008000000640b1c
[Wed Nov 15 14:01:07 2023] LR [c008000000640b18] 0xc008000000640b18
[Wed Nov 15 14:01:07 2023] Call Trace:
[Wed Nov 15 14:01:07 2023] [c00000000e233c50] [c008000000640b18] 
0xc008000000640b18 (unreliable)
[Wed Nov 15 14:01:07 2023] [c00000000e233cd0] [c000000000192dd0] 
notifier_call_chain+0xc0/0x1b0
[Wed Nov 15 14:01:07 2023] [c00000000e233d30] [c000000000192eec] 
atomic_notifier_call_chain+0x2c/0x40
[Wed Nov 15 14:01:07 2023] [c00000000e233d50] [c0000000000cec44] 
opal_message_notify+0xf4/0x2a0
[Wed Nov 15 14:01:07 2023] [c00000000e233de0] [c000000000206d58] 
__handle_irq_event_percpu+0x78/0x240
[Wed Nov 15 14:01:07 2023] [c00000000e233e70] [c000000000207034] 
handle_irq_event+0x74/0x140
[Wed Nov 15 14:01:07 2023] [c00000000e233ea0] [c00000000020e9bc] 
handle_level_irq+0xdc/0x270
[Wed Nov 15 14:01:07 2023] [c00000000e233ed0] [c000000000204fb8] 
generic_handle_domain_irq+0x48/0x70
[Wed Nov 15 14:01:07 2023] [c00000000e233ef0] [c0000000000d6f38] 
opal_handle_events+0xb8/0x140
[Wed Nov 15 14:01:07 2023] [c00000000e233f50] [c0000000000ce514] 
kopald+0x84/0x110
[Wed Nov 15 14:01:07 2023] [c00000000e233f90] [c000000000190218] 
kthread+0x138/0x140
[Wed Nov 15 14:01:07 2023] [c00000000e233fe0] [c00000000000ded8] 
start_kernel_thread+0x14/0x18
[Wed Nov 15 14:01:07 2023] Code: 2c0a0000 4082ff48 3ca20000 e8a58050 3c620000 
e8638058 39400001 38c00004 7fa4eb78 99490000 480004c5 e8410018 <0fe00000> 
4bffff18 3860fff4 4bffff8c
[Wed Nov 15 14:01:07 2023] ---[ end trace 0000000000000000 ]---
