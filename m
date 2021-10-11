Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A65E428C1F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 13:36:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HScF20j2fz3c5p
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 22:36:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ld61vjAw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=s1seetee@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ld61vjAw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSYqd21vLz2xXB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 20:47:24 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B8aLBt021061; 
 Mon, 11 Oct 2021 05:47:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : cc : references :
 subject : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=LqBiA461qYHhn2gGdEUxrBuHWvrtFsci9OUC2xMdNJI=;
 b=Ld61vjAwCv27NWI4E3aw4G2j4hGDtgmbJFU+qRUvjbD1KTfXsOPFhrDn4OSiIBfesaKk
 Q2J2gS2PjpqHv2WGrn8qorw4duFOZ1IjpEZvFAeI8rp2rjyEq/X1lBTTy/VptifwxrV9
 TLTOAf+kmQdm+cejWUPTa/F8/8vv0lwgfbMLKbvxLqayE27E8Uhmiak9QY0BLHQNASQt
 nt637hd7QEVHmjwBmU3waOBNUX827kjYfd0F+4zFr92DTKgKJSZVvy/3gHt4lxSiXjqD
 yKJA83iCdAtTDjWqJYNnd/iS4ZShgobDibjYsquraqX1LwWYsabXYOpS/j0clE8kmcyM yQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bmfbfctfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 05:47:18 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19B9lFj7031333;
 Mon, 11 Oct 2021 09:47:17 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 3bk2qa9fyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 09:47:17 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19B9lGeS14745952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 09:47:16 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4536BE053;
 Mon, 11 Oct 2021 09:47:16 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B639BE054;
 Mon, 11 Oct 2021 09:47:15 +0000 (GMT)
Received: from oc2388111647.ibm.com (unknown [9.43.77.175])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 Oct 2021 09:47:15 +0000 (GMT)
To: clg@kaod.org
References: <20211011070203.99726-1-clg@kaod.org>
Subject: Re: [PATCH] powerpc/xive: Discard disabled interrupts in
 get_irqchip_state()
From: seeteena <s1seetee@linux.vnet.ibm.com>
Message-ID: <b4044e62-f589-ef87-a20b-4a552992e616@linux.vnet.ibm.com>
Date: Mon, 11 Oct 2021 15:17:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20211011070203.99726-1-clg@kaod.org>
Content-Type: multipart/mixed; boundary="------------68D8678FDC19BDC8C4715D2F"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u3W9bF3U36lBWBU6E56Grxo5dyXgRTWG
X-Proofpoint-ORIG-GUID: u3W9bF3U36lBWBU6E56Grxo5dyXgRTWG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_03,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=892 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110053
X-Mailman-Approved-At: Mon, 11 Oct 2021 22:35:07 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------68D8678FDC19BDC8C4715D2F
Content-Type: multipart/alternative;
 boundary="------------E28E366144D6CAE4963B1550"


--------------E28E366144D6CAE4963B1550
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: seeteena<s1seetee@linux.vnet.ibm.com>

I have used a KVM guest with a passthrough ethernet adapter and the 
lspci output to identify the adapter.


--------------E28E366144D6CAE4963B1550
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><span style="color: rgb(29, 28, 29); font-family: Slack-Lato,
        appleLogo, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: common-ligatures; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(248, 248,
        248); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">Tested-by:
        seeteena<a class="moz-txt-link-rfc2396E" href="mailto:s1seetee@linux.vnet.ibm.com">&lt;s1seetee@linux.vnet.ibm.com&gt;</a></span></p>
    <p><span style="color: rgb(29, 28, 29); font-family: Slack-Lato,
        appleLogo, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: common-ligatures; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(248, 248,
        248); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;"><span
          style="color: rgb(29, 28, 29); font-family: Slack-Lato,
          appleLogo, sans-serif; font-size: 15px; font-style: normal;
          font-variant-ligatures: common-ligatures; font-variant-caps:
          normal; font-weight: 400; letter-spacing: normal; orphans: 2;
          text-align: left; text-indent: 0px; text-transform: none;
          white-space: normal; widows: 2; word-spacing: 0px;
          -webkit-text-stroke-width: 0px; background-color: rgb(255,
          255, 255); text-decoration-style: initial;
          text-decoration-color: initial; display: inline !important;
          float: none;">I have used a KVM guest with a passthrough
          ethernet adapter and the lspci output to identify the adapter.</span></span></p>
  </body>
</html>

--------------E28E366144D6CAE4963B1550--

--------------68D8678FDC19BDC8C4715D2F
Content-Type: text/plain; charset=UTF-8;
 name="PATCH-powerpc-xive-Discard-disabled-interrupts-in-get_irqchip_state.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename*0="PATCH-powerpc-xive-Discard-disabled-interrupts-in-get_irqchi";
 filename*1="p_state.txt"

RnJvbSBtYm94cmRAeiBUaHUgSmFuICAxIDAwOjAwOjAwIDE5NzAKUmV0dXJuLVBhdGg6IDxT
UlMwPW8zUlk9Tzc9bGlzdHMub3psYWJzLm9yZz1saW51eHBwYy1kZXYtYm91bmNlcytsaW51
eHBwYy1kZXY9YXJjaGl2ZXIua2VybmVsLm9yZ0BrZXJuZWwub3JnPgpYLVNwYW0tQ2hlY2tl
ci1WZXJzaW9uOiBTcGFtQXNzYXNzaW4gMy40LjAgKDIwMTQtMDItMDcpIG9uCglhd3MtdXMt
d2VzdC0yLWtvcmctbGttbC0xLndlYi5jb2RlYXVyb3JhLm9yZwpSZWNlaXZlZDogZnJvbSBt
YWlsLmtlcm5lbC5vcmcgKG1haWwua2VybmVsLm9yZyBbMTk4LjE0NS4yOS45OV0pCglieSBz
bXRwLmxvcmUua2VybmVsLm9yZyAoUG9zdGZpeCkgd2l0aCBFU01UUCBpZCA5NjA1OEM0MzNF
RgoJZm9yIDxsaW51eHBwYy1kZXZAYXJjaGl2ZXIua2VybmVsLm9yZz47IE1vbiwgMTEgT2N0
IDIwMjEgMDc6MTE6MTAgKzAwMDAgKFVUQykKUmVjZWl2ZWQ6IGZyb20gbGlzdHMub3psYWJz
Lm9yZyAobGlzdHMub3psYWJzLm9yZyBbMTEyLjIxMy4zOC4xMTddKQoJKHVzaW5nIFRMU3Yx
LjIgd2l0aCBjaXBoZXIgRUNESEUtUlNBLUFFUzI1Ni1HQ00tU0hBMzg0ICgyNTYvMjU2IGJp
dHMpKQoJKE5vIGNsaWVudCBjZXJ0aWZpY2F0ZSByZXF1ZXN0ZWQpCglieSBtYWlsLmtlcm5l
bC5vcmcgKFBvc3RmaXgpIHdpdGggRVNNVFBTIGlkIEIyMUY3NjBGMjQKCWZvciA8bGludXhw
cGMtZGV2QGFyY2hpdmVyLmtlcm5lbC5vcmc+OyBNb24sIDExIE9jdCAyMDIxIDA3OjExOjA5
ICswMDAwIChVVEMpCkRNQVJDLUZpbHRlcjogT3BlbkRNQVJDIEZpbHRlciB2MS40LjEgbWFp
bC5rZXJuZWwub3JnIEIyMUY3NjBGMjQKQXV0aGVudGljYXRpb24tUmVzdWx0czogbWFpbC5r
ZXJuZWwub3JnOyBkbWFyYz1ub25lIChwPW5vbmUgZGlzPW5vbmUpIGhlYWRlci5mcm9tPWth
b2Qub3JnCkF1dGhlbnRpY2F0aW9uLVJlc3VsdHM6IG1haWwua2VybmVsLm9yZzsgc3BmPXBh
c3Mgc210cC5tYWlsZnJvbT1saXN0cy5vemxhYnMub3JnClJlY2VpdmVkOiBmcm9tIGJvcm9t
aXIub3psYWJzLm9yZyAobG9jYWxob3N0IFtJUHY2Ojo6MV0pCglieSBsaXN0cy5vemxhYnMu
b3JnIChQb3N0Zml4KSB3aXRoIEVTTVRQIGlkIDRIU1ZNSDZ3R2R6M2JqUgoJZm9yIDxsaW51
eHBwYy1kZXZAYXJjaGl2ZXIua2VybmVsLm9yZz47IE1vbiwgMTEgT2N0IDIwMjEgMTg6MTE6
MDcgKzExMDAgKEFFRFQpCkF1dGhlbnRpY2F0aW9uLVJlc3VsdHM6IGxpc3RzLm96bGFicy5v
cmc7IHNwZj1wYXNzIChzZW5kZXIgU1BGIGF1dGhvcml6ZWQpCiBzbXRwLm1haWxmcm9tPWth
b2Qub3JnIChjbGllbnQtaXA9NzkuMTM3LjEyMy4yMjA7CiBoZWxvPXNtdHBvdXQyLm1vNTI5
Lm1haWwtb3V0Lm92aC5uZXQ7IGVudmVsb3BlLWZyb209Y2xnQGthb2Qub3JnOwogcmVjZWl2
ZXI9PFVOS05PV04+KQpYLUdyZXlsaXN0OiBkZWxheWVkIDUwNCBzZWNvbmRzIGJ5IHBvc3Rn
cmV5LTEuMzYgYXQgYm9yb21pcjsKIE1vbiwgMTEgT2N0IDIwMjEgMTg6MTA6NDIgQUVEVApS
ZWNlaXZlZDogZnJvbSBzbXRwb3V0Mi5tbzUyOS5tYWlsLW91dC5vdmgubmV0CiAoc210cG91
dDIubW81MjkubWFpbC1vdXQub3ZoLm5ldCBbNzkuMTM3LjEyMy4yMjBdKQogKHVzaW5nIFRM
U3YxLjIgd2l0aCBjaXBoZXIgRUNESEUtUlNBLUFFUzI1Ni1HQ00tU0hBMzg0ICgyNTYvMjU2
IGJpdHMpKQogKE5vIGNsaWVudCBjZXJ0aWZpY2F0ZSByZXF1ZXN0ZWQpCiBieSBsaXN0cy5v
emxhYnMub3JnIChQb3N0Zml4KSB3aXRoIEVTTVRQUyBpZCA0SFNWTHA0UHdjejJ5UHYKIGZv
ciA8bGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc+OyBNb24sIDExIE9jdCAyMDIxIDE4
OjEwOjQyICsxMTAwIChBRURUKQpSZWNlaXZlZDogZnJvbSBteHBsYW41Lm1haWwub3ZoLm5l
dCAodW5rbm93biBbMTAuMTA5LjE1Ni4yMTZdKQogYnkgbW81MjkubWFpbC1vdXQub3ZoLm5l
dCAoUG9zdGZpeCkgd2l0aCBFU01UUFMgaWQgMEVDMzBDM0JCQjlCOwogTW9uLCAxMSBPY3Qg
MjAyMSAwOTowMjowOSArMDIwMCAoQ0VTVCkKUmVjZWl2ZWQ6IGZyb20ga2FvZC5vcmcgKDM3
LjU5LjE0Mi45NSkgYnkgREFHNEVYMS5teHA1LmxvY2FsICgxNzIuMTYuMi4zMSkKIHdpdGgg
TWljcm9zb2Z0IFNNVFAgU2VydmVyICh2ZXJzaW9uPVRMUzFfMiwKIGNpcGhlcj1UTFNfRUNE
SEVfUlNBX1dJVEhfQUVTXzEyOF9HQ01fU0hBMjU2KSBpZCAxNS4xLjIzMDguMTQ7IE1vbiwg
MTEgT2N0CiAyMDIxIDA5OjAyOjA5ICswMjAwCkF1dGhlbnRpY2F0aW9uLVJlc3VsdHM6IGdh
cm0ub3ZoOyBhdXRoPXBhc3MKIChHQVJNLTk1RzAwMTA3NjJiNWFhLThkYjMtNDY4NS1hZmI2
LTY5ZmViYzk0NmUxOSwKIDA0NERFRERFOEIwRTA1RkQ0OUVFNTJCODRBRkQ5OEJBNTRDRUUy
NjApIHNtdHAuYXV0aD1jbGdAa2FvZC5vcmcKWC1PVmgtQ2xpZW50SXA6IDgyLjY0LjI1MC4x
NzAKRnJvbTogPT9VVEYtOD9xP0M9QzM9QTlkcmljPTIwTGU9MjBHb2F0ZXI/PSA8Y2xnQGth
b2Qub3JnPgpUbzogPGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnPgpTdWJqZWN0OiBb
UEFUQ0hdIHBvd2VycGMveGl2ZTogRGlzY2FyZCBkaXNhYmxlZCBpbnRlcnJ1cHRzIGluCiBn
ZXRfaXJxY2hpcF9zdGF0ZSgpCkRhdGU6IE1vbiwgMTEgT2N0IDIwMjEgMDk6MDI6MDMgKzAy
MDAKTWVzc2FnZS1JRDogPDIwMjExMDExMDcwMjAzLjk5NzI2LTEtY2xnQGthb2Qub3JnPgpY
LU1haWxlcjogZ2l0LXNlbmQtZW1haWwgMi4zMS4xCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRl
bnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD0iVVRGLTgiCkNvbnRlbnQtVHJhbnNmZXIt
RW5jb2Rpbmc6IDhiaXQKWC1PcmlnaW5hdGluZy1JUDogWzM3LjU5LjE0Mi45NV0KWC1DbGll
bnRQcm94aWVkQnk6IERBRzNFWDEubXhwNS5sb2NhbCAoMTcyLjE2LjIuMjEpIFRvIERBRzRF
WDEubXhwNS5sb2NhbAogKDE3Mi4xNi4yLjMxKQpYLU92aC1UcmFjZXItR1VJRDogMWZjZDAy
ODYtMDVjZi00ZTA5LThkN2YtNmNiNWUwMGUyZWRkClgtT3ZoLVRyYWNlci1JZDogMTYyNDQ3
NjUzMzM4MzU2NDc5NjgKWC1WUi1TUEFNU1RBVEU6IE9LClgtVlItU1BBTVNDT1JFOiAwClgt
VlItU1BBTUNBVVNFOiBnZ2dydWdndnVjZnR2Z2h0cmhob3VjZHR1ZGRyZ2VkdnRkZHJ2ZGR0
aGVkZ3VkZHV2ZGN1dGVmdW9kZXRnZ2RvdGVmcm9kZnR2ZmN1cmZocm9oaGZpaGhsdmdlbXVj
ZnFnZ2ZqcGRldmpmZmd2ZWZtdmVmZ25lY3V1ZWdyaWhobG9oaHV0aGVtdWNlaHRkZHRuZWN1
bmVjdWpmZ3VyaGVwaGZmdnVmZmZrZmZvZ2dndGdmaGlzZWh0a2VlcnRkZXJ0ZGVqbmVjdWhm
aHJvaGhtcGVldnJvZ3VyaGhpdGdjdW5mZ3Z1Y2Zpb2hncnRoZ3ZyaGN1b2VndGxoaGdzZWhr
cmdob3VnZHJvaGhyZ2hlcW5lY3VnZ2Z0cmZncnRoaHR2Z2hybmhlcGZlZHZ1ZWR0dmRlaWtl
ZWt1ZWZoa2VkdWplZWpnZmZnZ2ZmaHRlZmdsZWZndmVldmZlZWdoZmR2Z2VkdGxlZXZuZWN1
a2ZocHBlZHRyZGR0cmRkdHJkZHRwZGVmamVkcmhlZWxyZGR1Z2VkdnJkZWxoZWVudWNldmxo
aHVzaGh0dmdocnVmaGlpaWd2cGVkdG5lY3VyZmdycmhncm1oZXBtaGhvdWdndnBlaHNtaGh0
cGhkcW9oaHV0aGRwaGhndmxoaG9wZWhtZ2locGxoZ3JuaGVocmRobXJnaGlsaGRyb2hodmho
ZHJuaGd2dGhkcGloaG52Z2h0cGVkdHJkZHRyZGR0cmRkdHBkaG1yZ2hpbGhoZnJoaG9taGVw
dGdobGdoZXNraGdyb2hndXJkaG9yaGhncGRocnRnaHB0aGh0b2hlcHRnaGxnaGVza2hncm9o
Z3VyZGhvcmhoZwpYLUJlZW5UaGVyZTogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcK
WC1NYWlsbWFuLVZlcnNpb246IDIuMS4yOQpQcmVjZWRlbmNlOiBsaXN0Ckxpc3QtSWQ6IExp
bnV4IG9uIFBvd2VyUEMgRGV2ZWxvcGVycyBNYWlsIExpc3QgPGxpbnV4cHBjLWRldi5saXN0
cy5vemxhYnMub3JnPgpMaXN0LVVuc3Vic2NyaWJlOiA8aHR0cHM6Ly9saXN0cy5vemxhYnMu
b3JnL29wdGlvbnMvbGludXhwcGMtZGV2PiwKIDxtYWlsdG86bGludXhwcGMtZGV2LXJlcXVl
c3RAbGlzdHMub3psYWJzLm9yZz9zdWJqZWN0PXVuc3Vic2NyaWJlPgpMaXN0LUFyY2hpdmU6
IDxodHRwOi8vbGlzdHMub3psYWJzLm9yZy9waXBlcm1haWwvbGludXhwcGMtZGV2Lz4KTGlz
dC1Qb3N0OiA8bWFpbHRvOmxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnPgpMaXN0LUhl
bHA6IDxtYWlsdG86bGludXhwcGMtZGV2LXJlcXVlc3RAbGlzdHMub3psYWJzLm9yZz9zdWJq
ZWN0PWhlbHA+Ckxpc3QtU3Vic2NyaWJlOiA8aHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xp
c3RpbmZvL2xpbnV4cHBjLWRldj4sCiA8bWFpbHRvOmxpbnV4cHBjLWRldi1yZXF1ZXN0QGxp
c3RzLm96bGFicy5vcmc/c3ViamVjdD1zdWJzY3JpYmU+CkNjOiA9P1VURi04P3E/Qz1DMz1B
OWRyaWM9MjBMZT0yMEdvYXRlcj89IDxjbGdAa2FvZC5vcmc+LAogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZwpFcnJvcnMtVG86IGxpbnV4cHBjLWRldi1ib3VuY2VzK2xpbnV4cHBjLWRldj1h
cmNoaXZlci5rZXJuZWwub3JnQGxpc3RzLm96bGFicy5vcmcKU2VuZGVyOiAiTGludXhwcGMt
ZGV2IgogPGxpbnV4cHBjLWRldi1ib3VuY2VzK2xpbnV4cHBjLWRldj1hcmNoaXZlci5rZXJu
ZWwub3JnQGxpc3RzLm96bGFicy5vcmc+CgpXaGVuIGFuIGludGVycnVwdCBpcyBwYXNzZWQg
dGhyb3VnaCwgdGhlIEtWTSBYSVZFIGRldmljZSBjYWxscyB0aGUKc2V0X3ZjcHVfYWZmaW5p
dHkoKSBoYW5kbGVyIHdoaWNoIHJhaXNlcyB0aGUgUCBiaXQgdG8gbWFzayB0aGUKaW50ZXJy
dXB0IGFuZCB0byBjYXRjaCBhbnkgaW4tZmxpZ2h0IGludGVycnVwdHMgd2hpbGUgcm91dGlu
ZyB0aGUKaW50ZXJydXB0IHRvIHRoZSBndWVzdC4KCk9uIHRoZSBndWVzdCBzaWRlLCBkcml2
ZXJzIChsaWtlIHNvbWUgSW50ZWxzKSBjYW4gcmVxdWVzdCBhdCBwcm9iZQp0aW1lIHNvbWUg
TVNJcyBhbmQgY2FsbCBzeW5jaHJvbml6ZV9pcnEoKSB0byBjaGVjayB0aGF0IHRoZXJlIGFy
ZSBubwppbiBmbGlnaHQgaW50ZXJydXB0cy4gVGhpcyB3aWxsIGNhbGwgdGhlIFhJVkUgZ2V0
X2lycWNoaXBfc3RhdGUoKQpoYW5kbGVyIHdoaWNoIHdpbGwgYWx3YXlzIHJldHVybiB0cnVl
IGFzIHRoZSBpbnRlcnJ1cHQgUCBiaXQgaGFzIGJlZW4Kc2V0IG9uIHRoZSBob3N0IHNpZGUg
YW5kIGxvY2sgdGhlIENQVSBpbiBhbiBpbmZpbml0ZSBsb29wLgoKRml4IHRoYXQgYnkgZGlz
Y2FyZGluZyBkaXNhYmxlZCBpbnRlcnJ1cHRzIGluIGdldF9pcnFjaGlwX3N0YXRlKCkuCgpG
aXhlczogZGExNWMwM2IwNDdkICgicG93ZXJwYy94aXZlOiBJbXBsZW1lbnQgZ2V0X2lycWNo
aXBfc3RhdGUgbWV0aG9kIGZvciBYSVZFIHRvIGZpeCBzaHV0ZG93biByYWNlIikKQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcjdjUuNCsKU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBH
b2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCiBhcmNoL3Bvd2VycGMvc3lzZGV2L3hpdmUvY29t
bW9uLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9zeXNkZXYveGl2ZS9jb21tb24u
YyBiL2FyY2gvcG93ZXJwYy9zeXNkZXYveGl2ZS9jb21tb24uYwppbmRleCBjNzMyY2U1YTNl
MWEuLmM1ZDc1YzAyYWQ4YiAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL3N5c2Rldi94aXZl
L2NvbW1vbi5jCisrKyBiL2FyY2gvcG93ZXJwYy9zeXNkZXYveGl2ZS9jb21tb24uYwpAQCAt
OTQ1LDcgKzk0NSw4IEBAIHN0YXRpYyBpbnQgeGl2ZV9nZXRfaXJxY2hpcF9zdGF0ZShzdHJ1
Y3QgaXJxX2RhdGEgKmRhdGEsCiAJCSAqIGludGVycnVwdCB0byBiZSBpbmFjdGl2ZSBpbiB0
aGF0IGNhc2UuCiAJCSAqLwogCQkqc3RhdGUgPSAocHEgIT0gWElWRV9FU0JfSU5WQUxJRCkg
JiYgIXhkLT5zdGFsZV9wICYmCi0JCQkoeGQtPnNhdmVkX3AgfHwgISEocHEgJiBYSVZFX0VT
Ql9WQUxfUCkpOworCQkJKHhkLT5zYXZlZF9wIHx8ICghIShwcSAmIFhJVkVfRVNCX1ZBTF9Q
KSAmJgorCQkJICFpcnFkX2lycV9kaXNhYmxlZChkYXRhKSkpOwogCQlyZXR1cm4gMDsKIAlk
ZWZhdWx0OgogCQlyZXR1cm4gLUVJTlZBTDsKLS0gCjIuMzEuMQoKCg==
--------------68D8678FDC19BDC8C4715D2F--

