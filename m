Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DEA924B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 15:23:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BvkH3dY4zDqBd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 23:23:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uukmvbbk"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BvRS3fR9zDqNv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 23:10:12 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id l21so1208752pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=T2LukpuT+xh5Ll4enNJTEQgUYRVE96b+G7S0bLMrkos=;
 b=UukmvbbkOhGHOTAw+gLfb1YRyyGoCjo8ZTznAFuZaf3CMlgwDq0oepmN+j7CfjsaYy
 J2Xeq2vM3e1OsJ6D9oNx+Tn2XYKoig6hFWba/31EnobySWk/CIFFHW07KOhyTlZj+isK
 aHAgjd+nRMfREuauYh7M3qed4YolwmPZS3kRPnPisdmPnelAol5tDQEismTpUejPYs4n
 J4cNe/lCUx0T3xvE1HA0DufAQ3Pu5q0dNm3TnomIg0jn/RFJmZyars/s0Cpr0QP3kvAB
 A0Sr59ePyYv8jzHZ+z49AuzfTUC5qcXSRTb91MPc5fm5wjDd64B228/pr90yWqmUEFvp
 raig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=T2LukpuT+xh5Ll4enNJTEQgUYRVE96b+G7S0bLMrkos=;
 b=AuFmG6EkhEZC6ThmSle4VgICs5NL7cn22FP9FvVk9HLFGjsM9Zsys1IXnoRQ92jXle
 mSf7au2ecUnS23H+PDuzuNQ0odWBJNmfVMXgiZAc4emn0CzWdInr5ao6ENm1V89Pl9AN
 nBZVElPXp/Qx+8X1OmOm69UPFEaFiysDoLkEeNHKyF/H4cpDhhQJS095GJ69nH86ZCtS
 8LvZfWRP9gIDSKFoifhmFrsTCLmfJmoTcJtneBulv3Y70Vu7hQaGcxZ0jvMu6zr5oHIW
 /7RUanNdegG687E59LgDP63yUpTLqcyuyNQ3owM+E+8+/nl58wGABdPZdse64A8vO0s1
 hh7A==
X-Gm-Message-State: APjAAAUnWHe4HAuN7hn2URruBx6ep5I2vBC1wZjxgZ12WsQdpNDfazcQ
 kD7tNLlj797lQyOU0cjyf0A=
X-Google-Smtp-Source: APXvYqy3msS65fdIQ+lMuQjp8IxyGbQcFpMlGpdKRrqBMwICAFY2xnWyuLtrffZqR4lYEPy6ot9wKg==
X-Received: by 2002:aa7:8498:: with SMTP id u24mr24322377pfn.61.1566220208991; 
 Mon, 19 Aug 2019 06:10:08 -0700 (PDT)
Received: from localhost ([58.84.106.74])
 by smtp.gmail.com with ESMTPSA id 2sm20318437pjh.13.2019.08.19.06.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 06:10:08 -0700 (PDT)
Date: Mon, 19 Aug 2019 23:09:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 09/44] powerpc/64s/pseries: machine check convert to
 use common event code
To: kbuild test robot <lkp@intel.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20190802105709.27696-10-npiggin@gmail.com>
 <201908081219.GBBn7JtE%lkp@intel.com>
 <875zmw7np7.fsf@concordia.ellerman.id.au>
In-Reply-To: <875zmw7np7.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566220067.5v0rnxwak0.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman's on August 17, 2019 8:25 am:
> kbuild test robot <lkp@intel.com> writes:
>> Hi Nicholas,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on linus/master]
>> [cannot apply to v5.3-rc3 next-20190807]
>> [if your patch is applied to the wrong git tree, please drop us a note t=
o help improve the system]
>>
>> url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc=
-64s-exception-cleanup-and-macrofiy/20190802-222211
>> config: powerpc-defconfig (attached as .config)
>> compiler: powerpc64-linux-gcc (GCC) 7.4.0
>> reproduce:
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # save the attached .config to linux build tree
>>         GCC_VERSION=3D7.4.0 make.cross ARCH=3Dpowerpc=20
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>    arch/powerpc/platforms/pseries/ras.c: In function 'mce_handle_error':
>>>> arch/powerpc/platforms/pseries/ras.c:563:28: error: this statement may=
 fall through [-Werror=3Dimplicit-fallthrough=3D]
>>        mce_err.u.ue_error_type =3D MCE_UE_ERROR_IFETCH;
>>        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
>>    arch/powerpc/platforms/pseries/ras.c:564:3: note: here
>>       case MC_ERROR_UE_PAGE_TABLE_WALK_IFETCH:
>>       ^~~~
>>    arch/powerpc/platforms/pseries/ras.c:565:28: error: this statement ma=
y fall through [-Werror=3Dimplicit-fallthrough=3D]
>>        mce_err.u.ue_error_type =3D MCE_UE_ERROR_PAGE_TABLE_WALK_IFETCH;
>>        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/powerpc/platforms/pseries/ras.c:566:3: note: here
>>       case MC_ERROR_UE_LOAD_STORE:
>>       ^~~~
>>    arch/powerpc/platforms/pseries/ras.c:567:28: error: this statement ma=
y fall through [-Werror=3Dimplicit-fallthrough=3D]
>>        mce_err.u.ue_error_type =3D MCE_UE_ERROR_LOAD_STORE;
>>        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/powerpc/platforms/pseries/ras.c:568:3: note: here
>>       case MC_ERROR_UE_PAGE_TABLE_WALK_LOAD_STORE:
>>       ^~~~
>>    arch/powerpc/platforms/pseries/ras.c:569:28: error: this statement ma=
y fall through [-Werror=3Dimplicit-fallthrough=3D]
>>        mce_err.u.ue_error_type =3D MCE_UE_ERROR_PAGE_TABLE_WALK_LOAD_STO=
RE;
>>        ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    arch/powerpc/platforms/pseries/ras.c:570:3: note: here
>>       case MC_ERROR_UE_INDETERMINATE:
>>       ^~~~
>>    cc1: all warnings being treated as errors
>=20
> I think you meant to break in all these cases?

Yes I did. I might have had a couple of other minor fixes in the
series and have since retested guest mce injection so I'd perhaps
better resend the series.

Thanks,
Nick
=
