Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FA519CE8F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 04:18:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tkBk02vSzDqLb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 13:18:54 +1100 (AEDT)
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
 header.s=20161025 header.b=c8Q6ct3n; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tk784B0wzDrdf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 13:15:47 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id w9so2342677pjh.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 19:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=tnnT8LQ/nvrWPvlSi0XSrAkCxhkdXnxzRfo9zb1p+2A=;
 b=c8Q6ct3nKtj3rAVbnDKsUMHktjvmGJYhqlXKXJjPu186EXHCSiQ8PU1ZfBW2kszEy3
 6RWftxFEAW7DjSREBNhHN5FfSYklLHhvMmXt5sj7lBRSgzYObxi/Ysd/msp33GrxoN2+
 a945pI9PiEc0B97I2rZvmmXmzp9JmmGzBu04WuxSGpJ5yzOrhvbFgQPyZcJdphRFnUf5
 RQj1A2wKy+2cMt4RlhHdITwTx423U/GdGZjMd2C/Iprmax9Td6CT8zZgGVJhJWpsqGNn
 s7xtM7liXgHIp9LAZdT203Va7gKINLu0AZ2Wj1ITyCzRHoqmFT0gTPPgiGiq+Wc1vaXp
 gTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=tnnT8LQ/nvrWPvlSi0XSrAkCxhkdXnxzRfo9zb1p+2A=;
 b=fKBObx1o5z7QEHb2kihaYzMzdTMZ5xo8h93lnImqAIQajPKhpNlqK33onX4104ujHN
 V5oi6ID8pzV6LULbb/87mHvRK59A8S8lKCXzsiqoEq+C0bCxGCTbNPynKD2kBSbUjv+i
 bQ4eeVKOmHVSZv08TTv94ODTLXkKjKZg3t/xH9UfSDojhK2ZMOhUuXmyE/Bv+KnuZWnp
 HGNXNl8wUYrhQIhqTp1Vgi1giHeOYLpSOeiPiaTtseCXBOwxAeaqXn+1b28zl0YM4ohW
 tUwMrwnHOt7P8S/YSxRm0WSrpalBa5IlqZqOgyn46LcwnX9qppN6XEzfoKFFjFNRnV65
 4g8Q==
X-Gm-Message-State: AGi0PubVGs+x3cNP1ifNhy7t3fNQ1zCs2P1wfLc2Cf+uVy4NjzanMY8/
 R0vCJ+nm0IsBm9Jhh4MxRKs=
X-Google-Smtp-Source: APiQypIBzNVotcF4KzWzOppS2wHZuAesXitmqIgSOWZBFxOaODpqf7CtYObixOPdla9dq6I9XmGn8w==
X-Received: by 2002:a17:90a:c085:: with SMTP id
 o5mr6699425pjs.85.1585880144624; 
 Thu, 02 Apr 2020 19:15:44 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y142sm4764634pfc.53.2020.04.02.19.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 19:15:43 -0700 (PDT)
Date: Fri, 03 Apr 2020 12:15:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC/PATCH  1/3] powerpc/kvm: Handle H_FAC_UNAVAIL when guest
 executes stop.
To: Bharata B Rao <bharata@linux.ibm.com>, David Gibson
 <david@gibson.dropbear.id.au>, "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@ozlabs.org>, Vaidyanathan Srinivasan
 <svaidy@linux.vnet.ibm.com>
References: <1585656658-1838-1-git-send-email-ego@linux.vnet.ibm.com>
 <1585656658-1838-2-git-send-email-ego@linux.vnet.ibm.com>
In-Reply-To: <1585656658-1838-2-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585880035.5ddwqv4syr.astroid@bobo.none>
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
Cc: linuxppc-dev@ozlabs.org, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautham R. Shenoy's on March 31, 2020 10:10 pm:
> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>=20
> If a guest executes a stop instruction when the hypervisor has set the
> PSSCR[ESL|EC] bits, the processor will throw an Hypervisor Facility
> Unavailable exception. Currently when we receive this exception, we
> only check if the exeception is generated due to a doorbell
> instruction, in which case we emulate it. For all other cases,
> including the case when the guest executes a stop-instruction, the
> hypervisor sends a PROGILL to the guest program, which results in a
> guest crash.
>=20
> This patch adds code to handle the case when the hypervisor receives a
> H_FAC_UNAVAIL exception due to guest executing the stop
> instruction. The hypervisor increments the pc to the next instruction
> and resumes the guest as expected by the semantics of the
> PSSCR[ESL|EC] =3D 0 stop instruction.

This seems reasonable, I don't think we need to crash the guest here.

Thanks,
Nick
=
