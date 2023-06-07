Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0967266E4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 19:14:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbv8b6Dvgz3g3S
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 03:14:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RH0aCUBx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RH0aCUBx;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbv1610f4z3flY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 03:07:54 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F306360EB3;
	Wed,  7 Jun 2023 17:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01E7C433D2;
	Wed,  7 Jun 2023 17:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686157671;
	bh=MYdKVyeJNHIGE1EGa4r9r/X6+zpuy5PnbxLTM8nzVgM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=RH0aCUBxP3yXDCR+0VyrWah7ZRCBlBr+zZD2lD373VUFIubsYd+56PkN8Iro0SGhp
	 +Ii5R3S5dRISyHwqxKUW59p3IJDaScZpq9QHX12AB2V7JfKxiOp7DUkSClIrz6zj5A
	 rB60/ayC46UZ/jxxQgaE2+lKC2KgbrGvnkzaMhRlmyG91xtviMCJ2dOqLISlQ4OLN8
	 yGbowSpEVbikAQmq6ucfL3BtYTmehgtl7v0Mi2r0R4DkfkhwjgoCbze5UKkNsuULdj
	 OgBLDAXpbqGOi2Us+reF2B0KPtIMJhZ1UM4fRAf2xcaeefnNcuuFgbwHeDcm6aONsv
	 TO2JNpmYPSLUQ==
Date: Wed, 07 Jun 2023 22:35:21 +0530
From: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH] powerpc/ftrace: Refactoring and support for
 -fpatchable-function-entry
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20230519192600.2593506-1-naveen@kernel.org>
	<3527b8d2-275e-29d8-fd3b-4002a4a901fd@csgroup.eu>
	<85460820-e5e0-57e3-68a7-dd7a562c9eb0@csgroup.eu>
	<1684605928.yl2udzpst9.naveen@kernel.org>
	<5463949f-289b-1eae-17c7-f77f63389f98@csgroup.eu>
	<1684833778.7ege0impv3.naveen@kernel.org>
	<11217d67-a9bc-10a9-161c-c73666af0c9b@csgroup.eu>
In-Reply-To: <11217d67-a9bc-10a9-161c-c73666af0c9b@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1686157010.jpb26wrrqi.naveen@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 23/05/2023 =C3=A0 11:31, Naveen N Rao a =C3=A9crit=C2=A0:
>> Christophe Leroy wrote:
>>>
>> Ok, I simplified this further, and this is as close to the previous=20
>> fast path as we can get (applies atop the original RFC). The only=20
>> difference left is the ftrace_rec iterator.
>=20
> That's not better, that's even slightly worse (less than 1%).
>=20
> I will try to investigate why.

I have posted a follow-on RFC with the changes split up:
http://lore.kernel.org/cover.1686151854.git.naveen@kernel.org

Hopefully, that will help narrow down the source of the regression.

- Naveen
