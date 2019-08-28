Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 417BCA08D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 19:45:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JY6Q00wzzDrFY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 03:45:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=abdhalee@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JY4K0Mk5zDrFY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 03:43:12 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7SHbmDR042508; Wed, 28 Aug 2019 13:43:04 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2unuxk5ap3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2019 13:43:03 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7SHdaVT058445;
 Wed, 28 Aug 2019 13:43:03 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2unuxk5anh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2019 13:43:03 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7SHdUP2030957;
 Wed, 28 Aug 2019 17:43:02 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 2ujvv7799e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2019 17:43:02 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7SHh1iW48103852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Aug 2019 17:43:01 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9710112063;
 Wed, 28 Aug 2019 17:43:01 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2DBF112062;
 Wed, 28 Aug 2019 17:42:56 +0000 (GMT)
Received: from [9.85.111.211] (unknown [9.85.111.211])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 28 Aug 2019 17:42:56 +0000 (GMT)
Message-ID: <1567014175.5082.6.camel@abdul>
Subject: Re: [linux-next][BUG][driver/scsi/lpfc][c00f62e6] Kernel panics
 when booting next kernel on my Power 9 box
From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
To: James Smart <jsmart2021@gmail.com>
Date: Wed, 28 Aug 2019 23:12:55 +0530
In-Reply-To: <601365f6-c753-96f6-5d61-481f54d95440@gmail.com>
References: <1566968536.23670.9.camel@abdul>
 <601365f6-c753-96f6-5d61-481f54d95440@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-28_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908280172
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, dick.kennedy@broadcom.com, "Martin
 K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 manvanth <manvanth@linux.vnet.ibm.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>,
 dougmill <dougmill@linux.vnet.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-08-28 at 08:22 -0700, James Smart wrote:
> On 8/27/2019 10:02 PM, Abdul Haleem wrote:
> > Greetings,
> > 
> > linux-next kernel 5.3.0-rc1 failed to boot with kernel Oops on Power 9
> > box
> > 
> > I see a recent changes to lpfc code was from commit
> > 10541f03 scsi: lpfc: Update lpfc version to 12.4.0.0
> > 
> > Recent boot logs:
> > 
> > [..snip..]
> 
> see  https://www.spinics.net/lists/linux-scsi/msg133343.html
> 
> It hasn't been tested yet, but appears to be the issue.

Ah, commit c00f62e6 (scsi: lpfc: Merge per-protocol...) is the bad one
and Yes the patch fixes it, System booted fine with below code change

--- a/drivers/scsi/lpfc/lpfc_sli.c    2019-08-23 13:55:18.253546775 -0700
+++ b/drivers/scsi/lpfc_sli.c    2019-08-27 17:04:51.095330056 -0700
@@ -5553,7 +5553,7 @@ lpfc_sli4_arm_cqeq_intr(struct lpfc_hba
         for (qidx = 0; qidx < phba->cfg_hdw_queue; qidx++) {
             qp = &sli4_hba->hdwq[qidx];
             /* ARM the corresponding CQ */
-            sli4_hba->sli4_write_cq_db(phba, qp[qidx].io_cq, 0,
+            sli4_hba->sli4_write_cq_db(phba, qp->io_cq, 0,
                         LPFC_QUEUE_REARM);


Tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



