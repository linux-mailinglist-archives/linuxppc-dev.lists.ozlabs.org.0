Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0E44EA432
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 02:40:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KS9h53MVwz3c4q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 11:40:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RataHu52;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aOELans+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=RataHu52; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=aOELans+; 
 dkim-atps=neutral
X-Greylist: delayed 550 seconds by postgrey-1.36 at boromir;
 Tue, 29 Mar 2022 10:17:44 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KS7s425H1z2xjY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 10:17:44 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1648508897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GW5piibXVKo9A/BIxG2OaJSsIL3nRb2gFVpSMD8Zngg=;
 b=RataHu52uLY+1j4O0rcSXT0F7L8lkLcVrcT9weAkzaKSC0NHIk3kvnB0qFAmfvDIlsEd0G
 UPZTvh7TgcalSd1NjpUx2DmQFqGZapNjbfS1SP9dFm7PLlrXhDbbKJaQePnxynRB6i580m
 j6ExbwCCgxEpnvnJtrTQioJk/TtTamCz93AG21LXrtGWDNLj5x3PzKowf6NJKDBdv2In6T
 SFHIAuVbgNhvLIZf52lVvPW/bj3bqilEfjSg6IVt2pNR0ffuYP/vkLbkT8Stt8Ous3Qlax
 Bc9PCNEBPEy1tyHAqwSE/gSh3gZUmCRoc/yd8/iF4MdHN+pFm90GiY7eASJ96Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1648508897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GW5piibXVKo9A/BIxG2OaJSsIL3nRb2gFVpSMD8Zngg=;
 b=aOELans+tovI5r1VYnU410Rrhjf4G2toTen/ParOs+ebyjfwwNbUXzKvkk4zFq8Hn7i6vn
 uY0etoAkLcKmnUCg==
To: Benjamin =?utf-8?Q?St=C3=BCrz?= <benni@stuerz.xyz>, andrew@lunn.ch
Subject: Re: [PATCH 04/22] x86: Replace comments with C99 initializers
In-Reply-To: <20220326165909.506926-4-benni@stuerz.xyz>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-4-benni@stuerz.xyz>
Date: Tue, 29 Mar 2022 01:08:16 +0200
Message-ID: <87lewtfzfj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 29 Mar 2022 11:39:33 +1100
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
Cc: linux-atm-general@lists.sourceforge.net, linux-ia64@vger.kernel.org,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 linux-pci@vger.kernel.org, robert.moore@intel.com, laforge@gnumonks.org,
 alim.akhtar@samsung.com, hpa@zytor.com, wcn36xx@lists.infradead.org,
 Benjamin =?utf-8?Q?St=C3=BCrz?= <benni@stuerz.xyz>, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, gregory.clement@bootlin.com,
 rafael.j.wysocki@intel.com, linux@armlinux.org.uk, krzk@kernel.org,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, rric@kernel.org, ajd@linux.ibm.com,
 arnd@arndb.de, kvalo@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, loic.poulain@linaro.org, bp@alien8.de,
 bhelgaas@google.com, mchehab@kernel.org, linux-media@vger.kernel.org,
 linux@simtec.co.uk, linux-arm-kernel@lists.infradead.org, devel@acpica.org,
 isdn@linux-pingi.de, tony.luck@intel.com, nico@fluxnic.net,
 gregkh@linuxfoundation.org, dmitry.torokhov@gmail.com,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 davem@davemloft.net, james.morse@arm.com, netdev@vger.kernel.org,
 fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com, pali@kernel.org,
 brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Benjamin,

On Sat, Mar 26 2022 at 17:58, Benjamin St=C3=BCrz wrote:

> This replaces comments with C99's designated
> initializers because the kernel supports them now.

the kernel has used designated array initializers for a very long time
simply because the kernel did not use pure C89 but C89 with GNU
extensions, i.e. -std=3Dgnu89, which include designated array
initializers. GCC supports this since 1998 with =3Dgnu89, so 'now' is
more than slightly off.

Explicit value assignment to enum constants are a different story. They
are neither designated initializers nor new in C99. The following
paragraph from the standard has not been changed since C89:

   "The identifiers in an enumerator list are declared as constants that
    have type int and may appear wherever such are permitted. An
    enumerator with =3D defines its enumeration constant as the value of
    the constant expression. If the first enumerator has no =3D, the value
    of its enumeration constant is 0. Each subsequent enumerator with no
    =3D defines its enumeration constant as the value of the constant
    expression obtained by adding 1 to the value of the previous
    enumeration constant. (The use of enumerators with =3D may produce
    enumeration constants with values that duplicate other values in the
    same enumeration.)"

Please make sure that your changelogs are factual. Making uninformed
claims is not helping your cause.

The most important part is the WHY:

    Why is the current code suboptimal?

    Why is the proposed change making it better, more correct, less
    error prone?

If you can't come up with proper technical answers for these questions
then why should it be changed?

>  enum regnames {
> -	GDB_AX,			/* 0 */
> +	GDB_AX =3D 0,

Linear enums without value assignment like here are not a problem at
all. Simply because they are well defined and well understood. See the
above quote of the standard.

Whether the explicit assignment is an improvement over the trailing
comment or not is a matter of taste and preference. There is absolutely
_zero_ technical advantage in using explicit value assignments in _this_
case and neither in many other cases of your series.

Also completely removing the comments here loses information:

> -	GDB_PC,			/* 8 also known as eip */
> -	GDB_PS,			/* 9 also known as eflags */

Can you map _PC to EIP and _PS to EFLAGS? I can't without digging
deep...

>  static const char *const mtrr_strings[MTRR_NUM_TYPES] =3D
>  {
> -	"uncachable",		/* 0 */
> -	"write-combining",	/* 1 */
> -	"?",			/* 2 */
> -	"?",			/* 3 */
> -	"write-through",	/* 4 */
> -	"write-protect",	/* 5 */
> -	"write-back",		/* 6 */
> +	[0] =3D "uncachable",
> +	[1] =3D "write-combining",
> +	[2] =3D "?",
> +	[3] =3D "?",
> +	[4] =3D "write-through",
> +	[5] =3D "write-protect",
> +	[6] =3D "write-back",

Again, while not supported in C89, the kernel uses designators in array
initializers for a very long time...

Linear array initializers like the mtrr strings are not a real problem
simply because there is no correlation and the code using the array
still has to make sure that the index into the array is what it expects
to be the content. Changing it from C89 automatic to explicit C99
designators does not help there at all.

It becomes a different story if you combine [enum] constants and arrays
and use the constants in code because then the change to the constants
will immediately be reflected in the array initializer. I.e. for this
case:

enum foo {
     BAR,
     BAZ,
     RAB,
     ZAR,
};

char foobar[] =3D {
     "bar",
     "baz",
     "rab",
     "zar",
};

it makes a difference if someone does:

  enum foo {
     BAR,
     BAZ,
+    MOO,
     RAB,
     ZAR,
  };

because then the related array initializer is obviously out of
order. With:

char *foobar[] =3D {
     [BAR] =3D "bar",
     [BAZ] =3D "baz",
     [RAB] =3D "rab",
     [ZAR] =3D "zar",
};

the existing values are still in the same place, just the newly added
value is a NULL pointer. It also does not matter when the fixup for the
missing array entry becomes:

  char *foobar[] =3D {
     [BAR] =3D "bar",
     [BAZ] =3D "baz",
     [RAB] =3D "rab",
     [ZAR] =3D "zar",
+    [MOO] =3D "moo",=20=20=20=20=20
  };

because the compiled result is still in enum order. While doing

  char foobar[] =3D {
     "bar",
     "baz",
     "rab",
     "zar",
+    "moo",
  };

would be blantantly wrong. See?

But that does not apply to any of your proposed changes.

So you really need to look at things and not just throw a mechanical
change scheme at it, which results even in failures like reported by
the 0-day robot against patch 10/22.

That said, I'm not completely opposed to those changes, but you really
have to come up with good reasons why they make sense aside of
cosmetical reasons.

Btw, the really important change regarding initializers between C89 and
C99 was the ability to initialize struct members explicitly.

In C89 the only way to initialize a struct was

   =3D { a, b, c, d }

which was way more error prone than the enum/array initializers. The
dangerous part or C89 struct initializers are changes to the struct
unless the change of the struct is actually triggering a type
mismatch.

But even that needs some serious inspection whether there is confusion
potential or not. The harmless example is a file local:

struct foo {
       unsigned int      id;
       unsigned int      flags;
};

and the C89 style initializer:

static struct foo[] {
       { ID_A, 0x01 },
       { ID_B, 0x02 },
       { ID_C, 0x01 },
};

which has a very low confusion potential simply because it's scope is
file local and well defined and unlikely to change.

A globally used structure is a different problem especially when it
becomes necessary to insert a new struct member in the middle instead of
appending it, changing the order, removing a member... That ends up in a
hard to diagnose disaster with C89 style unnamed initializers pretty
fast.

Ideally C89 style unnamed struct initializers should not be used at all,
but again it's a matter of common sense and justification whether it's
worth to change it just because.

Thanks,

        tglx
