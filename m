Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F4C1A05C4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 06:29:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xDvR09mKzDqvt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 14:29:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UHDmoUle; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xDsv5bJrzDqpv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 14:28:01 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id g2so761541plo.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 21:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=i3bKYfV/4jZF7tsEOkVKqa3SzWQ1c87ZO/XBGLZDoVA=;
 b=UHDmoUleEPArt27TgAQoTmiOc2G7JFtk9b9qD51pFqMZro6t39rs0tK3mFmIx6DXMn
 CxUOWHbVfCDsPakIAMdmZRJjUtSfDzk7iv2+22wenWVZESHLd28so2v3aHQvqpe7nHHR
 MBsBjFk/hLrbJ6j6kV3PpIFM3GqaukhsBirF9A7XoSBIzzVmsrCCon16xfyhsPcuhTtH
 YLJzkH4aXOCLXzdQRQLbMS5QQj4GwmiEcKdLI7j6RoE45J4aclFuQWtGGqIV6jijGn0k
 eGuNjfNQvOWa3fQJkbbEn6hBTfL+fLsJ6H/0dYK3IpAFCVkSn3dX4jKLy3bm8zb+9rHY
 lSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=i3bKYfV/4jZF7tsEOkVKqa3SzWQ1c87ZO/XBGLZDoVA=;
 b=ZIjFAphdFk1HZr/ZP/9ACpaYysU7gv+C8Y5Jc4WBg44dWrgY4/lpozF+kkNU44CGUD
 ff9IhkSKNdTsi1iWXZFaULNUo5zh7pMmblQpBxe9S8Vzj+sF2nX8B7jLCJbV+XVT3nAH
 nUL42hA500/XeNNEUTjm3vNumbTeR2m/U/HovmPvvdIbfwzma5MiUuSof+Ryc+6VIXE9
 4kj8hknnsmFVbQg9TLTRqLeLiapfFtws9hCCHo19pPZNFIjbdUKBxEVnSz5nSe5gQeaU
 iSHPhQ2hVHHGgMRse/GvL/Lq6V+XNW06Sjtf/180wWGsNA2jE4n61jKEYo1M2IzPS5N5
 7rlw==
X-Gm-Message-State: AGi0Pua9SeAiSPB6llR7wtWbtbck+Cenz2ZQax5kvVsKbNCJkEoCrI4e
 5GPyx7TWF7ZXu0FTDUCZzNc=
X-Google-Smtp-Source: APiQypLxwA5EbVYxtNWH4Mz6pSQ5+R3v7/AbYYFDMJePkypxSI7gwMlN7K9UtLpHff0wSOQ5bkc7Kw==
X-Received: by 2002:a17:90a:36c7:: with SMTP id
 t65mr428137pjb.182.1586233676415; 
 Mon, 06 Apr 2020 21:27:56 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id a71sm13304397pfa.162.2020.04.06.21.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 21:27:55 -0700 (PDT)
Date: Tue, 07 Apr 2020 14:26:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 08/14] powerpc/pseries/ras: fwnmi sreset should not
 interlock
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20200403132622.130394-1-npiggin@gmail.com>
 <20200403132622.130394-9-npiggin@gmail.com>
 <3317c637-3b5a-22d3-e9ee-15f7eb48b217@c-s.fr>
In-Reply-To: <3317c637-3b5a-22d3-e9ee-15f7eb48b217@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586233544.vicwl302ui.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on April 4, 2020 12:35 am:
>=20
>=20
> Le 03/04/2020 =C3=A0 15:26, Nicholas Piggin a =C3=A9crit=C2=A0:
>> PAPR does not specify that fwnmi sreset should be interlocked, and
>> PowerVM (and therefore now QEMU) do not require it.
>>=20
>> These "ibm,nmi-interlock" calls are ignored by firmware, but there
>> is a possibility that the sreset could have interrupted a machine
>> check and release the machine check's interlock too early, corrupting
>> it if another machine check came in.
>>=20
>> This is an extremely rare case, but it should be fixed for clarity
>> and reducing the code executed in the sreset path. Firmware also
>> does not provide error information for the sreset case to look at, so
>> remove that comment.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/platforms/pseries/ras.c | 48 ++++++++++++++++++++--------
>>   1 file changed, 34 insertions(+), 14 deletions(-)
>>=20
>> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platfor=
ms/pseries/ras.c
>> index a40598e6e525..833ae34b7fec 100644
>> --- a/arch/powerpc/platforms/pseries/ras.c
>> +++ b/arch/powerpc/platforms/pseries/ras.c
>> @@ -406,6 +406,20 @@ static inline struct rtas_error_log *fwnmi_get_errl=
og(void)
>>   	return (struct rtas_error_log *)local_paca->mce_data_buf;
>>   }
>>  =20
>> +static unsigned long *fwnmi_get_savep(struct pt_regs *regs)
>> +{
>> +	unsigned long savep_ra;
>> +
>> +	/* Mask top two bits */
>> +	savep_ra =3D regs->gpr[3] & ~(0x3UL << 62);
>> +	if (!VALID_FWNMI_BUFFER(savep_ra)) {
>> +		printk(KERN_ERR "FWNMI: corrupt r3 0x%016lx\n", regs->gpr[3]);
>=20
> Can't you use pr_err() instead ?

I think so.

>> +		return NULL;
>> +	}
>> +
>> +	return __va(savep_ra);
>> +}
>> +
>>   /*
>>    * Get the error information for errors coming through the
>>    * FWNMI vectors.  The pt_regs' r3 will be updated to reflect
>> @@ -423,20 +437,15 @@ static inline struct rtas_error_log *fwnmi_get_err=
log(void)
>>    */
>>   static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
>>   {
>> -	unsigned long savep_ra;
>>   	unsigned long *savep;
>>   	struct rtas_error_log *h;
>>  =20
>> -	/* Mask top two bits */
>> -	savep_ra =3D regs->gpr[3] & ~(0x3UL << 62);
>> -
>> -	if (!VALID_FWNMI_BUFFER(savep_ra)) {
>> -		printk(KERN_ERR "FWNMI: corrupt r3 0x%016lx\n", regs->gpr[3]);
>> +	savep =3D fwnmi_get_savep(regs);
>> +	if (!savep)
>>   		return NULL;
>> -	}
>>  =20
>> -	savep =3D __va(savep_ra);
>> -	regs->gpr[3] =3D be64_to_cpu(savep[0]);	/* restore original r3 */
>> +	/* restore original r3 */
>> +	regs->gpr[3] =3D be64_to_cpu(savep[0]);
>=20
> Is it needed to change the location of the comment ?

No, I originally had other changes I think. Will fix.

Thanks,
Nick
=
