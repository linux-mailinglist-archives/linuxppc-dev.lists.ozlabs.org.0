Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 516F0207E4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 23:17:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sbZS5B4NzDqWG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 07:17:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sGQJ6r9vzDqMl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 18:24:04 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05O83asr114024; Wed, 24 Jun 2020 04:24:01 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ux0a7x14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 04:24:00 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05O849oX117866;
 Wed, 24 Jun 2020 04:24:00 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ux0a7wym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 04:24:00 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05O8Lrbb022422;
 Wed, 24 Jun 2020 08:23:57 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 31uusgg697-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 08:23:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05O8NtKW61538644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 08:23:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32518AE055;
 Wed, 24 Jun 2020 08:23:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2AC2AE053;
 Wed, 24 Jun 2020 08:23:54 +0000 (GMT)
Received: from oc3871087118.ibm.com (unknown [9.145.59.63])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 24 Jun 2020 08:23:54 +0000 (GMT)
Date: Wed, 24 Jun 2020 10:23:53 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: FSL P5020/P5040: DPAA Ethernet issue with the latest Git kernel
Message-ID: <20200624082352.GA24934@oc3871087118.ibm.com>
References: <56DB95B8-5F42-4837-ABA0-7E580FE04B73@xenosoft.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56DB95B8-5F42-4837-ABA0-7E580FE04B73@xenosoft.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_04:2020-06-24,
 2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 cotscore=-2147483648 clxscore=1011 bulkscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=958
 impostorscore=0 spamscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240059
X-Mailman-Approved-At: Thu, 25 Jun 2020 07:08:15 +1000
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 21, 2020 at 08:40:14AM +0200, Christian Zigotzky wrote:
> Hello Alexander,
> 
> The DPAA Ethernet doesn’t work anymore on our FSL P5020/P5040 boards [1] since the RC1 of kernel 5.8 [2].
> We bisected last days [3] and found the problematic commit [4]. I was able to revert it [5]. After that the DPAA Ethernet works again. I created a patch for reverting the commit [5]. This patch works and I will use it for the RC2.
> Could you please check your commit? [4]

Hi Christian,

Could you please check if the kernel passes CONFIG_TEST_BITMAP self-test?

Thanks!

> Thanks,
> Christian
> 
> [1] http://wiki.amiga.org/index.php?title=X5000
> [2] https://forum.hyperion-entertainment.com/viewtopic.php?p=50885#p50885
> [3] https://forum.hyperion-entertainment.com/viewtopic.php?p=50892#p50892
> [4] lib: fix bitmap_parse() on 64-bit big endian archs: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=81c4f4d924d5d009b5ed785a3e22b18d0f7b831f
> [5] https://forum.hyperion-entertainment.com/viewtopic.php?p=50982#p50982
> 
> 
