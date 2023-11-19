Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E1A7F09D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 00:15:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n3siCk9M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYRMR3LwVz3cW6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 10:15:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n3siCk9M;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYRLc2mgcz3c01
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 10:15:04 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SYRLc28L4z4xSn; Mon, 20 Nov 2023 10:15:04 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700435704;
	bh=+9qwELq36kIj19KdDI8c5ZWvL6w8UNzUq6Q0dgN0Cnc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n3siCk9MN09+StdLdZajiHpYDy7OTwYI2g7dK/Nti8cQB+U0yQ/X/Y8YMMozev+gU
	 G2cyinRCio2i23SBfu1WQYjFGtLGDx0KyIGViTEBkNl/QP+TiZBt1jNlKBxBqWznbS
	 Gkia3UKKeqkOZ0S0dwHV99BjnTPDiOGpUO4v3otHVO2xUBzYBs170DopjwkFUmHDHh
	 /nKATgsio1iLDP+ox82U0x/rreUp1kecq8y23Ym+Sn07RE6NfaC2geJrxKnNlmUEhW
	 tMpbuoqzEv9Ck/QbbBMpwGSm+Wbf0qiVuTo/OsBhI2CFxBIc3+IAU7Q1fw54FllDED
	 TG6LIrk4HZ+Ow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SYRLc1CjTz4xS0;
	Mon, 20 Nov 2023 10:15:03 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: matoro <matoro_mailinglist_kernel@matoro.tk>
Subject: Re: [PATCH v2] powernv/opal-prd: Silence memcpy() run-time false
 positive warnings
In-Reply-To: <422e5ac024b35573a9babb723b2f08e9@matoro.tk>
References: <168870663097.1448934.17365533203887616941.stgit@jupiter>
 <CACPK8XdP5keaUsP3cNY601P=uhDU_jj47rhies5QOojbU5ZSAw@mail.gmail.com>
 <87r0o4d1kp.fsf@mail.lhotse> <422e5ac024b35573a9babb723b2f08e9@matoro.tk>
Date: Mon, 20 Nov 2023 10:14:58 +1100
Message-ID: <87h6lh72tp.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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

matoro <matoro_mailinglist_kernel@matoro.tk> writes:
> On 2023-08-15 06:47, Michael Ellerman wrote:
>> Joel Stanley <joel@jms.id.au> writes:
>>> On Fri, 7 Jul 2023 at 05:11, Mahesh Salgaonkar <mahesh@linux.ibm.com> 
>>> wrote:
>>>> 
>>>> opal_prd_msg_notifier extracts the opal prd message size from the message
>>>> header and uses it for allocating opal_prd_msg_queue_item that includes
>>>> the correct message size to be copied. However, while running under
>>>> CONFIG_FORTIFY_SOURCE=y, it triggers following run-time warning:
>>>> 
>>>> [ 6458.234352] memcpy: detected field-spanning write (size 32) of single 
>>>> field "&item->msg" at arch/powerpc/platforms/powernv/opal-prd.c:355 (size 
>>>> 4)
>>>> [ 6458.234390] WARNING: CPU: 9 PID: 660 at 
>>>> arch/powerpc/platforms/powernv/opal-prd.c:355 
>>>> opal_prd_msg_notifier+0x174/0x188 [opal_prd]
>>>> [...]
>>>> [ 6458.234709] NIP [c00800000e0c0e6c] opal_prd_msg_notifier+0x174/0x188 
>>>> [opal_prd]
>>>> [ 6458.234723] LR [c00800000e0c0e68] opal_prd_msg_notifier+0x170/0x188 
>>>> [opal_prd]
>>>> [ 6458.234736] Call Trace:
>>>> [ 6458.234742] [c0000002acb23c10] [c00800000e0c0e68] 
>>>> opal_prd_msg_notifier+0x170/0x188 [opal_prd] (unreliable)
>>>> [ 6458.234759] [c0000002acb23ca0] [c00000000019ccc0] 
>>>> notifier_call_chain+0xc0/0x1b0
>>>> [ 6458.234774] [c0000002acb23d00] [c00000000019ceac] 
>>>> atomic_notifier_call_chain+0x2c/0x40
>>>> [ 6458.234788] [c0000002acb23d20] [c0000000000d69b4] 
>>>> opal_message_notify+0xf4/0x2c0
>>>> [...]
>>>> 
>>>> Split the copy to avoid false positive run-time warning.
>>>> 
>>>> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>> 
>>> I hit this on a box running the Ubuntu 6.2.0-27-generic kernel.
>>> 
>>> Do we plan on merging this fix?
>> 
>> I thought it was papering over the issue rather than fixing the root
>> cause.
>> 
>> I'll send a new version, as soon as I can work out how to trigger that
>> code path.
>> 
>> cheers
>
> Hi, I see this was still not accepted.  I was able to trigger this simply by 
> starting the opal-prd userspace daemon.
> Restarting the service does not re-trigger the warning, however.

It should be fixed by:

  https://git.kernel.org/torvalds/c/feea65a338e52297b68ceb688eaf0ffc50310a83

Which went into v6.6.

> [Wed Nov 15 14:01:06 2023] i2c_dev: i2c /dev entries driver
> [Wed Nov 15 14:01:07 2023] ------------[ cut here ]------------
> [Wed Nov 15 14:01:07 2023] memcpy: detected field-spanning write (size 32) of 
> single field "&item->msg" at arch/powerpc/platforms/powernv/opal-prd.c:355 
> (size 4)
> [Wed Nov 15 14:01:07 2023] WARNING: CPU: 5 PID: 379 at 
> arch/powerpc/platforms/powernv/opal-prd.c:355 0xc008000000640b1c
> [Wed Nov 15 14:01:07 2023] Modules linked in: i2c_dev loop vhost_net vhost 
> vhost_iotlb tap kvm_hv kvm bridge rpcsec_gss_krb5 auth_rpcgss tun nfsv4 
> dns_resolver nfs lockd grace sunrpc fscache netfs cfg80211 rfkill 8021q garp 
> mrp stp llc nft_masq nft_chain_nat nft_reject_inet nf_reject_ipv4 
> nf_reject_ipv6 nft_reject nft_ct binfmt_misc nbd wireguard 
> libcurve25519_generic ip6_udp_tunnel udp_tunnel nft_nat nf_tables nfnetlink 
> nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 at24 ast i2c_algo_bit 
> drm_shmem_helper joydev ftdi_sio crct10dif_vpmsum onboard_usb_hub ofpart 
> drm_kms_helper ipmi_powernv rtc_opal ipmi_devintf powernv_flash 
> ipmi_msghandler mtd opal_prd i2c_opal vmx_crypto nvme crc32c_vpmsum tg3 
> nvme_core ixgbe nvme_common mdio
> [Wed Nov 15 14:01:07 2023] CPU: 5 PID: 379 Comm: kopald Not tainted 
> 6.5.9-gentoo-dist #1

I'll request a back port of the fix to 6.5 stable.

cheers
