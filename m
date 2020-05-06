Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E91C6567
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 03:13:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Gz9t3HjmzDqkV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 11:13:22 +1000 (AEST)
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
 header.s=20161025 header.b=OHMlPFhh; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Gz8M0KPvzDqQ3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 11:12:02 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id u22so1568415plq.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 18:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=mtGvltunhf4NiTQ7dRRNPp2A4qwDi+JkQ8uSQa64tS8=;
 b=OHMlPFhhXZktXSKuMMJGtd/qS8P4MrlJCo5dlEx1lNfudUvoUs+ceLRYloj2ebEiIC
 /rgpfZdhSmRk7YUeHeq2/Iab5J/WFvZUq8q9QTUGVYfoqdAHQaj6mf66T6RRe224QS/z
 LrcrYw5+dI3DtzdTnZ7rpBMHBRD9F9hRYHln3lDQU7vH8Uar7UBeTuadU1PuSNOWpmf+
 jvrrm1htGDIzktOGuSHRRA8If3ULD+ejdC7IAxIvuMnfMeQ3w7/lKCh8sPsyZ3ZgUCRM
 E15w791c1htP4kBLSHJB+RuQWlbkaoE+u7Yj9IOPsCNwkPElkWOFK+OUrbsInnK/5fGF
 wiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=mtGvltunhf4NiTQ7dRRNPp2A4qwDi+JkQ8uSQa64tS8=;
 b=Lxp3Kr/kAiUCnrST4NCh0OLO46nxlGsb5VUK5gXaoTCBujMjQXKsfgUx0wSQ2xIRlJ
 aH4pcE0RW6xqYR5vfpPbX0Q6cozeDQvpplp/mT+NUed5YKeahD8ZvqPJBe1rq+T3W3pP
 ngojQoMMzMDTJl7iBS3tXdMdfvgyUQBOfBKudCN+GtlmQxLBf3eJvww3BIovwc4sxLjI
 8MDfDWfPzEDxEgaxb+kO6kkrQU8KaagV+TZYHV4rswmeDbpLeZKEqePqY9wGLdnL3lpy
 VE4po3hAvqeMHfC9rhVLvEAKwGAKlPL1vDr5OtCGVWGWD+jkyw+Z6cjO5CLCk3wvuo+7
 /hLw==
X-Gm-Message-State: AGi0Publf8cPA7AvNwzJtdvAgtMNXSx2ZlXUaIo16rH2GRgj7vTiTY7G
 od+pkua+O7q7ZdJY0MMjscs=
X-Google-Smtp-Source: APiQypJ+w6dVHFvSxnRdK2f8IXOvNpWlOsPaY6ZsORUgC9RCaj3awDMgjl87C0gKJOvD3dxdCcn1fA==
X-Received: by 2002:a17:902:8205:: with SMTP id
 x5mr5995860pln.82.1588727518521; 
 Tue, 05 May 2020 18:11:58 -0700 (PDT)
Received: from localhost (203-219-223-175.tpgi.com.au. [203.219.223.175])
 by smtp.gmail.com with ESMTPSA id x13sm69323pfq.154.2020.05.05.18.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 18:11:57 -0700 (PDT)
Date: Wed, 06 May 2020 11:11:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 2/2] powerpc/64s: system call support for scv/rfscv
 instructions
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20200430040202.1735506-1-npiggin@gmail.com>
 <20200430040202.1735506-3-npiggin@gmail.com>
 <20200505221119.GQ31009@gate.crashing.org>
In-Reply-To: <20200505221119.GQ31009@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1588727415.5d7i1tq5au.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of May 6, 2020 8:11 am:
> Hi!
>=20
> On Thu, Apr 30, 2020 at 02:02:02PM +1000, Nicholas Piggin wrote:
>> Add support for the scv instruction on POWER9 and later CPUs.
>=20
> Looks good to me in general :-)

Thanks for taking a look.

>> For now this implements the zeroth scv vector 'scv 0', as identical
>> to 'sc' system calls, with the exception that lr is not preserved, and
>> it is 64-bit only. There may yet be changes made to this ABI, so it's
>> for testing only.
>=20
> What does it do with SF=3D0?  I don't see how it is obviously not a
> security hole currently (but I didn't look too closely).

Oh that's an outdated comment, I since decided better to keep all the code=20
common and handle 32-bit compat the same way as existing sc syscall.

Thanks,
Nick
