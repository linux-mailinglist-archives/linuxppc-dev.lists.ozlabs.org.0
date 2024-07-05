Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB80928364
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 10:06:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=kMFpwsvI;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=StylesDB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFmLQ0lvSz3cyf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 18:06:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=kMFpwsvI;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=StylesDB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.166; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFmKf5PdPz3c5Y
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2024 18:05:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1720166734; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gl5nexwVkuoIwhgOIbBaOhBfqWlI8nmyb27HyyKv6XdYjnoJfU2bRbCS1UauQcyOLW
    2z3OWKuyXvxK5UnfNl7cB8In3ywssXW9UvRFNrynPFOpM7b0o7G9BCQGD+fyCzUPmNF7
    3xHYqgBpZ9+3s02O2GJ9aOp7g5dO8iRc1EL7jOd5GdrgwnYPmi4tbl32oASfdktCyoiZ
    WEu2woJpavdUZzUQ5dW9b2L3S4ejq6aB665o5pvDXsdV5cCAP2piZyxz0vgcve+x4/cy
    44hCkxHo1wg1AAKStJnqo+Vu0u3XDfC7f2C6DWrYol/WVaWEkJ2rVcMJVLz/bfuG6IZw
    Xr9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1720166734;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=a97yB0J0sjTTHMcRbynjfBCKVta83Ey42tiJN4TdkTM=;
    b=OhVE4p+Dp86eMVBYIddhGzOjjolKBO2p5hR9+5ewZLP+kmumbvICdCDmvJgtRYH4Ql
    gnKQbGcX9xwgH+QjXJXrGvwRgdSd1Hom/jH2StiLDWJW6FOSeItRrsSiLh0II6ME28kZ
    G+axLatTFK8wUmenkFVMusCMc2ul8z9stmHHwcpocTKeuJl8vYeBQKrXhELemhowQOO6
    XsSyxGo9KDSnlqz794fQOcH/MzmsPi1qfvQRravDSsWTra1k84yi2oAe5FUUNlIJ6sy+
    A4zHik+z5zvF2/F/NJejNAcDc1RaUrCYUjpnSOMBtUEv8E4bFSGWNhrgy7K49F95zZqg
    SMQg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1720166734;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=a97yB0J0sjTTHMcRbynjfBCKVta83Ey42tiJN4TdkTM=;
    b=kMFpwsvIbsd81XW0VouTIMRlYW1xlT6HcXfU9/NbhToZBUvFK8h2NJUbng6SuVe2X6
    I0a85rPR/uRTXM74xuf4a1Vc2UOS5T6/hf2Sh50jHHEFKlP+vB9nND+0mOneM7FGSg4K
    XBTyaBxCU52YiedwGxbXvWYbenDUFuYZX99jK7dgdGvzgiP80MyTHS5JIo1ykguHhWG9
    KWGthG1eetHoqIzdcVJowupuSMAwqQMMuuYCLcMUwuZOLAX/CevE7EwLRquAMXDqtRRh
    YBiiroY7KieOmvOK7i6qxjAKfro5rMnjii4ctjNIlqS5WoSfSmuRaAvqrl8oftaQfdla
    lIMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1720166734;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=a97yB0J0sjTTHMcRbynjfBCKVta83Ey42tiJN4TdkTM=;
    b=StylesDB/lgRsS+lQ5LcJxNXmcFf27sGs4aT9DklxOlApqThzoVfVKzhyeMiYj8nUN
    YDQe4FBftGZ6f4NmK4CQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5m0s3zACH4zLZuKVd30n/B17YES0k2Xt9gM8w=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e0838906585YVPi
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 5 Jul 2024 10:05:34 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives after the of/irq updates 2024-05-29
Date: Fri, 5 Jul 2024 10:05:23 +0200
Message-Id: <C7B869E5-95D9-426E-A2CB-8336CC9EF432@xenosoft.de>
References: <C2FBFAD0-DEEE-4906-80B1-5FA745CD9726@xenosoft.de>
In-Reply-To: <C2FBFAD0-DEEE-4906-80B1-5FA745CD9726@xenosoft.de>
To: Marc Zyngier <maz@kernel.org>
X-Mailer: iPhone Mail (21F90)
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
Cc: apatel@ventanamicro.com, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

How about the other patch[1], which would be far preferable?

   M.

[1] https://lore.kernel.org/all/86ed8ba2sp.wl-maz@kernel.org

- - - -

Marc,

We will test the patch as soon as possible.

Christian

- - - -

Our tester has reported, that it doesn=E2=80=99t boot.

Link: https://forum.hyperion-entertainment.com/viewtopic.php?p=3D58627#p5862=
7=

