Return-Path: <linuxppc-dev+bounces-7285-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AF6A6C513
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 22:24:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZKFnq5n7lz2ySK;
	Sat, 22 Mar 2025 08:24:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742592271;
	cv=none; b=nHfxQ6rVv35hU8rRAij/bRQ2+YO2NdSRCETUo9JUwOp83eePN+SnxADqmBv9Eu7hFwrPLUr0+8/4s10PVwSj1WkIpHKtS3GWtdsiUhdJHTapxkZo0E1HRVbLz2cs7oMoCdYWRWYxgK+a0hwxcG0T9dzM5KcipxxKWzPgu3xDT6pmI8oWUm6UI86r4e6fjtirJwvtruy8sfXGGRolfG7uk6zDTdf3kxGgYgiS4ndoib0s5uYNoMLxIoSumQb4HFLYJ5r0JHKuOJriL4Qmy5FOa+4JBrSERyV+/Kk2o9jAglIpWaik3+BKXOgZdt7Znm3zlSmrys9wRiGa7x56X2H0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742592271; c=relaxed/relaxed;
	bh=IVnb8ZwPiwiyfmuh233CWz1oUTuFPqMcfBUsXXDRahk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cVaaoIds9F5VbTWF7BtcxeeLP7Jj4F2P/b8qYCI39GwDsSoz+C488rgOFcPpbPzFgWl9EcCNgGZCZfaLVUX7HV1swKHOe4MiRiuP0MCgZV3oXsmgdKT6rtMg8dX+WS09UDIN/vJ7LCJUIyFsOwbLcQQl+AqLbXISetS0epBBFzeblEmfNN9WDe8ZhpggUXYAos73IVWcfhhePlxMSp4uNkQ/UcPiimArRWb19TxP3EjCzdpDmm47IvSchZWcRS3OJ+axw480dgTbFhHUqGwyOhMmJGG3plKC+dcK7fX8jnZcp7fNmxwhza5rxLSwXwIgrvBZMNkojmzSgFi3Vb9Elg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; dkim=pass (2048-bit key; secure) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.a=rsa-sha256 header.s=s31663417 header.b=izICLJ8I; dkim-atps=neutral; spf=pass (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=quwenruo.btrfs@gmx.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.a=rsa-sha256 header.s=s31663417 header.b=izICLJ8I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.com (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=quwenruo.btrfs@gmx.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 313 seconds by postgrey-1.37 at boromir; Sat, 22 Mar 2025 08:24:28 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZKFnm5vcMz2yRx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 08:24:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1742592263; x=1743197063; i=quwenruo.btrfs@gmx.com;
	bh=IVnb8ZwPiwiyfmuh233CWz1oUTuFPqMcfBUsXXDRahk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=izICLJ8I8y93rVHKlBT29IgNlbEFLSg6V1GWDvv+pXjIt5/TefmjzxsImPCFzyjp
	 Ar/w0RFof0FKXz9/VKZ8FkPcXi56ehaqG4Ah/qEhzbO6hPDBGkofAiU/Y8bIYj7ad
	 SQpI4FsAb+sgo2ITc7VzjciXintn6HwWHdOg7rXrQGogcFjZGiBK4G9+PY4mhkyAj
	 CzO9OLKMl9Wi+QsV8ntZYEHUiKpqlAg3mSF5kBI1kEgGF+gcOq81Fgbti76FH4Cqn
	 eqgnqtfXJ1B+aNSLHZt3Gt9iN4Y5cNZdeuN0kTITYd+G49KlDqaLeKFZHLUQnHLC8
	 pcnnCDijgf7alQPcog==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.191] ([159.196.52.54]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1Mkpap-1tSDBU3OxT-00gN1B; Fri, 21
 Mar 2025 22:19:00 +0100
Message-ID: <d3be2a1b-71d9-425f-bb56-30d3fd890270@gmx.com>
Date: Sat, 22 Mar 2025 07:48:54 +1030
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next-20250320][btrfs] Kernel OOPs while running btrfs/108
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linux-btrfs@vger.kernel.org
References: <e4b1ccf8-c626-4683-82db-219354a27e61@linux.ibm.com>
 <87h63ms7gk.fsf@gmail.com>
Content-Language: en-US
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
In-Reply-To: <87h63ms7gk.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KrvDeZvtsqNSrCoAVASEESa18NJsdNZpjHKd+tDcWSKwywxBg2C
 NcmB3OBewOOoRlhThBmNteyR8R265tgfs68UYy0jmsq8BW1JC1+RXWzSGjjoYj6zL/8zA+Y
 SFV2lbTMQP969l8OoEVW3hTMyiKcrfHwWm5mPBmATsACRxO5Mp696UlMPmYVxwXhHgqfvLq
 wpxl+Ba4h1VMTfbK3VZ8A==
UI-OutboundReport: notjunk:1;M01:P0:B5CQzepJb5A=;/ZP+QML9ov+Jeyi0FM8tEOIUkxl
 eXoxskxgnNjLN2zWd+ORHF7c2dmoAxy/cpV3UKjafY7lLeRTNvxDj66Leqdbi7x6trEydSFU9
 gshEioOCZt+crZw0SkU5dFjAFT+Fe149UBP0z6W1JbmKAOCQMHbL6aHh7IvTXLPiJyDBOU44u
 fAMVjIys0+BZwnmGUc8PnqJ0fGCeq7LMNIi1xgPrVxaLWCy0NoKqDADULXD2R/q41yex4B7mC
 tMdgsMzHBnu1MG/B4aACtz20gv5JpSPMBeyur7B7+2Hx/xmBWnxwCAOtKA/db5XsYjhgs6k35
 K0kS7ELgqLqovcJA9O+mK2OZyIlgPVLOgSzqqwb7IKSlz3xziPeapcCvYNNwVXSL0lNj5lecA
 81lAhsnH6js8R0xx6XNMnhteU+l+J8cAS6xbbwX6OlwtnJcvVnjojuGVkEcKY6m4ED+TlNjXR
 RxNu97BW1+G2GX0nWBr2lZAc9vzC9b0/3MslMkV5g1IL7G6hG9QtaJ3BhMUfxrsiXUmQHE64s
 wMyImHG8iyxJ8om3fedt/UJcO9FM3KHnKEVrgMpz+SIvD6vRT2dVl6wFfUxNeXmsa6JiopToH
 a1WPBir5htFJMQh9opUm5PeZweEp6YB/XkN4ePoyOyXomGErF42+a8ZHoTQ0XcKrdRZw9lGD1
 8A4+qT+AQQDg6EZiUTQdTK1jUBgYmfFEICmHNQDCq9mmLx+xy3Nk4g07VX0I44ysRiwR76Yrm
 oX06bVU8/Ba2zhH/dm0cEdH78EcxkHqsX6T2aLfLGDN/y57r5GveyS7TZy7wiMCSSgexjZUur
 hgD/mBmEyuoWFBcyHXFZgh+ylMAxN3ri76DaNQuWQ+4WY2hJDXYq6gx2gE71D5jWRl2TkXJdU
 +2ujSFnklADB66k3eislgvR30z/+vGzas4UDEmqFQ46/GVGDe/RbSmG9+iOYo/4Ny0jWbtXPV
 2ZE4TwvYZBwYbJQp/usNkBo77aaVpBHVXBcovyufYtWeelR8sPuXXg1/bvkyQ/OhHHbMpSy73
 A20vAIeCnJC2JjH8h+LXTt0XSflbHJG2GuphNM1hpxvIn/CQCVIQM3eGKR/DntvJCMi7X/9Ie
 uWI4t8pJPHD/reuJYoNg16T6Z33QYVsNEeutfY7Wob3grxovdgsVv4bgyxf0rdv8+CfJ+qi+J
 NYSFGG6cBzO3GgWh76PiKgWlgZkJjJW0VSNhm/V2DtDmrijjjMyCVOq2lKvZqBNLGatxp8cf3
 dCakgDqo2IFc1IQ9rVMRKjf1qty2k6dI2OLhwhIVWHEOH1mNNsHcf6ZrmZYMyBG4Vwd3jv3Rg
 0E2ldAFt9E0fFl0gwqBZV+VTCBLCiRfuNxK/kPKpkNwX/Jmo7u3h81Eeg6trjTSSL0ydZbg44
 mxm39d75XkkfsApx7iL96CQYJ0ATDhUKpVFT/H8uexBUbW6p8uVohI1IPzQQyB9+zW8XBJ9lq
 K/m+GQZABVwLp6nikOm1dB07b/mKGCYwI91xOFZWn1k+vU5z9
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



=E5=9C=A8 2025/3/22 02:26, Ritesh Harjani (IBM) =E5=86=99=E9=81=93:
>
> +linux-btrfs
>
> Venkat Rao Bagalkote <venkat88@linux.ibm.com> writes:
>
>> Greetings!!!
>>
>>
>> I am observing Kernel oops while running brtfs/108 TC on IBM Power Syst=
em.
>>
>> Repo: Linux-Next (next-20250320)
>
> Looks like this next tag had many btrfs related changes -
> https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/=
log/fs/btrfs?h=3Dnext-20250320
>
>>
>> Traces:
>>
>> [=C2=A0 418.392604] run fstests btrfs/108 at 2025-03-21 05:11:21
>> [=C2=A0 418.560137] Kernel attempted to read user page (0) - exploit at=
tempt?
>> (uid: 0)
>> [=C2=A0 418.560156] BUG: Kernel NULL pointer dereference on read at 0x0=
0000000
>
> NULL pointer dereference...
>
>> [=C2=A0 418.560161] Faulting instruction address: 0xc0000000010ef8b0
>> [=C2=A0 418.560166] Oops: Kernel access of bad area, sig: 11 [#1]
>> [=C2=A0 418.560169] LE PAGE_SIZE=3D64K MMU=3DRadix=C2=A0 SMP NR_CPUS=3D=
8192 NUMA pSeries
>> [=C2=A0 418.560174] Modules linked in: btrfs blake2b_generic xor raid6_=
pq
>> zstd_compress loop nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
>> nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
>> nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 bonding nf_defrag_ipv4
>> tls rfkill ip_set nf_tables nfnetlink sunrpc pseries_rng vmx_crypto fus=
e
>> ext4 mbcache jbd2 sd_mod sg ibmvscsi scsi_transport_srp ibmveth
>> [=C2=A0 418.560212] CPU: 1 UID: 0 PID: 37583 Comm: rm Kdump: loaded Not
>> tainted 6.14.0-rc7-next-20250320 #1 VOLUNTARY
>> [=C2=A0 418.560218] Hardware name: IBM,9080-HEX Power11
>> [=C2=A0 418.560223] NIP:=C2=A0 c0000000010ef8b0 LR: c00800000bb190ac CT=
R:
>> c0000000010ef888
>> [=C2=A0 418.560227] REGS: c0000000a252f5a0 TRAP: 0300=C2=A0=C2=A0 Not t=
ainted
>> (6.14.0-rc7-next-20250320)
>> [=C2=A0 418.560232] MSR:=C2=A0 8000000000009033 <SF,EE,ME,IR,DR,RI,LE>=
=C2=A0 CR:
>> 44008444=C2=A0 XER: 20040000
>> [=C2=A0 418.560240] CFAR: c00800000bc1df84 DAR: 0000000000000000 DSISR:
>> 40000000 IRQMASK: 1
>> [=C2=A0 418.560240] GPR00: c00800000bb190ac c0000000a252f840 c000000001=
6a8100
>> 0000000000000000
>> [=C2=A0 418.560240] GPR04: 0000000000000000 0000000000010000 0000000000=
000000
>> fffffffffffe0000
>> [=C2=A0 418.560240] GPR08: c00000010724aad8 0000000000000003 0000000000=
001000
>> c00800000bc1df70
>> [=C2=A0 418.560240] GPR12: c0000000010ef888 c000000affffdb00 0000000000=
000000
>> 0000000000000000
>> [=C2=A0 418.560240] GPR16: 0000000000000000 0000000000000000 0000000000=
000000
>> 0000000000000000
>> [=C2=A0 418.560240] GPR20: c0000000777a8000 c00000006a9c9000 c000000107=
24a950
>> c0000000777a8000
>> [=C2=A0 418.560240] GPR24: fffffffffffffffe c00000010724aad8 0000000000=
010000
>> 00000000000000a0
>> [=C2=A0 418.560240] GPR28: 0000000000010000 c00c00000048c3c0 0000000000=
000000
>> 0000000000000000
>> [=C2=A0 418.560287] NIP [c0000000010ef8b0] _raw_spin_lock_irq+0x28/0x98
>> [=C2=A0 418.560294] LR [c00800000bb190ac] wait_subpage_spinlock+0x64/0x=
d0 [btrfs]
>
>
> btrfs is working on subpage size support for a while now.
> Adding +linux-btrfs, in case if they are already aware of this problem.
>
> I am not that familiar with btrfs code. But does this look like that the
> subpage (folio->private became NULL here) somehow?

The for-next branch seems to have some conflicts, IIRC the following two
commits are no longer in our tree anymore:

btrfs: kill EXTENT_FOLIO_PRIVATE
btrfs: add mapping_set_release_always to inode's mapping

I believe those two may be the cause.

Mind to test with the our current for-next branch? Where that's all of
our development happening, and I run daily subpage fstests on it to make
sure at least that branch is safe:

   https://github.com/btrfs/linux/tree/for-next

And appreciate if you can verify if the NULL pointer dereference is
still there on that branch.

Thanks,
Qu

>
> -ritesh
>
>> [=C2=A0 418.560339] Call Trace:
>> [=C2=A0 418.560342] [c0000000a252f870] [c00800000bb205dc]
>> btrfs_invalidate_folio+0xa8/0x4f0 [btrfs]
>> [=C2=A0 418.560384] [c0000000a252f930] [c0000000004cbcdc]
>> truncate_cleanup_folio+0x110/0x14c
>> [=C2=A0 418.560391] [c0000000a252f960] [c0000000004ccc7c]
>> truncate_inode_pages_range+0x100/0x4dc
>> [=C2=A0 418.560397] [c0000000a252fbd0] [c00800000bb20ba8]
>> btrfs_evict_inode+0x74/0x510 [btrfs]
>> [=C2=A0 418.560437] [c0000000a252fc90] [c00000000065c71c] evict+0x164/0=
x334
>> [=C2=A0 418.560443] [c0000000a252fd30] [c000000000647c9c] do_unlinkat+0=
x2f4/0x3a4
>> [=C2=A0 418.560449] [c0000000a252fde0] [c000000000647da0] sys_unlinkat+=
0x54/0xac
>> [=C2=A0 418.560454] [c0000000a252fe10] [c000000000033498]
>> system_call_exception+0x138/0x330
>> [=C2=A0 418.560461] [c0000000a252fe50] [c00000000000d05c]
>> system_call_vectored_common+0x15c/0x2ec
>> [=C2=A0 418.560468] --- interrupt: 3000 at 0x7fffb1b366bc
>> [=C2=A0 418.560471] NIP:=C2=A0 00007fffb1b366bc LR: 00007fffb1b366bc CT=
R:
>> 0000000000000000
>> [=C2=A0 418.560475] REGS: c0000000a252fe80 TRAP: 3000=C2=A0=C2=A0 Not t=
ainted
>> (6.14.0-rc7-next-20250320)
>> [=C2=A0 418.560479] MSR:=C2=A0 800000000280f033
>> <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>=C2=A0 CR: 44008804=C2=A0 XER: 0000=
0000
>> [=C2=A0 418.560490] IRQMASK: 0
>> [=C2=A0 418.560490] GPR00: 0000000000000124 00007ffffcb4e2b0 00007fffb1=
c37d00
>> ffffffffffffff9c
>> [=C2=A0 418.560490] GPR04: 000000013d660380 0000000000000000 0000000000=
000000
>> 0000000000000003
>> [=C2=A0 418.560490] GPR08: 0000000000000000 0000000000000000 0000000000=
000000
>> 0000000000000000
>> [=C2=A0 418.560490] GPR12: 0000000000000000 00007fffb1dba5c0 00007ffffc=
b4e538
>> 000000011972d0e8
>> [=C2=A0 418.560490] GPR16: 000000011972d098 000000011972d060 0000000119=
72d020
>> 000000011972cff0
>> [=C2=A0 418.560490] GPR20: 000000011972d298 000000011972cc10 0000000000=
000000
>> 000000013d6615a0
>> [=C2=A0 418.560490] GPR24: 0000000000000002 000000011972d0b8 0000000119=
72cf98
>> 000000011972d1d0
>> [=C2=A0 418.560490] GPR28: 00007ffffcb4e538 000000013d6602f0 0000000000=
000000
>> 0000000000100000
>> [=C2=A0 418.560532] NIP [00007fffb1b366bc] 0x7fffb1b366bc
>> [=C2=A0 418.560536] LR [00007fffb1b366bc] 0x7fffb1b366bc
>> [=C2=A0 418.560538] --- interrupt: 3000
>> [=C2=A0 418.560541] Code: 7c0803a6 4e800020 3c4c005c 38428878 7c0802a6
>> 60000000 39200001 992d0932 a12d0008 3ce0fffe 5529083c 61290001
>> <7d001829> 7d063879 40c20018 7d063838
>> [=C2=A0 418.560555] ---[ end trace 0000000000000000 ]---
>>
>>
>> If you happed to fix this, please add below tag.
>>
>>
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>
>>
>> Regards,
>>
>> Venkat.
>


