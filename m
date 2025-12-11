Return-Path: <linuxppc-dev+bounces-14720-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1013CCB4DF5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Dec 2025 07:27:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRjKx4SB0z2xqk;
	Thu, 11 Dec 2025 17:27:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.161 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765434421;
	cv=pass; b=huU+pUkaV7+sekbrqxrqt6vb7PgQ8a2W7nitqZPzRfEujNdhMLUHJ9IcuY0GNViPwCaUOxlT9U3zrlfKzzrMvv57aryqEuCQF1E8vjQE0A3T875K0tQYKYi6HVhkCFthCXxTFw3fsIQ5kNqlkxCjnEMsLUrOdE17t9W6bImZk/u5Piyj/EbyIpSVY89MGr9xl82Unp7x7x6va0zffcAvmA26TajcZpaHrbVsXHNs+2terpdROey+a8JbEnFmyoeB9Jh8gIN57Yw6ejpncxrHOmKaSaiNqWfQ5TEbwWttF7TQNC7nPw26yogq2vmMr4FS9wFcOMyzdYVCaz+cLHIdPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765434421; c=relaxed/relaxed;
	bh=MK60T4F2xQ95vg3yxvDMUgKDXGAtusYJGFKVzbscewc=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=JK1VIoARAB5ReKmTwUQC2SeKMlCubaPiNdIF9soW2fSCQuA1PQM9is+hC2VUKjMGBLtdHioPomSX4XTeEXmvs06efj7zfM9iub8SVUJ7CjD5HDTo7aLsv4H1Lof18oOuyPzDPyDvldbf4Rb54N3Z8C/QuTzWzifoiEDgA+x3uBe+O1WRqiKQtUEUOoSBj/jlONFyKmojPcFts5eM+OIUy6n7fy2cqbQqOw83Z8FDYKWyiAnspFwmlNgk2BPVOsDLrvM3Hp3FEB907byyUxlJd6BIrTFUrXF1H3ESeuAtV9+Ht+7RfE5PsPGtF/+9TKlyhqppjC7l0c+daE6P2hrcfA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=eT58OmK4; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=WR+VPjn+; dkim-atps=neutral; spf=pass (client-ip=81.169.146.161; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=eT58OmK4;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=WR+VPjn+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.161; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRjKs2HBvz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Dec 2025 17:26:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1765434397; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=WI48ehGxRh4PWsNbpz1w7vhQy3ASJfyO89wd3SApQ5YlqZVxdFmsjgAlyzPwUbGYmb
    edo+mjUxfMGXmr2HgXvNzTI25x7dSuhmTGz9c3GeGXmdgysUEusl15yOsveBh0XPJS7/
    yvTKUhfbJ9/O7AzfEKuh9jImxkdnsAj5dfuj5BQ4tdTMiavqt7i4eSVJcQyI7Tuqd/KG
    WMPaUNIR0QPe5t+Ptdg0E//RdgH+8XJXx01eOb+ymCHB9aGMo3SDwNH1l9IruITEFZUX
    1G8J8PphH5amIymFGGKZM5IgAWm1+84xS3SHd56oRuGvKZ7RT0epSxi51aNqEoXYaewb
    GC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1765434397;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=MK60T4F2xQ95vg3yxvDMUgKDXGAtusYJGFKVzbscewc=;
    b=AEHm0Sr294zFky8Tn5Xjf5YQhQXvcRQzsVVDr6jZrSogfn1bIf1pKO39WuhtjPv+ma
    af64oWd7yFeXSmwZp5dyKbZmvWps+YjYfDBGJUP22AA5lMpjhE9VpAneSn2PFCLtQave
    hB+ZKgYtK/j864Wq55TvsrjNP+feCdRaW1f6alG4UX//rYqjMEdKAzbIFiDaUeI5It18
    trSSGaCyowfdIUbqMyZzMeJTBfLGyHyuIcBpSOQFgx+7lvbjqhWJOC1/j9oPqmd5F/4P
    9OSqgLwtRlB+9vxqLu6wyvW2FihvnmzuXjtCARGyMsrnSVe/DxxtC2I6RCpLxyaccv/0
    baiQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1765434397;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=MK60T4F2xQ95vg3yxvDMUgKDXGAtusYJGFKVzbscewc=;
    b=eT58OmK4So2LHvCptWnoHQMcvstShjlpGjVIVLGL+LC6T6xsWBMAPMPKNuUxTWoB1A
    xr8Xu918vJKPOu7ZsSbm8NsGo9ecSIBZr7JA94Oj4zB7dOt9Hb7FkLyF3jVbiS4N6JVo
    Y0fSjXFvORAUqLOxJ0FeTBVmxp5sQsE1EJARBJjVJfRV0CB1bc9c8iO6mXlSB5quMDJ0
    yStoyEXHdwN/S3AyCD1v322SfrFrD4t194kwlsH5eOp6rWUGgDmPIzBhdMe6XSl0ctPb
    vSjrjCoIXcz3lCAOALU4Z764eRSIwIHmTBh6/a+ZKJMvTTcnOZaStxeBnEyndHKqKF9F
    YWhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1765434397;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=MK60T4F2xQ95vg3yxvDMUgKDXGAtusYJGFKVzbscewc=;
    b=WR+VPjn+1/N79kJvlp9whShGa/B5fSpo1SbqKZ7aUpaKHMVDKdJwWH8OmFBI2hoGR0
    51OEAaQclEc0M+32DnBw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5m3s3yRXXtGnvCD6nJ7G4/8fHK/YAmdKgd0gmo="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 54.1.0 AUTH)
    with ESMTPSA id efe0e51BB6Qb2Az
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 11 Dec 2025 07:26:37 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Mime-Version: 1.0 (1.0)
Subject: Re: [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1
Date: Thu, 11 Dec 2025 07:26:26 +0100
Message-Id: <5DADF74C-98ED-4557-82D8-77E2B414FFA8@xenosoft.de>
References: <13B0A253-0AED-4B02-BC95-242A9480C321@xenosoft.de>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <13B0A253-0AED-4B02-BC95-242A9480C321@xenosoft.de>
To: Christophe Leroy <chleroy@kernel.org>
X-Mailer: iPhone Mail (23B85)
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Christophe,

I was able to reduce the patch.

The following modification is responsible for the boot issue:

diff -rupN a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt=
.c
--- a/arch/powerpc/kernel/interrupt.c	2025-12-09 06:57:20.717347165 +0100=

+++ b/arch/powerpc/kernel/interrupt.c	2025-12-09 10:24:37.357301725 +0100=

@@ -38,7 +38,7 @@ static inline bool exit_must_hard_disabl
 #else
 static inline bool exit_must_hard_disable(void)
 {
-	return false;
+	return true;
 }
 #endif

- - -

After reverting this modification, the kernel boots without any problems.

Please check this modification.

Thanks,
Christian=


