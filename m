Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF9A66339
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 03:05:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lF8G4qYXzDqXv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 11:05:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lF621DpWzDqbG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 11:03:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IwY/wWZg"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45lF6208Xxz8wVN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 11:03:06 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45lF616dGtz9sNx; Fri, 12 Jul 2019 11:03:05 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IwY/wWZg"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45lF614v1hz9sNH
 for <linuxppc-dev@ozlabs.org>; Fri, 12 Jul 2019 11:03:05 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id u14so3542186pfn.2
 for <linuxppc-dev@ozlabs.org>; Thu, 11 Jul 2019 18:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=CSOrids+2zioMvfSrWdODBWKmkYKely5eESzBsRD2Fo=;
 b=IwY/wWZghazMrD24ZcxIPxEqQ/52LXPX+fJHue9+6Ludf48g47R6bsPVbPmnjIsMff
 TTAnd6bfXiuTT8VjD2CIzx64n/Zc+r5OpV5Z5AzA23oLuvme01kLEMlMPOI7qEbEObXE
 SUjoJgCzwgfLTLO8yoNbzerkajENWMuqpps1qaBUHy2qM8kjqIJEWRzFjlBZcIAnHZNJ
 j55dG5vVpe6l49daWA1stV+3iNJWzk5KRuN5zx/AbFocIHyZKFkvbvbfpkJUWNkMYfv/
 bon4fVW2s8Xia/4sYDHPy39y3E1uDwEcTWts4YFJ3eo6jqBB0qDsn7cbStBF7UMoVTpD
 YpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=CSOrids+2zioMvfSrWdODBWKmkYKely5eESzBsRD2Fo=;
 b=I5k4loeO2a1HM/RZuYhzvwCVTCgwyh8DVJbZ3mpYkkjY6k/yeSjt36JELmRAwKnDYW
 R57mZspQOSQ22TUkL5mE4LgZhvQUfpQTsXZUEE7TMxeSeQJ62D0kM4xiT2kElBYcrkZc
 v6V7+Qb2Wwv3Awgtj+S1tldLt+P36ZBTdcztZRMrjv3sI1GjdRravkRSh0JIcQN+pXYW
 FpXICW84zRi6QFHSf2zaTBYFtMwg7DCjppVLOPKe3AunaoUh9EFtW/0h4VD805MUabkr
 6yjKbPCc3TNbo2xj/qP1o6YGtBXJ44hnFWbsslxgw2YDJaFJCUqwIHLiu8+Jq5z7e0pF
 Cgqg==
X-Gm-Message-State: APjAAAVZfZbdhjLFFoplnplARH5raF50mp30op6HQeiNLu/1G4nF2F6z
 VVIagS9TWHxy0eXoZagju/E=
X-Google-Smtp-Source: APXvYqw3C7x+FsI6OUFtrwBE5EEzLMQ9x81ocTuyF10ov7Sj+7r07N4dKob9w1E2TE0tmnrTDM+Vgw==
X-Received: by 2002:a63:1310:: with SMTP id i16mr7389668pgl.187.1562893382395; 
 Thu, 11 Jul 2019 18:03:02 -0700 (PDT)
Received: from localhost ([220.240.228.224])
 by smtp.gmail.com with ESMTPSA id u23sm7183631pfn.140.2019.07.11.18.03.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 18:03:01 -0700 (PDT)
Date: Fri, 12 Jul 2019 10:59:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 1/8] KVM: PPC: Ultravisor: Introduce the MSR_S bit
To: Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-2-cclaudio@linux.ibm.com>
 <87muhkg258.fsf@concordia.ellerman.id.au>
In-Reply-To: <87muhkg258.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562893118.ys3k642fnf.astroid@bobo.none>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman's on July 11, 2019 10:57 pm:
> Claudio Carvalho <cclaudio@linux.ibm.com> writes:
>> From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
>>
>> The ultravisor processor mode is introduced in POWER platforms that
>> supports the Protected Execution Facility (PEF). Ultravisor is higher
>> privileged than hypervisor mode.
>>
>> In PEF enabled platforms, the MSR_S bit is used to indicate if the
>> thread is in secure state. With the MSR_S bit, the privilege state of
>> the thread is now determined by MSR_S, MSR_HV and MSR_PR, as follows:
>>
>> S   HV  PR
>> -----------------------
>> 0   x   1   problem
>> 1   0   1   problem
>> x   x   0   privileged
>> x   1   0   hypervisor
>> 1   1   0   ultravisor
>> 1   1   1   reserved
>=20
> What are you trying to express with the 'x' value?
>=20
> I guess you mean it as "either" or "don't care" - but then you have
> cases where it could only have one value, such as hypervisor. I think it
> would be clearer if you spelled it out more explicitly.
>=20
>> The hypervisor doesn't (and can't) run with the MSR_S bit set, but a
>> secure guest and the ultravisor firmware do.
>=20
> I know you're trying to be helpful, but this comment is really just
> confusing to someone who doesn't have all the documentation.
>=20
> I'd really like to see something in Documentation/powerpc describing at
> least the outline of how the system works. I'm pretty sure most of that
> is public, so even if it's mostly a list of references to other
> documentations or presentations that would be fine. But I'm not really
> happy with a whole new processor mode appearing with zero documentation
> in the tree.
>=20
>> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
>> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
>> [ Update the commit message ]
>=20
> It's normal to prefix these comments with your handle to make it clear
> who is saying it.
>=20
>> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/reg.h | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/r=
eg.h
>> index 10caa145f98b..39b4c0a519f5 100644
>> --- a/arch/powerpc/include/asm/reg.h
>> +++ b/arch/powerpc/include/asm/reg.h
>> @@ -38,6 +38,7 @@
>>  #define MSR_TM_LG	32		/* Trans Mem Available */
>>  #define MSR_VEC_LG	25	        /* Enable AltiVec */
>>  #define MSR_VSX_LG	23		/* Enable VSX */
>> +#define MSR_S_LG	22		/* Secure VM bit */
>=20
> I don't think that's the best description, because it's also the
> Ultravisor bit when MSR[HV] =3D 1.
>=20
> So "Secure state" as you have below would be better IMO.

Ooops I see Michael covered everything I wrote, sorry for the noise
I missed the thread.

Thanks,
Nick

=
