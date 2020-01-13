Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 547FF138C15
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 07:54:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47x48N1H4MzDqKD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 17:54:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=NVd27d+g; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47x4605G2SzDqK3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 17:52:38 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47x45m5vGSz9ttgG;
 Mon, 13 Jan 2020 07:52:28 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=NVd27d+g; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1iwCVC8X-I0R; Mon, 13 Jan 2020 07:52:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47x45m4fd0z9ttgD;
 Mon, 13 Jan 2020 07:52:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578898348; bh=BEG+waaqceEGqvmTkmRPJ8Qzyso8PEjwXnIakVOqtZc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NVd27d+gFiIyUuKl/HLoK+La1AiiYRZnEQtAMYVLE60YGvnlTuLzA+Zj2M0GA+Ket
 FpVfMNKOrYwhgR+zTPLHtu0BWa6zZ6Ph7297vQIxUho+xhYLUTI/NMu1Gj3zsDCx0k
 Uvvo9nAJ3jOmw8RlqvoHHkfMpgYirFnUFWki46WU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 30D588B79C;
 Mon, 13 Jan 2020 07:52:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gGYtxlUDGq_J; Mon, 13 Jan 2020 07:52:33 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AD2CA8B752;
 Mon, 13 Jan 2020 07:52:32 +0100 (CET)
Subject: Re: [RFC PATCH v2 07/10] lib: vdso: don't use READ_ONCE() in
 __c_kernel_time()
To: Thomas Gleixner <tglx@linutronix.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 arnd@arndb.de, vincenzo.frascino@arm.com, luto@kernel.org
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <fc1ff722c7cbe63a63ae02ade3a714d2049d54a5.1577111367.git.christophe.leroy@c-s.fr>
 <87lfqfrp7d.fsf@nanos.tec.linutronix.de>
 <a995445f-9b00-ca13-d23a-1aea3b345718@c-s.fr>
 <878smes13d.fsf@nanos.tec.linutronix.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <dfd30b00-5d5c-29c3-6b91-aac0533635ca@c-s.fr>
Date: Mon, 13 Jan 2020 07:52:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <878smes13d.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/01/2020 à 12:07, Thomas Gleixner a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>
>> With READ_ONCE() the 64 bits are being read:
>>
>> Without the READ_ONCE() only 32 bits are read. That's the most optimal.
>>
>> Without READ_ONCE() but with a barrier() after the read, we should get
>> the same result but GCC (GCC 8.1) does less good:
>>
>> Assuming both part of the 64 bits data will fall into a single
>> cacheline, the second read is in the noise.
> 
> They definitely are in the same cacheline.
> 
>> So agreed to drop this change.
> 
> We could be smart about this and force the compiler to issue a 32bit
> read for 32bit builds. See below. Not sure whether it's worth it, but
> OTOH it will take quite a while until the 32bit time interfaces die
> completely.

I don't think it is worth something so big to just save 1 or 2 cycles in 
time() function. Lets keep it as it is.

Thanks,
Christophe

> 
> Thanks,
> 
>          tglx
> 
> 8<------------
> --- a/include/vdso/datapage.h
> +++ b/include/vdso/datapage.h
> @@ -21,6 +21,18 @@
>   #define CS_RAW		1
>   #define CS_BASES	(CS_RAW + 1)
>   
> +#ifdef __LITTLE_ENDIAN
> +struct sec_hl {
> +	u32	sec_l;
> +	u32	sec_h;
> +};
> +#else
> +struct sec_hl {
> +	u32	sec_h;
> +	u32	sec_l;
> +};
> +#endif
> +
>   /**
>    * struct vdso_timestamp - basetime per clock_id
>    * @sec:	seconds
> @@ -35,7 +47,10 @@
>    * vdso_data.cs[x].shift.
>    */
>   struct vdso_timestamp {
> -	u64	sec;
> +	union {
> +		u64		sec;
> +		struct sec_hl	sec_hl;
> +	};
>   	u64	nsec;
>   };
>   
> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -165,8 +165,13 @@ static __maybe_unused int
>   static __maybe_unused __kernel_old_time_t __cvdso_time(__kernel_old_time_t *time)
>   {
>   	const struct vdso_data *vd = __arch_get_vdso_data();
> -	__kernel_old_time_t t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
> +	__kernel_old_time_t t;
>   
> +#if BITS_PER_LONG == 32
> +	t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec_hl.sec_l);
> +#else
> +	t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
> +#endif
>   	if (time)
>   		*time = t;
>   
> 
