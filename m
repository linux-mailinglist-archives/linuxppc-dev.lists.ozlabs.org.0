Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D965852A1AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 14:38:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2bJ559JYz3by3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 22:38:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=C/J/2V71;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2bHW6J5jz3bbB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 22:37:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=C/J/2V71; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L2bHV08zxz4xZv;
 Tue, 17 May 2022 22:37:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652791062;
 bh=FMyee9OENISgTkcRL2lDzqNzBk6D+Eq37HFU7uSV9Kw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=C/J/2V71XquPDWSFjL4+RG+V7Wb1EPOhDxFESsN9vY1L+tnh9zyXVF1ILe/9ji4oD
 aHzWGWm4WM0rp2hhjvthb/qcRNjSWcyLhM3oW6wGwxzysluEZW04jfbZ0AR0ESveBU
 sg4Mb1nA/GnKxjKrc8NR4V/MN+QMWR3Ska0JdTvrl98NAfEo4u7qXA8Mlvp+3sDWb7
 ely8CzT5pD+8SHyH2xFGeh2ntJ58Pm0DtTWY8epK91VqduraNtRHjm2C7oNMmFZfhw
 Stb5wama/Dvb+ODb8lHr08O3xtHnAR/iTAYC4ABLxvlFj0cuwL36KpGyiXvfUulwkO
 G7kap7n26YJbQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <patch-notifications@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v1 0/4] Kill the time spent in patch_instruction()
In-Reply-To: <f1481139-9ed6-3e00-e73e-87d4319c614d@csgroup.eu>
References: <cover.1647962456.git.christophe.leroy@csgroup.eu>
 <165261053687.1047019.4165741740473209888.b4-ty@ellerman.id.au>
 <f1481139-9ed6-3e00-e73e-87d4319c614d@csgroup.eu>
Date: Tue, 17 May 2022 22:37:38 +1000
Message-ID: <874k1opc6l.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 15/05/2022 =C3=A0 12:28, Michael Ellerman a =C3=A9crit=C2=A0:
>> On Tue, 22 Mar 2022 16:40:17 +0100, Christophe Leroy wrote:
>>> This series reduces by 70% the time required to activate
>>> ftrace on an 8xx with CONFIG_STRICT_KERNEL_RWX.
>>>
>>> Measure is performed in function ftrace_replace_code() using mftb()
>>> around the loop.
>>>
>>> With the series,
>>> - Without CONFIG_STRICT_KERNEL_RWX, 416000 TB ticks are measured.
>>> - With CONFIG_STRICT_KERNEL_RWX, 546000 TB ticks are measured.
>>>
>>> [...]
>>=20
>> Patches 1, 3 and 4 applied to powerpc/next.
>>=20
>> [1/4] powerpc/code-patching: Don't call is_vmalloc_or_module_addr() with=
out CONFIG_MODULES
>>        https://git.kernel.org/powerpc/c/cb3ac45214c03852430979a43180371a=
44b74596
>> [3/4] powerpc/code-patching: Use jump_label for testing freed initmem
>>        https://git.kernel.org/powerpc/c/b033767848c4115e486b1a51946de3be=
e2ac0fa6
>> [4/4] powerpc/code-patching: Use jump_label to check if poking_init() is=
 done
>>        https://git.kernel.org/powerpc/c/1751289268ef959db68b0b6f798d904d=
6403309a
>>=20
>
> Patch 2 was the keystone of this series. What happened to it ?

It broke on 64-bit. I think I know why but I haven't had time to test
it. Will try and get it fixed in the next day or two.

cheers
