Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D886F6425
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 May 2023 06:52:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBhJ41NPqz3f8b
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 May 2023 14:52:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CFWOXw17;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBhHB5SpRz2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 May 2023 14:51:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CFWOXw17;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QBhH755bYz4x3d;
	Thu,  4 May 2023 14:51:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683175894;
	bh=cUS8uo7qVHMFVreThOSd9teSkk8/ORgq6RL0jw+H2ig=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CFWOXw17tNMXcnH48bZYFLZ96J1kiA3QB8j2KZIk7hpxyr4PxMnQlzRHMAW27FyZS
	 oYxIc18qXqxqW4shG3E/FJE8QDVQRY6E50DkhGVvpHdfjOHC28BtVmdrjEEkxG1v61
	 eR3U5E9N/xKG72jb+/RSJI9i2HcqLm+IFJs8gPg5GfmtPyXTouQAEW9dH2JXUKZkSU
	 WIN7MyXc7w1FG+QTiENLEf1J5cUGE7SMstkKLYQ8xySre3ECkC9F0D1Qvlqfake5Ic
	 4AqDCy84PpmQ4sBwOM7G5i3GrYIUAcnugbW8grWqaTOHzIjEyaIXOH9nRuBzpM/w+i
	 HucUCDQueAHfA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>, Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
In-Reply-To: <CAL_JsqL0553MTttABaPkL3WFjp-XG_4RtVab1QMsxUiMQC3Ysw@mail.gmail.com>
References: <CAL_JsqLZhWZqS7mcyvAEu=m_TmkoZ5V4h54Jh25+Ms0J1_z9Fw@mail.gmail.com>
 <77078121-46E6-48D6-9D73-0C6D586FE410@xenosoft.de>
 <CAL_JsqL0553MTttABaPkL3WFjp-XG_4RtVab1QMsxUiMQC3Ysw@mail.gmail.com>
Date: Thu, 04 May 2023 14:51:31 +1000
Message-ID: <875y988zsc.fsf@mail.lhotse>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring <robh@kernel.org> writes:
> On Wed, May 3, 2023 at 12:40=E2=80=AFPM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
>>
>> > On 3. May 2023, at 18:51, Rob Herring <robh@kernel.org> wrote:
>> >
>> > =EF=BB=BFOn Wed, May 3, 2023 at 11:27=E2=80=AFAM Christophe Leroy
>> > <christophe.leroy@csgroup.eu> wrote:
>> >>
>> >> +Rob as he's the commit's Author.
>> >>
>> >>> Le 03/05/2023 =C3=A0 17:46, Christian Zigotzky a =C3=A9crit :
>> >>> On 02 May 2023 at 11:28 am, Michael Ellerman wrote:
>> >>>> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
>> >>>>> Hello,
>> >>>>>
>> >>>>> Our PASEMI Nemo board [1] doesn't boot with the PowerPC updates 6.=
4-1
>> >>>>> [2].
>> >>>>>
>> >>>>> The kernel hangs right after the booting Linux via __start() @
>> >>>>> 0x0000000000000000 ...
>> >>>>>
>> >>>>> I was able to revert the PowerPC updates 6.4-1 [2] with the follow=
ing
>> >>>>> command: git revert 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7 -m 1
>> >>>>>
>> >>>>> After a re-compiling, the kernel boots without any problems withou=
t the
>> >>>>> PowerPC updates 6.4-1 [2].
>> >>>>>
>> >>>>> Could you please explain me, what you have done in the boot area?
>> >>>> There's a few possibilities, but nothing obvious.
>> >>>>
>> >>>> To begin with can you please test the following commits?
>> >>>>
>> >>>> 77e69ee7ce07
>> >>>> e4ab08be5b49
>> >>>> eeac8ede1755
>> >>>>
>> >>>> cheers
>> >>> git revert e4ab08be5b4902e5b350b0e1e1a3c25eb21d76d4
>> >>>
>> >>> [master 0086e2cbbec0] Revert "powerpc/isa-bridge: Remove open coded
>> >>> "ranges" parsing"
>> >>>  1 file changed, 129 insertions(+), 37 deletions(-)
>> >>>
>> >>> After a recompiling it boots without any problems.
>> >>>
>> >>> e4ab08be5b49 -- powerpc/isa-bridge: Remove open coded "ranges" parsi=
ng
>> >>> is the bad commit.
>> >
>> > Could I get a DT file for this board?
>> >
>> > In the meantime, just revert this commit. I don't think I'll be able
>> > to fix it before I'm out on sabbatical.
>>
>> FYI:
>>
>> Darren Stevens wrote:
>>
>> The dtb passed by the CFE firmware has a number of issues, which up till
>> now have been fixed by use of patches applied to the mainline kernel.
>> This occasionally causes problems with changes made to mainline.
>
> Changing the firmware is not the only way to modify the DT. Perhaps a
> DT overlay would work better than carrying patches if the patches
> aren't upstreamable. It kind of depends on how early you'd need to
> apply the overlay and whether you'd need external phandles (aka
> __symbols__ node, which the base DTB wouldn't support).

We already have some code that changes various things about the DT on
those boards. See fixup_device_tree_pasemi().

> Looking at the DT, I think this change might fix it. Can you test this ch=
ange:
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index e692809ff822..475b74413fdd 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -284,7 +284,7 @@ EXPORT_SYMBOL(of_range_to_resource);
>
>  static int of_bus_isa_match(struct device_node *np)
>  {
> -       return of_node_name_eq(np, "isa");
> +       return of_node_is_type(np, "isa") || of_node_name_eq(np, "isa");
>  }

The fixup code can't change a nodes name though AFAIK, so we may still
need this fix.

cheers
