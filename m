Return-Path: <linuxppc-dev+bounces-4558-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D81D79FF429
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2025 14:30:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNW1G1qJfz2yNc;
	Thu,  2 Jan 2025 00:30:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.50 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735738226;
	cv=pass; b=hNRMy6M2WiSc+NqAO0wiNohgOSJLPb7sb9bl527z0ViDusgxXS/uNbfvyShwhPs+/VbirHYILIm0W/QD3kmSKJgHCjGXHX+pNzopR6FH5gYDB03V+4a/PQc5U70uPnT/Qkt0R5cuF7xWDpyFeEa6jm5415qHjIwgWp+c+Vok10QPwDNOUdT/VWRv3kXgnUvBoueTSYKTBvvzA2FL/b6+sXeLNM1E6llz6UTfjLdkytQxMa+uON4IF+mkZlgGjCGxUXOPTCiPzUMaoseJdleFXDUw1jbyBMOKAoP0FlYxYlrNECxCJEVBTVDp1+eJQEkY3s7PgtryZ3LcXGR7rE6wCA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735738226; c=relaxed/relaxed;
	bh=MANAM0Pqzv56k0Hi7gGwE49vT+P242uw3gzFSvfK6+c=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IfVtl2ickEz07n/OsY3/atwcAAG11VHUO6ZBWrTj2sGCNIpXVcGoEWIvTakEyzFYaMnauL0VEo/n+EqCxYjotmsgP1+0YARrEcerCVLMR0Iu3HZX6eyuh0XU+1X+ztDd9xXis5tCjLt4B1Ikallf0irmHRK/GtLqVHSCir04Ee1fOKM86bVYFUUA2egn5td+SuK6k2bONjcR6Y2UnmolgVWS7mnwGjQQa/tSpL4B6YnMqE4wHY8/Zix/KYP8oUjDoTKDhvFWr4SGQ32zZ7fbLmB0KBqaHl8PtVeJVc2Mty7iw7ViOfveiy76+IEyUR39kh+hvKbqPKMNfxtX8oEISw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=nkt5bk3i; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=L9f4MZx5; dkim-atps=neutral; spf=pass (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=nkt5bk3i;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=L9f4MZx5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNW186vPgz2xfW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jan 2025 00:30:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1735738209; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Be4H4ZTBwIQ4ZUuAVP4JYGkIVN2XHSx315Fe0yUQURm0XsTqPHRlDHmOkjbzdODl2h
    Y3R+nq8GkdzvsU7d8BJ4W2UvuidHm9cRldDvr+S4nFG7qhgfc98O8oIBpqHggUeHF31f
    j+zGTk6FWewpIMmLeXAFn0ecIbGJDQY+EprrGdeqMl2r0Lae/RAZacXDbPwdeIAfXKjY
    wbX7un8bbk6rsZxOJFqC0oLnwht0ZVPpYxkk3Y3c7ljU59Pc9rIE/Bl8j+GRAxCfhDcp
    8SLsTl5n2sJK7JMOhineyeu60AQV+2qMXRZAzf6gLeDdymadpvL/yA3h+VTf7uhv3cun
    b9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1735738209;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=MANAM0Pqzv56k0Hi7gGwE49vT+P242uw3gzFSvfK6+c=;
    b=ffpmu+eMZRCJMD3NpCLJME6R4p4sSia0saAYsw5SWHZDSDO0Lv6fqY8QVsSi2yoT62
    G9AE2bt/mLeZuI8fitDl0s9HaA4gNWd2Au5rS3R1E1iXddYNeCDmusRP89dsUEo50YCd
    mmYXt+olgocNIrscqRK6CzyBldArxOe5VSkXckhb7fqiPtpmfwamyXr2XpNdW9COaxcq
    Ho5nrVvhXAq3R9alwb/JJkM9fa1437od2mtVX3q+mT9a1KIA4v6xVBQTGD355iEvJE6f
    2NBwbKxuVpE07C80LkO3cyIQmAnLoeJKSaaqD7VBEOAyLwLlIuW/Ld+uWSgQQi7+ks23
    wwPg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1735738209;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=MANAM0Pqzv56k0Hi7gGwE49vT+P242uw3gzFSvfK6+c=;
    b=nkt5bk3imQ367aAb2GHIv0WTXCZAnL1Ek1UzXF20hp8xHu9Lr4CMU/dpa57dxJKF7F
    n8TyWx7/kimRztDlLkNu84A2VTV+nYVN1so7H+B+o8e9ZuCWJ/xNEivwcYKHpQU0myEZ
    fn4M9+aswJ4l1K8xIx7iTgpp0rFXCZw2bg96Wd7pQ34f6jhVtbssgmgrOx3cG/NispJw
    UcUlXENKMejqjNOcsO7J34k5IrKc1oBfKLFnFZdwELBBK3wItcZ6zFQimVWWzBRl5GN2
    P0BSYrIu6lftv+EBN9eiEIMDogsdG4VHySGRwqr9+HfXqGxB+twy3a/IYllS0MTso1FM
    RHDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1735738209;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=MANAM0Pqzv56k0Hi7gGwE49vT+P242uw3gzFSvfK6+c=;
    b=L9f4MZx5mlf5xD0ISgacPiT/IgF5B1s66j3dKJy9YWpV9uOZI/sbmE1e6aTYrNIQ1B
    iODjBSbPUoqZtzkjzjDA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EivHj9FnXlZguLZm8PSmufN+FD/uA=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id ebe9c9101DU8MgH
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 1 Jan 2025 14:30:08 +0100 (CET)
Subject: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Darren Stevens <darren@stevens-zone.net>, Pat Wall <pjwall@mac.com>,
 Pat Wall <pjwall@me.com>, Christian Zigotzky <info@xenosoft.de>,
 madskateman@gmail.com, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 hypexed@yahoo.com.au, regressions@lists.linux.dev
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
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
 <bfb4f3bc-23f3-3a9a-195e-afd73ab675cd@xenosoft.de>
Message-ID: <1b8945df-fa30-ffb3-d270-b2642242f055@xenosoft.de>
Date: Wed, 1 Jan 2025 14:30:08 +0100
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
In-Reply-To: <bfb4f3bc-23f3-3a9a-195e-afd73ab675cd@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Paolo,

First, I wish you a Happy New Year. Thanks a lot for your patch! I 
patched the RC5 of kernel 6.13 with your patch and KVM HV works! :-)

kvm_hv_final.patch:

virt/kvm/kvm_main.c | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index de2c11dae231..5177e56fdbd5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2975,10 +2975,11 @@ kvm_pfn_t __kvm_faultin_pfn(const struct 
kvm_memory_slot *slot, gfn_t gfn,
                 .refcounted_page = refcounted_page,
         };

-       if (WARN_ON_ONCE(!writable || !refcounted_page))
+       if (WARN_ON_ONCE(!refcounted_page))
                 return KVM_PFN_ERR_FAULT;

-       *writable = false;
+       if (writable)
+               *writable = false;
         *refcounted_page = NULL;

         return kvm_follow_pfn(&kfp);
---

patch -p0 < kvm_hv_final.patch

patching file a/virt/kvm/kvm_main.c

Now, we have a good patch after 56 test kernels!!!!!!!!!

I will test all QEMU/KVM HV components and report, if they work.

Cheers,
Christian

-- 
Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)


