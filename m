Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E06D75FC0F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 08:55:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnNh65gy3z3c71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 17:55:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=qJZDoCBw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.25; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=qJZDoCBw;
	dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnNgB1bFgz2xGq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 17:54:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1665557482;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:Cc:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=NePx0MdnLGFjpyeHJHw+TCE+ZHDzUcEnpwS0rmc55y8=;
    b=qJZDoCBw0IOF5s+eaqjqpUqdPurvzmg3GBgy+YRIzg/Fd1G+aakKFwFLDc7X5CZVNs
    YrC5cNm65FA1Do2N8jBEqKOjG8Pne58cIKmvpK/gLln0eVCh8ZPHQu24GXFERl/1fdGa
    Waxya/7Y80ilE7lwr+RPwnEI6pmn5CKdDv45osJCXfxv7F3yTHmHPdiSm1XWJHPb2Sxj
    gQSUGB7vS05Flp2NIu6qIqlXnbKomKIBPLGZcFpj5gx5HZBHibtzWHVUxD5iNWk7/C5Y
    HlaHSrkk1nkIKGA9herRrhl937dDU0y2TuIU1TQ8xVDDGjHeFGoZkMfPkG9CJj3Fgc8Y
    fnSg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7aWdygroxwSIDTb0wcqBFh/H2hatRar9vxDw5bSE="
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 48.2.0 AUTH)
    with ESMTPSA id j7449ey9C6pLTEb
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 12 Oct 2022 08:51:21 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Date: Wed, 12 Oct 2022 08:51:20 +0200
Subject: Issues with the first PowerPC updates for the kernel 6.1
Message-Id: <6C70D01A-B819-40BC-94F7-5BA6D8109134@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
Cc: Olof Johansson <olof@lixom.net>, Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, Trevor Dickinson <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

I use the Nemo board with a PASemi PA6T CPU and have some issues since the f=
irst PowerPC updates for the kernel 6.1.

I successfully compiled the git kernel with the first PowerPC updates two da=
ys ago.

Unfortunately this kernel is really dangerous. Many things for example Netwo=
rk Manager and LightDM don't work anymore and produced several gigabyte of c=
onfig files till the partition has been filled.

I deleted some files like the resolv.conf that had a size over 200 GB!

Unfortunately, MintPPC was still damaged. For example LightDM doesn't work a=
nymore and the MATE desktop doesn't display any icons anymore because Caja w=
asn't able to reserve memory anymore.

In this case, bisecting isn't an option and I have to wait some weeks. It is=
 really difficult to find the issue if the userland will damaged again and a=
gain.

Cheers,
Christian=

