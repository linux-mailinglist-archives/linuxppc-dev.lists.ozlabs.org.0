Return-Path: <linuxppc-dev+bounces-1479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD0A97CFAD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 02:33:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8tfK0STdz2yMD;
	Fri, 20 Sep 2024 10:33:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.52 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726749394;
	cv=pass; b=HloMIdu+O69PEvta/tcLiUdj+6FW46k2yIcvJU7u6bhFzR+LgGrodRiGuiCBF6F7Jpn3Q5gRm3NsV9zlZmumfvgSUkS8JphM3eQ31V9mumFGTag4wekpLbDRaZZsK0CW5wEba8IVy3B/SWs9fTAiDkYOCXX+IX5tN3BjyrdjSZ+tLGU/tePr6itI0K6cD03gRwFa96d9xCD1OWYcpgNpdUw1sszNKr7M8MjEjFMnNrd1tkckkQnr+h3DJzdluRrc/B9PqzkpulIlILExIRKZF+Kpo2T5nbcqJvfOSPEY9nd/lrJu5pquV15BRceG98AejKo/TUa6tWcfr4gX49VcUg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726749394; c=relaxed/relaxed;
	bh=cEAnHPoF/5CIAQRJZdiY5PtZSG6f8n855ra5ZSRBZ+M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=d6WFmN7vdxYGLeekKQClvy5VhVJXnGS0WdAlzhPj03+yC5Bw0vmt4EkYmia37bmJ0kAGQfztGtYhccYKgjoUheRBSHf04Mlqb5vzhcND2No0l1ucZTEl4DtkBgnqJpSOtNyFAClMHful9oVUcL5ovfjS7aPvL4ZNYYWeUWjmB2AOjv5QzBdAiIlmDLMyl1p+CnuBwresLzZ067T0DMVwGnxk13wC8hffrwwp/0nOkedeEmvWn9lFONHiySx29ojRFjOTB6XsIM0FfZa5MvQNBANhKPAV3fuLAk3ub3irF7wgkH93tzt17aX4n9GoIuP4Kat5Ur2k16Sv8kU4q5+7Kw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=JGPUMaOX; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=IdairrWp; dkim-atps=neutral; spf=pass (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=JGPUMaOX;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=IdairrWp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Zl45JHGz2yGX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 22:36:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1726749379; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lRpbHntROnHnuAZdvAHMxpqWqxLI5kurctUIPTXXG3WIofp2CRrAE6jHtBvyXFmMAU
    hmyybmx9b0CmOR0yKCMkIX2Afiie2BLVxn/Qi3o4wTj+xJu7e3d8Dm0NnxISwsruMdba
    VypCKulUBxRErKPPBTYhiw3zlBqkCV6b/bkBuak/NwEQrJOH2iwT87sKAe2tsWRrEXdE
    TRrTOAcpnc68NCz1hUcAhk+LGYzuMoBqEq42YVNq+6yFWZnoYCfees7ZYQfek1/rvbpm
    RwkyHHsbxFdpmzKYdhH8QFbc/oOOHkRttokD5KiEbmpwaBYKtcnkdHlyQYIOlfJ/2WN0
    f7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1726749379;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=cEAnHPoF/5CIAQRJZdiY5PtZSG6f8n855ra5ZSRBZ+M=;
    b=Lg+wvgxe5EI3NA8dz3C8W3y5hFNNsNa0iU/5iFN2MVfPSYLegbghsapIwtqux/x4CU
    PsAXvAZI2nWZJ98Zlh89MbgjRUtJHhbd/6wUHUzwrzSk7l2HaQpDqm1QbhJ1mI1N5Uq7
    93wO5EAttA9KApiRIR6awTOfvSB4RJmlh25hnO/8tBE7pbUd6W4emphOhLw7hZAXGLZ6
    TJSsDygOpm6mUpfN7og0VgLWjnRgrAQFyk4jiAJhQzcQfug3DEXf2dbl2ZBJTu5Zr7M3
    PabKLaUI0Pk/++f+PBlC8q55A2nUj/8otrgyv8QGr6MPaKbT3WaS2X0vRmnblcgn3XRU
    qWfw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1726749379;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=cEAnHPoF/5CIAQRJZdiY5PtZSG6f8n855ra5ZSRBZ+M=;
    b=JGPUMaOXzL0UVir8yix4QwOgKs6IBSzePXMk8sTK1RJfAOUeE/wtRT2xLMsbebQZ4y
    +66GupHGLE0ahf/vx0RL9y5X3yZhYJ+AlhYj8Ve7qnCzAAEuVvisjUcgZQhkNzp8Ls3Y
    +P/zETa7dR+dSrfd8wILxh6iT57heF+I4aqfFc+osV+BLe57loAMNZ6cyqBch0Na1cAr
    ACKAgQvbYdv20VPMvfm+RP3TEEhwiquAYxfkitllCCw2TCaEWUJEWd1sm3CdJiTEoFu4
    F03TZCbrcOFczicxqSSnAQbT6mqsD7f33LcN7uqEHLy+FoGzYrGZZnC6qvTkjb+yii6+
    ql/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1726749379;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=cEAnHPoF/5CIAQRJZdiY5PtZSG6f8n855ra5ZSRBZ+M=;
    b=IdairrWph0CSTX2+OaGc1XyhzJltHwu1fPmkT5Jpke7SovHaa5v98zAXBD7bKxg87P
    eYQHMwMg65l+9q15yKBg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mxs3jHWypQi4DbUQrvP13kRAg9o9DqDRBTCg=="
Received: from [IPV6:2a01:599:815:33cf:3671:c86e:177:d357]
    by smtp.strato.de (RZmta 51.2.3 AUTH)
    with ESMTPSA id e9670808JCaJeYf
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 19 Sep 2024 14:36:19 +0200 (CEST)
Message-ID: <e88a2c52-a163-47f0-80a4-1ba7c99d251b@xenosoft.de>
Date: Thu, 19 Sep 2024 14:37:15 +0200
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
Subject: [FSL P50x0] [GIT KERNEL] [VDSO] compiling issue
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>
References: <f6f41112-e9ee-4cc5-b487-74e82e866e94@xenosoft.de>
In-Reply-To: <f6f41112-e9ee-4cc5-b487-74e82e866e94@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19 September 2024 at 2:29 pm, Christian Zigotzky wrote:
> Hi All,
>
> The compiling of the latest Git kernel doesn’t work anymore for our 
> FSL P5020/P5040 boards [1] since the random-6.12-rc1 updates [2].
>
> Error messages:
>
> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not 
> supported
>
> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:75: 
> arch/powerpc/kernel/vdso/vdso32.so.dbg]
>
> Reverting of the vdso updates has solved the compiing issue.
>
> Could you please check the random-6.12-rc1 updates? [2]
>
> Thanks,
> Christian
>
> [1] http://wiki.amiga.org/index.php?title=X5000
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4a39ac5b7d62679c07a3e3d12b0f6982377d8a7d

+ Kernel config

Link: 
https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/configs/x5000_defconfig


