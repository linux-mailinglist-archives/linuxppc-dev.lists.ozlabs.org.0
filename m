Return-Path: <linuxppc-dev+bounces-4503-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6899FDB38
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Dec 2024 16:04:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YL5HX5bwGz2xQ8;
	Sun, 29 Dec 2024 02:04:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.52 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735398264;
	cv=pass; b=S1gn/FH5COPEGba/cA2fKaK1WXdsIzO+8pjnm6ZZ2WMxLkx+RjaSQJXK6zNPeYibvs9rOnEfGPcd5JzIP/p8EFgcUA0TUIhYoIUBLNsJsIzd7mNaHaN23hqLe4tST/ggeR30od/K3n/Dkkc4/Bgpk2M8nNWBOXSxWPAvcnzlxEk3WJVqBYak/LFK7nabor921Xdq84ah6q/6lJugga5CokYHa55ImUQx9o8ImhGiHikCYU1K2OZeOYd3D7heXdPa6PAQbDGNveeWPTHHqtqT9mODYTsK6FJLVDPnMMe2TXYA4auE2IDdt7fLoNPiCC2R0qseRTwa7FIeuBw4G1f+XQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735398264; c=relaxed/relaxed;
	bh=qLxJud3QT2FgeecmWR6c8W7nxF/FxSeDZmpBcbT+vgo=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=i1d/XRCeNzsU2j2LWVJxY3W2u1d4tAjKhOjSXam5t7XA4ajKYZKCxBVe0tDHqr8zocvG7j63I7hlJ+jnzAToMgdjK/0sXpjJhskdRSz6lSVYj6yXFOra/juqxW7ldipUlTyLfWUXGWaRpop9t+BteFZZaqw3jB+8XoOVjxDQFoTkr9taLi6kt6m4+gwOrBMrSqErGWmhmLeqA2ysKMlzkinpeXI1KWNpt0h0kYQokble2dI5vmcewOtGjQObPNpDPdbAAspjmDrnx59oXvqUhakxHl/toWh2uDnH2uXbRRNcrs2Nf7SHZVUQhMFUjE+QPUN4/8fuuzpZs/XV598OvQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=UN31UaZy; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=uyOjos4P; dkim-atps=neutral; spf=pass (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=UN31UaZy;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=uyOjos4P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YL5HR6DF5z2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Dec 2024 02:04:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1735398248; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=k0uwYPQkHAo+8e10ZExX2OgkwOUEDmRCKDXAVyQbQRcxcuy0gmEK6MlQr9AVuiEfRV
    KdUqZTmQF+Ze6CsGc2zX7zuJtxQ4KTdukAhDnH78gRjwIGEIdIB4xJkw83j/IB5kjjPy
    CoTfP1HNeWU96KeZPyKufNMAH2ew383rPeKiL21M9X8KO/T6rHQK3se4cJMUbqA41zlV
    OgHlXp4wEW3l52MszVcdcxqRsI9XReEa7jTqGY1D4EBPpEvL33CLLTw3eOKGD/814j2V
    KQjHJHWRqnUQksWjmqjNs6YXclHyV9XbogQOb6Tyuw2+EmR2PQF+mKB6b2a/k3K4gnsa
    Ov+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1735398248;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=qLxJud3QT2FgeecmWR6c8W7nxF/FxSeDZmpBcbT+vgo=;
    b=iMVebN6WQ904H83JEYgS30s/E7pL4dNL/G6/yI7vmG0KMU3e1eb37UzVergMygIO9A
    PYTba4s97ajifu5c+J6AjA3fW8lTZeZL5XEYX0Io6vt/Pkqq+ox54OYIZ/MBRJ9A4cIC
    kV1aD82wAVjmjkheV6iZS70F28DFyejbS3Yvd//ynrY56Qp6NsQpS4Yip4nvEtO1UJkg
    x78nF9k36a7svFNHtK8bu9+cMA+M7H1VsZZ087wB8gMT4wA5/AnMhuIJdrilk0n+43VB
    ppQTC9hJ4crDomZ3V7vpFEHv10JMmGN7hUl0JomfUjL2SwwHFFDSr0gaqsR2TXiMxRv1
    skVA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1735398248;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=qLxJud3QT2FgeecmWR6c8W7nxF/FxSeDZmpBcbT+vgo=;
    b=UN31UaZy21+kxhhtDhwgkrhb6UtxXfskPWW/9daTjm+fhmoU3rJF9qaQU/WRlCClLu
    iqUtfCArxEyEbAXlFjobPtbBT+vTGbHGTWHQGiS20MLNBgVMf1yGVfIBgbiup5rqvwVO
    jyldTWFEyMbL1OqLp1eyK81fn4VichrwaYEoKLPnSL18nh9nCV7LuxDsFl7+AcZCrkji
    OFQE4RH0jprXd49VTs4uBybao1wxsPHtlMSYnPaIv86B0veCswNEwe32vuSrvLN8xaG7
    47griSASZgkAcXNvDa4mUD7NErUHXG4lO6j4UuvC/Gh9zsN/OWk2z5uJu6B5kHTIJ9WL
    5nEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1735398248;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=qLxJud3QT2FgeecmWR6c8W7nxF/FxSeDZmpBcbT+vgo=;
    b=uyOjos4Pq9zzk9G4p64LWmL+PBVpNZn2d12XwMvg1I/3h9NSTw73WqY43spAeFumVQ
    /ALsIidT4PMm9gpGsQCw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EivHj9FnXlZguLZm8PSmufN+FD/uA=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id ebe9c90BSF47GYz
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 28 Dec 2024 16:04:07 +0100 (CET)
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
Message-ID: <02c39ee9-7b54-8384-6ddc-b979abc9e7c9@xenosoft.de>
Date: Sat, 28 Dec 2024 16:04:07 +0100
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi All,

I found out which area is responsible for the KVM HV issue while 
reducing the revert patch.

If I replace the following line in the file 
'a/arch/powerpc/kvm/e500_mmu_host.c' then KVM HV works again.

-        pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
+        pfn = gfn_to_pfn_memslot(slot, gfn);


On 28/12/24 15:55, Paolo Bonzini wrote:
 > The fix is already found, I will send it out shortly but everybody is on
 > vacation now

Thanks a lot! Could you please post the patch on this list? I would like 
to patch the RC5 of kernel 6.13 next week.

Thanks,
Christian

-- 
Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)


