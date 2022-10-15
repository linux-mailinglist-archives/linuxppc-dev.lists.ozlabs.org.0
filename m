Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0636C5FF98E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 11:51:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MqJSR01YZz3bP1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 20:51:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DboseOK3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DboseOK3;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MqJRS1sf0z2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 20:50:59 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29F9hI0V034924;
	Sat, 15 Oct 2022 09:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=XZbZFWRH83SuXGqksN4wtJ1vMJm0f+BF1r5mFK10msw=;
 b=DboseOK3DKwpooCtQ83qrtpg2/Ta9VTEIJVDbgL32/I67ys0CTwCbmi4wVjniRxL8IKY
 VnUUydVWp0zjj/4xFf0W8tiSF+emQ0jcCvfQVXPlxyvSgd3mXlwMkt6d/2kpL+KAVTkw
 nxB4xQ6t+dOGz5T6fkkcoea823WmsAWJAkW3jmsEMi7uRYvtmvYbV1KIMiri3w2RmegP
 tykytUbNHsn0y2qxJJDIS7pMykFGX32bdMAW9oOyOgfsHsBwGWxFu9l/6o1CbTZTRXA+
 S/W+/xGFZ3sHk4Ot366JwX2hkyK/ut/aCS6qo5FvhP7DHzI9tXzFf7HSp4AqMv2gLObz mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k7tfsg4by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Oct 2022 09:50:54 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29F9hpKD035852;
	Sat, 15 Oct 2022 09:50:53 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k7tfsg4b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Oct 2022 09:50:53 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29F9aMxG019277;
	Sat, 15 Oct 2022 09:50:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03fra.de.ibm.com with ESMTP id 3k7mg988ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Oct 2022 09:50:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29F9jvkI47972654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 15 Oct 2022 09:45:57 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27A66A4051;
	Sat, 15 Oct 2022 09:50:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CCE9A404D;
	Sat, 15 Oct 2022 09:50:48 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sat, 15 Oct 2022 09:50:48 +0000 (GMT)
Received: from [9.43.175.236] (unknown [9.43.175.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9D437600E5;
	Sat, 15 Oct 2022 20:50:38 +1100 (AEDT)
Message-ID: <15ac95abdde9a466746a3cb468bde2369c038333.camel@linux.ibm.com>
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
        Christophe Leroy
	 <christophe.leroy@csgroup.eu>
Date: Sat, 15 Oct 2022 20:50:31 +1100
In-Reply-To: <0D40FEF9-D87D-42C4-BC31-EC8AE952C1FB@xenosoft.de>
References: <c91416ef-f450-9111-a0b1-4e04070ac309@csgroup.eu>
	 <0D40FEF9-D87D-42C4-BC31-EC8AE952C1FB@xenosoft.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H8ffbMS-QH0_acoOExZ2M453QN7t8QCC
X-Proofpoint-ORIG-GUID: zdicOOZTglJHjI1MYyimecrldJQ8OpYW
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-15_05,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 mlxlogscore=856 mlxscore=0 clxscore=1015 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210150054
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, npiggin@gmail.com, rmclure@linux.ibm.com, Trevor Dickinson <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-10-13 at 11:42 +0200, Christian Zigotzky wrote:
> Hi Christophe,
> 
> Thanks a lot for your answer. OK, now, I know, that I don’t need to
> test it. After the boot of the latest git kernel, my system was
> extremely damaged. Some config files has a size of several gigabytes
> for example the resolv.conf. I tried to repair this Debian system but
> without any success.
> I copied with dd and Netcat via network another rootfs from another
> computer to the damaged partition.
> I don’t have the time to do it always again and again after a bad
> bisect result.
> I will wait some weeks and try it again.

You're right, I was in a rush, saw a processor that wasn't IBM and
assumed it was 32-bit without thinking too much!


Andrew


> 
> Cheers,
> Christian
> 
> > On 13. Oct 2022, at 09:28, Christophe Leroy <
> > christophe.leroy@csgroup.eu> wrote:
> > 
> > ﻿
> > 
> > > Le 13/10/2022 à 09:03, Christian Zigotzky a écrit :
> > > Hi Andrew,
> > > 
> > > Does this patch also affect 64-bit kernels?
> > > 
> > > We use often 32-bit userlands with 64-bit kernels.
> > 
> > As far as I understand, it was already correct for 32-bit userlands
> > with 
> > 64 bit kernels, aka compat.
> > 
> > The patch applies the same approach for 32 bit kernels, as
> > explained in 
> > the commit message : "Fix this by having 32-bit kernels share those
> > syscall definitions with compat."
> > 
> > Christophe
> > 
> > > 
> > > Cheers,
> > > Christian
> > > 
> > > > > On 12. Oct 2022, at 09:56, Andrew Donnellan <
> > > > > ajd@linux.ibm.com> wrote:
> > > > 
> > > > ﻿On Wed, 2022-10-12 at 08:51 +0200, Christian Zigotzky wrote:
> > > > > Hi All,
> > > > > 
> > > > > I use the Nemo board with a PASemi PA6T CPU and have some
> > > > > issues
> > > > > since the first PowerPC updates for the kernel 6.1.
> > > > > 
> > > > > I successfully compiled the git kernel with the first PowerPC
> > > > > updates
> > > > > two days ago.
> > > > > 
> > > > > Unfortunately this kernel is really dangerous. Many things
> > > > > for
> > > > > example Network Manager and LightDM don't work anymore and
> > > > > produced
> > > > > several gigabyte of config files till the partition has been
> > > > > filled.
> > > > > 
> > > > > I deleted some files like the resolv.conf that had a size
> > > > > over 200
> > > > > GB!
> > > > > 
> > > > > Unfortunately, MintPPC was still damaged. For example LightDM
> > > > > doesn't
> > > > > work anymore and the MATE desktop doesn't display any icons
> > > > > anymore
> > > > > because Caja wasn't able to reserve memory anymore.
> > > > > 
> > > > > In this case, bisecting isn't an option and I have to wait
> > > > > some
> > > > > weeks. It is really difficult to find the issue if the
> > > > > userland will
> > > > > damaged again and again.
> > > > 
> > > > Could you try with
> > > > https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20221012035335.866440-1-npiggin@gmail.com/
> > > > to see if your issues are related to that?
> > > > 
> > > > Andrew
> > > > 
> > > > -- 
> > > > Andrew Donnellan    OzLabs, ADL Canberra
> > > > ajd@linux.ibm.com   IBM Australia Limited
> > > > 
> 

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

