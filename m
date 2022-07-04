Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9AA565221
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 12:23:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc22x1NGbz3c3Z
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 20:23:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc22X0qpZz30DX
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 20:23:32 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc22W5T6qz4xYN;
	Mon,  4 Jul 2022 20:23:31 +1000 (AEST)
Date: Mon, 04 Jul 2022 20:23:29 +1000
From: Michael Ellerman <michael@ellerman.id.au>
To: =?ISO-8859-1?Q?Pali_Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
User-Agent: K-9 Mail for Android
In-Reply-To: <20220702094405.tp7eo4df7fjvn2ng@pali>
References: <20220524093939.30927-1-pali@kernel.org> <20220702094405.tp7eo4df7fjvn2ng@pali>
Message-ID: <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2 July 2022 7:44:05 pm AEST, "Pali Roh=C3=A1r" <pali@kernel=2Eorg> wrot=
e:
>On Tuesday 24 May 2022 11:39:39 Pali Roh=C3=A1r wrote:
>> gcc e500 compiler does not support -mcpu=3Dpowerpc option=2E When it is
>> specified then gcc throws compile error:
>>=20
>>   gcc: error: unrecognized argument in option =E2=80=98-mcpu=3Dpowerpc=
=E2=80=99
>>   gcc: note: valid arguments to =E2=80=98-mcpu=3D=E2=80=99 are: 8540 85=
48 native
>>=20
>> So do not set -mcpu=3Dpowerpc option when CONFIG_E500 is set=2E Correct=
 option
>> -mcpu=3D8540 for CONFIG_E500 is set few lines below in that Makefile=2E
>>=20
>> Signed-off-by: Pali Roh=C3=A1r <pali@kernel=2Eorg>
>> Cc: stable@vger=2Ekernel=2Eorg
>
>Michael, do you have any objections about this patch?

I don't particularly like it :)

From=20the discussion with Segher, it sounds like this is a problem with a s=
pecific build of gcc that you're using, not a general problem with gcc buil=
t with e500 support=2E

Keying it off CONFIG_E500 means it will fix your problem, but not anyone e=
lse who has a different non-e500 compiler that also doesn't support -mcpu=
=3Dpowerpc (for whatever reason)=2E

So I wonder if a better fix is to use cc-option when setting -mcpu=3Dpower=
pc=2E

cheers
