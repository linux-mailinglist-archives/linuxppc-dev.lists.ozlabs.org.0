Return-Path: <linuxppc-dev+bounces-16894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EoWM4A4lGm4AgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 10:44:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F7D14A849
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 10:44:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFZVP0Zr0z2yS4;
	Tue, 17 Feb 2026 20:44:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.83 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771321468;
	cv=pass; b=SjFLhiSF5qVfrBy03zLuLMjoktX9E1Ho1A4cRIb+jI4l0yh1UBqNZ8jV9wAJ7n3hfsgZaAmFLe3ZQZrjw+zYbc0UPSRlH/rZt2o5zUzDK9HvqU6zf4hYyYtwbfCK7N1ZcGfwpQId+GOdidXXDrcn/Yd4V+MfszCFIsLchXJbcXL6Pbt/2iD0j9NPmGkj9nh/6itIxx5vtfUS/3VZmfpZlmeuKxx8ge2vjyIsey54u3TmqMo6nTXfGbeDekA/M++N9iA26wRpyOXOvkhM9+Uol46ycemvOZEgr/62uhD8vOj0+bzm2CcQWfQyVL4jbEF7nzmEtjxvso48hh0p8jRMAA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771321468; c=relaxed/relaxed;
	bh=Dve+BEs/Ll3W4w+UZtHdl4eaEGqteiBINi8zGX9siCw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Dg6vLh4w46KGFWKWgupSGjJwdWSdwvapd9k4DS661o5HULPhkLPQE3csidJdhg+Yp2gC9LlmrM3K06eRBGLOFdBnkT/cYSs0WwXnP7w7cvrZNkj73zeit+SSFoT3wYlS8h7sQO5W1aQAmodezkPUJ23tO12nB1HVbwt8QQ6ME3D2n/NuwTCH+gfIXS+702IsYpTkhWM47DvIJzwOs1TBaRK8AfrktMkN64i16FyHA+btticCzdaeq67cLHQCTSa/wImpDG6kJS484g3g8QFyoUMv+i9ly+kOF01ZDhu1I8c/7WIXA75nspFNSYEZ3gTz1AfZUwLPuqrd+FRJK/njIw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=TP8OIJIz; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=BlyjK2XB; dkim-atps=neutral; spf=pass (client-ip=85.215.255.83; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=TP8OIJIz;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=BlyjK2XB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.83; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 3111 seconds by postgrey-1.37 at boromir; Tue, 17 Feb 2026 20:44:26 AEDT
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFZVL1RJ5z2xN5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 20:44:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1771321459; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=DufMzvm2lOJYkTg1TomLhue/YaXTJ6OLBna3WFLiZjDI9dI9jvPPW+NjwrUZOj1mLE
    iiShJ5yvvPdni4D5Z0qbO88NZBhHzoagDowVJ76kFKiVWL3D9UwKED71OWf+jVnd/RGW
    dXviM0p0IGGFGsTpS12v7/3pQBaXiyS0W41NHzs4lyu6g1v4DPM4Ld2Pmr9O9+JoVk1m
    ynHOplvKE5gFAEvo6ah2UXjN7RQjdsCMpVgOfAtuV5bxXwlHteTy1FITsFdo8bqDz3hv
    Vwq6YHjQfszfjJKzsObdWC/psZ46qQp3wbIXtIHamygr9HFQfcCTXkDL0qnZZdy1qLBq
    eKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1771321459;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Dve+BEs/Ll3W4w+UZtHdl4eaEGqteiBINi8zGX9siCw=;
    b=C12dR7M4Ubx7qS6cOe/oLNCe7dsRk5tQ7eJJAnBS8C4Quvsz2yZMvOIKqZkbbcjr9B
    gplC24hg2mGYmn6nEWpXuam/Zx5Gwxv2SJ3Q+M5h1iLjsFIL5gQzpebfg7uoZfRXAwKk
    +v9axhi7IQlc9kU1zdHrUDaQGATX+gCsouza4hcgSp/DBMg1Rtuopv8JLJvwex2+/Bfj
    GUXnCnyt1JBdUUevQHW5d8CjfnZQO6UN3ViaaPDGEiCLcyj/9i2sHsVLpxUWGVZLYAMJ
    Owy8s4Hf5BUsjKNAGhh09vPt/IJXJVvH0zYr5jbR8V8mPSzdfZEsAJZnC8L28XI5CG+Q
    hwsw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1771321459;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Dve+BEs/Ll3W4w+UZtHdl4eaEGqteiBINi8zGX9siCw=;
    b=TP8OIJIzkYdCwyFqRywuzFHA263XC6fv+XN+OvJdVseUbrZCS8ooHrV8IVX+V5UOxF
    k6rU8kVgTQD4eCqpi1L+urwtI6WV2HvQohEbLMB8BEzJAyX7bRfvdEggd65cwLE6yR04
    F0XH5vcGJCh1pghcJHaaDbMSi8rdl9NswHCLWeZrrQvgDQKKXJ2sFSqVzfO7GGelSwQH
    xhSw9kAcjVwKVpEg9ZxczFvjj/ZdPLmcB2Oerv57xoJ0wkBPo1SUHxRZnbjUOrmBTK0L
    ErkDBQJvXdGqBRfI7BYTKkyZlnR9D/j068lfcN3EhW+HQmkJXvpAVt/P09fAa4+133G/
    YLnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1771321459;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Dve+BEs/Ll3W4w+UZtHdl4eaEGqteiBINi8zGX9siCw=;
    b=BlyjK2XBFzqgRHtv/L0+fUOxj4TWoUqC2MqW7X9S9yXLkmDS6/+CVQrYIWDoykKQp/
    EwW5k4M72Uuk5lKsGYBA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIC+l7h/g"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
    with ESMTPSA id e9337f21H9iIzOj
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 17 Feb 2026 10:44:18 +0100 (CET)
Subject: [Linux PPC] KVM PR and KVM HV do not work if the kernel was compiled
 with PREEMPT
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
 <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
 <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
 <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
Date: Tue, 17 Feb 2026 10:44:18 +0100
X-Mailer: BrassMonkey/33.9.1
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
In-Reply-To: <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[xenosoft.de,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[xenosoft.de:s=strato-dkim-0002,xenosoft.de:s=strato-dkim-0003];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-16894-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[xenosoft.de:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,xenosoft.de:mid,xenosoft.de:dkim]
X-Rspamd-Queue-Id: 82F7D14A849
X-Rspamd-Action: no action

On 17/02/26 10:03, Shrikanth Hegde wrote:
>
>
> On 2/17/26 2:22 PM, Christian Zigotzky wrote:
>> Hi,
>>
>> Thank you for your patch. I tested the latest git kernel with your 
>> patch today. Unfortunately the system freezes while booting the VM 
>> with KVM HV.
>>
>> Cheers,
>> Christian
>>
>>
> Would it be possible to share the console log or boot log of KVM to the
> point it freezes?

Unfortunately there aren't any error messages.

I also tried it with:

gdb --args qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel 
uImage-7.0-preempt -drive 
format=raw,file=void-live-powerpc-20230317-updated2.img,index=0,if=virtio 
-netdev user,id=mynet0 -device virtio-net,netdev=mynet0 -append "rw 
root=/dev/vda" -device virtio-gpu-pci -device virtio-mouse-pci -device 
virtio-keyboard-pci -enable-kvm -smp 4

and with gdb in the guest:

qemu-system-ppc64 -s -S -M ppce500 -cpu e5500 -m 1024 -kernel 
uImage-7.0-preempt -drive 
format=raw,file=void-live-powerpc-20230317-updated2.img,index=0,if=virtio 
-netdev user,id=mynet0 -device virtio-net,netdev=mynet0 -append "rw 
root=/dev/vda" -device virtio-gpu-pci -device virtio-mouse-pci -device 
virtio-keyboard-pci -enable-kvm -smp 4

The system freezed without any error messages.

-- 
Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)


