Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 716371F0BA4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jun 2020 16:11:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49fywN69kGzDqT2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 00:11:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49fysr1jcTzDqT3
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 00:08:46 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 057E33wQ153989; Sun, 7 Jun 2020 10:08:38 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31grrg8uyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Jun 2020 10:08:38 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 057E4C1c007628;
 Sun, 7 Jun 2020 14:08:38 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 31g2s926vd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Jun 2020 14:08:38 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 057E7aNh40698288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 7 Jun 2020 14:07:36 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C31E26A04D;
 Sun,  7 Jun 2020 14:07:36 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD5CF6A047;
 Sun,  7 Jun 2020 14:07:33 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.79.176.214])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun,  7 Jun 2020 14:07:33 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, jroedel@suse.de
Subject: Re: Boot issue with the latest Git kernel
In-Reply-To: <7bf97562-3c6d-de73-6dbd-ccca275edc7b@xenosoft.de>
References: <f7f1b233-6101-2316-7996-4654586b7d24@csgroup.eu>
 <067BBAB3-19B6-42C6-AA9F-B9F14314255C@xenosoft.de>
 <014e1268-dcce-61a3-8bcd-a06c43e0dfaf@csgroup.eu>
 <7bf97562-3c6d-de73-6dbd-ccca275edc7b@xenosoft.de>
Date: Sun, 07 Jun 2020 19:37:30 +0530
Message-ID: <87tuznq89p.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-07_03:2020-06-04,
 2020-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 cotscore=-2147483648 malwarescore=0 mlxlogscore=941 bulkscore=0
 spamscore=0 mlxscore=0 adultscore=0 clxscore=1011 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006070109
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
Cc: Darren Stevens <darren@stevens-zone.net>, Christoph Hellwig <hch@lst.de>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian Zigotzky <chzigotzky@xenosoft.de> writes:

> On 04 June 2020 at 7:15 pm, Christophe Leroy wrote:
>> Yes today's linux-next boots on my powerpc 8xx board.
>>
>> Christophe
> Hello Christophe,
>
> Thanks for testing.
>
> I was able to perform a 'git bisect' [1] and identified the bad commit. 
> [2] I reverted this commit and after that the kernel boots and works 
> without any problems.
>
> Could you please check this commit?
>
> Thanks,
> Christian
>
>
> [1] https://forum.hyperion-entertainment.com/viewtopic.php?p=50772#p50772
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2ba3e6947aed9bb9575eb1603c0ac6e39185d32a

This was also reported here.

https://lore.kernel.org/linuxppc-dev/1591181457.9020.13.camel@abdul

-aneesh
