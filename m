Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E925EE8DC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 20:37:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476NNx3p0pzF32j
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 06:37:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=rajagiritech.edu.in (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=jeffrin@rajagiritech.edu.in;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rajagiritech.edu.in
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=rajagiritech-edu-in.20150623.gappssmtp.com
 header.i=@rajagiritech-edu-in.20150623.gappssmtp.com header.b="vsMwvO2d"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476NLB12FVzDqkK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 06:35:13 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id g50so25722387qtb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2019 11:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rajagiritech-edu-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SyQkpfx5ifyzUZfLRSIIffsIMNwjhk9vHOMCEBD9hZ4=;
 b=vsMwvO2dbySpAE/uf+GossFiHgQYQ5AOAshFgxAO0PQiPn1xMXj4KfogGYkPAfrAp1
 bHB9vJsYqKl3CUb/+eN10vQX8zph5qEFYEDEClGYEsDFfuqIjuMikdeA+MWx+NEVDYgm
 BXbnTY9vN5lS0LnicfNU6st5p3TxYswcDTdOzO2bwECGLZz8hnG7mGO41ChIGodheLwm
 ChPxNUfAAhTIIENdVhI3VLvCsdFNvLkRLqDCpRQ3NKCr3RRx0mbd0+NjgKfdhgzthxLc
 TIEPm8gPvQonZb5bAxOax1obRe0ewIMpS3yxwZmAFRg5BytkX4gc3qV8Qlj2QhG29z3M
 gC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SyQkpfx5ifyzUZfLRSIIffsIMNwjhk9vHOMCEBD9hZ4=;
 b=ShFVGbvJ4FvsZEs1lIK8J/220kwBlLRq/heA4xmomByGatjnlmED+S+igoWQPPvXV5
 PE0G2Xaadr8+iTAcrBCPJ4fIUISQrHNa0MEP7eZVS9kR/+uoDbagsJMTnkrROaHJ1cKY
 m9AQcK/ga+H7c/pfoh+AbdSXmcn3lDDufKAtKzdaAiVeGo76cUDN1e6ZYKV8oMGJrhWx
 rTzPMN/C3e8EEMaRQSC9TH7lWIGnV5+pamoWUT/hW/V4VB5pzH3QGr/dUZ5KL/KxHYCU
 pN783SnGayqfk+AU3jAl3jSatzxq7tqlq0hBAZYdIwoKMDRBWP6+D6fysb1B53esZn/T
 2+JA==
X-Gm-Message-State: APjAAAXV+IkN7iGOssIHOTKu222ZLzXJ8kkSDA8JagE7NuBk0zyr82YP
 DaXzgjMw6j/QkZB3bB6sco6uPUszw/Kmyw/ekTUh3g==
X-Google-Smtp-Source: APXvYqzBUQIOo1/1FMIVScuIGdyMHPk/2z5zRJ/l15GOXDG0/rkGy6SIQUNkzytlH3veNRbokCCHr8tRNIaHniPEy68=
X-Received: by 2002:aed:3225:: with SMTP id y34mr14116374qtd.353.1572896107565; 
 Mon, 04 Nov 2019 11:35:07 -0800 (PST)
MIME-Version: 1.0
References: <CAG=yYwmQHyp62qKDoiM091iXKs5iP8rNBLs9kc7Wi_PDCgMrbw@mail.gmail.com>
 <CAOSf1CFn7F_3gLk4sCetDd3JGUiTv50=KSqQuicpPkcRZPVKNQ@mail.gmail.com>
 <CAG=yYw=RjFg4NnR2jxkPujg5M2W01CP92bJZU77OZjaqH2vnOg@mail.gmail.com>
In-Reply-To: <CAG=yYw=RjFg4NnR2jxkPujg5M2W01CP92bJZU77OZjaqH2vnOg@mail.gmail.com>
From: Jeffrin Thalakkottoor <jeffrin@rajagiritech.edu.in>
Date: Tue, 5 Nov 2019 01:04:31 +0530
Message-ID: <CAG=yYwk0Y61sBcBa1nKBMy1K+oRauyNX4yyV6eqnCAajEG7HyQ@mail.gmail.com>
Subject: Re: PROBLEM: PCIe Bus Error atleast
To: "Oliver O'Halloran" <oohall@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000c306a605968a694e"
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000c306a605968a694e
Content-Type: text/plain; charset="UTF-8"

hello ,
> > Can you provide the full dmesg and the output of lspci -vv?
> typical dmesg and lspci -vv  is attached

new lspci -vv  related attached
this time it is "sudo lspci -vv"
-- 
software engineer
rajagiri school of engineering and technology

--000000000000c306a605968a694e
Content-Type: text/plain; charset="US-ASCII"; name="newlspci-vv.txt"
Content-Disposition: attachment; filename="newlspci-vv.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_k2ktoghq0>
X-Attachment-Id: f_k2ktoghq0

MDA6MDAuMCBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycG9yYXRpb24gWGVvbiBFMy0xMjAwIHY2Lzd0
aCBHZW4gQ29yZSBQcm9jZXNzb3IgSG9zdCBCcmlkZ2UvRFJBTSBSZWdpc3RlcnMgKHJldiAwMykK
CVN1YnN5c3RlbTogQVNVU1RlSyBDb21wdXRlciBJbmMuIFhlb24gRTMtMTIwMCB2Ni83dGggR2Vu
IENvcmUgUHJvY2Vzc29yIEhvc3QgQnJpZGdlL0RSQU0gUmVnaXN0ZXJzCglDb250cm9sOiBJL08t
IE1lbSsgQnVzTWFzdGVyKyBTcGVjQ3ljbGUtIE1lbVdJTlYtIFZHQVNub29wLSBQYXJFcnItIFN0
ZXBwaW5nLSBTRVJSLSBGYXN0QjJCLSBEaXNJTlR4LQoJU3RhdHVzOiBDYXArIDY2TUh6LSBVREYt
IEZhc3RCMkIrIFBhckVyci0gREVWU0VMPWZhc3QgPlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydCsg
PlNFUlItIDxQRVJSLSBJTlR4LQoJTGF0ZW5jeTogMAoJQ2FwYWJpbGl0aWVzOiBbZTBdIFZlbmRv
ciBTcGVjaWZpYyBJbmZvcm1hdGlvbjogTGVuPTEwIDw/PgoJS2VybmVsIGRyaXZlciBpbiB1c2U6
IHNrbF91bmNvcmUKCjAwOjAyLjAgVkdBIGNvbXBhdGlibGUgY29udHJvbGxlcjogSW50ZWwgQ29y
cG9yYXRpb24gRGV2aWNlIDU5MjEgKHJldiAwNikgKHByb2ctaWYgMDAgW1ZHQSBjb250cm9sbGVy
XSkKCVN1YnN5c3RlbTogQVNVU1RlSyBDb21wdXRlciBJbmMuIERldmljZSAxMzExCglDb250cm9s
OiBJL08rIE1lbSsgQnVzTWFzdGVyKyBTcGVjQ3ljbGUtIE1lbVdJTlYtIFZHQVNub29wLSBQYXJF
cnItIFN0ZXBwaW5nLSBTRVJSLSBGYXN0QjJCLSBEaXNJTlR4KwoJU3RhdHVzOiBDYXArIDY2TUh6
LSBVREYtIEZhc3RCMkItIFBhckVyci0gREVWU0VMPWZhc3QgPlRBYm9ydC0gPFRBYm9ydC0gPE1B
Ym9ydC0gPlNFUlItIDxQRVJSLSBJTlR4LQoJTGF0ZW5jeTogMCwgQ2FjaGUgTGluZSBTaXplOiA2
NCBieXRlcwoJSW50ZXJydXB0OiBwaW4gQSByb3V0ZWQgdG8gSVJRIDEyNwoJUmVnaW9uIDA6IE1l
bW9yeSBhdCBlZTAwMDAwMCAoNjQtYml0LCBub24tcHJlZmV0Y2hhYmxlKSBbc2l6ZT0xNk1dCglS
ZWdpb24gMjogTWVtb3J5IGF0IGQwMDAwMDAwICg2NC1iaXQsIHByZWZldGNoYWJsZSkgW3NpemU9
MjU2TV0KCVJlZ2lvbiA0OiBJL08gcG9ydHMgYXQgZjAwMCBbc2l6ZT02NF0KCVt2aXJ0dWFsXSBF
eHBhbnNpb24gUk9NIGF0IDAwMGMwMDAwIFtkaXNhYmxlZF0gW3NpemU9MTI4S10KCUNhcGFiaWxp
dGllczogWzQwXSBWZW5kb3IgU3BlY2lmaWMgSW5mb3JtYXRpb246IExlbj0wYyA8Pz4KCUNhcGFi
aWxpdGllczogWzcwXSBFeHByZXNzICh2MikgUm9vdCBDb21wbGV4IEludGVncmF0ZWQgRW5kcG9p
bnQsIE1TSSAwMAoJCURldkNhcDoJTWF4UGF5bG9hZCAxMjggYnl0ZXMsIFBoYW50RnVuYyAwCgkJ
CUV4dFRhZy0gUkJFKwoJCURldkN0bDoJUmVwb3J0IGVycm9yczogQ29ycmVjdGFibGUtIE5vbi1G
YXRhbC0gRmF0YWwtIFVuc3VwcG9ydGVkLQoJCQlSbHhkT3JkLSBFeHRUYWctIFBoYW50RnVuYy0g
QXV4UHdyLSBOb1Nub29wLQoJCQlNYXhQYXlsb2FkIDEyOCBieXRlcywgTWF4UmVhZFJlcSAxMjgg
Ynl0ZXMKCQlEZXZTdGE6CUNvcnJFcnItIFVuY29yckVyci0gRmF0YWxFcnItIFVuc3VwcFJlcS0g
QXV4UHdyLSBUcmFuc1BlbmQtCgkJRGV2Q2FwMjogQ29tcGxldGlvbiBUaW1lb3V0OiBOb3QgU3Vw
cG9ydGVkLCBUaW1lb3V0RGlzLSwgTFRSLSwgT0JGRiBOb3QgU3VwcG9ydGVkCgkJRGV2Q3RsMjog
Q29tcGxldGlvbiBUaW1lb3V0OiA1MHVzIHRvIDUwbXMsIFRpbWVvdXREaXMtLCBMVFItLCBPQkZG
IERpc2FibGVkCglDYXBhYmlsaXRpZXM6IFthY10gTVNJOiBFbmFibGUrIENvdW50PTEvMSBNYXNr
YWJsZS0gNjRiaXQtCgkJQWRkcmVzczogZmVlMDAwMTggIERhdGE6IDAwMDAKCUNhcGFiaWxpdGll
czogW2QwXSBQb3dlciBNYW5hZ2VtZW50IHZlcnNpb24gMgoJCUZsYWdzOiBQTUVDbGstIERTSSsg
RDEtIEQyLSBBdXhDdXJyZW50PTBtQSBQTUUoRDAtLEQxLSxEMi0sRDNob3QtLEQzY29sZC0pCgkJ
U3RhdHVzOiBEMCBOb1NvZnRSc3QtIFBNRS1FbmFibGUtIERTZWw9MCBEU2NhbGU9MCBQTUUtCglD
YXBhYmlsaXRpZXM6IFsxMDAgdjFdIFByb2Nlc3MgQWRkcmVzcyBTcGFjZSBJRCAoUEFTSUQpCgkJ
UEFTSURDYXA6IEV4ZWMtIFByaXYtLCBNYXggUEFTSUQgV2lkdGg6IDE0CgkJUEFTSURDdGw6IEVu
YWJsZS0gRXhlYy0gUHJpdi0KCUNhcGFiaWxpdGllczogWzIwMCB2MV0gQWRkcmVzcyBUcmFuc2xh
dGlvbiBTZXJ2aWNlIChBVFMpCgkJQVRTQ2FwOglJbnZhbGlkYXRlIFF1ZXVlIERlcHRoOiAwMAoJ
CUFUU0N0bDoJRW5hYmxlLSwgU21hbGxlc3QgVHJhbnNsYXRpb24gVW5pdDogMDAKCUNhcGFiaWxp
dGllczogWzMwMCB2MV0gUGFnZSBSZXF1ZXN0IEludGVyZmFjZSAoUFJJKQoJCVBSSUN0bDogRW5h
YmxlLSBSZXNldC0KCQlQUklTdGE6IFJGLSBVUFJHSS0gU3RvcHBlZCsKCQlQYWdlIFJlcXVlc3Qg
Q2FwYWNpdHk6IDAwMDA4MDAwLCBQYWdlIFJlcXVlc3QgQWxsb2NhdGlvbjogMDAwMDAwMDAKCUtl
cm5lbCBkcml2ZXIgaW4gdXNlOiBpOTE1CglLZXJuZWwgbW9kdWxlczogaTkxNQoKMDA6MDQuMCBT
aWduYWwgcHJvY2Vzc2luZyBjb250cm9sbGVyOiBJbnRlbCBDb3Jwb3JhdGlvbiBTa3lsYWtlIFBy
b2Nlc3NvciBUaGVybWFsIFN1YnN5c3RlbSAocmV2IDAzKQoJU3Vic3lzdGVtOiBBU1VTVGVLIENv
bXB1dGVyIEluYy4gWGVvbiBFMy0xMjAwIHY1L0UzLTE1MDAgdjUvNnRoIEdlbiBDb3JlIFByb2Nl
c3NvciBUaGVybWFsIFN1YnN5c3RlbQoJQ29udHJvbDogSS9PLSBNZW0rIEJ1c01hc3Rlci0gU3Bl
Y0N5Y2xlLSBNZW1XSU5WLSBWR0FTbm9vcC0gUGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFzdEIy
Qi0gRGlzSU5UeC0KCVN0YXR1czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJCKyBQYXJFcnItIERF
VlNFTD1mYXN0ID5UQWJvcnQtIDxUQWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8UEVSUi0gSU5UeC0K
CUludGVycnVwdDogcGluIEEgcm91dGVkIHRvIElSUSAxNgoJUmVnaW9uIDA6IE1lbW9yeSBhdCBl
ZjFhODAwMCAoNjQtYml0LCBub24tcHJlZmV0Y2hhYmxlKSBbc2l6ZT0zMktdCglDYXBhYmlsaXRp
ZXM6IFs5MF0gTVNJOiBFbmFibGUtIENvdW50PTEvMSBNYXNrYWJsZS0gNjRiaXQtCgkJQWRkcmVz
czogMDAwMDAwMDAgIERhdGE6IDAwMDAKCUNhcGFiaWxpdGllczogW2QwXSBQb3dlciBNYW5hZ2Vt
ZW50IHZlcnNpb24gMwoJCUZsYWdzOiBQTUVDbGstIERTSS0gRDEtIEQyLSBBdXhDdXJyZW50PTBt
QSBQTUUoRDAtLEQxLSxEMi0sRDNob3QtLEQzY29sZC0pCgkJU3RhdHVzOiBEMCBOb1NvZnRSc3Qr
IFBNRS1FbmFibGUtIERTZWw9MCBEU2NhbGU9MCBQTUUtCglDYXBhYmlsaXRpZXM6IFtlMF0gVmVu
ZG9yIFNwZWNpZmljIEluZm9ybWF0aW9uOiBMZW49MGMgPD8+CglLZXJuZWwgZHJpdmVyIGluIHVz
ZTogcHJvY190aGVybWFsCglLZXJuZWwgbW9kdWxlczogcHJvY2Vzc29yX3RoZXJtYWxfZGV2aWNl
CgowMDoxNC4wIFVTQiBjb250cm9sbGVyOiBJbnRlbCBDb3Jwb3JhdGlvbiBTdW5yaXNlIFBvaW50
LUxQIFVTQiAzLjAgeEhDSSBDb250cm9sbGVyIChyZXYgMjEpIChwcm9nLWlmIDMwIFtYSENJXSkK
CVN1YnN5c3RlbTogQVNVU1RlSyBDb21wdXRlciBJbmMuIFN1bnJpc2UgUG9pbnQtTFAgVVNCIDMu
MCB4SENJIENvbnRyb2xsZXIKCUNvbnRyb2w6IEkvTy0gTWVtKyBCdXNNYXN0ZXIrIFNwZWNDeWNs
ZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBhckVyci0gU3RlcHBpbmctIFNFUlItIEZhc3RCMkItIERp
c0lOVHgrCglTdGF0dXM6IENhcCsgNjZNSHotIFVERi0gRmFzdEIyQisgUGFyRXJyLSBERVZTRUw9
bWVkaXVtID5UQWJvcnQtIDxUQWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8UEVSUi0gSU5UeC0KCUxh
dGVuY3k6IDAKCUludGVycnVwdDogcGluIEEgcm91dGVkIHRvIElSUSAxMjQKCVJlZ2lvbiAwOiBN
ZW1vcnkgYXQgZWYxOTAwMDAgKDY0LWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9NjRLXQoJ
Q2FwYWJpbGl0aWVzOiBbNzBdIFBvd2VyIE1hbmFnZW1lbnQgdmVyc2lvbiAyCgkJRmxhZ3M6IFBN
RUNsay0gRFNJLSBEMS0gRDItIEF1eEN1cnJlbnQ9Mzc1bUEgUE1FKEQwLSxEMS0sRDItLEQzaG90
KyxEM2NvbGQrKQoJCVN0YXR1czogRDAgTm9Tb2Z0UnN0KyBQTUUtRW5hYmxlLSBEU2VsPTAgRFNj
YWxlPTAgUE1FLQoJQ2FwYWJpbGl0aWVzOiBbODBdIE1TSTogRW5hYmxlKyBDb3VudD0xLzggTWFz
a2FibGUtIDY0Yml0KwoJCUFkZHJlc3M6IDAwMDAwMDAwZmVlMDAyYjggIERhdGE6IDAwMDAKCUtl
cm5lbCBkcml2ZXIgaW4gdXNlOiB4aGNpX2hjZAoJS2VybmVsIG1vZHVsZXM6IHhoY2lfcGNpCgow
MDoxNC4yIFNpZ25hbCBwcm9jZXNzaW5nIGNvbnRyb2xsZXI6IEludGVsIENvcnBvcmF0aW9uIFN1
bnJpc2UgUG9pbnQtTFAgVGhlcm1hbCBzdWJzeXN0ZW0gKHJldiAyMSkKCVN1YnN5c3RlbTogQVNV
U1RlSyBDb21wdXRlciBJbmMuIFN1bnJpc2UgUG9pbnQtTFAgVGhlcm1hbCBzdWJzeXN0ZW0KCUNv
bnRyb2w6IEkvTy0gTWVtKyBCdXNNYXN0ZXItIFNwZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25vb3At
IFBhckVyci0gU3RlcHBpbmctIFNFUlItIEZhc3RCMkItIERpc0lOVHgtCglTdGF0dXM6IENhcCsg
NjZNSHotIFVERi0gRmFzdEIyQi0gUGFyRXJyLSBERVZTRUw9ZmFzdCA+VEFib3J0LSA8VEFib3J0
LSA8TUFib3J0LSA+U0VSUi0gPFBFUlItIElOVHgtCglJbnRlcnJ1cHQ6IHBpbiBDIHJvdXRlZCB0
byBJUlEgMTgKCVJlZ2lvbiAwOiBNZW1vcnkgYXQgZWYxYzAwMDAgKDY0LWJpdCwgbm9uLXByZWZl
dGNoYWJsZSkgW3NpemU9NEtdCglDYXBhYmlsaXRpZXM6IFs1MF0gUG93ZXIgTWFuYWdlbWVudCB2
ZXJzaW9uIDMKCQlGbGFnczogUE1FQ2xrLSBEU0krIEQxLSBEMi0gQXV4Q3VycmVudD0wbUEgUE1F
KEQwLSxEMS0sRDItLEQzaG90LSxEM2NvbGQtKQoJCVN0YXR1czogRDAgTm9Tb2Z0UnN0KyBQTUUt
RW5hYmxlLSBEU2VsPTAgRFNjYWxlPTAgUE1FLQoJQ2FwYWJpbGl0aWVzOiBbODBdIE1TSTogRW5h
YmxlLSBDb3VudD0xLzEgTWFza2FibGUtIDY0Yml0LQoJCUFkZHJlc3M6IDAwMDAwMDAwICBEYXRh
OiAwMDAwCglLZXJuZWwgZHJpdmVyIGluIHVzZTogaW50ZWxfcGNoX3RoZXJtYWwKCUtlcm5lbCBt
b2R1bGVzOiBpbnRlbF9wY2hfdGhlcm1hbAoKMDA6MTUuMCBTaWduYWwgcHJvY2Vzc2luZyBjb250
cm9sbGVyOiBJbnRlbCBDb3Jwb3JhdGlvbiBTdW5yaXNlIFBvaW50LUxQIFNlcmlhbCBJTyBJMkMg
Q29udHJvbGxlciAjMCAocmV2IDIxKQoJU3Vic3lzdGVtOiBBU1VTVGVLIENvbXB1dGVyIEluYy4g
U3VucmlzZSBQb2ludC1MUCBTZXJpYWwgSU8gSTJDIENvbnRyb2xsZXIKCUNvbnRyb2w6IEkvTy0g
TWVtKyBCdXNNYXN0ZXIrIFNwZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBhckVyci0gU3Rl
cHBpbmctIFNFUlItIEZhc3RCMkItIERpc0lOVHgtCglTdGF0dXM6IENhcCsgNjZNSHotIFVERi0g
RmFzdEIyQi0gUGFyRXJyLSBERVZTRUw9ZmFzdCA+VEFib3J0LSA8VEFib3J0LSA8TUFib3J0LSA+
U0VSUi0gPFBFUlItIElOVHgtCglMYXRlbmN5OiAwLCBDYWNoZSBMaW5lIFNpemU6IDY0IGJ5dGVz
CglJbnRlcnJ1cHQ6IHBpbiBBIHJvdXRlZCB0byBJUlEgMTYKCVJlZ2lvbiAwOiBNZW1vcnkgYXQg
ZWYxYmYwMDAgKDY0LWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9NEtdCglDYXBhYmlsaXRp
ZXM6IFs4MF0gUG93ZXIgTWFuYWdlbWVudCB2ZXJzaW9uIDMKCQlGbGFnczogUE1FQ2xrLSBEU0kt
IEQxLSBEMi0gQXV4Q3VycmVudD0wbUEgUE1FKEQwLSxEMS0sRDItLEQzaG90LSxEM2NvbGQtKQoJ
CVN0YXR1czogRDMgTm9Tb2Z0UnN0KyBQTUUtRW5hYmxlLSBEU2VsPTAgRFNjYWxlPTAgUE1FLQoJ
Q2FwYWJpbGl0aWVzOiBbOTBdIFZlbmRvciBTcGVjaWZpYyBJbmZvcm1hdGlvbjogTGVuPTE0IDw/
PgoJS2VybmVsIGRyaXZlciBpbiB1c2U6IGludGVsLWxwc3MKCUtlcm5lbCBtb2R1bGVzOiBpbnRl
bF9scHNzX3BjaQoKMDA6MTUuMSBTaWduYWwgcHJvY2Vzc2luZyBjb250cm9sbGVyOiBJbnRlbCBD
b3Jwb3JhdGlvbiBTdW5yaXNlIFBvaW50LUxQIFNlcmlhbCBJTyBJMkMgQ29udHJvbGxlciAjMSAo
cmV2IDIxKQoJU3Vic3lzdGVtOiBBU1VTVGVLIENvbXB1dGVyIEluYy4gU3VucmlzZSBQb2ludC1M
UCBTZXJpYWwgSU8gSTJDIENvbnRyb2xsZXIKCUNvbnRyb2w6IEkvTy0gTWVtKyBCdXNNYXN0ZXIr
IFNwZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBhckVyci0gU3RlcHBpbmctIFNFUlItIEZh
c3RCMkItIERpc0lOVHgtCglTdGF0dXM6IENhcCsgNjZNSHotIFVERi0gRmFzdEIyQi0gUGFyRXJy
LSBERVZTRUw9ZmFzdCA+VEFib3J0LSA8VEFib3J0LSA8TUFib3J0LSA+U0VSUi0gPFBFUlItIElO
VHgtCglMYXRlbmN5OiAwLCBDYWNoZSBMaW5lIFNpemU6IDY0IGJ5dGVzCglJbnRlcnJ1cHQ6IHBp
biBCIHJvdXRlZCB0byBJUlEgMTcKCVJlZ2lvbiAwOiBNZW1vcnkgYXQgZWYxYmUwMDAgKDY0LWJp
dCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9NEtdCglDYXBhYmlsaXRpZXM6IFs4MF0gUG93ZXIg
TWFuYWdlbWVudCB2ZXJzaW9uIDMKCQlGbGFnczogUE1FQ2xrLSBEU0ktIEQxLSBEMi0gQXV4Q3Vy
cmVudD0wbUEgUE1FKEQwLSxEMS0sRDItLEQzaG90LSxEM2NvbGQtKQoJCVN0YXR1czogRDMgTm9T
b2Z0UnN0KyBQTUUtRW5hYmxlLSBEU2VsPTAgRFNjYWxlPTAgUE1FLQoJQ2FwYWJpbGl0aWVzOiBb
OTBdIFZlbmRvciBTcGVjaWZpYyBJbmZvcm1hdGlvbjogTGVuPTE0IDw/PgoJS2VybmVsIGRyaXZl
ciBpbiB1c2U6IGludGVsLWxwc3MKCUtlcm5lbCBtb2R1bGVzOiBpbnRlbF9scHNzX3BjaQoKMDA6
MTYuMCBDb21tdW5pY2F0aW9uIGNvbnRyb2xsZXI6IEludGVsIENvcnBvcmF0aW9uIFN1bnJpc2Ug
UG9pbnQtTFAgQ1NNRSBIRUNJICMxIChyZXYgMjEpCglTdWJzeXN0ZW06IEFTVVNUZUsgQ29tcHV0
ZXIgSW5jLiBTdW5yaXNlIFBvaW50LUxQIENTTUUgSEVDSQoJQ29udHJvbDogSS9PLSBNZW0rIEJ1
c01hc3RlcisgU3BlY0N5Y2xlLSBNZW1XSU5WLSBWR0FTbm9vcC0gUGFyRXJyLSBTdGVwcGluZy0g
U0VSUi0gRmFzdEIyQi0gRGlzSU5UeCsKCVN0YXR1czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJC
LSBQYXJFcnItIERFVlNFTD1mYXN0ID5UQWJvcnQtIDxUQWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8
UEVSUi0gSU5UeC0KCUxhdGVuY3k6IDAKCUludGVycnVwdDogcGluIEEgcm91dGVkIHRvIElSUSAx
MjgKCVJlZ2lvbiAwOiBNZW1vcnkgYXQgZWYxYmQwMDAgKDY0LWJpdCwgbm9uLXByZWZldGNoYWJs
ZSkgW3NpemU9NEtdCglDYXBhYmlsaXRpZXM6IFs1MF0gUG93ZXIgTWFuYWdlbWVudCB2ZXJzaW9u
IDMKCQlGbGFnczogUE1FQ2xrLSBEU0ktIEQxLSBEMi0gQXV4Q3VycmVudD0wbUEgUE1FKEQwLSxE
MS0sRDItLEQzaG90KyxEM2NvbGQtKQoJCVN0YXR1czogRDAgTm9Tb2Z0UnN0KyBQTUUtRW5hYmxl
LSBEU2VsPTAgRFNjYWxlPTAgUE1FLQoJQ2FwYWJpbGl0aWVzOiBbOGNdIE1TSTogRW5hYmxlKyBD
b3VudD0xLzEgTWFza2FibGUtIDY0Yml0KwoJCUFkZHJlc3M6IDAwMDAwMDAwZmVlMDAzNTggIERh
dGE6IDAwMDAKCUtlcm5lbCBkcml2ZXIgaW4gdXNlOiBtZWlfbWUKCUtlcm5lbCBtb2R1bGVzOiBt
ZWlfbWUKCjAwOjE3LjAgUkFJRCBidXMgY29udHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24gODI4
MDEgTW9iaWxlIFNBVEEgQ29udHJvbGxlciBbUkFJRCBtb2RlXSAocmV2IDIxKQoJU3Vic3lzdGVt
OiBBU1VTVGVLIENvbXB1dGVyIEluYy4gODI4MDEgTW9iaWxlIFNBVEEgQ29udHJvbGxlciBbUkFJ
RCBtb2RlXQoJQ29udHJvbDogSS9PKyBNZW0rIEJ1c01hc3RlcisgU3BlY0N5Y2xlLSBNZW1XSU5W
LSBWR0FTbm9vcC0gUGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFzdEIyQi0gRGlzSU5UeCsKCVN0
YXR1czogQ2FwKyA2Nk1IeisgVURGLSBGYXN0QjJCKyBQYXJFcnItIERFVlNFTD1tZWRpdW0gPlRB
Ym9ydC0gPFRBYm9ydC0gPE1BYm9ydC0gPlNFUlItIDxQRVJSLSBJTlR4LQoJTGF0ZW5jeTogMAoJ
SW50ZXJydXB0OiBwaW4gQSByb3V0ZWQgdG8gSVJRIDEyNQoJUmVnaW9uIDA6IE1lbW9yeSBhdCBl
ZjFhMDAwMCAoMzItYml0LCBub24tcHJlZmV0Y2hhYmxlKSBbc2l6ZT0zMktdCglSZWdpb24gMTog
TWVtb3J5IGF0IGVmMWJjMDAwICgzMi1iaXQsIG5vbi1wcmVmZXRjaGFibGUpIFtzaXplPTI1Nl0K
CVJlZ2lvbiAyOiBJL08gcG9ydHMgYXQgZjA5MCBbc2l6ZT04XQoJUmVnaW9uIDM6IEkvTyBwb3J0
cyBhdCBmMDgwIFtzaXplPTRdCglSZWdpb24gNDogSS9PIHBvcnRzIGF0IGYwNjAgW3NpemU9MzJd
CglSZWdpb24gNTogTWVtb3J5IGF0IGVmMTAwMDAwICgzMi1iaXQsIG5vbi1wcmVmZXRjaGFibGUp
IFtzaXplPTUxMktdCglDYXBhYmlsaXRpZXM6IFs4MF0gTVNJOiBFbmFibGUrIENvdW50PTEvMSBN
YXNrYWJsZS0gNjRiaXQtCgkJQWRkcmVzczogZmVlMDAyZjggIERhdGE6IDAwMDAKCUNhcGFiaWxp
dGllczogWzcwXSBQb3dlciBNYW5hZ2VtZW50IHZlcnNpb24gMwoJCUZsYWdzOiBQTUVDbGstIERT
SS0gRDEtIEQyLSBBdXhDdXJyZW50PTBtQSBQTUUoRDAtLEQxLSxEMi0sRDNob3QrLEQzY29sZC0p
CgkJU3RhdHVzOiBEMCBOb1NvZnRSc3QrIFBNRS1FbmFibGUtIERTZWw9MCBEU2NhbGU9MCBQTUUt
CglDYXBhYmlsaXRpZXM6IFthOF0gU0FUQSBIQkEgdjEuMCBCQVI0IE9mZnNldD0wMDAwMDAwNAoJ
S2VybmVsIGRyaXZlciBpbiB1c2U6IGFoY2kKCUtlcm5lbCBtb2R1bGVzOiBhaGNpCgowMDoxYy4w
IFBDSSBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9uIFN1bnJpc2UgUG9pbnQtTFAgUENJIEV4cHJl
c3MgUm9vdCBQb3J0IChyZXYgZjEpIChwcm9nLWlmIDAwIFtOb3JtYWwgZGVjb2RlXSkKCUNvbnRy
b2w6IEkvTysgTWVtKyBCdXNNYXN0ZXIrIFNwZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBh
ckVyci0gU3RlcHBpbmctIFNFUlItIEZhc3RCMkItIERpc0lOVHgrCglTdGF0dXM6IENhcCsgNjZN
SHotIFVERi0gRmFzdEIyQi0gUGFyRXJyLSBERVZTRUw9ZmFzdCA+VEFib3J0LSA8VEFib3J0LSA8
TUFib3J0LSA+U0VSUi0gPFBFUlItIElOVHgtCglMYXRlbmN5OiAwLCBDYWNoZSBMaW5lIFNpemU6
IDY0IGJ5dGVzCglJbnRlcnJ1cHQ6IHBpbiBBIHJvdXRlZCB0byBJUlEgMTIyCglCdXM6IHByaW1h
cnk9MDAsIHNlY29uZGFyeT0wMSwgc3Vib3JkaW5hdGU9MDEsIHNlYy1sYXRlbmN5PTAKCUkvTyBi
ZWhpbmQgYnJpZGdlOiAwMDAwMjAwMC0wMDAwMmZmZgoJTWVtb3J5IGJlaGluZCBicmlkZ2U6IGEw
MDAwMDAwLWEwMWZmZmZmCglQcmVmZXRjaGFibGUgbWVtb3J5IGJlaGluZCBicmlkZ2U6IDAwMDAw
MDAwYTAyMDAwMDAtMDAwMDAwMDBhMDNmZmZmZgoJU2Vjb25kYXJ5IHN0YXR1czogNjZNSHotIEZh
c3RCMkItIFBhckVyci0gREVWU0VMPWZhc3QgPlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydCsgPFNF
UlItIDxQRVJSLQoJQnJpZGdlQ3RsOiBQYXJpdHktIFNFUlIrIE5vSVNBLSBWR0EtIE1BYm9ydC0g
PlJlc2V0LSBGYXN0QjJCLQoJCVByaURpc2NUbXItIFNlY0Rpc2NUbXItIERpc2NUbXJTdGF0LSBE
aXNjVG1yU0VSUkVuLQoJQ2FwYWJpbGl0aWVzOiBbNDBdIEV4cHJlc3MgKHYyKSBSb290IFBvcnQg
KFNsb3QrKSwgTVNJIDAwCgkJRGV2Q2FwOglNYXhQYXlsb2FkIDI1NiBieXRlcywgUGhhbnRGdW5j
IDAKCQkJRXh0VGFnLSBSQkUrCgkJRGV2Q3RsOglSZXBvcnQgZXJyb3JzOiBDb3JyZWN0YWJsZS0g
Tm9uLUZhdGFsLSBGYXRhbC0gVW5zdXBwb3J0ZWQtCgkJCVJseGRPcmQtIEV4dFRhZy0gUGhhbnRG
dW5jLSBBdXhQd3ItIE5vU25vb3AtCgkJCU1heFBheWxvYWQgMTI4IGJ5dGVzLCBNYXhSZWFkUmVx
IDEyOCBieXRlcwoJCURldlN0YToJQ29yckVyci0gVW5jb3JyRXJyLSBGYXRhbEVyci0gVW5zdXBw
UmVxLSBBdXhQd3IrIFRyYW5zUGVuZC0KCQlMbmtDYXA6CVBvcnQgIzEsIFNwZWVkIDhHVC9zLCBX
aWR0aCB4NCwgQVNQTSBMMHMgTDEsIEV4aXQgTGF0ZW5jeSBMMHMgdW5saW1pdGVkLCBMMSA8NHVz
CgkJCUNsb2NrUE0tIFN1cnByaXNlLSBMTEFjdFJlcCsgQndOb3QrIEFTUE1PcHRDb21wKwoJCUxu
a0N0bDoJQVNQTSBMMHMgTDEgRW5hYmxlZDsgUkNCIDY0IGJ5dGVzIERpc2FibGVkLSBDb21tQ2xr
LQoJCQlFeHRTeW5jaC0gQ2xvY2tQTS0gQXV0V2lkRGlzLSBCV0ludC0gQXV0QldJbnQtCgkJTG5r
U3RhOglTcGVlZCAyLjVHVC9zLCBXaWR0aCB4MCwgVHJFcnItIFRyYWluLSBTbG90Q2xrKyBETEFj
dGl2ZS0gQldNZ210LSBBQldNZ210LQoJCVNsdENhcDoJQXR0bkJ0bi0gUHdyQ3RybC0gTVJMLSBB
dHRuSW5kLSBQd3JJbmQtIEhvdFBsdWcrIFN1cnByaXNlKwoJCQlTbG90ICMwLCBQb3dlckxpbWl0
IDAuMDAwVzsgSW50ZXJsb2NrLSBOb0NvbXBsKwoJCVNsdEN0bDoJRW5hYmxlOiBBdHRuQnRuLSBQ
d3JGbHQtIE1STC0gUHJlc0RldCsgQ21kQ3BsdC0gSFBJcnErIExpbmtDaGcrCgkJCUNvbnRyb2w6
IEF0dG5JbmQgVW5rbm93biwgUHdySW5kIFVua25vd24sIFBvd2VyLSBJbnRlcmxvY2stCgkJU2x0
U3RhOglTdGF0dXM6IEF0dG5CdG4tIFBvd2VyRmx0LSBNUkwtIENtZENwbHQtIFByZXNEZXQtIElu
dGVybG9jay0KCQkJQ2hhbmdlZDogTVJMLSBQcmVzRGV0LSBMaW5rU3RhdGUtCgkJUm9vdEN0bDog
RXJyQ29ycmVjdGFibGUtIEVyck5vbi1GYXRhbC0gRXJyRmF0YWwtIFBNRUludEVuYSsgQ1JTVmlz
aWJsZS0KCQlSb290Q2FwOiBDUlNWaXNpYmxlLQoJCVJvb3RTdGE6IFBNRSBSZXFJRCAwMDAwLCBQ
TUVTdGF0dXMtIFBNRVBlbmRpbmctCgkJRGV2Q2FwMjogQ29tcGxldGlvbiBUaW1lb3V0OiBSYW5n
ZSBBQkMsIFRpbWVvdXREaXMrLCBMVFIrLCBPQkZGIFZpYSBXQUtFIyBBUklGd2QrCgkJRGV2Q3Rs
MjogQ29tcGxldGlvbiBUaW1lb3V0OiA1MHVzIHRvIDUwbXMsIFRpbWVvdXREaXMtLCBMVFItLCBP
QkZGIERpc2FibGVkIEFSSUZ3ZC0KCQlMbmtDdGwyOiBUYXJnZXQgTGluayBTcGVlZDogOEdUL3Ms
IEVudGVyQ29tcGxpYW5jZS0gU3BlZWREaXMtCgkJCSBUcmFuc21pdCBNYXJnaW46IE5vcm1hbCBP
cGVyYXRpbmcgUmFuZ2UsIEVudGVyTW9kaWZpZWRDb21wbGlhbmNlLSBDb21wbGlhbmNlU09TLQoJ
CQkgQ29tcGxpYW5jZSBEZS1lbXBoYXNpczogLTZkQgoJCUxua1N0YTI6IEN1cnJlbnQgRGUtZW1w
aGFzaXMgTGV2ZWw6IC0zLjVkQiwgRXF1YWxpemF0aW9uQ29tcGxldGUtLCBFcXVhbGl6YXRpb25Q
aGFzZTEtCgkJCSBFcXVhbGl6YXRpb25QaGFzZTItLCBFcXVhbGl6YXRpb25QaGFzZTMtLCBMaW5r
RXF1YWxpemF0aW9uUmVxdWVzdC0KCUNhcGFiaWxpdGllczogWzgwXSBNU0k6IEVuYWJsZSsgQ291
bnQ9MS8xIE1hc2thYmxlLSA2NGJpdC0KCQlBZGRyZXNzOiBmZWUwMDIxOCAgRGF0YTogMDAwMAoJ
Q2FwYWJpbGl0aWVzOiBbOTBdIFN1YnN5c3RlbTogQVNVU1RlSyBDb21wdXRlciBJbmMuIFN1bnJp
c2UgUG9pbnQtTFAgUENJIEV4cHJlc3MgUm9vdCBQb3J0CglDYXBhYmlsaXRpZXM6IFthMF0gUG93
ZXIgTWFuYWdlbWVudCB2ZXJzaW9uIDMKCQlGbGFnczogUE1FQ2xrLSBEU0ktIEQxLSBEMi0gQXV4
Q3VycmVudD0wbUEgUE1FKEQwKyxEMS0sRDItLEQzaG90KyxEM2NvbGQrKQoJCVN0YXR1czogRDAg
Tm9Tb2Z0UnN0LSBQTUUtRW5hYmxlLSBEU2VsPTAgRFNjYWxlPTAgUE1FLQoJS2VybmVsIGRyaXZl
ciBpbiB1c2U6IHBjaWVwb3J0CgowMDoxYy41IFBDSSBicmlkZ2U6IEludGVsIENvcnBvcmF0aW9u
IFN1bnJpc2UgUG9pbnQtTFAgUENJIEV4cHJlc3MgUm9vdCBQb3J0ICM2IChyZXYgZjEpIChwcm9n
LWlmIDAwIFtOb3JtYWwgZGVjb2RlXSkKCUNvbnRyb2w6IEkvTysgTWVtKyBCdXNNYXN0ZXIrIFNw
ZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBhckVyci0gU3RlcHBpbmctIFNFUlItIEZhc3RC
MkItIERpc0lOVHgrCglTdGF0dXM6IENhcCsgNjZNSHotIFVERi0gRmFzdEIyQi0gUGFyRXJyLSBE
RVZTRUw9ZmFzdCA+VEFib3J0LSA8VEFib3J0LSA8TUFib3J0LSA+U0VSUi0gPFBFUlItIElOVHgt
CglMYXRlbmN5OiAwLCBDYWNoZSBMaW5lIFNpemU6IDY0IGJ5dGVzCglJbnRlcnJ1cHQ6IHBpbiBC
IHJvdXRlZCB0byBJUlEgMTIzCglCdXM6IHByaW1hcnk9MDAsIHNlY29uZGFyeT0wMiwgc3Vib3Jk
aW5hdGU9MDIsIHNlYy1sYXRlbmN5PTAKCU1lbW9yeSBiZWhpbmQgYnJpZGdlOiBlZjAwMDAwMC1l
ZjBmZmZmZgoJU2Vjb25kYXJ5IHN0YXR1czogNjZNSHotIEZhc3RCMkItIFBhckVyci0gREVWU0VM
PWZhc3QgPlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydCsgPFNFUlItIDxQRVJSLQoJQnJpZGdlQ3Rs
OiBQYXJpdHktIFNFUlIrIE5vSVNBLSBWR0EtIE1BYm9ydC0gPlJlc2V0LSBGYXN0QjJCLQoJCVBy
aURpc2NUbXItIFNlY0Rpc2NUbXItIERpc2NUbXJTdGF0LSBEaXNjVG1yU0VSUkVuLQoJQ2FwYWJp
bGl0aWVzOiBbNDBdIEV4cHJlc3MgKHYyKSBSb290IFBvcnQgKFNsb3QrKSwgTVNJIDAwCgkJRGV2
Q2FwOglNYXhQYXlsb2FkIDI1NiBieXRlcywgUGhhbnRGdW5jIDAKCQkJRXh0VGFnLSBSQkUrCgkJ
RGV2Q3RsOglSZXBvcnQgZXJyb3JzOiBDb3JyZWN0YWJsZSsgTm9uLUZhdGFsKyBGYXRhbCsgVW5z
dXBwb3J0ZWQrCgkJCVJseGRPcmQtIEV4dFRhZy0gUGhhbnRGdW5jLSBBdXhQd3ItIE5vU25vb3At
CgkJCU1heFBheWxvYWQgMTI4IGJ5dGVzLCBNYXhSZWFkUmVxIDEyOCBieXRlcwoJCURldlN0YToJ
Q29yckVyci0gVW5jb3JyRXJyLSBGYXRhbEVyci0gVW5zdXBwUmVxLSBBdXhQd3IrIFRyYW5zUGVu
ZC0KCQlMbmtDYXA6CVBvcnQgIzYsIFNwZWVkIDhHVC9zLCBXaWR0aCB4MSwgQVNQTSBMMHMgTDEs
IEV4aXQgTGF0ZW5jeSBMMHMgPDF1cywgTDEgPDE2dXMKCQkJQ2xvY2tQTS0gU3VycHJpc2UtIExM
QWN0UmVwKyBCd05vdCsgQVNQTU9wdENvbXArCgkJTG5rQ3RsOglBU1BNIEwwcyBMMSBFbmFibGVk
OyBSQ0IgNjQgYnl0ZXMgRGlzYWJsZWQtIENvbW1DbGsrCgkJCUV4dFN5bmNoLSBDbG9ja1BNLSBB
dXRXaWREaXMtIEJXSW50LSBBdXRCV0ludC0KCQlMbmtTdGE6CVNwZWVkIDIuNUdUL3MsIFdpZHRo
IHgxLCBUckVyci0gVHJhaW4tIFNsb3RDbGsrIERMQWN0aXZlKyBCV01nbXQrIEFCV01nbXQtCgkJ
U2x0Q2FwOglBdHRuQnRuLSBQd3JDdHJsLSBNUkwtIEF0dG5JbmQtIFB3ckluZC0gSG90UGx1Zy0g
U3VycHJpc2UtCgkJCVNsb3QgIzksIFBvd2VyTGltaXQgMTAuMDAwVzsgSW50ZXJsb2NrLSBOb0Nv
bXBsKwoJCVNsdEN0bDoJRW5hYmxlOiBBdHRuQnRuLSBQd3JGbHQtIE1STC0gUHJlc0RldC0gQ21k
Q3BsdC0gSFBJcnEtIExpbmtDaGctCgkJCUNvbnRyb2w6IEF0dG5JbmQgVW5rbm93biwgUHdySW5k
IFVua25vd24sIFBvd2VyLSBJbnRlcmxvY2stCgkJU2x0U3RhOglTdGF0dXM6IEF0dG5CdG4tIFBv
d2VyRmx0LSBNUkwtIENtZENwbHQtIFByZXNEZXQrIEludGVybG9jay0KCQkJQ2hhbmdlZDogTVJM
LSBQcmVzRGV0LSBMaW5rU3RhdGUrCgkJUm9vdEN0bDogRXJyQ29ycmVjdGFibGUtIEVyck5vbi1G
YXRhbC0gRXJyRmF0YWwtIFBNRUludEVuYSsgQ1JTVmlzaWJsZS0KCQlSb290Q2FwOiBDUlNWaXNp
YmxlLQoJCVJvb3RTdGE6IFBNRSBSZXFJRCAwMDAwLCBQTUVTdGF0dXMtIFBNRVBlbmRpbmctCgkJ
RGV2Q2FwMjogQ29tcGxldGlvbiBUaW1lb3V0OiBSYW5nZSBBQkMsIFRpbWVvdXREaXMrLCBMVFIr
LCBPQkZGIE5vdCBTdXBwb3J0ZWQgQVJJRndkKwoJCURldkN0bDI6IENvbXBsZXRpb24gVGltZW91
dDogNTB1cyB0byA1MG1zLCBUaW1lb3V0RGlzLSwgTFRSKywgT0JGRiBEaXNhYmxlZCBBUklGd2Qt
CgkJTG5rQ3RsMjogVGFyZ2V0IExpbmsgU3BlZWQ6IDhHVC9zLCBFbnRlckNvbXBsaWFuY2UtIFNw
ZWVkRGlzLQoJCQkgVHJhbnNtaXQgTWFyZ2luOiBOb3JtYWwgT3BlcmF0aW5nIFJhbmdlLCBFbnRl
ck1vZGlmaWVkQ29tcGxpYW5jZS0gQ29tcGxpYW5jZVNPUy0KCQkJIENvbXBsaWFuY2UgRGUtZW1w
aGFzaXM6IC02ZEIKCQlMbmtTdGEyOiBDdXJyZW50IERlLWVtcGhhc2lzIExldmVsOiAtMy41ZEIs
IEVxdWFsaXphdGlvbkNvbXBsZXRlLSwgRXF1YWxpemF0aW9uUGhhc2UxLQoJCQkgRXF1YWxpemF0
aW9uUGhhc2UyLSwgRXF1YWxpemF0aW9uUGhhc2UzLSwgTGlua0VxdWFsaXphdGlvblJlcXVlc3Qt
CglDYXBhYmlsaXRpZXM6IFs4MF0gTVNJOiBFbmFibGUrIENvdW50PTEvMSBNYXNrYWJsZS0gNjRi
aXQtCgkJQWRkcmVzczogZmVlMDAyNTggIERhdGE6IDAwMDAKCUNhcGFiaWxpdGllczogWzkwXSBT
dWJzeXN0ZW06IEFTVVNUZUsgQ29tcHV0ZXIgSW5jLiBTdW5yaXNlIFBvaW50LUxQIFBDSSBFeHBy
ZXNzIFJvb3QgUG9ydAoJQ2FwYWJpbGl0aWVzOiBbYTBdIFBvd2VyIE1hbmFnZW1lbnQgdmVyc2lv
biAzCgkJRmxhZ3M6IFBNRUNsay0gRFNJLSBEMS0gRDItIEF1eEN1cnJlbnQ9MG1BIFBNRShEMCss
RDEtLEQyLSxEM2hvdCssRDNjb2xkKykKCQlTdGF0dXM6IEQwIE5vU29mdFJzdC0gUE1FLUVuYWJs
ZS0gRFNlbD0wIERTY2FsZT0wIFBNRS0KCUNhcGFiaWxpdGllczogWzEwMCB2MV0gQWR2YW5jZWQg
RXJyb3IgUmVwb3J0aW5nCgkJVUVTdGE6CURMUC0gU0RFUy0gVExQLSBGQ1AtIENtcGx0VE8tIENt
cGx0QWJydC0gVW54Q21wbHQtIFJ4T0YtIE1hbGZUTFAtIEVDUkMtIFVuc3VwUmVxLSBBQ1NWaW9s
LQoJCVVFTXNrOglETFAtIFNERVMtIFRMUC0gRkNQLSBDbXBsdFRPLSBDbXBsdEFicnQtIFVueENt
cGx0KyBSeE9GLSBNYWxmVExQLSBFQ1JDLSBVbnN1cFJlcS0gQUNTVmlvbC0KCQlVRVN2cnQ6CURM
UCsgU0RFUy0gVExQLSBGQ1AtIENtcGx0VE8tIENtcGx0QWJydC0gVW54Q21wbHQtIFJ4T0YrIE1h
bGZUTFArIEVDUkMtIFVuc3VwUmVxLSBBQ1NWaW9sLQoJCUNFU3RhOglSeEVyci0gQmFkVExQLSBC
YWRETExQLSBSb2xsb3Zlci0gVGltZW91dC0gTm9uRmF0YWxFcnItCgkJQ0VNc2s6CVJ4RXJyLSBC
YWRUTFAtIEJhZERMTFAtIFJvbGxvdmVyLSBUaW1lb3V0LSBOb25GYXRhbEVycisKCQlBRVJDYXA6
CUZpcnN0IEVycm9yIFBvaW50ZXI6IDAwLCBHZW5DYXAtIENHZW5Fbi0gQ2hrQ2FwLSBDaGtFbi0K
CUNhcGFiaWxpdGllczogWzE0MCB2MV0gQWNjZXNzIENvbnRyb2wgU2VydmljZXMKCQlBQ1NDYXA6
CVNyY1ZhbGlkKyBUcmFuc0JsaysgUmVxUmVkaXIrIENtcGx0UmVkaXIrIFVwc3RyZWFtRndkLSBF
Z3Jlc3NDdHJsLSBEaXJlY3RUcmFucy0KCQlBQ1NDdGw6CVNyY1ZhbGlkLSBUcmFuc0Jsay0gUmVx
UmVkaXItIENtcGx0UmVkaXItIFVwc3RyZWFtRndkLSBFZ3Jlc3NDdHJsLSBEaXJlY3RUcmFucy0K
CUNhcGFiaWxpdGllczogWzIwMCB2MV0gTDEgUE0gU3Vic3RhdGVzCgkJTDFTdWJDYXA6IFBDSS1Q
TV9MMS4yKyBQQ0ktUE1fTDEuMSsgQVNQTV9MMS4yKyBBU1BNX0wxLjErIEwxX1BNX1N1YnN0YXRl
cysKCQkJICBQb3J0Q29tbW9uTW9kZVJlc3RvcmVUaW1lPTQwdXMgUG9ydFRQb3dlck9uVGltZT00
NHVzCgkJTDFTdWJDdGwxOiBQQ0ktUE1fTDEuMi0gUENJLVBNX0wxLjEtIEFTUE1fTDEuMi0gQVNQ
TV9MMS4xLQoJCQkgICBUX0NvbW1vbk1vZGU9MHVzIExUUjEuMl9UaHJlc2hvbGQ9MG5zCgkJTDFT
dWJDdGwyOiBUX1B3ck9uPTQ0dXMKCUNhcGFiaWxpdGllczogWzIyMCB2MV0gIzE5CglLZXJuZWwg
ZHJpdmVyIGluIHVzZTogcGNpZXBvcnQKCjAwOjFlLjAgU2lnbmFsIHByb2Nlc3NpbmcgY29udHJv
bGxlcjogSW50ZWwgQ29ycG9yYXRpb24gU3VucmlzZSBQb2ludC1MUCBTZXJpYWwgSU8gVUFSVCBD
b250cm9sbGVyICMwIChyZXYgMjEpCglTdWJzeXN0ZW06IEFTVVNUZUsgQ29tcHV0ZXIgSW5jLiBT
dW5yaXNlIFBvaW50LUxQIFNlcmlhbCBJTyBVQVJUIENvbnRyb2xsZXIKCUNvbnRyb2w6IEkvTy0g
TWVtKyBCdXNNYXN0ZXIrIFNwZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBhckVyci0gU3Rl
cHBpbmctIFNFUlItIEZhc3RCMkItIERpc0lOVHgtCglTdGF0dXM6IENhcCsgNjZNSHotIFVERi0g
RmFzdEIyQi0gUGFyRXJyLSBERVZTRUw9ZmFzdCA+VEFib3J0LSA8VEFib3J0LSA8TUFib3J0LSA+
U0VSUi0gPFBFUlItIElOVHgtCglMYXRlbmN5OiAwLCBDYWNoZSBMaW5lIFNpemU6IDY0IGJ5dGVz
CglJbnRlcnJ1cHQ6IHBpbiBBIHJvdXRlZCB0byBJUlEgMjAKCVJlZ2lvbiAwOiBNZW1vcnkgYXQg
ZWYxYmIwMDAgKDY0LWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9NEtdCglDYXBhYmlsaXRp
ZXM6IFs4MF0gUG93ZXIgTWFuYWdlbWVudCB2ZXJzaW9uIDMKCQlGbGFnczogUE1FQ2xrLSBEU0kt
IEQxLSBEMi0gQXV4Q3VycmVudD0wbUEgUE1FKEQwLSxEMS0sRDItLEQzaG90LSxEM2NvbGQtKQoJ
CVN0YXR1czogRDMgTm9Tb2Z0UnN0KyBQTUUtRW5hYmxlLSBEU2VsPTAgRFNjYWxlPTAgUE1FLQoJ
Q2FwYWJpbGl0aWVzOiBbOTBdIFZlbmRvciBTcGVjaWZpYyBJbmZvcm1hdGlvbjogTGVuPTE0IDw/
PgoJS2VybmVsIGRyaXZlciBpbiB1c2U6IGludGVsLWxwc3MKCUtlcm5lbCBtb2R1bGVzOiBpbnRl
bF9scHNzX3BjaQoKMDA6MWUuMiBTaWduYWwgcHJvY2Vzc2luZyBjb250cm9sbGVyOiBJbnRlbCBD
b3Jwb3JhdGlvbiBTdW5yaXNlIFBvaW50LUxQIFNlcmlhbCBJTyBTUEkgQ29udHJvbGxlciAjMCAo
cmV2IDIxKQoJU3Vic3lzdGVtOiBBU1VTVGVLIENvbXB1dGVyIEluYy4gU3VucmlzZSBQb2ludC1M
UCBTZXJpYWwgSU8gU1BJIENvbnRyb2xsZXIKCUNvbnRyb2w6IEkvTy0gTWVtKyBCdXNNYXN0ZXIr
IFNwZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBhckVyci0gU3RlcHBpbmctIFNFUlItIEZh
c3RCMkItIERpc0lOVHgtCglTdGF0dXM6IENhcCsgNjZNSHotIFVERi0gRmFzdEIyQi0gUGFyRXJy
LSBERVZTRUw9ZmFzdCA+VEFib3J0LSA8VEFib3J0LSA8TUFib3J0LSA+U0VSUi0gPFBFUlItIElO
VHgtCglMYXRlbmN5OiAwLCBDYWNoZSBMaW5lIFNpemU6IDY0IGJ5dGVzCglJbnRlcnJ1cHQ6IHBp
biBDIHJvdXRlZCB0byBJUlEgMjIKCVJlZ2lvbiAwOiBNZW1vcnkgYXQgZWYxYmEwMDAgKDY0LWJp
dCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9NEtdCglDYXBhYmlsaXRpZXM6IFs4MF0gUG93ZXIg
TWFuYWdlbWVudCB2ZXJzaW9uIDMKCQlGbGFnczogUE1FQ2xrLSBEU0ktIEQxLSBEMi0gQXV4Q3Vy
cmVudD0wbUEgUE1FKEQwLSxEMS0sRDItLEQzaG90LSxEM2NvbGQtKQoJCVN0YXR1czogRDMgTm9T
b2Z0UnN0KyBQTUUtRW5hYmxlLSBEU2VsPTAgRFNjYWxlPTAgUE1FLQoJQ2FwYWJpbGl0aWVzOiBb
OTBdIFZlbmRvciBTcGVjaWZpYyBJbmZvcm1hdGlvbjogTGVuPTE0IDw/PgoJS2VybmVsIGRyaXZl
ciBpbiB1c2U6IGludGVsLWxwc3MKCUtlcm5lbCBtb2R1bGVzOiBpbnRlbF9scHNzX3BjaQoKMDA6
MWUuNiBTRCBIb3N0IGNvbnRyb2xsZXI6IEludGVsIENvcnBvcmF0aW9uIFN1bnJpc2UgUG9pbnQt
TFAgU2VjdXJlIERpZ2l0YWwgSU8gQ29udHJvbGxlciAocmV2IDIxKSAocHJvZy1pZiAwMSkKCVN1
YnN5c3RlbTogSW50ZWwgQ29ycG9yYXRpb24gU3VucmlzZSBQb2ludC1MUCBTZWN1cmUgRGlnaXRh
bCBJTyBDb250cm9sbGVyCglDb250cm9sOiBJL08tIE1lbSsgQnVzTWFzdGVyKyBTcGVjQ3ljbGUt
IE1lbVdJTlYtIFZHQVNub29wLSBQYXJFcnItIFN0ZXBwaW5nLSBTRVJSLSBGYXN0QjJCLSBEaXNJ
TlR4LQoJU3RhdHVzOiBDYXArIDY2TUh6LSBVREYtIEZhc3RCMkItIFBhckVyci0gREVWU0VMPWZh
c3QgPlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydC0gPlNFUlItIDxQRVJSLSBJTlR4LQoJTGF0ZW5j
eTogMCwgQ2FjaGUgTGluZSBTaXplOiA2NCBieXRlcwoJSW50ZXJydXB0OiBwaW4gRCByb3V0ZWQg
dG8gSVJRIDIzCglSZWdpb24gMDogTWVtb3J5IGF0IGVmMWI5MDAwICg2NC1iaXQsIG5vbi1wcmVm
ZXRjaGFibGUpIFtzaXplPTRLXQoJQ2FwYWJpbGl0aWVzOiBbODBdIFBvd2VyIE1hbmFnZW1lbnQg
dmVyc2lvbiAzCgkJRmxhZ3M6IFBNRUNsay0gRFNJLSBEMS0gRDItIEF1eEN1cnJlbnQ9MG1BIFBN
RShEMC0sRDEtLEQyLSxEM2hvdC0sRDNjb2xkLSkKCQlTdGF0dXM6IEQwIE5vU29mdFJzdCsgUE1F
LUVuYWJsZS0gRFNlbD0wIERTY2FsZT0wIFBNRS0KCUNhcGFiaWxpdGllczogWzkwXSBWZW5kb3Ig
U3BlY2lmaWMgSW5mb3JtYXRpb246IExlbj0xNCA8Pz4KCUtlcm5lbCBkcml2ZXIgaW4gdXNlOiBz
ZGhjaS1wY2kKCUtlcm5lbCBtb2R1bGVzOiBzZGhjaV9wY2kKCjAwOjFmLjAgSVNBIGJyaWRnZTog
SW50ZWwgQ29ycG9yYXRpb24gU3VucmlzZSBQb2ludCBMUEMgQ29udHJvbGxlci9lU1BJIENvbnRy
b2xsZXIgKHJldiAyMSkKCVN1YnN5c3RlbTogQVNVU1RlSyBDb21wdXRlciBJbmMuIFN1bnJpc2Ug
UG9pbnQgTFBDIENvbnRyb2xsZXIvZVNQSSBDb250cm9sbGVyCglDb250cm9sOiBJL08rIE1lbSsg
QnVzTWFzdGVyKyBTcGVjQ3ljbGUtIE1lbVdJTlYtIFZHQVNub29wLSBQYXJFcnItIFN0ZXBwaW5n
LSBTRVJSLSBGYXN0QjJCLSBEaXNJTlR4LQoJU3RhdHVzOiBDYXAtIDY2TUh6LSBVREYtIEZhc3RC
MkItIFBhckVyci0gREVWU0VMPW1lZGl1bSA+VEFib3J0LSA8VEFib3J0LSA8TUFib3J0LSA+U0VS
Ui0gPFBFUlItIElOVHgtCglMYXRlbmN5OiAwCgowMDoxZi4yIE1lbW9yeSBjb250cm9sbGVyOiBJ
bnRlbCBDb3Jwb3JhdGlvbiBTdW5yaXNlIFBvaW50LUxQIFBNQyAocmV2IDIxKQoJU3Vic3lzdGVt
OiBBU1VTVGVLIENvbXB1dGVyIEluYy4gU3VucmlzZSBQb2ludC1MUCBQTUMKCUNvbnRyb2w6IEkv
Ty0gTWVtLSBCdXNNYXN0ZXItIFNwZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBhckVyci0g
U3RlcHBpbmctIFNFUlItIEZhc3RCMkItIERpc0lOVHgtCglTdGF0dXM6IENhcC0gNjZNSHotIFVE
Ri0gRmFzdEIyQi0gUGFyRXJyLSBERVZTRUw9ZmFzdCA+VEFib3J0LSA8VEFib3J0LSA8TUFib3J0
LSA+U0VSUi0gPFBFUlItIElOVHgtCglSZWdpb24gMDogTWVtb3J5IGF0IGVmMWI0MDAwICgzMi1i
aXQsIG5vbi1wcmVmZXRjaGFibGUpIFtkaXNhYmxlZF0gW3NpemU9MTZLXQoKMDA6MWYuMyBBdWRp
byBkZXZpY2U6IEludGVsIENvcnBvcmF0aW9uIFN1bnJpc2UgUG9pbnQtTFAgSEQgQXVkaW8gKHJl
diAyMSkKCVN1YnN5c3RlbTogQVNVU1RlSyBDb21wdXRlciBJbmMuIFN1bnJpc2UgUG9pbnQtTFAg
SEQgQXVkaW8KCUNvbnRyb2w6IEkvTy0gTWVtKyBCdXNNYXN0ZXIrIFNwZWNDeWNsZS0gTWVtV0lO
Vi0gVkdBU25vb3AtIFBhckVyci0gU3RlcHBpbmctIFNFUlItIEZhc3RCMkItIERpc0lOVHgrCglT
dGF0dXM6IENhcCsgNjZNSHotIFVERi0gRmFzdEIyQi0gUGFyRXJyLSBERVZTRUw9ZmFzdCA+VEFi
b3J0LSA8VEFib3J0LSA8TUFib3J0LSA+U0VSUi0gPFBFUlItIElOVHgtCglMYXRlbmN5OiAzMiwg
Q2FjaGUgTGluZSBTaXplOiA2NCBieXRlcwoJSW50ZXJydXB0OiBwaW4gQSByb3V0ZWQgdG8gSVJR
IDEyOQoJUmVnaW9uIDA6IE1lbW9yeSBhdCBlZjFiMDAwMCAoNjQtYml0LCBub24tcHJlZmV0Y2hh
YmxlKSBbc2l6ZT0xNktdCglSZWdpb24gNDogTWVtb3J5IGF0IGVmMTgwMDAwICg2NC1iaXQsIG5v
bi1wcmVmZXRjaGFibGUpIFtzaXplPTY0S10KCUNhcGFiaWxpdGllczogWzUwXSBQb3dlciBNYW5h
Z2VtZW50IHZlcnNpb24gMwoJCUZsYWdzOiBQTUVDbGstIERTSS0gRDEtIEQyLSBBdXhDdXJyZW50
PTU1bUEgUE1FKEQwLSxEMS0sRDItLEQzaG90KyxEM2NvbGQrKQoJCVN0YXR1czogRDAgTm9Tb2Z0
UnN0KyBQTUUtRW5hYmxlLSBEU2VsPTAgRFNjYWxlPTAgUE1FLQoJQ2FwYWJpbGl0aWVzOiBbNjBd
IE1TSTogRW5hYmxlKyBDb3VudD0xLzEgTWFza2FibGUtIDY0Yml0KwoJCUFkZHJlc3M6IDAwMDAw
MDAwZmVlMDAzNzggIERhdGE6IDAwMDAKCUtlcm5lbCBkcml2ZXIgaW4gdXNlOiBzbmRfaGRhX2lu
dGVsCglLZXJuZWwgbW9kdWxlczogc25kX2hkYV9pbnRlbCwgc25kX3NvY19za2wKCjAwOjFmLjQg
U01CdXM6IEludGVsIENvcnBvcmF0aW9uIFN1bnJpc2UgUG9pbnQtTFAgU01CdXMgKHJldiAyMSkK
CVN1YnN5c3RlbTogQVNVU1RlSyBDb21wdXRlciBJbmMuIFN1bnJpc2UgUG9pbnQtTFAgU01CdXMK
CUNvbnRyb2w6IEkvTysgTWVtKyBCdXNNYXN0ZXItIFNwZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25v
b3AtIFBhckVyci0gU3RlcHBpbmctIFNFUlItIEZhc3RCMkItIERpc0lOVHgtCglTdGF0dXM6IENh
cC0gNjZNSHotIFVERi0gRmFzdEIyQisgUGFyRXJyLSBERVZTRUw9bWVkaXVtID5UQWJvcnQtIDxU
QWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8UEVSUi0gSU5UeC0KCUludGVycnVwdDogcGluIEEgcm91
dGVkIHRvIElSUSAxNgoJUmVnaW9uIDA6IE1lbW9yeSBhdCBlZjFiODAwMCAoNjQtYml0LCBub24t
cHJlZmV0Y2hhYmxlKSBbc2l6ZT0yNTZdCglSZWdpb24gNDogSS9PIHBvcnRzIGF0IGYwNDAgW3Np
emU9MzJdCglLZXJuZWwgZHJpdmVyIGluIHVzZTogaTgwMV9zbWJ1cwoJS2VybmVsIG1vZHVsZXM6
IGkyY19pODAxCgowMjowMC4wIE5ldHdvcmsgY29udHJvbGxlcjogUXVhbGNvbW0gQXRoZXJvcyBR
Q0E5NTY1IC8gQVI5NTY1IFdpcmVsZXNzIE5ldHdvcmsgQWRhcHRlciAocmV2IDAxKQoJU3Vic3lz
dGVtOiBMaXRlLU9uIENvbW11bmljYXRpb25zIEluYyBRQ0E5NTY1IC8gQVI5NTY1IFdpcmVsZXNz
IE5ldHdvcmsgQWRhcHRlcgoJQ29udHJvbDogSS9PLSBNZW0rIEJ1c01hc3RlcisgU3BlY0N5Y2xl
LSBNZW1XSU5WLSBWR0FTbm9vcC0gUGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFzdEIyQi0gRGlz
SU5UeC0KCVN0YXR1czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJCLSBQYXJFcnItIERFVlNFTD1m
YXN0ID5UQWJvcnQtIDxUQWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8UEVSUi0gSU5UeC0KCUxhdGVu
Y3k6IDAsIENhY2hlIExpbmUgU2l6ZTogNjQgYnl0ZXMKCUludGVycnVwdDogcGluIEEgcm91dGVk
IHRvIElSUSAxNwoJUmVnaW9uIDA6IE1lbW9yeSBhdCBlZjAwMDAwMCAoNjQtYml0LCBub24tcHJl
ZmV0Y2hhYmxlKSBbc2l6ZT01MTJLXQoJRXhwYW5zaW9uIFJPTSBhdCBlZjA4MDAwMCBbZGlzYWJs
ZWRdIFtzaXplPTY0S10KCUNhcGFiaWxpdGllczogWzQwXSBQb3dlciBNYW5hZ2VtZW50IHZlcnNp
b24gMgoJCUZsYWdzOiBQTUVDbGstIERTSS0gRDErIEQyKyBBdXhDdXJyZW50PTM3NW1BIFBNRShE
MCssRDErLEQyKyxEM2hvdCssRDNjb2xkKykKCQlTdGF0dXM6IEQwIE5vU29mdFJzdC0gUE1FLUVu
YWJsZS0gRFNlbD0wIERTY2FsZT0wIFBNRS0KCUNhcGFiaWxpdGllczogWzUwXSBNU0k6IEVuYWJs
ZS0gQ291bnQ9MS80IE1hc2thYmxlKyA2NGJpdCsKCQlBZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDAw
ICBEYXRhOiAwMDAwCgkJTWFza2luZzogMDAwMDAwMDAgIFBlbmRpbmc6IDAwMDAwMDAwCglDYXBh
YmlsaXRpZXM6IFs3MF0gRXhwcmVzcyAodjIpIEVuZHBvaW50LCBNU0kgMDAKCQlEZXZDYXA6CU1h
eFBheWxvYWQgMTI4IGJ5dGVzLCBQaGFudEZ1bmMgMCwgTGF0ZW5jeSBMMHMgdW5saW1pdGVkLCBM
MSA8NjR1cwoJCQlFeHRUYWctIEF0dG5CdG4tIEF0dG5JbmQtIFB3ckluZC0gUkJFKyBGTFJlc2V0
LSBTbG90UG93ZXJMaW1pdCAxMC4wMDBXCgkJRGV2Q3RsOglSZXBvcnQgZXJyb3JzOiBDb3JyZWN0
YWJsZS0gTm9uLUZhdGFsLSBGYXRhbC0gVW5zdXBwb3J0ZWQtCgkJCVJseGRPcmQrIEV4dFRhZy0g
UGhhbnRGdW5jLSBBdXhQd3ItIE5vU25vb3AtCgkJCU1heFBheWxvYWQgMTI4IGJ5dGVzLCBNYXhS
ZWFkUmVxIDUxMiBieXRlcwoJCURldlN0YToJQ29yckVyci0gVW5jb3JyRXJyLSBGYXRhbEVyci0g
VW5zdXBwUmVxLSBBdXhQd3IrIFRyYW5zUGVuZC0KCQlMbmtDYXA6CVBvcnQgIzAsIFNwZWVkIDIu
NUdUL3MsIFdpZHRoIHgxLCBBU1BNIEwwcyBMMSwgRXhpdCBMYXRlbmN5IEwwcyA8NHVzLCBMMSA8
NjR1cwoJCQlDbG9ja1BNLSBTdXJwcmlzZS0gTExBY3RSZXAtIEJ3Tm90LSBBU1BNT3B0Q29tcC0K
CQlMbmtDdGw6CUFTUE0gTDBzIEwxIEVuYWJsZWQ7IFJDQiA2NCBieXRlcyBEaXNhYmxlZC0gQ29t
bUNsaysKCQkJRXh0U3luY2gtIENsb2NrUE0tIEF1dFdpZERpcy0gQldJbnQtIEF1dEJXSW50LQoJ
CUxua1N0YToJU3BlZWQgMi41R1QvcywgV2lkdGggeDEsIFRyRXJyLSBUcmFpbi0gU2xvdENsaysg
RExBY3RpdmUtIEJXTWdtdC0gQUJXTWdtdC0KCQlEZXZDYXAyOiBDb21wbGV0aW9uIFRpbWVvdXQ6
IE5vdCBTdXBwb3J0ZWQsIFRpbWVvdXREaXMrLCBMVFItLCBPQkZGIE5vdCBTdXBwb3J0ZWQKCQlE
ZXZDdGwyOiBDb21wbGV0aW9uIFRpbWVvdXQ6IDUwdXMgdG8gNTBtcywgVGltZW91dERpcy0sIExU
Ui0sIE9CRkYgRGlzYWJsZWQKCQlMbmtDdGwyOiBUYXJnZXQgTGluayBTcGVlZDogMi41R1Qvcywg
RW50ZXJDb21wbGlhbmNlLSBTcGVlZERpcy0KCQkJIFRyYW5zbWl0IE1hcmdpbjogTm9ybWFsIE9w
ZXJhdGluZyBSYW5nZSwgRW50ZXJNb2RpZmllZENvbXBsaWFuY2UtIENvbXBsaWFuY2VTT1MtCgkJ
CSBDb21wbGlhbmNlIERlLWVtcGhhc2lzOiAtNmRCCgkJTG5rU3RhMjogQ3VycmVudCBEZS1lbXBo
YXNpcyBMZXZlbDogLTZkQiwgRXF1YWxpemF0aW9uQ29tcGxldGUtLCBFcXVhbGl6YXRpb25QaGFz
ZTEtCgkJCSBFcXVhbGl6YXRpb25QaGFzZTItLCBFcXVhbGl6YXRpb25QaGFzZTMtLCBMaW5rRXF1
YWxpemF0aW9uUmVxdWVzdC0KCUNhcGFiaWxpdGllczogWzEwMCB2MV0gQWR2YW5jZWQgRXJyb3Ig
UmVwb3J0aW5nCgkJVUVTdGE6CURMUC0gU0RFUy0gVExQLSBGQ1AtIENtcGx0VE8tIENtcGx0QWJy
dC0gVW54Q21wbHQtIFJ4T0YtIE1hbGZUTFAtIEVDUkMtIFVuc3VwUmVxLSBBQ1NWaW9sLQoJCVVF
TXNrOglETFAtIFNERVMtIFRMUC0gRkNQLSBDbXBsdFRPLSBDbXBsdEFicnQtIFVueENtcGx0LSBS
eE9GLSBNYWxmVExQLSBFQ1JDLSBVbnN1cFJlcS0gQUNTVmlvbC0KCQlVRVN2cnQ6CURMUCsgU0RF
UysgVExQLSBGQ1ArIENtcGx0VE8tIENtcGx0QWJydC0gVW54Q21wbHQtIFJ4T0YrIE1hbGZUTFAr
IEVDUkMtIFVuc3VwUmVxLSBBQ1NWaW9sLQoJCUNFU3RhOglSeEVyci0gQmFkVExQLSBCYWRETExQ
LSBSb2xsb3Zlci0gVGltZW91dC0gTm9uRmF0YWxFcnItCgkJQ0VNc2s6CVJ4RXJyLSBCYWRUTFAt
IEJhZERMTFAtIFJvbGxvdmVyLSBUaW1lb3V0LSBOb25GYXRhbEVycisKCQlBRVJDYXA6CUZpcnN0
IEVycm9yIFBvaW50ZXI6IDAwLCBHZW5DYXAtIENHZW5Fbi0gQ2hrQ2FwLSBDaGtFbi0KCUNhcGFi
aWxpdGllczogWzE0MCB2MV0gVmlydHVhbCBDaGFubmVsCgkJQ2FwczoJTFBFVkM9MCBSZWZDbGs9
MTAwbnMgUEFURW50cnlCaXRzPTEKCQlBcmI6CUZpeGVkLSBXUlIzMi0gV1JSNjQtIFdSUjEyOC0K
CQlDdHJsOglBcmJTZWxlY3Q9Rml4ZWQKCQlTdGF0dXM6CUluUHJvZ3Jlc3MtCgkJVkMwOglDYXBz
OglQQVRPZmZzZXQ9MDAgTWF4VGltZVNsb3RzPTEgUmVqU25vb3BUcmFucy0KCQkJQXJiOglGaXhl
ZC0gV1JSMzItIFdSUjY0LSBXUlIxMjgtIFRXUlIxMjgtIFdSUjI1Ni0KCQkJQ3RybDoJRW5hYmxl
KyBJRD0wIEFyYlNlbGVjdD1GaXhlZCBUQy9WQz1mZgoJCQlTdGF0dXM6CU5lZ29QZW5kaW5nLSBJ
blByb2dyZXNzLQoJQ2FwYWJpbGl0aWVzOiBbMTYwIHYxXSBEZXZpY2UgU2VyaWFsIE51bWJlciAw
MC0wMC0wMC0wMC0wMC0wMC0wMC0wMAoJS2VybmVsIGRyaXZlciBpbiB1c2U6IGF0aDlrCglLZXJu
ZWwgbW9kdWxlczogYXRoOWsKCg==
--000000000000c306a605968a694e--
