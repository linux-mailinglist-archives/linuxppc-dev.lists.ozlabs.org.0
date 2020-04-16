Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 543591AC140
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 14:31:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492z9C2F26zDrST
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 22:31:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=alex.bennee@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BKowtfSq; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492z6935FFzDrSN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 22:28:29 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id i10so4561333wrv.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 05:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=cMPkCMlqwl3yXb/VVFCTfLN11oVh/xjvMsOT4/7WQk0=;
 b=BKowtfSqqF3I9mEY8o3N/wAIkueWSOaWjKnRxf16CuNNUXqMgBe1PZDOBLVH1KZZbW
 B1d4NXhXE30zt6slNR5HPMIYfppoq/G7AJXk1mwggtYImulksoeHGjTs0p/uLlgXRhRe
 NVNrCcmHxP8IXcjXZNrWc/phuqzLkAl5ygcS9FNChg1zN5dWMLxmSQoFWFSMMwFm3ZyT
 INC7+nw7hBLenwrtKujK/rhn7Pm+bcbaCNdq1YJogjn54qxd5L3VuyN//IThLb/R2yhl
 4Bi+YqdADN0xSsj9IZxWX6dwC87sn0/cCvHKATDs6vSLUFBk7Fjxw1861JVJuYNp7mNu
 NffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=cMPkCMlqwl3yXb/VVFCTfLN11oVh/xjvMsOT4/7WQk0=;
 b=Gg3068rvTHxZkMFnnh0cV6fwI440Czg94hm509h3QJZ9xYapFd0THDQ7AN6xwK1E5K
 pOXoDSohEh8TpvN4TFdFHuMmD5RNXYPElFphXWV/mxKCHQRycO/Oe00jqFrpiue8nw/Q
 unEosxumChg2vyu903g4HWUx584YoBE2nU+z0etuQPHHX7jaquzOahmdxTB6A5NGrJFR
 s7X6hkKudOjBfiq2kNG5hG0jd0vhAWETPdceusy52okqGUy+9Bk3W84IjRKocCnBgzfg
 vsvQIndhzhPjCxv859dTlmEiyQ9/Lk3ei3MUPbLZSBpp7MYyNjZu7ZzLPyaw8LyhQQu1
 GMvQ==
X-Gm-Message-State: AGi0PuaiblD2cN7mzwv4dIFyN57khyZ4nrUwCJlNXTYE61hEKvrZZmX2
 FyrsiplxMJ76hahYX7T6XWCAqTkBsyw=
X-Google-Smtp-Source: APiQypIjYJwFDPI8PVovlQFxKski+eCbaQ21MFDv3mC7HaE3sHGpYUobkvtZTA0lOUcvr6aYNQBbmw==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr32713237wrs.4.1587040105587; 
 Thu, 16 Apr 2020 05:28:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n2sm6848626wrq.74.2020.04.16.05.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 05:28:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 510DC1FF7E;
 Thu, 16 Apr 2020 13:28:23 +0100 (BST)
References: <20200414111131.465560-1-npiggin@gmail.com>
 <74e47708-fcc0-d3db-5f6b-2a513722fef9@kaod.org>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [EXTERNAL] [PATCH] target/ppc: Fix mtmsr(d) L=1 variant that
 loses interrupts
In-reply-to: <74e47708-fcc0-d3db-5f6b-2a513722fef9@kaod.org>
Date: Thu, 16 Apr 2020 13:28:23 +0100
Message-ID: <87o8rrfwd4.fsf@linaro.org>
MIME-Version: 1.0
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
Cc: qemu-stable@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 4/14/20 1:11 PM, Nicholas Piggin wrote:
>> If mtmsr L=3D1 sets MSR[EE] while there is a maskable exception pending,
>> it does not cause an interrupt. This causes the test case to hang:
>>=20
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.gnu.org_arc=
hive_html_qemu-2Dppc_2019-2D10_msg00826.html&d=3DDwIDAg&c=3Djf_iaSHvJObTbx-=
siA1ZOg&r=3DXHJsZhhuWSw9713Fp0ciew&m=3DTQfi_v-8XYgz7MiMDAZ_CjkyalSh9-EXhQ3o=
DesUm74&s=3DpFoesXbioVBh5wCuzEnzwgfze6X7e-a9unkfUgsRwiw&e=3D=20
>>=20
<snip>
> I was expecting more changes but this looks fine.=20
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
>> Cc: qemu-stable@nongnu.org
>> Reported-by: Anton Blanchard <anton@ozlabs.org>
>> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
>> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>
> I gave it a try on PowerNV, pseries and mac99. All good.
>
> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> I don't know how we could include tests in QEMU such as the one Anton=20
> sent. These are good exercisers for our exception model.

It certainly looks possible. The ideal would be a fresh boot.S for ppc64
that supported:

 a) some sort of serial output
 b) a way to exit the test case with a result

For ARM we use semihosting, for x86 we use plain ioport and an ACPI
exit. See the tests in: tests/tcg/[x86_64/aarch64]/system/boot.S and the
Makefile.softmmu-target files under tests/tcg.

>
> Thanks,
>
> C.=20
>
>> ---
>> Thanks very much to Nathan for reporting and testing it, I added his
>> Tested-by tag despite a more polished patch, as the the basics are=20
>> still the same (and still fixes his test case here).
>>=20
>> This bug possibly goes back to early v2.04 / mtmsrd L=3D1 support around
>> 2007, and the code has been changed several times since then so may
>> require some backporting.
>>=20
>> 32-bit / mtmsr untested at the moment, I don't have an environment
>> handy.
>>
>>=20
>>  target/ppc/translate.c | 46 +++++++++++++++++++++++++-----------------
>>  1 file changed, 27 insertions(+), 19 deletions(-)
>>=20
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index b207fb5386..9959259dba 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -4361,30 +4361,34 @@ static void gen_mtmsrd(DisasContext *ctx)
>>      CHK_SV;
>>=20=20
>>  #if !defined(CONFIG_USER_ONLY)
>> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
>> +        gen_io_start();
>> +    }
>>      if (ctx->opcode & 0x00010000) {
>> -        /* Special form that does not need any synchronisation */
>> +        /* L=3D1 form only updates EE and RI */
>>          TCGv t0 =3D tcg_temp_new();
>> +        TCGv t1 =3D tcg_temp_new();
>>          tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
>>                          (1 << MSR_RI) | (1 << MSR_EE));
>> -        tcg_gen_andi_tl(cpu_msr, cpu_msr,
>> +        tcg_gen_andi_tl(t1, cpu_msr,
>>                          ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
>> -        tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
>> +        tcg_gen_or_tl(t1, t1, t0);
>> +
>> +        gen_helper_store_msr(cpu_env, t1);
>>          tcg_temp_free(t0);
>> +        tcg_temp_free(t1);
>> +
>>      } else {
>>          /*
>>           * XXX: we need to update nip before the store if we enter
>>           *      power saving mode, we will exit the loop directly from
>>           *      ppc_store_msr
>>           */
>> -        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
>> -            gen_io_start();
>> -        }
>>          gen_update_nip(ctx, ctx->base.pc_next);
>>          gen_helper_store_msr(cpu_env, cpu_gpr[rS(ctx->opcode)]);
>> -        /* Must stop the translation as machine state (may have) change=
d */
>> -        /* Note that mtmsr is not always defined as context-synchronizi=
ng */
>> -        gen_stop_exception(ctx);
>>      }
>> +    /* Must stop the translation as machine state (may have) changed */
>> +    gen_stop_exception(ctx);
>>  #endif /* !defined(CONFIG_USER_ONLY) */
>>  }
>>  #endif /* defined(TARGET_PPC64) */
>> @@ -4394,15 +4398,23 @@ static void gen_mtmsr(DisasContext *ctx)
>>      CHK_SV;
>>=20=20
>>  #if !defined(CONFIG_USER_ONLY)
>> -   if (ctx->opcode & 0x00010000) {
>> -        /* Special form that does not need any synchronisation */
>> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
>> +        gen_io_start();
>> +    }
>> +    if (ctx->opcode & 0x00010000) {
>> +        /* L=3D1 form only updates EE and RI */
>>          TCGv t0 =3D tcg_temp_new();
>> +        TCGv t1 =3D tcg_temp_new();
>>          tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
>>                          (1 << MSR_RI) | (1 << MSR_EE));
>> -        tcg_gen_andi_tl(cpu_msr, cpu_msr,
>> +        tcg_gen_andi_tl(t1, cpu_msr,
>>                          ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
>> -        tcg_gen_or_tl(cpu_msr, cpu_msr, t0);
>> +        tcg_gen_or_tl(t1, t1, t0);
>> +
>> +        gen_helper_store_msr(cpu_env, t1);
>>          tcg_temp_free(t0);
>> +        tcg_temp_free(t1);
>> +
>>      } else {
>>          TCGv msr =3D tcg_temp_new();
>>=20=20
>> @@ -4411,9 +4423,6 @@ static void gen_mtmsr(DisasContext *ctx)
>>           *      power saving mode, we will exit the loop directly from
>>           *      ppc_store_msr
>>           */
>> -        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
>> -            gen_io_start();
>> -        }
>>          gen_update_nip(ctx, ctx->base.pc_next);
>>  #if defined(TARGET_PPC64)
>>          tcg_gen_deposit_tl(msr, cpu_msr, cpu_gpr[rS(ctx->opcode)], 0, 3=
2);
>> @@ -4422,10 +4431,9 @@ static void gen_mtmsr(DisasContext *ctx)
>>  #endif
>>          gen_helper_store_msr(cpu_env, msr);
>>          tcg_temp_free(msr);
>> -        /* Must stop the translation as machine state (may have) change=
d */
>> -        /* Note that mtmsr is not always defined as context-synchronizi=
ng */
>> -        gen_stop_exception(ctx);
>>      }
>> +    /* Must stop the translation as machine state (may have) changed */
>> +    gen_stop_exception(ctx);
>>  #endif
>>  }
>>=20=20
>>=20


--=20
Alex Benn=C3=A9e
