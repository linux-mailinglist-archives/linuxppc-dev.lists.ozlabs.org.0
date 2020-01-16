Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B4013D60C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 09:42:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yyNr2BlwzDqYY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 19:42:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=yusufalti1997@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Sc87hYnw; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yxGJ2M2CzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 18:51:16 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id j42so18036428wrj.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 23:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wrweCBoX/Pi4rvOFKv5htgBRJr0uIF+ZUbw8BoxGagI=;
 b=Sc87hYnwkESQ06r8BKSD0GnYJYp/MpldCDD04PhRDNB9Vlvf6SBClbzrCNOnCZB9RI
 i/ULTx+t1CVMlQOJig2vqg1T9sntUZdDNowa0Hoi1kLefXPG15mj42IgiOnVJ+TlFdtI
 EXuNnw47Uma3P3AeGYVGgYKPvuetwUegrgpCOBf465DPTpl8dCP7ydnuZQLUBDMyEeyK
 eV0P1KMaHCy/6UflvN/u53Mv6DoFrhMFmqLom9sPcBq4hvDUmXr2tM/BLZfcXt640l77
 8SER2SqO2yHMImxN2lI9RFy7HouQct96rKSR18Cu433qYch7KTrv6Oo+3qaS4fNhzWbP
 7LbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wrweCBoX/Pi4rvOFKv5htgBRJr0uIF+ZUbw8BoxGagI=;
 b=idrlADso1HRN2n0ZT6CFLiI6hWw32oW3/4dwI2Tp6XaOzH82njV3XSzZ5hjgHapf6x
 Wj5Z+mO5wuw6CMnsrkMVo0nCSXlpOHXV3y6na20UvY5WcyUjkjrk1Y7/UcleBrZSll9t
 9b8J6JAHCFtXQPtAeqfwXE1SmH4vFQKgbT8BEERXOg3TyruueyV4ED1gNw4rDBij84AG
 HSuYevs1uuEf23+4rHaaRBJLhOIJi8TObsJmcDW8vuo2g7g0jGo43x+KlO03qs7OSN7B
 VH7V1sWkfivMKF6RtPj+cdWGqWc3HM2NXpmIZ2cacD6j6DSICNpQM0fyKgSvDZM7BK2o
 WqwA==
X-Gm-Message-State: APjAAAXsKLtBWnTU34kg9KgKvW2zo3cENcD/vE9O65hjkp8JZorVYZGw
 0v0lqYW/X5b/kg4sfChv/A/5EAn8VMIKmbr4NDP2RLJj
X-Google-Smtp-Source: APXvYqy5chy0cf9xlRCbkPQGZUG43SqYMIrgcg5P0pg01fdoke+YAY72nW3/3ZrHvj1uHBlEcWBmNDQKS4t4hMBPW/o=
X-Received: by 2002:adf:8297:: with SMTP id 23mr1666333wrc.379.1579161072785; 
 Wed, 15 Jan 2020 23:51:12 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Yusuf_Alt=C4=B1parmak?= <yusufalti1997@gmail.com>
Date: Thu, 16 Jan 2020 10:51:01 +0300
Message-ID: <CAGzVRjz3dr87WPWCYm56FW0_cwr8tiexoJGa+nfqD4wmWE+YRw@mail.gmail.com>
Subject: (PowerPC) PCI driver writeb() and readb() failures with 'machine
 check error'.
To: linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000c95d00059c3d16cd"
X-Mailman-Approved-At: Thu, 16 Jan 2020 19:40:20 +1100
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

--000000000000c95d00059c3d16cd
Content-Type: text/plain; charset="UTF-8"

Hello,

I am having an important trouble while communicating with my PCI Endpoint
devices MMIO. I am using T1042D4RDB-64B. PowerPC e5500 processor with
kernel version 4.19 and default PCI driver is 'pcieport'. Kernel is built
with Yocto 2.7.

I have a FPGA memory controller card which is programmed to light GPIO leds
when it's memory is filled with data on PCI. I wrote a driver and tested it
with x86 based Ubuntu and it's working as expected.

I used same driver with T1042D4RDB-64B. Kernel is giving UNRECOVERABLE
MACHINE CHECK error when I try to read the same area I wrote before. Leds
are also not lighting so that this means write operation is not working
too. Seems like ATMU is not transferring the transactions to PCI endpoint
device.

I tried same code piece with another endpoint device ( This is a GPU ) and
I had same problem again.

I am seeking some help about this issue.

*Detailed thread is here:*
https://community.nxp.com/thread/522267

*Driver code piece*
pci_request_regions(dev, "IO-pci");
pci_enable_device_mem(dev);
printk(KERN_INFO "Physical address start:
%lX",pci_resource_start(dev,BAR_IO));
          printk(KERN_INFO "Physical address end:
%lX",pci_resource_end(dev,BAR_IO));
          iomapped_addr_start =
ioremap(pci_resfreescaleource_start(dev,BAR_IO),pci_resource_len(dev,BAR_IO));
          printk(KERN_INFO "Virtual address start:
%lX",iomapped_addr_start);

if(iomapped_addr_start != NULL || iomapped_addr_start != 0)
 {
   for(i=0;i<pci_resource_len(dev,BAR_IO);i++)
   {
       printk(KERN_INFO "Before Write %lX \n",iomapped_addr_start+i);
       writeb(5,iomapped_addr_start+i);
       printk(KERN_INFO "Writed 5 \n");
       printk(KERN_INFO "Readed %d",readb(iomapped_addr_start+i));
   }
 }

*Output:*
Physical address start: 0x21000000
Physical address end: 0x210007ff
Virtual address start: 80000800888C0000
Before Write 80000800888C0000

Writed 5

ntDlaibslaibnlgi nlgo clko cdke bduegbguginggi ngdu de ueto t ko erkenernl
eltat
  x

80000001 cecar 0x020c0000 cecar2 0x00001010

CaCuasuesde db yb y( f(rformom M MCSCSR=R=a0a00000):): L Looad Error Report

KeKrenrenle lp apannici c -- n onott s ysynncicningg: Unrecoverable Machine
chek

--000000000000c95d00059c3d16cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I am having an import=
ant=20
trouble while communicating with my PCI Endpoint devices MMIO. I am=20
using T1042D4RDB-64B. PowerPC e5500 processor with kernel version 4.19 and =
default PCI driver is &#39;pcieport&#39;. Kernel is built with Yocto 2.7.<b=
r></div><div><br></div><div>I
 have a FPGA memory controller card which is programmed to light GPIO=20
leds when it&#39;s memory is filled with data on PCI. I wrote a driver and=
=20
tested it with x86 based Ubuntu and it&#39;s working as expected.</div><div=
><br></div><div>I
 used same driver with T1042D4RDB-64B. Kernel is giving UNRECOVERABLE=20
MACHINE CHECK error when I try to read the same area I wrote before.=20
Leds are also not lighting so that this means write operation is not=20
working too. Seems like ATMU is not transferring the transactions to PCI
 endpoint device.</div><div><br></div><div>I tried same code piece with ano=
ther endpoint device ( This is a GPU ) and I had same problem again.</div><=
div><br></div><div>I am seeking some help about this issue.<br></div><div><=
br></div><div><b>Detailed thread is here:</b><br></div><div><a href=3D"http=
s://community.nxp.com/thread/522267" target=3D"_blank">https://community.nx=
p.com/thread/522267</a></div><div><br></div><div><b>Driver code piece</b><b=
r></div><div>pci_request_regions(dev, &quot;IO-pci&quot;); <br></div><div>	=
pci_enable_device_mem(dev);</div><div>printk(KERN_INFO &quot;Physical addre=
ss start: %lX&quot;,pci_resource_start(dev,BAR_IO));<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 printk(KERN_INFO &quot;Physical address end: %lX&quot;,pc=
i_resource_end(dev,BAR_IO));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iomapped=
_addr_start =3D ioremap(pci_resfreescaleource_start(dev,BAR_IO),pci_resourc=
e_len(dev,BAR_IO));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_INFO =
&quot;Virtual address start: %lX&quot;,iomapped_addr_start);</div><div><br>=
</div><div>if(iomapped_addr_start !=3D NULL || iomapped_addr_start !=3D 0)<=
br>	 =C2=A0{<br>=C2=A0=C2=A0 for(i=3D0;i&lt;pci_resource_len(dev,BAR_IO);i+=
+)<br>	 =C2=A0 =C2=A0{ <br>=C2=A0 =C2=A0 =C2=A0=C2=A0 printk(KERN_INFO &quo=
t;Before Write %lX \n&quot;,iomapped_addr_start+i);<br>=C2=A0 =C2=A0 =C2=A0=
=C2=A0 writeb(5,iomapped_addr_start+i);<br>=C2=A0 =C2=A0 =C2=A0=C2=A0 print=
k(KERN_INFO &quot;Writed 5 \n&quot;);<br>=C2=A0 =C2=A0 =C2=A0=C2=A0 printk(=
KERN_INFO &quot;Readed %d&quot;,readb(iomapped_addr_start+i)); <br>=C2=A0=
=C2=A0 }<br>=C2=A0}</div><div><br></div><div><b>Output:</b></div><div>Physi=
cal address start: 0x21000000</div><div>Physical address end: 0x210007ff</d=
iv><div>Virtual address start: 80000800888C0000</div><div>Before Write 8000=
0800888C0000 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>Writed 5 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br>ntDlaibslaibnlgi nlgo clko cdke bduegbguginggi ngdu de ueto t=
 ko erkenernl eltat<br>=C2=A0 x =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <br>80000001 cecar 0x020c0000 cecar2 0x00001010 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>CaCuasuesde db yb y( f(rformom M MCSCSR=
=3DR=3Da0a00000):): L Looad Error Report =C2=A0 =C2=A0 <br>KeKrenrenle lp a=
pannici c -- n onott s ysynncicningg: Unrecoverable Machine chek</div></div=
>

--000000000000c95d00059c3d16cd--
