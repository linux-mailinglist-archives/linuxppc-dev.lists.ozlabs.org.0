Return-Path: <linuxppc-dev+bounces-4493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AB59FD54E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2024 15:50:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKT223dpBz2xMQ;
	Sat, 28 Dec 2024 01:50:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.52 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735311034;
	cv=pass; b=Jz1qItJFKYd7zlZvFZ4KrqBeNuIg7dORQ0RruXygt0Y4O1z1xZxKs2z/VqpVOJmjqo4zdoWIzhfNBiVdErxRkiP78iKxRiA2PS4OHCnTNyTWe0g77WXtPjfpOKTavCMfnU/ESrKbljQb9iklqAHylPLSgjziGjRa/zd1yiM6RctSMNh6cXdCSSnfMGG1VtKnjblk4h7nMKoEdqeh/dL8gq094SZLMt3y6pGrNQBTk5ENIZLGpfxZdHHCgwCNrKXSr6FeitJTPygo3a4SWfzz5Oxk5k28DJzK47Cmy3snothXYeTTgBhRVd3+IExYOvtjRmwBu4VpvbHjkXMlg2C4KQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735311034; c=relaxed/relaxed;
	bh=BjWYSJ6fvF4/SmUz8RmXgP90G+cmY6OavQUF53QjL08=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=RZzYXYBLZC7KxxwgnrVzNfdJuIYyVUyhrldB0M1WmbG8RxZEm/sEowETzruN34X3J11kPqEABGpNLm175T66FW8967K0CsXHsflq6nRU/TGL1Cm7mBr89UBi8Z3iNhbY4WxfI/XAPKcSQnPN7CAs7I1Q7kal2BiEflyjrL1dvxlZ0f+tpPWtcVH3iHKNfNZd+NFcpVHF5ZyenXsmSySTmRqL/tcDX+fajPrJSWAjBkcOv45anF75NNV6TZmALw3J3T0fPytcG3r7Z6HQYzHRl+/3X5xhIHgzWr80G6jQC1kPARe5iJG/IcewMTM8HMTdZuOg9AQy8svLyopJ4Y7nRQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AylfYbO6; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=dhV2yzcv; dkim-atps=neutral; spf=pass (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AylfYbO6;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=dhV2yzcv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKT1x2TTHz2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 01:50:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1735311017; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ia+ryY/EBTr1eSs4Jgvo0wg/acQGslg0yXSsTFzoD/uAKbkCUG/g50hW6jz0WwCqrJ
    hrxs31tOGrr1LsXreWjSRKcmsOUmCQU1qxuzikz0al5L+e0JpYoJ+ugJZfc8CTVfhdM4
    axZZNGkyrk91fp6pn4Kkp3QhS1c+9ddVSavxS3DKkGBYc/GXXl6O0Qttt4W0aRLWW6zJ
    /ADlDRnkbr1p3X6rLbZ7ASKiZQY8kchXj2C7aTodZM9QAzRdMcA4edzkUC6Rx1BLoBox
    LGWglioKJz1OkYKcQRAvKbLsqZEaE50uS56ctmIgSTaDn+lzknUsfhaIM1zrD7fsKxLE
    sdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1735311017;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=BjWYSJ6fvF4/SmUz8RmXgP90G+cmY6OavQUF53QjL08=;
    b=oGZRCCFKCDaaIF2MP9/Q5fLrPVv6SxImDgiYTOVLBiMZUnLN0ruwAu+AZVDYwMttFA
    xAizsfnao8J02u9AzUgAfvw8tjAPwbXICsCMU1xgUNTfk66Xtg/EFKiGNQJ9zbXqg5jb
    HZE2IhMuzrm8dVH89dGakJYF3oxJbHbCB045dyQVlYxIFVqYJasfcTH+dD9Nk+9AGiQP
    j6UYaCOHAkLEammn8yLz+EANlXAkEvdJSc66Ez7H4R0QTHD4kCtxzFmlnv3LQW2tDLVx
    N4FOKbaqcRTwdtoubrEtpaUfE6HR9s3QXwm6P4jZxgi1Pz7UzbJ2Jrvk+vAJj70WCVs2
    VBhg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1735311017;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=BjWYSJ6fvF4/SmUz8RmXgP90G+cmY6OavQUF53QjL08=;
    b=AylfYbO6xm3Yv4FE+fGsxr8QxwGOygb2M3xNwTp6IoJae1Z86sie5bL0bjM4GhL3u0
    xDv+ZIt5vPdPnc9L9Y+rdFAsm3tE69oGu4Z+5zzHkLRGm+P1qXqU8XJdVDTwBLmWsrGx
    sAQ61VMqhGGv6CWEogzxa9TbxiWOOb+k7AC6+0+TV9kiZuili0fPocVdLpmqqQSSBxr/
    ofhBAhwk0ta8nAcM/pSu2Vc/SCvER01zLKwWQ8ZH8bcTWM/P64zutBDwgR5J4oLuJVOR
    P2qexdZ+zeuFmnVIXkAonovc2mjPTmzMn7c1NM+5wvpULByfKbgLz/NUV4A+Nb18QeyV
    etBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1735311017;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=BjWYSJ6fvF4/SmUz8RmXgP90G+cmY6OavQUF53QjL08=;
    b=dhV2yzcvKU4sqGMM+s/eQ3WbKZq4AYOh7CUqZ75jKdN5s6KwiIXEP/0frCkht3Fdpy
    7gItKWjv3JMa6SSwAXCg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EivHj9FnXlZguLZm8PSmufN+FD/uA=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id ebe9c90BREoHFQ3
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 27 Dec 2024 15:50:17 +0100 (CET)
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
 <10826e5f-d3a6-7792-4466-0bf21082a155@xenosoft.de>
 <CABgObfY-R+ASCGbhDNaQPBLRk4jHiOOvOrN9+e-ub3=-VzKEYw@mail.gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <4d291b7d-a65e-2ec9-146c-4063d14ef85f@xenosoft.de>
Date: Fri, 27 Dec 2024 15:50:16 +0100
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
In-Reply-To: <CABgObfY-R+ASCGbhDNaQPBLRk4jHiOOvOrN9+e-ub3=-VzKEYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 27/12/24 06:20, Paolo Bonzini wrote:
> Please test the kvm-e500-bisection-rebase branch of 
> https://git.kernel.org/pub/scm/virt/kvm/kvm.git, which has the patch 
> applied already:
> - first test commit 0096d3855a5e80b9d4e43e5a291e8c79aa4abbc2, and report if it fails
>
> - then the entire branch, bisecting between 0096d3855a5e80b9d4e43e5a291e8c79aa4abbc2 and the top if it fails.
>
> Paolo
>

Hello Paolo,

git clone https://git.kernel.org/pub/scm/virt/kvm/kvm.git -b 
kvm-e500-bisection-rebase a

git checkout 0096d3855a5e80b9d4e43e5a291e8c79aa4abbc2

Output:

... HEAD is now at 0096d3855a5e KVM: PPC: e500: Use __kvm_faultin_pfn() 
to handle page faults

make -j8 CROSS_COMPILE=powerpc-linux-gnu- ARCH=powerpc oldconfig

make -j8 CROSS_COMPILE=powerpc-linux-gnu- ARCH=powerpc uImage

The host kernel and the guest kernel boots with "-enable-kvm" so KVM HV 
works.

Paolo wrote:

then the entire branch, bisecting between 
0096d3855a5e80b9d4e43e5a291e8c79aa4abbc2 and the top if it fails.

---

git log

commit 15ac24da3251e47fe3a63ea52d8c5ecb0b26b02c (HEAD -> 
kvm-e500-bisection-rebase, origin/kvm-e500-bisection-rebase)
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Wed Nov 13 12:39:45 2024 +0100

I tested the top additionally and the host and guest boot.

BTW, I also tested KVM PR on my P.A. Semi Nemo board yesterday. KVM PR 
isn’t affected. PA6T-1682M is a Book3S SoC with AltiVec support.

Thanks,
Christian

-- 
Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)


