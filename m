Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F26BA32F618
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 23:50:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dsjch05Hmz3dFd
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 09:50:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dzHvRppa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ljp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dzHvRppa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dsb194kdDz3dDk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 04:52:44 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125HYdwG071633; Fri, 5 Mar 2021 12:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=XYvSGSbFD6hEZvF8XWFNRckdOT7+nEhKdDes9UyeorY=;
 b=dzHvRppaA6RoUEC6/PcMcDh90PMzUJNPgkLifgKXe2fqscrrr1yrBfVmBXisk00kiip/
 imSxf8N71jaCP6m1AHALyTnH4wdcHq5+FjUmQmiXvYWMrAShhXaRJwwwGOAf9IwkBJR1
 yJCXMZ99w++8duQDgN8/W5M24ImIh5MA5YEsu2sGMN3kdnaqX3LJ5lHkYzlQgcWMX4wc
 Q2Pof9dPolaQ40ajdSnbFlLc4tPRGxOPla7Q2goH3ztXiTviCI5pHTxNJ72Y6TL6BejS
 PXXWZnKZyMP4SYIRRLGuTeXd/tR9vvbnT+1tLoli2tMm+IcGmVzR/e4zTpLTVtRCDFYG cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373rejhu7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 12:52:33 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 125HaD5K076998;
 Fri, 5 Mar 2021 12:52:33 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373rejhu6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 12:52:33 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 125HZjRK011109;
 Fri, 5 Mar 2021 17:52:32 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 36ydq9s2rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 17:52:30 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 125HqRvv18416122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Mar 2021 17:52:27 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D29FA78066;
 Fri,  5 Mar 2021 17:52:27 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32E247805E;
 Fri,  5 Mar 2021 17:52:26 +0000 (GMT)
Received: from [9.85.170.191] (unknown [9.85.170.191])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  5 Mar 2021 17:52:25 +0000 (GMT)
Subject: Re: [PATCH v1] ibmvnic: remove excessive irqsave
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Content-Type: text/html;
	charset=us-ascii
X-Apple-Auto-Saved: 1
X-Apple-Mail-Remote-Attachments: YES
From: Lijun Pan <ljp@linux.vnet.ibm.com>
X-Apple-Base-Url: x-msg://38/
In-Reply-To: <20210305084839.2405-1-angkery@163.com>
X-Apple-Windows-Friendly: 1
Date: Fri, 5 Mar 2021 11:24:47 -0600
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <AE34A341-950D-47C4-B98A-85BEBA5ABD1F@linux.vnet.ibm.com>
References: <20210305084839.2405-1-angkery@163.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: angkery <angkery@163.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_13:2021-03-03,
 2021-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050090
X-Mailman-Approved-At: Sat, 06 Mar 2021 09:50:03 +1100
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
Cc: Junlin Yang <yangjunlin@yulong.com>, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 Lijun Pan <ljp@linux.ibm.com>, Dany Madden <drt@linux.ibm.com>,
 paulus@samba.org, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><div =
dir=3D"auto" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><div dir=3D"auto" style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; line-break: =
after-white-space;"><meta http-equiv=3D"Content-Type" =
content=3D"text/html; charset=3Dus-ascii"><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D""><br class=3D""><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">On Mar 5, 2021, at 2:48 AM, angkery &lt;<a =
href=3D"mailto:angkery@163.com" class=3D"">angkery@163.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">From: Junlin Yang &lt;<a href=3D"mailto:yangjunlin@yulong.com" =
class=3D"">yangjunlin@yulong.com</a>&gt;<br class=3D""><br =
class=3D"">ibmvnic_remove locks multiple spinlocks while disabling =
interrupts:<br class=3D"">spin_lock_irqsave(&amp;adapter-&gt;state_lock, =
flags);<br class=3D"">spin_lock_irqsave(&amp;adapter-&gt;rwi_lock, =
flags);<br class=3D""><br class=3D"">As reported by coccinelle, the =
second _irqsave() overwrites the value<br class=3D"">saved in 'flags' by =
the first _irqsave(), &nbsp;&nbsp;therefore when the second<br =
class=3D"">_irqrestore() comes,the value in 'flags' is not valid,the =
value saved<br class=3D"">by the first _irqsave() has been lost.<br =
class=3D"">This likely leads to IRQs remaining disabled. So remove the =
second<br class=3D"">_irqsave():<br =
class=3D"">spin_lock_irqsave(&amp;adapter-&gt;state_lock, flags);<br =
class=3D"">spin_lock(&amp;adapter-&gt;rwi_lock);<br class=3D""><br =
class=3D"">Generated by: ./scripts/coccinelle/locks/flags.cocci<br =
class=3D"">./drivers/net/ethernet/ibm/ibmvnic.c:5413:1-18:<br =
class=3D"">ERROR: nested lock+irqsave that reuses flags from line =
5404.<br class=3D""><br class=3D"">Fixes: 4a41c421f367 ("ibmvnic: =
serialize access to work queue on remove")<br class=3D"">Signed-off-by: =
Junlin Yang &lt;<a href=3D"mailto:yangjunlin@yulong.com" =
class=3D"">yangjunlin@yulong.com</a>&gt;<br class=3D"">---<br =
class=3D""></div></div></blockquote><div><br =
class=3D""></div><div>Acked-by: Lijun Pan &lt;<a =
href=3D"mailto:ljp@linux.ibm" =
class=3D"">ljp@linux.ibm</a>.com&gt;</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div class=3D"">Changes in =
v1:<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>a.According to Christophe Leroy's =
explanation, update the commit information.<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>b.Add =
fixes tags.<br class=3D""><br class=3D""> =
drivers/net/ethernet/ibm/ibmvnic.c | 4 ++--<br class=3D""> 1 file =
changed, 2 insertions(+), 2 deletions(-)<br class=3D""><br class=3D"">diff=
 --git a/drivers/net/ethernet/ibm/ibmvnic.c =
b/drivers/net/ethernet/ibm/ibmvnic.c<br class=3D"">index =
2464c8a..a52668d 100644<br class=3D"">--- =
a/drivers/net/ethernet/ibm/ibmvnic.c<br class=3D"">+++ =
b/drivers/net/ethernet/ibm/ibmvnic.c<br class=3D"">@@ -5408,9 +5408,9 @@ =
static void ibmvnic_remove(struct vio_dev *dev)<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * after =
setting state, so __ibmvnic_reset() which is called<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> * from =
the flush_work() below, can make progress.<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> */<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>spin_lock_irqsave(&amp;adapter-&gt;rwi_lock, flags);<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>spin_lock(&amp;adapter-&gt;rwi_lock);<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>adapter-&gt;state =3D VNIC_REMOVING;<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>spin_unlock_irqrestore(&amp;adapter-&gt;rwi_lock, flags);<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>spin_unlock(&amp;adapter-&gt;rwi_lock);<br class=3D""><br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>spin_unlock_irqrestore(&amp;adapter-&gt;state_lock, flags);<br =
class=3D""><br class=3D"">-- <br class=3D"">1.9.1<br class=3D""><br =
class=3D""><br class=3D""></div></div></blockquote></div><br =
class=3D""></div></div></div></body></html>=
