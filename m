Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC12C1C6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 05:00:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cg9K16kMpzDqRd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 15:00:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=I1gPh6Ct; 
 dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cg9HD0j8NzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 14:58:31 +1100 (AEDT)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AO3sfqN090566;
 Tue, 24 Nov 2020 03:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=xZNJjBo/JFIO0hTtFUTzpSzrcGoSQ3D2fS62KAWXM1k=;
 b=I1gPh6Ctr/ve/2mN5GSjM/L6m8ijtgx3g8tgbG5QqU3gAQTOfNZDR8U5iudYnPBLgOxB
 9UYefgV79/m6R65mYc15n9K770enyzhnB1+uyr3PzMDq3ccJ+Kyy2H0L+GRiHGjYiUuC
 veuGM0uOYeMrcir116zAiTuMQo9sDPn108cg1I8JNwgzT0IuYiWkUXMmTivxOR1tdgpX
 eCp2n9QIJmzfJnbANKcZ2QCWC5KU9xLbMnJJZHWYPxE2SYwaAJNv/8iNJ+HOVi6/I/aD
 /aewCL9kV3hpRZl3n91eAPjjkEURiXXxBRuNaJAYKh46ejnt4P/uOOJErlD2Kgt/I0dk fg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 34xrdarmc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 03:58:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AO3toJQ080995;
 Tue, 24 Nov 2020 03:58:24 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 34ycnrw033-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 03:58:24 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AO3wJva006678;
 Tue, 24 Nov 2020 03:58:19 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 23 Nov 2020 19:58:19 -0800
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: james.bottomley@hansenpartnership.com,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH 1/3] ibmvfc: byte swap login_buf.resp values in attribute
 show functions
Date: Mon, 23 Nov 2020 22:58:08 -0500
Message-Id: <160618683551.24173.15203691222166023615.b4-ty@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201117185031.129939-1-tyreld@linux.ibm.com>
References: <20201117185031.129939-1-tyreld@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9814
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240021
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9814
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 impostorscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011240021
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
Cc: brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 17 Nov 2020 12:50:29 -0600, Tyrel Datwyler wrote:

> Both ibmvfc_show_host_(capabilities|npiv_version) functions retrieve
> values from vhost->login_buf.resp buffer. This is the MAD response
> buffer from the VIOS and as such any multi-byte non-string values are in
> big endian format.
> 
> Byte swap these values to host cpu endian format for better human
> readability.

Applied to 5.11/scsi-queue, thanks!

[1/3] scsi: ibmvfc: Byte swap login_buf.resp values in attribute show functions
      https://git.kernel.org/mkp/scsi/c/61bdb4eec8d1
[2/3] scsi: ibmvfc: Remove trailing semicolon
      https://git.kernel.org/mkp/scsi/c/4e0716199ab6
[3/3] scsi: ibmvfc: Use correlation token to tag commands
      https://git.kernel.org/mkp/scsi/c/2aa0102c6688

-- 
Martin K. Petersen	Oracle Linux Engineering
