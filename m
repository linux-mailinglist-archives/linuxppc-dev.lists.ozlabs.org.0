Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD09A291A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 23:37:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KGCx3sdTzDrBq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 07:37:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ukrishn@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KDsP5kK6zDrgj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 06:36:06 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7TKWCRR118234; Thu, 29 Aug 2019 16:35:56 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2upkyx3xrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2019 16:35:51 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7TKVVr3025023;
 Thu, 29 Aug 2019 20:35:50 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2umpctursu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2019 20:35:50 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7TKZmWg19988896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 20:35:48 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B9156E04C;
 Thu, 29 Aug 2019 20:35:48 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 735E96E054;
 Thu, 29 Aug 2019 20:35:47 +0000 (GMT)
Received: from [9.24.4.105] (unknown [9.24.4.105])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 29 Aug 2019 20:35:47 +0000 (GMT)
Subject: Re: [PATCH 1/3] scsi: cxlflash: Fix fallthrough warnings.
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Content-Type: text/html;
	charset=us-ascii
X-Apple-Auto-Saved: 1
X-Apple-Mail-Plain-Text-Draft: yes
From: Uma Krishnan <ukrishn@linux.ibm.com>
X-Apple-Mail-Remote-Attachments: YES
X-Apple-Base-Url: x-msg://6/
In-Reply-To: <279d33f05007e9f3e3fb4e6ea19634b2608ffbd3.1567081143.git.msuchanek@suse.de>
X-Apple-Windows-Friendly: 1
Date: Thu, 29 Aug 2019 15:34:08 -0500
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <21A3BB0F-98DB-4D64-AE93-9B8A8B6193B3@linux.ibm.com>
References: <cover.1567081143.git.msuchanek@suse.de>
 <279d33f05007e9f3e3fb4e6ea19634b2608ffbd3.1567081143.git.msuchanek@suse.de>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Michal Suchanek <msuchanek@suse.de>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-29_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=5 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908290206
X-Mailman-Approved-At: Fri, 30 Aug 2019 07:29:31 +1000
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
Cc: linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org,
 "Manoj N. Kumar" <manoj@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, "Matthew R. Ochs" <mrochs@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"ApplePlainTextBody"><div class=3D"ApplePlainTextBody">Below =
commit queued up for 5.4 includes these changes.<br><br>commit =
657bd277c162580674ddb86a90c4aeb62639bff5<br>Author: Gustavo A. R. Silva =
&lt;gustavo@embeddedor.com&gt;<br>Date: &nbsp;&nbsp;Sun Jul 28 19:21:19 =
2019 -0500<br><br>Thanks,<br>Uma Krishnan<br><br><blockquote =
type=3D"cite">On Aug 29, 2019, at 7:32 AM, Michal Suchanek =
&lt;msuchanek@suse.de&gt; wrote:<br><br>Add fallthrough comments where =
missing.<br><br>Signed-off-by: Michal Suchanek =
&lt;msuchanek@suse.de&gt;<br>---<br>drivers/scsi/cxlflash/main.c | 8 =
++++++++<br>1 file changed, 8 insertions(+)<br><br>diff --git =
a/drivers/scsi/cxlflash/main.c b/drivers/scsi/cxlflash/main.c<br>index =
b1f4724efde2..f402fa9a7bec 100644<br>--- =
a/drivers/scsi/cxlflash/main.c<br>+++ =
b/drivers/scsi/cxlflash/main.c<br>@@ -753,10 +753,13 @@ static void =
term_intr(struct cxlflash_cfg *cfg, enum undo_level level,<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>/* =
SISL_MSI_ASYNC_ERROR is setup only for the primary HWQ */<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if (index =
=3D=3D PRIMARY_HWQ)<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>cfg-&gt;ops-&gt;unmap_afu_irq(hwq-&gt;ctx_cookie, 3, =
hwq);<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>/* fall through */<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>case UNMAP_TWO:<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cfg-&gt;ops-&gt;unmap_afu_irq(hwq-&gt;ctx_cookie, 2, =
hwq);<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>/* fall through */<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>case UNMAP_ONE:<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cfg-&gt;ops-&gt;unmap_afu_irq(hwq-&gt;ctx_cookie, 1, =
hwq);<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>/* fall through */<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>case FREE_IRQ:<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cfg-&gt;ops-&gt;free_afu_irqs(hwq-&gt;ctx_cookie);<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>/* fall =
through */<br>@@ -973,14 +976,18 @@ static void cxlflash_remove(struct =
pci_dev *pdev)<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>switch (cfg-&gt;init_state) =
{<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>case INIT_STATE_CDEV:<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>cxlflash_release_chrdev(cfg);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/* fall through */<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>case =
INIT_STATE_SCSI:<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>cxlflash_term_local_luns(cfg);<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>scsi_remove_host(cfg-&gt;host);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/* fall through */<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>case =
INIT_STATE_AFU:<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>term_afu(cfg);<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>/* fall =
through */<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>case INIT_STATE_PCI:<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>cfg-&gt;ops-&gt;destroy_afu(cfg-&gt;afu_cookie);<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>pci_disable_device(pdev);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/* fall through */<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>case =
INIT_STATE_NONE:<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>free_mem(cfg);<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>scsi_host_put(cfg-&gt;host);<br>@@ -3017,6 +3024,7 @@ static =
ssize_t num_hwqs_store(struct device *dev,<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>wait_event(cfg-&gt;reset_waitq, cfg-&gt;state !=3D =
STATE_RESET);<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if (cfg-&gt;state =3D=3D STATE_NORMAL)<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>goto =
retry;<br>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>/* fall through */<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>default:<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>/* =
Ideally should not happen */<br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>dev_err(dev, "%s: Device is not =
ready, state=3D%d\n",<br>-- =
<br>2.12.3<br><br></blockquote><br></div></body></html>=
