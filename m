Return-Path: <linuxppc-dev+bounces-16896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Bw0FnhClGm3BgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 11:27:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 646CB14AD66
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 11:27:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFbRS5NGJz2yS4;
	Tue, 17 Feb 2026 21:27:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.51 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771324020;
	cv=pass; b=N+V0LUeIPxzvykFth1da0QuibezLbezLENB8VcW9KJPd547sgfLcnQdF0Ouu8RH52EkOfjuL0rmDwjy/tEavyL3FTBuT3ZeZcbbe4olXbpQBt1wNVOPOLshgfwcydt09IDa0own56YKrn63UXLt4zzjDficzu4AOCtIlPOmK5o4twqL4wu9zBpaF4DVCRHzHKWzNNgtSt/R/efyWHuv+Po1ilNtJUGHnxmRfZZekyF2f1F4B1/JEKg2rckJmJEeHe9axAUi7bqYRPZ+skXgN52GDBaWDc8Ih2d0qavwyPDdfOgDjOnkxJVZzUtgf9lkPbrDyMLD34OyADN63PIQ+ig==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771324020; c=relaxed/relaxed;
	bh=yUdCitq5A/nZ8HggRZvqPzFRkuVUKTBjO2sFJM1x6tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MD/4MffbaR3fv734lRidxwnjYKXprdcL1Ra6cdAk0uJFk4qv+oOdDzAEVx9iG/nGs0SIzrE7iVleRGqQMZZP6K0XotUmtpOl9hWsWRRiHoDG6enM5QkcNA1i5zyJ94ViqE9lF3iOho85A072ahIwPxavSkOGOycRlRd6dSUIZ7EUsbBkCSMS8/gkwozVjywOdcd/FjT/UVEUQFlPCiZPj2n8xwt+BSnsYHFtw8MjgRQz7pmfppHW6N4/H2U6sLf+3ijcTwcD7oXsUbuMOuw9xYl0dBO4VLMuDyqV08kZn6yUlbg/WF+lQ+Kti6ZMas0okmndvSbfxYRnhhpRthArww==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=pziqWwbz; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=N1ymJgNL; dkim-atps=neutral; spf=pass (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=pziqWwbz;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=N1ymJgNL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFbRP3YbVz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 21:26:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1771323991; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=fCPZo0BeTdy6e/VOc3V1RjimzxC5Pl86LRGq1Any9X0gAWYX50m0rMgQihkrxvY7St
    BF16Yn+lyVyTPrspwbXIj56TV5dQb04PivmXoGCdGtC0SKPLcgURkgOLyvk9gCsbHnYQ
    GXt5XuyCv392XvILCXG+6V3Hjy/GxrV5gyXJBXsybYJEl8Qqpm5KUdRKhupCD5khCTP2
    pNO1DCcEU6syE959xFmnJPwJvg+9MH5XODmI8uKdVrDTbt7C7sDtSurH8n3HSR8SzGyH
    DKjq4G/bh4ySw8mmOPaKRvxOb7fhHDF58XCbB6fgtpWfD9ldRkTLtly/b64p3atx00G3
    Fjbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1771323991;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=yUdCitq5A/nZ8HggRZvqPzFRkuVUKTBjO2sFJM1x6tk=;
    b=MOZMlnZxLCl4Hg+8zd/nqLgWieq0BW86JchQz2MCGQHaFrUlhsTg8gw92gK6dYyqRH
    xNVPA98fv6NcOVB0E1txF0Cf9D7ME716uK7Ngkn55KFjxFY8HSIgMQ+yIDgsvitkPgI6
    giTevfpJkPkMOERtieomEF1w7L5hgBTwbgE4ySTtgPQKiio5esXPCR45y0bUXAB3DOfc
    Jxp88l42R7Cy1orCdz680xuP4Shjd4T0Q0BEuOvUHGNYWgcVOTGsmx8ReX7PrB+yWGZc
    fSvKrpwJsHbZ8qVkvwjoAnsqNM3n6RjSUi6bNwKbOVdFsQBZPu7lS0QUIjHd9wz1HOx1
    vb8w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1771323991;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=yUdCitq5A/nZ8HggRZvqPzFRkuVUKTBjO2sFJM1x6tk=;
    b=pziqWwbzI9rvu/3AiFfbl5RbqTyXOvXq6pwEYUFFAgAwqlg/zoxJTjhiFtj+ii6DRk
    n0XZKrOye8qgRvCzrOBHO9EYhYPfy7jC5dyVBE4E3J6/j7zMZ5ASIBB5mHNoti0k1EIN
    7fZivDuoTkBlLHxAw4+W4P02YaGvtjKy1WQtuo6/dLgOgzCtp9WN+HPZxMvWpx6jnf9X
    AcQovMQ/PYmqovTTQlKkQA3Ona+ofM/j+A3FgTWG1E6B7eJ0vplAl/y1azccIUZpLX9Z
    RtohiXwCkxQfk4GwGh3/udbIKSzN1SmGx/Ur3CXNtiCUD0vDsCMcvp1MQjzaRQkXgpA5
    Jq1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1771323991;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=yUdCitq5A/nZ8HggRZvqPzFRkuVUKTBjO2sFJM1x6tk=;
    b=N1ymJgNL6saf85GRlvu2OE8L8OG3x/e1Y63k3QpS55GkZ26f+dY49jmV6XFODVT0zb
    QYlYQp8uYj0ggOINcjCg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIC+l7h/g"
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
    with ESMTPSA id e9337f21HAQVzdR
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 17 Feb 2026 11:26:31 +0100 (CET)
Message-ID: <2a27e6fc-7eb4-41a5-ba88-58f6a22625b5@xenosoft.de>
Date: Tue, 17 Feb 2026 11:26:30 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [Linux PPC] KVM PR and KVM HV do not work if the kernel was compiled
 with PREEMPT
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
 <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
 <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
 <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
 <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
 <843b7c60-23f1-47d0-b4e8-2147c3e40c23@linux.ibm.com>
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <843b7c60-23f1-47d0-b4e8-2147c3e40c23@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[xenosoft.de,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[xenosoft.de:s=strato-dkim-0002,xenosoft.de:s=strato-dkim-0003];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16896-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[xenosoft.de:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,xenosoft.de:mid,xenosoft.de:dkim]
X-Rspamd-Queue-Id: 646CB14AD66
X-Rspamd-Action: no action

On 17/02/26 11:17 Madhavan Srinivasan wrote:
>
> On 2/17/26 3:14 PM, Christian Zigotzky wrote:
>> On 17/02/26 10:03, Shrikanth Hegde wrote:
>>>
>>>
>>> On 2/17/26 2:22 PM, Christian Zigotzky wrote:
>>>> Hi,
>>>>
>>>> Thank you for your patch. I tested the latest git kernel with your 
>>>> patch today. Unfortunately the system freezes while booting the VM 
>>>> with KVM HV.
>>>>
>>>> Cheers,
>>>> Christian
>>>>
>>>>
>>> Would it be possible to share the console log or boot log of KVM to the
>>> point it freezes?
>>
>> Unfortunately there aren't any error messages.
>>
>> I also tried it with:
>>
>> gdb --args qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel 
>> uImage-7.0-preempt -drive 
>> format=raw,file=void-live-powerpc-20230317-updated2.img,index=0,if=virtio 
>> -netdev user,id=mynet0 -device virtio-net,netdev=mynet0 -append "rw 
>> root=/dev/vda" -device virtio-gpu-pci -device virtio-mouse-pci 
>> -device virtio-keyboard-pci -enable-kvm -smp 4
>>
>> and with gdb in the guest:
>>
>> qemu-system-ppc64 -s -S -M ppce500 -cpu e5500 -m 1024 -kernel 
>> uImage-7.0-preempt -drive 
>> format=raw,file=void-live-powerpc-20230317-updated2.img,index=0,if=virtio 
>> -netdev user,id=mynet0 -device virtio-net,netdev=mynet0 -append "rw 
>> root=/dev/vda" -device virtio-gpu-pci -device virtio-mouse-pci 
>> -device virtio-keyboard-pci -enable-kvm -smp 4
>>
>> The system freezed without any error messages.
> can you please share the config.
> I tried kvm-hv in my power8/power9 and seems to boot fine without any 
> issues with today's upstream
> Maddy
Here are the configs.

With PREEMPT: 
https://github.com/chzigotzky/kernels/blob/d50d259ca63dd2b3b9a9eaabc82e5cc69c8cc9f0/configs/e5500_defconfig

Without PREEMPT: 
https://github.com/chzigotzky/kernels/blob/main/configs/e5500_defconfig

- Christian

