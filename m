Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4473EC291
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 14:31:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gn0CS0g92z3cLk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 22:31:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NPCfpJb1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=NPCfpJb1; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gn0Bq5PTZz309g
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Aug 2021 22:30:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gn0Bp5D5Rz9sX3;
 Sat, 14 Aug 2021 22:30:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1628944242;
 bh=Pkr3cszIxlLMnMLXrJT4ko5HkJAnTVD8qVcifK3aENE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NPCfpJb1e+c2pkOJXYK65NH8SpOP4V4DMMfk8JUcYwu1Wm2RrZlwghTUv2rMW83gH
 G65uSE2QttuC3tC47S9BJmUiJB9MLubZrYKeJ0WcKV5RY0zS8AOYUVVjd9xWeUmE+U
 XcAC2uyOk2pKZzVvgiFj9KOif2A94BxEbGre9uKxcPoYrVLc/GxYDp9mfBjfHkL2Qn
 x6zJpOUNMbnXdNnbI9wJdZWqcYI6fmP1pJo7Dy0l1kFovihsKQQbCy5o4k7ZJrvTqZ
 hNCRiDbU/oYW+t7mYeOXwbQ7uVb7cnBsssNiZ6ET22KUcjK87eS9b7Ng4gF1//+VO6
 oA4/OLsgufkkA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, kajoljain
 <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] powerpc/perf: Use stack siar instead of mfspr
In-Reply-To: <9662dfbf-d163-c313-745e-aeda0f638e98@csgroup.eu>
References: <20210813082450.429320-1-kjain@linux.ibm.com>
 <37c6279f-a05c-7dd9-b034-05ca524bc6b0@linux.ibm.com>
 <9662dfbf-d163-c313-745e-aeda0f638e98@csgroup.eu>
Date: Sat, 14 Aug 2021 22:30:41 +1000
Message-ID: <8735rcmcni.fsf@mpe.ellerman.id.au>
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 13/08/2021 =C3=A0 10:29, kajoljain a =C3=A9crit=C2=A0:
>>=20
>> On 8/13/21 1:54 PM, Kajol Jain wrote:
>>> Minor optimization in the 'perf_instruction_pointer' function code by
>>> making use of stack siar instead of mfspr.
>>>
>>> Fixes: 75382aa72f06 ("powerpc/perf: Move code to select SIAR or pt_regs
>>> into perf_read_regs")
>>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>>=20
>> Please ignore this patch-set as I mentioned wrong version number. I will=
 resend
>> this patch-set again with correct version. Sorry for the confusion.
>
> I fear you are creating even more confusion by sending a v1 after sending=
 a v2 ...

Yeah in future just reply to the v2 saying "oops I sent v2 instead of
v1" and leave it at that.

cheers
