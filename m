Return-Path: <linuxppc-dev+bounces-4417-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDD09FA69C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 17:24:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGRLN005Fz2xl6;
	Mon, 23 Dec 2024 03:24:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.50 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734884651;
	cv=pass; b=oJfFV1nFhLLoBXulIvh2+J8dA5hx38NAggtjSsa3Ps+T3EFB/uUYfs9/0V8igYOmKoU+VzNYJ1sUackjeaZYQeaBtHh/wG9uAELlZ+aAVJNVuylxO5g4qC2wo8n5+Tsr3ekHdi+EiGRYBhwD9GmyoeubSworqCOFKOWH72YxoiTPsNdbf/k8H18ou9Bpk4fYE/1gVViSZSdakMQGW6BKy4s2jRZWmF9M4f8UzF3+8GzKZqel8ZdPGBdCh5wt57xzin4HOyGTbLslnfQBO1UBFyX+cuJ0ruu8VdcR0Nkyj+aG3g6wSbgyK2KSgeTUaNEiLDKMZ0/tpW4pZYF2DVupkA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734884651; c=relaxed/relaxed;
	bh=ih76R148+1XSlHaEsRdapTH+SHRWt5yaZ3tMZX4l0TU=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=CrcOQYnESzQ5+wc0pCe8mrMlgHhpp/2dbXFdbCEe6wjyis7GOc0VQT0H0Beugy+cbv3zAXcnS03E1ejgSO0SMRxhfPGpiRPQCU17RhvMxli00cOKtg4bjrLNDyFeWNG4DLawJ0h1kTs3d6lAHOesm9YBW9HkDu+BZuw99ws+GYsimNinHSK2P3SV2Kh2NEWq3vErTkQ9ZeCreh6Rl6YgAKyfKi8b7fvkl92f61NgJxxxNWE1HCaeumgK4bxh9Pt4V6X4ET8M96YK6tjdjIrhc30v0eP0Q1gwXGtnmuKXghdCeUN51I/NNewTOiS91YmO8Q+476SgSmvJSQeqZXJFCQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=tBa2dH3Q; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=S3iu85gc; dkim-atps=neutral; spf=pass (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=tBa2dH3Q;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=S3iu85gc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGRLG5JDxz2xbN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 03:24:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1734884633; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=GOAOCUH+nLiI09Vdu/OJSTzH5ZP0s51T8nq5MZ8M7KhqINfTzXBV0GMf6qycqy3RgC
    hcJbPJ8bB3AGh3xK8XNy0zRtOpSuFrDS018G4MBcRDnjOxpG41S92BPqvYI7JIE8C2tZ
    np0eebizZLnjrjwZwmi/JqZBGdap6FWtPB99sNwDLZbxHvm5YGk1SGxooX5AFqdqPTw9
    pO8cSKdHklVyvdpSirVldw2BRkT2k9fbo9ZesuPlLbtDqi++oQxNZEkQZl89Z5ZHjI6X
    LPGQP074ez4kAR5U4OYhJVYLNWFyYBw+zXZXRbaxCE2n1MgMCZeqIjBqHKO6h3WfzLj4
    xFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1734884633;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:To:Subject:Cc:Date:From:
    Subject:Sender;
    bh=ih76R148+1XSlHaEsRdapTH+SHRWt5yaZ3tMZX4l0TU=;
    b=AztS68aX2HXTyNOCHtDTg7vgqEuJiPJMcqOXxj3lUoq0N7to23pEiHjWmZZR0esbQP
    L33WwfmBV9woZR4l1rc137tkOXpPD4fDfaIMhToj3M3tGOx0nrFWcfm520+jH7XIN8RN
    xhdymhfTkN2sBfBHK9Pz/9e+8TIWTmgY/niaqSXuU8boHfjG/qFCjVxRLMkPVBN6jagH
    DdAOZ18X9S1QWWnAULrq/NC3oF80w8FHz0ChU7KdjS7U9cXNNdqg3+Wefumn1gGJAzI8
    7A9Gtv5L7Uz7UC1jfBzN5cOkA+d3O+ytl56zMXmf69MUwGjCOldOuoeOkwZwjBXbnvLl
    pzzw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1734884633;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:To:Subject:Cc:Date:From:
    Subject:Sender;
    bh=ih76R148+1XSlHaEsRdapTH+SHRWt5yaZ3tMZX4l0TU=;
    b=tBa2dH3Q7f4ODakOpS2cI2dQR/9gACVSb8rP9A90ON5DjJldqH4zmh4F0awPqBuLGE
    UPfzJFkMyE6x0VmemauXKYhK8Y3H/0pQhiy+dE+BP2FJAkn3gCtKOtmDR33XKm7tgj+j
    bHrDrZw/egVEgoGtAJoD/tLGjBtiUzQTpn+iEEXrdqcWTuh80bHevh2Y1akRWgdHTz9a
    DR6IxyC3EiDwVs1bOzk3LB1EzVYimaPDbpC4q/3ZiO5E4tc/RnJ9TNO+wT15q6OGtj5N
    tbGVap27UFuujpLFZPfkjiGCwq6Vpv54p+V04DPcY+sGCD41jVGq1TWUhnRlPD3XjaOI
    fjYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1734884633;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:To:Subject:Cc:Date:From:
    Subject:Sender;
    bh=ih76R148+1XSlHaEsRdapTH+SHRWt5yaZ3tMZX4l0TU=;
    b=S3iu85gcAloxei8FfUTMZiM103nUinfFC98Y0O972lGsy9DXOHiDPJ5zQmCTRilL1E
    +Nefl89yFr5yq0MvPdDw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EisT29BnYJMBKrhBYBGwL4fUrhbbg=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id ebe9c90BMGNr9UA
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 22 Dec 2024 17:23:53 +0100 (CET)
Subject: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
To: Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Darren Stevens <darren@stevens-zone.net>, Pat Wall <pjwall@mac.com>,
 Pat Wall <pjwall@me.com>, Christian Zigotzky <info@xenosoft.de>,
 madskateman@gmail.com, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 hypexed@yahoo.com.au
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
 <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de>
 <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
 <0769459a-10ee-4573-a3ce-541c01429948@redhat.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
Date: Sun, 22 Dec 2024 17:23:52 +0100
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
In-Reply-To: <0769459a-10ee-4573-a3ce-541c01429948@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 22/12/24 09:55, Paolo Bonzini wrote:
> On 20/12/24 13:48, Christian Zigotzky wrote:
>> Maybe the kvm updates [1] from Paolo Bonzini are responsible for this 
>> issue.
>>
>> + Paolo Bonzini
>>
>> I have found some changes in the e500_mmu_host.c file 
>> (a/arch/powerpc/ kvm/e500_mmu_host.c) in the kvm updates [1].
>>
>> -- Christian
>>
>> [1] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
>> commit/?id=9f16d5e6f220661f73b36a4be1b21575651d8833
>>
>
> That's possible, there were very large treewide updates.  Can you 
> bisect my merge?
>
> Paolo
>

Hello Paolo,

I tried it but there is a host boot issue at the same time. Bisect log: 
https://github.com/chzigotzky/kernels/issues/4

Regards,
Christian

-- 
Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)


