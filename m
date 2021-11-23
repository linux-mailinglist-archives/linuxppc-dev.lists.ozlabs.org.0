Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9007459B7C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 06:17:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyspV5CJ3z2ywv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 16:17:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B9Ul2ffC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=B9Ul2ffC; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hysnq1PGhz2xX0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 16:17:03 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id p17so17261714pgj.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 21:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=nMIda/GVtHF2sQ+5N9kCosjQ359vFrKXdNNulICpJ6s=;
 b=B9Ul2ffCsragWvZ+W15cB/uqoHfeQR63buK0hIT2epdiFGWb/6vnwKNWfh7iLHLICA
 AhCyO8cC51TVaAtBNOsQuVfIwMJgFHrdu4J3uQKM+IgIkppCWmqxLOmY9xYMb4Q5/a0R
 mXVRwylSHcQqZuK9w+K9uZVrm1k3o/QwOYs7eHbhz4clPi9Q9dl/t8wq7U5HbW9aUvNQ
 uiZ4c12F+RcxKhMzoxrZ0MWdO5l8QMB5kcJgtCpqa/f62+nk8fKMae+YDm4VAykjxbxk
 ghpA7XAlZ7eoB8gc+Ss3zR9EI0rjldoGY0Qe4giOzR/SQRkiibQfnLv45mfydY1iSMZr
 0Vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=nMIda/GVtHF2sQ+5N9kCosjQ359vFrKXdNNulICpJ6s=;
 b=1m9L8MYsno1uUx+xe4Xc+QWB1VUpWPyDX4kp/IU2A0L3sUbVBgbEm+qS2iMGI1f+Rv
 1t/BqzrKtet15C9B0eXC2NjdsfKMInI+Lh8qxQlttsULV+rQFV20R6BbYqiEcrp6CvRw
 mD2MnDMqu4f51UOxQTHGaMWqvb0wWawDwbwA+vl6B9HQXL+GLfVxwhfPN5NFf5BsXsjf
 8bCmplHovF1rYx1Xy8EQYk84xZO0jpO0ecMByuK50RWFMwTabOtcowSkO6X9ExzhVU8n
 OWCuk8N0UPyA8qJcKdqcJcAC4FCNC498UHT46IGoiFn8D3LLA3TV2BOcXrjZswi7hwr2
 oblQ==
X-Gm-Message-State: AOAM531oF4jJ2GXpjvMB4EM7noQUiaQjgFhLhVwtyyCvOSQ8pWvBCRrY
 iTkpq0hksNp0LXz8HeEgIqIimpgQYxxm4w==
X-Google-Smtp-Source: ABdhPJx62AWnLB61S6UGsXrb5xVo3wHsWXLUBfb6WZfWyoU8unqYgkuas/xZmNAIjko7p+XFsp7cVA==
X-Received: by 2002:a05:6a00:88b:b0:4a2:9c62:8865 with SMTP id
 q11-20020a056a00088b00b004a29c628865mr2613849pfj.46.1637644619912; 
 Mon, 22 Nov 2021 21:16:59 -0800 (PST)
Received: from localhost (220-244-84-117.tpgi.com.au. [220.244.84.117])
 by smtp.gmail.com with ESMTPSA id j6sm10786829pfu.205.2021.11.22.21.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 21:16:59 -0800 (PST)
Date: Tue, 23 Nov 2021 15:16:53 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64s: introduce CONFIG_MAXSMP to test very
 large SMP
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20211109065131.2041720-1-npiggin@gmail.com>
 <c363e53c-cba5-5711-e8c4-6d74c44f99be@csgroup.eu>
 <87ilwzm18j.fsf@mpe.ellerman.id.au> <87czmrr8hb.fsf@mpe.ellerman.id.au>
 <1637644417.rd9apgh5k7.astroid@bobo.none>
In-Reply-To: <1637644417.rd9apgh5k7.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1637644502.lzs9delw7v.astroid@bobo.none>
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

Excerpts from Nicholas Piggin's message of November 23, 2021 3:14 pm:
> Excerpts from Michael Ellerman's message of November 23, 2021 11:01 am:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>> Le 09/11/2021 =C3=A0 07:51, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> ...
>>>>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/pl=
atforms/Kconfig.cputype
>>>>> index a208997ade88..14c275e0ff93 100644
>>>>> --- a/arch/powerpc/platforms/Kconfig.cputype
>>>>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>>>>> @@ -475,9 +475,14 @@ config SMP
>>>>>  =20
>>>>>   	  If you don't know what to do here, say N.
>>>>>  =20
>>>>> +# MAXSMP sets 8192 if COMPILE_TEST because that's what x86 has flush=
ed out.
>>>>> +# Exceeding that will cause a lot of compile errors. Have to deal wi=
th those
>>>>> +# first.
>>>>>   config NR_CPUS
>>>>> -	int "Maximum number of CPUs (2-8192)" if SMP
>>>>> -	range 2 8192 if SMP
>>>>> +	int "Maximum number of CPUs (2-8192)" if SMP && !MAXSMP
>>>>> +	range 2 16384 if SMP
>>>>> +	default 16384 if MAXSMP && !COMPILE_TEST
>>>>> +	default 8192 if MAXSMP && COMPILE_TEST
>>>>
>>>> You can do less complex. First hit becomes the default, so you can do:
>>>>
>>>> 	default 8192 if MAXSMP && COMPILE_TEST
>>>> 	default 16384 if MAXSMP
>>>
>>> I did that when applying.
>>=20
>> But I'll have to drop it, it breaks the allyesconfig build:
>=20
> Ah, you still need patch 1/2 sorry I confused things by only re-sending=20
> this one.
>=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20211105035042.13=
98309-1-npiggin@gmail.com/

Actually KVM will also be broken, I sent a patch for it but there is=20
some discussion of fixing it a different way. So maybe leave out the
maxsmp patch for now (or make it depend on BROKEN?). I can re-send
maybe next merge window if the other pieces are in place.

If you could still take that ^^ patch for now would be good though.

Thanks,
Nick
