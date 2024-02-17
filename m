Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E367C8592F4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 22:24:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=QpzN84Zz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tchds1cdbz3bqQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Feb 2024 08:24:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=QpzN84Zz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tchd20W1vz2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Feb 2024 08:24:05 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 2B1978285AD4;
	Sat, 17 Feb 2024 15:24:01 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id dViB4qD38NAx; Sat, 17 Feb 2024 15:24:00 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id F3CB88286A60;
	Sat, 17 Feb 2024 15:23:59 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com F3CB88286A60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1708205040; bh=uHqsQNWIrmcOAMCrqHr0c6QjQvVJmSElQ/5GCW42mp0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=QpzN84ZzzEX5AsIpanW56RhyCup2P0jGQB1wUpQVreQ77W63idN+00KDQ/R6f+ghz
	 BQSIf8IZycHSIeWrm69Sy48hhwn+MxZYLtNIfBKPS8QjQ7GgVXWzLStsELnt764iwC
	 A+NFdBF/y4CA9GA9xfKq2PSO6sXffuJUzbgrlOWw=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dzg64Fn2TMaB; Sat, 17 Feb 2024 15:23:59 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id D2E298285AD4;
	Sat, 17 Feb 2024 15:23:59 -0600 (CST)
Date: Sat, 17 Feb 2024 15:23:57 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: christophe leroy <christophe.leroy@csgroup.eu>
Message-ID: <1009493415.16246318.1708205037656.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <d065cc14-cda8-4e90-83a4-6a6e9314fa80@csgroup.eu>
References: <375482960.15931139.1708104247383.JavaMail.zimbra@raptorengineeringinc.com> <d065cc14-cda8-4e90-83a4-6a6e9314fa80@csgroup.eu>
Subject: Re: [PATCH v3] powerpc: Add gpr1 and fpu save/restore functions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC121 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Add gpr1 and fpu save/restore functions
Thread-Index: RzhnDO+u/VfR89Ekq2zyrQml5pwnTMP1ZcUAC1egtLk=
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "christophe leroy" <christophe.leroy@csgroup.eu>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Saturday, February 17, 2024 10:39:06 AM
> Subject: Re: [PATCH v3] powerpc: Add gpr1 and fpu save/restore functions

> Le 16/02/2024 =C3=A0 18:24, Timothy Pearson a =C3=A9crit=C2=A0:
>> When building the kernel in size optimized mode with the amdgpu module e=
nabled,
>> gcc will begin referencing external gpr1 and fpu save/restore functions.=
  This
>> will then cause a linker failure as we do not link against libgcc which
>> normally contains those builtin functions.
>=20
> Right, but modules are linked with --save-restore-funcs when using gcc
> so crtsavres.o is not used and only your change to scripts/mod/modpost.c
> seems to be required to be able to build amdgpu module with GCC.
>=20
> Maybe that's different with clang, but maybe worth a test and then a
> second patch ?

It looks to be gated on ld, specifically if we're CONFIG_PPC64 && CONFIG_LD=
_IS_BFD.  I can update the patch to match that gate if desired.

> Nevertheless, see comments below, you can do even shorter and more
> readable using GAS macros.

That's true, but my goal was to get this working, not refactor the entire f=
ile. :)  Any chance we can merge and do a fine polish later, especially if =
there's a distinct possibility of the entire file going away in the near fu=
ture?
