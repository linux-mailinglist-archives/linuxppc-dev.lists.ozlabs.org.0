Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF90519D14A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 09:32:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ts926vR6zDsNT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 18:32:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i3oPTvsH; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ts0R40KtzDrqb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 18:25:27 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id nu11so2582703pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 00:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=gWN2/l3Nk/lqsKPF1eViKQ9o9AZt+XSnO9fYcexJ5do=;
 b=i3oPTvsH5TefcZSZ/s6cffxKNlmPapTR0Q18gP6u0mf/PMRHwDbL2wMinlbhvtjzE9
 KMyVIR96vM2c4ZYzaRNYjWN2UL+Dd+CnEUla7XPaBIMJ/hslJUXLoqHnMKXgJfJC9IAp
 OWDPIN7DJ5qcvEKf2xLRfjwt1xPzCT3PfRjdbUbFXzbRM2Lb4wXi9irkzkWffxvnc5/F
 KB8eJVttUWM3vacwK3+R777MHdc+WXvEqYKX1ZvYy5AL6Y45SbW/W9WZN1ICx/edWvmk
 cLVPOd0BXu7Au8JXVDcwD5lTyHkgsWxs4z96cAVY0rv4QN5ptCxTRrZQkCNYJSUEJyyn
 L6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=gWN2/l3Nk/lqsKPF1eViKQ9o9AZt+XSnO9fYcexJ5do=;
 b=LepkX58eDcSmk07cuQV1w5u2aNbIKxGGGLfIQuoFt10gGGiK2aZx8bAtHXC4TZATsW
 KE1fLzexFE0A7OFTxTrYZZyvqM+A8C6xdOfZ87uM6PRbR9PNWwEtlHke2YBQsbaagubo
 cc40+LksI+FaJG0axPSpeOBT75esS5oyIFK/G1T0skw7K0mh2a8pcxQblcxe8uekiJcR
 z8Ee9KCx3dNnA9KV9fF9onbsLbCfyq5LIOp46+uoQxXqNKaG1sJzaWUwNOXkWRIT4izm
 9G2EQ9IhLYiE/XHfd3Zoon9ynVGVQ3pKXoP5StaGRIsEbhFxplF4wPwQ4vUcrCEHzxO6
 3dTg==
X-Gm-Message-State: AGi0PuZQPHM9u8ufzZW/qWAXPuvHP7WzfRfn9xcVcBsHaUxNOvD49OfU
 q2Sy/PLUr5NbvVzN1gUvOJSmoxqs
X-Google-Smtp-Source: APiQypLvOn0Dugjcw4rcQbIFXLiJdhks1PnmfqUpwNAhu3DD4RMhhi5GkyAqP+L0q44XeXBvYh6XbQ==
X-Received: by 2002:a17:90a:35ce:: with SMTP id
 r72mr8190743pjb.126.1585898719557; 
 Fri, 03 Apr 2020 00:25:19 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id l190sm5103624pfl.212.2020.04.03.00.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 00:25:18 -0700 (PDT)
Date: Fri, 03 Apr 2020 17:25:13 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v11 0/8] Disable compat cruft on ppc64le v11
To: linuxppc-dev@lists.ozlabs.org, Michal Suchanek <msuchanek@suse.de>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584620202.git.msuchanek@suse.de>
In-Reply-To: <cover.1584620202.git.msuchanek@suse.de>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585898335.tckaz04a6x.astroid@bobo.none>
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

Michal Suchanek's on March 19, 2020 10:19 pm:
> Less code means less bugs so add a knob to skip the compat stuff.
>=20
> Changes in v2: saner CONFIG_COMPAT ifdefs
> Changes in v3:
>  - change llseek to 32bit instead of builing it unconditionally in fs
>  - clanup the makefile conditionals
>  - remove some ifdefs or convert to IS_DEFINED where possible
> Changes in v4:
>  - cleanup is_32bit_task and current_is_64bit
>  - more makefile cleanup
> Changes in v5:
>  - more current_is_64bit cleanup
>  - split off callchain.c 32bit and 64bit parts
> Changes in v6:
>  - cleanup makefile after split
>  - consolidate read_user_stack_32
>  - fix some checkpatch warnings
> Changes in v7:
>  - add back __ARCH_WANT_SYS_LLSEEK to fix build with llseek
>  - remove leftover hunk
>  - add review tags
> Changes in v8:
>  - consolidate valid_user_sp to fix it in the split callchain.c
>  - fix build errors/warnings with PPC64 !COMPAT and PPC32
> Changes in v9:
>  - remove current_is_64bit()
> Chanegs in v10:
>  - rebase, sent together with the syscall cleanup
> Changes in v11:
>  - rebase
>  - add MAINTAINERS pattern for ppc perf

These all look good to me. I had some minor comment about one patch but=20
not really a big deal and there were more cleanups on top of it, so I=20
don't mind if it's merged as is.

Actually I think we have a bit of stack reading fixes for 64s radix now
(not a bug fix as such, but we don't need the hash fault logic in radix),
so if I get around to that I can propose the changes in that series.

Thanks,
Nick
=
