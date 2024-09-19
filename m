Return-Path: <linuxppc-dev+bounces-1478-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0168497CFAC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 02:32:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8td26bFSz2yLB;
	Fri, 20 Sep 2024 10:32:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.21 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726749087;
	cv=pass; b=lM0C4mpQkwByJgi9EVyCO5BhP7u0t3gGfHXqykDluN0GLYS5VJL1IaMWwmlavkGOThsBpp467KlHAlCIHqkPFVTdte8nGpx+rz3u7J61kUYm+OfLQhgyMjDfKdKh1beohckJPCazVvBtyxCvhxjlZHtQqfjZo2v8rFN6awT1AyvbdTzxCiOt9KVsDiAyOKn/tjugJhD0hms9DIbtqOoCPHvGb8MTVcaCVAjPxQ2e7Jn5tCq8KmPVlp1sSekfhj3jy0gTjrwZVnPeY+t/a74PcLYrMkwCnSewYjhdlhsPLenWpaafgvFI874BWtxBta82KwPCbXsUSSev5XV1mFFSDA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726749087; c=relaxed/relaxed;
	bh=C+hHWNZG4+MddmdKyiFasvffH3RUzxDk3GjHw9Ipm2U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=GM1X4hnpYlhV4vzN+qRWv4h61FIlW6Kf+lYzQ1f8pZLG92lFQKCV8PNVjpFchS2RfrOlbLBe3zP1hHzKbrVChi1fks4Q+d2bSqENWb5cvJXvYdg8V48ah7D7Vx+KIFXyQb7YpzdVzPNJV3D1v+M4fEWxvOFIeJRualqzaMPMFfGBUq/5j1RViUi6AYk6VvWzu4qDYlylY9jSNcsyFhe5p0lWCYV+b+FpCYqEugWMAScaBWgpBzcSrO8a/9pCN0bpT3O1vkRyXGgr2DHnfbeZ5IfO2+vnqN27y4cm+hvbY0W1QL22LvgmhKQoZQ95zl1lp3tZDGCiHmKynYK/S1clMA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=lNBW4sow; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=LmArrwmd; dkim-atps=neutral; spf=pass (client-ip=85.215.255.21; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=lNBW4sow;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=LmArrwmd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.21; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 164 seconds by postgrey-1.37 at boromir; Thu, 19 Sep 2024 22:31:24 AEST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Zd85Njlz2yGX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 22:31:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1726748901; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=KJ2L4w+aoTKLwczzgVEWLIW0ioqcrOruLYip2riJFaIbgY2Flo1V30DvTbpGuGy96S
    IdVKde28Tn8vJWPbiSK1pn/L5yp2yokZAxqsZnpuhvpT+KCvzZ9qu3P4OAhFAlOgSEzf
    4IS2dmZWjKuxaht+u8sKDmY1aBOHsSD6g9PYP4EAys4DGcGXdTGJGzdtjSbko5AQX3bC
    Swc3fknm0xlz8ZaFdMTPY8kz4XonFXhs60dwKqj6K8C6HWGqhTzhmx4D/y9J5bIotkl6
    Di3Omro4XhDfua3fHneObJJz61tNNJjaubapIoIw69sARbe9MF/QnudFPv8ZmJzu4F5g
    TjiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1726748901;
    s=strato-dkim-0002; d=strato.com;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=C+hHWNZG4+MddmdKyiFasvffH3RUzxDk3GjHw9Ipm2U=;
    b=YHHBnZzuXPm3Iyf8LKVcacMLgb62OZEQlaYi34apCbmYk4tI/lXLb3uikDiYaFrFVD
    hmA5A7fcI44F5SqX3qsDNwlo9GEvgK9hDAw6awmJdW0r/b5JOIB6/UO+z9HiqwR36wUe
    i7MQfZqGzWr657BwIqbbmRC67vHnDOrY4k5uc2buCyJxAbdB3ySbO5VR9iHnR4lskQta
    3ZJSmOdvE0TaRDmCDO1cW7KnuDs0wqZbOQ8Q8iHQD0exgNSjbWIZShsEz98UXJC1lbyl
    TokoGfKHx4UX10wNVB10hOLnrk+HQfjNcH2kqy3OZO7FxP1D60ELVs4viUuRyowWxdA+
    TFcQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1726748901;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=C+hHWNZG4+MddmdKyiFasvffH3RUzxDk3GjHw9Ipm2U=;
    b=lNBW4sowIajgN1cOP/WuCqWucIttLLUoJrJQxjRt5kpZ8nl/kKN06oCOetOSIp7lMc
    fd0QDKUvMt5JhOWD2IsmlmBTrE/Ig5HurqFuIfS93oqrQbD5NonOasBLk/oeAJ1ykNJ6
    T0V8pyF+qklnpmoK+xUGLPCVktkbtDFPCYMLp41WK5txqDCoYAoKm3jR6sg/JYUoJ234
    VKPST3CN3CyT5/yLMkYLwCu88bEzN0wr8h6FjC0oLAf+O5mE/PlDm7k6pnJ2yR7Xnk3o
    rdYzEKyLr2zSsAggQxiVzrRrBBVN6/TltsMlWYL/kHW6AOYkvTWLf67Dd/8tCfFWFdcI
    3aiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1726748901;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=C+hHWNZG4+MddmdKyiFasvffH3RUzxDk3GjHw9Ipm2U=;
    b=LmArrwmdvkluHTGZNbeJkJCA3rsgDCxkSEBNv2ZB0bck8fIXZkN+qKFtHIcC5sSXtQ
    /7f8l4hVNB3CeEGJI+Ag==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mxs3jHWypQi4DbUQrvP13kRAg9o9DqDRBTCg=="
Received: from [IPV6:2a01:599:815:33cf:3671:c86e:177:d357]
    by smtp.strato.de (RZmta 51.2.3 AUTH)
    with ESMTPSA id e9670808JCSLeW2
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 19 Sep 2024 14:28:21 +0200 (CEST)
Message-ID: <f6f41112-e9ee-4cc5-b487-74e82e866e94@xenosoft.de>
Date: Thu, 19 Sep 2024 14:29:17 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [FSL P50x0] [GIT KERNEL] [VDSO] compiling issue
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi All,

The compiling of the latest Git kernel doesn’t work anymore for our FSL 
P5020/P5040 boards [1] since the random-6.12-rc1 updates [2].

Error messages:

arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not 
supported

make[2]: *** [arch/powerpc/kernel/vdso/Makefile:75: 
arch/powerpc/kernel/vdso/vdso32.so.dbg]

Reverting of the vdso updates has solved the compiing issue.

Could you please check the random-6.12-rc1 updates? [2]

Thanks,
Christian

[1] http://wiki.amiga.org/index.php?title=X5000
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4a39ac5b7d62679c07a3e3d12b0f6982377d8a7d

