Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CA25FC18A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 09:58:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnQ4X5FGdz3bnM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 18:58:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oR6y+dfG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oR6y+dfG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnQ2s3YXXz3c2s
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 18:56:37 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29C7MYKo011926;
	Wed, 12 Oct 2022 07:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=FK+vDXyTcQ4k++nMzMwR53f1AIlnP0jUl8s7GunulmE=;
 b=oR6y+dfGtySItnDXlgrwp9WK7Q/pJ8QSxEJsIjQ18y/sDMo+N1eYXY5exE4ahwBEVLQT
 lks+9ubMseZWGO9Gx3NoIRfgmlYDjrMFcfI6AaVpKnRqpXZFxkr7ZDt8UiSZ/UHGsEHh
 TjPvnY2ipZsDpw1vIoHPtF3FxsscjrZy5Cxbiy3Q3hUR+EBr0jLXoaIENgCwoSDxPEVE
 R71Yl1HpuyIOWgTGivNxT2brTHMdVr92skPtdqo30UheDs01QgGPS+t3GbqA+1S2r6Mi
 3nfhutsGobKwJoq0nTuksaWBIqgQOOer99MRPhf6TXrlOcMNlo3WdqBRTtRG1BhSKX2V xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5s4wgxe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 07:56:34 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29C7OD74021656;
	Wed, 12 Oct 2022 07:56:33 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5s4wgxde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 07:56:33 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29C7oUKM005326;
	Wed, 12 Oct 2022 07:56:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 3k30fjdmr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Oct 2022 07:56:31 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29C7uTiA4653816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Oct 2022 07:56:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BB674C04A;
	Wed, 12 Oct 2022 07:56:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C89F94C040;
	Wed, 12 Oct 2022 07:56:28 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 12 Oct 2022 07:56:28 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9EEB6602EA;
	Wed, 12 Oct 2022 18:56:27 +1100 (AEDT)
Message-ID: <ed1c9254f651a211bd03b1678da7506479901fa1.camel@linux.ibm.com>
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
        linuxppc-dev
	 <linuxppc-dev@lists.ozlabs.org>
Date: Wed, 12 Oct 2022 18:56:26 +1100
In-Reply-To: <6C70D01A-B819-40BC-94F7-5BA6D8109134@xenosoft.de>
References: <6C70D01A-B819-40BC-94F7-5BA6D8109134@xenosoft.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CNcNlQZETYR_bXUFumDmuoxhUA367OUF
X-Proofpoint-GUID: 1wcVNvzqt6C5nKc4J66P4eaUdl1I7jIl
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_03,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=550 clxscore=1011 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120049
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, npiggin@gmail.com, rmclure@linux.ibm.com, Trevor Dickinson <rtd2@xtra.co.nz>, Olof Johansson <olof@lixom.net>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-10-12 at 08:51 +0200, Christian Zigotzky wrote:
> Hi All,
> 
> I use the Nemo board with a PASemi PA6T CPU and have some issues
> since the first PowerPC updates for the kernel 6.1.
> 
> I successfully compiled the git kernel with the first PowerPC updates
> two days ago.
> 
> Unfortunately this kernel is really dangerous. Many things for
> example Network Manager and LightDM don't work anymore and produced
> several gigabyte of config files till the partition has been filled.
> 
> I deleted some files like the resolv.conf that had a size over 200
> GB!
> 
> Unfortunately, MintPPC was still damaged. For example LightDM doesn't
> work anymore and the MATE desktop doesn't display any icons anymore
> because Caja wasn't able to reserve memory anymore.
> 
> In this case, bisecting isn't an option and I have to wait some
> weeks. It is really difficult to find the issue if the userland will
> damaged again and again.

Could you try with
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20221012035335.866440-1-npiggin@gmail.com/
to see if your issues are related to that?

Andrew

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

