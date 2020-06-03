Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B8C1ECDDD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 12:54:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cQkz0zQlzDqZC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 20:54:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cQhV4x4NzDqKg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 20:51:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=GI4BOJdI; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49cQhG1cflz9sPF;
 Wed,  3 Jun 2020 20:51:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591181513;
 bh=HEbuUuqzYKRzFAwS9qP/euNBCXXIojtAorAtB55RG+g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GI4BOJdI7R9phxlk9/LTfiVhHEoI1zIW/xMxkhszVjxonI1SySK9IBC78y3O/4vDf
 eDoCS1hCFhiIYou6IKgadBDdl5sdOlAMjQC1875eHFGwk92+YhsxEXxQeo65cXx+7q
 w4oK9KvmKJ1GhlrJO3nt+9OXCwfLwm5X2U9SOzYjAbNe0KzJOOKaMq1ONpfm0tBBM3
 fH45gWmBBXN7fZIiP0s3Sgnn2FkHp5kQh4anTXDctIZyBr8OZVRgP+1o8SdAdmUCX0
 gNwbf+nfmQfigEhG0OEKVTeNnYZzewHe51L+YkLeIayUTLrVNDdhXqJak/DOs8mdcD
 LbJXwhVjiT3UA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michal Simek <michal.simek@xilinx.com>, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
In-Reply-To: <aad5c6c5-b84a-7a6d-3f07-f45dd1dd85d1@csgroup.eu>
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <87imikufes.fsf@mpe.ellerman.id.au>
 <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
 <87y2rftrx7.fsf@mpe.ellerman.id.au> <s5hk12z4hj5.wl-tiwai@suse.de>
 <02e7f790-b105-de67-799c-0fe065e58320@xilinx.com>
 <c22540fb-1c54-b718-9045-3ee645c30322@monstr.eu>
 <87wo4yerom.fsf@mpe.ellerman.id.au>
 <4b807ebc-8d8f-ad76-f5e2-9ce8410dc70c@xilinx.com>
 <aad5c6c5-b84a-7a6d-3f07-f45dd1dd85d1@csgroup.eu>
Date: Wed, 03 Jun 2020 20:52:07 +1000
Message-ID: <87wo4oh160.fsf@mpe.ellerman.id.au>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 sfr@canb.auug.org.au, Jonathan Corbet <corbet@lwn.net>, maz@kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Wei Hu <weh@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Hi,
>
> Le 03/06/2020 =C3=A0 10:10, Michal Simek a =C3=A9crit=C2=A0:
>> Hi Michael,
>>=20
>> On 26. 05. 20 15:44, Michael Ellerman wrote:
>>> Michal Simek <monstr@monstr.eu> writes:
>>>> Hi Michael,
>>>>
>>>> On 01. 04. 20 13:30, Michal Simek wrote:
>>>>> On 01. 04. 20 12:38, Takashi Iwai wrote:
>>>>>> On Wed, 01 Apr 2020 12:35:16 +0200,
>>>>>> Michael Ellerman wrote:
>>>>>>>
>>>>>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>>>>>> On 01. 04. 20 4:07, Michael Ellerman wrote:
>>>>>>>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> recently we wanted to update xilinx intc driver and we found tha=
t function
>>>>>>>>>> which we wanted to remove is still wired by ancient Xilinx Power=
PC
>>>>>>>>>> platforms. Here is the thread about it.
>>>>>>>>>> https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bb=
abfa2e8@xilinx.com/
>>>>>>>>>>
>>>>>>>>>> I have been talking about it internally and there is no interest=
 in these
>>>>>>>>>> platforms and it is also orphan for quite a long time. None is r=
eally
>>>>>>>>>> running/testing these platforms regularly that's why I think it =
makes sense
>>>>>>>>>> to remove them also with drivers which are specific to this plat=
form.
>>>>>>>>>>
>>>>>>>>>> U-Boot support was removed in 2017 without anybody complain abou=
t it
>>>>>>>>>> https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c=
069821bbba10273a0a8ed
>>>>>>>>>>
>>>>>>>>>> Based on current ppc/next.
>>>>>>>>>>
>>>>>>>>>> If anyone has any objection about it, please let me know.
>>>>>>>>>
>>>>>>>>> Thanks for taking the time to find all this code and remove it.
>>>>>>>>>
>>>>>>>>> I'm not going to take this series for v5.7, it was posted too clo=
se to
>>>>>>>>> the merge window, and doing so wouldn't give people much time to =
object,
>>>>>>>>> especially given people are distracted at the moment.
>>>>>>>>>
>>>>>>>>> I'm happy to take it for v5.8, assuming there's no major objectio=
ns.
>>>>>>>>
>>>>>>>> Sure. Just to let you know Christophe Leroy included this patch in=
 his
>>>>>>>> series about ppc405 removal. It should be the same.
>>>>>>>>
>>>>>>>> If you don't want to take that alsa patch I can send it separately=
 and
>>>>>>>> this patch can be taken from his series. I don't really mind but p=
lease
>>>>>>>> let me know what way you prefer.
>>>>>>>
>>>>>>> It's better to keep it all together, so I'm happy take the alsa pat=
ch as
>>>>>>> well, it's already been acked.
>>>>
>>>> Can you please take this series? I know that there is v5 from Christop=
he
>>>> which has this 1/2 as 1/13. But I need this alsa patch too and I would
>>>> like to close this because it is around for almost 2 months and none
>>>> raised a concern about removing just these Xilinx platforms.
>>>
>>> Sorry I meant to reply to your last mail.
>>>
>>> I have Christophe's series in my testing branch, planning for it to be
>>> in v5.8.
>>>
>>> Even if the rest of his series doesn't make it for some reason, as you
>>> say the Xilinx removal is uncontroversial so I'll keep that in.
>>>
>>> I forgot about the sound patch, I'll pick that up as well.
>>=20
>> I took a look at your
>> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git repo
>> and I can't see any branch with my patches.
>> Also was checking linux-next and my patches are also not there.
>> That's why I am curious if this will be go v5.8 in MW.
>
> I see them in=20
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git in=20
> next-test branch.

Which =3D=3D the next branch, which is what will go into v5.8, all going
well.

cheers
