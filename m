Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 960765FD556
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 09:04:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mp0ql3rTRz3dqj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 18:04:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=hWscIw+U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=hWscIw+U;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mp0pn35cSz2xf4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 18:03:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1665644584;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=sTo/jpyAQsSbG+wRmRSauH75VbNmjMbzY+vBB3ellQA=;
    b=hWscIw+UkgDP6Kvc9PYmu2LP+dafk9bmeiNMtXlj73NnTg76xEdgvIWOldgOWYobaL
    zXb2orjiHZv/rgBNvXO8ax4E5KoF+hDP5FKOz8nNjXCo6uyG7NaKY2VW+5pXIc6xj2vB
    JdHmyLXBsHEBI/Yw/FZ+1Sev5fCpKnNUehLfG9dpJyXEFoDFgFJKMM0emioTo52OAu8e
    iaGHfIIMtmceWMqsqy6td5ZV/12gSohRwp5/C/0/gYBINc32wYrjxwj/apAN+rKyo80+
    roZDq0tSwckAkPzm0YhWTEFdBEr0XVSf7+aRBMkGf01v9ld12/IsP3XJqAPKTDTtx+E2
    r75w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7bG9y2bo0xXZ/mKR29EgB6WrDlzp3rKRatyhqn7ll"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 48.2.0 AUTH)
    with ESMTPSA id j7449ey9D733l6l
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 13 Oct 2022 09:03:03 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
Date: Thu, 13 Oct 2022 09:03:02 +0200
Message-Id: <B5BA2A96-7D15-4074-B977-169B905D5F25@xenosoft.de>
References: <ed1c9254f651a211bd03b1678da7506479901fa1.camel@linux.ibm.com>
In-Reply-To: <ed1c9254f651a211bd03b1678da7506479901fa1.camel@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
X-Mailer: iPhone Mail (19H12)
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, npiggin@gmail.com, rmclure@linux.ibm.com, Trevor Dickinson <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Does this patch also affect 64-bit kernels?

We use often 32-bit userlands with 64-bit kernels.

Cheers,
Christian

> On 12. Oct 2022, at 09:56, Andrew Donnellan <ajd@linux.ibm.com> wrote:
>=20
> =EF=BB=BFOn Wed, 2022-10-12 at 08:51 +0200, Christian Zigotzky wrote:
>> Hi All,
>>=20
>> I use the Nemo board with a PASemi PA6T CPU and have some issues
>> since the first PowerPC updates for the kernel 6.1.
>>=20
>> I successfully compiled the git kernel with the first PowerPC updates
>> two days ago.
>>=20
>> Unfortunately this kernel is really dangerous. Many things for
>> example Network Manager and LightDM don't work anymore and produced
>> several gigabyte of config files till the partition has been filled.
>>=20
>> I deleted some files like the resolv.conf that had a size over 200
>> GB!
>>=20
>> Unfortunately, MintPPC was still damaged. For example LightDM doesn't
>> work anymore and the MATE desktop doesn't display any icons anymore
>> because Caja wasn't able to reserve memory anymore.
>>=20
>> In this case, bisecting isn't an option and I have to wait some
>> weeks. It is really difficult to find the issue if the userland will
>> damaged again and again.
>=20
> Could you try with
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20221012035335.866=
440-1-npiggin@gmail.com/
> to see if your issues are related to that?
>=20
> Andrew
>=20
> --=20
> Andrew Donnellan    OzLabs, ADL Canberra
> ajd@linux.ibm.com   IBM Australia Limited
>=20

