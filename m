Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFDD1136FD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 22:20:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SsFg38hMzDqKL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 08:20:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SsCp35DBzDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 08:18:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="T9y7v+jd"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47SsCn6Vq0z9s4Y;
 Thu,  5 Dec 2019 08:18:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1575494326;
 bh=hwrtmULs3y/IQQwjZ5C4VR0lN1jzkCrY6/i6eTox+M4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=T9y7v+jdfEuVadgAR9McYAcKJe6Glu2I4/f+BSFsF/gioxzuSAo/4jDKuZPlZr6Sa
 l6YnfLvP2guoBpSmxNfMCHL1BjEB3z2AuH+Lwx0KfyRi514iBfOsinE9yPeKe2nZyR
 AJumWyT7ALcKUmvPkTtUG4X8j+QSVkW/RTFoXrY8wBEiQZvl5OiJb9CKwTm5W4bL3s
 4UWmgfPpXPPZrkFWrjz4SLwF+Ak73YKS9d2O0OP9DnzfXAGhZ16Wno2LyAIcoQBQS1
 xRwi922KmwDYuCJ/hMypo5raLlz1RtWe6yE3SqNoyz9SDKuVB8KmyrY9CGKKZhxiFW
 GL7Cf6KGWQYig==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg Kurz <groug@kaod.org>,
 Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/xive: skip ioremap() of ESB pages for LSI
 interrupts
In-Reply-To: <20191204154220.7affb01f@bahia.w3ibm.bluemix.net>
References: <20191203163642.2428-1-clg@kaod.org> <47Sfr1448xz9sR1@ozlabs.org>
 <20191204154220.7affb01f@bahia.w3ibm.bluemix.net>
Date: Thu, 05 Dec 2019 08:18:43 +1100
Message-ID: <87k17beqmk.fsf@mpe.ellerman.id.au>
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
Cc: lvivier@redhat.com, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greg Kurz <groug@kaod.org> writes:
> On Thu,  5 Dec 2019 00:30:56 +1100 (AEDT)
> Michael Ellerman <patch-notifications@ellerman.id.au> wrote:
>> On Tue, 2019-12-03 at 16:36:42 UTC, =3D?UTF-8?q?C=3DC3=3DA9dric=3D20Le=
=3D20Goater?=3D wrote:
>> > The PCI INTx interrupts and other LSI interrupts are handled different=
ly
>> > under a sPAPR platform. When the interrupt source characteristics are
>> > queried, the hypervisor returns an H_INT_ESB flag to inform the OS
>> > that it should be using the H_INT_ESB hcall for interrupt management
>> > and not loads and stores on the interrupt ESB pages.
...
>> >=20
>> > Cc: stable@vger.kernel.org # v4.14+
>> > Fixes: bed81ee181dd ("powerpc/xive: introduce H_INT_ESB hcall")
>> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>=20
>> Applied to powerpc fixes, thanks.
>>=20
>> https://git.kernel.org/powerpc/c/b67a95f2abff0c34e5667c15ab8900de73d8d087
>>=20
>
> My R-b tag is missing... I guess I didn't review it quick enough :)

Yeah sorry, your tag arrived after I'd applied it but before I'd pushed
it out.

Thanks for reviewing it anyway. You can redeem lost R-b tags for a free
beer at any conference we're both attending :)

cheers
