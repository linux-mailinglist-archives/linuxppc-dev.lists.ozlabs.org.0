Return-Path: <linuxppc-dev+bounces-4545-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C95A19FEEFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Dec 2024 11:57:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YMqgW2mnhz2yV6;
	Tue, 31 Dec 2024 21:57:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.51 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735642663;
	cv=pass; b=JGrDwfSLzMggZvqnTju0G96FmmoOt3TiUYsxFM0ptUX2eZvXYVj/qWJkWwxhp+m6+rx/QzSjcBo6ZR49wxOf1z6nqpwaImDe0FMPsbcYjyTgiYiV9AJLaWcYeyjRCipl5EGP1HBwagAVEYrZSlqFNFYz6/GYcRca6PzKvSAWwkZsUK25mpDWl3I5iv3zI3lgvRjdD5kmhY9KbIZq70DFAjhlNJOmI0DjMI7ncUChx5VPKC8egcV/hlXzs3LuHQ6ZlJA4UUrfNbtDwe47LYJuVXWIfrAE3hqE4CrPpiFFMxq/fh+lDPfTxN3eBRUBjlLM5xKsqDiMjNCscz0pCJfHFw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735642663; c=relaxed/relaxed;
	bh=e2TiCoA7eJaGUxv2X5diaZ853ViVgcepiDe1Q/wZFFA=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ocZStSluajkR75z8jurG+Upnv76YgBxQrSiVl74AMvGzHDzRxV98jjA73Ulf/ZZOxahgki66THXy8jdiUT0fVQY2rq99SpLkUOQZz9YPWp54imWog8FMU6HiwvoWuHGxjiCWC3c0lIvXkMeECLUUJOiMy+bmIk8cQJW3sfpxbcOOD154L4nNpsUdPxSgTsvjkhsOKGtXe3k/lz1xnqoAQVfpp1ijam5fUliBGheZHxEQ0NIVLAO0B054RUUZpgtroPh1wYHDlqLbjvu4GJPN2LNNDXpTwLIY092ujVWC887LGQ2eJeAZPTETqaQSdxrh+wHksHAtPtlky3UVIPNX3g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WBKKlMDJ; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=d0ie64Lg; dkim-atps=neutral; spf=pass (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WBKKlMDJ;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=d0ie64Lg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YMqgQ48ZWz2xHl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Dec 2024 21:57:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1735642647; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=CQx/fdeC3neetaD0yV4C2VRlnuH/bwLWiE4kS6NkDxvIKJNm1IItl46yqUDFKpvOo5
    npX6vxMgu/yGvMVyiU/y5hDudI+9jgjPTQHC/iZN7hDZxrx7K0rj24i8mRmzA+lONOYT
    Eje/JxgcbrBhC/g0Fi2ccOf8IsN4byGmfLhzr0g7I70/fKIZizjEaFbfqNxTXDzLWnrQ
    hd2+GSV6nIhHVjm7mS8EhkeoZ8+9926XcnegTGoWvQVrk72YpaPUxV8/C+lJaH/jKQfy
    GPWgB9itJPJSnSAHmwCdVxQIESazCX04ODWVkt29afjyDhVtrkGS6TXWc45X9qK8JMIZ
    Q2Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1735642647;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=e2TiCoA7eJaGUxv2X5diaZ853ViVgcepiDe1Q/wZFFA=;
    b=V74hRAsYz6xDzUFYwPS+qWgetNhzKgDu+xPtWjxNITMWABMY0jE88OXYPNn8VqoUVh
    sk38HzSwW8wgvTJuGY2y3krv2t7reVFFaP7VZRpTqGsQvEs6ANuBWcmxtsbFU9UuRg1r
    dml/2iquz+IPzEjPm1nCatXw/IVf6wP6kMWkRmVcOHc+sbJLZNMDOpkv9iyeJwEGOvl5
    oBZ5kU7gPWaAgCYNCASB7yPA0njkE2QjFbrIblk1CIGf/7PVeaY/giYfO7unE02/k+OM
    RMNFZGqu4LNFr8AhDx3CAv2AfgSlfsIo0KLzs4k2FL3K/Ok/NYtH5RvMBeeieHAJ3Rq8
    U8hg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1735642647;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=e2TiCoA7eJaGUxv2X5diaZ853ViVgcepiDe1Q/wZFFA=;
    b=WBKKlMDJQNIA9H+yDoiod5yGr72N6LOMqWeHmcD8SHInC/iZY7EsBJPahs8MuQ4zqq
    CjnCn87hOZPzb2iSoSgDYmw6U/UwIh+QPfQ50JDn0JmMx7cdgwrqgta5RklL+Ct6y/5j
    k/7xN6+XQE7frIYT7tVBt3UxK8MCD8/Aww6nR/6tKDpkIZKnetThLjh++CZKIEokwWxP
    27AQ99Ae0KOtRuVt/Ibi76i0CL788EOO440UWsRs5r7qbswD9YuPFbD/ZPvDahHT2mgH
    FhlSMSlFPB9RrNKlaPK3llfKcWgEx/kCfeMmtI8wpcKBARzB/qjYFyXjjPfXHbwKPLx9
    GFag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1735642647;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=e2TiCoA7eJaGUxv2X5diaZ853ViVgcepiDe1Q/wZFFA=;
    b=d0ie64LgFvcJarmmwFJekk5YvG/KXQkyxbuk0qLgP0Sb5fzW3KOSJYdoKN7LdplfIU
    7SSi5rwd2Hjfk3a1byDA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EivHj9FnXlZguLZm8PSmufN+FD/uA=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id ebe9c90BVAvQKm6
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 31 Dec 2024 11:57:26 +0100 (CET)
Subject: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Darren Stevens <darren@stevens-zone.net>, Pat Wall <pjwall@mac.com>,
 Pat Wall <pjwall@me.com>, Christian Zigotzky <info@xenosoft.de>,
 madskateman@gmail.com, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 hypexed@yahoo.com.au, regressions@lists.linux.dev
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
 <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de>
 <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
 <0769459a-10ee-4573-a3ce-541c01429948@redhat.com>
 <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
 <CABgObfa6ei-=dSRaPgj7OP07Y4nKAbTt3cRgMSCGRHUmkguOdQ@mail.gmail.com>
 <7d8b5b78-b20c-d915-4a94-7082d7e01600@xenosoft.de>
 <f944fadf-2dfe-4dd3-a086-ae7bb6c0bff6@redhat.com>
 <31895b11-5084-95bc-0f14-faaea023b7f8@xenosoft.de>
 <2881940a-2da0-4498-b447-f09fffb14189@redhat.com>
 <50149f09-174f-ad6e-e97d-3d8889b412a6@xenosoft.de>
 <CABgObfYqGVQk0nvPZqzc1Q7K0jg-Gxk2tVmrk75R6TaLUt9exQ@mail.gmail.com>
 <10826e5f-d3a6-7792-4466-0bf21082a155@xenosoft.de>
 <CABgObfY-R+ASCGbhDNaQPBLRk4jHiOOvOrN9+e-ub3=-VzKEYw@mail.gmail.com>
 <4d291b7d-a65e-2ec9-146c-4063d14ef85f@xenosoft.de>
Message-ID: <bfb4f3bc-23f3-3a9a-195e-afd73ab675cd@xenosoft.de>
Date: Tue, 31 Dec 2024 11:57:26 +0100
X-Mailer: BrassMonkey/33.4.0
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
In-Reply-To: <4d291b7d-a65e-2ec9-146c-4063d14ef85f@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi All,

I have compiled the RC5 of kernel 6.13 [1] with the latest revert patch. [2]

After that, I successfully tested the following QEMU/KVM HV components.

- Guest performance: good
- Guest boot time: short
- KVM HV works (-enable-kvm)
- SMP works (-smp 4)
- QEMU User Networking (SLIRP) via VirtIO_net works (Tested it with SSH 
and with a web browser)
- QEMU USB Audio works (Tested it with some audio files in the guest system)
- VirtIO GPU works
- Virtual mouse and keyboard controller works (VirtIO input)
- 9p mount of a host folder via VirtIO works in the guest system
- Serial output from the guest works (console=ttyS0,115200)
- Shutdown and reboot works

The issue still exists but I hope Paolo's patch can fix the issue. [3]

Cheers,
Christian

[1] https://github.com/chzigotzky/kernels/releases/tag/v6.13.0-rc5
[2] 
https://github.com/chzigotzky/kernels/blob/main/patches/X5000/kvm_ppc_revert.patch
[3] https://github.com/chzigotzky/kernels/issues/4

-- 
Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)


