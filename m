Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE9828E759
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 21:32:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBMxZ2kZvzDqSx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 06:32:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LyPIFWC4; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBMvg3dTrzDq61
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 06:30:39 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09EJSYBl061274; Wed, 14 Oct 2020 15:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 message-id : reply-to : references : mime-version : content-type :
 in-reply-to : subject; s=pp1;
 bh=dqPI9ss08CvFwEtyDf9xVOAC51gIZkX8tKGhguVx19Q=;
 b=LyPIFWC4c8jUj00uiH+JfiiPU34EjHy3CtmMP3AS8ZKQ6tj4bQEwIVvt91hiDWJlpB0Z
 LcP9ARUy/VKoCVAvvdHazPm/eqm7DGoI1LwqkGoyJnp3W+YGbJyWjsRGypGzeKMFTISe
 MDAW1bSXS6iS0iiNoIWJKrwBXEfhXIEPRcPyXF09sQEUCFwK5gpzt6y+79tZM99nKauW
 sha6bVHws56JkUtZ1b5FbtBxb1MgsDm8ftLYjogrhYpWB7CdQl5s1lTqtQ0/lAcQqQAB
 et6dpjTCz85Iu4V5gUJ/iFyvYOOjbXJsJb4yntqGbUyEIvaJHrx/IdiCjGD3QwJkEdSY Xw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3467h081kq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 15:30:31 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09EJMbAJ009580;
 Wed, 14 Oct 2020 19:30:30 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3434k84fxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 19:30:29 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09EJURJ723331100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Oct 2020 19:30:27 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03F9F5208F;
 Wed, 14 Oct 2020 19:30:27 +0000 (GMT)
Received: from ram-ibm-com.ibm.com (unknown [9.85.191.234])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 911215206D;
 Wed, 14 Oct 2020 19:30:25 +0000 (GMT)
Date: Wed, 14 Oct 2020 12:30:22 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20201014193022.GA3853@ram-ibm-com.ibm.com>
References: <1602487663-7321-1-git-send-email-linuxram@us.ibm.com>
 <20201014063117.GA26161@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014063117.GA26161@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
Subject: RE: [RFC v1 0/2] Plumbing to support multiple secure memory backends.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_11:2020-10-14,
 2020-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011
 spamscore=0 mlxlogscore=737 lowpriorityscore=0 bulkscore=0 mlxscore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010140131
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: bharata@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, farosas@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 14, 2020 at 07:31:17AM +0100, Christoph Hellwig wrote:
> Please don't add an abstraction without a second implementation.
> Once we have the implementation we can consider the tradeoffs.  E.g.
> if expensive indirect function calls are really needed vs simple
> branches.

Ok. Not planning on upstreaming these patches till we have atleast
another backend.

-- 
Ram Pai
