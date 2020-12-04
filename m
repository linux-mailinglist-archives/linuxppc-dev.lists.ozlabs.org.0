Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7009D2CE9A4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 09:32:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnQv66wVWzDrQY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 19:32:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sKIYa91o; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnQsZ42kvzDrHb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 19:31:28 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id w16so3074677pga.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 00:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=mgoPQC9tRjwydiY2nmOPwA0NQaeD1EaGmju9YTJww44=;
 b=sKIYa91ojaHBS76jxYPaQRrCgdT5aj2S83VVb2udf6VlkD6NmyyDEOMvSzvAJHwDbQ
 DV08xeH7f/+UF/VzJvHTNKqZPFHAZHwZmklq1bPa0H0nN1qwD/dGBnGIkGt3nKmGjUEu
 qXCq+pZTOWRUMAnKahD1GAPaA0kwCKMU/BlDwRPbt3TMoLO3We9qQxLdydQZhUVJsptF
 N3YORd4Vc9FLp8HN/JqDKUsriwoX+UcYr3ZcXKFhNMICRrItggGWUc2wlf4K/3bzObA2
 91HT4SSFBFvW+/Ko1KbSWNcuoOynsaj4uBW6ZPMXqRqkvIANO1YNnQS7m7dSnzZ9Em7/
 OfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=mgoPQC9tRjwydiY2nmOPwA0NQaeD1EaGmju9YTJww44=;
 b=OrEmbD6LQ14g8EWo/BitBt2BQ2N4kIpH9/krzh39EjTEbd4jFNJb0Pr1xqMh7lDd2M
 mvkQwzNYpatawLDNRjERDHLaHZlDi2aOPD2Gi5sS8dctC4q/gGEDCyVQkwMAWaxlfRfw
 F1ag8G2JMf4Nb9VViCfvd5Hi1oKpAkEfeeZ5LnCa0Hd4eF4OID4hyD9aywWSB2Skh8aR
 ZUKYmQpXuRq5NAcx6xlgZ+Oky/C7nVnYtGi/OevuDQ1yGF8l1D7bYeMQnQhKBFCQ/nS+
 jKam32hwVHaC2I5TrV+LzpMSjESXonmEvkkTI9R4g2kdoHfRIbd1cor5DyBJooOTdiEs
 In0w==
X-Gm-Message-State: AOAM533Al2RyOoHZWs61ejKRGXpqr6Z6PvJmgONiio7wXi8R8IbYVClr
 EcyhIw2n3caHjU3zL4UOqYA=
X-Google-Smtp-Source: ABdhPJzSNNA9/VSbuHp+QCli5omb9tviN0qgr9kmCKlLGCEsb9kOpXGP5yps6SRS8M+vwpHMO4jEqQ==
X-Received: by 2002:a62:7550:0:b029:19d:9945:984d with SMTP id
 q77-20020a6275500000b029019d9945984dmr2801352pfc.81.1607070684920; 
 Fri, 04 Dec 2020 00:31:24 -0800 (PST)
Received: from localhost ([1.129.133.131])
 by smtp.gmail.com with ESMTPSA id b20sm3688629pfi.218.2020.12.04.00.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 00:31:24 -0800 (PST)
Date: Fri, 04 Dec 2020 18:31:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 05/19] powerpc: interrupt handler wrapper functions
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20201128144114.944000-1-npiggin@gmail.com>
 <20201128144114.944000-6-npiggin@gmail.com> <87o8jfpa5k.fsf@linux.ibm.com>
In-Reply-To: <87o8jfpa5k.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1607069681.jta0szxqr9.astroid@bobo.none>
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

Excerpts from Aneesh Kumar K.V's message of November 30, 2020 5:37 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
> .....
>  +#endif
>> +DECLARE_INTERRUPT_HANDLER(emulation_assist_interrupt);
>> +DECLARE_INTERRUPT_HANDLER_RAW(do_slb_fault);
>=20
> Can we add comments here explaining why some of these handlers need to re=
main RAW()?

I possibly could. My patch doesn't change the reason, of course, they=20
already have these issues.

It wants to avoid reconciling interrupts and probably context tracking=20
because you can take SLB faults within those subsystems, which are not=20
expecting re-entrant calls into them. It's okay to avoid these things=20
because the interrupts don't enable interrupts, go to process context,=20
add any timers, etc.

Now that I look at it, possibly the primary do_hash_fault handler needs=20
to be RAW as well for the same reason.

=20
>> +DECLARE_INTERRUPT_HANDLER(do_bad_slb_fault);
>> +DECLARE_INTERRUPT_HANDLER_RET(do_hash_fault);
>> +DECLARE_INTERRUPT_HANDLER_RET(do_page_fault);
>> +DECLARE_INTERRUPT_HANDLER(do_bad_page_fault);
>> +
>> +DECLARE_INTERRUPT_HANDLER_ASYNC(timer_interrupt);
>> +DECLARE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi);
>> +DECLARE_INTERRUPT_HANDLER_ASYNC(performance_monitor_exception_async);
>> +DECLARE_INTERRUPT_HANDLER_RAW(performance_monitor_exception);
>=20
> Same for this.

That's just because nmi vs async is decided at runtime for PMIs. I can=20
add a comment, although it's more obvious when looking at the body.

Thanks,
Nick
