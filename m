Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F62B723CB4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 11:13:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb4Wd6xSrz3f3k
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 19:13:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IlaMjUX2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IlaMjUX2;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb4Vp6fHgz3bnM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 19:12:16 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b0424c5137so50953245ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 02:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686042734; x=1688634734;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33Fi3vxPpajECwlEk7e4drhNdlJkHqysepyRL3vjQ8k=;
        b=IlaMjUX2DEWSf62zBCcuw3sQibn/by5NfD7SCt0RqJD+KB8TcuJ18M+bnqtdWaWu6u
         iK26B/FnL9uq9zIbXeiGrrUp2yUuevhPXiQA2d0mTd0/e8xg+q8W0slYwwwWbu9Vbfij
         jSO85lmr/pYGkyBjW0xBauNQhLNIy63rRVjavAociiYC2p/m3gZRBi4mYpq1C3mLArVp
         kJsK+swdwSRCFQmGc1r7mybeBW2UhyomKrlRCwzIacgde2VHyS6Nhc/VIYHxisRkj454
         GjkSCrovXZ+GsBOnQaT08XHHOL236QhQ3DwHtrLLGAqy/WTNRIhaQQZyV72YNzJ6pPwN
         NxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686042734; x=1688634734;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=33Fi3vxPpajECwlEk7e4drhNdlJkHqysepyRL3vjQ8k=;
        b=LCfXPXgjfIS7E5wf5ci8LWoTl3UKwfSmZBwXL4FURF//pXwOUSsHoEJV9bxGqKf3vr
         lsmArYw2SD38VSeuqzBNocuFQztUWIroMSSeLDsA/FuAGboXxCAHMW6Uo9nqAIdKfbek
         k2iyQMW5cu1iVecdhpEgu4UNH0nl26XWnz1McZcsaR98qwr7JKI4FyMJMXFX02OCXA0d
         DE/oyJBlKyhbFJUqCAZx7Zd7oVNQsSBJBQm92mUizGBUCihblElXMTe+pukBSVbtt7q6
         ergMB/+Sjz4WD6hiaTXT9x2NQJ62hEq2VeChxb39bSKPUUh3EBtDv78tWV48WYSsHZke
         1Biw==
X-Gm-Message-State: AC+VfDxi4XC0nlOu6Ongmpjpq1d3A36Y4kCakkXfnOFru1hId8fYMVcl
	uWXdC/OhmbbzvXZPzBhCMsA=
X-Google-Smtp-Source: ACHHUZ54UH5/TGSxl0D32cNUSfJOXlgchtr7h6tK2bzJH50CbEBIfIcQ9/fVSaut+FV/AFQi/bLWMA==
X-Received: by 2002:a17:902:e5c4:b0:1ab:7fb:aac1 with SMTP id u4-20020a170902e5c400b001ab07fbaac1mr1848442plf.24.1686042733831;
        Tue, 06 Jun 2023 02:12:13 -0700 (PDT)
Received: from localhost (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id ik4-20020a170902ab0400b001b03a7a40e7sm8107255plb.19.2023.06.06.02.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 02:12:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Jun 2023 19:12:08 +1000
Message-Id: <CT5G9KKH2R25.3QSRZU8EQXUZU@wheely>
Subject: Re: [PATCH 2/4] powerpc/kuap: Avoid useless jump_label on empty
 function
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.14.0
References: <1a3c69e38349b687c6c65240d7c09a7817a797d8.1685963081.git.christophe.leroy@csgroup.eu> <c2c9660cc4441dc37c477ce5cf60707c971bd2a1.1685963081.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c2c9660cc4441dc37c477ce5cf60707c971bd2a1.1685963081.git.christophe.leroy@csgroup.eu>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jun 5, 2023 at 9:04 PM AEST, Christophe Leroy wrote:
> Disassembly of interrupt_enter_prepare() shows a pointless nop before the=
 mftb
>
>   c000abf0 <interrupt_enter_prepare>:
>   c000abf0:       81 23 00 84     lwz     r9,132(r3)
>   c000abf4:       71 29 40 00     andi.   r9,r9,16384
>   c000abf8:       41 82 00 28     beq-    c000ac20 <interrupt_enter_prepa=
re+0x30>
>   c000abfc: =3D=3D=3D>  60 00 00 00     nop	<=3D=3D=3D=3D
>   c000ac00:       7d 0c 42 e6     mftb    r8
>   c000ac04:       80 e2 00 08     lwz     r7,8(r2)
>   c000ac08:       81 22 00 28     lwz     r9,40(r2)
>   c000ac0c:       91 02 00 24     stw     r8,36(r2)
>   c000ac10:       7d 29 38 50     subf    r9,r9,r7
>   c000ac14:       7d 29 42 14     add     r9,r9,r8
>   c000ac18:       91 22 00 08     stw     r9,8(r2)
>   c000ac1c:       4e 80 00 20     blr
>   c000ac20:       60 00 00 00     nop
>   c000ac24:       7d 5a c2 a6     mfmd_ap r10
>   c000ac28:       3d 20 de 00     lis     r9,-8704
>   c000ac2c:       91 43 00 b0     stw     r10,176(r3)
>   c000ac30:       7d 3a c3 a6     mtspr   794,r9
>   c000ac34:       4e 80 00 20     blr
>
> That comes from the call to kuap_loc(), allthough __kuap_lock() is an emp=
ty
> function on the 8xx.
>
> To avoid that, only perform kuap_is_disabled() check when there is someth=
ing
> to do with __kuap_lock().
>
> Do the same with __kuap_save_and_lock() and __kuap_get_and_assert_locked(=
).

Too bad static branch nops can't be eliminated.

> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/incl=
ude/asm/book3s/64/kup.h
> index 54cf46808157..1b0215ff3710 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
> @@ -297,15 +297,7 @@ static inline unsigned long __kuap_get_and_assert_lo=
cked(void)
>  		WARN_ON_ONCE(amr !=3D AMR_KUAP_BLOCKED);
>  	return amr;
>  }
> -
> -/* Do nothing, book3s/64 does that in ASM */
> -static inline void __kuap_lock(void)
> -{
> -}
> -
> -static inline void __kuap_save_and_lock(struct pt_regs *regs)
> -{
> -}
> +#define __kuap_get_and_assert_locked __kuap_get_and_assert_locked

Maybe leave in /* __kuap_lock notrequired, book3s/64 does that in ASM */
? Seems okay though

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick
