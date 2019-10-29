Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E194E7F5F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 05:52:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472K1s6mwrzF1Qk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 15:52:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p02-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5302::6;
 helo=mo6-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="faSPHAnm"; 
 dkim-atps=neutral
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472Jzd148KzF1Kn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 15:50:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1572324591;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:Cc:Message-Id:Subject:Date:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=SePvrxFPljU1wf4BH24QtFUFFzi97xWavFGCvI0Lz2w=;
 b=faSPHAnmH/Y2XlKNJNs+GuVPkuYtQHWDKHmaLPX9NF5qRPvXDNG+RZK3WLFO73Snv0
 XKPZLJoZBLeOUg0KAJRZWt4exN6hTrnz3MnRvTOQWCmGrWVt84Ifa4cg5YhYLqP8N5up
 1frgUWyNzXOrVEk1wlgTsuR/ZJkg29y47okdK3poFuNPfCoJKbXbXOfU5O+WnJ+ze5Ln
 pvv9FkaRzXJlWjSx8qhSXyLiBFEYHYeXZOyhsRM7OdXBapZqIM7y3I+glY4ZFumGjYYv
 QcMjjKZWehBsbTc6lAg0uwYldFq5LvISmIVFUn7JBH2bCkR5rjxjOE3dkTNvHzCWeFPB
 XUjg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaM9fNtIXuaJFG8G1LafqfUmkxfLKuDtfDdyvJlQw=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:306f:86f1:3dd4:2f02]
 by smtp.strato.de (RZmta 44.28.1 AUTH)
 with ESMTPSA id 60869dv9T4nlLAR
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 29 Oct 2019 05:49:47 +0100 (CET)
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Date: Tue, 29 Oct 2019 05:49:46 +0100
Subject: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
Message-Id: <3582233D-3889-4D5B-87DF-1DBCEC853F07@xenosoft.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
X-Mailer: iPhone Mail (16G102)
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
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, Christoph Hellwig <hch@infradead.org>,
 "contact@a-eon.com" <contact@a-eon.com>, mad skateman <madskateman@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

The bug with some PCI devices if you have more than 3.5G installed still exi=
st in the RC5. Could you please look in the following bug report.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D205201

Thanks,
Christian=
