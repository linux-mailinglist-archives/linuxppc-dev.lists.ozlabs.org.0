Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E20B209CC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 12:24:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sx2P212KzDqpH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 20:24:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sx0T6NDNzDqj1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 20:22:33 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05PA3Lg3126844; Thu, 25 Jun 2020 06:22:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ux00j2kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 06:22:30 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05PA3otI128603;
 Thu, 25 Jun 2020 06:22:30 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ux00j2k9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 06:22:30 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05PAKD93016763;
 Thu, 25 Jun 2020 10:22:27 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 31uurury5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 10:22:27 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05PAMPR311272542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jun 2020 10:22:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F624A4051;
 Thu, 25 Jun 2020 10:22:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1FDFA4057;
 Thu, 25 Jun 2020 10:22:24 +0000 (GMT)
Received: from oc3871087118.ibm.com (unknown [9.145.24.128])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 25 Jun 2020 10:22:24 +0000 (GMT)
Date: Thu, 25 Jun 2020 12:22:23 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: FSL P5020/P5040: DPAA Ethernet issue with the latest Git kernel
Message-ID: <20200625102223.GA3646@oc3871087118.ibm.com>
References: <56DB95B8-5F42-4837-ABA0-7E580FE04B73@xenosoft.de>
 <20200624082352.GA24934@oc3871087118.ibm.com>
 <004794fb-370c-c165-38e6-a451dc50c294@xenosoft.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <004794fb-370c-c165-38e6-a451dc50c294@xenosoft.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_04:2020-06-25,
 2020-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 cotscore=-2147483648
 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006250062
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
 mad skateman <madskateman@gmail.com>,
 Madalin Bucur <madalin.bucur@oss.nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 25, 2020 at 01:01:52AM +0200, Christian Zigotzky wrote:
[...]
> I compiled a test kernel with the option "CONFIG_TEST_BITMAP=y"
> yesterday. After that Skateman and I booted it and looked for the
> bitmap tests with "dmesg | grep -i bitmap".
> 
> Results:
> 
> FSL P5020:
> 
> [    0.297756] test_bitmap: loaded.
> [    0.298113] test_bitmap: parselist: 14: input is '0-2047:128/256'
> OK, Time: 562
> [    0.298142] test_bitmap: parselist_user: 14: input is
> '0-2047:128/256' OK, Time: 761
> [    0.301553] test_bitmap: all 1663 tests passed
> 
> FSL P5040:
> 
> [    0.296563] test_bitmap: loaded.
> [    0.296894] test_bitmap: parselist: 14: input is '0-2047:128/256'
> OK, Time: 540
> [    0.296920] test_bitmap: parselist_user: 14: input is
> '0-2047:128/256' OK, Time: 680
> [    0.299994] test_bitmap: all 1663 tests passed

Thanks for the test! So it works as expected.

I would suggest to compare what is going on on the device probing
with and without the bisected commit.

There seems to be MAC and PHY mode initialization issue that might
resulted from the bitmap format change.

I put Madalin and Sascha on CC as they have done some works on
this part recently.

Thanks!


> Thanks,
> Christian
