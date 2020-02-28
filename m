Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3D5172E51
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 02:25:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TBgk2L7szDr42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 12:25:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e7hlNGbP; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TBdm3myYzDr3L
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 12:24:12 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id g6so544995plp.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=RIyoQsXsCo3BUOPbxFqQQkHewISXSHv6QhAmw3Bk7bw=;
 b=e7hlNGbPZhhveRft4EaFj4KRgHFk0Z6AtGX1E8bV49aPqI8aLGWJVwHsJoyrPyp46w
 LIwFSUnQPpjUEeDASk+jYU5ZNtjhhOqCbh2ZLC32A4n5NOvfs7WSGPJVKSEv+J7k6q1u
 WWCpPsUaVmTZY/E0HwUFmO6tNGMN/GejByNMl78vc6/pstyIuoUeqtLCsA9x1hCeHTMQ
 pqKjwWxr4BHcXU21hdCuOGfMEeMXgIeq8rMpTA4cHVRgFnwzgIXaN/nk6NBVclNMsS9R
 kHj8FIfr5LAUhhexw7p4r7leC7+C0OBdGHoVLhDV/3KvIt/5uNfptcleU6EDJ8nsG4pV
 aaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=RIyoQsXsCo3BUOPbxFqQQkHewISXSHv6QhAmw3Bk7bw=;
 b=tPYxONy3nYakLsZE6o5cQXPvjME1S5EmJcCKXhKa+iBUfMJHoIPa5nkcHMYtEaS0Ha
 tdvNhcn9z4/kQ/cw5gDz0D28aGqlk6tZ8pAHPhwAQINjb5xfSIvPJMs+7ajPL/XDuwwk
 ws5TFv4u1/x91cVBHFjJNYdltIKI5kjb4zain/G73R/AOIbtg6J8L44iFkdr2qiSzk+i
 p/48bG2pEgSMYCjpeju4HWyLEirtEez1/HEOVDJYIcai3JoL67+mR1UMncYW5O1tmodz
 yxmSY1t/bV2YyVP8+bQS+zeC1mqmoj5r7BnoiJDCK3s14efrusY/qNrYvH+TenXpt81J
 M7yQ==
X-Gm-Message-State: APjAAAX1m0u2rX8OodujABmG7HYEC0LEAkYl1kXEHBpwvBDrMyE3P/rk
 p0g/jv+ySf2xZmMRh/l+OkA=
X-Google-Smtp-Source: APXvYqxfWSJc0Is8b34pO57QugmgJVCk/4MV0Qe06SM5gpTcdO9TKwbJiaQWDuXUJdTNis4MtL+ENQ==
X-Received: by 2002:a17:90a:858c:: with SMTP id
 m12mr1754796pjn.127.1582853048614; 
 Thu, 27 Feb 2020 17:24:08 -0800 (PST)
Received: from localhost (193-116-109-34.tpgi.com.au. [193.116.109.34])
 by smtp.gmail.com with ESMTPSA id b18sm8592213pfd.63.2020.02.27.17.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 17:24:08 -0800 (PST)
Date: Fri, 28 Feb 2020 11:23:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 09/14] powerpc/xmon: Add initial support for prefixed
 instructions
To: Christophe Leroy <christophe.leroy@c-s.fr>, Jordan Niethe
 <jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-10-jniethe5@gmail.com>
 <1582700457.bqyiezlzr9.astroid@bobo.none>
 <CACzsE9p4siTRgCnC6GPSn+89SnPr5CTTBk5+LOfS8BX+1OmMZg@mail.gmail.com>
 <f6db0844-bcd0-50af-5699-a89f10538ed0@c-s.fr>
 <CACzsE9r6JGOuTBwaLxDhWb2W4E=Ag0M-QHrxJUCcjP4XNYZxkQ@mail.gmail.com>
In-Reply-To: <CACzsE9r6JGOuTBwaLxDhWb2W4E=Ag0M-QHrxJUCcjP4XNYZxkQ@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582852901.zci5ew784t.astroid@bobo.none>
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
Cc: Alistair Popple <alistair@popple.id.au>, Daniel Axtens <dja@axtens.net>,
 linuxppc-dev@lists.ozlabs.org, Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on February 28, 2020 10:37 am:
> On Thu, Feb 27, 2020 at 6:14 PM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>>
>>
>>
>> Le 27/02/2020 =C3=A0 01:11, Jordan Niethe a =C3=A9crit :
>> > On Wed, Feb 26, 2020 at 6:10 PM Nicholas Piggin <npiggin@gmail.com> wr=
ote:
>> >>
>> >> Jordan Niethe's on February 26, 2020 2:07 pm:
>> >>> A prefixed instruction is composed of a word prefix and a word suffi=
x.
>> >>> It does not make sense to be able to have a breakpoint on the suffix=
 of
>> >>> a prefixed instruction, so make this impossible.
>> >>>
>> >>> When leaving xmon_core() we check to see if we are currently at a
>> >>> breakpoint. If this is the case, the breakpoint needs to be proceede=
d
>> >>> from. Initially emulate_step() is tried, but if this fails then we n=
eed
>> >>> to execute the saved instruction out of line. The NIP is set to the
>> >>> address of bpt::instr[] for the current breakpoint.  bpt::instr[]
>> >>> contains the instruction replaced by the breakpoint, followed by a t=
rap
>> >>> instruction.  After bpt::instr[0] is executed and we hit the trap we
>> >>> enter back into xmon_bpt(). We know that if we got here and the offs=
et
>> >>> indicates we are at bpt::instr[1] then we have just executed out of =
line
>> >>> so we can put the NIP back to the instruction after the breakpoint
>> >>> location and continue on.
>> >>>
>> >>> Adding prefixed instructions complicates this as the bpt::instr[1] n=
eeds
>> >>> to be used to hold the suffix. To deal with this make bpt::instr[] b=
ig
>> >>> enough for three word instructions.  bpt::instr[2] contains the trap=
,
>> >>> and in the case of word instructions pad bpt::instr[1] with a noop.
>> >>>
>> >>> No support for disassembling prefixed instructions.
>> >>>
>> >>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>> >>> ---
>> >>> v2: Rename sufx to suffix
>> >>> v3: - Just directly use PPC_INST_NOP
>> >>>      - Typo: plac -> place
>> >>>      - Rename read_inst() to mread_inst(). Do not have it call mread=
().
>> >>> ---
>> >>>   arch/powerpc/xmon/xmon.c | 90 ++++++++++++++++++++++++++++++++++--=
----
>> >>>   1 file changed, 78 insertions(+), 12 deletions(-)
>> >>>
>> >>> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
>> >>> index a673cf55641c..a73a35aa4a75 100644
>> >>> --- a/arch/powerpc/xmon/xmon.c
>> >>> +++ b/arch/powerpc/xmon/xmon.c
>> >>> @@ -97,7 +97,8 @@ static long *xmon_fault_jmp[NR_CPUS];
>> >>>   /* Breakpoint stuff */
>> >>>   struct bpt {
>> >>>        unsigned long   address;
>> >>> -     unsigned int    instr[2];
>> >>> +     /* Prefixed instructions can not cross 64-byte boundaries */
>> >>> +     unsigned int    instr[3] __aligned(64);
>> >>
>> >> This is pretty wild, I didn't realize xmon executes breakpoints out
>> >> of line like this.
>>
>> Neither did I. That's problematic. Kernel data is mapped NX on some
>> platforms.
>>
>> >>
>> >> IMO the break point entries here should correspond with a range of
>> >> reserved bytes in .text so we patch instructions into normal executab=
le
>> >> pages rather than .data.
>> > Would it make sense to use vmalloc_exec() and use that like we are
>> > going to do in kprobes()?
>>
>> As we are (already) doing in kprobes() you mean ?
> Sorry for the confusion, I was mainly thinking of the patch that you
> pointed out before:
> https://patchwork.ozlabs.org/patch/1232619/
>>
>> In fact kprobes uses module_alloc(), and it works because kprobe depends
>> on module. On some platforms (i.e. book3s/32) vmalloc space is marked NX
>> in segment registers when CONFIG_MODULES is not set, see
>> mmu_mark_initmem_nx().  On other ones the Instruction TLB miss exception
>> does not manage misses at kernel addresses when CONFIG_MODULES is not
>> selected.
>>
>> So if we want XMON to work at all time, we need to use some (linear)
>> text address and use patch_instruction() to change it.
> Thank you for the detailed clarification, I will do it like that.

Yeah I would just make a little array in .text.xmon_bpts or something,
which should do the trick.

That wouldn't depend on this series, but if you want to do it as a fix
up patch before it, that would be good.

Thanks,
Nick
=
