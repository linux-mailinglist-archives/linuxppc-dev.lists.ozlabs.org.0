Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E77CA19D5E2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 13:34:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tyXC6bmszDqfK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 22:34:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n/ujB5Gb; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tyLr4VBczDqXT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 22:26:44 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id r14so3328481pfl.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 04:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=8EqiMbUsXYeG9yH6GqFnb0WQImnRkyrpeOIRXy5bX+0=;
 b=n/ujB5GbtIIpbt3JflYJx+9+oBcaF5c6KIp2t3My3cerGsvea2wlvqx4T4GBWLZn/x
 6c4lG13Ay3ceCx/YTEaoXxuHxXNcK3MkLBtPiNn9JAx78bp7rqI0tzqzT6Zc5nVkHC2M
 QFPDCR6rLgWcaDD4LN9c47ZwPY9mNb59XBqU0e1thgST/aP8zvsIGehqq4yfOWwOX25a
 WVyQjpuSgxtxnwWmR0sfV3n9aKR89qu3utHcN/lZhR7zD4ttXeh2safDhzIulTBaYrwH
 kDsfUCYO33j0J2Ldrai+o1EWiBca4nyZ6Jw4E2VczAEwIopatLexrwJnUuqK590fw7Hz
 /D8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=8EqiMbUsXYeG9yH6GqFnb0WQImnRkyrpeOIRXy5bX+0=;
 b=GtiayJxDWu02eo1lGglM4209YkSnQQQvYansCZ3NsX9gih0J5TCQPe1ZM3VQ3PTXDn
 wvr23mnZbStFLESyTbOHsCYkl279hWsJd+bHlUyg5fQB177ZxwgqAsGB6RnkrJgF8Aqd
 YxtmOG4OpoRKL38tyGGfGBXLPd/pE1NpkUc2yKQNCWBdRWstMpLIjnH5ftSKbyGMizeq
 A4VQbvvogbyjmobd9zgWOqDsZ2iyfBzvWRxUPsUcIxyKrhgF75vAfOcplGERzZzh7N5p
 6LsxyLaJe2US44QgHsuV4Gjm0cmVkl5Ye8PUQTcy64bb5qgWDUsNi+VhH5O0NPdW7RrB
 JeiQ==
X-Gm-Message-State: AGi0PuaOwW4lLWaoIH1S0DqPoFluHfGD/oaVeQipcWPjgh7RRFZa2got
 VGIHuOGdq9AOyHZaOHDSKNs=
X-Google-Smtp-Source: APiQypJryYVP2bJFCWAGJyeYt8G4pH3FAscyrWs2nsOaa4xu2QlJUUTufWC94u9Pc9SLLWFpwhphyg==
X-Received: by 2002:a63:5fd8:: with SMTP id t207mr7477349pgb.186.1585913199745; 
 Fri, 03 Apr 2020 04:26:39 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id l5sm5173615pgt.10.2020.04.03.04.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 04:26:39 -0700 (PDT)
Date: Fri, 03 Apr 2020 21:26:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v11 3/8] powerpc/perf: consolidate read_user_stack_32
To: Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584620202.git.msuchanek@suse.de>
 <184347595442b4ca664613008a09e8cea7188c36.1584620202.git.msuchanek@suse.de>
 <1585039473.da4762n2s0.astroid@bobo.none>
 <20200324193833.GH25468@kitsune.suse.cz>
 <1585896170.ohti800w9v.astroid@bobo.none>
 <20200403105234.GX25468@kitsune.suse.cz>
In-Reply-To: <20200403105234.GX25468@kitsune.suse.cz>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585913065.zoacp2kzsv.astroid@bobo.none>
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
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek's on April 3, 2020 8:52 pm:
> Hello,
>=20
> there are 3 variants of the function
>=20
> read_user_stack_64
>=20
> 32bit read_user_stack_32
> 64bit read_user_Stack_32

Right.

> On Fri, Apr 03, 2020 at 05:13:25PM +1000, Nicholas Piggin wrote:
[...]
>>  #endif /* CONFIG_PPC64 */
>> =20
>> +static int read_user_stack_32(unsigned int __user *ptr, unsigned int *r=
et)
>> +{
>> +	return __read_user_stack(ptr, ret, sizeof(*ret));
> Does not work for 64bit read_user_stack_32 ^ this should be 4.
>=20
> Other than that it should preserve the existing logic just fine.

sizeof(int) =3D=3D 4 on 64bit so it should work.

Thanks,
Nick
=
