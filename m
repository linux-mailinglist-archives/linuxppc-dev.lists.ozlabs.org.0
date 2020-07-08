Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 679DE218A36
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 16:34:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B21zM2jZXzDqZN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 00:34:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=nGr0+5sg; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B21wm5RwMzDqZN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 00:32:23 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 245271B5E9C;
 Wed,  8 Jul 2020 10:32:21 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id t64FsfMOBAuY; Wed,  8 Jul 2020 10:32:20 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id C83E01B5E9B;
 Wed,  8 Jul 2020 10:32:20 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com C83E01B5E9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1594218740;
 bh=pALzdJlYIeC43ng6IOS8IKLE2tdzidwPCV7EGfLR2OA=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=nGr0+5sgJVofFt29l3rXYOyljti84ExwiifJRZKVgJqtl9+f9ra1Ibzg/8Bxl64ic
 x/mhjZukduaR9LUpwTAmZfeO/TWt4W99r0vQdWoGctaIfXDwYMorV++SfXyaynOMq/
 R0H5ehzRaS3jfxyTgel+laK0mQbkr2CnrIuDd+KEF72P/gS0E2LPLgxFcBj61ZSVSV
 aEy3m2daRPluVHxqo8V78xo/OfW8E7UuoUI45piRiB1l8GTFPiSqa+xiRD83vAGKJp
 YdWHCxqu/2WgMLeaPnOlGZcB/McLV1XqWOjuAGRSH648uWtopUTdv2qTPRZqfDLl7O
 650S0pAkvbTew==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3ytl5xDw_ZY6; Wed,  8 Jul 2020 10:32:20 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id BCA381B5E9A;
 Wed,  8 Jul 2020 10:32:20 -0400 (EDT)
Date: Wed, 8 Jul 2020 10:32:20 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1137155888.2676.1594218740683.JavaMail.zimbra@efficios.com>
In-Reply-To: <96994487-ae4a-3bfb-b0f1-34228e51bea2@csgroup.eu>
References: <972420887.755.1594149430308.JavaMail.zimbra@efficios.com>
 <20200708005922.GW3598@gate.crashing.org>
 <841816533.1735.1594211583710.JavaMail.zimbra@efficios.com>
 <1623833219.1877.1594216801865.JavaMail.zimbra@efficios.com>
 <96994487-ae4a-3bfb-b0f1-34228e51bea2@csgroup.eu>
Subject: Re: Failure to build librseq on ppc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: Failure to build librseq on ppc
Thread-Index: 06yJtaljCBbbI+2aEUpB/bOBXHcqEA==
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
Cc: Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Jeanson <mjeanson@efficios.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----- On Jul 8, 2020, at 10:21 AM, Christophe Leroy christophe.leroy@csgrou=
p.eu wrote:

> Le 08/07/2020 =C3=A0 16:00, Mathieu Desnoyers a =C3=A9crit=C2=A0:
>> ----- On Jul 8, 2020, at 8:33 AM, Mathieu Desnoyers
>> mathieu.desnoyers@efficios.com wrote:
>>=20
>>> ----- On Jul 7, 2020, at 8:59 PM, Segher Boessenkool segher@kernel.cras=
hing.org
>>> wrote:
>> [...]
>>>>
>>>> So perhaps you have code like
>>>>
>>>>   int *p;
>>>>   int x;
>>>>   ...
>>>>   asm ("lwz %0,%1" : "=3Dr"(x) : "m"(*p));
>>>
>>> We indeed have explicit "lwz" and "stw" instructions in there.
>>>
>>>>
>>>> where that last line should actually read
>>>>
>>>>   asm ("lwz%X1 %0,%1" : "=3Dr"(x) : "m"(*p));
>>>
>>> Indeed, turning those into "lwzx" and "stwx" seems to fix the issue.
>>>
>>> There has been some level of extra CPP macro coating around those instr=
uctions
>>> to
>>> support both ppc32 and ppc64 with the same assembly. So adding %X[arg] =
is not
>>> trivial.
>>> Let me see what can be done here.
>>=20
>> I did the following changes which appear to generate valid asm.
>> See attached corresponding .S output.
>>=20
>> I grepped for uses of "m" asm operand in Linux powerpc code and noticed =
it's
>> pretty much
>> always used with e.g. "lwz%U1%X1". I could find one blog post discussing=
 that %U
>> is about
>> update flag, and nothing about %X. Are those documented ?
>=20
> As far as I can see, %U is mentioned in
> https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html in the
> powerpc subpart, at the "m" constraint.

Yep, I did notice it, but mistakenly thought it was only needed for "m<>" o=
perand,
not "m".

Thanks,

Mathieu

>=20
> For the %X I don't know.
>=20
> Christophe
>=20
>>=20
>> Although it appears to generate valid asm, I have the feeling I'm relyin=
g on
>> undocumented
>> features here. :-/

--=20
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
