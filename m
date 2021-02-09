Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE55C3149B2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 08:49:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZZm12kCYzDsfx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 18:49:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=maYtn3P9; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZZkD4WdSzDsjK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 18:47:47 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id lw17so1104204pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 23:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Sw+D04FxQESw3m6uQcc0VHFi2inijPDZKTO4JQU53d8=;
 b=maYtn3P96HXK4McUmKdpavzn4JbWCicCnSI2ob9q6dqwzDB9Ov2YVOnDTYPZw7OQ3e
 IV/2qEgXVWHUX/tiK68cZaAbenN1g8PMgYx2ceeeTuuJtc9VzfysXZ6BnzHHWqtBe2kr
 whMwQDpFlbAl31Nf30DdcsIKCe3HougIjkjtCwaRZtWGnE99AdwHM6R5RiXmXwXmUSzw
 IX6Lze92/868b9XdaQ1R5TTkiL6M4NuxNlcLVrVyq3WzUE3npgrpvVncmPIOY9rMcVOU
 s/oOmicCf9xChAAazvu/uzCmixw+/gDcgI06Lwiji1g/hA4jMcdXQBjoQp3RPoYQGKod
 tnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Sw+D04FxQESw3m6uQcc0VHFi2inijPDZKTO4JQU53d8=;
 b=gyVKkDzZWWWmBRyF7BF8eF+0rUwvaHWHod6esr8vLisgdokvbQ6QDVfQD6IfBVZhEL
 Y/AVWgGfasbAADm/5QmHxpqlswsuP2rh2Y11RNF2/KHv8mi+PxoJ6tcOG7QMAEih8/dx
 XuvHseShMf7gUSlG3zJKOdwVF23qfjZAKsJZq1u4EaNL9jHbxitaBZYqOeJHfumVoxF3
 mSyCWTuU9glwdxTZ4+R6UgMFhM/MZZ5PPL+R+XaZO054orwUCgxgThG3ye757uUKIhwm
 Uzm6UDuUiWNeof1jgQeVqd5awEC3SXLDFYR16nkVvTnD73Tw1Dn4gx3Hdlc7FDXKmnym
 tmmA==
X-Gm-Message-State: AOAM533wL8rQ4icyHVBpkbBEwHXp77iAKCo7VLUtwLAx6bPybO422UiW
 /rna34C5lZ/br41mZGyyVN4=
X-Google-Smtp-Source: ABdhPJwXxN2EeGsp60OK0hOlof69SdyIHtGs1F5hh/x7SUxNhBBnvG1Hiue7Az95+7dXdzv2NDlTfQ==
X-Received: by 2002:a17:902:c242:b029:e1:8332:f14e with SMTP id
 2-20020a170902c242b02900e18332f14emr20018001plg.41.1612856865158; 
 Mon, 08 Feb 2021 23:47:45 -0800 (PST)
Received: from localhost ([1.132.148.226])
 by smtp.gmail.com with ESMTPSA id q2sm6203960pfs.62.2021.02.08.23.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 23:47:44 -0800 (PST)
Date: Tue, 09 Feb 2021 17:47:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 05/22] powerpc/irq: Add helper to set regs->softe
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <5f37d1177a751fdbca79df461d283850ca3a34a2.1612796617.git.christophe.leroy@csgroup.eu>
 <1612832745.vhjk6358hf.astroid@bobo.none>
 <258ac0c6-ef40-86d4-2ce4-772cfc4a95e5@csgroup.eu>
In-Reply-To: <258ac0c6-ef40-86d4-2ce4-772cfc4a95e5@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612856784.to2q8afcd9.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 9, 2021 3:57 pm:
>=20
>=20
> Le 09/02/2021 =C3=A0 02:11, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
>>> regs->softe doesn't exist on PPC32.
>>>
>>> Add irq_soft_mask_regs_set_state() helper to set regs->softe.
>>> This helper will void on PPC32.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   arch/powerpc/include/asm/hw_irq.h | 11 +++++++++--
>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/a=
sm/hw_irq.h
>>> index 614957f74cee..ed0c3b049dfd 100644
>>> --- a/arch/powerpc/include/asm/hw_irq.h
>>> +++ b/arch/powerpc/include/asm/hw_irq.h
>>> @@ -38,6 +38,8 @@
>>>   #define PACA_IRQ_MUST_HARD_MASK	(PACA_IRQ_EE)
>>>   #endif
>>>  =20
>>> +#endif /* CONFIG_PPC64 */
>>> +
>>>   /*
>>>    * flags for paca->irq_soft_mask
>>>    */
>>> @@ -46,8 +48,6 @@
>>>   #define IRQS_PMI_DISABLED	2
>>>   #define IRQS_ALL_DISABLED	(IRQS_DISABLED | IRQS_PMI_DISABLED)
>>>  =20
>>> -#endif /* CONFIG_PPC64 */
>>> -
>>>   #ifndef __ASSEMBLY__
>>>  =20
>>>   #ifdef CONFIG_PPC64
>>> @@ -287,6 +287,10 @@ extern void irq_set_pending_from_srr1(unsigned lon=
g srr1);
>>>  =20
>>>   extern void force_external_irq_replay(void);
>>>  =20
>>> +static inline void irq_soft_mask_regs_set_state(struct pt_regs *regs, =
unsigned long val)
>>> +{
>>> +	regs->softe =3D val;
>>> +}
>>>   #else /* CONFIG_PPC64 */
>>>  =20
>>>   static inline unsigned long arch_local_save_flags(void)
>>> @@ -355,6 +359,9 @@ static inline bool arch_irq_disabled_regs(struct pt=
_regs *regs)
>>>  =20
>>>   static inline void may_hard_irq_enable(void) { }
>>>  =20
>>> +static inline void irq_soft_mask_regs_set_state(struct pt_regs *regs, =
unsigned long val)
>>> +{
>>> +}
>>>   #endif /* CONFIG_PPC64 */
>>>  =20
>>>   #define ARCH_IRQ_INIT_FLAGS	IRQ_NOREQUEST
>>=20
>> What I don't like about this where you use it is it kind of pollutes
>> the ppc32 path with this function which is not valid to use.
>>=20
>> I would prefer if you had this purely so it could compile with:
>>=20
>>    if (IS_ENABLED(CONFIG_PPC64)))
>>        irq_soft_mask_regs_set_state(regs, blah);
>>=20
>> And then you could make the ppc32 cause a link error if it did not
>> get eliminated at compile time (e.g., call an undefined function).
>>=20
>> You could do the same with the kuap_ functions to change some ifdefs
>> to IS_ENABLED.
>>=20
>> That's just my preference but if you prefer this way I guess that's
>> okay.
>=20
> I see you didn't change your mind since last April :)
>=20
> I'll see what I can do.

If you have more patches in the works and will do some cleanup passes I=20
don't mind so much.

Thanks,
Nick
