Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE226BF879
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 08:31:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pdt3v4Slvz3f3f
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 18:31:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=rJmpHn1n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=rJmpHn1n;
	dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pdt2v6cTQz3bhD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 18:31:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679124636; i=markus.elfring@web.de;
	bh=2Ue8+379fDutTn7J9DBZcDWuZrxJPjTNlc7vuFSHT94=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=rJmpHn1n+JaqQ6ItrNWhym/N3q4laM5suDOq4T5nM3TJdZ7a76gdobV6/ntV5fBhL
	 JJ/PBEusXKhEBrsHOWDNuhAdAA87nDBuNTbnrFeJaPlyWRpDWhR0xkfybkJzQMum2U
	 rMIySJaGep+p9JytBelVO0RCHIivkqxKFGYOjnEA/wEu2xspwxyavXRxwpW2OBR2X6
	 KSdnzu+c3/w+bB8U6JEPSc1Ae7OU9h+s5pi0RS+AqSWsm+cZlLNuDE0Bf2TTroQ+zw
	 kYfGCoJtG78GsV+RIxFz0zTOIUQCrf7Bqq7dPGSnbkt5NM9B+rcIudWBFGsbigw+1J
	 51r4B351snNFw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mo6O7-1qJcbH03NT-00pP2H; Sat, 18
 Mar 2023 08:30:36 +0100
Message-ID: <2f5a00f6-f3fb-9f00-676a-acdcbef90c6c@web.de>
Date: Sat, 18 Mar 2023 08:30:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: powerpc/pseries: Fix exception handling in
 pSeries_reconfig_add_node()
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kernel-janitors@vger.kernel.org
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <0981dc33-95d0-4a1b-51d9-168907da99e6@web.de> <871qln8quw.fsf@linux.ibm.com>
 <a01643fd-1e4a-1183-2fa6-000465bc81f3@web.de> <87v8iz75ck.fsf@linux.ibm.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <87v8iz75ck.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nrXu9o1RWEyss7JnYRxXUWlz+FjOMFGmKla96LHwpfwW9GKcvXZ
 A66tiAfPrCo5unXHT7cLWnXXEg3rq6xA+uFPRcKX6d1eR4ryzMZy+frzUWsDhg59khKwLXW
 akE5oUdQV9bML+SSJFs8T0p3hpFB4dL//QEf/oHDmJnzWoOozMcOOgGtwKhfWu3T2643GZi
 odNQEbvTA8O+8nONcr7Gg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0ktdu+qVn9g=;ird6o2d6PfBr7fHOh/fpfXNIoW7
 qbn4oHrU2xXh0Me011KPFt72uFFFRRaOsugL5EbfSzIf3EYufD1wUzSAyqn4HqRuWcy2fVey1
 e2vov9sgfQGWhvnxXJpLs59j7HCpoGszhatn8RcqPM9pOlckHndt+pfDPnMZ+5BRGU8uGvSmr
 X47R8qL+2mU5vAGCiBYGOfh7EyCvckBwYBPkdf8kvoayKhln9WOqEwpGhWqThdIOUoMRMG4eQ
 KSoMlj0vftYmQj2WVII3/d0M7JGng9ulOtAj8qA/H+yEdU4Mx1UMMBOA3pkjf/E1/I0Y6jf7j
 D6nxHPp+zWbLirBOO66/9iKpih26D/RrDEd2aaM4FqLqILRpOHO6i4XSvuTB014yOExuG8+wB
 6ujWSXfziw8dLlgc8mbCAlqqryhWx0hAFssoNb9etBhkCRQSayqj002aSdrl8qoXicCec1mKO
 YaxHQnviUvgVj2wT93p3+vdbEjcs3v1aUfOOXDGBoS6HZLMyDvHtsW+Huem/Cos5zWFBzuhCz
 W/Rg2JJ4jkhHfNrTqZ37FTrFOklw4UCDw+oV82VKbjLemQuASeM03a9JaSkH+MgkPGR4H6f3/
 P3JaCH8DJayD8cM+ixC5nzoq2DfPXy7TkP8loXm2g2KbSGjaMfzZoNIfmDJ356oP5FH6itmMn
 dQlRWqn9SGA2z6npR4wFTXCcRtxx2wERjLiSEpqomhTsprhoEMux6X+s7bE3dNE9e3/4rxt6q
 dfSnHgeOZh1JGkoiPD8zD1Xv0Els7jqjdaMb9pCGzhXQY53g0qOMNeDEZtj2kUZuOLBi7JWc5
 i/jnLOwlT7NJrLOzUIJ6aPMyiLGgakjRz6E95cUKAlLZjgymrk2LcvIOqXpb6ZqHBOq4+ggG2
 /fty9LEruSEppMqVI8oaIyqCKNUs3P3sZKz2m2dLIhEVunLQEvHFvjlEB8TaSRAB/Jc5WAzM/
 Bms8gA==
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
Cc: Paul Moore <paul@paul-moore.com>, LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, cocci@inria.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>>> The label =E2=80=9Cout_err=E2=80=9D was used to jump to another point=
er check despite of
>>>> the detail in the implementation of the function =E2=80=9CpSeries_rec=
onfig_add_node=E2=80=9D
>>>> that it was determined already that the corresponding variable contai=
ned
>>>> a null pointer (because of a failed function call in two cases).
>>>>
>>>> 1. Thus return directly after a call of the function =E2=80=9Ckzalloc=
=E2=80=9D failed.
>>>>
>>>> 2. Use more appropriate labels instead.
>>>>
>>>> 3. Delete a redundant check.
>>>>
>>>> 4. Omit an explicit initialisation for the local variable =E2=80=9Cer=
r=E2=80=9D.
>>>>
>>>> This issue was detected by using the Coccinelle software.
>>> Is there a correctness or safety issue here?
>> I got the impression that the application of only a single label like =
=E2=80=9Cout_err=E2=80=9D
>> resulted in improvable implementation details.
> I don't understand what you're trying to say here.

What does hinder you to understand the presented change description better
at the moment?


> It doesn't seem to answer my question.


I hope that my answer will trigger further helpful considerations.


>>> The subject uses the word "fix" but the commit message doesn't seem to=
 identify one.
>> Can you find the proposed adjustments reasonable?
> In the absence of a bug fix or an improvement in readability, not really=
, sorry.

The views are varying for =E2=80=9Cprogramming bugs=E2=80=9D, aren't they?


> It adds to the function more goto labels and another return,

This is the suggested source code transformation.


> apparently to avoid checks

Can the support grow for such a programming goal?



> that are sometimes redundant

Can such implementation details become undesirable?


> (but not incorrect) at the C source code level.

Will this aspect affect further development concerns?



>> Please take another look at available information sources.
>> https://lore.kernel.org/cocci/f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.=
de/
> I wasn't cc'd on this and I'm not subscribed to any lists in the recipie=
nts
> for that message, so not sure how I would take "another" look. :-)

I imagine that you can benefit more from information which can be retrieve=
d
by archive interfaces also according to the mailing list of the Coccinelle=
 software.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/dev-tools/coccinelle.rst?h=3Dv6.3-rc2#n9

Regards,
Markus
