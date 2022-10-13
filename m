Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D30D5FD43A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 07:23:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnybN0Mfbz3bjQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 16:23:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mDoghLF0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mDoghLF0;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnyZP6cXpz2xfV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 16:22:21 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id k9so430597pll.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 22:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KUigR7SJ7uFyr2yNbxpVBZqM/PTPgSSjnaooqgXQb4=;
        b=mDoghLF0CDSCPU4++bngkMIB3aPLTW4HOAtQe7zp1ltS3uBufcMoVWGDWMQyreLZCU
         yRFG6g2e1dv8StaRvGI1qiKcrVTtrdTgcObGTzaOyaRQdVRCmjZmXJA8P3jC/CbzchDb
         ch7WseAve+DRjfS54Oh1FMXR3TZtPI/r+xMlZqk5CPCEObseWIVTOL4MJgjGposWh41z
         xkmywKUlppn7VdLluqfkeGMXA3picuSrIEgPWd39GfFSPlAN+zF3m/IJpWBk6/Vnv4u9
         wsRZ4opeub7nggQVoOG3g6g7MiWnrORIzTEyL6E+iQESVjoKJxN2xvEX+Vb4SZuwXvZv
         z74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5KUigR7SJ7uFyr2yNbxpVBZqM/PTPgSSjnaooqgXQb4=;
        b=yupSUBmpvy2EiRorgO4O+y+ERazP2HZu+Jkw4LKAW9QIbRQ8G1Xdl6+jHBRNRSuQE4
         uFlgGhS/30JUNnIEoUaQ0ufFlAxyLoDhKevkaeOeeecyE7MdxFnJRJrW8i+Kgv62DjqM
         Ceoocbyf6uoepyFIBwc+0ljRRjHG4Yb77M7s2dmLrhM4iSuE1DXbB+9DDDsantmTj3fG
         cgWBLS6VCIGac9Y9EhIkVvM/7WJo5ow6gOz3bJrT0TMsAiXwCZcQBH9IZwjPaOif/qIA
         VJheF0e14Qo/UN2CQ29+hHAksp339XYkShw8ncaVHah1qTklm8R6lYTJzmKjDRxPqUEx
         HBPg==
X-Gm-Message-State: ACrzQf2Ds+mBa4gAoWxEg1XnGffuhC/KMAFQ3caK+ypjonLCyREHJnYG
	fJD2KiKli7wY6P7GN5SVXqs=
X-Google-Smtp-Source: AMsMyM4IE0OtdgMomYoWq+tu6m77qqVcqsJKqjqKRhI/OJqvgva+src7nCKPmMXCXbDUsqYT+YODkQ==
X-Received: by 2002:a17:902:e982:b0:17f:ca1f:aa44 with SMTP id f2-20020a170902e98200b0017fca1faa44mr32495020plb.76.1665638538944;
        Wed, 12 Oct 2022 22:22:18 -0700 (PDT)
Received: from localhost ([202.173.165.98])
        by smtp.gmail.com with ESMTPSA id h185-20020a62dec2000000b00561c6a4c1b0sm847441pfg.176.2022.10.12.22.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 22:22:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Oct 2022 15:22:05 +1000
Message-Id: <CNKJKV3GCTGF.18JF410CFEKR3@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Guenter Roeck" <linux@roeck-us.net>, "Michael Ellerman"
 <mpe@ellerman.id.au>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
X-Mailer: aerc 0.11.0
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net> <Y0biBtCUtc2mowbQ@zx2c4.com>
 <20221012164452.GA2990467@roeck-us.net> <Y0b3ZsTRHWG6jGK8@zx2c4.com>
 <20221012221615.GA364143@roeck-us.net> <87bkqgmvxl.fsf@mpe.ellerman.id.au>
 <20221013002148.GA535574@roeck-us.net>
In-Reply-To: <20221013002148.GA535574@roeck-us.net>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Oct 13, 2022 at 10:21 AM AEST, Guenter Roeck wrote:
> On Thu, Oct 13, 2022 at 11:03:34AM +1100, Michael Ellerman wrote:
> > Guenter Roeck <linux@roeck-us.net> writes:
> > > On Wed, Oct 12, 2022 at 11:20:38AM -0600, Jason A. Donenfeld wrote:
> > >>=20
> > >> I've also managed to not hit this bug a few times. When it triggers,
> > >> after "kprobes: kprobe jump-optimization is enabled. All kprobes are
> > >> optimized if possible.", there's a long hang - tens seconds before i=
t
> > >> continues. When it doesn't trigger, there's no hang at that point in=
 the
> > >> boot process.
> > >>=20
> > >
> > > I managed to bisect the problem. See below for results. Reverting the
> > > offending patch fixes the problem for me.
> >=20
> > Thanks.
> >=20
> > This is probably down to me/us not testing with PREEMPT enabled enough.
> >=20
> Not sure. My configuration has
>
> CONFIG_PREEMPT_NONE=3Dy
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set

Okay I reproduced it, just takes a while to hit.

Thanks,
Nick
