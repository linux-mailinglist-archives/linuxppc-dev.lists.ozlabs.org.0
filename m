Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00E0858412
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 18:25:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=tao87+5v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbzNH6Gl2z3vbM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 04:25:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=tao87+5v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbzLr0fmFz3vY6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 04:24:20 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id EA04D8285425;
	Fri, 16 Feb 2024 11:24:16 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id kUbzDdc7jbof; Fri, 16 Feb 2024 11:24:15 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 2E7A7828557E;
	Fri, 16 Feb 2024 11:24:15 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 2E7A7828557E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1708104255; bh=VL1mpZx6IBzXQH/njeQCOU8DllDCdHzuXIwSDXd6ubk=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=tao87+5vCBljWownWIy7CqY7JWKUGZ15pSZDgixZkqG43YR8AwuhkcJQV4bmYE17I
	 f0DIGHREWIitSaGGW8RgHCzHvmZoH+vJ6xGJzYDyZRFCSnJFygIreFLcd6UlE9D4Pc
	 PGkMlXYYHioFYZbjREJA6BDCWdkllR6buNsEvm6E=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4SK5XFHi5qEo; Fri, 16 Feb 2024 11:24:15 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 0FEC5828554F;
	Fri, 16 Feb 2024 11:24:15 -0600 (CST)
Date: Fri, 16 Feb 2024 11:24:14 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: christophe leroy <christophe.leroy@csgroup.eu>
Message-ID: <1322876330.15931142.1708104254973.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <152d6062-7761-49cc-9906-42e85701d7b6@csgroup.eu>
References: <2042460808.14845021.1707758040731.JavaMail.zimbra@raptorengineeringinc.com> <152d6062-7761-49cc-9906-42e85701d7b6@csgroup.eu>
Subject: Re: [PATCH v2] powerpc: Add gpr1 and fpu save/restore functions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC121 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Add gpr1 and fpu save/restore functions
Thread-Index: 7HnmYsGDum2rr8D9CFnklnCjCnIuFsDwWPGAJyrC3O4=
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
> To: "Timothy Pearson" <tpearson@raptorengineering.com>, "linuxppc-dev" <l=
inuxppc-dev@lists.ozlabs.org>
> Sent: Tuesday, February 13, 2024 9:13:41 AM
> Subject: Re: [PATCH v2] powerpc: Add gpr1 and fpu save/restore functions

> Le 12/02/2024 =C3=A0 18:14, Timothy Pearson a =C3=A9crit=C2=A0:
<snip>

> All this looks very similar to savegpr0_xx and restgpr0_xx with the
> difference being that r12 is used instead of r1.
>=20
> Could we avoid duplication by using macros ?
>=20

Yes.  v3 sent.
