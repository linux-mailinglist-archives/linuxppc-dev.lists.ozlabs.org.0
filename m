Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 602EE32E756
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 12:44:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsQrD2ZMZz3dJy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 22:44:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YCW3yOV5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YCW3yOV5; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsQqr1mMMz3cGs
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 22:44:07 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DsQqj0TBXz9sWL;
 Fri,  5 Mar 2021 22:44:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1614944641;
 bh=SFTN3pvD7WygrPK8345qUzj/Yiy79Aui/vKNcyYo1LU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YCW3yOV5cOUSmUMmyms3tOismZLI9sjylaqzifzV7Obbez3s6noEcH1EItlJ2FtO7
 59C5rksyJB2tF5TxHrCeVwR8sDItttmQ+vwXfUo2EBjMAJNqa2D3Dr1ObN0CX3OaVX
 R7fZ0V8FR3GxSu/Z3ANBcrAqYCB20hRGyz/4U2Fm4QsYjOqg0ET5d1JUHnKHYSaNqX
 bvOaCyI1He1BYYs77/73rQC0lGKR8zYVbO2i13A3523xx7JIDPT67CfVjmeoThqijf
 p9Kv0JPRNTY5M2mFPqTeyffX9ycAsHZv8vFr2loJywXoMbrtnUoX05eCh/zNHwp7su
 IloIeuJoxDwLQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Laurent Dufour <ldufour@linux.ibm.com>, benh@kernel.crashing.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: export LPAR security flavor in lparcfg
In-Reply-To: <2c67c119-c1ec-b079-da54-0bf2f316c734@linux.ibm.com>
References: <20210304114240.54112-1-ldufour@linux.ibm.com>
 <871rcuruee.fsf@mpe.ellerman.id.au>
 <2c67c119-c1ec-b079-da54-0bf2f316c734@linux.ibm.com>
Date: Fri, 05 Mar 2021 22:43:55 +1100
Message-ID: <87wnulrfk4.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, cheloha@linux.ibm.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> Le 05/03/2021 =C3=A0 07:23, Michael Ellerman a =C3=A9crit=C2=A0:
>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>> This is helpful to read the security flavor from inside the LPAR.
>>=20
>> We already have /sys/kernel/debug/powerpc/security_features.
>>=20
>> Is that not sufficient?
>
> Not really, it only reports that security mitigation are on or off but no=
t the=20
> level set through the ASMI menu. Furthermore, reporting it through
> /proc/powerpc/lparcfg allows an easy processing by the lparstat command (=
see below).
>
>>=20
>>> Export it like this in /proc/powerpc/lparcfg:
>>>
>>> $ grep security_flavor /proc/powerpc/lparcfg
>>> security_flavor=3D1
>>>
>>> Value means:
>>> 0 Speculative execution fully enabled
>>> 1 Speculative execution controls to mitigate user-to-kernel attacks
>>> 2 Speculative execution controls to mitigate user-to-kernel and
>>>    user-to-user side-channel attacks
>>=20
>> Those strings come from the FSP help, but we have no guarantee it won't
>> mean something different in future.
>
> I think this is nailed down, those strings came from:
> https://www.ibm.com/support/pages/node/715841
>
> Where it is written (regarding AIX):
>
> On an LPAR, one can use lparstat -x to display the current mitigation mod=
e:
> 0 =3D Speculative execution fully enabled
> 1 =3D Speculative execution controls to mitigate user-to-kernel side-chan=
nel attacks
> 2 =3D Speculative execution controls to mitigate user-to-kernel and user-=
to-user=20
> side-channel attacks
>
> We have been requested to provide almost the same, which I proposed in=20
> powerpc-utils:
> https://groups.google.com/g/powerpc-utils-devel/c/NaKXvdyl_UI/m/wa2stpIDA=
QAJ

OK. Do you mind sending a v2 with all those details incorporated into
the change log?

cheers
