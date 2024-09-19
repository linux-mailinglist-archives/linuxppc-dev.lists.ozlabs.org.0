Return-Path: <linuxppc-dev+bounces-1480-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B79D97CFAE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 02:34:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8tgw19m2z2yMF;
	Fri, 20 Sep 2024 10:34:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.163 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726758367;
	cv=pass; b=PX1WU5Wc0tx7e1XqkQX83QrpStKmggd5sANzvAzzEpkzmiCP4J0cxI4I0R+2+pl1DO1m8Hc9aP95LRLvnMe5vk4lvg2vfJfgSdSt46To8kbGuQs9yj92Ea86/utdbjm5ZQyWEfw6FxogqCaTAacrxy7O8ahRbiHrlvqwF3Ntb+rRWcClK5Rh//5FS9iTYnVsG9ZhLM0nZGJQMS3OKWakiA3+vnf3PlFSMa55xJE+ypuNVTDXTY7xj97kFYc4dcFJ1JXjJo9rUS/ZWV0KCmILi7Wee8Ztc06jzgcEp5ISV11Auy1X5+uPc/508LXXpuW0U8DOgvBldZTL7Jal1fLl6w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726758367; c=relaxed/relaxed;
	bh=wCWZ4Vqkz/3rgoo+tDgPY4HRVEkM82xD4L1fSPN3fDM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Cc:Date:
	 Message-Id:References:To; b=WQLgXuhdl7mkjYs6bsuNlTc0/3L7ADC9dvtQ0iLV9q+At7LvI53Dl/NewnFRWrBHgNZI1SkclhOT5vi2o6VLEsMFjXWDsIjMrkf1cXRnYygVJtqJABU3JUTZ2BQ62Dspw4JlliOR1MSgSvMEf5UuBfcPvYAuY3/Gw47YdSzjRavAsWcD7Y83uz9fqazOYFPrl4fr3UzE7nvd4RixHm+hp+VSX0HGy4SQokUguvYG1WieVesc9yfwS7MtQeEZQO+2Y6MG65YRR+hi6bChpPM83kJWdiOuXbDEgNSd9FdS6AbnDstPhqEQRdRTASJOtF/AKkasRtL+iJZhfgY3h5TJqA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=dqQkMU2H; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=FVB7cUjc; dkim-atps=neutral; spf=pass (client-ip=81.169.146.163; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=dqQkMU2H;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=FVB7cUjc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.163; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 178 seconds by postgrey-1.37 at boromir; Fri, 20 Sep 2024 01:06:05 AEST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8f3d1gXWz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 01:06:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1726758176; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=iK5skUWPVikW9qFzY7jMrkK+dbRS9a+5UM1rHX56rREst3OclDnLPp307jU/xDCrjR
    XDoxWZOtyV6PZMsKtTGALo6PcrfpHa5nykyMjUBXDdNGWyrYjKHvamoxsB9wD1BStGx8
    Y5MBOtwBtKsbtWBECbc06i8EnCRPs8jXoRG3jPPhMseLAqXUbnsnM06ZUUDOkUp5+NZB
    SEzL7vZpQoLdKedFDXN0PpXe9828cvjg1QDhYcdphj49boaZ42S7Ay2Z30DuwkE37rvV
    AhWXxm7cIXm72HguTukVfgAZzBFqNSZEwpvo50S+IMEjZVl355S8qOiEI5wIMPbaJhwQ
    HQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1726758176;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Date:Cc:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=wCWZ4Vqkz/3rgoo+tDgPY4HRVEkM82xD4L1fSPN3fDM=;
    b=R6VxfWbb+/QHCTecwfWz2BHTy79zcawjc6a8ROYBq2EAMW7Yr+9MlXONqVvPBtt2wd
    DrZ8g6FVuLdIu8L1Nzy4Sr2oav4WqqBcbvCORWb1+fC5dKORJq/MfNHr1fASBUQznmu/
    txboBecjvoJth9f1qKk7DPsM9r9JaTWA96Ad8utOO6uE3l4hA16+X/0Wj2dUsnKtdt11
    geEvQV1St0QQHssj8+Jfp0YLW3wFthPVljOr/GAn3jNQk4lhmioJ76bVRqIwF/ye4WH7
    AIqiu3PQ67fySKZY4Fzv8Gx042tIC5G+8/EEGK6WHSt/9olkG6p4YbKbhlhvvEQJYcqz
    SMsw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1726758176;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:References:Message-Id:Date:Cc:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=wCWZ4Vqkz/3rgoo+tDgPY4HRVEkM82xD4L1fSPN3fDM=;
    b=dqQkMU2H5t2fjZRH0+l2MNzJwcDftsnGrrAi5rBwlV19H50OnhR/KLyfnuCnGVcMmF
    WnkADwX7QlpVYQNBD4U7r1xVGEV+b/eju4IuZiYOLIIzsgYWMR5vgd2m2f8mwVWUZ+8W
    WvzD523OfTQafyNS0dALHat+IqUEmUfBBD/f2EAr80J4T78/8golu8ZKCDRVSGrcgyv0
    QkkM5Qn7zECq3u1GMJwq8avwzDGNy5HMzqSfiId8n10a2AZJRxBFPwPD+Gq7aJB/KOJt
    fiesTlAM0wGm66XtsA1MPN+blnjccWk1jgh4gTh7mwm1gKYZFuh8HddN0FProuRWehIt
    yEeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1726758176;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:References:Message-Id:Date:Cc:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=wCWZ4Vqkz/3rgoo+tDgPY4HRVEkM82xD4L1fSPN3fDM=;
    b=FVB7cUjc+uyf2FCBhA/4QyhKwx3iu8tjJsmLprsgjBquQaoEQvPpOvv3lZGfiJXjhb
    P3+MVSneSy286mnWWPBg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mxs3jHWypQjdLaWAruPhWzujn2eRzB2bdbjf4="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.3 AUTH)
    with ESMTPSA id e9670808JF2tfCr
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 19 Sep 2024 17:02:55 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (1.0)
Subject: [FSL P50x0] [GIT KERNEL] [VDSO] compiling issue
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <de2d1e74-52e5-4d74-8228-4aaea61cad51@xenosoft.de>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Trevor Dickinson <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>
Date: Thu, 19 Sep 2024 17:02:45 +0200
Message-Id: <0C6E937D-A322-4B76-96E8-2C239241F049@xenosoft.de>
References: <de2d1e74-52e5-4d74-8228-4aaea61cad51@xenosoft.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: iPhone Mail (21G93)

Hi All,

The compiling of the latest Git kernel doesn=E2=80=99t work anymore for our =
FSL P5020/P5040 boards [1] since the random-6.12-rc1 updates [2].

Error messages:

arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supporte=
d

make[2]: *** [arch/powerpc/kernel/vdso/Makefile:75: arch/powerpc/kernel/vdso=
/vdso32.so.dbg]

Reverting of the vdso updates has solved the compiing issue.

Could you please check the random-6.12-rc1 updates? [2]

Thanks,
Christian

[1] http://wiki.amiga.org/index.php?title=3DX5000

[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D4a39ac5b7d62679c07a3e3d12b0f6982377d8a7d

+ Kernel config

Link: https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/c=
onfigs/x5000_defconfig

+ Christophe Leroy
+ Michael Ellerman=


