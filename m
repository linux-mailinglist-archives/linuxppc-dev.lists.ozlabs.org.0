Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2BC87E28C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 04:25:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aZwR6Ce1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TygGy17cpz3dnN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 14:25:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aZwR6Ce1;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TygGC2Wnyz3bmy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 14:25:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1710732306;
	bh=NV+IEiKEp7lCdjzjbneFkp6G29/AFeVDyz/GqmHX3m4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aZwR6Ce11vNXim4mOCh1eXkx7K65RfM+cau+BhgB9SdLqlZPW+NSBiMfH6HvhOd0A
	 Cxq4iA45zUMfJd0t0fiCZUW9oT7MdElC1lAHDwjgYhkFVet+3SexBY3VTuWZ+t2GS/
	 R6YtLN+mqg6XUSgVsgcCPTEOKRlHDfSmPt/ef1FfXW6waLfQPAdiG7JMm/zsq5BT3k
	 vdQUUXBAz8sJiI6L7YfwQCfB8GuYQWxC3Reysu8xNTnmju7VZ+DNwIB5BF60uJsyDk
	 OdmHw4LQNlhzuekWxZGLa0lNLJlIa+tl6Z4Z3Fg6YFxfGk0yqItTN1sXJzV54NgtGp
	 w8QwwUGGGIyQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TygG42yLDz4wc1;
	Mon, 18 Mar 2024 14:25:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Guenter Roeck <linux@roeck-us.net>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
In-Reply-To: <04f34097-7788-490d-a9c2-82b44bf6af44@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
 <CAMuHMdUkvagJVEfnhq=Nx2jnmdS0Ax+zy1CvyN0k7k1EwUpu+g@mail.gmail.com>
 <6d9269c0-bd38-4965-a454-4358e0a182e3@roeck-us.net>
 <04f34097-7788-490d-a9c2-82b44bf6af44@roeck-us.net>
Date: Mon, 18 Mar 2024 14:24:59 +1100
Message-ID: <87ttl4z0fo.fsf@mail.lhotse>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, netdev@lists.linux.dev, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmerma
 nn@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guenter Roeck <linux@roeck-us.net> writes:
> On 3/14/24 07:37, Guenter Roeck wrote:
>> On 3/14/24 06:36, Geert Uytterhoeven wrote:
>>> Hi G=C3=BCnter,
>>>
>>> On Tue, Mar 12, 2024 at 6:03=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
>>>> Some unit tests intentionally trigger warning backtraces by passing bad
>>>> parameters to kernel API functions. Such unit tests typically check the
>>>> return value from such calls, not the existence of the warning backtra=
ce.
>>>>
>>>> Such intentionally generated warning backtraces are neither desirable
>>>> nor useful for a number of reasons.
>>>> - They can result in overlooked real problems.
>>>> - A warning that suddenly starts to show up in unit tests needs to be
>>>> =C2=A0=C2=A0 investigated and has to be marked to be ignored, for exam=
ple by
>>>> =C2=A0=C2=A0 adjusting filter scripts. Such filters are ad-hoc because=
 there is
>>>> =C2=A0=C2=A0 no real standard format for warnings. On top of that, suc=
h filter
>>>> =C2=A0=C2=A0 scripts would require constant maintenance.
>>>>
>>>> One option to address problem would be to add messages such as "expect=
ed
>>>> warning backtraces start / end here" to the kernel log.=C2=A0 However,=
 that
>>>> would again require filter scripts, it might result in missing real
>>>> problematic warning backtraces triggered while the test is running, and
>>>> the irrelevant backtrace(s) would still clog the kernel log.
>>>>
>>>> Solve the problem by providing a means to identify and suppress specif=
ic
>>>> warning backtraces while executing test code. Support suppressing mult=
iple
>>>> backtraces while at the same time limiting changes to generic code to =
the
>>>> absolute minimum. Architecture specific changes are kept at minimum by
>>>> retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
>>>> CONFIG_KUNIT are enabled.
>>>>
>>>> The first patch of the series introduces the necessary infrastructure.
>>>> The second patch introduces support for counting suppressed backtraces.
>>>> This capability is used in patch three to implement unit tests.
>>>> Patch four documents the new API.
>>>> The next two patches add support for suppressing backtraces in drm_rect
>>>> and dev_addr_lists unit tests. These patches are intended to serve as
>>>> examples for the use of the functionality introduced with this series.
>>>> The remaining patches implement the necessary changes for all
>>>> architectures with GENERIC_BUG support.
>>>
>>> Thanks for your series!
>>>
>>> I gave it a try on m68k, just running backtrace-suppression-test,
>>> and that seems to work fine.
>>>
>>>> Design note:
>>>> =C2=A0=C2=A0 Function pointers are only added to the __bug_table secti=
on if both
>>>> =C2=A0=C2=A0 CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled to a=
void image
>>>> =C2=A0=C2=A0 size increases if CONFIG_KUNIT=3Dn. There would be some b=
enefits to
>>>> =C2=A0=C2=A0 adding those pointers all the time (reduced complexity, a=
bility to
>>>> =C2=A0=C2=A0 display function names in BUG/WARNING messages). That cha=
nge, if
>>>> =C2=A0=C2=A0 desired, can be made later.
>>>
>>> Unfortunately this also increases kernel size in the CONFIG_KUNIT=3Dm
>>> case (ca. 80 KiB for atari_defconfig), making it less attractive to have
>>> kunit and all tests enabled as modules in my standard kernel.
>>>
>>=20
>> Good point. Indeed, it does. I wanted to avoid adding a configuration op=
tion,
>> but maybe I should add it after all. How about something like this ?
>>=20
>> +config KUNIT_SUPPRESS_BACKTRACE
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool "KUnit - Enable backtrace sup=
pression"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default y
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enable backtrace suppr=
ession for KUnit. If enabled, backtraces
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generated intentionall=
y by KUnit tests can be suppressed. Disable
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to reduce kernel image=
 size if image size is more important than
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suppression of backtra=
ces generated by KUnit tests.
>
> Any more comments / feedback on this ? Otherwise I'll introduce the
> above configuration option in v2 of the series.
>
> In this context, any suggestions if it should be enabled or disabled by
> default ? I personally think it would be more important to be able to
> suppress backtraces, but I understand that others may not be willing to
> accept a ~1% image size increase with CONFIG_KUNIT=3Dm unless
> KUNIT_SUPPRESS_BACKTRACE is explicitly disabled.

Please enable it by default.

There are multiple CI systems that will benefit from it, whereas the
number of users enabling KUNIT in severely spaced constrainted
environments is surely small - perhaps just Geert ;).

cheers
