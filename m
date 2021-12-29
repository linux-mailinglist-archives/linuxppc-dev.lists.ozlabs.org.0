Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CE94814DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Dec 2021 17:10:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JPGb85Lm9z3c9T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 03:10:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=bYh88+1o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.218;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=bYh88+1o; 
 dkim-atps=neutral
X-Greylist: delayed 162 seconds by postgrey-1.36 at boromir;
 Thu, 30 Dec 2021 03:09:56 AEDT
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JPGZX0wT9z2xTC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Dec 2021 03:09:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1640794008;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:Cc:Message-Id:Subject:Date:From:Cc:Date:From:Subject:Sender;
 bh=Yo3PUEUOdmtcadeLsXgelZUsjZvk+jI/hJnryG5xrKU=;
 b=bYh88+1oZrpE34LgYtYNb/w/4TeEbmOTkTF6EgDyJEJAatn/JfVKAJ35CLxxAyVkxC
 QRhOHY7qDIWwzXsb7j7QzcAdepeGYJqhPK05gh5IPfRd4/L+i6+oayx7uJKCfMbMkrYV
 2gpO5EK/i+MWfvM+wiw1AZXTGxnjSKJurd+QM24frwgMCbKZ4+2eS/Pmwv7DTFNHkFfb
 4/niLf6ZOPvou80lz4JKffOBPzNbBkyKLUslkEhRpBY1S+3mt6y+agi9D46o2rzRq26d
 q8u1rdbR8iTYLAzu4LrW1vdZBijylxn5volPEGKiCRx1eHv8mxqOT1/aPgW+PzpWgmYa
 GzBw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7aWdy37pkwSf2Sym9UDWcQfeCJSFpXDGqVYIUbA=="
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple by smtp.strato.de (RZmta 47.35.3 AUTH)
 with ESMTPSA id Z01c89xBTG6mkQp
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 29 Dec 2021 17:06:48 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Date: Wed, 29 Dec 2021 17:06:47 +0100
Subject: The PA6T is still vulnerable
Message-Id: <F651905D-FC8B-43D4-A5DC-FFAFEF5AD69F@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Olof Johansson <olof@lixom.net>
X-Mailer: iPhone Mail (19B74)
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
Cc: "R.T.Dickinson" <rtd@a-eon.com>, Matthew Leaman <matthew@a-eon.biz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

The P.A. Semi PA6T is still vulnerable.

Architecture:                    ppc64
CPU op-mode(s):                  32-bit, 64-bit
Byte Order:                      Big Endian
CPU(s):                          2
On-line CPU(s) list:             0,1
Thread(s) per core:              1
Core(s) per socket:              2
Socket(s):                       1
Model:                           1.2 (pvr 0090 0102)
Model name:                      PA6T, altivec supported
L1d cache:                       128 KiB
L1i cache:                       128 KiB
Vulnerability Itlb multihit:     Not affected
Vulnerability L1tf:              Vulnerable
Vulnerability Mds:               Not affected
Vulnerability Meltdown:          Vulnerable
Vulnerability Spec store bypass: Vulnerable
Vulnerability Spectre v1:        Mitigation; __user pointer sanitization
Vulnerability Spectre v2:        Vulnerable
Vulnerability Srbds:             Not affected
Vulnerability Tsx async abort:   Not affected

Could you please check this issue?

Thanks,
Christian
