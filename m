Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 516F65AFB43
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 06:26:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMq2H5QX5z3cBL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 14:26:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=OHNz7T4o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.23; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=OHNz7T4o;
	dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMq1f5LjKz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 14:25:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1662524733;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:Cc:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=9FkOeJZP+kIAvKzKUimWO7rPUm+FZuqk9k8tG8D08i0=;
    b=OHNz7T4oQXB32KCMLJZ/Z3/wwyD5FlpOpoEJLHc2awlc2eq+JOZIQ9AteFKu8ztdWs
    9wJvNTx2x0jZpl2s2p4KM+sgC+seFYlMWx/LGpWPJTH0wBHo5UFW4hQ09H26Ub+q1YBO
    WXLKK9Ag2RR50m2zdEUEqOFG2VETE+W+DXhKjuVdM03Oo2fxSoPmOeJmKbcZXz2tpikN
    Ic4kK2fbVe4R24f40SUFxTYJLQ2IjCF3vD/hGTly1ozSEKietAf1T3aHp0/l+U3f86jH
    nxbzVyqXctgz0KML9xHDh99CjbHGM8om77VN1NrrpJ9iZgC8VENaQEDKaP36j178mpuU
    pbXA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7aWdyg7pswyBoz6L6s9xOeio4AaadOwr7kl9KNWmF"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 48.0.2 AUTH)
    with ESMTPSA id Z30242y874PX2Ow
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 7 Sep 2022 06:25:33 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Date: Wed, 7 Sep 2022 06:25:32 +0200
Subject: PASEMI: Wrong lscpu info since the RC1 of kernel 6.0
Message-Id: <5D6A3537-CF85-499C-97AF-ACF241DFF597@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailer: iPhone Mail (19G82)
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
Cc: Olof Johansson <olof@lixom.net>, Darren Stevens <darren@stevens-zone.net>, Trevor Dickinson <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

I use the Nemo board with a PASemi PA6T CPU and some values of lscpu are wro=
ng since the RC1 of kernel 6.0.

=E2=94=8C=E2=94=80=E2=94=80(mintppc=E3=89=BFmintppc)-[~]
=E2=94=94=E2=94=80$ lscpu
Architecture:                    ppc64
CPU op-mode(s):                  32-bit, 64-bit
Byte Order:                      Big Endian
CPU(s):                          2
On-line CPU(s) list:             0,1
Thread(s) per core:              2
Core(s) per socket:              1
Socket(s):                       1
Model:                           1.2 (pvr 0090 0102)
Model name:                      PA6T, altivec supported
L1d cache:                       64 KiB
L1i cache:                       64 KiB
Vulnerability Itlb multihit:     Not affected
Vulnerability L1tf:              Vulnerable
Vulnerability Mds:               Not affected
Vulnerability Meltdown:          Vulnerable
Vulnerability Mmio stale data:   Not affected
Vulnerability Retbleed:          Not affected
Vulnerability Spec store bypass: Vulnerable
Vulnerability Spectre v1:        Mitigation; __user pointer sanitization
Vulnerability Spectre v2:        Vulnerable
Vulnerability Srbds:             Not affected
Vulnerability Tsx async abort:   Not affected

=E2=80=94-

One core with 2 threads is wrong. Two cores are correct. Each core has one t=
hread.

Have you modified the detection of the CPU?

Thanks,
Christian=

