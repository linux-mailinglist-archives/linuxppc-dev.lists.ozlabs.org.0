Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8847BCA63
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 00:29:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PTQNhSgT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S30MF6k0Wz3vZ2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 09:28:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PTQNhSgT;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S30LM0pQnz3bwL
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Oct 2023 09:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1696717686;
	bh=jw8aAP4zZwc1G8pTs7/VrYq/NyuehGKHT1lWT8/alhc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PTQNhSgTeWF+xMjTik3ldHturS9HLjZ2QMEFCGZHuv2W2Dflhzne00zR/VUAcDMl1
	 ujqj042a0eYC0j4pNrhJ8f1Htlb5rLpwTMrzqiNggXt8Z44ziVv3vYllyBKV4NCNX+
	 6lyUCupAxWPnY5m04gqNDzRJXBHTtMKwA7+ez55GVdFwJjOUr6MY36z4opwA3SwCoE
	 Rn0eHf+cud9BOvFERGN3Oi7+Fa4IwhFy0cA0LsD5XpYUeYiyk2ZviXU74gBC6EPzWV
	 VFvzslNgemGOSC0kP7tK4o2sZA0k2LgPRz356Z1yAEkK+7+V5lKk3IGqwkZ5GLqZ68
	 kckqn59dS4hGg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S30LF6t2Gz4x3j;
	Sun,  8 Oct 2023 09:28:05 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Granados <j.granados@samsung.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 00/15] sysctl: Remove sentinel elements from drivers
In-Reply-To: <20231003084749.4xxi4z64hgq5a5lw@localhost>
References: <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
 <CGME20231002122730eucas1p17643da82bb9aa655b35c3562446ad395@eucas1p1.samsung.com>
 <64fd22df-616e-9f5a-26fb-44c4b3423b0c@csgroup.eu>
 <20231003084749.4xxi4z64hgq5a5lw@localhost>
Date: Sun, 08 Oct 2023 09:28:00 +1100
Message-ID: <87il7irrtb.fsf@mail.lhotse>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Granados <j.granados@samsung.com> writes:
> On Mon, Oct 02, 2023 at 12:27:18PM +0000, Christophe Leroy wrote:
>> Le 02/10/2023 =C3=A0 10:55, Joel Granados via B4 Relay a =C3=A9crit=C2=
=A0:
>> > From: Joel Granados <j.granados@samsung.com>
>> >=20
> <--- snip --->
>> >          - The "yesall" config saves 2432 bytes [4]
>> >          - The "tiny" config saves 64 bytes [5]
>> >      * memory usage:
>> >          In this case there were no bytes saved because I do not have =
any
>> >          of the drivers in the patch. To measure it comment the printk=
 in
>> >          `new_dir` and uncomment the if conditional in `new_links` [3].
>> >=20
>> > ---
>> > Changes in v2:
>> > - Left the dangling comma in the ctl_table arrays.
>> > - Link to v1: https://lore.kernel.org/r/20230928-jag-sysctl_remove_emp=
ty_elem_drivers-v1-0-e59120fca9f9@samsung.com
>> >=20
>> > Comments/feedback greatly appreciated
>>=20
>> Same problem on powerpc CI tests, all boot target failed, most of them=20
>> with similar OOPS, see=20
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20231002-jag-sys=
ctl_remove_empty_elem_drivers-v2-15-02dd0d46f71e@samsung.com/
> I found the culprit!. Here you are rebasing on top of v6.5.0-rc6 "INFO:
> Looking for kernel version: 6.5.0-rc6-gbf2ac4d7d596". The error makes
> sense becuase in that version we have not introduced the stopping
> criteria based on the ctl_table array size, so the loop continues
> looking for an empty sentinel past valid memory (and does not find it).
> The ctl_table check catches it but then fails to do a proper error
> because we have already tried to access invalid memory. The solution
> here is to make sure to rebase in on top of the latest rc in v6.6.

Thanks for tracking it down.

This is my fault, previously Russell would update the branch that the CI
uses as its base. Now that he has left I need to do that myself, but had
forgotten.

Sorry for the noise.

cheers
