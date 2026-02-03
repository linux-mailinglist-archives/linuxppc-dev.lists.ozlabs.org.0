Return-Path: <linuxppc-dev+bounces-16544-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FsLMdrDgWmgJgMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16544-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 10:46:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C34A4D70B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 10:46:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4zBX3vHQz30M6;
	Tue, 03 Feb 2026 20:45:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.10.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770111956;
	cv=none; b=Q9NHypToNgsotThI20xQizar0yWhaS9AfnE+q4vHaJeKTLXaqHyO2faV/HS3PSWirTXQDeSOr/fbxyKurJsu/NNzq+uy8SHANwjI4Xw3Form1csTxB2ZnEiXkb6UYmnFTmKpBIjHLYe0aRsLiGZtrbER5P2ajqO6R8TGvdvYi7WxrO5e+8LQ9jjcpFGbLh9tIxCuS5c96esdaxkYqKOTfL7iH2/+0IQTYmGY0FUsYr3arBe1lEJpiflNwOusqrftzjiWOyVVLRAWh6BJEby/WbajHmRU/oXc9f6ZNpFCqEx8q1zWDaUcQlZfzC2l/1xUt7wIgGRrlfHJqyB5PlAvAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770111956; c=relaxed/relaxed;
	bh=reES5J+W+8DrIpUG4yVp96fM0Lx+QH7RckP1uZzjGBM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RPkfCvzp9hmxrDH6Iw5j7Z40jO21H1yde3osvEiKpyM/qHR5Wpll9Dza4TpfNOmAv5devzOF/Zyo3PV9uBOX5r5V1PP9yMnbtzq1LYhXmMWUlK9/EybdWN6vY/FLyrWHl34+ftpjcHD+EdKWY966b/96ngmq9rOYPCtrJV1Y6DOMLyq9AUXQZoTDIZpFg/2LDx/jsKTLYsCPWmPM6MCJBkqkAbKXMsN9AH4gCpSeiqgJeXMIDbf6UuyjpAOdSqNJ4kxL3mnmKH5CBrOaR/aHkJ6wfWiaJVDWQPYhEqHjiB+cVesAz/gPH3VyJq1GVg42k2RHkgvks7WYIMEofgswxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de; dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=fyO8WkeF; dkim-atps=neutral; spf=pass (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org) smtp.mailfrom=exactco.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=fyO8WkeF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exactco.de (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1613 seconds by postgrey-1.37 at boromir; Tue, 03 Feb 2026 20:45:52 AEDT
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4zBS3gdxz30GV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 20:45:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To
	:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=reES5J+W+8DrIpUG4yVp96fM0Lx+QH7RckP1uZzjGBM=; b=fyO8WkeF2Ivl6gzbaVHN3HNIcx
	CrCtg6uBqLcH4OWZ4C2Js8l7tdg9FYtUXlTmvU+NiPE4SAqTBbPeC32PE1Ppk+0Fk0ycVBHXZnLd+
	SMgKvPo3AxeTWtv7UBPq/LQ8ZSZj3Mwb7R0CvgoEyEORpcj0O/qKGqkP+YocIU9dY64JC18JXoQI1
	NJbcQchczB8kKEhbU31iVEpxOvWAhiu7iTde3Zcrg1t4SlSeKdbfE/uDRdwWS2++XShYysvmCJ9xS
	4in4dsCw+LRyHKJWx9af7OSWuivcAcTvRDQsMY1VeY70+BMgBe1P8im/9PZG1mkXTEfBLODcIpyOl
	sLkdVLqw==;
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH V2] modpost: Amend ppc64 save/restfpr symnames for -Os
 build
From: =?utf-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
In-Reply-To: <20260203064800.GA701088@ax162>
Date: Tue, 3 Feb 2026 10:18:52 +0100
Cc: chleroy@kernel.org,
 linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com,
 mpe@ellerman.id.au,
 npiggin@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <99F903A5-F470-49ED-83B9-22D5963B25F2@exactco.de>
References: <20251123.131330.407910684435629198.rene@exactco.de>
 <d69d7167-00d1-49c5-90ee-6bc0b7e8295f@kernel.org>
 <20251123.160941.475051668667578407.rene@exactco.de>
 <20251123.162551.979799191208988118.rene@exactco.de>
 <20260203064800.GA701088@ax162>
To: Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_DKIM_REJECT(1.00)[exactco.de:s=x];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com];
	TAGGED_FROM(0.00)[bounces-16544-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[exactco.de];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:linux-kbuild@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:nathan@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[rene@exactco.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[exactco.de:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[rene@exactco.de,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patreon.com:url,t2linux.com:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,system.map:url]
X-Rspamd-Queue-Id: C34A4D70B5
X-Rspamd-Action: no action

Hi,

On 3. Feb 2026, at 07:48, Nathan Chancellor <nathan@kernel.org> wrote:
>=20
> On Sun, Nov 23, 2025 at 04:25:51PM +0100, Ren=C3=A9 Rebe wrote:
>> Hey,
>>=20
>> On Sun, 23 Nov 2025 16:09:41 +0100 (CET), Ren=C3=A9 Rebe =
<rene@exactco.de> wrote:
>>=20
>>> On Sun, 23 Nov 2025 15:57:24 +0100, "Christophe Leroy (CS GROUP)" =
<chleroy@kernel.org> wrote:
>>>=20
>>>> Le 23/11/2025 =C3=A0 13:13, Ren=C3=A9 Rebe a =C3=A9crit :
>>>>> Building a size optimized ppc64 kernel (-Os), gcc emits more FP
>>>>> save/restore symbols, that the linker generates on demand into the
>>>>> .sfpr section. Explicitly allow-list those in =
scripts/mod/modpost.c,
>>>>> too. They are needed for the amdgpu in-kernel floating point =
support.
>>>>=20
>>>> Would have been interested to know with which version of GCC the
>>>> problem started.
>>>=20
>>> idk, maybe forever, or at least a decade fo GCC? Most devs probably
>>> don't build size optimized, and addtionally we only use in kernel
>>> floating point for amdgpu since recently? Should I add Fixes: for =
the
>>> in-kernel FP hash?
>>>=20
>>>> By the way you seem to fix the problem for modules, but does it =
also
>>>> work when amdgpu is in kernel ? I would have expected a need to add
>>>> functions in arch/powerpc/lib/crtsavres.S as well, just like =
following
>>>> commits:
>>>>=20
>>>> 8fe9c93e7453 ("powerpc: Add vr save/restore functions")
>>>> 7fca5dc8aa7a ("powerpc: Fix module building for gcc 4.5 and 64 =
bit")
>>>> da3de6df33f5 ("[POWERPC] Fix -Os kernel builds with newer gcc
>>>> versions")
>>>=20
>>> idk, I avoid linking that big stuff directly into the kernel and =
would
>>> need to specically test that, too. I guess I go do that now, too, =
...
>>=20
>> It appears built-in amdgpu FP somehow magically works for me:
>>=20
>> debug-linux:[linux-6.17]# grep DRM.*AMD .config
>> CONFIG_DRM_AMDGPU=3Dy
>> CONFIG_DRM_AMDGPU_SI=3Dy
>> CONFIG_DRM_AMDGPU_CIK=3Dy
>> CONFIG_DRM_AMDGPU_USERPTR=3Dy
>> CONFIG_DRM_AMD_ACP=3Dy
>> CONFIG_DRM_AMD_DC=3Dy
>> CONFIG_DRM_AMD_DC_FP=3Dy
>> CONFIG_DRM_AMD_DC_SI=3Dy
>> ...
>>  CC      =
drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_ddc.o
>>  CC      =
drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_log.o
>>  CC      =
drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.o
>>  CC      drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp.o
>>  CC      =
drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_execution.o
>>  CC      =
drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp1_transition.o
>>  CC      =
drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_execution.o
>>  CC      =
drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp2_transition.o
>>  AR      drivers/gpu/drm/amd/amdgpu/built-in.a
>>  AR      drivers/gpu/drm/built-in.a
>>  AR      drivers/gpu/built-in.a
>>  AR      drivers/built-in.a
>>  AR      built-in.a
>>  AR      vmlinux.a
>>  LD      vmlinux.o
>>  GEN     modules.builtin.modinfo
>>  GEN     modules.builtin
>>  MODPOST vmlinux.symvers
>>  CC      .vmlinux.export.o
>>  UPD     include/generated/utsversion.h
>>  CC      init/version-timestamp.o
>>  KSYMS   .tmp_vmlinux0.kallsyms.S
>>  AS      .tmp_vmlinux0.kallsyms.o
>>  LD      .tmp_vmlinux1
>>  NM      .tmp_vmlinux1.syms
>>  KSYMS   .tmp_vmlinux1.kallsyms.S
>>  AS      .tmp_vmlinux1.kallsyms.o
>>  LD      .tmp_vmlinux2
>>  NM      .tmp_vmlinux2.syms
>>  KSYMS   .tmp_vmlinux2.kallsyms.S
>>  AS      .tmp_vmlinux2.kallsyms.o
>>  LD      vmlinux.unstripped
>>  NM      System.map
>>  SORTTAB vmlinux.unstripped
>> make[3]: Nothing to be done for 'vmlinux.unstripped'.
>>  OBJCOPY vmlinux
>>=20
>> So I guess the patch is good to go after clarifying which kind of
>> Fixes: to use?
>=20
> Was this ever picked up or addressed elswhere?

Nope, still needs to be applied AFAICS ;-)

Thanks!

	Ren=C3=A9

>>>>> MODPOST Module.symvers
>>>>> ERROR: modpost: "_restfpr_20" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_restfpr_26" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_restfpr_22" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_savegpr1_27" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_savegpr1_25" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_restfpr_28" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_savegpr1_29" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_savefpr_20" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_savefpr_22" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> ERROR: modpost: "_restfpr_15" =
[drivers/gpu/drm/amd/amdgpu/amdgpu.ko]
>>>>> undefined!
>>>>> WARNING: modpost: suppressed 56 unresolved symbol warnings because
>>>>> there were too many)
>>>>> Signed-off-by: Ren=C3=A9 Rebe <rene@exactco.de>
>>>>> ---
>>>>> V2: description
>>>>> Theoretically for -stable, but no previous commit that broke it.
>>>>=20
>>>> In that case you have to add Cc: stable@vger.kernel.org
>>>> Add indeed it is likely a gcc upgrade that broke it, not a previous
>>>> commit.
>>>=20
>>> Should I then simply use enabling amdgpu dc_fp and in-kernel FP as =
the
>>> breaking commit for Fixes:?
>>>=20
>>> Thanks!
>>>=20
>>> Ren=C3=A9
>>>=20
>>>>> ---
>>>>>  scripts/mod/modpost.c | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>>>>> index 47c8aa2a6939..133dfa16308a 100644
>>>>> --- a/scripts/mod/modpost.c
>>>>> +++ b/scripts/mod/modpost.c
>>>>> @@ -602,6 +602,10 @@ static int ignore_undef_symbol(struct =
elf_info
>>>>> *info, const char *symname)
>>>>>   /* Special register function linked on all modules during final =
link of
>>>>>   .ko */
>>>>>   if (strstarts(symname, "_restgpr0_") ||
>>>>>      strstarts(symname, "_savegpr0_") ||
>>>>> +    strstarts(symname, "_restgpr1_") ||
>>>>> +    strstarts(symname, "_savegpr1_") ||
>>>>> +    strstarts(symname, "_restfpr_") ||
>>>>> +    strstarts(symname, "_savefpr_") ||
>>>>>      strstarts(symname, "_restvr_") ||
>>>>>      strstarts(symname, "_savevr_") ||
>>>>>      strcmp(symname, ".TOC.") =3D=3D 0)
>>>>=20
>>>=20
>>> --=20
>>> Ren=C3=A9 Rebe, ExactCODE GmbH, Berlin, Germany
>>> https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 =
https://patreon.com/renerebe
>>=20
>> --=20
>> Ren=C3=A9 Rebe, ExactCODE GmbH, Berlin, Germany
>> https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 =
https://patreon.com/renerebe

--=20
https://exactco.de =E2=80=A2 https://t2linux.com =E2=80=A2 =
https://patreon.com/renerebe


