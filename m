Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 922634C42CD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 11:52:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4mnp5HzXz3bbT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 21:52:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V5B+L7kk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=V5B+L7kk; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4mn672q0z2yJw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 21:52:08 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 12so4368242pgd.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 02:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=lOPOPfTT4jvu98yCK4rpV6Lqqj8jf8x3i39DL5jIpco=;
 b=V5B+L7kkmOLNwj2gCGdaorIBzmt8oiMQhtgWPxwrvRkvEFR7f+5APv/FvxoYjgErTf
 ANTG3PR8iDx9n+Qah2R682GxFBWXV0HwfVyNAfa7oY08KBNLDcL28ZO98CmJAdeJ7A/T
 NRjzJ+xWm1qOW9WHfNoJnQE0tLzb75gxC82Qbcm/4BVbE3AIJE6I5eKzK5OOsblW0Ue+
 VY+VISqz+doRzyzG6VX8o5uXgIvb28TSs782rKyn3pzGkts23LVgUFLu+0EYAibXcffm
 xGQD8xv/J2F5Ccs6HJF3hwv+cksPeOrEvtg+VcssicUaGZUA/VGak4E82ATQ+heUcyUn
 CZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=lOPOPfTT4jvu98yCK4rpV6Lqqj8jf8x3i39DL5jIpco=;
 b=MM7ZwFd53et2L1zPGhf566i9VbioTucQnjQWUFqH/FBpWu2sKYJADKc8voat+mUuw8
 1UMp+XyFZ64xvPg/+fwcQHZOQpbG8iJQExh175+1PqrR9bE/QaJQ+k6yxPFQbf25lZSm
 5SwqPU410f8AM3dF1P5+KioRhoXlz3wNNfkoJbHWh4UtEAY07G2w40m7D7cVAbmuAeGj
 mF+ovmf3op4OzgjmJuzxIDD3RuJEbp+JerjVWpqEjmYt7IHUD4wdCh+mFoziZrdnLCDV
 ifzC033zGmpSAdqcNa1lS5TbjrqytxV4fLOh+go8gSpQ6L8uzzTymX4Xi7xveE65Ohsr
 MbVQ==
X-Gm-Message-State: AOAM532+b3QuVXwzgWQfTCmkEagX+07Otx2GpdEIZH7HpaZdvJNLLFJY
 wvYcWMXK3XPigT20jy49lNA=
X-Google-Smtp-Source: ABdhPJw1p3JpylPzwdPP9TEVvKcOyG6aC0IjbCbljtAOdMk1Nof42N6/33RGILbpNFCQaprbTYZTYA==
X-Received: by 2002:a63:e54d:0:b0:375:5987:af5d with SMTP id
 z13-20020a63e54d000000b003755987af5dmr5750991pgj.14.1645786325457; 
 Fri, 25 Feb 2022 02:52:05 -0800 (PST)
Received: from localhost (118-208-203-92.tpgi.com.au. [118.208.203.92])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a056a0024ce00b004f3c87df62bsm2729639pfv.81.2022.02.25.02.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 02:52:04 -0800 (PST)
Date: Fri, 25 Feb 2022 20:51:59 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
To: Arnd Bergmann <arnd@arndb.de>
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
 <1645670923.t0z533n7uu.astroid@bobo.none>
 <1645678884.dsm10mudmp.astroid@bobo.none>
 <20220224171207.GM614@gate.crashing.org>
 <1645748601.idp48wexp9.astroid@bobo.none>
 <CAK8P3a0feJOsKMNP0zCdPho5XdD+NXFceUTTe1X6dA9OdWQntQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0feJOsKMNP0zCdPho5XdD+NXFceUTTe1X6dA9OdWQntQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1645786002.lvhr18b39u.astroid@bobo.none>
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
Cc: Anders Roxell <anders.roxell@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "# 3.4.x" <stable@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Arnd Bergmann's message of February 25, 2022 6:33 pm:
> On Fri, Feb 25, 2022 at 1:32 AM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>> Excerpts from Segher Boessenkool's message of February 25, 2022 3:12 am:
>> >> +#ifdef CONFIG_CC_IS_GCC
>> >> +#if (GCC_VERSION >=3D 100000)
>> >> +#if (CONFIG_AS_VERSION =3D=3D 23800)
>> >> +asm(".machine any");
>> >> +#endif
>> >> +#endif
>> >> +#endif
>> >> +#endif /* __ASSEMBLY__ */
>> >
>> > Abusing toplevel asm like this is broken and you *will* end up with
>> > unhappiness all around.
>>
>> It actually unbreaks things and reduces my unhappiness. It's only done
>> for broken compiler versions and only where as does not have the
>> workaround for the breakage.
>=20
> It doesn't work with clang, which always passes explicit .machine
> statements around each inline asm, and it's also fundamentally
> incompatible with LTO builds. Generally speaking, you can't expect
> a top-level asm statement to have any effect inside of another
> function.

You have misunderstood my patch. It is not supposed to "work" with
clang and it explicitly is complied out of clang. It's not intended
to have any implementation independent meaning. It's working around
a very specific issue with specific versions of gcc, and that's what
it does.

It's also not intended to be the final solution, it's a workaround
hack. We will move away from -many of course. I will post it as a
series since which hopefully will make it less confusing to people.

Thanks,
Nick
