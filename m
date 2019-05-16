Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D73841FE95
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 06:45:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454Jkr40TRzDqYL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 14:45:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ice1oxVa"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454JjR1WtLzDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 14:44:11 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id g9so952785plm.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 21:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Z8I+0I8sDIflCFpPAoQhP1EyICzZb7WVM/1nhULuHrw=;
 b=ice1oxVas7vFf3d2tYQZSlDBcuCF7tL8hTp/6ZJutDXf4Y1lL9GM3KPkawoQMJrgHN
 DgDF1Yx/9iIbZFwygagysDH+DVXegWla+SfA7aE9ahsyLqwvA51ie1EjDSN1rVrZEiE5
 IoqsiTBwmuQi8QJ+rLKWd/8fTtUJxjS86cdnl+LclxcHP3Tf0shKwlWiKlrnJeUUc/jf
 /y1NqGFqvi4j3sqbdtS8sBMYJ72JIchsv/uLOnfpNm9yZwt0nvx6BhbOOeR+klc9+ZL+
 vVdGlKphv6+Ul8m/IYhv8H3LGLOkSnwK0+m4SK1nelbMviiQ4+coohhtYN5m1RQbpKNI
 yVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Z8I+0I8sDIflCFpPAoQhP1EyICzZb7WVM/1nhULuHrw=;
 b=ld4t7uW7eTExlnfhwF/tUpLlmogC+05JmI54uDHYiBO4H58aUvHaQRIVvXEKzGwdAw
 F7kYdkjjJgbGeFD28hAeaN54BBjASUYCThPnjFh1ao88t+jcctdrZaJl89hVfg2kNKg1
 G1sw2oa1Bd3RvfsOnQPGksYvf8rrd/lspPq7L8oqJaLnuHzsSh7W/8FmRcaT6JTMGo09
 Q3We5pZjG+xdeI0TTFAHenE6qa16Jj7eFxY2hBSWUP47GV44/dxSLc1wgeTpOjvSPyGm
 /i2Yu8herV9Ebh5qZgasgzJJtOhuaEuGCJPlhP4FihAz+d0i6oeHEWMXiAJd7Uqsrml/
 uovg==
X-Gm-Message-State: APjAAAX6vcewUgg5xjnY6dRr3+1rFnpaoyGKWomqAUXuwS+6ZDiT/aoM
 uueSOEZ+udJTRjdhVneW7VE=
X-Google-Smtp-Source: APXvYqx9WKdQ7HquXm2F81zvZWPeGeiOGJd5yj0YB2YHMdOUbkJGfib0x+v+Iya/gR2nZE1/CLG0pg==
X-Received: by 2002:a17:902:b18c:: with SMTP id
 s12mr29278558plr.181.1557981847545; 
 Wed, 15 May 2019 21:44:07 -0700 (PDT)
Received: from localhost (193-116-124-212.tpgi.com.au. [193.116.124.212])
 by smtp.gmail.com with ESMTPSA id w189sm4595667pfw.147.2019.05.15.21.44.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 21:44:06 -0700 (PDT)
Date: Thu, 16 May 2019 14:43:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v10 2/2] powerpc/64s: KVM update for reimplement book3s
 idle code in C
To: Paul Mackerras <paulus@ozlabs.org>
References: <20190428114515.32683-1-npiggin@gmail.com>
 <20190428114515.32683-3-npiggin@gmail.com>
 <20190513064207.GA11679@blackberry>
In-Reply-To: <20190513064207.GA11679@blackberry>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1557981765.4aikls5u00.astroid@bobo.none>
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Mackerras's on May 13, 2019 4:42 pm:
> On Sun, Apr 28, 2019 at 09:45:15PM +1000, Nicholas Piggin wrote:
>> This is the KVM update to the new idle code. A few improvements:
>>=20
>> - Idle sleepers now always return to caller rather than branch out
>>   to KVM first.
>> - This allows optimisations like very fast return to caller when no
>>   state has been lost.
>> - KVM no longer requires nap_state_lost because it controls NVGPR
>>   save/restore itself on the way in and out.
>> - The heavy idle wakeup KVM request check can be moved out of the
>>   normal host idle code and into the not-performance-critical offline
>>   code.
>> - KVM nap code now returns from where it is called, which makes the
>>   flow a bit easier to follow.
>=20
> One question below...
>=20
>> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/=
book3s_hv_rmhandlers.S
>> index 58d0f1ba845d..f66191d8f841 100644
>> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> ...
>> @@ -2656,6 +2662,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
>> =20
>>  	lis	r3, LPCR_PECEDP@h	/* Do wake on privileged doorbell */
>> =20
>> +	/* Go back to host stack */
>> +	ld	r1, HSTATE_HOST_R1(r13)
>=20
> At this point we are in kvmppc_h_cede, which we branched to from
> hcall_try_real_mode, which came from the guest exit path, where we
> have already loaded r1 from HSTATE_HOST_R1(r13).  So if there is a
> path to get here with r1 not already set to HSTATE_HOST_R1(r13), then
> I missed it - please point it out to me.  Otherwise this statement
> seems superfluous.

I'm not sure why I put that there. I think you're right it could
be removed.

Thanks,
Nick
=
