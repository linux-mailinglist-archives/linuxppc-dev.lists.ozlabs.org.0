Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B08B19D456
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 11:50:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48twD95KCFzDrfm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 20:50:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nLRJFbXv; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tw3f6xt7zDrVY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 20:43:26 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id nu11so2719529pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 02:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=V/K/TopxgY/8Pfa0UGk/d52N4S8WjM3ZtpLq5otXWDg=;
 b=nLRJFbXvcnX9KjvdLeliIAClVlFBtpYf8dR/MOzxugDqqjEXaG3M2s3fBH0MUS9vNl
 d5byJptunL4LzCTFbC9z/84HwBQ1XTwCd7b9+4Dx/pkLAD5W7BqzYV9C6f9W9hyDuDI3
 wkGbtWVXIOj7PO/cvaGLBfMEGyzAJJuFPZZgGGpVy8UancS6V/Vjke33v7+8zZyV6ggx
 o4gkQGK7Z3zyxFFUHfOyX2crEth42imqyskO6rQ5RoklbXr6KsoCUwC9cXbEAxE4w47A
 AMrpHAzlMfhfcer8ERrz9Vt6D0iZ2jLL6pk6QBj5Ttb49GrYdTTPH4r3xloaJ/Zaq+RK
 qjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=V/K/TopxgY/8Pfa0UGk/d52N4S8WjM3ZtpLq5otXWDg=;
 b=s7/TKFEj2jxtV4IqIGGt15E/Qz1DRsXycdVpvQZMlOfmgDDDecpiakOSRIZvZdhpmo
 /dmQ97zAEf7K02x9ztpqK5liGm1lnHVZsqdIAojj+aht1+AwytHTDma/+jF56Va1DPmQ
 saebKOD69/tvm99Oqje/TB/8PKJlMSWH37pcQXlbDMviTW7B2dxSiMSUFo/6J26m+oAq
 tY5JocgsKCMxhoSJbP5Hb860kJyy6G19AQuFHWLY0dK+Oqumj8/fYf02mhS1DVY/U1Jw
 puHVAFghC+q3J3sgJgWlCUjKczm8sNchjGT2poPcRYP/qV7KcAoftf+JU5cBEHcY7Zr8
 0WCw==
X-Gm-Message-State: AGi0PuZF7gBiHxR3WKRLfUSN4FyqybUHRuCe4n20BsKR1kVtRxeAgKbr
 xlY8odGgYALn418xtv8XW4s=
X-Google-Smtp-Source: APiQypKgzaEPql2QfLHfMCXRc3y1MZ8BdRgQhdTYpTU2xjaKbIbFQwq80Rz6RMeOZ9XNFArJ+MVGPA==
X-Received: by 2002:a17:902:9f84:: with SMTP id g4mr7276136plq.2.1585907002336; 
 Fri, 03 Apr 2020 02:43:22 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id w205sm5432553pfc.75.2020.04.03.02.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 02:43:21 -0700 (PDT)
Date: Fri, 03 Apr 2020 19:43:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v11 0/8] Disable compat cruft on ppc64le v11
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org, 
 Michal Suchanek <msuchanek@suse.de>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584620202.git.msuchanek@suse.de>
 <1585898335.tckaz04a6x.astroid@bobo.none>
 <1e00a725-9710-2b80-4aff-2f284b31d2e5@c-s.fr>
In-Reply-To: <1e00a725-9710-2b80-4aff-2f284b31d2e5@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585906885.3dbukubyr8.astroid@bobo.none>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Rob Herring <robh@kernel.org>,
 Michael Neuling <mikey@neuling.org>, Eric Richter <erichte@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on April 3, 2020 5:26 pm:
>=20
>=20
> Le 03/04/2020 =C3=A0 09:25, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Michal Suchanek's on March 19, 2020 10:19 pm:
>>> Less code means less bugs so add a knob to skip the compat stuff.
>>>
>>> Changes in v2: saner CONFIG_COMPAT ifdefs
>>> Changes in v3:
>>>   - change llseek to 32bit instead of builing it unconditionally in fs
>>>   - clanup the makefile conditionals
>>>   - remove some ifdefs or convert to IS_DEFINED where possible
>>> Changes in v4:
>>>   - cleanup is_32bit_task and current_is_64bit
>>>   - more makefile cleanup
>>> Changes in v5:
>>>   - more current_is_64bit cleanup
>>>   - split off callchain.c 32bit and 64bit parts
>>> Changes in v6:
>>>   - cleanup makefile after split
>>>   - consolidate read_user_stack_32
>>>   - fix some checkpatch warnings
>>> Changes in v7:
>>>   - add back __ARCH_WANT_SYS_LLSEEK to fix build with llseek
>>>   - remove leftover hunk
>>>   - add review tags
>>> Changes in v8:
>>>   - consolidate valid_user_sp to fix it in the split callchain.c
>>>   - fix build errors/warnings with PPC64 !COMPAT and PPC32
>>> Changes in v9:
>>>   - remove current_is_64bit()
>>> Chanegs in v10:
>>>   - rebase, sent together with the syscall cleanup
>>> Changes in v11:
>>>   - rebase
>>>   - add MAINTAINERS pattern for ppc perf
>>=20
>> These all look good to me. I had some minor comment about one patch but
>> not really a big deal and there were more cleanups on top of it, so I
>> don't mind if it's merged as is.
>>=20
>> Actually I think we have a bit of stack reading fixes for 64s radix now
>> (not a bug fix as such, but we don't need the hash fault logic in radix)=
,
>> so if I get around to that I can propose the changes in that series.
>>=20
>=20
> As far as I can see, there is a v12

For the most part I was looking at the patches in mpe's next-test
tree on github, if that's the v12 series, same comment applies but
it's a pretty small nitpick.

Thanks,
Nick
=
