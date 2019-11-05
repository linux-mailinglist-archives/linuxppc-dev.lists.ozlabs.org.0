Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F34E7EF6A3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 08:53:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476hjm6VBWzDqtv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 18:53:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p02-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5302::12;
 helo=mo6-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="a2NkTcm/"; 
 dkim-atps=neutral
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476hgl0S5CzF3Z2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 18:51:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1572940284;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=lkzbMGkHWur9AlJl2ovp2V95ZZOPOfTo0f2kTkXCsE0=;
 b=a2NkTcm/xugGKFbquniVENdaKhgP6j58fBvis4qoBDUFqwQ+MAyo5JO70LsONEDlHU
 GkogUesP3k0hftNyMN60yrlZPNzdV+GUTJqj2IGY0XEzjjjV3SL+12i/v+riNHs3ahHj
 SH3+YE5lSXb4lY5AosSGIopnE2u2PDzaauy/Jfpru8l6B4m/Kc3HaWjot8vKAm5Yy2En
 WpTP14+MvUpcQNbggteRKKVifFAWeXYx2qBQ7mukoixmjpiy11fBRD34Zs3WM8YtNIam
 Zf2tkQwIGlF7QMq68FL0c98xSe01pX6sdMDDOM7sW0tSsPpfV//iGH1sn9YZ/lk1l2GZ
 w+OA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySd+h5FvloCRpQViBsLQ=="
X-RZG-CLASS-ID: mo00
Received: from [192.168.178.47] by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
 with ESMTPSA id q007c8vA57oYi9x
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 5 Nov 2019 08:50:34 +0100 (CET)
Subject: Bug 205201 - overflow of DMA mask and bus mask
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Darren Stevens <darren@stevens-zone.net>,
 "contact@a-eon.com" <contact@a-eon.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
References: <7b549219-a2e1-08c7-331b-9c3e4fdb8a8f@xenosoft.de>
 <3aeae0d8-e9be-2585-cbbd-70263cb495f1@xenosoft.de>
 <20191015125105.GU25745@shell.armlinux.org.uk>
 <5611f3bc-68aa-78ec-182a-1cb414202314@xenosoft.de>
 <20191015131750.GV25745@shell.armlinux.org.uk>
 <87muds586t.fsf@mpe.ellerman.id.au>
 <AD53973C-4491-4114-9CEE-81F516EF6249@xenosoft.de>
 <668ae8d5-f9f9-6304-d389-a854da53c2d2@xenosoft.de>
Message-ID: <22f58dae-4e30-076a-8479-b57b40098cd6@xenosoft.de>
Date: Tue, 5 Nov 2019 08:50:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <668ae8d5-f9f9-6304-d389-a854da53c2d2@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

We still have DMA problems with some PCI devices. Since the PowerPC 
updates 4.21-1 [1] we need to decrease the RAM to 3500MB (mem=3500M) if 
we want to work with our PCI devices. The FSL P5020 and P5040 have these 
problems currently.

Error message:

[   25.654852] bttv 1000:04:05.0: overflow 0x00000000fe077000+4096 of 
DMA mask ffffffff bus mask df000000

All 5.x Linux kernels can't initialize a SCSI PCI card anymore so 
booting of a Linux userland isn't possible.

PLEASE check the DMA changes in the PowerPC updates 4.21-1 [1]. The 
kernel 4.20 works with all PCI devices without limitation of RAM.

We created a bug report a month ago. [2]

Thanks,
Christian

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8d6973327ee84c2f40dd9efd8928d4a1186c96e2
[2] https://bugzilla.kernel.org/show_bug.cgi?id=205201


