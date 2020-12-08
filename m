Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF132D2D71
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 15:47:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr31G1KsGzDqPv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 01:47:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=BWBAUgBL; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr2zK5cKlzDqPv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 01:45:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1607438569;
 bh=4ulqbptt18N9mfLJqYgbl6adZA9Ub3njw1/m9o6YsLk=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=BWBAUgBL5EcGy9mAx1yVKjLIt4XqG5Qh6FPEcsgC22nnan4U20QaXX4KYMKTLyJn+
 sgelNwrHoB2SvWl9d4jNJCSLUytO5UPWbbafbIfQDn8tpvEswuUo46KBoF4FXTNlWW
 hP5FGia83a1YYFTGRvQcRq7RWAwEgXm3RKeuJ3H0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.170.130]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mzyyk-1jyWKN0U9m-00x2fM; Tue, 08
 Dec 2020 15:42:49 +0100
Subject: Re: [PATCH] arch: fix 'unexpected IRQ trap at vector' warnings
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <20201207143146.30021-1-info@metux.net>
 <877dptt5av.fsf@mpe.ellerman.id.au>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <cd9cdd74-688a-dc4b-6590-9aec8b89cbc1@gmx.de>
Date: Tue, 8 Dec 2020 15:42:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <877dptt5av.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CPtHYo0yOUqWsT2Dl/2XM5tvEqSTPo7im51SNx0bMEoZFJ++QZe
 vuC3yVnehmvvd8ILOcmBg5sCNi219QMBz4Y/jzf/p2up7Dw+ID3oEvc7EywKTchru+reyVi
 RnrsbuZKZjpkwdmhUHXRmPTDuo1jzHtFrQ1q6pSiYtNkd03//Ybpsx0M8QSB7ql/uYt4iWX
 MqfvdrZAyDztyfwl9/brw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YEwIqXr1oVc=:I4i3eOxrwwVkhcmXct+QtE
 r00TyilmfsBTRLx0Lemv8jkTC/uysolChUgBgJCarmOVr+YGxUAqsHZfae2qSbRFsEEfRNKMY
 wy1wkPZVHgC5cyB7FQiMHrFnRMgwBkPt2MXuYFWiA54q8zgVW724BBJcYSRXwNItKvHBZeItF
 kL1At4sShrOkZSaeupCHJ52iCkOyYNcXHXe7/WKeeoZK8zG1xlytbKjHPHU31SOHdflMovItS
 KaY961W/QMwtuFvr1ysVxO6pYZ3PGkzEEJMVVbfuDZXzwEqu7zP+DtbNVh3qqDrMDBa/N/pmw
 Xa5qthsuuTbFhqE/oF3v9uRf3FB+pSgTAxgvsxI7NlgFzAzh3PFdxmJWBkvuGD3Q0S73yR817
 0rVKIkc48KM4CdHeiUhrp+TsFLNm7vzVINsEj7RFw1cpzGQxaOLMLap1qxYmKd4O3RRkvAhMn
 BURNMYhDsSaGUK7pBP9I0+ES9r78rwtG505k1nnWDXFtN5ydHQ472R6FBy7gV1bA3STFboz96
 lFUrYJ/HUZIyFmSjT9Rc8czcHqDMAgBCq/coJbMIb9dg0E3ZI8lZPSWq9OEBtRw6/Pkmfbnbb
 kUhCL7HaOCQnT9d7AsVOxDy5WEcdnOxWZAwX7jgtwWVkRd7yYDMjicswav1p/911K/vAnlefs
 6Rb1PDug21X/jnoumpzHQYW+1ySlg5SigF04UJJkxBXKDNW/syBFel+AmMiEEgkAN4vrtcqeb
 qJ5Z52um2VX72Lk/hNp8Ut86oHXZnO/5HZhMnS1suGsmThukHWR9WsDiwnhr9BhRlI8QDE9+z
 x28EsZ6GMi4ntTbitUkfIqPW1etynQ6xldlQ8CBs0LoQiU+XvqGbhgWET3cfGsDHUym8Hvr1Z
 EyTnNMPhcTEjgf7UyFVg==
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, hpa@zytor.com, linux-parisc@vger.kernel.org,
 jdike@addtoit.com, x86@kernel.org, linux-um@lists.infradead.org,
 James.Bottomley@HansenPartnership.com, mingo@redhat.com, paulus@samba.org,
 richard@nod.at, bp@alien8.de, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org, anton.ivanov@cambridgegreys.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/8/20 3:11 AM, Michael Ellerman wrote:
> "Enrico Weigelt, metux IT consult" <info@metux.net> writes:
>> All archs, except Alpha, print out the irq number in hex, but the messa=
ge
>> looks like it was a decimal number, which is quite confusing. Fixing th=
is
>> by adding "0x" prefix.
>
> Arguably decimal would be better, /proc/interrupts and /proc/irq/ both
> use decimal.

I agree.

> The whole message is very dated IMO, these days the number it prints is
> (possibly) virtualised via IRQ domains, ie. it's not necessarily a
> "vector" if that even makes sense on all arches). Arguably "trap" is the
> wrong term on some arches too.
>
> So it would be better reworded entirely IMO, and also switched to
> decimal to match other sources of information on interrupts.
>
> Perhaps:
> 	"Unexpected Linux IRQ %d."

Yes.

and while cleaning it up, introducing a default weak implementation of ack=
_bad_irq()
which adds and increases irq_err_count for all platforms would be a nice c=
leanup.

Helge

> If anyone else is having deja vu like me, yes this has come up before:
>   https://lore.kernel.org/lkml/20150712220211.7166.42035.stgit@bhelgaas-=
glaptop2.roam.corp.google.com/
>
> cheers
>
>
>
>> diff --git a/arch/arm/include/asm/hw_irq.h b/arch/arm/include/asm/hw_ir=
q.h
>> index cecc13214ef1..2749f19271d9 100644
>> --- a/arch/arm/include/asm/hw_irq.h
>> +++ b/arch/arm/include/asm/hw_irq.h
>> @@ -9,7 +9,7 @@ static inline void ack_bad_irq(int irq)
>>  {
>>  	extern unsigned long irq_err_count;
>>  	irq_err_count++;
>> -	pr_crit("unexpected IRQ trap at vector %02x\n", irq);
>> +	pr_crit("unexpected IRQ trap at vector 0x%02x\n", irq);
>>  }
>>
>>  #define ARCH_IRQ_INIT_FLAGS	(IRQ_NOREQUEST | IRQ_NOPROBE)
>> diff --git a/arch/parisc/include/asm/hardirq.h b/arch/parisc/include/as=
m/hardirq.h
>> index 7f7039516e53..c3348af88d3f 100644
>> --- a/arch/parisc/include/asm/hardirq.h
>> +++ b/arch/parisc/include/asm/hardirq.h
>> @@ -35,6 +35,6 @@ DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_sta=
t);
>>  #define __IRQ_STAT(cpu, member) (irq_stat[cpu].member)
>>  #define inc_irq_stat(member)	this_cpu_inc(irq_stat.member)
>>  #define __inc_irq_stat(member)	__this_cpu_inc(irq_stat.member)
>> -#define ack_bad_irq(irq) WARN(1, "unexpected IRQ trap at vector %02x\n=
", irq)
>> +#define ack_bad_irq(irq) WARN(1, "unexpected IRQ trap at vector 0x%02x=
\n", irq)
>>
>>  #endif /* _PARISC_HARDIRQ_H */
>> diff --git a/arch/powerpc/include/asm/hardirq.h b/arch/powerpc/include/=
asm/hardirq.h
>> index f133b5930ae1..ec8cf3cf6e49 100644
>> --- a/arch/powerpc/include/asm/hardirq.h
>> +++ b/arch/powerpc/include/asm/hardirq.h
>> @@ -29,7 +29,7 @@ DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_sta=
t);
>>
>>  static inline void ack_bad_irq(unsigned int irq)
>>  {
>> -	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
>> +	printk(KERN_CRIT "unexpected IRQ trap at vector 0x%02x\n", irq);
>>  }
>>
>>  extern u64 arch_irq_stat_cpu(unsigned int cpu);
>> diff --git a/arch/s390/include/asm/hardirq.h b/arch/s390/include/asm/ha=
rdirq.h
>> index dfbc3c6c0674..aaaec5cdd4fe 100644
>> --- a/arch/s390/include/asm/hardirq.h
>> +++ b/arch/s390/include/asm/hardirq.h
>> @@ -23,7 +23,7 @@
>>
>>  static inline void ack_bad_irq(unsigned int irq)
>>  {
>> -	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
>> +	printk(KERN_CRIT "unexpected IRQ trap at vector 0x%02x\n", irq);
>>  }
>>
>>  #endif /* __ASM_HARDIRQ_H */
>> diff --git a/arch/um/include/asm/hardirq.h b/arch/um/include/asm/hardir=
q.h
>> index b426796d26fd..2a2e6eae034b 100644
>> --- a/arch/um/include/asm/hardirq.h
>> +++ b/arch/um/include/asm/hardirq.h
>> @@ -15,7 +15,7 @@ typedef struct {
>>  #ifndef ack_bad_irq
>>  static inline void ack_bad_irq(unsigned int irq)
>>  {
>> -	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
>> +	printk(KERN_CRIT "unexpected IRQ trap at vector 0x%02x\n", irq);
>>  }
>>  #endif
>>
>> diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
>> index c5dd50369e2f..957c716f2df7 100644
>> --- a/arch/x86/kernel/irq.c
>> +++ b/arch/x86/kernel/irq.c
>> @@ -37,7 +37,7 @@ atomic_t irq_err_count;
>>  void ack_bad_irq(unsigned int irq)
>>  {
>>  	if (printk_ratelimit())
>> -		pr_err("unexpected IRQ trap at vector %02x\n", irq);
>> +		pr_err("unexpected IRQ trap at vector 0x%02x\n", irq);
>>
>>  	/*
>>  	 * Currently unexpected vectors happen only on SMP and APIC.
>> --
>> 2.11.0

