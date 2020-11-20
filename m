Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C65D82BA0E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 04:12:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CchRg0MDRzDqfZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 14:12:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=QsSQLvHs; 
 dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CchP70X50zDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 14:10:02 +1100 (AEDT)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AK34W9B040618;
 Fri, 20 Nov 2020 03:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=lLCnPs3Y88E1DLLJhdWCcM4wtkjHToEze7h1vCE4g/o=;
 b=QsSQLvHsCFYbv5YnpvgoXRF1Z2M8NKs9UHPgzXS3Gd2Ccv1xrba6YymT+HTcA8e2A9s8
 Zklms5pYC8CS7QuB2KUsqN41tE2NJPBr4o/Ax93rL5WgzpxqrX2JcJ8JlgiY7pCFayNw
 ET58pDC5234x0US4OaSM/D1LzngwId+j9FaRR9e2WDXjPlP/geO/wYIIbYUU3WFp4JL5
 CdFTTy4Va0BneGty9D2uldEzCMe+fKxluPqLopf7TOB9it+BE5PKY8tqWhlzk7aoZW4x
 cyEuiDWkLs8kf1XziawbLFelYREkApsXNABxAMkBmzgb9mtfPHlJVgyYGX1QmJEcyaoV Lg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 34t4rb8sr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Nov 2020 03:09:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AK36eWd160659;
 Fri, 20 Nov 2020 03:09:55 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 34ts60vr31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 03:09:55 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AK39nTv007582;
 Fri, 20 Nov 2020 03:09:49 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Nov 2020 19:09:49 -0800
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH 1/3] ibmvfc: byte swap login_buf.resp values in
 attribute show functions
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1blfsyb9t.fsf@ca-mkp.ca.oracle.com>
References: <20201117185031.129939-1-tyreld@linux.ibm.com>
Date: Thu, 19 Nov 2020 22:09:47 -0500
In-Reply-To: <20201117185031.129939-1-tyreld@linux.ibm.com> (Tyrel Datwyler's
 message of "Tue, 17 Nov 2020 12:50:29 -0600")
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=1 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200022
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1011
 malwarescore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=1 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011200021
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, james.bottomley@hansenpartnership.com,
 brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Tyrel,

> Both ibmvfc_show_host_(capabilities|npiv_version) functions retrieve
> values from vhost->login_buf.resp buffer. This is the MAD response
> buffer from the VIOS and as such any multi-byte non-string values are in
> big endian format.

Applied 1-3 to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
