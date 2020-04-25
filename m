Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FD71B8384
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 05:45:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498H433HrmzDr7D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 13:45:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qn+lbAny; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498H2W4xmRzDqhS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 13:43:45 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id e6so4703002pjt.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 20:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Y5+ZFuatWnUBxjoD3Ef2zxIbe+EfnqCDBpvAS6lmVxU=;
 b=qn+lbAnyUn5UYuI5D2rGvG7x0G2FdGcsKmFk7vTFpw9F5tZ6BFzOO+2Fvu7VwSn0bP
 bH+Eh80B60KXtgsHH5v3FyqWR4hzEqs7tI606R5xrMRnbrBNydH+iXluWXkDE5xTBoNG
 BhQx1IrI5T9C4eN4Ag0G77ZqnlRxtsB43zq/whx2cAGPOXMM7IaczjoR6fwqYAdn7u5j
 RykgcYctY+frRbSo1h55axSmzlkGKSeqje37YhAXAN0YZTKk9/Orb2GkeRF6B5je+OGt
 J78fvR9Cp9TSYgi4ZYLEn4ycv2Xgk2utbsJEQFUTUCJmacIAxdR6tDN732cTScedYg+F
 8CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Y5+ZFuatWnUBxjoD3Ef2zxIbe+EfnqCDBpvAS6lmVxU=;
 b=SumAT0U4DpgQFCR+3+ogAOnBzYp/8117p988CxtGWgjqWdsJXaM9XZllvAIMzoepNR
 NV2jsSN/UmEBc0Wt9I2FXPoQloy+Uw1DHYsc3LQ9Nvn/og2GAPugEXStE01J8TCM/B/f
 SpCr7FMmZYEZL5DbsWTcS1dT+6fFM9Ndkduv3PzFaiUWrln9NPw9xI31ZO32a/+Tua/6
 qrvNtZMWQN98Bql2cT1kf1/ev0IcLBffqm83w6tGTgLNT9GGdSPRdBWg+dCvyiA+pMFy
 Q+gx7B4wyPklKbnWPzO9BOgpUcqPhxtrWwiML4ufYGpXUTYLcNA6WBi7Gkc2IIVs+150
 OTow==
X-Gm-Message-State: AGi0PuajUdnNlkBenh+0N/F0H/XVXKurSzniSa3+t5IaVoHZo+fC6yyE
 qC+V9dRADM/rE2gBx/F+DS4=
X-Google-Smtp-Source: APiQypIVGDqm9KyJOiGoo/Cr+RASJ1m+7LIYHb3HVmsOJBhMd/+jZmS7/QFIhpBVt/X7IaEmj1nZ8A==
X-Received: by 2002:a17:902:a50a:: with SMTP id
 s10mr11854311plq.164.1587786222139; 
 Fri, 24 Apr 2020 20:43:42 -0700 (PDT)
Received: from localhost ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id t11sm7072392pfl.122.2020.04.24.20.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 20:43:41 -0700 (PDT)
Date: Sat, 25 Apr 2020 13:40:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>, Rich Felker
 <dalias@libc.org>
References: <20200420040926.GA11469@brightrain.aerifal.cx>
 <1587356128.aslvdnmtbw.astroid@bobo.none>
 <20200420172715.GC11469@brightrain.aerifal.cx>
 <1587531042.1qvc287tsc.astroid@bobo.none>
 <20200423023642.GP11469@brightrain.aerifal.cx>
 <a972a0e4-25bd-9cf5-75ec-2eb993ef1b6a@linaro.org>
 <20200423161841.GU11469@brightrain.aerifal.cx>
 <3fe73604-7c92-e073-cbe7-abb4a8ae7c1a@linaro.org>
 <20200423164314.GX11469@brightrain.aerifal.cx>
 <64d82a23-1f6e-2e6a-b7a9-0eeab8a53435@linaro.org>
 <20200423174214.GZ11469@brightrain.aerifal.cx>
In-Reply-To: <20200423174214.GZ11469@brightrain.aerifal.cx>
MIME-Version: 1.0
Message-Id: <1587785455.59207xhucl.astroid@bobo.none>
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
Cc: libc-dev@lists.llvm.org, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Rich Felker's message of April 24, 2020 3:42 am:
> On Thu, Apr 23, 2020 at 02:15:58PM -0300, Adhemerval Zanella wrote:
>>=20
>>=20
>> On 23/04/2020 13:43, Rich Felker wrote:
>> > On Thu, Apr 23, 2020 at 01:35:01PM -0300, Adhemerval Zanella wrote:
>> >>
>> >>
>> >> On 23/04/2020 13:18, Rich Felker wrote:
>> >>> On Thu, Apr 23, 2020 at 09:13:57AM -0300, Adhemerval Zanella wrote:
>> >>>>
>> >>>>
>> >>>> On 22/04/2020 23:36, Rich Felker wrote:
>> >>>>> On Wed, Apr 22, 2020 at 04:18:36PM +1000, Nicholas Piggin wrote:
>> >>>>>> Yeah I had a bit of a play around with musl (which is very nice c=
ode I
>> >>>>>> must say). The powerpc64 syscall asm is missing ctr clobber by th=
e way. =20
>> >>>>>> Fortunately adding it doesn't change code generation for me, but =
it=20
>> >>>>>> should be fixed. glibc had the same bug at one point I think (pro=
bably=20
>> >>>>>> due to syscall ABI documentation not existing -- something now li=
ves in=20
>> >>>>>> linux/Documentation/powerpc/syscall64-abi.rst).
>> >>>>>
>> >>>>> Do you know anywhere I can read about the ctr issue, possibly the
>> >>>>> relevant glibc bug report? I'm not particularly familiar with ppc
>> >>>>> register file (at least I have to refamiliarize myself every time =
I
>> >>>>> work on this stuff) so it'd be nice to understand what's
>> >>>>> potentially-wrong now.
>> >>>>
>> >>>> My understanding is the ctr issue only happens for vDSO calls where=
 it
>> >>>> fallback to a syscall in case an error (invalid argument, etc. and
>> >>>> assuming if vDSO does not fallback to a syscall it always succeed).
>> >>>> This makes the vDSO call on powerpc to have same same ABI constrain=
t
>> >>>> as a syscall, where it clobbers CR0.
>> >>>
>> >>> I think you mean "vsyscall", the old thing glibc used where there ar=
e
>> >>> in-userspace implementations of some syscalls with call interfaces
>> >>> roughly equivalent to a syscall. musl has never used this. It only
>> >>> uses the actual exported functions from the vdso which have normal
>> >>> external function call ABI.
>> >>
>> >> I wasn't thinking in vsyscall in fact, which afaik it is a x86 thing.
>> >> The issue is indeed when calling the powerpc provided functions in=20
>> >> vDSO, which musl might want to do eventually.
>> >=20
>> > AIUI (at least this is true for all other archs) the functions have
>> > normal external function call ABI and calling them has nothing to do
>> > with syscall mechanisms.
>>=20
>> My point is powerpc specifically does not follow it, since it issues a
>> syscall in fallback and its semantic follow kernel syscalls (error
>> signalled in cr0, r3 being always a positive value):
>=20
> Oh, then I think we'll just ignore these unless the kernel can make
> ones with a reasonable ABI. It's not worth having ppc-specific code
> for this... It would be really nice if ones that actually behave like
> functions could be added though.

Yeah this is an annoyance for me after making the scv ABI return -ve in=20
r3 for error and other things that more closely follow function calls,=20
we still have the vdso functions using the old style.

Maybe we should add function call style vdso too.

Thanks,
Nick
