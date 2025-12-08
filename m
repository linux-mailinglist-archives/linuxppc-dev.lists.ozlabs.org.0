Return-Path: <linuxppc-dev+bounces-14688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A6CCAD9E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 16:39:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQ5lC69j6z2xKx;
	Tue, 09 Dec 2025 02:39:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.22 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765208391;
	cv=pass; b=D6oE49ZYH7m123f0UFXNUyrAZ3LriQvuPzaNZme1MUr+753Hn4QbWbKsFtIloEoO6yfJPEGvaD+w0WJlCxyhhDfwADjqO6ft+5VOzgldIMe/NVb9dbe9JKAicU59DQhzKuHpcPulNBGjYZ46wRVukYulNIDBn9sCP3iBYGKS9m1tGH6n+mmyPUIfFqBxuwiNFykiJdNOyn6Z6Inc+euq4lb9Ex/NwQclhxlMz5zSxhytroWXM8oEC7IBWCwyC6b0zGurJc+K3WFM+daLMb6wSqwgEpfwFwi6/6P2baNTtPudMsbgWJiSGaU52Q5/onRwI5ohptRKgh0ranytdM9kVg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765208391; c=relaxed/relaxed;
	bh=OCAj3pMHBw3Z3bxFipx3RCUpBnI8lvUOpKX0oIfxnlM=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JkYPWguv5I/meT3f46KWsLqTR6kPEGeg25Tbpr6vrDd9+Khizvq7lcEcBhUD2+bsMouX4AVqvxXoaK7WQXRwwGWBhpNVOo5136eGxFdMNR7byh7xRws6SH1SWNlRmGzNVe7jnO8vZong5PAgcn6Wr3/KFKZ1xoWSk/2vyZQB7K5CYg/fYczg+Zm/DKt8ojub8sg/8jjJb23ASxlYCyL+WhMro2wjenehj19TRRvDBmPJBk9yCn3y2xQ9PVZdDfWMerlxi7qFweB5faMZ2fe+1qG4bjDkQWhgLfc913HNoiElHCEOJfB+bLTpAPt/ewk8fRE++/Tcu+CL/Swb0ZVPnw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=V8tCunks; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=cUCcp3ir; dkim-atps=neutral; spf=pass (client-ip=85.215.255.22; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=V8tCunks;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=cUCcp3ir;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.22; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQ5l73bRlz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 02:39:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1765208376; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qC63FQLvEFt5pL9b52m3FDgMPprHfIWIHuhlOSkOQGvdEqWJIN9ggQNsfy3g5r7QeW
    QbKjCF1Uo+y9DbvPw99Zth9iDZiafEsHdB3y80UXbo3aFPR8TFd1PLJ5h2OCVRKE5+do
    RdB3GDk2phRql1dqQgZrvAezS7SWFpMvaLQPZUwTLbt7HJayRsAZoR7f6W8CfJcBin1x
    B8qu32oWY7xbqZUSosJmG/x+PuvKkoK3XvHPPDok2+jqfaA6tQ1ma+jtleAj/kf1hybE
    l3RCbMauEsck4Zci+VhwLMQoVCixKEt72vL5WPwIQowf9YmxSukTWOLjpo8ZBbhFnSe+
    axSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1765208376;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=OCAj3pMHBw3Z3bxFipx3RCUpBnI8lvUOpKX0oIfxnlM=;
    b=ZaD4mfu80vg8Xpll8AQJYcRz0tZqSDUn/qNLqP61paEBPy+ERImC82AyYi/DlCqHT/
    KSID5dCLkDgSV2kDdpAjVIUF2VXVKTq5c3erkIZg0pxEUZwzxgnAZrN48Jf+uGryOKFK
    Bf1ySyyk8CvT86hfNUF/yI95BsIwhdUhCrlDORQOkR0wjzgfgOrDzuGxQLbSgsoRSNMU
    YIWx5WefpenpLYQu5UyXhxh9nXyAmXecX9VyOKIPNkLXP0sxwNVA/YXnovIAK4vGapQp
    wBpm/NLBZadW1UQqq+upzilEnG1hVXSLV/eKEcPmx/xJddYhsB+JNQ2TnxLyHpxoF0tS
    M/nQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1765208376;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=OCAj3pMHBw3Z3bxFipx3RCUpBnI8lvUOpKX0oIfxnlM=;
    b=V8tCunkscdf6RKyLhVhCMJKHWTcGFVRTXaaYrqx9S7JASgyDUB5gV43GN1ewPVHjEu
    cjVkcGruPj7r1CjPdL1KJ0N1NI4+McXeP+AI3+Y3nteOeX4+C7wfc1ZnkcWi7OsInye6
    cCc/IYUNYAfnnYMaRKm4CuJRpi97B8WTMuoeN7sw12DSCJb4WTtiaNBsPloHcD1qiBs3
    WKth+Hv4bes05Eiwdgb5Hv7Fq3sqM1y3mWeU0WXEHpQ3xZI3rlh8f5xeVGgm6KIXbExf
    jzeXu/3wbeE47PHagZQzcVVcjWAl7Z3ybl2TMMUk2ZhQjtY5IMtGD2OF69AWm/ek7VCg
    ZkrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1765208376;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=OCAj3pMHBw3Z3bxFipx3RCUpBnI8lvUOpKX0oIfxnlM=;
    b=cUCcp3irNrLnJO3CpINW8tfRHb8/O68UrcAW9aECWR7nGEPdMdqXopcAIrnVzME/9k
    KcsNJpa8+lBze5Rc57Bw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIy+l5B/g"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 54.0.0 DYNA|AUTH)
    with ESMTPSA id ed69d81B8FdZDX4
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 8 Dec 2025 16:39:35 +0100 (CET)
Subject: [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Christophe Leroy <chleroy@kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
References: <52ef7162-5578-4e73-9c46-2bae0be8df61@kernel.org>
 <102879D6-E08F-4645-A2F6-DEA2C3E6C0D1@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <649c07da-b3f8-3035-911a-5c0368837ddf@xenosoft.de>
Date: Mon, 8 Dec 2025 16:39:26 +0100
X-Mailer: BrassMonkey/33.9.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <102879D6-E08F-4645-A2F6-DEA2C3E6C0D1@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 08/12/25 13:06, Christian Zigotzky wrote:
> On 08 December 2025 at 10:54 am, Christophe Leroy (CS GROUP) <chleroy@kernel.org> wrote:
>
> ﻿Hello,
>
> Can you provide more details on your problem, the full messages before the Oops, and your .config ?
>
> Thanks
> Christophe
>
> - - -
>
> Hello Christophe,
>
> Here is the kernel config:
>
> https://raw.githubusercontent.com/chzigotzky/kernels/refs/heads/main/configs/e5500_defconfig
>
> [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1 #18: https://github.com/chzigotzky/kernels/issues/18
>
> git revert ad952db4a865e96ec98d4c5874a4699fe3286d56 -m
>
> After a compiling the kernel boots again.
>
> Thanks,
> Christian

Serial log with kernel error messages: 
https://github.com/user-attachments/files/24035394/Kernel_6.19.0_Cyrus_Plus_board_P5040.log

After a revert of the powerpc updates 6.19-1, the kernel boots without 
any problems on our e5500 machines.

-- 
Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)


