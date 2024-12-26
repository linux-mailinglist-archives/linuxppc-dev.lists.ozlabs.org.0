Return-Path: <linuxppc-dev+bounces-4483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D019FCB5F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2024 15:27:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YJrYN0nRXz2yGM;
	Fri, 27 Dec 2024 01:27:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.52 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735223224;
	cv=pass; b=nZ56GXzjyNbTG/T/9HqN1p+jHmrBU6/xzZs+deeb8uZTqbSuRlPbeS4Bu6aMLMj/NI7abMuUP+Gpb2QESLYv0i8h4GvYvk0+nyIGC+0hH/e5gbfGCe5lE0dyvZa/a7PYYnQjGeTwpTM24+d9QUdg9hN6HXaZYcgeB8U64SZnhBIjCSNpIV0gh5slNhNaaxif1emdeeX2yHT+s52m17Z2slPKc9mTFsJY1y4Ug0PfZj3+yxYZANwzWaziGXNuddSr5Zu1JeMf/cl3MDTtzFSLX6RDMcRtGYs6INQ8w5myhRuGg/Keo+feLw42xc3X0ZC8xlqCUV1vV+NVem2r+MkkkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735223224; c=relaxed/relaxed;
	bh=3VgK3myThIvIiqjtg3uv+l8MN6kZ/aVub4La46X66d0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=nSFGPwPLCal4J7hduVTUZMSAXOiBl19iGvsGroFpkENj9ylRf1fKUt4emBmf0H0xoZZPLvy55bu4dv7z61vQHAL6xkf3JG5cXR1iympbGubMwHgnYQJjUCXWkqb4OKIeamf7wIB3MuKtN4++JzhjFLD0J0sze+l0RFetdDVlyQMzRkf7FSZqfuVL9Z2XuydOih1h9ao/d2a/iAaSOty+WDh+m+ej7CTCra66CnanLV+8hdW2oKx4GsJ0yCGBLtUAr2nAGsQsyZp388l/VSCA4CyFrWg00mzPqHBoH20NFmks1UIPXBZqQp5iNbVxtjgrQN7QDmQVmYP0scM5+p3Nlg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=aFrLiE3T; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=KEAKNImO; dkim-atps=neutral; spf=pass (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=aFrLiE3T;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=KEAKNImO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YJrYH2n2Hz2xsd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2024 01:26:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1735223207; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jFZl+uoO22iXNoLnO2iM7BUzohCaaHN8CBdksmIpfGI8wHgffEvT8EAfda33oTQS+P
    z8f1zXhPfIo0NS78PAbpkRXnWjsUXlzhTUKUW9FL5FLGICjZp2+M5lTO4PCGsW7DBatl
    osP5Q6hJ5B6CAdvffbToO6pOaCbDwidGXuFwYMP9Z90tav5EQttJg/z89S5SegYNxO/v
    Kf61e821JB8v/Kqle0fzLeXcJ6PY8x1s6THPnBFPFA7jpkg4ZCWn/SRuoMgTmvRsFGlQ
    fR0VknsWvhDePMIsqnirP9FbL56ZpLdWIT1sRKXuB3Ju6MjjEG0VnCMmq9lUZiDedTUA
    taeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1735223207;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=3VgK3myThIvIiqjtg3uv+l8MN6kZ/aVub4La46X66d0=;
    b=LQxs5Ot/A9jX4BuMwWiB84ICmgVob5dpgAibpKTM+WvwihEJo62MFb02SDizz3EsBV
    /qbX0/ITo2+uZko6liNUzdQCUo99v4TspIl1PGhmsHwoPWo3buLZH2IU72ABpVmizTbG
    qhpKG71dcB6/yFzwH1vy8+jqrd5jdlMqvJEZ6j+PP1g2zAHTE+d+wYNZWPy0+6amwPKK
    4D1lTQZI6NCgBwR3vZURlHT8DWp7c2tqGNXGjnlYX3krS/uAfTtb0O4nAQwvfskY0XlS
    +/iPVnPcDROe5QbQGhR302liiuSZM7EmJX/lH0V97eRJj3pg8AkLt08h3EPL2duI5L8c
    JzXw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1735223207;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=3VgK3myThIvIiqjtg3uv+l8MN6kZ/aVub4La46X66d0=;
    b=aFrLiE3TZIyuqE9+SgxyTJ4CEVednk34jrLiwhJzF2zcatFL6m1vRRpR7d2WObT3qw
    hyfl/oPJayyf+beW13GDkmhqdIiiszIwwHS95Khjb8WED5PINXmc6AG6CFWwAxbdcG1C
    VXTSJwQPuWSkpj+yLjxog/A1T05YdG+f8QedLGc7k32JuHpU7KvJFTL9FT1d09rMNV3t
    6rzXzQiNhdFa4DOCDPUNZd8JFIHbIevlpKrO0MLRjYPs4eD/6pzJWWkL0PaGac605ROB
    W5HzgM5EhK+yrPjTZXvqBjYTuQxi4Vhp8L6IjNfvgK45YmqtL9KX+RSFPWiUnZgobsKX
    xr1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1735223207;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=3VgK3myThIvIiqjtg3uv+l8MN6kZ/aVub4La46X66d0=;
    b=KEAKNImOTSQNtzPMQ5xAGMyzAPAbyAw/8x8YJRlsj8VogIDjMJZIC85MJi4UP/munW
    GHAcOfrkG904NMtlt4Aw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EivHj9FnXlZguLZm8PSmufN+FD/uA=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id ebe9c90BQEQlE4n
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 26 Dec 2024 15:26:47 +0100 (CET)
Subject: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Darren Stevens <darren@stevens-zone.net>, Pat Wall <pjwall@mac.com>,
 Pat Wall <pjwall@me.com>, Christian Zigotzky <info@xenosoft.de>,
 madskateman@gmail.com, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 hypexed@yahoo.com.au, regressions@lists.linux.dev
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de>
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
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <10826e5f-d3a6-7792-4466-0bf21082a155@xenosoft.de>
Date: Thu, 26 Dec 2024 15:26:46 +0100
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
In-Reply-To: <CABgObfYqGVQk0nvPZqzc1Q7K0jg-Gxk2tVmrk75R6TaLUt9exQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 26/12/24 08:00, Paolo Bonzini wrote:
>
>
> Il mer 25 dic 2024, 13:48 Christian Zigotzky <chzigotzky@xenosoft.de 
> <mailto:chzigotzky@xenosoft.de>> ha scritto:
>
>     > But do you see anything on the host dmesg (without and with the
>     > patch), for example a WARN?
>     Unfortunately no log during the start of KVM HV.
>
>
> Ok.
>
>     > Also you might try edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4 + the
>     > patch, to see if there are two bugs.
>     >
>     > Paolo
>     >
>     I think you mean 419cfb983ca93e75e905794521afefcfa07988bb because
>     "git
>     checkout edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4" doesn't work.
>
>     Error message: fatal: reference is not a tree:
>     edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4
>
>     git checkout 419cfb983ca93e75e905794521afefcfa07988bb
>
>
> That's the upstream commit that doesn't boot. 
> edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4 was the rebased version of 
> the same commit, where your bisection finished.
>
> Paolo

Hi Paolo,

This has solved the issue:

cp linux-6.12.6/arch/powerpc/kvm/e500_mmu_host.c 
a/arch/powerpc/kvm/e500_mmu_host.c

cp linux-6.12.6/include/linux/kvm_host.h a/include/linux/kvm_host.h

cp linux-6.12.6/virt/kvm/kvm_main.c a/virt/kvm/kvm_main.c

cp linux-6.12.6/virt/kvm/kvm_mm.h a/virt/kvm/kvm_mm.h

I created a patch for reverting the code that leads to the issue.

Link: 
https://github.com/chzigotzky/kernels/blob/main/patches/X5000/kvm_ppc_revert.patch

Maybe you can find a hint to the issue in this revert patch.

I will further test KVM HV with the patched kernel.

Thanks,
Christian

-- 
Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)


