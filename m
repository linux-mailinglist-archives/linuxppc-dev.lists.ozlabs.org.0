Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F1A4DBA9F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 23:21:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJlB06jmWz3bcq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 09:21:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kaptarvill.hu header.i=@kaptarvill.hu header.a=rsa-sha256 header.s=default header.b=LfN6wDXS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaptarvill.hu (client-ip=94.199.180.93; helo=s13.tarhely.com;
 envelope-from=ngutmann@kaptarvill.hu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kaptarvill.hu header.i=@kaptarvill.hu
 header.a=rsa-sha256 header.s=default header.b=LfN6wDXS; 
 dkim-atps=neutral
X-Greylist: delayed 3682 seconds by postgrey-1.36 at boromir;
 Thu, 17 Mar 2022 08:19:46 AEDT
Received: from s13.tarhely.com (s13.tarhely.com [94.199.180.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJjpV2z6cz2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 08:19:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kaptarvill.hu; s=default; h=Message-ID:Subject:To:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7/Hrs3+T6M3uyT22QzsubEEvCWzQyhMrKtB3LSKf3q4=; b=LfN6wDXSbbQPJkVUR3rjiPtdt8
 aDRbfKt5Jcye/Gip0V8XT5RdKVZTG0SEXpa2NdP1myMb63l0DZVKI7dgew129JB+0YMnRiM6o9h4y
 YclitdQYl1/X7MnK4THfNEZ2h6A0AOb4VEWhue8zPO9HVDKb4PVfvWQ8WJ4tQUvLicaxIxrOYKcLO
 2wNhqMtLqStmznaiQfhGc5LxP2AoeNd6rxXSKCXLW+/2qX6rB21aBDRBuMYfTZPD9+lORXwp0anQy
 tYTPngA2+wdFsgaYRDXmn0DX6QgcQykL4ubGcLObyS96plDZN7vtAvja2MWxpNHAwIs3yQ5rLfWsf
 XQnP59zg==;
Received: from [197.234.82.42] (port=65252 helo=s13.tarhely.com)
 by s13.tarhely.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (Exim 4.94.2)
 (envelope-from <ngutmann@kaptarvill.hu>) id 1nUZdp-0003Et-Fp
 for linuxppc-dev@lists.ozlabs.org; Wed, 16 Mar 2022 20:49:05 +0100
MIME-Version: 1.0
Date: Wed, 16 Mar 2022 11:49:03 -0800
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3 (Normal)
From: "Christophe Leroy" <ngutmann@kaptarvill.hu>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <oybpwysvecaebz9ghrtvrpa9mtolvcpf@kaptarvill.hu>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - s13.tarhely.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - kaptarvill.hu
X-Get-Message-Sender-Via: s13.tarhely.com: authenticated_id:
 ngutmann@kaptarvill.hu
X-Authenticated-Sender: s13.tarhely.com: ngutmann@kaptarvill.hu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Thu, 17 Mar 2022 09:20:26 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body>Good afternoon!<br />=0AScrutinize the urgent case p=
lease:<br />=0A<br />=0A<br />=0Ahttps://onedrive.live.com/download?cid=3DB=
1700C9A8EF29D0A&amp;resid=3DB1700C9A8EF29D0A%21107&amp;authkey=3DAB4MENvof1=
rUnao<br />=0A<br />=0A<br />=0A<br />=0A<br />=0A<br />=0AFile password: X=
4878<br />
<br />
Le 06/06/2020 =C3=A0 01:54, Will Springer a =C3=A9crit=C2=A0:
> On Saturday, May 30, 2020 3:17:24 PM PDT Will Springer wrote:
>> On Saturday, May 30, 2020 8:37:43 AM PDT Christophe Leroy wrote:
>>> There is a series at
>>> patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D173231
>>> to switch powerpc to the Generic C VDSO.
>>>
>>> Can you try and see whether it fixes your issue ?
>>>
>>> Christophe
>>
>> Sure thing, I spotted that after making the initial post. Will report
>> back with results.
>>
>> Will [she/her]
>=20
> Sorry for the wait, I just sat down to work on this again yesterday.
>=20
> Tested this series on top of stable/linux-5.7.y (5.7.0 at the time of
> writing), plus the one-line signal handler patch. Had to rewind to the
> state of powerpc/merge at the time of the mail before the patch would
> apply, then cherry-picked to 5.6 until I realized the patchset used some
> functionality that didn't land until 5.7, so I moved it there.
>=20
> Good news is that `date` now works correctly with the vdso call in 32-bit
> LE. Bad news is it seems to have broken things on the 64-bit side=E2=80=
=94in my
> testing, Void kicks off runit but hangs after starting eudev, and in a
> Debian Stretch system, systemd doesn't get to the point of printing
> anything whatsoever. (I had to `init=3D/bin/sh` to confirm the date worke=
d
> in ppcle, although in ppc64le running `date` also hung the system when it
> made the vdso call...) Not sure how to approach debugging that, so I'd
> appreciate any pointers.
>=20

Does it breaks only ppc64le vdso or also ppc64 (be) vdso ?

I never had a chance to run any test on ppc64 as I only have a kernel=20
cross compiler.

Would you have a chance to build and run vdsotest from=20
github.com/nathanlynch/vdsotest ?

Thanks
Christophe</body></html>
