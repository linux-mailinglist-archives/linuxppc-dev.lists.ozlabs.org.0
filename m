Return-Path: <linuxppc-dev+bounces-17223-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHiNMTvcn2nEeQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17223-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 06:38:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E29BC1A10FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 06:38:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM0bp19D1z2yFd;
	Thu, 26 Feb 2026 16:37:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.169 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772084278;
	cv=pass; b=UU/N7i5++U4URo7GthayGkM6VUCtlp3AtKcwnyhFGWzCIoDm9sjQu49Q3KO7u2IGN1IpN1zB4lr1yZhYI681wwA97hvo+5Q/9vghqAazH37u3Iq3l30psA/EKHRJVEdesMYh1Afp/L1bRrQhSuYhcXng3yeD8mAqthBk4witKoGnh9ZrBwPel05kW0E7UL3tAHyLr6GMVYOCKNOj+nIWSqA2ieSVTBPdiOD0OzPdwrYpX40Hqd7i7o4Klk7bfMBm/fFrftioM18MLRYv6G1uERbP6ykF3QpnPsuv7CsJfmptMyTmwh8xomFxKCG4umAX3dbZ0qGHqSS0Xb+GUZ8Q9w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772084278; c=relaxed/relaxed;
	bh=o0ysbZpfHQ3iRyOI9zvyJSu2mmeoVwkAQXPoR064I/g=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Nrh2kmyosMnv7ocDj0mGYpQAWqc60CTzzabpqPQzCe7lyVIMakCLEHaLACBob6PtUkbvkq1mpQ89ts80QgBI1RB0Kcnxjxn5XK/58fSck3IZK15u1cIb79pKty1FpWJpItbRnDGqoO25FNx7Vnltgqcy50YzcDuwaGOXI6HZzXReJ3IRm45qKD8nKis8CSxwEn20M6HmYWYmgmzwFHOCYlSXzUd4GUaIiosXeUsiP43Js0g28y0yK53VYPj40FeNM4/iuEazELiyEuW5XXssKaO2g51bVLpdG7UUNK71lV2WTV2jZF9wCQ1rL3mSsVhXWODHHRq3KGox+x5bnVT5dw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=FbYMGLj8; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Svc+lW60; dkim-atps=neutral; spf=pass (client-ip=81.169.146.169; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=FbYMGLj8;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Svc+lW60;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=81.169.146.169; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM0bk559Zz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 16:37:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772084256; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rg7uO7QmMPKTM7xuzVrtrgO2Qo73tfoFKftmKn4rb+P7/rZM0vSKR5h2YpQG414uXE
    b99PiTYr5Fo0/+vCs+XUH/yMLyadPR4K9/WHiF0ln4D0eQS+N6rzACvNaaTtv+La/6Ew
    bdQtEZFIX1eZInOr7P3Ybv77i0WBTdFKzRLAgGLXkVMBGp09Gp2Gw9+9ltdvuzKE4xNe
    a7jtmyGzudSNiypiie8EV194XYRiv61H0ESCDbhnYDaewL6WKAq/JQUF6muckgF4W+Tx
    bYRWcTCBjwNBLpWA1+1KJjFWbW+6/QNyjnbl0KRlGzC9M+Rrp65RMMXduscSZbAw3kM0
    QBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1772084256;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=o0ysbZpfHQ3iRyOI9zvyJSu2mmeoVwkAQXPoR064I/g=;
    b=aupxx/dgGPBHW9DyznStl3LkgNR4nc1lUXkL9q6ZanrLclNwOVTkJmJLduhlQQ838W
    u0diCpXdcDTZTX428NBxQYUJDbBIqNJhMH1YlkAYb0oJ8KZDVft9CBnOiJnC6/bzNG1N
    Tmst1Dn/S+Gc6h5QepM6kJAsDWzX0b4Y8cFTvTD3Hj1Lhc6Tbn+xBTjKIYfzI1gG4zfV
    F2IE5Qu9HFQ0Zhb5xX1EE+PLvj7z+6Qgx9tEVS2wqRqq1lwRsWf1DwrXPT8YX7VtYiau
    iWG3VKeXlJkJ8+XnzO1jlusKBQesxjg6pE1GiWuaDYGidyPLE0U0yW8wOgvfHbjgUXDw
    TMag==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1772084256;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=o0ysbZpfHQ3iRyOI9zvyJSu2mmeoVwkAQXPoR064I/g=;
    b=FbYMGLj8JVnmPhcnkuP/EtZ4UM7qI6/fsc9O1UkQC+j/36skc1ZKfzityothHO4F45
    7nXmOzJUDIfygFjQfmwPia0U5Ug+lN4wt1sr/Op+bglq+rFrarSBy3bw7LNB6e46ygFC
    grj8SFsGY81WthD9HQN+tVpPQ6wyjTrnlA34MqWMAgtLcJU2UI78sgExf2ZHb9IjmvPU
    mzW57O8GXKV9Ijcdbgm6NIHPYeuAe6S32ME3O3JzibBjpHDURsbuECZIDzpc04aEGn6e
    15guGTWNsolLsBbqS355yq7gqyL5v+M2gVWPlqK0kwRULzWjBDb6Vld8TzpyWlPdXz9+
    MxwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1772084256;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=o0ysbZpfHQ3iRyOI9zvyJSu2mmeoVwkAQXPoR064I/g=;
    b=Svc+lW60q49CdUJ5bcoNJy1M52+9V962Cgw9+svMxUFsE6jn60QC2DgScZAPE5BOub
    2v16jAFG/c9pwIdvavCg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIC+m6B7g"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
    with ESMTPSA id e9337f21Q5batcH
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 26 Feb 2026 06:37:36 +0100 (CET)
Subject: [Linux PPC] Disable PREEMPT
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
 <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
 <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
 <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
 <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
 <843b7c60-23f1-47d0-b4e8-2147c3e40c23@linux.ibm.com>
 <2a27e6fc-7eb4-41a5-ba88-58f6a22625b5@xenosoft.de>
 <1d79ec6f-ce7f-4432-80e0-a54fa1668642@linux.ibm.com>
 <e425cd24-e19a-3860-aad2-11e91af8323f@xenosoft.de>
 <1c9b879a-7907-4849-a416-5df3db5617d6@kernel.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <34112e67-85a5-a380-a42b-24c6562d65be@xenosoft.de>
Date: Thu, 26 Feb 2026 06:37:35 +0100
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
In-Reply-To: <1c9b879a-7907-4849-a416-5df3db5617d6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[xenosoft.de,reject];
	R_DKIM_ALLOW(-0.20)[xenosoft.de:s=strato-dkim-0002,xenosoft.de:s=strato-dkim-0003];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17223-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:maddy@linux.ibm.com,m:peterz@infradead.org,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[xenosoft.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	HAS_ORG_HEADER(0.00)[]
X-Rspamd-Queue-Id: E29BC1A10FE
X-Rspamd-Action: no action

On 25/02/26 08:16, Christophe Leroy (CS GROUP) wrote:
> +Peter
>
> Hi Christian,
>
> Le 25/02/2026 à 06:54, Christian Zigotzky a écrit :
>> Hello,
>>
>> We were previously able to disable PREEMPT in the kernel 
>> configuration, but the latest kernels now enable it by default and it 
>> is no longer possible to disable it.
>>
>> Is it possible to let us decide whether to activate PREEMPT or not?
>
> Can you give more details on why you want to be able to deactivate 
> PREEMPT ?
>
> Read https://github.com/torvalds/linux/commit/7dadeaa6e851e
I use PREEMPT_NONE kernels on my Linux PPC servers. (Without desktop)
>
>
>>
>> Currently we use the following revert patch for our non-preempt kernels.
>>
>> --- a/kernel/Kconfig.preempt    2026-02-14 10:06:32.000000000 +0000
>> +++ b/kernel/Kconfig.preempt    2026-02-08 21:03:27.000000000 +0000
>> @@ -16,13 +16,11 @@ config ARCH_HAS_PREEMPT_LAZY
>>
>>   choice
>>       prompt "Preemption Model"
>> -    default PREEMPT_LAZY if ARCH_HAS_PREEMPT_LAZY
>>       default PREEMPT_NONE
>>
>>   config PREEMPT_NONE
>>       bool "No Forced Preemption (Server)"
>>       depends on !PREEMPT_RT
>> -    depends on ARCH_NO_PREEMPT
>>       select PREEMPT_NONE_BUILD if !PREEMPT_DYNAMIC
>>       help
>>         This is the traditional Linux preemption model, geared towards
>> @@ -37,7 +35,6 @@ config PREEMPT_NONE
>>
>>   config PREEMPT_VOLUNTARY
>>       bool "Voluntary Kernel Preemption (Desktop)"
>> -    depends on !ARCH_HAS_PREEMPT_LAZY
>>       depends on !ARCH_NO_PREEMPT
>>       depends on !PREEMPT_RT
>>       select PREEMPT_VOLUNTARY_BUILD if !PREEMPT_DYNAMIC
>>
>> ---
>>
>> Thanks in advance,
>>
>> Christian
>>
>


-- 
Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)


