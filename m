Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 501322F59B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 05:02:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGVyH26MKzDr0v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 15:02:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KZtxlPVn; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGVvk0t45zDrgP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 15:00:17 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id c79so2599455pfc.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 20:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=5FkF/Jm+W1MF0p8hdn7mrYiFhYCMvCMKVahC+/OJKSU=;
 b=KZtxlPVn5sefhlkFBuJ+NKZEzuwDqyKZp30zPwn32jg2jOvnW5TiIfCfcCk/d8EBpi
 usTq4FNoYfcMTafD0XpcI6wymvT5X2Uu9dHodiJSy3l6Uv6wA8Irkk6VEfFNkmICqAB6
 IxB9e4fcwkhV0VSlOZbecJ+duuQupPQxpP/RR2gAzf95MdyvhPdoKLcg6p6deMX6N8aI
 v/HxiQ4TGjCVdCbznOEoISpf63kCps3gURczNADynrTCAYkQOR9f+dPhWJVW8BTDzeFv
 byRHiuao5kwZaCVcAaAzAjjN49JxIE/UNXEfoO2rAuZtKu1CccrBUUnjrdBR6hfIgtLk
 AzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5FkF/Jm+W1MF0p8hdn7mrYiFhYCMvCMKVahC+/OJKSU=;
 b=MsROLZLyqw5+NwWFzon9OjFiIVbT+SrlbVKSyAb2do0pysG59ing7v/DrihTkX7noW
 UqKivn9f1nwsygFVXNiY/kpV0NY5+SRIv7I2dDnVYOQL+e2d5ryRB5DXLX2nQFc14131
 KU1fgZ67EfFwnmqeIxx4B6QIy4kCzMHBRmtRkyVjC74DaGIuuC7Il3XUFig9whJCERB/
 bNs01upHmnOtI0/NueCJ48eM+Yo1ObiGwXp7ou0Egal2WhBNnZTIJn0OHzcy/KS14d19
 6Y5PaWKzscCHH1ubkj6EsbzU+ncxX//3veqWdH0wfTMffrxx3uidfe3QAUetDUW0IWDB
 e8Lg==
X-Gm-Message-State: AOAM531MNdqV266fgFhzjVHDHSYV0mCYN5uKusSrGl8aoz9KSliQuytO
 PuV/SNZq7aEHLTF28g4biWnhPVipwak=
X-Google-Smtp-Source: ABdhPJxH5OtzzlTr05cK+YTaz+zuyVmsxL2fiEgxBnuzXATqwhvuJMw7mcgQSKFelBIjGBKWfYKjAQ==
X-Received: by 2002:a63:e4a:: with SMTP id 10mr5433585pgo.45.1610596814585;
 Wed, 13 Jan 2021 20:00:14 -0800 (PST)
Received: from localhost ([1.132.234.103])
 by smtp.gmail.com with ESMTPSA id c3sm4121495pfi.135.2021.01.13.20.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 20:00:14 -0800 (PST)
Date: Thu, 14 Jan 2021 14:00:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 18/21] powerpc: move NMI entry/exit code into wrapper
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-19-npiggin@gmail.com>
 <b8006c6e-0828-66b7-067f-cbfd0ddf99a1@csgroup.eu>
In-Reply-To: <b8006c6e-0828-66b7-067f-cbfd0ddf99a1@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1610596741.u4twtiygam.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of January 14, 2021 1:13 am:
>=20
>=20
> Le 13/01/2021 =C3=A0 08:32, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This moves the common NMI entry and exit code into the interrupt handler
>> wrappers.
>>=20
>> This changes the behaviour of soft-NMI (watchdog) and HMI interrupts, an=
d
>> also MCE interrupts on 64e, by adding missing parts of the NMI entry to
>> them.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/interrupt.h | 24 ++++++++++++++++
>>   arch/powerpc/kernel/mce.c            | 11 --------
>>   arch/powerpc/kernel/traps.c          | 42 +++++-----------------------
>>   arch/powerpc/kernel/watchdog.c       | 10 +++----
>>   4 files changed, 35 insertions(+), 52 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include=
/asm/interrupt.h
>> index e278dffe7657..01192e213f9a 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -95,14 +95,38 @@ static inline void interrupt_async_exit_prepare(stru=
ct pt_regs *regs, struct int
>>   }
>>  =20
>>   struct interrupt_nmi_state {
>> +#ifdef CONFIG_PPC64
>> +	u8 ftrace_enabled;
>> +#endif
>>   };
>>  =20
>>   static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, s=
truct interrupt_nmi_state *state)
>>   {
>> +#ifdef CONFIG_PPC64
>> +	state->ftrace_enabled =3D this_cpu_get_ftrace_enabled();
>> +	this_cpu_set_ftrace_enabled(0);
>> +#endif
>> +
>> +	/*
>> +	 * Do not use nmi_enter() for pseries hash guest taking a real-mode
>> +	 * NMI because not everything it touches is within the RMA limit.
>> +	 */
>> +	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
>> +			!firmware_has_feature(FW_FEATURE_LPAR) ||
>> +			radix_enabled() || (mfmsr() & MSR_DR))
>> +		nmi_enter();
>>   }
>>  =20
>>   static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, st=
ruct interrupt_nmi_state *state)
>>   {
>> +	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
>> +			!firmware_has_feature(FW_FEATURE_LPAR) ||
>> +			radix_enabled() || (mfmsr() & MSR_DR))
>> +		nmi_exit();
>> +
>> +#ifdef CONFIG_PPC64
>> +	this_cpu_set_ftrace_enabled(state->ftrace_enabled);
>> +#endif
>>   }
>>  =20
>>   /**
>> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
>> index 54269947113d..51456217ec40 100644
>> --- a/arch/powerpc/kernel/mce.c
>> +++ b/arch/powerpc/kernel/mce.c
>> @@ -592,12 +592,6 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
>>   DEFINE_INTERRUPT_HANDLER_NMI(machine_check_early)
>>   {
>>   	long handled =3D 0;
>> -	u8 ftrace_enabled =3D this_cpu_get_ftrace_enabled();
>> -
>> -	this_cpu_set_ftrace_enabled(0);
>> -	/* Do not use nmi_enter/exit for pseries hpte guest */
>> -	if (radix_enabled() || !firmware_has_feature(FW_FEATURE_LPAR))
>> -		nmi_enter();
>>  =20
>>   	hv_nmi_check_nonrecoverable(regs);
>>  =20
>> @@ -607,11 +601,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_early)
>>   	if (ppc_md.machine_check_early)
>>   		handled =3D ppc_md.machine_check_early(regs);
>>  =20
>> -	if (radix_enabled() || !firmware_has_feature(FW_FEATURE_LPAR))
>> -		nmi_exit();
>> -
>> -	this_cpu_set_ftrace_enabled(ftrace_enabled);
>> -
>>   	return handled;
>>   }
>>  =20
>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>> index b4f23e871a68..43d23232ef5c 100644
>> --- a/arch/powerpc/kernel/traps.c
>> +++ b/arch/powerpc/kernel/traps.c
>> @@ -435,11 +435,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception=
)
>>   {
>>   	unsigned long hsrr0, hsrr1;
>>   	bool saved_hsrrs =3D false;
>> -	u8 ftrace_enabled =3D this_cpu_get_ftrace_enabled();
>> -
>> -	this_cpu_set_ftrace_enabled(0);
>> -
>> -	nmi_enter();
>>  =20
>>   	/*
>>   	 * System reset can interrupt code where HSRRs are live and MSR[RI]=
=3D1.
>> @@ -511,10 +506,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception=
)
>>   		mtspr(SPRN_HSRR1, hsrr1);
>>   	}
>>  =20
>> -	nmi_exit();
>> -
>> -	this_cpu_set_ftrace_enabled(ftrace_enabled);
>> -
>>   	/* What should we do here? We could issue a shutdown or hard reset. *=
/
>>  =20
>>   	return 0;
>> @@ -792,6 +783,12 @@ int machine_check_generic(struct pt_regs *regs)
>>   #endif /* everything else */
>>  =20
>>  =20
>> +/*
>> + * BOOK3S_64 does not call this handler as a non-maskable interrupt
>> + * (it uses its own early real-mode handler to handle the MCE proper
>> + * and then raises irq_work to call this handler when interrupts are
>> + * enabled).
>> + */
>>   #ifdef CONFIG_PPC_BOOK3S_64
>>   DEFINE_INTERRUPT_HANDLER_ASYNC(machine_check_exception)
>>   #else
>> @@ -800,20 +797,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exceptio=
n)
>>   {
>>   	int recover =3D 0;
>>  =20
>> -	/*
>> -	 * BOOK3S_64 does not call this handler as a non-maskable interrupt
>> -	 * (it uses its own early real-mode handler to handle the MCE proper
>> -	 * and then raises irq_work to call this handler when interrupts are
>> -	 * enabled).
>> -	 *
>> -	 * This is silly. The BOOK3S_64 should just call a different function
>> -	 * rather than expecting semantics to magically change. Something
>> -	 * like 'non_nmi_machine_check_exception()', perhaps?
>> -	 */
>> -	const bool nmi =3D !IS_ENABLED(CONFIG_PPC_BOOK3S_64);
>> -
>> -	if (nmi) nmi_enter();
>> -
>>   	__this_cpu_inc(irq_stat.mce_exceptions);
>>  =20
>>   	add_taint(TAINT_MACHINE_CHECK, LOCKDEP_NOW_UNRELIABLE);
>> @@ -838,24 +821,17 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_excepti=
on)
>>   	if (check_io_access(regs))
>>   		goto bail;
>>  =20
>> -	if (nmi) nmi_exit();
>> -
>=20
> IIRC, not doing the nmi_exit() before the die() is problematic.
>=20
> See=20
> https://github.com/linuxppc/linux/commit/daf00ae71dad8aa05965713c62558aee=
bf2df48e#diff-70077148c383252ca949063eaf1b0250620e4607b43f4ef3fd2d8f448a83a=
b0a

Yes good catch. Maybe putting it into a nmi_die() or having die=20
explicitly check for the NMI case might be the go.

Thanks,
Nick
